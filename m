Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC34EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 17:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1AA10E070;
	Fri, 11 Aug 2023 17:17:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AD510E070
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691774219; x=1723310219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9FSLUvELUBrVh4r03mNIhDQcZF/SaBpc/Un1U9EzuEM=;
 b=FnxvJHMXGHLLLPNtTddOIAk8/Tr0IMnMrhcHxEIzzacCrJiUo4F25ZEa
 Up4okS07+OiCybFuCl5YtXu72SpaqA5OHLAhNT3EDo2nbdwx0vCtcsKuh
 dtXh1NoIpdP6Tm1XC5xRWcw2gEV9Z4lScoDpsvlaOKMuCHpKTFH87LSG/
 Ma7PvYxacfzgabQv93nDv9IfYPZX3q89aQMNPZAP+Mv/gYQos9Gao8S0+
 2BZe/YirVfsog1FFsAwL8IYo6vch2RxhvQQY2wC61vw1Qykcnrh5FST/F
 m4Wo+s4oeaANDAnGca1DFBqtPv8iyMnuRDTm1uIPi2PPTujtDt9H1Sn2C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402696543"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="402696543"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 10:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709597248"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="709597248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 10:16:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 10:16:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 10:16:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 10:16:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNvspK5NJCr0sqe7hr/yvIy8Iz07EqcmY7+ZEBygjLMR0imlesAz4RtzzNqNUfSkddP3dvmer937aL6kr7Z9x2Rf+QQurfl1tDpAzeE6N92/1G3uzB089fgH/pedYEGk4sb533qINlCPFt29mIpLYtzvAuMsccixPHBVCy7dZmuxVAP7lSaFnTmV6utHflcxcVoUMzt1HOse5BmnrEUyEAG9mVQvBPJUUJNf0h4hEvydE5JJoap99SKQVFuBZlTLusioWSPZ9prI49C+430zDNB2OimxuYCPu6kDRcZ+G5Vt4R+kQLsABHT6ZymHe9rSKnGTsgxfVmHZFlCexcabqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0P+XQGpBTaJPGyfb3ehTUaKSs7y+7073gGw017krOk=;
 b=mpewBA/YWeo7TII3M++ysmkgYwi+Isuhw0n3uA0mXAdFmHAoroXDdaPr+MNfXpowNmuu/lEvqyhHrvLPOYShf3kypcwFrZ5MphmiVVx+xDyWL4jk+NrBpl/NQxe224ktWrd4+gbYZb1HgUK333IjhQWwbOy73KMlY+6XCd7FDT7ZnAkr+9exck3HoBmIaWLk+UQ4k0wJtwWG6v2r5Ru0PlOndIM/oVO5SwQ+PtwLrEjexn/viPjteTCmtAj9OYwb1kmltL7Am6Y+/rTLhdUUmiXBQFw/evbUiST+9RdigsXz8VobHQD6v7emhFqG5lpOIbwRPXeFR9f/dFLSkUVT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 17:16:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 17:16:43 +0000
Date: Fri, 11 Aug 2023 17:15:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNZsyVXLMl7QvrIc@DUT025-TGLU.fm.intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-15-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-15-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0033.prod.exchangelabs.com (2603:10b6:a02:80::46)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 71655416-4dbb-4d50-fd2d-08db9a8ebc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOygg3KZ+VwoqOTatLxv9YQLA+mLII9mLa5aFDapXzLgoh7DsFTnqL8j293YtxejzFMLPoGk6BR/3CAQoDWDtQgHd57alP6c9OXj0q/mdfUXGMFvrYnSazh++JfJE+NXJS/JAoFC4wFvfh2ywtpTm4zB99U13uZax+9uQ0bQjvZAg5Awos8Bz8O/8VbRWg5hN2Xm8Jh6RNRUUBAv7zq33+uKFne9rg24RKNwRRhZOWsz6ET3+9ZG7OILL2ZIeudFpG1+WB30RCle3CfO2Aln0GfZgX5iuhgqaG+5W97ozd0vw6yXAIfhPMPdXQDNl9yHQsT0cKaBuUIfUBIuXq3MhihDhk3WywtFtFDy9bUtyuxlUcbNy1Bgz2Lv+2qAdvPEUXDH7Tk4KIXhWS4W/F2Ra3b7N6y6Lc3hyH5+xl3uX35CN02s6NIIpiMx4imvqELuv+JrBVqYm3g9kOP1TujR7WTydaKOOa4xKAHRqGZCoxYgjNtxyccRgmq2l6SpWYJG4q2tlQ2uUri/uH5woxkeGhsayHPTiKMVBe2y1M6DEa8TJPPlnkCRTNiD9Ld8lvDG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(1800799006)(451199021)(186006)(4326008)(8936002)(6862004)(8676002)(86362001)(107886003)(26005)(6512007)(82960400001)(38100700002)(41300700001)(6506007)(478600001)(6666004)(6486002)(316002)(6636002)(66476007)(66556008)(66946007)(5660300002)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eXBzva5TtsbzKchUo7Lvh0ttkLf7RO0K/WYyklg97e+lX5XMyD6OM0FndyW7?=
 =?us-ascii?Q?H/1kDg+3jgFCxI3zz/fxH1ET6w2A7e0VJrBw3mTP0bSoDf8AM250kke0+Rpo?=
 =?us-ascii?Q?j2FOcVXKTn/kn5AqGCKofAro04bLdRw4trYs3ks5u3z9S5VISoSSpDVwEofp?=
 =?us-ascii?Q?GpWClnPn0xbkZSqq4ELVluAovG9G5kGeNuDmY3ydtSey9rDeAYo6RVDE0dq4?=
 =?us-ascii?Q?R8dJ83msTMecG8xUqgLh28JiDIrTYoH6HMC6YaxDX9+9AnhDKGIa/dhfRiCQ?=
 =?us-ascii?Q?chahfO9FTQX2GYtmqNED2K7c6BwNGWbsl3Cdr1uSvyjFPSyRbLmwvNFintco?=
 =?us-ascii?Q?pTXS/BQ9+i9aajnnT7XSiWchSmjJJlhEkz/Vy+5xJ2U6Eq7w64jZcg8xI5+k?=
 =?us-ascii?Q?fdhF3zS9GIhsfdF8qB7DDcAqYT59+qTcwamy98O437OacUA6E2S9WKVmGE0b?=
 =?us-ascii?Q?OLdBVMPa0mwPhM0bTV1Lkx4hDeQeRdKs0ZEfq1rzRILN1pRcdoOOccEAq4nI?=
 =?us-ascii?Q?TUooPxs0Ab7iHa8+YcpFueIt9pmY22YEmAaibJn49PF7G0GsD16exPl8y6Cg?=
 =?us-ascii?Q?wcrUseVqqirj9VV2BNXW+VnEpXHmYRIUTZ2OgEZMmIlFebud6NiYQuElajNJ?=
 =?us-ascii?Q?edkT/ZWYLKjd+GTfAObMM/bLqOOs9wVCJYwuE1vZ5DHlppatwJLqxaZqMhyo?=
 =?us-ascii?Q?gwWYkG1xeYEoj/ofJUIlDa5aT/ASIWPUXe9bNdk3TRA2yxMJc6RX/UuxfXA6?=
 =?us-ascii?Q?sSDJRWg44PJ4qOXRtcYiqUsPJ+rDGR+d95Q5zDY2uezYRMk66w129Oh59Y+0?=
 =?us-ascii?Q?SqMLv4zn+059MfUCczUBAdo2Ak0uglBiW6XVdV2YC+15eaeLW4V0o07wtoRx?=
 =?us-ascii?Q?eL5a9Ry+insvjY6dTwnwmmy6I8Z4BFHRjChP8k4VW2Op6IZj8Kj2/6+D9R9I?=
 =?us-ascii?Q?PVEb85l1T/sfuXvG6ud4GWp9X4CzZ2NWR49kH8Xw0DeOkv5m0aeQT1FzGP0d?=
 =?us-ascii?Q?MzjbmY8PEG3EgfAb63cwaK9cHbRb+TiZjAmCWBVcxe7YUJL3fx5fcuVoWJ6r?=
 =?us-ascii?Q?mcOJ8GbwXZeipHBuRM0SkID9mK9gZ+3BOvjCls3dcQm+d1j/K8wRNimz/Beo?=
 =?us-ascii?Q?1VLjyOrN11pq7IuxXrxhIoR45VLrLaVi4FOtIawwn9aHZdrZMt+XjsPbVTV1?=
 =?us-ascii?Q?eeKoqa44OoCnFjSp1psyAVKIUq8Rp1EOQ0FLe7v0V89Y4gcmDrj6dRylf6OI?=
 =?us-ascii?Q?YeOAmxzTSsQ1FqA645pOfbGyGvoIZ/I6xY+9nDA/l0qquyTMF3K9vfS3GUZI?=
 =?us-ascii?Q?5RYIkjbdTNmLpCAymHMycSD1f95grkGVxq8lQiAdgp4A95254QY/XbkpA8Uc?=
 =?us-ascii?Q?40Voy7YuE7L++G/wnb9/l0YUUpMJQ+4v4uNub6mJf25tb5HH+0IpK+wfZg54?=
 =?us-ascii?Q?3yVt97b9onFx39GXXaZGHmye3PNz16luwYCFyRkSjdz+zRsHXxzuF2dh3XW0?=
 =?us-ascii?Q?Qws4O7aqdguB6cY2AuUBulyLXDsT81LW37v1ljfh/kV/hykQSbVx5xFoMdjf?=
 =?us-ascii?Q?Eya25W9l8cp5nojz94CxhY1f6yKu/6feNQHZUSfENB9NlkHqhnwhABwsrkZr?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71655416-4dbb-4d50-fd2d-08db9a8ebc23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 17:16:43.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sBiRtaOmJJc78tp91U9uX/QmbjVEZI4tL0yfzUsAbMDcOv2Q7HbHGUyWxiwyT7CekwB1oX0B07Hbx6lnSc0Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/15] drm/xe/lnl: Add GuC firmware definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:17AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Define the GuC firmware to load on the platform.
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 2e70dd4880f60..dd6a68ed13894 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -100,6 +100,7 @@ struct fw_blobs_by_type {
>  };
>  
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> +	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>  	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
>  	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
> -- 
> 2.40.1
> 
