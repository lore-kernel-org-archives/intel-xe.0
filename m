Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F1E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C00D10E04A;
	Wed, 18 Feb 2026 23:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zo9Jx7QB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DFE10E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456510; x=1802992510;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2cBs3CaCLhYUaDTHBoID+kwhNdjvVotpxRISSqFdy6s=;
 b=Zo9Jx7QB1r1Pu3mSAZCq2BGtG9nIOmVMBNRqfc0LN7wFSTO5nve4KQvZ
 b4h7m5+32fcyt6wQFAUq/Dyy3VdfoDiDziOtuKqvS/oUV7XglKSUAp3mN
 yzfH03pKSqz9/p7xGKDIpX5e2vkdYpGDpDGVmtbSV4gEkMyiM5ae337dt
 Py8O/pp95Uh9QsJXBi97La2IIh08bKrQMWfzvMOgu2X4wYiCvuOTOyfmr
 70/Lw6C5OQiw5uZf6ritG7QEEXDiTbL0aeXS52bfk6gmIGr3ycoOPHE01
 CaW+dXv3K3X23bpo5oE1Ho5DRIuqaCLMevfLDUGlRq8HdE8dg8nSRAdqp w==;
X-CSE-ConnectionGUID: Tygtm0V4SHmQ6fuPtdB8mw==
X-CSE-MsgGUID: kdcnCAlCRE+kz7nI5qdcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72430178"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72430178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:15:10 -0800
X-CSE-ConnectionGUID: p7PBsBL7S/qDXB2yQO08EA==
X-CSE-MsgGUID: PBlf6WlHTpWrJeYXCwUgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218871084"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:15:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 15:15:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 15:15:09 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 15:15:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfBbNkw33fRGpxymUuFrnphJYazBC7eE0QwO1hI8GG+AlDKrjtG2OXiT3jEldZrj1fi2iWT7lCgDnh5pvAwjWUIYfjv5/Q/cgn8UfaB0nRlnN/e43VAnpO7MjubYYuzlCUUqqpKIV4gqgntmGMqwPB8W5kuwYefCDQIeznanwh5wTbPjW1UwG4xCQr94P8BiUIMTY2v7xArYlX0r0PXvMQSn0ZY5hcQtigAImGYGxpqnPaL4TDx/GP5YURZ/wAF19NlOw1sYIDajDfrTSBam07t5xiLtuquOtxjR6E8cmx4ypr9ZQkd3ifa92rSb/kTdTG1jypWzyvVW+lg8/CHi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RUApuZu7MxCfdlALqGhYdsE7hD0A9TgwnuX1AfDJtM=;
 b=FEUVx1zWeM9UlPPBPCL4c2iHLaT3gBUkGd4nhATjpJ1i7cKR+UJUXLfUfO5FvxSs21KvLCFmXRRtnybFX4JGbWdHGwZxYHvHTZWu+newiA+PfR8da/6gj3DVbTx9Nfdg2OKB1ivDmyRPaGbbD+LKAtto7nYRHNed+d8Hshg6faNUnIecsRTXlE5aKjKnvwux5Dm1SThIBiI+7yfQp7qptKy41QK+3V9qq362tJv0U0Uc9m2x8CXJ2HBm4a4WuXggIOLIfO7sZI9Wn45mjAKHUnJsXOtx+WMffdV9c3+yXemJXnXwDYGeTQubtbC/F2JXnKmrl9lxj8aJd76nCsEBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 23:15:07 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 23:15:07 +0000
Message-ID: <f757d270-6f9c-4f61-bdec-67fcefee7adf@intel.com>
Date: Thu, 19 Feb 2026 00:15:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/xe/vf: Wait for default LRCs fixups before
 using
From: "Lis, Tomasz" <tomasz.lis@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-4-tomasz.lis@intel.com>
 <aYYu7wFpES1UXoWm@lstrano-desk.jf.intel.com>
 <4f63d446-fe21-4c71-82a4-aef5c7acdcb3@intel.com>
Content-Language: en-US
In-Reply-To: <4f63d446-fe21-4c71-82a4-aef5c7acdcb3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::27) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aafe2eb-d2ba-4be4-3cdc-08de6f438e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW5QNlhQTFgrTWx2UzNRUW9GVTVGMFY2cFFFOGdaWnJ5elJ6a2hFNXdwbzFw?=
 =?utf-8?B?VHBseW1veTBuakJvM3kzZzNBVVBBdFc4NEJwbENvMWovYmtScTVOR3RoSnFh?=
 =?utf-8?B?eExKYkJiNjhZSVZtYkZ3eTdhajFIZUg4bjcvSlc2RDcwbEhWZWs2U1lkL2lE?=
 =?utf-8?B?cjJXdmNVaXRrS0JDbjBRVTdjTGlod01mUnFxcXlBL3FsTTVORThMRUZWcWxM?=
 =?utf-8?B?MTVQL1BEaytpOS9RRkdwRERnR1NsbU9Ia2ZkUzQvNm5NbXFGdmVjaUxCZjd5?=
 =?utf-8?B?bnhaZTdxTGt1UytJUURkVFhnVzBqaGtHRWtDZUhBU2FoT2tWUW9Ja2UranM3?=
 =?utf-8?B?ZTAxRmtmRWQyMXF3enF4a295Z2J3aVp2YmxGNmc2Z3pvdndMVER6VTRsYlJH?=
 =?utf-8?B?U2xqMkdadmo4V1NuVWZYeGRaZXF4SC9VOVZFNFFsb0F6ODlSN2owcGFaTDhK?=
 =?utf-8?B?c3hQVlMyZ09IeUkwK3JTV1N0NjhkRlNkbkxnaDlNZDEyWTFRNmF4cm1kUDdl?=
 =?utf-8?B?RTVUeWs5RFI0UlRNWU1lcGRiaUtISldMaWhwckRwL2x5eXp5Z1ZpQzdySnow?=
 =?utf-8?B?T21teWR4NVVBT1ZPb080RFZRMVdSNTlScC9qcVFQL1FjSUhUc0cwMlQ1aTNm?=
 =?utf-8?B?WjZ4OWhGeXFKOHYyRExUenJZaTB0Nzg1bEZsczNML2htQlpWMXNVYUZENDl2?=
 =?utf-8?B?ZlQwbDJMWTV5azNpYUJ2YVFNTmk4TDl6Sjh6MkRCMGxlR1ozS2ZpQW93Uk1T?=
 =?utf-8?B?R0hrWUtRWGgxejBaYWltMTBIUDdSNEtKUzZRbTZvWGtZOUlLdHloUHNLdHBT?=
 =?utf-8?B?K1FWdFdTbit0ZzNXZ2UzdDdZU2FnV1U3OWF5NkNBZU1NOXZKVlJZa2h5aEM5?=
 =?utf-8?B?KzdVQUovVVkvcXhMRWdkNjVUcFVzYUhZOGNiZTd5andYRnNyTURqQ0lXSEk1?=
 =?utf-8?B?UFdhbG9ycG92em1sUndoTGwrVkY5cDgzdjBoaTV0TDhBRVBqaUxUK0pFamU5?=
 =?utf-8?B?MlZKVEpsZFhxSlVvSDFzdzlKZzRjdXVaWGhpam1rWTRlTGZhaFI0eGVGZkdC?=
 =?utf-8?B?bElybWJEYWowbTRCMHE3NTFDVXh5NEw4Z0d4ZytvaUpod2RGWHR4QzBZSlM0?=
 =?utf-8?B?QVVwQytlT1hUWnE5dWJXY0NNY3I4M3gxR1htajVrM0xSV2NoSk1xZkJaOHo0?=
 =?utf-8?B?ZnJGUUFPRnNuY3BHeW1EekJmVjVWMEUwWjNnTG8zWXFLKytqbFpRUWxpajB3?=
 =?utf-8?B?SEJhclh5RWRHOGRMeTdkRnI1N3FTWjhkU0ZocHduNW1FSkhMSEovdloxaENz?=
 =?utf-8?B?WU5RRENoNVY3TndXYnUrendkTzBjTE1sR1djVUlLcFlEVStKS0wyTWk2YXBQ?=
 =?utf-8?B?Mk5BQkd3WEljZ25xQVN0NGZlcDA3U3BOY3g5bCtXdTFLWWhIa2w1dDZUQlpk?=
 =?utf-8?B?MUxsSTR6WkdTTGdkRU9mRXJnc1Z5QjlXN0VHenY3dzdnZ0dycDhKOW5DdGw1?=
 =?utf-8?B?bW05ZlZBSkVwZTgvc3piVTRCckh3ekpYRml4QjB0UENvVFRKMnhKMGtJMWhU?=
 =?utf-8?B?TG0rZWdCTVBRbGF4cVQ1a0pDT0lGOFBNNlRFRXk2ZkpNbnluNDYrU2VQRkdY?=
 =?utf-8?B?dGlnNXVqeWc2WHMwSWNHUXEzSk5QQllYZ2ZWN3NkRGRSZ0VvT3k1K1hVQU5V?=
 =?utf-8?B?V05HcS9ZRTludklaNlVHZkMrV0R3blhpOXVlRFROeW5JRlF0VkJ4a3pHVDA0?=
 =?utf-8?B?TkExV3JQMExQN0hDUGRuODNiYks1clRiRDF1cVErNC80OS9kR0JmQ3pVcy9t?=
 =?utf-8?B?UDFrMEdWYzRTb3JvWWlFcytBRzJ5eHlzUm5YVXRFNjFRcHdFd2w3TTZyTTJr?=
 =?utf-8?B?Q01acWFUVlRqdk5MSFRNZTYwcW9OZCtQN001b3pSdlhkWnJhZmRNcjZiNmRk?=
 =?utf-8?B?dTAwdXkvOHh5Q3o5d1hOdkFDM1RscDN2RVVZeDNscDBUYTZQTnh2QW43SkU0?=
 =?utf-8?B?Tk9GemhVMkF1a0hDZW9QMzcxdG9wTWxoSE1POEJpVjJnWmxqRE5RVzNjTzVE?=
 =?utf-8?B?a2ltUFQzNGthbElVSERuZDM5WEZzR2t0ai8yMHFqZERZemFZeW9naTEwOW1y?=
 =?utf-8?Q?rYeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFc1Z25pWHd4L3RpSWVrYnRSNUtwRU01UFJQOU5SUG93R2JPNGx1blA1aUVq?=
 =?utf-8?B?d0tvS0lpZXFYeHVHMGFvbnZMM2hhN1BmdzBZV1NqWjZlTUVVQTBwNWV4SW1J?=
 =?utf-8?B?ZGJmK1F4dFVsWm9TMDFUZDB2QjJmVzVtZ0ZoL2R0Q0REeXJSWkdyRHQ5U05n?=
 =?utf-8?B?YngvU1pXNk0xU3cvQXlHZmNGV1JkK0ZKWldvTkhLb1JaSkpqMWhDd2o0ekJv?=
 =?utf-8?B?b28zWWp5WEVUT25CY3BDYTJiR3RRcU9tSFFMK1BWVnZRMDlhWktQZzRITDgx?=
 =?utf-8?B?bzhwdjFGUER0YUxjbVB0OW00bDNtcjZ2N2dYNVRYS1Ayc1Z5RU44UFVZamdL?=
 =?utf-8?B?NGFxaGs2MTNHZTlzZUQ2eWVrK2dxcVYrSysvcXowazZjaDdxS1Qxd0tVZTNr?=
 =?utf-8?B?MzF3bHJPTUtWb1A0S2MxajRYWEdybUt4Z2x2SStqa3dJT0NrYStJSnVBTVU3?=
 =?utf-8?B?U2tqVTBPcTdNS3JuQU4vRVV4NU9NSWlxZkhlVHFralhRY0NPTW82MlBKeDUx?=
 =?utf-8?B?ZTJNMWpiTHN1REcrOEc3OE1rUUQ0MGFxRGRueFNtNjFtajM0UGxVZXE3and3?=
 =?utf-8?B?YnphbjFYNi90c3lIYUR3K3lRL1JHUy9GNkxoRys3MzBSQXhGSVdCWjl4YUIv?=
 =?utf-8?B?UlkrNDMwQmR0WEtPNDcxODdhNjY2NEMzbHBvTE9zZVVBV3RoNFc0L1pGRGVZ?=
 =?utf-8?B?WnhSREtCOFppd01yT0Z0U3RISXdlQ0RjVmxiUXM0QTZZMkFHcXQ0ekZJeTJF?=
 =?utf-8?B?ZCtlZHVnV2orY0xRTzVWQlVQUDk0Z09YR3UwOWR5dU0zRkxnUVFGZVRVRDA2?=
 =?utf-8?B?MkNGeEoydFBvcitkaWlvK1RwYlJoZ0NiY3NzNHplT2VZaW9qR1hsRzg1SkI5?=
 =?utf-8?B?V3ZLeDVZOVBqbjI3ZU51L0drcnpnY1hleFpYZ0M1YWNRdVZ1TmZmSStaMDFl?=
 =?utf-8?B?RVRqS2xYUmtPZmx5MWhTaStnd1BwK2tBVS9ucy8xMnV5aGd1cTdzbHVpR2Nk?=
 =?utf-8?B?ZDJVZ1BJTEpWQm11Z3RLYVFKOWdqaHNXNkFOWDR2VWZhWm0wZEN2aUtXZ29K?=
 =?utf-8?B?b0tBWWduMkYvdzdpd1ZiWCtsdnE3TDNERnY1VldBTWVpVUlJUVBEdG5JdFdt?=
 =?utf-8?B?TEdCcHF2UTRuWjBUbnUxM0VIVVdENHZlYWNuNXB6c3phVnA2eVhvMTg1TVU3?=
 =?utf-8?B?MnR4a3FsMjI2UXRFMmlzWGdocUkwaXZCTExUS2hWUkt5ZkdpV3A1aGUxMU9n?=
 =?utf-8?B?Z2xBV0s3SmMyRnFqdlVGL0R3UGhwNmFtN1NvaDRFVktxMHdLUWNpdDhJSElJ?=
 =?utf-8?B?S3VUaG1SNHpsL0NDSTgzdEwrTVMwQXRlc0daK2taSEtpZEdqV0JiVGcvTSto?=
 =?utf-8?B?RVRmQ2JjdGZIYlZ1N3RFL2d3cWxKekZkbjRTLzB6UlMrN3BuejJsTzhWeWwy?=
 =?utf-8?B?VVhRNTRrREc2Q2NOZkJ2VW5iVHZFc1pLeWNVT2s4ZnNGc2hKMS9vdndTNUpQ?=
 =?utf-8?B?UXNRYkhDaDljWDM0elI2V3NSNWlwcDBXYy9yQkJtS1h6TlIxMzEyeVo2bm1s?=
 =?utf-8?B?YUxxcXczN3NiRXA2N1d2ekpxRU9xRjNnOVVPZW1DamI2Vit2YmErZHRiU2JV?=
 =?utf-8?B?anNFR3B0akhHWDdUVEVIMXZGcWJJanF2ZFdITk9JVW9XWlJUbXdVVk8xLytP?=
 =?utf-8?B?bCtxZU9nNlFScEE2aEhuSHFvTWNzdjN2a000Ym5MNlNGbDllQWdDazZzWkFr?=
 =?utf-8?B?U0h2d1VreGYxaW5yS2x6aVgzdWpjZFBObDk0d29KNmR4L3ZyZDJoRlREdk0w?=
 =?utf-8?B?WnlhalBFYlBENDA2MXlMQVAwY1NTWmNCem5pQUROQnZUVDlKRUx5LzVISDd0?=
 =?utf-8?B?cGdPOXYzbFNkZ1ZOUHpUYlo5NndrZEFQZm5ienZFcVZuS0lNNHZWd3I4bml0?=
 =?utf-8?B?NFlhT3RkRXpKM3h0ZWxuSGV3d0FuRUVid1pmaFo1Zkhkai85TzNkb3NtdGUy?=
 =?utf-8?B?Zng5dzNCZUNzRks4S0l2ZUhKanJLNmhhcWQ4ZEpmTTZUSWYyMmlEWTRtVitB?=
 =?utf-8?B?WmlqcGVPR1JtamhxMUxNcU5hNHlFbHhJbUlFTStYeVl5WGJpU1lFbWRCSlN4?=
 =?utf-8?B?RFcwalhycENMVk15NWJtYzYzdHEvcXVIZHVwTm1oVzhmRzBTL2ROb0kvVU4r?=
 =?utf-8?B?OWNWNDVwdGZVbXYxNkMzMVFZVXZQWnlodWd5amJYaHBUZUJsa2QzOUg5SU5H?=
 =?utf-8?B?U2VVUXU5eWZiczZENnMrOG9hQU9OWVU5dzgwbEhkc0J4NndQL3J0U2kwRlJi?=
 =?utf-8?B?Z1hDV1h2WE8zNUwrcFZRVVZBYXRQUVJGL2F0M1JydFhxNXNmeldpdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aafe2eb-d2ba-4be4-3cdc-08de6f438e2b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 23:15:07.4641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ioxo7h0fR3ghic1Q7acy+lpYVPPdJR86TtTtwH/wiTGikI7UwuvuUZ6J3Wyv0Adnp1cbh+r2hflAWqxFzfmfNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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


On 2/10/2026 9:11 PM, Lis, Tomasz wrote:
>
> On 2/6/2026 7:11 PM, Matthew Brost wrote:
>> On Fri, Feb 06, 2026 at 03:53:33PM +0100, Tomasz Lis wrote:
>>> When a context is being created during save/restore, the LRC creation
>>> needs to wait for GGTT address space to be shifted. But it also needs
>>> to have fixed default LRCs. This is mandatory to avoid the situation
>>> where LRC will be created based on data from before the fixups, but
>>> reference within exec queue will be set too late for fixups.
>>>
>>> This fixes an issue where contexts created during save/restore have
>>> a large chance of having one unfixed LRC, due to the xe_lrc_create()
>>> being synced for equal start to race with default LRC fixups.
>>>
>> This indeed looks like a potential problem.
>>
>> This whole flow is a bit weak (my fault — I meant to fix this but lost
>> track of it). Maybe we should make this a bit more robust and ordered by
>> the GuC backend.
>>
>> Roughly:
>>
>> - In guc_exec_queue_unpause_prepare, if at least one job has been
>>    submitted, we fix the LRCs on the queue. This would happen prior to
>>    emit_job. I believe the 'at least one job has been submited check' is
>>    exec_queue_registered.
>>
>> - In guc_exec_queue_run_job, upon running the first job (hook in
>>    register_exec_queue) and if VF migration is enabled, we fix the LRC.
>>
>> What do you think? I believe this would work, provide stronger ordering
>> guarantees, and let us drop the READ_ONCE/WRITE_ONCE and wait‑queue
>> semantics, which are questionable at best. We could probably revert the
>> flipping of q->ops->init and the LRC creation order back to the original
>> flow as well.
>
> I have a vague suspicion that there maybe can be something more wrong 
> with the LRC
>
> than the GGTT references, if being created at the moment of VF 
> migration. But maybe
>
> I'm misinterpreting stuff, I can't point to a mechanism which could 
> create such skewed LRCs.
>
>
> We should create a POC, then do some intense testing. If it works, 
> then my "vague suspicions"
>
> were baseless. It does look like a good solution, even if less 
> contained to the recovery worker.
>
> Performance impact should be next to none, due to the fixups only 
> happening once on new
>
> context during normal VF driver operations. Creating a lot of contexts 
> to do one, very small job
>
> on each is not a flow used anywhere outside of tests (and even there, 
> the impact wouldn't be
>
> that noticeable).
>
>
> Will work on the POC, and ping you in case of issues.
>
> -Tomasz

I was not able to get the POC work flawlessly. It is still capable of 
generating

contexts which cause GPU hang, though the reproduction rate is low.

Actually, this series also did not eliminated the problem completely - 
failure

rate of circa 3/1000 remained, on a selected set of test cases for maximized

reproduction. But for this series, I was able to eliminate the problem by

additional patch - will follow this answer with a v2 with the extra patch.

-Tomasz

>
>
>> Matt
>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 
>>> +++++++++++------------
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
>>>   4 files changed, 15 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index e9396ad3390a..6eb561086e1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q, u32 exec_queue_flags)
>>>       for (i = 0; i < q->width; ++i) {
>>>           struct xe_lrc *lrc;
>>>   -        xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>>> +        xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>>>           lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>>>                       xe_lrc_ring_size(), q->msix_vec, flags);
>>>           if (IS_ERR(lrc)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 30e8c2cf5f09..1edccee84c76 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -529,12 +529,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>> xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
>>>       }
>>>   -    if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
>>> -        WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>>> -        smp_wmb();    /* Ensure above write visible before wake */
>>> -        wake_up_all(&gt->sriov.vf.migration.wq);
>>> -    }
>>> -
>>>       return 0;
>>>   }
>>>   @@ -837,6 +831,10 @@ static void 
>>> xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>         for_each_hw_engine(hwe, gt, id)
>>>           xe_default_lrc_update_memirq_regs_with_address(hwe);
>>> +
>>> + WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>>> +    smp_wmb();    /* Ensure above write visible before wake */
>>> +    wake_up_all(&gt->sriov.vf.migration.wq);
>>>   }
>>>     static void vf_start_migration_recovery(struct xe_gt *gt)
>>> @@ -851,7 +849,7 @@ static void vf_start_migration_recovery(struct 
>>> xe_gt *gt)
>>>           !gt->sriov.vf.migration.recovery_teardown) {
>>>           gt->sriov.vf.migration.recovery_queued = true;
>>> WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>>> -        WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
>>> + WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
>>>           smp_wmb();    /* Ensure above writes visible before wake */
>>>             xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>>> @@ -1296,7 +1294,7 @@ static void vf_post_migration_abort(struct 
>>> xe_gt *gt)
>>>   {
>>>       spin_lock_irq(&gt->sriov.vf.migration.lock);
>>> WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>>> -    WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>>> + WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>>>       spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>>         wake_up_all(&gt->sriov.vf.migration.wq);
>>> @@ -1492,7 +1490,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct 
>>> xe_gt *gt)
>>>       return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>>>   }
>>>   -static bool vf_valid_ggtt(struct xe_gt *gt)
>>> +static bool vf_valid_default_lrc(struct xe_gt *gt)
>>>   {
>>>       struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>>>       bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
>>> @@ -1500,17 +1498,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   -    if (irq_pending || 
>>> READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
>>> +    if (irq_pending || 
>>> READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
>>>           return false;
>>>         return true;
>>>   }
>>>     /**
>>> - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
>>> + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT 
>>> refs in default LRCs
>>>    * @gt: the &xe_gt
>>>    */
>>> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
>>>   {
>>>       int ret;
>>>   @@ -1519,7 +1517,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct 
>>> xe_gt *gt)
>>>           return;
>>>         ret = 
>>> wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>>> -                           vf_valid_ggtt(gt),
>>> +                           vf_valid_default_lrc(gt),
>>>                              HZ * 5);
>>>       xe_gt_WARN_ON(gt, !ret);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 7d97189c2d3d..70232dc38f9a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, 
>>> struct drm_printer *p);
>>>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct 
>>> drm_printer *p);
>>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct 
>>> drm_printer *p);
>>>   -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
>>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 4ef881b9b662..8be181bf3cf3 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
>>>       bool recovery_queued;
>>>       /** @recovery_inprogress: VF post migration recovery in 
>>> progress */
>>>       bool recovery_inprogress;
>>> -    /** @ggtt_need_fixes: VF GGTT needs fixes */
>>> -    bool ggtt_need_fixes;
>>> +    /** @default_lrcs_need_fixes: GGTT refs within default LRCs 
>>> need fixes */
>>> +    bool default_lrcs_need_fixes;
>>>   };
>>>     /**
>>> -- 
>>> 2.25.1
>>>
