Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D0C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 08:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79D10E590;
	Tue, 12 Dec 2023 08:04:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1246910E58F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702368253; x=1733904253;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2CG8/b1Xk+PtFONa6eFUOt1HXUb0M+TfEVc9lqZ6CsQ=;
 b=bQCIilzveP9pgLNgLEfLGKhX2h7BOU016o7Gtj98n+7d//dTkVZG2HLv
 x8i2yAZM7HmccqA+U3TPRPfHY7afPGKXYySVwyKVUFshIv4Yj6gLjw2OY
 tkFtoLVeCVAWcTZJyuJFrjJjdcC/AFgDQbDHdWo5kpbnIRzeShK7Bm4xA
 U4IDKWS32u4tvsRWqTI+guil0Htkd9cby4+ojl8xahKqwmhhsrRoiOyYD
 7rJ/Hs+RkGbVI5A6VP+pufm1jvbe2tODvS38GFcc1Ex4K9kkxIJytIq30
 17dX2f2tJnBTwM/rWwTnJ6vHVCVxUmRW8ihnqE3vCX1SWf0Cnn2ljeoBn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="385180918"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="385180918"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="21420965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 00:04:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 00:04:12 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 00:04:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 00:04:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 00:04:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4JhtzIMMjTcYitURv1I7Khi+v0GhyYyM0CqGuoKaon9D0DV4CNzcSXgtibqMfUc1LUKbOtrhAyUFUKNDY9F4bcBqoLjdqKNzPz/IgAXB4MiRDBs6zggincDxS4kWsMdb74SZ6IUYtoTUtHZnCLwGfY6YqzfKBL/bM48HhgatALA94T1Z2PZ01LvbMhhpg5H1UYpZQCdkxiEjN1IhIyc39BZac9B3oqq8l3oygh/gOGeupY5+8Nsygypp9AYPdrubOGf4KbME98KEXAqnlS2np46ZInlRr5CbzuWAg9GJLf89bnEDMst2mlWDrMCSWJWW3iVgsf0phnAW2knxkNZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkfgtR1dmlfLVnvLmjZ677IzugiVnIEV/YYidpJB/FM=;
 b=aBGqcpgZke660e1Mc3JlwYLVXBPxfctEcriHUJY9Y0bzM87Lu4gLDdGxJUrJXe3m8xAd3+LIYP0Z8pSNHtIUlAaEn3NJb2SNSP4k+jw1r5o5YY/VDSYWpmZ5FMM72lptx3pTnBCG/3sUyiXQwHjs/vJ4CHuKzBeP0xd1ZJgTszoVyMP7FyX1KA5RCWdQDSwuGbsIfHn5WZwrkz0icGdgpC0JZk/potjeuQosvtUnHhCIV0pNzhPmzTrzsdHXPzY1nZX6NHkUiabmeqPu8a4SYaPPJc4E2VB5ZLw594ITLIr2/4/ch8cdvaXgW6uKyqBqyjpJqrcfxixdWQ6udVsr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 08:04:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 08:04:09 +0000
Date: Tue, 12 Dec 2023 09:04:07 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 9/9] drm/xe/kunit: Add GuC Doorbells Manager tests
Message-ID: <20231212080407.xx6ebcneiaplnpp7@intel.com>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
 <20231211200424.1703-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211200424.1703-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: c9265a1d-92de-424d-a002-08dbfae8eb4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xR4NgWgxdH2msCLn7YOeZZ4bQKkOV/3XfG6Yhc0DkjV6u3Womysw9+YUaJ8BDThhEvBENpGLUuX4gJDHjWqUDPZMPmy5jf8rENrYYchwZpFYRH11oea4jB7tcooF3tKc0Gnkz97Q+dfwIIvg+lsrhQTgXnCKtGHvD6J3f9AmaG0qO2lGxFSPXMGy80C+mFTwuyuLw4z1YEdxHo0OSraHYlBykXgr5Wr5JvSpg0w+h6jjjfd7lEnNHyU3aQ4+KDb+uaZR/dBtb0UzCZ6PgWKScqRFsk7+MoUdtL6FG0OZ3kCH91RYQGh2kNW5OZwHEIvgxujOMUPcX+nomaiASZWu0EXP181V3fzA4Y0x7BG9RDNeB+39ghhln/c0FbjUk9O9P50p8UYyiD9CkKY9dx3CPjm9UBsRGRei2UTiirEn5bgXmjmE7zyzehVMPT7VujtMYDOAc/A0DMsppmSDBgJTZFSM8NIRvOa96EvyZLYgscEN3OGNPAz293cc5I1f/HVvjHJSoISXKuFRsx/J7mC3uBUgor91515Hw7VW2TwhmsuGaBLrfxTVeYGciGlwcs7h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(66574015)(1076003)(26005)(83380400001)(2616005)(82960400001)(36756003)(38100700002)(5660300002)(316002)(8936002)(6862004)(4326008)(8676002)(2906002)(86362001)(6512007)(6506007)(6636002)(66476007)(66556008)(66946007)(37006003)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Syt1OW1yU2FObnEzdlA0WTY1MWVoazFSeTdiUUxnT0Nuc1NGZGlxYmxiN0tj?=
 =?utf-8?B?U1JZYnJDWmFLRjBxY2VLWUovYXphM0ZCZmxIUCtnNWxXOGkzV3ErQ3U3b0RL?=
 =?utf-8?B?U1ZGUm56YXRVdmdZQUttRmFqUWN0QnZxS244MzBSR3hzN3VTUDNNVmlHVkEr?=
 =?utf-8?B?aHNHdktCZm9BK2p4ODRyVGxETXlNVSs3ZzR0THRCc1JTZzIrNnA1MTVkdEJm?=
 =?utf-8?B?ZVJFSEVlczRGVGhCVm1tM0twZkt6S0dXZVpEWHBzUnJnTUxodlBadlNVZENl?=
 =?utf-8?B?RnpLeWdJbm5IY2IrdU50bFpSdC8rWllUODJWUWlWdzZ0K1p0MWt2c3FETFRj?=
 =?utf-8?B?RExuY1J6bTBkeGRTc01zbDZUemNLL3p1ejR0RTMzVm85YVBKK2l4TzNCYktS?=
 =?utf-8?B?cHArSVlQWGVoNHkvd1M4U2FPMVpMNlZBcXpZOHZFM05BdnhYMHByQkhrR2NM?=
 =?utf-8?B?WFNNN3lWQ2p1Ujhad0hjQVVPc2F1YXppRDdPUFZvSmpvK2hpZVB5NDBwYmJJ?=
 =?utf-8?B?L3Nac1hFcVBUaGwxeXgzYUVTSklKY3NtQ3VsOHlMb2E1aEQxQ0RMNEI0RVdy?=
 =?utf-8?B?TWFSaDZHeDNUdHJHTDkxMjJOY0pzUFlTOTY3Uzh5bjB1VjA4MVIyUzFreUlC?=
 =?utf-8?B?R04yYTFrWk9UdXo1OWxpeXgwYlBvdXgyVDNnS3RodEo3c0dIKzdHZUdyVjV5?=
 =?utf-8?B?eEdWZVZONHNWcVRSUXhMWUxTSWlubGhqVHdBRnpUSEVZa3hlNHNhOVRnaVN5?=
 =?utf-8?B?NndDdGdacnhSWU90bzllM1BVUERwVWx1dDhaVzdWVTI3RTBQRFUvc1pnYmdI?=
 =?utf-8?B?YVNQWEt5QmloUGNydzY3bE1FOFZSbkNiTDNKMTN6bktwNEhIRUxGYlY4dDVQ?=
 =?utf-8?B?blNmNEZ5SzRsbk43SEJrdkIwQXc4RmdJeFpFSFpMS0QwL3NadCtDeWVRb1Q3?=
 =?utf-8?B?UFZTSXYyNjROK3BFQnBaYzIyamNQTmViUHk3cUJNdU0zQStQR2pjZUJoYzRs?=
 =?utf-8?B?d3hQR3NzUDljTUxldVlnYkY2SWJSWjJtclVINnJodlpNSDVlcktsMDJTODFZ?=
 =?utf-8?B?d0JUNVl6bjZOZFM1SFNaRFo1TXhBeDZ5WEV4M1FHQW1PczliU1RrQjJyYVIv?=
 =?utf-8?B?VCthdjlMU1R1Z1UxQnBFanVxc0VySWN0SlUrZ2VHc0VPcHF3VjRUNWtzbHNu?=
 =?utf-8?B?Zmo3RG93ZGRNMHc5YTViZ3I0cVgvL01tTmY2ZHhRbUpDM3BZWEFaLzlsWFJx?=
 =?utf-8?B?bHhZektPUTlSL0Uvc3NtcURxRXQ1RjBsdWQyeU9yZjMvM2puTVpKVkZocVhk?=
 =?utf-8?B?Vk5KK3RFbVlNeDIrNFBZd2YzSlpjYXF6WDRNREx4Rk0va0VoMEkxQUw1MElw?=
 =?utf-8?B?NkxLOUZrUy9qSkpvQ051MW9Zc3VXbGRDVDYwRXYzNmJkaDI1Nzk5NTMrRWI5?=
 =?utf-8?B?b0k1dEhEU29iU2JEUkxBNjZ5WkRKMVJmRzZsUTlkQkJhQVJmL3FDc2ZFbWxk?=
 =?utf-8?B?SUFBdmt6cFlZbGkrTnFoMHFvdzYzK1BKeGxWQUJ5OVRSRUNJV1RqL2dEekZB?=
 =?utf-8?B?TGkyZG5YTFBhYlE4elVhSXNxMy9vQUJXRXBIUUxTV2wvUEd2R0ZYVEdqeXJB?=
 =?utf-8?B?WDc2Vlh5cjg4emhsZ1h6WE00RWJrZ3Y2M0dOSWJFYXp1dzRWem84dU5pdzFT?=
 =?utf-8?B?VCt0ZEtOTERDUllOSjI5bkVOVTIyaXYyUzBuclZZQzBYTzV6RnVtZ0hjdDBa?=
 =?utf-8?B?WEo0cm5YY2IweFl2VXd1Y1cxK21tV0xsV0hMZ0ZYeEpXQit1cDJuNDNSSmNE?=
 =?utf-8?B?MDNDUVRFd1NGQm44MU1ZUVJSczZOcUk2SURYQUY1OE5nSkJHNDQrV2l1bkZo?=
 =?utf-8?B?dE1ZUFg0aGRrOW10Wms0QjdkM1lYcTRxTC9qcXFYQlFyQjhwdjJWYkRYM2xs?=
 =?utf-8?B?TUc1MS9SOGxXK25UQ0FuV2YzMzB0dkd5bWZ6TFlrbGhxc2hEaWJBWjhZUnhK?=
 =?utf-8?B?eFRjNUpaZnpQWWRrNW9nQ3FhaWtEMTg4YmN4UnRvclcvbHVKRktNbC9waWgy?=
 =?utf-8?B?KzRvc2NqZVo3emw3anQ0RHN1bUU1SUFXNnJQUjJVZys5YVFFZUJVa1YrR3Jv?=
 =?utf-8?B?aDdTTWRQNmlzSjhPbzljcmwxZjlnbHZCMXJ4cjVxZVR5WFJRMFlvbytQcTFw?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9265a1d-92de-424d-a002-08dbfae8eb4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 08:04:09.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy4PyyPMC9lMpayj7RHlA/7rLWlF6q/X7YbL4IX5/Dsn4gSxlZTQ7f/yo9a/wTYasWNpSbiGIlEqbeDcFIJg2vY1BGK1KE7gd1k7XYibFBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2023-gru-11 21:04:24 +0100]:
> Add few tests to make sure that basic usage scenarios of the GuC
> Doorbells Manager are implemented correctly.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 199 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_db_mgr.c            |   4 +
>  2 files changed, 203 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> new file mode 100644
> index 000000000000..fc468912db37
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +
> +static int guc_dbm_test_init(struct kunit *test)
> +{
> +	struct xe_device *xe = xe_kunit_helper_alloc_xe_device(test);
> +	struct xe_guc_db_mgr *dbm = &xe_device_get_gt(xe, 0)->uc.guc.dbm;
> +
> +	mutex_init(dbm_mutex(dbm));
> +	test->priv = dbm;
> +	return 0;
> +}
> +
> +static void test_empty(struct kunit *test)
> +{
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
> +	KUNIT_ASSERT_EQ(test, dbm->count, 0);
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +	mutex_unlock(dbm_mutex(dbm));
> +
> +	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +}
> +
> +static void test_default(struct kunit *test)
> +{
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
> +	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
> +}
> +
> +static const unsigned int guc_dbm_params[] = {
> +	GUC_NUM_DOORBELLS / 64,
> +	GUC_NUM_DOORBELLS / 32,
> +	GUC_NUM_DOORBELLS / 8,
> +	GUC_NUM_DOORBELLS,
> +};
> +
> +static void uint_param_get_desc(const unsigned int *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u", *p);
> +}
> +
> +KUNIT_ARRAY_PARAM(guc_dbm, guc_dbm_params, uint_param_get_desc);
> +
> +static void test_size(struct kunit *test)
> +{
> +	const unsigned int *p = test->param_value;
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +	unsigned int n;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
> +	KUNIT_ASSERT_EQ(test, dbm->count, *p);
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	for (n = 0; n < *p; n++) {
> +		KUNIT_EXPECT_GE(test, id = xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +		KUNIT_EXPECT_LT(test, id, dbm->count);
> +	}
> +	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +	mutex_unlock(dbm_mutex(dbm));
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	for (n = 0; n < *p; n++)
> +		xe_guc_db_mgr_release_id_locked(dbm, n);
> +	mutex_unlock(dbm_mutex(dbm));
> +}
> +
> +static void test_reuse(struct kunit *test)
> +{
> +	const unsigned int *p = test->param_value;
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	for (n = 0; n < *p; n++)
> +		KUNIT_EXPECT_GE(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +	mutex_unlock(dbm_mutex(dbm));
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	for (n = 0; n < *p; n++) {
> +		xe_guc_db_mgr_release_id_locked(dbm, n);
> +		KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_reserve_id_locked(dbm), n);
> +	}
> +	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
> +	mutex_unlock(dbm_mutex(dbm));
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	for (n = 0; n < *p; n++)
> +		xe_guc_db_mgr_release_id_locked(dbm, n);
> +	mutex_unlock(dbm_mutex(dbm));
> +}
> +
> +static void test_range_overlap(struct kunit *test)
> +{
> +	const unsigned int *p = test->param_value;
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +	int id1, id2, id3;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
> +	KUNIT_ASSERT_LE(test, *p, dbm->count);
> +
> +	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
> +	for (n = 0; n < dbm->count - *p; n++) {
> +		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +		KUNIT_ASSERT_NE(test, id2, id1);
> +		KUNIT_ASSERT_NE_MSG(test, id2 < id1, id2 > id1 + *p - 1,
> +				    "id1=%d id2=%d", id1, id2);
> +	}
> +	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
> +
> +	if (*p >= 1) {
> +		KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, *p - 1, 0), 0);
> +		KUNIT_ASSERT_NE(test, id2, id1);
> +		KUNIT_ASSERT_NE_MSG(test, id1 < id2, id1 > id2 + *p - 2,
> +				    "id1=%d id2=%d", id1, id2);
> +		for (n = 0; n < dbm->count - *p; n++) {
> +			KUNIT_ASSERT_GE(test, id3 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +			KUNIT_ASSERT_NE(test, id3, id1);
> +			KUNIT_ASSERT_NE(test, id3, id2);
> +			KUNIT_ASSERT_NE_MSG(test, id3 < id2, id3 > id2 + *p - 2,
> +					    "id3=%d id2=%d", id3, id2);
> +		}
> +		KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +		xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
> +	}
> +}
> +
> +static void test_range_compact(struct kunit *test)
> +{
> +	const unsigned int *p = test->param_value;
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
> +	KUNIT_ASSERT_NE(test, *p, 0);
> +	KUNIT_ASSERT_LE(test, *p, dbm->count);
> +	if (dbm->count % *p)
> +		kunit_skip(test, "must be divisible");
> +
> +	KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
> +	for (n = 1; n < dbm->count / *p; n++)
> +		KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
> +	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
> +	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
> +}
> +
> +static void test_range_spare(struct kunit *test)
> +{
> +	const unsigned int *p = test->param_value;
> +	struct xe_guc_db_mgr *dbm = test->priv;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
> +	KUNIT_ASSERT_LE(test, *p, dbm->count);
> +
> +	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
> +	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p + 1), 0);
> +	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p), 0);
> +	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, dbm->count - *p), 0);
> +	xe_guc_db_mgr_release_range(dbm, id, *p);
> +}
> +
> +static struct kunit_case guc_dbm_test_cases[] = {
> +	KUNIT_CASE(test_empty),
> +	KUNIT_CASE(test_default),
> +	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
> +	KUNIT_CASE_PARAM(test_reuse, guc_dbm_gen_params),
> +	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
> +	KUNIT_CASE_PARAM(test_range_compact, guc_dbm_gen_params),
> +	KUNIT_CASE_PARAM(test_range_spare, guc_dbm_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite guc_dbm_suite = {
> +	.name = "guc_dbm",
> +	.test_cases = guc_dbm_test_cases,
> +	.init = guc_dbm_test_init,
> +};
> +
> +kunit_test_suites(&guc_dbm_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> index 15816f90e960..c1c04575d82d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> @@ -255,3 +255,7 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
>  
>  	mutex_unlock(dbm_mutex(dbm));
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_db_mgr_test.c"
> +#endif

It seems to me that these tests cover the new functionality and I think they are correct:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.25.1
> 

-- 
