Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D30DC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07210E3FC;
	Wed,  2 Sep 2026 17:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2g7z01u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5F10E3FC
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371985; x=1819907985;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xqpGXdHlKR5QO1b5qYAa7U2aZaNnTTwycXPCbrmM2CY=;
 b=T2g7z01uo90+FJCDPG2qPB0JqZjmdChBOgXEx6jXlcq/18lE5q6y0hiv
 TmG2EBbuXJ4xgmNoqm36cnitgtI0CuTn1FK1Q+wMf2v94trchJGYZq6R2
 FqOncLPX7bq+mjFJtR8J20bGpV4ao6hHCzhF1wcQEKRBhYZk3smzvAKw6
 zpDj8a703V8bkdI6tZ15JwYUlW/QXITEsEcM3eSFCzjnT5xoCyHK+3CU0
 w7iY81INRjGbaxcp0Q/A2C/CDWwL36GcPdLZQefzgS3f1pgM63BGSxlRv
 y0qhy7KY334JpNadNNiQgq0l7ETIEU0aNEips4lsQac/nJ8GqHoW/aZW9 w==;
X-CSE-ConnectionGUID: SYj2CBPLTt+BoBH98XuzTA==
X-CSE-MsgGUID: IFCb05jGSoeax9C/obkBUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99503785"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="99503785"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:59:45 -0700
X-CSE-ConnectionGUID: MhcHUV2ASa+x8cADD3Upxg==
X-CSE-MsgGUID: set5OHuhR8GmE09Y7cnUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="307687208"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:59:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:59:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:59:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ6hEWqPq/HKEbGx2o2CsLeJ/JHbBkUlZ79GzeQU7yU7skhKZi/v6wKsMw62dnU+4d3t5KSbXPCLTjaGNSorvv51avwNR/sYuVHJAylaWb51I1O/ExLV9sKUxmHFYdWdPmyiLjKIM6osMPPGZvYsxAdXIxajdADBOFdVqwiqt/9deYqIYcEN651UqLUE9LXvEH4x9COw5GbgSy2CK5D2nKH54bKFvurjjPsopYRXGvXG1LzZ9oPfFs9FF544lzyNjhYSYcLF3+jZOC1hAX+i+j1UqwFCl7tI/qf0HoFi2KGSJdOhCoXSgeEoIhGZf6er7SRRiF4o6t0LqawfmieH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU9qZ8iuKUcWFZJNzW48Hw2fiR0uGG2bNcM0zI+bZfg=;
 b=u3SlruZUGdL01UWKFSLPHqab4T+i8FdVxsHhb49S9g2q5ifI/w9OhQlt8uxN3hCv61aA/7Pqh4fmt6r4XVFk1j+QUJiaH62sv7O2qAYIz0miX+np1xCHA2tdKp7t/qJcBH+6bKLcCzh3pxwK9b35a6XjmplAVwW5ANtN+FFdG0Kx2YZZU+ixYWsatsE4ZfUG0hsuVDTtpGQMqZpyd2nk0sujIpIaqDrh1WWQD8oUCM+oNdqBloTUPT6HES42Vvc7H5VPwV7qULyW3kad0odApTaNrF6bTmOAnQj8bm71sCFPiKXHcbudmdWKHBZKU+LYRxm0RiEci91fAQ2AfVkx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:59:41 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:59:41 +0000
Message-ID: <bf17ea90-0ce4-43ff-95ea-4f3fa9f60511@intel.com>
Date: Wed, 2 Sep 2026 19:59:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe/ggtt: Split GGTT into usable and shareable
 pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
 <20260901164435.1395260-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901164435.1395260-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0084.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::37) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: fd851978-49cd-4f9c-c359-08df091bf654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9YvlC3t5Gb7yRbbT8iOss1A/YmkHTM5OLepIaZUyP1dqvo0RmLDDMEpmDJCRN4pQPAelOt+/6+tHM3XUsliYWzlY4RhHRfsWEpX2peBFHL9R+CRHCN9V+a5ifi1xdodAr2aWQt8J6IbA0J8TzaTn0wyNwGd1KedU7EzsL2EwzdkS/pCkSV0ktJEzdXLT2QZ2M8QTFtWxFK0J9FSXeWkGxueKZT1uDDfzxh6UAnw7EhSpPddyNxMh2KbZk1yHmCFOOOoP5uFrJ0lIlboBLM4Sz0OBWZjh8MF1WBdkzJe6RcEyE3KTgO38wrbTuerx7lSocx5H63Wvghbntkuaxk/KqbqoWpUKXjOdUhDLWKRrc0Nm5jGcjvI7KwAYmlV0641cyMEQwycVDBeVTwHgOYyMJNGCbvQ2BFGLBQSrSG74zk0ZHkBMBzQzY7GyDqspFjAVwOsfzRuECXTL16zF/Vt7SqyI0MxUoWmLUMO8SD0NHH2E+/29QaaEergWloT67vm3eFUbDNE4mTWtO1pGEprIk9eNOmhg81SjzLvt28QiUMAvqDAdfbMJGpCa4Rqdx8BJpXpGRxaGVHtt/pjATcUXNAx9mwNStF5DWVXwg3ZeQaXRksjkaRsWgFsg9XtupjwuaVddl8ZjA9SaJF/CXtXMSvsj4ACChXzYnreeXtFMesA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJGN2g1RE1taXhGMFVXS0xkY0ZWKzhRR3QyUUs4OFdlS1hRdTVOTXBVNU5o?=
 =?utf-8?B?OHpsYWlvN0ZvM0pScGhYQ3RYaUtJYm5NU3lOdDFFS3cwMjg4MEtRckJDdVpn?=
 =?utf-8?B?QUk3K2I5MzZ4SDhRbHRhd2VuUFZ6SjhjZyszcjRNSFB5c1c2RjZVZUNaRkpm?=
 =?utf-8?B?K1ZJMWFXdjZEUGY1ZzBNVTlrT3lCZk94QWlCb1kwTlpLUjhPaFRwUk5nTHBK?=
 =?utf-8?B?WW1WWHQ3Q0MzYXIzNXp4NXEreFN4emsvYUNBVklORUNqK0UwanU0VDQ0bXVV?=
 =?utf-8?B?YVc0NHFnZTBzakxlNVB4THlGSmM0YVl5NjVOdDhEMC8vakplK1pMM1ZmMkxH?=
 =?utf-8?B?Tld6VVg3TG5mbnF0MmIxREkxOEN3aTQ1TlE1eUw3Z3ZYYzc0WDVIYTMxT0Zx?=
 =?utf-8?B?TlFKRVJqQ1RmVytqS1MvN1ZYcHJSaHgrUFB2UFRJSnZRLzhocytyVmczUGdy?=
 =?utf-8?B?cjF2RXp0eHI4YXNJWDI5QXFCOENLTS9DOWZyK3Q1RVpkMWdYTzRVYXRtSkJR?=
 =?utf-8?B?KzJqMzBKV0xWZnA2OGdHZmd3REtVaTJ2SCtKdC9yMGh2c2Y3N09pUjlRbGl6?=
 =?utf-8?B?ZGFNcUhUMFRDUDQ1Ri9oVzNUQzU1ZGM2Um1ZeWY3VnZjSEZmek0xVW52Zndy?=
 =?utf-8?B?amx6bzRoMXhwUWxPbnJMM1E1dXlRYmw0V3A5TkVuS2hJbWNZSURmbU1Zd1VG?=
 =?utf-8?B?bkdYMzFJd0xGSDdZd0FiU25vS3JUelA4dlJpRVlYdC92NTJQd1VtNnBNOTlJ?=
 =?utf-8?B?SkoyUzBjVzJjbjVpazQ0UWVlWGFWTmo4THFJVXowSTRodFl0cnRpM3NSZmJD?=
 =?utf-8?B?aWVCZFBCYnpMSytxNnVyTnVpaDlHUmR1b2hxY0FKNDYzQkN3R2dwc2oxS0Zm?=
 =?utf-8?B?WTBhdzlCb0U3UTd3M3g4b1M0d1FPL3BQS2c5Q1BHSWNQbW02Z1NDWTNOdU5u?=
 =?utf-8?B?ck1mSXJYQks4U2lDeDY2Qis5ZWJuUHMvWW1iZzBsaVY0ajQ4L1pGV0ovQWE4?=
 =?utf-8?B?TXQvVms4Y2N2TE5Pb3BLcFRrTE1tcmw4bXVhUFlWVExPWTBUK2kvOE10YXZK?=
 =?utf-8?B?V1lTWlN4empUdVVxUzhPQTU2R3RKZGFlTFdlL3NVZHB5Q0xiZUV6b1dTbmdF?=
 =?utf-8?B?UkJPUFV6R2NnYlYvNTlRUlVYazREUGJhallxZlNaMkJheDRwakxtdUhQOElC?=
 =?utf-8?B?NmgzZHlZbGgzU082YnZqM0lMU2RFWTdWYlRRVWpPbStyVnBEZkJ1M3IwUkVI?=
 =?utf-8?B?U0xBZFQrRWxzT3M4U0IxemlRclFWdmtRcnRtMEVhN1czOXQ0aDNDRUEyVHRt?=
 =?utf-8?B?YTVjSnJtWFRORFZTcVh4TWpqSWdmdkw1U2dLdnJKa0JSWkY5M05WZVoyRTlE?=
 =?utf-8?B?SUdhT0ZDSUdNMGJoNFpDWUt6MzNHOGJ2YSt4bHJlNnE4dGFKMTB5YUcxQ09i?=
 =?utf-8?B?K1hNU2YxTjhpS0Qrazk3KzgxMVlHcVZJVHdaQ0U3RzF4OHJGQ2tFckhZZlJP?=
 =?utf-8?B?ZG5XY045SUorOC9PVWRzdkZ5dUVHb1JRVTNaKzZXTWowcmNXNmZRa0Mxc2pJ?=
 =?utf-8?B?MlMyS0lwZm1FYXFGYk1LVWdmS2ZzOW5QTXBpTUtRZ3RScEpNR2VCRWlMT3Rr?=
 =?utf-8?B?MERSeHkrMERIa3AyUFlxM0tGVDNmSWlLZXZkUUNzVkJoMUZGemtzRnE3YVR6?=
 =?utf-8?B?clVleWJJRmdHYk04dDhqOGxmS2c1ZS9udGM4YlFsYVNlalBBRmxlVE1abHFU?=
 =?utf-8?B?cld2em5ZNkIwRnhrcm5mdTh1T1hldVZtQXRPZ0ZWdDRWdUNKOVRVdlg2alNp?=
 =?utf-8?B?NVl6UVNpMTFBSE15QnlDVDJ0cjlDRzgwYTNYZ1dIVEJIdkt2ajZWRW8rYWkr?=
 =?utf-8?B?RzYydjRybCtXNkNXeHhoZy9xVnRYMjZtSUZtc3hreFg2bTg2c2RzVHd5VXFP?=
 =?utf-8?B?b3ltcG52L2lsQVdhNFdoZS8zNE1CWGNwQi9kTFpqdDVobE5KS0VXNG1BeFhH?=
 =?utf-8?B?c21FeGg3UVMvdXdtUEl6eDIzMEVJOExzZXJzSitlQmQ0WldYWGs0Q3BpN1kv?=
 =?utf-8?B?MGxPd2VVVlBwVkxvSXZnQTlGRVRoYVdSL0hhb05pMTNQRVQxY0tNeklBMGNI?=
 =?utf-8?B?UytjMjc2dkxUSWF4RzcwOWZYT1NuMkE1b1BCN3hFTGhRTjQ0d0c0RlZyK1hM?=
 =?utf-8?B?blR6U1l0Uk1hWEwySXFPUnZpajJocmxWMVM4b3ovNDV4bHdaellSc0FabHRT?=
 =?utf-8?B?cWs1SWx0MTdrd1dxdDdyUWZXV2Y4eXFrdDdnY2tEUjN0ZFJidnErVUxBZTdG?=
 =?utf-8?B?OGRRay92dW9hY2RaeHFpM2ZpOEdmZEs4RUc5dmw3YklaNC9Ec2hsbFlyUXZn?=
 =?utf-8?Q?B1NcQELh3rK9UEXA=3D?=
X-Exchange-RoutingPolicyChecked: H+eZZuvR5bFLuKWH54BJtW4FRgfelk7+ZbjLnzWYpMgxouSRFu61REY/009DP6KjC6skMc2ay9Ry0Ea5YCxXC1Ae1ccQtg17kYH1wZIIY30VnwlS6qhBYMP6O/Oau4PTrc//ZWfI9i5KiAbUzbdFKJndnDHaUpuW+CZHgi7uwoqznEuJTdYPjFE5kHvDjSxnM/RCLnEgFIWVK0BLM5rDkHSfySvlmi3u+GXbWe6Y2teNgMFtXczKcl1YO0YABN04JxsF/ls1WMuQtlCltaQm2K5eBC9/6BrTFcsvcy5h9XDwO1rIe+lk6JlFxJF3LvfZ9I7wPeUuKaWVijUPLW3Jyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd851978-49cd-4f9c-c359-08df091bf654
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:59:41.2767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l6TjnRLhGyyuPe9oJ3jpS8ZJzl5q7/ZDOregA1KT/K3u0GYOUAOKQUADazi7E61+EB9o1RfakFfv6c76kBRuIf2fmVvWsmmBwBbK8sKWEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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



On 9/1/2026 6:44 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Driver-owned GGTT allocations and VF provisioning currently use a single
> GGTT pool. Split it into a usable pool for driver-owned allocations and a
> shareable pool for VF provisioning.
> 
> The pools are separate logical ranges and may overlap, but allocations are
> limited to the configured size of their corresponding pool. Allocate from
> the bottom of the usable pool and from the top of the shareable pool when a
> shareable pool is present.
> 
> Add separate insertion APIs for the usable and shareable pools, together
> with shareable hole-reporting helpers used by SR-IOV PF provisioning.
> 
> v2:
>  - Rename ggtt->usable_size back to ggtt->size.
>  - Remove the ggtt_insert_node_in_range() helper.
> v3:
>  - Introduce the hw_size struct field instead of the ggtt_accessible_size
>    function.
> v4:
>  - Set the shareable pool size only for SR-IOV PF,
>  - Return -ENOSPC instead of asserting when a large BO no longer fits after
>    end is clamped to ggtt->size.

nit: you may want to move change log under ---

> 
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 184 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
>  3 files changed, 176 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 63e8bf193605..1f0bd876cb35 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -114,8 +114,10 @@ struct xe_ggtt {
>  	struct xe_tile *tile;
>  	/** @start: Start offset of GGTT */
>  	u64 start;
> -	/** @size: Total usable size of this GGTT */
> +	/** @size: Size of the usable allocation range */
>  	u64 size;
> +	/** @hw_size: Size of the GGTT range assigned to device */
> +	u64 hw_size;

hmm, "hw_size" suggests it is a HW size and currently it's fixed 4G anyway
maybe to avoid confusion:

	/** @start: Start offset of the assigned GGTT range. */
	/** @full_size: Full size of the assigned GGTT range. */
then
	/** @size: Size of the GGTT range for the regular use. */
	/** @shareable.size: Size of the GGTT range reserved for sharing with VFs. */

btw, maybe introduction of "full_size" can be done as a separate step
to decrease size of the current patch ?

>  	/**
>  	 * @flags: Flags for this GGTT.
>  	 * Acceptable flags:
> @@ -142,6 +144,15 @@ struct xe_ggtt {
>  	unsigned int access_count;
>  	/** @wq: Dedicated unordered work queue to process node removals */
>  	struct workqueue_struct *wq;
> +#ifdef CONFIG_PCI_IOV
> +	/** @shareable: Shareable range within GGTT */
> +	struct {
> +		/** @start: Shareable range start relative to @mm start */
> +		u64 start;

do we need to cache it? likely:

	shareable.start = start + full_size - shareable.size;

> +		/** @size: Shareable range size */
> +		u64 size;
> +	} shareable;
> +#endif
>  };
>  
>  static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
> @@ -239,7 +250,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
>  static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
> @@ -253,7 +264,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
>  
>  	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
> @@ -355,16 +366,31 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
> -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> +static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
> +				 u64 shareable_size)
>  {
> +	struct xe_gt *gt = ggtt->tile->primary_gt;
> +
> +	xe_gt_assert(gt, usable_size);
> +	xe_gt_assert(gt, usable_size <= ggtt->hw_size);
> +	xe_gt_assert(gt, shareable_size <= ggtt->hw_size);
> +
>  	ggtt->start = start;
> -	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, 0, size);
> +	ggtt->size = usable_size;
> +
> +#ifdef CONFIG_PCI_IOV
> +	if (shareable_size) {
> +		ggtt->shareable.start = ggtt->hw_size - shareable_size;
> +		ggtt->shareable.size = shareable_size;
> +	}
> +#endif
> +	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>  {
> -	__xe_ggtt_init_early(ggtt, start, size);
> +	ggtt->hw_size = size;

can we move "full_size" initialization to __early() ?

> +	__xe_ggtt_init_early(ggtt, start, size, 0);

kunit can also be a PF
do we care if it will have no shareable range at all?

>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -427,6 +453,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
>  		ggtt_size = GUC_GGTT_TOP - ggtt_start;
>  
> +	ggtt->hw_size = ggtt_size;

move to __early()

> +
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ggtt->pt_ops =
>  			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> @@ -439,7 +467,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (!ggtt->wq)
>  		return -ENOMEM;
>  
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> +	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size,
> +			     IS_SRIOV_PF(xe) ? ggtt_size : 0);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  	if (err)
> @@ -652,16 +681,55 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  
>  	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));

btw, maybe we should introduce:

	/** @bottom: Start offset of the GGTT derived frm WOPCM size. */
or	/** @hw_start: ... */
or	/** @real_start: ... */

or helper:

	u64 xe_ggtt_bottom(ggtt)
	{
		return xe_wopcm_size(ggtt->tile->xe);
	}

to avoid referring to WOPCM beyond the ggtt_init()

>  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> +#ifdef CONFIG_PCI_IOV
> +	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
> +#endif
>  
>  	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
>  	WRITE_ONCE(ggtt->start, new_start);
>  }
>  
> -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> -				      u32 size, u32 align, u32 mm_flags)
> +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
> +					    u32 align, u64 range_start,
> +					    u64 range_size, u32 mm_flags)
>  {
> -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
> -					  mm_flags);
> +	struct xe_ggtt *ggtt = node->ggtt;
> +	u64 range_end = range_start + range_size;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!range_size || range_end <= range_start)
> +		return -EINVAL;
> +
> +	if (range_end > ggtt->hw_size)
> +		return -ERANGE;
> +
> +	if (size > range_size)
> +		return -ENOSPC;
> +
> +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
> +					  range_start, range_end, mm_flags);
> +}
> +
> +/*
> + * When the shareable range is present, allocations start from the bottom
> + * to leave space at the top; otherwise they start from the top.
> + */
> +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
> +{
> +#ifdef CONFIG_PCI_IOV
> +	if (ggtt->shareable.size > 0)
> +		return DRM_MM_INSERT_LOW;
> +#endif
> +	return DRM_MM_INSERT_HIGH;
> +}
> +
> +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
> +{
> +	struct xe_ggtt *ggtt = node->ggtt;
> +
> +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> +						ggtt->size, ggtt_usable_insert_flags(ggtt));
>  }
>  
>  static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> @@ -683,7 +751,7 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
>   * @size: size of the node
>   * @align: alignment constrain of the node
>   *
> - * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> + * Return: &xe_ggtt_node on success or an error on failure.

we still return an ERR_PTR here, not an int

>   */
>  struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
>  {
> @@ -695,8 +763,46 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>  		return node;
>  
>  	guard(mutex)(&ggtt->lock);
> -	ret = xe_ggtt_insert_node_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> +
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
> +	if (ret) {
> +		ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return node;
> +}
> +
> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range

nit: add () to the function name

nit: "Insert a new node in shareable GGTT range." ?

> + * @ggtt: the &xe_ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Inserts a node into the shareable GGTT range.
> + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> + *
> + * Return: &xe_ggtt_node on success or an error on failure.

return ... an ERR_PTR on failure

> + */
> +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> +{
> +	struct xe_ggtt_node *node;
> +	int ret;
> +
> +	if (!ggtt->shareable.size)
> +		return ERR_PTR(-ENOSPC);
> +
> +	node = ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
> +
> +	guard(mutex)(&ggtt->lock);
> +
> +	ret = ggtt_insert_node_in_range_locked(node, size, align,
> +					       ggtt->shareable.start,
> +					       ggtt->shareable.size,
> +					       DRM_MM_INSERT_HIGH);
>  	if (ret) {
>  		ggtt_node_fini(node);
>  		return ERR_PTR(ret);
> @@ -704,6 +810,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>  
>  	return node;
>  }
> +#endif
>  
>  /**
>   * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
> @@ -787,6 +894,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   *
>   * This function allows inserting a GGTT node with a custom transformation function.
>   * This is useful for display to allow inserting rotated framebuffers to GGTT.
> + * Allocates from the usable range only.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   */
> @@ -807,7 +915,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>  		goto err;
>  	}
>  
> -	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
>  	if (ret)
>  		goto err_unlock;
>  
> @@ -874,10 +982,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	else
>  		end = 0;
>  
> -	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
> +	end = min(end, ggtt->size);
> +
> +	if (end < start + xe_bo_size(bo)) {
> +		ggtt_node_fini(bo->ggtt_node[tile_id]);
> +		bo->ggtt_node[tile_id] = NULL;
> +		mutex_unlock(&ggtt->lock);
> +		err = -ENOSPC;
> +		goto out;
> +	}

maybe as a preparation step, convert this function to use:

	guard(xe_pm_runtime_noresume)(xe);
and
	guard(mutex)(&ggtt->lock);

to minimize risk of mistakes?

>  
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +					  xe_bo_size(bo), alignment, 0, start, end,
> +					  ggtt_usable_insert_flags(ggtt));
>  	if (err) {
>  		ggtt_node_fini(bo->ggtt_node[tile_id]);
>  		bo->ggtt_node[tile_id] = NULL;
> @@ -948,24 +1065,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> +#ifdef CONFIG_PCI_IOV
>  /**
> - * xe_ggtt_largest_hole - Largest GGTT hole
> + * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range

as there is no 'usable' variant of this function, maybe it is
not worth to rename it?

nit: remember to add () to function name

nit: maybe move closer to print_holes() to keep them under single #ifdef

>   * @ggtt: the &xe_ggtt that will be inspected
>   * @alignment: minimum alignment
>   * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
>   *
> - * Return: size of the largest continuous GGTT region
> + * Only holes within the shareable range are considered.
> + *
> + * Return: size of the largest continuous shareable GGTT region
>   */
> -u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> +u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>  {
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
>  	u64 hole_start, hole_end, hole_size;
> +	u64 shareable_start = ggtt->shareable.start;
> +	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
>  	u64 max_hole = 0;
>  
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, ggtt->start);
> +		hole_start = max(hole_start, shareable_start);
> +		hole_end = min(hole_end, shareable_end);
>  		hole_start = ALIGN(hole_start, alignment);
>  		hole_end = ALIGN_DOWN(hole_end, alignment);
>  		if (hole_start >= hole_end)
> @@ -981,7 +1104,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>  	return max_hole;
>  }
>  
> -#ifdef CONFIG_PCI_IOV
>  static u64 xe_encode_vfid_pte(u16 vfid)
>  {
>  	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
> @@ -1120,27 +1242,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>  	return err;
>  }
>  
> +#ifdef CONFIG_PCI_IOV
>  /**
> - * xe_ggtt_print_holes - Print holes
> + * xe_ggtt_print_shareable_holes - Print holes within the shareable range
>   * @ggtt: the &xe_ggtt to be inspected
>   * @alignment: min alignment
>   * @p: the &drm_printer
>   *
> - * Print GGTT ranges that are available and return total size available.
> + * Print GGTT ranges that are available within the shareable range and return
> + * total size available.
>   *
> - * Return: Total available size.
> + * Return: Total available shareable size.
>   */
> -u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
> +u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
>  {
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
>  	u64 hole_start, hole_end, hole_size;
> +	u64 shareable_start = ggtt->shareable.start;
> +	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
>  	u64 total = 0;
>  	char buf[10];
>  
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, ggtt->start);
> +		hole_start = max(hole_start, shareable_start);
> +		hole_end = min(hole_end, shareable_end);
>  		hole_start = ALIGN(hole_start, alignment);
>  		hole_end = ALIGN_DOWN(hole_end, alignment);
>  		if (hole_start >= hole_end)
> @@ -1157,6 +1284,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>  
>  	return total;
>  }
> +#endif
>  
>  /**
>   * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c864cc975a69..c441e39fdd47 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *
>  xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#ifdef CONFIG_PCI_IOV
> +struct xe_ggtt_node *
> +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#else
> +static inline struct xe_ggtt_node *
> +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> +{
> +	return ERR_PTR(-ENODEV);
> +}

are you sure we need a stub?
the PF code that uses this should be under PCI_IOV already

> +#endif
>  struct xe_ggtt_node *
>  xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>  			      struct xe_bo *bo, u64 pte,
> @@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  			 u64 start, u64 end, struct drm_exec *exec);
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> -u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> -u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
> +u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> +u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
>  int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
>  int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index be0a413ee17c..a5f4a3d27c3e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	node = xe_ggtt_insert_node(ggtt, size, alignment);
> -	if (IS_ERR(node))
> +	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
> +	if (IS_ERR(node)) {
> +		xe_gt_sriov_dbg_verbose(gt,
> +					"VF%u GGTT provisioning failed: no shareable range\n",
> +					vfid);

do we need this new dbg?
ERR_PTR might be different than -ENOSPC so above message could be misleading

and we already print %pe in case of GGTT provisioning failure, no?

>  		return PTR_ERR(node);
> +	}
>  
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> @@ -729,7 +733,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
>  	u64 spare = pf_get_spare_ggtt(gt);
>  	u64 max_hole;
>  
> -	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
> +	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
>  
>  	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
>  				max_hole / SZ_1K, spare / SZ_1K);
> @@ -3549,7 +3553,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	spare = pf_get_spare_ggtt(gt);
> -	total = xe_ggtt_print_holes(ggtt, alignment, p);
> +	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
>  
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  

