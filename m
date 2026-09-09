Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09CEC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 19:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6412510E1F0;
	Wed,  9 Sep 2026 19:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xj7ivUMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCFA10E203
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788980677; x=1820516677;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Jsotlar8QizTtqrVhF4/Uf0FR9Hl7Dzyz6xMQBKCZbU=;
 b=Xj7ivUMWfr5Hbzqtx/SRTBKaK4OX/Cl6TYbs9Jea6RvUwLRYPkanSVSp
 GIHSX2nUE+Xi8v538FzOkuez1gg7CQANrF/5wWxJMZ1IemycM+XrX0ORE
 fxI1LCLNbomsDzQq/GQtiMvYmCOksfpWhS1z7yiXVymwQ7jy4o4daB58m
 Ez8O6Shd+QrvQU5cTni6BLsPLiwMSUAx3fYhT4WI+XMhbyO7w20zOn6BY
 ZjM5NCyHZgKqFkRKK9OTob9h+h4R5fuM0rjqF03L1bbQtO7ots3XNzHim
 XL+AzcgWTus0ac2DSV9qL2TVU665TWC8vcC9c5X88GImYW3IdLAm+fJee g==;
X-CSE-ConnectionGUID: LIEDcysqRoeGu/PdrNKXRA==
X-CSE-MsgGUID: pt0yIAHJSnOgEljKabP2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89348756"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89348756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:04:36 -0700
X-CSE-ConnectionGUID: 5GBhrOHLTZOxCuDnjoGvWA==
X-CSE-MsgGUID: S+GfokZIRVCpBQDM0zpksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268822412"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:04:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:04:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 12:04:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl4m5MTuBeVJohphuIiwLlh0lWC297/Ib84juGIcAiG7DG5V9z+Zuwd0IiBqNRfYSG+0YiFE9RqDu5Q79110IMxhsLMRnj2heoXEkkg5yWG8pwHqrHB/FOuYLKS7zJ0Xi9w0wK/KkCOLxpJEVp5IuF3zEW/C09IX0mUXPdkbRLsL+s6HaTDfotjo72YotoCHAeDIDOMjvPE8yN0NOG5mVjjhpKNmG076zKNudBdiP7JqMQ0AtxIHepnUnq4/W8l0dhZaaVyywoWrWU/Cf85GMNLvXwhw+c979K8A2MsZHaRL6wCiOU4H52EiSkGcNIvUET+d6FEJmv0S2Md1zi4/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwE7ucuHTVJNsWg255eWlbfzOzhv8yGaPvZpaJEJLv8=;
 b=LSYAeSgfbw9Nur8fM+kWWTBPud/Ec+Lxbk66xX3u7HPMjosh6CdlrSClIBmoOq9rsYwGFf0e4R+8zIUtPvfn/pB1RexQnjmkToQm2B5lu2Z7g+HMbaRmeU2OHYUv2YYnpf1O/wMqcsI021dLwCM7lG/c9g3qk3sP2HIQ65ORbkCWDPkanoq6A1MCUSwFacZ7ZPIOuKdLpjxs0NWdPBt+/xX29e9aK1PD1siaHOVLlJcU5YHJ5gn1jLigZHXJZgO5hSWVpF9W+7lrQHTUuITMizEq5Pkdsvnx4howaYmzvtT3w5va/CvMQe1kRxCqp2zjXRFVutLQg18we0pdSkyCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA3PR11MB9276.namprd11.prod.outlook.com (2603:10b6:208:572::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 19:04:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:04:32 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/tests: Fix default subplatform selection
In-Reply-To: <20260905200157.3164-2-michal.wajdeczko@intel.com>
References: <20260905200157.3164-1-michal.wajdeczko@intel.com>
 <20260905200157.3164-2-michal.wajdeczko@intel.com>
Date: Wed, 9 Sep 2026 16:04:28 -0300
Message-ID: <87ld9ajlfn.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA3PR11MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8011af41-068c-40e9-012a-08df0ea52ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SAA19rFM0oRn8eI2hpUgt0RgJa5IVl34ugWNGrh02LLodxd0O94SR8iHmo1KFPZcdRh687IUdRBoDnNotQRl6hrdgV0ZlwvVIN0nbS3ErbM3emdRsF3ip+BFvOOiEXSaLBMk2IOLjUfHy0i/e64iMWAnAel3Lhil7UQ5Cev8T0Jxr5uKhS5j1sNJO7AZB5Z3QgY5/tfmHunO3rCP0HYliTAqPOZiQANVqgcLEMVUifQWr9l3GZ63d05xSCtKWxixSIB7jwQVOgrcPoQZp5++RAA70HdOoCCHA9m8iNx4O/dpVDzEoH69c/F8rphMjsZK4ShOeAztDRENWryM6gGJfylM1sznfUNUB08ywBuh5cXWw4Rpy0n4BB54/R2GeM34L4tceDj5aAiZIF5iB3XbooJNXbdH0VDMukPMU8djerX87JbqPsA4qyB6CufaT5vkb7XDWml89vB4CUhHBgzAQrP0KKmdS5U59rjPgwJxSnQ4rLr8YRRhhhvXlwGLNlp7j0DnbEj6fK9NRyM46Xnts1448CjR7VTsrmSwn8TK6ikCqGxrBzFAOPyCHYL2skNrNlXWWupstvxX+hK2aXl6SEDvuVlQOgbzoWn2Zfk5NuWaApcVziPoDOdjExf9s/pEUMDH6eCIO2NJ5md5qBx4NQCupLI+MifIGbDfDu+Xwvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KF7IyqzF7MbJCPaw/nu5YCi1rrT1AMA+ku2lkbuzq92T3VYElAeH0DBS2rdE?=
 =?us-ascii?Q?J63+a9NIHba+nlz9pjGGlXuN5Lf5QU9ervQ9hgbyZpLhid16NtUjV57XDbZ8?=
 =?us-ascii?Q?YN7ETo0BZLN8m5HQt3h78JJ1Kn+O6a1NJ57uTfSj0WBUBJqsTnpf3JdnIe+N?=
 =?us-ascii?Q?gdr8Ecij3otQ1Qmc83nQ5l608v2y2EqyPuRG+HzY95x7TlAx24RpDGd963gD?=
 =?us-ascii?Q?n0AMSHseGzWj9fMsUptEHxCTSQyZ8JaLMbDn9Xg5WzEEyWoOB92BCOabIaUS?=
 =?us-ascii?Q?UBI6uIQkkvFAL3O0RxrJtzSgTOcuXCNqv1pBk78tXwNZ/GYRkHhkOXhbc2H5?=
 =?us-ascii?Q?KH0S5G6Wm1PNznJFrrFxmqw0xjpo6fitMLP1/YvIUWtgBf/0k+epyibfp+xV?=
 =?us-ascii?Q?I0mqd+u2ybkvdNEEYwLOZC2mwV32zPLIq3HdX6yen8JeV23lHuv+XJkKDPEK?=
 =?us-ascii?Q?2sjiJ5NK8qApgc1h6sjbke9biBI9koATj5Mpt8savfJzxL9bAbQfJG93pFy5?=
 =?us-ascii?Q?9ZkpM0vrR1S31brLavUMy4UrcgH6+OCRhV1pOQ+bdp4ZUEm3ay3da8U25XXW?=
 =?us-ascii?Q?5a9hLtADqER89wSJl/lP9iYAyJm1QDSwfGtKLQ7Of+X+Ge3FCArT+rWE94s3?=
 =?us-ascii?Q?8ziFo7eCsHLn9d8j4df+519Anx+tvHU59P2HB28Tu5wlU4SZMNj8aDZdVD18?=
 =?us-ascii?Q?XZ9MIhAWbyLSglcXsRzcamEZX2oRaBHHvl6If00E9lxLUfmLmNbnsZj6lkkP?=
 =?us-ascii?Q?ptrtGI9kCEATzL+PceffngHbpwjb9IIDH6Uq7aJG49NxzuNwCfudlCwHneUJ?=
 =?us-ascii?Q?VA6vddYJY0KF5gt/j8pQIO7ouo0++h1twHNQZKhIjmrMdVWxd8MRo9zTFhBg?=
 =?us-ascii?Q?KpFpHTGhVdjVMfu4Aju979nf8wW/0m95gKDe194RdcY5Y5Yrpl/nWUXc0dcq?=
 =?us-ascii?Q?rNo7DgZBIZKg4vsPsHAjEtWLB6UHtzZKF1vvknkCRj/ThizH3UWvBbT2we6+?=
 =?us-ascii?Q?05IH301p0SdmsP97KP2D6j1Yp96fLDSWzrW5lOGz46KHUQd5VxIiCEVnK/I7?=
 =?us-ascii?Q?vx1Dk+bSqb44ZKIMHTaBxqIX2B4vSry1rLosiyUBo4KSFF6z9VQhP6gP189u?=
 =?us-ascii?Q?zOTsd2ovdkKK6ghwnSkEOcsRZRxfPXqWoxZz/ZqLX07ptiwuf9YBGk2bR8Sj?=
 =?us-ascii?Q?G5l3sAwIdi9Uij6iEoKHiSNFk5lRaNDD8Aeik+BGAUFLMYeG6zciAOzCZTPy?=
 =?us-ascii?Q?nWwe147If3aDhkTNqFBBKA8wybDa1xynnkc852eHeQJbYGvJdqdYJEzo/cnI?=
 =?us-ascii?Q?6qFcQmbVMcaPClLQEii60M1RWXnGMDcJ0tuPB0w6xAS+L3+4c/N4Nz4eQjrs?=
 =?us-ascii?Q?0llbr/0t4Ozj3oEkfE3O3iFVbJ4C5Ttkv1z1QPxOVEevwiZDrQh4OFQHB3lh?=
 =?us-ascii?Q?paCxsseCnE/C7CE5N+cqM5lNd9QtAi5g6pO7bGOoDcsxRw+t+1961qOYXATA?=
 =?us-ascii?Q?i2JDlh/c4xzf7bYMhyec4UuX6poD1S1B1uN8LFNVYJVEHVqU0Q1oQ2exYGjU?=
 =?us-ascii?Q?P6olfL8197OPW0ug6hR5kyvYFlkwORUOXZCLKp3S5IEwPtmafwO+8LXJctTY?=
 =?us-ascii?Q?x0j/tCNUTuYTErG9zR2dOi0d2x3vEg9al0uWcoaDHDI3n05mXxjyR5OAa5XN?=
 =?us-ascii?Q?vfsI6+CnQtS8XpG81AP2WD2wPD2LlTpmNAT1evjzCFDS9qsANxSrFNjGhKK8?=
 =?us-ascii?Q?nNlcBRuj0Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: sptoum3P0Jq4/KK60HoH9yGFnRktq8GF8ehHS+B0tEDR6wlNQpAChZIXelH11f60vdvkG2zvz2wnf8BbASpxyjbNyjgbza+ffUMbTVs8E/UQExZATJaFpIL4e/u2nm4w9mTDFeISPhgnL7FjqTQF9fVV9B3EENO6+2E6qhvrQELUT9+nl7ct+O2cwbZrlDEkAEHCkccLbDH/zhGhp/kgDzXCa/BAawteOEKMZMzG8w2MYJvKdH5xujHTRaVIOuSdWJHaEVaMRME99f+jF1JikoNEw6dlmCpBuzTEe9e1tBUvdEq/1vATI9w93BBkmGMZsgbncoJlq4ZSlY9721IDXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8011af41-068c-40e9-012a-08df0ea52ebf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:04:32.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkdqwXuHJIJ4nw7w1wNzXl95L7ymJUon6hJ4/SDcx1FQakKbAQUe4Xi+MBCb3wXPHp7P7XsTcuiKzHAudnQI7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9276
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> If a test does not specify details about the fake device it wants
> to create, our helper selects the device descriptor from the first
> entry from the pciidlist and uses NULL for the subplatform descriptor.
> While this works fine today, as the first device is a TGL which does
> not have any subplatforms, it will be broken if we reorder pciidlist.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index bb0393475524..a82cab7a2b86 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -351,7 +351,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  
>  	if (!data) {
>  		desc = (const void *)ent->driver_data;

Should we add a comment here that subplatform_desc will be either NULL
or the first declared subplatform?

In any case,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> -		subplatform_desc = NULL;
> +		subplatform_desc = desc->subplatforms;
>  		goto done;
>  	}
>  
> -- 
> 2.47.1
