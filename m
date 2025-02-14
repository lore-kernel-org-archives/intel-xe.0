Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEBBC021A0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 01:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A4710E13A;
	Fri, 14 Feb 2025 01:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UezrG/kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDA10E13A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 01:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739497090; x=1771033090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lIOX4VD4eb1giuqEGgtPX0losPoq9MamM6o8aABzV7s=;
 b=UezrG/kjgfv7Dm+PL1LS1WAvdbXzjzMlDBQHV83T3P8LADnBxkVz5/n9
 e/gHOLlVJU8i8wz8L1HJzhTq+wBcGVm4O/TjodhdawRf7bZSh1KHFP7u3
 91yONCKabYck9Nq13mOJN2K5stG15DYV70EjNB5Sde1yvNxbc/vv98e4d
 hzLPyapSykogoxX4e5sWd0VQlfYboPhvHUGu1jGUm9Z+Rne1BqDkCr+GL
 nyy9Qzmp2OlwWBIjcsHyzOBWzVp+zgY6HePaeK0ltAfsWAN8ZaEQuMrxm
 PH5BmvGqR2jFnHmGwjMw13Sm0AOfTzyde625+WVX6TkI3pAU3xt/gmvBm g==;
X-CSE-ConnectionGUID: IW5R3jN0QXe3mrzubrMOdw==
X-CSE-MsgGUID: bWpSL6x0QLmZo4Jcry/dmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51664112"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51664112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 17:38:10 -0800
X-CSE-ConnectionGUID: h2l/QrOSSm6LC9RSpRaxEA==
X-CSE-MsgGUID: QrUOrGIlSw22MKVqZxYPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117938536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 17:38:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 17:38:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 17:38:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 17:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjyUFlVTmtVMRbsIBLbpQIfKqQKT2Yn8dJ27J2Pa9Bt7ErM4anmU7wyaWM1lZ0Nj6XJV/OPl7KrXJLWFmU8Jpdcx38TddgD2E3Nlu3GADtEeAbDzv1CG15San/aoANLTpZvSfsGTPKQYGhsNvRaWuLG/BNZUhOBdIEmOildhLZZxGe9P6AT5oGgC8sy0y07p9z48OlbNhojBy+gfcjdcyqnsD+psKvBUVl1/gUojn9cugI5YRU9+UMP9YR1wj5WDPbqz6bhqbDSwnrknwFOVwRTB94yZA5aFAZWzETzf2Q+sYCMVb5Ubg8PezTAx9zIjLBlGorFb4+EAytm+rg8GiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMTBVT1YGBI5Zgec7MBb95uyHAAThZZbtcAYaIOHfVI=;
 b=khiKuSPMxDh2guRvfmS675+1iH5VuQtGnWyoDjY1Dkl69NSQyJgAbKdP166S002I8wiNdpnjBF2hG3z0oCSFksCPjJnVrQTtw+6nDgVLRhoXNh2CvW7TzFt7bz4UjgLVieLdnUYFALsuVBybSrTzWQQLG+2HfNUh4QgfGpwdz6eT9OZOfV3EULfY8bdatG4LRwC51ACtibV0DZL+F/ZOfxNfkgLdYp0mPCMKKAaQRt6MQQivkmnvJVeSny9GHIC3Rr5mij7x+ptuyOir0FFWtDHo3hsUKmCsv8Z8KmdWIn3jAUHFmQ/egpaD/Z4izy1MpMzUajPQTW6l3BR+PN4dXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 01:37:37 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 01:37:36 +0000
Message-ID: <0c223a7e-7078-4905-abde-1e2924352937@intel.com>
Date: Thu, 13 Feb 2025 17:37:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
 <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com> <Z6zlUOQkRtA5RI7X@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z6zlUOQkRtA5RI7X@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 243a5302-07a9-44a1-aaee-08dd4c98291f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnc0Z215ZmhzdTl5Sno3ZjF0RXRQdVJRT0szekZrNXBadjJiOFZDR2UrSGFj?=
 =?utf-8?B?aWk5YW56MjZMVmhsVXpheGwxcnZ6aDBOYnFkMWxVR3VsRWUrb2RWUVBtVDhY?=
 =?utf-8?B?SlNGSkp0b1pZVlJtYmp3SlVFd3FCcXoxK2tDSzJ2MjAyVzNCaTAxMThGSlhC?=
 =?utf-8?B?MVA0WUxFc2pIeWM5QVZRZmwrVEJwcER6WDNDMVFJN2FWMHJ3SzB0YTNHZ1FH?=
 =?utf-8?B?N2gxNDJzYURaNzF5b3hreCt1dU1mQ01qdnlYakpCQmd6dTVuYTdMOFlPamE3?=
 =?utf-8?B?c2NZQXQ2NTJsR0xnZDFJQ3BNblhJaUJEc0tkTno0aDdoVEJVM1BsYklpSXRV?=
 =?utf-8?B?QUJNa3kwUnBtZVV5NnBiWmlkT1k0TWZySmRKTjdVVUpJRThZb3V6WWFpYUVW?=
 =?utf-8?B?VDg3WG4rYWtFdTVoc3dwY1licHpmV1lRby9Kd1RNTlJOcW96M0V0VmRIS0tu?=
 =?utf-8?B?WGVLSkpTNUhNelEvREt5TXFJWWJNdDc5L1NkY29ONEdFMFk5Mk5lVnRnKzg5?=
 =?utf-8?B?UkVGeWR2SEk5eGZaL3hQamgvMzNaNU1oa04vTkRvQStncTZTVkZTQ3YwL2Z3?=
 =?utf-8?B?SjBnNHRJQmVJQUtlRFNiWlZMMnZtalJ6VHJnK2sxWmZMdDkzcTdpVm11YXlz?=
 =?utf-8?B?Qi9EdFNnNktGc1RPM3JvZXNBa1A2SUNmU1Q2ZDBlQlNuZ3Q1ZVM4Zjd4K3JO?=
 =?utf-8?B?Y0h1WmRlYUlvVnYvQmtJMlltbnNtS2IvNnh3amg1TnhVbXNSRzA1Z3diOTRX?=
 =?utf-8?B?b2JHVTFmWjd0ZEFtd2hEa0xQTWZQc0k0aW4zdDdWZEQ1ckxqcDI5ZjZaYTll?=
 =?utf-8?B?Z3FMa1A4NFZCWGNyaTArSE1uM2krL0daRGJ1N1ZIcFhQVTNBaGNmRnBxSzkx?=
 =?utf-8?B?ZURhbVliSHFQN2VMcmRLWGtQRDQvRGhYc1NCOXpzb1VkUFV2ZDNmb1hFUUN4?=
 =?utf-8?B?bDlqTlN1eUx4UGlNM0VnenZUZEM2SWFjOTQ0aWVrWU1yYXR4TU5XQWIyUEdT?=
 =?utf-8?B?TDZTR3RNelBtQzVjMEdoaUp6eGNuVFdZTy9hSXBYMXE4UE1DY3RSVEdqVk5p?=
 =?utf-8?B?ZmNFdCtaWWt3YU1vOGNabEp2THdLb3RyZjYxdlZnVlN5aDNURnI0bG5IcDE1?=
 =?utf-8?B?aWVuWmgzSW5vc2JnQWtzZHVvRVduRDV2MDlRL3NjZDAwc3RzY1RYZnJDa0Q2?=
 =?utf-8?B?a2N2RTdjNmFGZk1VR0NvQWNBSzd4dWsvZkhEU215eTNWNTdncWUzUC9XNVZv?=
 =?utf-8?B?L29FcWxKV3ppV29zYytwUjdtS2Z5WG9JSG5pSFRRZHR4Rlp0a0tqTStJWFFE?=
 =?utf-8?B?aUYya3lkanNSakV2V0hodTJrYzlBS3ovaXJwMThMbEpGdWtIemIrUGNmR1c5?=
 =?utf-8?B?N2JtTnpqeDAwNXRUNXdJQmFSNW9MNytKUDRIRUd5RTE2cnRQcTZvRDhjdXRy?=
 =?utf-8?B?SEU5enJXRVYzQjJQZkFWQ2ZmUld3WDEwUU0xbnc3aVNXaFJLWkhYQmhmMjhK?=
 =?utf-8?B?NVFqWXhYTXlwbnp3QVd5VlFjOHZCL2JkcEdDY2NOZUFMQWliTHdXSFlicnJs?=
 =?utf-8?B?RWwrV1FjeFg1VmRMcm9VMFUvTDJXb0s0NUUzMW1CTjRzMDgwclB2eGhWRlMw?=
 =?utf-8?B?dUt6T3lkYkpSODJXRTR1VFhkYTRsWnZWRkVQSW5NVCtqM000RVljTDZObXVr?=
 =?utf-8?B?eUw4SmptRFgrcUVnb0txTmRYSzk5YWYzUjNlaXFoYi9rNzIvejN0MlVmQk1w?=
 =?utf-8?B?RHJhcFhSVU1IQmZUZEFsYnZoWWpodHdWMGhObHJNOXZYT204OXo1YjJDSE5K?=
 =?utf-8?B?cEs5M2tTNXFpOXpIbDJGQmJXQ09ET2xvckh6TE5jZm5UbkMwT3FLeDc2cEFF?=
 =?utf-8?Q?PuT+KpGCpWYFR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEkvU010RDJNK3RtbFZaSUhYdk9jY0Z5eko5M212WDY3QlFTZzJPNEk5eXYx?=
 =?utf-8?B?WWZyWnJCTHlnYUEvVHpNTHVWSzdCN245RVhvcElhZzhJa2dVTkZ3VzF0QXZZ?=
 =?utf-8?B?R045Q1k2NzRjUHB2NDlPUWhIVi9yYW1uOTFabkcwUjdTOG9hNnQ3ZTNMS3V5?=
 =?utf-8?B?bHp4WHNuK1JncElKVlRZWVF4b1BZcWhzTUZkRzJHOVZnRVNSeTVUNkpPNEV3?=
 =?utf-8?B?cFpYWnJ5Q3RIeDN6d1BlZzk3Rk90aGVUYmdkd3dMazk4RkY5WWQvNVZKWDky?=
 =?utf-8?B?OUNyS0dVdEh4YzR2ZE1lTm05ZVdvTjZoRWRPT2U4d25RTGF5ZFNQMTNMbTQz?=
 =?utf-8?B?QSs1cjRWN0J0VHVhNytGNjhNemlidURGaEQ2aVhWUGk2SGJ0dzNoWC9CT0xS?=
 =?utf-8?B?RWVGTXlFRXRFSHYvRzNkQVJ2TU52VW9HeW5HTmFpZERTeUN2bjVtK1R5M09w?=
 =?utf-8?B?bW0rcXRDaUpqbzNyV3FiQ2FWdXgyMXNnUk5uczE5dE9GSVNhazJKS3hUMUxJ?=
 =?utf-8?B?d0d6K3I3VzltVkYwNUk5TGFEMVNnbFpxUzV4QlRCSUYzLzRuaCtQR1ZGWm55?=
 =?utf-8?B?cCtIZ1FJYlJDSnNEMGlVZDBxSmxPRjd2M3ZRTmZTR21ZM1ZmS2JlemxiYWhU?=
 =?utf-8?B?RFdIOHJDV0I5Y2g1KzVEbUk1YWFKQTBkNlQ1TURhWlJlNEw1MGtORSswR1FW?=
 =?utf-8?B?SlMvU2YyaDk1NXZLc0ZQUWFXK2orY0xnVDAvd0tyeVRJNFNuNS9hckFmRFdG?=
 =?utf-8?B?bDRLa05HUWVESDZ6aU5pQ2hGd3NRN2wzRi9RUElqZzFlbzQwWk5XUTJnRTJx?=
 =?utf-8?B?dm4zTnBVR3gycjFxUlprU1E1OUdmTWtIR1VDdk02VWl5RENFUXVjMHhEL3JM?=
 =?utf-8?B?UkQvV2lWVGNqbXhYVFZ4T3Bqb09IZGdxQ1J2M2I5WXV4bnR0K2NlNUdGOWRO?=
 =?utf-8?B?LzNpeGtVbEJ3T0tKRjV6ZHB5ZmR4bTUxUTB0U0NVdXhOQmEvMVV6MVd6Ky9k?=
 =?utf-8?B?SGxYT0VKZ09zSi9ISndNbm5hNG90aVBmMUhOS1hzeEVnM2lYYlZrMkdadDdY?=
 =?utf-8?B?dE5FRUlMcUhMMDQvWEJFRlhGUE4yaW5ZYXZrRUxkK1U2WXVlOEd3Y1NyTm5X?=
 =?utf-8?B?M3J5VXRiK0R4MjlSWTlqWUljdFhERks1cXV5UEpwdm1aaGYvT1lZckZLNTRR?=
 =?utf-8?B?STN5c21TS09GVmRDTTR2VHVpOWV5TXhzUHRXbCs1UmRmNDFrNVp4U1kzM09E?=
 =?utf-8?B?M2VuR1VNUWI4NUF2cHk3ZlhMRzk3cFZaeWZJM1dhbTdkN0V5cWdWS1BGblBx?=
 =?utf-8?B?cVNPS0JJVkdPSmExR3k5MkxWTlN1aWJsS2EvVW9zbS9iQmNXaEFMMzB1TG1p?=
 =?utf-8?B?bnhiUUQ0M1JmV2NvUzh1MnJjMisxMVJyKzF5ZjdIQWdIYktjUDExMndWbXpl?=
 =?utf-8?B?YTJNaDc1OVplN0FtaXZhek9ZUVl1KytBN1pVRHVtNS9Sd1NaWGZlZzdRVVZD?=
 =?utf-8?B?RjhwcjRXYzlkNXpoTWp1NHk5R2ljVk81MWxvZ3NyZlA3QWlHQjVWY0tpRVdR?=
 =?utf-8?B?dkN5YTZ5djYybFVROWlnUnJSWmorRERBNjNIK21QVlAvaHZJbm5mRVpQNlpI?=
 =?utf-8?B?OVVHOThLUHdmaCtsemdOWnZUcGRhZkxKV2dzYTJRWUUrM1BjcEcwcGFERDRr?=
 =?utf-8?B?dWEvYUNJV0g0WW5SMG5vZlBFMmpsN0FNay9JcGY1NEI1UmdzYzYvUzZjaXV0?=
 =?utf-8?B?Q3pMeHVVdFZldHZlZ20vSi9QMFVBQkd0S1JaeWFiUjF1Vkw3bXpQaDJkUzh3?=
 =?utf-8?B?THg3ZUZMbFJaMkJFOUR5Ulc0NXRNbEwwUjRQRTZOb1IxWDZiL0J3WC9wRyti?=
 =?utf-8?B?dy8xRVZ6K1FSTTVwZ1RJNFE2dVFKRFVRMVl0Y1hUeWUvQWI3ZUxZZUZKVTZj?=
 =?utf-8?B?SStKekZlVlZ5alFlNFZaU1RwaEg1NTVOOUdXcXBaRFN1M1BJYnNUMjhuZUF0?=
 =?utf-8?B?VjVtbkxwRFJMZXk5VVJwSExSb1JQK2tMbmRYMjlDakZPMjg5UVY0Qmw3YjlM?=
 =?utf-8?B?ZW5wMC9CTFhGOXYwSE1HQ0dPWkFwZ25ETlBXT2JLZkt0L3pYTkh3eGFESExj?=
 =?utf-8?B?bk5pM240dEQwblZXNEg3bEhRUFVkekRCVFFXM3B4K3dvdTBWQXJDNEZCNTBG?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a5302-07a9-44a1-aaee-08dd4c98291f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 01:37:36.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCkTt3ccwPUWN6i4tjlQ9tdgV6zQw0SIktwJpN73JTN+A5fTE9zTUyAQ4i36Vb+/iq/FrH4bZnFELxrOOGZsYcgWVSMcjnfFT2ZfWBYM1q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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


On 2/12/2025 10:15 AM, Rodrigo Vivi wrote:
> On Tue, Feb 11, 2025 at 05:19:14PM -0800, Belgaumkar, Vinay wrote:
>> On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
>>> In a rare situation of thermal limit during resume, GuC can
>>> be slow and run into delays like this:
>>>
>>> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>>>      		 [status = 0x8002F034, timeouts = 0]
>>> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>>>      		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>>>      		 perf_limit_reasons = 0x1C001000]
>>> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
>>> ------------[ cut here ]------------
>>> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>>>
>>> If this happens, this can block entirely the GPU to be used.
>>> However, GPU can still be used, although the GT frequencies might be
>>> messed up.
>>>
>>> Let's report the error, but not block the flow.
>> Can we expect other random CI failures due to this? If GT is not getting
>> expected frequencies, certain tests which rely on this will likely fail,
>> causing a bunch of noise. Is that worse than driver load failing in this
>> case?
> This issue which I pasted the log above is blocking the resume of the
> a LNL laptop. Everything goes blank forcing the user to reboot the
> laptop.
>
> I prefer to have to deal with CI noise with bugs that we can work on
> than blocking users resume.
>
> But well, we are still waiting one entire extra second there.
> That should be more than enough even with the thermal limited
> condition there. So, I'm not expecting more bugs than we already
> have.
>
> Also, our IGT test cases are prepared to deal with some EAGAIN
> returns right? The probe and resume functions are not....
>
> But well, any suggestion here on a more robust approach?
> Or can we go with this one?

True, this will unblock resume. However, if this is a pcode bug, we will 
allow boot in spite of a persistent failure to get anything above Pmin. 
Maybe we can print the frequencies again here and explicitly warn about 
the loss of dynamic frequencies and GuCRC (and all freq/c6 related 
interfaces) from here on?

>
> Thanks,
> Rodrigo.
>
>> Thanks,
>>
>> Vinay.
>>
>>> But, instead of just giving up and moving on, let's re-attempt a wait
>>> with a very long second timeout.
>>>
>>> v2: Keep the precision comment (Jonathan)
>>>       Use a define for the regular SLPC reset timeout.
>>>
>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
>>>    1 file changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 02409eedb914..3b04b62937eb 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -50,6 +50,8 @@
>>>    #define LNL_MERT_FREQ_CAP	800
>>>    #define BMG_MERT_FREQ_CAP	2133
>>> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
>>> +
>>>    /**
>>>     * DOC: GuC Power Conservation (PC)
>>>     *
>>> @@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>>>    	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>>>    static int wait_for_pc_state(struct xe_guc_pc *pc,
>>> -			     enum slpc_global_state state)
>>> +			     enum slpc_global_state state,
>>> +			     int timeout_ms)
>>>    {
>>> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
>>> +	int timeout_us = 1000 * timeout_ms;
>>>    	int slept, wait = 10;
>>>    	xe_device_assert_mem_access(pc_to_xe(pc));
>>> @@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>>>    	};
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	/* Blocking here to ensure the results are ready before reading them */
>>> @@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>>>    	};
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>> @@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>>    	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>> @@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>    	if (ret)
>>>    		goto out;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
>>> -		xe_gt_err(gt, "GuC PC Start failed\n");
>>> -		ret = -EIO;
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS)) {
>>> +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
>>> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
>>> +			xe_gt_err(gt, "GuC PC Start failed\n");
>>> +		/* Although GuC PC failed, do not block the usage of GPU */
>>> +		ret = 0;

Looks like we are skipping SLPC init even if we succeed in getting the 
right pc_state on the retry? We should continue with normal init in that 
case(need an else).

Thanks,

Vinay.

>>>    		goto out;
>>>    	}
