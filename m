Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7ED73E87
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3EF10E19D;
	Thu, 29 Jan 2026 23:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIhm53GM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9252310E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769729226; x=1801265226;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h2Y+GhFuJhnI37/Z+dxiQU3bTRdxyA+d/AKjGp+NDg8=;
 b=AIhm53GM04lO3z2ivXzTnxhRJk6JNQWYUVBcb7SHN5xQa4IaZSb/cy/w
 EC6LcQVUhCZZdZpwWbrChBRfy424xDo0snMrUG8ITxLSG9eheQ6+paS4u
 TXnYInnUNfMerD5wt0dIF7WpYqffbOY4nWDy4CG8NiWRD/wZN5aX5LUBO
 bNISOfLIDXVNd9DFNtq+AUArOuIfIgblJqkBy/lUD7iy/hf2agLqCmdK+
 74s7tGW+C/U1/OG/pulkgipOwhi4t691deB3ZPe0RDrEL3DtEj/XazPCw
 9UIku9RS5O6EceDiaMsFkM3gnWmASadT/gmb4uQd1tx/pNlEKqmMbopWo A==;
X-CSE-ConnectionGUID: zDNz9Q87Q8iLI8t2pUJnHw==
X-CSE-MsgGUID: Gw60Kk3wRsavZy7U2PeEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82350014"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82350014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:27:05 -0800
X-CSE-ConnectionGUID: 4HXelhyWSfaXZiX6OLmWIQ==
X-CSE-MsgGUID: e79izMsmRm6IdOBO1OwfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="209063126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:27:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:27:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:27:04 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3h6UXjDlQI+TpZyXB4vmcrExV7ixcAsz1P/+cXa2pVeK198R1//Nyrv08FPq3xsiLlckrLXtfB4KsQraU6+1b7q1/Mp2PogH25lXIn+Ai7mdLaTBXKGA1pC5YVVHvsHBlCGOntVwJS57IojyCC9AORZd9rodIMru4SyWwyprUwQlMpSJEoWOP/Ep9pMMycjb/Uhwf9MtT8E1VwzEOFC0xG8PBQb/D8tZXsvOTJsjsqZcLYLw8LzE3Y9SCG7mRnknMYuvQ4Njf3PFqLLwnEG8FgGMRDoLsVXM2qZSRce+sORF5JvVBOPrii2mEYRvGTizv6O0JVHnds0vHMcCMoovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RoAtVzIth5h7EdlVo98FojbJBLSdK2rTZX6OK+HeH0=;
 b=Lzo/kL8hgYL/cYUMTGijaQ56+mmTMK030B/Kk+cOnX8uTLN27+93uKnEILC3rEEm24bQZIRPwR0MLwEjdaVpc0Z/Eh5rMgYG69hH2owCTdSBB8ZBqfZIn2j77BmEscqCik+Q60DGlCagIUwF1xnd7m7G+6LWfnhioNsltcXb4W3B29OhHRbRYcYVyk6ePguxFHHgTNSysyMKo+HhTHCL/lPMFvfbUuDDmWdalEGt1HF6uMWSMI6+JvaQxD01PHHinq9a1q7er7VIJMEVwFkhdawigstVKwG1/0g2rfNhrimArj0tICAlt1ll8AvaHnBGpdooWteSeKdM/ve4I3mKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 23:27:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:27:01 +0000
Message-ID: <994d6230-ca33-447c-ac76-daad130bc1af@intel.com>
Date: Fri, 30 Jan 2026 00:26:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
 <20260129225606.412902-7-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129225606.412902-7-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF6A4412A55:EE_
X-MS-Office365-Filtering-Correlation-Id: 9703742e-902c-47c4-3be7-08de5f8de7c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uy9qUVpKOU9HNGh3b0lIckZNdGZqZ0xncG1xczdkcEhWVHNZKzhtd2J3MUND?=
 =?utf-8?B?SVg4SWF1d3hPcllpb3VlbCtkRlQvYzNuZ1dMWTkyaEE3c0pDbnlGTWp3Y1pR?=
 =?utf-8?B?TUhUeTNPU1ZPRXVMK2RTdHJyL01QejlvNDhkNWVuV3BPZXpMZjdhUEZ5Mmxi?=
 =?utf-8?B?c0V5UEVVVFNFU3VSVExmTExUcVNBT2xiWjhseVVmanN0bjBVY0lNejZrY085?=
 =?utf-8?B?K2RQOFNQRHhSb0YzTG91bmVtVU5EaURCeUIrdDNaa0Z6cklRWmRaT2xINStI?=
 =?utf-8?B?cEE4OE56QStpV1FhemJXcTV0alZoUjY0ZkhKUDRUOEVPZ2xoYWdFTFI4M3lP?=
 =?utf-8?B?SllFUHUxMkxGV0tUdVdLMFVBbk1MeGViRDl3Rlppc2tyQ1lzWitmY0l0aWxo?=
 =?utf-8?B?eCtDSGVoRWhDK2dwblViVHBCUWZoVG1meWRwZU9QaU9TY25vWmxMRWN5UTFy?=
 =?utf-8?B?VTRZcFZzNjVFTnhSSjNVZnpJam9KODBJVTFlaU5NTHhscWhkL0JtSTdzQmJQ?=
 =?utf-8?B?SXlaYnhibW0xcmp1aE9hRmUzT2t0MlBaRUJDMWVDaGtwWUpDTC96OXNsQ3Jp?=
 =?utf-8?B?Z3pSeElaTXFWZXZYTmVBN1dCMGFINXUrd0w4d2hHeXJBa2Q2SkR0TVNRRHA4?=
 =?utf-8?B?TjVDc016MnpPTUc5VU9rT3BmVmpqV05SUnlBdlVDVUlBSllhV0UyV2Q5cnFQ?=
 =?utf-8?B?dUZEMGR2Q2toTG9MS00xeUFLa3NudndaMFJ3RmlkQitCZTlPd0l1a0VaRjFu?=
 =?utf-8?B?SG4rd3o4aVlkTEQ5cHp1R0lSczNyd3p6ZmhEdkF1dEhmMk1FeVFiYlA4c2JG?=
 =?utf-8?B?dm9aaEtObURrdjVxd3FMTWcyRGZHRUs5M1ZPSUNvMjg0WnVFck41U1pwRnR1?=
 =?utf-8?B?NnJ5UDZhWm1VUmhaS3RDelplTUEzSnBad28vam5mM3FIV2crVnlESVNXOExr?=
 =?utf-8?B?bUkya25HeFVPZnRYbHB1RWJkTTVJTHpzVGF5dFo3UzNrMFRBclhSOHBBbjUr?=
 =?utf-8?B?bkM0Y2t3Y2NIOEU3eDlaZXVMV2hiYTZPMTB0WituSFRnQ0xBWmpFeUYxUVdI?=
 =?utf-8?B?UTRuUnpHS1Fab2ZQanNCSjQ1SzZkTUNBSHhja1J2aUxGa045V0R2Q0pGNUlE?=
 =?utf-8?B?dE5KNit5YitnOUdmYktGUmlVeTFjK0pOenlCK1FOU3VDdEIwSWdocGJKK0xv?=
 =?utf-8?B?QmtPanp1RXNWRURuWkFmaSs5Q2xaYnVtdHExQUtlbDVsYmV2WGVYYUxsNXhv?=
 =?utf-8?B?eEh1YlFTb2JYbm03MWhoNzlBNG1LcmFvNHRxcFlac0F0NCthUzVJeFBvbmRw?=
 =?utf-8?B?aVJ4eUFFbndUWnduVkJkL05WRE9FdVRRRjZIN0N6MzdVSmpPQ0htL0hXdTJh?=
 =?utf-8?B?elo1ZzUxTXJCSVV2S0JrcTV6bDduYXN0RVFpc2lXTUZ1Um9QNHk2ZmpBa2R1?=
 =?utf-8?B?Z1hnUU9SQTlVNktia1JodWlLSzlkWlNWbnVCRTFDQ0lxNHNLeUYwZ3dlRmI5?=
 =?utf-8?B?SFRWeGJTZW03eTlGZ0pRVGsxNFM1MWdxc3NzeE1iekd1NDNGbmNHS3pDc3Nl?=
 =?utf-8?B?TklPWG9SM2I3NTcwaHlWcUtmL3B0WExUNWdxd3RDNkpXTURzaTlWdEdnVFQv?=
 =?utf-8?B?dFAzUWpRdDZXY1AyVnV4ZU1KQ08vcXRSOHdMV2pLdU9rbkVjN3VJc05yNWxR?=
 =?utf-8?B?S2F3WGdqU3l6VDBodGNBTFpFcFp4aFZ3NXBVNGNIZnNHTG1jazZCa2Q3VnJR?=
 =?utf-8?B?cHBBUHZzaWtuWDRnTFEzYUJIOVhZQ1ZqUEFNSWN6SzVuSXpRelIyTE1UdW4x?=
 =?utf-8?B?VWlpc1ZQRWdRdU1lNzZTd3ZYVjJRUkNiWm84SXdXT1pyeGxBTEl6WnRPUGtW?=
 =?utf-8?B?V1VJZUZncjRjVFFqSStPU00ybDVxRFUyZWFsdEdaL3NkOVc0RGo4ZW81U005?=
 =?utf-8?B?RVNFdktndnFuNm9nYzN0Mjc0bk9GMk1jSWVJaUlTNTJvd0ZpMzZ3ZTdhNEV6?=
 =?utf-8?B?NXEwWVB4NThPZXlZd0R6ZVR3djZnQWdMTjVsNmZXU1hqVWhRUnptQ2hpdUY4?=
 =?utf-8?B?Z1p5UXJ2NGNIdm5qczZ0UzJjOUlhd2RQSC9NZ0Z6YWpKWkRzV21QY0tGSzRG?=
 =?utf-8?Q?UcQs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1F0bzIrSFVJR3plMDNENDR2OTlEd2lpMFRibW1kbWFVMXZoSjdKZ2p6VjRU?=
 =?utf-8?B?M2FMUXVPMDA0TjNnbzQrWW5VQktyVS8vOGNGUHozTndIMWpEbFU2dXdUSUJm?=
 =?utf-8?B?TWl1ZW5USmovbmNmQmM0U3ZVUXhjZXFzTUtlOS9nVTRGZzc1SXJOSzVqVy9Y?=
 =?utf-8?B?SkpjaFhaOHRadll1Y3VuNWhtSEdEOVBqUHJLYWdUNWJWUUhUSzVodnlnVThE?=
 =?utf-8?B?d3J2YWZ6YVc3dXpCNmxkWnlOUUNVRm9rYW1CTUNCMEVWYk1hdytrT3I0cGdr?=
 =?utf-8?B?dWk0Y1RuM0pxUFZHUEVWbmt4TnJCSEUxUHpPVGwzcGhuMEszZUlHMmtRcGhC?=
 =?utf-8?B?N2poa0pUSE4yb0tYbkovbGV6amlvc3c3Z0s0Wk9mbFpZcVUxRmdRMmR2U3FG?=
 =?utf-8?B?Q0ZvdTdlenV1NytmRWFyNEF5ak9DU0FSbkpWWWFTbWVNY29OWU5qLzlWai9x?=
 =?utf-8?B?ZnprMmhxNGluR2pUeVAxSnRjUXhvV1poWDl2cmFSbjFaaVUrM051QW8ya2Ro?=
 =?utf-8?B?NjVYN3RtQ0lxZU1YR1BLRmgralAvSzNSUUZvdUpFbWFRYng0NmZZb1FZS050?=
 =?utf-8?B?KzVVMDRzT3J3dHZsWjZ5RXpqeDlHN25iN0xNNFJKeFNqSFVyei9ObHFEeEtK?=
 =?utf-8?B?R2pFR3dJRUdDVWdaSk56REpxN2FjWGozbjNyRUpzU09aVlhSMDY1Rit5bitO?=
 =?utf-8?B?ekRLN2g5Q0I4SWZ4MGN2YlNDTjc1Ty9XOWJzMExCRVI4SW1adkQzdUk4YjBm?=
 =?utf-8?B?M0tRTy9BZTRYbkp4VHFKU3dsQzNmTHJ3ZDQ2aU5CSHpZQmRySlNvNTNiUWhB?=
 =?utf-8?B?cTZIdDAycloxTEhWUEFheHdoSTlOTi90bmVrVStLSHZpUDNMb3FiVkNkWXl1?=
 =?utf-8?B?UHorMENDVjVuZlRacnJRUUN6aEwzeTE3ZXZmbkJEUVdERGJvYWlFVC9RTlJH?=
 =?utf-8?B?ak1SSk9yZzVUdjFoYldjZmhWdks4d0ZVa0JKYzczaWVGR2RhaHoxc1FPTUpJ?=
 =?utf-8?B?ZE8wL3gxTEpuSzFHcytNckMrYzZEamJ2SzZ0SjBBVUJRR2ltT00wbmZTOTl1?=
 =?utf-8?B?dU9PK2VqTWJoZFdLcU1RS2VBcTEvNGNidHpMbis2cUZIV1BrbUtIODhkZ25p?=
 =?utf-8?B?RVRITkZQdlJwaEJsYllxRm0rQ1JIemNETmFIY0l1NFJDVDMwL0NMMG1NK3gz?=
 =?utf-8?B?L3JVbXYrdU9iZUlGb3pobWgyRDM2bG5VSlJ4b0UzWG9nUXBFcVRvTGVVbkhL?=
 =?utf-8?B?VEJCdk9QZXhGUHROMEtYcU16bnVYL2lycHAxNVF3Vlh2MGlVdENlTm1oSElr?=
 =?utf-8?B?eWVFU05FQnFMZitPL2ova2hKRk5Ua0Nma3pERm15eDNiQ21Ya3pLRUh3RWRC?=
 =?utf-8?B?SFpHQVljbVhzV2gwR2ZFN1BwSjlwSDJEMVlBSm5yakJCSmRrU0w0cEcvT3BD?=
 =?utf-8?B?cGRjZHEvLytYMFFYcXRKMGVmZEhHSjhUbWl4TmkrRGVwSTI0T2pkYlNVZlBY?=
 =?utf-8?B?dFhQZVVpQnF5WHVLZngydE4rNTdCejZLUHBZcE9KN3lQWlZQNkFnYVl1b0cv?=
 =?utf-8?B?MGdEODRSd0hiSWV1NEEwNXBrQXNlb25ScUV4WHNnVVFvdGczOWZ6STR1dEhR?=
 =?utf-8?B?OFBPL0hMeWo0aHY4eTZkWTdFQnRhMkpYWjBkODJKamRva0FFdnQra20xWnYr?=
 =?utf-8?B?ZXc0clZJZ0ZraHY3M0E1alEwbFFycHlpQzczWUh5ZFBnOTg0K0ttSHRiaVRD?=
 =?utf-8?B?QUYwTVJwQ2U0K2xObis1RC9hcUFxOEk1NytwNVVvektob0RES1FXYUFSUjly?=
 =?utf-8?B?SjV1MXFjOU5tQ2RNVXl1cU1GaDRrMVFIM0Z6dUtOc0EyeVMraTFhU0x6eHdZ?=
 =?utf-8?B?dXVqN1V5NUo0VGdUa3YyYndUYW9ZNjJCb1VYVVB3RUhSSUpUOENSK0NvUkIy?=
 =?utf-8?B?R3Fya3V3c2VQYVprdGFINWo0QzdXT042dEdud09kL3pybTNwUlNyVkFoSnhO?=
 =?utf-8?B?bnlZVFhUeDJoSTN3ckhkbmVVY1JBMFhydjZ0QU85RkQ0VE9RMUpaWEhFY1g3?=
 =?utf-8?B?YVRiT0oyd0xqSFBRS0ZrN1lHUElyMmpzaU9kTm9RTTZPVXgvUWNkbkZUQlQw?=
 =?utf-8?B?OHpHbS9NWnZxVWt6dWJBekRyQXVNRmpUTkYxM09QZ2cvd3g2Sjl1T1kwbDhR?=
 =?utf-8?B?dG43MFlkTVlCVlZVVFZqQzJQRGVUYmpyMEtkeHdHSmVvQkpUSksvcTJWQjZJ?=
 =?utf-8?B?azlPWVNsd1lYTTdWcG5uSTBLK3pGRWRZZStOQk5HTjBXMi9tUUs0U3VwMjFV?=
 =?utf-8?B?NVRNYWROZkVMWG91YUN3MVAvWlJNRUVGRnNvbDhjZUpJaUxrRGM3REZad2sv?=
 =?utf-8?Q?qrq93fuAnGhRjrc0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9703742e-902c-47c4-3be7-08de5f8de7c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:27:01.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYPlc8wG4+RHacHAZuRQtXvmr6teVIwsfYZyBgnLc0jMVFT692CD6SGCqzT4bNDF798EZsT7frMaR3ILCWu0brdAg5+GSyanDmsn4U6a1pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
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



On 1/29/2026 11:56 PM, Shuicheng Lin wrote:
> Correct the function name in the kerneldoc.
> It is for below warning:
> "Warning: drivers/gpu/drm/xe/xe_tlb_inval.c:136 expecting prototype for
> xe_gt_tlb_inval_init(). Prototype was for xe_gt_tlb_inval_init_early() instead"
> 
> Fixes: db16f9d90c1d9 ("drm/xe: Split TLB invalidation code in frontend and backend")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> --->  drivers/gpu/drm/xe/xe_tlb_inval.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 989fe0e7f8ee..2ea1b1708700 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -125,7 +125,7 @@ static void primelockdep(struct xe_tlb_inval *tlb_inval)
>  }
>  
>  /**
> - * xe_gt_tlb_inval_init - Initialize TLB invalidation state
> + * xe_gt_tlb_inval_init_early - Initialize TLB invalidation state

maybe while here, use the preferred notation:

    * xe_gt_tlb_inval_init_early() - Initialize TLB invalidation state


>   * @gt: GT structure
>   *
>   * Initialize TLB invalidation state, purely software initialization, should

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

