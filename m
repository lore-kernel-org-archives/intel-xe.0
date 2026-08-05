Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A912C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 11:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF210EDF2;
	Wed,  5 Aug 2026 11:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtqD08ER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03EE10EDF2
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785928584; x=1817464584;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AbqDGf31gYd4AvTUo7ilDHWhe1eqAhlrOQwGf8XtXNk=;
 b=ZtqD08ER9UHGi+nEYQAQPozOW46VgpqSQcU6jjQknc4EZ+0RnJiigtSo
 nJIlz6rgRtDLQfDeAABhfvZr5XbeI0RdUU1c53+axr0YlVZsmUEsatO+e
 ehJXo0IV82VVQG0+P6LOiRYEBG4UwXYKcrHAovp9Zcso/+yjmIBXxFEl7
 Ve1FE35kWqhg+J8x2KhZV/n5D7ei//nS5VXnKOD4SXcPK3lK+lvf8BllY
 WdpLw/ohcr7dcY3ay41Q9J5L3add67GGS9XQMY0Yc6TGj5zoJ8qiiqeex
 kzO/7L0LIzeQ2VqK1ZahriWneV8l+wDA0lYmJ8ibwAc5Zbw9vaq9eUVkO Q==;
X-CSE-ConnectionGUID: QHPwkbaqTdeVXNqITsvNSw==
X-CSE-MsgGUID: UDlRhHqITiWwXH9a1Om9iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85474855"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="85474855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:16:23 -0700
X-CSE-ConnectionGUID: An/z5UQoQTWMG+UzRXVIMQ==
X-CSE-MsgGUID: jIFlXvyXTJ2RrmI99wv8CQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:16:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:16:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 04:16:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyhdRey9pprqJAZfcT1NfP96KfegFrKcMiccvdypZ+0nEDMQ5ay7ItzmsQb6WSd1aTmZnlR67kQjadcUd+9BHTqXEaDgbjj5PW/vHlQJ9+YO43LWyFHpAx0r0+T9cfVtStYJ7r5S5UojqN9q4urb+ldTMLmQQluPa8rcG45VZuXvkDCS8bfa3psUdhML0+q8pzUoYlIR2NDGqH1pvwEYE+vXk5GN+v1b8/pHWEpqwctgYW9Mfi4uFB0YJ7mmAfboxJq8ZKWKEgLe32B2P70diaPKn9ynDwrAW87qUeRqorD/UiPavmcqKd89WdwH+0Fw8X2Y7ucZVhgG+xsjDHeoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Qyhx07u6TfQRp0ZV0mqskOPfbH6MFdey/BU/HRXMNo=;
 b=ui3Vvjr9Gpiu8b3+13C7I63VboWb0L6iVDozc3ZgSmmlNR6EQW4Jk5ThXjlM1ucyBKLCGbckYQtctJpVX0T/sGgOl0WbboKyo5rqTxgeOfufJockh5lJJ41nl9YQ0AZD3C3qLBu+eTn9cEgzSLuovKMJ0XyagH2Y7rN+e/1e3RxB6+2X+PLs9weszHjkjC61Ep6apmMk0iZAk5HtrM4iFrC0GW/3DHPUjp1XJjDCO5+KWqcSAeZt1uBGLN4U2D0i5gGLhdSZOPiWaRmg5GwFcKR42pFTUTrMPZiL2PcAScE43wOZxtMwfPVjVR8F5Zz08K33UmYmgh9M08iKwf+gjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7437.namprd11.prod.outlook.com (2603:10b6:806:348::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 11:16:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 11:16:19 +0000
Message-ID: <6f16cf9c-1fc5-418f-a89e-5eab49905b15@intel.com>
Date: Wed, 5 Aug 2026 13:16:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe/vf: Add bounds checking for queried context
 and doorbell counts
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
 <20260728095026.2197333-9-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260728095026.2197333-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0138.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ca1e41-6994-4bf0-ef76-08def2e2f90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: oUT6Nscf/rHeKuQoLJEqI+M3hGJVvd84oOr2eGVqW2dITlnsWui87z6iXVYROZkfPcazXb4+nFdeCKQb5LjAcQk5d/R3L3sbhITKzNjKFjQzxuQF/IhBqogeKOGByUDrMBbCfiVzql9bsFLsih7ubHoZgodqip16YcjOMWnr+5OBAPLelp7sGyDKmbyC0mfJMNlzWGKPcYdboRmgicUnPIxFIiTVrtYA4minJ+dlO0uOLQIQ7zhpO0EopdugiQJ+ippM5nlmVJVvg5YRsUYcuDB8o1Ot/uot5RWAtA4B+gdqFm67wpqUcCJW+e9jv4QXQWWw9oBRexznD3KcjVevMeaj5l0apVFx08XLeZQfZ/XV0L3x1ozy7otLVuhuvYFn+5QuYj+HiQtkesXOZGbiOCv7MwwqF4T7HAr/9NWta93mG2kcmSArv4HeZUoOBPSJFBloq3S6IO5/iOnNI0H93dEYiZFSavXajf+Y9J9zTfrObqjPv0BBFkcfcz/2DcwHTuAazbNnjT0FSvb8tz0Wd+Z8uzPW/Ku9iS4+3o8Lw8zsXfFHbpt5t28qJbLSp2G5fHz2Esij7aNmLAU9s23QTTuh7K2DakDKqHtBvV6PmwN6BezuXG6USnw3oesAttCY6ioC3Hfii2PhAdzvzXztQETyufocCYsEr2NTdFTKxD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdNUm84Tm90TzZXZXZrd3pMMit3ZjA4Y2VmVXpiT296aURlbjBjQTRPSHJN?=
 =?utf-8?B?VmtrK01ES05pUjhHcXhDSWp2L0FocUVxMCsya29NYXlwdnFRSTE5MGNtMGtM?=
 =?utf-8?B?RG5acE01V2RKOTBVNk41a1BRb3d1ZWNSWE1VWnN2Mll3b2Z5bVE2YU42U2FG?=
 =?utf-8?B?NmlYQXVtcTVzR3RReTNPVkl4dWUzV0xxdktTc2Rubm1JMUxPaWZOQVpyVHQ4?=
 =?utf-8?B?QUpDK3piVTNyUHhyY1dFRjZVUVhUcTRDcHV1OUZpTlU2QkNEMy8rL1VrbUlo?=
 =?utf-8?B?aGd4YWFVeTgybnh5R0xEanRoVEZONEpvY2dvSnNNbndqNUxiVU5XTzAyZ01o?=
 =?utf-8?B?dm9IK05XZU5ldHJmRDhhblVKTW5Oelo4aDQwbVRHdExNbFJDSzZvb3h2Rmc4?=
 =?utf-8?B?MDNrUEx2QWQxekdxZkY1bXB3Q2xieXNkNUdOLytUMTQzOHFsODc1MjN0dkdw?=
 =?utf-8?B?Zm1Uckk5SmY3ZExxdWJSRlRBZmFGZ0Y4UlNGenhTZFk5SVFQYzdpZ0xTc0kr?=
 =?utf-8?B?REZuMkpSRVFWWDVaUCsyREs4V1U2bkMweEd3TXB5bU5xNFg4eHNQT2tEaHQz?=
 =?utf-8?B?TEdWUHgwRGU2MXRKeEZzT2hicW9RQ3VsZDhaSzlqZ2lzK05hN1lYYXZUdm5y?=
 =?utf-8?B?K3dZRDNoaGN3bVNxRnRhMFRrc1ZZTTRPbXU5WEhpQVNyZXRrNEdlL21KUHUv?=
 =?utf-8?B?dCtjOGJnVDBxTWw2cU1jeTJ3MC9mVXc5UnJJL3kzYjVFWktjbkloNlUrUTU1?=
 =?utf-8?B?RzhRL0NtVDJtQ3AxSFFWeWVkc0FZVjJpU0k1M3ZsZEt0bGFHelFTS1ZHeTcv?=
 =?utf-8?B?S1c1ckY1OU1lS1orMDVYc1huRytXMytPRi9xSUV3SjVWMVEwU1NrRndJNlRv?=
 =?utf-8?B?cmtXNnRQcnkySnh0ZmtRRkFNU0NUTE5GakhUOUx3eFc2YWNBeDRMSTdvOUNH?=
 =?utf-8?B?czE5Wk5YS2JuZE1obVlGb3YrbFpyVE54OXBWYnptc2NpTEJQeVdMd3FqMisy?=
 =?utf-8?B?bjRPSmhvbnp1eGZTUTR2WU12Zy9Nd3hhSTJFUVg4SCtEWTZHajVVNG5YUGRi?=
 =?utf-8?B?YUEzcjlRb1lRM09XaWEzMHFLQWlRSkhSL05xUTAzU3d5Uk0xK0EvY2ZkeDZV?=
 =?utf-8?B?Y2xTSmRkNUdLcjR2a2gyNmZBNmYxVTVnZ01OZjBsQkh1ZXEzNG1TcWh6S29n?=
 =?utf-8?B?SzljeFNpRE1ydVV3d214dnJpUUlSTXZGQjkzL3gya3plb241Ui9iTTVJVFdi?=
 =?utf-8?B?YVdLc2lqa0s3MGo0c1JmNHF2Z3J2R0ZrcHRFVjR4STF0b0h5d25vMjZaY1F3?=
 =?utf-8?B?dUkrdUFHd2NBRElCWFNnT2hEMGlJT284NHkxVUhtbC9Rb256RldFRFBBL05H?=
 =?utf-8?B?R3lQRGJLekVBbXhrMU9nck9sL3l2d1Y0TVJ3MEI5bUlhWDZsYUxVMmJWSEY0?=
 =?utf-8?B?dE1pZ2VPb3lyR1FYeFkrS0ZPL0xiNjgrbCs5UzQwYzNkU09DZzhkUk5RbDNG?=
 =?utf-8?B?eDl3TkVqU25UQnRjOTRGT2hjNFRvSWxHeHNVYSttODkvM01Odzl1OVBDaWcw?=
 =?utf-8?B?WWJjQ3lzVXNwaDlzemlGcjJRWkJzd0dYYTB3enJIay9WaWozbWh5ZE1HUXpB?=
 =?utf-8?B?ZjNDT09pc2E1Mmh1dGVJWExDSzJNR045VXJCaFNsRmoxb1VFTTQ0ai9zelRs?=
 =?utf-8?B?S1Rla254bUEvL21pRVR3RDV3M0E0QWVRMUZjVFlMK3FUSFJWeVBLWFArTkVP?=
 =?utf-8?B?aEFiZCtCVmUxQkhXYldpbkhFWFNDMXhRODJIMWhQN0M2MExiTHAzOCtwM2NH?=
 =?utf-8?B?Q2JibHlYM0sxaE9veS9qdHkvb2J4R3RsYXYvQ3ZFc09iSStsVzVyRTFQNU9B?=
 =?utf-8?B?NXJLN09hejFYOHhnVWYvRDVsNW9LeXRHM2xhdmROVVNFK1lRU2ZUR2dHdGpD?=
 =?utf-8?B?N284TXFtbncvRUVkWXg5UXZ2V0Z1MlV0Qlo4ZFlyNkt5MFJZeGlSN05sbUN0?=
 =?utf-8?B?bWVPd2d1UVNHa1k5ZTQxUy9peW5rcnBubEZZSm01RHVkSlVwV3QwY242VHU4?=
 =?utf-8?B?a0JybVdSQWJ2N2xMKzZKTjF4SVBWUTdOWnZzaVd4THVBSlRuZHpGQ2ltZnFW?=
 =?utf-8?B?UDg0WDJHNXdOSjlKOWZlUTZheFJXRlBYaUdPUTNCWFNoNHB5bkhielcxQTlq?=
 =?utf-8?B?dkFSaUc0b0pZVEROZ3kva1BpZEM2L2pVQld6QSsrck4rVjNtWjBsZ0hUSkR6?=
 =?utf-8?B?eXJqUmZhSkFNUFNqNDJFZVVVSkpVN1prWnRta2gwYXdQazUzQnoycDNVSFlt?=
 =?utf-8?B?aG0vdUc3eGxKSE4xbFNKNGxLUEtiOCtiZ25ZMUZhME9HdEJWcDViSk1NSEFu?=
 =?utf-8?Q?fMF6JLPjkxb24acU=3D?=
X-Exchange-RoutingPolicyChecked: rTC6mDAcXhC/+iO4tZ/t2Fsqw32sb6FteVoWVRuoV8+YWdLwSSdXDqJzI3CR6PUI+6WB5mc03WI0wY/Phnedp2YIW30U3OfozuqArI11DW1DDWImhQKO2kitRdDQwC8Xr5djfr1j6QRgfw7w2u2sTz0AZumm9C7ANqc6oULE1zGld4UfvTFxZT765bxEAs8MN6NF0GJ1BV5qMSVBNx5HZjcex4lGrySN2Gb308P6ewmKvEff8gzeDKUx5ZdxzFcmJGmaY87/ED65wPalQ2i+1yocEMpdaAoKWFzeYlteHZ4TB5iBHlFegZrTFb5vHa9jWfK0mergv+L0PpKZft078g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ca1e41-6994-4bf0-ef76-08def2e2f90e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:16:19.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZosSv5mfnhqklPdsdFbut5LBAfbsyrMSWP0LLXQk1EmU1r1LcPwMpU0BSP5TcYbs588bhanr9fGAT3NYR/ihPqC5ie1Q9M8twJivBiGkWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7437
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



On 7/28/2026 11:50 AM, Satyanarayana K V P wrote:
> Add explicit bounds checks for context and doorbells which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V3 -> V4:
>  - New commit
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index e96515766081..69e531be15ed 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -15,6 +15,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -581,7 +582,10 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> +	if (num_ctxs > GUC_ID_MAX) {
> +		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
> +		return -EPROTO;
> +	} else if (config->num_ctxs && config->num_ctxs != num_ctxs) {

no need for "else" as there is a 'return' in previous 'if' block

>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
>  		return -EREMCHG;
> @@ -607,7 +611,10 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	if (config->num_dbs && config->num_dbs != num_dbs) {
> +	if (num_dbs > GUC_NUM_DOORBELLS) {
> +		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
> +		return -EPROTO;
> +	} else if (config->num_dbs && config->num_dbs != num_dbs) {

ditto

>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
>  		return -EREMCHG;

