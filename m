Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E6C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10610E09F;
	Fri, 29 Dec 2023 21:16:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DF410E09F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884567; x=1735420567;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HUeGQShWKWloISkpU79BWOV8bVtY+evMuszk7DsYxUs=;
 b=R2PizUPFqkn8zZP+w0XLZq5NyVy79oDUf03Ks90HmaGN+RzeuItuT9Kv
 uFjlK3n8Xk9yVfi49/z4aaWt04+qFDFATQwDE2n/v2dQOko2jrHj2s+dS
 KO68PSi1KPHFgg6OxeH4XeJJPwshlKVVsbI33D2mtueh1bKMZEa47E3aW
 RxmfiXDKziNW3tdLLsC7pJlbdwZq8XwMI0iyBFipMVaNSPXZNSaRCyJ9/
 0pHwjvzkrJ7CtNTjmRU6lP8csHMSU4/8510SCu1/Ff9kF7sdsti42Jw8D
 +ks/cr77ZTmJgnua9DG6gmJej/E4IsFoNOkkBmhYi9pst57Z1pxO1BXUp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="399453280"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="399453280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="20962987"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:16:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:16:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:16:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWZh+niMDADKWnX++/QX7ebNsLc1kBzwBWsZlksGzxf0okDUq8k08KAdslUaBwmttFSJREU3lM2MqsZ6uKZzCWud+z8ZZuYydIX2sMjuXbVhYy61u6sSc0L7/fcsqCjUFlDqlLO+0JNSu5rBl3buzIYFyyKP1lQMeO8UoeGouosR2zvjfiLoKfZedKrfVDvIOPCy6BfhitqUrM+a1dAfL9CSvIXjjBxfTFNVrYzLFh7tLEfEz/bnhbLdn+bOgyxANW61gGvfzd/62gtuR470eWL6wWhYtRP3kIyb+3xer4fleMmi1XxX+SyUct3lxkFY+DDeFw+nOFUENUL7u17pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7SvqBqwxaBZnPtqpam5Fpn4mloSorPGR2tM1CWFhlg=;
 b=CJ1VL0cD6Q9uQyZGxguhKLs4JZ5sZT/cKOyEYs5FaEO9eHbGT789jwSf1jY7olXuUkRa9Nz66s/64Ejus0kD59puf+/nCfMHeiof4uoBusnwNuGb3ojkbu+IntB8jP9HBToD+NmQLkbhkEWOxyjI47clvNNLsbM3O0lEG9ZpGfSkacaml7GAnCx+za0qX2L0SFoi4syLyypOOhPCAGiBA7ayZQNaWyu9nqvlTZpLK+yVhpB1q1zWSIe2IwfzOAT447OjhrzhkrIcKRctSQSciB3WYR0cgY+iJ7H1jf1LG959dSSdzNgPAeLet3QGGlUi3EwN+Kmo/DfHl7OpoZuJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:16:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:16:00 +0000
Date: Fri, 29 Dec 2023 22:15:58 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 09/10] drm/xe/kunit: Add GuC Relay kunit tests
Message-ID: <20231229211558.l76buxynegwhq5t2@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd910e0-a919-4ed2-bfb0-08dc08b35b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJAMEuG1Ibv0Ti3jwe2qFN/wqv1FmSQKARft0+Vabz5k7rRg8V0CScE2XYtlkcG8nrWzww64TmF1vSurz60g+SRcGOy5JfhlQyEx/fSvxbm3luVV+B7irkc0bu0o6Ca+WktZG6gYvLTKIrl/HbL6y4HmO4W4HuPxgkOcaECB19ncw4EISIPb8GniMvWM9iR2P8w4zM4PTczMpcrayxa7d7hLlT/Opw6G1d92Z6hwOXtdfTBWWBGpWfeSXejG77VfoR8rNRUaHcAb/7n9qgiz3lqvGtWKwf6lHXyDWIIANWxtwsZ18tC7VbGHgQoJouvgeo2w7G9jBNWwFsg+7yDiN9MSQFMhsL4p2sqdteHgldU28NQGNLeEXogqQHzuA0+yTlUz9z007vO2Q2xDLQ0q1AeO5rXkfHd59VhR8QOU5Ix9Y58hhjpWe4NBc7MGFFU1ZVURo1x5nKFG/gkuogzcRhnbadEFn9RFtSLRfw2yLstlvVWrZXFYJx3Y7DZfKnqGTZobIoP4Q6pbAb7M6bU8v+Xy4z5mYQ1q9HLlEl1+V1OnK2AMbyLC6Ovs6EkXb5UZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(41300700001)(2616005)(66574015)(83380400001)(26005)(86362001)(1076003)(36756003)(82960400001)(2906002)(30864003)(6636002)(37006003)(66476007)(6506007)(6512007)(4326008)(8676002)(6862004)(5660300002)(8936002)(6486002)(478600001)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhmbjNUZnlhVktPemJSbm4xdU1PQ29JcVRsUjhEb0hTeitYSWwrcDJyT0JJ?=
 =?utf-8?B?RjdqRXRDZ0UrMWtLMUtPQnBqS0lpdUpZdFRpcU1WQmw2L254V053dkszQ2pG?=
 =?utf-8?B?bEY2RXBKL3BGdlRYUEZaclNJWlo5N3BndzB2Rmsyb2JYNm1XVW1RaHB6MEhm?=
 =?utf-8?B?Y1lWQTNSbjloS3M2S2x3ckZWOWNYeVZRU1Ayb3k1ZmxodGlsb1A4bkR3L1h1?=
 =?utf-8?B?Z0hLYThtbUdkaUhLbGZLMFY1eXJYeGJEbFJJRzVtQU9EMEJuL0lGcEJ6WXlu?=
 =?utf-8?B?SjlIZUxzejhyVEVuNjVmVDVmd0lEZ1d1QnRXZEozc1ZEN2Jhb0lOcndrUkpG?=
 =?utf-8?B?RDJjMk1teWxmc3F0K3VnNmQ5WUxiSTA0VitKR3BWbUkybkcyWHRQd29acVVE?=
 =?utf-8?B?VkpGR0U1R1ZZN2JmNUFCZkxGM3V6eExkNUpUVDcvVDBvZGRJZ1psY2FFWUtM?=
 =?utf-8?B?YkpzdEkvVHQyRWJmY3ZoUHh0TUNpR29mdno3UDVESEpmQ2lCbURUVDVSQnh0?=
 =?utf-8?B?bXZXMXUzMFY0U3JjK2R5NnhUNG0zeHZpdlpuL0gwV0NVODVRZGNuc3FlMHZD?=
 =?utf-8?B?TXpHOFBuYlRRMEpTSWFxL3NFdjdqVjB6VzYwTjJXMWp4VDFid2pLNTl5YmZw?=
 =?utf-8?B?Yk1BUmkzZUN4UG1zaEVWdzRucUNZQVRZRFViaXFSQmp3R2V2cENVMTFoU01p?=
 =?utf-8?B?RWdLTUJ2YkFvVVVCdnNEem5FdXBvR2NHZE1jbGR2UldxSFdCVHJtd3Z5bEk0?=
 =?utf-8?B?SlVPQ2xKYmVWeUN6aUgwRlRIWGNIYk9iMnNVNFFiUXpTSXpWT3F5ZmZVdHF4?=
 =?utf-8?B?RGozZlpPMzQzcGVEeEhGVnVzSEdYUk5OaGVndFJGQ3o3WXB5YjJ6aE5kYnFR?=
 =?utf-8?B?RnlPZEZRcFQvWTdKL3lyMkZBYmFVUVNyNVRJbXkzVkRHMUdGQmQ5YkpWZmtk?=
 =?utf-8?B?dEo1Y0ZqcGtYUkgrU0luSmRrRjMrN01EK2wyNWxicHZyeExTczNNMzhiOWdE?=
 =?utf-8?B?a2VwMlRENzFjR3ZLcThJZGRXb1lJdUpTOGM4NEZVREVncHZ1dGhHeVNnd3N0?=
 =?utf-8?B?bVBFNG5FRTBFOE9SV2MvL0MxWGl5dWpaRUl4VXhIbnlhbUs5T2pqK0FiZVVw?=
 =?utf-8?B?citKdmN1VmE3eXRTNUhkV3NGNG95VFY5eUErTGVnWUpIOEN0VDRsYUE4aG5s?=
 =?utf-8?B?MjdmSUd0NDN1OXlvUlptYnZOZVdUc29FemFKR3RiSlpLM2NsM0V0N3RxK1I2?=
 =?utf-8?B?Q2NxZ0lKaTAweElIK3FGMk1icTRUZm5wYWtsSW1OU2VnWVl1OW1CQkhFMk5j?=
 =?utf-8?B?Q29TeUhkbEJhaFZWa1hsajkyUDI5aGZMWVMxYnNJMTBNTlY1ZWgxcnZZV1k3?=
 =?utf-8?B?VUpXdGp1NlVsRmEyWndubzdaRFlhVWJ1TzV1anQ3NWlNekpMRG8zSDg1c0Rv?=
 =?utf-8?B?dnZ1SENvcDEyc1plZ1g5QTR0K01GYTlNSC9BdXMxZjBCUHk1TGdiYUhEOEkz?=
 =?utf-8?B?RTNhNmYxRWlUQkg2QXlhSm5vck00Zi9Xc1NkQktETmx6NWd4dmxsYWQwYm05?=
 =?utf-8?B?Ti9kQVFwNU5xZHdhZ1E2cWJaZlVROVlGNzRoaVVzMmpsNWxmVWxwNzBXbW9x?=
 =?utf-8?B?L2V1WHJ4aDcrWDQrMU53NmlXUWEzYm5LL1FxWE50NlpxQ0RRRUpIbDJ6bDNQ?=
 =?utf-8?B?MkNlV1lBSFFYRUdCbU5LY2JkaVhkMjFjektUSi9lOEM1dFp0cHBhMmwzYm8w?=
 =?utf-8?B?VHRSQ2Z4M0cvaEIrRHRKL2lhaHBJVTZmSnhZNVJYZ2xqeUN3ZnN6K0NwVGdp?=
 =?utf-8?B?TlArVDJEbFdJTXp0dzNEOVdJNlo2aHNoY25uNjFBbDZYcStPeWI1RWd2aUJQ?=
 =?utf-8?B?WVpTUlU2VDN0SytFa1dkTHA3Ui8ycDkzTDJwWHRkaTNCTFJ4QUNhNk9zcWk2?=
 =?utf-8?B?STRiSkhaMGFFV0JZeGVWL1Y3LzlvQk5QRGptOXhDQTlnbzlrSkJQWEJyYmtq?=
 =?utf-8?B?OU5Wa2UyVUlWYWh3eGw2NUcwOTBGdzhjYWx3bTN2RHptU3VLUEFpamgwaTY4?=
 =?utf-8?B?bmJ5VXB4WStmRW1FZUhXL1ZKRGNsd2thaG84NVRrTVc3SEp5TnZaVHdBRXlP?=
 =?utf-8?B?cVhJWnhnTU53ZGt6ZDV0Y0U5Uys4Ky9lYzhwbENwNU1sK2dzTUNCLzJkMWEv?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd910e0-a919-4ed2-bfb0-08dc08b35b55
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:16:00.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pI0yFFu2J/+IRQ6FVg1EZ8jwXug3A5ebveh5SipArsHiL4ND1MS2svgGjDPqvkM8tHntTFo2Js2nyY+5/Fl4BVhxGXiKUUK1NQxVkGiYOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:37 +0100]:
> Add few tests to make sure that some negative and normal use
> scenarios of the GuC Relay are implemented correctly.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c | 522 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_relay.c            |  17 +-
>  2 files changed, 538 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> new file mode 100644
> index 000000000000..13701451b923
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> @@ -0,0 +1,522 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define TEST_RID	1234
> +#define TEST_VFID	5
> +#define TEST_LEN	6
> +#define TEST_ACTION	0xa
> +#define TEST_DATA(n)	(0xd0 + (n))
> +
> +static int replacement_relay_get_totalvfs(struct xe_guc_relay *relay)
> +{
> +	return TEST_VFID;
> +}
> +
> +static int relay_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_guc_relay *relay;
> +	struct xe_device *xe;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	kunit_activate_static_stub(test, relay_get_totalvfs,
> +				   replacement_relay_get_totalvfs);
> +
> +	KUNIT_ASSERT_EQ(test, xe_guc_relay_init(relay), 0);
> +	KUNIT_EXPECT_TRUE(test, relay_is_ready(relay));
> +	relay->last_rid = TEST_RID - 1;
> +
> +	test->priv = relay;
> +	return 0;
> +}
> +
> +static const u32 TEST_MSG[TEST_LEN] = {
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, TEST_ACTION) |
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_DATA0, TEST_DATA(0)),
> +	TEST_DATA(1), TEST_DATA(2), TEST_DATA(3), TEST_DATA(4),
> +};
> +
> +static int replacement_xe_guc_ct_send_recv_always_fails(struct xe_guc_ct *ct,
> +							const u32 *msg, u32 len,
> +							u32 *response_buffer)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ct);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, msg);
> +	KUNIT_ASSERT_GE(test, len, GUC_HXG_MSG_MIN_LEN);
> +
> +	return -ECOMM;
> +}
> +
> +static int replacement_xe_guc_ct_send_recv_expects_pf2guc_relay(struct xe_guc_ct *ct,
> +								const u32 *msg, u32 len,
> +								u32 *response_buffer)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ct);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, msg);
> +	KUNIT_ASSERT_GE(test, len, PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN);
> +	KUNIT_ASSERT_EQ(test, len, PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN + TEST_LEN);
> +	KUNIT_EXPECT_EQ(test, GUC_HXG_ORIGIN_HOST, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]));
> +	KUNIT_EXPECT_EQ(test, GUC_HXG_TYPE_REQUEST, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]));
> +	KUNIT_EXPECT_EQ(test, XE_GUC_ACTION_PF2GUC_RELAY_TO_VF,
> +			FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]));
> +	KUNIT_EXPECT_EQ(test, TEST_VFID,
> +			FIELD_GET(PF2GUC_RELAY_TO_VF_REQUEST_MSG_1_VFID, msg[1]));
> +	KUNIT_EXPECT_EQ(test, TEST_RID,
> +			FIELD_GET(PF2GUC_RELAY_TO_VF_REQUEST_MSG_2_RELAY_ID, msg[2]));
> +	KUNIT_EXPECT_MEMEQ(test, TEST_MSG, msg + PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN,
> +			   sizeof(u32) * TEST_LEN);
> +	return 0;
> +}
> +
> +static const u32 test_guc2pf[GUC2PF_RELAY_FROM_VF_EVENT_MSG_MAX_LEN] = {
> +	/* transport */
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF),
> +	FIELD_PREP_CONST(GUC2PF_RELAY_FROM_VF_EVENT_MSG_1_VFID, TEST_VFID),
> +	FIELD_PREP_CONST(GUC2PF_RELAY_FROM_VF_EVENT_MSG_2_RELAY_ID, TEST_RID),
> +	/* payload */
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +};
> +
> +static const u32 test_guc2vf[GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN] = {
> +	/* transport */
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF),
> +	FIELD_PREP_CONST(GUC2VF_RELAY_FROM_PF_EVENT_MSG_1_RELAY_ID, TEST_RID),
> +	/* payload */
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +};
> +
> +static void pf_rejects_guc2pf_too_short(struct kunit *test)
> +{
> +	const u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN - 1;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2pf;
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, xe_guc_relay_process_guc2pf(relay, msg, len));
> +}
> +
> +static void pf_rejects_guc2pf_too_long(struct kunit *test)
> +{
> +	const u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MAX_LEN + 1;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2pf;
> +
> +	KUNIT_ASSERT_EQ(test, -EMSGSIZE, xe_guc_relay_process_guc2pf(relay, msg, len));
> +}
> +
> +static void pf_rejects_guc2pf_no_payload(struct kunit *test)
> +{
> +	const u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2pf;
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, xe_guc_relay_process_guc2pf(relay, msg, len));
> +}
> +
> +static void pf_fails_no_payload(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 msg = 0;
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, relay_process_msg(relay, TEST_VFID, TEST_RID, &msg, 0));
> +}
> +
> +static void pf_fails_bad_origin(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	static const u32 msg[] = {
> +		FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |
> +		FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +	};
> +	u32 len = ARRAY_SIZE(msg);
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, relay_process_msg(relay, TEST_VFID, TEST_RID, msg, len));
> +}
> +
> +static void pf_fails_bad_type(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 msg[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, 4), /* only 4 is undefined */
> +	};
> +	u32 len = ARRAY_SIZE(msg);
> +
> +	KUNIT_ASSERT_EQ(test, -EBADRQC, relay_process_msg(relay, TEST_VFID, TEST_RID, msg, len));
> +}
> +
> +static void pf_txn_reports_error(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	struct relay_transaction *txn;
> +
> +	txn = __relay_get_transaction(relay, false, TEST_VFID, TEST_RID,
> +				      TEST_MSG, TEST_LEN, NULL, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, txn);
> +
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_always_fails);
> +	KUNIT_EXPECT_EQ(test, -ECOMM, relay_send_transaction(relay, txn));
> +
> +	relay_release_transaction(relay, txn);
> +}
> +
> +static void pf_txn_sends_pf2guc(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	struct relay_transaction *txn;
> +
> +	txn = __relay_get_transaction(relay, false, TEST_VFID, TEST_RID,
> +				      TEST_MSG, TEST_LEN, NULL, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, txn);
> +
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_expects_pf2guc_relay);
> +	KUNIT_ASSERT_EQ(test, 0, relay_send_transaction(relay, txn));
> +
> +	relay_release_transaction(relay, txn);
> +}
> +
> +static void pf_sends_pf2guc(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_expects_pf2guc_relay);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +						TEST_MSG, TEST_LEN, NULL, 0));
> +}
> +
> +static int replacement_xe_guc_ct_send_recv_loopback_relay(struct xe_guc_ct *ct,
> +							  const u32 *msg, u32 len,
> +							  u32 *response_buffer)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 *reply = kunit_kzalloc(test, len * sizeof(u32), GFP_KERNEL);
> +	int (*guc2relay)(struct xe_guc_relay *, const u32 *, u32);
> +	u32 action;
> +	int err;
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ct);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, msg);
> +	KUNIT_ASSERT_GE(test, len, GUC_HXG_MSG_MIN_LEN);
> +	KUNIT_ASSERT_EQ(test, GUC_HXG_TYPE_REQUEST,
> +			FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]));
> +	KUNIT_ASSERT_GE(test, len, GUC_HXG_REQUEST_MSG_MIN_LEN);
> +	KUNIT_ASSERT_NOT_NULL(test, reply);
> +
> +	switch (FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0])) {
> +	case XE_GUC_ACTION_PF2GUC_RELAY_TO_VF:
> +		KUNIT_ASSERT_GE(test, len, PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN);
> +		action = XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF;
> +		guc2relay = xe_guc_relay_process_guc2pf;
> +		break;
> +	case XE_GUC_ACTION_VF2GUC_RELAY_TO_PF:
> +		KUNIT_ASSERT_GE(test, len, VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN);
> +		action = XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF;
> +		guc2relay = xe_guc_relay_process_guc2vf;
> +		break;
> +	default:
> +		KUNIT_FAIL(test, "bad RELAY action %#x", msg[0]);
> +		return -EINVAL;
> +	}
> +
> +	reply[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |
> +		   FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +		   FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION, action);
> +	memcpy(reply + 1, msg + 1, sizeof(u32) * (len - 1));
> +
> +	err = guc2relay(relay, reply, len);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	return err;
> +}
> +
> +static void test_requires_relay_testloop(struct kunit *test)
> +{
> +	/*
> +	 * The debug relay action GUC_RELAY_ACTION_VFXPF_TESTLOOP is available
> +	 * only on builds with CONFIG_DRM_XE_DEBUG_SRIOV enabled.
> +	 * See "kunit.py --kconfig_add" option if it's missing.
> +	 */
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV))
> +		kunit_skip(test, "requires %s\n", __stringify(CONFIG_DRM_XE_DEBUG_SRIOV));
> +}
> +
> +static void pf_loopback_nop(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 request[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VFXPF_TESTLOOP) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, VFXPF_TESTLOOP_OPCODE_NOP),
> +	};
> +	u32 response[GUC_HXG_RESPONSE_MSG_MIN_LEN];
> +	int ret;
> +
> +	test_requires_relay_testloop(test);
> +
> +	kunit_activate_static_stub(test, relay_kick_worker, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_loopback_relay);
> +	ret = xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	KUNIT_ASSERT_EQ(test, ret, GUC_HXG_RESPONSE_MSG_MIN_LEN);
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, response[0]),
> +			GUC_HXG_ORIGIN_HOST);
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_MSG_0_TYPE, response[0]),
> +			GUC_HXG_TYPE_RESPONSE_SUCCESS);
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, response[0]), 0);
> +}
> +
> +static void pf_loopback_echo(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 request[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VFXPF_TESTLOOP) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, VFXPF_TESTLOOP_OPCODE_ECHO),
> +		TEST_DATA(1), TEST_DATA(2), TEST_DATA(3), TEST_DATA(4),
> +	};
> +	u32 response[ARRAY_SIZE(request)];
> +	unsigned int n;
> +	int ret;
> +
> +	test_requires_relay_testloop(test);
> +
> +	kunit_activate_static_stub(test, relay_kick_worker, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_loopback_relay);
> +	ret = xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	KUNIT_ASSERT_EQ(test, ret, ARRAY_SIZE(response));
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, response[0]),
> +			GUC_HXG_ORIGIN_HOST);
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_MSG_0_TYPE, response[0]),
> +			GUC_HXG_TYPE_RESPONSE_SUCCESS);
> +	KUNIT_EXPECT_EQ(test, FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, response[0]),
> +			ARRAY_SIZE(response));
> +	for (n = GUC_HXG_RESPONSE_MSG_MIN_LEN; n < ret; n++)
> +		KUNIT_EXPECT_EQ(test, request[n], response[n]);
> +}
> +
> +static void pf_loopback_fail(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 request[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VFXPF_TESTLOOP) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, VFXPF_TESTLOOP_OPCODE_FAIL),
> +	};
> +	u32 response[GUC_HXG_RESPONSE_MSG_MIN_LEN];
> +	int ret;
> +
> +	test_requires_relay_testloop(test);
> +
> +	kunit_activate_static_stub(test, relay_kick_worker, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_loopback_relay);
> +	ret = xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	KUNIT_ASSERT_EQ(test, ret, -EREMOTEIO);
> +}
> +
> +static void pf_loopback_busy(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 request[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VFXPF_TESTLOOP) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, VFXPF_TESTLOOP_OPCODE_BUSY),
> +		TEST_DATA(0xb),
> +	};
> +	u32 response[GUC_HXG_RESPONSE_MSG_MIN_LEN];
> +	int ret;
> +
> +	test_requires_relay_testloop(test);
> +
> +	kunit_activate_static_stub(test, relay_testonly_nop, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, relay_kick_worker, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_loopback_relay);
> +	ret = xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	KUNIT_ASSERT_EQ(test, ret, GUC_HXG_RESPONSE_MSG_MIN_LEN);
> +}
> +
> +static void pf_loopback_retry(struct kunit *test)
> +{
> +	struct xe_guc_relay *relay = test->priv;
> +	u32 request[] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VFXPF_TESTLOOP) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, VFXPF_TESTLOOP_OPCODE_RETRY),
> +		TEST_DATA(0xd), TEST_DATA(0xd),
> +	};
> +	u32 response[GUC_HXG_RESPONSE_MSG_MIN_LEN];
> +	int ret;
> +
> +	test_requires_relay_testloop(test);
> +
> +	kunit_activate_static_stub(test, relay_kick_worker, relay_process_incoming_action);
> +	kunit_activate_static_stub(test, xe_guc_ct_send_recv,
> +				   replacement_xe_guc_ct_send_recv_loopback_relay);
> +	ret = xe_guc_relay_send_to_vf(relay, TEST_VFID,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	KUNIT_ASSERT_EQ(test, ret, GUC_HXG_RESPONSE_MSG_MIN_LEN);
> +}
> +
> +static struct kunit_case pf_relay_test_cases[] = {
> +	KUNIT_CASE(pf_rejects_guc2pf_too_short),
> +	KUNIT_CASE(pf_rejects_guc2pf_too_long),
> +	KUNIT_CASE(pf_rejects_guc2pf_no_payload),
> +	KUNIT_CASE(pf_fails_no_payload),
> +	KUNIT_CASE(pf_fails_bad_origin),
> +	KUNIT_CASE(pf_fails_bad_type),
> +	KUNIT_CASE(pf_txn_reports_error),
> +	KUNIT_CASE(pf_txn_sends_pf2guc),
> +	KUNIT_CASE(pf_sends_pf2guc),
> +	KUNIT_CASE(pf_loopback_nop),
> +	KUNIT_CASE(pf_loopback_echo),
> +	KUNIT_CASE(pf_loopback_fail),
> +	KUNIT_CASE_SLOW(pf_loopback_busy),
> +	KUNIT_CASE_SLOW(pf_loopback_retry),
> +	{}
> +};
> +
> +static struct kunit_suite pf_relay_suite = {
> +	.name = "pf_relay",
> +	.test_cases = pf_relay_test_cases,
> +	.init = relay_test_init,
> +};
> +
> +static void vf_rejects_guc2vf_too_short(struct kunit *test)
> +{
> +	const u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN - 1;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2vf;
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, xe_guc_relay_process_guc2vf(relay, msg, len));
> +}
> +
> +static void vf_rejects_guc2vf_too_long(struct kunit *test)
> +{
> +	const u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN + 1;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2vf;
> +
> +	KUNIT_ASSERT_EQ(test, -EMSGSIZE, xe_guc_relay_process_guc2vf(relay, msg, len));
> +}
> +
> +static void vf_rejects_guc2vf_no_payload(struct kunit *test)
> +{
> +	const u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN;
> +	struct xe_guc_relay *relay = test->priv;
> +	const u32 *msg = test_guc2vf;
> +
> +	KUNIT_ASSERT_EQ(test, -EPROTO, xe_guc_relay_process_guc2vf(relay, msg, len));
> +}
> +
> +static struct kunit_case vf_relay_test_cases[] = {
> +	KUNIT_CASE(vf_rejects_guc2vf_too_short),
> +	KUNIT_CASE(vf_rejects_guc2vf_too_long),
> +	KUNIT_CASE(vf_rejects_guc2vf_no_payload),
> +	{}
> +};
> +
> +static struct kunit_suite vf_relay_suite = {
> +	.name = "vf_relay",
> +	.test_cases = vf_relay_test_cases,
> +	.init = relay_test_init,
> +};
> +
> +static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	const u32 *msg = test_guc2pf;
> +	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
> +
> +	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2pf(relay, msg, len));
> +}
> +
> +static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	const u32 *msg = test_guc2vf;
> +	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
> +
> +	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2vf(relay, msg, len));
> +}
> +
> +static void xe_rejects_send_if_not_ready(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	u32 msg[GUC_RELAY_MSG_MIN_LEN];
> +	u32 len = ARRAY_SIZE(msg);
> +
> +	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_send_to_pf(relay, msg, len, NULL, 0));
> +	KUNIT_ASSERT_EQ(test, -ENODEV, relay_send_to(relay, TEST_VFID, msg, len, NULL, 0));
> +}
> +
> +static struct kunit_case no_relay_test_cases[] = {
> +	KUNIT_CASE(xe_drops_guc2pf_if_not_ready),
> +	KUNIT_CASE(xe_drops_guc2vf_if_not_ready),
> +	KUNIT_CASE(xe_rejects_send_if_not_ready),
> +	{}
> +};
> +
> +static struct kunit_suite no_relay_suite = {
> +	.name = "no_relay",
> +	.test_cases = no_relay_test_cases,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +
> +kunit_test_suites(&no_relay_suite,
> +		  &pf_relay_suite,
> +		  &vf_relay_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index 528a18215389..32535a4fd69c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -8,6 +8,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include <kunit/static_stub.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "abi/guc_relay_communication_abi.h"
> @@ -60,6 +62,7 @@ static int relay_get_totalvfs(struct xe_guc_relay *relay)
>  	struct xe_device *xe = relay_to_xe(relay);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> +	KUNIT_STATIC_STUB_REDIRECT(relay_get_totalvfs, relay);
>  	return IS_SRIOV_VF(xe) ? 0 : pci_sriov_get_totalvfs(pdev);
>  }
>  
> @@ -390,6 +393,11 @@ static u32 prepare_error_reply(u32 *msg, u32 error, u32 hint)
>  	return GUC_HXG_FAILURE_MSG_LEN;
>  }
>  
> +static void relay_testonly_nop(struct xe_guc_relay *relay)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(relay_testonly_nop, relay);
> +}
> +
>  static int relay_send_message_and_wait(struct xe_guc_relay *relay,
>  					struct relay_transaction *txn,
>  					u32 *buf, u32 buf_size)
> @@ -432,8 +440,10 @@ static int relay_send_message_and_wait(struct xe_guc_relay *relay,
>  		reinit_completion(&txn->done);
>  		if (txn->reply == -EAGAIN)
>  			goto resend;
> -		if (txn->reply == -EBUSY)
> +		if (txn->reply == -EBUSY) {
> +			relay_testonly_nop(relay);
>  			goto wait;
> +		}
>  		if (txn->reply > 0)
>  			ret = from_relay_error(txn->reply);
>  		else
> @@ -746,6 +756,7 @@ static bool relay_needs_worker(struct xe_guc_relay *relay)
>  
>  static void relay_kick_worker(struct xe_guc_relay *relay)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(relay_kick_worker, relay);
>  	queue_work(relay_to_xe(relay)->sriov.wq, &relay->worker);
>  }
>  
> @@ -916,3 +927,7 @@ int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32
>  	return err;
>  }
>  #endif
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_relay_test.c"
> +#endif
> -- 
> 2.25.1
> 

-- 
