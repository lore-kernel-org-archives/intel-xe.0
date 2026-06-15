Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EEDCD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 08:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B7F10E2C5;
	Mon, 15 Jun 2026 08:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwBhMPe0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2C010E2C5
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781513505; x=1813049505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EsZYtVDRRYlLXaB5fe4Tbu5mcL9IxjUBCKUS5r0gj5A=;
 b=WwBhMPe0hlE9JhPRz3Bf2zR9CmwK84dBOnFGcSMcgVlWUzz+KUSPevo0
 gI5lJDlSnbAHpghfBwwjH0x+9rJfbAS0GHEXK/pn3DgDOjx75Tq9IILco
 UEvhNCvPQp4Op8G8AUSYXad0URhPwyTY7M1Qga1OcRobzW66ZgZqCMvs3
 xvcDvxszQ+43XA5YNXHM9xg2przNnHaJTFVzXl33TwD24giGWMUun1FAf
 vlbZbr5uv28TeXhRfj+nVAZ28jJKEJJDT9aUcPFfYC7b1cp9LxxiJ2034
 Sz1caxqnb2Zie4D3nD5sIQCqwJjL/QXOT3N7/lyPrmqHOTpI5bRBMh50B Q==;
X-CSE-ConnectionGUID: N5itoi7RTgGkgxLkBKPuog==
X-CSE-MsgGUID: /QQVdriJTP6Srt/JC+bS4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86146589"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86146589"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:51:45 -0700
X-CSE-ConnectionGUID: ZWMw53W3THe2dHU8R8V+Gw==
X-CSE-MsgGUID: rwm4rDkQRpisWgtV3cusqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252501463"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:51:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 01:51:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 01:51:43 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 01:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZLTMT3k/olGgcjlNb1S6sxW94qv0IQ3WIosaLhV0BEZqYitbcByNWwRepF7vCDzk6Qd/CSF4SXM2oNKwbMYjZE49Vr9OymIcwYZOU8UmdAdL8Bn8srEEz0fU2QULLGHE/qr1cm8DnbJEtU9b4SNswpgoDpcr1JWjWXNz1AUEWClg5UPtJv5S6v/X1w5IuC8VC/QUKWy8zDXE/WthFIiDXYaVmGrSkXnEe7cz6pNsZND30t27X+6GvO6zDcwhLr78E5hM/OfLvQuLoc1wAUIVgqOkK9ulvOGPMjMSE87hlv06dhhKoXHeOW29/nirkhjVL8rltWzM0kJUrakfJ/qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c407bpfBcHEwZ93NEVrU4cU+PnbQDRo1QmKla6IziaM=;
 b=daMblCpJ3EfOGpsusEhUr8YWtgg/8z43biT63fGNfxM1/PYIgy4JhsSrTh05bgBI0fYK35XFh/DV9A38l5i9sMEs5uIpFDE89+3nVv67L+QGOyfQZnF4SLUyqeBY2wwIYuB+pycfYOSjvKDxZVZTaMGA38IkOFzppdX8te1t3Bu9YeptbWdO4fFXvv2FETIPwfJRvvw0dwEuI6+2oPrK+P5Mdw1c8R1ygmNjg1H1uEIzg/sgavOFsKO+AZNWmtuzVHWNH4cGpH6MMvYLQ7rHfi5K+bTVVTtFqPHkLvGfrswdWeFpQl0Hgu7tTtGL8dj4zR7/M9lLOlDpqai43WX4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 08:51:36 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 08:51:36 +0000
Message-ID: <859a917b-a449-4e88-b9bd-e923a8de3504@intel.com>
Date: Mon, 15 Jun 2026 14:21:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: add structured RAS error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
 <20260611091224.17275-5-mallesh.koujalagi@intel.com>
 <33423af2-7e8d-4682-a3ca-ff99bad28979@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <33423af2-7e8d-4682-a3ca-ff99bad28979@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f18f31f-72d1-40ae-b2e0-08decabb4e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|5023799004|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: PBK1YTm+f6gF8a4vdOTDjQK/qNIMI/vMiI0t6D0K6CRK7Gq2HXsoUnSiyChIrO9dUBfghGfNY69M/lZ+QBAWXqTW6j+zPWT18guooIEhtAQC7bH7t+K2ZHA9BU2jpGP/4eTMZJ5UMyDkZmcVVsjuY9PdsbMIg6vDtGrM1I4crscvP4M9l+mxywAx814dULw3htpQW7maQQBqwlytoFc1U3CrPfPOCbs6Zyftgou0U5ot5mKTTkj5oY9GUzvWz/buOWLNrazXs/B3+i/iZTHNH4cNz++Ff2XFhs/stRdBUlCR8zX8mdqbXf25Odo64/FB2VUyipWGvYeKSH01H+WWER3F+PxGhuJnLZt7o5ZFKHamgjexR/twWg1L3x147K7c635sOqVGeKp0dEH+J8XAqaf+jv1sz3pkWUTc3MKq6jG9288dnYbYWyGZiiSMcfBuKoHLUPiQwtzjQPaKt4iVoQIy5MUtcFhGuKJJIgk6jOS25EDSuqGO4RpbYFpLP/RB2vL8r1fn5Jv9VX4OXSGJxujwSAjHe6AsHsQa8j4cAIcIpJF0809rN0cBNqfLm1KW01JGj+nswJsK34kUySyjrsoQitthJtK+7VB+oHeGRkelVXn4IGAKqVnuLS2GXkz/iUJRxVrJXaANAbGXYQbcTxBhQvcyxFpQ3y4Eb/rsD5QiA8zaVQRKhS+COhXKw7MT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(5023799004)(4143699003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ljTGtPT3N6L1hGWVVsUHM3dFcxRE1PM0tNUDMzTGljMXZuS0pHOHpuYnVK?=
 =?utf-8?B?RFF6d2t1clMyUVovdExuSkVJbUJEcDliM1JMNVNUU3ZwUnFiektJdnI3K1k0?=
 =?utf-8?B?Vk5iNG85QkhMTTlYOTg4RzNvbGptTzUyaW5Lb2hJNjdqc1RMc0hTYUhLR1ZF?=
 =?utf-8?B?M2FVa0FCTHl5Q1I3a2QxYkxrSnZxdUYwY3dnY3pCbGdTUE9XbUttWFNnSW5V?=
 =?utf-8?B?MUliZFBxWDFDZnpTTHAxMWk2VHI5MUgwZDFsTG1wb2xpbHFqL2NIbDdUWmFr?=
 =?utf-8?B?ZXdnT1BORCtyQm12bVA0cVlWOW1QSUErMnlQSTlnMkU1WmhLdGlIb01VSDVj?=
 =?utf-8?B?OFRBaWsyZzBDVWdjSWx0aFk2cXB0N2x6Z3ZFYmpmSVJlcTl1NzNBbFJZMkFT?=
 =?utf-8?B?enRFSjRteDdRdnNHQWNYeFpqMFFnK0l5YjBJaUk3bnBwSHpkbTYrdWh4Zjd1?=
 =?utf-8?B?R25VTzlVUFRwTTFKY1lMY0F4NWVNZVJCazE0ajlxc3FLcXo1MlUxVU5zMUtF?=
 =?utf-8?B?WDBzQ1oydks2dHB0c29YcGRuaE9aRVY0SVRaWHRoTHBhOU1kOWNPQ2FtanY4?=
 =?utf-8?B?elVUL3JxTUVjN1A2aVUxUFJnenFRSVBlNTVjai9LS3VTWDIwOTA2MXBWbVVY?=
 =?utf-8?B?YlV4aWFONFRGeUZ2UmRnT3lMMlNGc3dPZUpiOG1XZ2grclBYeGtDY3RGRE81?=
 =?utf-8?B?RTdIbm83dUk1Z3hDRGNENktGYjRjb0QwYUR2dzdwNlUzN20xZkx3SlFqSnBq?=
 =?utf-8?B?WkYxNFRwNW9vY1VkRmJEbkh2cTZLdG0zUkFCTEY0NlNPd3RNOFpOTEl5bWpw?=
 =?utf-8?B?cUltcGs4bEYvWm5kajZPTkY5a3VuMlFjN3JuaUk4UnorTFdiL1lwSUF3VUFj?=
 =?utf-8?B?NkxCdXFiU0hMNnhqdG9oQXNFbjRMcHZzVEJkaHg3bG5ITWdNNXJuRnNaNy9v?=
 =?utf-8?B?NTlac2xWc2xLRFFONU82ejh1SnpGdjdEdTAzTjFvWm9QT05kSEljSWZsL1FS?=
 =?utf-8?B?RXJwMTZTOHZkZlg5YXVZNWFvNjQwSmY3djM3czFyQ1I4QUwzcVdJSDNxb1A1?=
 =?utf-8?B?ZW1hWkxPQ2w2NE5DYkdJbzZsanYvQkpDY1ZIK1dlNDJUSkx0cEVkb2tmVUIz?=
 =?utf-8?B?UXpjak8rZndyQ0diMUl5UWc4UmtnWEpGdDdNU0lYdkhUTHVTT2g4NzgvSlJK?=
 =?utf-8?B?MEJob2IwWmR5cDF2clJsVEkxRlZqUDJVVXN4eWEwRXBTUmFoTm0xM0JmM1Iz?=
 =?utf-8?B?eXppamR2MDdUM3RRdHgxTUZsSEJkL3RldFRPVjNSM211bVdGbFJQbGY1S3p4?=
 =?utf-8?B?cGFPbXJ4TUcyZklyaWM5THJQUFVWVHo2MzNxdkxhZzFUSFk5blBnYWVmZTdL?=
 =?utf-8?B?dzF1b2VuSVhWSWxXVzBnT1JuWU8rZ0tSWTVYcTRaVkJnaW1zcTR6K1I4U29D?=
 =?utf-8?B?OFNIUWVVeDdkSzBBVU1obUllQWhDMFhhOHpvZEkxWDJFZVExSkhySXV3azBx?=
 =?utf-8?B?R1RyY2FmZHNjUGRpRTI0SjNHMkV3Y3d3dWhFN0lnTEZkVm5NYUkvc2UyWmUw?=
 =?utf-8?B?YVNEM1ZTa2w1N1Nnc0Zoc042L21EVjZqRnV4TmdUeStUNno0Z3VUY2c5elNN?=
 =?utf-8?B?T0F4Yi9JRjJtWk4wc3pNMGNZejJqUUx0b0ZBL3IyWUlmaEVmKzA1Ymt2b1Yx?=
 =?utf-8?B?UlVpTmh2RjRySFVuODJjZno0b1JXc2RKZE9VYVhNVGhZUlo2bEZBRVBBTTRt?=
 =?utf-8?B?bnJaTi9KMW9jdEpuUEVJT2w4MWV1Tm9hT0VlSzhvcnRzRTRpRWM5d3FocEpI?=
 =?utf-8?B?S3oyOUowZjdVbHEvSTlyMFRzT1lpQnA2elVQdjgxQS9nZ3kzUXVKMlRlWllH?=
 =?utf-8?B?TTFhK29RRi9yS3plNHFCQlRjalZMUXRhclF5V2dhbkJwbldJVi95Ymw1dkJz?=
 =?utf-8?B?K3dXejVHQ2xDY0tadTJOeEc0UDI4RGhtM3RCblhnUThreVFBaC9xRzRRc3V6?=
 =?utf-8?B?V1RvY2lSRmNIRzVjalB1ZitVUHNXamNIL1ZDSUVwbTVUUndCUVJHWktYbG05?=
 =?utf-8?B?bTd0aHlLQ0RTQ3o5MEs2bUthenBDdG1aOUxWc0plYkRuZElONkRKcDFRQ3JE?=
 =?utf-8?B?dEV1bGpjcXJ3QTNXaXJTSU1EMGVQWDFkamI5T25acUZaTHltS2MrdVIxdjA3?=
 =?utf-8?B?NHhZQTZSYWdEUDJINDlXaG1qdWoxQzRUNjVYWlBqRzB0dlpxOGdNOHp2OE9q?=
 =?utf-8?B?c2p6bEZKRFJCY1h6eWhXTHFpM0tSNURKQ2FZdktkWmRUcDRjU1Y4Y0hwcXRD?=
 =?utf-8?B?VzUzRmtHMmF5andKTU0raStFcy9XR1FGUWQ5NFVBTW5wdTF5bDczYk5Ta2p4?=
 =?utf-8?Q?DyqlfgG0PBF8EwrE=3D?=
X-Exchange-RoutingPolicyChecked: FmVolGiZQCetLXzk5dSoL5hhNsldeLbtYb+0Xlauq50WijHRj8dsWKdu00Q/o5LwsWfL+z+DyPU2zyItu24BaZsLbiGAtABPHhvxP3qL0w4h/14tIduqzsl4kw2qLGEzSwB1R/gw4TNfNCnyu6FrxhsuGwQFgNRx2nXEDlvHUfzEWTByIBDmgTCfP+lGCQONCEOGix21Nq7OBIvrJAiG1Za5XH8peO5Q2tVGYxRlQjs8UZ6K77zqYtrn5IaXzU1s/LG59K0DPnl6qACxpUi13sLrISocT98YKXyapQZv0vG8upwdvAUkgBJQrnsitsR0h+fBknLvFGXrA6iSUemHFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f18f31f-72d1-40ae-b2e0-08decabb4e70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:51:36.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55R4+tohAPwUYt2RRhWAzwhVu9gLBMdXKM9ALBsB26a9nxo2v7Xt0XpMc+VuKKaoTNR8tC3saJOE7cdUOWwpOvR12EeoMGU3tXFzPoo9W94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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


On 12-06-2026 03:50 am, Michal Wajdeczko wrote:
>
> On 6/11/2026 11:12 AM, Mallesh Koujalagi wrote:
>> Introduce SIG_ID defining Signature IDs (SIG IDs) for
>> categorising XE GPU errors, and __xe_ras_log() to emit
>> structured log lines with SIG ID, CPER severity, tile/GT
>> location, errno, and a free-form message.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
>>   3 files changed, 166 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 091872771e98..412be4bad952 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -115,6 +115,7 @@ xe-y += xe_bb.o \
>>   	xe_query.o \
>>   	xe_range_fence.o \
>>   	xe_ras.o \
>> +	xe_ras_log.o \
>>   	xe_reg_sr.o \
>>   	xe_reg_whitelist.o \
>>   	xe_ring_ops.o \
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
>> new file mode 100644
>> index 000000000000..b6a2792b61d4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_sig_ids.h"
>> +
>> +/**
>> + * __xe_ras_log - Emit a structured RAS log entry
>> + * @xe: xe device instance
>> + * @gt: GT instance where the error occurred, or NULL if device-wide
> what about tile-only errors?

For tile-only errors, we still route through the corresponding gt, and 
from there we also record gt->tile->id.

So the error report includes both GT context and tile identification.

>
>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
>> + * @errno_val: negative errno describing the error condition
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Formats the message and emits a kernel log line via drm_err() for fatal
>> + * events or drm_warn() for all others. CPER record generation and hex dump
>> + * are planned as follow-ups.
>> + *
>> + * Format:
>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"
> is this some standard format or just our invention?
The format is based on specification mentioned by Arch team.
>
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +		  u16 sig_id, u32 cper_sev, int errno_val,
>> +		  const char *fmt, ...)
>> +{
>> +	char loc[32];
>> +	char msg[256];
>> +	va_list ap;
>> +	int ret;
>> +
>> +	if (gt)
>> +		snprintf(loc, sizeof(loc), "tile = %u/gt = %u",
> elsewhere in the xe driver we are referring to a tile as "Tile%u" and to a GT as "GT%u"
>
> also, the "=" used here might mess with rest of the items that are also separated by "="
Good catches on both points. Sure, I will update in next revision.
>
>> +			 gt->tile->id, gt->info.id);
>> +	else
>> +		snprintf(loc, sizeof(loc), "device");
>> +
>> +	va_start(ap, fmt);
>> +	ret = vsnprintf(msg, sizeof(msg), fmt, ap);
> can't you just pass va to drm_err/warn below ?
drm_err/warn have no va accepting variants in the DRM API.
>> +	va_end(ap);
>> +
>> +	WARN_ON_ONCE(ret >= (int)sizeof(msg));
> maybe xe_assert() ? but shouldn't be needed anyway
Ok.
>> +
>> +	if (cper_sev == CPER_SEV_FATAL)
>> +		drm_err(&xe->drm,
>> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
> do we need this "[xe-err]" ? both 'xe' and 'err' will be there already added by drm_err()
>
> 	[ ] xe 0000:00:02.0: [drm] *ERROR* ...
>
> also passing a raw SIG_ID number is not user friendly ...
>
> and severity is always present, so maybe just print it without any prefix
>
> for location maybe we can use existing xe_gt_err/xe_tile_err/xe_err macros ?
>
> and is errno really needed/useful? we already have severity and details will be in the msg
>
> so maybe instead of seeing this:
>
>    [ ] xe 0000:00:02.0: [drm] *ERROR* [xe-err] SIG_ID = 123 Severity = fatal Location = device Errno = -5 Message = "blah blah"
>
> we can try with messages like:
>
>    [ ] xe 0000:00:02.0: [drm] *ERROR* [fatal:123] blah blah (-EIO)
>    [ ] xe 0000:00:02.0: [drm] *ERROR* [recoverable:987] blah blah (-ETIME)
>
>    [ ] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: [fatal:123] blah blah (-EIO)
>    [ ] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: [recoverable:987] blah blah (-ETIME)
>
>
All are good points, I need to check with Arch team.
>> +			sig_id, xe_cper_severity_str(cper_sev), loc,
>> +			errno_val, msg);
>> +	else
>> +		drm_warn(&xe->drm,
>> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
>> +			 sig_id, xe_cper_severity_str(cper_sev), loc,
>> +			 errno_val, msg);
>> +
>> +	/* TODO: Add CPER record driver handler */
>> +	/* TODO: Add RAS dump cper hex handler */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
>> new file mode 100644
>> index 000000000000..8abe7554714e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
> maybe this should be "xe_ras_errors.h" ? plain "sig_ids" tells nothing
Agreed!
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SIG_IDS_H_
>> +#define _XE_SIG_IDS_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +/**
>> + * xe_cper_severity_str - local severity-to-string helper
>> + * @sev: CPER severity value (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
>> + *
>> + * Avoids a link-time dependency on cper_severity_str() which is only
>> + * compiled when CONFIG_UEFI_CPER=y.
> or maybe we should just select UEFI_CPER in our Kconfig ?
>
> duplicating whole function looks like a bad idea
Sure!!
>> + *
>> + * Return: string representation of the severity, or "unknown".
>> + */
>> +static inline const char *xe_cper_severity_str(u32 sev)
>> +{
>> +	switch (sev) {
>> +	case CPER_SEV_RECOVERABLE:	return "recoverable";
>> +	case CPER_SEV_FATAL:		return "fatal";
>> +	case CPER_SEV_CORRECTED:	return "corrected";
>> +	case CPER_SEV_INFORMATIONAL:	return "informational";
>> +	default:			return "unknown";
>> +	}
>> +}
>> +
>> +/*
>> + * Driver SIG_IDs
> what's the criteria for each new SIG?
> is it per component? or per category?

The criteria for each new SIG is that when the failure mode is distinct.

It's per error category. SIG_ID indicates the type of failure that occurred.

>> + */
>> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
>> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
>> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
>> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
> btw, shouldn't we use existing FW_BUG FW_WARN FW_INFO prefixes when reporting our FW errors?
>
> also, are we sure all FW errors are recoverable?

FW_BUG / FW_WARN / FW_INFO are orthogonal to SIG_IDs.

The former classify the firmware message itself, while SIG_IDs provide a 
consistent encoding for the failure signature.

So using a firmware-related SIG_ID does not replace the existing 
prefixes; it serves a different purpose.

>> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
>> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
>> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> are those IDs supposed to be stable or can be changed later?

The IDs are stable. We can continue adding new ones over time,

but existing IDs are not meant to change.

>
>> +
>> +/*
>> + * HW SIG_IDs
>> + */
>> +#define XE_SIG_HW_DEVICE_MEMORY		8
>> +#define XE_SIG_HW_CORE_COMPUTE		9
>> +#define XE_SIG_HW_SCALE_UP_LINK		10
>> +#define XE_SIG_HW_PCIE			11
>> +#define XE_SIG_HW_FABRIC		12
>> +#define XE_SIG_HW_SOC_INTERNAL		13
> hmm, those IDs look more like HW components names, not errors

Agreed, these read more like hardware block/component identifiers than 
failure signatures.

If SIG_ID is meant to describe the kind of failure signature around 
those hw block/component.

>> +
>> +/* Must be updated when adding new driver SIG IDs */
>> +#define XE_SIG_DRIVER_LAST		XE_SIG_IO_BUS
>> +#define XE_SIG_HW_FIRST			XE_SIG_HW_DEVICE_MEMORY
> if IDs must be stable than this will not work
Agreed! we need to update after adding new driver or HW SIG IDS.
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +
>> +/*
>> + * Common backend helper
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +		  u16 sig_id, u32 cper_sev, int errno_val,
>> +		  const char *fmt, ...);
> this is a wrong place to define function prototype,
> it should be in xe_ras_log.h instead I guess
Sure!
>> +
>> +/*
>> + * Driver-facing reporting macros
>> + */
>> +
>> +/* FATAL */
>> +#define XE_RAS_PROBE(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_WEDGED(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_SURVIVABILITY(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +/* RECOVERABLE */
>> +#define XE_RAS_FW(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_GT_TDR(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_MEM_FAULT(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_IO_BUS(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
> maybe better:
>
> #define xe_ras_fatal(xe, sig, fmt, ...) ..
> #define xe_ras_recoverable(xe, sig, fmt, ...) ..
>
> #define xe_gt_ras_fatal(gt, sig, fmt, ...) ..
> #define xe_gt_ras_recoverable(gt, sig, fmt, ...) ..

Agreed!!

Thanks,

-/Mallesh

>> +
>> +#endif /* _XE_SIG_IDS_H_ */
