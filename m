Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F1103FFAC
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 22:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9EB10EC49;
	Fri, 27 Feb 2026 22:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwiIwOnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134910EC49
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772230306; x=1803766306;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jq9l0bic4IfFKSEWD6+bBcKIzSShjnLO3UAX1bEkKF8=;
 b=gwiIwOnwJj57CDzxOMZ4/w9f1XaQhUIdNBm9c4c79vwJ78Wc5ZkuzHBQ
 jhoPLKO8QV7/0rSuHM/qkzlltIvQPUULW+MWePMTpV6sP3plOVb/dnSl2
 2fiF649XuxoImjOgDw/dz0uXmUCzRck2gwYkYuHM36Z8VgbWeaXygZ/lg
 qO+TZuiJP7BzFhPruw4moqyT4/YEv8iIKJPyeIpUApYUmM9NsYV15Dtcb
 muGYv3eCR8WoYPSajM1osHVN81FxplNLvQR3sPYD7EYX9Ya6fOUFx8x04
 Mj09yZZrHgc/nay20djTWev+4FVVOef8fHlYdCLknwb7VPMFNuoesQr5g A==;
X-CSE-ConnectionGUID: Q8fA7bhyQrqzwFe9/rt0Kg==
X-CSE-MsgGUID: xYw7EXxFS8yyNxi7NnMmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73233631"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73233631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:11:46 -0800
X-CSE-ConnectionGUID: CWFC1cCrSGum4X+p/4adhA==
X-CSE-MsgGUID: WEsOFMo4S6Wds+S9SLw2RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221165183"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:11:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:11:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 14:11:44 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0qmg+zq/aTbTbrbGJKlhTF6jwqhO456HYiSypHy2XZuwgMeIMrbf31CnEeLdBQJQyW0xgzahq1BMJ6OZvPJ/kt/duVnHSLZg6QKOFPVsD+7+eBSVWVXhiyzC76Umu8cwe2r1QmahsEtogE1nyIzk+V5wwgZ1vz85mArvVKyRrhubQycn4AIzNxG7b7QXZYQm9pwkzfhTSwDhp0poa4URaIeIohH/WXLvB8zEierjy8mYQg/5cIKd7YCBab72aawptSRsQmRVeIq6Iyj915a2GYUItrsOUEg9ER0SPoM8WAvp5imSIBgHWhgl9V6H/uBhjwzLD8NAak2nB+98Q3snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hJRUx4ct2lTnyZBDsDiNoS4xblAYsKgxWD44rgEKcM=;
 b=B+xh6KUxFiV/DH2MFXjV5VxvsF1uEQDvvKKeMelWhAAPnUEuhzK+VfPkEAiFByXy/7h6/iQWD11sVmAGruJctZeQlRNTmrvid3ZZ/o5T6QxYXhOB3NQyvl5+4WJ3PYC6IHCm8RflQAKPSL/KR3+LH27G9ZBcEDlCx2MDLdW9vhgv4ID+0d39j/YhFSokgL8r58RxdzRIlM16AzkLqtvHViP3+fA/r8diQ3orn4cCgEPP0BCgNJashydod1ddsbSqRp1oZboQjaD/ApcbPWXk24XmulRuxi2/hrl/npYxT72aR4pYt+WTl59tu7R5U7LOEBZft+N3WbdPEpczpstIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.12; Fri, 27 Feb 2026 22:11:42 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 22:11:42 +0000
Message-ID: <3d7dde05-c55b-4966-b87c-f72afebdda7d@intel.com>
Date: Fri, 27 Feb 2026 14:11:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] drm/xe/eudebug: Enable EU pagefault handling
To: Matthew Brost <matthew.brost@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
 <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
 <aZyfQaq2SkgMn42Q@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <aZyfQaq2SkgMn42Q@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:303:6a::8) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA3PR11MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: df58a686-4650-4dbf-8bf0-08de764d2ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: wMnejc1+TejZpClfNnzOAabxTQQ5cY15VSAlO94QVWmv7OKlT35YRPAaUL6HBKK2SX4xJVUln+XSGtnAvMBW9m/1cFAm0+Dxg5/XuHmqlRVSjm7KdkoP+klHuaX5CK0uitdta8yWaogfkZJRAqohojgxtxh+Eet2wXy7g0llubsVVsaRGiqgEf6CUbkLYH1I6kiKIQYXPGXJUL7FTTJ9GleTfr0unxuVY9OUsYpqNutd2XbSVn+TTBE9niuYDXepwwBohk2RgJ2kId4oXlZ9785LV5mo/tmVdUGI/2OkW6DgninpsUeggH/qXH+RObZbGZTW8HWa+mpIiyneWZHr9Sg+wgsk7ymYZUI8oPNJObXVUxMHo5oYgWOsr+NO9LRC9PL4gx5Z3hgpjs9Myd+9y2JEPOFWG/vFcQ876Vp6W3S+hRCEKWr55a99Ltf/SFhMznK7G8EBr9C2WACKoDVQBODnsV/YP+UEEKtMpjqiU0pxvkUcGH1UfTaGoXP/ACW9enfty02HQmviUmajKzxBvM+HBLoWZCbB5tdi6k38cSn7ts9N6AOXSr6S45rh0UKNfycs/kN0WxV/YWhe0mITayIri58NW9fQoZWq/9PDilYLYRdByIZTv5dhUNIY2x5hx6CD+c6HXm8R3Rs4w23D3HSd0UEvoDfRZ6YeVpuLMLtysc0P8fqMb44ZWniKqrnhoMkSOGxjt13nkFEUjiOywG+ZR9MH5FVnlfAfVXJdFFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blI4M3g2bW9YcURZT0RKOHBKelc2eU5UVUJLQnhjR0Fuc3FhUytGZEROUTQ0?=
 =?utf-8?B?TDgxUTByRjdIRlcya2hrY1NzdE9Wd1NhbXA4dDlRR29vV2ljelJ6YSt0SFdo?=
 =?utf-8?B?dzVUam4rN3RjUjhpbElDcGlSOUJsR29BeWJpTDJOMmFsODZXamNadGQyYlpD?=
 =?utf-8?B?Q1VaR1N5dFRVeXM2Z3V0eU05Zk5pQmhXaEZEM05MVmFzbk1udThUY2NxRzcx?=
 =?utf-8?B?TVpvdU1wSGt2ZVJoZ0xhaWJZb1N2U2FiaEJpcXJIZ1I5MkVqZ3Nvc01UZW1O?=
 =?utf-8?B?QVFjdzlhc3FScnVmTS9nTm1yOUFBNE5EK2pDbW0yaEFLc3NRY052SFRKdnJP?=
 =?utf-8?B?RXhnWHA3bmVndVA1OUQyazZjWW5nN3MyempLZitSSjM1ZExJeVV2OU41S3ht?=
 =?utf-8?B?RENvZWc0Um1vNHA0Z3N0RVNIUUNOUGtYSTUxQ3hMVWpZMWdyd3psNVRFa3Rq?=
 =?utf-8?B?dFA2OFRnOWVFSmkzMHBFcFFXQTdoY1lYUW0vZFoyVlhxSWpZTWZ3OU5LWFlz?=
 =?utf-8?B?QlMySm8ySmt4YWZWQ2l1SzhYWHVqVjZTbmxnT0QxeW40bFRmU2RtMDlMbW1l?=
 =?utf-8?B?OTNmWkdSQW13RjZrc1dtSUZxbXBxRkxnRENHZVJUV21idTVxT3IzNnE1cG1s?=
 =?utf-8?B?VGwvREtCLzhvNzB6aXhuNjZzV0pSZzdxcWpLUFg0SEYzb2ltTGtQTElZL1NF?=
 =?utf-8?B?dkR1aFFJWloxMmkzTEVrMlNudkhvOERkK3UzdER6ZXhOWDU5aXF4ZmFZODIv?=
 =?utf-8?B?REdJNlI1VncvZ3dkQkZEa045cXk1a1UrZW9uYTdLSU9LbUhkUmdJbHFLenM0?=
 =?utf-8?B?dmZQWHJZK1BNYmFSZkV4MzJNNHRkdmR0cDZzSG9NbW1QZTM5ZlYzYy9YWHhP?=
 =?utf-8?B?Mm1JNFhiallKVVlHSGdKQ2hqSFg5YjRXN2J6b1BST3ZEM0JSRExtN3dXak9j?=
 =?utf-8?B?RE9adnRvSE91STJXeE5rQUhUTzl2MzBBR2xGanRvR3MwSTVNaXlVMGJlNlVo?=
 =?utf-8?B?Y25zWnE3SDE0OUE5K3JCamg4T2FJRThDMGFQOGNuM2ozMUh6NzZGdWg1UHY5?=
 =?utf-8?B?ZVdGM083OXl3RmQwMmo2QTB2YWxrMkN0LzhwcldyRXNsOUV1MkplaElJZnhP?=
 =?utf-8?B?Ry9MdVFwZ1FpR1VzOWhOZUF0eSsxRmNac1I3TTdhUWNzMlBMZklmV2dyZ3g4?=
 =?utf-8?B?MldlRFZudFpKRjVod3F0eFNHOWN3dGRjLzEzMlR4ckw3SlU2Zmg1L0VUOHRo?=
 =?utf-8?B?c3FiTW56WEUySUxLb0t0UXdwNDBUWWlRWWdxRzFLMTF1Z1c0QU95enNoMUUy?=
 =?utf-8?B?cHhSMzQ0Z0dtb0xXTVRHZWJZemhvaDMxelczejNPR0l4bEk2UEpPSjVUc0xO?=
 =?utf-8?B?ZkFya1JzaEhGN3ZKdThkaDV6R09xSU1FaUtaTTJHQVd3QURVaFV5L1BFVVlt?=
 =?utf-8?B?dkViaWxhSnBUSVpBdWEvaWpNakQ2UlBFLzUwZzB2TlBFUTFTNk5tSU1sNUF6?=
 =?utf-8?B?ODg2MXZvenlXeVllMVJlSi9oWWhSbFBYSE5QMmNENm9Fd0wvWk5TcHpFWktS?=
 =?utf-8?B?QlBtQzkxSTFkb2g4TmZtTnF4ZGlTd3JTeHpxajgvS09UZS90bXdlYjg2Rmg2?=
 =?utf-8?B?cU1ZdnhOVTg5azJlaHNaV3ZrUkM5V0thb0hlaUlGODRUbUdtSTQ5NHRBYWQw?=
 =?utf-8?B?YXNmWnFJVVFuZGMwQWxIdjlxUytEWGtiem9CeE1CeFo0Q3A5UVlTSTE2SjZE?=
 =?utf-8?B?N0N3a1hPT2tDdCtmYVpnOGYveHJzU1dzcng3Q08zTHBxc1owU2syVVJOdHdL?=
 =?utf-8?B?Uy9sRjV6TGdEMk5kNWNuSk9BdDkxOHBlVWJrMU1IRFdHNDV2Q1U3NnhhcG1H?=
 =?utf-8?B?TTcyR3E2Y3FoVnFtdXJMYXFlUi8wNGZrTnFQMWp1SDVhQVA2NUZjV1BBemgx?=
 =?utf-8?B?VEUxM0hOUGl0cGp5cDBaSjFXR3JuQm5raUc5eTQyekh0V1d6TWQyREU2Tkt6?=
 =?utf-8?B?VkJRTU44VEs0bkxQdmNuOFowYlZ4RThzdTdsaVkyRlczWGxBbU02dzBJYkF3?=
 =?utf-8?B?RnNjUnVRSTFneWZnTGd3YWluc01EMy8vKzlvVTh5SzdlV3IvT2NZemwxS0sz?=
 =?utf-8?B?eXJ4ZHZpczlxci9yYllQZ2dZRnhqRWZUeVNUV2pVK1F6QnA4OHM2OXhMUXEz?=
 =?utf-8?B?TFVWaE40NU8zT1VuYWRLbHJWOVA4MWdvckZGWkdIVGRIRW5ncy9oYi95VGJo?=
 =?utf-8?B?UDE1c1RmbjFNTkxaa2U2Q2RPT0ZEdkRPM2JtZTVJd2hKenNrVUZLcmszOWIr?=
 =?utf-8?B?NFUzL2VIUlhNS3Rka2RCNVp0WXdldXdpUmk5czJBVUVGeUw2YkVQalAyUi93?=
 =?utf-8?Q?mW6EYZLnQvUlyGQ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df58a686-4650-4dbf-8bf0-08de764d2ffb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 22:11:42.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofQuEXVDpIoRJTsdXPR2ap9HFVeyG2oIXvABh0ZVTy8nvyOcznZxBsUWC+MsnCNntlG0OlBZAHLRSGqpOwXTfVE9qwUI0XSH6O/4h6Vujvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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



On 2/23/26 10:41 AM, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 04:03:17PM +0200, Mika Kuoppala wrote:
>> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>
>> The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
>> access will halt the corresponding EUs. To solve this problem, enable
>> EU pagefault handling functionality, which allows to unhalt pagefaulted
>> eu threads and to EU debugger to get inform about the eu attentions state
>> of EU threads during execution.
>>
>> If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
>> after handling the pagefault.
>>
>> The pagefault handling is a mechanism that allows a stalled EU thread to
>> enter SIP mode by installing a temporal null page to the page table entry
>> where the pagefault happened.
>>
>> A brief description of the page fault handling mechanism flow between KMD
>> and the eu thread is as follows
>>
>> (1) eu thread accesses unallocated address
>> (2) pagefault happens and eu thread stalls
>> (3) XE kmd set an force eu thread exception to allow the running eu thread
>>      to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>>      TD_CTL register)
>>      Not stalled (none-pagefaulted) eu threads enter SIP mode
>> (4) XE kmd installs temporal null page to the pagetable entry of the
>>      address where pagefault happened.
>> (5) XE kmd replies pagefault successful message to GUC
>> (6) stalled eu thread resumes as per pagefault condition has resolved
>> (7) resumed eu thread enters SIP mode due to force exception set by (3)
>> (8) adapted to consumer/produced pagefaults
>>
>> As designed this feature to only work when eudbug is enabled, it should
>> have no impact to regular recoverable pagefault code path.
>>
>> v2: - pf->q holds the vm ref so drop it (Mika)
>>      - streamline uapi (Mika)
>>      - cleanup the pagefault through producer if (Mika)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++
>>   drivers/gpu/drm/xe/xe_pagefault.c       | 31 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++
>>   3 files changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index d48f6ed103bb..6adf3bf73b1c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_pagefault.h"
>>   #include "xe_pagefault.h"
>> +#include "xe_eudebug_pagefault.h"
>>   
>>   static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   {
>> @@ -37,8 +38,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   }
>>   
>> +static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
>> +{
>> +	xe_eudebug_pagefault_service(pf);
>> +	xe_eudebug_pagefault_destroy(pf, 0);
>> +}
>> +
>>   static const struct xe_pagefault_ops guc_pagefault_ops = {
>>   	.ack_fault = guc_ack_fault,
>> +	.cleanup_fault = guc_cleanup_fault,
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 72f589fd2b64..9dcd854e99f9 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -10,6 +10,7 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_eudebug_pagefault.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_gt_stats.h"
>> @@ -171,6 +172,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   	if (IS_ERR(vm))
>>   		return PTR_ERR(vm);
>>   
>> +	xe_eudebug_pagefault_create(vm, pf);
>> +
>>   	/*
>>   	 * TODO: Change to read lock? Using write lock for simplicity.
>>   	 */
>> @@ -184,9 +187,28 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> 
> I've mentioned this before - this fundamentally broken if SVM is
> enabled as the VMA lookup will never fail given VMA tree is completely
> populated in the SVM cases (i.e., when SVM is enabled the first thing
> the UMD does is bind the entire CPU address space with a CPU mirror
> VMA). What will fail in the SVM case is xe_svm_handle_pagefault will
> likely return -ENOENT. UMDs from my understanding will enable SVM by
> default so this likely needs to be rethought.
> 
Thank you for your reply. Yes, additional implementation of eudebug 
pagefault is required for cases where SVM is used.
As per your comment, in the SVM + eudebug pagefault scenario, if 
xe_svm_handle_pagefault() returns -ENOENT (i.e., when memory allocation 
via mmap etc. is not performed in userspace),
eudebug requires a temporary page install at the address where the page 
fault occurred to allow stalled EU threads to enter SIP.

Two methods come to mind for temporary page installation in the page table:
1) Temporary memory allocation by emulating the implementation of 
do_mmap() / __mmap_region() in an eudebug pagefault situation,
    similar to the general memory allocation scenario in an SVM scenario

    - Pros: Follows the do_mmap() flow for memory allocation; only 
requires one additional call to xe_svm_handle_pagefault() after 
temporary page installation (simple code implementation).
    - Cons: (1) If the installed temporary VMA is not removed, a page 
fault occurring at the same address on the CPU triggers migration to 
system memory,
                preventing the CPU debugger from causing a segmentation 
fault.
            (2) The GPU debugger may fail to handle page faults for 
low-address regions inaccessible to userspace (mmap_min_addr issue)

2) In the SVM scenario, perform a temporary page install only on the GPU 
page table where the page fault occurred during the EUDEBUG page fault 
situation
    : Updating the page table directly without using the 
xe_svm_handle_pagefault() function flow


Could I get your input on these two approaches? Or do you have 
additional thoughts?

G.G.

> Matt
> 
>>   	if (!vma) {
>>   		err = -EINVAL;
>> -		goto unlock_vm;
>> +		vma = xe_eudebug_create_vma(vm, pf);
>> +		if (IS_ERR(vma)) {
>> +			err = PTR_ERR(vma);
>> +			vma = NULL;
>> +		}
>>   	}
>>   
>> +	if (vma) {
>> +		/*
>> +		 * When creating an instance of eudebug_pagefault, there was
>> +		 * no vma containing the ppgtt address where the pagefault occurred,
>> +		 * but when reacquiring vm->lock, there is.
>> +		 * During not aquiring the vm->lock from this context,
>> +		 * but vma corresponding to the address where the pagefault occurred
>> +		 * in another context has allocated.
>> +		 */
>> +		err = 0;
>> +	}
>> +
>> +	if (err)
>> +		goto unlock_vm;
>> +
>>   	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>>   
>>   	if (xe_vma_is_cpu_addr_mirror(vma))
>> @@ -198,6 +220,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   unlock_vm:
>>   	if (!err)
>>   		vm->usm.last_fault_vma = vma;
>> +
>> +	if (err)
>> +		xe_eudebug_pagefault_destroy(pf, err);
>> +
>>   	up_write(&vm->lock);
>>   	xe_vm_put(vm);
>>   
>> @@ -268,6 +294,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>   
>>   		pf.producer.ops->ack_fault(&pf, err);
>>   
>> +		if (pf.producer.ops->cleanup_fault)
>> +			pf.producer.ops->cleanup_fault(&pf, err);
>> +
>>   		if (time_after(jiffies, threshold)) {
>>   			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>>   			break;
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index 2bee858da597..9d2d29d35a4b 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -43,6 +43,15 @@ struct xe_pagefault_ops {
>>   	 * sends the result to the HW/FW interface.
>>   	 */
>>   	void (*ack_fault)(struct xe_pagefault *pf, int err);
>> +
>> +	/**
>> +	 * @cleanup_fault: Cleanup for producer, if any
>> +	 * @pf: Page fault
>> +	 * @err: Error state of fault
>> +	 *
>> +	 * Page fault producer received cleanup request from consumer
>> +	 */
>> +	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
>>   };
>>   
>>   /**
>> -- 
>> 2.43.0
>>

