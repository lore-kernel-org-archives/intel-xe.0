Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FDAC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 11:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B112510E1E2;
	Mon, 10 Aug 2026 11:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NT4k9/cK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A010E1E2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786361513; x=1817897513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sW9tjsvO40j5PDowcNJ96btwW+YGd9F0Gxl1tRPoaEI=;
 b=NT4k9/cK5ue4oBlzT3CKTJFIqcSdyhCzf7U96N288nywa77OS2pftu7p
 lmjBxOL7De4Y58F9jXRjzRS/U/uyQDIr98wN6L6rm9vw0hZncd5rFuBW9
 KP0bq38T5F2oqMp6gbVbZlg42YSUek47zlaqxCPoqJYYoFCJdOHCZcHcm
 A6q4BwuBMQ049przTI4KDwGKutWvn+T/bjuOG0CaaFFUYB98UVkadJAsy
 3kJCi2lsBJkD2WGmrxxeHZe1tSy6s2JjoEPfLWtcb684we0cQGcKpm6jX
 60bd4QHskIywzNJMxBsp3/nshI4eRm6K5cWNStJ2m/P7TRQ5TuQADNyg6 A==;
X-CSE-ConnectionGUID: JWaH7dW0TOunZeVhw4TOLg==
X-CSE-MsgGUID: m6+DQGV+Qn+SSHD5cP7D2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="109663413"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="109663413"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:31:53 -0700
X-CSE-ConnectionGUID: p8dTIjZvQwCchpJuQKW+RA==
X-CSE-MsgGUID: qV0sOhBrQNWAizbGlG8Gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="268178279"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:31:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:31:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 04:31:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJhr72ctgJPWNN7ocnvckjoitc4Du+9n9MDVRWEY6kZMvDqzm2Bcozwr9hBNQ+YErn7roB9pArhYMRYf6RPwvOwJdDHzSfMxluUA4jC2I7t7rSFa9fU9+ZqSvrOrFvge4iZeS5uVazTXfQ5/YLFd81KOI6AFB8WuJUfJm1B2/KqNicyIX1112qX67BjfFaCiY+Z7MqeZFiT2LGCjRsOXQ9OJlmJt3VV0rlM7aK+SReI0Q6leQGLonG5RLa6I4pgMNbKMSb+ABMv2Rzy3qT2QPM/uaHjOuAba0aRdTX5SJBhEElzXQzEa+yyG+ssMsSU7Z5UP5DlHDrnBRW22vbxE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPZHoqc1eq6LJ70vYUmBEdYVEHwzbeAVtqq2Fw4LSP4=;
 b=rJww4G+ZtNpEQX4ClpeUwjrBlNyxKAhvmvXL4e/bhMDUn0ufcsp3antfq/rR2KBZv+vf8o5FpwVeMhQKshYe+iMLUQhn7EgKs8wgezIeG0MSjKIHbI/jqXs0PrA45WrbW70XJswXjBVUxsb8DYF4yhHohujLn4dxIKhRYPpXIhLq2c3XjQQzIFrcPHuJeoeq27jNaUFfATLl/++l7Wa50Jg9AwS/qhklnNEgbApmNJn4oR75+8dpjWtoQOqbbf3F4z2b4b+1BwJE2EkRP5BFhRhUoJzK7wUuXw0IPY0hkB5JCIRADxjkFZhUjPFP75zcfE9iMdtedDpaJmm9tqAwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 11:31:45 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:31:44 +0000
Message-ID: <8bb2fa10-7873-45d6-afce-240ad8dae47d@intel.com>
Date: Mon, 10 Aug 2026 17:01:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/23] drm/xe/ras: Check RAS and LOG component
 definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-13-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA1PR11MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 87713ad5-fa1f-441b-94be-08def6d2f4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Vq61gth8CwKw4Rdv+x8k3txk1M1cUyii6Zjc5GA6Ee2fPHNBcEpIAjOSnw1Dau+JWlrEP3T3YKEPT7c1SZtsGQgHO3k7Ne1uVqSBNqYI01iZL27F5k7FzGWpyj4nL0UW5V/+sV6oCIcbXerhWD2vJGL/7udeDq55EU4p2so18DzusJz8OfaDJI0mX3a4rk78SsstpLHHe0Vu2wK1TOFQisWhpTsdNBX3iBQEtxUj5jgcMa+G9nyxMhN2OD/vv+rZbukxzr5c1zWB5ANZV0iatkuvhzFuqxP8rTAJdo9N/oZpxZiW2vubsEEQkqzh/9+PImDW6vS9w4sRWQPsNVl6jN8pyQWU56vPQTkfTW6qKEIdtDQ1/n0aKXqhMxXrlHYvcyODGIn4jIvmCHsMt3TT9oUDuGp+0d28ieRWTkVn4oUvhBjSzjhABgqQS4SUGuT09DGeRL4/SuXwxBMNbacS2jZ87F/ua8/kUo1oqVJcT1W1ZJ3vIbXXgx+V7gj04Sg5q4OsfunsVs/e7zVY6pFPcOta4IVZgKDcZ3aD0cdk/cutRqgxImpKVi/f26MABFrSQUlfqJUinq3CavzD0mXMrTOCJe3z8nQ2DdwsPdVisQoQWEczfKOIzJNg1LPXiyF3vnvfFX9N67Bh7sO6tE7tQZrEWumY7K+9tiqIFQEHnVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEduTDRZQ0xtZlVGV21aaU84WmoxUUZhQ0VYZ0w4Lzk1c0p6alQzL1piUzdp?=
 =?utf-8?B?aGpNNzFDMTZnUlErMUxtTWIxaEhpam8yeEJvWWRTdHYwZG9jNTEwMUdteTUv?=
 =?utf-8?B?OTdVTWpvelQ0SE9lSHJBUENvV1V6eUhBR29MSkNKR3hZT3I4a2k0U2dZb1Bi?=
 =?utf-8?B?d0Yrd1hXUlZNZWhDZGRPUjhWZjU0NXcxQXp5WFVhb1h6TjM1ajVUNDM4czBy?=
 =?utf-8?B?S0ZVZ250ZE1vTFdNbFZTT1lXTWdsNVVkT1o3b3BpVzY1QTVtRy9CVnNYVDhZ?=
 =?utf-8?B?Q2ZPMWlJUU91RVAvVlFuK0VxR0tCcnlkWUFKYXBmQ2ZQbEg0MlFMVTR1d0I2?=
 =?utf-8?B?ZGVRMUFrcis4eDFscTNrREJxS0FaaDR5OWlXdXhJbC9zNURGeVF6S3NUdkJO?=
 =?utf-8?B?QWN2RzJ4Tk9qRGRoVTJBM3Rib3dwQmVEMGg5QnhrK21sdFVuYUEvVTJUQTJz?=
 =?utf-8?B?ZHQ2WDRoeVc1R08vaVpHbWQyZjEzR3h0ZVFyNElhWjUwUERFWWdWby9mSWVO?=
 =?utf-8?B?ZU11ZXFNSkpML1pRNnhzRmVZN3c1SGVvUGFieDdHNWVmYmdOd2hva1FmYktm?=
 =?utf-8?B?WS9aNkRFZm1PTXJCT05lNDV3NUszcFJML3ZTaFhBWXNGaXIrelJPVzZ1NytT?=
 =?utf-8?B?a1NJRmV0UWNyNXlyMjRTUktlR1hMSE5wTUVhNkc3dFF0T1l2cEJTd2FKdDJl?=
 =?utf-8?B?U21HRFUxd1hPOEluUDVWZ2I4N2IwYUl6dms1V0V0cS9JeWVFanNiTnhlbjlN?=
 =?utf-8?B?MmpUd3RBQkhPOFdtbHYrTVdpZGhxYWhrY3ZnY0hVc3lZVUVRaXlUZForTFd5?=
 =?utf-8?B?ZTg5MXl1SCt0aTBYTE1QTjJQeVRLUzF6OExiVmxYWVBZcURlaE1DNU9rdEps?=
 =?utf-8?B?YmFOSzJ4Z3JzcVM5ek42Qnh6dy8vSWpZdE9LU04wQjNBV1pIYmRZRlRwSDM4?=
 =?utf-8?B?a0lPdWUrSFF4bmNKbTZYSDNWRERaeVdJemxDTHd5UnBaQmwzL1Z4RFJhUVhG?=
 =?utf-8?B?dHY5UlpESzl1VWdGR05XVXNSSVp0V3VkZ0Yya1BSb280MXFqRlAxQzhSWERN?=
 =?utf-8?B?UmFydS9hd1ZMWXE1NDkzcXpUNllGT1RITDZqN2t1S3p1VFloekUybHZoL0h1?=
 =?utf-8?B?NnBvZ2RINWlGMTAyRENqOGV2UW84TXNNN21aZ21XYW9xaEtneTBQK1pJYi9H?=
 =?utf-8?B?dFFNMGZmWEU1cWRyVmM0MHY1bThhclp6ZmNONjFHa2dhMENnb3lGOFZJQWN3?=
 =?utf-8?B?RXJnMVQzVEMwQ3h6M0ViRzh6UjhGS3NheUpuSHp6bGo1a1ZQL0lwV0ErMG5X?=
 =?utf-8?B?VUdSeEpvSU43M2dDN2lxYk1NcHNTdUc4RmdXMmxBbldGYnFPUDV2R0lOTC9I?=
 =?utf-8?B?aGZZV3YxeklsYnpUZEsrY1RlMlVnMG11YStoNEhhS0FhdCtVV1gwaTl3L0hG?=
 =?utf-8?B?RVVVVDJkZkVzZTFIQzFRckxyQnE2c1F4bmtMQXBYZDR6RVd6NUJPYmdUR0cw?=
 =?utf-8?B?ZmFMV3F6enQ2ZEJqanpPdWd0ei9VSGN4b01TR1k5Wmx6bWJVM3RxWHNIMFJJ?=
 =?utf-8?B?U3N3MHhDWXRuaWZzYlRkUWlIeHVkVHpyUHk3czhLUS9rYitLY3NnN3A2UWt0?=
 =?utf-8?B?TFZCSlJvS0pydS9IanVEQW9QV0pTeUpxcms4QUZpVHcxdnF5K0kwbFNBTXRv?=
 =?utf-8?B?aUJQRnlZZmR3b0RWaUV2STd6bGU2RXJFaFpHL1VDM2Z1U3Rrcng3S08wWEVU?=
 =?utf-8?B?RHNZSXhJVW1VV3FDVjN3T1hROFlNSE9yUXBJZm5MbUlseUhQSmZtTEVsbDht?=
 =?utf-8?B?RnMway8vb0VjZXhtVWhSeitNYXRrWVFTTWpvL3dhMmFlbHBQWk1QNmVwMnRa?=
 =?utf-8?B?clZLKzlmZnR2OW1NNWFWSmEzYk51SDlnNjlXcUtQbTBBbmxOelM0YXVLdUFP?=
 =?utf-8?B?bVFXT09hSHNxbERYYWxyQTJsTVpoZWRTOVFwN3V2Z2NvYXVuSE5za2FaSllk?=
 =?utf-8?B?VWRWR3lMZWVQV3RIZHZCc0dZZnB1NkJWRjVYMHVDUDdic3lKLzNHNW93bTE1?=
 =?utf-8?B?TnUrRkxoMEJiS3pEdlVJSktnZmRTcisyb1lwYTVkVWV6RTBja0x6Qm9lVWln?=
 =?utf-8?B?Rk1xc0p1elVaTW12R200QlU1dlhPbnZmTnpabXJDei8vS2Z5VG1XbTRPUVdM?=
 =?utf-8?B?ZEVla1IyRDMzR29raDBwMzltak5halpyRFgySTlwWUpxclh5OTF3YzZxVk12?=
 =?utf-8?B?cE9lK1ZSaDFoaExTSmxUTVI3MCtCT1FTRUllMHArTGVWaW83Y2lnL2NHSTEr?=
 =?utf-8?B?Q2RuT0ZPazAyc0hlaElEK3NQZyt1MDhvZkc3SDRGNDNlRUJjcWd2ZE9MMEJL?=
 =?utf-8?Q?o+Ka7xJQCDPvBB7I=3D?=
X-Exchange-RoutingPolicyChecked: lE5gBGWbrmNDCLAo5cIDzjh2RVg1jvrrZbiRpdWgzffHuz9AxRZTZ6Silqn/gGgjkULsj2f0Ujw1tnWlAMaFmbWJs7+ELciuOSPlseFRi427iBg9Gz4qZP8vfY9aO281pu5JEYJIVKhIzYmghtIv483MuHT/mstelJf3kSEUSTJ6CNaFu7X1uH82VBLRFmbvV0n1zw573r6HWtYNlJo7RCZuj080dPsegDz7gt4MkAi7izsDBGRtc/C4kgAA2tETGLZp7lA2eLgIUgQJ/hJj2IEbY+XljDPINn0U3YALV2anYsgzS8ZqnpnEjXWS2pr/obge46vFI54SH24YicFZ+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87713ad5-fa1f-441b-94be-08def6d2f4be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:31:44.7563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RFtrVb3yt2SV3c4tLzSV5nChk5foZe9JkjY6MxqgG+lcVnpGL8aeQMkwoO4E7e38+W4jUIyX2qizOhuKEk+bY4HaLf4anbKQn2szGQeYow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> While not strictly required, we want to make sure that components
> definitions used by the RAS firmware are in the same fixed relation
> with HW components definitions used by the LOG infrastructure to
> allow code simplification. Add static asserts to enforce that.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index a31e06b8aa67..56c0c31e46fb 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_log.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> @@ -45,6 +46,16 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +#define CHECK_COMPONENT(RAS_COMP, LOG_COMP) \
> +	static_assert(MAKE_XE_LOG_COMPONENT(HARDWARE, (RAS_COMP)) == (LOG_COMP))
> +	/* make sure components definitions maintain stable relation */
> +	CHECK_COMPONENT(XE_RAS_COMP_DEVICE_MEMORY, XE_LOG_COMPONENT_DEVMEM);
> +	CHECK_COMPONENT(XE_RAS_COMP_CORE_COMPUTE, XE_LOG_COMPONENT_HWCORE);
> +	CHECK_COMPONENT(XE_RAS_COMP_PCIE, XE_LOG_COMPONENT_PCIE);
> +	CHECK_COMPONENT(XE_RAS_COMP_FABRIC, XE_LOG_COMPONENT_FABRIC);
> +	CHECK_COMPONENT(XE_RAS_COMP_SOC_INTERNAL, XE_LOG_COMPONENT_SOC);
> +#undef CHECK_COMPONENT
> +
>   /* RAS response status codes */
>   enum xe_ras_response_status {
>   	XE_RAS_STATUS_SUCCESS = 0,
