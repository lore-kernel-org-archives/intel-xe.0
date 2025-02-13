Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D65C021A7
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 06:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434D010E3A2;
	Thu, 13 Feb 2025 06:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erXqJYDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46710E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739427411; x=1770963411;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3SX2+viStkUfZPiV6c/W1exPOrxCs+TANkKI2M+aq5I=;
 b=erXqJYDkMcZ4K/5+AgnoQQEoEo3UEKvzKygDdjCdpSqDWWRBYEmmLSca
 9JLiO3PwVR6d/EkuEyFFdF2/NbxM7e79mnvfzs8ApXAKtIdda5yfkNwM9
 pkhb5m3y4Uf7xDtlMGB+zKvx3DDZ8vV58NueVl5p1vhkIjvtYNIJYAWyS
 qa3B9r2I67M2oHEei7zHB0/2CwN8/s2D89/BgKkT/I1B4qTjnPDhjFKTO
 u0K7m85T+qYtWtqH6idIKfBLu2Jom08TmTx6hnTJaE82obIx1UtIzI0jk
 snS922htcJFATdOTf9iAUpMgA1xvoxkrBtIlUhuXswyOTel83YtQrvFB0 g==;
X-CSE-ConnectionGUID: KbGUCQdzRV+juvhFt1FnMw==
X-CSE-MsgGUID: gYVEK2VnTNadOi3ntlQHUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62580662"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62580662"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:16:50 -0800
X-CSE-ConnectionGUID: oMUap78ERA29fMDQLznxLg==
X-CSE-MsgGUID: m79fHdwERISy42tzeyytog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113012602"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 22:16:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 22:16:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 22:16:49 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 22:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCJU2l7AhZBuiM5M4XFkte4gBivZTSFqEywLxMjN7hU+fGFRCRY76FdMn+cGOx3gdm5RuDkVvdZuiY0xzKLeD/oa9vHvxZ+UitL5mtP+JxAs46lbQA30oYJDaa8dPzha8vdwGH4Lfyw3iAp5+0IshCelPTvbA0qc2sY24hISLjzne/d8P8tGW0omgoPB1eYFjQVVsasEYbmntq0iWpwsaOCBbVTDsZ68ZDU1sgY9xFMFtdou7NRanZVe+iZWA2kUX6ifxLP99GqQEGYF6oEHMg4c6gvxqXPJ64W2oeVejSKRiUucG0hPSlEoGOcyzJxSycJwVxZmmdx8H+6CPH8diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ua1wcqoBpf5hhOaLXtNrTeWhnyZ+n6OAc5l8rlrXRg=;
 b=ivZvrz5KuFdqDkhtN+IBKoLwiIUS72PRp1CPXlbrQXkWxE9/Mn2wpAbJe5a+q2b10W3EaS7So7Vx8itmk2KC1YK0zbTEnQPj8vhZ4VJ2kOfpxrzHj8Qn5hrgaZ8BvzFApn7k5dunLAevijuXDiFAuZQZyPbGTKiyFlr5BO5kQavBOfBJh3QBsRDVOR2j0oyOnTXZKcLhoaq5Y8KH4vAf2duUpggouDGq3HlLUGyI90QDMrYH0RISmqx/OL2e8F4aMzPYnWDYmjml4CLm3VbzoviNBGI9XwNevA1SAmzJiPmoY/fPXQULDm/zEhu4jBUFFr8Q56qM7jkoCtQuRP5FFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 06:16:19 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 06:16:18 +0000
Message-ID: <781c3143-09b6-48b5-8001-7bf506c4df00@intel.com>
Date: Thu, 13 Feb 2025 11:46:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix typo in xe_job_ptrs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250213060838.32493-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213060838.32493-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: f01ee5ad-c284-4deb-5201-08dd4bf5edd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEMreFJ4TVAyaTRxeHhFYytQazljMW9USHFpSHRRZ0tzT3h3OU8zZ3FhLzIv?=
 =?utf-8?B?bUo2K3JQbG1HREZuMWs5ZHdualBPQ3psSFd2QzFlNFdubWw2c25LODJqSVI4?=
 =?utf-8?B?aVBHRHJ6TTUxY0F2N3luak14SGdFWWZlNW5sNGZjb0hUM2JQd2xrR3llNDY3?=
 =?utf-8?B?UHRSYy9JRVNzT3NqUGR1bWNlSUw5R09IRW45dzZVY0gyWE4xRkY5M1hJNWRL?=
 =?utf-8?B?MStMQktUUUVUa3FnMnhrL3AvdHMvLytYOFB1T2FIM0VsMEdHeUlCaS8vTDls?=
 =?utf-8?B?VTZLRlg2WUhHODdnaHdIVlU4MmtTQVJwN01VVURESFRHUE5CemZxRzhZSXJt?=
 =?utf-8?B?dnl1aytLZmhJSlhQM25aUVRUQnFoWEtVRkRaZWxyd3liZDlIbGlZYUgwSWhq?=
 =?utf-8?B?b2dnS2w5MWpFTUdueVNEQmVwV2FydU04VWtmb2ZHTmdvZDl2eHhNZ1FVRUp4?=
 =?utf-8?B?Zi9xTlc5Mm1FZVgrbU5DMGhzS3VJeFM4MmJWVS9VOU83NUtuNUptdThrL3o1?=
 =?utf-8?B?N2poa2drSmg4WGFpTjBtZWRwWURxc3g5a2hhU0xsMGk4cnlQQXlXc3hLNkY1?=
 =?utf-8?B?Wlg2VVpPNmc2VDFHeEhCMTR5Qi9hL1VITmpxejA4bHExMlU4NW9ocFk5Nzd5?=
 =?utf-8?B?QWRQZEhadkpIUUVzNUJFOTBJYlZCYldlZ1dZbEdZMDF3V0FDTjlwazVzd09Y?=
 =?utf-8?B?Y1JISzZlY2N4eWt5RzVtbytDSk4xUnIrNURBTDNnR0I1T1Z6bGxVMkh3d3Iy?=
 =?utf-8?B?Sng2LzRNZmJWcW4wQmhiQ2REeU9mME1WcDQwY01nSENqbXRUdDFHcVF5enVI?=
 =?utf-8?B?YkU3NGtUS09ZRU0wb1JCK2Via3V6YkM1bDJmL0MrWHZyUDBoUnZhOE4ybzdH?=
 =?utf-8?B?dE9aRXZZNFVLM0NoWXlsNkUvU3BlOVBlSXJDZ2VJSDhHdG1sTTQ4cFRmLzhJ?=
 =?utf-8?B?Y3YwQWErUkJjWm5JSFFxOGtZSHpacE1KUVV3NnRjWmpjU2g5TzBpQU9rcjFz?=
 =?utf-8?B?clllYzZwamV1bnJnSk9qS2Exc0pOOGE3ZXMwNUZMYS9pUjQzL1ZoMXhaWFhU?=
 =?utf-8?B?ZE16aERFdnJ1NVdwNVJRR2szWTFHL0pPSldhOTdyRUF4WGIvUWxHc3FJWXpn?=
 =?utf-8?B?T1lkcUptZitKVEkyQ3dZaUpjWG5sSmJVTkZXMjhvVXFtaytaVk5TU2Z1dlln?=
 =?utf-8?B?M1RQVlpzc2R0VVdwbXFDTkt3SWx3OVhjalhtNHJsbGYrRVZzQkZkQVlyVUd0?=
 =?utf-8?B?d2E1WjJqL0M2ZkZLVm92bms5dG0yTmtCZklwK3YxWVlKSE05WVFDb0ZKc0tC?=
 =?utf-8?B?NG91dDAwdisxa3dsTllSMEtyeGRKQ2N4dCt0bDZjQi94Yy9MMjF2WHFCMEs0?=
 =?utf-8?B?d0pQQ2owTDFnVG5wazNPamJlZU4xU2hUT24wNVBBS01XbC95R3BtT3Y4WWd3?=
 =?utf-8?B?bzQ2aW5EeUo2bCt0dmpZMm0xb0NudUdtMnVydEpaVXBFV3FncUVoZU1WTlVU?=
 =?utf-8?B?eVVJdC8rT0VPRHM1bWZFNWo1R2MvaHljdkxQWldGQnpIWjduRzVRbGZMRWho?=
 =?utf-8?B?Zk9kUGNHSzJ4aXF3RE5BK25MOURrdFhKN0lTQ3k4S2tweGVHSzRaUlVIWTAv?=
 =?utf-8?B?eG9MZ2YvY3QrSGhTRjE1MXJHcjI0b3dpREtsaG5nTndIZUMvNUhWYTR0TzZl?=
 =?utf-8?B?Y0VTUVZXajVZQndNTjJrazhzcHBkaUNSYlVkOG53bDZrZzFnSlorM0VUaXZy?=
 =?utf-8?B?bWJNakM5eWRVTXZGOVJMaDRYQ1FwOUR3dUE0ejg0eXRvUlIzY0hjYzBhV0hN?=
 =?utf-8?B?NzN0ZUNvVEMzNDc0K3BzbUV1WUNlNVJaVVhGTTBjUkV2bWUzYmRhaDhOa0JR?=
 =?utf-8?Q?Z959RbTSv9YCT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1rUkEyNktmTmpmS0dlWUJ4dWNMZXd4SFVxbHB2U0lnMWJ0c3JGOURoRVBU?=
 =?utf-8?B?a2pQSkdDOWs2Mmd3aXN1THJyN0tBSzNsZVQ0SkRNRjlsZ2dQb2ZTaXlkakxD?=
 =?utf-8?B?R3BIaXNpTTZpQnVIekJtZS9HQVRwVGVXZVhSbG1mcTJyV1pveUtEeUh4dnNF?=
 =?utf-8?B?S0RxQStsQmsxNjZ2VFVNR0diTmJ1bHlxOUg5OGZBWlh4K2U2VWppUGVLTFk3?=
 =?utf-8?B?U1VXdlVheWZFMmw4RHdJTEttcDhQR0ptRFhnczd3ZVJOcDlvV2x0dVJhUmpn?=
 =?utf-8?B?NVFIajQxOHNBTHJVeVZSMTIwRUdYd2VCWWcrT01nZzVPNXVNOFJmRWNnQnVv?=
 =?utf-8?B?cWxzYTBvejN0cUxsRTZiZWg3cGtPT0tkY2RlUmdmdTNPb0k2dTg1Mkh3bkVn?=
 =?utf-8?B?VTluR0lTeGoyWjFBY2tha1JlZ284SkgrRVR0aXo1ZmxoUVlyQjIvbmtEbFNX?=
 =?utf-8?B?R1l5VEFHaTFjcGFOR1FjRHhaZXJYOXBMMzNUdVA5U0R0a2pVSk9Hc2tFamk5?=
 =?utf-8?B?alpzcGo1b3ZXbGdlUGw0dndrTjhVREZ5cHd4cHZ4YWJsN0NScGZPWnlpaGFj?=
 =?utf-8?B?MUJEbTYybHY4M0F4UDBzcEkzVUVhUjJOR1JhaVY1ZXJ6WHEwaTBPVXJqaFNm?=
 =?utf-8?B?cG1teTQzZHY5RWtvRGRkYlMrV3BUbGRYOFJ3L0daSjVQODdVQ1E5UjNOUE1j?=
 =?utf-8?B?Tm9lWGptbUU3SEYrSE1tMmg3YXVJMmJpQ3Z6aUl3UU5jWVV5S0lsa005WDFP?=
 =?utf-8?B?TjdhTzFwMWE1QXhJREo4eExRYjNJSjM3ZW5yZzFiek5aaVpFakxQZTJiNXlT?=
 =?utf-8?B?WXR3UHhycFlOZ0NLUlhoWnIrVWJTQVMvQWxiSkw0TC9VYkF6Tzc1cy84Sy9u?=
 =?utf-8?B?KzEyaldtcjUyYWRGdENLdFA2bWh5OG53Uklla3ZPeUo3d2hlbEp4TVNERHhr?=
 =?utf-8?B?OWNFVFR0QnZ6a01OdHZzMHZ4bnprQ0g0aVdLMlhxM29ZKzYxZ05nK2w0c3FR?=
 =?utf-8?B?NWgzVy9CdE1QVVpKTkVIT1NSdGJwSTBnZzdNLzJ4N0FzUVlUNDFWRnYxOU5a?=
 =?utf-8?B?YlovTk54V3R2YUxSTjhjdkdXczU4c0pvVzBZbWpJMGxYUFhpTGkzZGZEa1Vs?=
 =?utf-8?B?L1d2V21VcXJKd05UeWNLQzU0bGFWWTBwWDIzWGI2MllxSi9rVzVKT29hdHVv?=
 =?utf-8?B?dE94K0JJeGVQdFBrMktJTGo3N3FUVHVaWWlydmZyOTl0cTZRTHh0V3Z6QVlr?=
 =?utf-8?B?dFpGY1VGdXJvRlI4Z2xrYTNPdlpYTkNGb2NFQzVVbVJ4NFVCTFBlZFpTZ3JG?=
 =?utf-8?B?ZVVURnF1R1RpNW5wdlNIN1hDN2pBS08ydDNXV2plbFZZZDdpTmt1a1NzZENs?=
 =?utf-8?B?UU1KbFVEaW1PZ2RsSStWYmNUa0dBRDA0Z1hCa0EzVDdkZzkzS0ZCRHBtT2hL?=
 =?utf-8?B?aDF4RGdEbk1MdGc0eUlsS1VFR0ZFN3QwMEd2c1d0emk4V3I4Z1BuS3RyZFU2?=
 =?utf-8?B?S095bG15T0V1SENUeG1jUmxSWmc3V0RBU2RITGQrL1k4b0ZOWldRRHM5aFpM?=
 =?utf-8?B?OTFOWjhXNEI2TnFzTHZMcnVvQkp3WDY1Y0pvR2xiem9vdEtpcS9nbVhGdVJP?=
 =?utf-8?B?SEcxWjUwVW5CMThnZ3dpcnZ3bnNxZTB2aXVqL2FUSGNTbWtDNUZtZU1DdXQx?=
 =?utf-8?B?dlp2WWNLQXhhdC9ZcS9wY3ptelFiOWFPUW9zYlVaUkRPcURlN1dPMjhZZTBB?=
 =?utf-8?B?QjNDbVg4MzJFMWQyV0QxZWtvR2NKd0VoOVg5aXdJSUNrTytIRnZoc3BrUW8r?=
 =?utf-8?B?Tnp4NHV2eW55aGNZMzB3MVBVRzZYZ25MMVQrVVN3b09hTzBBQU1GYUE0ZHlF?=
 =?utf-8?B?WTFLM1FVbVRsOWJMUkF5VmQ2UWlTQ0VyQmwweEpIcjJuTlBZK2RhOVJXRlBS?=
 =?utf-8?B?U2wzQWF0bytwbVFQMlFuZjkzVjFHeUNxaVI4L1JCdFNNQ0d2clczbUphV1I1?=
 =?utf-8?B?RlZGQS9QbGFkV0ZiaGpiL3c0VUJybGY0T21acDBZREh2S1g0TDhmT3RNRktJ?=
 =?utf-8?B?bXVkZm5jVVl3S0FVRHNQWEpHdzBGZmNITU5mMWtodEtVSElrOXlYZmRTUVln?=
 =?utf-8?B?TXNzMXh5T2gwSk00T0pXWFRTQXlZenNmZ1ByMGs5MzlGYmdYS3liNUkvSlNH?=
 =?utf-8?Q?FeDEyccUHW4/rG8ZH0Izrmc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f01ee5ad-c284-4deb-5201-08dd4bf5edd7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:16:18.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUALzAvbQ0PlDublSQyhiFUyg6oUHe+t7Q694ui9zjK+78dIY2wRGxOn22iQbmOSJ/cDoTtOtk6iORbijC33QiB2AOH2+Vl0RhF3+QBwlzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
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



On 13-02-2025 11:38, Tejas Upadhyay wrote:
> %s/uinitialized/uninitialized/gc
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job_types.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index d942b20a9f29..dbf260dded8d 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -18,9 +18,9 @@ struct dma_fence_chain;
>    * struct xe_job_ptrs - Per hw engine instance data
>    */
>   struct xe_job_ptrs {
> -	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> +	/** @lrc_fence: Pre-allocated uninitialized lrc fence.*/
>   	struct dma_fence *lrc_fence;
> -	/** @chain_fence: Pre-allocated ninitialized fence chain node. */
> +	/** @chain_fence: Pre-allocated uninitialized fence chain node. */

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	struct dma_fence_chain *chain_fence;
>   	/** @batch_addr: Batch buffer address. */
>   	u64 batch_addr;

