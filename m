Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA7D5E130
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138C310E19B;
	Fri,  8 Nov 2024 05:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGLqHzMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB99C10E19B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044723; x=1762580723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MFq+8XtVvz7PTtQKli88EE0ufGyHdKV7D+twHPlq2J8=;
 b=oGLqHzMmCWiGa9h3JkgPprRps4YretR+TnOP/RZFCz3Ier+d3u49pHag
 iB3ZZytvni9+6B2Rxi+/YHEFavLIJyiu59EJXe3U7+hQTgKbL3ub3Kog/
 WFoKaBAm0auKKNuT8n5sKTIJ+wjJmcCg45iH7gIyuLDiNC52DE7svmZVe
 y3hFHtgIcbprVJJWMQfHyzGPsJjIVd+5tqxS4iGq6BKf3fuBfG+Wy+2D5
 msUxRSmimFYDF56rFl/u+bIPmBLzvgc/A1f8HYkn5kINye+aGncUdadPG
 OcpzdmAESM2dgWH/4HXhFMNj1yi6brGe+FUsKmHdh1YZV2B7fSeSO4nvE A==;
X-CSE-ConnectionGUID: MwxjfKf6QJOs7YyihGzq9Q==
X-CSE-MsgGUID: 81EKMIZrQI6I4lDsXxVYLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30690954"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30690954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:45:22 -0800
X-CSE-ConnectionGUID: CoUNFtf8QpOT9WYfjp85Jg==
X-CSE-MsgGUID: rJrrv/ezT6CmmKlEG8xywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="122900008"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 21:45:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 21:45:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 21:45:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 21:45:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXjCWyYrYu0eCEUyf9yBvteFNGLl5wedi+WNAsBdqJqcoVn1UJfsRLPS9iKCGumXokmTpFRsoxrj7Fas16k5OhFKQiE85hpSARV9fggBhl70sbyjr+++yPkLSi8KbMtmN64X4pbTK5sRRV6bhCniIi+a9UrVaKBAxl0QNCIfXxFt7bwFn4mjLrURrhQHQul4fP2xHQWK9E/fyuCkWr5Qv4Z3THRXtc17IJw3hIl0oQs13/5aYQ3s4ZPq6Fc/4ZbENJ5y7JKK1qvC8++4o34KaGRBbOqzomtq0bSI5m+Lqek78bcpqSpjsYjOnc9q+eDwTlRci+/7xOz3ROmMD8bF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eH+YG/ZSf3UH7DBjYJqPyihuG1eJKxjsfmUnwtgs6s=;
 b=WIf4ir8vPgDhRVxGDJZzdYhGOEaDWinBj34HnUo3ITW4aq7fEtoE0M/29Z/v0FVoNWtcMfPKQWAvMwzCNyDg43vnWI+BPBtjRBiVptK/mx6vpihSol13p3/XXkmArJqdmZmt5G164xsKLJexmoJnX001pge2C5jCFerJfLmWSkG2NKD9DAaS03Kg4wbwNMP900hAs44yVfZZgyvy4SD8HCR3M9OH3Jv0y3SCuo/kup8TT5Z1QTolILpGSOJzkxE92EAHdIZ10LVqiM+c3o8VyD5iOWYzX+w9MaB2lhtQlvWI3i6utu9/p5KRNRlB1rBUeXcRHlc3x8y4nh1QVogR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 05:45:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 05:45:19 +0000
Date: Thu, 7 Nov 2024 23:45:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Message-ID: <cgpfc7nmv2qcvk6fqn4kfzb63sbg4zapvyjcwutm6jh6rzuvxl@rc6lrc47g5b6>
References: <20241108054236.3484396-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241108054236.3484396-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4878fa98-6d55-4f0c-d260-08dcffb8875b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VoGi0Y9nKHnvjOsadP9cNLR5hePCS0It+faOQ4MMdv5Bm8mYmg6V5nLQ062a?=
 =?us-ascii?Q?BumunitIm72CfMtMRjFwCssvrB+TdFuT3MYzCmVsvpuAw95ShKQrsGIMGQkn?=
 =?us-ascii?Q?nJbv4+4VP28fKqiVZ4xGXoZimgkt8dGIyB3IMh5sZ9IY2owRhDBQh/b+3i1y?=
 =?us-ascii?Q?/iVaRUvprIpgPiE7Z8GQDCWnVqgwxnUIvcToHptwtMNcb+JLscEyPiqtXwof?=
 =?us-ascii?Q?iTBDrvmfnSuQaUND/SJPEofJG3wwAIKsApRbZ8lsM+7TLz5Py84x3rt5dZyA?=
 =?us-ascii?Q?XELKVS+PrFjKkeGDNT2Pfha9lT+EoY2IyWhXJwTC30M5S9+qYh64OPMrtmQp?=
 =?us-ascii?Q?mQmnDdsGQ9TCzYWw37sytp1gbfxfRsOYxz1Mgqx7HiWpPpQn17IvSqYWKdMn?=
 =?us-ascii?Q?2u0DMIx0qBqIIYkCy+05AL1xb/+lZEpW4j3UgQlUXSygAW9rwDNI8A8LchHd?=
 =?us-ascii?Q?wP7xKPwPJTthSI2vivXmWKGfhEnX6FGIVqXXtxkE1PROC/1W9wQnhr1q3Qo2?=
 =?us-ascii?Q?XEWx4ijRzhAhsWHEr6ZUUpZbKw2h64NRZ9A93vqP5gSnr2/m3G1Obf8n/a1Q?=
 =?us-ascii?Q?Rhb0R2KMd2dFAK36LEEl0wPXdZLNFpiFbVsn9yrrCzW8Cl5fY+qKghEEzyE7?=
 =?us-ascii?Q?/DuF2XHLfi3GEAqeKtbCTV20/Qc/HRXwLbu48Gz5MYWI0iZjLIcI3G0dAuDa?=
 =?us-ascii?Q?8WoCiJbZvGcwX2ZUAztnLRTwWeuIQhj3iqjq2LObsEzW/hW3kJBCUglq1WRO?=
 =?us-ascii?Q?UutVsFUzP5s8JVnz1ZC2kHftqOUZQpnA3TBVSLzT9p0Dk1UHSzHD5toIdvcW?=
 =?us-ascii?Q?ILrOhg7NMYJNWsQYsI/JpP65FTtInpQGAnUKbzrnZQlHJM2F0/jLtei9zGQe?=
 =?us-ascii?Q?HZ7x5oasJk0VbJSG9b6doydNaLFoi3HTQyaollzylVxyivtpdo2orjRvnyR7?=
 =?us-ascii?Q?T8NwxMMsGJeg4nQeeQdo7AlhtiwV7PRTMRN8pvi83Mc7y3kaGoFts247/aA2?=
 =?us-ascii?Q?GyIxU4Km3vVxZsTi6j5rmVlDfxDEEW8PBQtrxJ/rclibg0u5IZRQMHa+ILTy?=
 =?us-ascii?Q?fC79GD6Cud6lfaCR39d28FA/89n6sOKSCalyOaVuiZHMghYKAbRUmacu01IZ?=
 =?us-ascii?Q?XXEGUMsxQg8K7LpizPRhIpPVnCJa+v3RAiEgMlAFmRgo0oi3ZKdbsuij+odm?=
 =?us-ascii?Q?oW8UhlhmRUTBVfk7eYkl6GfHcAEMW4V3pD0jFXVWk3Xj6KDgCf/KtblTa1X2?=
 =?us-ascii?Q?MM4hfcVNkw1MbGBCl1nkEVHjV09z766foisPcSCevwXiFl47jOHWIoI9hPyb?=
 =?us-ascii?Q?yCoaWO3VmQhDHTFXUyHwxt3k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqvc6exTzX5ZCqfOpVxwHpULgqiLhX52ImfxkA+VSQtPgO7ZlZxbK4CYqNkn?=
 =?us-ascii?Q?k3HXHEXypuzp6OdYXRH8HXcJKko3l77ibWdPM3ntz0SCp6ZA81rUpsO9FmzT?=
 =?us-ascii?Q?mno1QzPljQpYUDlu3p5s96IwFhw3LerBZQQ+lYYPvSq20bqDbF5QMOEepXxt?=
 =?us-ascii?Q?TGb2cZzOJEE6ecyMimLTY8E0HhsuAC3ZhKsjcQN76ZmY9DCHi/p7Ydjc0N/Z?=
 =?us-ascii?Q?mvOnr8agTqJK7q2GYPPi0Ccmh9GrvLWBakkAfAcfB/ohLHkyQOV4WtyYMNhm?=
 =?us-ascii?Q?As9trmqYtSCskMNJl2087lh7a/98ycoCbTR4dHi/BpuA2HAh0EE1MwDYeX7N?=
 =?us-ascii?Q?GGqKt+NdDoPA87obFIBjuLuKBNhJ+tdgIPi1/NAw0/ZYg6daJ2HtPp3QM7Ro?=
 =?us-ascii?Q?LrgqY98HuzlV3zCM5Sc73kO4iFMMyHPFbMh3YOg14qA7cczmpGDNxdO9C90G?=
 =?us-ascii?Q?+19Y9YM9OfSFYHqU6FBA1+nD/hAtmWrBUCqQ0SpYftY8kFYf5DSABnZiuSvn?=
 =?us-ascii?Q?LlUTj4SCrqby8W7hSSErNdbLAj79Bf0+b12NiJxsbmwcyE/56yzzrDB91Zur?=
 =?us-ascii?Q?Riquj5ZAMoY16duxt5dp7ho+ld0vT3m1JU4Si3m+k5U9aOsu6H1zgkM+nz2V?=
 =?us-ascii?Q?+BAGk88hZPFcRAna9IaaLv1PDHP8ZHS2YxLlm9Nmlkv+3LeeaAIVOD/jD5nH?=
 =?us-ascii?Q?lpylZsHWf/uhx4B7MklDTNp2wVOtpFCBDYaLCE49PMSJqzwo+EjeAGkG+V66?=
 =?us-ascii?Q?0wZhSfGFCGHqCvGU7quiIUpL+rxACL2PJt09khfLfreB/Kfqj8ylln9RYPIk?=
 =?us-ascii?Q?xZie8zM39TTp0auXLx3rCgqV6G7BSOCdS495K7Upz+Orw+pu+3PX5nZt1sKo?=
 =?us-ascii?Q?jWnLzXgZsfjgPXVeCPPAodTWDXb7ekk9LQ3tjIHCb9mmeot+LO+3JjB6koSV?=
 =?us-ascii?Q?cW3WdPNFpT8i9c6zfTfJgejkvqEhSJadCrYGShU1+MIAPMH2HF0ZUMKpEDi3?=
 =?us-ascii?Q?JLePJMG8oatZi2yQuwiR26v67yfenBcWngDqxmkc2mWMreaEC92qlvMKeA91?=
 =?us-ascii?Q?pZjJPa4UK6Aq7ONDB+HbvvefIJPp3Eh5KAgpwAN9Ve1ljTM9pOi8R++ssasR?=
 =?us-ascii?Q?ZAus79mHOZnij0VmQl73d4faDWl6CWeIwxuAgw8rkSbVAoCuxQ4QZIZoy+Hj?=
 =?us-ascii?Q?5IDCxU8bA9wrfuwyiIX2OuFv/XeHqD9AFUo53RMXnvd8ihkF2wCGqy6e3JIo?=
 =?us-ascii?Q?OgsiUYKqdTIS8WeJ8bzJC5Wl/e4xil3/epdZaxV+CjVwnhqt8q6wRh01VsaR?=
 =?us-ascii?Q?5MIYDZcBnTJI3DbuNjsGTd2gdYXMXHaXJ4b5Bv6odWrpDz6vf5FylbNFmUpb?=
 =?us-ascii?Q?2haKKu+SvmZ6QXj97WJVGzCWfjcJM3N7ofh1LI4Tu2Fvhffo4HAjgXnM2N+M?=
 =?us-ascii?Q?72tcdqxoO18oiXwmTuonohKTfU8/GkHeglqYb2Oz8GkaPJOQFcqvhtc2fNlQ?=
 =?us-ascii?Q?fbo+9zPRCnRvje/ukFS2w+ixYpV4lLRUzNxE9Avc39SJEXuXeOfoHcQsld+3?=
 =?us-ascii?Q?zudEHRzV/UXHuLVkEh++UDckmUxK8/1dtXX9sLz3Hv9zJyS4yVxKqaH+3deP?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4878fa98-6d55-4f0c-d260-08dcffb8875b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 05:45:19.1524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YypL8Sxsm0pUNu0ufeUQIurcDOJ8ExnxW+5JCb/M83P68QtRstypZqPLLj/Y89N7rFLUEJ6HmUp+yN9qr42YPrxevQXg0QeW/NU6ak2dkJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

I sent this to the wrong mailing list, should had been on the igt
mailing list. Please ignore.

Lucas De Marchi

On Thu, Nov 07, 2024 at 09:42:36PM -0800, Lucas De Marchi wrote:
>This reverts commit 4f79f059766c ("tests/intel/xe_drm_fdinfo: Half the
>execution time") and goes in the opposite direction, doubling it.
>Although in some machines we pass consistently, others like LNL
>show sporadic failures.
>
>Even after changes in the kernel to improve it, it still shows those
>failures. Also, the failures can be much more frequent by stressing all
>the CPUs. Raise the period to reduce the error introduced due to
>additional scheduling delays. This shows a good improvement on LNL that
>doesn't fail anymore without CPU load and fails once every ~200
>iterations with 100% CPU load (vs once every ~3 iterations).
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 5fd7c0416..ef9273e2a 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -82,7 +82,7 @@ struct pceu_cycles {
> 	uint64_t total_cycles;
> };
>
>-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
>+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC);
>
> static const char *engine_map[] = {
> 	"rcs",
>-- 
>2.47.0
>
