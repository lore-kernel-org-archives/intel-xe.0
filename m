Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB925C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 11:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837B410EAD6;
	Thu, 17 Apr 2025 11:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeCCzdxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9710EAD6
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744889995; x=1776425995;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ruIOLhdyjhYyCsMt+Ou3hJKh3ntqdIh46yiGp9bpK4=;
 b=QeCCzdxBQTB7MkRSzfm32MXZikImPriMtkHR0bkxiZLSWRtnwawWd3HE
 T2OfNXG9B3pjU6NFqtOLDWRpJt5gCmDXYKwkzGAQ42m7Y0sT8Q5uLZHcZ
 utx1zemxdIPNGjegSzWxJ2iW49qYIpRVayrGJkkGXBm+MHxq020EMj1o3
 q82YgOz/Y/V9qpD1BqSENo2PMOVCsWBQpTeeeu/fO+i2nSCbhC+zF8xTQ
 D0SB23CKuCwHXtIeLYecPzaQtS845Vl+PUkQ0m+LW4QbmBSQ4AjO7Grnu
 qLkGCCni4exw22zWl1l4UuJr9jS7L8LOj5vqN19SIatNYNvbdQvuQhCUv g==;
X-CSE-ConnectionGUID: Jmy2g57YR5menUNmQMhjhA==
X-CSE-MsgGUID: oH4+ji8LRIW4YZ/i0uxBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50293255"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="50293255"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:39:54 -0700
X-CSE-ConnectionGUID: FAzCkTUZTiWt/Yfa8E/hkA==
X-CSE-MsgGUID: SWqzUui9SZOr4vxS2eR3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130737570"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:39:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 04:39:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 04:39:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 04:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwIicpIY5ZilQZJsRWOdzU4RgKzvBc1pjlSS5xzAiyyB2s/kI/KONq7BXecrlOF7bovN0B6sNwBY0W0n/EuO94IOLJNTyve9nUPrLrIGpHckG9qeM7uPpJH0IovpgZ6OJU8KwF9ifRmZZfH0e9qYmbomYJGKumDgSeBXMM5agu4DbfFvxQrOW5naOt3eUFU0UcayT8OpLWBrGDSf7epKloJ4IrIfLJT+g28Y7EADqJwMdiYFTQksigAz9Qp8w96+3IY0chrROB1L5vtvGPfludnZpqJW8j/Xy2+sIqs8S7SakuWdCwKoiN2ao9heJg97y6zeoi7mm4RPWach6wi5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1xT9r17SfMKNkXIhb1WGy2FBd8DD7mo2K6YhNSrmJU=;
 b=KmpYEK0h9q4GO1V8TGukYvgdJFK9Eirck70+zWQSu+BOBm4EmIIODC/vlqWO/jCy1PbhQHUnWKPDgJV1/kVKUA43vaddbZ3VPhJFgRiKHjdOHOK8piwuk6k1/70D0XG8rK1ltcc1CDeU8atUp2UCeaKhq6I8LZMCML5OxEUg68K+8im22f+ys6GkZnefbhSKMejD3NePFyA5fGeQPHdwWT5Cp0KPi/c9ONHBygiwHmKCEFnS9psiU8lHFZYvx1SLkJ10OBFeYFyY2AgmURyCmv/+kKXYMdjTmUZbe22DtG7Vzq85regTtR4SXku6VdelqKWI1BhXzHC4QmxxruV/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Thu, 17 Apr
 2025 11:39:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 11:39:33 +0000
Message-ID: <1f2ba593-7cde-45e2-bb21-72f251a60845@intel.com>
Date: Thu, 17 Apr 2025 17:09:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: s/xe_device_sysfs_init/xe_pm_sysfs_init
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-2-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250417111233.2322000-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eac3abc-00a6-4b00-fd97-08dd7da4861b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmQ4TGZrWnlhOUZ6MzVhL20xNWFzVDZLZ0ttRlhCUzZiakgyN0MxYVlRdFEr?=
 =?utf-8?B?NVVHNVJNWTlqVWxPSVhVQVNWWG1udXhLeEJteDlSTDRoRXBQYTkrTjVadjQx?=
 =?utf-8?B?WTlYa0NqY2FOb3JNNmptUzlnNi9PNi9qQlB5UitIMmFYU01WRW1obWdIRHJG?=
 =?utf-8?B?S0pCbE9WRThqNytCWHFwOFBiOFVJTloveVk3dzYwczJLb2x1Zkl1ai9uMmU0?=
 =?utf-8?B?MlBmSForUTB2NFAycHRGLzhuclB1QXRkTWxTdno3Rng1NDZGcFlidlgyakFR?=
 =?utf-8?B?ZmduZTNxT1NzWGpPdGxpVEI4VnhYeDUrRW5MKy9rS2R6VEJ5MWthUjNJMWdD?=
 =?utf-8?B?bityWmdYNzlZL29Fbm9ldDl6UnVJOEdXblFiRXN6bWJiZlQrQkIxL2xKaXBV?=
 =?utf-8?B?djU3elcxUlcwRDFaanRZU055R2NjVHNDNEREaVBzeXBHL2N5K0tTN2F0Q0N3?=
 =?utf-8?B?TW9Bc0JtcjczcW0yV2lDZTREaDZKUy90YXIvUzJTdlB1SS83enhvZUJRNUp6?=
 =?utf-8?B?WjFlaDRFVHkwdm5sZXR3b0RmNStWRmZuNDZNd2xnZVllS25saFNWci93Rkdz?=
 =?utf-8?B?SmhGeHBZbUFha0R4WUY4WllXUWxWNFgvbzRIN2pwbkRlTXhGZ2xmdEtFV1NX?=
 =?utf-8?B?TTRTZmEraHYrZmJiZnc1UFQ5dUJiSldFQkE1dEd3d0JGZ0ZlQWdoSEVzeUtX?=
 =?utf-8?B?QVFPaEsyWjRZUzYwWDJQblhqd2lBVUNrakwzcWNibmlzOEhHWHhvdjNnWHRO?=
 =?utf-8?B?b1NEeUc3aEJCaHArWENnMzZ6VUc4c0tRZW91MXRjYTNTZWxURDB2Um0waklI?=
 =?utf-8?B?WnB6WEY5RlN6YlgyNjRKUS9nUkEyVEFlY2N4Q3JRaFNEblYyZUlBU2VOM0Np?=
 =?utf-8?B?S1pyOUdUc2FmRzJ2c1RUT0JYOHowOWNqV2oxalJHODZZTVRrMGswQjUrek5E?=
 =?utf-8?B?YXAyY2l1a0ovLzRONGZYbWhiS3IrdUJ6N2NwNkxLajNLRU4va1ZKUSt2NDRE?=
 =?utf-8?B?MXZjQW5qZFltUDI4UHpZaDIyZHU3YU92c2VTdXZpU2FLK3JrcjV4cXNMaWVE?=
 =?utf-8?B?ZmxpL212cDgwNUM0bFErbm5qYWlBN2Jobm81Q3pGM0NMbHQ4M0NLL3Myb0dJ?=
 =?utf-8?B?R0RrY3p5MXpCSkg5TFNnbkh2Vm13em13emVHbE9sVWc4ZTdKdTY4K3lZbkU2?=
 =?utf-8?B?Vjl4dTBhVGdYNkUveEZiQlhJMWVxM1ozdUdsaDZveGJwdjA3RVNMbTZBRE52?=
 =?utf-8?B?eXJZT0xCZDEzTG5pRkZmRmU4Qi9NRkZpVldHbWdsbWJwRmlERWd0VitEUWpS?=
 =?utf-8?B?bG4xMExHMFRuTzl3eFZyY2NudEV2aEluQTM4OUNFb2ZsTC94cmpLQ1RMNGoz?=
 =?utf-8?B?STRxRkgvMzJmRFhDV3JzQmZLVVUxRCtSQm5PSWlMWS9HVFFrNzJsM3J0ZUVZ?=
 =?utf-8?B?bkwzS1M5RElFUnhjNHc4OUg0aE0rR0ZzVVBMSkVkeGg2VWNkRTZHNXZFdnBQ?=
 =?utf-8?B?SGlvSkZPS2JEUlRaZXBxamg2SWRzL2JUekFEbldjT0poNFNKMjNPMUNvR1Fh?=
 =?utf-8?B?SzFkNU1WL1BqNGhKNGNWMjc1OVhsemp2L3FWRHlVSGZwMUYycnNmUXArdVdm?=
 =?utf-8?B?V3JCZVo2eHhOQkJoSGpqVE1NS2wrRmZCbU1aWFJYNzVoSjB5NkRtSmhhSEh5?=
 =?utf-8?B?NVdWSUtrM1pHUUg5TEpuZ21lV1plaXdlaTVpUDFTWkpnY1RyYk9vekdHc1RM?=
 =?utf-8?B?azFEK2txTzNnb0txaTF4SHZBVFZNVjg0ZjhJd01tOUo3OWFqY3VrVzdkWmVK?=
 =?utf-8?B?dUZrUHdjTis1NGMxR0swM0hwb1dvVEVGT05UZ211cTFOL2RWRis0d1VGUGxZ?=
 =?utf-8?B?aXpoVFNLNDYvUFVIcmxiMzRqOWtZV05tS0F0akJnRVZMbFhVMjY2a3ptN2Vw?=
 =?utf-8?Q?ATybeQuzo20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWVIUEZFcTEvK0RSOHpuYzNlZnF1Ny9TcTNLcmVBOWdGeHVJMmk1ZXN2Zk5N?=
 =?utf-8?B?ZDZjRmVuQnE1YlNZc1Z5RUcwSVNod1hSbERyUDdweVUyVG8waEFWcExhNVdq?=
 =?utf-8?B?clFuMSsrTGlDd0VkSGp6S1d5OXVOd0xMVktwOTZiRGhmL2ljYlFEcFNmajdn?=
 =?utf-8?B?SWQxQmoxcVpnajVoWDVqcnZOS0RhYnlCYlBCMUJpbWhrYmlReVFxNWdoRHg2?=
 =?utf-8?B?SE1UQkoxL2ZLQVorNUQwNGhRdGZ5NVl0SFVZNlB3SXNyR0Rna24yNHJiZ3d1?=
 =?utf-8?B?SHFCZGtVSHVhNUdZOWx6TEorOFVrdm9YTmVKMmJHUjRQU2JURTFaNlBLOS9l?=
 =?utf-8?B?RmdUQllOUVBTYjA4SHNUNkY5Tk9qK0xpci8rejRoWk1BV0lZV2dZZTFxNXM1?=
 =?utf-8?B?SlNqbW14SkVibjF0VHBBK2psTXEyRElLWWRNQ0RTY2JwMUpjNXJuQXpTaGZv?=
 =?utf-8?B?M1ZobGVObG9UQlpnakUxaEQ3aEx5RDIrMmdZcXZPMm1rUm1QaWltUWhQRUVK?=
 =?utf-8?B?bHd6THl3RFNFSEtPTlUyM3MzdHlnMFh1MnMrWnE4V3luSFlYTS9HcllHRFFv?=
 =?utf-8?B?QVNhQ3Z6SXdkckZGcGNFUCswcldnbHFjSXc0S01VUVAwWVpFZS95K0ZrMHl3?=
 =?utf-8?B?cHFmcm5iRERrYTNnbS95YWZHV0Q4aFpmYUlsUTFLZmMrdFdMYzhWVnZXUEJ2?=
 =?utf-8?B?RmZHckhIdHdXUGNJYTRtNndDRHYwWW8vNTExNDUvcldNUXMwMjFXSDZ1TGpm?=
 =?utf-8?B?YytEdXRPTExSOEV5UGh6eGRDdDcyT3B1ZXdMcHNZTmtsTEZCTTVBNlVyUFgz?=
 =?utf-8?B?VDc5QVU2WFY3cCs3ZlhGTUZoY0VlVzhsSXdCZTdxa1Fva1JMZ1lNRmxHZVhh?=
 =?utf-8?B?WnhSbk5DSFJhMUNHV3pBc3k3UlVWdmdRM3ZMWGQ3VVQrNllTSlFIc1NPdFda?=
 =?utf-8?B?S216clU3bU1VZ2JuY1lmOWZUSkJXTCtQT243N2lOZHZWQ2R3Q2pMN2FBQWlI?=
 =?utf-8?B?OUgrU3BTSjBQa1RmWWc1UTIwa2YvbTExRnFscGhqckZIbUtZQ01hdzZTU210?=
 =?utf-8?B?d3JBVFFIZ0lUS2VKZi94Ym92ckQwWmZxdlY2OUdML0xadS9ESUtJNnk4cUZS?=
 =?utf-8?B?eGlTMStUVkZad0haU09qbUxDNDhZdUFLdlU1b0VnbDhaRlNEbjZGbTd3MTdG?=
 =?utf-8?B?UlUzK0NZSEM3UjlZNnFTTW5PUkdkT2pIVk9VYkl1dzljRyt1eWhLZTZCdU95?=
 =?utf-8?B?WGZwUGNVM0UrUjN1VnZLMDlqT2dKYzV2cjF4V0xZVURPQ2MyTitIa2FwbklO?=
 =?utf-8?B?TmViYWJNUjlETnVKWUZCekQ3dkI2S1RVK2ZGNVJLSzB2ckpiYjQrZnByQXRj?=
 =?utf-8?B?d1dCOE5zYlRuU3JKZi9FMEw5R0xRM3VUYlFHcjhYOVA2bkQwRmkyaTNRditS?=
 =?utf-8?B?RFp1K3ZJMEo5TWVUN25UR1pTcDRVaDcvZ1grQ1NFdnQyMkg3T2N2R1c3ZDVa?=
 =?utf-8?B?Znlsb3ZUQ1AxZW9JZEgxcWVLUlBsQjJwUjNzNHN1d29ET09FdEh4TTQ3UXdl?=
 =?utf-8?B?ZjZLU0lDb1pRRDF3U1RqUHAyeDFiVktiYXlXQ3FOYndUMFhWZlVXL083TkxM?=
 =?utf-8?B?cWUzR2dURVJBcXJDL1hpbDU4V3l1MXJ6TWxncVJDL0JyREErMkwvQXE4WmZh?=
 =?utf-8?B?S25KSlg3aHZwTUpSb3g4V3BuTDREeFVIblBxeWhVaTZ4SHhONHo4SEplWVRE?=
 =?utf-8?B?Y0lMbkRpbEM4Z0VNMHV2SENoNWlyUDAydTgwVGE0UXhqN2RScHdPS2hSdlA5?=
 =?utf-8?B?Q05OdEZLSWt1cXJOQTNrdVRudk5qYlRRc0lGWVMySDFodUM4VDRGUjAxK2dq?=
 =?utf-8?B?Wjl6MGlJaXM5L05vVkNHcnM2d01uaUZKMC9mQmJBVEdzMVMzWHI2QjFYR1Na?=
 =?utf-8?B?dFpqWFlNMDlZbWtyVHZEQ0d0aHkrSTRCMjdSam5ORThSSkVQZGlHM3pQaGhD?=
 =?utf-8?B?TXRNakR6Nlo0cVRQN0JTWlpaeldFUzFpV2U2MitGak9vRnJHSHJtWDJKNmJp?=
 =?utf-8?B?UlZxVktlWFdEcnhHSXNVd3ZEYTNPa2U1SXNZMGdqOXhvanZ6STE5S0dpYXo2?=
 =?utf-8?Q?fMq70P31QYztvDsZLe4s6rz8y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eac3abc-00a6-4b00-fd97-08dd7da4861b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:39:33.8504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjgRz6x0EPMAKf6wlhjgzUY9V9Z92SA/LUetuLmG6kb3rHcr0FxH9CUJtPHpRkhydXNG7r3b9gjGYV4DX1ugcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
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



On 4/17/2025 4:42 PM, Raag Jadav wrote:
> Attributes being exposed in xe_pm_init() are PM specific and should
> follow its naming.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 6 +++---
>   drivers/gpu/drm/xe/xe_device_sysfs.h | 2 +-
>   drivers/gpu/drm/xe/xe_pm.c           | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 7efbd4c52791..2d25e5b5d4bf 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -63,14 +63,14 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   static DEVICE_ATTR_RW(vram_d3cold_threshold);
>   
> -static void xe_device_sysfs_fini(void *arg)
> +static void xe_pm_sysfs_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
>   	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>   }
>   
> -int xe_device_sysfs_init(struct xe_device *xe)
> +int xe_pm_sysfs_init(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
>   	int ret;
> @@ -79,5 +79,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> -	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> +	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> index f9e83d8bd2c7..2c1fabdba9e4 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -8,6 +8,6 @@
>   
>   struct xe_device;
>   
> -int xe_device_sysfs_init(struct xe_device *xe);
> +int xe_pm_sysfs_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4e112fbacada..3a3119c3f7f4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -306,7 +306,7 @@ int xe_pm_init(struct xe_device *xe)
>   	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>   
>   	if (xe->d3cold.capable) {
> -		err = xe_device_sysfs_init(xe);
> +		err = xe_pm_sysfs_init(xe);
>   		if (err)
>   			return err;
>   

