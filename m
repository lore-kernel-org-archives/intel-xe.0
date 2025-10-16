Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D68CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 08:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CC010E2F1;
	Thu, 16 Oct 2025 08:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jm+hHrdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D710E2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760604399; x=1792140399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ktr8YpnxbtotOmTyXZBaFdosXhAKYEXQSSCk2RUVYzo=;
 b=jm+hHrdx7kq1DOCeyb3VUvCv3+ViClJZHb0yZaa8jPh7cb44ErHHtITR
 CmZ8kGyAJFDPjnNZbHl8SBmFtOTTP29IZaESeAyHTP4hTgX16dsOtlq34
 /EZTgwX3Uq2lBhPs6V72oNOFqIj6gNntRYL2Ruy9juaYftoA07tqA6xdV
 vgep26fB8XecMWHI0XnKVkIv3+QnP/DdKODxLgFoKVSXmSxxrMTOlAI4u
 yrMDiUMf/LYlEc+JRyg0aSwVZQFWOd/Gk66/5Hq1lyt8NWZtA8NPEkHY+
 YpKi6R5miL7e4ZTCrtO2tihKdptxmxLgVCEUjraRopCmd9A1f/ZxDcsfC Q==;
X-CSE-ConnectionGUID: NvUmD/TNQFa60NGadtidlA==
X-CSE-MsgGUID: BeZ0ievpQnqu2xQokZLqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73903845"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208,217";a="73903845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 01:46:39 -0700
X-CSE-ConnectionGUID: frUuEEdhSH+UXu4mxUp+qg==
X-CSE-MsgGUID: OPsivY7WQHqNuqbCrmaYSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
 d="scan'208,217";a="186669096"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 01:46:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 01:46:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 01:46:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 01:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGqlJ2TMKuV0vsGVgmkZ2bRiX3ykny+sfayvicHecf98Vxu/5sKh3qPu9rKxlTYdrFWMs0e5Mqs/hVQpryAxGtI5d2PU/nFiHMEwvUTId3ydftpmk/MbiMb/oibU6ddr1cl9YysXLigJyYFo+EFSX+r4Hv7XmXuML8ghINDse5QKE0iccrrDwrwxqhiRvsYGrcj/Aixn4kI7ZJX5uPBaJ0ChpB4Y0Yj53OKE2jKBCgF2RVAN1FMF5PDxRCs0BXOB/Uc0BFax56QgXMmwZxqtcH9rEsG235BNKIVB7eXa4cDkZ+9DyJjCJcRQ5qcgHAJVkFIPSm+7Lser58u/xOpYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW2GKG5eH5ZVnzEvBPlsVGGs0pRUmPaMFyyjThKWuCM=;
 b=hSEGX+m0aFxy+YJgUDCGIycpyuVuBBiTCtQMWFyl18WVQKiRMbV95UMJLVQNMBzdHR+r3yGCYcrZOe7ugRfcTZNpGXOw5aifJ6JqV+qXApr28HSXf/11hcfU+PIiwqO3uAHl79k6mFxhlucQFo/M9+R2gNG7iJw4FkzqblnliKRKGYNQUNs7CXm2lDut6uw14Lr1n9XJhpPmS/EMTw/p3t3YvgE/SyfuZxMNtGq7iaz9Ts+YM42MLQusW9dlF5HU6Q3bkzuL6MF4U+x7oCrn7Q7siXq41vkHNKja4A2spVROr6ZzppXaLj/vloQ7mMtgDjrDmnlVDXU3nCG/I1bITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 08:46:35 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 08:46:28 +0000
Content-Type: multipart/alternative;
 boundary="------------ClqEYb01UdYl7o0IkfT6A0v0"
Message-ID: <212becf4-961b-4ec2-a201-a2ba42b5eb26@intel.com>
Date: Thu, 16 Oct 2025 14:16:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
 <b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com>
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ee3535-6473-4534-e33a-08de0c907f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0JYYnNSS1dNV0JhSFcwVHdFcWltdEJLc3ZvcWp2enducExtTHR5aVArdVRz?=
 =?utf-8?B?MFE1MmlKeXZUbUZiSEYzVW1hK1gvZVRhaGkxVTE5eHo0TFpVREw1Q3ZWazdw?=
 =?utf-8?B?dm54TUlhbDBHUGNBNlExUk5UUDZQQVhmVGZ6UnAvZ1JUMU53VG9vQm5ZaDBO?=
 =?utf-8?B?NFdRcWpMQ3ZZazZaOW1jcHNyMnA4VzNMOHJ5UjdPaVNmUVNUdisxUDF2RlE3?=
 =?utf-8?B?K2laTys3bVorbXZ0MXNDRU44QjFxTEhSV1lSejRxYmxZZy9PUlpKeTBnb2cz?=
 =?utf-8?B?R1B2ZzJnMXVoUmtuUlBiWEw0c1lPVXpPZFlIWUhzd0huWUZ2T1piRHRGNnYv?=
 =?utf-8?B?VzdFcWpDckpYNWVyTWxURGtwYnlYa2txUHlMRXp2Mk1uZ1pyY2RacVF2N2NX?=
 =?utf-8?B?b3Y0Nmd4UDJjb1RiUHNXSFRwN1MrcGp2WlZ3SXp4eVhTalJlc1M1VlJZNE9z?=
 =?utf-8?B?d1hkdzRYL1RkVmdmMDlPZzlaUXZLaGtVS3ozVlVQc0RDTFpQWEZ4QXJNZVMv?=
 =?utf-8?B?K3JCQmFyd1NPSjFvOW1lcDdFNGVKY2ZnU1dDWEZmWjJUb0E4UitQd0doalVX?=
 =?utf-8?B?Nko4N2t5cEpWeS9qTjF1d2NLd1NmU1dKUFdnaThld1hBSmRzTGtza015eG0v?=
 =?utf-8?B?UHBMUmt1VlNYOGk5a1ZFRmlKbWZFSkp2K21mOXQvMnAvVjdJT1VvM2VkYjFD?=
 =?utf-8?B?ckFXSDk4TURDa3E3Z3BQem1iWTRCWkVBaWJJUzJZVEZQeUh3ZFNBakpCSnlB?=
 =?utf-8?B?cWdTSjhzOFd1K0NPQ1pOLy9yaDFzMmFpSGFJSHVhQzFNRGxxcDlFbGhBcXZ1?=
 =?utf-8?B?S2ZiS3ljRThMcXVnNEpzN2IwU04vNnpxMUhlejZ4M1h1VmVzbGJOYktjK3Rq?=
 =?utf-8?B?cG0zbzlXRzRBRkxjV0NidXAvVTc4aHFQVHpXSWFicnQySTV1d0R1eUk0bFg0?=
 =?utf-8?B?Vi95b3pzWU5EUlpNaEpjTlZGNkRkM3JLTVRLeW9EME1UVmpHL2E5dWFyQ1pL?=
 =?utf-8?B?N2ZiZkZlK3lxRmJ3MWgxV0dXNjlhcHdGRjZ0WXNBMEJDVW5hRGxMVllnTVEy?=
 =?utf-8?B?N2RmTUFtZ3JqVWwvb3ZMeXgwUml0S2RQUm5mK3JYY1dYN2VCUUVjQWtOZFh3?=
 =?utf-8?B?dFFGbWtZaDBwdkcxVW5VakcwVUtUZ2dYallyYlUzUEtieW9qRjdBUms5ZUly?=
 =?utf-8?B?NGZIQkdaY1BDdVAzSFlOTmN5ZHRXRU9tQTBYZk51VWxHL2NPMmUvek9KYTdK?=
 =?utf-8?B?QU4vbEJONWJFOWhNZHZPYVpsYTdLVzNVRkl0UHFuOVhjb0xRNnRCTmdKVTQ1?=
 =?utf-8?B?SVdiRER3a0FOdjFWZHdNVmphUXdkS2ljNWovMHJ5U3RyU2pJZ0owcXdhRUJZ?=
 =?utf-8?B?YkdkM1o3M0R0cHNyMjlrTE1yZVlNSHRwQzV5cWxhWUZGVkpvZFVMWnRYNEJO?=
 =?utf-8?B?bE9wSUh6ejdOc3JUMEt6RUZzRU1GRW5XTGVZTFdSalIzUDc5VXdNdkl0d0ow?=
 =?utf-8?B?RkludlA4OUhhVWxMb2p5RTNxWGxrRXA2WUpDeG41cjUrZDBpUlhRZXBoaWZo?=
 =?utf-8?B?SW1xc3pmaW1mRTFuMG5BRzN5UGp3NUpXVjk0R2tuQ2xnWUlmSkx2dkNqNVNN?=
 =?utf-8?B?bVUvS25KcEtOR3JzbWpwWmdEbHBPcGp0VTBjTk5CQXBPaG9TMytEd1MxMkIv?=
 =?utf-8?B?QjE1bC9zZmtUMG43OVNxdVE2c2t1VWNvRnQrc0ZZZHpPNXZVdVFaalhNOFVn?=
 =?utf-8?B?VWpnUkpBRERYT21IU1pnN3pEUmNsNHYyeVViN3N1TS85cnFpKzQyZWIwOExM?=
 =?utf-8?B?cWsxbEpNbVZWTkx2Y0l6Wm1JN05CQXJsV0pGSEpWRFJwek85bDBuTmYyK29D?=
 =?utf-8?B?OEVlQVB6RmlLMWxHSCtUc1pYbXVKdnF3U3pzcmdvRUV3a1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21LUmJrY1RDTXY4VEdTODZDSW9tdWdYNmEwNjVwdGlNem5URE5OYVkyZHpS?=
 =?utf-8?B?Ni9sRi9WMWNvcFpnMXR4TVdUMHJGLzJRVWdvS0pIajk0ODd0S2pZbWloY3R3?=
 =?utf-8?B?bzZZSVA0VmRQS21TOGZLamRpK2lxZ2NXb2hzNlhoejZSa2tML3FBaDlWVzF6?=
 =?utf-8?B?YUxBa1J3bjN6bW5QSjRkY2gzd2k2b3owRktMbUpzcDNDTWVuWDJHRTh1ZCtk?=
 =?utf-8?B?cmVPTkRLZVRlZWVkMkswUStabjI1dzQ0cUJQdnBaV0hZUGszTmFvY2gwWXdp?=
 =?utf-8?B?U2VrN2Z4UHpWUzN1NGREOVlEMDI2bUZITTNVdm51d2RKbXV1QzRWQjFneERE?=
 =?utf-8?B?TUYwVUFleUQvU1ZOY1NzMWhhYitIdE1vVy81dEh4aG1WMWxOQ2hGV0NRbTJ1?=
 =?utf-8?B?MnhOOHB2NnB5cW5UZHlVQnIvOG90Rkd6WTU4UWhCSERpTjNRSVU2UktSblZT?=
 =?utf-8?B?aUJjYVk5Y3dTdGRPelVuY3hZVUNlNHVIbncrZVU0RTkybnhyejJZUVBsZllM?=
 =?utf-8?B?cXpVdTRHODJLUnM4MHVGcjNkaWRmemVVSEJBY3RMemUzN0pUN1Nsd3QwcVhB?=
 =?utf-8?B?QVpGbGJ4cmNudXNEU2YzNmI1V0V1enFTT0U3RGFMR1NWbkF5M2t0cTVWUjUw?=
 =?utf-8?B?cDVOZ3U4MTRCLzl3c2l1bmxMTXB6NlIrMGFqOUFyN2c2Rm9mV2lPaVVHVWlJ?=
 =?utf-8?B?Um9hbHNma201SlZsZ1hOaE8rQlUvS2kvSGNIMXVhMmZ4TDlqVmZNUlNpTUxu?=
 =?utf-8?B?UWtpVzQyeHdvdFJWZnQ3RVRzaHhGUnpLdnBNVnBtSHVCelBVTTNvVVAwMWZU?=
 =?utf-8?B?M2h6Z3RQN1pyTFVRdXlIczRhemliT1pYU2llQ3R4ZFp5SlpZV1FjNFBTN2s0?=
 =?utf-8?B?blB3MVNYelZJK1l4cHNEelhKMlhKZ1Zrcno3N3Q2cmdiR082amZpVW5tbTNY?=
 =?utf-8?B?emp0aFloTVNtam1WNjFQenhYYkQ4dDJNWVl2R0lqaHFqTy96a09pZlVxQXFs?=
 =?utf-8?B?RTRUTGpGVk5QVnczRlpFWjUrNWZtcExYMEd0VmxPcVY2TU80cDFXbzVCN0Vo?=
 =?utf-8?B?TGFVdzRpRUk5azFXcmNxN2JMK2tnRUJsUSszK2s2MTMyeCtVWXhibmc2UmFz?=
 =?utf-8?B?RURzd3g3YjlXNlpSZ0gzVVNZb0dIY3BmSFpLRzd3VlFCMmxTV1Rmb1lJRmV0?=
 =?utf-8?B?NFJNNWFpL1hkbU11NnZjSG55QTh4NTE3ZnJjckdwUnpyN1JFdUlpWkI5NDBX?=
 =?utf-8?B?MUFHRmpVcW1iYURFMWZZSllGdXhVaTFTQ3ZkeldwcElCVFpEQlhwVlYwYU5q?=
 =?utf-8?B?QndWY2JpcnFncisvMWdQay80Z3V5QVJzaVJ0OFFUNTg2eFh5UW15YnZyZ3hj?=
 =?utf-8?B?aXZsb2J6T3ZESmhBM0ptbVlFRGlwcHovSlAzekNrOExORThudUQyQkFLQXBD?=
 =?utf-8?B?WEVNZ3pWREs3R2Q5N3UxbHVhZUN6RFNwKzVEc1NIYXB1cklaWUR2ZE93MmZu?=
 =?utf-8?B?YkU5Q3JiQTRzQmYvUTRxRjVXTGZwL2F3RXJ4WUdDZmVRWGNJN3NwYWU0ZnZ5?=
 =?utf-8?B?K3AzOXcwK0htd0dXR1lCUzNZVjB1a0ZucVJnSS96dFN0UE5EQ1NuWUhvTGl3?=
 =?utf-8?B?b0EwQXJ1bVMva1N3aTNqOWdZUll1N0NIT3kzTUFSTUNCck0yS0dGUXB3MEVM?=
 =?utf-8?B?MThDdjlDeGozVzdUcVJHSzlOSWRrNkwybGpTbjVvRlFvQnRoRVdkN2xXUmho?=
 =?utf-8?B?cnB4QVZjam96RC9wWWRBT0FYVmlVdk9UZU1laGRCaVRSbzI2L3JvVmd4Z2tJ?=
 =?utf-8?B?SmYwN1hmaFRMR0VJbzhmZlhoS3ZMZE5pWEtkd0NsQXEwd1dKRTQrczZHUEUw?=
 =?utf-8?B?cVJqeExjMnlDMy9BSklvTjBVMDl1Q3F0bXJJaCt5MngxRlFQbUF5UHZCMy85?=
 =?utf-8?B?elJLTWhVeDRBUnpUK2R0bXNENVlvbG1XQXIwelIxdGFKWkp6VWlOZkxuRFR5?=
 =?utf-8?B?YU95MGgyc1JodTk1ckg1Zmx1bWUrWUgwZTZiSUJudWdDeHFKbjU3UWRZUHZ0?=
 =?utf-8?B?WmkreTBCMVQzMDdtOHRSekx1L2xjSWtFVlM2bzV6VGR6SWQzellUNzV5MEcz?=
 =?utf-8?Q?7DC1hUaRsMw0LavueBWahHoo+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee3535-6473-4534-e33a-08de0c907f58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:46:28.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs2hWhggenWx/WnTDJ6ph4ZVzpQQ2hgdYat/PMyUHRcR962K7/GtuQRxJf54b8nKWJQe8/eymp1SC4b0iI9pMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
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

--------------ClqEYb01UdYl7o0IkfT6A0v0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinay,

On 15-10-2025 02:09, Belgaumkar, Vinay wrote:
>
>
> On 10/12/2025 11:42 PM, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>>   2 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..2d1d5121555e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
> while we are here, can we rename these local functions to 
> mtl_get_rpe_*freq*() and tgl_get_rpe_*freq*(), since both these 
> functions return the decoded freq? 
Yeah, we can do that.
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>   	 */
>>   	if (xe->info.platform == XE_PVC) {
>>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	} else {
>>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	}
>>   }
>>   
>> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
>>   
>>   	/*
>>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>>   	 * smaller than the fused min, we will trust the PCODE and use that
>>   	 * as our minimum one.
>>   	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>>   }
>>   
>>   /**
>> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 rpe_freq;
>> +
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>> +		rpe_freq = mtl_get_rpe_value(pc);
>
> just return mtl_get_rpe_value(pc) instead of storing in a local var?
>
Yeah, good idea, I will fix that in next revision.

Thanks,
Anirban
>
> Other than that,
>
> LGTM,
>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>> +	else
>> +		rpe_freq = tgl_get_rpe_value(pc);
>>   
>> -	return pc->rpe_freq;
>> +	return rpe_freq;
>>   }
>>   
>>   /**
>> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */

--------------ClqEYb01UdYl7o0IkfT6A0v0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Vinay,<br>
    <br>
    <div class="moz-cite-prefix">On 15-10-2025 02:09, Belgaumkar, Vinay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 10/12/2025 11:42 PM, Sk Anirban
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">RPe is runtime-determined by PCODE and caching it caused stale values,
leading to incorrect GuC SLPC parameter settings.
Drop the cached rpe_freq field and query fresh values from hardware
on each use to ensure GuC SLPC parameters reflect current RPe.

v2: Remove cached RPe frequency field (Rodrigo)

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166</a>
Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com" moz-do-not-send="true">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..2d1d5121555e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq &lt; pc-&gt;rpe_freq);
+			    freq &lt; xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	pc-&gt;rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
-static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)</pre>
      </blockquote>
      while we are here, can we rename these local functions to&nbsp;<span style="white-space: pre-wrap">mtl_get_rpe_<b>freq</b>() and tgl</span><span style="white-space: pre-wrap">_get_rpe_<b>freq</b>(), since both these functions return the decoded freq? </span></blockquote>
    Yeah, we can do that.
    <blockquote type="cite" cite="mid:b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com">
      <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre"> {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, MTL_GT_RPE_FREQUENCY);
 
-	pc-&gt;rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpa_value(struct xe_guc_pc *pc)
@@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	}
 }
 
-static void tgl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 */
 	if (xe-&gt;info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, PVC_RP_STATE_CAP);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	} else {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, FREQ_INFO_REC);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	}
 }
 
@@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) &gt;= 1270) {
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
 		mtl_update_rpa_value(pc);
-		mtl_update_rpe_value(pc);
-	} else {
+	else
 		tgl_update_rpa_value(pc);
-		tgl_update_rpe_value(pc);
-	}
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
 	 * smaller than the fused min, we will trust the PCODE and use that
 	 * as our minimum one.
 	 */
-	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, pc-&gt;rpe_freq);
+	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, xe_guc_pc_get_rpe_freq(pc));
 }
 
 /**
@@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 rpe_freq;
+
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
+		rpe_freq = mtl_get_rpe_value(pc);</pre>
      </blockquote>
      <p>just return&nbsp;<span style="white-space: pre-wrap">mtl_get_rpe_value(pc) instead of storing in a local var? </span></p>
    </blockquote>
    Yeah, good idea, I will fix that in next revision.<br>
    <br>
    Thanks,<br>
    Anirban
    <blockquote type="cite" cite="mid:b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com">
      <p><span style="white-space: pre-wrap">Other than that,</span></p>
      <p><span style="white-space: pre-wrap">LGTM,</span></p>
      <p>Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com" moz-do-not-send="true">&lt;vinay.belgaumkar@intel.com&gt;</a></p>
      <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">+	else
+		rpe_freq = tgl_get_rpe_value(pc);
 
-	return pc-&gt;rpe_freq;
+	return rpe_freq;
 }
 
 /**
@@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(pc-&gt;rpe_freq, pc_max_freq_cap(pc)));
+	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc-&gt;rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-&gt;rpe_freq));
+	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..f27c05d81706 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -21,8 +21,6 @@ struct xe_guc_pc {
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */
 	u32 rpa_freq;
-	/** @rpe_freq: HW RPe frequency - The Efficient one */
-	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------ClqEYb01UdYl7o0IkfT6A0v0--
