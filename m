Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED02C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 17:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4DE10E062;
	Tue, 14 May 2024 17:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFE9ibqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF3D10E062
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715707936; x=1747243936;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=23zrbFppDYWQEmmM7drAy11OxhSVqXbnhAD0X7gaV10=;
 b=LFE9ibqS8ElKfru1mLdhpTt+J2wZK8gbYMZm389RtKBf4cDo7S+5XDip
 mUD/tnLYjGcDWXXdh/jZ0v9YGTuLgFCHFN6ItHkWrNeYpavKJdusfTKdE
 cFaW1ysA0fm80M9Ak6MJqB9lJdE3MzqU1fkpokflT7dRtI5YVMNjSGHjN
 rCYLSPJQKH/Dc69Dlhwa3RlFqE/S7sg9H+pfbbsiA/CaX3nFo1gpG0NjK
 woncDb5df9Nqm+toVXYxjQRr7IcO7kC2yiLkk99pASQkP/2ATZ+1V+PTB
 gr7PTA7v/n9AtmRP2O7cgfJJX9NMuRSKXIYzhy1EiVBt5Ci3CInXJR/Ep A==;
X-CSE-ConnectionGUID: VT62nRxyR7SbiliRuy3BJA==
X-CSE-MsgGUID: sNYnHQpEQEOgcwa3IwjBIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11559744"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11559744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 10:32:16 -0700
X-CSE-ConnectionGUID: 0Rp/C4Y8SgCsBzP4de89mA==
X-CSE-MsgGUID: u8qLEErZQ92DC2IFQyJJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61582513"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 10:32:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 10:32:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 10:32:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 10:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFkksOtGHAApxHZDCPlzC6u5D33VOsK95wVVWDte5YosjimsfyFkWN1FaEJz0yB1VLRozL/1ZanLjOwNdL14tadI8A8QnPzE3+1NoJ9v5fOWEu3qdsu9OuI6zNgHpptz62sNvzboa3Tzg8DST8fbTeyG2beOoJKhAw8CKSv/L3KJTp3OFdgboVz6qOBKLwtsFgMnvyEy2uwGCFqBcHKI3BF75YCGuz9AGHOAD3RktX+Fa+lTBY2RwxPVdBfsbmhTw8z6PvlBRlirULU4Fpjrila3w40C+OLZVniUJkweMOanlthdbKE3OzBAUPicaGp3OA6inp9zJI9tPqhC1AApCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SaSE+GIFwaCMQnWZDD3mlD8yp05rfJyTPpe4Dmsuss=;
 b=CU5uxiZ5cGJv8c+HKsrdmTWPgC1Ee9vjI6xK5YJD5EoOosVEJEWh9BBs+BxyRFDxvhrr05jmupAH8wTYPhzTHZsphh52vcTFJ7o66N9gQg8K5KTeL/ENFYMbjm6Os5IRGBvbVZPeq8Wgo6xaCIVQ9E5+74p7bjvTr8HDZRmV4U1JnfJXZ24/9znvnQTTgr3MmVIozvU+TywaPKCOyMoUPu30YX17Ppa/nkAfENgyrsDWIlEAg4QvAOSONVpaaBO4X9XLpxcsINGSNMoy4L5q3typz3cqHCuZO8kLVG/8JwVvRNZhx8KLXh1NHWhu5VWVUxukO5ZtrvCqfZ1KkiHg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 17:32:12 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 17:32:12 +0000
Message-ID: <ba495159-24ca-4dfd-b890-7ee126d8d719@intel.com>
Date: Tue, 14 May 2024 13:32:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: John Harrison <john.c.harrison@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <28b8fef5-14fd-48fc-92c7-09196d7f6680@intel.com>
 <efeef3d8-d656-4dce-af2a-516ff6be1382@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <efeef3d8-d656-4dce-af2a-516ff6be1382@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 29014c0e-573a-4d59-44b3-08dc743bc9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmlQSVJDNlJZbU90RGhpYUdIS1lLY1ozTjViOW9MN1FwTDFyWmlCdUxZMFh5?=
 =?utf-8?B?VGJhN1dYSFVhUW15N1NoSExkNDY0YlVrRDYwN20wd2tteFVjOXdkOXdsZTJl?=
 =?utf-8?B?V2c3VGhGRXJIWjZnN0UzOC85OWFTZkUvYm0wM21nOTN1c2FvQ2p3bzg1eVU3?=
 =?utf-8?B?U3h2bnZhMHdkWmI0VHhqQ2R3S0dnK21aL3ovMkZoM212NVd1ME9ubFNLT1lT?=
 =?utf-8?B?dHFiekkxdkZNMldvTFBJd1FraSsvNnR4cjI1ODJLTEFRTWVSZ21ENStPTWtU?=
 =?utf-8?B?NkdCL0l1NTkwaklBSDNYTURjcDVrKzhLV1pvdk54aWRqRWpTMlZub01NaU9n?=
 =?utf-8?B?K2ZtNjV4WGFKWlIvNlZyM1Z5TzF0c0N2M0hiVmozR3VBSXIwL2EyeUxXSXAr?=
 =?utf-8?B?RG8zeWUrUGFWQ3pNVUxsTFhUc1ZZZ1djQW11b1lNdlJNUkp6bmNhMFVFUkFs?=
 =?utf-8?B?YnVtT3VWNnpaNHRYOVh5Z01PZWZ6RTIyK1B2eWNVNHc1RW1KYWdYOTBKK3lz?=
 =?utf-8?B?WDh0ZGx5cXB1S3BNVUF2UEVzWlJ3dFRpT2p5RFRtZ2dOQzFSZEJjY0ZvVEo3?=
 =?utf-8?B?MnBqQnQzK3pzN2ZjSXBZQUozd0JxVDF2cGZtZ0FpMndvR0JoakhwQ0FoNlpy?=
 =?utf-8?B?MXp6S0tNYmp0ZnVLRFdLMSs1eCtXUVFOcjNxWUZ1R3JsNWZwVW93Smh4b1lm?=
 =?utf-8?B?bHJVLzBvUjUzb1REWEc3YWw0SmN0K1lQaVRUeEtLd2FHZmZyN1ZhUDBsQVBX?=
 =?utf-8?B?M0ttSWFrUTIyeVpwcWY3RWlZaTY3Mk1OTDZZQjZUNXJ3K243RWF6dTk3OXRP?=
 =?utf-8?B?Y3V6RXhpTlBGdUdLMmM3TXVRenBOTEZna2xONEJRRWVKVHQ1N2lNMjFEU1Fk?=
 =?utf-8?B?MmpORXRkUEpRcENkaE5jaFN0S0ZCOWU5b2Fqa1FYdS9YcFlCR2l0TnB0TGx4?=
 =?utf-8?B?aytLSnFhU0ZXMzFmMkpRb3FFZTJhSkl2ei9OQi84cFhZOXpQQUh6TWRtdDlU?=
 =?utf-8?B?dTAzVTg1NW5RRFZ2bUlTMjV0ZnJBcWkxbEJMcEdjbk9HU1JVNGxjOXNQVHBR?=
 =?utf-8?B?RXI0QmFBUGhxMXk1NkJUTmw0RnRMVWttTjJEdUVLSC9GKy95bUZ6SVRPVkxG?=
 =?utf-8?B?TFNnTnFZTjIrUnhwZTNIU2x5MFFucFVacVhsR1JCUnozK3RadzdiTmNUQ2lq?=
 =?utf-8?B?bUlrRlQzTmIzUTBWeEFObzJRcTNLZ3ovZnF2aEdCcWpDZWNQT1Qrclh3cWlM?=
 =?utf-8?B?YVo3bEVRQUlKTEFjRllWcVpiN3haYlF4RUVtQXVKVzNueTVTVU9VUWlMT2JI?=
 =?utf-8?B?U0pEYUw4ejcvZEgwY3NyU3BNdEFhZmlRWVFYMjJCSVpvUWxZbk1NdmMyWTJQ?=
 =?utf-8?B?c2phblJITkNtTkNUN1NlM3h3K1JHYks0Q2hScDQyRHpIZlhsSnMwd1R6WDZs?=
 =?utf-8?B?V3FKVUhOTnRGaHRMdUVIajdPbjN5SnJFQWJ0ajQ0U0wweEdHcUNDR3dPMUZo?=
 =?utf-8?B?QXY1R1YxQkR2L3ArOER0dlpQYkVDMzFmQ0R2RmM0N2pHV3Y4bFk2Z2ZzSEhG?=
 =?utf-8?B?MDc5d3AvOFpyNUpJKzd5anFjNTJhLzRPdjV5bGxxRWhzSm9wYWkrZld4Znpk?=
 =?utf-8?B?eXYxRVozTzQ2ckFGL3Z1THZ4LysrWTZiTmhGa256VEYzNWVTT0xzZW5Rc0Fa?=
 =?utf-8?B?eXdCZ2RYV3NRN1N2MHRlSmZVVkN2cUt1bHQ0VFB6RkFmSTFkMXg1ZUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpGL0FMU3lhalVHclh5QVRwb0VVeHVmcXBGWmgxQzd3OVljYzFLUllwKzBs?=
 =?utf-8?B?T0xsSDVMWWdwMnI2bmFZcHBsZUk0OUZxSGNQdnNsQTVRNjhRRkdQdmhsUk5Z?=
 =?utf-8?B?ai9SeksvMWx5dlNsek9vMUN0OEFhbXR4bTZNa1E3QjVLS2QwK1RWWDdCVjJ0?=
 =?utf-8?B?QTRYTytNTnN6YlBmd3hvdUtQdHBDakhqbXBJVXlDYmd6cmEzTnRDcGhKWEFS?=
 =?utf-8?B?c20yTllvQno3VmtKc1RtVHhHdHA5bFVFSXBTWGZGTUhYanFyY01VN0pPbjV0?=
 =?utf-8?B?Ymd6TEMyeEtEa3ZmWFVmZUhveGRETFJ2L2xiRnlSRElTcmtNc1pUNzljMkNF?=
 =?utf-8?B?UlNsSG41cittYURwRVFoU2V0RzM1OWIyTmE4ODdhTVlmMkdpSU1iMTZ1TlRq?=
 =?utf-8?B?N0hMN2Rwb205TDdHYVdKL0JrbjM2bUV3L2RIam1GbFRQWkw3SjVENDc0SDFQ?=
 =?utf-8?B?SHJDMzhORmhxandLRVlTSXk0RHU4VFAwc09HQWxLcDlyWmYzNlVtVE9pUlhX?=
 =?utf-8?B?NjIwRlJnZFVpd0ZpdHE3Z1R2dnZDS3czZDRnaXBaWThydzF5NkZIelpadS9S?=
 =?utf-8?B?ZnZsMzZCRGRXYzNFNGUxdGFFS2pPWm5Ua1IxWUF4N0R2d01DODgrVndGTEpa?=
 =?utf-8?B?REN4c1JodURBcnNaaVp3WGJnTFgzSEVDbFEwNGo5RkxWV2laRDJHZDRRVkRD?=
 =?utf-8?B?QzEzZm5zV0xXRjBLSEpHcmV1K0FmNmtWOFJleTFDRDlBeExOcWJKK2RmQ0Y2?=
 =?utf-8?B?R0VqUHgrMEFlZ1dWQkVGNmZ2UkNMeHZTZCswMWhLK0pTZThWVVlsWm54UXJx?=
 =?utf-8?B?a0FFck5MaThKdmtXa0NCdEo5ZHpMUkpUUUFMNTh4YmZNNVU3amtkdE9Nd3Fs?=
 =?utf-8?B?STFoZUZnbzVuMWtOZEVYZHZteHlQbEZXOTViVmhibjJGMUtaK0JYVFFsVC9s?=
 =?utf-8?B?OVlVVVVyd0NibFQvOHp5L1drdmhBclpySDlOaWs0Ly91V0xVYjN1b1pCZ280?=
 =?utf-8?B?bmZITlkyT0RhZDFHMDlBc2dLSzd3WCsxQ0lLV1JldWFEUm1uQVh3blJBcmEy?=
 =?utf-8?B?UXM4WnAraDdsMkx0WkQ1ZFRXMXFMUlFPcHY1TDFHbXhjWFhvSks0LzlRUzht?=
 =?utf-8?B?cVpJL0lvQUxGZk8vcTRpdXdnVU1xemJlR2RQRVFmL2MxWXE2QUpqOGt0R2JH?=
 =?utf-8?B?SnlEMFdvRzBZdzlUdG02U0NNOEFPYXduTDFlSkRIaWxWSXg3NE1JUzI4QkNr?=
 =?utf-8?B?ZXE2Q2RnU2dFRWMrWlVMajEyQWhtUjU3ZUpIRitZbTJjQllTVEZ2dEdhRzQ2?=
 =?utf-8?B?TEl5WExETzJldlI5V3ZDUXN0c1BRY1BzcG5mK0pzenhIK0NnNG8wTFpNTEZB?=
 =?utf-8?B?WXdwczBVOFdNQk9OS1RUS21wMSt1NG5NVUZUQzZKVEUzMWFxU0t4bXdDc3RM?=
 =?utf-8?B?Wm5lYXZ4RGx1ZlViM2NpS0VLNUwwOUQ3dGtjSXk5Y0xTZ1YweFVlc1k0dFFo?=
 =?utf-8?B?ZktJcnp3MWFLazBOdzBNWDhVTmp0ZW45a3Yzdy8veHhaMGR0TjYwdEJsMDNo?=
 =?utf-8?B?NjJOTnhqdVF2LzhWQmN4RnF4RlM1MGZ5dGhzMVgxa0JBTVNRbDV6SFZncmhX?=
 =?utf-8?B?VDVqZ2lNRC8zc09TS1B1QUhPWGFQZ2FRT2JNQUxlWFJyK1lVYm8vbmRNektW?=
 =?utf-8?B?VWtXM0pMZDY4YlBBY0svVXI4eUdLVEwzNURab1RVTENmd2g0bWJMa3JJYzdl?=
 =?utf-8?B?WDQ2R0tEemVMdXQ4bmhXMzQwaGl2Vk5WMlBCeHYyVDF3eHpJc3Y5Q1padTdQ?=
 =?utf-8?B?Mmh5N3VoVlkzeVpaVHloakdsTzJqTFhycHh2Uk1ld3ViZDREN0VnWkx4ZzlW?=
 =?utf-8?B?N21LdGFvYi9ROWVpOFRDV1daVVpGZjNWTmR6dUdsTDhTNmpUZXRBVDRBczVL?=
 =?utf-8?B?SzdMWFFOa0xSUEV1bXRPQ0RKQ2dZbGJoKzNoSFhQNjl0d2E2V0JacEtMckgx?=
 =?utf-8?B?elF0ejFpakxkdHp3bExXNDJQVU1DZ0I4ckdNakVDT1lrSXArdDF0ZWNYa3pD?=
 =?utf-8?B?S25YTEZhc0Q1ejlIOEhFaG0yeVlHTFl6WSt3WVFJSGpGMlduRjdKTld5OWhx?=
 =?utf-8?B?NW0zMHovd2dLdmRyYVE2MHRkTDhveHQ1dlBOQmFiNjV2UnpwdWp2MTJXYjQx?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29014c0e-573a-4d59-44b3-08dc743bc9da
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 17:32:11.9685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /POLlEyICUtKxiqb8k6RgDAwqF8c6FQjc59GH+V1DmVE21h0Dfwg9iuH11YUtiLW2ZOGPhdfGSsyJWnBr8erlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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



On 2024-05-13 1:13 p.m., John Harrison wrote:
> On 5/13/2024 08:21, Dong, Zhanjun wrote:
>> On 2024-05-08 6:49 p.m., John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>> ...
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> index 11682e675e0f..45fb3707fabe 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> ...
>>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>>           CAPTURE_BUFFER_SIZE;
>>>   }
>>>   +#define BYTES_PER_WORD        sizeof(u32)
>>> +#define WORDS_PER_DUMP        8
>>> +#define DUMPS_PER_LINE        4
>>> +#define LINES_PER_READ        4
>>> +#define WORDS_PER_READ        (WORDS_PER_DUMP * DUMPS_PER_LINE * 
>>> LINES_PER_READ)
>>> +
>>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>   {
>>> +    static int g_count;
>>> +    struct xe_gt *gt = log_to_gt(log);
>>> +    struct xe_guc *guc = log_to_guc(log);
>>> +    struct xe_uc_fw_version *ver_f = 
>>> &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>> +    struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>>       struct xe_device *xe = log_to_xe(log);
>>>       size_t size;
>>> -    int i, j;
>>> +    char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>>> +    int l_count = g_count++;
>>> +    int line = 0;
>>> +    int i, j, k;
>>> +    u64 ktime;
>>> +    u32 stamp;
>>>         xe_assert(xe, log->bo);
>>>         size = log->bo->size;
>>>   -#define DW_PER_READ        128
>>> -    xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>>> -    for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>>> -        u32 read[DW_PER_READ];
>>> -
>>> -        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>>> -                   DW_PER_READ * sizeof(u32));
>>> -#define DW_PER_PRINT        4
>>> -        for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>>> -            u32 *print = read + j * DW_PER_PRINT;
>>> -
>>> -            drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>>> -                   *(print + 0), *(print + 1),
>>> -                   *(print + 2), *(print + 3));
>>> +    drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>>> +           l_count, line++, __builtin_return_address(0));
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted 
>>> %u.%u.%u)\n",
>>> +           l_count, line++,
>>> +           ver_f->major, ver_f->minor, ver_f->patch,
>>> +           ver_w->major, ver_w->minor, ver_w->patch);
>>> +    drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, 
>>> line++, guc->fw.path);
>>> +
>>> +    ktime = ktime_get_boottime_ns();
>>> +    drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX 
>>> [%llu]\n",
>>> +           l_count, line++, ktime, ktime);
>>> +
>>> +    stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>>> +    drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>>> +           l_count, line++, stamp, stamp);
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>>> +           l_count, line++, gt->info.reference_clock);
>>> +
>>> +    xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>> Could we have a "start tag" print here? Make it easier for parser to 
>> find dump start.
>> Although we have the "[Capture/%d.%d] CS timestamp frequency:" ahead, 
>> which might be an "in-explicit start tag", but if something added 
>> after it in the future, this "in-explicit start tag" will causes 
>> parser broken.
>> A simple "[Capture/%d.%d] Dump start\n" liked tag is more easy to 
>> maintain.
> There is a start tag - "Capture/X.0 Dumping GuC log for...".
> 
> The parser needs all the output, not just the hex dump stream. And it 
> will already cope with extra meta data being added in the future.
Oh, I'm looking for hex dump start tag, like:
"[Capture/%d.%d] Dumpping %X bytes\n"
Which contains total size info

And one more option below
> 
> 
>>
>>> +    for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>>> +        u32 read[WORDS_PER_READ];
>>> +
>>> +        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * 
>>> BYTES_PER_WORD,
>>> +                   WORDS_PER_READ * BYTES_PER_WORD);
>>> +
>>> +        for (j = 0; j < WORDS_PER_READ; ) {
>>> +            u32 done = 0;
>>> +
>>> +            for (k = 0; k < DUMPS_PER_LINE; k++) {
>>> +                line_buff[done++] = ' ';
>>> +                done += hex_dump_to_buffer(read + j,
>>> +                               sizeof(*read) * (WORDS_PER_READ - j),
>>> +                               WORDS_PER_DUMP * BYTES_PER_WORD,
>>> +                               BYTES_PER_WORD,
>>> +                               line_buff + done,
>>> +                               sizeof(line_buff) - done,
>>> +                               false);
>>> +                j += WORDS_PER_DUMP;
>>> +            }
>>> +
>>> +            drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, 
>>> line_buff);
The format of
[Capture/%d.%d]%s\n", l_count, line++
l_count sounds like an ID for this dump
line is current line of this dump
For hex dump, could we have offset/total size info? Which could be used 
as an option to indicate dump start, where offset always starts with 0.

for example:
drm_printf(p, "[Capture/%d.%d]%x: %s\n", l_count, line++, j, line_buff);

Then parser could have "\[Capture/[0-9]+\.[0-9]+\]0: " to looking for 
dump start.

Another benefit is: for the whole line is all zero, we can simply skip 
it to save output size. Which is relatively easy to implement in parser 
as well. Well, for this case, the total size info is needed.

>>>           }
>>>       }
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>> "End tag"
> "Done" is an end tag. And it is more friendly to a human reader while 
> makes no difference to a machine reader.
> 
> John.
> 
>>>   }
>>>     int xe_guc_log_init(struct xe_guc_log *log)
> 
