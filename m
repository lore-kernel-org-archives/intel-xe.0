Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E64FC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 19:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BBA10FF5F;
	Wed, 27 Mar 2024 19:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQtJ1qGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E310A10FF5F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 19:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711566141; x=1743102141;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bJXUKBwtVN0Ag8Rg4SiAbMv7pJ8xwLDdq3pV6VLLKEo=;
 b=iQtJ1qGFFT5vTZADTjZmKMM+rZNiE/Labr50XKa67PgbB3Cr9q5zJog7
 f0XZsd3zWCJP7HGamBjn3f5QUDYw+WUQyvaCJIH18E5mjAnSzzVdHC4TZ
 UfZBznGWRvBFtcqpTXA/+QD12S1KhWMlY4VUnWIBDxUYvcuTUBJ57Fido
 i7wwE1cniWvFcxY/2AnunAXmxk0YhjeVLdRcxBnhVGhJY8vi1yThsj334
 ZRi3hvT46bKDEyb7CKUCi8+DMQQF8yQazU9DM4PJrT2ba1dWB6UeSdFkH
 AjwXwLo98L8z2Eg4AFiuVnkv0UfsC5BLjeVwI5v3h/yfR6YmOwsfLW99p A==;
X-CSE-ConnectionGUID: PrwoZe3RT/qyAnbvyE4WeA==
X-CSE-MsgGUID: RfYOJRu2TWG+UsZFCSoIyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10495702"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="10495702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 12:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16406153"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 12:02:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 12:02:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 12:02:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 12:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI7P8Spp1v4SLnph63ex7yEMUwX5ProaFAmfbdbw7PdGAFJGOSUW1pAnGX6mGvFHOseVC9fHwTgitIKMiz1kWDVnKpKPrQv/qoEZQ/ql9/NfxIvjvQSeK96GvieeaPHtLmABEm+zWY6QRjjSwQElNhE+CZ7ZmpDJ9MnynJ0eiabOv5DYno88UGTSItdad8OxQLa2nZkKx2GcmkB0Cear7ElSqvsuLqnJGDfKWE/dFNGO587Dm+Uj0NA+UIB4NcgMgpaemeTaWIpQThS4XHHa6XaPu5E0zOlKHUMIRrWfICTfsju9/J9jaTaBv9FKstFVtxUhnQSy7LUCNOyr9WDQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4jo5+d+NJAzZOrkaHXoERudxBRYThGycbuzLBG4IgU=;
 b=c6uLECQ7eUafOwbRIhIvDMtdXuoRIEpsgmE9eDcaBuYzWbLy+xp3PE7AqBjl+4EnojC0srePwo0CRL/hTifqZ5nJcYtJVIJ1viNnX8X0MojzE3OslMwrD27rnZYykmoevwGkv/6nCIsMCX8RiMSCseG4kLiiSnV/X/qBpS47Hq1QTsJBssUJmsRcZNmyknJRoTYkJL+GTwYaOhCjq7lfS2RkumFUYWyHuKEh4u087S7JoL0a3aFS3cJEg9gCZTGdK6GoXQhw8hvzXX97Z6MxZgQAUNyEFA3Io7jACSqfq3KOsjKJdtA6d7udY4cEagaUXVNJOGoQAQlZvMwFLub8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 19:02:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 19:02:10 +0000
Date: Wed, 27 Mar 2024 19:00:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/4] drm/xe/kunit: Add basic tests for GuC context ID
 Manager
Message-ID: <ZgRs4xCNcTHoxHxW@DUT025-TGLU.fm.intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
 <20240313221112.1089-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313221112.1089-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e74c644-a04f-4324-7311-08dc4e90671f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4g5eqMtZ5numsb8lydoMTDdek3CWNzNr6PaaJRlcDGqSDhV1ioBRLBcaVGlx4bucrKfZuRwvOJJT0QMs6B7inkwnYsbBajhSis1k5sL4rBurdn69cUUVeLKQpuZYns2Oosa9G0Vtn5GqZdoNmG0GyaAkIkPN6aP7H09MZPP96WEyW5YUyL/1Q4nzuMv0Tp3F5lFyK2PBcFPnebNriaRsvuMcj59JETD3nGSOLBfL2IR3cQzbW1tkihobOjJMm4gHEYUpcRiXcH/ObIbqILXH6CChVnEpT4HR1dPri9XRD0D/XBQR69P/WaBVXNpFzVV+43YKViocRU4UDR55rodgOJ+8MyqtBW3UW+juPJBwyzOT4Viet8ioNdFWnm3rIgsKW5oflTqWK3IKkT7QrCJyqITxx6ubwmHXN0YdeJUyi1kJl3nFBvW3hsyb+JHcvb22sG8wtj9XoZ+WeLTnjJyIMzluJ6o+z0C5/ntQqOCQXhPoSwBbPOosqu+DPmeXrz2tul5eiPO8tCqBGofHNbl0j+FoZ+eLlWpJBwVG7aKydsCMTF5zX8Oj/jYmb1zlwjDjy/21ltIKMJNganCqcHxTYfKf/yJmjAdFJpT2H6kuu6pEtexjgflasv9+Fd28+/QyajtyJiFJitSBDQWbLJnW/L00byddrsGTww5S/oeeg+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uqlvu8EmEKgjz3KMJ/ueI11r2Kl31fV3YI+uyozPpzciUKyeLQmh918sLh?=
 =?iso-8859-1?Q?J19e7ybcZ/Fd4Ll9q2ly7U8VmJW+qg/mNdfs91Jy9pKgZu9zLmd/3ndMmk?=
 =?iso-8859-1?Q?CAViwAjtAPUuqC3xSy8AwuhBTzYbLz3XjG6A52JQXZM0qULueJCavQELxs?=
 =?iso-8859-1?Q?TiDYHmAMS0q/zMx5C5cytPGNXjwEXof76ii/WwrPY41tImKl0Nga6ZTa0O?=
 =?iso-8859-1?Q?zSmIEcjwv8o7A5WVA4OcUiO9/7/RDWGZg3Rhurin6+MXMFdJrNM/bUJl/f?=
 =?iso-8859-1?Q?0ygzF0Z+9umUwJ5VyrSUEoWx92GLZN1JQ7Gan0WJ5TZNerPZcSA49hti5f?=
 =?iso-8859-1?Q?pG4Gw30JbONpv+eT5z7K8bUxfOPc7I+ejZE2yk+gwHqv39AGkhbSl9+S0c?=
 =?iso-8859-1?Q?+MppvaEUVmGXTKlKku4x29+P0rafLb0r1P4S50/TW1FRIX/hbmOftAqP3O?=
 =?iso-8859-1?Q?67kLrgbB2wtQRb5myk4NtAPU9vq6ZXZ0DOraUIecdQSMkQgUWU3f4Li0Yr?=
 =?iso-8859-1?Q?OcUMXkH3XNeO8CaN9yN/NzYDy75GYlgDFjhioh3g2GkdZXAL87f3pgOEnf?=
 =?iso-8859-1?Q?Y8t7g7KgpD3xtQLfBBIUecFXTVw4B084ObFeMlw7FYz3KwZfNAosps4VXO?=
 =?iso-8859-1?Q?aiD0M8FhDOZDRP7tTA929JBG79h0TVDKjEzKXZnkQ5H595BEEF+1KNcbdI?=
 =?iso-8859-1?Q?XRNcPBJASWA0vqf+5fWuEQQ8Sj1VLvB60ChqVf76ZDuBPuksdraICvilCN?=
 =?iso-8859-1?Q?haeWkKEkVhzO8pYBrFLubeNVM7XycLbGhM+IXcVHrpBzI0p22aO+MJ1pxL?=
 =?iso-8859-1?Q?rVulUYqYsIlmvxqhRHBNoYJAJJFl0XfM8XsNOOS2s/l5Z3/T6NT3rd8U7G?=
 =?iso-8859-1?Q?UR8Mi37oeGrdXrsORCGxTJdqx/riWwdxoIVw+lijylgIat8Qb2Wtq6MFk8?=
 =?iso-8859-1?Q?9wIwsPspSlRLT/ojvIucErHw+h2qnskJ+i7hL6X+iS/gCNTsxAu0ikZMd7?=
 =?iso-8859-1?Q?G6fRFUlYsW+HkLRtam9Zo6OJm0MQLWQQfXvOqzCf6mPtzuFx6j5nfcaBMl?=
 =?iso-8859-1?Q?103OVKX+4MNK8tVItIdqpoG7K2gO/nX7S20YYeTMLKopCar0JxRVMP6t6K?=
 =?iso-8859-1?Q?8KD3Rh4AiLf8OcK80Mr/pt+ASpH38M7TTEwHwxITTQ+weJr/dbwx+GcbTL?=
 =?iso-8859-1?Q?K9CbN2+NtkcsZdLJYsTgtEKaLyS7Pxbx+KfD2B0615OUAJoRjSvTTEWQx+?=
 =?iso-8859-1?Q?QLIbSksZxZdwxrWXkq8UywfIw1C+haFrBQCKst3ZXREUZc5x4OUiiBBTZ9?=
 =?iso-8859-1?Q?6uSYCuizYVyO7WMuNwevnFvHkq2QiWPAG51RKqKNbcx2JGaWJGIslR2BbR?=
 =?iso-8859-1?Q?HFWKPCNbK8bSg+bxcicMPtu4zyneDovi47eb1B7kNXB8LujEEwV+UvCN8p?=
 =?iso-8859-1?Q?HtEMbLSfYFZCZ7ai/ceBPYmr1EemE/84U8PQrlSfTLak3z6NxZeDp/o+f7?=
 =?iso-8859-1?Q?e4hXl7Q9o4Pn7JSz9dsp/0ye0xFqi3y/LiiWBja4Novo0quqzQt/8Oiaob?=
 =?iso-8859-1?Q?coIYw3fXfwtTxj8yItFt0J1KWWZ7Wio3GmOaXVn1DflMyGBomM1MWi67k2?=
 =?iso-8859-1?Q?aZHhAldq/LFTLBk4XzD9S98qTg+KMrPMkC5PW0CUHBjBgxmYS6FiXEkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e74c644-a04f-4324-7311-08dc4e90671f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 19:02:10.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6+3ujLfUc1d/doAH196efvJAEyefJxDA/kD7NKH86qEdg53/2Q2S9o3AgNfAGP6Wrasv+V6LwsK5A5edFdzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
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

On Wed, Mar 13, 2024 at 11:11:11PM +0100, Michal Wajdeczko wrote:
> Before we switch-over submission code to use new GuC context ID
> Manager, lets add some kunit tests to make sure that ID manager
> works as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: rebased
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 136 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c            |   4 +
>  2 files changed, 140 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> new file mode 100644
> index 000000000000..ee30a1939eb0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +
> +static int guc_id_mgr_test_init(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm;
> +
> +	xe_kunit_helper_xe_device_test_init(test);
> +	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> +
> +	mutex_init(idm_mutex(idm));
> +	test->priv = idm;
> +	return 0;
> +}
> +
> +static void bad_init(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> +	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> +}
> +
> +static void no_init(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	mutex_lock(idm_mutex(idm));
> +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
> +	mutex_unlock(idm_mutex(idm));
> +
> +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
> +}
> +
> +static void init_fini(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
> +	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
> +	__fini_idm(NULL, idm);
> +	KUNIT_EXPECT_NULL(test, idm->bitmap);
> +	KUNIT_EXPECT_EQ(test, idm->total, 0);
> +}
> +
> +static void check_used(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	for (n = 0; n < idm->total; n++) {
> +		kunit_info(test, "n=%u", n);
> +		KUNIT_EXPECT_EQ(test, idm->used, n);
> +		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
> +		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
> +	}
> +	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> +	idm_release_chunk_locked(idm, 0, idm->used);
> +	KUNIT_EXPECT_EQ(test, idm->used, 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_quota(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	for (n = 0; n < idm->total - 1; n++) {
> +		kunit_info(test, "n=%u", n);
> +		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
> +		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
> +		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
> +		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
> +	}
> +	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> +	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> +	idm_release_chunk_locked(idm, 0, idm->total);
> +	KUNIT_EXPECT_EQ(test, idm->used, 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_all(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int n;
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	for (n = 0; n < idm->total; n++)
> +		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> +	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> +	for (n = 0; n < idm->total; n++)
> +		idm_release_chunk_locked(idm, n, 1);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static struct kunit_case guc_id_mgr_test_cases[] = {
> +	KUNIT_CASE(bad_init),
> +	KUNIT_CASE(no_init),
> +	KUNIT_CASE(init_fini),
> +	KUNIT_CASE(check_used),
> +	KUNIT_CASE(check_quota),
> +	KUNIT_CASE_SLOW(check_all),
> +	{}
> +};
> +
> +static struct kunit_suite guc_id_mgr_suite = {
> +	.name = "guc_idm",
> +	.test_cases = guc_id_mgr_test_cases,
> +
> +	.init = guc_id_mgr_test_init,
> +	.exit = NULL,
> +};
> +
> +kunit_test_suites(&guc_id_mgr_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index bee49bc908bb..0fb7c6b78c31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -273,3 +273,7 @@ void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int i
>  	idm_print_locked(idm, p, indent);
>  	mutex_unlock(idm_mutex(idm));
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_id_mgr_test.c"
> +#endif
> -- 
> 2.43.0
> 
