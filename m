Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E4CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BD310E4B1;
	Mon, 29 Sep 2025 23:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaIkQvvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AB10E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188349; x=1790724349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OenJoaKt5VrzbU9JrouWYppFBiJQLkIC+4GYUv1fKAE=;
 b=IaIkQvvsROZRLluSPmxcA7fFrB3Gb9GJmTnBr1qQkmULeSAjFw1KIFNA
 OGuE8P0Zng33yWTQpuR49dhcyXbaRMmYCG5dmBIzgrADFMURxhGi0Ecnd
 alzW/rKwfH77nC+N/QhotSpoMh15FXvpN/HvnE836vihn5GyUx9mDONvv
 HvhJamSDngL11h+sZDIQeJyXPSilECs+FD7kNujDxZwnQ3DORJIohY8+m
 3orneXSpYrpxUnXVXO5DSQxjeVk+9ppNzge/eWidQGNsQSNhV/Tl7rtvv
 5B4QuZAPDdDe2tF/criB9HtN+Q1IkSkQrsM6f45/G7Z1dudTcCAMJZMuA w==;
X-CSE-ConnectionGUID: E/iy4rJVRIqAE/6YhyB2dg==
X-CSE-MsgGUID: zrnNggS3Q9Svw72A8jr7PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72541083"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72541083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:25:48 -0700
X-CSE-ConnectionGUID: TRa9Zol7TfedaxKyJanxtA==
X-CSE-MsgGUID: bVvl5TjLT6qHvV/72bgYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178399979"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:25:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:25:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:25:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdTwdYWmOxSFViumO2cOkRH3f4VB7v1KmXt+HAGchILKf/oGgkZUXMM3ZsQhEkkwS4UAUhqOGMeRhlLfreUSvhFzvidtCnRRFOTb94ScPUrJiro/JzrdddNO/siR5VRyDtFp4MYKZJOUHWwDeFnsBLvWoK56F03Mi4GOZ4msL/P8SAIhJQjSXY2SiDBrlGr7aWE8N+Uq6/1qIsGwo2LYXuS3lqGfdu/AJSPaHd4NSNzg8dv5sR+MRNWqa6UuAX7TeNz2yOR8Km1yycUpr7um2k+vdZ2vStsnmQL0mhYGxpPYOhPLEMnvTxhA5kerKpiNcy5nzgG+5a1r5S0sDZCzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksO+lELq5qb1bEmcbtYbjy8nMeDKW8i2bGvgxSJ+mx8=;
 b=M4osrX7nBk4KBRT5wcHPG/jWKGpD/9hW2NzxYbMihhIwy8CbCJ5oHiWH9I4ci30d7totNh42AWQ1qu0UcvNz2IKw7IYVymELWXzWeNxthH/JukIZHF4tkqI4zd7s48HgJcyTnHIVOUaiXzEPcU44g1Z9w761zBl0rROVC00oPNVyNaX4bTbbfk2cc9VX3nwJ6H+lChjcfd2X73pPDl9W99kgbLhjMlJwmHxc/1KKB2tSH+c3kUPcnDf2dMKSzIju3N6mt78W5e49FYSDVc+f2xWz1RHjLe98DXdbC3ACjNibRipBNjkcpk7j79/29ztJnBn77FI6NDobs8TAa1jC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:25:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:25:45 +0000
Date: Mon, 29 Sep 2025 19:25:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/debugfs: Update xe_wa_dump signature
Message-ID: <aNsVdts2V4SpaZWU@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923211613.193347-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: d91348fc-8cb1-461f-ac6b-08ddffaf83b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2wnTR6IcoihZS3UNrFLbR0H0EaIfyU1PTN41z7vniE0sFfNG5/1UMZhmpZ9Y?=
 =?us-ascii?Q?myASiYiH8VfBVH+CRQbVA0DjIiPt80MtwFZHtIXSpppziqA3S0vXH08kWGYS?=
 =?us-ascii?Q?MhiQvaFfPKUxWhsG9xRpRwHlNu/RmCwURLoTdlorwu55Mk5lhdD3uZS2RBUQ?=
 =?us-ascii?Q?B1Q3pmoePsztI6mJ9BCGfHDHTXaaYoUnrH59C1CiAEvX0MN+G1/dy2h/N8Qg?=
 =?us-ascii?Q?opmnwSM5tMyaPy+K515TWgCKaObcege8xFYCORkxPuAVOFUr2AmrCOAsf2LI?=
 =?us-ascii?Q?cjpzXZxhWaqTmTjLqmwVpOlLFALoAmYHHQBAMfufSBl9GgLogvkDxpBcuMBd?=
 =?us-ascii?Q?L6NaEXi5kHyVdjmM1B0FsYnyg4M4gLRdDh4pV4ULQG/5FPeUDpnvoMqhRcUP?=
 =?us-ascii?Q?qAoIM7UmvwlbygDp+mPfPPq6y4zT0Yl5IXVzcZqS+qzRyIHLHLG3sO7gfL0x?=
 =?us-ascii?Q?KvGzAhgjALupqiGZFPeg2USTXBBCAaL5QChY5p/gvWlSs5p8fWr2f8F0eBD7?=
 =?us-ascii?Q?caBlLiPKEqu/n4Lya6GHspUFD3GVXa6bk1KksQXDaPJjLo4whiO2TLbx+xvj?=
 =?us-ascii?Q?Wof9s08wa2hC5w+n1CKlipUnPlqpB5i2Dsi4R6SW5M06SMe5zeEAQp09ESQe?=
 =?us-ascii?Q?U+W3WD5CC1qm8poYLCLKtxNA13n4BIex9ZRkWHhodEvcZie7VBrLtz8ruech?=
 =?us-ascii?Q?Et5SpyzbsFXuzQFg64q8FnWohRkQ9bBggMxh9uAnaDNkwKOy9680wKrNwPHa?=
 =?us-ascii?Q?nlvi8S3SuvM4qhaK7kFYUl9z2hA8kUAJ0FNcvlfSIAIQLKXTbpnLQMCeiZXz?=
 =?us-ascii?Q?3gQEifWbrVbOFK4LnLWUb02CB+nw5q1+FlQBENkhb2+wJMFUkSkQ66dtZQgX?=
 =?us-ascii?Q?c7XblM2gZvlH4dVBZqL7SWtswlKarwrK4bq+bSV6qeR8MoQstBD3nQqW40n7?=
 =?us-ascii?Q?cZcjMOxV8HMnsrczRsEbq3FbFCvYpusf5TFY6jIFdzmwgg+Hw3Pvb6uy6vh7?=
 =?us-ascii?Q?nldgGixw2qz0TteUyrwNGvY3PtI+ICAeXg2t12zlBa4DTLarek5tzx+ErMxf?=
 =?us-ascii?Q?jgJFa9OYoyDXy6JK2MoaUVsJO8BD4p6L+uRpZxrwXeJ+jf/e9lIqeJ2CCL7Y?=
 =?us-ascii?Q?12a583cCSo89WnleeeULUwHnX/etBN/mAFWd3Cjs5izTv/Mimo+EV5A5dGPi?=
 =?us-ascii?Q?gz2ZJKU5EyvSKi5JKev3eVQhWTIZaqbt3ocKY8plGW/gbur6ZXiCk19aniVV?=
 =?us-ascii?Q?/KUrDhaSiWVIn9fYgXS3njtHh5HXWorgkN0gehIdf4goTXZlAIsjvaWWa15h?=
 =?us-ascii?Q?6VDFftxSgUcDDU2an9bUpVyao0gqxuTnMvEFpedhJrLJGBoaXZbk8+KD9FSI?=
 =?us-ascii?Q?Ttg40pYO4yaiYgBGdgHO3eawbYIafrKpxgOZ3jE7iGDrApzqlJKOaKhwb8Yq?=
 =?us-ascii?Q?tzc1ujcfht9PpG3tBmYIWabP/dKDuylq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8E97o0Imse5FNYGwa5us/Yv1Z1uLZMyD7J7bwnKrqFlU/8ibITEvnqaERp+d?=
 =?us-ascii?Q?vgmc5tXz3WhxUV1Lc5TeCOlZp1BJ8Ac3IzYOH7nv3utYHZJMySlU08VMQxiX?=
 =?us-ascii?Q?aauh7ZMB/0aj0HS6yqIBGH9vK5Wx/SM1xO8nGfhuzrE6T+ZuokHk4kYc7LTf?=
 =?us-ascii?Q?6lPMwjJfw6NqAFOHYyP/2/CFRDmrbTyGk4B2TsSqJxRDulJbqT2RFzoa1dxs?=
 =?us-ascii?Q?ykXbUfmpjHxyCxC+2BL7PobpBlmBRY1ZC0soBacqyZylsKTtjs/kh9/cK05s?=
 =?us-ascii?Q?YaeqfZ+4XiJ+PY45d0Yrs8wExg9xei4dJggPO2Dh1fcPqZIWqRfmHXBI6hFA?=
 =?us-ascii?Q?dc6nZlLkWiAUuRK0RumzA5HJnzl4D+weTCkdMYP2xSrF1KUn3Dy7IAUgK3Jl?=
 =?us-ascii?Q?nck7IETHsKVHF9IlBWhQnjFYD3tGEYLv+74UvwAMJ1vQ2ssO61YaI1eAzAl/?=
 =?us-ascii?Q?Ybxw4W4dcvRpvPoW9DuxqdrbxtwIq0nJwJBiDtvXGhk4IEpgPJwAWgnwWpy4?=
 =?us-ascii?Q?cbuvGNw/iWy8+XMK6SYNg45P5C94O3RMaqnovSDWbDJyGHz4B2bfcs4uJNPz?=
 =?us-ascii?Q?DjbSIslGJFZVu+LPVwh5knTdRbUTwqUgAFvPwBpijwaFK0FPcVIgK711HM+n?=
 =?us-ascii?Q?s2UiSQbJcLcSASBwSo3ptBnTBhY4G8v/Cd4tTHUHyIW4A1LRBwwsnTaTlRjM?=
 =?us-ascii?Q?HqKQ9FaQcSXZEH4eguzuOzFg9Ltkw9MBjgCMitPzzeEYpe6BuSIWQOLGufFD?=
 =?us-ascii?Q?/Z/7UXxppqcy7wslIHQYaV5SqjgIzy0boUZPqD4eDb8US1rYrlncndvl9zyb?=
 =?us-ascii?Q?NO7ZXyeJttu2gtnWGDcb+bOw6BRamXImsXBZssMtBcX0sRwP6F0Bg/tf/fry?=
 =?us-ascii?Q?8k1BQUqIe70dbpTfstTp2kPQb0p0vaQVkz9Lz/y6cGdT3IclLvZawS2rHpMX?=
 =?us-ascii?Q?WoCexrNcvxvV/d+Dk3M+tJLdbJKlFI6y/Zg4Bp1sQnrI1sLkUyqYsson+YE9?=
 =?us-ascii?Q?VBLpSJ98pM9tMacMiq2dcrd1vZnoEy6MNNoYHuddxvkiXdUbEtkpvihOKB9h?=
 =?us-ascii?Q?t5Ahrh/e6Mr4RtjCiVgszJxhxeixHm0+G8nG2PdJTFn+3VjGiJnPGaVPgHQc?=
 =?us-ascii?Q?1qv7D01I7p8DqDih3CQg8Nmh+gmuIMQ5a8+26qSS1hfO9IwfRElf9SJ+tGo/?=
 =?us-ascii?Q?V6HBqmQqR+wTda8dQ9UGNsF8Za46uNBrAgShXDh5b7Wxu5ADv6JnN6S8/e9D?=
 =?us-ascii?Q?o/qhad2E1hKbz3eRjD6ZWEoahV8FutL9T9n8rbKELaZw/2RjkJuDW11YHC9R?=
 =?us-ascii?Q?RnLL83bLY5J/QGk4vzO/fnHJKOAo5K73bmXGIVJAWKpEWGW9gElHXL1Cvpq1?=
 =?us-ascii?Q?OzVc0L/FaOrF2Kr1Ftnc7Vh9NekaM0oudSl4GoP606aI07zfY1U1NM9fjXqQ?=
 =?us-ascii?Q?VLJalGLoRwyLnRlaleJ8eLOAFnz2BAZzaM+//5RsrCYynPoSW85tc2syFZPy?=
 =?us-ascii?Q?RE2Uhi4eBJdpn0f8hXhnC6cxxwM8M5GHSNZLpYg8ZpQftqvGpAeEMih1/ovm?=
 =?us-ascii?Q?jxmkRJfdY/WMHun3ypVMm2XcZ4/KAIfIAX7r4p/8rn5HX5XBjYyRRwd+aGBV?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d91348fc-8cb1-461f-ac6b-08ddffaf83b5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:25:45.3035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdn3JpusxZjTjIA4ZSk1PAh5R8RHoqgt2jxNnfMmzll5Xjea3SnSWWRmhY7aPaxHCDZScmeDsHJZgOTvx/N6Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On Tue, Sep 23, 2025 at 11:16:10PM +0200, Michal Wajdeczko wrote:
> Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
> functions to return int. New signature allows us to drop wrapper.
> 
> While around, print additional separation lines using puts() to
> avoid output with leading \n which might confuse some printers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-------
>  drivers/gpu/drm/xe/xe_wa.c         | 19 +++++++++++++++----
>  drivers/gpu/drm/xe/xe_wa.h         |  2 +-
>  3 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 6694a38203d3..e6a7684d571a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static int workarounds(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_wa_dump(gt, p);
> -	return 0;
> -}
> -
>  static int tunings(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_tuning_dump(gt, p);
> @@ -236,7 +230,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_topology_dump },
>  	{ "register-save-restore",
>  		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
> -	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
> +	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = xe_wa_gt_dump },
>  	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
>  	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
>  	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index cd03891654a1..c60159a13001 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -1086,7 +1086,14 @@ void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
>  			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
>  }
>  
> -void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> +/**
> + * xe_wa_gt_dump() - Dump GT workarounds into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: always 0.
> + */
> +int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	size_t idx;
>  
> @@ -1094,18 +1101,22 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for_each_set_bit(idx, gt->wa_active.gt, ARRAY_SIZE(gt_was))
>  		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
>  
> -	drm_printf(p, "\nEngine Workarounds\n");
> +	drm_puts(p, "\n");
> +	drm_printf(p, "Engine Workarounds\n");
>  	for_each_set_bit(idx, gt->wa_active.engine, ARRAY_SIZE(engine_was))
>  		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
>  
> -	drm_printf(p, "\nLRC Workarounds\n");
> +	drm_puts(p, "\n");
> +	drm_printf(p, "LRC Workarounds\n");
>  	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
>  
> -	drm_printf(p, "\nOOB Workarounds\n");
> +	drm_puts(p, "\n");
> +	drm_printf(p, "OOB Workarounds\n");
>  	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
>  		if (oob_was[idx].name)
>  			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> +	return 0;
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 6a869b2de643..8fd6a5af0910 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -22,7 +22,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
> -void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
> -- 
> 2.47.1
> 
