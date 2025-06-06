Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49692C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FA810E32A;
	Fri,  6 Jun 2025 17:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDL/wQRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FB10EAF0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749231629; x=1780767629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UGisu5K2bUWr3SOTGEx7koXXKKSqozUdZnEJYZ26opk=;
 b=DDL/wQRMecR8FwkgeEgqSS4nwrUwLz2BzlYascleSewu0PBdZJ7pwz8L
 DWSkEMhb0S5lygS4O7MJk/NL4hxancnFYBXyjKje7tJlb6xCtGskPeTxv
 lJX80ebQiO/2E4M58xS+BQ+quJSX+nhcsbXVxxKEaz5u05La7ckYaE3WH
 ZNWSwW72SSsenvoSIoCkvwtsDvYeLyvhW3QBW39nWT7ILYWb1CGzJRBXg
 bPjeAsn+mPiR9uvrbBZwAHiIonYMjtXgIRQx1mCVQpwI3tvCk8TTFW7X2
 C8upTmFy2dQXcU/6GDvqogwEV7RbqRHqEUZhFkdIHwFPVGoxduhNd1KcT Q==;
X-CSE-ConnectionGUID: 6+x5+7VLRPunpoH1gdXU6g==
X-CSE-MsgGUID: Utqg+LJqR+6sXm+5Q+kh9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61655973"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="61655973"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:40:28 -0700
X-CSE-ConnectionGUID: F7C4NxteSr6tJzz/gRPNBg==
X-CSE-MsgGUID: 2xRKeFa6QSKeV6P6Rq6Y+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176766826"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:40:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:40:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:40:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 10:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOsAQCa2Jf1z05qB6GkPBXLkfKw8FsI1eZtQcFojXhHTOsWDrQ2sLgl11mX9dFvgG4WM5y6yT43VrUOJUtcvELO+rAwtl7YDh6B5eX3r4uePPrxaam8jOKZ6pHVEkVXcq/LthQDecwg6JQR/rTJLj4CUQ7K39nesLp4E/twhWr8mds0nMMmbvhblO8DJT0ZoG9Urnnzp1Yww5Yn0jwTf1gfm/WOW7q77wRDTQhgBd7MtOcLo0HEtW31Nye6uFF14PeobLaYwLd6Udex0Vwc0msk7BoeCaGr7eqfhE+1llGCDlTa1U/WWUaFtRZraNOCryyUiByXRFHx592Y8huVuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COmEfTMwc6hCBXJAYyLHdJgs0Z79Xjnpzt/f7/B1CGU=;
 b=HVEooPw6yY2KwfwIc2j/kGflaAhqMU3OBTkh9xCaNVW8j1s3kFRqT20N8acopXiBGWHTUTFPyeRsTpTKrNI1O1VGpeZojiRlYNQZWt/FCgmkEEkpZU49x2zrtta5v4d1YX8NAgKK9n2qI8iybjKKEjaarwk0+mylQ3ET04bF0nb7Io+YtSShQ+tgghzObFVe0GmT6B3IJZJw6ENAEHGOcn7ohL5s/Ofh/GX4qWpf86NIYf/te40vKmgJcO8vl2rf+WGmFUtaGhwr7HwGAcOrqCoD7UUCxDsjC/af/67jzr4fDXhzYCDww3QsjogD9mNGOOW1ETc+xv2C4DI74Ci7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 17:40:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Fri, 6 Jun 2025
 17:40:09 +0000
Date: Fri, 6 Jun 2025 10:40:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/oa: Assign hwe for OAM_SAG
Message-ID: <aEMn9zo0_COWkbGU@unerlige-desk.amr.corp.intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
 <20250606160253.4054668-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606160253.4054668-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bee6f6-5189-4270-bd5d-08dda5212eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0ZacWloNFdtMlJqem0wMVJPUmFXUkNxeENxckhGbUVKTW0rUWZQa1pCV3Nq?=
 =?utf-8?B?WE9OcHltd0Faa0hxVndiczVrY09vZldrNFN1b0VINnd3cmRXV014QzNUeEJL?=
 =?utf-8?B?VEJNVkdaeC9oQ01IQW14aFhkUDJiM0FhZTdaeHQrZWhIMmtxaEdPdTlmNEow?=
 =?utf-8?B?NWZWbnlCVDM3V25NbWV3Vkwxdmk1TjhzZEV3UTVSK3JiejVmcFMyOG80NHNE?=
 =?utf-8?B?TVJFdWx2UjVVUVlDVVFBbVl0UE5Ic1hzc3R6WitsdTFIVTVsVXZ0TEY4dFZ1?=
 =?utf-8?B?VGdUWURjZjBrcnhhSjFxdU1MLzAzb1B5SUJiN1ZGRE5PSlp6VzB4dzl4M2V5?=
 =?utf-8?B?em5QN0cvaXd0MWIzM1RuSnNRbzgxTnltS2EwZXhPOVowaHpiVmxnekZrRmhu?=
 =?utf-8?B?QmZWL0JOdlI4MXZ6YnhHTmhnaHNSWkdCNjkreEczd3lIaVFoTUxtd0ZURGRj?=
 =?utf-8?B?bksrNUhEdE5ubms1RlQ1TWUvaEZLTU1yUitsS1pRbjVsa3lVeWVWUEdpNGw5?=
 =?utf-8?B?RXlGTi91RE0wQ1NBMlJ1RlhUaC9tZFR2b2dyOVE1b01kcGhHbXNITUF6d2Za?=
 =?utf-8?B?dHZmckJvRGFoVHNQWTV6U3pLTHVtY1dHeWxQekxWMXlhZ2xmck5YL0F2czEv?=
 =?utf-8?B?aHpVZmsvNEhVNmg4Zy9nL3M4LzRQWm5qZGQ5TlN0UVgwYjlGbStCTUFjdkZr?=
 =?utf-8?B?eUtjR3Z4K2cyK0ROTEhwZ1RhWGh1RWh6VHYxN2REV21ERzFDSE1xQ3VPaUVu?=
 =?utf-8?B?dlF2ZFZ5dE80aWE2N1M3ZCtWUmd4ZGdhcUZncEJDUkpTVFZaa0JZSkwvVXhS?=
 =?utf-8?B?YmdHWEd5VC9FMGxsVmdHb1dvOUtwU3UxQk40dUdBTDg4NjFBbVdFa0xtTXdG?=
 =?utf-8?B?OEp0dW15aThGVE5RUW81WE5KMEFJWlZWdmVXSUc1enM5Vk41bDFha1hYV2px?=
 =?utf-8?B?SGhIM2c1anBHN1RNdEhIZzJWclRjUCtyQ3JjcWZQL2VyQzNPYlZsNzBSQnFv?=
 =?utf-8?B?TVpNZURTL3B1UmdyVjRWVVo0L28zS3Jzc1NCSWZjcTBSdEhOSUh6dXV4aHAz?=
 =?utf-8?B?cVp3N1BwbFFBLzRkd2RLZkhoWU9uUlJqRHZ2UDdHR09OSURkV0lic284OUY4?=
 =?utf-8?B?Yk5vZmxMSnFyUElIVWh2Y0tTTGhMdHB6OFZMZ3grNXV0MzV0UE1pUTZTYkVz?=
 =?utf-8?B?VmdrQlZDZ0NvamxEUHZ5dEhzRE9ITHpXR1d4aHNYRlRqSzduSTNBc2tpVVBW?=
 =?utf-8?B?RHc1RjRqNm9zOG8vd1B6MFI2czVWY0V5QmczOTFLdGdWWHZZbFdtOW95d1VS?=
 =?utf-8?B?b0MyZHZnNlgrT1hYeVYzQVB2K3k1aFFVZCtXemNVQXE3UklicEVaRkkxVUVF?=
 =?utf-8?B?M2VGbG5pdmRaRmxvdldEU3hQbDM0U3gvMUhUUkgwRzlHRzVUTmVublF3bkVS?=
 =?utf-8?B?d09DNzdLRVpKalpNbEIxSUNadHdpTEYvS0cwbDFFdDVNUWpUWHdHNEJVeEI3?=
 =?utf-8?B?UndTanVQVHpjeHJCTzRZRXBTeGtNVHZCL0JjYy9PM0tRaG4wbEtYd0RxZVRP?=
 =?utf-8?B?NVFrMzRrQ0V5QXRKaEVlRnF0TXdGVG9UTUE3eWRlOG9jTnlNbVFmbFpJWkRC?=
 =?utf-8?B?Nm1YYzFiaWFFc01ScFdHRy9VRUhPdGh4OWxHVmNjZjVJY0xBUDh6Q1NpU1ln?=
 =?utf-8?B?OUlvRkE2MUhleHlKc2JjSjRCL3pVam9jcU40UFh6Ujg3ZUJGQTVOUE53dHhY?=
 =?utf-8?B?SFQxV2NaZS9qajNhN29jMGJMN3VLMkpOV2ZpRldFRk5aNUJOWTYraXA3OVVx?=
 =?utf-8?B?RmJHdWxtTTNDUm5SU1dhellNendDL0FVVWNVTkt1YTg4U1AwbmFtV0xVL1U3?=
 =?utf-8?B?SWVIRUx2ZkRMNmxyTG5LbCtWMmdmemRsNTVOWE53VDc5bmt5cmZCWmdSa3ZG?=
 =?utf-8?Q?7T0zOXYej0M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0kwVlkrQjlibG1kbjlYQWlGNDNwcFhiSmx6UEhSdnRuMlJKeG9BVERzSkl2?=
 =?utf-8?B?eEp4UWdjTHFWcjc3aS9DYVYveVE2N1ZmejhvSUphTTBpRmFKV1M1QjgrcmxC?=
 =?utf-8?B?SWU2WHBzNUpYUndpR29ZNGYvMkNDdmNwNzdHbm1GSHdScTlvRUh0UEdWUG4y?=
 =?utf-8?B?SkR2c05ybnVuajgvNWEyRWtQWVBsbCtMWnhOK0Nrci82TW9QQWlEbTUvczB5?=
 =?utf-8?B?Snd4clpaZWlxZEVQWEoyVTN0a0h0ZUhFbUQ0S1E1OHJxc2Z0MEYzcVlTdmxG?=
 =?utf-8?B?NmtRdEZKcnNtRWJQSjh6UjNmZDRzVEpxY09sT2R3a0pqWE9CRWJnOVNlbFJM?=
 =?utf-8?B?aTZxK3pvYm9LYzhCdzh4M1FUL0NGYTJhZWE5K2l6K1ZwMmJ3akFFTzVSbHB6?=
 =?utf-8?B?Vlh2N2hDaklRTG5rMHNmdjhkbnBEMVZtWEt4dHQrOEw0UVFZYzRyL3dlZ3h5?=
 =?utf-8?B?WkJGMlY2VjliaGIzMmU1L0owSC9QakNYTmxnNnV2TGh1YVgyMWV2VDlHZzk4?=
 =?utf-8?B?a1ZjR2FvdEdqNWpqd1BpeUdqUncyNnJxeXhZelJpd3VKS1c2RVJ4ZmxwemJ2?=
 =?utf-8?B?NStUOGdyeUQ5R2src3hQRWlwOHdKR2VCN1F4RkZoZzhDb1ZnQTdMK1dpN1hZ?=
 =?utf-8?B?aVhjV3VrSFl5ekNvZzc0VFQzaCt0OVluQVMrWGRtSGdTNkRHanZvajFubU8v?=
 =?utf-8?B?TWl3b3J2QTdOU3dxS3c2MGprRERkeUE0SWdGOWROalNaRlVFNUo1V2JqV1NW?=
 =?utf-8?B?MGg0d29hVDNhWFpmRk5LNHpoS2hYR1I5cU1GNjhjNWg2UWhvZmg1RFFCLzNx?=
 =?utf-8?B?QU82NERLd0hyRW9CL2RCNmFJQnplc0JTaGdGdU5pcDZieDRaSGlNbnFWMlBH?=
 =?utf-8?B?THNVOUsxcE5uT2ZvM3hYR2RFYkd3QklOaGdhT096cFhQdlFJS2RnT095YjQ5?=
 =?utf-8?B?Z04rN3FsSEVaNEY1NStmbTRMdWVtR1hMWHdOREwwT3hrc0t1TjR1b295UUdl?=
 =?utf-8?B?Z01VN3JaaHJoemVkYkRZKzFVamc3VVRoRzYzOFk4QzBOYVBaR09xeG1TUFA4?=
 =?utf-8?B?TzNhRGl4b3FXb0E1SVBybk1DV2c4MW8vWjR2bG45aWJHcXFRRjNQYUZ6aFZk?=
 =?utf-8?B?QzFVWjdLaERKNnQ3Mm15bDhPM294WitXVTY5Z3I2SlZpZ1J1dlVRNzBCbVRZ?=
 =?utf-8?B?cFlvblE1YVFxM05tNmY1K2xxSVBNZnR1Q1NZK0ZSeEFUanNwZEUycng5bk4z?=
 =?utf-8?B?U2hKb1V5UjFMMEQ5ZUEwRzlPYW50eitEM1VWQ05uWWZ2TDBVa3ZuREUreDdy?=
 =?utf-8?B?ZzNLMWM5M0UxNVoxN1E4amhSbW5pZEhmRFhGcVc1TCtQWTV2YVMvd1M5azZx?=
 =?utf-8?B?NnJjQUxGdnpwRFlpRzhGMXZubDFXUlpRYlRzWXZNekNLUjhyN0hMQmZ1Rjkw?=
 =?utf-8?B?dGpVUUxhZmx5cWVnNllKQ0pMeXJsZDlHeUxCMDBKLytaSGdrMUxNTVhzYXl1?=
 =?utf-8?B?dG14dFVDWlEvcExJdUcrMHdVN3hCeDZKRkwzKzN4a0o2VnBMMENZL1dwWjVl?=
 =?utf-8?B?RHlHdDljQWMvQVFYVUgxK0s5bmg2NkZmcFFMUXM5QXFJY3RTTHBxa3R3OGE4?=
 =?utf-8?B?blJKYlFRaW9rTFR2ak85SEg5czJ3aUVZalNKVzNLZW1sMUdlV3pqSlhCUE9K?=
 =?utf-8?B?d3RWeWF2TDE3TkgwUDRSTHQ4WENvdEQ5bGkxZUJzODhVc0ZzcjNlRUVpbUE2?=
 =?utf-8?B?WGVwMm83eDFCREQ4QnBCc05zYUxaczJpdDdiMmovRjFub3JtZEJRaWRUcnFa?=
 =?utf-8?B?ek8zeXVWT0w3c1EraEhtNVZIV3Bia24zOFZtVjA1MXlHYUx6YWNrUU4ySHhv?=
 =?utf-8?B?V1BGQ3Bxa0JQU3c4bERDekVrYUMvWjFOcE5iQmZobnAvRFZxc1ZmVlFDL0hY?=
 =?utf-8?B?dThuVnkrZVNqNGpXeTJLeHZ3WnlzdHBvOUhBWWErQ0loRjdZS0dQTlpER3dx?=
 =?utf-8?B?SDJERzNFczJzUHlCTXF3bmVpNllyQlVSQXVESFRibzJxUStZWFNNOHpKU1U4?=
 =?utf-8?B?RTB3MEtKS1pXWHdtRW1sM2NIN0hNL1VWMDNWZ0pVLzMvOW12NUYrdWx6dDl2?=
 =?utf-8?B?VWI1TER1WmJ1eDErTmpsTmtTZ3VxRWk2NjRQKzVvSThsNlIzZytTU0ZPSkNk?=
 =?utf-8?Q?Ga/BLpb4Ur0hKyK2xCdc0O0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bee6f6-5189-4270-bd5d-08dda5212eb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:40:09.4484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt3U+M7Fy8q/P7i5K8uwLvuvY03gN3+X3uS+q8QKBOuaL1KCo84nWNsW+mH5k8G4DiXX9lq6QnlDd9yJnySSZEUq/jyE2vh+hrp+2aWbtq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5072
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

On Fri, Jun 06, 2025 at 09:02:52AM -0700, Ashutosh Dixit wrote:
>Because OAM_SAG doesn't have an attached hwe, assign another hwe belonging
>to the same gt (and different OAM unit) to OAM_SAG. A hwe is needed for
>batch submissions to program OA HW.
>
>v2: Assign an engine with a valid OA unit for OAM_SAG (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c       | 57 ++++++++++++++++++++------------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
> 2 files changed, 38 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 19529c861523b..f41dac107e4a3 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1923,37 +1923,48 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
> 		hwe->oa_unit->oa_unit_id : U16_MAX;
> }
>
>+/* A hwe must be assigned to stream/oa_unit for batch submissions */
> static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
> {
>-	struct xe_gt *gt;
>-	int i, ret = 0;
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	int ret = 0;
>+
>+	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
>+	if (!param->oa_unit)
>+		param->oa_unit = &xe_device_get_gt(oa->xe, 0)->oa.oa_unit[0];
>
>+	/* When we have an exec_q, get hwe from the exec_q */
> 	if (param->exec_q) {
>-		/* When we have an exec_q, get hwe from the exec_q */
> 		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
> 					     param->engine_instance, true);
>-	} else {
>-		struct xe_hw_engine *hwe;
>-		enum xe_hw_engine_id id;
>-
>-		/* Else just get the first hwe attached to the oa unit */
>-		for_each_gt(gt, oa->xe, i) {
>-			for_each_hw_engine(hwe, gt, id) {
>-				if (hwe->oa_unit == param->oa_unit) {
>-					param->hwe = hwe;
>-					goto out;
>-				}
>-			}
>-		}
>+		if (!param->hwe || param->hwe->oa_unit != param->oa_unit)
>+			goto err;
>+		goto out;
> 	}
>-out:
>-	if (!param->hwe || param->hwe->oa_unit != param->oa_unit) {
>-		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
>-			param->exec_q ? param->exec_q->class : -1,
>-			param->engine_instance, param->oa_unit->oa_unit_id);
>-		ret = -EINVAL;
>+
>+	/* Else just get the first hwe attached to the oa unit */
>+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
>+		if (hwe->oa_unit == param->oa_unit) {
>+			param->hwe = hwe;
>+			goto out;
>+		}
> 	}
>
>+	/* If we still didn't find a hwe, just get one with a valid oa_unit from the same gt */
>+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
>+		if (!hwe->oa_unit)
>+			continue;
>+
>+		param->hwe = hwe;
>+		goto out;
>+	}
>+err:
>+	drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
>+		param->exec_q ? param->exec_q->class : -1,
>+		param->engine_instance, param->oa_unit->oa_unit_id);
>+	ret = -EINVAL;
>+out:
> 	return ret;
> }
>
>@@ -2578,6 +2589,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
> 				DRM_XE_OA_UNIT_TYPE_OAM_SAG : DRM_XE_OA_UNIT_TYPE_OAM;
> 		}
>
>+		u->gt = gt;
>+
> 		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
>
> 		/* Ensure MMIO trigger remains disabled till there is a stream */
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index a01c85931e2a5..2628f78c4e8dc 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -95,6 +95,9 @@ struct xe_oa_unit {
> 	/** @oa_unit_id: identifier for the OA unit */
> 	u16 oa_unit_id;
>
>+	/** @gt: gt associated with the OA unit */
>+	struct xe_gt *gt;
>+
> 	/** @type: Type of OA unit - OAM, OAG etc. */
> 	enum drm_xe_oa_unit_type type;
>
>-- 
>2.48.1
>
