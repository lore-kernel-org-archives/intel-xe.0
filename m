Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D648DD1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 19:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBE810E7B5;
	Thu,  8 Jan 2026 19:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOiUwfBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC1510E7B1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767898821; x=1799434821;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mrMQvBgOn7brV528uBXQiHBuXg0E9c6K8co443OCwOo=;
 b=BOiUwfBiNEKqY6pdqYeKnINorerVoWeISUiyMtuZzTXu1Gi1HGYpLlze
 /dXi9Qdlk5FioERbEeF5h37AddcnECUcoWyF1c/9C5mBFqOp03a+Ykk+2
 zyMYFfVNZdJ8t057R+3HdNGDaAOrQp9SGcNwBg3dN72aLJ52ExymQcWJI
 8bXUtCn7OFLWQh7CW8rp3xIDRd4RFW9QtfRoys858asvlSHPMDRPNt3uk
 EAnkU6Il3Gzpnh45pGjL9Y7wRsxzhCIxiF4NitIN0Kbkwy1NEjzV+nAU4
 c4OXunfhVhqG5KbPS1dVNUPJUCHQdtC+xkAgDuTkxmBmhtAMqxWZRAvPu g==;
X-CSE-ConnectionGUID: Tc4iUxDjSv2EWoxWyGy+wA==
X-CSE-MsgGUID: pai6UejESKqkofVHEkwFuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69334623"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69334623"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:00:21 -0800
X-CSE-ConnectionGUID: vNX7nriNTt2GCu1PufsvTg==
X-CSE-MsgGUID: GmcIqS7VT6Cpa9hYXgfN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="233974710"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:00:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:00:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:00:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:00:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWEG0AvwOPvBQsHsygc851fagar7aZxPM8zT1hLedUrZHwrRQ0zBZthWKGNDWyqHsAYS7k6XD0xHxL0/VuXU4eMgcK5pVHlc+d0MgBB9Sjn6NTvNElfDNA0lXDrU7iQkVAM2+WWzah0DOcxPyrWUAdy+nGdKY1N+e7U0ANUCuligjI0/c+oKAgYBq67cuq8Rd64i1iFUhM1P3o+TwISijoaa7ncDeY9hPYGHwz+Ew3w5XgmuVTQQ8uLT/0jRacSAwLPOYE02EFmtaY95gt+93yKUXnG32DnRy7EnM35OhRKmow+j88KseNysu61ObMnNLcg9fFiDcMHpgrkURhxhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNvWkENdcxgbfqPCCQfV4S9KM73PHfPfqzg66OM9ZCU=;
 b=ufpkuJ9u5/1vyTiLcVrWr35W0lhbSb7ie+YCBekwT3Coe5E9rCx0qgy7j7RctzZOpCVE04PvIZjGrpgRH50TyT1axlmZDrg5vMOWyLfWzZ1VFCV/FT2uDcUPOPH+Ric9wkCHH22Sb80XCOiTSY/lmvWa99JeVt/dLgvhZ5t+mlQLn7pC7iZIdJV34w6XMKqlSM+GtarZc7dRvKfrTGqDWITABJaon3cxiDvuKRkHaasBSHNse559d/ls6C1vwgh1fNzA8DjEEAOKVNVkymZqhhgdpSlqQpuZuusERBgl2jEO6ce1ERlCfPpdC7r92dTKSjJnZ8woRDiMRz9NHmMeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 19:00:18 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:00:18 +0000
Message-ID: <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
Date: Thu, 8 Jan 2026 14:00:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20251218214418.4037401-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f5405b-41fe-4013-c661-08de4ee82a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlteUJSQ3NQdWVFL2ovZzNLQ0o4ZEhMTWxTalQxeWowU3Q3Wlg0SVY3a3dv?=
 =?utf-8?B?VVcxcXBPbG1DWXFCdHdMOXgxWThTN2hCRzlUQzNPbFRabjhKZUE3NGJ4b0pO?=
 =?utf-8?B?cVh1VER5QmVTTGloN2hFbGNvRzlDNG1BTmhsb0ovRStYSkZhaFMyMGxTYmY3?=
 =?utf-8?B?SXYxeXk1NWxRak9IZlY3TEVwYk5jdUZlTUJWTmJqYVdqVTVCbzUrQXJHR2ZF?=
 =?utf-8?B?OHpYQTFRMC9lMms2UllVclRvV3FLNldqSk1yblZIODM3ZGdxZjBSUnJ1c0lJ?=
 =?utf-8?B?UjdpbmhtMW5DWitubEpWb3c3blIyYXBjbW02SXhjZ24xd1JNaXlEUkxvV0VP?=
 =?utf-8?B?K0Noa1drNE5XTFNCcmhVVWxMOEc3blU1MG1kQnJKSnNXb0hoVVlJSmVVNnE1?=
 =?utf-8?B?SjJrYmMweTN2M1U1TThOcHB5cHIzZ1MwOWRxREtKSmtoeHBmeHBHbnJPQzNF?=
 =?utf-8?B?NEpOMDdVVzYzbWJ0S2w1Q3duU2dONHdWV0EydjdINUVvR1BSRTU0eDhKNDQ4?=
 =?utf-8?B?R1d6cWpRYzNvVzl0ZjRRZU5CUERhTXNLUWhpWThycFlHbE84c0FXeFZZeThU?=
 =?utf-8?B?YWJVVVpPdlVtV3FXb2QvSHNVNWlFMnpWVGNIS05TTUMyQWVHVUNSUEl2K1BC?=
 =?utf-8?B?bVZHOWFLUTRwZkZWTWRBV3Q5M1hBU1BPMWZEWUlBRTYxVTJJdHpCVEF3NTZy?=
 =?utf-8?B?R0hnRmMxMTRKSHBZM1M3ZkxBVzVHQkViKzh4KzRXNlM5d0toNEo1SDk4ZU5Z?=
 =?utf-8?B?RUk3TnBMT3REZmxzY0VqTlBDVzg1ZDhmT0R0aWh2SDI1VTFRenNoSXNvNkRN?=
 =?utf-8?B?TFYrZS9naEYvdXVCekwzZUhFOGNFeHlkWS8yY1hIWGwxV0ZPQUdnSGd1dDgy?=
 =?utf-8?B?eURDWnlMT2Y2RXV1NitmZlhGSFB6NUV1em9SYVNNWndlcmtSSnpLT0UwaHky?=
 =?utf-8?B?NC91RVlSd3VhVFQydUw1cDhrdXlKeENONkNyVlllaEtBdmU0aWZuQnFubzQr?=
 =?utf-8?B?VTMvM1JoZjNheUxxYmgwdE4vUWYyYUpnaWlySmJBemdJVkRmWURBUkRubnRY?=
 =?utf-8?B?VVB3WDQ1a0psei9Gc0h6SDYrT0hha05ZZGRUb3h4MFNJNjRFNHk2SHk3a2JB?=
 =?utf-8?B?cCs4SWNidkRueHBjTUpLVDBrY1A5TlpUQmZzeFBsL1hPQnd0b203eE9haHB1?=
 =?utf-8?B?dGpDQmFuODBLc0FqdEkrb0JXR01UalVMc1FPcEo5SlhxL3ZlUDVPUjJ1RCtD?=
 =?utf-8?B?N2RERjkvckNyeHdEU3EzekVtbXcwQU1TTWdxZXpjN2lkcUVHeURCOVhwekxh?=
 =?utf-8?B?RzJSZHBOYlh3a0U3RU1MellRZ0dpVlpwME9icXRxdWVoV1E1blVRRG5QUkJW?=
 =?utf-8?B?V1d0SEhOUHU2dUhtZm1aQjgxOTZuQnJjZkc0TWJGUjhTSjZ2Z1VmYVQ0ZStV?=
 =?utf-8?B?cFJVMnZaZnlmMUN4SGZXWmg0MGxOZTFoSzF2TUxYSUc0MGFEcnNNNm9iQUpB?=
 =?utf-8?B?dHRRWnRmNnJZQzRwTFNWbDQ5dGZFczUzSEZsWGIwb1dzcGtGVU5ibFNtV1lC?=
 =?utf-8?B?NmxWaXZsTmU1RDZDMDhySDhWUk81R0VacXZGdWxxUTJnT2tEVnBNWTd6RTFh?=
 =?utf-8?B?THdFamJYWldzL3lXcnF5c2hYaXJCTk9qczVWc0RiZFdIMTh2cnh5WU1WTmUv?=
 =?utf-8?B?YVBZbElVeXVpRlpxVDZkYjdrMkdxNERMT2MzdWlIem4wR3VFc3o5MHRJMTFW?=
 =?utf-8?B?VUYxOU85M2ZGdmVzYm1KS05WTitCVG0xMmVDVG1td0c0Z0g5dXh4ME10cGRR?=
 =?utf-8?B?U1VFN005Tm5wMTR4WnVsczZmemp2ZWZocVFqNk1WWkNlZDRJblF5TVR2ZXJk?=
 =?utf-8?B?eXcwOUxMaU11OTBxbjJ2Sk1wdmtiYjA5ZHBHbVlKUWNnMHM5cFZHMGlHUWY1?=
 =?utf-8?Q?Z6AJZo1EvvgxTfk2+Q07/TYNBe8JUPWq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RnMERJZWhscE1oYUM2MTBQdk9DZVVxbmh3Q1AzZDRxTS80ZE1FVGlRSTUx?=
 =?utf-8?B?R2tWazBrcDNDNFVUck4zL05DT3BISUVIOG91UUF6NFg0dDhOci92S1JPTXZM?=
 =?utf-8?B?SGV2SzJiTEJjaU5VMFhPN1FsK1gyRmViRWpXRVdhemYvWW5LTVgrcXB1STUy?=
 =?utf-8?B?ZThnODR3Rllvc0xBME9ZaTMvODBNOWR6ZUhsVWNVUjVzNnYvT25sb2QyTWFs?=
 =?utf-8?B?dUtZNS80WDh0NlVRSnBORzVjK2pjV2NtSFRHVlJMdzVtbXFGcUZRcjZnZ1Uz?=
 =?utf-8?B?QTA3aFNVeTZWVTg1Tm82N3hUd2lodEg3YUZZcGxpb1JacytWbWxvamovMWVU?=
 =?utf-8?B?U3lkSEw5Qnl1S1ErbVNhRWVWMlN1MTEvVllwZDNlRE4xNkpkU21MNmU3Snps?=
 =?utf-8?B?RHczQS9ZSGpvb0NaeVhrSEFieEZnbEtkTE1XbHgvdWdJTm5pR1FaM2JRQVpl?=
 =?utf-8?B?djgwbHRRUXNsRHdIVUFhbk9TOXBvendTV0hSTFNYMHFGTTZIRTQyRmJvM0hu?=
 =?utf-8?B?RFpUSkF0M3VjQW1EL2pUTlNHclpDZGtCS291MjdQT3lvbWlVYkJDN0ZCTEhW?=
 =?utf-8?B?OHlNZUJZakhmVGUrNGFnZ1g4bFIzdEFCcysyeDVmZjJIUWd5MkE0dW9Gekxw?=
 =?utf-8?B?UUhxekpQZnM4ZTBsZFF4R1l3dTF5R3VSZ2ZxOWJpUGx0eGp4SzkvQnRrRmpp?=
 =?utf-8?B?M1BMbGF3bkErdUVqZTdOUGtQN1dVYkhsTkhBbXV4b1lKSy9HaC9CWjZxWkEy?=
 =?utf-8?B?RC9vRDhVZzVDc0gyUk1TRmcwTjNzSXYraWE4SGNaR050dUNGSE1WazJNRS9G?=
 =?utf-8?B?UmIySmxOM21iYjhYdlJVT2szcytjSlZlbUpDRFZuSVhERDl3UW1jaHlsL2kz?=
 =?utf-8?B?NTRlY2VMdmFpbmtEV0ZGTS92aHJYMFl6TTBtU1I0WXlpeHdhRCt3V3R1YU1y?=
 =?utf-8?B?OU0yZzBJZ1A3aWs4T09JY0hVcDRwa3Q0eE9DckFLamg4Yy9jTThOdFRqbGw2?=
 =?utf-8?B?SS9GYmdOM2pzRFZ0WWZGWmRKV3BxUFBDU05vbUVqUERnMkRKVTdCZTByVDFX?=
 =?utf-8?B?dTN6S1ZvVjFPb0FmcjZ5dU9HNzJEWUlETTErdTQ0d1dWN21tYjdpc25IVGhR?=
 =?utf-8?B?QWVqRk8wRWJubml2VXN2Qy9HeWNGVWRMVUlGM04rR3NBa1FsZEVsb0VxSDhF?=
 =?utf-8?B?ZXAyaGFBbHBUTzdERWZsL3pOSW9RdzFoeVdvcCtINWRsbkpMbS8zQ0pqdENY?=
 =?utf-8?B?WUVuTkRPUnRtc2h4OXRYaWVjcjB1MUdsa1ZHQW5Id2JJalorT2NibitmYU5m?=
 =?utf-8?B?VDdWaGx3YnpZY1V0T01sbEZvSEliUEdxMTZmOHp2OVpIbms4MEZoeDJmSUlk?=
 =?utf-8?B?aHRwWnRFbmszZWgvUnFPUEo0cytVMjFxa005NGFwSHU1QTA2ekRYejlqWXBo?=
 =?utf-8?B?RHZKUGlvMDI3M01laVIydFVCUUhmL3FRdGhoQ3VUUmY2N0NzYmpGZWQvbTJC?=
 =?utf-8?B?S1FVWDhOYjdNZU9GcHVqYU95NFJrallkUnhDZTdCd1J6UzlNM0VIVE9wTU9B?=
 =?utf-8?B?cmRyS0JVRUtBU2dlNGRTVklVbGJzK0Z1V2FreDRqYnd5U2dVMExjK0lvOVBG?=
 =?utf-8?B?eXRHdmU1dDRJOXdrKzB1S0xwRnlHR2Z0L1pJd3RoRzF0ZExBSkw3d0RKcDJK?=
 =?utf-8?B?a3N3MlJzOUg3NXlQVk1nVUtvNGl3YzJyd1lJN3dldkR1TlRGODIwL0I2ZWY1?=
 =?utf-8?B?NGZLaFlwNStpTW1YYjM1L2Z3VE92NXo2Kzl0NGEvcE9QcklhLy9OQWF0QmY0?=
 =?utf-8?B?TWFUQy96TEYyMHRLREJMVHF5SmUxWFl6RmRIUGdablZNakE1Ymg3eEI3Kzc0?=
 =?utf-8?B?L0R0MjBVSVlYdjJFcFZIampQNXF1dmliT29UK1kxRi82ZTJUa2ZERTYyR3RJ?=
 =?utf-8?B?UDZ6L0gyTEpkUmJxcnZGUURrbTNodytyMmFEZ3oxMW0xOVVXNmV2T1pQVnpy?=
 =?utf-8?B?RVpVbzl0NlppdXZmaE8xSFdTV3NlTUt0clE0OGdvVC9SaFRrSy9yc0RnM2RN?=
 =?utf-8?B?dUFrTlo0dFR6YWRRY1Y3SUl3SldWdXRMZlVKSmxBeE1ZUCtOZkwwKzd4TkFn?=
 =?utf-8?B?dytxR0JZaGtDeStRQmVLSGFCOEYxNlp3MmczVzlyeU1ucW9nMkxySDB5cVhG?=
 =?utf-8?B?T1hQYmgzTnl2NVdITDgwUGpZbU9VSWRiUHVoOVJVUmk4Vk9tOVluRWlQbzUz?=
 =?utf-8?B?bkNmd2hSWWdGNXlYK1hiM2ZFT1BXcjROVzduaklDZFR4SE5ORmVxZUxkRnVJ?=
 =?utf-8?B?cWl4TElMN0hsUE1hb2M3Sy9ZdklpV3JBR0JDTVRPNFgrWnczaWZUZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f5405b-41fe-4013-c661-08de4ee82a28
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:00:18.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94SasTY5Qh+CyDMy5cmdb1DfFEzwRnxKxkd6LAUNBfFqkcf1IDtv4+VvoC3C1076X5ivG8EEKMlhlE7NJRmzvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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



On 2025-12-18 4:44 p.m., Matthew Brost wrote:
> In GuC submit fini, forcefully tear down any exec queues by disabling
> CTs, stopping the scheduler (which cleans up lost G2H), killing all
> remaining queues, and resuming scheduling to allow any remaining cleanup
> actions to complete and signal any remaining fences.
> 
> v2:
>   - Fix VF failure (CI)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> ---
> 
> This fix will not apply outright to any stable kernel as it depeneds on
> functions which have added in the KMD since the original commit. Likely
> will have to manually send out patches to stable for kernel which we'd
> like to fix.
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 071cbfec2401..58ec94439df1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -289,6 +289,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   		 EXEC_QUEUE_STATE_BANNED));
>   }
>   
> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
> +
>   static void guc_submit_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_guc *guc = arg;
> @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	int ret;
>   
> +	/* Forcefully kill any remaining exec queues */
> +	xe_guc_ct_stop(&guc->ct);
> +	__xe_guc_submit_reset_prepare(guc);
> +	xe_guc_submit_stop(guc);
> +	xe_guc_submit_pause_abort(guc);
> +

Tested this series over
265d13795b45 drm-tip: 2026y-01m-06d-08h-06m-43s UTC integration manifest 
===(CI_DRM_17772) and (xe-4335) with (IGT_8685)===

and run test xe_fault_injection --r probe-fail-guc-xe_guc_mmio_send_recv 
--debug
got few problems:
1. Assertion ct->g2h_outstanding == 0 triggered
call stack shows:
[  708.967261]  xe_guc_ct_disable+0x17/0x80 [xe]
[  709.043382]  xe_guc_sanitize+0x31/0x50 [xe]
[  709.119557]  xe_uc_load_hw+0x187/0x2a0 [xe]

2. Page fault
[  740.822070] BUG: unable to handle page fault for address: 
ffffc9000c80fc50
[  740.828896] #PF: supervisor write access in kernel mode
[  740.834063] #PF: error_code(0x0002) - not-present page
[  740.839145] PGD 100000067 P4D 100000067 PUD 100ad4067 PMD 0
[  740.844738] Oops: Oops: 0002 [#2] SMP NOPTI
[  740.848880] CPU: 2 UID: 0 PID: 169 Comm: kworker/2:2 Tainted: G S M 
UD W           6.19.0-rc4+xu4335+ #3 PREEMPT(voluntary)
[  740.859964] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, 
[U]=USER, [D]=DIE, [W]=WARN
[  740.867952] Hardware name: Intel Corporation Meteor Lake Client 
Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS 
MTLPFWI1.R00.4122.D21.2408281317 08/28/2024
[  740.881081] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
[  740.887820] RIP: 0010:xe_ggtt_set_pte+0x53/0x350 [xe]
[  740.892900] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 
5c 24 08 0f 83 a8 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 
d8 <4c> 89 38 48 8b 45 d0 65 48 2b 05 e6 41 d1 e2 0f 85 e1 02 00 00 48
[  740.911428] RSP: 0018:ffffc9000074b9f0 EFLAGS: 00010202
[  740.916599] RAX: ffffc9000c80fc50 RBX: 0000000000001f8a RCX: 
0000000000000000
[  740.923653] RDX: 0000000000000000 RSI: 0000000001f8a000 RDI: 
ffff888132562628
[  740.930705] RBP: ffffc9000074ba88 R08: 0000000000000000 R09: 
ffff888168188000
[  740.937758] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888132562628
[  740.944807] R13: 0000000000000000 R14: ffff88816818a768 R15: 
0000000000000000
[  740.951861] FS:  0000000000000000(0000) GS:ffff8884ebbe0000(0000) 
knlGS:0000000000000000
[  740.959850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  740.965534] CR2: ffffc9000c80fc50 CR3: 0000000132923003 CR4: 
0000000000f72ef0
[  740.972585] PKRU: 55555554
[  740.975268] Call Trace:
[  740.977694]  <TASK>
[  740.979778]  ? __mutex_lock+0xae/0x1080
[  740.983583]  xe_ggtt_clear+0xa1/0x260 [xe]
[  740.987716]  ? lock_release+0x1df/0x280
[  740.991519]  ? pm_runtime_get_conditional+0x66/0x150
[  740.996436]  ggtt_node_remove+0xb2/0x140 [xe]
[  741.000829]  xe_ggtt_node_remove+0x40/0xa0 [xe]
[  741.005393]  xe_ggtt_remove_bo+0x87/0x250 [xe]
[  741.009874]  ? _raw_write_unlock+0x22/0x50
[  741.013927]  ? drm_vma_offset_remove+0x65/0x80
[  741.018324]  xe_ttm_bo_destroy+0xd4/0x310 [xe]
[  741.022800]  ttm_bo_release+0x70/0x330 [ttm]
[  741.027032]  ? vunmap+0x4a/0x70
[  741.030147]  ? vunmap+0x4a/0x70
[  741.033260]  ttm_bo_fini+0x3c/0x70 [ttm]
[  741.037145]  xe_gem_object_free+0x1a/0x30 [xe]
[  741.041618]  drm_gem_object_free+0x1d/0x40
[  741.045671]  xe_bo_put+0x136/0x1c0 [xe]
[  741.049548]  xe_lrc_destroy+0x47/0x60 [xe]
[  741.053691]  xe_exec_queue_fini+0x85/0xd0 [xe]
[  741.058172]  __guc_exec_queue_destroy_async+0x7c/0x190 [xe]
[  741.063770]  process_one_work+0x22e/0x6b0
[  741.067741]  worker_thread+0x1a0/0x370
[  741.071456]  ? __pfx_worker_thread+0x10/0x10
[  741.075683]  kthread+0x11f/0x250
[  741.078882]  ? __pfx_kthread+0x10/0x10
[  741.082594]  ret_from_fork+0x337/0x390
[  741.086315]  ? __pfx_kthread+0x10/0x10
[  741.090027]  ret_from_fork_asm+0x1a/0x30
[  741.093909]  </TASK>

Sounds like call xe_guc_submit_pause_abort here might cause trouble. 
That's why I call it in guc_fini_hw, which make the test passed.

Regards,
Zhanjun Dong

>   	ret = wait_event_timeout(guc->submission_state.fini_wq,
>   				 xa_empty(&guc->submission_state.exec_queue_lookup),
>   				 HZ * 5);
> @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   	}
>   }
>   
> -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
>   {
>   	int ret;
>   
> -	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> -		return 0;
> -
> -	if (!guc->submission_state.initialized)
> -		return 0;
> -
>   	/*
>   	 * Using an atomic here rather than submission_state.lock as this
>   	 * function can be called while holding the CT lock (engine reset
> @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>   	return ret;
>   }
>   
> +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> +{
> +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> +		return 0;
> +
> +	if (!guc->submission_state.initialized)
> +		return 0;
> +
> +	return __xe_guc_submit_reset_prepare(guc);
> +}
> +
>   void xe_guc_submit_reset_wait(struct xe_guc *guc)
>   {
>   	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||

