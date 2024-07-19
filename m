Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DCC3DA5D
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 00:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA410E215;
	Sat, 20 Jul 2024 00:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2RgZewt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2A110E217
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721433608; x=1752969608;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KRvPQhgfmvCnhtU/ZPUyy6LYMHx4KaybJ23cd/ho8DQ=;
 b=V2RgZewtkifKFBcKn72+Pj6cnah+Si8tTl9SV4MoMLMFGqqfBRtKFBY4
 yMtfcHrG8R6UAxsNJYv0E6W86HGXFNrI6IKi7Xs0zM2ooF08WQhow9dds
 IsWreE96ULhX4CNYivH8vQKf3/847LgPJXCf8AGj+AQNxNVFF31NLgZES
 wdpYPc/86l9HFubCCtK6mFYxp0SpOLQr3nAcZzG8RQjIlbzkphey9/n24
 YZM8Wam8+6hfgPeydkCTSAWQmGC7cDFsupfxMY3MCmef4s540XDAlARDn
 qj9Hrhel2imUJAZioR4hRkN7umC/Co4M4QNsZcshPkt5wLsJ+rVZ9dgoD g==;
X-CSE-ConnectionGUID: UZPHLxNjSSOlPWNZMQITog==
X-CSE-MsgGUID: zc5wmJEiSwGZmq+WgNMklw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29731569"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; d="scan'208";a="29731569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 17:00:07 -0700
X-CSE-ConnectionGUID: NGpwuO3kToaOlujjwtzK9A==
X-CSE-MsgGUID: CE3yen+ZTPSj/9kw6a4kOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; d="scan'208";a="55557964"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 17:00:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 17:00:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 17:00:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 17:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ziw8Gb4Cc2RZJIFcGr6yPrSiEDMTQUj2sBrCMLxdhJcmvegEnSuItrhZ+Cqdvi6Rxy/v0U21JS0Tk8+1m3kCdR2HbLX2X26aDQgw4XTbFNb0H0d+6ZeHQtUHoiDtObNtBF4xUMrHix/0+Htd3PwAAtAILcNzMK3BsiieVX4OynkdfiTeujRVsTqNQLOCnBjzr4fitr1OM0m5j0SaI0FWFdVDTeTHx/ch2cJ6uyjnzuB2K9t42BEjs3lH4Sj4pUCxRj7wAZX4sAxwjDhCo4VemwkEoAnt2LnDBHadwuSVfHQ8NQgaWnTJM2vGpag/T0Hzo3I59YdSU8eG9U9hyNB+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftnHWbrx02s9rA67lii+K2O1mhVBiUg+sJauEGik/aY=;
 b=RIB4hOwEZzajx7r16GSpDyKqVqscQCaFgjCaw+epzfisYOUn1IxGQwOh3ISjt9lISQCUMu/uaaB4Ub+CA/qe0ImJ5fv7Kvy/BDWzHmT/AzJPY9rSzl5ixmbyNZGtFBCq4EFLJYaBLBBUdtdTuwDI3XXFwW5SAxqAUdh+SPYeVDA2aBIVpaSgivyJOSkvRlyaJDaucNAxZa8SE2HfsKHgJidmqi2tBwZ3vRQpjeyle3CjVbKmisJHSqGlxk8/0MQIGUDNsJX2SJT7RsWuYKVpgik2Nyskhr4VSBi3yDLGFp95SeiqAW/qFRSG2xgcpOxWbPc+2D2oClUMEmSfj+m6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Sat, 20 Jul
 2024 00:00:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Sat, 20 Jul 2024
 00:00:04 +0000
Date: Fri, 19 Jul 2024 23:59:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <John.C.Harrison@intel.com>, <brian.welty@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Message-ID: <Zpr903XK3nsmzlrM@DUT025-TGLU.fm.intel.com>
References: <cover.1721415811.git.stuart.summers@intel.com>
 <27ccde70eb10ea4ba490b16bdcf1626e7f3e0e7b.1721415811.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27ccde70eb10ea4ba490b16bdcf1626e7f3e0e7b.1721415811.git.stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b70ece-e200-4a65-0294-08dca84ee87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T4M2Xub3Y5dgDUuOfICw0QDcVkHKHp+03nzj1hMqGwmpMbb6gcloAIHITOrq?=
 =?us-ascii?Q?4Lj4p/1Y6ex46MMwrB7pqiYGOjdkmjX07grd3aTOX11XkjTBT7Iw3wGq1Kxw?=
 =?us-ascii?Q?Sj6+0ribROoJ4J/oxinkPSJaGMb5vfeLoqMRsDEdIO9i+oc7LVNtvw5jz83I?=
 =?us-ascii?Q?gXX2R4CbQ++V9gEPjexvOycajbjeD0mmoccjzBQ5P7LC6c+nyponi0LUX+h+?=
 =?us-ascii?Q?J6dLAFsLt6dB6d4YWI26Bn9iy4WsyrXNfaBkVOB5xvN32kKNf7wxvyu915Rj?=
 =?us-ascii?Q?lY3F79t30OcyIFRq3qm8cHjBYtNB6dmJXFJZ/iAJAQy46tAfbTy9ClkVUYEQ?=
 =?us-ascii?Q?JUUK2+B4RTWQj54EaDuS4WJqvcTuccaUtM8e7Xib0UsND886FwhJuBtSdAGO?=
 =?us-ascii?Q?VM9QRp61d/tRP8hn1tTuHoMUsyW8/V9HtFQBr7xcgazCNr4+ED766Sw5LD7G?=
 =?us-ascii?Q?HzmSAZQis2Mmfrgj7OtpqdUu9xIgHkmF5rHf4ZHUuLURJ7kGSxDwERxmNJnQ?=
 =?us-ascii?Q?p54tvJVE7Nd8I8ZgbjaB/mqtagvMsAsWCAYWqw4LFEnoqbE+xQEvhu7Uc7I5?=
 =?us-ascii?Q?QJSHc+nH857s7JQ/uSNsd7ZB/es+ZdHqU66Lqd1GmNlsWZQWKGKEGNkV9zdq?=
 =?us-ascii?Q?tz3KoF+X74YwUvCro/z6opKj5WYLi3iW6kOs9s1oVZKF6gPSHtWgkWSAqV8k?=
 =?us-ascii?Q?AvOAmrZ/oZe3AiIuzvtDKKdhCugFG8NMwr/9wn0hZZUk+QeXrFWGIb2RSYva?=
 =?us-ascii?Q?WkTPm1zLUqASWDon4HjKL+6mEKEd6BHKNpRVTxQIGZ2pZF9UBM9+hIKRMU3P?=
 =?us-ascii?Q?1/TcJpggKSNPwPn8Xi4kVn9f3yvTMAaYxC7skUGQdgFVbY+cxryM4pmxcT7j?=
 =?us-ascii?Q?zyam9Xfc73+IAi9DwzGbSiUqPCozDsJZb6h8GrWvLHvGPmX5+E5KAucEBvyN?=
 =?us-ascii?Q?I0uhBKaCiY6URQp2cYtAip9/OQSuiNct2Bb8LH2sQRM8K/VICx+0LDfZSd/U?=
 =?us-ascii?Q?GSb8guKRqwhv1HJQrGz4QTVsXQcMil19VkDas3coT6j6Hi+qsRdQB8ntNDqG?=
 =?us-ascii?Q?dsD8aPHVyP7YgjZFpw73vbP+sYmsQvzvYnb/8vdhHxHaF3E2i0lGd1TlkCM8?=
 =?us-ascii?Q?RnyB7DDEqdOHsx7RtiC6EenzIPxmmw0PJ7PgOZEZDG6X/j7WXW13+L8UUCSp?=
 =?us-ascii?Q?s9TVhjDIzu+iL8Vo/P+gcusSJ1ELtt2fcx340vd8hLYzCtLge78Hhn8ocFuo?=
 =?us-ascii?Q?83QBsP1l87Om+E0TXqAeI7UdEcoRAKjwFkZeFQX7jOBb3fUl5qS+k7cgmUZz?=
 =?us-ascii?Q?ymQORHLgypK1PCA+py+P45Qm9yeGjWTqrZ8EhtcTAgNhBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pM3icESLmAfNsgqk1Gz2O6zhXc0hB11crhgBdanVKIbYIUW0umP68BMqmAd?=
 =?us-ascii?Q?hH+wKTFZmi9kfNynFsk8ntZO6z6ZqHLN0jhjqmiq7uYMB4LK5FMqABt29Aec?=
 =?us-ascii?Q?jF5f3NZ5F4s6Hg0lDT71y96nL5EzZ52OG8KA0NlX9zAxdp4jF91u6PX5AdJC?=
 =?us-ascii?Q?jDqqlurMBhycqHy5jIg2yZinRyYWrQAO2O4NIIUnZ5LJYoxrbX0yCUiHdZZ/?=
 =?us-ascii?Q?FPqgh+PKHOThtK9VHJaZ9zH5WYvfqnH8reVSUk8JK1dF9BAfSMz4BBT5cfYY?=
 =?us-ascii?Q?aG5oj3Ky1uctndVoyLJggIH8dSDvW1F9nnxm8gFGZhe/mBZLtuiULs+nL8ca?=
 =?us-ascii?Q?suhuWxwoFs5swxTXDzxnIbbMpyUVX20kCHCJbHIhZYaLZ7kKafSm4nB4M7r9?=
 =?us-ascii?Q?5GQw08yPMxZLyHdpSJ7L8BPiadpQ1uXeZcXoWJ8gpC7RomtIk/Oercr4OxS0?=
 =?us-ascii?Q?2kdLxGyYmgtG0TxjQ7wRtjFBqExt0MrpUM/HIku5CdcbINFTTj3IUhteEln3?=
 =?us-ascii?Q?CzcGwMLFa9yCbWAZdldjXOFFNhjSXO1tUUBOAXRHv1/+PXcJGlFYxyYJRx/p?=
 =?us-ascii?Q?+P5LM2sq2geK+ULgaIHYKxBCuX2ZDltHffdr3pwOzHcN+n0Rc97/eLNZpJ5/?=
 =?us-ascii?Q?pMx3CTl4GDMzW86VT/kY/ITokXBhAYWnHMNvlBW6Qp0TBH4mRsrFRRawHZ8m?=
 =?us-ascii?Q?WKLgHU1gukNcsmdeLpzhWBbPQyTgP/wNn6D3n8KJMxmTGAFuTKueLELmdR31?=
 =?us-ascii?Q?gJB5jR3mg4m/GVLz5JxbWaxQZTGkbCc1LNrKi721wLjz9FttRkOq9xoGIpPm?=
 =?us-ascii?Q?KCre3CEcW5C0QWlwouIwg1kNipOZpy7/WpMcHB4a5JzuiYh5TrEgN5yJNmC+?=
 =?us-ascii?Q?17f7Nq16fj+H2CQBzm2IRdLLiOGq3jKTup+xYjkSN0aGc+UFvTxKu9cdD4qA?=
 =?us-ascii?Q?3dBNSTyXp1iHjaIP296PYu+mdNunnfvJZDtzvMdT8uOBPWf/dCjMh+Rq6uGE?=
 =?us-ascii?Q?ae5iFbfXizRzKIUl9RRFsCTcaDSgjQY8LRwUIrWS7VpFc/STu3lYMYC/Bx45?=
 =?us-ascii?Q?wbMkKexOgiwZ97WT7nbEsM4xxXmr7FsLC0E+2cGSgwwupjb+s90UkT0vBfw4?=
 =?us-ascii?Q?jfyJXe+C2ZYe54Xw7FHtgwUj/y12xMUpQYXDf32qGRfUSy9KN52cV6WN3odR?=
 =?us-ascii?Q?zyKKrc1FIvHo4GTT1sI9wnHqTHshdNREVDNo2yW3m+weWdQ96LYmnS3T7Kjd?=
 =?us-ascii?Q?ZE9JBnFq75Gm7q8BLoCrzxmRAzLT3nincU2Uxo3oQK6qAUA8liwElF/9tCSb?=
 =?us-ascii?Q?KWvZOBJMUH+MwqVPM2PQp/HcKAVAMibsTXAOKAnsvpNUgDp5ttAAOLStCcUL?=
 =?us-ascii?Q?OPACPYg7p/kV9uj/Voj238jtQa5iCkkuZT+LL17KdXrabggz6Vqf7i3aDBUs?=
 =?us-ascii?Q?3JTW+oH5jrNzpvb225681bAkd2bPkJqoh7Y0lXvfkQvSv/0XD3cBoVsNHTgf?=
 =?us-ascii?Q?ZTKcV/JK71veJkm8BH+7TBvMTj5MPhbS5zTYRIeoD3gF5JZq945qkVu/VZgV?=
 =?us-ascii?Q?C9H1JMpgjHM7tOb9gt6OqksTly82DCRB4Uh6id7yHzi46O/lfzyKrrhJx6mm?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b70ece-e200-4a65-0294-08dca84ee87a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 00:00:04.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfQ36CPLJ6v4TD1ZBry06LBSobayA2ArRk7P7f6TP1+/YWnLT5Ce1GXCx/OIuvzgR706NjBhLzyqlD23X5UK4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 19, 2024 at 07:06:14PM +0000, Stuart Summers wrote:
> With the increase in the size of the recoverable page fault
> queue, we want to ensure the initial messages from GuC in
> the G2H buffer have space while we transfer those out to the
> actual pf_queue. Bump the G2H queue size to account for this
> increase in the pf_queue size.
> 

For future reference, include change log to help reviewers.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d2e937da1d8..a3e9dd71f957 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -105,12 +105,20 @@ ct_to_xe(struct xe_guc_ct *ct)
>   * enough space to avoid backpressure on the driver. We increase the size
>   * of the receive buffer (relative to the send) to ensure a G2H response
>   * CTB has a landing spot.
> + *
> + * In addition to submissions, the G2H buffer needs to be able to hold
> + * enough space for recoverable page fault notifications. The number of
> + * page faults is interrupt driven and can be as much as the number of
> + * compute resources available. However, most of the actual work for these
> + * is in a separate page fault worker thread. Therefore we only need to
> + * make sure the queue has enough space to handle all of the submissions
> + * and responses and an extra buffer for incoming page faults.
>   */
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> -#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> -#define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
> +#define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> +#define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
>  
>  /**
>   * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
> -- 
> 2.34.1
> 
