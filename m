Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA4CCA46C
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB571127EA;
	Fri, 16 Oct 2026 13:00:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD671127EA;
 Fri, 16 Oct 2026 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792155645; x=1823691645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/qRkCa9PIZAKu/7ac0Md1irBI/XfO7vVk9OC/vZQLJw=;
 b=fzUn9KrJd1LsxbFOxHvVsLBkpfsRkoY5HO5OhvpVXfLJ3LhSNK9NjchU
 mjFTinUVuRLxVZwynZ/FLzsYKJMlrSOICmO3R1wMZcAiAlmEXbjYzsGsc
 uHUqvZDFjaewy0zCyFT51ChzhPFWOXfhnwF5FLMLGKCRbC75RI/d32ksS
 NbKwmCy0GHoIhRm8jIMo+sJJHsneom8O1l3ZBxVj6OPZS+rxVYJez185U
 JrO59yZDjiIRkYv/4KTyUc9rXa0Lv3dhdXS0rmxsoANi7y2AmJ7bKwdy0
 MuDJp6WoZJkFb0wS9lQimEWDSncQ4dc9sVIA2VAT5+CNGdtRkN3MWPp+b g==;
X-CSE-ConnectionGUID: OA2jZkOLSbmHqaxEDZc4lg==
X-CSE-MsgGUID: hBv5jGt4R4aFPR73vyBIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="949581"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="949581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:00:44 -0700
X-CSE-ConnectionGUID: fA/xfCIFR2KtvjNW96tv8w==
X-CSE-MsgGUID: vrReeA+fQwaftv1uURD65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2320428"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:00:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:00:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 06:00:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0kJvCf7L1v+sXshmyw5oqmgOoEnIdHaOMevdGFAM9R5h23MpckcqxXmuVE0ehYAyMJXdnUZ9EP9vIG/T3aK4QwXOTLnSrkXZhjs5dB/FVmlAxqZ7Q60UNNi9IcKbtmxgVLg+Brp6UgN1SZ8e46Zy98Xo0Tcq27xyrqffSxSacmTNLFZ53DLkHyk+5GkISlqcxwNxmJCheWiLnFhxtctysV60Yzwwl60CJuwws/ai5zpJcryCR4xRQnpU1iFc1ZXkLlE6hf0DYExpoY9FvYSaNay501VsAWGLmloKsGOKCjImwn3Wsb2NOibn7cs3CdZLV8yOFPG+Vwsvz3JecdBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hUdkCHuFOYBizeGWmwRpZ1K0ndmAZnSO+FqLPz5nTI=;
 b=WWJLbk7TNsCHIfU42Ax/KC91SP92RNkXxR8SPTW+gYRS0s6+hUHi8SitlL0oYoFPaj0HsPwTXcu8o2nUzBr0qZ1U0piLzzj+cVCBzoN3pzSda8B5FbL1Tzr54nu8poEkjmhMoZZi4lrFod/TpG2u22rEqDsm6XRd4Z4KDLr8bTtJMWQf1TCD51OOcvQ7ixJ6ruKjVyk1nuBFf8H4jgWxyGdFZhdCF5B9xJFnCjqV+V2mA9fgHLYenoaxsJqF/H8u7GAqbUxHlHsS+thHoSQ4qC9R2Nk1u0aD4XBUIgy//CpYWY0xvC6d0AAXSQg+2Zehr5iQHoxykD8b+Q4SHgKMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SA3PR11MB569431.namprd11.prod.outlook.com (2603:10b6:806:53f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 13:00:40 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%6]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 13:00:40 +0000
Message-ID: <590ce042-4bee-4671-9f22-de2178c32cf3@intel.com>
Date: Fri, 16 Oct 2026 18:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/display: avoid logging DC3CO transitions
To: Luca Coelho <luca@coelho.fi>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <imre.deak@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-5-dibin.moolakadan.subrahmanian@intel.com>
 <9eff5ff68bfbc955a5bb7be90296939428cd5ecf.camel@coelho.fi>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <9eff5ff68bfbc955a5bb7be90296939428cd5ecf.camel@coelho.fi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SA3PR11MB569431:EE_
X-MS-Office365-Filtering-Correlation-Id: f29d5e23-a83c-4a4d-9ebe-08df2b857a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3cMOOjkrWVfM57fxiOp72qjAilOs3LwwYUKDqRmK2G0GdfOUTfBU3gWi17yvCZ0OM8sFD0V1ZTqJ0LXAlS/sbAdceqKr6yfItntD8hIWKHK1ogz4dyIBND1QyYFvFNqun3+mzhsqa/aaln3kZJ/gHk6wgxV96CdY+Fm9aELIxJnYqD++7dHS+Vr7Iv9vtkaeUQzUHAOge8nOgtukaEaOxmvqwGuSdj8/T3Rn2xqn5IRSRBVYCeYQYP8zkxPXhYXp0Uu4ttCQCJb9tvZ3FnM7pbskovzOG3g3wB6UWQzIUKwSoTaXrtE++UAkXRAJX9aujcuP6CTHfPIMLLhhWIiQTiVYHUpHthjsfPGcDJWWMlcxBXp6FDRLMIT5sgRanguhsb0sloKBEYDT/b+ngzTTTl3BlIMwYBMvWZYyOuWBFH4oI91XGxC2ElrAGO6W7TJGUtHZPd0j4sgE1e2NBR9ly4a08RWoRulqKSHv1LkAwKkyRisfrONEp1zCSD53T3X/7Sw4kxvzg0n12zflL4DxdJyhgYQR10EwpPe2hhwN4RB/nmxVIsWPxkuwruIqMS+HLFgeoCQsoigeE4gGm1SsHORP5h6/ewG0/FYPBd0PzTiNEkKt7ZZBzyjXfFEI85AhBm4Ns0rvBbpXUD0nuDBCEz9yhYfcKdHEjYgV2Cw3jAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhEeGRwdm54TUZrb3VVOC90cVJJV29tdHl6d21iQjQydGZxcUVwemxXWGEr?=
 =?utf-8?B?UklHeG8wK0RGMFRQVFU1WkNTT0hrbzJuZDBGYXB1ZVMrdFlzMEZxRXZYQng1?=
 =?utf-8?B?Y0FZcmV5cjNCcDRhc1NVbWFrMWZMbWdOSkxUNTkyNExsRXI2NXgvOENUbmtG?=
 =?utf-8?B?WDF1VHJSaFRVWU1yQkdmcEJBcmNRckpyY2NRbVBZU0tZNGtUMWpveGdiYWMr?=
 =?utf-8?B?U0V0VXdObkNRU2MycFJDS3pFOWpNcmFqcjhaamRSOGxYR3RteTZmd1p2SDZl?=
 =?utf-8?B?ektPZkFrNXlqR2xnQ1ZzTENiVVpaaTZEWGh3WmUwYzhXUnUxZjZtS3B4bFJx?=
 =?utf-8?B?UGxPdUIwaUJ1dnN5RlAwUFY2U2EzdEw4cFErZVFSb0MzRjBKbFlsdVd1Q1lR?=
 =?utf-8?B?WGFPNXA3c3kzVkZKakRIWGxwMHhLZkorS1BFdDhIcC9hQTl6TGJ2YjJrc3Zm?=
 =?utf-8?B?QVpNNFFVWTJMNlNlWDlVYm9CYnNGRHY0TUluMEtic0kyQzRnZFBoc1NTRWxm?=
 =?utf-8?B?L202blpxQjVUclllLzJHOVRxMkxUSlpwa0tMOHhhdnBmL3ZFOGVCcDBEejdt?=
 =?utf-8?B?UDNTNVhxdGRKREVrUUxzMjlDdldlKy9RSG5HOHprSVRnQ1M5ckNMWWRVMUdl?=
 =?utf-8?B?RENwdHJJVnJlZ25VbzhqRFA2RHRjQ1hjTWcvNGdCUDM2eVJzRTlCSlU3TWNR?=
 =?utf-8?B?K1BFc0d0OXhjWjZTSGJKYnpSSkdDOVZhZnNYNzZoL0NEOEQweHNPeXkvNU5B?=
 =?utf-8?B?SGYvVG5VTFNidGV4U1RwWnk5KzhrZGtXVk96L1dyUHZGcHN1MlFzKytJZFZ6?=
 =?utf-8?B?bzRGWkdIMkl3WTIvTDdsbzlhc2lsUUV6S1NmNzUxb3ZpMGVIOEk5YmE5UmY5?=
 =?utf-8?B?N3VlUW9yYTFMdmg0dW02dmRQak8ydUFNMVVTak9naDVsR0hqVEc5NUY2RmN5?=
 =?utf-8?B?QWxYd1RaMlBPOGxaZS9FU0hGVko4QlVqNk9XZWRXdnkrUHo2QmlwVGp6ZkZH?=
 =?utf-8?B?ekp0a09RWUVZTXA2R2dibmtlS0ZhTU53bndZZm5hU2VnczFKNkc5enR2VlVF?=
 =?utf-8?B?TWJBd2dsRWlHQmxWTDNEV25BVU1MYlNZa25xd2RpUWlyMTJqVHlXV1JzTG1K?=
 =?utf-8?B?aEZURWw3UkFhMUhYQVllVVBTMGxGamVWNlhtY0pBQzhDQXNEOWJEcWVlUUp0?=
 =?utf-8?B?QmJvUms1ZlNDcURsc3hYcHhya1FncFpEOHlXUkkvb3hlaGNXTm83clc4eEVk?=
 =?utf-8?B?UktYVmVVNDIySzdIMjd0TjZjTjJEeEFmTDNlQ0dQS3ZoallpOUNveHRid3dt?=
 =?utf-8?B?Yi8xeldzKzZTOFRRZ1ArSmdmZkdEWWdvTVRnNmtURkxDSGVKWkhVWUdMUU5r?=
 =?utf-8?B?Ync1S1lhVGM0Y1kvQjRlcFZFdEsvZ1E3elk1RjNOalllLy9hMVlYNE9hN3I2?=
 =?utf-8?B?NkcrQzEyY1lwbGdsTVpHeW52N09pYXBrSUIvbjZYNXJoYXJuZSsrb2lzbHhi?=
 =?utf-8?B?ODlQOWJkWFBHOHpYUzhEQ3FTOUNVRm1zNno5N3ZiM3NULzJYZHd3b09rQjA0?=
 =?utf-8?B?UE9ERGpDYjRiVk4rVTVZbmlGalNES2JPL3BmSTV1bUdBaE5yK2pSYU9ONkRw?=
 =?utf-8?B?TGw4TmNEczU5bmhjaVJ4QnV3Q1d1REhjaENjeUtEejJXRFQ4T25PNlA2ODA3?=
 =?utf-8?B?STRWVlFRSlVBM1BkNEE2UUgyYmFUTkZxVUZTR01MTXh5TC84cHNVdWJKaHkv?=
 =?utf-8?B?K3hFVytSZFk3Wld2QUNZUlVRaitnS1k4UndKZU5HVGYvZ1lkUkY0L0ZUZTBu?=
 =?utf-8?B?SkVYWmdvZVFZNGZITVBZTXpYc2FBc21ra2grL2Zvcm0vaXRwKzJhMEpmOUhG?=
 =?utf-8?B?c0xFMit6MVFOVmswMHZUSm85bGZZWU45bytFblpReWVvM1Y0T1lNNlFBQStw?=
 =?utf-8?B?L0NvT0taUnRLc3MzeFA5T0Y1ajI5SVhqVkpGa2I0S2J1L1JLUkVrQWd2c2xa?=
 =?utf-8?B?M1NvaU8yMWd5Qzc0dllsdnI3bWYzTndjbEhiSCtzSkU2YUlhUDhSd1RhWlZ6?=
 =?utf-8?B?V0hIS1k5cEVZRkp6WGRNdk5hWFhRUXpiWUM4MUhhcmZmcU5KMktjUG5OeVIw?=
 =?utf-8?B?c05jMEhvREpHWHZsbUhTNHVoeHFpeFJuaExBUHJVdUV4MkZsZG1SQVVNWE5K?=
 =?utf-8?B?UWdmcEtOekpaSHMvcVFSQ1oreUhWRC9ScGFBQVJwQUZZK0habFF4RzhWa28r?=
 =?utf-8?B?OGM3R1FzV21MRE9GS0VmOEM3RFN2SmhaNS9zT3oreDVkMlZxcmpITDJpWVJU?=
 =?utf-8?B?QVE3MTZmVFV1NnRSbWN1UVNjZTJVc1IyejJjUngyeVRiczJqbW4vcTV5SGh4?=
 =?utf-8?Q?ns7gqfnGZTMOLhIa1XpEuibhVWVgtIwcS6m/d?=
X-Exchange-RoutingPolicyChecked: AefJpdN5NZDh5Jf49QmQ3I6CSdjM4V0Omv8CcC23CV4T/vCNOTUub5a6gyU06k80ci8G4w78m+DMPDyZDv+SPgxdwFs5WuF9kzXkHJB+WXYrxkBTEi5kgQ+Ig/Ho2ANit1Jegq05GUOHPazryI9h35zq6gT4ADGFnocpn8v8ayOM5kViMYmjxN3LSNOgjYPd2PPO17jWedBrrQQxL85aBb3uPo2c56Pk88UwEYmhuJY12lLj4U6dpq54IVo7hjibaUhNyAMiZKtfiZ75Z61rVkl61YUvlU7ZRP1rht2GpteXGWXeyHnlMh4Xh0/iEqPANVJRVMkSwxtCMPYQ7pnjtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f29d5e23-a83c-4a4d-9ebe-08df2b857a7c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:00:39.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNLuhEtuTrVyw9R3m2pn7t9r38LBApmKn/FI2OzN7+CtpKOiHxj0qKN27LyE+lp+XOy4LsV/cBYTg1kOYQ7Dni+3pUwR3vBVIG7Y7Vz0Pd4zRNOAjgaqKFzoMdSqWqVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB569431
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

On 10/16/2026 12:52 PM, Luca Coelho wrote:
> On Tue, 2026-10-13 at 21:41 +0530, Dibin Moolakadan Subrahmanian wrote:
>> DC3CO transitions can happen every frame.
>> Logging them floods the log and adds overhead to the flip path.
>>
>> Skip logs for transitions to or from DC3CO, while retaining logs for
>> other DC state changes. Log DC3CO trigger changes through
>> intel_display_power_dc3co_update().
>>
>> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
>>   .../drm/i915/display/intel_display_power_well.c    | 14 ++++++++++++--
>>   2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
>> index 1b60ce2dd00c..53afd791381e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <linux/iopoll.h>
>> +#include <linux/string_choices.h>
>>   #include <linux/string_helpers.h>
>>   
>>   #include <drm/drm_print.h>
>> @@ -419,6 +420,11 @@ void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger
>>   		return;
>>   
>>   	mutex_lock(&dc3co->lock);
>> +
>> +	if (dc3co->trigger != trigger)
>> +		drm_dbg_kms(display->drm, "DC3co allowed:%s trigger %#x -> %#x\n",
> s/DC3co/DC3O/ for consistency.
>
>
>> +			    str_yes_no(trigger), dc3co->trigger, trigger);
>> +
>>   	dc3co->trigger = trigger;
>>   	dc3co->allowed = !!trigger;
>>   	mutex_unlock(&dc3co->lock);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
>> index 233465a8306e..6d07643fc14f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
>> @@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
>>   
>>   	val = intel_de_read(display, DC_STATE_EN);
>>   	mask = gen9_dc_mask(display);
>> -	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
>> -		    val & mask, state);
>> +
>> +	/*
>> +	 * DC3co is entered and exited once per frame while PSR2 or panel
> s/DC3co/DC3CO/
>
>
>> +	 * replay is active, so logging both transitions floods the log. The
>> +	 * exit additionally happens from intel_display_power_get(DC_OFF) in
>> +	 * the atomic commit path, before the flip has been armed, where the
>> +	 * printk is a measurable part of the time budget. Skip both.
>> +	 */
>> +	if ((val & mask) != DC_STATE_EN_UPTO_DC3CO &&
>> +	    state != DC_STATE_EN_UPTO_DC3CO)
>> +		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
>> +			    val & mask, state);
>>   
>>   	/* Check if DMC is ignoring our DC state requests */
>>   	if ((val & mask) != power_domains->dc_state)
>
> What about this log:
>
> void intel_power_well_enable(struct intel_display *display, struct i915_power_well *power_well)
> {
> 	drm_dbg_kms(display->drm, "enabling %s\n", intel_power_well_name(power_well));
>
>
> ...and the "disabling %s" one? Claude tells me that they are in the
> same path you're trying to silence.

You're right, the power-well messages will still be present.

I kept them intentionally, as removing these generic messages would reduce visibility
into power-well transitions and affect debug ability beyond DC3CO.

DC3CO-specific trigger changes are still logged through
`intel_display_power_dc3co_update()`.


> --
> Cheers,
> Luca.
>                                                                                         

