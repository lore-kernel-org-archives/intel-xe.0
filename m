Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17AFF36C26
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 06:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59410E0F8;
	Mon, 20 Apr 2026 06:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7JgjEh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CDD10E0F8
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776666800; x=1808202800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aATawz5y68RbBTkM9aOVaq7Kvzew2osxiptEdOCEd+Y=;
 b=n7JgjEh7Z1qK8h8VU1+Ja5ADQM4Wrqkfv0IDWt2ejSNfmMggud2iCkGq
 uZX7wydg7UJ95esK5rPP4Aw6UhpxKLtjJmu/NeFJ38A7VxArJ2Yz2P1Fk
 fpujwcQWrIIwyQbb0vmPMWNO60sBMus1Juz1WPC+Gm65fJF5KNvdF0xUY
 2ARSYPwle/x2PiY8iBIbXPic48PQvCVJSV+e8fsxFVtulLqUudnlBIK7Z
 0TlgluL/f1QEHCuztZ306GChMLzX7M/erj9mHDes0SzGd6IK0vDshAgz0
 VupZ9VVns7UfhmvW6IoS1rI6kBgLFcAIPXe9lwkikL/OjBftQs9VWwsT7 g==;
X-CSE-ConnectionGUID: btp3sLUcTv6lHuL1cg7UXQ==
X-CSE-MsgGUID: 8yIdjAhwSBymHl5HZaSqfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77698732"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77698732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 23:33:20 -0700
X-CSE-ConnectionGUID: 4/IwGtV+QPuTkfGA8V/xlA==
X-CSE-MsgGUID: bGYUhr9rTmiEg8pdGMWtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="225133837"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 23:33:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 23:33:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 23:33:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 23:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzumpKjasq7hF0LTV3sZFN515ef9kiMPlCoLGapptdLabOik055UwrAvE7L5Uu8LvxokkdPUvpFe1qYeTn7CFkQQoPP0/tPJPjC5Z1k6Fqvbw/zLGlxuycettg0RX+K+qZT+f820SOGuLjai0vENjktEyJr0M1roJ++zNocaRyJB+Y2bp2K0DItXtQlFpyJ2H/+/Axb3x/JLjUjYMrUP+8PxG9WdcHFbRrcwriA62iTYveJYiATUkQvYdL7yIJ38yHC3zU+8WLa0oWhTjY/6Tr8xfPW0xx+0U8o/ALvyc0hYGCdQMtO706gjHRhXGxFOeUgBF8LNVJmtBDwzi74xKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7TrdCzguSaCIRdOSMR348eN7w+YrH6kPGHFBPQpFFI=;
 b=gkL0QKjStM4O7Y0WzPRddgkiVmbtdyqFwO7Qo6FvnG8QW/ouqFzx6ROf4p6r2X/iX0vhoTpc25Bn3ooNGYh6eqjlq06SGqMXz3d8i/9bCa5PzWZZ38EQOv3xfEhUCqWyqLCSndXpfvstilRGhFZluQhCeGHnubT8xsDwoN9odWoPXG5Hn5jtEpIGpN/QzAHAXM2JzvcuSIkms1FCiLObsLg5KX3mVQY77NSJ4LpOuaCh4UktUEYQRDfvQ24D9CERuNR6LEFCkedel5zcFKvAVe5TbRMNygGcE8/MQwF4AmJFruXISQKP7wqlSqIzvwlzwwU6A7HiBeJDiiUQxs+CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 06:33:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 06:33:15 +0000
Message-ID: <00921c44-5120-4d77-841c-efd199f37f49@intel.com>
Date: Mon, 20 Apr 2026 12:03:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/xe_ras: Add support to query error counter
 for CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-10-riana.tauro@intel.com>
 <ady1PyArv2MFbwz3@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ady1PyArv2MFbwz3@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY8P300CA0006.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 6721cabb-dc9a-4758-91ab-08de9ea6b3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: e7oIvfX9OD5mLNZ6Lxkbuf0RNASzMRXjr5iZCV4dkJYyqCBUhjqIpsfe4BYC5s9L4ZN9IbPubW8TkL75KbQFvg/JD1p5vq3/yrws4BkjLWuUeFZrYc+LE3ep55nLDivWi8IoTVHfm7V8GjbgP/l/W5p31+xzOEwEi0iP8UBfDO2KRwicv8rerTpvbV6xlJlBlw74YjCzONVtOfmBPWITHYMuOrj1aoINRt5HhXCDNosasdOhraDfcWIKNYVoTOsJzqiBjeMT0fY8rcd0ZLYVsZLaqlCYQITlF0OwGL69fU8j9eEX4ecXD0ab/t+FvTgm06gPiATWvc5m1BgBDZjAyKEHX8JEl63DhE945ZhMQPOsAROw3bRS+0VEWzcWNxt+2dFk5D6sXw+iT4fWpWOknjCQZQB/veKZGFqwhZyI9BCMHU5d+9u0wjcUnESl/JV1/QMck+VGmrnXlZjqbcpAnoj5WB8PbXwqKwmWLD0kkn8ktred/StzZep26beIcK9cCo7GvJnLJaDBwdzuhsdeme4nBPCsRkRY7t30mcvr+OqgEeuap0Z+C1qkJEp+FTG5nW47aexp23yva3XgaAIhoekCwicMItMzGTV4pNCB4f80mj4xW+ZpzZDQhCVLZwwzEhyUeE1d+Yc2gQX9t53M545prYDlDHkggcW1dwNFQrK5zOV+o7ul3sPqdu4hb5RxPwaAOJlJXmnAG9ubLDwGxGTsTOE/9H/21rxhQ7PQJVWlbz8bmial+Ovc0Zkk6XWG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2M0bXhBcC8ydGJWNkpIRnV4UVFPczVFci9XQWlHdVEzSEUzSi9sb0xLajl1?=
 =?utf-8?B?RDRMd1VhQXpaUUN4STNPQ0lDczUvQkZJT1BTZGk0aXhyY1BRcFJYMEhwZkdy?=
 =?utf-8?B?bXMzQVJ6cmhmVzV0WjI2dGRMNGU4T2hnVCs5dEZsSDhGTEg5RlIrRmhzT3B2?=
 =?utf-8?B?K1UvcmdUWjhDc3NSbUVLNkxnbHY2dUhSQko2VHZscWhnMUVyMk80bnpNbFNp?=
 =?utf-8?B?UjNnM2pmOVlCMVVZQnJ4OUNQQXpTQ1NaUVgzaHhQdWNKTkk3LzVQbDVwV3VG?=
 =?utf-8?B?NU1nMG5kRFpPaEl3UDlwOFVRNTl6dzVpd3hjQ2NiQVptbVdsa053dzlucjZI?=
 =?utf-8?B?NDNoNWlqbTByTTBaT2Nma2RjMW0za01XVVB2anhGSmF2RGoyaTVLcGtmY05F?=
 =?utf-8?B?WFNVVy96RGRLV1RraXFkWFFVTmV3NFZuaHpDSDFQdFduUVJoVFVxc0dIN2t6?=
 =?utf-8?B?TzFTZXAvVXFFa3FVUXdQeXErWVh3UEtENFBYYnRlMVRpeHZra014cTZqajY1?=
 =?utf-8?B?Uk1JTzF2Rk1WQ2M5SmNJUUF0SVRJelppRm4rNVBrblJ1elg3dTdiWlVrV0V0?=
 =?utf-8?B?bG40V0Z5U3VCM3p5YkJWZlJNbloxQ0piVjdVNjlUeDdaai9EOGIxcFRhbGdT?=
 =?utf-8?B?UnYxTUN3alIvUkRmRE11bjlDZmc3c2xLeFhVYWtaWUFlYjJocVJoQkVLcWJU?=
 =?utf-8?B?YmNRUlFkTktGQjFmRHo4SEYyR2FwbVJEZXFXclFSc081Y0lySFRBc2VmdVJ3?=
 =?utf-8?B?YXlUOEpoK2g4c0VqZnJZTDRQQlBZVTZxWVNXazB6a2ZhUUJOTUM3Q042Uy93?=
 =?utf-8?B?UzZ1ZnRRTHRpY043Rk1lTDZVc0g5eExldW9CRUNNOXpwUytJZVdvT3JVWXU3?=
 =?utf-8?B?cTRmSHc3a29JalFUM3RwcHVPV29XMjcyVy9aWitLT1pUaktQUENCQjF4Mlp0?=
 =?utf-8?B?Zk9pTzRDWWNPelR0TThCM1RzNWt1RkhEYUdaWFh5TTJuekp5alUrL0Z6NytD?=
 =?utf-8?B?S0NWVmRPcXppaEtZa2pzaFk1ZVZyeGcxMExzK2R4OTlrNFlPTG9RM0FLL3lS?=
 =?utf-8?B?Y25zeHJsSUYyUnAwVk45NXNXOHRGMjVPd2xkSEwxQjRLWGpuY1J6M0ZnVGpK?=
 =?utf-8?B?TTd6M0I2ZWI4NnBMdjZFOXlZUlBkQnZhdDdhU2FJWG1tUVgxMjZGOHlUOVVQ?=
 =?utf-8?B?clZWVzJNUUd1RDhBbWpSQTdKQnhWdkhVM2dGTGVwdWxhRXJSRGpDdllnLzNB?=
 =?utf-8?B?Y0Znak45aVhsWFFYaDA2UFk4bWt5VzJNVS9NVEZ4K2M5TlRYNkxOdWFBckJ0?=
 =?utf-8?B?Nlp6YU84K1RZTWtkdC81VEIxSk9LVnV1cElxc0lRZVNDTjQwTnBmVHkyeEtt?=
 =?utf-8?B?d1FheHlzd3NEQlhQbXNObkowWWpGRjdzQWdlMHNvaFZNN0ZUZEV0NVBYZHZC?=
 =?utf-8?B?WDRHcXhRMG8vdnNIUUJKNEdicTJIL3hiWHpMM3lQb3FPd3lYRjZtU1lSOVNC?=
 =?utf-8?B?djkyTkZVcWRsaHl6K3hqZlBRWlgzd3FuOUVUQmxreUZnRDMvN0l3NXFpbmlo?=
 =?utf-8?B?K1BIOWUyajNHbFpmYmdPVkhrbXVKOTNOYXBUdGdRcXNDTVpIcnFVZHc1RUVz?=
 =?utf-8?B?bEh3QlJXb3QwVjJwb2xpUWcvOXZNbnFESEZBbzZ6aXYwem1DZGoyZllaUFlj?=
 =?utf-8?B?M1ZGQko5L3orbWVvNkhrc0VkcHFIZ0QwczlyL0d5bWhoeDFGOEpCRDZyRnI1?=
 =?utf-8?B?REl6b2xEcmtjTGhlS0xrQXFTd0JnSnFSQ082OGpqTnJXQkxiT3lJU1VYTWgx?=
 =?utf-8?B?WDc0S1RyS3pvZ2RBcTBPMEo3NEVpNEZHbnRnWnJ5Q0ZZSHBieGFtVXA1R21m?=
 =?utf-8?B?T1FXMlNkelFiMlRmV0ZkVXBFVHdQUEVaVE0yUDh0MVBqdTBlVDdURFN1YkYx?=
 =?utf-8?B?a0hKcmJ1UjFQRmY1U2FHRkRXM2U5RjlFTmtEOVJYSGpMQkhhLzBqYnRRVHFL?=
 =?utf-8?B?SStpL0g1bVVIMWoyWllLd0t6RTkvbnFsd1VFRUlTMEltbGQ3QVJQZVN0Ykd6?=
 =?utf-8?B?dXZRVmVYUFJLRDRtYU5DV1A1MHZ5NDBESmhwNkxYa0lYTzVkcHJPUkZIbjRv?=
 =?utf-8?B?SHNVSWpDSHI3RW10RHZTK2VkK0hBTklyb2NjQVJoRVJXQTN6RlN2NzRlMWFB?=
 =?utf-8?B?dlluTTEzUVdOcTJobkl0SENCbmJhSkhtQXN4QXY5a3FWeGpuUm80SUNOeWgx?=
 =?utf-8?B?d3dBWDNPaE4zc3hmSTNrUzlLQ2xlOTl1VzZXRnFIWkh4RU9EOFNCc1JWOXJE?=
 =?utf-8?B?M1FWaHIrOGxTYU5NendVaFVHY1hMRG5XTSsyUDlQUXdCOElsMnBYdz09?=
X-Exchange-RoutingPolicyChecked: I4wMVsNgYGo0lA5Vpc5Fi+ioSrwLm5VbvTyfIBTKKIgUYHYgLbkzHzki8l4j6pChQsYkdUcltxZLUt3k8M2iE+fePXZdV21FyMCUmj63vJCtXiAd92bShdiIL4MueX2+OcRiQ4Nunx3OZ6IZWlYCZq4RgD+5bxU8QTX4trx8fxfY7rdzNhgbQ8sP5o9OAEr5eQhjB5mfXPenpkX1HjPmYgxYpzGPbNQuzIPDfu4M4Hk9+DSG+T7NE1Koh1scO1/4F65LAJfsILwV41vtIVPd+fs9RybgmqJMj9f9ukUDEelBxIwe4zpKX3s/ax4cHWxlGTjJQkDseVmOIOl/BpsLmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6721cabb-dc9a-4758-91ab-08de9ea6b3b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 06:33:15.6072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suoFTmRZrf2Xq/WQH6I9W0CaZvkcWNhLFpBrjajAHRZfoglRvERM0dA2wVWVyhG55v7K/D7XKXdIvdW6hGxhOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
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


On 4/13/2026 2:49 PM, Raag Jadav wrote:
> On Mon, Apr 06, 2026 at 08:24:42PM +0530, Riana Tauro wrote:
>> Add support to get error counter value for CRI.
>>
>> When userspace queries a drm_ras error counter, fetch the
>> latest counter value from system controller.
>>
>> Integrate this with XE drm_ras.
>>
>> Usage :
>>
>> Query all error counter value using ynl
>>
>> $ sudo ynl --family drm_ras --dump get-error-counter --json \
>> '{"node-id":0}'
>> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>>   {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>>   {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>>   {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>>   {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
>>
>> Query single error counter value using ynl
>>
>> $ sudo ynl --family drm_ras  --do get-error-counter --json \
>>    '{"node-id":1, "error-id":1}'
>> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: split functions
>>      fix commit message (Raag)
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_drm_ras.c |  22 +++---
>>   drivers/gpu/drm/xe/xe_ras.c     | 123 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h     |  16 +++++
>>   4 files changed, 154 insertions(+), 8 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 110fef511fe2..8fcd676ab41c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -111,6 +111,7 @@ xe-y += xe_bb.o \
>>   	xe_pxp_debugfs.o \
>>   	xe_pxp_submit.o \
>>   	xe_query.o \
>> +	xe_ras.o \
>>   	xe_range_fence.o \
>>   	xe_reg_sr.o \
>>   	xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index e07dc23a155e..b334881e034a 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -11,17 +11,27 @@
>>   
>>   #include "xe_device_types.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_ras.h"
>>   
>>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>   
>> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>> -				  u32 error_id, const char **name, u32 *val)
>> +static int hw_query_error_counter(struct xe_device *xe,
>> +				  const enum drm_xe_ras_error_severity severity, u32 error_id,
>> +				  const char **name, u32 *val)
>>   {
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +
>>   	if (!info || !info[error_id].name)
>>   		return -ENOENT;
>>   
>>   	*name = info[error_id].name;
>> +
>> +	/* Fetch counter from system controller if supported */
>> +	if (xe->info.has_sysctrl)
>> +		return xe_ras_get_error_counter(xe, severity, error_id, val);
> Hm, this looks like should be a separate patch which hooks CRI pieces
> to DRM RAS.
>
Sure
>> +
>>   	*val = atomic_read(&info[error_id].counter);
>>   
>>   	return 0;
>> @@ -31,20 +41,16 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>>   					     const char **name, u32 *val)
>>   {
>>   	struct xe_device *xe = ep->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>>   
>> -	return hw_query_error_counter(info, error_id, name, val);
>> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
>>   }
>>   
>>   static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>>   					   const char **name, u32 *val)
>>   {
>>   	struct xe_device *xe = ep->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>   
>> -	return hw_query_error_counter(info, error_id, name, val);
>> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE,  error_id, name, val);
>>   }
>>   
>>   static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..b5fdad2c801d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,123 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_pm.h"
>> +#include "xe_printk.h"
>> +#include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +/* Severity classification of detected errors */
>> +enum xe_ras_severity {
>> +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
>> +	XE_RAS_SEVERITY_CORRECTABLE,
>> +	XE_RAS_SEVERITY_UNCORRECTABLE,
>> +	XE_RAS_SEVERITY_INFORMATIONAL,
>> +	XE_RAS_SEVERITY_MAX
>> +};
>> +
>> +/* major IP blocks where errors can originate */
>> +enum xe_ras_component {
>> +	XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
>> +	XE_RAS_COMPONENT_DEVICE_MEMORY,
>> +	XE_RAS_COMPONENT_CORE_COMPUTE,
>> +	XE_RAS_COMPONENT_RESERVED,
>> +	XE_RAS_COMPONENT_PCIE,
>> +	XE_RAS_COMPONENT_FABRIC,
>> +	XE_RAS_COMPONENT_SOC_INTERNAL,
>> +	XE_RAS_COMPONENT_MAX
>> +};
>> +
>> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
>> +static const int drm_to_xe_ras_component[] = {
>> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMPONENT_CORE_COMPUTE,
>> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMPONENT_SOC_INTERNAL,
>> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMPONENT_DEVICE_MEMORY,
>> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMPONENT_PCIE,
>> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMPONENT_FABRIC
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);
> Curious, should we also reuse uapi names for logging?

This is not for logging. This is conversion from input from user (ie 
uapi) to the enums to be sent
to firmware.

>
>> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
>> +static const int drm_to_xe_ras_severity[] = {
>> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEVERITY_CORRECTABLE,
>> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEVERITY_UNCORRECTABLE
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
> Ditto.
>
>> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
>> +				    u32 cmd_mask, void *request, size_t request_len,
>> +				    void *response, size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +	u32 req_hdr;
>> +
>> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> Same comments as earlier patch[1].
>
> [1] https://lore.kernel.org/intel-xe/adY4x7iYSfs04ufg@black.igk.intel.com/

yeah will fix all  review comments from uncorrectable series in next rev

>
>> +	hdr.data = req_hdr;
>> +	command->header = hdr;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
>> +
>> +static int get_error_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
>> +			     u32 *value)
>> +{
>> +	struct xe_ras_get_counter_response response = {0};
>> +	struct xe_ras_get_counter_request request = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	request.error_class = *error_class;
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
>> +				&response, sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> This gives the impression of RAS error, but is it really?

This command can be used from different components. This will help 
differentiate
the file.

>
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
> Ditto.
>
>> +		       sizeof(response), rlen);
>> +		return -EINVAL;
> Is this propagated back to the user? If yes, is this the correct error
> code for the scenario?

Yes the error code will be propagated back to the user.  Any suggestions?
EIO for system controller errors?

Riana

>
> Raag
>
>> +	}
>> +
>> +	*value = response.counter_value;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_get_error_counter() - Get error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be queried
>> + * @error_id: Error component to be queried
>> + * @value: Counter value
>> + *
>> + * This function retrieves the value of a specific RAS error counter based on
>> + * the provided severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>> +			     u32 error_id, u32 *value)
>> +{
>> +	struct xe_ras_error_class error_class = {0};
>> +
>> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class.common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	return get_error_counter(xe, &error_class, value);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..e468c414148e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +struct xe_device;
>> +
>> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>> +			     u32 error_id, u32 *value);
>> +
>> +#endif
>> -- 
>> 2.47.1
>>
