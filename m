Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB2E7DF0D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225010E523;
	Mon,  2 Feb 2026 17:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pqk1Y97l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5F210E52E
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770052344; x=1801588344;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rkidj8QqOf4LcK0SR11MO9oQ7qheGrWVlOz35pbIIgc=;
 b=Pqk1Y97lKF+/AEfYORxNT0CmKJTGr8AZT28hmBiUJE7yf3wbi9Zhe7xA
 vBckCbeMEMaU58/UjF5GL2DGNn+DIVjP1UNjEZXAXvOK0xgkmQ/jRGgoe
 uAKCw/wpO8yj7RGeXO4KR/vvVzcuYvfh70Lqpu/09jFoiEkMr2SM5Ahh3
 676JQPXns7KHExb3QXZ43pdhvjhsctrZXwInKA/SrcuC70QediMDE6L2Q
 fQhtZiCds3CM1lPC/taIfxr9oxSGYTouTCrC0U2T36PjiCqMzj5beKnBH
 dEevzdNZlvWBzS05AExO2aQIdrdSr4wWPEvGftwZugB5p5seoZzuC7c8i Q==;
X-CSE-ConnectionGUID: tWwDHAl2RYe8rOg2V4+uXg==
X-CSE-MsgGUID: q9eGnpXeSxuOdJ8XgorgnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82641322"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82641322"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:12:23 -0800
X-CSE-ConnectionGUID: KJSXIy7KQbe5CUiGdBQ1Wg==
X-CSE-MsgGUID: QwDTB6fGRDybkTeIBiAMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208682466"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:12:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:12:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 09:12:22 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJD6WUrRQ8mIPxVTpMx8lifWNLcSiACzkMJ6waA2UShCgzJW//BPFFwdr6kdYdsjwYkwC507Z0IwSgqqAsGRFXVR1KXlntNjPUOH1O021R3ugCJHusifO3WHiapE43cUvfzCJw8EqCDQ7x3hEMOc0Rkl04zvXx4dGgc+qQbHemnhng/fXB/5n7ZVoEgV3+sGucOQ/4Qng3ZcfQ03m82YHHoepCrj2fqVFh8lEmVgsEsBObYuKJM2XUUMUXmoQiiJUs/xH26H42/S5rN+8ksUsDKs+F1hH3mwqPH34nz8Ee6GD9wv3kedIUON+6FRwbVFypEB9CMCjfxLGU5qzy2CEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBgOdYSyf870b7h1PCd0zC2z16gTjWYFKyzH7JhhOLQ=;
 b=ZCyfNUQkMCmupbK4jy+wBb4t3oGUUEZBUkFv2aW/8DnROh9ksI98MELIqkFbr4scldFzoKKAIDx3oSUPctGhUoM5UDE7lCAuWsc/CnZAHbfsG5XmHGVsj/5Yi4+vLh3hcoVeXnPsW5UZK25LUHcmG6fa4jOUet3G8VaWWPQUX6yAOBxWLeackF2+foDH7BkCPFLOcHQmiQh7038SdEXzCpMYJGT5oBQfQ2UClyJMFYfO8nCnO2JKCIKGLNCulqzsflW3GT3r1hLIE7ojsCjwCqEHuztrEl75/xSpP1Ke5pUTRN7kr5xhjYKenoGbLXKiu3dlQE7vLMBnYChBqAAqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 17:12:13 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:12:13 +0000
Message-ID: <e40bb59b-d40e-46a1-9792-93019db06221@intel.com>
Date: Mon, 2 Feb 2026 09:12:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
 <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
 <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
 <7a7b4693-8a28-423c-bbbb-8b16b4ee2de7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <7a7b4693-8a28-423c-bbbb-8b16b4ee2de7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ca7842-56e3-4f6e-3731-08de627e355e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0JQbEVDY1hzaFZ0QzNOQytkazF5UGh0QTFnMWkyWjBWWW9zUE5WRnE3bk5i?=
 =?utf-8?B?b2wxeEd2TjZCa0tFR2RyWGNwMnovamVFR1N2a3Z6Nm1nQWtIUTV0UFBtcUtL?=
 =?utf-8?B?VzhBanduQ0lYOWNnQmg4MTNqSG5EQkpNSjVKU1czbTVwVjdvdHp5clorWS9T?=
 =?utf-8?B?MHRYWGovSWYvWGNscTVmSUZNeFFtUGFhS3VscFZncnZlVE5oWURZdzhOVWxQ?=
 =?utf-8?B?Rk9GYXZqcTdOM3dMSXdqZ3lNOGczR0hwR0YvQlR0eFRpbitsbTlqd2xhQ09O?=
 =?utf-8?B?R1FLdVhVOXc2a3lWMDV5WFMxTmFsNmRzVDhocS9nYzJBbkU4My91S1pXRXJ0?=
 =?utf-8?B?clBlN2tISVVXVXdLUlZhcEhOSExjWWdGdjNJNDhCV2tVamJyY3l1RXFUTHQr?=
 =?utf-8?B?KzBIdG9UNVAzdS9JY2RwMFNRRjNZbXdmamt3WkhZWDQ3bVR5SWR6emExdlQy?=
 =?utf-8?B?Q0FVUXd6ZHFJWE8rMHpGMEdHOUlHREcwMVFmRzNWV21WTVRCWmpnelpTNkdn?=
 =?utf-8?B?TndZZS8yYnRVRnBQeUh5NzVvbWxUR1daVVhXam4zWUtLam9OQ2VxK1g3eThX?=
 =?utf-8?B?NFRuNTU3YU9CMStxNWNKNjkxQ0dGbWdNSUw2UXdQa2ZncTNra2FjclVNa05p?=
 =?utf-8?B?RE12N0dFSHlwZ2VwY1NqTXlPUTFNOHRmTHBmelFMN3YrU0dsWldZWDJtZi9Y?=
 =?utf-8?B?ZDNYbEpXY3N2djRreVptdlJFYVdqRkliSWxIUTY4K29mSjdTVGRzb1JxYmtG?=
 =?utf-8?B?M0JoTmU1VEhZRkt2Q2JlUFRieDNlaFByaERPYUVrejZRQk9yYnJzbzV0ZzVT?=
 =?utf-8?B?VjUvOGVDT0NJZTc4Y3c0YzFyYWRtM1ltOFNENitoOVN2V3dhYWFwU3FZdFdL?=
 =?utf-8?B?N2hXeGtxbVR0Z3FENmZwSWtodzI3Q2hob3VEVkcvMWNBUXNBUGVNbkxzSHU0?=
 =?utf-8?B?L0xsSTV4SkRMSWlPeHRRUkRLekg2TXB6ZTVzbFBnbXhRWENzNVFWbXRsSU9m?=
 =?utf-8?B?SmpkeGhvOTl0RXI3N25kM1V0djJDRGR3RHQvT1ZVR0dseGZYSmc3S1NkT0Y1?=
 =?utf-8?B?SHQ2YVUxS2txb2dqaEdlMmpiSnFBUEtabVpXRXkzL01PNUlkOTNxRk5iRnVN?=
 =?utf-8?B?OVY0V0dBaHIrQ0FmTXhGNmxyWk1Lc05mZ0RzVEFocElaTTMwMStxcDYrSUxG?=
 =?utf-8?B?dUVSU2NiNGdHazBRekpwdDNlcGhpZ3pPY013QVNGdW1VaGJxeldWcEN0ZWpO?=
 =?utf-8?B?ejdRdE5iVjY5ZXpxZ1B6Zkd0ZXF4NVUzQWxoNmhZMzhKTTdVb04xa2QyeFh0?=
 =?utf-8?B?SlF5WTNxaVJYNlpIQ0JYTE5mOEM0L20wOU45R3Y2aUxwaEQwMXhCNWxUaWJC?=
 =?utf-8?B?cnVnSmp3Tlo4WnZ5ZlB3R1pnV0RpUDNVVTZsWFNGc096TTV0WGlSZTZYUTR4?=
 =?utf-8?B?Q0ZIOENEeVNSeUE1Z0FSTlNEUzFicG1ERUhkaURQcDFhcUdlTmEwb2ZUb0dO?=
 =?utf-8?B?WG1vdXM1bzZMS0VrUVdaK1IrTFJTNWZjSDMxb2lqLzdCcm9xMFIrRnJzbUw4?=
 =?utf-8?B?N2hBZEhDMUlwSzQvTENwTTRaajRXNGNlUnJFU29ETmIxU2lvRG1SWGl5Y0cz?=
 =?utf-8?B?VlUvcnhPenFkOExIN1JHazFPRHE2dno4SXliYStoSXJSTlRMZkZNK3g3RURR?=
 =?utf-8?B?MHdzdlpHbkVLOFY4cTBMOVpXSHNmZHBBd1pnOUNJNkNtMHRZVzBZTU1QRTNX?=
 =?utf-8?B?QjFHSmxQVWI0REhMYWIvTzBtYWY5V21ia0t6Y0RWcWpZV1Z6dG9DdHh2UCtW?=
 =?utf-8?B?RklGZGQ5MDltNGUwMGV3US9MNllsTFJPc0luUmNRazdGU1lIVlk5aVZZNk5E?=
 =?utf-8?B?cm9GdUhETEY4MHNPNGRzWVQydVBwZ3hRTDk5ZjFXeHRNZTRGYVVra3B4M2M2?=
 =?utf-8?B?K09WOHBpMm4rMDhWUmNsdFBYQWFEay9PREUrK2dPelBpdW5vb3VRV2pERlRV?=
 =?utf-8?B?RTFWZGtScXBFTUNWaVYzQ2M2WWs2WkUxY0lyTDliWkc0Q0orRjkyZ3RyWlV6?=
 =?utf-8?B?Tlp4NURHME1US1ZMK1A3dFNEUW93bGJuZ1pHTHJYSVpBTkwxRzJ1SGFBcHJW?=
 =?utf-8?Q?UJvI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDI4RTNqeW1EQmlOSnZNUElhNThYVFVib0hmVmZJbU5ZalVadml4b2k0UjZE?=
 =?utf-8?B?N0NrMHJnTCtNNEd4bzBsRnhsRFRqY2FJVFVUZlFqN2Zoc1BvV3VGSXZjVG9o?=
 =?utf-8?B?UDFIUXhYdkp3V2swaFpxWXlVRWdUbm5LYWpwcklWTnJPNnhiWHVNektTUjhK?=
 =?utf-8?B?VUo4QUFmbHRQTnhwbWxKdkVZc2NaUHZUZHczMXVENlhoK1NGSlFwSTZGOGtR?=
 =?utf-8?B?MGRpWGFRek5GWVdIMjY1dC8yMU1DaXJkQUF2TmpSVlZFNUplWkxISGxqUy9D?=
 =?utf-8?B?TTlJb01RQ3BVMGRldnVWMUkwRTRHZWpremdoZXhBRlZVWUk0T3lCUlIvOUZ6?=
 =?utf-8?B?ZTdEaHBWdVprNllsR1ZwWW5VUUdzLy9zMXV6cXhlZEtUMWZHT1hXS2xicDdz?=
 =?utf-8?B?VzJxdzNzZXVmSUZZR3JsWml4T0txSUVxUFAzaTR3SXpnN0lyaUZhK2k3OGtH?=
 =?utf-8?B?UWhGb3RmSEVMbmRrREwwOWRlam1GMXJQakJsbWlET3g3QjZ6eTBFNVV6TDBJ?=
 =?utf-8?B?Znl0K244elRIam5XSHUrdjU2MzFSWk1DdHh4cEM1K1oreEFrUE9Wb2Iyd1VW?=
 =?utf-8?B?WXkwTXhxZHNmY1pwaXZSeUFueVpnTTlrQk9Mdk41QUtaQjFzSllmcU82Z1VX?=
 =?utf-8?B?OXN4dFQzN1JvVGticjhDTlVDMGNwd2Jkc25laGZsd3dMVE90cHR4U3RUUWZE?=
 =?utf-8?B?ek9ZMW9ZMWNzdm9oT1hIc09RNW14QlF1aitUb0pSQkdqTkNxZE51MDhIUHJ2?=
 =?utf-8?B?YjRMQXdjemdORWtQbkovemNObC9kWjBSVzFrQ3FrcEhidmpROGxHY0U3TlFF?=
 =?utf-8?B?Rks5SS9yOElpdzByK05LMllvamwveDNlcjg4STNneWd4Z3ZNQVljWk4zd0xE?=
 =?utf-8?B?cVg5RlFTOG9DYmtBYmNGOXhlb0ZvOUdBYkxkK1I5UjdSWVR0RVBXVVA5KzFS?=
 =?utf-8?B?dm1LZ1R3aXRrZXd5eTdYVEhhQzdHR1FtbEtBaFpqbUgzTUNHNVdRdHJIWHFo?=
 =?utf-8?B?UG04b2JOT2pwSlhGQnFPWjJPSTNrbkcyd3NSRE1nMWJPYkJRb2EvVEZOdXhh?=
 =?utf-8?B?a2REMnkyczhobTlKZlpUbHdiMmFocmViZzNGYVBia3FyRG1hRWRIVTVxWWgr?=
 =?utf-8?B?Um03NkJFUGRoTWlDN21Pei80Z01PQ0hDL1o4cFpoSTg2VWVGNGMzVlprcGlh?=
 =?utf-8?B?SGNzMlhrUitlcTZGVkhnWlZnckJ3SG93ZHJjM1hiQkY1SWd0aXZTVDdINk5w?=
 =?utf-8?B?bVczQk12alhQTk9aRXd5NDlxa0luUnc3ZllHOXU0VWcrS2swK2dOZmZ2bjJP?=
 =?utf-8?B?N3R1ZXljSWNaS0F5ZG9hSExPaHZYdDI1S3R3clBEMm9JQUtveEMxN3VaOGdt?=
 =?utf-8?B?cG5HQ1JHb3NQNUlnc21kMGFBMno1Vm95bHVMbVpJZUg4NkpYL2hwMFdaZCt4?=
 =?utf-8?B?TENpOE5GQnlBQ0p0UkdDTlV5aVIvN0ZQMFUyeVFkTk9RSVR3eThjNzFMbkM3?=
 =?utf-8?B?ZXc1VnFtYnNvWnlyRE8vOTZ6T29ZRlFSeHllWGhTWWVvcXB5UkJwdXdpUTJU?=
 =?utf-8?B?QXl5ODNyM2V6MGx1K3hyQ3NmMFUvaS9vbEpMYnRNNzhaRlFtY1AzOHA2YW5Z?=
 =?utf-8?B?VUtQbkxra3FTWkdFekJUcUlyZVMxQVVKZ1BiTjJ1UktEWExlbXB6UHZkMC80?=
 =?utf-8?B?YkZEVXhNcjU5R1QwcGlKclVqN3c5R0JMdE9UUVZQU2JCRmcvM1pGeUhDaVBP?=
 =?utf-8?B?a3ZCeDhlRlBYZXphbG00bWJMYmp1NWdqN2ZiS2JodTFKSVlHT2pjTis3bWhq?=
 =?utf-8?B?cEd1QW9KOU5FUzJUakYrUjVCR2NVdGhBd3RIdEhndmsrS0w5cWozbUVtam5D?=
 =?utf-8?B?eU43aGNNUTd5OUM4M08zK0oxT1VHa3NLNnpTcUtGUWsxUEh4YVlzRytGalVn?=
 =?utf-8?B?L3N6M05MeHpoNE1IUlVIVmhPK1hKMVcrK2ViZ0lhcXhLMVVoWUlCRGxIUGtS?=
 =?utf-8?B?SzFIQkN6ODNmeXRESmxXL3laOHpzbStPODl2K0RxQjl0OVhTeXhDUGZ4clEw?=
 =?utf-8?B?VGFVem1TeHRTenRDYnYreURtS0JMQ25jTU1JY2RVTWRpdWlMNjJqajZCWFht?=
 =?utf-8?B?MnEvNS92VkE0TFlPWTBGb0FXWHJJSm16ems5UTVvclRmbXhFSTM5ZERyRU94?=
 =?utf-8?B?YkdIZ1V0NXp6bkwzTUdVWFhjZk1sYm91eVhGUTdpR0Eya2E3cFZtR2NnVFN6?=
 =?utf-8?B?SEtZN2FSRWJKQndVTytjc3lpUWx4UUNKa3U3WFlGbi9raUNxRWV1RXc1Zis4?=
 =?utf-8?B?dlF1QVMrUzdtSS9Td291WXRKOTdJOEtzbUpueHhIenpKWEhmcHIyRVluRlQ2?=
 =?utf-8?Q?n0SNNYMnrUDKvOMs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ca7842-56e3-4f6e-3731-08de627e355e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:12:13.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2sj1gt0Sfs+3HdaM4b5dvnbUw8H24lA48taw8rFsB5Nvg7ACyRynR7/mPAbU5pW3vdU4C3y4c3Y+a5ZhdsL1abJY3zcOov05zpMYLHEDZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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


On 2/1/2026 10:38 PM, Nilawar, Badal wrote:
>
> On 30-01-2026 23:04, Belgaumkar, Vinay wrote:
>>
>> On 1/30/2026 7:20 AM, Nilawar, Badal wrote:
>>>
>>> On 16-01-2026 04:10, Vinay Belgaumkar wrote:
>>>> Dump forcewake status and ref counts for all domains as part
>>>> of this debugfs. This is the sample output from gt1-
>>>>
>>>> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
>>>> Media Power Gating Enabled: yes
>>>> Media Slice0 Power Gate Status: down
>>>> GSC Power Gate Status: down
>>>> GT.ref_count=0, GT.forcewake=0x10000
>>>> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
>>>> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
>>>> GSC.ref_count=0, GSC.forcewake=0x10000
>>>>
>>>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 46 
>>>> ++++++++++++++++++++++++++----
>>>>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>>>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>>>>   3 files changed, 71 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> index 76e054f314ee..197e2197bd0a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>       return __domain_wait(gt, domain, false);
>>>>   }
>>>>   -#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>>> -    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>> -        for_each_if((domain__ = ((fw__)->domains + \
>>>> -                     (ffs(tmp__) - 1))) && \
>>>> -                     domain__->reg_ctl.addr)
>>>> -
>>>>   /**
>>>>    * xe_force_wake_get() : Increase the domain refcount
>>>>    * @fw: struct xe_force_wake
>>>> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake 
>>>> *fw, unsigned int fw_ref)
>>>>       xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>>>> acknowledge sleep request\n",
>>>>              str_plural(hweight_long(ack_fail)), ack_fail);
>>>>   }
>>>> +
>>>> +const char *xe_force_wake_domain_to_str(enum 
>>>> xe_force_wake_domain_id id)
>>>> +{
>>>> +    switch (id) {
>>>> +    case XE_FW_DOMAIN_ID_GT:
>>>> +        return "GT";
>>>> +    case XE_FW_DOMAIN_ID_RENDER:
>>>> +        return "Render";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA:
>>>> +        return "Media";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
>>>> +        return "VDBox0";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
>>>> +        return "VDBox1";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
>>>> +        return "VDBox2";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
>>>> +        return "VDBox3";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
>>>> +        return "VDBox4";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
>>>> +        return "VDBox5";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
>>>> +        return "VDBox6";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
>>>> +        return "VDBox7";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
>>>> +        return "VEBox0";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
>>>> +        return "VEBox1";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
>>>> +        return "VEBox2";
>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
>>>> +        return "VEBox3";
>>>> +    case XE_FW_DOMAIN_ID_GSC:
>>>> +        return "GSC";
>>>
>>> How about creating static look up table.
>>>
>>>     static const char * const domain_names[] = {
>>>         [XE_FW_DOMAIN_ID_GT] = "GT",
>>>         [XE_FW_DOMAIN_ID_RENDER] = "Render",
>>>         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
>>>         [XE_FW_DOMAIN_ID_GSC] = "GSC",
>>>     };
>>>
>>>     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
>>>         return domain_names[id];
>>
>> I was trying to make it a little more dynamic where, if something 
>> changes in the FW table, we don't need to update 2 locations.
>
> Ok, but even with a switch-case statement, you’d still need to update 
> it whenever a new enum value is added.
> So, updates in two places can’t be completely avoided.

True. Similar thing was needed in sriov and guc code, and switch/case 
was used there. So, just following the same method to keep it uniform 
might be better? I believe i915 used the array definition method.

Thanks,

Vinay.

>
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>> Thanks,
>>> Badal
>>>
>>>> +    default:
>>>> +        return "Unknown";
>>>> +    }
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> index 1e2198f6a007..f7690cb34ef7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -19,6 +19,17 @@ unsigned int __must_check 
>>>> xe_force_wake_get(struct xe_force_wake *fw,
>>>>                           enum xe_force_wake_domains domains);
>>>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int 
>>>> fw_ref);
>>>>   +const char *xe_force_wake_domain_to_str(enum 
>>>> xe_force_wake_domain_id id);
>>>> +
>>>> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>>> +    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>> +        for_each_if((domain__ = ((fw__)->domains + \
>>>> +                     (ffs(tmp__) - 1))) && \
>>>> +                     domain__->reg_ctl.addr)
>>>> +
>>>> +#define for_each_fw_domain(domain__, fw__, tmp__) \
>>>> +    for_each_fw_domain_masked(domain__, fw__->initialized_domains, 
>>>> fw__, tmp__)
>>>> +
>>>>   static inline int
>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>>             enum xe_force_wake_domains domain)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> index 52436dcb6381..8e36202f1a4f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>>>> gtidle->powergate_enable);
>>>>   }
>>>>   +static void force_wake_domains_show(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>> +{
>>>> +    struct xe_force_wake_domain *domain;
>>>> +    struct xe_force_wake *fw = gt_to_fw(gt);
>>>> +    unsigned int tmp;
>>>> +    unsigned long flags;
>>>> +
>>>> +    spin_lock_irqsave(&fw->lock, flags);
>>>> +    for_each_fw_domain(domain, fw, tmp) {
>>>> +        drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
>>>> + xe_force_wake_domain_to_str(domain->id),
>>>> +                   READ_ONCE(domain->ref),
>>>> + xe_force_wake_domain_to_str(domain->id),
>>>> +                   xe_mmio_read32(&gt->mmio, domain->reg_ctl));
>>>> +    }
>>>> +    spin_unlock_irqrestore(&fw->lock, flags);
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_gt_idle_pg_print - Xe powergating info
>>>>    * @gt: GT object
>>>> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, 
>>>> struct drm_printer *p)
>>>>                  str_up_down(pg_status & GSC_AWAKE_STATUS));
>>>>       }
>>>>   +    force_wake_domains_show(gt, p);
>>>> +
>>>>       return 0;
>>>>   }
