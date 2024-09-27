Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B8BCF6480
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 21:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46210ED28;
	Fri, 27 Sep 2024 21:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lgd50Dmk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C209D10ED28
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727472514; x=1759008514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/X1kCZq4AzdrO6NtbkcVmweAciNv/ev8ZdwQAr2lgA=;
 b=Lgd50Dmk+BrIgamYsqudpGQ+OOQZaklXIjqcJCjR2V4IhDKEl4jimV8J
 ztOU9q7TRiYdOpqAC6gnRDr1liVXFfc0kKPBOx7KY+meH+YZkoqlzZ0n6
 LaHJNBwDhz1KLEJYoaemTHzatv0qnZuX3ibTJxoZdD+qSDQG87QFtGQ9E
 N84CZ7Bkt3CodQGkDURc9du+ReV0u2ouwPWmy2coDczHI/ryMJLIzklFG
 Kwy4DjQKml5Ul3+pxNj4T3Dizcn9UXU+HSuwqB3HWhA9DQa8sgp6KKcJX
 TX0IzCnLIC8bM5vCUH8/cazspqV/slszVJkE3Aq9rffGqz3fWaCha739C w==;
X-CSE-ConnectionGUID: bt7teQ55Qe+UuG1Gbs9hWw==
X-CSE-MsgGUID: AVv8SwR8Se+B8oR2zYZVsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30424562"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="30424562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 14:27:58 -0700
X-CSE-ConnectionGUID: MHXcb8GKQLuy+Syi1rjTxg==
X-CSE-MsgGUID: 8/7W+a+SQ2aG3a/1itkbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72724125"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 14:27:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 14:27:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 14:27:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 14:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX3/hhPKlIppT7+Fb+6GEZkY5hlZeBKGvjFVMyI1sJ7SqUuACloAJou3Hk6+ahG0lMIuqCn05hO3Q1oUv37TZQJDar+JTQK5UdHr6dhqpMqrkouyvZVCOgaTZlMyZWPV7IK4oxz956Aeews/INg0HZyfD1/J+admB1R+p+e9eqB1zuFi6+7yDRWfIKwethnVrVFZPNtg/BotJ3OlS5ekfx2uX9oG+b4nORY3SheS7jS7rpkdUoc68E2SDJmoPIMuV0+hRolSxG1syrpI9B7DgZFeHcGXbJdCloZYy0thsXcLg97ACwvsQ+uqZ3qMAJ2yb2ABfitDXmclt8PT/qXH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDynjiLrtXLj/gK23nixptFjF+IBUr16VFdzA/SS74Q=;
 b=jr/rcjVpn3LsjSLSpJ67sddF9G59aNAYw8v6LOYVJKAeTb3vIGxs7QtDgj5Kkx6HcEcvhySrPwTkOeJpbIJxPUJ4CV/sMHzdpXxQaDqhdc1XmReke8PFmXCDXErNIlMDO9ufh/d68OUpLHNCrUUq4yceCvI3l72uX1Z6Jdn36fOEWGknT0XCaguknQTh58iRF/xq7OtFEHdnRg7JVkS+qyC9T9PavjTYVkz0qnQ4mwBQwg5F6qNfVO0iBWdTMHgqtURU0TPi7onayW57JivFXXaGen7LdNIruHED69eR4/D+XQ/nT0PAzpUPp17+myEV0LMQozUk0JhDM0Vyt8tu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 21:27:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Fri, 27 Sep 2024
 21:27:53 +0000
Date: Fri, 27 Sep 2024 21:27:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
Message-ID: <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927192428.1160211-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BN0PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:408:143::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: cf192fea-a236-4eaf-a616-08dcdf3b3efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UiWYKMf4GSVYthb2r+VujjhpW5CsY/aCUY+brz//HnvvHTIvlKvCgZ0f6wUE?=
 =?us-ascii?Q?h5k1kq/0bYVS89+kO9wBmibz3+xDKErFYJwxraAfWyQJwlxgOIjpZa+a6jrZ?=
 =?us-ascii?Q?U1wNlC8sc8tGXLeN5cMIsYe8rdoojBiYGS+xlfnJC1MbVjbSZWvm2jFUe0/H?=
 =?us-ascii?Q?Axpb7TKL5wFAsPtOtQAx9Ob4uissyxcc3eT9h2d0GskCvp/uC59RXi8NCql9?=
 =?us-ascii?Q?CcuDpd8atYsu6lMgLez4kVLXET2LPIe0Vws1Ps6CWs9s/AnLEc8W2fdHg7Hy?=
 =?us-ascii?Q?FoZZW7z2OczWs3oEjUfC8jefWOcKKKowgMVp2jML+DlPk0seuEvpnwlOrjuP?=
 =?us-ascii?Q?/aLwF2R3EDGfvpDVmuieqz66I4yvIeLRPe9J6WChMK5fWOm9shTcAM/R34ck?=
 =?us-ascii?Q?1iJf5zn6hbis4WRaHmvI/KoEHozQDSNvzqF3IopcG5gxMi30jSkuHl7IS7i9?=
 =?us-ascii?Q?SxBMTS/oklAHzZZ8Zo7PlLazW3pf7K3SktHD15rtMHoV+Kfh84+E6Y2zsBOv?=
 =?us-ascii?Q?Vu79pd5qWJQSrNt14JUAnoNpeAECXLJjr05wMeK5xgrs76gdDQrVxq/qD6Kn?=
 =?us-ascii?Q?9KXUxTSmJyMsJ4gD7rK7fsnL8UcDWmQ9U8SP7ynXXsYv4DkKQhRxd2I15hPA?=
 =?us-ascii?Q?8G0czuB7soRXzMkjtIWx+/8rbekWQ52w+DWhu+GrFyHlBMt35Ygwa/APchay?=
 =?us-ascii?Q?6SXCshIktYLBJEICcs1DakUyvljrt7rnieDIldX5s3ZbmDF8cuB2R76WYL4K?=
 =?us-ascii?Q?oSvFwbnOe11rdlBaa/h9T61yKpebsDj30xrNWzV8nqcUnXva21+WUrMIStaa?=
 =?us-ascii?Q?oLcTAAVw82VJxVqiG6jnBv1qF1chB13SGTfN4frAQkKTuGH7fbAX1u69tPoW?=
 =?us-ascii?Q?mrOb2mLY9p4FrMlWYAqSF4x1Z8Xit+BYwAP8bF6fjqsAUMybyXAqDBs3FQcw?=
 =?us-ascii?Q?BZDwX8j+0TNG5aUUlEjz7VybUy1U8XCQhqOvFnO9JgvnzD05xqAyMUnykVtp?=
 =?us-ascii?Q?fD/JnzKA4YoreRG7h8kMggGaMqEllqODm/Si5e0mgZ3w3KuBiI+jUZDpS9Ls?=
 =?us-ascii?Q?NSLvoEW5vMOFFs37a02J7sIqzkTzfvmW7z+MClw8HVylpi0R3VrQ0yJ8cJi4?=
 =?us-ascii?Q?DmuixKn+ryRNWWcKZAjiax5PFpAP3+1VpbnN8Uqqyt2SxYWa/JvMUUruKly3?=
 =?us-ascii?Q?fNs1+cGoOhCzx9i7NA3Jy5pL796omeHo3DqOH7Kq37W3U8Vckc4ZgauQK0c1?=
 =?us-ascii?Q?TV89sgFM6m8v5EHyO7mFLi7JF3KA+pQGHrGpRUbQu2MRrW36ZiOcx/X8iils?=
 =?us-ascii?Q?A5MGJSk/5lnB3wdSNEFiuBCB7X/F2Y9uuwDXzSqCAz9zKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/6z4xH2IIErCjQPItd1T8FIv6tfPA9Q9Ez13OctNEiRK8tpxC3l6sFxUIEC?=
 =?us-ascii?Q?kUM3RB8hyNz6mHePfJv86meKEcG65HRFEzuJZ7QB16MR/7V0r5WUfggr2xfm?=
 =?us-ascii?Q?K9j0rfx4b0XtsdQgaN+xpwgToUaeGJK0lqIp60d0xSa8J8KhKxxkVU0buMPR?=
 =?us-ascii?Q?Uj/l31LvT8l+OpOIJyc9QkPjjUvDwnG97zDJcNqIhS1LsfMCbCAMbslaqRJ3?=
 =?us-ascii?Q?be0djdpjRPoQfvOf3yD1nVDNKSIebyJGJeD/72HjekmWyMlxVPqDClQx5b9F?=
 =?us-ascii?Q?qLiGKAI4izj5//2cOzcpuR/Az/tEOjq9JsguB0VY7QIvgjcuK+4pp1iQYYFQ?=
 =?us-ascii?Q?48bGXFCLLquNzehjeLFUY97hWvEts00pzZaScl9B6brNyqM9fgoBn1ZSdnvE?=
 =?us-ascii?Q?dFqYREpA4EhJh1tt5pBeXUrYDBMBg0oS03Grz0HvtK6lD7Z5R1VXCCkrEUxK?=
 =?us-ascii?Q?2WXCD2/Cs2BGBAITTIkRyLxnf07xlu5dms4J5NuYKPalTDZ1fvYwdtM8psAd?=
 =?us-ascii?Q?df5tNgDo3ip+ciUz5CgezFW4duu97s+3GNAMcVOFyW/4GmlkTcBKcAbnMqtL?=
 =?us-ascii?Q?nM6RUNPwhQiirB0BzZcJuY6FCZCypxO5rOe31PW7w5w30io8bQ2VfDBXuzb+?=
 =?us-ascii?Q?H1FLjMSjnAXXIWiwcSn3yjddJJopcuELpHs2QPXb4lDmx62JCGxEiIobeopj?=
 =?us-ascii?Q?sUnjGtulR6mmxLH/JpW8HUtwv+l1Hc3R1eLjvrYWdeWfDH+gay7JwVTtkn6/?=
 =?us-ascii?Q?z/qySqsJDmWc8S00x2tTMjn6U/zSacXxgGZm7A5gZG8ew18Yg0VSZw57L6IY?=
 =?us-ascii?Q?IQtrjEwYvbH14ap9n3CDNz9nhXNPYJ1FxgwJF0IeJ0hyXIyGw2qafuZ8DwLV?=
 =?us-ascii?Q?kPxFJAS2/ghhVZXm/PhVA5U5edWDDA/x8YCp2l8OGT2jtRSLP9TQo4zSWLne?=
 =?us-ascii?Q?YEGV+mgLw+XNyEWPlDSwo8yMXo3MA2BwFsQnoneiZbTNGxamv6Rjo4f3Audd?=
 =?us-ascii?Q?0U/lm4yYI8kpIxyBVqSeiAfwra9+sYFRad3kvlOgshC8YgwSJAauOb19MmIL?=
 =?us-ascii?Q?5CuB+OAXZZNY6HqTXdMx5eH1Za6qG0yi76XYJOUYnGDR1eUEK7jtMs4aPSiv?=
 =?us-ascii?Q?3RtdBJ0NuUYICylT9IYGT1oKsCndI6V21h8aW3TrPbhdiJpXKtUlSOhpuMpv?=
 =?us-ascii?Q?Q/zowFpkI5+IEfwh+e59HA+LHShxqyW3fsebBfZszbLsxapXNBOaHOyL//3v?=
 =?us-ascii?Q?8vdMTSJ6djfm5nZDSEqIV6rTxCtMD6+NaeXxwDWq1VSaVYxfYiSYFE5MRuiA?=
 =?us-ascii?Q?9QH7zoFVkYlIK4ASCa+gU1Vqk3ISelaAXZBbGt98qLAYgTQSr1WObThIXkEF?=
 =?us-ascii?Q?7knfcI85PKlzu5cGqek/ZPkzOsGEUw/AlxC4mUYvsN3M9aD63EzdSWhF9Gq7?=
 =?us-ascii?Q?DsW/sxpgoSkvg66EomTmZX7neA56fR6OyOU8UUwX9ZsYVdz+gwropUeQazJW?=
 =?us-ascii?Q?iv24D+wUDfFEHo7voZzUu84rUhnAzTGjGSc6GtnsZBmHXQnhTva5hzSp+C3Z?=
 =?us-ascii?Q?eY75xas7gsv5FRClxTg/MCGRTviqi45+IpIQqlv7hmfccFQ+fnuTBExL/gQJ?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf192fea-a236-4eaf-a616-08dcdf3b3efe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 21:27:53.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hAHTzEHjgTfVbNF6kJwtGeoDMz/UyEuit9pX+gufJRwzihconBQ+XSKYOLvaFqGWDvxyzLT7xUvUDe0tR7Htw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
> It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
> queued, but it didn't get opportunity to execute and timeout occurred.
> To address this the g2h_worker is being flushed.
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4b95f75b1546..4a5d7f85d1a0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	}
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> +
> +	/*
> +	 * It is observed that for above GuC CT request G2H IRQ triggered

Where is this observed. 1 second is a long to wait for a worker...

> +	 * and g2h_worker queued, but it didn't get opportunity to execute
> +	 * and timeout occurred. To address the g2h_worker is being flushed.
> +	 */
> +	if (!ret) {
> +		flush_work(&ct->g2h_worker);
> +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);

If this is needed I wouldn't wait 1 second, if the flush worked
'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?

Matt

> +	}
> +
>  	if (!ret) {
>  		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>  			  g2h_fence.seqno, action[0]);
> -- 
> 2.34.1
> 
