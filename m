Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF3C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036B10E625;
	Thu, 20 Aug 2026 22:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlN+t2JV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5F510E625
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787265639; x=1818801639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vY/gJmJYzRrfADmx9PpgI9qP8BjJmVGndjBh6S+WxBE=;
 b=HlN+t2JVmAPNbQLlgFjexikxVIO/p8wAZfV89RTsDu5EmyxOU0Pwe8lC
 xLOruvNM1opmgXb5qLK3SrxWR2TXJN0iwTVJMPw+k/tTHN45f3WDd/7Lo
 CANtHqmAaahaHVkbZsd57XJObl/VQ04RyS9QNfr6FpH62az7s1TV1jvaz
 wH1QFp5Q7f7s1mcxNGb3iWadX5PCzcp9QDwNs0zZVB/dz6bQIOactcyQu
 zUi+3JzBBUGpnDgmLV51snVh4PmJFjp8SAf5vgAJ2JVE5ljSVGk9+tzFd
 5l1OTUYFmq9GNm0sqCEzf+bFwoEKZ2HKeqdiYGQH9sdRkHzTTufCanNdI w==;
X-CSE-ConnectionGUID: pY9Z+5E2RSOgRIWzqdsdVQ==
X-CSE-MsgGUID: WxYUxSZOTQ2GuxH+0nU6aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86762190"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="86762190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:40:39 -0700
X-CSE-ConnectionGUID: ApcjapSjSF+fpgvv+xyufQ==
X-CSE-MsgGUID: 90bwWBOqTZC75y+7igwr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="265665389"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:40:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:40:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:40:37 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igAMQbqcUSbZYi4rJlfwMnv7Ju1IBDWeaWRo9eLkDeWvOnvTBKkXITKfqgoGjbkp3A3phGNBhNdCLBCBDDOlGXln7s2Ncg2xFAMuQym0R0zGgGEh7QI+fHZ3T/F7er192P65I74Afn9HPbX4W4FwxMoKf77evXvMO+pCqj4bZWf0umglxY9p4b+j8HO0/TVqfq3koyMqNhSOBtJKMIzjIEQfoxGm33HQWfw+ptTmQ3RuBjQ85c4Iu2Qu3Dgzhmvm6xfmnQuWpCMxKcpluphvEEP2fClpPc6xDCPmE3znwGQTVVDaSGZsAtmvCE0xtu1KR91yapFFX61szFhmx9N8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvFrfi/tiqfJLaFkd7bJEdsAJaEMrm6W9cZC2poH6oM=;
 b=T0Vgexxmzs8EYC/uvtebEehVFeQ2ls5RrAeRJuSELDhHr/I9058scQqJCwDZm+ptwDBPQ6pEMBKMkEXNezANQtxq5gxzcBeuRoOoce6HUNahRZG2CXAjF3cpixHbt4G2RY0Dm4z5PPqleMeWiqgWMgIVJcdbhpW5fUaqDBXfDTJwRwnLIxNOq6peVqu9d0PSwo2/xJGMjgkwQ+Jv6ESyw4jJzACLyqKaLuG4r0ugvVpsaCs6AUKDCpo5YjTbRK504wCo7MjG5Y96kYVUyHB7EUjprcJo+3xoUL4OaIvffo0lZQzA1x/ssfVZv6WE7I6yTDfPaGSc5sb2Fkqlz2CXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:40:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:40:32 +0000
Message-ID: <d7d0d742-587c-4323-9ce4-7a5132b67623@intel.com>
Date: Fri, 21 Aug 2026 00:40:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-14-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:802:16::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: b9798d2b-c4f4-4b31-6a56-08deff0c0b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: Pb/Lid90ZWbFqHxl7r/jKAOZu6W9RlrikRCm8y4Y1+hEBmKMvW11iVVZEARjfqzz2bEHhCvWQmYAtsggKNRP74eGm41Tbf88cbtg+bsbjTZHsTC2lQ/0lTTph0eR4+AUKcKCyXAaOTcWkPy46eQKZJHxedDpQLm1fy2pPqVzOX6BM9YTXsHQzGtlQuZaoYE6pPG/yVDJ2P5B5Ky86BoMc5VYSxEjxYvobZ/JxI7ACb5lFfMquAIrpDJx8825vSEw63kZKoxglhS16ucR/fyKjk8XxPCqYx+LdKDfLMn+O/OvzKNI08KlCXmATqB7I2fRIUdHX0naaLmRTWy7Mms1cS5mRIuJf/HC9PhjOipF+fGgVxR8rLZYFfUBmqDNUtlrGbmSh611PwYXnmVsD2nPZR/8CVZinMZKL/EbdKiJN5jKfm/Nssn3VyvUbXc05PuntF2w4lzIDA23WRJtIEHlHQqBsY4Ijz5VPTPx0os2cQNSYxAzllS4w/7Ptr4hkt09GGOUyJ7JJ2MHOqPL+y9dp/4ryR1AdcVocnuECFKUw7moqOnYgsXkqOqiOhuEo9hp4/p2/T+QOUUVM32AEqfogc62OjGrtMaWzn7bHNENLMIrunOX+FIrwIEBLbJ9l6bwvLbSP90JYPaXHe3BpyNDRXtTGnvp0rRyJUL9VXuNhAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRFVFZSN0JzMVZ4NXFLanZoTDdCN25lWmx2K2YwL1FQbVk1MVYySGFkTTY1?=
 =?utf-8?B?Q2NWK2RJRWdML2ozQ2tDTURScnFPektmUW5la1hDYjZFTk9aUmk0TVlvd2xh?=
 =?utf-8?B?dlF2VDMzQUQ1ek5HQ2NuS0VXVDBtKzFlSEdVYktHZUxVTDNCcHlkWHlwQzc0?=
 =?utf-8?B?SnNYR2NXZUd1L1J2cG44WElRY0dEOFlzQ1A5bVRVaGF5akJrMFczYld1bVJH?=
 =?utf-8?B?YjVsSmhNak14MUJSVGFTL3FKVXhmNWEwZWV5L3B2MDlOVFo2TDNYaWtNdWpj?=
 =?utf-8?B?Kzd2ZXFYVjMzdUw2emlWTml4OVJaZ2dHNkN4YldBenNoQ1FHMStTRkoxMEZG?=
 =?utf-8?B?cEcvZ2JKS0dYcWR3NHFUSlQxSFg0S2dQWjNReUZjOGNFZlQ0QmU4ZkRBZ2lj?=
 =?utf-8?B?b21ObktKQ0d4NHR2QUlzN0JQYkZIQ3hTR0lTV3I0Y2x2aUJPZEhhSEhFMXVs?=
 =?utf-8?B?bHh0N01ySGJWVjBLWEJwTnhvUTB6NnRFKzdLZGNWdkhhckJWcUJRUWZMWkZC?=
 =?utf-8?B?c2ZSdmdpMUFGYnNhTVEvbmJ3M1ZnMkRxNXNmY2FZUDkxTEVpU29VZk9FU0RU?=
 =?utf-8?B?MC8vRm5sVFg1Zk1tUUZFcE1ObEJpdmJZdS8va2V0Z2lSbVlyYWk0MEtoczcr?=
 =?utf-8?B?Z08vUGtOcEd6eS9xcW5RaVpyR0hVWmZUNTNSRFl2RzdkMWh5VVBqZlJsTUZB?=
 =?utf-8?B?Yk1rdTBDN05zeGxzK0VSSWFud0RWdUExQ1JhNFBBTWU2OU02RllRMmJUY0hC?=
 =?utf-8?B?YURxRVpUenNheHJVVEtkeDNkYjFFVWpHTk1ISW5xdW8xRFg3TUFsTVdCMVJM?=
 =?utf-8?B?QVBLS1I1eUFTTlNxbmJDSzAza3ZKUDNXRHJ3R1ZqRzFCTEdDSDBYaGdjN3l6?=
 =?utf-8?B?aXIrcmV1RUdJamp6L2NKdFlGdStOdzBZUUhGU1hzZG5pbFkydnZPaEQ5aGxY?=
 =?utf-8?B?UHhlSk84OGV5SjBWRUJheisrQVlLRVdLdHhiQ2NXUTZqVlZmTzU2MTVzN2ZT?=
 =?utf-8?B?QkxLcmpOMll6UmNOYW4yVUlJMWtQV3UxMmJ6RzA0MHNFZ2JnV0FlNzVhVzQy?=
 =?utf-8?B?WVYvaVhYMWlGOFl3OVVWbHEzUlBjREl5VHcvN09tMjIrQmhremcycElPckF3?=
 =?utf-8?B?TVRJSkFtU204eDhXdlBEbUEvMmdYWm9GN0dXUEZwRkh5YTBRQTNseVZEQWpn?=
 =?utf-8?B?NDJCb3BwNk90ZjJTbmRpMzFrZU5RU1ZnVzloNFBSYUhvSksrTHgyLzd4d2FL?=
 =?utf-8?B?a0RlcUoyMWgzeVAxKytoVGlCRzM1VkMzdmZEU3B4ckdBZUxibmhlODgrUVpo?=
 =?utf-8?B?NTFwUUJuaVdJOERxam8zbUdsOEdMRGoxRmNkK1RyTkhsN1RNcXZyYUZzODNv?=
 =?utf-8?B?MDdveHdvUVVwSmNKK1BsN2ZlRHJERk1KOTBSTkg4TmtqQ00zanQvelNIeS92?=
 =?utf-8?B?eDZ5NmVXS1MxU0JHM0t2aXBudVBNcU5sMFlQTVNER1RtTEgvRkRoMU5UM2Vn?=
 =?utf-8?B?YWRONFk0TnJiZjh3VHRHMnMwbittN3ZZQVVNc213cHVJMlVUTjM2MVdFNVh1?=
 =?utf-8?B?Zng3TlVoRlNqZGJaeCsvekVoR29Xai9zYVNRQ1paa3VQdXd0cG5EK1ZNa1JW?=
 =?utf-8?B?Qk9YRW0zaXE4WEd3N1l0VGVTMUVWREtzSGh4RHhsUVUreGx3SHZUR3Vmci9C?=
 =?utf-8?B?bXFXQmdaZFFZbDhjTGViS0MxVmFWY2wybGZrdlNnTGpha3MwT0ZLN0pTRDZY?=
 =?utf-8?B?M2VnY1BXSFlVOGlRdUVpSXJXd1JqYm1mdzNlSTI1a1ZTK00yR0NGWVRaL3hk?=
 =?utf-8?B?QkUvTll1cnBkOHRRdjdpK2xSZ1ZONGZWQk5RWXdtYjVFaHA4azFtNkZKUFdq?=
 =?utf-8?B?N1pBckRCdytOWFVoWlhMTjZyQWRadCtldWNZZkQ0eXJzcHJuQ0hlMkxFRlpN?=
 =?utf-8?B?R29pdCtMd2xXbDJ0WjJna2Rhc3N5MGwzTm5NVi9GdWZQeldrRG1GTmZURUgy?=
 =?utf-8?B?NVY2VUJhSUwzckVvdDMvQ081UkpRTUYwdFd2enQ5WFlrWDdDNnM3RGFlYlBF?=
 =?utf-8?B?a0JIZU9ZTFNCYXVUdklraWtGUEdTUkpPcGdmMmltS3V5clJ6b0VLbEsvWEx4?=
 =?utf-8?B?aUR4Z1A5S0xubnFpVER6SEdPbXlrc1l1Q3NyVkFCd2o1eUMxeVZoZURtNWdJ?=
 =?utf-8?B?R3IwSHRxSDc3L3kyR2pnWVJRYzhiZ0piSG50T2lGeUNqbEJrck1HOEJXYXRU?=
 =?utf-8?B?bkJnVW9RdDZCZmQ0UExPMEo1K3IvVkd1dXZ1MUg3bEgyL1NpZk9hbGVyZVFJ?=
 =?utf-8?B?eTM5Z1Y1RDc4cGpYSnlTUytkY2xJSzI4K2FMcWhWNGYvZS8rMHFrQXBSS0p4?=
 =?utf-8?Q?olJnbMomW/KFxIJM=3D?=
X-Exchange-RoutingPolicyChecked: irRJahYhQ33vQSWy8msJEbahFJ1YaLnFJ7TMK1P2Uo3pOsLCDGOgSJPPx10qZsrWC50FFWNpxigjoNnm+5rVqBWWGtCByv7hjsUbHZksyO61Bye68yXizzfChUd6AiSFE9OwXZY4Wo2olUPVXb2J1vXeShrzYWaJCW8e6FwbuQ8S6wZdAZirm3tAHxUAP18JcIIAhsIJZvvgDdNeh6j1u/U7ZspquTkQE0vvLtqMUbz+kSUhAB5qzoN2gbkgb9wcGaVNwn8YQuI+xy7vk/ACS1ty0itO+hqZCLTCcJyREwqEsfhZxlszdpdoLCwAaJAPD2LiH6sDwws+epV+HeKuOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9798d2b-c4f4-4b31-6a56-08deff0c0b46
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:40:32.8317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtjsN6SaIzOi4FOBff51C21nnTRBk77noj/t69P01nWuL0/B33z7LL28N33G4+gCty4zPOpqX12CBO2IwJkMBUvhiOGEOKgf3cqXG7XWBsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9226
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Use xe_log_err() helper and include additional
> details when a response header mismatch occurs.

nit: we should wrap at 72, no?

> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index c043b51cacc8..9d7915c9d4ae 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: got group=0x%02lx cmd=0x%02lx is_resp=%lu, expected group=0x%02lx cmd=0x%02lx\n",

likely we can use %#lx or just %#x after changing below
macros to use REG_FIELD_GET

and maybe it is sufficient to print just raw hdr value?

> +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> +			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
> +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
>  		return -EPROTO;
>  	}
>  
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: 0x%02lx\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));

ditto

>  		return -EIO;
>  	}
>  

