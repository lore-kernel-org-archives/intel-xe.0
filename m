Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA634C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 18:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4E210E4E4;
	Mon,  3 Apr 2023 18:45:24 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A710E4E4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680547522; x=1712083522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KzlMBEzpwx+hqNnweYF+z2zUQWmvwpcUk7h1VukNuIQ=;
 b=B259m030ic2j3lNQLtBP4GagdfEBkUVZUAZCNinLZAYoxMohRuUKPwef
 /PsdFvUs+Rl1uDzYleZAAZdTWyEEkkbeRxTNtj831S9Vp4pdj65J/0w3Q
 zsUJrKWx/ZSQ8Q8SgVUcpxcv88CEwNIEJ4hXluDD4xFbg7spUpDwiZgZA
 5o6frtaYv0ZIeJ8n1iHeLZC88xfSkMaPvcd7quUt0Cj3tE5la+y2lKIqW
 yrtj1pt4ThyG+++XqTB5Hjx09F3JFRRrP9hxFjQjpvh774SbX17gdpmn4
 2seoEsUaYCjsCHmLHBC35llmZ1ERDjfVvjMHmKSXAt2jeHlwY9cyfQBgl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321647262"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="321647262"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1015822285"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="1015822285"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 11:45:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 11:45:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 11:45:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 11:45:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 11:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ3p4fZxSYMrDSjiZ7Pu4zvPRV5bYj8o0YLGNxTTyHIFIOtOMJEhNGvmtswzNS3TImz0cCtCw8KwYGHGysPdIG+glpT/c/CjyYrMcARbWDugG+WmY8HmFwh7/Pij07q84KrFyFGv1is6g/p5ePxwMZbUEXQL9PyOfOPzPhloCGalqypMMsLEhyY7/uL71OKEQx6LsrxxOzpGsCJiMVoQxOKYKYPuUqb2EmtXtbEgvJOBFlneaOskgMpPcVThQlehpPm/8M+X7lAdIpgMNiurjr8fXHlBuDgX0WLG9eznSh1hmLPxw2r2i5q8RoJ3Obth3TbZ7+yAlDOqnWZS5QlvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5zxtHlIpZsIT6Bl5csT413V28p1MJO6xntUaYmrlH8=;
 b=mBJyPJ5B3f9ss/Q0Vahah0emzOzhwWylwucd0UY6aOAjZHhbsv942WdM064h2j0sgOUuedRaum0bL89VnBbAoszeDScw2j5TRSm7EVIRgTq2Q+i2qs5kMh+/rqyEvs9sTIFYz4Y4wlDmeE9l8oSrmTmJQKbWZJfYV/b6p+wCGD8+7RyXEv4azRc4v0pC65pFdSd544f/8q0z17GWhMH3ETM8OfCphPFhtgRVoYSp6G7EeoyEsq4EEogCU6DtWAdLo5FdMrhd/349sFbrDoW6KOIjiJSKSp1pIsqevPyZKmIADwZ5/ujXpoUq8+U0K6+elSyZm4VeWVd4mAR9y/1D6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 18:45:19 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::7a0e:68ed:70e:3c8]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::7a0e:68ed:70e:3c8%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 18:45:19 +0000
Date: Mon, 3 Apr 2023 11:45:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZCsetrriwTHreQxO@nvishwa1-DESK>
References: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
 <20230401030300.22568-3-niranjana.vishwanathapura@intel.com>
 <20230401053858.5p2pttr6hyugdqwj@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230401053858.5p2pttr6hyugdqwj@ldmartin-desk2.lan>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 75909cfa-0470-477f-4b70-08db3473929e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMlTO1/wnKBV1H/5IxLSmcOakf0v7FOFnzsKLDrzPoolRbjfxey45fjFgNHRuSG2VXqjOKVSrQ9qPRUsJAs/kGxl2aN0gNUrn1fXprDLAnndhrgw91Z4mdPfbOPqrShzm3wQ6CemSmiL3vifOw0BYRagByATodFmI0P9DxlyFbFHttQXl2jGPWP5i8D73HQPlRN2jMcl0BY5Tu+Vsoi6Sw5Em3bD77i2xlZ0JxhYgEjFdIYXfkIYHc2i284jjwTDIpbcn5sABuCO6nO4X38VJ3HcpnuIOt74090FUwsQE3bqC3Xly6zVj5pNak/iwEFZzAypDaBjghVSqKpLcjNgGtLF6paTXERapSv526osIsPYSnSvUhJ713DbMephInYomY68KyDpmnYax1m9lplhm+3Is/tEysRwYlY8T5EcBNnZHwLIld1SYPAIYWgU4PSgx3lVGPyWHOy5D5CYvQm6H+/UvSkHtH4cGAqd1AY7ifBribBIwiwqRFa71Ojpv4o6ppnADlcN6nIYPp10hFWBoHEN3GZ+W/l5j+plMYIj+yi8o0eLJgQufqzWX1y262yZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(4326008)(6486002)(8676002)(66946007)(316002)(66476007)(66556008)(6636002)(478600001)(6862004)(41300700001)(33716001)(8936002)(2906002)(44832011)(82960400001)(5660300002)(86362001)(38100700002)(107886003)(6506007)(6512007)(186003)(6666004)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7pqpqkpf3VOpkKKgEBWpNMgC7qUn9qrNK+S5sd2l66ETkQ6dmikCQpOkr3KS?=
 =?us-ascii?Q?vyzgjURowasM/Uh7MCRv+Ul69PFxz4tO0nClF/VG/gneXoRCzdyteA1xuUk+?=
 =?us-ascii?Q?qNehRAp5X36xw9tsEBBymxRgMPsw5DLjuy3pLu0ccVWh0rVNv1eYHXxlF31y?=
 =?us-ascii?Q?sHvDYoljuKR3c2D7dwEFVVlO5h/IuA1yrJxAETRyq/UJA9xsg3147baygLPs?=
 =?us-ascii?Q?0bYmaRpRAyq/LUNKVsA9JFX8pVNwKFAI7KULa4wsnEQwue737AV8ay8pNTk1?=
 =?us-ascii?Q?r6mjDG8ifUCp+46yiEp8Lyn8dV+9qnNlVjfu2pQQLXPY/lWGbuIibBK/tYAh?=
 =?us-ascii?Q?F1jdV/1RXlmWls0WRgTnkVSK452m+WbfePGvsf3Y2fcYDOkWiTL2IPp7G8L+?=
 =?us-ascii?Q?AQdIA/Ls8hqSEOiNT77X0kOouWGzcxTSoPWeDiWPAjRxjZ2Bfr7XXmQ2AsDY?=
 =?us-ascii?Q?KsUndUJLrwanNkIXkXBwMzqYwgjYWQ6HLuIGgJG4h/hPSfPD/tz9fqfrsdgB?=
 =?us-ascii?Q?snn5XcrIl7wNu4a7NcL6cu3LNEHx9tkTbim+SFyd64Bf6aOfxL+ChYC1hbxU?=
 =?us-ascii?Q?Sas8r05KhBo4LrfY9Tye8xTfQzkaYoyP+XHAzWwALTeOUgRH4abQRZaFOSjo?=
 =?us-ascii?Q?LR5LRxalwVvlLiWVVb2gvQOvHWMYjRh7eWkqAmFTCLWWKDO59H6468hvGq7Q?=
 =?us-ascii?Q?rtc3jzCeKN4fc9p9jGYE5PMnYkm78apIXyw0KvVGMUp9ewRgpBn0MblIT7Sp?=
 =?us-ascii?Q?3N+MTh+V2JCUBH5R866t+Bvzw0N1P7Dk63Ebszvuxd3QlqjepbablGYR92jA?=
 =?us-ascii?Q?ARUh0jKkX4pdyRKoTCl0SOxLFBQtoZzjJsReOnUB+rfr6YWqgIAeCwfWQ0Dq?=
 =?us-ascii?Q?0G1VjgQzBxLCslXJOtxWJsgJk6wyChVEPbdmtT8W4eCYYFpiJW0SDbHQbgTi?=
 =?us-ascii?Q?vOJTyyyjmBgh48qx9hw3LRGI118tUyJsE1TsJNrEwMMSHh7RaFdPSOOL8sMw?=
 =?us-ascii?Q?m+8wq40l557S6HuWTlUlgBzkUHT+5YEQs4HyU2mfWXfWFNz84Rxs1qYoZiel?=
 =?us-ascii?Q?GeHQNUKlqErm+Z/9W3SIJGUlP9KYG0JhKgJQ9J6wG8DhEW4I/69XbxS858SX?=
 =?us-ascii?Q?XTtwdjs8YwQnVeajtP9PYJVAG28/GjZPUQv9Auj6CqeQKcx6fl3dNCt+J0Ky?=
 =?us-ascii?Q?T6LLniU2BUFsfwCJJtWIetkOFmpLD9iHnW2C75AHKSu35rbk9WZ+DzSgp+RI?=
 =?us-ascii?Q?e1s0kgEV9M95K4+7MNksnTMU01lNwIZ65o9bpTHkaSdBwlN/ccCxR3bssCPS?=
 =?us-ascii?Q?KO0JuHRidgyDDQ7Q+HpSq5Qiz7QiLik+V3nVtMyJjEF3k15EGY6hzxbAs0nE?=
 =?us-ascii?Q?wXcNt3tlctUdUdxwjrKHkhVgsNhzSJ7Nq5V3uMfi8vcoGxS08SveZzaoomsG?=
 =?us-ascii?Q?3Llp2hqWw4GpIwpGUhjEdhfnXqdAwg/XWVcC05+aIiGePcS4xm4TAXcvxxJ2?=
 =?us-ascii?Q?8ooYROG/1yrZcDKDEdV+WXQTvyUE+T1L2YhMWPsaAHBIzWbA9fXS9TsDQ/Cm?=
 =?us-ascii?Q?sUSe8K9CxJlu+vajPtDwZZ4qSeqxTlgW6yUL8aznBagG5WJyIX3tWwJ3cyW0?=
 =?us-ascii?Q?LRz2rvflvI6Blg7aYFS9fTY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75909cfa-0470-477f-4b70-08db3473929e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:45:19.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8LQ4a0KVMg6wBa5SiLl8TCqtvGYa8U5nOg0eviu8ENgtbOgCVESM9evXVK3kVzn6jM0ESt/mZasp3ksmVD7KF/UssHCzBj7xNat8euTLgqklmaCyrLAWuH0ynOIA6rh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/tests: Set correct expectation
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 10:38:58PM -0700, Lucas De Marchi wrote:
>On Fri, Mar 31, 2023 at 08:02:59PM -0700, Niranjana Vishwanathapura wrote:
>>In xe_migrate_sanity_kunit test, use correct expected value from
>>xe_migrate_copy() operation.
>>
>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>drivers/gpu/drm/xe/tests/xe_migrate.c | 1 +
>>1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>index 90f4e1c4f029..862d11b2210f 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>@@ -147,6 +147,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>>	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
>>	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
>>
>>+	expected = 0xc0c0c0c0c0c0c0c0;
>
>Fixes: c1a4e05c9aeb ("drm/xe: Stop accepting value in xe_migrate_clear")
>
>as the expected value was not only used for the xe_migrate_clear(), but
>also for the xe_migrate_copy.
>

Thanks, updated and applied.

Niranjana

>Lucas De Marchi
>
>>	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
>>				bo->ttm.resource);
>>	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
>>-- 
>>2.21.0.rc0.32.g243a4c7e27
>>
