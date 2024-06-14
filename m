Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BDC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 03:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1510EC1D;
	Fri, 14 Jun 2024 03:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bX9euyKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E623610EC1B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 03:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718337590; x=1749873590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gfnZmRCheFe835XgnOQGqiUN/96qtqa8gkFW04pizns=;
 b=bX9euyKWY1LJWugf+NVH1bMq0DkJ4tR8/9u5LWb8LOFmJuMlO0WD6TML
 CTrLwWoGkM5BqVcIeWpqNOTpmMQBpsf+ClsbKRkE1e+QnKFQhBZjnijwW
 WD8I+/1N41YUphj8BAiROrEaw0/uGLMISPEcBMTks5WtUyPoBDRZqueWL
 AEykaceNYHDzhoV6qrIeqHBmZTTNdzMaYYMgXIFheBkr0B1iedcwiwthD
 b97fhpeKl1w8g65Mg0PZ8CFW8gycVFr3tb+SW0gZM9uk7q3t5kvjVnIb7
 Oa5xyz3tL93bAW1yjUlfXOUn6RCPS1x0Ex+8nKCgGJ+JNyuAncm7Wni+q Q==;
X-CSE-ConnectionGUID: 8SBmBbQyTrSl4pcyng9jqg==
X-CSE-MsgGUID: PXUiaNQXR2ydsn4ssw3MLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18991784"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18991784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 20:59:49 -0700
X-CSE-ConnectionGUID: WQ2yz9GjS0G3rFwYGY5qsg==
X-CSE-MsgGUID: 6NDaO3swRgeuszzjQcmNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="71585382"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 20:59:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 20:59:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 20:59:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 20:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtl2FWm1TlBPf5OISancJLXB0kqXdHUOeXMcdvyK2Rrfs/zlMa72wtpr/CMGX/e6gJwodnyIBCcg3mVXsjqEoPP1mb8Twro6IJHu3xQ919JFWEq4fnJGVgcsQxPj/e5CfyLj1KSm3GwOoH84AdA+DM74aAT20Mezert+KUqQWDWeWzIkPcf0621bHBducOQRWiCpoI1U6cFIo+kKRdxAR1XI/TqkKduk2aVf6Ejp86BfQorG69wUJhOdPRTgbISSqV4RzZ2D5o6c5petGTAPhPqOuLRCMDHB3soYWqzwXQx0GCWHIyW6dzNBTDJiqAqInZlEwj7yd1z+IjNhKN4p+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OASJyt/mkTHnSrNDbMKyScfchoJCKVgpEEl/+pXgj1A=;
 b=CMBX1PzONlbfcutsWYfexz7DEEswE4DSNn9FaQH+E/0Env8wYkCrLPTCOzSZijkWDcmSunxluJ9wO83OyDoR3ljc19bWiO2SZzdVgcrP4ueJ528BhsSbk94PPICND8qHgqsiMcqnWIJ1OKHM1C34IPbb4MJWDYy3/PF+UBmBZDCkAwKEt60wjmzCirbgb6jjUJZyNELRp0QHscaBY5X0p6FJ6flPwpbLmIFGXmrFf+KleF4/zPkEOGo/W9y38IkjZs55Yr14HZ7Xcpu+xBzbjGHy95veQHhGpDVONP0ER32wlaXXAh9ymZkeB74UZcHrPgG5UABl/osph/pP89kvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 03:59:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:59:41 +0000
Message-ID: <d79dd252-5196-4762-8c5b-9ca44b0c8317@intel.com>
Date: Fri, 14 Jun 2024 09:29:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240613153424.2120-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240613153424.2120-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: b71b0d01-aae7-4a6d-151c-08dc8c266ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|366011|376009|1800799019;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnYwNWVCdXNGZlA2TUlnYzh4S0dUUnFVLzZtL3hvM1ZnWURnVVluY082M3pX?=
 =?utf-8?B?WUt0aURTVVRDaTlCenJmVkdEL3d5YkNLNHFZRE1kYy9LVEJqZVVkS0N2OUE2?=
 =?utf-8?B?YUFTK2FIUkxMUnd1QUNJYWtGTVZSc0h4Nklld3k2L0NuclJrdGdYc0h6WHUz?=
 =?utf-8?B?c0xkem0yS0pxc1BFd1BVcm92SHByd3dHTENrUmZFQVBrekFGc0w1blV6RUZk?=
 =?utf-8?B?Rnd3ajdabGhJUmZ5V2dFM3VjQ1FBNUlxRzE2UDY4cVBqdHkrVTFxSmtyS1pO?=
 =?utf-8?B?WVo4UmpQbVk1RzJOYy8xOEJnbW5Vc2p0ZnhmOG5IRzFMUmwrdTI0WVkrQVJi?=
 =?utf-8?B?Yjg4QjRTOEV1aDRiNXljb3dSNWx1Q29lbjZ1NGpOWFFwSDF3bS95cUEyZHUr?=
 =?utf-8?B?U2V6dE5QTHQwMGhPcVN4T1lmdmRlTzdObW5oWHA1SFVXcEhYRDh3ZFowZzE2?=
 =?utf-8?B?TU5haDVjczBEQ29ibndzd0NDb0FPUDlxdXh6L1pEeml6TldoNkVyQzUxUzFG?=
 =?utf-8?B?b0IxT0JOVkpYek9jK1BHRmF1NmhvUlBVNlZoMWxvRG1pbTJ4eDR3SzliVHlM?=
 =?utf-8?B?bVlOc2lGbGJ4ZVg3TnM2RDB3bExIU0ZLUm1wbUNDbWY4ZWRIZzNCc3orNHlh?=
 =?utf-8?B?YWo1dDRBZHhpWmd0Ly9uNlBpd1ZGalFqcG01UUdqSDViNUZDWWRnMEdyTStL?=
 =?utf-8?B?S1BNeTRhaFc3djc2SGtiZFhmRFdja0xCLysydUVCNlE4dlZVSnRNNUJ5dE1a?=
 =?utf-8?B?YWNYRDJPaFNPQ0ZmZU9kVGE3czNrVm5wUlFjQ1ZYRFJLMUdhYnZMbFhvc1RY?=
 =?utf-8?B?cUZTZWNKYzJLbjFKTU03M3FPNFJ5UmJoUGtIWHEyVWtZWjVsZ2ZTaDR6eWdi?=
 =?utf-8?B?bDFMenN1Mnc3UjlyUDBHbzZNVTlQR1I5T0dCVmhsc3djUWxOMXA1OFNqdjhp?=
 =?utf-8?B?TGtLdTMyeExSMGhFbytoK0tncFB4dkF0NTZIZ05XeVVHSDdnTDF4bFZXNTRu?=
 =?utf-8?B?N1l4a3hQVldoWmxlb0c3cWlkZ3BUOTFoQkNHcmhURE0vaEQyZHp0M3VzWEdM?=
 =?utf-8?B?Q0o4YjJGbTRTTDNPQlBXT1JxeU9QaHdTL29LQm0veTNGTkRZdnAzQ0dBaXR1?=
 =?utf-8?B?S3ZKaHRIY21JeGR3aFVNT3cwVk91TkFqWVRPUDdyVGgzczJuWkFVV2cyeVRR?=
 =?utf-8?B?NGQ2dTZBSUdRTDNWOWFkYkVWMzE0bENlZjJmWXZGVnJ3Vi9DMDRSdG9ETGoz?=
 =?utf-8?B?MkhqTTFNVnN3cHZjYmRVTGlMOGZtOGNJNTBzMEJTNVJrU2FIY3RyWFRjblVK?=
 =?utf-8?B?WVBFUjJUbEMxV2NqY2x6RERiQ2VxUFN6YllYeFpVeGRkVzdaK2hlWWlFN0x4?=
 =?utf-8?B?eTB1dUM0djErVjdyR2k1cFhmZzV2eW52RTh4WWZ6U2RDa0lEcDc5WU9Kd2Mx?=
 =?utf-8?B?MzQxUy9DYzU2bjBsQ1YxQ1VrSFdOajRiQnBnMXdYbWRnbjMzYUlubVlSRkNs?=
 =?utf-8?B?RDlnK1lGa29MYTl6N3hSeVR0TFNsbEFnM2tydUVrN2grT1h2VGZCaDJFTkVC?=
 =?utf-8?B?SjgrVTI2elJ1ak8xZEtVVlJ4YVg2WHBXYUdNM056Y1piWWNQb2dGNHNpNGp0?=
 =?utf-8?B?Q21BSmJjazFTeWJzMW9DSUorUTBQZWZHUy9HaitJUjVZbFJpMTZmRDMvL2lO?=
 =?utf-8?B?VUFkVmplU29xeGlnMUNpRS9JeXQrV09yTGMveitXTWk4RGoxUkh5OFhGY1lH?=
 =?utf-8?Q?LQw//uhoQqCV88cJ/3zpGVTXpvJk6IW13vBtP1e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(366011)(376009)(1800799019); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGo1d2tuTkxpRXJoZkhFczRUOXVTZVBDc20xa21nbGNrSjA4TU40bmxIcWxC?=
 =?utf-8?B?cW9WYW9YUDVXcGxQL3NHaHBxZTVqaUplWVRHUndOaWYvcmJOeUFxL1J1REVr?=
 =?utf-8?B?anVJUFBUUkxlRnM4U2oyMjVDUzBjWSs3ZTRJaHNHNm9pOUFvMkxIZytWSm9j?=
 =?utf-8?B?QWdaUzE3MTJsTTJlNzlBYXk3cEJZdytHV2F5elJNMkpoUFhXYmE1eStBTFMr?=
 =?utf-8?B?aExOS3JKY1FOWEtsY2JTM29rcFVJZFlROGtscGh2MkZEbFA4U2VlamhDM08r?=
 =?utf-8?B?MFA2WlB4NStnK0pIcEVtYVVOUXJKY2hXR1JiLzNUSHFvU1Y1bXF4WTI1dmxr?=
 =?utf-8?B?SGwzTzZ2SUZhdzdEOWk3U0tVQkhFNnR5WTdxeThXeTdjUW56RzZLWjVTTFRU?=
 =?utf-8?B?UGNiV1pvdUxHU3pkWFFqWXZlTGRLUm40NllLV3VtenFHT3VvMmh4cFAxQjNV?=
 =?utf-8?B?VFUyandYbmFWS0V4aWQ0YUpsZ0lPc3MxcGw0OFhubnh5QzdicktQbmlBT1pK?=
 =?utf-8?B?Y0FaQ0JGWlJ2SlNmSTFEbktjUjNMeDI4d1RYL1RvMjhNbU55eW9ZcVFUQVZ4?=
 =?utf-8?B?NGtZcXNmUnBtNmg3NlFMNHJIeEdOT29hWGZwSVFTcGdNaTcydVJaSldtckhP?=
 =?utf-8?B?WldvVmw1WGc2dDBsMXdxVkt4dkhLZ3NadUtmNnN1RVhxZEtweUJ4dG43bWFS?=
 =?utf-8?B?YjAwRy85dFFWOVZEVUdzc1Q0WFRZWk02MHpWalQ1aUlXcXhtWEk5WlM3MnJI?=
 =?utf-8?B?YStXVG9vUFhrakl5QllJcjFxVFBva1U5bStkM2M3RVRFZkFpZ1ZGdFhvTXVz?=
 =?utf-8?B?M0piOWVPdWtJcjhFNlh6NUgzQmZGaWlWVE55czFMNGpyaDhma0ZwVTlaeUt6?=
 =?utf-8?B?YUdJY0YrMXRoYUJKdUZiWjVtTEJIN0pqZEVUNHE5S1EwZjRzcWRLNEtYcStP?=
 =?utf-8?B?ZHdlQ3dOTUQxclN3R0J6M092STNzOTl4NVo2SW5CM2lLVWNJVkl4eGh0MXpH?=
 =?utf-8?B?WXU4bkhsZGdaa1ZHRUFIVUt4RS9VV0dSMERQTTlDT2VPZjYrenFNNnlnNmpO?=
 =?utf-8?B?TTNMK2V1R2dEZU1IOVhPaGFWQmFhRWEvRDdVQ29NblkvUVVEeHg5RUkweGQ1?=
 =?utf-8?B?K2pzZGlWWXVhNzQ1Z1hVQSt1dVBjeVlzRW9sM21kMGdQMkJ3MEl4Uk5rRXhQ?=
 =?utf-8?B?UlRrd3QwYTRGVitKY3pLYlRka0ZDS2hUa1BxUW9pendyMUQ2RzU2a1lveVdl?=
 =?utf-8?B?Y3RCbXh4SUMxeXN6cDNvd0NCMWpZV2tKQXBXakt2MXE4TDRpemRkUmdnb2x0?=
 =?utf-8?B?WFJUcWpCVXJOdHlWazZreUFjaVE3S2RMd2Ftd1h2c21FejVoVG5hb3U4K0xh?=
 =?utf-8?B?Zld1WGxoZGhzYjc4em1WQ1c1VjJUUXpFU3RWOGhHS3ZtNDdCZVdZNnVHSW00?=
 =?utf-8?B?L2ZzV1oxU0IwR2ZQclNoMWRCNkcrOWRNNDJVL20rb1d6dUk3OVB3bEJZYTRi?=
 =?utf-8?B?SjV3UjhOWDB5MkZlL21vVTVhbXNXblYzMGxUZ0NYWXpINjh6QkEzV01MOWdT?=
 =?utf-8?B?dVA3YUdabER6R1NjTWVOR3BqT3Vodno1cnhhbFZHaWhNK3VjYWk4NjZJRmNP?=
 =?utf-8?B?eGlJam40SkFZUDdrYlNJaFIyLzlTcEhxRzJNZUZkVlVweWpwdHZsOTFaQkpx?=
 =?utf-8?B?RHFLNWlzT1dSbG96cTRHMzRoZWdxS1pweFNtRHAzcEVyNys2bk1VNFl6ajRS?=
 =?utf-8?B?MnZDU2VtUVJqRzgxTFZPS3J4Q0JuOUpoQjUxSVMwUUJlMXFEM3haQVlxSUdv?=
 =?utf-8?B?M1R4OUtzQkl4UUw3ZHdlK09FZjg0endKNGZqVmkrbHRLVzlqbVYvMXJPeHVt?=
 =?utf-8?B?SXhtcVJ6Tlgya09sVEVWRFh3U1BSelJwNGl5N1ErL0x0U3JYUldDejRwV3BV?=
 =?utf-8?B?NUpHek9Hb0p1MkFGZDBPOUJtQ1huODd2azdTMG0wMnR0V0EvZm1lVEVtVnVJ?=
 =?utf-8?B?eU9UNXRwaEwwb2JHY2YrbndEMG53ajRnQ1RtSy92M3dMUjFPU3YwMnRabjJs?=
 =?utf-8?B?WCtMdmRuMGt6OEo2MjdLYWtNMnpFbHFkdm9PRm5xTEZrYjR4L25mZGJMaHNt?=
 =?utf-8?B?SWJkc1g5UElPWjlzNDJMOUlPSVdjVlQvcjlxTUJzY1RFSWZDUUxMcmk3NHpT?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b71b0d01-aae7-4a6d-151c-08dc8c266ab6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 03:59:40.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSTu4mZZ2PuJB6AUg2L+rTyDIiyiMtzAQhKMNcSTy6t/ca4C/ELNsbe8GgcqhdAncnpWZjbcG9Ei+cOuftnwYMRnHa+g1zJznq6EKW6rCSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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



On 13-06-2024 21:04, Michal Wajdeczko wrote:
> Helper xe_uc_fw_sanitize() was defined but never used. First fix
> it by properly exiting also from the LOAD_FAIL state, then use it
> in GuC and HuC sanitize code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c   | 2 +-
>   drivers/gpu/drm/xe/xe_huc.c   | 4 +---
>   drivers/gpu/drm/xe/xe_uc_fw.h | 2 +-
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0bf6e01b8910..0e1a5674ef13 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1094,7 +1094,7 @@ void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
>   
>   void xe_guc_sanitize(struct xe_guc *guc)
>   {
> -	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
> +	xe_uc_fw_sanitize(&guc->fw);
>   	xe_guc_ct_disable(&guc->ct);
>   	guc->submission_state.enabled = false;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index b039ff49341b..6238fb354914 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -295,9 +295,7 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>   
>   void xe_huc_sanitize(struct xe_huc *huc)
>   {
> -	if (!xe_uc_fw_is_loadable(&huc->fw))
> -		return;
> -	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
> +	xe_uc_fw_sanitize(&huc->fw);
>   }
>   
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 35078038797e..c108e9d08e70 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -158,7 +158,7 @@ static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
>   
>   static inline void xe_uc_fw_sanitize(struct xe_uc_fw *uc_fw)
>   {
> -	if (xe_uc_fw_is_loaded(uc_fw))
> +	if (xe_uc_fw_is_loadable(uc_fw))
>   		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   }
>   
