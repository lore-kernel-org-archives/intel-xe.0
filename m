Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BDC02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 06:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E906310EA33;
	Fri,  7 Feb 2025 06:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEortLl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FDA10EA33
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 06:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738911118; x=1770447118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IcGlGw5zvP4+mZHuMTzEj/2hBBxityljlcl2JLr8cVk=;
 b=FEortLl3KKA14OnJmQYnogjtz8cQfEcLbJa6ju9Lo7fLw1XNoGz+TXxH
 XCoiAmeN/ExSbCIFt+6vGmYyfEiZhlVA8lr42/tBX/LgotRwJcsUgJ933
 kK5a9/VVcZc+TqdAhlA5BtxjbcgqTyox4rwGS3WHvinS33Bsnq99xznpG
 658pFMVRbi2RQO4DQtOTwDEn+RJcFLc6gb2ljYmnpgvymVI98yYNCedcE
 UEj+S2lNLc5OIjJw19OvTU0pAA+sN8EdRxPFOM2yy/xPxG8atNIwm8Z+w
 msGgjkeBH+MG81jB79cmzf+kBMzSFYMS1+ErpYDFFrzfsyt9S6Yt6AZja w==;
X-CSE-ConnectionGUID: zeGBMXuPReKB3zkcOZSUHw==
X-CSE-MsgGUID: ihYwkmvBRMmUCcz+u2mLWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56962760"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="56962760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 22:51:57 -0800
X-CSE-ConnectionGUID: f5KoC+TLS0KjrCEahS9HRw==
X-CSE-MsgGUID: 3DPMqd6CSd6GNOZd+O9Qww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134679671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 22:51:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 22:51:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 22:51:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 22:51:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2Q5QCafgaCwWSmXP9nOiFu6o1mjJ+z4ofIlyl0XR/fOkNObHl3yaXoe/sYqC+x/ha3zYrZPm++FLt/Am/XQvINsFEFmWSmj64zYgLN0ZnIeiGS8k1zRhcIdVtwuJr9SjdOi3+DNBGBlwGGzndcjUIGdY/QavRUTuEXxGgwvSxJaqxHMBtJ2Y+++qQpn3dTErFyMg17UF54JVKk7YrtXXb8dB1yAxZGNnRQPYDkIeH3zvhqc0TPlTpIp1TpXIurd/bAUpbd0qah1ygW91jXfN+RPvFFy7WrPSFcKZGqQEru9GQSUhEIVlG/Z0aLeXtfdlgQ33tavJh4A6bQpPapKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJZaHPhhZylPvKJHU5ac2eLIXLgoR2ZaqGJCeRnHQIA=;
 b=lZU8EYuZl30ZPdPaB5F1H21raeJIHRI9/hGPkxcYnWMmlU9o1XHx36PmrOdACoA+8ZrDQQpiYmnEPbSPrIhd4LoklELUgkE+ItIyAF0M1L43+TFBQinWH/eaVY67xl//BEm8/VvwXSAW9ikhKibnjIoCI7XybkR4PpifvaRi2G/PQcGzMQtt5jp5tISVi9sQO5TUKY7q/7GFW3wHnQqsWlmuzTk/pjobWnm2QJkATJPlHOlNrjBb/fVMc2GxR3jr71HOrUDjefVORAs2o+b3LpQ1mNsdz3eUiU33BpVuw0dvpCO34okA44QQLODBdd5MUMtjFwpwLyVLKpneIXHxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:51:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 06:51:32 +0000
Message-ID: <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
Date: Fri, 7 Feb 2025 12:21:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
 <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc24f96-c4d6-4d41-c0e9-08dd4743dad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG1LVktOS3dvMDhLN3dSa24zV1l3MlR2OUR5ZlZESkJZMlJmalZsWnRBa3hj?=
 =?utf-8?B?V29NZnJkZGpOS0E0eTZpelAwTkJ4MkF2QWRqY2NBMzBLWDN6RWgvOGVUQUsy?=
 =?utf-8?B?c1B5SlYzdi9JOUhMZkQ2THVIZEZzMEt5bk5TbUMyWFAxUXBMeWtodGh6dm14?=
 =?utf-8?B?ZGk1em1SanNWUEsyeFJpTG1BSWpMTUJqdFYrQ2pROWtQRGlzTDFVVlBFUytp?=
 =?utf-8?B?UW1mcXNNVEFWSHFHcmc1MVZDUTZDUlhlWGxlMDE1S0lsdzh1dzhwaGlCNEdE?=
 =?utf-8?B?am91dGJpVGhyWWZKRkNEVUJPNjdvQ1JaQzFMMSsvM2RPRjRNRkRWQU5DcjZB?=
 =?utf-8?B?TjhHUnYxanBiTTdWeWRsYU1DdXQrZVNXYnY1bjYzZVZNczdhOGdZMkdkN3hh?=
 =?utf-8?B?a0VLME9hSS9jcUt2b0IzVmVRN05DKzJHeGdLMkNia1NpSkdHNCt2Ulg2QVVv?=
 =?utf-8?B?aHRRN000VFZ0SWorZHVZOTlTcVpBWk1CTkdvdDhwTStsVWhlbWhOVXMwNS9p?=
 =?utf-8?B?NkpzUks0eFNJV3pza0Q0R3JDUUpDaCtGSGJ1V2NBdkFBK0FPZkRDZE1aYTVE?=
 =?utf-8?B?azJnN1BzeEtlOVF4RWZLVUNTRTV0cFpvNUpMa2x6am1icmNyc0RpVlZ1MVdP?=
 =?utf-8?B?UDJZcEg2emhRaUxBRzFoRVhac2V4ZjBReGpJQXNlaXNXZXd2cDR1WmIxbk4r?=
 =?utf-8?B?MGxYZGwwQWc5L1NyUElkdERPZEdOS0NGSFlqeSt1Zi8rdHcvenFGT09MRitN?=
 =?utf-8?B?VFFBenV4Q0tRYk1uZTFUMUxxS0tqdzZ3TnZtLy9oNmJnSzFEYUtBdFhRQndC?=
 =?utf-8?B?RklWdSsrWk1PR3lUdk9JejBUQjhPTGVIOXVnOXc3UVpWSUN6R3dpY0psRVcr?=
 =?utf-8?B?REw0N0JWT3VGSHpmTjM2MEU2M1FzUlRYclRRTXJTSnlsWERYSDNaT21ZUGJl?=
 =?utf-8?B?VXVBZUp4NXZ3TDQwYmNuc3FTMW1zR0hGTThPWFB0K3ZJVStuU3JuajRzUlNn?=
 =?utf-8?B?TWp2VDRub1BxcUpqMVNmU0l0YlczWG9sWHphbkx2V2ZXMVdLWWs3SkMzUDV2?=
 =?utf-8?B?T0p5VmNnOU5GY2FBUTlpSGh4Tm9NaW1EaUZwTUhaUVBiakRoNGdzWlM4ZVY3?=
 =?utf-8?B?UkxBa0lBRG05NVRjMTB2UDR6RWpBcVJpc21CeHZqdVluWjY0dWZVK0VyQ1Fz?=
 =?utf-8?B?TzdyRDZXNVlNZWtXTjJET2czbjRzenlKZ2NJYUk3WllacWt0L2t4OXdyS1Ry?=
 =?utf-8?B?TmhnUFg4b2t4djFyZTB4ZUVHYUNVTVVJY0pocmp2NE05TlkrVDdWUzhhTFNo?=
 =?utf-8?B?NUgyMml1QmlhTS9FeEsyK3c0cWdielMyU1RGUHRuVjhyeE5acHJpOEQ5Q1gw?=
 =?utf-8?B?dUNlVWRDYVB6UzVIZWdwc2JMajkveHZBUFBzVmtIOHJJSUNOMlhiWWpKQzZC?=
 =?utf-8?B?dVRvT1VZb2pWamcrREp1MmVSQ3lpemdqSkFwb21WWFozbDFnN0t6UngvOUxW?=
 =?utf-8?B?Q2Ric2tQQVdmM3V1ZGk4NDJSNHBEK05mMERtc1dEekhhNXdIUHpsRWxGbkZv?=
 =?utf-8?B?aGw1WUlDcDAyWHhjVWgwVkQzaDBHbGhVNC9qaVVDVDRQcjdSZmxPSlhDZkVm?=
 =?utf-8?B?TzhrQnJpN2ErTzFmcGFtdzlTRVJScDJZbHlrOTNtazRzbzRrcGhGZzFvck9z?=
 =?utf-8?B?SEZBWGw2UTA2MXVYdWRVNCs2c29RUG5DWVZNZUZzVjl5OUxDN1ZpREVtcW5a?=
 =?utf-8?B?VjVHeWp4bE1LWVFldDZTcTJHdkNaTWhNSjJacHU2SkRkdlRiaGNBN0dkQkZD?=
 =?utf-8?B?MnZaWE9EYmZCQjZjQ1VwK2I5RVd3R2dNMjFEdlhkVzlXQW1ySlhKR1U1eGIv?=
 =?utf-8?Q?kqeaiWPHgDZmA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNabE92NjIzWmNvMTBmTGpxdFcwTC9qdzN1UXpWQUs4UFJ5Q1ovNDJNYWsy?=
 =?utf-8?B?MDBoYlRQL25OSWtCY0NlYU9lVU5KZ0kvb2tJL3BDLzBjVlJVZjhQUDBZbEk3?=
 =?utf-8?B?R3VSWXBudHNVNVc2dUJwYlpSUzczMllra3V5T1FWSUh1a05UUW5aL0ZmVUdC?=
 =?utf-8?B?SWFod0tLb0xUOXpYTmRWejgwbHl1SWRNSzQvNndGM1paV1FkcXJwNUtETnNM?=
 =?utf-8?B?UUhER3NMNkdBVDNMcTdYbjBDa2pnWHpYelpCM0xHdmRGbG1ndi9CRkQ2ajQ1?=
 =?utf-8?B?UGN6UGtmQTdhU3pidEZJaEp6WXJRQTRKQitoakxKWnVyNW1GeGw0T0cvMS8r?=
 =?utf-8?B?NWlwclR1L3lBQzh2enBoTVZ3Sklzb01GRFgxdG5BeXI3VUtKRUJERmtyemxW?=
 =?utf-8?B?YmFxMnlVUFZvU1lGa2luUlJ0L2dWWENPRllvZlZKMXlCSGNmOWNaSXNFRnhQ?=
 =?utf-8?B?YVhrMjBpOExTZEl2VVRrejhPUGRRVmdZUVJUSzRTaTY0Z2grZndiMDRaZHhv?=
 =?utf-8?B?UGNUcHBVd3dzUlljN3RhbTVENVlIQUl2V1VKOTZrbjhtYWFmUVdLNC9wWkQz?=
 =?utf-8?B?M29QcE1pL21nSDVMbWtibXYyZGVRTzNpbTMveEt5d2tJTjZxcHVxd09DYzBN?=
 =?utf-8?B?NlBsUWUzUGpwUUhlZXJRUWF4RUgrd1d0TERIbXJhT244QmJTK3ZUSjF4MXN5?=
 =?utf-8?B?RmkwckQra0NISVJNNHcrMGd1QmNuclQ5MFo2ZXkwaXJEbnJBT0YvbmhRRmUv?=
 =?utf-8?B?bFdmbVVQNCt5NXYveFB1dTJvd1Nvd1Y4c29QMzlHZTZDZjg3dDhsVmEyakpm?=
 =?utf-8?B?a2w3RnJlbWNHRGhGSGk1L1orclVDQ3dVQVlSUjUrakxaU2FhUm5UZElDN1Jj?=
 =?utf-8?B?b25xdklodGRmVGMrS3V1bWpCYWFxZ0ZnWncyWDBYVG92MGtsWjdXcWdPS1pU?=
 =?utf-8?B?cTUrejBUVDBQUzFUUGRKM2ZobEcwV1BhcEtadEoyVVN5bzYxYnllOWhGNXo4?=
 =?utf-8?B?MVp3T0xEZzVYYlhKVTF2am1hd1hUVkFFcmVyRXlyNXp4YW5CU2JvK2MvenR0?=
 =?utf-8?B?NlQwdkptYkM0YWFHWjJsUENoajVmMlg1UlFiNk1CWDQ1QVE5VTQ5YUswZWZC?=
 =?utf-8?B?MVhuR0FOeVBtTXZXTHhJSXB1TTR5RTRMcVVzQ0RNcmxucW9udWdvNlRnQXN3?=
 =?utf-8?B?QnlWcW5Ibm9RYzRWa1hoUjBIZFhpcUNwbGFibEpCemh6WjZSbEZQdy9CcUEw?=
 =?utf-8?B?bGRlOGk0c0tZb2Q5eWtBL1lqeWc0eC9nbFFFbnNLUzZlOTJaNGpIeGVETGxl?=
 =?utf-8?B?Z25FUTVXYUpLZTR1U0NuMU9jRUdCWC92akpPdXFFM3lwM2cyd095QWsvMzVH?=
 =?utf-8?B?b1NraVpnNVRLVGJ3d2lHKzdqOStRL3EwODV2SzZEQnc0UHgxVEJNenIrbGdK?=
 =?utf-8?B?ZWRCS3JQRllMTCtjQjc3eXhRWDhlUDI0RElsRURaUnpwTmNVM1NQaFdSSk1k?=
 =?utf-8?B?aHV5NW5Pc0p1dVdteHFDN1A2VDhiRDN4Q2JlWlBtS0kvQ3JWV0oweDh4NW8x?=
 =?utf-8?B?VHZsUGZ1ZWQ0SlNGQjFJRjhEczRmUU0vTEdSRWRiSUVFMjltOGw1YTFKOGV5?=
 =?utf-8?B?YVZsZkQyMmY5RW1qcExGSXhxV3pnS1hvLzNtQmxrMEpnbjI0Y1dDNEI5eDM1?=
 =?utf-8?B?blc1dThGSXkvTU8rU1RHTXJPa3Z0enh0TVY0eWp6QXNxbTBLbFEreHB3anAv?=
 =?utf-8?B?akR2UGhIeFMrYzk3VkZHUE81NTBqaUF0aUc0SWllVHpZUWg3YTNBcllHMUYv?=
 =?utf-8?B?WlU0V0h1S1hwYzBCQWowUXo2bE4rMFVwYlpvZEF2eHJNZm1Ld213ZktCenVq?=
 =?utf-8?B?cm90V1RDLzhESTZFM0lKYW5RaTRoU2prUnJHTG5rSVNPL1BZenFUNEpsVmp5?=
 =?utf-8?B?c2FpWGFjb3FNK1g3cS8zNnA0TkVZekFOTUt0dVFuSGNtNmR3bkZ0YmsyQ2g4?=
 =?utf-8?B?SWhqRVdyMzFnZWg4YUlON0MwVVRzK2hoa1lKNnRyWHVvNHBmQ2FKa1Nmc3J5?=
 =?utf-8?B?UkFuY1FHTWVmNmV3cTUxalNpRjZ6NFFDWWZYeG5kMjg5cVg5T3RVZ3VqZGxj?=
 =?utf-8?B?R0RBSzYwaXA4eDRILzhqVGNwTUtqdFNHUll3SlAxTGhOWERJc2J3akhEV1Fq?=
 =?utf-8?Q?MFrm2i18ekBclsazuX0D/4k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc24f96-c4d6-4d41-c0e9-08dd4743dad4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:51:31.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX2jw9geA2p4LiCGvmMVBX2EbhmpmEoECYsiM9QPEr3FkfTcs007Q7N+DAiC9vCZKMS3pxabenYdqgGks7icxnU3eHHdjZZ/qF3q9IAhCZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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



On 07-02-2025 11:48, Riana Tauro wrote:
> 
> Hi Himal
> 
> On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 06-02-2025 16:13, Riana Tauro wrote:
>>> When the engine events are created, acquire GT forcewake to read gpm
>>> timestamp required for the events and release on event destroy. This
>>> cannot be done during read due to the raw spinlock held my pmu.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pmu.c       | 47 +++++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> index 06a1c72a3838..5b5fe4424aba 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -7,6 +7,7 @@
>>>   #include <linux/device.h>
>>>   #include "xe_device.h"
>>> +#include "xe_force_wake.h"
>>>   #include "xe_gt_idle.h"
>>>   #include "xe_guc_engine_activity.h"
>>>   #include "xe_hw_engine.h"
>>> @@ -102,6 +103,36 @@ static struct xe_hw_engine *event_to_hwe(struct 
>>> perf_event *event)
>>>       return hwe;
>>>   }
>>> +static bool is_engine_event(u64 config)
>>> +{
>>> +    unsigned int event_id = config_to_event_id(config);
>>> +
>>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>> +}
>>> +
>>> +static void event_gt_forcewake(struct perf_event *event)
>>> +{
>>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>> pmu.base);
>>> +    u64 config = event->attr.config;
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +    struct xe_gt *gt;
>>> +    unsigned int fw_ref;
>>> +
>>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>> +    if (!gt || !is_engine_event(config))
>>> +        return;
>>> +
>>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +    if (!fw_ref)
>>> +        return;
>>> +
>>> +    if (!pmu->fw_ref)
>>> +        pmu->fw_ref = fw_ref;
>>> +
>>> +    pmu->fw_count++;
>>> +}
>>> +
>>>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>                   unsigned int id)
>>>   {
>>> @@ -144,6 +175,13 @@ static bool event_param_valid(struct perf_event 
>>> *event)
>>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>>   {
>>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>> pmu.base);
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +    struct xe_gt *gt;
>>> +
>>> +    if (pmu->fw_count--) {
>>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>> +    }
>>
>>
>> Considering that fw->lock will be acquired and released multiple times 
>> during the put operation, this might create an overhead.
>>
>> How about implementing a _put function that can take the number of 
>> refcounts to decrement as an input parameter, similar to 
>> xe_force_wake_put_many?
> Could you give more details on your suggestion? Would put_many just 
> decrement the count? But wouldn't that still require a lock? Multiple 
> event_destroys can call the function at the same time right?

I was thinking about putting all refcounts at the end of last event 
destroy in case of multiple pmu's.

> 
> 
> One thing that can be done is to take forcewake on first count and 
> release it when the last event is destroyed in cases of multiple
> pmu being used

This sounds even better.

>>
>> If the overhead has already been considered and found to be 
>> acceptable, I am fine with avoiding unnecessary modifications to this 
>> patch.
> This is the first rev for this patch. Open to suggestions
> 
> Background for this patch: force_wake is needed to read the timestamp
> register required for engine events.Cannot take it while reading the 
> register from pmu_read due to a lockdep splat (PROVE_RAW_LOCK_NESTING).
> 
> The suggestion was to take forcewake throughout the duration of event 
> being read
> 
> Thanks
> Riana
>>
>>
>>>       drm_WARN_ON(&xe->drm, event->parent);
>>>       xe_pm_runtime_put(xe);
>>> @@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct perf_event 
>>> *event)
>>>       if (!event->parent) {
>>>           drm_dev_get(&xe->drm);
>>>           xe_pm_runtime_get(xe);
>>> +        event_gt_forcewake(event);
>>>           event->destroy = xe_pmu_event_destroy;
>>>       }
>>>       return 0;
>>>   }
>>> -static u64 read_engine_events(struct perf_event *event)
>>> +static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>   {
>>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>> pmu.base);
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>       struct xe_hw_engine *hwe;
>>>       u64 val = 0;
>>> +    if (!pmu->fw_count)
>>> +        return prev;
>>> +
>>>       hwe = event_to_hwe(event);
>>>       if (!hwe)
>>>           drm_warn(&xe->drm, "unknown pmu engine\n");
>>> @@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct perf_event 
>>> *event, u64 prev)
>>>           return xe_gt_idle_residency_msec(&gt->gtidle);
>>>       case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>       case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>> -        return read_engine_events(event);
>>> +        return read_engine_events(event, prev);
>>>       }
>>>       return 0;
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/ 
>>> xe_pmu_types.h
>>> index f5ba4d56622c..134b3400b19c 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>> @@ -30,6 +30,14 @@ struct xe_pmu {
>>>        * @name: Name as registered with perf core.
>>>        */
>>>       const char *name;
>>> +    /**
>>> +     * @fw_ref: force_wake ref
>>> +     */
>>> +    unsigned int fw_ref;
>>> +    /**
>>> +     * @fw_count: force_wake count
>>> +     */
>>> +    unsigned int fw_count;
>>>       /**
>>>        * @supported_events: Bitmap of supported events, indexed by 
>>> event id
>>>        */
>>
> 

