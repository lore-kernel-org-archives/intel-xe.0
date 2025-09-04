Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F0CCA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 17:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114010E340;
	Thu,  4 Sep 2025 17:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFdK/ScS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BBD10E340
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757006000; x=1788542000;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sFvM+ulfbM85aN4eBEVi4JwwGadIOKj4YjsuNlPBvOc=;
 b=oFdK/ScSSPFR0F4s6U6tVIAmedYHdVBucFrft1j1LWIF+MReeim7HEhL
 NV2hXLuOylhmoiyDKXjhxV2OfwBZaiCANx7KMXLJ0S7Ra4LVCHBfYtO/c
 gCUK+E4qpbheFCJNPG6j6B9l/qQOZXO0VwZ240eC3jI4GdVsAYSNfKqB3
 A/jLWro/8tv57ndKCdhetb+vsF6DFWct/eeavWzu870hCkMSb0rsiXd2J
 rDsbBpgZKmX6H09m8ViaMKYF6PSmqJLgFOXf+XnOmGDk4a75tKmv6NYJx
 Knog4kGOjLYeJjf3aBj4QvvagHIyXFZA3JA7gVEUwELZZ5eROnhGXVTke Q==;
X-CSE-ConnectionGUID: DLG8d5bzQ5WabEGwsTDFOQ==
X-CSE-MsgGUID: k4B9Ri3QTtWjLmeZ/AdgtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69614660"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="69614660"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 10:13:20 -0700
X-CSE-ConnectionGUID: WIYXr7DSSMe+00eXKhmeLg==
X-CSE-MsgGUID: KMSjtNIDQHOv7/m3yE03RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171229263"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 10:13:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 10:13:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 10:13:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 10:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW/dU7Oih3ahNwOuda3XzWliAaO1OIBNf8Sj0xWotYdMj4UjcYJT+InfTC8OSOFyIUU3GlqNpFjlB0IdtzNEz7nxozJxzMY3gS8Txv3NIonWfQIDQZo1sPCNUyiWXsb/2Th8VMqAfxcZ64efj+6Ra8eu3fZsqxBv+/vj0+VYPZ2Ne3xcYIwRlA5Ik+i79G3BfvswS+bPtSEQrF3D3jP2gHEfKUBLTZB5OFhW7vm0ssJdtWf5AHXz4klKOUofP3WuIo0ianQLK0WDJy2Cu4DvZO0fdxwolHlNkLTpCzVKMqcA0bbqfPBSV3uv7GdTdFHroYEuD/shWp3y8BN+0hxdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m50HaoToPQjHrAlq06rLjJsXqafP3z9GKvOAbCkhb5U=;
 b=Y2+XYYaMSS5h3OzjD+H2gtVAMdHiVZ/0SBjz/bhbDimV/AczdYuPL4uj64eRXh5uXisE536DOXJlakE5WAPyemfpodNzkFADOhb3o8JgaRTtbN7x1BzmBgKOoKAr2Ri6pqrXOc40m9lJFlsmScBdJ2VGh0naepa3p7WaYq0ltGoS69x4K0T4taY3z61TYrU/wbbY4e5FbkAWXa0TfjHVnHCV4qgWbfXasRrdWW14GVPvGuiMIOzNuNczCYmWJGuhK0ZLVwRzZ+HAAJw+Yet8p2xgAK5Sv2iOkA7l9JFGNQmq2Jxuzpx86SpyRfJ7dYnxZVLSoHZD6j1w52VAO8rEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 17:13:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.018; Thu, 4 Sep 2025
 17:13:15 +0000
Date: Thu, 4 Sep 2025 10:13:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH] drm/xe: Fix broken kernel-doc for the struct xe_bo
Message-ID: <aLnIqDNIixHLp8/w@lstrano-desk.jf.intel.com>
References: <20250904144026.7222-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904144026.7222-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: e95a6e70-a486-4e6c-c53f-08ddebd655a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uWJcnMVeTcvTDVXd3FyGcZaz6+uh3JjGh52QhUPlIo+J+5M3n41mGigUQsBh?=
 =?us-ascii?Q?7DX+KqJfjV51Ng6csWSzb4zjsDyLQbIpKvQoVlz9vvT3l1Odb5KSlUuf50aQ?=
 =?us-ascii?Q?w2zNPyUliJYI/6XabX9EZ3OKpnSla9Y5KogmcgmuixtwHHozAxharEm48hN7?=
 =?us-ascii?Q?yJPSmkoPmI+kLYgr08FDSV43xSobmwlHUa3GG6WwU4xtvMN8Pb/VcwDS79nH?=
 =?us-ascii?Q?Ru/TJs83NT9KiUyACR0+YIpb+Xg1XT8rw4PdFl0G6Mib3AINtPu3LN7SV05v?=
 =?us-ascii?Q?LmZuVPVkkut99nVle2ZY47pRcmXFY98P5rliA7iEAI5/EUHWDFxyFIbNx704?=
 =?us-ascii?Q?iFolSelAmcMlPvE6PPjoOeo6s1MBU0ajlpFxikE6mnJgLsPtkuMGOtq8RK1D?=
 =?us-ascii?Q?I9JMgry4JxMiQ/6rboBwoH/X566SsMvKRvrzkTh6xH/5PipbFkqDt/XPvynV?=
 =?us-ascii?Q?4rB47f+5xW9pzB9sDAEjJ5PiqX35L0IxR2TqDX2KBDSGW6nWz3iEI4a5w2zS?=
 =?us-ascii?Q?O5T17/ZDKuChzFPBot10Wk/mPmZTluj1lSANFvRpuXDUVcsdABVzdFRK/TXW?=
 =?us-ascii?Q?z1qwWzHR/bxM66uPSDupKUYkrKf1Y/60dZb+d4cc+ZBGMWFDmup7+G4Lymfg?=
 =?us-ascii?Q?SUV0aZBXKkqGMJh25srpPSxi3jV7uAN/qWzrIOKOTrOx6jxEULXERCwCd7Po?=
 =?us-ascii?Q?EXr+HAOv6FLbRG4wFtF0PZITIDliT8jQl6EWgKbT0MoI8gjjMilkdYHiwNIR?=
 =?us-ascii?Q?yCoJamtII0k9DW+NEZgUV3RqGUM9biOKkw8Da75ylI0SBJLO5frIHTC5R50w?=
 =?us-ascii?Q?4bbGXBfbWtLWGgvfhXu9F/I4loyVk27o81plP+YgiR2QrOhXRK4UeBU9AZ/5?=
 =?us-ascii?Q?3A1FzbRnHISahRD37dWCnjm+IrM2/SWQIB0zeSTlDiA01p1vNGrpVL7GCs5n?=
 =?us-ascii?Q?MkBYucc9whgkAbyBVHdytw3Ql2OtE8raIqpCsurWpPJx5IJA+1oX+ktvX9uc?=
 =?us-ascii?Q?t9VI+I0zHTOiD6vslmz5UG/z803wwbehPaPXDa4sZ8pPb9s8UB6UXFP0oCul?=
 =?us-ascii?Q?seCC5eCd+r7IxC/Mi5qUb4Ut9cab4fz9DZ0gyT38PedzPjKLh5nJk+/cvq68?=
 =?us-ascii?Q?TBMIeC/DlR8zXDOljtrq2WTP4EDX1VfWn4fehifSWpxx6HAfmcqfRAvL06SI?=
 =?us-ascii?Q?CQkLT6tGmAhLHeLcrjidFPamiwZvRl3n+GDo12INkTPRjECOvhX/oTAlZHiP?=
 =?us-ascii?Q?3Codod+YPPuXGjUN2dJfNmRgu8u4n+5lKJNyz9Hy/VIuJww6qfx0aV+iymce?=
 =?us-ascii?Q?23UZaKU8H2a+emkAludjHssErBXaJo6vuHmFf+gjw5QPcuBxlTpCeCGg05dd?=
 =?us-ascii?Q?fkHDEoG7KLmdbFbeKsdST+waQPnXomedyPdnNVlhkeVf0YTAy0UwrNCu/KPg?=
 =?us-ascii?Q?OmSN5M1XJqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rm8ORpLieUTtd9wCTMFhg6g9KAHg2o7NDASmo4hj9G5S0js0DvHasdFDqnEX?=
 =?us-ascii?Q?LlEiDJGu7rAYJQ+vqZ8Xh6CLttAKOfbnQjy+eHX6/llBLr4OVdfGHNAENMJZ?=
 =?us-ascii?Q?mDlNLDwU8mCjsDHCBfWiN6dIZWyR2f9nAHNF08P0dP1fOJzT2ijMndd0PkEu?=
 =?us-ascii?Q?Klg3s9dS/GkoWVCty50aEYJ2OyZazYpJUf1GuF60QNhBHOlShkzhdi7BHeQU?=
 =?us-ascii?Q?xRF2AqwJGhnuO8Ht8ny2bXpFH+kzJnUz4mZ+H/IQZVrd3D4t/nZNZWDeScSK?=
 =?us-ascii?Q?pd0QnCDgrNoz+WRtJGYDHmNqTqH2IDGLEqnKbiLJDWVssOJriiEfSd0VAdxc?=
 =?us-ascii?Q?Xnq8d/hbtT5E5OXnB0/oZuT4GBx88ecj6k4d69wpU8f1ATvmCrubqe2gwDFv?=
 =?us-ascii?Q?OHXiF70RanWduTnADKWKNnsJG954eTa5kkwb4h7yAXw/iktd+nMoWcB+SFyO?=
 =?us-ascii?Q?f+r96C8SiZneN0j8kC1Bgk+yjwbVWQyfaXvNACl1JeZ5ZpAnvbuC1Murht2q?=
 =?us-ascii?Q?vQnhbiXWV8Ovgi+bq+DIYs1/Z0BoASBuPaT/rIMb67IaxdkR36AIjG4B2Cdb?=
 =?us-ascii?Q?v4oyVjdrUUxqwYd7pZ2c8lbzDY7VT08pQhiQS17OeJFl/B3DM7oYXXS9oNq3?=
 =?us-ascii?Q?JubilpRd9dbcFXOMOJq4eG0XgbPO2fRTqBbO0xUHEugxf2G03Yq7Hx58FEoc?=
 =?us-ascii?Q?4kq5IU3v7inC/SUmtEjRsiLW/TKHpZJsjUNOoUp58yFKoJGySuBjjWDoXzZg?=
 =?us-ascii?Q?J1fy8U17RJMXAJPyInwVk5IpkoJGoc/enV503xa9p/9j8ke6yTt3YSlSh9o2?=
 =?us-ascii?Q?9wR023U9KjJFVXXWi1tCV0rXlHhkZSWeVyPpioCsnDDxEwV2xiEifS0mEBLH?=
 =?us-ascii?Q?ur+8cRHofpuYndwcdIZd/Mtdhbm3b9Sr2NAHRBPXFSzc7K68+JRNh13dJlML?=
 =?us-ascii?Q?9zFsM4o07BqRe+aniW092CJNgXgbgWKTy5jHo99NVVHLeJcv/BYf4METodrW?=
 =?us-ascii?Q?UZ2cNzCy9J2rW7nh18O/hSnXhbgA245Dhxim8+tRyndMheOi5C4csdptgIoW?=
 =?us-ascii?Q?66hZNazPDx7z7vWkKyINPLGNGtMYFo3xO5jK7k8a4U7XOnQYGLja/wpAqM5n?=
 =?us-ascii?Q?7DAC15XtM2eCwdtme0KRS4fPzjTKRsea37cbqxrGBVX50nf2jKo41Sxeh/yx?=
 =?us-ascii?Q?5box6aqEeE4GQow2NfZgtJt3ola7ZMYtu2XsQT7qEZ3hDWixbeq7txBYFRZU?=
 =?us-ascii?Q?xUalnPOlPq+HMF6y25Lzjagkjhp7UTciTH3cdA+70zgewd1wdpSYtFfifKVI?=
 =?us-ascii?Q?suFRNHs9SK3LXn/FJyExgRcQ6PwQLJnSC+dAJ8CvLlW6W20s+ivKr7KNorbH?=
 =?us-ascii?Q?bwie9dIRpahaxPBK0VpAs+vZtQ8EQtuPUiosS9aPCIA1f2QpO7Tfx2E0Zn34?=
 =?us-ascii?Q?C6PV5oKqEjRvNt/5SmDbnKo1HtzoRhWmi81YqaybKurU3Nbs1Xh7U3p+F45Y?=
 =?us-ascii?Q?uSxSHaRwYX1eJh1XBwNfrR/wHYhvoapzB9BY8IaYWB2RU4FNw+G87YKUta9E?=
 =?us-ascii?Q?y1mlY8oTwJjoEc9QmxqIP4l6PPW0C4EUXek7lapK72pTwCcdMbnUi62QAmzx?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e95a6e70-a486-4e6c-c53f-08ddebd655a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:13:15.0527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0GyVUCtVl7/8jkncu9RwjY0mte/XZBWnsTdJbS20wmS9qmzkzj/K3CLb8CBKlbnGjM6J4up6UhoY46Yu72R9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9251
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

On Thu, Sep 04, 2025 at 04:40:26PM +0200, Michal Wajdeczko wrote:
> Use correct multi-line kernel-doc style if required.
> Some members were described only in the commit message.
> Some other members were described using wrong names.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 314652afdca7..e1c330dd5c6d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -25,7 +25,9 @@ struct xe_vm;
>  /* TODO: To be selected with VM_MADVISE */
>  #define	XE_BO_PRIORITY_NORMAL	1
>  
> -/** @xe_bo: XE buffer object */
> +/**
> + * struct xe_bo - XE buffer object

Might as well s/XE/Xe/ while you are here.

Matt

> + */
>  struct xe_bo {
>  	/** @ttm: TTM base buffer object */
>  	struct ttm_buffer_object ttm;
> @@ -47,7 +49,7 @@ struct xe_bo {
>  	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
>  	/** @vmap: iosys map of this buffer */
>  	struct iosys_map vmap;
> -	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> +	/** @kmap: TTM bo kmap object for internal use only. Keep off. */
>  	struct ttm_bo_kmap_obj kmap;
>  	/** @pinned_link: link to present / evicted list of pinned BO */
>  	struct list_head pinned_link;
> @@ -82,10 +84,10 @@ struct xe_bo {
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
>  
> -	/** @ccs_cleared */
> +	/** @ccs_cleared: true means that CCS region of BO is already cleared */
>  	bool ccs_cleared;
>  
> -	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
>  	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  
>  	/**
> @@ -99,9 +101,10 @@ struct xe_bo {
>  	struct drm_pagemap_devmem devmem_allocation;
>  
>  	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
> -		struct list_head vram_userfault_link;
> +	struct list_head vram_userfault_link;
>  
> -	/** @min_align: minimum alignment needed for this BO if different
> +	/**
> +	 * @min_align: minimum alignment needed for this BO if different
>  	 * from default
>  	 */
>  	u64 min_align;
> -- 
> 2.47.1
> 
