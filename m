Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068A3C4451C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 06:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8A10EC58;
	Wed, 22 Jul 2026 06:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crACbBQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924BD10EC58;
 Wed, 22 Jul 2026 06:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784702815; x=1816238815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xMDAq4YVtWKRRW5MYm7rghMt8gCOmMvVG5LZM1Q5apo=;
 b=crACbBQQ7ej+h4Iu3wHvfh3t7/TFWB/d+rCCq+jC5JlgdP0QlS0ELE2r
 1tiuq5SLjRGatOB2W5kqZu1mn3suxpwlPNKuQAs2M3DVUJSyXiVJEYIqM
 B/EiyWQ1+utTNsXHtlUpEuOGG+0Za6/rBmOp6+yLvreg01P5d/zQWQMOI
 vm3d8n2rC4a7bGtQzm1n1E9WbfRvwjX9YwL8zP+mcrsnhqtuPaysKrqMc
 232fpBPd5hWR6X0BMGCO8eqQVLM0VhbMg8We1PSMGeUoQeaugdvtPNsea
 ZtWMbbdjK11j+bXHtPFzCle3Um8b3n6vWYETRifh7Szah17ZEwwB697E7 w==;
X-CSE-ConnectionGUID: nkmTLiOmRwGkyDNR8IMkVw==
X-CSE-MsgGUID: Dot32aYUROWLyV9LStzOew==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102743158"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102743158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:46:51 -0700
X-CSE-ConnectionGUID: HF+qKh8IRV6LhcMwB44VJQ==
X-CSE-MsgGUID: J/sBqaPqSFSsBKYi7cWYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="257460009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:46:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:46:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 23:46:50 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hmlpsx9yT2UHP8cGoSUOk8u+UXz6kAPbQ2GKh4lBNFNLX3cM3loBlnNFSx97DxHSG8dAWQRKlew9WthGmDK5dSh5OqmCH8JZAz2VP759B49PFIKNWVDC0js3p3AKSgZ9hIUjxFuCzdObf/55hFH/8uHzN8zUmYttO3D4nda91d6B5x33ZB7X632aGEsQ90bpw3pSv9cvKB3DxWO/oTN5zwLCOQiNYt6xAZq8hnjPND1fsaaxn0JJgawanJSjQhFyhiQ+u7NX8UAn+28Li+J6Ie3fm2TxrEhVjRJa0F8Dpx/W2n1J6xCvlYwMP7o0ur3lbXTq6+IfLIovYJ+1NCcV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpa+MWKlWFlrsDdIOlzqdhZuw2wMQOUHw2ywH8kwdvM=;
 b=eI+NnZGd0nywDecrfxjL2kAehacGnT2xGoUAMOU9kRtRqpdgFckbeBuUuRK5sgdDJ1rxnj5pZRdknlAs4aWuf/249uUiF2Jy/v9WWQE3ELTEnQ3hReJ0rsv+NLh8eFrkEL/r73y/NixHH4J8tyNS+RAQPUn9XWpwrM6YyB/BM/ggu7KqKApts5fBJvdHSdZPsnR3oTwCTML5Mk39amTas9m7SrgQXcIHKLDss5kskvdyNgFuC3Nf5zS0VYGOCr51PA4RVkYoMM2lMi17mg8uyxa9MhoyyVDh2tVSNTLh7Ukk6cUiRZrMFD2vCq5WW3SgjU8MJ04OkdpVPDwUKZjRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 06:46:42 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 06:46:42 +0000
Message-ID: <08b741c1-b187-410a-b7cd-7199f73a5184@intel.com>
Date: Wed, 22 Jul 2026 12:16:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/display: Ensure a non-zero safe window from
 PTL onwards
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>
References: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
 <20260722062449.1166411-1-ankit.k.nautiyal@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722062449.1166411-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: df7bdeb0-486a-4687-a42a-08dee7bcfd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y7RfnbHpWZzt+BarWeNL7u1Y8Wwe0Qap9Mh27B2UDhVpH8Gb7YljIbuLYxm7R7kzAKMJymfi5VLpbChH034LyOrDOrM/2O6/rWZZKNa4sLZB+PtDhId6K5ezcj46ES/xFj7+/zs0oHjl4Ne57pf8lSgnxKhU0ongI7G7nm0iGECzANF+gLFe8imppSp1cKr2pC2xHtktjDf6P66Z0gyildZvAK8rFslXmTI/OS5lxzG1vkwbGxh3IN96q/+33VjXXEwFnQCn31Jw5i+C3BE1sZrazrcC8XzJO3stNX3hbv4oEAdnKoPLqOUEu1JFudZ1E4iJwNeGqsQUe41v/eEs/HRl+BpI2yEILYemhIWAJMbpuqedR6TEdUpDGgO/rFwoadwb1rJMgmF7lONh8tFFGBa6bfun5YcKx+hWdC6TLBt1nYHHq/mlzSWndLZzufWVFbIjvoPSMG4xQRzdr30gIOt0wD2Llznsh/XAYxO+IjlPPXwtWn7IRuvy7ryrravIWZewwYloJWAMWAr5PUXeuQ2HoeXtSmZWdD4gaNVeu5N+sC2aPHeX+iCMWpvGUeAcR7tkyUS+O8WBd5N8DPLIBp/ob1v+MR+05m7+1ot7KhR2n0owmX8PagWvz5WWiVtqEJdYSRTaOyewasT/CHjpdeV/qJfXdQzXYSN3fjK0ABM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNoeW82bmQyTUF3VDZWU2NxL3pGNU9jWDdDdTR0bm9xa041Um1IV1J6ZmVZ?=
 =?utf-8?B?TW1vbXgwLzBKaU5KRDFzeDBBYUpmRjdpV3MxaDJUVW1lS0hudnFvOE5vbHZx?=
 =?utf-8?B?RXJ1ZnJwSVdEWkh5aXk4Vk1hUHFSTk9OS3h4WVNNdjlWKzNycDhEWFZvSlhL?=
 =?utf-8?B?b1QrUUJuczFCYXNrem03SmdkcEFZaWFQRUptclNPVXhuM3RVeFJuSXdja3Qz?=
 =?utf-8?B?di83NVVNM0RlTnU3SlBQQ1Uzc3ZvWDRMQnJ6L0tDS1JXK012WjhCV0hEdVhq?=
 =?utf-8?B?bVZRc1FCblBiZVdveG9xcTlkcFl4cjdPU2wrNDhwZUoySjU4M056MWJSOGpl?=
 =?utf-8?B?QlVWOEE2QkVrdDUwc1RjSnhWVGkzYmlFS0xGU05TUjJCeUhOODByeHVHSDVE?=
 =?utf-8?B?ZCtYWGd0MHhPalROckNiYlF1Y3hzR3dPdjVaTFVRWUVDZ0VzVmVMOWl0SzVs?=
 =?utf-8?B?Vjd0MUZQeGpzcktEdDRLeVkrRUxFajdQQUVWSUtpa0JsVDZ6T0JjdTFzaFlB?=
 =?utf-8?B?UVRoUU5pN0hiSVJINHN5em1JVTExRGlZSkVGN2ZiTWt3Y0ZaRkd4eWhlYWdF?=
 =?utf-8?B?VjNMQkx1VUxraWxwNjZ6WHBKanNIbDA1dGhqRnVrN0JnMFZxZEJoUXFDVE9P?=
 =?utf-8?B?NWkvWUVoc0tkcWFTbjZNdkwxNWdaT3NxZkUyMXRiL0Q0Q0tTU0U3SlBLUlUv?=
 =?utf-8?B?dW9CdUxuWTEyc3BoblFvQ2pZZC84YXB0Q0F2RHM3VkczVXAzUS9mR0ExbGYx?=
 =?utf-8?B?L2V2emdHbzU0dGtJaWQyelNQUk5pRDJBWXlGc0k2QXVRWldPOVlEaHk2cFJp?=
 =?utf-8?B?QVFZcXdOVnIyakFvQUlodDk1c0xGK3FnQndReUxIRnpQdWZINVQyYmdHc3c5?=
 =?utf-8?B?VzRGSGNjWWtYbWhuVklocm1KaUlzNXpJeWc5QUhnMVh1dzNTb1dudnVzOVh4?=
 =?utf-8?B?b25KcnoxbzFHK0RaaEpPbjRhaUZEUmhJL3pwVytVTkIyNjhmamVaYlU3dy9y?=
 =?utf-8?B?U3RORU9wRXFVc29vbzZmV1NraUtkanNtUDJBc21NMXI0Zk1GcU5ab2VTVGo4?=
 =?utf-8?B?QWFzNEtTd1JkSTMxOThOdHFhcWh0QTV6bk40R0lPK1pScUxLcnIvRWhsYkNs?=
 =?utf-8?B?N1NZZDZzV3FoSHI2a21yNWY0bjR5VDFwUUJkNlJMQVdXcHgvYS9jZjZ5T2Ur?=
 =?utf-8?B?N1V4enR0SDlBUU0reXNPZ1g0NEQ5UlFrNEtjaHAyYmNqaDVsRVFIbU5JZWpF?=
 =?utf-8?B?MjdYeGpaTDdjbk96dkY2em9zcXRvMGtUeWJOOFFIbFJZd0h0V1RVY2J1TXBN?=
 =?utf-8?B?a0RDbkdPVmE5bG5LaHdlb1pHWTZCZkFqc2tmNVdIK3lkQXpIcjNma1pPMFhs?=
 =?utf-8?B?VVRBS2YydExJNlN4QkNNbmJkc0twUFNjZ3hQYm81by9pVksxaHBWUXFWaWhK?=
 =?utf-8?B?Y0YxdmJDemswa1ZwdmU5dDFUYk9QMDQyS09oZFA0MWxwb1hRZjNLZWNwZlAx?=
 =?utf-8?B?U09BcTZUWmJBNjdBMWFWUFRwNG0vcFJKWlVUbHoxYVJxMFRLNTZ4cXplQUVo?=
 =?utf-8?B?eUY3QVcwR1kxU2FRQXRkR3RXNEx2MUdBYUVaRUZjZVNzRHZkSi8zNmYwRWdW?=
 =?utf-8?B?dVBDVXVrdXVNQUpVcGtUVkZCS2dtcUtXSE1TeFZmMVpueUZ3YUx5UGtJMXN1?=
 =?utf-8?B?ZHgxcWJVZC9HZE1HNloxUDRzMlFUNHAzQ3hCQ3hqZ2gyN0NkM3Z2aW1BSmNm?=
 =?utf-8?B?NVUyR0xpLzN2WW1ERldWcG44U2Z6OXlreVFGTlRGc0NOTDByYzFJTXRGbUFp?=
 =?utf-8?B?UTVReDFWQXp6UkFrUjlaKzRDTmQvMTEvd0QreUtDQkVDbk5HWTVUTkdxTCt0?=
 =?utf-8?B?MS9HU1ZqQ25SWjIxaktVOVVZL2xlSzZTZlNTUlQ3UDVNNHI1Qks5VzFwUVUz?=
 =?utf-8?B?dFdqdUNTYWh3TFdHWmtNd08vZmFnUXZLbVNYRkh1YUM1R05jc3ROdEtwMVRv?=
 =?utf-8?B?dG5ZUkxJZC8zKzMwUEpHeE1XV2E0UkxLbVNGaXdFT3NHUE9SbkU4YWladEhy?=
 =?utf-8?B?UHZiZFVWOG9rTlRibnE5Y2c3SllPQ0ExQlJKRy9XNzRkWXpvNlMzNXk5QkJl?=
 =?utf-8?B?a29uYlNEdHJFcmM3YlRwMUh1SHhPS0RNL1pkY1UxcTB1U1MzWFlsT3RkdWtQ?=
 =?utf-8?B?VVZZeE5mQ2Zsblh2Y0lOamt4SDFVMlc4cmRFQmdzalByZ0tMdWRjWVR4K01i?=
 =?utf-8?B?WWREb3NrNU8zcXRML1pOK1E4cW9QalNTRzVsbVVRUG13UDg2a05icmQ5b0lL?=
 =?utf-8?B?RnYyQ2FIVklBQ3JvVSsvVnI4dlFWVGVyYkthVFZ3YXhaWjEvN1Nsb25mbnBG?=
 =?utf-8?Q?e2wj5KFvLsyehnt8=3D?=
X-Exchange-RoutingPolicyChecked: YDkvscf/LfJLd5CKvFlrIPStsHWRxoxilk7qKZMW9r2ZfTSFuUItoJ4IUCDP/7IAgrWftVt1ANjtCXHlQTEegyesoUVupamfV/xJpbOB9Bobd00SVt0gs2yZovLIIhoYfUwEeywFT5HGApGorxQWmMUwGsGdPSYI6rUzccOWiRxKmqRNPcf5mWVLO+Gibhdjy9RESInXzorQ1B9h6zZvRlK2ieGHgh/jHKoYxEcA9yVzxXwmoihMDrcptU+mD/uLek5/pj0G+7MX6Tjw1LZyMMHh0i1GuSBkBTr1jXCYkhtcyx2T7UFv76LilzAxerMTe+RPfwIHgGCGv9Cp8mVlFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: df7bdeb0-486a-4687-a42a-08dee7bcfd23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:46:42.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8CkODjetO1N2bTN92yKBlV+p8IReFvV+r+I0DrbczzzUXq9HpWlQl8rFJ0ayifh/qWbFk3wxGgX1mOW8tpbQuKlVu87PNv4NPOf3rXnx88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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



On 7/22/2026 11:54 AM, Ankit Nautiyal wrote:
>  From PTL onwards, the set context latency can be in the vactive region,
> letting the safe window start some lines before the vblank start. The DSB
> waits on this safe window instead of vblank (bits [15:14] select the safe
> window signal from the DPT unit to start the DMA engine).
> 
> With modes that have a smaller vblank region, the computed guardband is
> clamped to the vblank length, making the undelayed and delayed vblank
> coincide. If the SCL is also 0, the 'safe window' becomes effectively 0,
> and the DSB configured to wait for it gets stalled, since the hardware
> never signals the safe window, leading to:
> 
>    *ERROR* [CRTC:159:pipe A] flip_done timed out
>    *ERROR* [CRTC:159:pipe A] DSB 0 timed out waiting for idle
> 
> Keep the set context latency at a minimum of 1 to avoid this.
> 
> v2: Fix the bit numbers and correct the commit message. (Chaitanya)
> 

It still looks *safe* to me ;) the commit message is good now.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Fixes: 4a68c7516c57 ("drm/i915/dsb: Use safe window path when VRR TG is used")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Assisted-by: GitHub-Copilot:Claude-Opus-4.8
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 38763a6802c5..0822a2194c7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2459,6 +2459,19 @@ static int intel_crtc_set_context_latency(struct intel_crtc_state *crtc_state)
>   	set_context_latency = max(set_context_latency,
>   				  intel_psr_min_set_context_latency(crtc_state));
>   
> +	/*
> +	 * From PTL onwards, the set context latency can be in the vactive
> +	 * region, letting the safe window start some lines before the vblank
> +	 * start. With modes that have a smaller vblank region, the computed
> +	 * guardband is clamped to the vblank length, making the undelayed and
> +	 * delayed vblank coincide. If the SCL is also 0, the 'safe window'
> +	 * becomes effectively 0, and the DSB configured to wait for it gets
> +	 * stalled, since the hardware never signals the safe window. Keep the
> +	 * set context latency at a minimum of 1 to avoid this.
> +	 */
> +	if (DISPLAY_VER(display) >= 30)
> +		set_context_latency = max(1, set_context_latency);
> +
>   	return set_context_latency;
>   }
>   

