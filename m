Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC3D1171E
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6310E69A;
	Tue,  2 Dec 2025 18:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFNlMBzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2170810E69A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698617; x=1796234617;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bRr+YdYxiDKONLN6WhFXx3+6FjJFVUDI9OIRH8kEYkU=;
 b=RFNlMBzsC4xCrXWNJMlpQiZpe1m9A3q//ODry7XzNXQWXN44OVBLn1iJ
 gv9VUICCdjN6t+ak8D9QBp7NF7WI1+qV3kOt/1XLM5bjALJK29x73O2VL
 c+6VnOPqWoVy0qIp0DpEBhb3jaIaF5tux5SyeDb8YTKaiQfV5Rukdt34c
 Er/zBbc6Z2+rRunT7Zw7zfl92JYLYsZ0BM9GbRKSkVFEMNsxKmi1exLFK
 soESKTf3gDCZtTghNtOnwAQ4hel0ah5lNu5zXUhRXfLnLfgl+nCWbxnFb
 gZ9BbvLhZ1PdTEDcrhkjvrzU1iAJsUwj04YRSAflIXNNTfCJv/wXhlVVD A==;
X-CSE-ConnectionGUID: 3O7c7FImQOW8TDjdTYhRzg==
X-CSE-MsgGUID: mzZyTySqQ0K5LDIahnQGyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84277127"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84277127"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:03:37 -0800
X-CSE-ConnectionGUID: Z/sVz4oZQo6DYHZFwrCiXA==
X-CSE-MsgGUID: 3+r465IwSku2ZdB1EN41cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199389650"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:03:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:03:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:03:36 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:03:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYlFwAGdQqkeHVunP0IPaTDohNlJdv5fqjvo03KOOUS0N4cBXBdycm6vgoZxLJBEqCEMT/mbj1WqIriOGr83JflL/hirM9PfE55VHWYMRnUIgSAJoEVa5FDf1REDz+YgNAzypL6DTC1e9VdKwJLNDtFgl4deAjXyFvHiNMrq5obIGKj9zSBy80zdOAObNCmvl7/bP79vsX+ly9yZ7UkFK6ffnepohf1SscLvFIGxzRcfh927mUGvkHfWWeOpjfKU5u3HQTrq7wf5HXi3y7TAEj+7pX6Sjlr1g8/1/xXuyw8l7J25NZNmHkuL9WZ4pLA8akKCjr/l4omaDdvekGlFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOkpP7ZUhal1vGBAmoH1WA6D3tyQg6trAIL6c1z/naY=;
 b=rjt0OchwqaSgG0ujDSs39yO/5p7n2xV3KAUeM0traDYg38wIm6oHxnFpvvXBEpKJ98xM+uQhTQyKRWTWdBdviQLeYivE6c5kf3QULncQ9F4Fy6QShsD1z5LXW+3uopkrzchg8gbeyNCKwg1I5oZEDy7zjOx1AGYt9EWZBOsHsMMoL9k0ZDIEJVxfHtelrTME91UbSRf2egjbnszlLgRLj3MRPvX0Vkzmtjri+f1D0aGgQCWatqbjLp/+VndS9MjR0HhNOXh1RFcYzyTcHOQKJrsQ61R28mMrVQ8mhh6GDJtBAiU4wtaVuZMbbihC1yHQ9XTZpOgWGPauy7lJlVcbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:03:32 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:03:32 +0000
Message-ID: <cb02f698-b03e-4eed-9106-b593f66be1b0@intel.com>
Date: Tue, 2 Dec 2025 10:03:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/xe/sriov: Add debugfs to enable scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-17-daniele.ceraolospurio@intel.com>
 <e60a856c-7ecd-4e4f-9795-8ba327f897fa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <e60a856c-7ecd-4e4f-9795-8ba327f897fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d0e4d3-5030-4df2-9457-08de31cd1acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnF5dWxpMEpkTVJLS1I1aWpRNWZWY0hhN1l3elE1RllxMnZ0alVtRUE1TzVH?=
 =?utf-8?B?RiticUptc0x1NWNJQUJtK1MycG5pdWszQ3FiQ0FvU2FCTDhiSVlRS2oyWm1a?=
 =?utf-8?B?UkdaUW9McU04enhUTjJIQU44M2gxTnlNUWdPL21Pc3Q0bW5tSTFiT0oyc29l?=
 =?utf-8?B?ZmlFSmZmekozdUpWUXVpTDRwS3dnU3pURnNJMFhmNktFL2ExU3EzcXloQyt2?=
 =?utf-8?B?N2tGeWtWMzFTb3A1Ujh3WTZFbFlBdSttWWd0WHE0MDNGVFgvOEtMYUl6Q3Y3?=
 =?utf-8?B?RHJBaExlcEcyUitNVE14bUs5dDVOSi9OdytkYnNPNGlVVGs1NUxWczhZS081?=
 =?utf-8?B?RUhQZTIvOHNHeHZEeVQ4K05CZ1AwaC9odDE2cG1xcFVaT1FVUFBSa1JVbFdH?=
 =?utf-8?B?Q2VCWVNoU2NOQ3ZoSDN6NzNxNnNsVER1VUVIL1dQKzZEMTZOdVZ5RHU3SXFw?=
 =?utf-8?B?eG8rTHZiaUFNQWQ3azZoUkNEdk40MWFQODlQbVZKUWp6MU9MYzVSUGRSQWxI?=
 =?utf-8?B?WDZVWlIvVDZZQ2xSTTMxNnkrcmZFNXEwUGVnazdmWXRkRC9mcng2OTNpN2FP?=
 =?utf-8?B?K0pCbURKcjNjYnZuV0N2L1FJbjJjajZ0Tlk1Qm0yaXd6Ti84ODJYYm5oc1Ja?=
 =?utf-8?B?SHVuNEhCVUo5azRNZFhQa3FzWm5JMTJWUlRvVXZuZGsxdElILzFMMEdzV2oz?=
 =?utf-8?B?TVdydTR3YXA0aG10RzNmVWpQenVLSnJwN2dYOUVFd3FPSCs2SUU3Q3FxZm0r?=
 =?utf-8?B?RVY1d1hVeXFxUm40NitXOXREY2tPRUhOMTVMMVRMWlhrYnc0akFjZE50aGdo?=
 =?utf-8?B?TWdqTDNpRlo5TVV6UUFOZHhoT1B0RUJRejIvTEdYVVNmL0FTalRoa1pYS0JT?=
 =?utf-8?B?R2krZCtQNUJlZ0MyTGkrVERjbFUvK0oyOXRoVDFCMVRrMytuWVVWcENjZGY5?=
 =?utf-8?B?ZEMyZzhlWHloenYrWnJQbHR1dG4yMzNRZGZQUUpvd1RxVzZqWHFON3F1S2g5?=
 =?utf-8?B?VzBybHQ2NytOY1hQQ3czMkxwYUMrYVpidkNWdnJkMkVMVzk3cGpKSkdZMS9i?=
 =?utf-8?B?RWRubU1aWG9RRlF6THRRaTdBZ25BZTRPbEFhT3d2aFNFVEI1KzhkR2Y3Z3pL?=
 =?utf-8?B?amlyemhvY1RmakdkN3E2N0tQbVNrUXhaMW9RSlRGUXVRcWdTOGg5VFVsQTM1?=
 =?utf-8?B?S3VQRFJxanhpWDJERDdNaERzMW9Td3ZpSUxJVmZocXJ5QnlidVZqK1d3T1Yx?=
 =?utf-8?B?Y2hLcy9oaFgzWitCQndkd1BXLzVUSXRpV0JTN2h4b283Tk5WcFNUMkRURXpj?=
 =?utf-8?B?N3RTc003YWtiVTJiV0VjUnNxZUswK2J2VWc5Y1UzeTRwTEJXeG9lclhZOWht?=
 =?utf-8?B?QUJ1bmY2aDgzQnZpL2lRV3Blcy9XRVY1bGdjQ05mVGhpNHEyTXdBUHNWaS83?=
 =?utf-8?B?aDJyVUpFcFpaYzkyb0Z2cmhsY3RlNDRsK3FXT28xK1dGN1JnNjVYNXl3K2l0?=
 =?utf-8?B?STNCVlNURVFqSVpSTWU4Tjl3ZEg5ak5TVW5GT3dtTmRpY3RMeDhoT0hhbGVt?=
 =?utf-8?B?S1RYMndVRnZrbEZ6R2Z1ZkFhbTVpZTlmSWxrNi9zekF6blV0K3ByS3ZBdkhQ?=
 =?utf-8?B?eW43ZUN1THZyTjlDY1h3SW01VTJkUkdwcE11bFNUWTZ4RVhNVEEyT1U2V2pT?=
 =?utf-8?B?ZWd1TDJ6YVlSbmVpYjdtcU52T0hXblhKMzkvYmtxaWdsYmpjSkRyTE1jOXh3?=
 =?utf-8?B?SmJCU3VaYjczbkJwNE1XZ0U1VHBheHNpcGJmSFF6TlRuK01ZMis0Uk5XQ1pN?=
 =?utf-8?B?VXhLazEwbVkrdVVseDZENXYzb2tzcDVmdFdCRWFua3paa29zbzZqRkEvMVRK?=
 =?utf-8?B?M1Z5QTBYZ3EzQ2tIYTNOUmpSMWRrTG5qZTVFWWNnUzkydkljeFFoeS9qMW15?=
 =?utf-8?Q?B6iQEi9MuwOalq1S/4uX4acwGgSz2z4a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFh3K0FvT3k0cDd1K3BUdmJSN1BOMlFjZWxSU1JzSmpJWnlndGlEcGFkM0Fq?=
 =?utf-8?B?MzNnVzB2alNKbWZrVlUwUitpWGo4ZXBIclhzdnFwWTIwUXNCUGhvamlpR25u?=
 =?utf-8?B?TDJoRkt1cFhhd2pVNGhEbDJKNm5tWS9ieG0vVXlHd3dPYUJMM2hhRllLSDJM?=
 =?utf-8?B?MU5wNGFZTEREMUJTekM1eDZaekk0cUxnWklrVVdnRE04YTM1bnhvYnlOcG52?=
 =?utf-8?B?Q0ZhMWxiNkQ5Y1NqM1ZRT3FoMkxKWno4MCtFWk9tZjZiWkR4cWR5SVhSek5m?=
 =?utf-8?B?SGt0R1VFanBhaFNmaklMN3hWMnNmcFFKQzYzRk1Ra1R2bHdlaXNnY2N2SEJh?=
 =?utf-8?B?aXl5YU0zRXlncmJlZ0thK0ZyQ0x3UHRQQmcyaG5PUGVSSGtnR3A5NjZhTDNs?=
 =?utf-8?B?VlRuV2F5dzRBRXR0NGlrTzRIZElJZnFtdTdickpFRG4zZk53ZitabGZJbmgw?=
 =?utf-8?B?eDkrZzFMM3RiaEM5QmJWV0FPNWd4cmlGd0pwL3hOQVkva1owbUlITi80NTM4?=
 =?utf-8?B?L2UvMGFuN3dFNmF5Y2R3TzUweW1VT1JKZFFiTDh0clRpYjJSWG5zWFNVclNs?=
 =?utf-8?B?b0EvcDNrT28zbTNPMzhvbmViNU4ydzFyeUdhRTZoRFo5U1l1dk5EWDAvYlds?=
 =?utf-8?B?OGIxUzgyMVBnRFo1ZXAyaGM1NkhGaFVScXVTMVBRZUE3NjQyVFZxRFRiRVVT?=
 =?utf-8?B?SmE4VmhrdUZ3WERKMU1WbXNYZUNMY1lxa3BOYUZ3bDFaUWtva1RZOTdrTWd1?=
 =?utf-8?B?akl5WHdsOTFGQW8zQzVqdEZkSFF2cklsZnBzTWZteHNYMGtLVlhLSldTS013?=
 =?utf-8?B?ZmNiQ05XbjZjMjJ5cERRZzRibjg5QlovOVJ0cTQvS0RlUXY3ZkdPZFo1S3R3?=
 =?utf-8?B?ak9VcU5OWGdhbGdPU283VVhRcUV1c2R2UE1VbU4zVG03VGY1cXZoc2JKQnlx?=
 =?utf-8?B?blZuNlhOVW5mRWNRUllnTmRudldybmhIVmhlaE13dU9CTHZuMWdlZGk2UTVS?=
 =?utf-8?B?ZmdqSE1yYk1qVFNvUzZZaFJRV3A1UVRkcWtNSGhzTzBuMk40a0JZQitWYzEy?=
 =?utf-8?B?ZWVmRDNGR1dJMU1iNEtSMDdRbnNoSjJwMU1BZVpvdHJqcUxld1NTM01KNHd5?=
 =?utf-8?B?Ym54ckpINithUi9sTnNwRXFvWHRSVzNnWXd0S0tZYU1DdFZvMmlTUGhud2pY?=
 =?utf-8?B?bWxOY01oZVdjUno5Ri9PWk5DWXVOd2lzRGNnM1pvT28yVzJRQ2FJVzFGUmlj?=
 =?utf-8?B?UnpZUU9Sb2tDanZuem00aG8ya2FyYUVOcDFRWjY1THUzNC9HUzVzMEtqUUZD?=
 =?utf-8?B?dFFJa25JMk1JZWJBMXMzY05wYnVsRFNKMU95K2xmK2YxNERHZVJkV21ZQTFp?=
 =?utf-8?B?UFUwWS8wWkN3SVQ5end4TDZYNXVSWGtWOVhVOGdrU0JwVUp4ZGZBLzZCK1hP?=
 =?utf-8?B?bkhxWW9ROC85ZndsSVJJOGR4Zm13elJNQXBYbW8weXJGd1pWbmNPQ0p4TTBr?=
 =?utf-8?B?WFFmVEh6QUt0MjFpbjBseUlLcTU1WVoyWmZOLzl4ZVBzSlFnRGhSZytZR1ox?=
 =?utf-8?B?MVNCRlZBZFpEZ2N2ZlozR1RLMU0xK1Baa3BwSERLYTBKWDBUcHE3ZEJLdmtH?=
 =?utf-8?B?TmtmMlBVQUZUeitJeGRLTEpoZUJUdnRhakJhYmNtUkJ6K1pUWVlhbmdzS1Mr?=
 =?utf-8?B?eTVsemdxTXFCb25NMStxWWtHZFlxdUNPWWtlMHdmKzJWZ00yWWRhQXdUNHo1?=
 =?utf-8?B?TTZaZjhWM1M3VnVGMHJCRTVKbDd1TmIrblBCZGxFZ2NGZFRPczhLWW5TOTBl?=
 =?utf-8?B?MUl4cXB1d0dLYU1KdmtiemZITHhIQ2x5Q29sd3doSzNKWTF0Z3lCN1VjbGE1?=
 =?utf-8?B?K1JSRXRncWJZUUZnb3lyS1FRd0xtM2JwZGFlK0tiR29ia0tSYjJhcTVIV3Jy?=
 =?utf-8?B?dnA3Rll1cW55RUdDLzFhclBnUWhOK1h3V3hNTGVhUUhHWUM5a1Y5blpTd3Jy?=
 =?utf-8?B?eVZaOSt6VW1xS01IaW5NeHA2VjhrVkNGU0ZYMlhJM01aazV1S2FKbnVtTnVY?=
 =?utf-8?B?REVmb2dibGNhTVdvbWFuU0RPMzNrSGtPRmF0R3duOTFiQlRwenFhMlgrZlNz?=
 =?utf-8?B?UFplZjN5NWpzMk5xNzJ5K0FUSmVqWTZPR0FPcS9XU0tvekhWRnI0M3V5T1hk?=
 =?utf-8?Q?MuzZRZ5shSpwkOBeYcCAhEU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d0e4d3-5030-4df2-9457-08de31cd1acc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:03:32.2281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MxOBDxD/6m35MI1QMf0MNaHdwqj/cDZ2VDTKotbqbPpvjJ4Kbl5/ui0vGAbbN3eydebNrynuhHB28dW9CkABrDJyDSyUimCz4XOCzvCOI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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



On 12/2/2025 7:52 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> Reading the debugfs file lists the available configurations by name.
>> Writing the name of a configuration to the file will enable it.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 116 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  10 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   2 +
>>   3 files changed, 123 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 0fd863609848..2953ef21a5ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -155,6 +155,121 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>   	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>>   }
>>   
>> +/*
>> + *      /sys/kernel/debug/dri/BDF/
>> + *      ├── sriov
>> + *      :   ├── pf
>> + *          :   ├── tile0
>> + *              :   ├── gt0
>> + *                  :   ├── sched_groups_mode
>> + */
>> +
>> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>> +{
>> +	switch (mode) {
>> +	case XE_SRIOV_SCHED_GROUPS_NONE:
>> +		return "disabled";
>> +	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>> +		return "media_slices";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static int sched_groups_info(struct seq_file *m, void *data)
>> +{
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct xe_gt *gt = extract_gt(m->private);
>> +	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
>> +	int mode = 0;
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
>> +		drm_printf(&p, "no groups available\n");
> since this will be used by the file read operation and user expects
>
> 	"the available configurations by name."
>
> then IMO we should just return empty string

ok

>
> and if we check for EGS support earlier, see below,
> then maybe this could be just an assert?

sure

>
>> +		return 0;
>> +	}
>> +
>> +	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
>> +		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>> +			continue;
>> +
>> +		if (mode)
>> +			drm_printf(&p, " ");
>> +
>> +		if (mode == current_mode)
>> +			drm_printf(&p, "[");
>> +
>> +		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
>> +
>> +		if (mode == current_mode)
>> +			drm_printf(&p, "]");
>> +	}
>> +
>> +	drm_printf(&p, "\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int sched_groups_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, sched_groups_info, inode->i_private);
>> +}
>> +
>> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>> +				  size_t size, loff_t *pos)
>> +{
>> +	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>> +	char name[32];
>> +	int ret;
>> +	int m;
>> +
>> +	if (*pos)
>> +		return -ESPIPE;
>> +
>> +	if (!size)
>> +		return -ENODATA;
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
>> +		return -ENODEV;
> maybe not needed - see below
>
>> +
>> +	if (size > sizeof(name) - 1)
>> +		return -EINVAL;
>> +
>> +	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
>> +	if (ret < 0)
>> +		return ret;
>> +	name[ret] = '\0';
>> +
>> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
>> +		if (sysfs_streq(name, sched_group_mode_to_string(m)))
>> +			break;
>> +
>> +	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
>> +		return -EINVAL;
>> +
>> +	xe_pm_runtime_get(gt_to_xe(gt));
> 	guard(xe_pm_runtime)(xe);
>
>> +	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	return (ret < 0) ? ret : size;
>> +}
>> +
>> +static const struct file_operations sched_groups_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = sched_groups_open,
>> +	.read = seq_read,
>> +	.write = sched_groups_write,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>> +{
>> +	xe_gt_assert(gt, gt == extract_gt(parent));
>> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
>> +
>> +	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>> +}
>> +
>>   /*
>>    *      /sys/kernel/debug/dri/BDF/
>>    *      ├── sriov
>> @@ -528,6 +643,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>>   	} else {
>>   		pf_add_config_attrs(gt, dent, PFID);
>>   		pf_add_policy_attrs(gt, dent);
>> +		pf_add_sched_groups(gt, dent);
> at this point we should know whether we support EGS or not,
> so we should create EGS files only if EGS is supported

We actually don't. xe_sriov_init_late() (which is where the EGS init is 
called from) happens after xe_debugfs_register. xe_sriov_init() happens 
too early, so that's also not a good choice.
I thought about moving xe_sriov_init_late to an earlier point, but I 
didn't want to mess with the general SRIOV flows. Thoughts?

>
>>   
>>   		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index c7f1ea8eb9c5..3c5fc1b5f281 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -507,12 +507,12 @@ pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
>>   	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
>>   }
>>   
>> -static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>>   {
>>   	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
>>   }
>>   
>> -static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
> public function needs kernel-doc

ok

>
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
> if in the single series like this one, we know that we will need some function,
> I guess it is ok to define it as public on the first use, even if it was initially
> used only locally - this will make smaller diff on next patch like this one

ok

Daniele

>
>>   {
>>   	return pf_policy_has_sched_group_modes(gt, BIT(mode));
>>   }
>> @@ -553,7 +553,7 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>   	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>>   	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>>   
>> -	if (!pf_policy_has_sched_group_mode(gt, mode))
>> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>>   		return -EINVAL;
>>   
>>   	/* already in the desired mode */
>> @@ -588,7 +588,7 @@ static int pf_reprovision_sched_groups(struct xe_gt *gt)
>>   	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>>   
>>   	/* We only have something to provision if we have possible groups */
>> -	if (!pf_policy_has_valid_sched_group_modes(gt))
>> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
>>   		return 0;
>>   
>>   	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
>> @@ -615,7 +615,7 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>   {
>>   	int err;
>>   
>> -	if (!(pf_policy_has_valid_sched_group_modes(gt)))
>> +	if (!(xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)))
>>   		return -ENODEV;
>>   
>>   	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 89aa3af6cc7d..13550cff7c00 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -17,6 +17,8 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>   bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>   

