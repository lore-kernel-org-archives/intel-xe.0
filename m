Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB1ACEE342
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65B10E7E5;
	Wed,  9 Oct 2024 19:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdGwPIk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4C10E7E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728503441; x=1760039441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I5/tlDLgzS7Zyzf7O6uf7iU3R2XSGyADN2+X/6phup0=;
 b=YdGwPIk/hiWCd9cEjrt4qIOAsTrNvL7CdjwKbnIMobOLtLfzUsKG8gEN
 0kRzczWOePxXmFWsz7gaH3uIxUhLmH29pkbhIB0tb+DMg+N84Uz74tjb0
 GuCyeGcIhm+XnWkeN3WWzSW7FvIzhF9Oq/ebOHclgHazu+onHqSFhnC6R
 2WcLs83w2oXk5zTj3O3feqyLVI6SLM/4AqNgWcaqeGQ4pQTfdOqeu+MmG
 MxsSp9+DmmS92XAPJ2W1uhFz749HOMnhIP+YEbj2G/xhkgLxTzBDpMdcs
 ZwJ691Kyq/0iQ9KnXQmiiFrRE1os/FO7ABbWdIRHmH8tCjNjGdVrc9ok0 g==;
X-CSE-ConnectionGUID: d5QwwOrUQsq9iqc4SyIiiA==
X-CSE-MsgGUID: v0I2yRrqRaKeKgrAdrz9iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27990287"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27990287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 12:50:40 -0700
X-CSE-ConnectionGUID: 7YoVE6LFQmyb18oqdu4fQg==
X-CSE-MsgGUID: fArotdUzTbun4hTkYXqGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76251436"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 12:50:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:50:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:50:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 12:50:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 12:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE9N9l4ULwr1viAQQ7XHYIxxl0M1ULfFpSab8f6ez0OPLMZahFv2MLWipxC2xspkLjXFlMoofYlUXSzOpBJr4kkzRA2iRdKQeGtrrftdMLzMEvfq24J3hPw9BxJfjYSO4itPyIM/n0OcOPaT5vRuVhyhQKVNwjfdDjeymdWVFw4OBKJAhcJcbbQYZtimhv9z0r9lMCgoZJY4VX4oFU/N0H3qPrI0+PA2p++E6dEeGNhgg6MCl6TqeuxRvqTAwOoE8+iMh2Iuv3mJmKXC1rfs0QrJLCYB2Cj0IuVKZO86iUQQLRUkemWTgEohVyOdXD1KgXrn/OhPG8OzZrTSNOcqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYE3IwQ93evYPuqfrq991LDkTUNH8ppvGgZHE2b/x4k=;
 b=ZYK5uowsLGc3Jbe2t7ivtt3IZRnj+XIq2J9BmRYvaoU/KYFG8AfNfWg+8CFc3lsUv7cgtdrD/qS5VFm7IBD/zWf7VRSH9KuvgV9eUUhbP93/Pj6xVLboaPWWQWdSNYlZhCn68SFBEGVzv1T6Y7SsYMk15tVJJKztIdOMNTriHsPX6BmQhNNvkjiLZh1w597EdvHZ559htiW8Fj26txOfLvL0jJoueDhPZ/nLyZhq/V1lPKLcV41gAKGsRj8rBSVDcT6HlzaUH2mYXpMInB/QksWbOU80/hBd7btwxHB+PLHUznEvhiZqs3tL0/dlJ4ZbS2GFgwEqXra80X8UnMas6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 9 Oct
 2024 19:50:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 19:50:32 +0000
Message-ID: <65cf53a0-1696-44bb-8606-83f867b7c545@intel.com>
Date: Wed, 9 Oct 2024 12:50:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <matthew.auld@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-4-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241009105645.1416588-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:303:dd::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 131fe5d4-1686-488f-1e7b-08dce89ba246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEFHdEQyeUEwTWFKZk9zQXZ6cFFjUU1KeFc4bGZvQkJaU00vNDdodGJYL3ZE?=
 =?utf-8?B?QkMyVXA5TTRFZHFQSWNLbE1LWWtIWmtTRDBOVkRUUUZOOTFIbU50aWtXL2dK?=
 =?utf-8?B?emRuQWtWTWY0N0JXZnhJdGxEdEF0V3FRZFcwM01sSVJHZDhJSmM4QWx4bUNN?=
 =?utf-8?B?UzJZWmZoSXVPLzE0a1BPNlJzcGNGb1VvQmVjdFE5Y0NwME9lQ1RoalI5dzZS?=
 =?utf-8?B?Ymxja3djMUN6N0tPQS9hc3lXaWFJb0x0R1hFSUF2M2tmQnhicXpmNWg3TStO?=
 =?utf-8?B?WmF1NUx6M2o4L0FqandSVHBoNG9PV1EvdVZlaWc3WWlpU1ZHdGxEQ0x3aDJi?=
 =?utf-8?B?b3I3bmQxbHVWTmxOb2Vkc3c4UVptU2tRY3c5bDhLZ2Flc2tyRXZ0SkM0U3c2?=
 =?utf-8?B?WFd1TjAzODNKVlpKdW9VbkRVRlF5NloxQnhkYVVaZEFkNzBvVXBVRnF6akxS?=
 =?utf-8?B?bGRyWHJMNENrSnQzM2xoelArR0JRcVErRUp4TmlYYlZjdFBhRXdwTksweEw1?=
 =?utf-8?B?UDRvSGYxZ2NsZTNVbzk3SDJjZWZ1bkdISzVSemZKa2V2Vi9lQVE2WUR0N1dy?=
 =?utf-8?B?R2VzMGlpMkF3MFFuaWhDeGpDb2xTMERsdGxQd3lWaXhCaGwvakIyRG5saEpC?=
 =?utf-8?B?bTJ3VkpFd25UY3puV2cxYlpEWTlXRGhoV1JUSkhqTzB5UDFpTjQ3QjMwbzl3?=
 =?utf-8?B?MXVDUFg2bzJlRlE5dnl3cFN6RUlqRUdxdkw3b3lLeEd0MnNsRG5RSzMzSEY4?=
 =?utf-8?B?cTBrMklxWUI4UkpuNWYrOVpQYlZqZmFKbzE4aEoyM01McHJHbkd3Q2NJdW1H?=
 =?utf-8?B?bWswTUphSVY3eXZYeUxxYTZaOWhKRjJMT2ZuanNxaWdtOG13RkRMZUJ1U2h2?=
 =?utf-8?B?cnNqVHRBcGdpZjJ3RnBFRGpqa21XNGRKZC9iKzJDTFlkL3NWeW9ROWhDSkFQ?=
 =?utf-8?B?dUhlNlF2YXBoQjh3aG9zYytmVllpQ1hzSk1aUW56TkU3TmhZNlNSd0tpL2lm?=
 =?utf-8?B?Sit0ZDhvYk93SDJMTXZ2K1VWWU9La2tDY2h4elc4KzcvYXZhOWhXcjh4YWda?=
 =?utf-8?B?amREMnpTaEZiQ2VnSExacCtOcmpDWUJpc2xacmdJOEp1WTU1bHh0RzZUc0c1?=
 =?utf-8?B?eHM4YzZyVzNBejNtaEJtc1ZmOTQrSGE1VWhUemF2d0tLL2tXalhJd3Z6ZzNa?=
 =?utf-8?B?aWZWQzEvcEEzOW9Ja1c4cnlNMGRVSFlQc2hqL3N1cXN3YUNPYlZyZXE2YkNO?=
 =?utf-8?B?QkFnQjR1YXpBMG96TFV6YW9aTVkzQThiaVMwbDBCV05SMG5lN3dBRnZ4TjN5?=
 =?utf-8?B?bGcyallpdUlXMFVjdjJsVGExSUdlUHNNWXBQRU5KTkY3TGlxVlRtK29zMHFJ?=
 =?utf-8?B?aVNaTGNtQzZpZ0x6dE81c01od2VSRG1TellpUENBRExta2hoSGVZZ0FLK3g4?=
 =?utf-8?B?Y0hKZ1YwZWszOWFKZTk5d3Joa3hPNjRSQWtqV040akJyVnFZTlVrc0hxZXhZ?=
 =?utf-8?B?WldVQWNOalliRGRQVS9Sa3kyT1R2N2cyZlZaZjd5cUI4ODZrd25EcDhUbFh2?=
 =?utf-8?B?RGt5eXJRZ25oamltRUwxZGMwT2VMR3NZUTlBdndlMHozR2l3RUVZakpHRzV5?=
 =?utf-8?Q?X92sN8HIBmG+I9OpVTh0dmEljI0fuQs/QRoBuVEUveuU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z000UEVuMmowVzdOeDJ6TzU4QS9TQkVWeFJjUHk5cWFMNGhBS1pYMnFjZitz?=
 =?utf-8?B?SjFoWnhwSkh5bks1SFRobEwxSFZMYVIveG5xNEVjZ1hQV294N0t6WHMrbGZH?=
 =?utf-8?B?VUN2TFROeFQ4SFFVc0J4YlRxa0I0TnNUcHFSZ0pycGtYcktRRURJWkdiTENR?=
 =?utf-8?B?Q3pwMnVhK3oycW9zSHRZc1JhalVXTlQ4cVNFV1JzNDZEejFtWnFLRFU0SDhj?=
 =?utf-8?B?Y002NjVKUk9tUUQ4S3dCU0FYUkJ4VHp0YmJpV2svREZLRFdsclVSOUtKNUNw?=
 =?utf-8?B?RVZLeUE1NURXbGh4U1Y0MzV0MUJoS2l5ZVh3RFNoU1R3TkF1VFpWQVZQL3Iw?=
 =?utf-8?B?MXBzWXo3bE9MYW9TRVZpQ1lxbmRLdTBpcVBDTWRyS2JGeUpMVWtoN3MxQi9t?=
 =?utf-8?B?V3dkZ2E3ekNsUHo1Y0tvNXRZTjFsNlB2UHdRcUVMM2w3TlFGVGozY0doR3VY?=
 =?utf-8?B?MmdrV0FGSzRacnZtVVZXdTUra0tHdDRQUlc1UnAxVnZGZURHa1JRcFR0cjRn?=
 =?utf-8?B?MUQzaDRlNjVMaTE3QzRxUEp3VjExaFJmbXNGb0x3UUdSY2Y2Sm5iZmRNNEZj?=
 =?utf-8?B?T3JhNVRVZzVlNkNCL0U4QWRqcmtHT2pCYlVnQUJ4RlU5NmhST1J0alNaL2hm?=
 =?utf-8?B?dWo2L2hjMjk1YlRSTHBJekJUUGdvUDl0SCtNZjEwSWQ0aDlTS0tKclBDYlcw?=
 =?utf-8?B?cWtLMVFNUWlwKzBvRWpMZ3J0NWUyMUNzcEtnQ2dWUzFRbWhSMU1rNk1ZTm16?=
 =?utf-8?B?SWtRRy9DZnZVZTlmKzlFTDlPekJBamViOGQ1OVlmMkt0aTNlb1B1ZTJtQTVW?=
 =?utf-8?B?NnAvWWNTZXI2MUhMVHFXM2N1QnpZTFZBT3U3UW5YNnlVYzFEZ3lZNEVEVnhX?=
 =?utf-8?B?eDF1a252RkpRTS9mSlBRRmNUTjBEeUlJV2FKUWhZeWZZMXN5L1NTL0RVQWpQ?=
 =?utf-8?B?M2V4OFlORStDa216Z0pML1F3czFnc1hPSVRhcHd3akFVYlM1WitwcGo1TEgv?=
 =?utf-8?B?NXY5Mkc2VC8vZi9CTUF4d2pXYUJqamZsOGxndE0yTkVJL0FIZWcxNXBUSHNq?=
 =?utf-8?B?dngxUlRNWlc4dGNNNHdrTis4d0dYenhDSXlWZmh0enM2Z3A4MnZlQWVMeC9k?=
 =?utf-8?B?TDhvZ2ZYWUh6a05yNHlYeVBmejBGUXgvL1pWWEE4UkhIcGFsMUxSeW5JL2l1?=
 =?utf-8?B?bDduMWhmSFJCczRmamp2LzJHRTJrc0RVa1lnM0pRSCswN3FBTXE1T2l5UVRS?=
 =?utf-8?B?VmJlczJtSnhWZzA0Q3ovSHR6RTRZZEpzS2ZyZEtHYzVHNkRIMmJtL2JxNVBC?=
 =?utf-8?B?SzhWVlg0MCtDL2U4NUpuWE5yd1VoVEdKSDRuOXV1cnRZU2dJRURoSW04NGdr?=
 =?utf-8?B?NGJ4c1BHVkw1NDJ2b1Rpa3VBaWh6OW5wTmxiOG9hbTN2OEVtNUM0eERvYjFn?=
 =?utf-8?B?bDJjM2NoZHJaZDZMcEtFeDlJajJoV0NDOUJhYThhY2dSQk9FVERjdGh6eVBx?=
 =?utf-8?B?RUEzM0E2REtKRlJaa0g5RjNxNmZBNDh4SEc4VCtVRUZMVHRlTS80bFYxNjBK?=
 =?utf-8?B?SVZSbm15bVNMRUl0bjJlWGxVWWJvanM5Q3VqTGRYVXk0MmtYYnltRit0Znc0?=
 =?utf-8?B?SzhRdGx4RDVqVjN3c2V3NWREQS9xb1VRV3NSK1RTeHhxMnFlOStUL29oS281?=
 =?utf-8?B?V25PMWdCRjVwSloyTEdSeHJTcWxIRExxVy9BQmhZeks1MFA1ZUIzdERmSkZn?=
 =?utf-8?B?cHRrRUJrZDBTeGptWjRLZjNuV3FrN1QyU2xjYmpDT1BXYkRUTWludjdja3pS?=
 =?utf-8?B?aXlzb0wrOURPVnJrNDdVdmw5QlR4ZGRwYk9ZUjZ2M2s5aWJJQjNxNGU3YkZt?=
 =?utf-8?B?aEFhQnBtbWtRRmRwSjVua1BRWU5jYzYzMGxPT0hKZ3VibU5rdzhVOFF1UGRN?=
 =?utf-8?B?L1NES2lsMGdybFM2b2tsdWw1QmZiZFZyTHV5d1c5aHRWb2dXdW92Ky9kN2Rv?=
 =?utf-8?B?cDIvUnJXQ2wvam5DMGFKVWdGeUhEdDZCWFgya0t5RDhhT0tLWmRkK05mZWpa?=
 =?utf-8?B?NHJyRDFlSjRWYWI4RGRKa3RaTFI2ZGZ6d1FLK3JNRVBtZVZITUhXenAyNmFo?=
 =?utf-8?B?UmJiZmI3U0l1N3RQMVdlSjJ1bGo0V1FNeXVqbUVieGlEVDN1Ym9rZ2l5Q2Nv?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131fe5d4-1686-488f-1e7b-08dce89ba246
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 19:50:32.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDa6sT5p16HQZU6IXP7qSm64CqDgsoktUF2sQuMGZ2mmeQqZxNHypWIEpJ7u2v2nMP6X9SLng78KhJmWKGUH0BVUG/Ibdb1wfSUhrkjoptw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
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

On 10/9/2024 03:56, Badal Nilawar wrote:
> In case if g2h worker doesn't get opportunity to within specified
'to run'?

> timeout delay then flush the g2h worker explicitly.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dcc95c01b6f0..2e2fa59eadfb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1034,6 +1034,18 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	}
>   	mutex_unlock(&ct->lock);
>   
> +	/*
> +	 * Flush g2h_worker explicitly in case if it didn't get opportunity
> +	 * to run after it is queued
> +	 */
> +	if (!ret) {
> +		xe_gt_dbg(gt, "Flush G2H worker to service H2G action %#x\n",
> +			  action[0]);
Seems like this could be a single line and still not hit the 100 
character line length limit.

> +		flush_work(&ct->g2h_worker);
> +		if (g2h_fence.done)
> +			ret = 1;
> +	}
Again, are we wanting this to be a permanent change or is it intended as 
just a temporary workaround? If the latter, there needs to be a comment 
to explain the situation.

I would also prefer to have the debug print only in the case where 
fence.done was set after the flush. And I wonder if it is also worth 
making it a warn. That way CI will track how often this is happening and 
on what systems.

John.

> +
>   	/*
>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase

