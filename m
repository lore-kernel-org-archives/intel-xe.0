Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D64DC56207
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115210E323;
	Thu,  6 Aug 2026 14:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqopFvjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256310E323
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786027299; x=1817563299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o8VmzrOITgl7VUaoZCOi3sBKUHdNrV/PHau2m7r2A8w=;
 b=RqopFvjJTewT9d6YAa47v4gu8Psk6VmQV+TYQSDb9Ya1eBPJOruMdfSo
 eQf7C/vTcMMKe6zpFobYO3gtFlY/YNJ3eh4nP+FeHXfQil4AhP2Dm4bPA
 QNArJyveR5FC9y3AoD1LBbhWy20CTs6+hzKGW12zkiJp+S0HM1m9xjwXh
 VNXDe1rSv9R9uG6sXq8XEQcCEwxxYPtxqaSv4vj8aVRv1yoy1b8N52nEY
 jGUKnA1SwkfM09es9p0oGWGjityerP6pxpvjrqlbSegBe9tVoAPZRd8mg
 WNR6NeSKnr2pIpewLYfgzNSbkOP04PPzKfpo/H/33J/Z1guPGhKisntI8 A==;
X-CSE-ConnectionGUID: 8+4XJRS1Q2+Nyp/gmoeopA==
X-CSE-MsgGUID: 18tUa5R0S62DDpFibqjGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104158655"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="104158655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:41:31 -0700
X-CSE-ConnectionGUID: 2O8nZXq0QZ6htIktm4Zg+Q==
X-CSE-MsgGUID: cAMJ/+gzT4qzAFXDPNrSDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="257818469"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:41:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:41:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:41:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh2MaZ+7/gZTrJV/UoevujadV7s9BfGHs9/OroYG3QfB1YW5tmS12OAD1B+3aqK2TwNDwVMBr14ucNfkoa0SQ4GjBBhEkdVF5N+Q8rW+S2dnFXlWursPnc4J36oZsZEyK98qOPlT1OBBc+hTD2Hr6GDFlL9p3f+txC7nSK74pCxQ2x4l0eXqSLe9zLtiVUR5lYLS5npNFTz/19d85npz7737xcZyCF3FKkYwqe3ur3ytUCCSuKA+6440P7TPRjePoehvylAR2VyTqugVhpne9wKyQ8dpZrYyVu/68KxAbrxFA8SAdoPxhIkoKtpptS/i7tQjnkIeVX+GgrkW2XMXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LktQakCRjI9TtIwJpwWTFQVvuduCyxMttbkMU2VC0bo=;
 b=sODDpUxjqxEIlZ7+REE+2mHtrMhwjaKSlouebwzYLRVoZsWJaT/Ut3molnnNySNSNT0wRdl7Lqz0TuiYX8f0coqcawlAogjWVO3nXWumWu0mbbIwFcBg3trJyMHU3G1nGmkGuZMkY1Mz3/4Rj3L6vk5sE8mMUpNIkR0HxNqMiIr0GDuuybkBRbodUHnL1alIvnELYBCb2DtFJO3c/oQSBYp8O9Es+9RHnJa+5QsWfAfHUkNlpPHBRpxNDFwreOSdxzoLJMEP72HqIlPOSfsP3m4gPa1gl0zBbYFczDCrf6f7/txSEUhab5YoM5ZstyyNcjOpX3TwvhZT671zZKoSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:41:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:41:28 +0000
Message-ID: <77855354-32e3-40bc-8af0-d20624c69a7e@intel.com>
Date: Thu, 6 Aug 2026 16:41:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/sysctrl: Add better sysctrl error reporting
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0184.eurprd09.prod.outlook.com
 (2603:10a6:800:120::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PR11MB131308:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d9e301-6380-403e-d5f1-08def3c8cc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|11063799006|3023799007|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: e4a+IoYqmIUUnSn9/vHjUOwhQRqU2OyleemsxEJmQn/+craEX3owDayf/LyzTfOuLrl9wYs+K5SHhZ/a6MntxbNxqYyxc6DToqdHzEVLqcwVfA2K3z8jPAN6ByTPqVqdbV9sVU7/rB2nxBmu2SGnhx7V7FCup8sJafaHaa+GpMt90C/C47xyq8w0EIDqB1gKTMFAhlXrkddQ19QOPUXl230sWwTHOnsh0KJsqaq8b7HrkCKv4Peujdm/xQq4Pw8hlAfNcf3tEHz6GCNrLm/Kbj0uQlipfk+ML7KdflqPQV1UeYHGo25zMMOQEIwoAzdMIfR0M+gkRVGCNdxF78AWjLVezQbe4Jzipk5g4qctIpnLoGuaGn0hTsw58cZfqxIC0HwuXkiT7S53hJsC2wepiUyo/0JmHXEY7Q9+XQSzGXEmnNQzEtfhuXlkR/keL6nhsah3lf3+hbg2FNGfvpOJWxZ/ylm8OH4HIA05vAAPdZMkD961mNKuK8ePrxOHylkuYW6t6cDFAZEW2xuEbXltGKu82znJ3LBM4zom87B7sFue+GIHIKVCjP0hOC8xsg8QUaxExRbIXxwJGTVUxYLjA5U8+q60gwrmq0a//xpqf0HAuUQZn9mPMtHV+oK9uaI175eWgX4yZH2927km3SAZththDQx660tS8AhkNRZCrG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(3023799007)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNSb2xUNkYrZzN5UGZlbzR6THBMcVlGakZzMEFBOE5rYXV5Z0FqZlkzV3FH?=
 =?utf-8?B?dUJZTmJHaDRNWVRGYk1uRjZiWW9abndhOHh4TU5pclVLU3J6aDd3dzNOWGtq?=
 =?utf-8?B?U3duazBsUEpYNERVSUx2d1pRVkRKdzFGK3MvYm53clZHNWdmL3dEVUsvbmxV?=
 =?utf-8?B?TGxOMGFHN2ZCeGhPV3o1VzBuOW1nVVdleGVvdHEvYU9DK2t4MG9rTmNuMUsv?=
 =?utf-8?B?aXhDWGt6Q2c1Z0FLbURuN3B3SUUzZEJ3TGJEZ1V4eG5mNlJxcTJkRTJ3WGla?=
 =?utf-8?B?NkM4aXg4MTI0bDAxT3QrL3NKM0E0WFlvYzRKRE9Ea094UXN1aXZRM0ZPalZo?=
 =?utf-8?B?d1NYbkxBQ28rN2svNXh3R1pVSGN0ZFJIUEpaVDJCMEFkRm5OSGU0clY0ZjVu?=
 =?utf-8?B?LzJOSjJDVmZPSXZpdjV6NTFaYUp1bFAySlpvbk5IbFB0bW12ZjBIM2p0UWJE?=
 =?utf-8?B?Y05pdURZRDAvc2tRZWpzT3VaZ3hWNDNpWW51cXJjQTVwTXhaa1NsaDJwZzI2?=
 =?utf-8?B?WFkrT1JoZ084cTF4aDVyMFlaVUFLR2hrWVpOdTRpZk5WeUY0aEw1WjhQUlZC?=
 =?utf-8?B?VmUzRFRrZkJUZUx0RFYxeHVoMTZZREtaeHFqMGlHRFhYcWplWWJmaDZZYk1l?=
 =?utf-8?B?UU9VdENLM1g1VVgwT1h5dUc2Zkg4V3lycXN1L2pKbEt2VjBTNHpGWHRWM3Ni?=
 =?utf-8?B?ZFprTThJanFWMVNIZ0tlK2RlbElubHJmdUVQbEUzVVdVbXBiV0t4RXRoQnNu?=
 =?utf-8?B?UHlYZTFhTjVwZ1Z1R2Q5TWhkUkFZVldPbk40V1ZsL1hDWVI0YzJ4Rno0MlE1?=
 =?utf-8?B?Kzl6Q2p6d0kvL0h5d2pQTVpFUVJLbEI4YVBlRm9BNlh2UUxyTzJLR210akhJ?=
 =?utf-8?B?d1owdUYzazBIakthTVNCTWR2L2F2VHVRUG4vaFhCVGdEd1d3V0VaZTN4ZGhM?=
 =?utf-8?B?ajZkemNKNWtsTTFpbjF0WHJIalVJNHgwTThlbFdndUtHSHVzbTk0NkNqclhh?=
 =?utf-8?B?QUQ4VW5uUGwzaGo1WXk5WDdBRkFCWHdTN1UvajRZTEFkdGlPZ2ZhV0VpZEh5?=
 =?utf-8?B?QWdpOW1xdDlNeFl6bUxrZ0RYdnZia0paZ2JrWklDL2FSUlZmNG1uRU45aDJa?=
 =?utf-8?B?UW5DdUFXQStFRnlnWTVXckZaK1VSUDhYZzJNenlZNkh3dTc3ajFIQk9TM21s?=
 =?utf-8?B?QVNIZjZWckpTUlp2b2NPVDlWV1R0dU1HWC9OaHN1akV4Yi9XSUk5QUZrRlFi?=
 =?utf-8?B?TnAwZXdlWlpONDZaRGhmQkNCSFFneHorOVcraVQxTzFBZWE5U1FQYkM2UDFI?=
 =?utf-8?B?b3lONDVpb3pQdEo0Rm9sZlQ4K0lGd01yb3FIZDE1bXA0aDRUYXFNUVNqK3pu?=
 =?utf-8?B?Y2FtTTBNbzQ4cTRaYXlIZFMzU1pXM2tubHk3ckxHaTJsaWg5K0FxbGZoSlZO?=
 =?utf-8?B?RHZoSUtwdWp0OWJ5TVl0OWtUQkROai9QNUJiamxrWlViaEZkTzBxelQ5QWRu?=
 =?utf-8?B?clRzbnIxUVJOTHlTTDgveXg4MlRtS2JtRzJMVTcveVB3ei9QQkc1WStFWGND?=
 =?utf-8?B?cVZlVnRjV3RhdUM0WDQxSVAvNlhLeElqS2dUTXovQkdya3pGZkRwRG5RaWtn?=
 =?utf-8?B?RmhsMDdNRTREaVNyZkdzNTdReXliSmpLMjJMMU5EYkFoYUd3WnpqSy9qdUJs?=
 =?utf-8?B?VXpJNjBqR0orMEhoRS85WGRIN3huK1lZSjBNdXB3bjAyK3NISkdyelh3bFcw?=
 =?utf-8?B?YWRpZjdCbDZMY0VybWErNUE1bjY2VnE4eHNkR1gxZkI3RXdTM1F6NDNmbFV6?=
 =?utf-8?B?bUduSDRvNDVBMXVrL2tUZlZvUEIwQTQrOFJmbEtwaUtBd3pnbW5ZNzNwSUZX?=
 =?utf-8?B?L2Z2ODVsemhDVDVTejBiNHNTR2lRZ25oUnQyblR3ME9FbVNNZFkyeXc5eERV?=
 =?utf-8?B?OHpkbzhRY3RvSkM1UEhiSGh4eUI2UHN3WE53RTZNdjE3Nk9nbU1RR2pnU2Zm?=
 =?utf-8?B?ZEVvaEp2UWV1bmZPTklHRXNHZHo5d1piODVIK29lWDZFZ2hCWE50NUVjdXda?=
 =?utf-8?B?WVNETnppYU0rU0N4aFBteWdacjNORU93U0RMdDM0Z3JRZHhPTm1DYngzZzRy?=
 =?utf-8?B?QzRFTldOZGUyS0dpOVJyL0ZQU2c2bzNNenFTTmo0bGNkUXl0R3dHcEQ1NnRN?=
 =?utf-8?B?TjZXMkQ3ZGNBNGdBYjI4RlpIdGZid2pjdGJ2NnRaMnNvckVnQktXSlBuYlRG?=
 =?utf-8?B?TmtJYUIvQVhwSDVGYXM5TXAyRXA3dGQxK0t1L0FiNEprcms2QmtxRzFZTWgz?=
 =?utf-8?B?ZmtjSW5XQ0Y4SEdiQTZ3eWJzUVFhS2pMdzl4bHphWnZyaklqRHBtNHZPT3Nw?=
 =?utf-8?Q?7eQxGCA7NlGz1U/0=3D?=
X-Exchange-RoutingPolicyChecked: B/4NV7iPvwpi1R4fI4WenZ1y4BClh3cOVy7NroWp9aLom5jZRRNB4nzI1KzuEtstB3EJMXbnv+FMxrmRZkrADHfDr96j/lmb0DdmwHalCkt98UpmOzD8kbZTF4HgxsBOD4cIP6v28mailkULRb0i33wrSaCO5l++UETCGmqAu+7P/5Fqvii4PgR8yIW4nXVo9lyXU23IBBKKZvITmev5tRaDAjWy3gsq0kukAMwbbyX32+mp3PAToDDGoxk2NQkMlspw/Wwz7xjnZeqIHvHLABsL+BMd5fbwZerse9YcHrF8wcW3hhWgRkn4+Ix1ZDv+ca+Lu5Bht634M8/YVegoew==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d9e301-6380-403e-d5f1-08def3c8cc61
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:41:28.7395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rvkbs9LiXYCrZzIsp+3eUYCwRVIt+xuyjcHB3naG2zI13ler1OB0Pt1t/I8juLK/r6uDnfs3qrhnBtaZLlN1kd0dm0bSO0q7lcC7h3cLes8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB131308
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



On 8/6/2026 1:00 PM, Mallesh Koujalagi wrote:
> Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
> tools can reliably detect and categorize common sysctrl failures.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c   | 11 ++++++----
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
>  2 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index da395148ee9d..1805a0b4d0d0 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_irq.h"
> +#include "xe_log.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_sysctrl.h"
> @@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  
>  		ret = xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret,
> +				   "sysctrl: failed to get pending event\n");

using "sysctrl: " prefix here is now redundant, as xe_log_err will add "SYSCTRL: " based on the TAG

>  			return;
>  		}
>  
>  		if (len != sizeof(*response)) {
> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
> -			       len, sizeof(*response));
> +			xe_log_err(xe, SYSCTRL, 0,
> +				   "sysctrl: unexpected event response length %zu (expected %zu)\n",
> +				   len, sizeof(*response));

ditto

also since this is unexpected protocol error we should use -EPROTO or similar errno


>  			return;
>  		}
>  
> @@ -41,7 +44,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);

btw, shouldn't we also report that ^^^ warn case?

>  
>  		if (!--count) {
> -			xe_err(xe, "sysctrl: event flooding\n");
> +			xe_log_err(xe, SYSCTRL, 0, "sysctrl: event flooding\n");

again, drop the "sysctrl:" prefix
and use some errno, maybe -ETOOMANYREFS ?

and maybe also print response->count to show how many events we left behind?
hmm, but what will happen to those events that we don't retrieve now?
are they lost (and that's why we need to report an error)
or maybe we will be able to retrieve them in another cycle?
(but then I'm not sure we should report that as an error)

>  			return;
>  		}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index e13eebaac1d0..5c8edf9871c6 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
>  
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> @@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>  
>  	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {

hmm, shouldn't this be a simple xe_assert() instead?
after all, it is us who prepares these cmds, right?

> -		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> +			   "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>  		return -EINVAL;
>  	}
>  
> @@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>  
>  	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		xe_log_err(xe, SYSCTRL, -EBUSY, "sysctrl: Mailbox busy\n");

drop "sysctrl:" prefix

>  		return -EBUSY;
>  	}
>  
> @@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>  
>  		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> -			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			xe_log_err(xe, SYSCTRL, -EIO,
> +				   "sysctrl: Failed to write frame %u\n", frame);

ditto

>  			sc->phase_bit = 0;
>  			return -EIO;
>  		}
> @@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>  
>  		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
> +				   "sysctrl: Frame %u acknowledgment timeout\n", frame);

ditto

>  			sc->phase_bit = 0;
>  			return -ETIMEDOUT;
>  		}
> @@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>  	int ret;
>  
>  	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
> +			   "sysctrl: Response frame timeout\n");

ditto

>  		return -ETIMEDOUT;
>  	}
>  
> @@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "sysctrl: Response header mismatch\n");

ditto

>  		return -EPROTO;
>  	}
>  
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO,
> +			   "sysctrl: Firmware error: 0x%02lx\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));

ditto

>  		return -EIO;
>  	}
>  
> @@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret,
> +			   "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));

ditto

and drop redundant %pe as xe_log_err() will also print that error 

>  		return ret;
>  	}
>  
> @@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				   cmd->data_out, cmd->data_out_len, rdata_len,
>  				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>  	if (ret)
> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret,
> +			   "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));

ditto

>  
>  	kfree(mbox_cmd);
>  

