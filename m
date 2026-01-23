Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB8D778AE
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86B210EBBE;
	Fri, 23 Jan 2026 18:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axwwnzut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB60A10EBBA
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769193001; x=1800729001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r1KfHKbwlKHrUFWMARdaDe9/Y30Zj63tcbArLzQ0YIk=;
 b=axwwnzut/3PJ76ta1BgQzzilvmkViOtEdKxs+Tnxu0ujsASYOjUEwmVD
 xChXaTwbuYUr484UKDL8wrUYdyFCdkV7LU1jl/0a2M43rTS4QcMm+X6Bk
 /sLJBPnXpCPPc3EwDbMKMzsGvSwg1P3rr/V5ZWwoxylZflbHjXNMzIXmH
 TLgJeHw2sqW8y6Lf20thhxDkqxQ1zi4DfpAAqW3utPpdH6NIs8QeLsubx
 q97O/TXZ8RdpZjsDwwWxr2IeWmAImp9OWnvADLDnkMBYd5f9baabaAcJT
 mp5W/a4iAXttN8dCDkQ+8keTWTzwpdaY5wLDDZ2NT+CQ0NM93k/jLIIT9 w==;
X-CSE-ConnectionGUID: mBIst5uhQLiPIXHSCf1mIg==
X-CSE-MsgGUID: aF/TKPrYTee0LG2obnPaxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70509967"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70509967"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:30:00 -0800
X-CSE-ConnectionGUID: GDd00jZKTuOGoI5Og7lRaA==
X-CSE-MsgGUID: Ncrwli4pRPuW2GVzEo9Pow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207335576"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:30:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:30:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 10:30:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/WceQoDWCbebEgGBcQpioHSMbCwF3c9pfQPnsR/sUK+YeCtsZ5qf2FdpQ1RQIXlKK4mWjHDrq1F6cQVcpCE2n4Cxz8RaFn+Tl723gw3ZuXul/16WvvrA8mnjXfU0aPHf4Pa+2n3nHrxQlXVkg6ZCOefyHgLuGbsWcaIyatI+w7wNxVykXaW+0HrAiK6JxV0n9B80/wF5YjKeS+MRwe2xgJoCPHKPonVaeIJsn0zguxWInK8KnR81uiE7fPLEZ4GOB/ed92kAluYw5fYudip7YFAC4vll9MmtczgULosvtfzex0SL69FZ6piep+bEDigNSq2RrZU3AY949JfKbcoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQgh2kmiefnwuv/Vq46Hk+hA2NBuCUaPu+YkZ5ShOZY=;
 b=fPNj+qtLUc4/CiNxUWl+ZY67PpZk9XY2nZHIpkL3KTel+/ThBI7PDrgS/a8WgEvz+rYz91ioBsh3K0Zh2pmhFQyWiN4fegy44gJWOJPNbf1s9wlWP4L4Hi2u/cPky5qZELyugpQtCI3Eew79XSpli+xIkm0E1dpeSU8dpvsMO30E+n5mjIZFKvOXFVWFSLR9x8wxgIQ4FsoWznsosb7K7ZM16HRYX3C4hUzSwfmqAyPm/mL5bLQVOYpYcA1H8fR/3+2IUckabZeNoaIv9cIAK6ZS6v/jaPJ/6rRuaJgYTR0Zn4VrJ5MyVIfnMD6neL7w/ouh0TWTD0bSxGu8Tuk+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Fri, 23 Jan
 2026 18:29:57 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:29:57 +0000
Message-ID: <3de99a54-eb3b-4464-8ef6-c42ddac7e486@intel.com>
Date: Fri, 23 Jan 2026 10:29:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gt: Use CLASS() for forcewake in
 xe_gt_enable_comp_1wcoh
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260123180425.3262944-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260123180425.3262944-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ0PR11MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d78284-ec2a-49df-44cb-08de5aad68d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0pXa2tQUmRQamZMQWdHSzJpWUtmYWlKdmdnR0IyTkI0WW5Xa2RxVWlPZ0RF?=
 =?utf-8?B?R1hZR2o1NzZwWXlkZGNDMjd6MVVRb0M1UUZQZVhwTnpYdFc3amVwdys1OXcv?=
 =?utf-8?B?WFREand4d2xzS255djhVeEs4WktQbW5mMTJNZHBRYXAzNDBDYkQzanR6TnNr?=
 =?utf-8?B?elB3THdTbHpOREg4dG9sR3JFTnpIUUFHS1BaUk0rNlEwbXp2a3hSSTIrcDdk?=
 =?utf-8?B?TktEdFA5eWllcERyY3RpaFhxNjQ5U3FhVTIyVjZzdFFnUmhPZGlyUlZvOWp3?=
 =?utf-8?B?NzBTUGc1TEpLWFpRem4xeEhOTDZaVjBzeXZBOFhZcWtuQmJyQmF1YkVIVU1H?=
 =?utf-8?B?TUVneWFkWjQyZTRTbmlySGRLNUR4UGd6bTk4cmVobVk0ODFMQW9vUVAvaFVW?=
 =?utf-8?B?Mi9zN0FYb3pGN2NtaW9vdVUvODhlZnFFTENsbmFhM0daWis2RmxzbWZRMVBs?=
 =?utf-8?B?T2ZTRko0NXFmdEkxUFd6T1pnNW1ZOEdXcVRMZXZITURtREE3TXQxa3grUkgr?=
 =?utf-8?B?WGsvMmJNT3QyOUN5aGVyZEx6RjJIVERKUWtPcU44cTdxMDZMMitpcUQweXh0?=
 =?utf-8?B?SVBZQU41SFZtT0dkNWpTelFIN0x4amdyTFZ0NGZvRTR5VFBjNENMS01NRURu?=
 =?utf-8?B?Uk1YZmNXaUJqUXhQSzA0YlNmck5oWmNJMVhWTUxVZnVGUjQ1SVFvVTBZVjNr?=
 =?utf-8?B?c1RjK1BOVUh4SlV6R1dBbW9OUTVoa1pXUVk0S29FZC9KWktOaElvQlZBQU1O?=
 =?utf-8?B?TlBtSnQybHB3MTIyNVdQVDV0UUR5ZWVYZzgwL011QjNnN2s1K3VKckY1YTlT?=
 =?utf-8?B?bXFyN3V4cFJlcWd5WmFNaXFpbGc0OS9jWEtVNUpSMzFXVHNKSGphUjEvSGtL?=
 =?utf-8?B?U1AvaGp0MG5MV2lnZWFncy9TUHo5aTdVTld1amVjQ0d1Y0NVSVQra253alM3?=
 =?utf-8?B?dmJ1OUdDbFZ2dExRM2FLL2NuenE4VVZDSnFsTHhtQm03c29peWRBQXNrdjlq?=
 =?utf-8?B?bEZISlg1SWFHbjRwWXpvWUxONHB6SVdqcU5EM0RqaHBNYkJETVc2U3pMSnZa?=
 =?utf-8?B?eDVHYm5MS2F3ckppM3pLWkVoWXRrRzZaL2Mwc05vcnQvQ09sb3ZhSmVhdGFi?=
 =?utf-8?B?RU0zWFhlc0lrYVJBNnRFS1IvOWlscXVRd1Z6Z1VZWm1LZ2lMMFE3Nnd3eFlu?=
 =?utf-8?B?L0xVYkMrcFlTTkhhbi95UWx5UWVNN2U0NGtid1U4VnREY3BlbFR2dlpUVWMz?=
 =?utf-8?B?TGlzbDJQMGhFVWtFb1g1b1hpRG15OW1ZYzNqSUhKQTVSWmhvTGhGVis4VGVC?=
 =?utf-8?B?TFJIMVprOURqWUNELzY3Z2tDQnhzMkFmS0N0b1BlVVU4emF1bUI4Y3dMeEx3?=
 =?utf-8?B?RlV6Y2lhVVZFM0QvWW03SDdVbUFTenJzKytFTnJXb0FBbXVYYVN0VnNqSzBU?=
 =?utf-8?B?VUdpUEYxNmg4a2xKMWZlb1ZyRDEyNkhlWGM5am80M2lsd2d1aUNadURJT2Rx?=
 =?utf-8?B?UWk1a2lIaWQxTFZGaXFXckNRbnIyWnZuZnFGM1owdUM5cTg4a3ZsMnhGZWpW?=
 =?utf-8?B?UW9STE0zeGpoTlJNcDZqcEI0UGVMV2gwZTNjcmVTTWpnbm4wWnhSY3BpZ0x4?=
 =?utf-8?B?NHA3K0FHREVMZ0hkaUhjanh2L2hENm1nVWhPamlvZ1Y4eE5jbUw2blFUVXV2?=
 =?utf-8?B?UWpTMGVMc3RkMDlwVlRlNFBvMGNESDVNOWdwNU84M2pZQ2hud2Q5UzExdExv?=
 =?utf-8?B?THl2THhIQ3BNQ28xWnY2Y211UFg3NUg3cm15amlXR3RUVDVSSnlBNWRMVHdV?=
 =?utf-8?B?cjJRUTYrUFNSU2s3am9DOFpBdEJJeVBKT0ZoZnN6VXhmNGdhS3luV1VzQWp4?=
 =?utf-8?B?bGhkL0tSbUl4YzFPT25abTJYTFdCU29vZ3FWZ3ZDOEpLdGFhclpVdFMzd1dO?=
 =?utf-8?B?STVQWHBvUkF5dElFZEVFSEVOazBRUWFwMytGQy85ODhtbXh0Y1IyWWRYb2dX?=
 =?utf-8?B?MUxCcEllS2xPMVFvaFlSMGhBL2NlSWp0NFNPdWRTSHF6WEQ2d2Q3T1NjeWV2?=
 =?utf-8?B?NWYrTFZzTXEzMTdTUnJQaThRRURFd01tUEkzdDhUNmozV1V5SHNTREN6bGF3?=
 =?utf-8?Q?1z1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCtmNlVXdHpDbVQvKzMxZjB5SDh3bGRKUC81d3pCMlAzd1hYcGZiTW1tUmFG?=
 =?utf-8?B?ZTI0dHBIY3JZb3N4cFFabHlUbGErQWQwM3RxMnZ4UkZEeS8zNndOYVJhVk5C?=
 =?utf-8?B?UHhJVW1Wclc5TFNaUEZUd2NtNTJXUFlTOEgvUGVkdnpCR0lUUEgzSFNyRWNC?=
 =?utf-8?B?VG1WeHE5SnRNa21pRWpzVE9XYmloYWF6RVNGdmZNTm90NUhHS0RQL2NiUzh6?=
 =?utf-8?B?Q3JKK01Ra2k0T2s4aWVJYVBYTHVJeFM5dk1RR1ZUMC9oSUF4K2IwUVM3SFdM?=
 =?utf-8?B?dFJUd3JZT20rdjNYWmZNbWlEMVJjZHNmZmE0QU4veVNuN3VLMHZuUUdDVlF5?=
 =?utf-8?B?MWhZTlJTblloL3hEVzYyMWlTZW9YQ0pVT05YcW1hYWtCcTQvSHNhMzc5VUU4?=
 =?utf-8?B?cURSMEUydUg1SWdVOU16YzZucHZLREVCUUV1cTBNMndRdDVNSDF0emREditP?=
 =?utf-8?B?QmN2QVNVcVQ4OTNrMXdSZ0Y3UG5TV0ZEbG00cVJwUFI0NEM2eW93MDl1Zmhs?=
 =?utf-8?B?d0RxcElCeVM2UlIxYy92Vm9nMkovWlZFcUNYcW4wOWZlSm5MYTVaMUlUUGhR?=
 =?utf-8?B?L0Z6VUFlWldrVzlOLzNNdlhucmRHRExyUlBFWE5UQS9JeWxtd1QvRVpURFho?=
 =?utf-8?B?NHVxZm5SWGJTWUNXRmRaOVRLMlVHWkZxdkpTcXJ6bkU5VGZOaWd6Y0QzKy9a?=
 =?utf-8?B?VEp2eWpZQVdOQTJ0Wm1wYjN4T0xVbXUzZXIwTHRVMUpjeW1OWHNwTmFZMml6?=
 =?utf-8?B?QUVtYUR3UTF1VmhwM1FLSVZPNnFwNGovd00yYXg0NnVpMVVhL2prSFNySXdh?=
 =?utf-8?B?cEh2dndaaHhvcEZqSExTbmVYTmhvamgxRDdEMkZOMTlMbHdMM1VPUGFCSHNP?=
 =?utf-8?B?VVFpMVFUeTZYY1VoeVhEaHZWTndNVGJ4eGNzQTZqZDRSSTNCZjd0VUt4SGFJ?=
 =?utf-8?B?TCtFMVp3UjNrTWlvbXA2NWY1SG4rZ2RBRDVZWmh5L1dXbytjYU5Oem5vVFQy?=
 =?utf-8?B?VThXcExlZEdPdU5aWHBnZ3JlY1hoVWVMa3dKTEN6YnJ6RUxEWnowMFhkUUZY?=
 =?utf-8?B?T3NIOSt1RkgzOWpqZk5UR0ZuT2oxRGpnZWVPV3dKOExRN0NBTkpwa3JibzJj?=
 =?utf-8?B?ZjFwMjBVdHVCSDA2dUhyUk4razV4ek56NTNiK3R6UEM0VnhmY3dJVGhZU1Q2?=
 =?utf-8?B?cTREZVBnRmZRbmUwTUdGczJLNVZiWXcwZGJhRHV4RGJCcXdseHVqemxpblBC?=
 =?utf-8?B?YUgxdDU2Q2xUeFlLZC9kYnhPVWJGTUszcUhOYUFpYmltQ3ZNVE91SS81ZVFY?=
 =?utf-8?B?MUh5UE5ZTTdZNWRHeHhJVWpSQ3prQVhvZ01SM0orMjNCekx1c0VrZ3lhQ2JS?=
 =?utf-8?B?RFoxMzFBTG4xU2JSS1BYR3RER0lOYkM2S2s5L1dVU2tVVVV5Z3B4cHZZZFVP?=
 =?utf-8?B?WkRKc243RGc1QW9zSmJnNnhEYVNvUUFPbytzMUE2NiswS0VkNFVsWG56UlBu?=
 =?utf-8?B?NnV3NTVaVkZTSGNFODN4aUJWWjkwV20xNnRZT2xpdU5yNE1GM2srbnJCZ0Yz?=
 =?utf-8?B?MllIUGNpV1o3MjVLdTg2MWY3NU0rSjAwTURyQWIxWHprV1BZWWgrUFNsL3Nj?=
 =?utf-8?B?YlA0dm1OQ1J0elI3dGJPUjdoWGFrUEFiYlFNcUVNM0kzMTJ6VVBlaXZOQ2sy?=
 =?utf-8?B?Q2RFaDdwcjNScnM4cDRyYVZWeGUwWlErR1lkRGRlOUFPRXIxWDZoSnVwZFJJ?=
 =?utf-8?B?bUp1cURBdDZWSklZTFFhQVh2VjdsQWVYd3JsRHl0bGd4aTI1eExLL1JKREt1?=
 =?utf-8?B?dnp1c1Y3bVp0S1hyNDc4dFdvZHh0MFEwcHJBVEpKTjdGSHY3MWJrQ0xVaWxY?=
 =?utf-8?B?clZocnJjamNLL0phM1Q3K3RlQVowWDhZU0NGdW5rajFaalhUZjZLanZHeWlp?=
 =?utf-8?B?WVZtYzJ3SHdXb1ZIM1Nad2RGM2tWWWVYUGhuSjc3M1FFdGs0SWQzUkJCMmhO?=
 =?utf-8?B?M21rcTgrcW9GM3EvUHZ1cUd0c1ZEQkFSWUFEMm13VU92NzZFZlFqOXBPRFg5?=
 =?utf-8?B?d2ZOcGNEcGxLRThjWDlleVFLQVU1ZUN2MVFJNGh1algzRkdLdlhlV0VYYlgw?=
 =?utf-8?B?ZWQ0OExTaFQ2M1plRFl3YmpkMlFidzhiczdoQzN6ODg0RWxGU2EvUk9nZjFw?=
 =?utf-8?B?dGdaTmFzOGwycTFwWHlyVjVkaStKQ3pzciszaTljbTJqY2hSbUR1NEViSThO?=
 =?utf-8?B?SlFqSko1dzBqS1dYbmZuQ214Umt6dEJYd3RoZFBWYm9QT3ZObTgvQWpvQjFV?=
 =?utf-8?B?d3NheG1neDE2MW5NN0RWekN3RzZCTXlzTGhWbk1JaFFyakl5UGF3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d78284-ec2a-49df-44cb-08de5aad68d8
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:29:57.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXVCUnoivnEWatB7qPU3y9NGgvDiOSY97MnOGBg2q5565h+u+NjdKICEnnXC3M8JE6RC5N+U1blkogx1lb0v/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
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


On 1/23/2026 10:04, Shuicheng Lin wrote:
> Adopt the scoped forcewake management using CLASS(xe_force_wake, ...)
> to simplify the code and ensure proper resource release.
>
> Cc: Xin Wang <x.wang@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..22132467ff4f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -141,15 +141,14 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	unsigned int fw_ref;
>   	u32 reg;
>   
>   	if (IS_SRIOV_VF(xe))
>   		return;
>   
>   	if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -		if (!fw_ref)
> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref.domains)
>   			return;
>   
>   		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> @@ -163,8 +162,6 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>   			reg |= EN_CMP_1WCOH_GW;
>   			xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
>   		}
> -
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);

Thanks for the fix, LGTM.

Reviewed-by: Xin Wang <x.wang@intel.com>

>   	}
>   }
>   
