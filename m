Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBFC43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 16:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0A10E39D;
	Mon,  6 Jul 2026 16:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PurgRb0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021F10E3AB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783353862; x=1814889862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aXyfaFHWW3TDN7WO9NK7wEkQO2+ZBzQ3g7w3FbH9TZ8=;
 b=PurgRb0gvqBOVQM45807I5vE2nYT9T8yvaiKhBhP7s9T3yoMNcu5CFN3
 vs4qzx9JfiesF2O3PvUTytXOc1oeuvSX1FpaxgTP3yiBh2ORl24w6RCkB
 Sxh9ucmjk7TLWGOG1/C98DwhKxPE2Gb7QMUt6kDbQ/hmCcih9eLUxuxnC
 s05LwSdwC6FZBUsVY8z0Oh1hokRmA8+zTd1HcMwSM+vlKqfdDY5Ff9PJ/
 SLxb9zq8Wlf/s4OKyxpwUcI5zawX+LFTfxaLxfH3BXkSWUyIMFEt1U+LD
 ZQiD3YrjCQYcR97gFWjp9H2jM4useL2/sFJCHZ1c226cRN9uFRw+wbBSD g==;
X-CSE-ConnectionGUID: kM4e1cYaRgqxPKk/K6Zhsw==
X-CSE-MsgGUID: +DKA+KNLTguorwVkDZCGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101536731"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="101536731"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:04:22 -0700
X-CSE-ConnectionGUID: ydlfov1HQFCwmJk2rWNMTA==
X-CSE-MsgGUID: 0qEPqhlWTuGJuFIgvP5fIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="291913940"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:04:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:04:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 09:04:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htfQJxqQ5w+m1WCcDeExsRaSLZwFBGeNSsBh8Oe0uoXStq674pLZdtWdzoEWCSe1kdyBn1joC5A5iE3JzGorb3kute6g2yH8Kqgh5TcshDTLHottGSd7g3+3/KRHdD389dSMiZaz5otW0ynuN7JcopLZS2GZLOLCpvamMV3MV82noBMul56kAo5t+rs2rgJ68FeE8Z5kH9grcxiDDE/HvmwZwzJOPv0B7TkiM0wLddxwVeAZ3V4WH04OSyr+GY5reLzxvFJqtgJrtHqucSoB2RhpJb2vSvZ04J1mneplEzqvcUEwWEAzRrURyXxQFICkmK3gOwRBxzemVSAuBeH32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/OUOJ+TK/36VaYihQCjpHcVo4NQbKO4YPqciNkWmug=;
 b=QojvVtvVJWHtwwowPLnyuLFBhhSWBWHAgCCx8nrsugfyegnK7bkdzwO+fgaLd0iGEI0fL5uxTiYAd19VtuA6uxIvz4f7mlt/spLNVxMUWvRHpmfzfhkqHBy7/ZoSORGfFk31wednzpTDyLVCaTtY9K9GkGsgZN5/GgBbaYxD9VUtp+jq9fJdBbTPmizt0AfVwUHII2Eb4ySG7xH7ZFEyia/gq9OtU7YqgZIDtp1lW043psezVV+D5XF1cMXWZJq4d99ixZUWKe4Erx7z6XQ2WPyBvglm13leKf6BH6u1SePXpS2Q9cddj+Y3CCo+Rg8gFJujr3Suw+XP55d5HtfZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 16:04:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 16:04:17 +0000
Message-ID: <da12ce92-359f-4a21-bde7-03ee22d2635b@intel.com>
Date: Mon, 6 Jul 2026 18:04:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/xe/guc: Add string KLV encoding helper
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-5-michal.wajdeczko@intel.com>
 <ake4nA-cxhb1xsdB@nostramo>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ake4nA-cxhb1xsdB@nostramo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0155.eurprd07.prod.outlook.com
 (2603:10a6:802:16::42) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b8b148-960e-408b-7c45-08dedb783bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: bIi50/lh/SABQoeF7bGreOGmyJrGqLJk3mMmWSNv0UkJV2E6jx3VI5S6hc46ketnhgNiR0Di4dfKur3nkB3JEzo7U+Ljhr4W/mKaZ3rh+tLGJPRZ+hZoUydZFu7Z/kvv9r3cY4vbsPpKekU0dRXDeeRZXJxQC8LqiqZlsvXFXha95mHM2ma8mNWWrf3tp21db9exMT/b1W7K5yicyCyUWrZ5awCw0hbdOorxeUYpifxcTibDxaK9/79VxN4gX474nPFRkKJewnErZgrppPv6mVXmBD/QUO2MhYFjRZEIlJKyh5xi+XgFPuTZhA5Op40MaGy73A2DLlEHHZGPY/SZemgYQfXgwjD23HMekN3YeUzkhUN3ILIOxiWRARZbPHQgeOEwlWH5gijkaPQABI0w5P/Y1tP8azKVv7bZ6+QGkIaRARFNZ+PgQJqnsfADfRSDBRxyiZiYpUocxLI7LQNoC7Y2TVVDZQqkVWIJkhJHSTi6N5YmvYBszmgFo2l9e2qphFaqklQkrltszads8hJFIQSu6tMVtaumP5k+r38xI9N6lY8XZjBeB0brmaJqK1ip68NiyL5ktU+jWmqdtb6PpP7FyT459AtX3cjUkLFD/tCwicNMdkJC2L5xXqVwuYMF6GS8GLcFiIB0vjyfqql3dwSDpnWOMEUrjJJ2dStHG2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVmN3l1TW15WnRpRU5nT3BXVnVCS09lMEFidTB4ZVZLSnBHTEhTaU1saXBW?=
 =?utf-8?B?ZVNmTGpkbDNHYkdOS0hVbTQveXR3eVlqNGZEZlJJdE5sR1B6eUJ0WFBFKzdR?=
 =?utf-8?B?Z3l3ZndUb1ZKMjlPUEpvcm5ubGJvOWlnUkVldTdoYW9BNTg1L3B6MjQzYkND?=
 =?utf-8?B?NHBLVENENmswMUM5eEtSL2I0RWJ1V0swTzY0Q2VPT01qSkdObXdMZ2NORk9U?=
 =?utf-8?B?QlR1dEVObmNJZEJaNUZtaEgyUjFjVFlCVVpYd0tQN0ZYSVFkejBBaXg3Qk5Y?=
 =?utf-8?B?R05hNDhoVzFPNlEvRnREYUFQb2x2MFp1NEIyaVZUN2xHcjcrZ3BkNmE1OC9W?=
 =?utf-8?B?ZzhrZFBYSURDakIvVjJFazZTR1hBaCtyeWR5clI3ZlFzZFpjalM1cFEzS2R6?=
 =?utf-8?B?TFo1R1NhR1JwMTJKdDFSY0NlSy8yZjFtU3o2VXB4QTM0QzBwZTVNeEwvQkV6?=
 =?utf-8?B?SCtMKzVaSUNsblF1cXJRNFJHRlFtNUZXZjRCcEtFcWNDazFJK2MzTmIweTY5?=
 =?utf-8?B?RlVHSzhiTURMVHVVeERaSjNsTTkyeHBvMUNlQUJNdGF2YWpFSU9Xak12L1hF?=
 =?utf-8?B?bjVHTnBiT3NWWldJYzYrQ1I1WFZHQmpkeE1vQlFWSUpOMzVzMElHalh2ZWRD?=
 =?utf-8?B?Wmg5WkFacEFnTjJqYitmQzRCTW03b1E1MXlMZkJ6U3MvTjQzYUl0OVI5K1FL?=
 =?utf-8?B?eXRRNGlEU0hNalJLZjB4Nk1uNVc1NzdHUm1CTGpmanl4L2VNcFdvZGpGNDIw?=
 =?utf-8?B?YWM0UnhFMTF0ZkFTL0p4SUx5eGtDdDM3QXdvc2U0ZjJJdm5oWThqZUE1eXc2?=
 =?utf-8?B?aXRiTEE5TUVMYUVhRkVBL3RITVVrRTVsTFcya21vTFA4c3c0Q0N1TW5xT0NJ?=
 =?utf-8?B?WXhEeCtuS0xkMlRXQnIyS1lXazRMaURkVGFHRkZVWHhiMXhLUlVONjNiZG1M?=
 =?utf-8?B?WldPSGpCWjFrZi9HQllUelJIUXNDQjZlcVdCRkQvcGhqalZ0MXY1TEhHb29p?=
 =?utf-8?B?ZnlUemZrdkxRR3JUcXNFejVRWWU3c0t5SDA3TFpzTWVSazBveVZsN2h6T3Yx?=
 =?utf-8?B?bWhxOVVPbnFpaVhITGlGSzBrK1N4OUdGUGlUaU5RbXhSdDRCY2ZtTi9jRkwy?=
 =?utf-8?B?VzhDV1RnWHoxazd4QXlhMDBOY0hUWjJDekZQcWtHMmZJcTlYMTVndzRjOXBQ?=
 =?utf-8?B?ZEJTa2hmaWdMRUd6YzdsR1hrKzYwRDRTSEpUTGJDTm9WRlUwUWJvb01sLzVn?=
 =?utf-8?B?SmJjcW55UWVKR0NvWHg5RDhtUmFwSWVmamVVc05DUjZFbG00WnU2ekRyWWti?=
 =?utf-8?B?Mm1ndEpvSVJKSzhKYXBvb1l3dWR0cU5VbXhZVE50MG04UzBJUDRWZlpnVXhT?=
 =?utf-8?B?TG91dmxObGhmS05YOHFXaUJmaFFVZHVsdU8wbkZrK3AzQTFpQlZMM3FwU0xW?=
 =?utf-8?B?RWozcFY0RzBubkZHM1pwVU9Qdm0zREZQVU9BTzFWTnFYNGdKSjRTSVk3aUZY?=
 =?utf-8?B?eUFwNlhWS0QrVmVsRzFORjNGVWhmNHBPTkJtSlB2eFp4cUp1ZjJ2VHdzNWdk?=
 =?utf-8?B?eTJWdkZvc3pSRWE4SmNFQ1k1Q3lqZjI5c0VwYkhUOXkzd3I3QlpuMlJsNlI5?=
 =?utf-8?B?RnhiYXBnUFYvSm9Oc3BYdkhRcVVlNjI1cWxjZTk1L2xnRFRWay92ZTJLaXZT?=
 =?utf-8?B?eW9JSlpYdzJOS2JUb0ZDQk5LdThIZFFuYm9oSVBWRVJXNVpFaTg1N0NTUkhM?=
 =?utf-8?B?TlBpRDFkQ1UrYk5JOWt5QlVsR3JDNVdISFEvbkdyRE0rMkVOMmxIN21UYWVo?=
 =?utf-8?B?T01VMkVtOTZKS2tQcm9xMklISkZ5ODZWdzg3N3ZHRVl6N0t2MUdWZks0VE5T?=
 =?utf-8?B?MW5oR1dLaEhpNTA4OEhPeGJ2ZnlhK3RBUGN5UFFwa2tMQWg3MzRwWWlQZzZv?=
 =?utf-8?B?MktjYUZzd25UU0RzZUJmckVJUjJySXBQdTRiUHU2SzRCOWJLMnk3cHk4Y3Qw?=
 =?utf-8?B?OFRNL3V2RlFvd2w3NmVGY2FLMFRwd01BYTcrZzlLdGczQmFZbUF0dlU4c0xJ?=
 =?utf-8?B?bUg5U2JRMWdNQzd6NTVoeE5tV0xGZVU2N01VYVpNRnFsbGdiNWdiajNtY3d2?=
 =?utf-8?B?TGNBcGxxSS9VZDBvUFN0Q0QrdUM1SjRkNXlId3lUc3hjMFpUeFVxRGEzdFgy?=
 =?utf-8?B?MkFvMGsvUG1KREFsbXNBcHBrLys0ckEvQ2VES0hFT0k4aVJXaCt2MGsxQUpo?=
 =?utf-8?B?bDVIUmJhaFJTVzBNbFdJdHN6UjMvMzZYN3czaTFudmxZRmNPbVphL3RZREpw?=
 =?utf-8?B?QmFZN0JwZUp2MEpzYWZCVmJvR2Rnam1rRExobkFCRDZ4UkZiQmdWS09CK0hO?=
 =?utf-8?Q?8Cs6b8LplKFLasqA=3D?=
X-Exchange-RoutingPolicyChecked: gViPzHOK9sSUUmYRSZmouUIZL9VMwhULuJe8Wx0js2uXkZQQSg7sXF5AL5PnUeatuEU60EnXP7XTIyMgoa/gDY3wWysUmaWdL0YGzHsJHux99tZdp2Bks/7QfncFVONSrsYDLG6Cq5SSpt3cQxuqWVFDJRnxtuVldWBbJFoP5BXpuvTMsYKZBg2LVFBg7gcvhVcBfsWieT7UCxmufXLFMNLsv8vInI1uuLNzpj8WjrIK1O8LDu/47spBMxOnPAOmMViCAE+mT1Jd1OL78uDMZxzKSyg1ObenLeeEtoxEM4YiM7l7SfU7pSoETk/lIEh7wUErIBNfRvhQh8Xlvm/L+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b8b148-960e-408b-7c45-08dedb783bb0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:04:17.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNrIEVCF5+CXeByn6YHG7s7Z9ip/sJQIL4YUW0KVMa9cTdL29ibi8T9ISPSwQFkJHAWPpOM9bnDW2TiIkp9nJBBPs9qin1gbHUY1EJqSEFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
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



On 7/3/2026 3:29 PM, Michał Winiarski wrote:
> On Tue, Jun 30, 2026 at 03:26:23PM +0200, Michal Wajdeczko wrote:
>> We also plan to encode a text data as KLV. Add helper for that too.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 31 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
>>  2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index e84d1f5f5c56..a5fcfc4a6c37 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -188,6 +188,11 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>>  	return num_dwords ? -ENODATA : num_klvs;
>>  }
>>  
>> +static size_t to_num_bytes(u16 dwords)
>> +{
>> +	return dwords * sizeof(u32);
>> +}
>> +
>>  static u16 to_num_dwords(size_t size)
>>  {
>>  	return round_up(size, sizeof(u32)) / sizeof(u32);
>> @@ -243,3 +248,29 @@ u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value)
>>  	*klvs++ = upper_32_bits(value);
>>  	return klvs;
>>  }
>> +
>> +/**
>> + * xe_guc_klv_encode_string() - Encode string as KLV.
>> + * @klvs: the buffer where to place KLV
>> + * @avail: number of dwords (u32) available in the buffer
>> + * @key: key to be used
>> + * @s: string to be encoded
>> + *
>> + * Return: pointer to the buffer location past the encoded KLV or
>> + *         an ERR_PTR if there was no space to encode the KLV.
>> + */
>> +u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s)
>> +{
>> +	size_t size = strnlen(s, FIELD_MAX(GUC_KLV_0_LEN) - 1) + 1; /* \0 */
> 
> We're mixing up units (dwords / bytes) here.

oops, it supposed to be to_num_bytes()

> Also - should we error out if the string would get truncated?

it's a good idea

> 
> Thanks,
> -Michał
> 
>> +	u16 len = to_num_dwords(size);
>> +
>> +	if (IS_ERR(klvs))
>> +		return klvs;
>> +
>> +	if (avail < GUC_KLV_LEN_MIN + len)
>> +		return ERR_PTR(-ENOSPC);
>> +
>> +	*klvs++ = PREP_GUC_KLV(key, len);
>> +	strscpy_pad((void *)klvs, s, to_num_bytes(len));
>> +	return klvs + len;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> index 713ef7f7b9f2..1c576456efc5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>> @@ -19,6 +19,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>>  
>>  u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
>>  u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
>> +u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
>>  
>>  /**
>>   * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
>> -- 
>> 2.47.1
>>

