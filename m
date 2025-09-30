Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0121CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 10:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E17510E184;
	Tue, 30 Sep 2025 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1lcv3pq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060810E184
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759227436; x=1790763436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4mmUZwRuBjUi1CjERajrN0g8A1Sg0xjo7fNL7f6RzrU=;
 b=T1lcv3pqd4CQ29f+y079x3FkjYhcuibjzmpDlsp6BlTNI8oNjB1IX1ZE
 iVV3NMibcSnJXVVqNbMAjazvFVxSIr6KWQPNjc6NK8Dzr7zmf29GwHbwa
 1qsP4bxdBcRcmu3csp7pcz5IcYEA8sdWqKz1gQTQF0c6aa+gFOaUdDbUR
 kr4LZRnYlEIoPXzYP9nq4D3rhtsDltvZNOsJr426TMUZAkhcLIWANgrgH
 +SxXIG/5PvHt537hXU+P9q6+tXqI9CYGTZTT7CESNZUh1VetlV08DeODw
 o/cEactwbUzl6z+Xj2AdduoY1/h8JeX99xNkSADcWxAEHFWTtwrsLZNAJ g==;
X-CSE-ConnectionGUID: tHosDPtgS7mIxPjQQqjmWQ==
X-CSE-MsgGUID: JBSoMNOGQg66Jjts9a3s9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61587924"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61587924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:17:15 -0700
X-CSE-ConnectionGUID: +APZfEQgRLqmAVhq+se/RA==
X-CSE-MsgGUID: 8N7KeWkWQJyBvIcioWUR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178278582"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:17:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 03:17:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 03:17:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 03:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVRxvsEv4DIVx5r26jEQ2OPmIMN0/6Ytf+f444Q8cS9epO7z+GhinnPDrtMsV7pv9M1H55GLpCOs6gYAdRfgs6ZhlRHJOmA5wawUNBhi6qH+46nAIAR88B/QHe4Qu0CLiszY9SyTqncpUFfr5k7YHGQOamKLKQPbt92aC18Mozw4H29udTAyzupgBHb1oeiHymHnp61VRjBvAjTzzq39GYNWIc9uGhf+IQMd+JhAqpH9H7UHkIEQP9vryLVSUC7gTR6EAj1jnKSErANLN7tBQAtoMbk9K8yYwbBJ8fm4l7ZIqP/5baF7TYG2HH4XM5a+MMcBJ3s/otQ4twrvLc91Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td1nKDIZ7EEmBZp9IoDsEtB48kIuk+Dxwuxv0j/sMWY=;
 b=UFuBYyltZ1Ft9wGKoGM2ZldQN7e/ASiyx7XrFrM500l8Gld9r3uDgLoYld2inuaMDraR+zATk5DoDwFuDajUfNIMFR3D6/PzFcF4zUdaQsxU83zBsVj0vbFMAogkg8pGygDKMUx41jMa9wTgTNd2h+4giU3ehoKyUW9R3AafacxsrLRS+xlVfQ8G4Jd2iJLIbLeDvH10sDOMiVNbcugmDejz0jVX7nGK8hk3GinuK2uzVodAsacIr9K5zwdHlAxwCVdVmDV8wiyUUahkUxM1e8cwwckYfOcuhmfrXp7FGnMfJUdmxX4RJoIQgrJcu9NopKV9ihO5xoke0jRgqZLpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 10:17:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 10:17:12 +0000
Message-ID: <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
Date: Tue, 30 Sep 2025 12:17:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
 <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e82103-b48b-44ec-7d88-08de000a852d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VktWQTZRVTJhYkpoeHFhUkxmNldKMmYwQWw1OGRJL3pVRDIxTmJSVFJHWXVz?=
 =?utf-8?B?SzR3SG1HMG9QYmlQdm43UDh3aWUvZzBWZVRuR3pHSWlodkIyTzNHSWkyanFZ?=
 =?utf-8?B?ZnkzMHJRcEdqb0J6VUEyUTByRDAxMDVnWDBBS29vL1hEeEg5TE0rcDBuek5m?=
 =?utf-8?B?YjR1dmlCN291NW45M0I3allnTlZmWGZ0UFpkQURQWU9MdUtKS3BtMmFINTl0?=
 =?utf-8?B?Y080ZGRpYnpzSVBKYmVTU3NMWUFjR1ZUR3dCVGc1WVNGdDYxSFRJbWIvUlMy?=
 =?utf-8?B?REIyUUtBcTc0WmloVktmdGFncjB6QmNlYkZadDBQczcwd3R6Uk1mYzBodUV2?=
 =?utf-8?B?ZHZpR2trQ1BIY3Y5RXM3S0xxQjFleUQ3K3l1WVZzSFVIR3JCbmEwUnptcmdz?=
 =?utf-8?B?ZVNkekw5NnNSV0JZQjBTakxrSWhyNUdoVXdXZHk2QzRTY2lOUlp6NXEvRmZ0?=
 =?utf-8?B?cmwwZ0M4YVdwTzlmVHZaYUlMNEdNTEY2WEQ0d0dEckVITUphV3NrYks0c0F5?=
 =?utf-8?B?NnBqSzI3OWdpY3pvdVJDVDkwcVRoOTdEUVpYV3d4dlJreGtCbThOZFhleGdv?=
 =?utf-8?B?dkk1UTc4N2tqUEVTV01JYVBxYnIwQVBrN3RkYmh6UCtlSjFwWHpUc0o0WTFN?=
 =?utf-8?B?ODE3dkMveDJXc2dqM3Nya1k4UlU5aDdxRXlNbnFsOG5venJmUTFVdlY0Tkgv?=
 =?utf-8?B?MldDZGU0c1lrNzd2bGkwTWkyYnZIUFBYZVZwQUNoVmN6aU9iN2daOThQNzVw?=
 =?utf-8?B?OGxnU2o0VjhxVkFWM2RtSFFHUkp3QWQwLzF6Y21YbnJTOEJxenJna2wzZHY4?=
 =?utf-8?B?UkY1cWJlaGplb240VG8xNXMwc2V2dVdkUXErbU5NRTg3ZkJRTHpHSi8vQ3lT?=
 =?utf-8?B?a0c0ODcyRDRGQk1DMVVMNmtoQ2cyR0tXdHYyOVJuclVKeHJpTmI2eDdjMWtO?=
 =?utf-8?B?QTVtUE9oZjZUVmtjWUxENWovM1I3R2RzMExkbGllN054WHdhK3pmbVZhK1ow?=
 =?utf-8?B?L3Y5bnIxOHVIUWI1cFRSQ2U5RFIxWFJ3dFY2eEZ0WVpLSmtOelpSdTBTT2FW?=
 =?utf-8?B?ZURaVUxicVBPcUxEeHZaME9veVZLR2FkMVpRUW5rYk5sYVFKRkFqbWQvVnV2?=
 =?utf-8?B?R1ZrRVEzek9HdFdTMFlaNHYyMnIrMC9jMmZBRW85UTYzai9HRE9XZ252REFC?=
 =?utf-8?B?TGFCUlpTRTd1ck9tZFdPUnBOT1NEUHlTblFnTkh3RmcxaC9Fajh6SDltOFhC?=
 =?utf-8?B?V1p0U3pRK1VYaXk5aVNQZlZuODBMLytmRXVQT0s3MGFZaWRnYUVqQVRhSkZy?=
 =?utf-8?B?ZzQrOW9yZmI5ejZhczZ5bU9hWDV6Q0duNVlOZmVDMm9pMk9Sb1o4aE9JWEds?=
 =?utf-8?B?SFNVdTlYb0xQclBsRlFCQjlmd0tOY2NoZDl2RU1odktPKzNyUitLMnkycEg3?=
 =?utf-8?B?MmtKUlpBZmRhWXNKZWZlNlpSV2tPb0kvRXpEb2w4QktxcUVXZ2czUFRRc0Va?=
 =?utf-8?B?OUVUYlBDazFRSHV1SHRaY216Zm54Sk9DVEFNMFY2YnMvUWZPdWorUFJhQzRD?=
 =?utf-8?B?cjRVQVVubzdIcWZHRDZvSGo5OHVwbXhWMGtNRnhvSjFGQ1FQNUloclVmc3pr?=
 =?utf-8?B?N2JjWDR1UTR1S1Q5U3kzeDJSUWQ0dThjSHlkb1pnZG9KYUU0YkV6ZEF6MS9v?=
 =?utf-8?B?WDFPbmJxaitUMzNyQ3pmYmlFVjFLdHVTUERKM1VXdWJ0c3JJZ2xYQU8wa3M2?=
 =?utf-8?B?Wm82UE5jdDVSTm9MMEQrRkpNL0o3WUZlSm5tTWpZcHRVaWFseGtYbzc2dm05?=
 =?utf-8?B?MXZQdDhhaWFVQUVrbVd2OWVXb2NqeDJwVFZwMFFEZEZ0UGpMWGNTNHlHN2Mz?=
 =?utf-8?B?d1hvSVFvSFFDVEEvUWR6WVloemRBMXc4V215NURJVk5QVjFxS1VmaHl3ZkRo?=
 =?utf-8?Q?J8voQqHHcqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNSQXh6bzgrdUJubVp2MjJpbkwrTU1VRXB5MlJLR1AzRTVQaGtPOHd1Q0gv?=
 =?utf-8?B?UUh2bWhxVEpPVFFEME1QL251TkdYWHFJaTFDVnducnJ2RDRSWG1STTU0c3VZ?=
 =?utf-8?B?bGJLbWQ0aFpoYzdaZ2xPRzRjZFEybEgyWlRqUnVlM2dLaytTdHFYYVNCbDRp?=
 =?utf-8?B?M2x4MmtSRUdZZW51SG95d05aYkZaa0xsUXhDWERVMU9Gb3dCWHkyVzFHQlNB?=
 =?utf-8?B?bGJML0pEaUJxU01nUC9scytKWWQ4akhHQk1UT20xcWdDRjdCMlpuNGZIR29O?=
 =?utf-8?B?MTdtQkZ1RGlwSXBYWnBibTZydnNJNldiUU5ZN0tXNjN2c0M5U3JFcjNjamMx?=
 =?utf-8?B?Y3FKQ29DdkxvUkM2WDVGN2U5RVNiNWVlakE0S2I1Q3BuR2FzRm11eUNTS0k2?=
 =?utf-8?B?M2QxNHZpeGZrSDVCTWl2SjZkTVQ0K24xNCsvUkF5dEt0REdHQVVsb3pRTTMv?=
 =?utf-8?B?K1VMUnowdXdLNUFVS1puVFJyTEltcVBoVHA1MDFKVGgvVFNCVDBHTHJxV1Np?=
 =?utf-8?B?WCtrQ0Z3N2RwT2dyRlVLUXV3NmsxUGVNOTJrRHNlWnNpbWJac3EvbTlJamli?=
 =?utf-8?B?QTBDQnV5RXlBK3ZsM1VzLzE1OVRCMHY2K1puUHNhdVExWXE1N2NucitmMEly?=
 =?utf-8?B?aHNDTVNla0loeGgzQjJYYlI1YTZ6WWsxMmZHRGVLc3A2TCtGNSs4T1puMmNE?=
 =?utf-8?B?cW9tUU5GMS9qSXhUN21YWER0Z2MyS2F3YUloblpacVFYbW03OHAzc1lJSEZ2?=
 =?utf-8?B?ejl4U0Q2OWpZZGhiMXo5M0dsam5DdzhsWHdBczArV1orNGRTRldyazZwZ2NF?=
 =?utf-8?B?Wkg4RzhibzFPaUlXRFg1WFpMQVJXN1Z4Z0xxUlltVUthVFVTL04wL3piTnVU?=
 =?utf-8?B?TjFUekYwMGNYMDJ0ZlZvWjlDQlkxcmc4Z3dPWUl6T280c0IzcWo1bWhKclRo?=
 =?utf-8?B?TkFNSkg3RENxSGNUSHBtdy94enIxaUtkNnV0RG5aMmZzMU51NHA4Zm9UeGQ0?=
 =?utf-8?B?K1AyU1hueEhkTGR2TzBjV1BDK0ZUNkxqdGVJbjIxSkxzNHpLQzV0czBVcEdR?=
 =?utf-8?B?b0svOFhGTjQyRFFiMStLWUkwWHJsL0FPeldTMXNrVzQ4dnYwRG04dFN4NThR?=
 =?utf-8?B?QmRJUTIwZUZaZHpmL2ZlRmVDTFVHUk9ubEVQblhvazROdXRBYWFCM2F3VlBu?=
 =?utf-8?B?RTZFUjNXQlF4WFdPK3ZOMHBLN0ZtMjZkVGphUzBDTW40WmtsNURBemFOdXh2?=
 =?utf-8?B?elBpQm1aYlp5aE13alR1WFVxeHJKb3RFdnBvYTlQc2R1L0hpUFZhdXFPdFRY?=
 =?utf-8?B?UXVJT3ZWQUN3d2F6RjBXeGpTaU9sUlVheDVPVzJVYzAvWHFVK0ZqeUhnMmdr?=
 =?utf-8?B?WlZsUnp3TysycFNEU0hMbjUvWXArMDZQL1pMM28yd1VvNFk2eUV2UUgvdlFQ?=
 =?utf-8?B?c1ltclA2ZVBlODZObU5tRTR1QWF1emlJUGdWVGlpYnptUFZndXFmMW81aS84?=
 =?utf-8?B?MFE0Q3pXYnhqdlBYeWxJc2pHRTJoWmlDRkkwNmFKV3NRMllaWk1YSWN5OSty?=
 =?utf-8?B?WTdLd3VWZDJIaUc4ZTN6SndrcTVOcldXRWRQaVprOEtOUnFvdDFvYmdRaDNU?=
 =?utf-8?B?eFhUQnNveUN2TGNSOHkyRDAwaUdPNEJNZCtZeFNkWEpseVVKbkI5WUg5bEI3?=
 =?utf-8?B?TmxTcnMxZ2JxVldZUFl3bG85VnplYzVQWVJKeWlmcE5YWVZBSUIvSzZFazhO?=
 =?utf-8?B?aUtZaENhdy9jTTFJSWFkQk9ySjM0SDFhNFp5UHFrdEc0Q0RndldGT0dxOEdP?=
 =?utf-8?B?Z3B1TUpsaThsZ3dBS0JNSE1CbFZDWmRZOUhhdFVTTExrN3E0a2QrejlLVmIy?=
 =?utf-8?B?TXArNjkxcm9qY2trQ01SeVdrOWhYVzFwN0RWRjhZM1kxb1Z1bXFyN1B0alZ4?=
 =?utf-8?B?VVQwaGl2ZHU0OTJ0cENlZWhlZGdFV2NIenpuai8rL0FqSUNOTXJrY0hPQjZH?=
 =?utf-8?B?OG50dUZnVGszTGQ1WjRyMmQ3cmY0allsUFZLY0pna1N6UTRnaERoeFc1WDc4?=
 =?utf-8?B?OGdRT0xjYVI0eERPQ3YxL2l1V3pqOUhWS1VHZWRCdDFycHUyTGtOTXhFQm1S?=
 =?utf-8?B?NTl2dVM3SDZ4TjNmM05hcjBYUWRBeWFrZjEwUC9SYTFWY0xmTElCY01EZ1lj?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e82103-b48b-44ec-7d88-08de000a852d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 10:17:11.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO4nVMZjv7KyTzl/SWHM/NpN5cLFXbn59T4pi4634d5ukKkIIVZrmBBBPCDXb6IkhjC1aABJomVj8ynIYKiiraTcO8ShWYHX7OKs4u2dRI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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



On 9/30/2025 10:45 AM, Jani Nikula wrote:
> On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> +/**
>> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
>> + * @gt: the &xe_gt
>> + * @p: the &drm_printer
>> + *
>> + * Return: always 0.
>> + */
>> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> 
> What benefit do the formatted kernel-doc give us? IMO it's just
> boilerplate with pretty much everything being obvious from the function
> name and parameters. And the functions aren't significant enough to be
> made part of the Sphinx build either.

I'm just following the (unwritten?) rule that in Xe we should document
all public functions, and while in some cases such kernel-doc does not
bring anything new, also like in [1], IMO it's still better than no
documentation at all, as sometimes, like [2], function name isn't
telling you the whole thing

[1] https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/gpu/drm/xe/xe_bo.h#L239
[2] https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/gpu/drm/xe/xe_gt_throttle.c#L241

> 
> BR,
> Jani.
> 
> 

