Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD1BC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 15:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6B210F680;
	Thu, 24 Sep 2026 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCliNCKl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9D10F680
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790264412; x=1821800412;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=n0GRDWlxI24Ew+ZmetLGVXgngp6xs+aBqcl5PbtbBiQ=;
 b=oCliNCKlsqkntrM3RDACa/umq+VPdXdlzjTW4ZfxzXcNqutWYIIdKA3i
 VP/2lT63Nilo+F11JLy0+pFfLYP+9xLslvSC4dFqRJvu8gbnrwTIw99aW
 0HCLUunS+psU/HCfG9RJ1By81c0aDFZ+5vQugRPE5sntskNoNziu8uWPa
 D2xZbWbkjzun5QWGKK8qnX3U2LqIhRzkAt0o2qxnw09kJj35z7nfcWely
 IxrSua2BawbzG1z1jqeXkjgKW0fkGQnviEnXH0sLQGLFxzMNLSZmlWLjL
 X3XjLSd5U9UB+O7OSWHg+npFUDUBKYRAYxTh1w/MPwtir2GGcIrf82F71 Q==;
X-CSE-ConnectionGUID: T4Bv2fV+Sk6f8fdqrq59NA==
X-CSE-MsgGUID: ApzhqA/SRQyBk2AHHTqg2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="78595328"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="78595328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:40:12 -0700
X-CSE-ConnectionGUID: eI//O1ymRrGOe7vsD9D9Hg==
X-CSE-MsgGUID: lhOdKJI9TSCKq7e5V3tXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="282144596"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:40:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 08:40:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 08:40:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 08:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFV0ZQvyoV3Bf0jzrbFqQcX8wx5j/k2Qvs0Wx+DQR4l6kGPai3WjKaNtNZhTnmJBAU3hXR4GWUIR6XhvZhAHxpIVyRq1EdFsKA4bJveEiUODhYHtozVQlDUKAMVWVWcVNAUhpRQt9HVfBd/1Pss45Pso8MylsDRAEuWd/AJb4dkacRL4uh5u59Um8r+8US3GLDqV4KcBM0Xh/rnHpJAnQlut/sKsj9BTfINLBuo+0QQA3dYsSD9t4oM1CPZ+H2V6aHrBk1bonb5GKX+tvJt5BI6aVwsqpdkBfiOwMD9gXrCNhFQrUM1BA64jYuOJU9lulfij1yH6af4SP0AlZLO2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqVAwsXF9ALEV4d7aVDN3UGhWyPX7pX0wJYedrGP1lQ=;
 b=n39GDwcTpF2RaFLJU5hoFlZCcMyUQI8TsuLk8HKhD73tYPBjcGIKd+5DrJPM8Gpj2EFHHCz3le7cV1b7evWYKtqxJrVLB0Xrfhfy2KkGIsOXD/q+f5TucORdqJBg4hjQvRVbhz1Vyg97i9vblTS3Pcvlo8l3MPqBGpFWUT/Vs5FqEe/0D4qsEyfaIvVFdHmjmSQgnL9PFqxRrtHx2qcrkosyvW9so2j+mASjkNNgBtjP304vjzMDK3dx6RtP/tRXntUZrs63wOyyjiO2A3TludjrOETZRVYyGeO6AQTSTmITnOQNAZt8XgdqtgqMjQPkiUkIfk56kcioonK02on3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 15:40:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:40:07 +0000
Date: Thu, 24 Sep 2026 08:40:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Drop old Xe GT ID macros
Message-ID: <20260924154005.GH730887@mdroper-desk1.amr.corp.intel.com>
References: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
 <179025842058.202880.7339692756785761863@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179025842058.202880.7339692756785761863@61270ab9df2a>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d97f1a-f9db-4ca7-0cf0-08df1a521c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|56012099006|6133799003|3023799007|18002099003|4143699003|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info: U/YBu1zeojQ6QXos7JSww1KCZk9X1oryATDDbPiXQo/tMFoSl4UzgvcWS0NCPEco2DphX+Bu4YqPwBZK3e45pwIERNB2gbK9Tibx6Ix7MZrCrIrpehEGijAxTFkQyJrlKF8uFmILVG0dik+fc3mDxzZnwaxJeb+Npq6EzIJPa5uVYBt50yunUcqdS4QJHcUORPeZyKm0Bfh1RxdmwzjvNagfFh142nGLojH8jgZBE825mEM6IjWwTdFB48iFwJNvRgiy0eJwtaAUx2kQi31NRqBa7Icg14Wlm25YOq+8nxG25OtCX6hZ2Y4jUrprzO+tNlWPwgM3WHLsUvaLa65llUNfWl/32/n1BJ/E5HQITOYLx/CNyA6XEha0vuejj5g36nrT4IXU8gTxRU10n126mSBcCplDRZSeKekv+TgpQiqlRhNmDumCjIxg4PkaaIjNcek0WvLPrUX4pWbYsQ8XdXupp2wetBED5uPa4kb1W+45MqKlc8DU9c8Oar5zVCpXgsiu4CN3AljF9ijJQGLuCHotyAPhRheh7LsXUbSl0G91DEhvz5edSlpRr9R8d1gTqJG1oi2QSDxoBTsyuUeiXSHtIzUfNRcBhjQjPi+3/uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(4143699003)(5023799004)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dtd0k6r98rDWd6F/XncX2gI7GCl2WBT0fhO1uTyzHYTBiNv8l6I/9juRjuI/?=
 =?us-ascii?Q?Plilb5oszQOY41qQAyrgN/t/tgXczQUpaM1ypnIiDl73dIOv68xTECm6LKAu?=
 =?us-ascii?Q?q0cc9PWYpHTXcy7nO3PB++qm4oNHsUZJb9lid9XlQcekMOfi2UhKrRH7mTkj?=
 =?us-ascii?Q?UxPvWYC9XTyFNIEzjjj2+1jl70w48QbEbpxAtUpNpR3OCr6pIxy1+oCbU5t5?=
 =?us-ascii?Q?nZRj/7GmQVtAUvC7N++E3r7U3U3i2eCLrjpdMmVLXR+hrGxcTu3CvG69Xt0U?=
 =?us-ascii?Q?wK1n8q7/Dxxz1LpvN/qx7OYQ7uaEY3kgLMYOUifYnBHxz3s2ek0lIpb7T00Y?=
 =?us-ascii?Q?1qEOojxKQKxA8j+bsNp434kdZy1y65lojywYmHWlccLQvghKIq4zRslBq7S3?=
 =?us-ascii?Q?h6f7jjypAq9Sw50/r7owa0KX5dSvlzbHcJeba5X+SkPDPYhNcKRJbtpoBgRz?=
 =?us-ascii?Q?pmdKuj1iU3CAHWaglxjX8xZc5Gu5ukLcVtlfloChr8gCNXtbXY+1aUK+xIp5?=
 =?us-ascii?Q?cOVGx/yQHEs0p40lOt455UmlQulpuO42EUi0wpHXq1+OGM0NPKrX4MXSrQPl?=
 =?us-ascii?Q?qJHZouJbXHeOSsIS/CSCMwJbLqnz7o40VFKZ5ICFN61R85E7JVOFtkeERNJO?=
 =?us-ascii?Q?6sNEKuptmNlSFAVylFdUQoR13i36SYvAqls44Y03kxzfNIIlAoQFM/8xRk8+?=
 =?us-ascii?Q?WRCxEvch6xGpAEc6YzpFjQmhoxYY4gBSeOOqAEDUnOR0cI7XV0ikBzsgTk+4?=
 =?us-ascii?Q?ETKvkvrPQ0n0MvgbtS8jmk6Ls0qBhQYfPNkcYUK5r80FiO67Cg36bqKaodlQ?=
 =?us-ascii?Q?/xF8oNsco5iwIxgM6i1uNG/ZP9xgz6l15FesQp926v3fz6L52IUJIl12jgPR?=
 =?us-ascii?Q?Mz9vNaFUOWEM/bAjPoWI+OYrn8btFyi2H2XVzrNjmNIdRb6NvclzeV9AFxb8?=
 =?us-ascii?Q?YKoeVV1KHz0awp1Nj4LUSav9XsxzAyHQeo/le8QajlIypi52rg1rHQMt6V5n?=
 =?us-ascii?Q?1iH0+CDzFumAoNJE92utVXJFR3Vh7J47Ei70QgYL+8KF6YX6INVytdd5zpiM?=
 =?us-ascii?Q?ccsAmTaL0eN9MgiyXpeWVUJMh57Zpnw7nPC1UUD0cZkSaTwhYboul8rGqzI5?=
 =?us-ascii?Q?0zgN4cWHCsiFFECygD3lJvarjr8+47r0QUkOHAOlzGcdQAufdu3tJ+FOUdM1?=
 =?us-ascii?Q?VNZvP2/hue7UeKBVsotb8b0JO0HC0/jEYKBwzl1H7a54ymrNMtTLzVSyQsbx?=
 =?us-ascii?Q?sqihDSLseCYWrgw9KRWoeSR7HigvjDn9P66mCrqsRbcMBtp160H/KfJSLwuk?=
 =?us-ascii?Q?KwqjROcC9s/cZipv/j80Vt7a101XKU/m+4lIKcmOt6bg44IiomBrtGigp2U6?=
 =?us-ascii?Q?fl338pScPur2rC7bvT1XLtiTdP9rtVfMj+sb86A/53LvTvo0atc7avwxS8hM?=
 =?us-ascii?Q?PgzB1hHLuO/8gQX++qOa68EbVLPTvN/KH6pqFW/Lm7r9gwxncY7Ef9Xkz3sw?=
 =?us-ascii?Q?lLRWcE78042Clxr6weGQibksnqcDeIjclCeXfYLurWEGvWAUG/2+gXlHH4Bi?=
 =?us-ascii?Q?xKZbr8+tF2GiWafSNus4D9WTEPuylQnkOlKFs+ddPD/spIi96VOnckb6omQ4?=
 =?us-ascii?Q?c2hpt+MKM9r5neqQadY+i0A6TqRM6Tv7VqqHnFmdM9m3Y3TqMBQ3RD32CvXe?=
 =?us-ascii?Q?gV8eWI5rt36VL6cBWvUze3oY0CrE5juLMfUPpzPaUx6fILFjyWt1vQZvW0bM?=
 =?us-ascii?Q?woiLdVdqu0CkrogVLIVilMu5sQQlSUI=3D?=
X-Exchange-RoutingPolicyChecked: F69j9a+z+ekAKqfD7U9IJucFN6frtkZ9dfrYunHeKq4Sj2i4slRX6GQLutUlGIh/Xv469Wt2cVlCyXUmeRY8LfqtDTdQEvPlhQ+eu8BIAPIAZ29TnCUzpCKF/XU6qM7JBWjI3kI5EO0QS8CzsFJbc9wbTri0AcCoCX39zqCEarlCCLpe3wVDgqXXSO6Lzo2Zx1VlOfe+P5FO/VT30SrAWPU8Dd6JA6+AELMlcc42lQdzjZQfPAVyAKyFwgL0sLaj5PiOcJz9+AJVMbMSDmriYUn36hGqLpozhrzTJKlgmzuGhRBzY4TXNUCF9VSIvR79sGjbD5ZJ4q4Bl96rnR40WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d97f1a-f9db-4ca7-0cf0-08df1a521c38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:40:07.5030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkonEgi8ycLCLwN4dx1GiVjOVWvUVRTt4LdXgFApU78WIhPA22emwFQS6gEN1aejIm6ct2AhtUuJ7t4HiYOiu/LmwjllRURx3+2DQ6Oeock=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
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

On Thu, Sep 24, 2026 at 02:00:20PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Drop old Xe GT ID macros
> URL   : https://patchwork.freedesktop.org/series/174855/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04_FULL -> xe-pw-174855v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-174855v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-174855v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-174855v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sriov_scheduling@equal-throughput-low-priority:
>     - shard-ptl:          [PASS][1] -> [WARN][2] +1 other test warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-4/igt@xe_sriov_scheduling@equal-throughput-low-priority.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-6/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

"<4> [463.958275] xe_guc_relay: 2 callbacks suppressed" which is related
to printk rate limiting; not caused by this patch.

Applied to drm-xe-next.  Thanks DN for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-174855v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-ptl:          [PASS][3] -> [ABORT][4] ([Intel XE#9387]) +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-8/igt@kms_async_flips@async-flip-suspend-resume.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-addfb-size-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5855])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#607] / [Intel XE#7361])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>     - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5851])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5808]) +8 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
>     - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7679])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#8365])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +8 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +6 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#7084] / [Intel XE#8150])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5822]) +10 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-6/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html
>     - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5824])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7358])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#8391]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-1:
>     - shard-lnl:          NOTRUN -> [FAIL][33] ([Intel XE#9333]) +9 other tests fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d@pipe-c-plane-1.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-1:
>     - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#9333]) +25 other tests fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-c-plane-1.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
>     - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#6969]) +20 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6969]) +13 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#7642])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#307] / [Intel XE#6974])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5846]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html
>     - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5900])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2321] / [Intel XE#7355])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5962] / [Intel XE#7343])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4354] / [Intel XE#5870])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
>     - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5907]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-1/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#8265])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-ptl:          [PASS][53] -> [ABORT][54] ([Intel XE#9362]) +4 other tests abort
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-5/igt@kms_fbcon_fbt@fbc-suspend.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7344])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2375])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#2316])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7179]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5828]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>     - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#7178]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7178] / [Intel XE#7351])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#6312]) +8 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656] / [Intel XE#7905]) +16 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4141]) +6 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1469] / [Intel XE#7399])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#6312]) +8 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7061]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +30 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7865]) +23 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7399])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7865]) +10 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +38 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7905]) +10 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#5812]) +39 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7061]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7061]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
>     - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#9312])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6901])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#8303]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
>     - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#7283]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7283])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7283]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2393])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#5020] / [Intel XE#7348])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#2685] / [Intel XE#3307])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:
>     - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
>     - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#8396]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-2/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#8396]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#8399]) +1 other test fail
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-ptl:          NOTRUN -> [FAIL][101] ([Intel XE#7395])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#5858]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#7304])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1489]) +5 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2387] / [Intel XE#7429])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
>     - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#7413])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-onoff:
>     - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#1406])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-6/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#3904] / [Intel XE#7342])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1127] / [Intel XE#5813])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#5821]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#362] / [Intel XE#5848])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#5950] / [Intel XE#9277])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#8397])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-4/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@kms_vrr@lobf@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#7638] / [Intel XE#9277])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_vrr@lobf@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1499] / [Intel XE#9271])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_vrr@max-min.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1447] / [Intel XE#7469])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_cw_post_sync@walker-post-sync:
>     - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#8608])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@xe_cw_post_sync@walker-post-sync.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5764]) +5 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#8370]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-7/igt@xe_evict@evict-cm-threads-small-multi-queue.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][126] -> [INCOMPLETE][127] ([Intel XE#6321] / [Intel XE#8355])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#7482]) +6 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_balancer@virtual-all-active:
>     - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#7482]) +10 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-6/igt@xe_exec_balancer@virtual-all-active.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1392]) +4 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-imm:
>     - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#8374]) +5 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8374]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-6/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#8374]) +5 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#8364]) +18 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#8364]) +10 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
>     - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#8364]) +17 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#8369]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          [PASS][140] -> [FAIL][141] ([Intel XE#9096])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#8378]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-rebind-err:
>     - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8378]) +7 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-rebind-err.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8378]) +5 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-object:
>     - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#5100] / [Intel XE#7408])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@xe_mmap@pci-membarrier-bad-object.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#6964])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html
>     - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#6964]) +1 other test skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html
> 
>   * igt@xe_noexec_ping_pong@basic:
>     - shard-ptl:          NOTRUN -> [SKIP][148] ([Intel XE#6259] / [Intel XE#7406])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@xe_noexec_ping_pong@basic.html
>     - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@xe_noexec_ping_pong@basic.html
> 
>   * igt@xe_page_reclaim@binds-large-split:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#7793]) +2 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@xe_page_reclaim@binds-large-split.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2284] / [Intel XE#7370])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-ptl:          NOTRUN -> [SKIP][154] ([Intel XE#6867])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-4/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-bmg:          [PASS][155] -> [INCOMPLETE][156] ([Intel XE#8175])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][157] -> [ABORT][158] ([Intel XE#9362]) +1 other test abort
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-bmg:          [PASS][159] -> [ABORT][160] ([Intel XE#9362]) +2 other tests abort
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4733] / [Intel XE#7417])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#944])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#944])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#7174])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-4/igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [PASS][165] -> [FAIL][166] ([Intel XE#6569])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-ptl:          NOTRUN -> [SKIP][167] ([Intel XE#6376] / [Intel XE#7422])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-1/igt@xe_sriov_vram@vf-access-after-resize-down.html
>     - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
>     - shard-ptl:          NOTRUN -> [SKIP][169] ([Intel XE#7892])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-5/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html
> 
>   * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
>     - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#7892])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-2/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][171] ([Intel XE#301]) -> [PASS][172] +1 other test pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
>     - shard-bmg:          [FAIL][173] ([Intel XE#9313]) -> [PASS][174]
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-ptl:          [SKIP][175] ([Intel XE#7308]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-6/igt@kms_hdmi_inject@inject-audio.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-8/igt@kms_hdmi_inject@inject-audio.html
>     - shard-bmg:          [SKIP][177] ([Intel XE#7308]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][179] ([Intel XE#1503]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [ABORT][181] ([Intel XE#9362]) -> [PASS][182] +1 other test pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][183] ([Intel XE#8399]) -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-ptl:          [ABORT][185] ([Intel XE#9362]) -> [PASS][186] +3 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-5/igt@kms_psr@psr2-suspend@edp-1.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-7/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][187] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][188] +3 other tests pass
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][189] ([Intel XE#9362]) -> [PASS][190] +2 other tests pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-4/igt@xe_pm@s4-basic.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-7/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-ptl:          [DMESG-WARN][191] ([Intel XE#7727]) -> [PASS][192] +1 other test pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-ptl-6/igt@xe_pm@s4-basic-exec.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-ptl-3/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          [FAIL][193] ([Intel XE#6569]) -> [PASS][194]
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
>     - shard-bmg:          [FAIL][195] ([Intel XE#9346]) -> [FAIL][196] ([Intel XE#9319] / [Intel XE#9346])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][197] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][198] ([Intel XE#3544])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][199] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][200] ([Intel XE#1729] / [Intel XE#7424])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [DMESG-WARN][201] ([Intel XE#7727]) -> [ABORT][202] ([Intel XE#9362])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/shard-lnl-6/igt@xe_pm@s4-mocs.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/shard-lnl-1/igt@xe_pm@s4-mocs.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
>   [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5950
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
>   [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
>   [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
>   [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
>   [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
>   [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
>   [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
>   [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9110 -> IGT_9111
>   * Linux: xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04 -> xe-pw-174855v1
> 
>   IGT_9110: 9110
>   IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04
>   xe-pw-174855v1: 174855v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
