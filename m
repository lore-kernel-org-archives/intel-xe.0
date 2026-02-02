Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54652D172BC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 03:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E710E1DF;
	Mon,  2 Feb 2026 03:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dy4fgiKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D879910E1DF
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770004146; x=1801540146;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tKGrVu3qzovUNvLxUwhw8pBFFzs03HqlzxXltNyx0VM=;
 b=Dy4fgiKkyaJL4GRVklOhIFP00JHK8bnx7tS4SNyni1FuPdeAQzvdTtYo
 RSCDljwKMqU8l1xMxOrvitOIAGcV/UHY0d8XgtvGgJWMzefc9GCl9j64K
 RCW4cA/sdyBUW3iWVKMy7AqhAv9QwidA6HN2B08EpKq9zDxhQBxL4cUHW
 mTvOuy13g504FfUGDPSR530zxBVwuCJKXAicRfn5mZE1mdlwU4A3SY7Vo
 XR1K3ZEn0Gw+Y9OfR9tt0D3XzEnBoOjah7OVxHJFeK/UfuDSME/mbLcYY
 hN2bEFBo6AwQ5/9bOM16psAoXOTCxhBQN0/zJRTvFaXPqDz2eAbOVkZvO w==;
X-CSE-ConnectionGUID: irMCFjrVR5KUL40FqgZMDg==
X-CSE-MsgGUID: KGUetXo0T1GiCcfZIuT4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="74783111"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="74783111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 19:49:06 -0800
X-CSE-ConnectionGUID: RyOTPOJvTcmfMVVOzp8pIw==
X-CSE-MsgGUID: G5VjoTh2T56W9VUmFWMWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213938432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 19:49:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 19:49:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 19:49:04 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 19:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuTbU/24RuWw83TKXKLx4WRd1YOp8m8xDXTGRyUQSYKWMinjiCGMBpCZq8+grifPPEPvt+MRUNJS5LtoFgQYV7wRXYqIY5l14S9giIshc+1a40ElOg9Mxo/XvAX7+DS6RvdniswKKibm1yvw4RS4431jRhnQVQsVOObYu1G07W2hWsH1ILjCfFJ2xUOPRFbgEbF5sRrS2hJ8rNfI8baGoyT5bzEF9a1vi6xywgEfksYq97IjOQDX3L0B0KfPLh/PYksERrX+ETDP/f8c1oJcvtUYo0Sy2+zXNrox2okc/eZpRV0kZ0IAATjKX3HQ75I5c6uo55FYJP/uZPB3XWiJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRrqBD122WcOh8iA17e0AKYOCeljfSt0lwX7O1Mb+Nc=;
 b=NyfmqAT/ByviyJEVslMdmqoxOJ/1J9fLsuE+6eZ/2n3sYDI9oVmacZNpPrIBDVKuh9PIfhFzEJmecxVKOXH4UcttwDt2wvrVMIVkcZQN1Iy2rgP+43qLS5nJApbmShXLPS+ksPZ25qBxnMUayO+m5AEIaaImjeoPZqf7YdWB8NeWJ/kALxML9NxymU9hnNDHy7F4ZdUCW8BDzMHK+hS+hQnfNH3m/4FLY4Y1+1uGYFNMFjrWEg3ZLe0oyZJZQmEgjRaXOmALvzrsY/hX8a1jo+v89s4co2s0VkYXuUHa8PGyFD/4OfvMDdxPtMcB5vrj2fCXxZf0NDhFxEf4GR7Ehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 03:49:02 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 03:49:01 +0000
Message-ID: <985715f9-4606-42ae-a452-e17b8ba07c2a@intel.com>
Date: Mon, 2 Feb 2026 09:18:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add prefetch fault support for Xe3p
From: "Gupta, Varun" <varun.gupta@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>
References: <20260128091153.25543-1-varun.gupta@intel.com>
Content-Language: en-US
In-Reply-To: <20260128091153.25543-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::11) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|PH0PR11MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: f543b86d-d921-47e8-8f8f-08de620e00c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzFTVXlOYzgxTzd1bFhLWEloVFhQM20yQUt0SHBSZi9teVNValdBZjR0b1J6?=
 =?utf-8?B?ZDZBZ2x1VW53bUhTK1pVVERoMVVvdFA3azJ6UHZ4SlU2ZzFYaW05S2hwcmhH?=
 =?utf-8?B?bnlHOXoxSDhwZDJ5dGhDUUh4Tm5KdkpWaVc2Q0pIUTk4V0Z2bzlvd0xHN1l3?=
 =?utf-8?B?RjlNSXNXbkE1T0t0TEVsb3RKNmM4TlJqZTFIOG1hSHBWOEFhZi9YR0Nma1NM?=
 =?utf-8?B?SHBiTENZVjhsZkh3U0lSOWpjaTJocU1pWDZVZXM1WitpTEkxSmIyRm05RE5v?=
 =?utf-8?B?dTQyYk83b2FGaHdWc2l6TGtWQUw0djk0c1lodEZJSkJXM3lFWnMwV1pHU3Rv?=
 =?utf-8?B?aGxxYkdYcHRTRkRhclBmUFB0TklKeHFud0lFSDFlbXdkMzF1MEpaVmpaM3Jm?=
 =?utf-8?B?Um9NWk02KytmUFB6NG1iSERyZVlrWE5WWEtWUFczb1lwWEo5Z1RWQk80UThh?=
 =?utf-8?B?WEZJbGF5VGw0U0F6TVhwanRRZ3F3SE9Mam9LSzU5NkNKclkrbGZEVUErUE96?=
 =?utf-8?B?Uk0vQUMrVVowV3BoLzdmWnRwRTk0ZmpiR21ZUjhKNXA3T1p6MlY1UWJTUDNu?=
 =?utf-8?B?TG00emlwTHpVa3ZueEhBYzlmQUwyUlZPam56b050VUJKMDBhaCtNVTBCeHNu?=
 =?utf-8?B?SHBrMVF3NGYxRmFuZmZCeVR3aUxnOFRySlUrbnd5UWE4aGFsUFIvOERDLytr?=
 =?utf-8?B?VDJ4aDdTMFBnNDhEYlVZMVNqcUhub3J4RXBSeDRJdmpna01rRE02cnl2cFA2?=
 =?utf-8?B?cVRnOTJhcFFvUHRWT2NGTXJYRDdMa3RKR0k5QmZlb1JoTmxNMFpzU1RNNmk0?=
 =?utf-8?B?Z0MxMTRTc2pyOXRnV3I3Q3BqNlhmSmhMNXZ1K211L0FUZTB1VHlrTUwyTjFq?=
 =?utf-8?B?RWZRQlVIMXNNOU55dURJSnZmSnJRSG0wUnJKRGluQlRtTHFmQ0VyZk42MFdr?=
 =?utf-8?B?NllNSWVxd0hUUFFUWnJ1aDRiOEJhdlE4cCsxL3ovNE1tcExGWU56U2svTVo2?=
 =?utf-8?B?VjNuemtQMXJCeTVVb0xpTmpQMXlBN29sZGJ6ZkF6ODVjQ1ZOdFJHMWZtbVlE?=
 =?utf-8?B?OE12THZubXhtLzZITUVmUUVqTEpNaDVqOWUzRVZ2b2ZUQ3Y3a0xFbXQxVTNp?=
 =?utf-8?B?S0RON2FPUCtOZDJPS3hVMzRyQi91c29kVTJnRmZZaFJMbkVpYzlLajRkc3gz?=
 =?utf-8?B?VkcxY05Kc0dPSEgxU1RvOGRQbGR3RFJ2SVNzSUdJU1VaSVgwVC81enpaSlBZ?=
 =?utf-8?B?VGtuM3VJcXR2ckJ2YVU5TmdNRVlaWStGUmpieGdCZkVtQjZOSitJNHdWRitv?=
 =?utf-8?B?Vk5mUisvUVVMQ24wWVc5c3Fzc05qMkwxQW9pWjRrNXJPbXUwYXh6Nndpb1VH?=
 =?utf-8?B?M1ZldWdDeDA0TGFDLzJlS3FnVjMyN3ovcWhKdURkazlsTnpTUGFqUzd2alg3?=
 =?utf-8?B?aVVzcDNta01HOUVSWk5pbEtPRU14Y0E5MnBaSGNRTlV1QlZEYjMyMnZ1NzJT?=
 =?utf-8?B?NDRDeEVGN0NucWwzZHJINnYrWXVPRUV2V29sbWNGSVE2Vm9ORlRhNGh3V0Zl?=
 =?utf-8?B?VTh6Y3p6aW9zS3d2SVJmeXQ2bndneitTK0hlU3JER2IrVzc2N2JieitZNTY1?=
 =?utf-8?B?bTJ2ZVg4dk9vbzN6UXZIVWlIYVhzZTBNNllEUDlYekdNeFZ4cWdrMzMzbUJx?=
 =?utf-8?B?bmJORHN5RVJRYWxOcUN4UHpIN1VQS1hwTzNMemRNNWhDTVZVZFlKYUlkK1FB?=
 =?utf-8?B?TmI2aldJWWxLMFE5dyswL25uQ3NyYmFGK2NXVXBueXR1S0RJZWt0OTl3dDVs?=
 =?utf-8?B?WFRDMFl2ZW9mY2h6bmZJSUFMOTQzNHFwWDlsM0JFZjdqWit1cTNBY0xqcitE?=
 =?utf-8?B?eWZaL24vb3d5Q09GKzRScFZVRW5halFpbDJGMUowTGxkREZ1Y2MwQ2tQTjBv?=
 =?utf-8?B?Wk1taVhmaVNyVENkZThCRWIvS2NnM3ZlNGxFRHpPTnEvVVhuMG13Z3pCQmZ6?=
 =?utf-8?B?RWhLWVJtaFVIdkZsdC9RT2hXTHVCdHVBd2cwM1krc3lPc0NlMDhoM0cwaEJq?=
 =?utf-8?B?cXBRSjJNM1FIZ0s3d3gwRUl1dHZNMzFiWkpKbDRkbXp5aFlkUTlMc0lhUVJi?=
 =?utf-8?Q?LDWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFEYnBvblZWWVkxZ28yKzh5d2puYjVLNWdYbEgraHh0U3YrTGpOU3JUN0VL?=
 =?utf-8?B?ODVLK2dETUYyL1VNS1RpcXQ0Y29OdHNLR1dxWktMRUl3S00yN0ZxS2dTWXdW?=
 =?utf-8?B?T2N5NlZjUUVQZGNZOFdyWVIycXkvdjU5TDA1NnQzTHM0WkF1TTd2UFB0RWFY?=
 =?utf-8?B?djFRZ01DUkpzZWw3cUFxOTRROGFObVUrTmRSc0ttWFdXSGxSLzZCakxydjYr?=
 =?utf-8?B?R2ZmRFd5QXFPUFRGSzZsd3RHaWZKZy85Rk5ncFBqWmFKUXpuTEwrb0ZpeW5p?=
 =?utf-8?B?OFQ3Tm8rc01pYTZHd3REVC9kMlpqVXg4UUhkUjBwQzZCS1VZMVZFMVl4VDJM?=
 =?utf-8?B?NW8reEZYVVR6YlVkRnpzdU1rOFRmWFpxUnVaYUpxbndWL1ZYamNKdUtqZys5?=
 =?utf-8?B?Wm1ZS2pIQk5SSWdDNExsR1diUjltRkE3bHdVeEpCbmFOWmdSdGhWc1JZcHNM?=
 =?utf-8?B?cTZRMVhyQjRmYUhHbURHZlRzQXB3ZmZvK1Z0RnVsd2EzT1h4YUk2Z3h6c3pm?=
 =?utf-8?B?MUFIeFYvVWhWbU9XNUZyRVM2UWl0b0pTR1EwNUN3ZmNXVGgxWVVMNllNeE1V?=
 =?utf-8?B?RmxXemE5ZmZ2ZzhzSHBmUG1KZWdVTmNEY0pnYzNWQ2crUWJ2VHJUYStRdVoy?=
 =?utf-8?B?Q1NlLzZkalZ5cytlQXp0Q3JlU3lQQXQrcmhKRGQ0VERGNmtmTEc0cFcyTDFL?=
 =?utf-8?B?bmltZCticFFFcXlUV1hNa3Uvbkt2L0dvUndFK09FMjRESFZjUTFwRUNDTGVW?=
 =?utf-8?B?UDB2STJUUlhZRVg1V2lmSHRDZlQ4YjIrYnVyZnArNXB0QnhWcEI1cVFRbm9K?=
 =?utf-8?B?NVl3am0vQ0cybUx2a2N0N0JJQXF0RDEyQ1RjWmZEakYzZ1lMVXhleTcrMmpk?=
 =?utf-8?B?UmdaWVp3WDd4WWJVTFVwUnhORit2emZIc0dRWVVuSDgzQWJWbWVvcllubUJu?=
 =?utf-8?B?clcwbWNkdlJ4NlVKQVFPTWpaakZsc1QwVHZQc0k2anRTTkVoSFJqbUl0ZjJ2?=
 =?utf-8?B?Zm5TRURsYnQ4R0NHTGVwVkcycHQraGdKV2NXc0trcmdkSFBSckdFdnh1ZlpW?=
 =?utf-8?B?U2ozOTBUQnVXZkhTZGt3bDlHQzNMK0pWaXpLWjRqRnJLSks0V2RWVHhKby9z?=
 =?utf-8?B?OFh5WkZBRWd0UGF2ZXN6YWNBR0pmNi9UVkc2NEl1ZTZyS05UeklDWWxDRFQ5?=
 =?utf-8?B?MXFvMTZRNnhaZFlMcXJzbGlMeFMvSFlTU3ZXQ0lBU1J1bkp2YVhWR2xhRytp?=
 =?utf-8?B?blFJaVovRjBjcEZuRStONVl2STB6ZFJ0bWgzR3Q3ei9kWDhjbE1EWmptaXVH?=
 =?utf-8?B?NWRZSVpCZGQwUDVMRytqMWJkcGJVWDY3Mlc2NTduOWkwUkZqKzlFdzRzNkJ6?=
 =?utf-8?B?SlE0NnMxKzJ3NTFLZHk5S01QU2R6UTNQdW5zQVRoZjVybmYyK0IwRU4xUHNt?=
 =?utf-8?B?Mkx1Qms2OXdtLzF2YVJZenlNVVVGQjZ6M0hWZnM3QVRTVXVsTVdyaVNzVmF1?=
 =?utf-8?B?bkdXSDFHdElrTUtKbTFBU0UwUDZTUDdmRWhkL1d6dmQ2cVBVQ3REbTBZMmFD?=
 =?utf-8?B?RTBqNUxFb1E5SDJmWDlubEhFVnc5WUdGdmd2US9IdnB3aHRqTFN4anlFd0Ru?=
 =?utf-8?B?dXpBMjRVVHJrTUd0UGdYdEN2WmkxZmo0WkZDVHhGc2pUdFBuZkRZaUg1YU8x?=
 =?utf-8?B?ZmMrMWoxMWFlc1VWWmttSkJvRGFsYTM4bWZwRlJXU2xDR1VmaXJHNjcrbUlv?=
 =?utf-8?B?clNGWUJNRTRZY2RFbVl5V05sdlJOb3RQQmN1NkVsVWo5SktFZEd3bnRaWm1l?=
 =?utf-8?B?RTlwSm9hVVBuZ056cktTbE8wdXJnQWNEYXAyVHdvWHh0RDdPU1ZhcEIrbW1D?=
 =?utf-8?B?OXpnbFByblduc2lqQmE3bmlCN0NZa1NkKy9JV2N2WUQzSmJQUXAzenBOdmRH?=
 =?utf-8?B?ak5kRTdUYVI0a01VOUhDL1dndlg3M2FnQkk3eThOQTZzSzZGQlY3ekRoZlVr?=
 =?utf-8?B?V0JVbTBaQVo0NmhtVE02VTZQMkFsQjJTVzJxVTFCazVUWHN0TkJXN1oxUDNa?=
 =?utf-8?B?OUVzakdBRlBVMVJHVGNOalMyQTFwZnRvaHJCMkFTQWxjdW5rb2w1NktBdXR6?=
 =?utf-8?B?amdSQ2hsWWhsbGFnZWkzb0pxVUlhejd0MzVZU1BQdndITURtMndmSDk3ZkFO?=
 =?utf-8?B?a0MwWTdnOWFJUC8reWFMeDJ1MmxnbTUyMnJWNEF3ekVRRjNXWTA0NCsvV3Ux?=
 =?utf-8?B?WmxaVE13SzVRNklnWjBZOXJBcFk3NEpGYWt5eVY1NnNOY1BWaGo4TEthcFRF?=
 =?utf-8?B?aWNyZlNKSUVrU2gzR0Y0bDhYaG5wcmp3eVVLL3lOOUZqZ0hhSWFJdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f543b86d-d921-47e8-8f8f-08de620e00c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:49:01.9074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sEwg/OwyFzDdGf2JUV0pos+DumcpZdkH3VQsG7XQNhJgK26avoUCBu3d4N5Qv25XglFGvPGPvVBykDa+8hGjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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

Ignore! This series was created due to subject line change by mistake.
Will Resend the version in original series.

Thanks,
Varun

On 28-Jan-26 2:41 PM, Varun Gupta wrote:
> Xe3p hardware prefetches memory ranges and notifies software via an
> additional bit (bit 11) in the page fault descriptor that the fault
> was caused by prefetch.
>
> Patch 1 adds a dedicated stats counter to track invalid prefetch
> pagefaults separately from regular faults.
>
> Patch 2 implements the prefetch support by extracting the prefetch bit
> from the fault descriptor and echoing it in the response (bit 6) only
> when handling fails. This prevents CAT errors for prefetch faults.
> Stats are incremented for prefetch errors without verbose logging to
> avoid log spam. The prefetch bit value is included in error messages
> to distinguish prefetch faults from regular faults.
>
> Based on original patches by Brian Welty and Priyanka Dandamudi.
>
> v3:
>   - Split stats counter into separate patch (Matt Brost)
>   - Drop xe_guc_pagefault_types.h rename patch (Matt Brost)
>   - Move prefetch check to caller of xe_pagefault_print (Matt Brost)
>   - Rename XE3P_PFD_PREFETCH/PFR_PREFETCH to remove XE3P_ prefix,
>     add comments about Xe3+ platform support (Matt Brost)
>   - Rename PREFETCH_PAGEFAULT_COUNT to INVALID_PREFETCH_PAGEFAULT_COUNT
>     for clarity (Matt Brost)
>   - Include prefetch bit value in error message (Matt Brost)
>
> v2:
>   - Initial implementation combining all changes
>
> Varun Gupta (2):
>    drm/xe: Add counter for invalid prefetch pagefaults
>    drm/xe: Add prefetch fault support for Xe3p
>
>   drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
>   drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>   drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++++---
>   drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
>   6 files changed, 27 insertions(+), 6 deletions(-)
>
