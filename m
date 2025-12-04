Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB196D1F9A0
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 09:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8110E8F4;
	Thu,  4 Dec 2025 09:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbcrgohj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1310E8F4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764841378; x=1796377378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sBw3T84cLZ/f72B7XycdJ/714cQCssBwqZ7Yt0jlA+w=;
 b=lbcrgohjMsfE4gTN3NchQEa5kRkQlGlwZnrB+kr8CEMUefz52plEt1Cr
 EFware8fmOCqFFkSbTIxdeg6BSffgyZ6hL6xMJ0kWXElXstZXcAPShFcu
 bQNiW81xMXJzEF2NR9lBYZyyJs/f9IE8inGVJA/8HdwjbN47hQvP3ffF5
 kAgKU5g+w1jK3ngzT9HrFojn0r1CMycBbggcdBHo9p/tC7Dl5D8Ohyqy8
 Crm7gL7bqOZ9Z9lnPa5ToK7T9KL5cG5xKYFhSjF6778fxt9HfHsdWmpf3
 9kosePO1RadUdBjtoqWbg8bUJt4PiawBwvQEnhQ9mVCdT5Aj29Axs0Xhh g==;
X-CSE-ConnectionGUID: rhl8OK9MQ9uc+Hc06FEiug==
X-CSE-MsgGUID: eSdSB+xBRCipNJrrCHViWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69447393"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="69447393"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 01:42:57 -0800
X-CSE-ConnectionGUID: AqF81dHtRrqNa/JhI/obxQ==
X-CSE-MsgGUID: UIZF0s9DTDGVHNwGalsl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="225607138"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 01:42:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 01:42:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 01:42:55 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 01:42:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4B5JSNH+0kngLMVFKajBLt7MRl1WqpevtOaNfpxRADM4c/UvwWNWT8/XthkRy+y8vY4xK9RJf0foc1ZHPw6LzmmtNhcDqopMWbTB/CtjQ0Ub0+rsezlal3CzlURd/IwXur2kiboaWvndb19vLfY2iD8qMD4y0weIQqV0BGuuqYo2qk2TIjNjp2030u3JhAcbYmcKWzn/pq6QG5STLakykwZpU29+60u4XVC0yzKWaq83TawIzo9ggO0rpnNdxZfueDk+bKe9eckTvHZx3XiL+ExvTJK5sSz+tgwT1m3hEC5jtREGe0VTtEmlX5bUt6N1Qxc9JWTZxT7WVRfU74OVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boRuvcGHa5ERuW0myDAEVW+sQdU+3lDyiOqOV+lhlgk=;
 b=CDdq1tQ8nUBrXCQ264LR9GEKm80/rvdg8d/3rkfc9Y8nwtGxeu7vFZ319x8ev9n4LkoF9O8rjRkTf3BMF29ENM7zqKncSzVDi9F0Hu1kfO5kbZ/3MEHv0cBiyEprXYTbFeW9mL8byY8t802fDndgB4hASVRr5Wjn9BRu0YOT9MxyZZLKrd/wOhYExfLYO3YBcRmV76/niXpUhu2sqi/QOC85Swj1+4Ug5ApAsucvJPJvpuNwLDqWSjLS0SoqXjki5xPGY72P4EV+iPsgZEiyBdvNAmoNFf0qujpqdTok2UqxEcwSJq1fnoZ6wRzclJ0pVeWcEza3IoccpeDzpiN98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 09:42:46 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 09:42:46 +0000
Message-ID: <764e770a-42af-44c5-82f8-7dcdb2204843@intel.com>
Date: Thu, 4 Dec 2025 15:12:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/throttle: Skip reason prefix while emitting
 array
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20251203123355.571606-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20251203123355.571606-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac72797-e9cf-41ee-a259-08de33197abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUErSGxKQkZqOFVSbjU3TUJBRnBVcDNmN200TVdaVkw5WmxhOHl6NloxTi8x?=
 =?utf-8?B?UkF1Mlg4NlFWcWpnTitPMEx5R3hJbjF0TWdCMVJxNk0ycWhuMTUwdGVWQk5J?=
 =?utf-8?B?SHB2UzZ1MThLUjNaL29CL1Y0RzlCOWVzcW56ck1oVVkyS041SVBUT2RwR3VT?=
 =?utf-8?B?alNtcnV6SW15bUZiSWxRWkZEWHhIMlZjYndneElLU2xEYXJsZGJ6Ymt6WUNF?=
 =?utf-8?B?ZjF6MWV3K1ZXMmJMVzcrRldIWWNXbjRHbk8wbWFGN2J0a3ovVUxWQWlDMEV3?=
 =?utf-8?B?enNNZXFjNDJNOXlCQ0U2VEtZT29NWkJNZTlGZnRxb2tyekNkYVVoanZZNTJn?=
 =?utf-8?B?NlVzckdONkdZcFcvVzhOcHVJclRIVkgybU1GV0NpQzg5aFIrTWNVN055WWIz?=
 =?utf-8?B?aTBsbm5aTGkyMVkrS2NOV0lxZThRYUpldDNCTUk4NVFRYVRRREcyQUxEaWJC?=
 =?utf-8?B?VGk2TGRxT0o0cXRXS2tPYTFXTTJ5Sld4R1NieHBIUFB0d3lmNDRPUFJVSERF?=
 =?utf-8?B?NXRwTkZRK1ZoY2Jxc3ExVE5CRlplUDYrL2hhL3E3SE1jd0hFNVo1WklpM21K?=
 =?utf-8?B?RkVzQXNWL0RlSGVVWFVyRy9LaGdBWG5QL2g0YkFVUXV3Y2c0NVBwWXg1bkJk?=
 =?utf-8?B?dExwZ3g2cEJRQ1c1Z1N1NEZKclBmNms0bEl6VVFnWFE4Snh4aUhNOGVEK1Mv?=
 =?utf-8?B?RXhEQUNHeWI0cU0yZDNsM2hyMFRJWVlMTFJIK2dIK2hNUXNDakJSRkUrS1RN?=
 =?utf-8?B?RTZiU3g3Rnhha21ZdU53RndVS2VCRmxTaEUvM2VtTXFhdXZmWUZQblY2ZWdK?=
 =?utf-8?B?c0hVWFJWR2RNeUxxSjFoUlQrOThQOVJBelJjbnBWVkdUT1pjWENmSGxlU2FV?=
 =?utf-8?B?WFFBSGtUMWFrOWs2N1h1SE5VTDdEMXdNTkg0V0ozcHNxV3RyQ1NkdVgxRzI3?=
 =?utf-8?B?MG1WWjR3NjZDN2tvdmY1MmpENzhjeFpaNTBOQVFsNTlqR1Y1SGx1NmVOQUxZ?=
 =?utf-8?B?eDJWR29KWS9tRnB6L3BNeVJ0NUFRenRVRHR4WHdPV05WRytYeDdGUGM4U3Iz?=
 =?utf-8?B?amtFb1JncmU1VDNXdHBWakpiN2NwK1Z5dnlWeE1weWsxUDdiQlJDMzlzdXY4?=
 =?utf-8?B?M3lSRVAyVjgyWkI0d2VqbExaRE4ydmpPUm9UV0VLT2JyQzVOQ3hiK0pwWHV5?=
 =?utf-8?B?ZDU1NHVjVXZFUUdPYzR1SWUzL2luY2ZkcTU0MXZWOG44c0ZyTFR0V0VEOFFk?=
 =?utf-8?B?L3ZnbGJTS2xQTEtqMU1oYTV5ZVp1R0RVSjRSVmlvb2VLMXNLS2R5Z3dXZDI3?=
 =?utf-8?B?ZXZpcU1pUW9SQVZGSnVLYzJmN2x3cHdSZkhVMGdPcVBOSStlUnMyZFpoS0JD?=
 =?utf-8?B?MDlvUERZdmJqTGlRWjFtSU1kQ2cxWHU1U2M5YmhwMUlxSjh3UUNHUTJVK3hw?=
 =?utf-8?B?VkY5amx1RXpkZzBFWnBseEJUWCtrdHNrc1R2RVpudUxpNURNTU1SOHdhMzJM?=
 =?utf-8?B?bnR4MkU4NThpblN1UjYxWTN1ZXFOV2VWc01GazFrRW45cDd3N1NyT1crYk5n?=
 =?utf-8?B?RTNwNlhKa1FIQXp1d1lJU2xsNGdaZ21qbndaTVVUNkdMK2daSUZ6UFk5c1dn?=
 =?utf-8?B?OExDNHVObWY5M1pqaGhsYmFGY1ZyeHNPRHFQSlpBdW02OFJoMkpaNWNGazJ4?=
 =?utf-8?B?YW05Umw3R1hPVU5IMFNuc3FsRXRZSDYrK21hT3VKZ1I1ZVFMOUY5SXN5QzhI?=
 =?utf-8?B?bXR1SWxMYmhNYmVXTEQ3ZTh2OWNJZXpHSTgvb0RkRGEvN1pWQ0RSWE1tNU5C?=
 =?utf-8?B?MC8yU0pjY0N0UnZub3FDUFQzb280bHdTdFBRSkVBdzg0djM5cThCaWhTVi9p?=
 =?utf-8?B?UXRnRXV0eFJ2ajJvMVdZYzRhSUZ0eTJiSHFaZFNKV0ZpTGdiMWxyMTN1cWM3?=
 =?utf-8?Q?UUWeLXcDvcPeovNG7F6i78k12yt8NiQU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEduMUxpK1kvU0NkU2tpS3ZhZ3BqckhXamNseCthMDE1b2Yyc3JWeFdDSXJp?=
 =?utf-8?B?TFRsdjNaL0N6Zzc0WGQwYk93R1B1QnFRS1JNcGovT0VoMEVHVVlQRG9FcXZ4?=
 =?utf-8?B?QW9sbzhpb0JXek9LL3RYZmNCWGFwTHRyaHZkdHMrd0psTmZOTFNOdlhvVVZW?=
 =?utf-8?B?Y3pIcEs4MU9nNmRHaTZSQ0ZjTGtrUU5NOWd0QVlaK2dJSUdXaVQzTi83RG56?=
 =?utf-8?B?bkc3WlFFRTBlUm9oUDV2ekVTbHBZL0EyQ2o1U2srMFAzeUZwaU12d3Ftamtx?=
 =?utf-8?B?cDZoS3BHSWdPNE1sZmNTVmFZMWJSM0tLV2huVDlxV3ZQR1ZjU1crQTJqVmhy?=
 =?utf-8?B?U1dYSjNoQ1g0UmNrT3k5MjdDL0RpNmdyZ3FBdlRDUmhHOHMrM2ZVREF2TmFl?=
 =?utf-8?B?UHRRL21IR2FGSEZkV3hCV09Wek11MTgvUGl0MUVySmRiS1NEUFJqZkVZc0FI?=
 =?utf-8?B?K0hneHFsU1pEMGFkR1lvejlzR2p4S3YxcVBiaUhGcmVqZEpVL0xoV2ZFc2Ji?=
 =?utf-8?B?SGdnRE84Uko3K2gzVFZZYzB1Rk1yQzZCelFzeCtxNTkvRzZEcisvb2JFUnE1?=
 =?utf-8?B?cWRsZTlzKzUyUm1vTjVLZEdrbUl6V1BTY1ZHUW9QRnE1VWlkSk92Z1JSeXM5?=
 =?utf-8?B?WFdVNGZHY3RJaFpUMDNxWS9WSXpmUklXbW5GQlVwNVFZemkvbGdUZTRPTlNN?=
 =?utf-8?B?UHNiN0U4MlNOM1BLYjl3OEVweXczaDJ1RkJQcDhRUm90RysxOVVnbTUrQXJl?=
 =?utf-8?B?eWFLTnVGVnRpY1krWWo0Z0g0UUFxUTBtRnNFcmZNWW1md2NiN0diaG9iNjE1?=
 =?utf-8?B?UmRuK2VRcGZjeVRvOUNZbUVZSnJVa2p3NWxwQ1R6QXphVFNqUE1vYk43akJm?=
 =?utf-8?B?ZkFvclJoZnZ5Q2M4NmVkY2FXaU8yWnBEYitpUWFJNk5pYkpOWnZGSzNVb2RU?=
 =?utf-8?B?cC85OHphZE03aFVHYUxaTXJ5QXhMaUREc1BiSGtFS3B4dWdkdS9sYXpxTUhZ?=
 =?utf-8?B?Qm1nVVcwMnpTTkJTUGNTVm4xMGw2Nmxqd0lha2JQQTl0b04zYlNVL0poVys3?=
 =?utf-8?B?UGNEREJQQVdRNkxRdXh6NGZYbVB3UzFLUngvSjhBdVB5NmErUDU4N0krbzVN?=
 =?utf-8?B?SEtFdTA2SDZ1dTAzeTdNSSs0Vis3b1d5SXBSaitVRHJvU1hTWm1LaWRDOUtj?=
 =?utf-8?B?RVBMYzNrNjVONFZiSlJoS0t2cFdaMVhXVjBuM0tyMytxb3EzWjVJS01lYjVE?=
 =?utf-8?B?ZGMwZDBUanp5ZzUrampXTDNQcHg1cVdYVHV1N245aG9EVGRSYmdqbUI1elFa?=
 =?utf-8?B?YjVTbVBPRG9PWTl1eEc0czNOWVpjeUtnUHBtY2hZMFQ4TEZ2ZXpuZ3FMQ0xx?=
 =?utf-8?B?b3pFOVN5M0xManI1dWNuVUVTeFBKM3ROUXhEMElDMUJyVGpxSDlQeXZhTk42?=
 =?utf-8?B?K1ArMlJkRExKZW9MMmFvRkdOUTREM3QzVVF4dk4vakZObWRBOHl4WU10STJu?=
 =?utf-8?B?ZStCUkVHTDUrMkp6ekxSWThOT2l5NjF5eU5mWW1HUnNQMndhT3ZRRzdXZDNr?=
 =?utf-8?B?Zk5YbXRod3VGUC8ySmVRaWxRTDR1UGx4RUI0RmkzVnp1RzNWdG41UW5PNEh2?=
 =?utf-8?B?Tmx4dGkyRWk1ZEFDcFhJWm1ORHhMUUdvN2FUTXdDdFIvb0ZTT2tpSWg3MWhF?=
 =?utf-8?B?L0hpb2lvcVdjSHFyMTUvZVRCd0JDTnRpd2E4WDZnZm4xdmVrblQ2L1h2eVRE?=
 =?utf-8?B?VnpzNkpqRTkzdG1HUlVZYjNqUWpmSkI0cnVnS0VGdEdKaW44ang2WVgxcWE5?=
 =?utf-8?B?dmdHRHd0c2lyN3BlUXUrc3B3YmlmbFl0TWFLQThYdXlNQmZEYnhYN2xuTVpP?=
 =?utf-8?B?RFFEeU5qQnVCYXp1dE1aYnVKL1lxTnQzN1BNMHZ2c1dVd0U2c1p3SVlMaHhO?=
 =?utf-8?B?aENHZS95QmEyNjYybWFsNW5rRSs3dHpBbkJldU5TU1Vad1RRU3QyZFJNMW85?=
 =?utf-8?B?ZnlVTWpiVEloNFNCMTRibkxMSExzZG05Z2M0c3Jpcm9qVTJEWWFjVjM1TjVK?=
 =?utf-8?B?WGxZNlhaUUtURWF0RWI3eGZoai9LMVg4eDZZcEVUK01CU3pBRm4ydFMxWU9x?=
 =?utf-8?Q?ViKk/7iWePRNibJh1ASmfh7DV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac72797-e9cf-41ee-a259-08de33197abf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:42:46.3004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6qdHvun6Qdc7POVfNfEf85gHEke6rh6ejDvoTQiyK6CJ8Bu5UmzDdWXg4JycYq1+kZPUHrz3jsVJ9Ogi4uXFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

Hi,

On 03-12-2025 06:03 pm, Raag Jadav wrote:
> The newly introduced "reasons" attribute already signifies possible
> reasons for throttling and makes the prefix in individual attribute
> names redundant while emitting them as an array. Skip the prefix.
>
> Fixes: 83ccde67a3f7 ("drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_throttle.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 096a6187ff12..570358310e97 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -137,7 +137,7 @@ static ssize_t reasons_show(struct kobject *kobj,
>   		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>   
>   		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> -			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name + strlen("reason_"));
>   	}
>   
>   	if (drm_WARN_ONCE(&xe->drm, !ret, "Unknown reason: %#x\n", reasons))
LGTM.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>


Anirban

