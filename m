Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3690BC982D2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 08:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58DD10EB3C;
	Thu, 17 Sep 2026 08:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6v10WvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1C610E482;
 Thu, 17 Sep 2026 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789632639; x=1821168639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O97qrLzwWHCNub1Ko28slTdDVK7cZ4R8MydgfIoKqis=;
 b=L6v10WvSlRsEf5wx4YL5a4o+ojW7EOpcelDIilEYAZjkHllMzkavG71h
 pXHPe4EG+68s75BVe255GFf5ASnXfiTKJddb/HDLxOv0O6NSrX1smul/O
 jTGCrg5ekuSZ3PkEZ//SNWs8HuwpmJhhdEwgh3f2tAIaaBJM9y+ZneyG/
 WZJMibClTxPrxw4y54pOPm5vwENZGAJ5SbLb3pQtuUUQWjwVTbDIn8kF+
 cF0A4wL4rz/BGbGq+BuiwHTgykJQ3u6DqA7XFPDoglwwoUA/8hXW1Hbkv
 Pzs2aOYj511Q9mEknKzBFsL32oX8zrJsykGr+JUq2UXFvRZAyOzbfHcXx Q==;
X-CSE-ConnectionGUID: RREeSSbJT1qpUpNTJjG3jA==
X-CSE-MsgGUID: G2shrcGmQdqNTtrYfnnAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="536928"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="536928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 01:10:38 -0700
X-CSE-ConnectionGUID: eEyY8ea9TLuKrYFlbEJIWg==
X-CSE-MsgGUID: 3mzmfQl1SKiXjoDdNvy/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269362486"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 01:10:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 01:10:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 01:10:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 01:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxVpNFEY7QCHpGU7QyryJwPS6hLPl81HObiaYR+NR671EEE1P0IrycyamhUxg+S0TSZU4sxaxNhglOHBHgwe6eaNAreE6cK8/pwYL9VwmH2xUIk9loo5M5gL9cnWoc2lHPIMNX6jk9IwDx6mhgTG/M4KBnL5pydUMGZGvyhGLEK847gHq7HrxlV6Vv6EYbagZcmcbzJOIzDbZsbCKfrCwwmsYf+zY0QjDHg4YeL+S9WT2D2N1unx/POa8rXrSpENAdjeb8OSmF0BZ/5HAWRiMk4FwiJVQssxxrBzJrD/c6P9PncsTqB3kk8D7u3TvmPka41EHZGJ/x7RbRfBJq73Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOESBG6S6V1gXT3k52CND6ptiSQTdxcKBwo7lLrJtWc=;
 b=AWzCpqNKsZgiJUqGmKZmQF2PKRzSiEmOmKSKloiMAEVdvJrtkksSoLM09pydHRxFNewVHeU/S6JpCxs7dEEGX1l0v0LS7PWIcPCHzonHRfCbxFpXKo211UuvBeBaBadubT7pabR+K1vBUQJdSyx3/K2kG80qwas8E53j8TpsgCMA6x/fiH63OTYHRPlsRbHuQSAlnmN/p3g/1CeNzk/xHDdJjjJ+plT2pi8kJRm5PLFa9r07wZ3ZWmYXe/UyxK+cbssUYFFnfc52qD/NJCzAMBp0yGMNI/Pgyvd8f5xtwCpQGYhn46+TNwi65GJ1E4P3DMUpHe2GO0er7v0ZKv7ZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 08:10:35 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 08:10:35 +0000
Message-ID: <852797b6-a259-4e37-903d-ec927e9f57b4@intel.com>
Date: Thu, 17 Sep 2026 13:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/cx0_phy: Fix ARL-S host bridge detection
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
References: <20260916152928.185110-1-dnyaneshwar.bhadane@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260916152928.185110-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0283.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2222a91f-d5ae-4f7e-6dde-08df1493268e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: v6QCQVUb/ceJft+Oyg/X+abe3yuKOA7f6HLHODSxohAbsdtKRL1zYZ1AsLZsf3So3D39rG5C36Weoz2LyMIRIb0dwM5fTm4nMBljzSIIW+/UQLE+N4bzJfjzw91ZV+E5vuNDaWiCFIR/dirjoxrOoo0dMe4IH0WtCAWn/mbbiV5nQe9Ufwlu49saRKoiWcexDM14C7t1HPwc0mbaaSI9HigbwNCjhjzmXQEwdG/bxDlLkbB87//Bi+s2ZRLZfwX6Rzqs95RbV8ek6aAIGwlVyBze4Y+fRnD9kVMfXRamdmyWZk8FVHIxisXGyTn62pugXjrxDHC0E7TZcCYXsGWBy+eiAt1V5w2RbAlwtxhr9ZloCZDOsdJeB77fmOFNjm6DK4Ojo6eokDQ2ok7p4riOKGmMj1lScfDUR9ZZp0o5M7ysiMMhwDYxuOOBo2H+pOuBagXJw9RjBu0huwErhBKy054F4EmuXaYQQBiEBfDshWLuWNlk28/h+59nYk+3UB0/yteAhTVbMbfAxmt43NZQ/ZqJsWrSbeg1cuzrAJNMkGq4RqZb4aQNT90wUl2yg/oGetx6U60FyiDGZkpjmLcmiuERQPxNmoCvPSXoN6yvvdBot2d/MLZb/Tk5e/BZ/haMTgaBLmgPPXdRUURiT8awfjSdqSJiWiuxDsouWV1dTCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0MyYXZzS1VpdlpSdmorVWFJRUs5VmduOGxRRWhkcXdWdFNDZGZ2UkdCRlUx?=
 =?utf-8?B?RnMzWFFHakdtYnBDcXJEVTNZU205L1N2MjMwSHF4N09ySWtsOXJGNVpMc2Fj?=
 =?utf-8?B?N3hOY2JuaFZuSDAzZS9GQmZ5Nkh3UzNOcVR4Qlo1L2tKVythNlNBaE9FK3FP?=
 =?utf-8?B?dVFDeE5jaHRLUnRnZFZZa0ZMeE84WEUwb2U0UUd5V25QVWFsaExhVENqMDhz?=
 =?utf-8?B?RXZXU2FVdG41d2RFekhJd0JqTDhYZi9rVmN1NEZGTjJBOXhZMk5Zc1pKTG1a?=
 =?utf-8?B?dmcydXltZXNBUEt2UlpjdFMvbkRVeUVPNklDcWprWnY5RittcStoR1ZzcjE1?=
 =?utf-8?B?ZnBOTjFxa0h3ei9uN0sydStSNmVhZlArZXBvc2dTS3RnWGFEQXNtM0diYS8y?=
 =?utf-8?B?QzhYVml4M29aMmwyZjNqVWYzQlpmSlRrTlcvMDY3TmdUOFlNKzd3ZW5XWXBK?=
 =?utf-8?B?MXJVMnYyazMyYjZGTnR4YmRLOUV3MG0vczhCck5Wc3M2dHVpbnUxNFF6T2dQ?=
 =?utf-8?B?b2R2a0J1Q2xIcXpTTEpWVXJYWHJCRTB2SzZXU1pGTmt4S253UktGWllUdnBQ?=
 =?utf-8?B?YkNXN3pRVnlOUXhNM0NOc1lqREJnWU1zMmVYK2VqeWFwWGJEZjR4NEJENXoy?=
 =?utf-8?B?aVQ0TFlEMjE0ODlQM2RrdGQ1SEpscWJPSzNjTzlxMlRjUVh5b3Q3bTYzVmta?=
 =?utf-8?B?ejFaQmFUQXduN2loVE5tMWNPanMrOXVueGx3OW1zdmR1N0tBQ05IZllqS2ZL?=
 =?utf-8?B?SEZjQTI5elVUVFhsWldaS2hyN1BUbFNtS01YTU5ScFNuR1hXSmpoaWVpd0sw?=
 =?utf-8?B?OUFrZFJnMys3dm0wYzBlM0x2dFozcHdOeVlxWFFmajB2dm91OXJBdVA5ck9F?=
 =?utf-8?B?aFE5ak9OSkF5aCt1b2U4RStDQUVnN09kc1d1RHI0Ujh2NndLY3U4Y0x4YXNj?=
 =?utf-8?B?V2VYK3I2dklzaVVIdVRkempEMDFZQ3d1UjFiaVREbTQ3K0FsQzl2KzhiSDY0?=
 =?utf-8?B?Q0hROUltdklUUW1sWWVxdFhJNWNYZGpNY3h0cWpNY0JEREQ5UWZNajE3QjJ0?=
 =?utf-8?B?R3JYSGZzVUtLUjJ1K1pmR1RoRGN3TWJQUFRCL0VHTURZY0RaRE9rOS9xR3dR?=
 =?utf-8?B?MmN1UXREWlZiVHhDcGV1cTlzTlVaVkhRZ2diTXNZYlJXYmNabk9EOTFiSndF?=
 =?utf-8?B?bFJHUnFoVkNvSXdzbHA5WlhEeFBHUFlmY0J5RUZmUm5USndFOW9TUVR4TGtI?=
 =?utf-8?B?OFN0NFBUTjAxdGdsOEZCaU9qL2pZdTVsaUFKd0x2RXVCQUFoR3RMQ0dyTXBp?=
 =?utf-8?B?byswT0hLaWdrSVl1aEhNMUh4RWZkUFhCTkVvc3ZrV25oL2JOQnQ2RUNWL2ph?=
 =?utf-8?B?UVIwRlN5dkpQNlhueUdUeVhFMUtmTUFuSVU0aW8xMCszN1o4WGpVanE3amcv?=
 =?utf-8?B?WmtZV3RXTUlSdjVZM2RqcW5BcXpyaWZaN3dPMWdFbkdOOVE3eS9OT0JVTHRC?=
 =?utf-8?B?L1FNZUZhSmk0MVB2Z2JjUktRMkxrcUtjNTdaTE1Dcm1TQXBhTnNNOHNoM2FX?=
 =?utf-8?B?c3VacExWRGNPM0p0cXVwelBaT2FPR0ptRGNrVzJUUE50R0lRcWdJWHd0SC9T?=
 =?utf-8?B?N0xjYi9SR3hQU0g2VFROM2xTV0lmdm5PR3A2NkFwVEhlNzBQWkxFQjVzNk51?=
 =?utf-8?B?eWxlM3JSWGcyUTUyMVF1SndXQ0tib3UzNzZjSjRXL1piTmdHaWhqTyt5ckw3?=
 =?utf-8?B?L2kvV2laUEoyVW9OZzFnQnAweFZHZUhNWUVPTjlUbGdneDZGNFpFa05vNUtN?=
 =?utf-8?B?c2F5eE85SEtibUdzaDdzam1nUjhXT3B1QmpiYmt5bUhIVUFxUlpvSkR1S0FT?=
 =?utf-8?B?ME9IREl6RDFSNENYc0s4MUlEYklmWVVJMHJuVXA5NHhBS1loQUZCTktkQWN5?=
 =?utf-8?B?MEEzNmZwWnVyemliZzVCc3VuQzNZdnNOcFBnMGhWcGdGT3ErT1JDZnc5V3pE?=
 =?utf-8?B?M0JIS1Z1NlJPd0ZwcnVBWFM4UjNQbFk0ZDB6NVhEYkVmTEI5bEExS3hkcnhz?=
 =?utf-8?B?VWNmL2UzU3NvQWxheE0yR1RFQUNJSURBQm4vZ0lMUTh2MWxvNEFqWDBUNEp0?=
 =?utf-8?B?T2pFMC9YUGxCYW85bXB0cGFjWnNrSDlOcHRSRnQrbGtENTA3eDJvS0hBVlRI?=
 =?utf-8?B?bHNVVzFnVkpVT1haa1N0M1hXV1lKblZ5dUF6eWpvUDI2dTdSME8xNGNBMkln?=
 =?utf-8?B?Y3A0MTFkb0hVeUZVWGRiNG9JSVBEaU9YbkZPTWVIb0NoR1RocTE0QnFZSWVm?=
 =?utf-8?B?SDFwL1VERkd6T09pVjF5WWRkSmNTQW1xTVB3aGxEZGdFbHpBWjk3cmIrdkNX?=
 =?utf-8?Q?eG91OBFzQbTXoNuE=3D?=
X-Exchange-RoutingPolicyChecked: TXHIbCViLfkvoZ8XrfP8r+AtUCj2i4Z+7e9bB5AqPreTCJzgxjcVo0QQY0OAQxo0/BzqV+iBSFuPj2SR2+uGNc/e5BJirDeAUCtn2sABKLRhAxMeam1sUGE0cY7YEzWYzROuB8fHCk46OtnRQd2tuKKUlPAOBcpBPZp40eVy6FAvk01Bii1iQ0voi1x8yS3i0ODSIWQ85Mc+u7c+cKSBfFzZo5XuiHcsvrDNasHUVCzdMrIFlTW1x7XepL3hZgFc+zNMqBuv8DGGgpucEVXpeX5Z9++OsVGgkVpG503Jwm7RjWqR0wPeFyQ4HW5Y38bwgoREaDSNOSYFmGSxaJwBiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2222a91f-d5ae-4f7e-6dde-08df1493268e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:10:35.3340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llxnh53ZoSly5FDhyJc7xY7zJpQPy0eC+Js8QQSqUG6NaEmvUEeqqqhRZxIUYBhu7isNiP2r4nGZhtqpcplp3zk86CJeJoJ2lGJKbTXlpIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
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



On 9/16/2026 8:59 PM, Dnyaneshwar Bhadane wrote:
> is_arrowlake_s_by_host_bridge() re-assigned pdev in the while()
> exited (that's the loop's exit condition). This made
> condition itself, so pdev was always NULL by the time the loop
> "return pdev && ..." always false, so an Arrow Lake S host bridge
> was never detected and intel_c20_hdmi_tmds_tx_cgf_1() always used
> the wrong tx_misc value for that platform.
> 
> Check the ID as each host bridge is enumerated instead of after the
> loop, and drop the reference pci_get_class() took on the matching
> device before returning.
> 

The commit message is quite obfuscated. Also needs a cc stable.

Other than that, LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Fixes: 3630a47b700e ("drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value")
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cx0_phy.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index dbebd7210848..de450ebf541f 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2342,12 +2342,14 @@ static void intel_c10pll_dump_hw_state(struct drm_printer *p,
>   static bool is_arrowlake_s_by_host_bridge(void)
>   {
>   	struct pci_dev *pdev = NULL;
> -	u16 host_bridge_pci_dev_id;
> -
> -	while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev)))
> -		host_bridge_pci_dev_id = pdev->device;
> +	while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev))) {
> +		if (IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(pdev->device)) {
> +			pci_dev_put(pdev);
> +			return true;
> +		}
> +	}
>   
> -	return pdev && IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(host_bridge_pci_dev_id);
> +	return false;
>   }
>   
>   static u16 intel_c20_hdmi_tmds_tx_cgf_1(struct intel_display *display)

