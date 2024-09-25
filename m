Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DDC369CA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 10:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF0510E7DD;
	Wed, 25 Sep 2024 10:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxeka8lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C93710E7DD
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727260217; x=1758796217;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A7jlxEtwwGGqlCAYuMyG0C7ONZLELe16Zvjhp0t4cQI=;
 b=cxeka8lZXQ+JVsdFdGD7gDmwuMm8Fbz7Zo7C6ES+RDVTJ2gAOsLjAb40
 KetnMVMtYhiD7ey5Qn9+CXB+RRYn3CqR71zU0rK8pcqYAmfhAXrDVADSN
 Vorz1Mo07KR73Yl4Dm8DM3oBujTmcnFza5+Ifw4BU0E1z/975tgSHP6ab
 h1TMVQQhw6Y2PQ0/CCjPXmV/8WlPY/2g6n/I264xQm7ScFDiQLH313euG
 cpxSb54X+YYohJtOned8fhUQ/VTKKX9A8RMBdRbIMLk8sRE9nFDeM26hR
 S54GSX0w6d8iwaP8vNwukMilX9dIJupkqLxLquhtHnm5vD5ziI7uCZCmi A==;
X-CSE-ConnectionGUID: vCGYLYQfSYiBduJnP0S3cw==
X-CSE-MsgGUID: qHnqqOZcTs2fuSN/2evxJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30008695"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="30008695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:30:17 -0700
X-CSE-ConnectionGUID: HHFbocxOSKSnp1sYcMz8Mw==
X-CSE-MsgGUID: yDxAZAiaTLCawcp9XRLycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="109189304"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 03:30:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 03:30:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 03:30:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 03:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlymt1l64L2EQySeDLWx5u8z6vfDHpPcbUxW67nKpYm3qn1w6dVFIR7c718gcaD61naxsXJQJfv07kmMmYp8nCrGXvdx8njkNobvxZqqrsyRQt0l2XXJ+Aza9dw6uipzAkDze7cRZHERIakiPPYN2O0HV1uQrD6H4KGnb662bJUNKuhz90ZlwcM90SnL4pwcaOb4PT04dt/AfYoiJjosxf69Wzu5TxrFA61uRJ6aqTJ93DKRVr3APmn6pZ0HFFdjI9FryKvySHd4j2H854NkB3+g0zE8qhWFnIXqHU9NFqPPHUNcHquKUg0UHHrypHP720F+WRAo2bhjiKN1OebnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIekQVkZJX9mgWiHKfmWDKsw1SA4aa0pYqf4R/JXKk=;
 b=raFcrBnuyc8Tzj+yPm/Gf5BRv1bW7sEKLffafmgq0PvDV8bSMD/9Iy25YcTSOQq1rUMPhA+Ch4oPiuR3aZDBJrzG0zwF6m74uo4ZjEUa7uecbNbzltQg3clteZQ1+cTJx8gC7efvulCBVPavaHvds8gJC87ZQ1inNkTZLbGC/e3C/Rv4kn7cX3SYGjIA7SUnJ9VI/GWEo9cL9dDAQmt2Y9+0/WvqZ4shrQf8vdeiDSfudN/Jm8Z5Jvnq04eJZWXvYvGvfLHWC12CfVkArtmSv57oMNtqU6zCxTuokXM6memWC5/KevIMhweTNl95XJY46aNE4bipB6jm9t8xzOdYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 10:30:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 10:30:14 +0000
Message-ID: <6cc820f8-195d-4893-9383-58c1b795535a@intel.com>
Date: Wed, 25 Sep 2024 16:00:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 754f13e2-5e9e-4476-31f2-08dcdd4d0ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEFocnVIRjY5Z2FMMWtlYVRNd3FHRDYyT0oyS2xrZ2Q5ZjJXcjEvTUg3SHFH?=
 =?utf-8?B?aXRIRTVZTCs5U29taTZuME1KSnc3d3M5eXVOVHJhNE9oMjZTSHpER3dQRmwy?=
 =?utf-8?B?OUF2amUxOUZibU9nL1VIdlpsRE84Y2IzcFkxeTBEVDRDY3ZCWVcvOUhOQ0w5?=
 =?utf-8?B?amJ5YzROZm5zVUUwRFNkSkZMVHI1aEYzVTVxazNEUEx6a0NvK3E2NURpZnVr?=
 =?utf-8?B?cldBTmxucXNiQkRNbStrZEQ2K242L2pyWXo4amQxcnIyKy9Pamp5c0hISlV1?=
 =?utf-8?B?WGxzSjVTcmsvWHdNODNXLzZNaDNRcUU5L1h3WTNoNWVFK0VINGpkN2hOeUNF?=
 =?utf-8?B?c1lsRWdpSXZmeFFxdU5CUUgycU5ySlQ0c1YzbktIaGRkQ1VvTGRFWEIyZGtZ?=
 =?utf-8?B?Sm1oUGRjNGpVeVU1NFRZS3FzdzdlNE9DcFQ3TjJ2aXdYdzJXcThES28wc1Ry?=
 =?utf-8?B?bGJKRFJSK0o0N2JPSEF2QmlNODhBbFZ6NUZZS3orQyt1RFJjS2gxQ2gwZWpQ?=
 =?utf-8?B?RHBxcGIvS0hFb0syZTFNNXpvTlZONzhRd0tIOFdVN0M2dlFyRGZaVXAzOW1x?=
 =?utf-8?B?QVNPRjJZNkpjMlFEV2NPMkVKa0FZVVhyOWpHT3NsdGFiVkVRc083N2hKcGhm?=
 =?utf-8?B?UEtCU0FIdzRFaHZBWXEyNXk3SysxKzU3cnVlNmRtQ085Z1NVQlIwL0ZuTUdT?=
 =?utf-8?B?NEZFMzU5QU8xOUdqc0NNS1kzTXZiOEVOZjg0U0lxanRjbkNBSnFTVFo1eGFm?=
 =?utf-8?B?MjN0czhlUi8rNUMxeDVtYkpjYURMdXdpQlpuemtYTnB0Nmg0VzlDamVRdktQ?=
 =?utf-8?B?cFNJVzk4Nnd1UUMrVWd1S0x3T3JzajBzZDNoN2NVQUVhaVNYczVaRmhxeGc4?=
 =?utf-8?B?R3VhSnJYL3BPeVlLQjlZUlg1SHpiMjNpTVdMajdwM3NmNENsOWhETTdWUjI2?=
 =?utf-8?B?Znd0THB6aTNXcDhMU0doZzFHTG1uM3hxRWREMlVzdll6dkNMamszNUhtZkR1?=
 =?utf-8?B?VWxZbjFGWnAydnNVb2xvRnI1SWJXOWhtRzVUZklhQnpHMGlOd0pENi9UUHhk?=
 =?utf-8?B?bHNZNU5Wa1NmNzM4aFV0NHh5ZFdoTk5zQkppTlpLL24wMVpVSXVIUVBXR2lE?=
 =?utf-8?B?S0NpNHc5MVFBeW5CRWRieVdHRXBVa09BVWlFaTB3L0VBYjdqVnZnaHBZUmpu?=
 =?utf-8?B?dUQ4U3JvcEtNcVB4R3RSdDJHMHYyVDdNOXNONmFmaTNUazJxL2syb1FGTE1X?=
 =?utf-8?B?REh1RVNTK1RmaHh4Y3dML1lJR0JFVkkwbmhzcGJ0a0psWWpVVzhGekRic1Zh?=
 =?utf-8?B?V2ZPc2RmVEJjR2FBWVp2M3k2TXpaVTZXWUFNV2xKM21HQTF6RUtUUHd6M3BI?=
 =?utf-8?B?by9Qc1RObzVLS0c0dzFHb1RHVFZtRXkxQzQ0VmxBL2RrOTFlTjFJM3phWlh0?=
 =?utf-8?B?aVZYQ3hPbllkTytERUY2RExLbHNKd2p3R0VTR1FsSmo2bXhhblFhcGg1MlFz?=
 =?utf-8?B?ZUQ2NUQveW41VVZkdmlaZGhKOW9PM3VIQzdWOFpnb1pnb3NHZEs3M1c4Szc2?=
 =?utf-8?B?Y0hFalFUT0tKMmxBM0JIbTJOeGhob1JIdHk3VEdYQjRPejFsOFZxU0dqd3oy?=
 =?utf-8?B?U0h4dW5oOEpxZEJxZzk0ZjVUTlRISXZoV3BlTU0vN0tXVTdSK3ZOaGswY09B?=
 =?utf-8?B?bXZxRUQ5NUthM2JYZmZVWCt2OXh1UWpSbnltdHRkeTZlWTRPQUFnRkc3SHdv?=
 =?utf-8?B?UmRDTTI3a3NsanNIa3phLy9xL2ovb2k4T2RMYldaNVVHSlpyMXJKM29Fb2d6?=
 =?utf-8?B?cUllVElVYzdUcmNlRk02UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V250czlYS0ZoQ1JlbmtnZmJOOVRnSFpkU2h1b3I4OTBjN1c5SC93ZXBQQVMv?=
 =?utf-8?B?R2Y3eHIvMDgvNHYrR1k5RnpzZUtVV3ZjTUIxMU9OU05rVDJZZVZENnZITVBv?=
 =?utf-8?B?OXdTQ3JrdjhnWjBxbTRYOXhVd1RqQ0hRWTFZZFFPZ2hBOEZyQzBqTWRVSFRJ?=
 =?utf-8?B?OFpJdE1zNnV5eWJMTE1lY1M1ZU4zd0VTai9yNTVRTzU2dGFjSDJTSURyOWhM?=
 =?utf-8?B?TndXZFptYXNwa2ZiTlpKZytZblB6SDVEdyt6VGkzc0liWUE0Y0ovVmpaakFM?=
 =?utf-8?B?c0FKaEJSb0VTVjB1L2ZmSVVzVDd1aDJiVkxENG8wenFLempDeExkVkdkSGxu?=
 =?utf-8?B?SGZybXpWRW9BRDl1UW9ua1FOQ3Z6eS9EMmpqTHZRMHUvMXFmM2J0MWdXejls?=
 =?utf-8?B?bVFTZUIvRHVlQmdEVzlSbHg5R3Z3V3BzN0xOa09NcVV4TFU0YmVTUzZZSE0v?=
 =?utf-8?B?YjhSSkREdEh5MEJaYkk2VndUYVl6TVBGTHVUR21QQkZmbUN4UnorNjlzbGw0?=
 =?utf-8?B?K0Vqb25YUyszTWxGbzZ1KzJEUTQzVmRwNWQ1TWFMekR2MCsraE1RT3FicElX?=
 =?utf-8?B?MVlZSDlOZHpHbFdoZzYxN3pVWnJ5eWsva1k5ZG5mUHNNUDBTMldGZGxuRVVJ?=
 =?utf-8?B?SUh0RnRUQTR3ZHg2TGJ5dGQ4YURmRXlZc09Jd05hbENMOGFhUGlQR3R6dEVS?=
 =?utf-8?B?bzAwZGpvaDhDU1lFMWRKVnZBT2hEWW5CNWYxc1d1TVdlZzdTSzVtdGhwcit3?=
 =?utf-8?B?NkVTL2NBZ0pYL2ZEbWFMblVLUDhTSklhdTFHWTNIc052NmhwdFlSU3lTM2tK?=
 =?utf-8?B?UU5qZUxMZCs1MVFnNVppcG9PRHovR3I4WlpQQnFxMHFNWHdkUG50UzNmcity?=
 =?utf-8?B?Y0VBSTIxZ2htK1NuaE50RnBoT1BsVlFsbEFsSEM5M0FGNWJtTlpqSk5BM2kx?=
 =?utf-8?B?Y09LVzZESGNSK1cwMHNOMG1OcUFlQXZOT3ZLMjFoVlc0OVFFWkgrdFVYRkNj?=
 =?utf-8?B?QWNka2JrbGFPQktYWXRRdHp2MUF5UDV5OHNJeERiTXZvaFZuZE15Q1RIazRW?=
 =?utf-8?B?RjRmQUhBL0U0ekhOWXVvMGtlTzE0WUFtRzM5ODVnUGxlVzRQa1k5UkVxQTFu?=
 =?utf-8?B?YWxYWkE0QjUwaDEzeE5vdzJITUxRL1RsaWZGdTJtZlFPUHRDMjJydkxKVjRp?=
 =?utf-8?B?QVRqaDZaNkR1R0FpeHNnVkl3UndCanFpZiszbmdLa2x0WStsaUwrV2Y3UW9j?=
 =?utf-8?B?TjhvQ20vZ1Q3ODNLQlZacjBwa01ocFduY0d1T01Ia1Z4YWlXNFNYRTBBbFl4?=
 =?utf-8?B?NnpwNkVadDVSTlVjQk1wWFVIbFllT2w0bmZHSGV1Wm5UT3FBZS9nOFZ1dElu?=
 =?utf-8?B?RStReStvZnZGUWRVTEFLVlROcFB4VXZJTkZNUXIvKzZlUWFhSlBucGMzTzl1?=
 =?utf-8?B?Uy9EdlNwUWlVbE9UYTJaTkhMWGV0amhVcEc0UGh0dXdLM2hoWHRhZ2ZqR0k4?=
 =?utf-8?B?cXVSRUc2YXhHZTZtU2MyT3U5YTl4N2RsSkVNUWM5dGRmSU1jemQzeUZNd0pa?=
 =?utf-8?B?YTlBRysxczlSa3hhYkgybXVmZmdVamlJNm9pQ2dWU1EzZFZ3ZG9LeHFBSlc0?=
 =?utf-8?B?RGdpRnJtNmxuSTZZNTIxTlVDM0NRQUlUV2RMN1ZxN3lORUI1YThxeXNxdlI1?=
 =?utf-8?B?NGJlQ25TK2lWVGdEeW1CVys5Y28rR2d2cnJUZW9xTDBFRkJ3K3JEWnJQNEJF?=
 =?utf-8?B?MTkxdytnVTFleExRR0lBaDg0NW1NejZjZG03R0tHMG16SmZEK3VtQUs5Q3Bq?=
 =?utf-8?B?OVhyb29TZUtUSm4zaGtldC9WZjBpT29IMFFwMFViOUo2MlpVUm85WXpYRkNp?=
 =?utf-8?B?VUJpeEdWMm05T2F6UFVLRnZ3WEg2YStvM1lkTlR6Nm9pcFVWUHM0b0E1UnNZ?=
 =?utf-8?B?UFN4aU5xcEZ1SSsrK01GZ04vTE5sTk1ESVRyelRJbEVnY3pob01HRE9iUnh2?=
 =?utf-8?B?ZFBreFREalh2MS83ZE5QQkVydWsvQTI1b292U1ZZeTRRcCtzdlM2aFRUNDdG?=
 =?utf-8?B?am9YZUEzekVMMDQwRjRUVWQ3b2ZuZHlDSFFVME5pNWtRSVgralJFMUVWeWhL?=
 =?utf-8?Q?Hj/k7thHjS1pRVYbiFivwbqLm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754f13e2-5e9e-4476-31f2-08dcdd4d0ab0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 10:30:14.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3zKDgwt/FZY4ZUkB5Og+YCS08b8tAYzWhPxV5c9HMM/xQESDMbUnSVQ5ZW6R1sEPFpsP3wJgzMKKyBL6DbXCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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



On 24-09-2024 17:46, Himal Prasad Ghimiray wrote:
> There is no need to return an error from xe_force_wake_put(), as a
> failure implicitly indicates that the domain failed to sleep.
> 
> v3
> - Move kernel-doc to this patch (Badal)
> 
> v5
> - change parameter to unsigned int in xe_force_wake_put()
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++++++++++++----
>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d2eb367da7c1..c2c55d3de36f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -11,6 +11,7 @@
>   #include "regs/xe_reg_defs.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   
> @@ -196,8 +197,20 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   	return ret;
>   }
>   
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int domains_mask)
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @domains_mask: forcewake domain mask to put reference
> + *
> + * This function reduces the reference counts for specified domain mask. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within specified timeout.
> + * Ensure this function is always called with return of xe_force_wake_get() as
> + * @domains_mask.
> + * Warns in case of timeout of ack from domain.
> + */
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       unsigned int domains_mask)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> @@ -210,7 +223,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	 * in error path of individual domains.
>   	 */
>   	if (!domains_mask)
> -		return 0;
> +		return;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
> @@ -229,5 +242,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   
>   	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
>   		   str_plural(hweight_long(ret)), ret);
> -	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 0b676462c97b..a79c98ed6d2f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   					    enum xe_force_wake_domains domains);
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int domains_mask);
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       unsigned int domains_mask);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,

