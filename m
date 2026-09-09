Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A05C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 09:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1310F01F;
	Wed,  9 Sep 2026 09:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWx8J71s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD95C10F01F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788944468; x=1820480468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=L7Y0huvrHMa6r5oWRyeFh8iLq3NBfyUqhMxuSv47tS4=;
 b=dWx8J71sgMRmdhW66l8Yc0Li/dqAkcFu22mjXYgieT+e/suJGiMymF5M
 WaSH2eAt5zlbSg04AE6pbUfKsSmu902Yi6UtLP08Tk5gS7ad5MT2bJQaq
 JP/gvSXuv+gms7GD4U4zygNcqZU+LCKsIkawL1A46WzABizPpybA8f937
 IBrwc55rJ5j7ODv7hLEXztpMqoyxP5Nl4O1FRLQFpVVU2sYMUHrlbzFu2
 +2YP4MIiKJqvtWzqQ61byv2S7egFCdKFQa8IhC7O0sKZwCKrrB9y6tavf
 T9VYcubBPWFDwHzCiTk8jdcVp6VWh/Ng3Fxn+2oPMRyeTtiKg21QD3jWc A==;
X-CSE-ConnectionGUID: lSbrJhQQQYibv0660odgsA==
X-CSE-MsgGUID: FqCbkhSpRxq0BCxCGaiJEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106731205"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
 d="scan'208,217";a="106731205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:01:08 -0700
X-CSE-ConnectionGUID: wd0E2ES6RKO4igvZpEmCTA==
X-CSE-MsgGUID: BNzp64YLTcmMVXBTiz7QwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
 d="scan'208,217";a="270761300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:01:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 02:01:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 02:01:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 02:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVtolB9zlnKOoqmyUZO91soX3z2dVeJojdGTMPdb0S+aIW1fsZEzh0GRV2Xr12ThRmboIgVBbX0n8GD8TlPk5DDwA2w2ubS/B268pXh4lLZo6WX4RxJ8iafj+uATc9LfiFXv2UAc7wx8z1boYu0P9lQ8o3zS2zgBQ+Fq+iXpFMsi9UsJyeLwJMVJS/XA9F/xtC/ypLiUFR2HkpZa5hpMrvV0ZfTXstOGRS/BCMBgEYvnKx3GawsFo7JTTWGvkS8C+661uuWzW0m3pIut1VYgOK1LLIhaRXNwpXQqPFqmFAbHDfX+Bg6w2WZ6aD3bj96j5QAKzb7clDoY5tRWr7qPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8nuIUlKHxeEDqTfV5o2aMGfFr+ryrHA7FtOzTTTZkE=;
 b=CWxnfpCJzFd78/pSAzsRGcHirMTG42GxYWqEvgATSCAZ8kNl4124oj+1Cdj6utrNRjeSKPnzEWlqvzaUNTbZdlyHWq0kUyx0jSLwYVz5Qqb2k9IzlqSRvmW0EmUQQVAb8bYlrF3QczmqgXeUyeyzWHwg4IqBvGaOpZ7qoLCQvFvO/umoVEmu9wur2UdB0seDWa66W2OSl6SYbJTBKzvNISCobp3TMFTYdXVrMuyHsqn0YJVyacLBlR+TJNvsN9qrfO5PrMg6GzSYf9+Gt8btbf/YgDfj2kg3nUjUxwMmIQYQrMCfqTWHciM8EpRqWvGcr2u9/z+ILw1fL81C74D4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS6PR11MB721915.namprd11.prod.outlook.com (2603:10b6:8:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:00:44 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 09:00:44 +0000
Content-Type: multipart/alternative;
 boundary="------------OSXYi4PIIjI008e3T0wukwul"
Message-ID: <f0f7e21a-6d90-498c-92bc-e8227a393d8d@intel.com>
Date: Wed, 9 Sep 2026 14:30:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/log: Relax location ID recognition
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-7-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260904170531.516-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS6PR11MB721915:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b516c5b-05a8-4fb8-db36-08df0e50d47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|3023799007|8096899003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uRNzMv3Bph5TXRYJC0m75Xpig0XW/F1yi573BXDttnpGvunh6bfSQ0duStq0zbq3GsLcA3Umub6qSj4lZq3pxpXG/xscKGPBCee1lNqHNDQ613tX3cfq6puPGuSpgf8EarDcSEwy36cX/2PJJ2FNgfvbmA9fM7EeMTtImEoxSErwelbAiG0BvQRAqSkO6xMPiD17oSAUpMb/dbfItmbR/xKaJ6Nvyblpx4IbRs/4qUhag53299LspIJjEyq/dBOJgUeN7Oac5B5wZQTbkMuU9OQqs6PKTabND+L2ehhXvPXU7i4qH5yvDU/CrbXurumfoez1os3FL63D6+GQMhoL2+2AVqEZBNzvDvfYRTFtt4ars50wzW59DjAkBJWr6dWMrhp/pQozO7JhAvW9vbid4EAbVLbggjuIz2vtS9PB6F7UXk/BYB4k2M6YxqLH7l/ovy336unRGIDCw8DEOIy+ZQ9s+Pqoi7RR368HZdP6qXpWIbn1gUJ5eZg7BqPIij/4Fac99naRFFTyeEr1ftT9B/yy+e31kPEAdwKgCxPgodcOgK7Xi+UGeLjBjXfIc7wRb9eTGgI3q6bBxRiMbUNyy0vZ/ncGoftfJ1jNHwRe1Yu59TsQGfbM5G1FaU3kcQ8rQt2Jcqj+t3ciBTOmswYQmRzT8mHex2ALSY2ojVgjDE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(3023799007)(8096899003)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXArN0RQTjZXWU9xdklpcHluN2JkTGlzZmpWN3Vzcm5rVVRWZkFCYThxb0U4?=
 =?utf-8?B?VXI0N0UwZFh2MU1CMnk5enZjd2FqdUZldUF3QWNNemFqNDJSbkkyYjBLQzNw?=
 =?utf-8?B?UmZPUmFLbzI4c3lzeStmQXJ4VTJQOWpFUlJoaFFOb1RaSnVjNWprVzVkZzVI?=
 =?utf-8?B?SXNxWHNGMDZUNU9TR2xYM0hPQzA2cjM4OG9weXEzQTRrQWtGeVBpR2lXVVFE?=
 =?utf-8?B?T3NRWEtYR0pEdks3S0MvYVBFcXJoRkhub2pneUJYdFdDRTlYbURGc1ZISHVG?=
 =?utf-8?B?NDFHc0VWSDhKcTBtdjlFOWZlOWprVFN2VzAvK1A1ZXFFUTZBVS9WeUxTTkUw?=
 =?utf-8?B?UFlreFc4dlJhQkhySUpkVWp1ZVdrYnM5dWhZSHdVc1J4Wm90Z28zaTNrVGta?=
 =?utf-8?B?clQ5OW9UalZqWC91NUpDNi9rRmFjcGNjdXJKbjVQWDR3ZWJsNXdTOUhnR0Iy?=
 =?utf-8?B?R3huamxDK0h3aEZsYS8vQjRkSWE3bWtOK2hobndMbHVoY2QvQUg2K3NoeGFP?=
 =?utf-8?B?Z0gvU2N2aDdqdVBTaEpRRUJJUm53bHBaVWxqRnVNODgrMDFydTlodzNIZGFr?=
 =?utf-8?B?Y3dmdXJPUWZkdkVZU1ptRnNORXMxc0RWbEtiY1IxL21BUkhteGZLTk94WEY3?=
 =?utf-8?B?bSsyZ0pCMk5Rd0N4SjFrNU5mSnE0N1ZLS1YzRHhRb0VGRnIzc2lTNmN6NVV1?=
 =?utf-8?B?Z3ZkVWZLTlI3b2YrQVpoeVFkSW52b0IxR1MvOUJWcWdwYzRjWXBGSkorVXE1?=
 =?utf-8?B?TnZGaXlVSEw5d1lsQ2txWVlUREdPazczVnpjMzFDVzU0QUdtcERFZmFMQzNm?=
 =?utf-8?B?dENRRW9PeVg2MWFpRGQ5VzJabVJmdnV6SVhuRHF2QWIyL1o1WE56eWFPcWZ6?=
 =?utf-8?B?SHM0RXY1UFlOaWZ3TllHVWtrbm96RHdaeW5NSUc1RTNYSHZXUzNweGp6K2xU?=
 =?utf-8?B?V2M2MEpIT0IrdnBtb2dZRlpUa3JyL1lJdzV6N3ZuZjRvRFVhbXF2V1F6WXNi?=
 =?utf-8?B?U3dQalBjWHArMlc2UldNQ1p2VGlGNHQ4Tk5NbFBPWE15MU9kWmpDenptcDlI?=
 =?utf-8?B?eDU2VGJPcDFLcXE0alRwYzR0S0VOaENpWXdKVXhiTmZJZzhhSVQ5cTRIeXA2?=
 =?utf-8?B?bzc1YThndmZ2NG5id1dLV0c0SjNwd1FLUURUWWp2NUU1L3pZc2xpZmNMYjdv?=
 =?utf-8?B?bVlhazNwb0xJZGhFYkd6clJRZCtRbG1zNHVUSDQrTjhRYXpnWk1KR2xKdjAy?=
 =?utf-8?B?K2VrcU5kQzg1U3BwTHE0VFpMNEtLejBkTVVza2dXV01tK1BIVTQvV2lHdVky?=
 =?utf-8?B?R0NMeEg0TGNJOVcxZTBrcSsrTnR5czlXeDFaT0dxRWVBSEQxZTJIM25XWU0x?=
 =?utf-8?B?eVhRT05lL09BY0VkSTVLY01xRnRtOEc2aWlsNzVCZGNPWjY1Ykw5U2dLUHZt?=
 =?utf-8?B?LytTdWR5TStWR1hhUm4rZ2h5ZitsbWdESlEyenZ2TW5tZDZNN2JxOUhuR3M0?=
 =?utf-8?B?WmdpamV2ZUd1emRTekFvaDVjcUxxcU93dVF0ZDMxcmJXRlR2c1pRbFlWS1pt?=
 =?utf-8?B?eTE2ODB3QlNxWDlERklKcC9INEZNVTIvY1NNOHY1bTRYaUFzLzViQlZVdUU3?=
 =?utf-8?B?clV0UEJFTHhQaTJIb25HRFJhcHp2aTRQS3ZkN1NrZDQzeUNwQndhang3bThH?=
 =?utf-8?B?TEZucVorb2dMVjdpRUpVdTh4N0syUEF6N2FkOUpFdWJVNWxrRVBtNUdoYzRl?=
 =?utf-8?B?bDFKd0ZYV0ZFUkJRdjNrQVVFZytoak94WGtDN2lhS041K05wb0s4bXB2dy92?=
 =?utf-8?B?MEJTRXRmcXZKYkJjK1UySXJIWXdyUlBvT095dFBnSGEzWGJJZFp1a1Q0RWh6?=
 =?utf-8?B?VUFDYUV4aHFVMlhTSktWeHhmNmFIOWpTZEtvR2ZqdmpESHVycDRkUklSZFh1?=
 =?utf-8?B?U0hmcTRrMVVpOVhaTkdFaG91ZHAwYjlFY1creStneXE4dG5Fa3ZyRDFlL2E1?=
 =?utf-8?B?RHZZU05xbEUzR0w3bEJaejZQV3R0ZWswK0FreDVqazU3WUJpRDdnOHBocmZV?=
 =?utf-8?B?NW52Rlc3d2RlRXFiR3Jwa3UzTGcwanV3bmpzTTIvVHN3TVQ4cFNXMzFKL2JT?=
 =?utf-8?B?RERjdHQvVVF1UzlIQlpSUCsvZTlob2tiN29GbzBSRTNGQ09scFkway9FVGtC?=
 =?utf-8?B?d29VUmZaZEczcWQyTlp3WmoxdGNUalc4YXlQNE04M3I5VWMrOU42K0FSQXIx?=
 =?utf-8?B?N0p6R3pwZUY2dXVoUmIrakYwMU1IOFplQW1PVVhwRm5tMURVTHZFbTY4SnAy?=
 =?utf-8?B?eWJ6ZFMyb0lyWlhhSGIxbUs1ajNqVExtdzFObE1od2lQVVBqOWc1ZnNCUFJR?=
 =?utf-8?Q?3nDnvpDvr2tKKG4s=3D?=
X-Exchange-RoutingPolicyChecked: CwTLoFLadZw+BcnS0U/PN6V4E8C6nh0PFnwkjK6tGrNJIGjM+RBrFjLb0s67E0R4pOoNmUslzRlRium+iVQuOIsnMOWfV8QND7bejtN3KEBER3q0BG/Oi9Lz9dLI257mccoDMiAV57UVlXShqTkqIB95tmWximuyADrWJfvgulTyvRZhMmybkQSU/oCCTT2E/fVh0N2MViI7P4FKuRHC3s74XlTH4plQ1/Idcq17F8b5gogP6PSgzrWMhUW08ACFKj+8c9lN4Omv53lYg58TeSwHbohBRKc2p+kKkvmvI3Wd1d0hbGyyMzorJpP+rP0OoRHcgHYwlITiqjB+KFUGhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b516c5b-05a8-4fb8-db36-08df0e50d47d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:00:43.9290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tq4amIdQQzUjLwh+Ueas28H8NlC0pJFA6ts8s5Da3ehVD/RkVnRkMHbWpqv3TZBwQ/x0m0WUkZeOAKg6KWtS8DEdO/uGtygZoWRIIdK+IqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB721915
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

--------------OSXYi4PIIjI008e3T0wukwul
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-09-2026 10:35 pm, Michal Wajdeczko wrote:
> It turned out that during early probe phase, VFs use detached from
> the xe_device, temporary xe_gt objects, which when used as location
> in xe_log() macros, will be treated by the dmesg decoration code as
> bogus, possibly triggering a WARN, and the output will look like:
>
>   [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
>
> instead of expected:
>
>   [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
>
> Relax the tile/GT id validation and instead of looking for the real
> objects, only check if encoded id is within the range of possible
> tiles or GTs on the current xe device, using data from the device
> descriptor rather then the object list.

nit: 'rather than'

Please mention invalid id case, how it's going to render like

Warn + Tile3?  GT9? now.

>
> Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd..29eb16db3320 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -10,6 +10,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_log.h"
> +#include "xe_pci_types.h"
>   #include "xe_printk.h"
>   
>   static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> @@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
>   	return component ? log_unknown_component_prefix(component) : "";
>   }
>   
> -static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
> +static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
>   {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	return tile_id < 1 + xe->desc->max_remote_tiles;
> +}
>   
> -	return xe ? xe_device_get_gt(xe, id) : NULL;
> +static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
> +{
> +	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
>   }
>   
> -static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
> +static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
>   {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	return gt_id / xe->desc->max_gt_per_tile;

hmm, we need to check max_gt_per_tile should not be zero to avoid hard 
Oops. I know in real scenario, max_gt_per_tile

value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, 
however rogue user can write kunit test case and manipulate it, to avoid 
such scenario, we need to handle it.

Thanks,

-/Mallesh

> +}
>   
> -	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
> +static const char *location_suffix(bool valid)
> +{
> +	return valid ? ":" : "?";
>   }
>   
>   static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
> @@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>   			goto unrecognized;
>   		strscpy(buf, "", size);
>   	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
> -		struct xe_tile *tile = get_tile_safe(pdev, id);
> +		struct xe_device *xe = xe_any_to_xe(pdev);
> +		bool valid = xe ? allowed_tile_id(xe, id) : false;
> +		const char *pad = location_suffix(valid);
>   
> -		if (!tile)
> -			goto unrecognized;
> -		snprintf(buf, size, "Tile%u: ", id);
> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +			 "LOG: invalid tile identifier: %u\n", id);
> +		snprintf(buf, size, "Tile%u%s ", id, pad);
>   	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
> -		struct xe_gt *gt = get_gt_safe(pdev, id);
> +		struct xe_device *xe = xe_any_to_xe(pdev);
> +		bool valid = xe ? allowed_gt_id(xe, id) : false;
> +		const char *pad = location_suffix(valid);
> +		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
>   
> -		if (!gt)
> -			goto unrecognized;
> -		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +			 "LOG: invalid GT identifier: %u\n", id);
> +		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
>   	} else {
>   		goto unrecognized;
>   	}
--------------OSXYi4PIIjI008e3T0wukwul
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-09-2026 10:35 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260904170531.516-7-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">It turned out that during early probe phase, VFs use detached from
the xe_device, temporary xe_gt objects, which when used as location
in xe_log() macros, will be treated by the dmesg decoration code as
bogus, possibly triggering a WARN, and the output will look like:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...

instead of expected:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...

Relax the tile/GT id validation and instead of looking for the real
objects, only check if encoded id is within the range of possible
tiles or GTs on the current xe device, using data from the device
descriptor rather then the object list.</pre>
    </blockquote>
    <p>nit: 'rather than'</p>
    <p>Please mention invalid id case, how it's going to render like&nbsp;</p>
    <p>Warn + Tile3?&nbsp; GT9? now.</p>
    <blockquote type="cite" cite="mid:20260904170531.516-7-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">

Fixes: 1151b9f6f465 (&quot;drm/xe/log: Add component/location decorations to dmesg&quot;)
Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 5549ef6966fd..29eb16db3320 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -10,6 +10,7 @@
 
 #include &quot;xe_device.h&quot;
 #include &quot;xe_log.h&quot;
+#include &quot;xe_pci_types.h&quot;
 #include &quot;xe_printk.h&quot;
 
 static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
@@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
 	return component ? log_unknown_component_prefix(component) : &quot;&quot;;
 }
 
-static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
+static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return tile_id &lt; 1 + xe-&gt;desc-&gt;max_remote_tiles;
+}
 
-	return xe ? xe_device_get_gt(xe, id) : NULL;
+static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
+{
+	return gt_id &lt; (1 + xe-&gt;desc-&gt;max_remote_tiles) * xe-&gt;desc-&gt;max_gt_per_tile;
 }
 
-static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
+static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return gt_id / xe-&gt;desc-&gt;max_gt_per_tile;</pre>
    </blockquote>
    <p>hmm, we need to check&nbsp;<span style="white-space: pre-wrap">max_gt_per_tile</span>&nbsp;should
      not be zero to avoid hard Oops. I know in real scenario,&nbsp;<span style="white-space: pre-wrap">max_gt_per_tile</span></p>
    <p><span style="white-space: pre-wrap">value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, however rogue user can write kunit test case and manipulate it, to avoid such scenario, we need to handle it.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">-/Mallesh</span></p>
    <blockquote type="cite" cite="mid:20260904170531.516-7-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
 
-	return xe &amp;&amp; id &lt; xe-&gt;info.tile_count ? &amp;xe-&gt;tiles[id] : NULL;
+static const char *location_suffix(bool valid)
+{
+	return valid ? &quot;:&quot; : &quot;?&quot;;
 }
 
 static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
@@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
 			goto unrecognized;
 		strscpy(buf, &quot;&quot;, size);
 	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
-		struct xe_tile *tile = get_tile_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_tile_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
 
-		if (!tile)
-			goto unrecognized;
-		snprintf(buf, size, &quot;Tile%u: &quot;, id);
+		pci_WARN(pdev, !valid &amp;&amp; IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 &quot;LOG: invalid tile identifier: %u\n&quot;, id);
+		snprintf(buf, size, &quot;Tile%u%s &quot;, id, pad);
 	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
-		struct xe_gt *gt = get_gt_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_gt_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
+		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
 
-		if (!gt)
-			goto unrecognized;
-		snprintf(buf, size, &quot;Tile%u: GT%u: &quot;, gt-&gt;tile-&gt;id, id);
+		pci_WARN(pdev, !valid &amp;&amp; IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 &quot;LOG: invalid GT identifier: %u\n&quot;, id);
+		snprintf(buf, size, &quot;Tile%u%s GT%u%s &quot;, tile_id, pad, id, pad);
 	} else {
 		goto unrecognized;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------OSXYi4PIIjI008e3T0wukwul--
