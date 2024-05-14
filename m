Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13995C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8310E24D;
	Tue, 14 May 2024 06:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7QpUk0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2CC10E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715669855; x=1747205855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7nnZv3zJbLXbUhn22DrQoVsbPcfyyQ/RjwpybH9a/G4=;
 b=i7QpUk0/HtjhKwe8XGEcs1xY47fWWqxhil2t3eeFhzfLsLBPNL+qGZmk
 fFZWCv3Y/87ZWu3DsXyl8kJRmAL8tgX3sFprhNdGgftNyZGKnUD16hvos
 GrLVq7UcxkPuqT+VOKHpKoL5hlVp7Ji4vua2Es/tbkvYC2D1Vdh/Cs5r+
 xgo2/IjICY1cw0Mk/VNYp/fCxH3fhDpaGhGJTrhRtWJxP8Pql335+0mHo
 nu/uxxCrNiJ6SAiAbvP4rcqCtolviQETnd91t+xPUdcGTR+U5AzGsG107
 uHWHPQ52jmTrADrmeWabf7MGaarvZiPCX9pACPp4Eex5NoHEfiossz04s w==;
X-CSE-ConnectionGUID: egQPfhpdT3OEuEhrSevM3A==
X-CSE-MsgGUID: vkZ+WiQZS7ON7Nae1nGDaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29126486"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29126486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:57:35 -0700
X-CSE-ConnectionGUID: 6SltvmQCSYKE2VUb59WoWA==
X-CSE-MsgGUID: cpyeqCL4QbGIl1A7lWiuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="68057378"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 23:57:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:57:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:57:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 23:57:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 23:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/SJm/M/M+KOGMDXsZ85YoqxXKRNN68WczgAfyliwjaQoLKPATtEx81oYXU/fxT/2B9VYeGY025xo7Ujo+z0PBne/rLIUcPaVB3OTQ69xagHs9C2NwrWYlCSF5lI1Q3IpqQi75sYYObxDv1W7D3q7+zZ+BHKjquuqfmXwJspzE1BUAD9hGgGRC02lMaGepmwQJS6fSxs5Q5x80Mp0U/H1Bhv9kHHmlDtu16QBDVy3dvSnAjx3QCYnkr4RqmJcShm+nK+u+CMDSuhFI9VvP250sGuL/zcoAy8dP4p3ExLK/Brk8yccoilupuEP8i9m5lwCdyOElnuh48kEK5bnCBrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYO7QVwXZbiYUTv+iJDzar+AzTbDbozJ6pG4970Gwa8=;
 b=PXBjmF49WX7Vkfze0CJ05S0wAD5zZy1QhcPABvQW8I2CnndpDfX+qUOuD9WmjotX3fSdtsIAf1G+KFaNGF4bCOv0W7ZIKhHoC37B9hCBEbp86dk/sz6LWZTWn2oVmkCR3VfzDyO/RnCzq/iHWbuiwfuTU0nH8rfBUEEoUffHaPPogFFYwYimMRDvL7/lE29pvf33gslE7SLD/OgYSVWCOsTOw20+/zaOTWnWP3Ni7s2mj88Z1PlaPMnIyeeaqS5hlkVY/LY/fKak3WS/OTYt0wyrQD+m/bFKwFnrXXZpY9CS9DdjX+0Dnqvcf/WYfVaVbYSBmxekOQFReGapKfVsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 06:57:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 06:57:31 +0000
Date: Tue, 14 May 2024 08:57:28 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/xe/guc: Add more KLV helper macros
Message-ID: <20240514065728.vhszidx6vljv6ncv@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b880a0-1c86-4bee-a073-08dc73e32057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WldyLzQrSnBGekhwM3IvMWEzbWMzT1Q3aEFTam8xL0NlTEhjUmNoSXgyaklV?=
 =?utf-8?B?c29zT3l0NGdRS2JLSklaNzNONlFJV0hrVGNleG9HaFZta2s2N29OeGFOVTdJ?=
 =?utf-8?B?b0tpZnFOa0JNT2l6WGd4Ykh6SnRleVVCNHVwM1BoQWV1aTJrRkZBaTVNV3F6?=
 =?utf-8?B?SWZrVnIyc0hBSTV5d2JqdnEvSVJ6MUZMUnJpM01FZy9leFBiOEdxcHJhWU5C?=
 =?utf-8?B?dXZNMEhDcExKakUxcFFnNE1YMDl4b2VSWFp5dEhtalovb2dxWTFhNmtPdUxj?=
 =?utf-8?B?QzN2RUNQRWkvRzhzWm0zOXFOY0g1eVl2eVNDSG9kNTFac2lMaFJOU1NuZ3BZ?=
 =?utf-8?B?UW9senV2VlMrZXBhYTRkOTFWMG91RktNdHg2aEEvZHV3Vk5CTkF1U1ZJNlFz?=
 =?utf-8?B?cUJkUGc5V2VrWUVmdktHcjN1WXJZMkNxT3ZWVG1kMFB2TWlYWGRxS1VtMnQw?=
 =?utf-8?B?QTFJdVl4NHduTS84UkRNck92WXBkSENrSDBtb2FBQ2liMHJHVnlnMnNQNkk4?=
 =?utf-8?B?bXQ2N3FmSis5SEJUeEpGcm9VbGRGbVB3dHRydHllS0NDSW9KZXEveWRqY29i?=
 =?utf-8?B?Znd0UGJNUXl6MUQyM09FVlRMbU1uMGJaOGljdTIzTUJVQlNXU05JTlI5UkpL?=
 =?utf-8?B?ZkpLYUlNRWR5ZkNZLzlIbDQ1MHhtT0xLKy9LWlJZYmRycHFIaVN2Q2IyZnJ6?=
 =?utf-8?B?NUpDK1g2clBFS3RhYU83YmViV0hYMFU3UEJ4WEtzem5OdWwvQUYwZlFtU3dV?=
 =?utf-8?B?S3YyRWkyNFhBUjRZaGtXdTBXZ1E4NWxNZTV4amZuZHlRalBwUDFPdEVkSTZY?=
 =?utf-8?B?YldIUk9VTGpkbm9jcjdKL0VGRGVnM1l4ZEtjdFpmaUE4eEo3aHFoWkd2NDVl?=
 =?utf-8?B?MWZkQmhtV2h5dXEyclNkb0VJWHhaUlYzN3FWZ1BQSnc2bjJyNlFIeW5hOHVD?=
 =?utf-8?B?bnFuTkJHcE45QmFsZHpCelVRVTJFbVhKa3NjZjF2UU96UVhvN1E2TTdvK2J5?=
 =?utf-8?B?cFVGYjgyWjlBR0FHODhldXZKdWxPaTdPbFExNVU5WVR5M25CVWUwaE1TbHI5?=
 =?utf-8?B?aUtMYTFtY2lDRThoaGFzbHdUYU1tcFJtS3pKcnNJeTBEa2ErQXlVZy85WGZG?=
 =?utf-8?B?K01vNUhTd1hLcDZ2ODZsNytNUkRLalU0ZklFQTRCZUR3T2FNK09aL1krdVVM?=
 =?utf-8?B?MklMZG5DM3hKUDlXQkVGaDlNVnpDU0NJYTU3WGZ1NDB4QUZoeW5UUEd0YnJ1?=
 =?utf-8?B?aWVrS2pjZnl1bjM5MlB2bWpuMjZtLzF6bUUzak1JbzVqbmxOcTVOeTZkbFRP?=
 =?utf-8?B?VXZtWDE2KzloR0NuSldKamVZeHF5cHZoa2lqU3ByMkNCem9HQ1NzMU9xSVNh?=
 =?utf-8?B?cktocnBwc25UOFRQVlJlVXJRK0EzbEZVc1ZjSDBwYXlvVFBNVVlpWmRvbVp6?=
 =?utf-8?B?VHdUKzc5cXI5cThCaU51VTBnRy9QQWZqbXRQNW82U0xRUDlITWpuNXkraVND?=
 =?utf-8?B?VFRqb3VqWmxDZEJabU1FZ0drQUVoYW5lVlE2MU5CdndaNXBnTTU0VThmbWYy?=
 =?utf-8?B?YXR5eHlObVJYUC92NmFWZjIvMHE4Y1R3ZE1GWkFhRHF4TVlwa3o0RFpGbjQy?=
 =?utf-8?B?UEZON2NWbFJTM2ZtSUZrU09NczE3Y2wxaUNIQ3IzRXRkbUVHWEtMbENKSEQ3?=
 =?utf-8?B?cmVRQ0lEc1h1cUE3VEhsTTdBNURBQUR3NU41WmVRd01Nei9DcGZ6empBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzFqNFJ3OXpVMW50MlhxY29IUGdOeGJBa1lvdm9ScWd5L3pQaXdhWS9YRlZu?=
 =?utf-8?B?RCtVYWdOUFhNQXZEczE1aGtmSnhiaGMySG84M3l5enNnaW44dlhKQXFJZkJP?=
 =?utf-8?B?KzRxZ0JIMnB0Vk5lVjdwNFo1L1pjbHhCWVR1VndlU3c0Qk83bm9YeFFuMzRh?=
 =?utf-8?B?STdtTnJiTHdzTUNPS3hqQTZiVWN5N0s2UDRxR1lHZjNJUmFMTnJCTmZvWGhq?=
 =?utf-8?B?aXVVTjlmMUNVUmU5T05sbnBDb0krSVpIWkNKS2tVN3g5QmI4aGpTcThJRDdK?=
 =?utf-8?B?bG84L0R3Y091OEMrQmRvZGp3cWxFb21KcktIdHU5cENLMG9ic3IwSms3YWJG?=
 =?utf-8?B?Q2gxNDBodVljb0hra0VlaERrZEgrS2FTZ0xNelZHajdhTUV0SU1zZXhpamh5?=
 =?utf-8?B?cTYyZGpiRDk2N05nWCsybytWZXl4eWoxMmc3SVNURllvQW1WQThwVkQ4bWR1?=
 =?utf-8?B?NTF1TGhXTWh2S3E2d08reW9OSkl0WnB4ZTB0WGY4KzBSdTZuWFhuUCtnUUFx?=
 =?utf-8?B?eUc4U3BMUk1pVWNOS2RacFNUUE5zZWxrajhyVkdkOUIzTjdmeDhJbVZFUitE?=
 =?utf-8?B?cVNWWkZBMlpWVVpQVkFSMXFSOU9iZGhwUEhpRWx6Mmo1SkVmODZHNTh6SUtO?=
 =?utf-8?B?b1R4SElDZWRiWlJiNElkdDlVcnBMQ2VLODlpTFRCblk4aldkR05sZFRVWTNE?=
 =?utf-8?B?UTZiT2RPeUZhNkhzcDlhUksvZXc2cmVUZGN1a1FCSnVkYnJhbnVJVlBvVzN0?=
 =?utf-8?B?RitBZ1VwV0lFMENrUWRtTEtwdHlLWDM1WmNsNGVIM2pkSGlZcy96ZjFvWi82?=
 =?utf-8?B?WUoxdWhSa1YzM1A3QnVPSWNIcmVyMmMveCtaYmR5R3lJa3BFZzdwL3RIVUJU?=
 =?utf-8?B?QWtxTlpQRUR5NHd1RER2YW84TXNIL045QXpPOWp1U3ZveXdoWDdQckxIYncr?=
 =?utf-8?B?Sk83M3Z6YUhlak5TRzAwdFh6ZmxOUWVueFBoSmtVVUlKV2JoQWF4SnJlOHdG?=
 =?utf-8?B?ZHBkNFpEL0RnUU1sQnRWYjU3NER0dTFEV2N4elgybTZiM0JYdlo0SXBjcUlk?=
 =?utf-8?B?ZnpPMUZuTEh3djFrMFBMR00ySTJRRHFnTlFYRkxJQkFVMTZZWVA1dWM0akhM?=
 =?utf-8?B?enNCT1BDVjNVOTRBUVFjZjhZdTV3QTNTTk9nTG9PUG9JTU5nU01BN25QZkRV?=
 =?utf-8?B?TlVxQk9tc09nL3RvOWlyWkIrUCtienh0ZFVucXVpSitoQ1pDRERHckdmM3dE?=
 =?utf-8?B?d1VlNHVkaUwzOHJCSXF2ZUhhMUk0OVFnYVZrU3FKaVhaMEl4NTE1Y2o4R2Y5?=
 =?utf-8?B?ZkpwQ0dsL2hBVlhGVGVVVkhuUkJ0TlFscUNIb1pmbEVod2ZsQ0EvOXMwV2hV?=
 =?utf-8?B?ME9xOFU0NHRpQnNZZERBOFZGRjdiWkRsNkgxQ1hqMGJHRm92MHFYYzM3eFFF?=
 =?utf-8?B?bXpaSFgya0pEdzRUcDR3aTJ4UXI5RS9MaFJDQWY5cmxNTXhwT2hPdEdybXl0?=
 =?utf-8?B?Rmd5cWQwT2J1ajFab0dSNDNZY3UyclV1bWpnakNzL1FpK08rT2NFZ1hia2JL?=
 =?utf-8?B?SGF6MEtjZTZFV3VEMWYwbTV0SEVUNzB5ZzVUQzVmeGdtTkhHUU9MSGhaT0t2?=
 =?utf-8?B?ZUtnVDhoYlFoTkJXUVJDRTFpTXRVc0QxWWR3MDJhTWw0NklaTG1UUlVqemFQ?=
 =?utf-8?B?bnNRa3llaFpRWkJPK0Vlc3ZKSGw2L3IxLzFiN2ZLdmdVWXFnNjZOY2FuTU81?=
 =?utf-8?B?S1d3UnFsYUxEaDJSUWE3aEdYVFRrYkdLOUhjeG9mZ2Z3MTRSbE5hQ1RRMXNZ?=
 =?utf-8?B?a2FTclc2enJralZYMDZJczhKdXhERTdkMTdjc0taZG5sb1ZkdE1YSXJrbXNy?=
 =?utf-8?B?cW9sTTMvMXdMZmV0WGtxVDh6eS9aZjJFSllzenJXYk03S1ZjTy9HTG8xdFdX?=
 =?utf-8?B?L0EwZkpJQjBtekZRSEpFNTZVYmc2RmpRaWVrTnoybVcxM25TV01tY1JpQzRn?=
 =?utf-8?B?cUppeFhLYllKY1F2eEIreElOSWdaNFU5T29KR1ltVExZeks4ZTlxL2FySFpI?=
 =?utf-8?B?QTYrdGV4aFBRNnJGa291K2NiYTVmZUNqemV5Mm9hWFJxOWxJV3dZdTFQVTNN?=
 =?utf-8?B?VjIwKzNncmsrMFIzZmxOc1I0bUYxbjVzdUxzTkVQenlGRGFFdVVueExNMzBv?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b880a0-1c86-4bee-a073-08dc73e32057
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 06:57:31.8773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOxJL5TOPztwJg+FjfdoDxyJLsifIlgVQs8BqqjW0eQML9xzb6iZVnpcSJb4idlnS7B3QPCVoWMI76rKuw8+/Grzw0AZ19pKPSe66Km9AN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:07 +0200]:
> In upcoming patches we will want to generate some of the KLV keys
> from other macros. Add MAKE_GUC_KLV_{KEY|LEN} macros for that and
> make sure they will correctly expand provided TAG parameter. Also
> fix PREP_GUC_KLV_TAG to also work correctly within other macros.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> index b835e0ebe6db..c676d21c173b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GUC_KLV_HELPERS_H_
>  #define _XE_GUC_KLV_HELPERS_H_
>  
> +#include <linux/args.h>
>  #include <linux/types.h>
>  
>  struct drm_printer;
> @@ -37,6 +38,18 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>  	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>  	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
>  
> +/**
> + * MAKE_GUC_KLV_KEY - Prepare KLV KEY name based on unique KLV definition tag.
> + * @TAG: unique tag of the KLV definition
> + */
> +#define MAKE_GUC_KLV_KEY(TAG) CONCATENATE(CONCATENATE(GUC_KLV_, TAG), _KEY)
> +
> +/**
> + * MAKE_GUC_KLV_LEN - Prepare KLV LEN name based on unique KLV definition tag.
> + * @TAG: unique tag of the KLV definition
> + */
> +#define MAKE_GUC_KLV_LEN(TAG) CONCATENATE(CONCATENATE(GUC_KLV_, TAG), _LEN)
> +
>  /**
>   * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
>   * @TAG: unique tag of the KLV definition
> @@ -46,6 +59,6 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>   * Return: value of the KLV header (u32).
>   */
>  #define PREP_GUC_KLV_TAG(TAG) \
> -	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
> +	PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>  
>  #endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.43.0
> 

-- 
