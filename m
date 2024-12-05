Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379A3E77171
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 09:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064D610EDFB;
	Thu,  5 Dec 2024 09:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="On7FqJSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B12610EDFB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733389238; x=1764925238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I5ks3VLoGtOJEttoBVhS/IpN6E/2Xfyc9kDsMvc/Q3M=;
 b=On7FqJSzo9Sv5wpdJUfkgAiz6RpggUy0B0GzkukRCAD+HtY0bTkWIy1v
 xoORXiF34HgCq/GrTtTMVCLzFh9dBOk2N59aoSPb7NRm7g74cBcfC4C9R
 IYtfQ/uIF6GHq8L7pSXz2E9xU85wImCYhP8IqOLC3EzgTdSbT2plr8sEt
 vnldL6iakU5Zl/xSUw/39bD9pK3Uh4+dYce3SvjNVxYNiZ2wEFEhZmeRb
 BaT9ezy1F3eWcVYgsmO/T4OY+FYzqxr4ZmKH9Vvu/mKENE5cWM4H3zmBP
 GNEakyKNMTpeotAXF0kOFVVF3bxL/nBb8J35mn2eqryh6HyA+oxUAjILv g==;
X-CSE-ConnectionGUID: qt4wE4joTN6gmDnFHk8XFw==
X-CSE-MsgGUID: mG3gwVSNSwOFn/TxgPDwMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56167469"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="56167469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:00:19 -0800
X-CSE-ConnectionGUID: goKxrjUjTvmcfj4BIBW9Pg==
X-CSE-MsgGUID: WfEsbZi3TUa5SCqaqrHqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="94222654"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 01:00:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 01:00:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 01:00:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 01:00:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0SF2dyfUWMW0Vm86NyB1pZmAoPsv8zPv1kSjdsCyNTBGC9sqznEzxTm3weqT3NTLzc2AD7PdQJVxXp5stJ0DADKEaLsC9UqsR3PH/Uofd1GFQIZ1BLNnLnxbR62AFIUebAHOn4Hhq4DD3Us5HdQpKS0fQk/b22OM6HmvdBakXkCXE6iJKhlq1XPyao0lbZHmgNlcDfJs90Ufo8kQrwoj0pmYhOdbW7rUgMLJ9QrTOOKjRjxvE/zgm6Zb68cluRzpy94E5ImydG0oUBIiu7+Q6BIPYlh6oK0tYpblKQBblHnvdCtlnssa10Vb7iWyq2l0bGtCYdmpYYcZVL/iRdDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEa0u6WwDQ15L1gOtemeti4DwUHndj2Qjs4NeFehHHo=;
 b=kUtJXd703olmbzSXbWODvQFPgV7bP3BHFiQGZLvRRYpmhAhOjypM1tswMtUz+ndJye2hxNhiSM2nPgJAariFcgbYPdfZcY80GxjFEUdLv28/DKRwJvOFy0IYHMxc7SuiMOYMw5zsGDQrk0aVrwACNj5NeKGQxQaYew1T6ez60z0+cGRJIrM9Hzv8N2vR7ulJbFH/d2EjruEs1N246xDvKCuE5lVTmdzmdHaBku3dye03pNUczR7K9EMUAstdiPQ6RsRIYYJs9BALfwGGcaZE7uHCXehJR/JWuIDcIN0fRJzVlePl6IAwjwDYlTuJB/5oprEpRFQMBRmWsRffwGI25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 09:00:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 09:00:16 +0000
Date: Thu, 5 Dec 2024 10:00:13 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>, Dani Liberman
 <dliberman@habana.ai>
Subject: Re: [PATCH v5 5/5] drm/xe/uapi: Support requesting unique MSI-X for
 exec queue
Message-ID: <20241205090013.wmas3dsxofcctfsn@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-6-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128125345.1115-6-ilia.levi@intel.com>
X-ClientProxiedBy: DB7PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:10:52::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: b05c77de-d94b-4f1e-6edd-08dd150b3c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJFTk8rMENaK1dSQzBrTXJzTXg4UlpQT2NTN05Yenc5UTNYVDFidFhwUVFj?=
 =?utf-8?B?aTBydDFaYlVsalRUR2xCaytZKzkxNjdWNTVpekZkWUJIbVlqZHl5djkyMlc3?=
 =?utf-8?B?NHA3UFJVRkJneENOMWJGUFRxdjk5aTRuZDVPWTJ6eWlwU1R2T2Q3a1psREgw?=
 =?utf-8?B?Q2JDcGhwbkpiTjhORU1LYlBkakdkRHBOMURiSlJucjVxSXpqZHFzY1ZCdm1m?=
 =?utf-8?B?RmNLUTdrcThhTkRNclJobmpBalZXa1FjbVdyajA5dDlYSHlvTklZb3RMQmpK?=
 =?utf-8?B?WE5UM3hnV0hBbWpRWXM2aVZSbjBpN1BTQ3dCUFR3K1lsV1JmVzBsSkZHLzc5?=
 =?utf-8?B?VXJpcElZbFRHOTZTa0ZlVmNjM2UzQUZWbDkwcWF5Q1RHdHFRVXFqcXNCbUtH?=
 =?utf-8?B?VEF1OE5CR3VhdGtmRjl0dk16MGgvTm9UWjcwSWxZTUVFRzJyVlZCbkxPUldD?=
 =?utf-8?B?MkRPWFJDTUZ6MS9JRVd5eEc1aG9nYTFlYzdjeHQvSGo0dkQxMEEzZ0xsa1pv?=
 =?utf-8?B?cmxMeDJIa0pVajltVFJ1VWpkaW5DZENhLzdCK2E1NmZONFFQaUtBZnhGbGFr?=
 =?utf-8?B?MnNDaDlxVnlEOVc0TURpcTlNSlZkdnJXV3pESkpTVEZkZE5zTHJMM2VhZlNa?=
 =?utf-8?B?djIycGdWUFNOaUtIVXlHT0pNblY2M0dUdHk5Q0NuQkVaR1haWGhoZDVNWEFD?=
 =?utf-8?B?Qks5QTdLeHBERmxoQTJYUHhUOEIyRU43RWVvR0FMdWFNb1ZzakgzOVhKMG03?=
 =?utf-8?B?ck5GVWxYa2h2bGhiNjNId0lJV2JsZlBxY2RYL2hoMjNvbUNLU3FRWU1tNDlh?=
 =?utf-8?B?N2Z0SytRekNyenR5NElsc0l4WENtdDRUY1JUQUdIQlFaVHA3T0hFRjhKQzFk?=
 =?utf-8?B?OUpOTVlTaXFMcHo0ZlRtTC9LRzBMSTBEZnloc1lWMUJmemxaV1ZHYnVIQkdj?=
 =?utf-8?B?amVUVHhrU2htYUFZNDIrL25sZ0w4QTlUTnJoalhDWVpnc1N1V0JGV05PZWhX?=
 =?utf-8?B?VnhKWjU2Nk92YXBQSU1IRG93bng0M3dmSG5XcTBBWWh2MDBORG1US1hUeFRi?=
 =?utf-8?B?RlZnYTkxdHJyQlpGZWd3NjNxS2ZhcEhOcy9jak1hWmk4bVQ4cC9ybURMN244?=
 =?utf-8?B?U3VxQnc5L2ZLdXRCYi96R3YrR0l5UXkvdStTSUtkejhDL0JDT3poaFpBYmpI?=
 =?utf-8?B?VVpuVUh4SUREZk1xbGxTL3M4ajRiL0RGRnBFTW8zVWZUTnJIT0kxOE5IUlZp?=
 =?utf-8?B?d0IwSEdrRUJiTmFGaGpvTlIxQ0toSVNXWVFpY0ZEOWIxWStvR1duYUFIVlkr?=
 =?utf-8?B?K0t6MTBjdzRLblpJc3lXRGExS1hzN2tUY3FOVDgrNFlRM0NoZTk1N21lNUM3?=
 =?utf-8?B?cTNOamt1d1l1MGMydm5SNWsxT08yTkV0TTdQbTA5K2FvTklKUjZ4ZzVPdmhw?=
 =?utf-8?B?d1liQ1ZmVWRjbkxhWi9OZUlpL0Fqblo5dENlT2ZSdk95VlZtZVNVS2dNOExa?=
 =?utf-8?B?b2JzRllNdmZtNHB3MTUxTjJpTkpmRW1RYy9MZTRpS1dYckRHK3hMd1R3TFZQ?=
 =?utf-8?B?aHBzRk43TVUvSUNQY0cvV21pWElYUW9neEswK3lhWTVrR0VMcTBxWlVQcDRa?=
 =?utf-8?B?Uy9LVU9TU0RPZ3krbndWeHZMNTR4d1JBTWxhVDNKN2c3QXE5RTI2TUVjQ0Js?=
 =?utf-8?B?TS9yRXdIM3ZqV2p5RXFObWtYVmJiQVpQazgrUmY3VlhYUFAwZlBuNWN5WWNM?=
 =?utf-8?B?Zkl1VGlBU3puSEIrYm51eHBlL1NrNnpxekNaeThsL01zUUU3WU5XU3BQMW9a?=
 =?utf-8?B?am81Qy9nRHB1Y3NMZFc0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZEdDBEcHQrQWhyWnlKUlhHMHZjaFhqcHFTdGdadVQraGRKalBhcEFFUlFE?=
 =?utf-8?B?TzBjWG1FbkxTVzdnT2U4NXNRQWVCQ3ZMbW9LRnBOU2NKQnJoL3BPa2Q0azg1?=
 =?utf-8?B?Qm9HMXVPOTdaNWs3VGJ2ZGZMczFqV1JnSkszRld3ZnFWQjJBZ1NzRG5peDIv?=
 =?utf-8?B?VE9ia1hEaHNtOENsaHRST3BlRkJFS3dHQk1xeVJLNFViVjEzeTFNTXdFWkVR?=
 =?utf-8?B?ZktqZUhOMzk4S0Q1TEFtYmdXNmhBMkE1Y1k5VEQrTm82VlJvNUJPeWM5ZFlJ?=
 =?utf-8?B?Sk1nbTJReHBjZm00TUFEb290UFhyRnYwYS9acndnd2tBMkRKUldUT2Nvdy9z?=
 =?utf-8?B?RVNYRzJ1NmUvakl4LzBEQVU4aGFDazRvSUlQODZwUW9Mejg5RDJaZ0xXR01N?=
 =?utf-8?B?THd5UlNoRlhzUEpBNjZ1SEk1UFQ3Q0VTOUpZcHU4K1RiaHFJYzBVUFB4bTVC?=
 =?utf-8?B?aEpvUzg5STJFbnFBZTBnNGdSbXFHZ0VGblp2SUNGOWF0YzZGYytPKzN0alNS?=
 =?utf-8?B?U2xIQm40a3pQSEVZNGh5dE44dDQrN3F1d1UxTGtyYXRVc0NNeWdRYStOQjQ4?=
 =?utf-8?B?ckUyTHNDSHVhVU1ZTWVNZmEySFNwM0xVaENsOWdtQkozem4vVWRtZjFmTU9h?=
 =?utf-8?B?dHE1dVRvbE1Bb2lCRy8vTEtraUZIYS9nNzNlcUsxdWJkTVdMbnhhOUJtYjFY?=
 =?utf-8?B?TmY4cmRwLzQyUFMzaS9hNk9FdnZvRjN0alcyTXpBU3VkYlFpZnFidHMrN0hD?=
 =?utf-8?B?NEs1Rnc2ajNHZnRHVDdPU0RWbTFNd2tVNytoR0pSWmpoVlU1K0UwWllTYW1s?=
 =?utf-8?B?UWJxQ2h1NWNmaDNrcmR2Vi9NMkxWV01nbGJQZSt1emxia3BvbFV1RzFBdFhu?=
 =?utf-8?B?U2JycTNaMWNZWFV2KzREcEtKeUloNmVSbGh3QlFpUUs0YkEwOVNtVEJYRW5E?=
 =?utf-8?B?Q1U3MkJKS2Yyb0pGK05iM25aVUROdWsvbXZudnJlTmVGVjNPMlVLdzMweGdC?=
 =?utf-8?B?cm8yeHE4OUVJbVg5QkUyYjk0WnpVbHh0UHVZSEJxaUE1NnBPTjNjM2ovK21F?=
 =?utf-8?B?aldhZ2ZSMzNJMGdDRWQrdkVaMU05bjFXSFEwN0tkcFFLTVRTMnhrZmJiNEk4?=
 =?utf-8?B?OVc1MlBxWnZ3T25SS1Q2TTFFYkJDL0lkYUwzd3A0anRTOEdMN3ZoT3crVEl0?=
 =?utf-8?B?Q2kzNklaWW5zVVVVZmEyWmJoT3lQcDdPVk51dUVFemNSMmlkNUVENGwvbkpS?=
 =?utf-8?B?OXZ6QkVNQ29WWFFTK2tJc0ExTk5sV2F1SWdhMDdrSjJTcm1teEJVK1ZQTDlx?=
 =?utf-8?B?VzN1VFNLVXNURmdVbEpHbGJxY3ZiTHk2b2dZRDlsRzQzbnRNNjI4Tm1aSW1V?=
 =?utf-8?B?dVA4Zk9jbzd0a3Azek9Jcld1VVU2Q0RZNUN2ZjZDTkNCLzdMOGFlZVdPbFBr?=
 =?utf-8?B?bGFoK0JCdWpSZmlmQXhRTWpYZEZsYVJpZ3lBaG9WdG1qQ24yK0RsNnJFdUlz?=
 =?utf-8?B?Q2tJWFFMb0lJMGlTVkl3V3luTndQa1EvQUN2SzBYQWZxMVFZQ0ExSVlLOEdX?=
 =?utf-8?B?eEJHb29VdmVxUzZqNzlpNWxrZlM4d0hiRXNtRDhwY0trNDVhWmhZK0FlYjRi?=
 =?utf-8?B?bWJ5MEtKQlJxVW9rbllNQUNvc0N0RUI5SGIrN1E3eVlrWWYyd2VzNEpnSm1X?=
 =?utf-8?B?VTZkYWIvb0gxRmlhWk1rZzh0RnNYdkpSNndaME5mNXVNd1g0MktkOElDNGtH?=
 =?utf-8?B?aGhwR0hRZThQdm0welpCdkRQVXpXUnhKVTFjbVpQbFNMckNQMjlzeVRKNFg5?=
 =?utf-8?B?cnZ6SVRPcjgxcGU3ZVZHTG8rVmUzL3pQRlJyRXRaY0tSajN1ZmlyN1NSTTNn?=
 =?utf-8?B?cXBuaE5PS2h3YkJYa3ZEUWZJaUEyUGtldUU5R1JOd3JEeDN3ZWtKYWVMKzh5?=
 =?utf-8?B?ZHZmcjBPbHh1S3FQSkg5M1NkZFdjME9rd0wyRXFWKzBVaVdoVlNlcnZRVXBR?=
 =?utf-8?B?NndkRFhTSlk2dEUxQkluUjE4UjhHTkZUbWlwTk1MU1JyNjVwNmE4d2s3OWV3?=
 =?utf-8?B?SGtQQUI2eTFxenZKcXhCZElWSFIyWnRvWVNNcnNzbmZmNkxLTUI4blcyaWZz?=
 =?utf-8?B?ck1WZi8rNm85d0JTV3hzVXh4bnR2ZFdaTldnckxLby82RzNldGlFN0l0dGIy?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b05c77de-d94b-4f1e-6edd-08dd150b3c68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:00:16.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAnQPQFpTaO2GghxUrDDQYPmkZihFxMkiCxk+nnuGTVJW/JO3l9GrzscKn7hzUWE0ZL1v8GsgqCNPkf/LhEab8CPmimj4txKz/6rDHQyU1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:45 +0200]:
> From: Dani Liberman <dliberman@habana.ai>
> 
> Unique MSI-X per exec queue will improve the performance of the
> IRQ handler. In case no MSI-X is available, the uAPI will return
> -EBUSY error and the user would be able to execute the uAPI again
> without the flag (fallback to default MSI-X).
> 
> Co-developed-by: Ilia Levi <ilia.levi@intel.com>
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Signed-off-by: Dani Liberman <dliberman@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 57 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_irq.c              | 18 ++++++++
>  drivers/gpu/drm/xe/xe_irq.h              |  1 +
>  include/uapi/drm/xe_drm.h                |  8 +++-
>  5 files changed, 80 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9c94be571900..1478fdfbf3f7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -12,6 +12,7 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
> +#include "xe_drv.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -35,8 +36,46 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
> +{
> +	u16 msix;
> +	int ret = 0;
NIT: It seems to me that in case you are expecting success or error in case of a function
it is better to use err instead of ret

> +
> +	if (!xe_device_has_msix(xe))
> +		return 0;
> +
> +	if (!unique_msix) {
> +		q->msix_vec = XE_IRQ_DEFAULT_MSIX;
> +		return 0;
> +	}
> +
> +	ret = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
> +				      DRIVER_NAME "-exec-queue", true, &msix);
> +	if (ret < 0) {
> +		drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	q->msix_vec = msix;
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	if (!xe_device_has_msix(xe))
> +		return;
> +
> +	if (q->msix_vec && q->msix_vec != XE_IRQ_DEFAULT_MSIX)
> +		xe_irq_msix_free_irq(xe, q->msix_vec);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
> +	xe_exec_queue_msix_fini(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -69,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->gt = gt;
>  	q->class = hwe->class;
>  	q->width = width;
> -	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
> +	err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);

NIT: You could use !! to highlight that you are casting an u32 to bool

	err = xe_exec_queue_msix_init(xe, q, !!(flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX));

> +	if (err) {
> +		kfree(q);
> +		return ERR_PTR(err);
> +	}
> +
>  	q->logical_mask = logical_mask;
>  	q->fence_irq = &gt->fence_irq[hwe->class];
>  	q->ring_ops = gt->ring_ops[hwe->class];
> @@ -547,13 +591,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_gt *gt;
>  	struct xe_tile *tile;
>  	struct xe_exec_queue *q = NULL;
> +	u32 flags = 0;
>  	u32 logical_mask;
>  	u32 id;
>  	u32 len;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> -	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	len = args->width * args->num_placements;
> @@ -569,6 +613,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT)
> +		flags |= EXEC_QUEUE_FLAG_UNIQUE_MSIX;
> +
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -577,8 +624,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  		for_each_tile(tile, xe, id) {
>  			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>  
> +			flags |= EXEC_QUEUE_FLAG_VM;
>  			if (id)
>  				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>  
> @@ -625,7 +672,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>  					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index eec8f9935a58..6e419b572000 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>  /* kernel exec_queue only, set priority to highest level */
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +/* queue with unique msix interrupt */
> +#define EXEC_QUEUE_FLAG_UNIQUE_MSIX		BIT(5)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 32f5a67a917b..52829771c89b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> @@ -880,6 +881,23 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * In MSI-X mode command streamers raise an interrupt only as a result of
> + * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
> + */
> +irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
> +{
> +	struct xe_exec_queue *q = arg;
> +	struct xe_tile *tile = gt_to_tile(q->hwe->gt);
> +
> +	if (!atomic_read(&tile->xe->irq.enabled))
> +		return IRQ_NONE;
> +
> +	xe_memirq_hwe_handler(&tile->memirq, q->hwe);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
>  				    bool dynamic_msix, u16 *msix)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index a28bd577ba52..47058e2d9d36 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -19,6 +19,7 @@ int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
>  void xe_irq_enable_hwe(struct xe_gt *gt);
> +irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
>  int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
>  			    const char *name, bool dynamic_msix, u16 *msix);
>  void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4a8a4a63e99c..5f32553b14fb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1123,7 +1123,13 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> -	/** @flags: MBZ */
> +	/*
> +	 * When creating exec queue in MSIX platforms, the user can request a unique MSIX interrupt
> +	 * for the irq handler. If there is no available MSIX, -EBUSY will be returned.
> +	 */
> +#define	DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT (0x1 << 0)
> +
> +	/** @flags: create queue flags */
>  	__u32 flags;
>  
>  	/** @exec_queue_id: Returned exec queue ID */
> -- 
> 2.43.2

Two minor comments above, but LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> 

-- 
