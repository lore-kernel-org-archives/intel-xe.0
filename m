Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE6D3ABD6
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 01:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AE410E0A8;
	Sat,  6 Dec 2025 01:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5ub55tM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB710E0A8
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 01:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764986124; x=1796522124;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ndDAXgJB/0F9A+s8d7fr2tuCY1f/naoie6PtRXG1nXo=;
 b=H5ub55tMcaG2BdgttLj0BNwezGm+8WOdzy9WwZDNlmnCJQs6AXoc1daH
 kIHUMa5pTT0asW3IpCOjYdBd3IE1Oy+3lhTPNYg892iBAbAVHHBZ3Ggzn
 KEU4F1BpS+Nk/EnNYq/ch8Nrfj7q/c1gpD3IM6WxxQuo54jR1wqid4tWw
 troTLDl3uwwlOAwKPV201khdHqCIHgEfcHtzY4G9uP0Mcydln5/7x4tIQ
 uqobA0u7au4IpBc78cxoZ/KPC/2fleSup0AA/JWnQkzE8NlxSGaj27O9p
 qQzynKYsDjJOde2VdwtJMATvCRHPZPjEFkHVIIJbhTuE2OP4XhlJHpK5G A==;
X-CSE-ConnectionGUID: +9jS6p9gQsG0lXZqSS6RwA==
X-CSE-MsgGUID: m2B7NCIgQXS5by1THK37gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="69617021"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="69617021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:55:24 -0800
X-CSE-ConnectionGUID: 9CFsYTV6SrCqbqrkP989lQ==
X-CSE-MsgGUID: gOEdwsfnShCsbhbmpSmC1Q==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:55:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:55:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 17:55:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:55:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hANNdNiy+63vKoHjpuOSXUDMYQQ2hG1DrvipykkoZ2y7t7W+aTZJAyFY7zAq3dJt8eAyOkLh5Az44MsehgPCUJCdd/nb0dK88iZPA09GveiRcSQqtTh5wOlMP5a1RLcehiwEdRIZSZs4BhfNy43r/MnrpwSvbsDMHQJ6df9+CjwmQK2DzfQOJEFcJJGq49OYWjLBdqW4d8FxcV4AMe/nlmXWAmKNzWB7qDUeVg1fhPxt6oG3hpNABmrqjZMuNhIdI1Bw2FGJoKxIEPV54G9ZpW03vNtAblVdPR5LTjL4vJ5qsw1OY1yve9I2H2jZISQZgdFl/JTNt7C8Ih8aB9zSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaZad66HsgLLa5ki2yO1xILQohXHjC130r5ouQvP3HI=;
 b=kJ0E6V1pLqycJLcbIVtOCh5sbiz2O7fUotRGVE2vmtgLGi+oTwnnYK3E9fS0Y4tvUUobxI57q1dB4S6sTOCURHBUOd9NVNfc3xbo3T1eh4nycVdb49NK6MULSGXNxsyDFvSXJELKmYM/4ztKqv7YiSL/u4qddoEQ/QJ/jAe2/ikzf/YMfc1MWcJU8dnwk4NjJejWNijm/z0Q41wt4Q0wHmuf6dYCpxCRBVTWXjvr9Khx7tb5DTm0xPGGvrBOK1bG/B62sSGkkPt/2LHspEbaKEPHQdniZwK2ahv0eIOgEUVTByM4F+dV/9LoehDfmuQsFtPArKFX0ZAhJkHhZWoU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 01:55:21 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 01:55:21 +0000
Message-ID: <92fa5ba5-ed77-4906-b7a9-a4a56a866bb1@intel.com>
Date: Fri, 5 Dec 2025 17:55:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/xe/sriov: Prep for multiple exec quantums and
 preemption timeouts
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-19-daniele.ceraolospurio@intel.com>
 <bd74d348-a8bc-4723-8148-31641be1b012@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <bd74d348-a8bc-4723-8148-31641be1b012@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 5191ad44-3702-45f4-74f0-08de346a83a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnNaNXMraUsvUllwMTdLWjFQNURIZWhOdVkwcHFaZ1ZGUHVtMUQwcmhZbm1V?=
 =?utf-8?B?Z2g4dStoZkVwd25HQmNHMnJ1dU56NlUwb0h5ZmZIT1BydHVrT3haRjkxS09q?=
 =?utf-8?B?c0dNR1NLeGNsTUYwb05xdVlscUlXNXJ6dXdRRk12cUNaK0QwUXVSdW9OZ2VL?=
 =?utf-8?B?OVVIKzZhamFoclhOcFd6YXFXRFFuYlVkZ1F3ZTkyZkdCaWdnM3htekNsKzhC?=
 =?utf-8?B?UDIrbDNBUzZEeC9OT1RDLzRHVi9IRjQ2dldYcUt0TkpnQzFFQnAzenFvOXBz?=
 =?utf-8?B?WlhwcnZ5Si9CSHkxNnhhRFFuTXcxN0MrbDJxa0tFbGFPLzhiUHAyUVFkUHJC?=
 =?utf-8?B?UXEvUFpQUFlMeGhoZTZtNVQxa3hCUW1TdmpTM1V1QnlIZkFmcFY3UnptemUw?=
 =?utf-8?B?c1QrKzloVUU2aHVSMWZRZWZOQTUrTmRISmlmRitRMzRoRmM2ZmQzSHpnQnpS?=
 =?utf-8?B?TmhWd1lOR0Yrai9lQ21kcWVvSlA2OTUwZlVLdXUxazV6alFPNUU0NnZXY3VG?=
 =?utf-8?B?Y3RUVTRNeVFBay9STGxOa2c1NVJlMnQ1S0lFNlFWQUZYYXJEcStFcjQweTBU?=
 =?utf-8?B?cnVzOGk1MnBGUXIzYURUMk45M3JYR25NUVdaZm53Mi9jTXBOV2RHOWUyRW0v?=
 =?utf-8?B?akcvMmxUOVFzT1B3Nlh4WmhOK3oxUmltckpZN0haZ0YrMkgyNWtCYU1XOEIy?=
 =?utf-8?B?dlpoUTJXM3dVdTdsSWM2M3lkd0xjKzNFMTJudGs2VjR4dG1YWERSYXpZdlB0?=
 =?utf-8?B?YTJsaUdzVDdVcUhyZTBIQjdURTdyWUxac0ZkMjBheklHRkJmRGVvQ2xFa2p4?=
 =?utf-8?B?SDdnK3hvME5QQzdMYktnMjh1OW95cHdvVkMxYTdtTk9YVHlTQXFvZ1NoK0Nl?=
 =?utf-8?B?TithMUdYSG9pM2hqeDk2THFkcjhyYnhkblM2R3Z0b3IwS1pKTmhOUDhKQlFE?=
 =?utf-8?B?N2ZqY1VRYmkvRWplTk1ueEFQR085azZ5L1YxM0xuSytOdmpObVNsWlNuQUFW?=
 =?utf-8?B?cXJqUjJYZEl4QjV0ZWhHV0pkNkpCaTVKeDE3V3lTMWxudWsvZnYydlBYSWZN?=
 =?utf-8?B?RmlVNHg2LzhuYVM0U2dBUFV5VFQ3R2VkSUcwa3dqeW5hS1RUMFlMN0pYQWRE?=
 =?utf-8?B?ZHQ1dXFKNHVoY2Z6R0JEMVZKbS9tamY2UDVhSDlzQUlKcXJsbE1XTGlRci95?=
 =?utf-8?B?ZVRlak9qbUIyb3FkMkxxemQ3VmMzRjBUS0ZJd3o5aElKQno1U1JjYUxCLytO?=
 =?utf-8?B?cEQ4V3pza01sR2cxOEU1UXpRMjE2V2Nyd2pwdmh3Y1Rtc3ZxYy82Tm5kWi91?=
 =?utf-8?B?MEZSOUpnbDNMS3BiWHRUa2luSnBlWitlVWQxYlJHS0pXMWhyTmZlbENFaWhW?=
 =?utf-8?B?UjUrdFcyRE5aN0l3cC8zMzk2T2lRdUJXQWdZR2d2MEVhY0hkMUtSL1dZNlR6?=
 =?utf-8?B?YmpjUE5ndGF5S082L1BKY0xGemQzRTlQdFRUN01yTVZpYmIrdDNScit1bFZj?=
 =?utf-8?B?VFZzWEgrM3RPeWZ2Ym5IT1lpWk1oYnNnUGJqdlo1bERmeXZvdmVXYVYrZlFl?=
 =?utf-8?B?NTZSQkZFSW1oRDM2K0NPemUzWGM1WmNFTmlZL211cWgrbGR0eUpzckdoS1Vp?=
 =?utf-8?B?SVhjUzl5cTRDM1ZpNGRDRUhSc21oZzJEYS93a1VuUzJVY1lUdHQ0bHloU0RV?=
 =?utf-8?B?dGJkNUgvL2FmU2h6M01DdUxPalNKRWN5d1BhSGtTQWJiTDhMZ2JKMzZqaWJt?=
 =?utf-8?B?UThuaDU0ZGE2Tnk2aS9xN2pMZ1c1RWFlOVpWRHlPQUU5dHVpU2x2ZnRsSVhy?=
 =?utf-8?B?T3FrU2NkR2pWbFZtODR4bHlQd1ZVb0k5emFPUDNkZGFkd3F5Vk9wQmpDQU9y?=
 =?utf-8?B?M1JPT1pkbXpnQnE4K2w0NXRDcHZwRTJreWlNcTRKQ1VpemppOUJESGRRVXg5?=
 =?utf-8?Q?jg5QBTxmsT+eENLRmD3raxM9Sc7tMdoa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9vRVlwVW1ZZDFGQVY0UFBIRVRwUlpaY1FQQWJQWVVuMzNwdlR2cW9oQUVO?=
 =?utf-8?B?bTJhdG8wR0haQ3BkZ1o0WVgvcm9pWVZUM1BzYUsrVnhiSnVWUEZ4V3NCSlZF?=
 =?utf-8?B?SW1LRHVrM2xvNUZpMi91N2FFWXFmOEIxM3Y3YmZzaHJhSFJEenZlWGFESHNa?=
 =?utf-8?B?TnFsWDJ4UEdDMWRLNUdHK2ZwUGhPQVBuTGpaYkJ5bmFmSEdHVmMyaklOUnVF?=
 =?utf-8?B?bjBvVjBGOXVrNk9HQi83OWdPeDkzQk84UGljZ1BJY3IrVXdQWkZWaTVqdDR2?=
 =?utf-8?B?ZzhiemU1eGZZZ3g0V2VQUUpLZGxFOHEvRk5qQmV0WU56RUlEWGtOOUlFUTBv?=
 =?utf-8?B?NUR6UDRMM0tJZnhtcVFCUFF1dXhBNjlxY3pPVGdzZGNhK2lsY1lEaXRWRVk3?=
 =?utf-8?B?VnB4QTJqdzUwUnlKcUFYVi9RZ3JJcHp0KzZTc290a05VRjVPVXlZbjkyeTNW?=
 =?utf-8?B?Z1gxelduaHNLamVvcExmYjlNMUg5cmUxWkJkSGV6WGRmWnlpNHY4VTNleTA4?=
 =?utf-8?B?ZmFUNWpnS0VwemVLV2o4dHRYWjFHMExWWHNvUWJBZ2s1V29DUEl2cFJFd25h?=
 =?utf-8?B?WVIxdWg1d0pvZUJralhtazJvS1hZWHY2Si82Si9oeElpbEM5WlNKU3BiZE9G?=
 =?utf-8?B?bGNyZnVQT1RLUkhHNU0xcCs2YktlK2VEMjFwaHI0MGgvWlJ6UEI5eXorN0ZZ?=
 =?utf-8?B?Q3FDRExjaFFnYU9wVmdkVzE2RjZab2l5V1dtR0FrN29LVXJQQU9OTW1pS1Ra?=
 =?utf-8?B?clUyVXV5SFlXRWxBYXRRbWNkUkVHOHFKemMySDNPN2RhZEh3VmhUbWYvdkln?=
 =?utf-8?B?cThjK1E5cGR6UjlKNE5QZnk5N0FTbHZEZGxtMXNYRVE4clJmNndOY2d4WkJ0?=
 =?utf-8?B?S3BCZCtSS0xUNGNTbU1DZnVqeE9tczlOaDUzZ2VZVEVIRmtWc3RtVGUrSkNZ?=
 =?utf-8?B?M3BwTGRCaEx5UWtGTXRrYSsvbUdWalhPaU9zSDB0SVl0MFhKMXg2MmNZOHNV?=
 =?utf-8?B?VUl3VXZUWDUwVitTYk9jZXhlbFBjSkVNQXg4OGV2aGRHTWZaeTZpU1cvd2hW?=
 =?utf-8?B?WjdRU0VNSGZsbUIrQ3I0bE0zSHRVTGt0OSs1eVdnQmFiK3huVWw4eHpobE1a?=
 =?utf-8?B?RXRCZHhRY3hzeTVvK241RUR3ck55MnJTWk45WlhjSUxlNDd6VUZyZEZuUFNt?=
 =?utf-8?B?dVRYLzlaTWlVV3A0Q2RUR1NtTXR4dTMzL0JraVBwb1g4OUZVWWNDRWdBYkFO?=
 =?utf-8?B?bnNQSEVqTnhZaVVJLzBqckFBRGJ6b0VnUGZ2ZUpmSDQyai9VcUIrbFg0ODV2?=
 =?utf-8?B?SVVjWHVJZmRjb25MS2tESlJlLzlDVEU3N1lRVU5vckxQWCtienN6UFJ1SjFa?=
 =?utf-8?B?NmFQRjZGU1JnQUUwWTB5bElvT29qeTNFS1pBVUh5SWV5UEZrZHgvSXEwTWtw?=
 =?utf-8?B?WmJTQ3Jjd2dyRGc5bkFPTHIrR2tKVkNTVTd5UFdrWDR1akdvV2QwMlpGZ3gw?=
 =?utf-8?B?TnRRejBQT0FyZUYvNnU0bmNNc0VUTU5DRXRZMHFFbEd1c1dxU0tiS3NLNWln?=
 =?utf-8?B?andlZHhpQUtWOXh6aHNaQnMzRnRDbWFnUVgzMlFCSWFYc0tFR0h4eWVlbzBI?=
 =?utf-8?B?M3ZoMDdObnRlNWFCM2FMRlBhVEpJamxaSi9HUy9ld3doMUlLdDByS0hVd09Z?=
 =?utf-8?B?ZVZtZ3FBanV4QTRweE94SWRzQ0FLeTAvQisvVC9oZVd6cmI2TnRza2V5Y3JZ?=
 =?utf-8?B?Ymw2bC9WTTJHWHJmeHNUaDV6ZEZVemhGczhiVnBQeSthQnpOb2xid1Q5ZkFj?=
 =?utf-8?B?eWRWdW1tVDVGaS9SdzFGOEZVaG9lcjVLNmM5TzBiZlp0RGJIbFBCZGFQa1d5?=
 =?utf-8?B?QXpBcHBCK0FGeW1NRVpYUi8zVldjNVErWTUvUzVJUUNMbWdQcC9sWEZrNjhs?=
 =?utf-8?B?WUVHOHV1K2JFblIrTUpYdG1ZdnhaWDlabmYreFl1bU4wSUZuQzJodmlKYzVD?=
 =?utf-8?B?Z3FBdVV5SHE3QTlDV1NXNm9QZ0RKNkdCaFFkaXhtekh5aWFPd0NPNmpUMG02?=
 =?utf-8?B?Wms1YVJjQ2UvblVxMy9CSklDMm1JWlU1TWpkaU5rTjltTFM0dkk3R2ZPdytQ?=
 =?utf-8?B?UDdGR3hDc1ZDK2FaNUhaaDZIZG9sbUkvZXdsS0MrL0xQc1dUdFgyRmZYRFBP?=
 =?utf-8?Q?KoNO/t19bMh+kFctPMgCm3E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5191ad44-3702-45f4-74f0-08de346a83a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 01:55:21.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgIU7hct7dY4yG4HLJLM9xTugO9lcF2mmoNihoSqG626JToKULCPAxvGbu+lgafum+0G3Zt9FxNaV70gSKLWwPNSKyg5Ip46Y4EQ99TZymg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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



On 12/2/2025 8:42 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> Each scheduler group can be independently configured with its own exec
>> quantum and preemption timeouts. The existing KLVs to configure those
>> parameter will apply the value to all groups (even if they're not
> typo: parameters
>
>> enabled at the moment).
>>
>> When scheduler groups are disable the GuC used the values from Group 0.
> typo: ... disabled then GuC uses ... ?
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  7 ++++--
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
>>   .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
>>   3 files changed, 25 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index a6dce9da339f..48f47e26132d 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -290,7 +290,9 @@ enum  {
>>    *      infinitely long compute or shader kernel. In such a scenario, the
>>    *      PF would need to trigger a VM PAUSE and then change the KLV to force
>>    *      it to take effect. Such cases might typically happen on a 1PF+1VF
>> - *      Virtualization config enabled for heavier workloads like AI/ML.
>> + *      Virtualization config enabled for heavier workloads like AI/ML. If
> start with new empty line so it will rendered as separate paragraph
>
>> + *      scheduling groups are supported, the provided value is applied to all
>> + *      groups (even if they've not yet been enabled).
> should we document also here that "The scheduling groups are available starting from GuC 70.53" ?

ok

>
>>    *
>>    *      The max value for this KLV is 100 seconds, anything exceeding that
>>    *      will be clamped to the max.
>> @@ -312,7 +314,8 @@ enum  {
>>    *      In this case, the PF would need to trigger a VM PAUSE and then change
>>    *      the KLV to force it to take effect. Such cases might typically happen
>>    *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
>> - *      AI/ML.
>> + *      AI/ML. If scheduling groups are supported, the provided value is applied
>> + *      to all groups (even if they've not yet been enabled).
> ditto
>
>>    *
>>    *      The max value for this KLV is 100 seconds, anything exceeding that
>>    *      will be clamped to the max.
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 59c5c6b4d994..eb547fedb6da 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -298,10 +298,10 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>>   	}
>>   
>>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
>> -	cfg[n++] = config->exec_quantum;
>> +	cfg[n++] = config->exec_quantum[0];
>>   
>>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>> -	cfg[n++] = config->preempt_timeout;
>> +	cfg[n++] = config->preempt_timeout[0];
>>   
>>   #define encode_threshold_config(TAG, ...) ({					\
>>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
>> @@ -1857,12 +1857,15 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>   	int err;
>> +	int i;
>>   
>>   	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
>>   	if (unlikely(err))
>>   		return err;
>>   
>> -	config->exec_quantum = exec_quantum;
>> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
> maybe:
>
> 	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)

ok

>
>> +		config->exec_quantum[i] = exec_quantum;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1870,7 +1873,7 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>   
>> -	return config->exec_quantum;
>> +	return config->exec_quantum[0];
>>   }
>>   
>>   /**
>> @@ -1987,12 +1990,14 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>   	int err;
>> +	int i;
>>   
>>   	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
>>   	if (unlikely(err))
>>   		return err;
>>   
>> -	config->preempt_timeout = preempt_timeout;
>> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
> ditto
>
>> +		config->preempt_timeout[i] = preempt_timeout;
>>   
>>   	return 0;
>>   }
>> @@ -2001,7 +2006,7 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>   
>> -	return config->preempt_timeout;
>> +	return config->preempt_timeout[0];
>>   }
>>   
>>   /**
>> @@ -2180,10 +2185,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
>>   
>>   static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>>   {
>> +	int i;
>> +
>>   	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>>   
>> -	config->exec_quantum = 0;
>> -	config->preempt_timeout = 0;
>> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
>> +		config->exec_quantum[i] = 0;
>> +		config->preempt_timeout[i] = 0;
>> +	}
>>   }
>>   
>>   static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> index 686c7b3b6d7a..abf003946242 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>>   #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>>   
>> +#include "abi/guc_klvs_abi.h"
>>   #include "xe_ggtt_types.h"
>>   #include "xe_guc_klv_thresholds_set_types.h"
>>   
>> @@ -30,9 +31,9 @@ struct xe_gt_sriov_config {
>>   	/** @begin_db: start index of GuC doorbell ID range. */
>>   	u16 begin_db;
>>   	/** @exec_quantum: execution-quantum in milliseconds. */
>> -	u32 exec_quantum;
>> +	u32 exec_quantum[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>>   	/** @preempt_timeout: preemption timeout in microseconds. */
>> -	u32 preempt_timeout;
>> +	u32 preempt_timeout[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> maybe we should rename
>
> 	GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT
> to
> 	GUC_MAX_ENGINE_GROUPS
>
> and make it independent from KLVs and define like we have
>
> 	GUC_MAX_ENGINE_CLASSES

ok, I'll do it in an earlier patch.

Daniele

>
>
>>   	/** @sched_priority: scheduling priority. */
>>   	u32 sched_priority;
>>   	/** @thresholds: GuC thresholds for adverse events notifications. */

