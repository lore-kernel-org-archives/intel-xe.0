Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC11CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 19:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800F010EC36;
	Fri, 29 Aug 2025 19:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fikTPwnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1F110EC36
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756495739; x=1788031739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5lCyTummoSE1f9BrrasVmzn+e/aZ9nYlIIPmp23kpys=;
 b=fikTPwnY2njvAQhHY9oBy5+YkLQkoPeCOlRrX/HMYzdfnM5akYZOvndp
 rP9ZgnBp342uLuM8u23Rz7/29k7qCAuyORlUCrCL0Q13FebpPNtsrvU08
 8zP85qang9BAFoepYB5PTsi571NwUKUvB9srt1llEaut9g0qGuXfZwX71
 HxetumLfuz3NZO+YD/XNjA+S4tqHOV/tR7Li4fz9fw7o7tmZ8SmJYSwE1
 Y30JeQTw1G339jvg3A3d/QXvwrekiAPovhmevLUL0eYDC0+GGqeFiuf67
 tkybLmlp1TyiLt5JoW8a/Cq0D+QjncVjxujwGjDtr2OpyVZZ/51jHP+nM A==;
X-CSE-ConnectionGUID: Xd723+Y9TMOajU9MnitmyA==
X-CSE-MsgGUID: t3h2ORpBQG+Xka3Uy0xw8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69063799"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69063799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:28:58 -0700
X-CSE-ConnectionGUID: NK+CKjfnQgCHVCRiNdhs+w==
X-CSE-MsgGUID: 94/dchYERxO08HB3NvN2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170356022"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:28:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 12:28:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 12:28:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 12:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6ZqIBdDJDS+DTfCmNSfPMkU3mTZBppPRydquvFPquR3lYypFKTGPtehyiysXZrCQu15pj8EWl+1SIrveyNJJ/55OHjfK4MKTy2Gl3zFJZAcgGlrafe1/IQ1EyxuFT+hP6MKVLekgRW+n5Cu4MZYdbAVYPYpqz6C4r0cVrIHkgq4qX+bw6ZVmxuK2okrysQycyg8kK21lNdyfnNOs6jgjGFW6nWrx7Dc+hc8iNf1SXSXmMaruXcTP3ajbX9PF3SqpxQlxTecHQQzd9Xxn8JU57WxaNMuG8eEJq4zYJXaBA/dxhec5lPJzXnzLQCrdTCHVZ3+/URghCgE2uaUDxKmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkOqfXV6qwSQc74K7orHyMuVW2AetQOSk9rlE1HguIA=;
 b=XFjop7KGZSvPWy5k4dMmcqu82EywVbSfWMlXXF1NTez36kVkO3Zb8kwiVklzJBmNAdqmjOCjMI9Skd3MzsLUEvPfcYGT0c3kD0gGIH1E4G6kj7XkVPUAlPrHJVA5eAvSJ9apvhLUxSkg22dfbmpcYsYX2pVvloSXSBJ0K0EvQvAhEiA+UInHV6oebMpkaE3Ubz+EesFaEoBRhv1k2ac0/ycCSUA09dZpkfP4QYNvrItnr8i4ldf9Tg8lG5ZUF+0/l/EDEldtVuQViHQHIJrv/EPVR1CgDd/InQMw4QrgGzLTbAk8rb5zDVglwl+XYqSMOUAVGH800eq42bo9mVR1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 19:28:51 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 19:28:51 +0000
Date: Fri, 29 Aug 2025 12:28:47 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <aLH_bz52PZvgheb3@intel.com>
References: <b131c6dec20a07acab020063df7ff22b7050c14c.1756318068.git.harish.chegondi@intel.com>
 <1b910cab369af1e386b7f8da186a756f6ffe2361.1756318068.git.harish.chegondi@intel.com>
 <l3o4birrnbgohxtopdx3iv7jbp3d7pe4ifurhapygbixehyvhm@eyh75lwhsn7j>
 <aLDSaOtVeRDUgk1P@intel.com>
 <pqq4nyw3wdsbsv6bnv4p3nkes5b4v7n7gdtzu7dssnhbpdfcg6@77mdoape5y5x>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <pqq4nyw3wdsbsv6bnv4p3nkes5b4v7n7gdtzu7dssnhbpdfcg6@77mdoape5y5x>
X-ClientProxiedBy: MW4PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:303:83::20) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA1PR11MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: e1df4f4e-f08b-4668-9ca7-08dde7324891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enFUYTRnL2FLZ29IQ0U4TStIOXhBU1liMVNQVFRGV094bVFWN2pTMFFPRGli?=
 =?utf-8?B?RERtMTA4enltZGlJa3BPRy91S284MnBGakhxaFU3UVA3V3dEQVg0dm9sU1gv?=
 =?utf-8?B?NzJkZDBjcXFyWTV1bzdVTEd2RUVUSGtrS3RKakFrRXU5RVFFaW9qU0JsR2hP?=
 =?utf-8?B?Qm05NUtoaml3RGgzd0UwTTdreE0zNFNXcUNGUDlIRTY0M0RSU0V2cVRMWFV3?=
 =?utf-8?B?RUM0bVowOTRoMDUrcnNSb0gydWI5QmF1VEptRkZ2a2xaWUVmYkpidjV3NmlI?=
 =?utf-8?B?Y09RbU56WHJTV1BwWUI3RkJEL0VOTzhMenBRWDhVY2dWSEtRNHROYzhZck5m?=
 =?utf-8?B?c0FlZUtCWVlwdGw2YXovSll5UUlLU2IvYjI0UWgwbDI3dlRWYlo3Y0ZzZnNQ?=
 =?utf-8?B?WFlxZVExQlR4YnprbngwRlhhbVBCTmYyM0xSR290YlI2eGFjOHZORVpZeWJt?=
 =?utf-8?B?S2JyZDhJMmpBRi9DT2xXT0JmVHBUc0ZBby9iVVNEM0UzcFB1dUFKb0NrbzM5?=
 =?utf-8?B?SkdkOVVxQkNJYzJQOXNEUnEzUzRlaXBKdnpKT1N1Vk96am5qVjU1ZDk1b2Rm?=
 =?utf-8?B?NkJncUdaUFVCSklWN3FWZ29ha0ZrSk4rd28vbzFPazgzdXU5MHNHREVpTDZn?=
 =?utf-8?B?M3IrSnJTVDhWcFhpbGd6TTJkdmdrS0ZXNk5KSUxDRlNxWUV3YzRyL0ZjZWd1?=
 =?utf-8?B?Vit5WmlrKzdQUmRyODk5ZVlxYXFNd3Y5aFJJWmZkdXRNa0xjUHVMdldRcWtG?=
 =?utf-8?B?TytlV2pEQ0pyTWxodWdVY0VsTjJUYUREcFpGd2hncmRxTlo4dGRhbER4MVNz?=
 =?utf-8?B?dmZwbFMyVjNSZENEZ3dlWm9WRUptbHBuUTZMYTVIc2ZwSHJPUk9ocEpoUEQ1?=
 =?utf-8?B?c2xDbHV1Z2FVNHlPS1ExQ21vS1FDUlppMnFhQVVSTmJhdGNFSHhNZGNhR3R4?=
 =?utf-8?B?YzA0bTExc3hKS1QrekVDYm04bVRuSjBuRGVKeUdLTlpDdTZtalgzcVNMbmdt?=
 =?utf-8?B?RzVBMCs2bnZFYzVwY3g2ZjdReTQwSHFjU0tkdXEzU2x3OGZrK2lDK3FqQlBK?=
 =?utf-8?B?YUZIRUl6L0pZUkRhRk1tdW9SWm9vdzRnWW1oM3V2UWl3ZmlQSnFGMjJOTm5K?=
 =?utf-8?B?NGFOUDU5VVE3VW5yYTd6cmU3aUVaZGJ1TDMvV3ovZ0h6VEdKNjhWOXYvaW0w?=
 =?utf-8?B?aTJnTnliR3E3NzBNOHNLc1R0TFlvVTNNMklYNnRwRk1STFlGZThUbVJrb3Va?=
 =?utf-8?B?TkpvRGFLcjV1M2tNQzBTdUYwNkFyK1U3R0RaS3BTdWcraE41bmgzckNQVXpV?=
 =?utf-8?B?UGlRZ2J2UHBnMDNiK3RsRXkrcTFRU1Z2dWNlRWN4RW5Dbi9Xek1xc0w4SlVW?=
 =?utf-8?B?L0UraDdyTy94Q2l2SDBNRS91VHJTeWp4d1RpUytXN1NiRVFGcGlGOFluNkdv?=
 =?utf-8?B?QjArdWs1T28rWUQwZFhUbjVlN0diUmhNM3JpN0dzazJRSTJZTFVuV2ZRK245?=
 =?utf-8?B?SnRLNUdSaXprQnFxUnYwY0NvdnRWVjRDbEpqZFhPbUdoeUtOaGk2aWx4ekp0?=
 =?utf-8?B?R09GSExCakFncGM4aVNWWDB4R2NQczh5M250YUl2dUZzSVB2RlM4ZnErdzh1?=
 =?utf-8?B?cXVlZEdVRTV6MHEvM2pyS24rZ29xOXFvcmRVc2drdCtTT21zTUU0Zjh3UUdD?=
 =?utf-8?B?STljUmNIZ2NhY2pJTkVsWXhlV0JKdWpQNTdJNW5oTUN4MjViQ28yaVYzQ0hJ?=
 =?utf-8?B?S0RvcXQvamhTZ1l6OWlSbEQyWXQwSU81em5uS1FCalZ0T09EN2tjM3A3eUtr?=
 =?utf-8?B?OFU3UXl1TkNId3NOd1R1VGN2MG04ZzhVOHB5ZFhOdFN2T3ZtQXJPa0R5UEFl?=
 =?utf-8?B?TGtTOXZ5cW5nYlhNeE55UTRGbjR4b2RHU3R6SDUyQzlnSkwzRFd6dGdDVWVD?=
 =?utf-8?Q?s0VtTEMJmo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJxVTRlbjRPV0F5UWF1SHZwU3Jhb1dGWUphTlBSU2UrbVp1R0p5UVlUSnpX?=
 =?utf-8?B?RXRuZG42RFBjZmJZL2hRWTZQdE1qS1ZkTUFWYVVuU0ZVbnVGc1R3LzlJZkw2?=
 =?utf-8?B?a09vTmRyZG5lbXRTMWxha1Z2TERZWHpmL04yVnFWNkdGMmVXRytFVzBreVh6?=
 =?utf-8?B?ajVlMjhRQVlFcXJqZ2hMSlB6NHhYTWs2ZkNaTFdzbnhKQnlLaXlzUm9BamU0?=
 =?utf-8?B?ZG8zbkE1K01vTXNwZmZ3Q2E5WG5jbE1SS1cwd3gyS3ZEYU04cTRZTTBZMWZi?=
 =?utf-8?B?amxvSTZ1MzhOOTdGd1ZpMFJkSEFsaFpVSjhMSXoxSGZUOEp4Y1ZrQ3c0c2RJ?=
 =?utf-8?B?ditTOE44V1ZnWmxxcHhQSTBmc1Z4dS96djhHcjVzeHZldnBsS1ZhT2UyMjVm?=
 =?utf-8?B?eVJBZlZ3Qk0wa21PS1paS1pmV05yQ3h0bW9OZnppaU05QTVlV1dCeGFEMi8x?=
 =?utf-8?B?dWpWMTV3OGZGWkZubDNIb2F1a3VSWTRVNXhJRlY1ejhINUxIMFYrZ29PdGVV?=
 =?utf-8?B?dm1UalpsN2FtWjlIWUllNEVnNU1uMWlXMkFlZnFBeUd4RFBxN05aRUlkTXRm?=
 =?utf-8?B?M2E5UW53RUpYb1lSUFNiakd0WlFFa3I2ZjZrMExQcVZ1anhsMHFubDBpWFla?=
 =?utf-8?B?UU5wdmZOc2lkMy80bkNsd09JMVhCZ3JHM0NOR2RWWGZlMlVmY3NwdE9MY1lF?=
 =?utf-8?B?cndNbE5FVzdYSms2OUgwVGo4V0poc01FRVJUdWVHY1dDQ2tzdENKV1AxaGd6?=
 =?utf-8?B?NkdVemxkczM2c3d1SDhRNWoxQTJmOVdnbXhHVGRoS3dvMlZFalFvWXhQOCtD?=
 =?utf-8?B?RUlNaGxnNkdOSlhCTHhidUJmdXFnODdVRlBIc3ZYb1ptVDVKbTBkdTFEVzVq?=
 =?utf-8?B?cmE5TERKenNvUnlPTFk3NndLUEVsU3RGWUVJQ2xjMVh4N0hxSWRaRWxtdkEw?=
 =?utf-8?B?cGlCTmYxekg1NWM2R3p2ekREU2RpWC9IRXpKb0d4YTFDV1ZXTGVuUkJ1WHVI?=
 =?utf-8?B?N3liWDlJRkU4cVFsbW9ZUXNLZlpMbUFNbzV5bGRBU3N4YUIyZFQ1T3BEQWlQ?=
 =?utf-8?B?cVdTOEtYaWRHTzBBVUNNdktEbHpBNktEd0NpaExYQU9BVmVFWnA4WHBRa1hK?=
 =?utf-8?B?dmorcUdkU0QvYWdyRk9QU093anlqYVRJOXB4cnVWb2ZJbCtQenk3c3hTQWRY?=
 =?utf-8?B?YUozNVA0VFpFMXMwWCttVHplWTRENnpsbW9VSFNxVGZ1NW5KUGVnL0xETXh3?=
 =?utf-8?B?em0xRVhxVlQvK1pHT1hKcnQyWFpmNEJqOUZ1Vm9ITi83ai8xQml0dkdpdFlT?=
 =?utf-8?B?VzJkNERLU2JYWFovWTUzeEVscXRRQ2EyaEJQeU1OLzB5WEV2OWQvZDUxTkNa?=
 =?utf-8?B?T1ZvTGJydWhBQ2lld0JzM1phSjFsZkkzWWlvYVYzR01qaSszVkxWSXJWdkQ0?=
 =?utf-8?B?SWVHKzNOK2l4MlFaU1VaNXpQaWNMdnh6MTh1ZE9wc2FxL1ZBZFJWQlRmSTda?=
 =?utf-8?B?dHZ5RE9uQ0MxMkRHeW4zUkFyVHg1dUR0NWQwVzF5dVVwdGxqTkYzeXM4emU2?=
 =?utf-8?B?ZlljOUYxSjhySFFRa3AyRzloalp4bzRNMWUzdjIzRWY5Tkc3dDYvODlpMDFp?=
 =?utf-8?B?NEVSZVJlMVJuV0hTbXRlbDByaVoxSmRpWlAyUm5QSFN3L0Z5SHhRVGJTN3Br?=
 =?utf-8?B?dWg1aVlMbU5KK2VPdjlpRzY0S2F0ajJwUXQxUHorUkdFZm9yUmdCVUg4alEx?=
 =?utf-8?B?U3cxcCtmcmQydkFjTUVNdU5FTHh2SEt1NUVtODBsUUdIZGxEVXg3NTEwSnhn?=
 =?utf-8?B?QW9ocG91Q0xHL3VURWFodUVLajgwS3U4cjFmRDR1d0pRd0MvMTFCUnkzdlE5?=
 =?utf-8?B?RHM2Sk9STUFOcmFMK1IvTUF0TnhmRFdoTGtSNFVuVThGZEhsb1RSanZpTDlP?=
 =?utf-8?B?QWhvbVUyaVNCTDlwb3VTWGV4bkx1d0Jtd3dqVkJHaDR5dFVadlpwWWthYWk2?=
 =?utf-8?B?WnB3L21yWjZEaWZmY3FXTUs2Ym5ha3YrRzhialRUelEvM0VBTlkxRHhZSGhH?=
 =?utf-8?B?Rm1KQ1JGUGdGc25sWk9WaWsxaXc3c0pvWk5sUWdCQ2xzeUR2ank1bXJuUjY1?=
 =?utf-8?B?R1RLdnQvQUt5UTZ5ZHBxSFN0Ry9YUzlLYTk3K2lxMjZWcmNVT1I1ZzVuMkJm?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1df4f4e-f08b-4668-9ca7-08dde7324891
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 19:28:51.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD3a0P6r7sMx1r+54xq5i7PXExouaO/FMn0B+qgwKa8XSO0ChRcG09IiOj5chf6DhmugIduthmnbPwVDyTsgKK+vz+Zoo1KcfLggLfxpKn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
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

On Fri, Aug 29, 2025 at 10:40:20AM -0500, Lucas De Marchi wrote:
> On Thu, Aug 28, 2025 at 03:04:24PM -0700, Harish Chegondi wrote:
> > On Wed, Aug 27, 2025 at 03:11:35PM -0500, Lucas De Marchi wrote:
> > > On Wed, Aug 27, 2025 at 11:09:35AM -0700, Harish Chegondi wrote:
> > > > Add Wa_18041344222 for Xe2_HPG that requires disabling
> > > > the perf mode for subslice count for eustall sampling
> > > > when the enabled slices are discontiguous.
> > > >
> > > > v4: Rebase
> > > 
> > > this changelog is not very useful, is it?
> > I wanted to let the reviewer know that v4 is just a rebase and no
> > other changes made. Should I remove the changelog or add more details ?
> 
> well... if you didn't have to change, there's no reason to add any info,
> is there? You may be re-sending to solve trivial conflicts on the rebase
> or because some other patches in the series change. We don't have to
> look back at commits 5 years from now and see things like:
> 
> v2: Rebase
> v3: Rebase
> ...
> v42: Rebase
> 
> It's just noise.

Makes sense. I will remove the lines from the changelog which indicate
only rebase in that version of the patch. Will that be okay with you?
> 
> I'm even of the opinion that this should be below the '---' so it
> doesn't end up in the final commit. But that would be a heated topic for
> another discussion.
I think I read about this somewhere else too. I will try moving the
changelog below '--'
> 
> Lucas De Marchi

Thanks
Harish.

> 
> > > 
> > > > v3: Skip the workaround for SRIOV VF
> > > > v2: Add Bspec references (Matt A)
> > > >    Rebase
> > > >
> > > > Bspec: 79483, 56024
> > > > Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> > > > drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
> > > > drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
> > > > drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
> > > > drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
> > > > 6 files changed, 34 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > index f96b2e2b3064..06cb6b02ec64 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > @@ -522,6 +522,7 @@
> > > >
> > > > #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> > > > #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> > > > +#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
> > > >
> > > > #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> > > > #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > index a0baa560dd71..0ed7dc9044a5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > @@ -12,6 +12,7 @@
> > > > #include "regs/xe_gt_regs.h"
> > > > #include "xe_assert.h"
> > > > #include "xe_gt.h"
> > > > +#include "xe_gt_mcr.h"
> > > > #include "xe_gt_printk.h"
> > > > #include "xe_mmio.h"
> > > > #include "xe_wa.h"
> > > > @@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> > > > {
> > > > 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
> > > > }
> > > > +
> > > > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
> > > > +{
> > > > +	unsigned int xecore;
> > > > +	int last_group = -1;
> > > > +	u16 group, instance;
> > > > +
> > > > +	for_each_dss_steering(xecore, gt, group, instance) {
> > > > +		if (last_group != group) {
> > > > +			if (group - last_group > 1)
> > > > +				return true;
> > > > +			last_group = group;
> > > > +		}
> > > > +	}
> > > > +	return false;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > index c8140704ad4c..fd08b382e259 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > @@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> > > > bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> > > > bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> > > >
> > > > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
> > > 
> > > mind the newline
> > Will remove
> > > 
> > > > #endif /* _XE_GT_TOPOLOGY_H_ */
> > > > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > > > index 47ea1521dc80..b5f430d59f80 100644
> > > > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > > > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > > > @@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> > > > {
> > > > 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
> > > > }
> > > > +
> > > > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> > > > +						  const struct xe_hw_engine *hwe)
> > > > +{
> > > > +	return xe_gt_has_discontiguous_dss_groups(gt);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > > > index 7951fefdbe04..d0adb29db7dd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > > > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > > > @@ -480,4 +480,6 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> > > > bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> > > > 			       const struct xe_hw_engine *hwe);
> > > >
> > > > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> > > > +						  const struct xe_hw_engine *hwe);
> > > 
> > > ditto
> > Will remove.
> > 
> > 
> > Thanks
> > Harish.
> > 
> > > 
> > > > #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > index 52c7df4c3afd..1d4efaca110e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > @@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > > > 		       FUNC(xe_rtp_match_first_render_or_compute)),
> > > > 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> > > > 	},
> > > > +	{ XE_RTP_NAME("18041344222"),
> > > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > > > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > > > +		       FUNC(xe_rtp_match_not_sriov_vf),
> > > > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > > > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > > > +	},
> > > >
> > > > 	/* Xe2_LPM */
> > > >
> > > > --
> > > > 2.48.1
> > > >
