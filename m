Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C99CF042B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 00:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1061910E249;
	Wed,  9 Oct 2024 00:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAgrHmAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F123510E249
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728432593; x=1759968593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5CqDkvk964CbGpC0uSwENThpt3mnUuc9AhbnNVi+tZM=;
 b=kAgrHmAaBt/kD+GPIyKyWoBH5zkkbC2yBbm0G+wEKQB5hBTyIzlg6LOD
 rLFgjQtxBM9/OHv6St6hUrJ5SO06tKe35QkiT6VbXdLJROKQheLyfR3EG
 uax3kaBm02wPPmxp8Bb4aUlPlBG7gsB1wfrqcVIFzj2InH4miBqZOtJnL
 dyzyGy/MqYdJSiukRdCa4wYVJ+BFtlZDoHfaqbWjkFnDrM7y4ozVM4+Em
 eO+8SwLMapfaKEJiGqZqErtIKHzJ6M8CRtdp+R1WjOXdCwKRfDpduEx4v
 Bb8ldIdIoW72y1qYKZBcBp2HGhvNgb5vog/CB9tcHUm/IlRrlgqqyyokZ g==;
X-CSE-ConnectionGUID: ET+muJdJSNaeLvE4RFsyrQ==
X-CSE-MsgGUID: lfhdAu0+RqWAXGegdRZLsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27818068"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27818068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 17:09:52 -0700
X-CSE-ConnectionGUID: MKEz3gH4T4uFG5GkplPI5w==
X-CSE-MsgGUID: cup8JGwOQ62l3uN0YzuwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="80617465"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 17:09:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 17:09:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 17:09:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 17:09:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 17:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRy//vHdOl9b9UndoGoFzvoF14HUJfaauvSvezF+n1NLTnBaeAocV84CDdKm5DIWEZyIIi3hmInp29enhWZlaUwO/K9hqSuP//7pOKjwMBYJ4uT/yqX1ajQtHLTVbGabfGh5W7p51JdYoXlBrJwHEzu1ycAhuf7dXZqEaGq7dJM+8VGIgXmBr1JECWnQt7z1+291c7FI6ULy8iwbiY++e8r/BlRVHoWbrfl8fZJ9SDFP5tqFbPEpkjz7RBJ7l4FTjAUHL+lHS1g3gbGCr3ZHZeZXO1xDIZnEKefIGKCG76UuQcIFn07iVfRJfYKLaOjfvARe4Fen+D1tGm1YUMuiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNbOfb7AAIA81shAPT6yvNk97qN9w5dN8DfBbPcJME0=;
 b=clw3YslGI+csm/P9VJ/H6i93AupbZZfGvzb6g9GJe8AuQpYTT8i2FMIZpv7KN4C+1UXNDSichgQkxgAPRpSIRH+cnZUrey5eoB7GBM5KxkRJeb8KJQLEofWw56RXmMcYbqNv9UsTwt3tGFP3ee6KKh+QmgmIU875731IsfinmK1zaFPGZDPMYaBkvhHhCrrs6QmhIDodGbzjOs5tWR+yAx2mR3rPRMbnwNgUsgn7fYDbWn/ZYwthEiAUEUypmRdum9vMymocXkuogvqbNk1Gq2uAvl3QNBbErZfUHtFFTiPWW0KlEQzps5AASMd+tBQdKfYSqptGIqShvC2W5hSCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 00:09:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 00:09:48 +0000
Message-ID: <d3d243b0-a720-429d-8d96-3a4595728df6@intel.com>
Date: Tue, 8 Oct 2024 17:09:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] drm/xe/pxp: add a query for PXP status
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-9-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:303:6b::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b0fe16-2915-4ae7-8bdf-08dce7f6b054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amdXMGF2NW16a3FROFNYR2FVdmxvZEMvTm9rVHlOVFQzL1BINHpEQnEvVkFs?=
 =?utf-8?B?OHBEYjBZRVBFL2pwekhxSERPalpFaWQ2ZHlTbmp1VGdFbUxOVEJQNFlBdDZy?=
 =?utf-8?B?TU8wRDFyNVNFSEdJUnovNlhJajQ4QTUvUi9GZGZXa2h1c21KaGFtMXBlMHRk?=
 =?utf-8?B?QVBPVGdYYjYxU2lVQ1VHaU16ZUFKWE5ZMU1EYndDT3g0STZ5d1o2MU1JTFdI?=
 =?utf-8?B?TlNJcXZYbFE2Tlhpb0dDMWc5SnkwTWYreXlXUytzVG1ZbFM3VXJwYXkvNlVI?=
 =?utf-8?B?RXJsVTc3NkhsRjUzZVNVb2h5YVFnU2RNRnQybGQrQTFLS0I5VVdMS1B2NC9R?=
 =?utf-8?B?ZUFqM2xxSXlJeHZnY0x6Z1ZPREg5cEF0TmU1SFlpKzlxWTcxZTVlWW1YNFRE?=
 =?utf-8?B?Vy9PMlVlYUNtVHBXSzIzend5SkRQblFDcmxUK1dERnNaMm13SUFHQ3UzanJV?=
 =?utf-8?B?VjRCMkR3WnhuT1JVNHdlUThBTjAxS0JSNEJQQUZuSUlCMVVYc1FQNWIvK2lB?=
 =?utf-8?B?QS9vdm1CTStqZEdZR2FHdkhHMk12ck9EU2dac3hrdUZ3ZjdpODh6MlZ4Z0JX?=
 =?utf-8?B?cTVYOC9pTGNabE9Gd1p5TmJWZmxuemRESWxnM0FBMkx5SjJxc0FLNy9MOUlY?=
 =?utf-8?B?djlvWVdMT0NUNTU2V21mTmJXbTMzMGNCRVRSTFhpWGJYbFJESlRsZXpNYS9J?=
 =?utf-8?B?Vm1YajI4aVJvS1hrcGo3eVNpb09sMDF6cWpOS1NiYkI1T3NOcEFaNjhvbmdE?=
 =?utf-8?B?UFpwRHFmbzF6aTFMdmtsUk15QmIxSjVTT3ZlV2tRQXU5WWYvN211endCUVcz?=
 =?utf-8?B?RllzS0luUDVadW1pd3pGaEZQVktESmVJWXI5MGxZNEtIbHJOeUlDcko1Wk9s?=
 =?utf-8?B?QUdOWUppeWl5UGRFdFZ4WkMzdkhIeDNVblkrWTRXZC9PNis0amlHbmhPTzdO?=
 =?utf-8?B?WWExM2w4VVVreTBtbHZRN043RUc5MFhWMG8rQXdOSHRqUmlsVTlGRTdMc2gz?=
 =?utf-8?B?akpYa1pKWHFySk00YlBZNkN1VTRaS01keG1KWEVFUFJQSDZMYWd2TDl3RDl3?=
 =?utf-8?B?SDVkeWZ4VEVoTkNUT0lJK1RFTjJWbU85ZWtIY3ZsOVNsRWJZNVloRGtQZHN1?=
 =?utf-8?B?d3RqTWw2OXh4NFNSZk5PaUxKYlA3U21BdlA5K2tWTFVxazFUaHNiV1M3c0pN?=
 =?utf-8?B?RmkzWDBKZmh5dUI1RExHZUU4WWxFa2hLdC9TaDloUzNKMzZIUUZXb1RpczdJ?=
 =?utf-8?B?TWoyQ2J5WlZ4V01tcWlPK1VvK2pTZlJPMjhRcTBuQjBJRFcyS01ka1VzanNv?=
 =?utf-8?B?VVFVVTNIN0hjOWNQT1dSNlVsa3F0SUV2N25qYmJ2aithM2xxSVE4Ti9HV01p?=
 =?utf-8?B?Q1E1T05LK1BpWDd3YkY1NTY3QnRLNGliK1l5Qm9ib1VNUjJiL1VqdEJ1WlZW?=
 =?utf-8?B?TGovdEpTNzkwVk5TUDVBMU9OblhpdW13THYyaHY2Tm1WbW5Oa3FpV0NpamIr?=
 =?utf-8?B?MzVnN05xZCtIQURXSEtLYjg1RDF5M0orVUdrOTFtbXFDUXhPcCt0WVhKMndQ?=
 =?utf-8?B?ZFJpa254SUw5dVVSbWtvQWRpdVd4MExhd0VzQzA5YS9JRjk4YTZPUjJwV2Vj?=
 =?utf-8?B?NjFLL2cyYWlxalRLZ0NLVWdIZXhEQmdIUHFzSnZVUkpqN0lyL2UrU3g2Qjlq?=
 =?utf-8?B?c3pqeG05ZW9WMWhSVE5HMEVoclRLQ093WndoZGJqWnpTKy9GZUhhSll3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNhRVQ2REhMNnRBM3NOdWxSQUt1UlQzRjI3bW1LWXZxcGRiQmc4cjJpN1FO?=
 =?utf-8?B?YTNiWE5XcmxzUzdTMFc3THJhYisrKzdLeDI5U3NiTVFTZGRCT1hrZmptSGp0?=
 =?utf-8?B?d2NUU0RueVovZW5Rck5ub0ZBbEg5REhTNDN5d3FoUnRoOXloZy9CMlhqZXhV?=
 =?utf-8?B?cDFxRTVIV01oSDdUa25rZHpXVFNGQXVTdWljSWVlUnlGaURyaXNvMGxmVGd0?=
 =?utf-8?B?M2ZxdHM2eTBBTTBNTnVsd1ZIWXlHSkZYQXd0YkNGeXEycHZLV0kzbFRXVXRW?=
 =?utf-8?B?Wi9IVGlpNHU3UTMxMDRuRTl6cGlZOFR6Qi9kUmtHU09uK0RCeCtrWitjVXRk?=
 =?utf-8?B?RTJ2VkEvMTdjM2I3ZGtRS0dkNVRiMSsvb3FrWUdweVRuL3E5WS9kUDhobklD?=
 =?utf-8?B?ZGJiZWF0Q09FelpWSGhPdFc0K0VTektNcHNUbUhTWlJLWHRabnAzanA3NHNB?=
 =?utf-8?B?cDNvdzFYRCtEd2crdUtKdHJoQk1qc1oyUE1vS0FYT3lUaTAwT2ZqZTBWZ0FV?=
 =?utf-8?B?UFhlMlhYMEVkUE1kdUE3L3RJZ0UwME02eVVPeHM0ZzgvZ3NxQWFNcURiWWRV?=
 =?utf-8?B?dm12eUU3QTBHQUlQUFJLbVo5bXdkN2tFTXdPNUZPQ0ZzOThnSURYa2hBd1lI?=
 =?utf-8?B?bVBwbTNhWU9POWhkSUNodmNFL2dzQ0NqNCs2QytVcVlUbExqN2VEUzhsMGRh?=
 =?utf-8?B?TVlRQkx4eFRveFBJMThNYVlxMXI5UVVMaVF6Vm9FL240VEJrclpLYzkwSkNP?=
 =?utf-8?B?bmF3blhYMTd3MmRKSXdxQUF2U2RFU2lRcVhxL0wzOE1hOVZvM3NIZ05URGdV?=
 =?utf-8?B?K2kxdm52NnpzbHJVRGYzdXlKcHR4WVp2SXJrZHVkMVZncis5M0R5ZFNNSUZF?=
 =?utf-8?B?M2dWaHdodVczb1lCZSt4bkhNZEwyUXhmczVzR1NFbFNqNGdUU2tHakprVXpM?=
 =?utf-8?B?T0c3ZUQ5Wm1KUHJVcFVkT2VKZjU1Y252Y2JWbFRtekVXbnJIMkhEMFpmc1ZJ?=
 =?utf-8?B?Mm5yVnJIUEtnSDN5eUFMRzdhS0s2dVA5LytaQk01UXR2YWJ0Q0tiVEg5R09i?=
 =?utf-8?B?RWExaHl0cm94RGFNWGMvOEFiWXYvQ243RE5EcmdlMHIveGJ0SXFycTIvTUYx?=
 =?utf-8?B?SENRWVVWTzdXM1B1RS8wOVVEaUVoc2dvMFdidVBQVldTM3FKdTJSOE5FY21v?=
 =?utf-8?B?Y29nSEJHSlB2a2crOVdCbzRXL21YWDFORlZEamVoNENFNU0xZUU2TkY5WHdx?=
 =?utf-8?B?cDZOdGVJcm1xeit3V08yWkR4UXNGanAreTRjY0huaDUvRENQaC9Ta0dkbjVt?=
 =?utf-8?B?MENzdGY0TkV3azk5ZFQvTGhDbXRqVDdSK1ppT3dTMjhrVmRJTTJMeWZpMkhW?=
 =?utf-8?B?dmttdE5hNXJuS2lYUVNyVU8wcldGWUUwRlhNTldwWUpwSWk2aW80NVo1UlVT?=
 =?utf-8?B?aVN5S3R2TVVneGVMMkhWanFrYXVuTG4yVWV3WGU5bjNrQkVyZWZ6OVNpTTF2?=
 =?utf-8?B?dW5tdUQyazNNZnBLYjVCSnlNMWFBZnZESXR4YlhZVndZNEk0dkNPWmJyNENj?=
 =?utf-8?B?ajVOMTZ0bXlaTGZRVUpoMEcwUE1YaU1qUXYxVm95MXdWbmRLaHlkVWxPTFpx?=
 =?utf-8?B?bWhZQmFpcnh3SDRhN0prK1BpYXdOZk9wWWoyc3hRUGthMXZPRTNRR2x6VnRT?=
 =?utf-8?B?eE5GK2FGSzFudTdrZVpBbXRoUjRob3FwdWd4QTBCdnB5OG5OMTdvdVlVbG9i?=
 =?utf-8?B?ckNpVGxoSHlkbTRnRGxiMmluUWsxeEFxamtHdVBLMC9vTGpTRXdxM3ArVThJ?=
 =?utf-8?B?UDJreFhXaGY0M0puUWhQTW9Gd2FGYkxyeEE5N1dqUklNeGRwRlpoUGFZV1M3?=
 =?utf-8?B?YnFUWkNVYjZER1pTZzN1MEl5SGtSQi90VkJzdU9Gb2hlYWd3Q1VYSjZqZENF?=
 =?utf-8?B?WE9lVWFOT3Yrd1JpT3Q4OG1Ca3grQUJwUXRNQ0xHVEwzYUxVNGlDcXpESUVW?=
 =?utf-8?B?WUJxeHBVcW1OTkc4cHdLRFByVUx4K0RaejdkUU5uUDl2Zm5rVWNxaVlKWTdw?=
 =?utf-8?B?dVBEcVhyeVRHdGFaakZ6em1jL1pHUjBEaFhVRnMwWHp4NmVKUFI1aFFFVXJk?=
 =?utf-8?B?LzczQ3FuUWR2SXBmSlpsT09KOVB6NFM5SE55WkpzUSttRFJPdnd3TGRzZUpX?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b0fe16-2915-4ae7-8bdf-08dce7f6b054
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 00:09:48.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcBxxRnGA3fQBQ9Sf4yvJyj7ExfehvTL8T+r+ju9wR8zrHmFPtI+B2gMzMBIXrOnJ32sc12lScYAt1tr/9Z/Wg6stm13fJRh8waWJRM8tcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
> asynchronously from driver load, which means that userspace can start
> submitting before we're ready to start a PXP session. Therefore, we need
> a query that userspace can use to check not only if PXP is supported by
by -> but?

> also to wait until the prerequisites are done.
>
> v2: Improve doc, do not report TYPE_NONE as supported (José)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>   drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h     | 35 +++++++++++++++++++++++++++++++++++
>   4 files changed, 101 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index acdc25c8e8a1..ca4302af4ced 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>   	return ready;
>   }
>   
> +/**
> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
> + *
> + * This function is used for status query from userspace, so the returned value
value -> values

> + * follow the uapi (see drm_xe_query_pxp_status)
> + *
> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
> + * is not supported/enabled or if something went wrong in the initialization of
> + * the prerequisites.
You have two independent statements regarding the return code. Would be 
better to just have the "Returns: ..." paragraph but include a statement 
that these values are as defined in the UAPI.

> + */
> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
> +		return -EIO;
> +
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	/* PXP requires both HuC loaded and GSC proxy initialized */
> +	if (pxp_prerequisites_done(pxp))
> +		ret = 1;
> +
> +	xe_pm_runtime_put(pxp->xe);
> +	return ret;
> +}
> +
>   static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>   {
>   	struct xe_gt *gt = pxp->gt;
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 2e0ab186072a..868813cc84b9 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -14,6 +14,7 @@ struct xe_pxp;
>   
>   bool xe_pxp_is_supported(const struct xe_device *xe);
>   bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 73ef6e4c2dc9..a1e297234972 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -22,6 +22,7 @@
>   #include "xe_guc_hwconfig.h"
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp.h"
>   #include "xe_ttm_vram_mgr.h"
>   
>   static const u16 xe_to_user_engine_class[] = {
> @@ -680,6 +681,36 @@ static int query_oa_units(struct xe_device *xe,
>   	return ret ? -EFAULT : 0;
>   }
>   
> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
> +	struct drm_xe_query_pxp_status resp;
> +	int ret;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
Do we not allow structures to grow in future versions? In a backwards 
compatible way, that is.

> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
Why copy in the data from the user side only to overwrite everything in 
the structure?

> +
> +	ret = xe_pxp_get_readiness_status(xe->pxp);
> +	if (ret < 0)
> +		return ret;
> +
> +	resp.status = ret;
> +	resp.supported_session_types = BIT(DRM_XE_PXP_TYPE_HWDRM);
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>   				      struct drm_xe_device_query *query) = {
>   	query_engines,
> @@ -691,6 +722,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>   	query_engine_cycles,
>   	query_uc_fw_version,
>   	query_oa_units,
> +	query_pxp_status,
>   };
>   
>   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 5f4d08123672..9972ceb3fbfb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -627,6 +627,39 @@ struct drm_xe_query_uc_fw_version {
>   	__u64 reserved;
>   };
>   
> +/**
> + * struct drm_xe_query_pxp_status - query if PXP is ready
> + *
> + * If PXP is enabled and no fatal error as occurred, the status will be set to
as -> has

> + * one of the following values:
> + * 0: PXP init still in progress
> + * 1: PXP init complete
> + *
> + * If PXP is not enabled or something has gone wrong, the query will be failed
> + * with one of the following error codes:
> + * -ENODEV: PXP not supported or disabled;
> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
> + * -EINVAL: incorrect value provided as part of the query;
> + * -EFAULT: error copying the memory between kernel and userspace.
Currently, could also be copying from user to kernel. Although that copy 
seems unnecessary.

John.

> + *
> + * The status can only be 0 in the first few seconds after driver load. If
> + * everything works as expected, the status will transition to init complete in
> + * less than 1 second, while in case of errors the driver might take longer to
> + * start returning an error code, but it should still take less than 10 seconds.
> + *
> + * The supported session type bitmask is based on the values in
> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
> + * is not reported in the bitmask.
> + *
> + */
> +struct drm_xe_query_pxp_status {
> +	/** @status: current PXP status */
> +	__u32 status;
> +
> +	/** @supported_session_types: bitmask of supported PXP session types */
> +	__u32 supported_session_types;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -646,6 +679,7 @@ struct drm_xe_query_uc_fw_version {
>    *    attributes.
>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>    *
>    * If size is set to 0, the driver fills it with the required size for
>    * the requested type of data to query. If size is equal to the required
> @@ -698,6 +732,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>   	/** @query: The type of data to query */
>   	__u32 query;
>   

