Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C4CCFA05
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 11:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2011010E2C0;
	Wed,  5 Nov 2025 11:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/4iiDYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4B810E2C0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762343785; x=1793879785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XCRVELDoWu5b4pDPd66Zb4Ftrmwkoj6iShoBnAiOV/k=;
 b=f/4iiDYtnh5Z7b+51Yn4XN16JF/0qX/HAKDEbNaYN5Zg2PWzZUa0Pi4U
 wd9t9ON0c0T68JFMMMx1+aIoTzwL/4RMAPLAmwif9XnZ+1ztsDEwWcx/r
 GsMXegTvVHo1IUBoMizD5CAbCxH6wdm1io64DjB6ROvLk1xfbJF83Z5UK
 EojbYCT3i3DCasEuSOYH/iTMp4a7dgY1ObISfOOqBh8XUi/FQcUtD5q9N
 WVbDrvnz593V3N0YBQDxXXQBMA+7WezCIlW3FSKL5F5pHPzxHVK3INSKZ
 h5AjB5zMjm4LXFbj/AqfdYaTRu3t92iu4T2hhdo2wGyQ99is3M8ucxhd8 w==;
X-CSE-ConnectionGUID: RlyNHL8vSl290dCCGequxg==
X-CSE-MsgGUID: hkLDyE/ARoeGhFX2LlC2Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74748519"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="74748519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:56:25 -0800
X-CSE-ConnectionGUID: wj64jYS+SQiSoon3i3zhTA==
X-CSE-MsgGUID: i60zzF4HQWCNGqVVjuYYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187597272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:56:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:56:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 03:56:24 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PojAb52Jx3Z5TJ1TgsbescHpmLGcOn7vSgaKKtZzO1vhMNQ1M/ScPON2bEStnxub+tqOJbfEdCVpwkS2svmS26moN50lc1oU+At+rMEhdXcvP30JuvoLxFU6KOVNJxDy5NmFC9I93dypVr1I/qu8cGs/C8VnrO5aF1+R3nF7Wb3b7/4ZxLDvxz4SIYdbTkGBBcm9TgPnP9pqantRJ+Yh9URCG+FYoMT03C5kFLuTLxqlIJlxRpreymAtPMTIBUWVv1ndItAVTkBgZXCvZLekXHzbq+fANR3UzxsjewPzDzVNROP543LX3eOVNDB0Hjh+AjOBjL9wLc286XMDVZhsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myuqgr3evRqbsIyR+i/ca4eYO0qoaXRIXO+arDBO/lQ=;
 b=ID+A7qSR1LnJipgIxs2oDyr2DEDRqMXLD51mDxVjfDkEfndaG0skfNtyGLh57ZNMoPxzEN2oWHhNbvtIfBZHvp7F2u0CAszBOftzrx9GJHkdzc/q3WNfHiSxWkw5Sc9YnMDdncOxbT8NkXsF3Ksoez/4GhPb49cRLBGz/qmRv9KZLkzD2+zcYzltjVZvtvR1LGQ5LDgGd4Weuj39NvP8g/XMOIJt00qkBX5rtH/zxnZtQrWlxRFmU/6AdLb5jPS+osZmEeqyS0Dw5FvUmmzJebj6tjUuA9Y6YizXN3qeC2qLrQqRacE6Mvel3eWKwb0aQHGuVVN8CL+XQUFaqBDQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 11:56:17 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 11:56:17 +0000
Message-ID: <6e35bcac-e7f1-4a8e-bc18-2b22474f68d6@intel.com>
Date: Wed, 5 Nov 2025 17:26:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xs/sa: Shadow buffer support in the sub-allocator
 pool
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
 <aQjm1Zp+ZzVFJnpE@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aQjm1Zp+ZzVFJnpE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: bf944c2f-2112-4eaf-6eb3-08de1c62538c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3BZb1pac0h2OSt4YUx4MG9iQzIwQTFTaFpjdzgrQW9FVkVTVXNCZnF1cjhl?=
 =?utf-8?B?Vk96RGZhT2prYlR0L0VUV2JxY3g3SHB5cGE2SzY0aWxKckVrU0VZd2w1ZnB4?=
 =?utf-8?B?dDQzZzJmYUtzSU9NNDcvc1ZFR0RqbjFWMWtIejFTbitDNzdISEx0MTNGMlUv?=
 =?utf-8?B?Ry9hbmZaRk81aGl3K3VBQ042MGJZYksxV3hSRk1ERkFLTTdOSWV2Q1dMUlVk?=
 =?utf-8?B?aElkdVVEZXQwMEZHMm5CVDYxMFNDOTRKZ05KdHB0OUEwQXRHVDJCc0paOW82?=
 =?utf-8?B?ZSs0MUFjYVl3Tmx6ZXpsQWpJN3gyS1FaQjg5ZkVpTks5V0U3WDdJa3JtTlp2?=
 =?utf-8?B?bGRybGI0Vm4vdm12N3VhK2dJNWhhOTczdUhwdjZ2L2ZNZUhyemdRWUxZM1B1?=
 =?utf-8?B?ZGt2R1phSlFtZ2lSYkt0dk0rNmx1cWwzMFBUTW9oQ0F6WXh1YngvdFUwL1lJ?=
 =?utf-8?B?dTl1alk2ZCthaGtLUnBFcWFaS25ldHlwQ1RIYXd4VWt5K2lOQzd1b2RiL01B?=
 =?utf-8?B?SzNodzh0cEhPSnNaN1N5cjc3QnFqTmNsYmFjZVhRenFpSlRVcllsendwQzAr?=
 =?utf-8?B?TFlvTTh4VFRCeDhYQ3dIbU5STmRVVWdDYzAwVVdNWjJaMmwzS2dUbjBZN1FB?=
 =?utf-8?B?SHRNT3dSNFNlYXNZVitDZVF2OFdRNHBTV2RES0FvcEdVZ05wWXpIWElHY3pM?=
 =?utf-8?B?RERUeTVOWmc4ejJsN2xjTE5hZ05xdWdDY3NwRjNiV3UvZWZ3SFJ4b2xFSFk1?=
 =?utf-8?B?dGN0ZU81NzRtMytrWFlRVlZUdXRHK2VsYXd3b3p5RkxPWnJaNTR1S3dLcjU0?=
 =?utf-8?B?dlREZVczN05VU0h5TStBUWN6TkZBTXFaak85ZXZTSHZvMFN2VzBrbU5WNWZL?=
 =?utf-8?B?WHk4WmhKNERNcDdaajd6MVV1SUhkVWk4bHlGM3FPR1RidEtsTFdBd3c1K3hT?=
 =?utf-8?B?bVFuLzJPVXhwTXp2a3VmeVVIeGtEY05tNWhpRnk2Sit0ZHMwK3M2Y2x3RDEr?=
 =?utf-8?B?WlRzaUIyM3pKWk5NRkxTSStnVjhIMUIyUGxrdnB0a3VLbzdqQUJ5SGlENWxw?=
 =?utf-8?B?OE1vWkFDRDlScHBuUkdVdWNTTGdwb2JXVVhoMGw3TmorT0JoNjZEYTZDa3Y4?=
 =?utf-8?B?YXAvbGdJZEE1eEQya3ZBU1lZelpHeS8xcDRONDl0MGpKY0hMNTZVdlhiL2tj?=
 =?utf-8?B?c0wrcmlBUDBrUFJZckJFVWs2OG40MCtUK2tNNytzcitGbWlUK3ZuSlJlZkFH?=
 =?utf-8?B?eVZMTnF6L3k2OTgzd2JIQ2ZQWHdmbXRrOTNQKy9wRjk0cThCcW9FdlpsWTQv?=
 =?utf-8?B?QkJYTERKUEtqZklDVDNaMXJoenczNGxNWVBFR0VUWFNWZGpxL0NhcG5MNEph?=
 =?utf-8?B?elVzNUw5UnJvN0JUaFZlMGRDWUlUQUZEbEgwSmdyQUlFUGdITm9LWVF2S2Qv?=
 =?utf-8?B?TWh4NER5aXZDNk5FUmpOZlVzdERxSmE3WUx3dWN2ajcyT3k0aHZiM1JvUVVx?=
 =?utf-8?B?RzhKTytVbE8wdGdtSSswbEFwWGtQM2hVMm5ybzhGdEh3SXlRK2ZOSk5rMVk2?=
 =?utf-8?B?TUhiRWtkcEM1dmFGTHFlMml3TGhtK2hhRGJZU1MzU2JBd0x2TXQxUG1XRkU1?=
 =?utf-8?B?L3NXeHRZNEFVTmcyVTc4VTh4YlVKWmRZZ01rcHFjditIaWdqck56UzNJbGRv?=
 =?utf-8?B?ZEdCQllSMlFXdzVXWGFCZ29zTkJ3QmowdkRSRk93V2p2cVlBbkdRWUFXZVhB?=
 =?utf-8?B?R3dnVzhkSVMxeDJ1WmpTMGhQNkJSOEZqNjl0SnZ5RUZsNDdNQkliZy80SnJz?=
 =?utf-8?B?VWpNT1Y0OE5MUVBHVVBvVG1wNThnMHppcWM1bnV6OWl1b3NaT1hwK1RXYnNj?=
 =?utf-8?B?eTlVcFNZNDVSb3IxbUFDTVR4TDZaaWtqU3hBa2R5Tm5KZGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1zeHN5OHN1eTZSaDhtTUZKTVlUemhhUkEvZVlSdHp3eHVMY2ZneTdxWEVN?=
 =?utf-8?B?RVh3RVNyeCttYlhUTkJQTVg1eXpFUVREMktGNWl1bEhwTjBsbUpWbmRrcStL?=
 =?utf-8?B?UkxPS3FHM28xcGV1L3F4Ym13NlVybTFMZHg5cWx0MFhPb1BjVEtBK0ZoeHN3?=
 =?utf-8?B?S0VGSDRUL2dMSG5aYzZ4R1JpK2tPaDdFQnZmbjFRdXV4QkpnZWd6MU8wRm5H?=
 =?utf-8?B?QTJwUm9SbjdHUWx0Y1BDRnlHQWNVN0Q1TTZHdW81TUtyOExaL2wyYjVRZ0xR?=
 =?utf-8?B?TVRpT1UrYVlkY2oxU25SSWV4VERtSStTZ1daUDR6U2g2b0ZFUTlzb2ttSGcw?=
 =?utf-8?B?VGhTTG9YQWNManpoazFXNUZIa1NQK2Iwb2dWRW96TEZ5TG1qRHJNRFQrR2xs?=
 =?utf-8?B?RDZqZkxsOURNaDF6MEV0VE5LM1NrWGdZK0lFV1BpdWNpQ3dYUzBCOFZ2VEJJ?=
 =?utf-8?B?WmJRUTFidzV5L2hCMnBHODFEbk9IaU1sTDBlallBUGZWbnhGQVRkSy9hNzYx?=
 =?utf-8?B?UkY0azE0LzYxSEZhTVA5eXovWkxHM2xKR3o4amJiMEVmM0xHVDRYRTNuVGhp?=
 =?utf-8?B?RWJlYVFTcjBOa2hFMjkvcWo1azQzVWhtaDh3SkJOcE1rV2Q4cVNEd0o2R3gx?=
 =?utf-8?B?dkVhZHN5cTNzWThQQ1pwbWNSb2lTZWZ1NFVTWjV1aFl3SjI0RmpjTzdSSnZx?=
 =?utf-8?B?Y1cxLzBVSzhtVm5EUk5SeEk2dzQxRWIrNzJKTmZ6bENzOVUzZ3BZN3N2UFNp?=
 =?utf-8?B?UUtKWERRS2RpMUxVRG1lSWVaVkUrcVBSMjkyYWY3SzJpcERKUys4aE1QZmtQ?=
 =?utf-8?B?TloycGk1QzFKRG9XTzk5R0RKaHBhZ016YzVXdDZUSXk0NmVucVFHaWZ5bTdB?=
 =?utf-8?B?NGlRWFJLbUZSL0xxK21RclVXNkRiVnloVWduaWhmcmtsc0xjSnBKbnFQNXF2?=
 =?utf-8?B?QXRnanRDV2E0b0lMSFFOakZsVnFaSktDRW12eW9pclRlcC9MYWp2N3dHQTNY?=
 =?utf-8?B?cDN4NHBhRXpmdm1jNzRLbHhHSU9aN2hmVG5aNy9ZaGF2Q3krdVBYOFJ1ZzBD?=
 =?utf-8?B?TWx3Yi9kNFFTcWF6TERlOXRYTnZRYnpybFlpRjdJZUhkZkhWM1dwL01IQTVn?=
 =?utf-8?B?WHNGT2xnRTRqc0tvS0JFa3JieUZMUmc2MHErelRBdmo1UnRZSTh3NktGMnNx?=
 =?utf-8?B?c2kyZExkWlVLSFFNMnhuR1lLZWxBWndDU25ZMVNVMytwcFdNTlhVdDl2Q2lt?=
 =?utf-8?B?UUVsVENlL1J4RnQrNGhWeWQzeVhOY0k0OGw4NXRqNDR1QmhKc1lwYzR2Yklh?=
 =?utf-8?B?NzFEYmIzdElLUlRadkpIOVlmMlIyZmoreWhZd2o3QXdFblpFb0VwNEVYcWQz?=
 =?utf-8?B?OEJuN2cxeGFBVHBIRWp4Z0xNSVhDa1AwMzVxeWdyVm9pRU9WUDJWUTZwbU1X?=
 =?utf-8?B?QUswU0huZWtXd213OHBPVlJCZllhdGlDbzR3Rm43QVZMQ2pxYVNNemZ6ZWNC?=
 =?utf-8?B?Q1lXT054SExpVjhINGlseHNxcnp4d3Y2OGUzdW1KOWRmOVNIZzRxTHo4aFhj?=
 =?utf-8?B?aDNkeVYwTGtvTHI3QXU0eTZMc1F4N09DL1U2ZERYdWN5Vy9RMkp2bDY5bndj?=
 =?utf-8?B?MkZKWG03NkVxUHlIaFU3eHBVU2R2YWZZS1l6TTBYUlBidWtsdSs1Vi9kS3Nw?=
 =?utf-8?B?bUpkd2VsTE05VnU2aFFvUGk5LzVXalF0ZlRRWjN3UE9WU0ZvRXNtZ0lYbkdY?=
 =?utf-8?B?ODBhaG5pYzdYTUNINVgzdE5qUnFzcVcySDZlMUd6Ym1NSWM4ZHJrWjNGWE5q?=
 =?utf-8?B?Qm9aVURMemJIakVwcC9XUkFPeEcxT1RheUoySUx4enZkakp3ZURiRGY4L2Rw?=
 =?utf-8?B?OHFLSW9wRlBqOWxUaTFYbXpPMGgrd3BwOUVUUURZWjVYd2VZY004QjBDa1Fh?=
 =?utf-8?B?S2N2T0FMMXlXRDk0aC9TOVJDdk5LN2I2WWRzLzV2cnRHYmNUSEZydXhLTHNP?=
 =?utf-8?B?YllwOUZ6MTNvUmlZNjBic3R1OWNhdE51UkQxRHNYMks5dzc4NTVnWC9zNjZF?=
 =?utf-8?B?LzFUTUx6dU5YSFhPdjN3N2RoZEp3RzMrZW9mc1lDdHBrOERySXBXb3pDTDZD?=
 =?utf-8?B?YzRhOTJ6bXp1dHdsK21kOVYycEJESlUxR3lRRUgrY3A1b1RQemxQd1ZNSEtF?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf944c2f-2112-4eaf-6eb3-08de1c62538c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:56:16.9533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ta9N9IVcsLiq++avEOlXxxM7plZvZvPcIhxDNWzSuvUwNVzqH8ElRC0oiVhv7y+n2E6P35mT5lrTVzPZmVjIE/TzGwjRzqPymm+elvXKdLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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



On 03-11-2025 23:01, Matthew Brost wrote:
> On Mon, Nov 03, 2025 at 03:20:05PM +0000, Satyanarayana K V P wrote:
>> The existing sub-allocator is limited to managing a single buffer object.
>> This enhancement introduces shadow buffer functionality to support
>> scenarios requiring dual buffer management.
>>
>> The changes include added shadow buffer object creation capability,
>> Management for both primary and shadow buffers, and appropriate locking
>> mechanisms for thread-safe operations.
>>
>> This enables more flexible buffer allocation strategies in scenarios where
>> shadow buffering is required.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> CI looks like it had issues, but this patch looks correct:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
This patch is generated on top of PF series
https://patchwork.freedesktop.org/series/155785/

Will fix CI issue (if any) once above series is merged.>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_sa.h           | 19 +++++++++--
>>   drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
>>   5 files changed, 74 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
>> index 3ce442500130..c36fc31e0438 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
>> @@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>>   	struct xe_gt *gt = cache_to_gt(cache);
>>   	struct xe_sa_manager *sam;
>>   
>> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
>> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
>>   	if (IS_ERR(sam))
>>   		return PTR_ERR(sam);
>>   	cache->sam = sam;
>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>> index 63a5263dcf1b..3551e726843e 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.c
>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>> @@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>>   		kvfree(sa_manager->cpu_ptr);
>>   
>>   	sa_manager->bo = NULL;
>> +	sa_manager->shadow = NULL;
>>   }
>>   
>>   /**
>> @@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>>    * @size: number of bytes to allocate
>>    * @guard: number of bytes to exclude from suballocations
>>    * @align: alignment for each suballocated chunk
>> + * @flags: flags for suballocator
>>    *
>>    * Prepares the suballocation manager for suballocations.
>>    *
>>    * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
>>    */
>> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
>> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>> +					      u32 guard, u32 align, u32 flags)
>>   {
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct xe_sa_manager *sa_manager;
>> @@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>>   		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>>   	}
>>   
>> +	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
>> +		struct xe_bo *shadow;
>> +
>> +		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +
>> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
>> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_GGTT_INVALIDATE |
>> +						      XE_BO_FLAG_PINNED_NORESTORE);
>> +		if (IS_ERR(shadow)) {
>> +			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
>> +				size / SZ_1K, shadow);
>> +			return ERR_CAST(shadow);
>> +		}
>> +		sa_manager->shadow = shadow;
>> +	}
>> +
>>   	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>>   	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>>   				       sa_manager);
>> @@ -88,6 +111,32 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>>   	return sa_manager;
>>   }
>>   
>> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
>> +{
>> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
>> +
>> +	xe_assert(xe, sa_manager->shadow);
>> +	lockdep_assert_held(&sa_manager->swap_guard);
>> +
>> +	swap(sa_manager->bo, sa_manager->shadow);
>> +	if (!sa_manager->bo->vmap.is_iomem)
>> +		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
>> +}
>> +
>> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
>> +{
>> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
>> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
>> +
>> +	xe_assert(xe, sa_manager->shadow);
>> +	lockdep_assert_held(&sa_manager->swap_guard);
>> +
>> +	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
>> +			 drm_suballoc_soffset(sa_bo),
>> +			 xe_sa_bo_cpu_addr(sa_bo),
>> +			 drm_suballoc_size(sa_bo));
>> +}
>> +
>>   /**
>>    * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
>>    * @sa_manager: the &xe_sa_manager
>> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
>> index 1be744350836..8a674eccc0e2 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.h
>> +++ b/drivers/gpu/drm/xe/xe_sa.h
>> @@ -14,12 +14,14 @@
>>   struct dma_fence;
>>   struct xe_tile;
>>   
>> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
>> +#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
>> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>> +					      u32 guard, u32 align, u32 flags);
>>   struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>>   
>>   static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>>   {
>> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
>> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
>>   }
>>   
>>   /**
>> @@ -69,4 +71,17 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
>>   		drm_suballoc_soffset(sa);
>>   }
>>   
>> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
>> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
>> +
>> +static inline void xe_sa_bo_swap_guard_lock(struct xe_sa_manager *sa_manager)
>> +{
>> +	mutex_lock(&sa_manager->swap_guard);
>> +}
>> +
>> +static inline void xe_sa_bo_swap_guard_unlock(struct xe_sa_manager *sa_manager)
>> +{
>> +	mutex_unlock(&sa_manager->swap_guard);
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
>> index cb7238799dcb..1085c9c37d6b 100644
>> --- a/drivers/gpu/drm/xe/xe_sa_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
>> @@ -12,6 +12,9 @@ struct xe_bo;
>>   struct xe_sa_manager {
>>   	struct drm_suballoc_manager base;
>>   	struct xe_bo *bo;
>> +	struct xe_bo *shadow;
>> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
>> +	struct mutex swap_guard;
>>   	void *cpu_ptr;
>>   	bool is_iomem;
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 797a4b866226..9959d619addc 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>   	offset = 0;
>>   	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>>   		      bb_pool_size);
>> +	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
>> +		      bb_pool_size);
>>   
>>   	offset = bb_pool_size - sizeof(u32);
>>   	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> +	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>>   
>>   	ctx->mem.ccs_bb_pool = sa_manager;
>>   
>> -- 
>> 2.43.0
>>

