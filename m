Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1C6FED2CC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 05:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BB510E95B;
	Thu, 12 Mar 2026 05:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUkSjjtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95310E95B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 05:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773292703; x=1804828703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BgJ2yPq4gRWcOrrjtzqZc4bpnKEx1/KdKvTdLvj2yJo=;
 b=KUkSjjtZhczTyAt90urEvdFN/XCR/qH/u8HjFP6BV+ws5vaBl7/pMDn4
 IHOyVLPWFqWi5EeXqhZilNONg3mBxeKA4ZQQeJPZJVQ00uvAJbm6eXddr
 KQYppCIS0TfX11EUA3ls4t7LpI+BlZxq9viPsj/3AC0QNWiMTUceCrnC7
 66T1Kh/cm6bm7BFhNvSDz28WcqCAsCLktUFwYiUUbOEkKXcdRmEbpnPF4
 8gJ/rMOrSS6w3yOeU9RDH8twUVQX7coljUvw/HgdC7eT0TO6ppwMbft7x
 v1UtUO0nNxg8IzWkNyVtuJrX3xBiOsqb5ab9SrtvQ4bljs05b6VYXKzRV g==;
X-CSE-ConnectionGUID: +Yz2OUy8QKO+d2dfq3XahA==
X-CSE-MsgGUID: WoGvNNyCSsqy+CbznAN0Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73567216"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="73567216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:18:23 -0700
X-CSE-ConnectionGUID: Ru/8kZW8QVCkD0hALUUaQg==
X-CSE-MsgGUID: H7zs5jN1Tk+RTKOb8DjYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="251199050"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:18:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:18:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 22:18:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJFbONFgOIJHeHRxTzQusp7Si5Zuq/kumksEq7KCzAxPNZdxjEjR+GsnOl7o7QyRzpMiPx59ImOf5NKONQAoeU+JbvcdufOBHAqurFKAk5tbOKOgkHY5/57vI1aPpYS18aITMfcujX81PvRiK91cI3nOrq4AVvNGgTOUiVz0f1JbDVTqv/12DBVbHPTM97I4+IbA/KH3g5eSb1B8P3fvcFvrijSVPgBSedwKdTinc2eD73x8I3X51HBmj47JoIVRdULEIfzYDPnxe2Vh9AWWQ1Urn8W0MPhEqCvscjNgNSO9xZIbUrWykjPXgHwGFsg6doAmDnnMyOeNpAMco2cmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7hxKDxN/bazQytoeGtFZab9Pwa5ZFM4w+7RmpcE0g8=;
 b=Du19s9FfpYW0M9mWyzjgKHkfbGgqa2Brxn382ZfvBy2XJLQdZ0TyL1H/Qc0k/U9xz28Ep5vYNkIep7F0Y7fyVhobWaQUeY+aW8hZtXAZSneqVI94CjdiyyYMmpHmw6OvHkVm27ddMxG5BB33n81gQljEZst564HPho1oCtuh6wC1Txv/QSOmRLlBBc8fVpRQqm9lJ7cEQeEypJnKazjfAj3oNbKE6lx3csVos5K/IetFXliDD/5kW5mYO4b9/UZlHd7XklHAMf70FeEjsoClUAbaIpWvcw7nKH0eAJ/uKze8EL0DLKy7APxLvyN9XxIzpTgNKd7NcaJ2jTD35KoLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 05:18:13 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 05:18:13 +0000
Message-ID: <f19652da-7b49-4d3a-b987-a6be59389d3d@intel.com>
Date: Thu, 12 Mar 2026 10:48:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b99000f-8913-4136-b9c4-08de7ff6c223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: cj8T9OPqIiYKM8I3GnRLhe14dcbfgeceih8yn4rstl8IdOEZ295FYIC/bD71FzekBLNb5wZetQ6QwgiroNnUGqxJESRpm7Jjz3DjsFg9LoLtIj2YCDgaS/3T2uWaJGsvGFjmMzgACt8XEVbwh7ZF/Vy3Cw0soLpZkhcF7ApjXr6CzQmttjOecxgqdgsmEA8CNLptO9Ba91wp8P4OvaTrxZfQ9PsvqXa9mBzaBhkohm/fblqKWiy86HI/DM05EGck/DLxLXs4zazbnyAdj02iIU3Zveh7r45jPHLtoJGCLRRyBqoLlPh/lbi5VBTGR/Rg4GtD4bqqiRZbgHI0MNJFnC0SLcwG6CDf3leVVAw+XzjecZ1OCM6nsbSfdPITcuBGKEXyjqU5KuSK2EC4fx6s9w/Ee/Xsp85SrDhoi3OcTs3G1PSJa1zxhXx8o2ifLsJkpJJN+vP+kDtX7EpEf4/Z7n9UHsdCGp25/Dr2D9nU0WYor9leLDYCp3yieold+OfJeZPByvEsbtAr8xXqdRg+n9Cc3KJ8+5gHklekLRhVvqGV60d74eplAO5yWjho6pceZo+LJHq9F/8nEyrajZ2gors48KbFpjLQB+wdhWLaLS5cc30maltQlZeZmhT5Ty1SUyUyJ9pPzi/oywS0Kyr4Pyo0fP2ZZeK3kAwBkWfpyU8izZaQeawQARj0Fys5nGRcm9VW4SqN0oLLxI0PSk4wIeEKfhrRgichhsmUgcU5+3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRpV3ZuOW5oQmZIMkkyd2N4L2JxdTNBcVBqM0ZFdWIwU0pHZHExbXpuM0lm?=
 =?utf-8?B?aElUc0ZVYytqR295U2NqM245VFFSM3Njc0c3b09tQ1ZTdlZiQzNCVmc5L3N2?=
 =?utf-8?B?M1FxNSs4ZUNVaHdMalBUWXlSRUQxRU1HNGJhbFhxdVF2eEdDa3Y3WXlwSVA5?=
 =?utf-8?B?emwrOFRHLzB3NmxiMEdlKzRNRzBsZkxSWG1kSU5hUS90Z2NwTExVNWYwOTFS?=
 =?utf-8?B?WFM3bjhtM3RlUkNsVzNJdGdpUjRDQ2o1UjVhUllFcUFBWFgrTDZjM0E2cTl2?=
 =?utf-8?B?Z3h5bmVNUnZPaTNocWhHVFo1aUxHcGJUY1ZUM3lac0ZudVJnRllSQXpEMitE?=
 =?utf-8?B?UWcxejNMenZFMTIwR3luaUxrems1aEprU2lrRmhQZ1lRZHU5K2ZQeUFmT0JF?=
 =?utf-8?B?V2VBamVFbTRXeVNkQXNnbUtKYzNJU2N3dVJhaWZ1ZXdoWVF1eHcwcEwyZEtU?=
 =?utf-8?B?d1B1SVJNMTZoY2NETERyamJWQWplUDlQVGtOYTVCcXNLdFc1MHc1WTRXWjBm?=
 =?utf-8?B?NmpPRTJRdmtzLy93Sks0LzlJeXdSK2ZGRmx4ZFppdGFRMmZvS04xcW1iaHR4?=
 =?utf-8?B?TkhWb1Q3OUNlSTlyKzJPbytXckRJelhMNTFyNXdmVFIra3Vjbm1pdW9ZdGF6?=
 =?utf-8?B?Nk8xSldWWWFtNGsvbHlMTk4rR1hQYno4ak90WFBHRWY0SG1VUUhuSUljUHpk?=
 =?utf-8?B?Zmt6bW84YmZMM0FTK05IUlFoa2RXZTUyRmIyYUx5RStZVEI2NXBVcjhNMGo4?=
 =?utf-8?B?V2xTd211aVZESzZhdGJiQmx2clVMbTN4T0o0Y21oa3AxQXVQRlhuem1TNXdo?=
 =?utf-8?B?MzFxZ01rUUdBMEFmbGtyTVFMK05rcnh2UmVHNExFV0ZRZ2hQSWJmZVBSb2cy?=
 =?utf-8?B?eTA0TFgvcUN4eVNmSUhvb3FlcmZXblVTYXBwWDE3SnU0QngxazJGWG9GbVFR?=
 =?utf-8?B?MVN1UUtZU2hDK1ArZjM1cnorS2lYODZySHJ6bEI2VXZ2ck5JNDhmQ1lKZEN6?=
 =?utf-8?B?anhCckFIemVucjdZaWx2WUgwbzJvQ1NuVkFIMXR3MG9rdy84S0ZibjZycXo3?=
 =?utf-8?B?cFRuaVZsazRHaWZvVmlQaUo5V2VlWVd1WDRpZUpqd3hsQVBRelFIRUFXN0t1?=
 =?utf-8?B?VXlBd25GamVVM3R4R0o3U29CQnJ4NVF0T1I4NFgxNzBaOWVrc2RIKzZvWEly?=
 =?utf-8?B?amtId28xZTZ0c2hUMVMreHB0dU04VzQzb3ZnMVZCR1YzMTR3anFpMmt6eDcz?=
 =?utf-8?B?WWZhY2diNjZzYUtUblRRbXRkNE5KTk4yaFM5eTBKV255bGFSYWc2dUtKMVZs?=
 =?utf-8?B?WmZCRHNtamFSODZUeVpqTUkrZlRtdmM1MUtndXNDTHEvdHBKd1lvVm1kUHk2?=
 =?utf-8?B?YUcrZm42NEhHS0M5ak1JQ21aZTdlZzFnSkN4OTZtd2tlMkIrRUNRVzh4S2Zl?=
 =?utf-8?B?YlZuRk1scldZYjg4MFJXM3FXbUtEbmlmaWdDWldzRjhxekJMN3FZQVowSFVi?=
 =?utf-8?B?ZTc1QUZtT0lTL1dOdWZyMGppMHFqZU9hM29uUkFORkxwTE9ENUNUM1IrcHZY?=
 =?utf-8?B?YW9zRzB4Y1JBemVjMGJVek9BUWZ3MGFXNHVQVE9jdnFIOS9XN3dIK3dsM0VB?=
 =?utf-8?B?OUVrbkR5azNkVDhqbC93WlVMd3pRUWltL1FVMlhYUXlaUkFKTDJwVGhIOUg0?=
 =?utf-8?B?V1dQaG10ZGZmRXp1RWVFSjFDNHJlVTZhTGszVjlpL01UalVMbjdCMlM0YzlB?=
 =?utf-8?B?T1E2elNrTkUxbVd5TjFkS0E0eWtuVWxvQk0yQ2NicFlmTEhadVFyb2t6dGI0?=
 =?utf-8?B?VHl5T3hyNUFVeHkxQis5M242ZUNkbUtiNTNuU3hvWlk2anhVcUlJcG15VkdF?=
 =?utf-8?B?VUxjTWFzeUdqQ3gvSkxKblRRSmpzcmpWMGM0YTFObXhGaGRpM3o2cnJ3UXBl?=
 =?utf-8?B?K2x0UXUyU2Uxcnk1SmFDZm1PVjJVVS93NEMxOUg1NUhrcUpUVW9IR1UxZDAr?=
 =?utf-8?B?U0x4eVdSTFNBeC9BRmRPNzMxVWN3Vyt2MVJYUkxFNFArRkU4TU1ZTGhIUlAr?=
 =?utf-8?B?RTg5OWdtb1JWK1AydWlwdmFXOStkaWRMa09KVXhmQzNodmpkckhrRkxEV3Bz?=
 =?utf-8?B?UERGZ3VsZXluNk1BdGg5aEtlSlEyNXMvM1hLQ2xOeDRQS2l0SFQ3Z0hxbzh1?=
 =?utf-8?B?N1hwQUUyeGo0YStTbVV2ZjZzSWo0cFBBS2JETHFVUTJMYlZLa2VPa0l4bXJs?=
 =?utf-8?B?TGtMWjg2SlRlVVgxRFN2REc2NnZPV0hkbkY4b1hnWmZjNWs5amo3emgzZXBy?=
 =?utf-8?B?NDJlYkZTQmQvNjNQcHYvUlhITCt1NGxLaXk0QXQ4N04yc0VBdlc1dz09?=
X-Exchange-RoutingPolicyChecked: DDMz5bxOE4Fba0dKwc1wi4OYe20dOaZdKiZ83F3f6JoSFWoJfVaSnUMTvkVcjGlYu59s0r2CdveMIFugCzIQ9iS1TRfVycPTicucRdgJ7iNUW8DeHkHwQ2zw80p4Szk1z8Ti8paU8dvzEceJcAOrkAoaz+p+zQnmrMtjbUd+oafZgwLo+iwP+XjhHrUSnGkuLsKyaSjtPlUEpnxQ6iV/dyOQjqASQJ08DXQRvlcZUELWumrvZHePq5c2qBBlBuu8FbGdnwRf8UMPx1OPFOvSEedtcY7VYUVuBE/CdBrygrnprdUZQ6tPxsiktgMrEiygtTbyAQ+x5MTflyZhp9IM/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b99000f-8913-4136-b9c4-08de7ff6c223
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 05:18:13.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0S9u1wMnjCFLD6ppERwD07vJjM7KeEwr7bnnSTVinZ8eYId+gr5LL+p6FXBP63he5gHAyRHOUNuaVWz7Dl4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

Hi Anoop

Fix Title: drm/xe/xe_sysctrl in all patches

On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> This patch series introduces System Controller (sysctrl) component for Intel Xe3p
> dGPU platforms.
> 
> This component provides the foundational infrastructure for communication
> with the System Controller firmware using MKHI protocol over a mailbox interface.

Add a brief about what System controller is.
Use either MKHI or SCHI. Not a mix of both

Maybe add a link to the usage patch series.

Thanks
Riana

> 
> Key features introduced:
> - Detection and initialization of System Controller interface on Xe3p dGPU platforms
> - Mailbox communication with System Controller firmware
> - Fragmented message transfer for large command payloads
> 
> This implementation establishes the base for future System Controller feature
> enablement and firmware command handling.
> ---
> v2: (Umesh)
> - Fix commit message to 75 chars per line
> - Address CI.Hooks and checkpatch warnings
> - Add sc_to_xe() helper for cleaner conversions
> - Alphabetical order for headers
> - Simplify write/read frame logic using memcpy
> - Drop redundant frame length checks
> - Use xe_mmio_rmw32() for register updates
> - Align FIELD_PREP macros
> - Improve error handling and timeout messages
> - Handle phase_bit revert on write-frame failure
> - Update rdata_len on partial receive before return
> - Remove unnecessary headers
> 
> v3: (Matt, Riana, Umesh)
> - Split patch into logical series
> - Rename SC_* macros to SYSCTRL_* for consistency
> - Move MKHI_* defines to .c file
> - Pass xe directly to helpers
> - Place devm_add_action_or_reset() after set_sysctrl_region()
> - Add kernel-doc for xe_sysctrl_mailbox_init()
> - Add short documentation for System Controller in xe_sysctrl.c
> - Avoid hardcoded sizes
> - Move structs to _types.h
> 
> v4: (Matt, Mike)
> - Code style improvements
> - Add domain-specific MMIO accessor
> - Change phase_bit to bool type
> - Add input validation and buffer overflow protection
> 
> v5: (Umesh, Riana)
> - Reset phase bit to 0 on error conditions
> - Refactor mailbox receive path
> - Updated xe_err messages for consistency
> 
> v6: (Matt)
> - Move protocol constants from xe_sysctrl_regs.h to xe_sysctrl_mailbox_types.h
> - Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
> 
> v7:
> - Fix for CI failure
> 
> v8: (Matt, Michal, Shuicheng)
> - Reordered patches for logical flow
> - Moved ABI definitions to dedicated header
> - Static functions renamed with short prefix
> - Fixed include order
> - Added VF check
> - Converted runtime checks to assertions
> - Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
> - Added frame length validation and command overflow protection
> - Use REG_FIELD_PREP for hardware registers
> - Changed error format to %pe
> - Removed unnecessary NULL checks and explicit zeros
> - Fixed kernel-doc syntax
> - Added sc_to_xe() helper
> 
> v9: (Matt, Umesh, Badal)
> - Extended commit message to explain System Controller and purpose of
>    `has_sysctrl` flag
> - Normalized hexadecimal literal casing
> - Renamed MKHI to SCHI (System Controller Host Interface)
> - Fixed kernel-doc syntax
> ---
> 
> Anoop Vijay (6):
>    drm/xe/sysctrl: Add System Controller types and device integration
>    drm/xe/sysctrl: Add System Controller register definitions
>    drm/xe/sysctrl: Add mailbox communication headers
>    drm/xe/sysctrl: Add System Controller initialization
>    drm/xe/sysctrl: Add mailbox communication implementation
>    drm/xe/pci: Enable System Controller for CRI platform
> 
>   drivers/gpu/drm/xe/Makefile                   |   2 +
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  31 ++
>   drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
>   drivers/gpu/drm/xe/xe_device.c                |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>   drivers/gpu/drm/xe/xe_pci.c                   |   2 +
>   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c               |  84 ++++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  21 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 364 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  35 ++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
>   13 files changed, 650 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> 

