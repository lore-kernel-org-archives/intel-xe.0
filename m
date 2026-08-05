Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF43C55182
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 08:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C570110ED60;
	Wed,  5 Aug 2026 08:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3yo8fey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C13910E1B1;
 Wed,  5 Aug 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785916892; x=1817452892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xBLi9/ofQqijU8IibSZwl4EPDj1KBAxuB40e84oA67w=;
 b=I3yo8feybpnaBeYqe1JgCwi7F8jCORY1GpRV6pyiHd/o6IgY+j8yKS3y
 M/j17K5QE3uz0aPPrbiJWf0+HUUuEsVNxSI08lyohVwm9ig6NIp4yQ6xp
 F1SlOMTa5C+wp3Q6izqayjApq8tJhdhiGjNVIq+z1n98K5zjggOUjt6pR
 U/5GmQcQpXqsA/DR9uDEZScCogwiHmZtubD5F1xTx0CKCu9OIVuS4jKBZ
 hJQNgbs08VH27kMx5x/JRQBWGOMjDjYNrm7EpYHvQusJF6Sb/JWSt+vnr
 UhzOT/zKoMu6sgkQjfQs9DpA9PM1XbEdg0rAPbiP3XUkAZUV78/CFWYFl w==;
X-CSE-ConnectionGUID: xBJJeWBHT4uJHJx2E4f44Q==
X-CSE-MsgGUID: 4SWzS3m5QRK3fGtQ60JrTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90158840"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="90158840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:01:31 -0700
X-CSE-ConnectionGUID: v+ZhhYubRJuhOcMwxdzxVQ==
X-CSE-MsgGUID: yLBs6Xt6QFWJs/T5t06cIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="261800723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:01:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 01:01:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 01:01:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 01:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEs4XN1ff4pvTZ8H0gm75EN7X5zLgJW0xO+ZEvklLPoh/jtThRADkGDEYHMp0SzyZoEeox/qdHgG2pjpreOK7cjjtD8vm35kdMESwESqDSiNuCURDz4Wc/gHAECmDXwBKtdUBeIs1tpYy6ujBfXOrV8NiB73neVAYEzZXHAD04n9fHd1ILRqWaMvx9jWy887EVC0yWO2CEGimu8QEKAN0GjdxUs58l6JDz/CcnOVxXBsW7Pa9M4wJyJvX+CJYehI5ZUMWguxTdckdvWzUQ8tTQdv0+ovyXo4k87zp17OgDGDYmiCrm5yaPR8uUtgXFDdujB3A7Q7ocER8aE8QOSaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGs4Xn6B94ssFKJE3vjIBcLRv1HR8OrWqHTj+Ap4jJk=;
 b=cByeJrj+nebcGlf/P0Vja2DbGFBjZpcRVQXMxPdQqqm7cP7Igp0FZ7m5i6HNbt3Q+Fe5ZDgjLKf9104bl8LmOnPY1zh3xozf6ltlHXUwbcvt5zZJ3WRCqk83q6HqYEGuHQXTA+ExaFeh4HF8d6zYgLuPBIcim5y6fQoDlX61MoinamqstsBcPihmMkL36zTY52oZaI+IQ5BGUNDt0PjQkgfhTQVlQOh2FfdVwa0+LulM0xmmkM5vjtUcyjKqdXIRTcSB1spswjMrw6aZiUv43ZtFT+TV8f1cN0zCeb8CWJY5ZzxVytcgix/u6v7fP7SrZ5D6DT7uPfydTq3xurU6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 08:01:20 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 08:01:19 +0000
Message-ID: <ddc05c6f-533e-4683-bd56-80a00b81f399@intel.com>
Date: Wed, 5 Aug 2026 13:31:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/dp: Use array size for intersect_rates() bound
To: Jani Nikula <jani.nikula@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
 <20260804105549.1435154-1-suraj.kandpal@intel.com>
 <4af6b668-e117-4ab3-a534-82564feb9002@intel.com>
 <cec10cd7e2357098ed28c29c9948d2fcf03ba28e@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <cec10cd7e2357098ed28c29c9948d2fcf03ba28e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5c4bcc-8513-4d8e-b1bd-08def2c7bb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R2Ulb3eCisf96Kwjd3eihZPYJQHPA7QUZXT6xSDX3lD8U0DT/4TlC6TNyUIzKzu2GoAfyhGsPVgu/StWmsh8EhnEOWgTXQtZOKzkntSwLuNrpsm/gBK7+M34CAo5WZXnqVSxyWdUk4M0EQB6XzQoy9B4Z8ncRtxFgJJASElHyM4C0Gz+CqwNQZ49z9kBua1QEqSb2/rK5jpLuSU4TuPJFC2gNPo8UOlLxOA5xIepafZo2wroRHZyHamQVMJ/rKiJ5ePcY8ol0d7/3983G/xbdYKGgAIbWcuGR8vAfrSaaqoS73SsA83ohKa7607VypssUMbbogy58PPAxOxtaoX/Qg+6qTNxQHa9sb/Q7E2gL5/OshDRKpvIVhNfRMakOhut+8vt9ZFrsH48fRE+FJHv3lKY0bmhPtRx9+lD4GzfNu+bK/ENFklUnmr6HSDv6pdbCOYeU/sTyhQkXITSjzL8svdKZFDXLAJlcCAEjXK+dJ7r3qY7ETvP4M1iItlmsXeA3kv2AWQ7o+xYpcgF6WlCpy7eKzi0xJNTY+A+IftB0YaliL2mS5Kh0MfPWnSXpDeqxZTRKRDeQhvtQFmtjpCiw5eeqrQt7WYP/nkjeTFfVLsloVb810v4TpAclzIAhKEpQQVIVmElCdKfaCdZYiFNmKotK7T5UCtORaT17OFhpHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WksrOG56YWNWZ2pEVm1rKzRoWHpZWW5wZkVmUGQzUSt3UnVxcDNLS2dSSzIw?=
 =?utf-8?B?cmJ0L1lBSFZjSVE5Z0pJTXNuNDA4c0tKVHN4T2hsUFJYby9iQjR0cmN4ZDIy?=
 =?utf-8?B?bW92MU5nZWtwL2c2cXVCdC9uMjFLdnlzbndPUHNrcG9BeWR0VVpiQjdWRVRM?=
 =?utf-8?B?ZjFVOFFjR3J3K1Rmc1JvQzArYkQ2ZFp1ZlhlU0p4VVVEV2ttc2lqRmxZaHJB?=
 =?utf-8?B?WFlUYXYydjUyaHNsVTlXN3NUTng4MGdTZjNzOXpwQXRUNGVSdjBSRXM2U3hx?=
 =?utf-8?B?YXNFK2JzRmc4TGNwTEYyV0Uwd0I5ZWVEZDBZVGRUbHpWOFl6blJCSGZscERV?=
 =?utf-8?B?ZHlVWk5lU1ZXT3FwR08zV2xIQXFmaFlXV0swSnFwd1BsWXFyMFpOYWNabmNo?=
 =?utf-8?B?RklpSWJ4b0xPak9XdFVxbnh3Q0kwYUwrWDBld1R4THRsYWhBSnUrRjB4U1hI?=
 =?utf-8?B?YlA0SlBIcDdRandLVk9oWHRvRHNkM1h3SGxYeVpoSlR1N3dCWE1vZlZ2ZG96?=
 =?utf-8?B?YXo3ZWxoSWM2Znl1NFlmVFZGYi83cWU1Q2l4eTFwc2pyMFI2N1Nla2VvUmxt?=
 =?utf-8?B?NnZFL2NESW83RlMzcmFNc1g3SnRMWTNuZkNkcWpPOVhabkVNTHJYb25wdzZT?=
 =?utf-8?B?d3U0emdpd3dWRGdYQ2tPRjZ2VVBHWXdmTU9FUjU1aDNZOFZEMnRURGd1bTli?=
 =?utf-8?B?TUFWU2JzdGdCei9SNDk0Y2pSd01qblR2TkdaMHFwSllvc1o2ZDVwNHVVMmh4?=
 =?utf-8?B?T3BZckF2U1Y5KzFPeUJkNUxMWjFQTmg4aXdRNGVJRGF6amlIZ2p0Zy9ZWGV1?=
 =?utf-8?B?RFcyK1FSS041Y0ZuWlBEWUxWRXJyMXdkTjRYeGx4dnBYWHR0YUJhQ0RYNytE?=
 =?utf-8?B?Zm11UkNDdzdmWTYzT2w0bkxpUm9wYkpiVnZKaU5naDl0SFJwTVJaeFdMV2Fr?=
 =?utf-8?B?bmN5ZlNsYXdvUlNaTGFySzVJT24wWURxaWVsSlByc2dMelF3cmYxaFF4Vi9O?=
 =?utf-8?B?OS91K1V5Q0lPR0lHZUViZ3JYOG9YVU1CZEpFM0x1Qk5UTXArNWFDMGxJKytF?=
 =?utf-8?B?VUxCZUM1dVdYbS80M1I5NitDYks2UG5OSVZFeXJ4aG1RdktobVl0elhoKzgx?=
 =?utf-8?B?WExMc2syZi8zWUp1OUpQMkxzTW9yQWYzZE1HTzZVNkU3ZEk5ZGgxdHl2cnU3?=
 =?utf-8?B?SDZSUi9aYk1GRjFaNFhIcG1KZzJmNE9uNWtPNzY1WUw3R2pmQk5SK2FBc1lr?=
 =?utf-8?B?dTFMWmZVMzRCTW8wa2VmdnE5Ny8zWXlnVU1JZW93NHh6SGxUWGRYaGZaOXRZ?=
 =?utf-8?B?UFVvVHBCTmx1RkZDVnlhVlZiQ1NPQ3JUZExWMnhyNUZSWkZ4dVpZWHpOSlZT?=
 =?utf-8?B?eWMyZVJFZ1JhL1ZRQ3V1STdkbjVDOXFXV0ZsK0hWcDNlM09EWGZXYWp4Z0tY?=
 =?utf-8?B?MGk4UVE4bHgvbTM3WWtCQUN0TnpmSDdjQk5UQnExaHZRNkNlZjF0RTNMbnpQ?=
 =?utf-8?B?d1lpUVJOd3lXRXpKYTBkVjFXOHJXM3pJNER0cFYrYU1FcE96dGUwTVVyZTE1?=
 =?utf-8?B?OUFFaDJxSUJPWWY4ajJIb0pmOE5mbDFaSHlkeWtiN1djY1R0Z21UbVRoT2py?=
 =?utf-8?B?REdFOFBOcDlkaVZ3RnQraEJLRzNSOTk4c05LdTBzQnMwYkN6Ni94bWRWWTRX?=
 =?utf-8?B?dTNJVFdtZ3ZkK1kwUDlJWWtUYlRiMU42a2hHVDU2UXUvSHFrVFdCT3RuU2hr?=
 =?utf-8?B?QVZ6cS9MNGhOeTNZNVNqTDhCamcxaEZCSkdzcVFlSHlsdzgyNmxWL3VxU1Rn?=
 =?utf-8?B?VU01dGZSOVU0VlJWd3F4SS9VNWZPSlNqWFdtYktTN01CMHJEcjVpZ3hXVG5j?=
 =?utf-8?B?UEZkQ0o3OW5ncVM3dngySHk0VkVGSEtHOEFsUUkrUmUzZVRScVU2VVlqbE9V?=
 =?utf-8?B?dGxhZUlLbUJNdDIzUFVrbjhOVHpxLzdMSWJ5MjhIeHFzODF3Q1pTVGlWc1FM?=
 =?utf-8?B?K0g5STVMblhRRi9La3JkK0YwbkhOSXlwQlhpTzBuYSszcnVvQzAza0gwcEFa?=
 =?utf-8?B?YTZyT2Q2eTI3QUZZa3EveFlrTHM0S0tIQ2dDbHp1eEhzZ1JxWmhSMFJxZ0Rp?=
 =?utf-8?B?SDNFd2Z6OXFsSDhpRzJNRHUraGF6cDhTUGVOekVmM1lhNmZKVGpxN0N2M3Zi?=
 =?utf-8?B?cDVxMXFTT3Fmc2t3ZmM2bDYvbXlJVVppY2lDL1NSOHlkQXVESk9idERuRGFO?=
 =?utf-8?B?L2RrSEtjTHBnUjlML1JNS1NKQzhRd0pnQmpuS2ZOZzNWcUN2SlB0dkpYc3U4?=
 =?utf-8?B?WWFkd3JmTCs4NXRVWGVHM002UlNkWXN6SDkwMncrZEFCSDlrbG9aWHdlWHE1?=
 =?utf-8?Q?vstNkVzFRh9uqp/0=3D?=
X-Exchange-RoutingPolicyChecked: g7safZo307OhsiDQSvyZDBfKzsrigGUqqRkvEvffZ2r3ulj4tLOw2I1fFxzN9VlFLTSDciuuqlCqUd8klcqswVNacG7+v89OGZdo4cQVnNmHwrDsy9ZDk7qgdfZGjRpOLJJCUTnUkkc32ntfymp3PXCcjozH9w0eYV8XxMWNhqv4SiW651Si2XOf+rjFOA1rOR2syKT4Wv/VoghgtSOcBijgLXfVmJOeNJAYWJZ8gszFc1Yzi3xND/6jMf63yHA/tLMEQAL3cNEqjMn1QVqG3vHyRba0qCkSr53lJ+nyq8MDvYRV1w3YKgja8hnWKQvamVwsBq4LhqfKtqMOvW6ZcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5c4bcc-8513-4d8e-b1bd-08def2c7bb4e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 08:01:19.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK+Ay/zD5R7jxRWAKhbqIgVvcMGNEaRZGKw6UW3H1c3M1YkYiVzxe6NmAPFkJLCAPCavlG9k5LY9BXp/s2KCFYD7BxbjvydQBeTuv8BP7Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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



On 8/5/2026 1:14 PM, Jani Nikula wrote:
> On Wed, 05 Aug 2026, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>> On 8/4/2026 4:25 PM, Suraj Kandpal wrote:
>>> Take an explicit common_len parameter and pass
>>> ARRAY_SIZE(intel_dp->common_rates) at the call site, so the bound is
>>> tied to the destination array.
>>>
>>> Fixes: e6bda3e4cb43 ("drm/i915: Avoid overflowing the DP link rate arrays")
>>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>> ---
>>> v1 -> v2:
>>> -Use latest baseline (Jani)
>>>
>>>    drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++----
>>>    1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>> index 7f13595f40c1..1f1324c99130 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>> @@ -625,13 +625,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>>>    
>>>    static int intersect_rates(const int *source_rates, int source_len,
>>>    			   const int *sink_rates, int sink_len,
>>> -			   int *common_rates)
>>> +			   int *common_rates, int common_len)
>>>    {
>>>    	int i = 0, j = 0, k = 0;
>>>    
>>>    	while (i < source_len && j < sink_len) {
>>>    		if (source_rates[i] == sink_rates[j]) {
>>> -			if (WARN_ON(k >= DP_MAX_SUPPORTED_RATES))
>>> +			if (WARN_ON(k >= common_len))
>>
>> DP_MAX_SUPPORTED_RATES made more sense here because it keeps the size of
>> the common rate (and sink rate) from drifting away from the standard macro.
> 
> DP_MAX_SUPPORTED_RATES means the number of 16-bit rates to read from the
> eDP specific DP_SUPPORTED_LINK_RATES DPCD register. I think it's
> misleading to use it for *anything* else.
> 

I agree that this all is a bit fragile right now. We are overloading its 
meaning by using it in array sizes for sink_rates (in struct intel_dp) 
and common rates in intel_dp_set_common_link_params()

> The number of source and sink rates don't have to be linked in any way.
> 
> See intel_dp_set_source_rates(). All the platforms since ICL support 10
> or 11 rates i.e. more than DP_MAX_SUPPORTED_RATES.
>

True but the code still assumes (and ensures in a fragile way) that we 
will end up with at most DP_MAX_SUPPORTED_RATES number of common rates.
>>
>>>    				return k;
>>>    			common_rates[k] = source_rates[i];
>>>    			++k;
>>> @@ -660,6 +660,7 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
>>>    
>>>    static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>>>    				      int common_rates[DP_MAX_SUPPORTED_RATES],
>>> +				      int common_len,
>>>    				      int *num_common_rates)
>>>    {
>>>    	struct intel_display *display = to_intel_display(intel_dp);
>>> @@ -671,7 +672,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>>>    					    intel_dp->num_source_rates,
>>>    					    intel_dp->sink_rates,
>>>    					    intel_dp->num_sink_rates,
>>> -					    common_rates);
>>> +					    common_rates,
>>> +					    common_len);
>>>    
>>>    	/* Paranoia, there should always be something in common. */
>>>    	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
>>> @@ -687,7 +689,8 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
>>>    	int common_rates[DP_MAX_SUPPORTED_RATES];
>>>    	bool params_changed = false;
>>>    
>>> -	intel_dp_get_common_rates(intel_dp, common_rates, &num_common_rates);
>>> +	intel_dp_get_common_rates(intel_dp, common_rates, ARRAY_SIZE(common_rates),
>>> +				  &num_common_rates);
>>
>> Is this patch in response to an actual bug or just a defensive code
>> change? If it is the later, does it add much value?
>>
>> common_rates and sink_rate are already locked in with
>> DP_MAX_SUPPORTED_RATES. There is a hazard of them drifting away from a
>> common size for which we could add a static enforcement of
>>
>> BUILD_BUG_ON(ARRAY_SIZE(common_rates) != ARRAY_SIZE(sink_rates));
>>
>> Something similar is done in intel_dp_set_dpcd_sink_rates() to keep the
>> sink_rate within limits.
>>
>> Regardless, if there is no actual bug then the Fixes tag is unjustified.
>>
>> ==
>>
>> Chaitanya
>>
>>
>>
>>>    	if (intel_dp_link_caps_update(intel_dp->link.caps,
>>>    				      common_rates, num_common_rates,
>>>    				      intel_dp_get_max_common_lane_count(intel_dp),
>>
> 

