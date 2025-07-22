Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A421FC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 06:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A210E2E5;
	Tue, 22 Jul 2025 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyRPIbi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3C10E2E5
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753166579; x=1784702579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vf5sbqVPHBkF4uI+wK8Vfdu6QPIJdRm7MmRC8YMk8XQ=;
 b=jyRPIbi3olFp3a3mVT6q6e1MuyJWXye/6amKC9kDrSV5Rj1gLUtlEIP/
 5CCDDEWEyXHiBgKFMeSNIaufiOASx9kQzU0SsgKCaP74CGXvGSzkd4CDj
 6pfBSmMDhPfi6ut6NTb5y6wXp4XV8/BmktWT1mBgDTNNcL5srjHQiupND
 JmG1zp/+IBGDB9l7O34TmCkj67hnRLcZUxORB1qILLgDAcsrWGm+l2NGA
 KDblVneFgEEoT029+TcX45Rl6/7Xnv2/Gpy82T/x0I34saYiZk/aHWYRy
 nUineuuC2km4GT5pT7qwo3TVJP5676cv6r4BEDIjQRaPY6hWyfOs2qUvr g==;
X-CSE-ConnectionGUID: EHrNVf8eTzqjHOkll0Mugw==
X-CSE-MsgGUID: apMAbx7QRw2+veU2Nj7Kbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54503225"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54503225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 23:42:52 -0700
X-CSE-ConnectionGUID: nP9PTS6eQVK0X7Hai9XaKg==
X-CSE-MsgGUID: 1JDfClMjTSq2QU2XM3r+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="159776378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 23:42:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 23:42:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 23:42:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 23:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcDLQ1sFAVjMMGcvlusSW+EOmgHzFejvEQzs3S9o0ltVEqvGx2oaloM5FW8xVeR+DSfU56JcaZSxyjPlGZ2MOalam3lDP64EeiJCnCVXPc0E0aqjBafUhWSpPYLSLgo0TOeMx0UIvOz8AwnGxPNPnUq53LRcwfXZpFzO3OZZ8dd9iadkav/sLTQisZrO4mrI9HKosXEEFuI95cpa99IP6LNLVA5IqwDvWYMFabsbLuhexPEo1cpCTtKMSI5LqkPrrtnZeImQeE+1v73Ua0Myd+3n7mHUs89g6bz4FeOdRfjQwsK+4R+KXJkKb1YV9WPYzemZEuXQLTRjQXgSCDQ4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fva5c2CgHP0L7VJKImK4WTncBQuLOx60/xainKpTu8Y=;
 b=TM4eGN8w1zYlJyEFJLTZfqkoH+YjJDGSKs9AiZq/rAETb906TVitcMQyEAJdXzx9aQaTke0Z++8wF7hNHRODPnFwEW5cdYNF4AR54kYoUCBnfh3YlKmDomkZ+xkPvBWsTEhApf+Wyy6cwd88B4RnmL6u697BYsvC6IbDpNTFW8US23H48XugBOWjLw6TUfe/4Efo6L5sgoXXULkzB7AoZ12Mu95+xjKtD1HV6kIOC38TPyqHR/EQCU0EiHmn4ciOQQF9Ych2aLJ1hAY8CyR1Jg/IKb/I2s90LtL4aWLzJm1iRR4bNJgNstq53DqnMoEDjrbooI3QVhea3GoZNZS2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 06:42:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8943.028; Tue, 22 Jul 2025
 06:42:48 +0000
Date: Mon, 21 Jul 2025 23:44:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/uc: Fix missing unwind goto
Message-ID: <aH8zUwKJyuGZSZ0X@lstrano-desk.jf.intel.com>
References: <20250721214520.954014-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250721214520.954014-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 47feb2b0-d041-476f-f400-08ddc8eaf924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R/ooQC1IRQulHnBCS2L9rcHpaJMaCTvggJBYd6kj+GzLx/Dwie0eyzDkhcSh?=
 =?us-ascii?Q?9/2X616Y3CYwRZ/Yttknkqypt5wbsoCnoL0ye38BiSpsd90MP8Kfaacb9Jon?=
 =?us-ascii?Q?DYcCa7ZdgQ91XPkH+Q6s/2qtI5d4iEfVY7M6r+nbRA5A+c2CMFr0xwClpSws?=
 =?us-ascii?Q?9uz5OzkhnN9AmemZmpk9we7VPt8jugt3OoleLjvJOFrSxheo+cFRIc3ccVSx?=
 =?us-ascii?Q?lk6ZV5VFEJplM/fQkmnkpWf+m1K0rzzGZpidkZsXshOnvtFSPRIS7c1QJNWb?=
 =?us-ascii?Q?CmZ70TY3+2528SUCUQK3oPaC/vzDt9pM9MBHdaPNGJ39XNSFIkj6bdY1LYcv?=
 =?us-ascii?Q?/2doxLl0Y9iYYGXQHHltkXDuzwBdxuNxrnsPQqIfe1z8GlxML2WL3QfnZs9f?=
 =?us-ascii?Q?99wdtiwxMYiO0fowCMUSgwSXfH2AHvKwN2ZISRDtR2hR0yJSQ4/m1jg1LZF8?=
 =?us-ascii?Q?TvKX/9IZadzEu5QhoCL3Z8vBTCNtEYNsqPRxQbzJKAD/WkIhi5MYQaT0cw4M?=
 =?us-ascii?Q?E9RjtA003sxIKfRhOI2BaWSGLyw6Mhz50rIF2QUKWqXTzDpf4k76/2hx4xOo?=
 =?us-ascii?Q?w8O3ENb+OPhZH7HzWMYpmrbEBQ5nAt4BIbw4zT35F4yBUucIuBzxXQv/I/uO?=
 =?us-ascii?Q?7bwJimOFJkTbXdS8PB7GilU1uAipGWzsNA+FiljeYGsqQJTu8rdOjMAyqjgz?=
 =?us-ascii?Q?IywoUv8PgCC1UALp8scVWp5VqOiWje1WPbF2/apm3wQQZtyHHKQXHrXf4oXm?=
 =?us-ascii?Q?6j4So6M1w8UbBgy4oxxBeodrMbyEZBuuwwLsPYReYI69U1pBsTZb7wD5SsFJ?=
 =?us-ascii?Q?j8NZCKD1rY7J+kScDytKG/56f2boCMjR4wgedCGwd5UCZnhSEjEE+yanIVrY?=
 =?us-ascii?Q?8b4cJ08pQ7jTFm01YxRrBrkKu9FIJ5SZv8Ep2f2Cophw8zMYG2J7Yoc5c39u?=
 =?us-ascii?Q?NBaRmg3sXD/HEjhxqK2LMnR0z56I+MyoVZ/BkINNn9/l1C56fxdPA7m309xI?=
 =?us-ascii?Q?kVAIavulgE8GVLVCVjqJA0sSIuT8dCYOSAn21b+DbpCSjkpKcop/ihCC4P+9?=
 =?us-ascii?Q?4DZ08BI2lUEHorMHR2aAEJ8erKG6WpDpQF+3lDy7koOx1D9NTMVBLpk8SAcA?=
 =?us-ascii?Q?wgBe5QnPuIOxQMoK6nm+JPtXHwG1A1XV2FuWXUb6yNGv4F8H/DZHouD9EYQA?=
 =?us-ascii?Q?WKB0NLv09UEJTC5pfC4S9JoLk/31sEKyPt1j5J6Wa3u+BfpdDiBYGcdU8vFm?=
 =?us-ascii?Q?8ZwurEkvJ+X19PXgjcAS9058yrEviiTwF83n3B59uCTkzAF64vDnDoeOjdN6?=
 =?us-ascii?Q?0IMFznFEe2j9XG8fHXf7bXnb5mIlj8h1R6LiTFZgF5v7FiwqAcINbuCXzcKG?=
 =?us-ascii?Q?mQ4F7XBnpbeepdPxKoq4foAg3brVyjca2jO2OH3hkypy6kTDOgrUg0O/u9pa?=
 =?us-ascii?Q?JM25+awlK+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8nckUSb3pbG2Z+0zpK6zVSUnzMw8t1AlNwgxwPVAeInIV/1u3lFrQz7QFeGZ?=
 =?us-ascii?Q?MtkGV1qKQgI0s1xrigmJ7o+e9lcPKLssnj0WmU5H2eV/9G7MRs2SUqknJXSK?=
 =?us-ascii?Q?PGw4JuZkC5g991PBsl1iX1BVg1R904zjomC2vS17QFpgxUKmSD0GILgWGYWx?=
 =?us-ascii?Q?X0Tn6b2njIN5u58CQ58TUbz+4aivYU+17FxdLhWGCzNAYMvPwP8Pa1LsQmaS?=
 =?us-ascii?Q?lpGUZ1uUCzuxNfWktfYJRc5kVvkq8pB4PxxdKchAxts+zO0daMsrPF3Jezyr?=
 =?us-ascii?Q?kLvQptvTmgx/ccEbOgE0jgyjJCN/Bc4O4SX2ELa6Mnij3sgSO7PIu9LJTvvL?=
 =?us-ascii?Q?/Ir/Tf+tTeQcVia6qAb7ReipGeY4KXcawUHqn+ZvUSkN43glwnf9C4UwC6rw?=
 =?us-ascii?Q?B5Zn7DAGdwU+Gr8JUiHi+Qcryq/kFLKi9sflqJrae2X7wgjv3dbpWIOCb0kL?=
 =?us-ascii?Q?/2UQkAg8uCPMW2wOpFt7FphBUPFpagfB87Nwa6ilXP+vU8IXXBnzEqwg9BQG?=
 =?us-ascii?Q?asorxuPbQQrjQY8iR8K9c16z0dx1kg+N8nYjqeF8TAnf/zaCCEgGpZbK85Ty?=
 =?us-ascii?Q?8Wi3jgasNpf2QAOcK2DTjqP8XU8qrcElmAd1nvo1FZkdiB8UGsII2fI5rDuU?=
 =?us-ascii?Q?abdh5eQ88RHkg/pHOgnzFE+4C1R3oGsBOlXibb1cR876PxobTVPf7IyNafo0?=
 =?us-ascii?Q?h0mP//9qbhYEKOxbHOIcgg8dRmlve7WIi3LUz+fFFzKJiyKUG4axVpJbWqCD?=
 =?us-ascii?Q?PpSoYfGWzfqzqdZTLkS12Ft02fd72c/xrZj0AIKGTMXRz7qmypbKVCL+KcbW?=
 =?us-ascii?Q?b2njuZidvKZvtgRlng9elpL0XhoXzZl0Lt3t6cFOQtHBn+NhEugj1/6RGRET?=
 =?us-ascii?Q?n4fPAXQF3ggz/ZrI7i7Hf6qGCcFqvkd4fqwKBmZrD/d58ypkIJI/KmN6yCxU?=
 =?us-ascii?Q?kAbBmLNIOy6H2UyrgW2LLvvQUDAt/ekHSDHJHruQKVJd6VIiZKhWsEhGElXp?=
 =?us-ascii?Q?6c2oWM+T0Av4oTXcgIiPKm/ogSWqFzLUO6fpP8uwHltW/6TQ/Sqvf6g7FOOa?=
 =?us-ascii?Q?6RzcyNNWGRvXLOmCNTHr7dC8TP28gzF8McNQjOehlrFWOxmRckiU7HEqV5U6?=
 =?us-ascii?Q?UlYli2aQ2S3VPMu5bA7w0UvcWaXBr8WvGUJxZjKOiFZeqQQZfvaBrrx5LO6a?=
 =?us-ascii?Q?lr0ISuZ1ejCL4s9m+CEt0vV3qpUEa7u1Sa55NcaI/DZGrAs4b/Jkp7i6CKYg?=
 =?us-ascii?Q?OoUMPpialNKhweBIYIvJP7bbuU01iX2izDy+lEBD7ntO9GzToTcBGPc5pEiy?=
 =?us-ascii?Q?YyToU92Q7t9J6gmy9fXFqdusewN9upJ/TqPvMMKcA7Jme4bSUoFnI2fSbzrp?=
 =?us-ascii?Q?2gLvi7n5d4chYdy+53IS9S6pMCOvvphyM0Lq/cRk4wqkUGPuoxZJg0750YSm?=
 =?us-ascii?Q?ygkxuB/FdJODdLPK16SZ6GgBFapfwAtSHq7UO+5UVmTxdBfa6B/jxYzHm+LZ?=
 =?us-ascii?Q?aUqKusIuvekOK2GCNfuqSjX179y8hlPQfxoNi41E6zfzeiktBoMUh9XliR71?=
 =?us-ascii?Q?KSmCKbJIEA0OfFa/HxIb/izo92275B1T2rB1V9juxKgKKmyBNNqMF8twRsEj?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47feb2b0-d041-476f-f400-08ddc8eaf924
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 06:42:48.6499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+rAk2EKOQ78b2R9bJ9zpfb/yqFgzzbhrSJrVANqPOXS5aVNiXVi2ZbZSs0ld44jdf/BOzMZPXpn2qEg7mSXkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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

On Mon, Jul 21, 2025 at 05:45:20PM -0400, Zhanjun Dong wrote:
> Fix missing unwind goto on error handling.
> 
> Fixes: b2c4ac219fa4 ("drm/xe/uc: Disable GuC communication on hardware initialization error")
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3e0c3af235f2..465bda355443 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -164,7 +164,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  
>  	err = xe_guc_opt_in_features_enable(&uc->guc);
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -- 
> 2.34.1
> 
