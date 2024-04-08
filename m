Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA0CC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 22:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601011288F;
	Mon,  8 Apr 2024 22:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gs9whlaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED7110FF4B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 22:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712613698; x=1744149698;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CguQ/EREnn0X7IVSk0tyRjFUyE4dqeCVlwGcLvOcX5A=;
 b=gs9whlaBMrqQMQvGXK6hgKoSj3ANZUn56S4ure7dRhOU2iqG9VmQeQHw
 e85n/45C0Uv9v0oatf/ks5htXfz+ZvpbcOLbTOOxZYb05mZaDTrXJqolg
 47AcxV7H2dqvLJ23+LCq7f2z+MJhqoOoeU9N9lqZE6Q0jbY81yag+WeiV
 0GLtiwy7LsMDh5FIMSsSWg/KHrLhgrvRtz662TGDxVlIAKaxm7T91KpLp
 2zmfeIrgcdnOB9td7UAdg7j4JT6r3CEpZagzZz2HX1ZS6y/vETE/IdAYE
 tgmxxxQGSQq9FrDJ/IxFU+eXkqiobXT81jKdU7o3L4FUpiWCxg3Ds2/Eu g==;
X-CSE-ConnectionGUID: UPGpnHe6QBKcVrfjT0duYg==
X-CSE-MsgGUID: +H0n1IguQ+6V+B9nxUwp8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11750324"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11750324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 15:01:38 -0700
X-CSE-ConnectionGUID: HwrExslNSOm7m1PFsEOhAg==
X-CSE-MsgGUID: wl/Z7pNSTu+Aq55FQEGlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20139611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 15:01:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 15:01:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 15:01:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 15:01:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 15:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6tAhYYCtTp5Q+hANoqt2MJRxBrmxG+e2TzzKS9lyugXwIdEN5u5lAAdtESQlaUdDvJUT0HmTFQci+Qq1G6NqzrOXxnCdImHWjIXip6nOmnWi5QoXDSGRVhEw8zknVVxgfgfhjpMToup/49l4eCu2s0M5RH+1ZJYoPKzP5UgI9z9Yz+nH7Q1d95Fk1eFoQFQbOzLQcl9Zcje/+K6cKoSGrxhJxuFG+M/C2YuFtYxOQtJfVBAXEBEps5qtBtMRrOfhza1t9AG1SMIuLltvQwByBXGIKNepuIMOjvIjQE7dK7XRoN8+eueDBAy8vagh0Kkmjf5yimDevA3T4rgO8Ti2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa1pod+4+Iu8Oc2+x5sl1ad1yq2t2Gv4xiGN6Y3Ktdg=;
 b=SO3D9Uugdg+JHQeIR2BUtRcXTzuINmm9IVT+1cacO8+pQoMpe/WzDfd1pp3kDdDOdYvyLGJQPuzpn0JLQOhCMI07dMxTdfkOBpFXl/36KTxgBrgXJ2Wb38EWxqdQDkkqHrts9FroajDddjb5pfmH7LpNfFtDNbrOx+R4gLwMIlfViZC392ADt0kPf+zCxT/7GzYc9GIqIAezTh8AZbQKqySMxlosKTjBGrVE/w6gWGE4tiaJ9YxkjJkzmq2L+0ZC7rQIdKKpAdqxZhTlX6kBRczDsoIB/AXTNTuehbweDGarHP/NPuzjh4+XQT+t7Ia+W0Fu+Rx5iJpuZ/HRDBhclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 22:01:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 22:01:29 +0000
Message-ID: <d650d03a-19a9-4b4e-b050-8d2a522195ac@intel.com>
Date: Mon, 8 Apr 2024 15:01:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/kunit: Add tests for GuC KLV helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-3-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240408181408.1023-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB8132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcvrXKQJ5yvEPNkaRXDG5n69Qha7SktUH0rgAoL1AEH+G/NBtVg/gYIaTRu/5DSvnvreoyZxSfgyvCysnwGQv6QkzcCaVupi1FYXVOPah2kgNUIlfoCCN+rIhZgvzugINCgJUJH62sGRkuktVGhZ8p9y8gRksRWH4jABDd5XhAxnYzvjWFJLarzd452uELlUfWilzqWuMlyJPaI3PMIIdEyYoNd8XVWSiKifT0mflTXQZT9jkRphKAALpgZcSq+nvvyFcaS1WUfhYK3LDujlUs8k+yEOKpUTW2u5X+9mMJeyZWm07QIsNKf7RSUNMnQj4IykBxGhhi8QrQ6LjXHAgQwwtmxEy1k5r/MUsSBuwQdyDk6M7XjODzoWpXvBI+PurTb7wDRTooUk9wVMFhOTHUZgm9bMoInw9QvXtOgDQ/3nklBx+MSPXal/atDbLLaAcDkV96Nvsg6bmW76yG6wakh4lXMYwMRrSYx1EYLjz2HcnfVgJwklJn9HW4jx0dl2185gRTaMmzxRVs4dgUmFAnvWtcfx9YGzfRbKKVpkRqXFmu8jKCBcJ9J3c0Dk03TOyENMxn2lXhucDyDsBz/oP3GNH4gKvkzS06lYlhvZfg98J7sy/qOYijN4H1BTJYzTeNwfXMx4EqEuDstkCwueR8xx8qYkE9Wu8s+kQ/+2hFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdDRFZWUjJrYkg4VlJ3a0d1QVJRYThsNTE0S2lESVhHR0kwQkdKSUxEQU5S?=
 =?utf-8?B?aGU3akNyVmRWT0lCMERYUnlUaEp2eUNpWHFYbEVkK0FiRVErS1RtR2dzTzl1?=
 =?utf-8?B?aUJiNDdGSTFldG12VlhnRWdKcGxWaHVoWHphTTg0cTY3SHV5Qmd1aVh4N2xV?=
 =?utf-8?B?aDUzdkhoU2hZaWFCbmhsaENnTUlidXV5Tkw1b21hclRaMFg0UEhnZFBRWUhT?=
 =?utf-8?B?L21xVTJVT2RWL1FLSHJjdDZGWW8rSlQwRDBxOGQzVFRxaTg4SnREYUYwK0hn?=
 =?utf-8?B?c2NaZU9LVisrYVdxWUVveHdOMlpab0NxTVpqVXNnZDhuYXUwMVRVcThNR2xF?=
 =?utf-8?B?eklMRGhVeUJJWEZoNzBrUzZOVWJZdVBYdEh0ejNnYzNWaThVN0JxblJGNk0v?=
 =?utf-8?B?RkhCbjhRY05VUEd3eU9EL0JraFdSUzJ1Y0k4Z1NDRlVteFFaMEdIRFZmalQ2?=
 =?utf-8?B?VTNBcUNDcDJyZUdJRTJYSTlFQXV5M2Y1NlFSeXE2RzBZVGFJelZIZjZ3d216?=
 =?utf-8?B?OTBEdHhjcFJmbEE1UVUzS3dEc0VSeHNRdTNpTFFla0pVcm9ZSUNGL0JnTHJj?=
 =?utf-8?B?cXdBVDQvL2JoVlpRNk1sZmx6Tm1ram1kNUFVRWFVOVdBSTlYa2dlMkdzZ1RO?=
 =?utf-8?B?ZHUrVVdpdmpXWlc5Witna0tIeHByT0h4RDFWSThrLzJWa29qRlZ0MlNhR1Qv?=
 =?utf-8?B?OS9pMXBaN0lnL2w2Z0dCQzlmdm9JVjJGZVo2d0Zra2pRWS92MDMvM0RLMHYr?=
 =?utf-8?B?NE9LNlYrZkRXdENLMENqWkxQUGFMajJXR2ZLY2doTEhma25qeHdaNk8rajVh?=
 =?utf-8?B?VytFUGE3bjlscDNzMGozbURsNXJGOVJDcEorL3BYSlpCdFBBSXo4V2tFM05z?=
 =?utf-8?B?Zk55Q0g2M09Rb21nMlBTc3k4OTE5bVRvZjVkTjc1anZOcjNBZjQyMUlRd0Nq?=
 =?utf-8?B?Rkdac3lqTWluaHNjZEFRT2huVnFHRTBxZ2lkU0VrTXhEU1ZjcE9PeVRuU0I2?=
 =?utf-8?B?WTdicW5mUjJKMExBTnZ2V0tOWTNxcTc1WlJoZFFXL2g1WjJkUm1Pa1lxVHdG?=
 =?utf-8?B?MklSVUw2enpPdUhLRzh4MGsxNXpnQjE5QW5OY3pUZzFpbXZ3UVduRzdkTndN?=
 =?utf-8?B?U2VzN0RILzh1Y0pTSWZ4OExBQldzSzlRK1lWMnB3dFoyMWtnZ2lQSVlwNnlt?=
 =?utf-8?B?U24wV3NYWEUwY25DdEdtY0wrWStkRXBaZzNUcWd4UHVyWFBNTjJ4MDJwRVJW?=
 =?utf-8?B?MWxqekxmZmZoT1NpRG1hVnJyc0Zoc3luSWlSZW5tcUErVlEvRWlYalpNek5G?=
 =?utf-8?B?OEF5SzNZNzA2QjhGY2gvZkhrSitjZThnUXF5Wkx3cEd2cHh3M2xBMmYvcnVO?=
 =?utf-8?B?Yll2aFlOcnN2QkJ3YkhTYXo2c3kxUlM2N0t2MXJ0VkY5eCt3dis2RktZanBv?=
 =?utf-8?B?bldqb01MMXhNTy92ZUR0aGFBOXUrcUh3ZzNPYVFMcUFWUGlVdjUzaUtuNHZF?=
 =?utf-8?B?bmlrRWNhcTdUVmF3RUNHbmpzOUJwdTdUUGJwd0JkclVTMFFobGRSUHA5Ukx1?=
 =?utf-8?B?Nm5rNWdwSUEra29UeWMrVlZiNFZDcnFXM0duS0JHSXZQU3k5M2V3YmJacFBr?=
 =?utf-8?B?dkN3LzliR04rZ3AyYjhjOEI2S1ZBd0NNMUpqeEtHTm1JWGplL1R6V3VMZlZs?=
 =?utf-8?B?aWY0TCs1ckNTMktaUEg5amdseWFCYUs5cFdmZlhza085czRKQVJPOUxkckd3?=
 =?utf-8?B?dlF1cUNHR0dRQ0dMYWQ1SUVqMTg0WU41YWRoTzg1WDgxY1NCaldHejh5SFB6?=
 =?utf-8?B?RnFqck1qVVE0N2VBRGV3TTNML3JGdUtHQ0gxdlZkVWMwaXRHdVpqcDhuQlMr?=
 =?utf-8?B?algxczNHaUlsSnQzZVliUHVsbEkxMUszNVBNRGlrRVZYSzE0bzlGR1oxQ0hi?=
 =?utf-8?B?Wm5uUGltWU1sYVg2TC9jNDE3RHBpMXpOaXVVaWJTc0RRMWlhbldLZ0F1aVZI?=
 =?utf-8?B?TXcvcGRtUzRCcFJHS0l4ckZ3QzZhb1VWcGd4cVkxa29VeldFUGlCdDNLUXhl?=
 =?utf-8?B?TkcyUG5zd25WSFpoQWxrWDdjZ2JLcVh1MlJGd1hwaHMvbndSUFBPYzFqaWtK?=
 =?utf-8?B?d2JkcTNGYnJVU2lsczM2Q1BtRTdyUmY0NGp0dWtmVzlraHE1Q1FSbXFMUXBW?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f513ffa5-695a-49e4-1bbd-08dc5817715f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 22:01:29.3659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7noPPtFATBA9pPwh8kqQQ/AXVTfgOEtns17XjKid4Ykr+kbBlWPVFKbr+2brsxT95TUMqN1P4zwFIqBtT56MKG20L+VLB40XtdE/LqyYBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

Seems like a lot of effort for a couple of debug print helpers. Are 
these helpers actually expected to be used in a shipping driver for more 
than just error messages?

John.


On 4/8/2024 11:14, Michal Wajdeczko wrote:
> We should make sure that recently added GuC KLV helpers are always
> working as expected.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   .../drm/xe/tests/xe_guc_klv_helpers_test.c    | 200 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   4 +
>   2 files changed, 204 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
> new file mode 100644
> index 000000000000..094cd9922c73
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +static void bad_key_to_string(struct kunit *test)
> +{
> +	u16 key = 0xFFFF;
> +
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
> +	KUNIT_EXPECT_STREQ(test, xe_guc_klv_key_to_string(key), "(unknown)");
> +}
> +
> +static void good_key_to_string(struct kunit *test)
> +{
> +	u16 key = 0x0001; /* GUC_KLV_VF_CFG_GGTT_START */
> +
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
> +	KUNIT_EXPECT_STRNEQ(test, xe_guc_klv_key_to_string(key), "(unknown)");
> +}
> +
> +static void __to_buf_printfn(struct drm_printer *p, struct va_format *vaf)
> +{
> +	char *buf = p->arg;
> +
> +	 sprintf(buf, "%pV", vaf);
> +}
> +
> +static struct drm_printer buf_printer(char *buf)
> +{
> +	struct drm_printer p = {
> +		.printfn = __to_buf_printfn,
> +		.arg = buf,
> +	};
> +	return p;
> +}
> +
> +static void print_empty_klv(struct kunit *test)
> +{
> +	char buf[128] = {};
> +	struct drm_printer p = buf_printer(buf);
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +	};
> +
> +	KUNIT_EXPECT_STREQ(test, buf, "");
> +	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
> +	KUNIT_EXPECT_STRNEQ(test, buf, "");
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "no value"));
> +	kunit_info(test, "%s", buf);
> +}
> +
> +static void print_klv32(struct kunit *test)
> +{
> +	char buf[128] = {};
> +	struct drm_printer p = buf_printer(buf);
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 1),
> +		12345678,
> +	};
> +
> +	KUNIT_EXPECT_STREQ(test, buf, "");
> +	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
> +	KUNIT_EXPECT_STRNEQ(test, buf, "");
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "32b value"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "12345678"));
> +	kunit_info(test, "%s", buf);
> +}
> +
> +static void print_klv64(struct kunit *test)
> +{
> +	char buf[128] = {};
> +	struct drm_printer p = buf_printer(buf);
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
> +		0x87654321,
> +		0x12345678,
> +	};
> +
> +	KUNIT_EXPECT_STREQ(test, buf, "");
> +	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
> +	KUNIT_EXPECT_STRNEQ(test, buf, "");
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "64b value"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "0x1234567887654321"));
> +	kunit_info(test, "%s", buf);
> +}
> +
> +static void print_big_klv(struct kunit *test)
> +{
> +	char buf[128] = {};
> +	struct drm_printer p = buf_printer(buf);
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 3),
> +		0x11111111,
> +		0x22222222,
> +		0x33333333,
> +	};
> +
> +	KUNIT_EXPECT_STREQ(test, buf, "");
> +	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
> +	KUNIT_EXPECT_STRNEQ(test, buf, "");
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
> +	KUNIT_EXPECT_NULL(test, strstr(buf, "truncated"));
> +	kunit_info(test, "%s", buf);
> +}
> +
> +static void print_truncated_klv(struct kunit *test)
> +{
> +	char buf[128] = {};
> +	struct drm_printer p = buf_printer(buf);
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
> +		0x04030201,
> +	};
> +
> +	KUNIT_EXPECT_STREQ(test, buf, "");
> +	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
> +	KUNIT_EXPECT_STRNEQ(test, buf, "");
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "truncated"));
> +	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
> +	kunit_info(test, "%s", buf);
> +}
> +
> +static void count_no_klvs(struct kunit *test)
> +{
> +	u32 klvs[GUC_KLV_LEN_MIN];
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(NULL, 0));
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(klvs, 0));
> +}
> +
> +static void count_empty_klvs(struct kunit *test)
> +{
> +	u32 klvs[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +	};
> +	size_t n;
> +
> +	for (n = 1; n <= ARRAY_SIZE(klvs); n++)
> +		KUNIT_EXPECT_EQ(test, n, xe_guc_klv_count(klvs, n));
> +}
> +
> +static void count_mixed_klvs(struct kunit *test)
> +{
> +	u32 klvs[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 1) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		FIELD_PREP(GUC_KLV_0_KEY, 2) | FIELD_PREP(GUC_KLV_0_LEN, 1),
> +		1,
> +		FIELD_PREP(GUC_KLV_0_KEY, 3) | FIELD_PREP(GUC_KLV_0_LEN, 2),
> +		1, 2,
> +		FIELD_PREP(GUC_KLV_0_KEY, 4) | FIELD_PREP(GUC_KLV_0_LEN, 3),
> +		1, 2, 3,
> +		FIELD_PREP(GUC_KLV_0_KEY, 5) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +	};
> +
> +	KUNIT_EXPECT_NE(test, 5, ARRAY_SIZE(klvs));
> +	KUNIT_EXPECT_EQ(test, 5, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
> +}
> +
> +static void count_truncated_klvs(struct kunit *test)
> +{
> +	u32 klvs[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
> +	};
> +
> +	KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
> +}
> +
> +static struct kunit_case guc_klv_helpers_test_cases[] = {
> +	KUNIT_CASE(bad_key_to_string),
> +	KUNIT_CASE(good_key_to_string),
> +	KUNIT_CASE(print_empty_klv),
> +	KUNIT_CASE(print_klv32),
> +	KUNIT_CASE(print_klv64),
> +	KUNIT_CASE(print_big_klv),
> +	KUNIT_CASE(print_truncated_klv),
> +	KUNIT_CASE(count_no_klvs),
> +	KUNIT_CASE(count_empty_klvs),
> +	KUNIT_CASE(count_mixed_klvs),
> +	KUNIT_CASE(count_truncated_klvs),
> +	{}
> +};
> +
> +static struct kunit_suite guc_klv_helpers_suite = {
> +	.name = "guc_klv",
> +	.test_cases = guc_klv_helpers_test_cases,
> +};
> +
> +kunit_test_suites(&guc_klv_helpers_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index c39fda08afcb..bc98a80cc209 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -131,3 +131,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>   
>   	return num_dwords ? -ENODATA : num_klvs;
>   }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_klv_helpers_test.c"
> +#endif

