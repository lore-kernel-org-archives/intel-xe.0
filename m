Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6098C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 20:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85D410E51C;
	Mon, 15 Jul 2024 20:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMyQWpFK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54F10E51C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721077018; x=1752613018;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=ogVn5KBuRXvxEQ2sx7ROKp6iex+8azHA2BNv93WoHuA=;
 b=lMyQWpFKgHl3BkZ6jKJ23ierY2PcCooPyMOBFz+IkRT26Gtd/T4OBDXk
 Oak2icUnz6f1AoGPLQS/TKQxOK1QDRf0fcFlNmYUnHQEQmzrfv1X5tst3
 B07FQJdO9MX/3996ITAhdQF+75zuVesnTdyGxjFDipjI/4sXqv7GqMnKC
 Ph5fVLcyjZmEuEMOKvcAd3E9xl27qL5QF68EkhMAqt4Xf2U8v2+MdFgKr
 psH7XvO2capNT6HogIE857FOyfDuej86ngFaHYkqPDcieFm+LAGkU4oKD
 H3TLgF42nnfqlq8aRZTE5EYsvdP9hLcI1MNYQThLKGr7snAcbI5tgVb+R Q==;
X-CSE-ConnectionGUID: Pfry5UZGRa+IiR3Kv18mmA==
X-CSE-MsgGUID: NXVFCiaXS+WMkplg1vQbmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29631224"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208,217";a="29631224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 13:56:58 -0700
X-CSE-ConnectionGUID: 78fHgjigRtelPCLuzgzirA==
X-CSE-MsgGUID: AQwugSBrTRyoVaSrYMmPwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208,217";a="49495951"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 13:56:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 13:56:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 13:56:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 13:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfeQuPEMOI6ip6rYl7gUhcpXoPokfj9PUBHTW56E1uW4uQynW9DXGXqG4blVHDwWWCreJIJncRvmf9r4qgJj0ujThhgCEq9hZw8W22RfQdT0QECrxlvN8/1tbVOmVwKKC7EuE8IYwy4hXgxIOQhnQEo1EINIGSoVEYUj5W4V8rLXEH8k4fseSgzSMJBil5ecMJI2iZupwwIV3oHXT1K4Fwx55PFe/oxyxSXWvIqzBsQTCWSQxANWHe/WQbbsMnr44OVhv0uUuB8YZcSzt35klF9ptXbH3b+ID/HjUsQGuln0n7zmZXsO+7GlqN97N7bfJkIL2CeAiAiCy/PVH57Hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfnGUXwMR/eFQqdBeV5mfXp7IUKZtxBQ5K7PidV3zuw=;
 b=I35PuhbLKcTgTs9Vdkg81iRZkFM4b4pEjmvqWkt1O4e/MSbckNh7PWcvZI1Am9PZ1LmoWutJGG3LLa/PMJ7Xmz0vW2MjXHg13bwEaDh8gGrYDQnRJrbxnimr8mUKeKSzxmB53ZZ/sFSoEDPlSV8G2fLNNyJlvE93yjoMGfX9yqxWzd5UKk/BnyTaV830mmPfZBMnNEXfcvpXxgDR7qNJuEE1iKnYeIg6faNrhM+X5/RhbfcEHqXqBdyDxfY0ihZyTElgAHjh5WxZYVi2PkRAtlb6DhApiDjwfqV1HrrejIDSrIsNVlbXFbl7sS8efFBMOubE/Yx44C9TwPI075dL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 20:56:53 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 20:56:53 +0000
Content-Type: multipart/alternative;
 boundary="------------OnSfJJbM1dTXEats0bMfsS5x"
Message-ID: <f37fafe2-557b-4e65-a357-1aa76fc7d421@intel.com>
Date: Mon, 15 Jul 2024 13:56:51 -0700
User-Agent: Mozilla Thunderbird
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH 4/6] drm/xe/xe_migrate: Handle migration logic for xe2+
 dgfx
To: Nirmoy Das <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <akshatajahagirdar6@gmail.com>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
 <c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com>
 <29306f83-6597-4627-a296-88e9f47edaeb@linux.intel.com>
Content-Language: en-US
In-Reply-To: <29306f83-6597-4627-a296-88e9f47edaeb@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: e18cc00b-a3c3-450e-35c9-08dca510a7b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdPQ2tRUmdaenNKWmsyYjZYMVFvSldDaVVZRkFPQ3A3azRzbDBHcDhnbjZW?=
 =?utf-8?B?ajQzcXN4ZFhIL0duMDM1bHR2cmhIOE9ab1V3Wm8rT1MxaExNQ284aTBBUDZG?=
 =?utf-8?B?Vmhpb2E5Y05KN0VkU005aGE5VGZUVGhYaGhsMTIvYk01NXRCUzFNblhXODRN?=
 =?utf-8?B?L3BJK1gvL2lZclpTRXd6YTJLVzJGWFVsZVRNZW1td3BkclY4ZFdvMVFodUNu?=
 =?utf-8?B?cW1oTGVTU0ZLWVNzTkFvOUwrYnVjRytCYnhRQ3VZOGxIM0Y5MTl6QzJqNm0r?=
 =?utf-8?B?bUdOOExFdjk4MGZ0aGFScmdXOWNZd2htc0VqUExVdUw4QnYzSVpFSmNoVWhC?=
 =?utf-8?B?eVIvNC9UUnp5TmRSdG9jNTl6aXVmd1lSa1MybUk0Rm9jeG9sNnB5NStkY2x2?=
 =?utf-8?B?ak85YjRtL0tIZStteDFRQlpzQkxLRCtnY3hiTmxsZXlQYk1xQ0R4MjkyRTQ4?=
 =?utf-8?B?M1QzRWdKNGpZcnNheGtsWkhKNEV6YXNyeDd1b2JKc3k4TmVVaE1POVlKdG1q?=
 =?utf-8?B?S3V6WjRXSGNldUg2dTZVSG04VFpacisyNWdMOEpzbHVmV25HT1lPVzV0dkh0?=
 =?utf-8?B?SkRHWTdrcGdMMU82V0NYbjBCamcyTGRyYUM1TGg5Y0N4bDdQRmJZTTEzSnZO?=
 =?utf-8?B?TlZvMTRqczUvRnZMNERhS0QvVklLSVh3ejVnemNYaFI3aFBjZ1JaMmxXOUV1?=
 =?utf-8?B?dXQzY0lLRWluQmFWVHBaQ3NtNlpqcXJ5eWJ1QWQ0dm81MnpxbDRLcjVTU3F6?=
 =?utf-8?B?dzZDUXkwZ3BLQW41SnU5WUR6ZWsrdlJyQmJod2ZZeTVsMHZuZnBaSDZKcTN6?=
 =?utf-8?B?c2w3Z09vL2pFb2ZNN3FzUGlFTDJ3MzhkVlR6NFUxTVBwUTRWd1Q5bEtIMnNM?=
 =?utf-8?B?azdmLzcyU2E5NVkwbVNDd1JwcFBNbjFNZmprenVvM3EzY1Z0bXBJcDM3VEt1?=
 =?utf-8?B?RjNRaFo2UGxZSGg2Vk52cUszYUZkeDdaZ3lnN3NPZXRTV01WdkFoNmljaDdn?=
 =?utf-8?B?MzlvWllXKzJPSDVMVFRxbTJwZU1QWnVFVTE4NEtCbnRYcWpyNWg3eEZuTWFD?=
 =?utf-8?B?ZmFZNkpPSjZ5VHRUUzkwVGlIVWpTZ2dVcW1lQll1UHRtemEyRlhMRnc4NUpC?=
 =?utf-8?B?MkJmdUJoWWNZVUUvODM5RExZNFVHeUdUQTlFYVM0dllHcjRUcXFlSVlhNW5F?=
 =?utf-8?B?anQ5eS9UbVNrbGIvWkx6V0pCOVhEVDl5Qm9DZnFySnJUUUFaL2xHMkd3eno5?=
 =?utf-8?B?NXNRM1BuVFdOTisrL3NuWFhHbHJ2eTErS003TzE3RnlFVDVoaFBXYXRNbHhU?=
 =?utf-8?B?RFlORWl0TUhpQVNuK3RRaVJITi9nN01kQXFtQ1kwNTRpNHMycEFQSnhqN3pn?=
 =?utf-8?B?VW41R1ZFalBvQ3RCUFQyQTZodmxSeG5wUS9QLzExaWlTeUxWM01aK1diVUZZ?=
 =?utf-8?B?S29neEdQenlRVUU5TERsb0YvbTdDL2RRUTVCb21YUFdlMXEyMlpwLzJ3bU1J?=
 =?utf-8?B?VU9aYVdPc283bkVUTURobkliMGVWRFJLTzBGRklRd09haWM0MWpoT0pMUHND?=
 =?utf-8?B?Ymk1bmM2Vk1lTnBGazVzb0cveGdDTEkva0ZtKzdzU291bW1TV1craDlWY2N1?=
 =?utf-8?B?bHd4cVZBdTFqTHpQaVlRSXVNbXRBMVhmSmtFdEtRS25TbytIeXFLdEJZa3lI?=
 =?utf-8?B?b3M2RENhQnJmZUFvQ21SWHhtdkFUZ1BxL1l3am1wbHdUTTd1akEzc0lHSk9i?=
 =?utf-8?B?a2NlN2dRRW9ZeldUNkU3UmFvZldNV1F4UEZwSWRIdmE4cU1YWlBpNlpQUjNF?=
 =?utf-8?B?K1lGZXE3RHpXdlcvcTM0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ci81ZTRrd3NDaVhlZUZkSmd6c0NoeTJQOGMvRGZ4L2R2WUxLQmdhekMxS2hz?=
 =?utf-8?B?QnNkem1PUjh3WmR4L3NEdkJzdjFYQXBVcTdEMVdvb1NDMnhISklGSTdESDFV?=
 =?utf-8?B?Y3RWNi9EVDc3bkhBTW1Jbjh3b1A0MUJ3dThjMVVrM3oyMTVyOW9oY1p4bEwv?=
 =?utf-8?B?a1hzeFQ2Ym5lZEZXbmQxOHZPS0lIdWJGZ3A4azQ5ZUZXTFZqTGdBcWZYVUgx?=
 =?utf-8?B?eE4xZU13OTRIU1hCT2gyUHBHczRWdXBJTEF2VU54aXNnTDhNbjJPUzNNQmc3?=
 =?utf-8?B?WFh5SllwOHlFUmNDWHZDWnlUN05pUXVrZHZZRTdoS0xwc253bk9xS2Y4UUhm?=
 =?utf-8?B?ditBMTFzWnR3cXd1WU82blh3cHJUOUxvQkNxU016c1JSK3BETFo5UFJJOEtK?=
 =?utf-8?B?SFVTSHFNejVHSEVoQUpQak5IS3BnSmw2L1VRaThtZ2VlY1FDS0F4T0tEakZv?=
 =?utf-8?B?emgyeEhYbndGamNmbjFSQW4rR2Fhb3ZrcWVBUVhSYWpIMzZpVXJEQUMyRG5o?=
 =?utf-8?B?ck9pUFhmcUNRUXJMR3ZBaE8zWUtjMXRoazhHWFB3NmZTckF5K2daSGkxRkF4?=
 =?utf-8?B?eVovc3pLR0J4ZTI2cmhwbHFwRHpkam43RklFOHVZUzAwSno2RzgvNW9vRlE2?=
 =?utf-8?B?ZGxDNFU2cEdtRjRGOGczV096aksvUEwxcldkV0l5eEFoTmRpekw4QUY3M1ND?=
 =?utf-8?B?cnRUa0h2bURhT3c4aW5pVFdLcUNjWCtYRS9RcFlFRlBpTVlZMHkyNHZxUGlX?=
 =?utf-8?B?OE84ZDd0SW05akF3NEFFeTVESVVhaERlVndmTXU0UGRGWFBveVFVci9MVTdN?=
 =?utf-8?B?QlhqN2NmNlNpZC9FTnV4d3FJb2RFK1R3RW9DK256cHU5OUYraFdJdWgyVk9i?=
 =?utf-8?B?KzlyRU9qTHN6UnBsZlBMRHFvYWVSR1VlanlWbnE1SVVpbHNhM1RCZXVISStv?=
 =?utf-8?B?TlI1Q3AwK0ppMVJhTE5kcEw0dzJvZ0REWXhwUFUwMEFTeER4UWVWdnNKa2c4?=
 =?utf-8?B?aFNrbWtlYjhETEROVlBYWjZvN2pDRUNVNFVsVGx4L0ZjWWJQQ1A5RFZEbmpD?=
 =?utf-8?B?cUNvL01vZ20wamVCenFjbGFDbTBLaWljUGpvYmVaOEI5dnI4WmphL3YzN1B5?=
 =?utf-8?B?VHo2eFdaTlRmRU55UlNXWTBUd0p0Uk1ZWmduTWpXOFlyYzN3UW5DeGdrVWtB?=
 =?utf-8?B?R09kTE51ZGdwTUZ2dHBUS3g1cWRGQWl2V1ZVUXgwWG12K2hFanFmNjBoZXZN?=
 =?utf-8?B?QjBnNlF6R09XT2xoMGJCbmcvMHNFRnV0SlhaeXprM1J0cEVsY3lZMUM0azhH?=
 =?utf-8?B?Wno2TyszeWI0TXZPeWpnakNXUEJZeWlERUdEcjFkUEp0enVRSm1VUDdKTTNB?=
 =?utf-8?B?NmFwdHhNRTZRNnpvWHdaTDg5Sm5XOU10YVA1REJuRnFqYnd0ME1jYzBPN1Jp?=
 =?utf-8?B?dHNkTkRIdWRhdGMxcnd0WDdsWDN3TklCdW1zNVdONE10SHk5VFIzU2tmS1Fk?=
 =?utf-8?B?M29oUTJhbkpjbys3RXNPeTJiaHpxOWQxRnlKN1Q4L1RvUk95S1NaWmFtSFVK?=
 =?utf-8?B?c3BEL251M3ZSVDRCVSs5R1FZZ2xjUWZxZXpZbTdDdlJCS3EvL2lwNFVlV1ps?=
 =?utf-8?B?UkEyRU9UbU1ISm1NbERLMUdKbFdzbXg2Ny9ackJPcG54ZW4xallGSkpYODB6?=
 =?utf-8?B?OXlWNXBaZUFZYXJaRnUvVjVpTXNURFpkU0RRZUhEK2drUnZFc1B6NnNSdENB?=
 =?utf-8?B?M1ZSdjBMMno3bnZsRit1U1dhNmFRaUFBOEE4VlpCU2swTGRGcWRwNWE2UXNG?=
 =?utf-8?B?dnBOTEV4T1AzSDd6amUvdFFvMTU2VVIxMUk3Q2pPNi9Pdk91YjFwVTBLMnNu?=
 =?utf-8?B?YllYL291OUdTSUZYaG5kaDcxWHpmSWdKZitLeDhTRndEZFo1WnJQQXFieFRh?=
 =?utf-8?B?UWRUNytMSFZENGk2eDJhMzRpRHBzOTEzb2prQkYwREIwT285aW1DcVI1UWVs?=
 =?utf-8?B?VHNQMjNjdnppZG56Rk9IYlA3WEZ3K3h4amRtVFdEVnBDSDdiWnIwRUpDS2Qr?=
 =?utf-8?B?eTZoQUdOZDBIbnR2WkVJSEtKclVET0hRMDFKT01lQ29PM05LUW1COG0rUVdB?=
 =?utf-8?B?cEt4WDNZSWM1MVgvckRUcnhjTytJQmhKeE5JMHk1Qit2QlF2aGFwV0ZjOS9Y?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18cc00b-a3c3-450e-35c9-08dca510a7b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 20:56:53.2654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIpvgFa3vfOFMD3F9BN0SfAwV2QFwVIlQz1Wemap6Z3IrGwsR6i2JF1N8POvpeSDQlNaJd/hli+H4Q1eRILYzp29tfB+l9l0yLkt9rg7Omw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

--------------OnSfJJbM1dTXEats0bMfsS5x
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 7/12/2024 5:55 AM, Nirmoy Das wrote:
>
> Hi Akshata,
>
> On 7/12/2024 8:39 AM, Akshata Jahagirdar wrote:
>> From: "Jahagirdar, Akshata"<akshata.jahagirdar@intel.com>
>>
>> During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
>> During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
>> Handle logic for selecting the compressed identity map for eviction,
>> and selecting uncompressed map for restore operations.
>>
>> Signed-off-by: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
>> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3b8a334fe08f..1eee6be24423 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -715,7 +715,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>   	struct xe_gt *gt = m->tile->primary_gt;
>>   	u32 flush_flags = 0;
>>   
>> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
>> +	if (xe_device_needs_ccs_emit(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
>
>
> Do we need to call xe_migrate_ccs_copy() when 
> xe_device_needs_ccs_emit() is true ? If not then move the check for 
> xe_device_needs_ccs_emit() to xe_migrate_copy()
>
> to ensure that xe_migrate_ccs_copy() is not even called on such platforms.
>
> Regards,
> Nirmoy

xe_device_needs_ccs_emit() is true for any non-BMG platform that has 
flat-ccs enabled.
In such cases, we do need to call xe_migrate_ccs_copy() while clearing 
any ccs metadata in vram.

BR,
Akshata

>>   		/*
>>   		 * If the src is already in vram, then it should already
>>   		 * have been cleared by us, or has been populated by the
>> @@ -791,6 +791,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>>   		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>>   	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>> +	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
>>   
>>   	/* Copying CCS between two different BOs is not supported yet. */
>>   	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
>> @@ -833,7 +834,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   
>>   		src_L0 = min(src_L0, dst_L0);
>>   
>> -		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
>> +		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &src_it, &src_L0,
>>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>>   					      avail_pts);
>>   
>> @@ -852,7 +853,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   
>>   		/* Add copy commands size here */
>>   		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
>> -			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
>> +			((xe_device_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
>>   
>>   		bb = xe_bb_new(gt, batch_size, usm);
>>   		if (IS_ERR(bb)) {
--------------OnSfJJbM1dTXEats0bMfsS5x
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/12/2024 5:55 AM, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:29306f83-6597-4627-a296-88e9f47edaeb@linux.intel.com">
      
      <p>Hi Akshata,<br>
      </p>
      <div class="moz-cite-prefix">On 7/12/2024 8:39 AM, Akshata
        Jahagirdar wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com">
        <pre class="moz-quote-pre" wrap="">From: &quot;Jahagirdar, Akshata&quot; <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com" moz-do-not-send="true">&lt;akshata.jahagirdar@intel.com&gt;</a>

During eviction (vram-&gt;sysmem), we use the mapping from compressed -&gt; uncompressed.
During restore (sysmem-&gt;vram), we need the mapping from uncompressed -&gt; uncompressed.
Handle logic for selecting the compressed identity map for eviction,
and selecting uncompressed map for restore operations.

Signed-off-by: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com" moz-do-not-send="true">&lt;akshata.jahagirdar@intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com" moz-do-not-send="true">&lt;matthew.auld@intel.com&gt;</a>
Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3b8a334fe08f..1eee6be24423 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -715,7 +715,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m-&gt;tile-&gt;primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) &amp;&amp; !copy_ccs &amp;&amp; dst_is_indirect) {
+	if (xe_device_needs_ccs_emit(gt_to_xe(gt)) &amp;&amp; !copy_ccs &amp;&amp; dst_is_indirect) {</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Do we need to call xe_migrate_ccs_copy() when
        xe_device_needs_ccs_emit() is true ? If not then move the check
        for xe_device_needs_ccs_emit() to xe_migrate_copy()</p>
      <p>to ensure that xe_migrate_ccs_copy() is not even called on such
        platforms.</p>
      <span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">Regards,
Nirmoy</pre>
    </blockquote>
    <p>xe_device_needs_ccs_emit() is true for any non-BMG platform that
      has flat-ccs enabled. <br>
      In such cases, we do need to call xe_migrate_ccs_copy() while
      clearing any ccs metadata in vram.<br>
      <br>
      BR,<br>
      Akshata<br>
    </p>
    <blockquote type="cite" cite="mid:29306f83-6597-4627-a296-88e9f47edaeb@linux.intel.com">
      <blockquote type="cite" cite="mid:c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com">
        <pre class="moz-quote-pre" wrap=""> 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -791,6 +791,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &amp;&amp;
 		xe_bo_needs_ccs_pages(src_bo) &amp;&amp; xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs &amp;&amp; (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; IS_DGFX(xe) &amp;&amp; src_is_vram &amp;&amp; !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs &amp;&amp; src_bo != dst_bo))
@@ -833,7 +834,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, false, src, &amp;src_it, &amp;src_L0,
+		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &amp;src_it, &amp;src_L0,
 					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
 					      avail_pts);
 
@@ -852,7 +853,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_device_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------OnSfJJbM1dTXEats0bMfsS5x--
