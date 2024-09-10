Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4519DEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 19:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262E10E906;
	Tue, 10 Sep 2024 19:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NykuUkMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF4810E906
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 19:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725996791; x=1757532791;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=NykuUkMcuL4oUDUTs8MacXPP4GRIHpNErG/RhmBIhjt1DYglxgr2+LgM
 HptGCk9wG/r9SxYDdnoGrIDAzfoGplcaHlpGwNA+pWkfa4PTUkQv0qU0W
 /xyHly4Q9PbyE9vs2rr2WnAYojoCGRMmWn4qCadL1Nm+73GuItvcEi9lk
 ZGWh+Z+oM5o2kqtG+jHhVBcMEobaTwywaT21HPVW5SGSFeMizOiirknt8
 jrJs+XaFDnN731hsbTHnXUHtkWMdMLb3bEniJxVMCou/qPzinil/ZTSRO
 IMGO91ndyCxcqazoZ5nYZcAzmKjo0JbXXZ3Crn5a14yVxBASMxJxteFiL w==;
X-CSE-ConnectionGUID: hoS9rAO5S467axoUa5m0FQ==
X-CSE-MsgGUID: NESKYsbRT7aiGE37wV+XBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24643714"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24643714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 12:33:11 -0700
X-CSE-ConnectionGUID: /doZBqHcR9G7CM0mo7TFlg==
X-CSE-MsgGUID: QawU8QWQR8KPMEfXbfHfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67425044"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 12:33:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 12:33:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFEXUw99PnfvkM8JZwx61/hSmqUu1of0uhdP8ird5Hi2mlubwOlQL3SNzDyFtPpLb3Zfxrci2ADegfWHWF1M9sjODvVWMxYvfHxDQL7ZRzx9sR2RqLxN/vqAIIdY7KY96qO0fg12hYvEpz111UowqXdGgQRNTutX86GkP49DnaTwDdiHkVuz6EYmUqmVg2n8rTxUBuUjC73v5TSMk7TfEpyIurS5zL/+WMCq1twFO5YJt2pjJCaur2HUBFpTYgV2wLB4Q6IrZxcgNnNruWcU5WrP5p1ysbI31kiekyxZEZkSSp0PqMug5VK6JZPMULGtbGZZdOpi/dE/kmTFzy9E1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=EmvkEBv3sakaMFXsVetLIVFWKu8bAcqnjhl4M+Ia0+nPLQ8iSwqWh1JFPIn8sE69cJCX0zgr/dzmx8nIxlWQn3bzxRAjMXO0cWdyUc6LB9WtQMMmjtI24w+NMYWtPeasTnFlWTwwoQhiT5vHyDzROPsL4nFpwM0gQwrSF3wgXjvtsvId4nNxZ7WqfIMmemT6+Kg202i1U4TtBoCm0nt2DsSiwTk3k0ZRbo650hUO3vSl/1oXYA4h/J+fwBTvpR9gut89UNQpZdzlUwkxzBaQ0gKr2XKizwAc3+EeAErqibsXOQOSdWcjLvLXlAe3tAmZ2Nbgy9uLleAH1W9JlJulwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 19:33:05 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 19:33:05 +0000
Message-ID: <5d55ff82-aafd-4bbe-a1d1-78090364a13c@intel.com>
Date: Tue, 10 Sep 2024 12:33:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] drm/xe/devcoredump: Add a section heading for
 the submission backend
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: d53c659a-d422-436a-ce2f-08dcd1cf64a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1pCS1dNS3F0MjNzTFJHa216ek5ma2ZBUzZ6SVpTNHF0MDRqb2RtSVhaRzZX?=
 =?utf-8?B?ZGUvbjZyMElTZ2pTWkI1eHJJWmd0c1phaTZ0dVRFVm9ueXdsZzg4dm5WckJS?=
 =?utf-8?B?K2x0MzdpbHpOWFB1ZlgxQUczTGNwWjBXNXhRVHNpcHQ2T3NSbFJYLzJLK2ky?=
 =?utf-8?B?Sjg5NTM5aXFsa1RFaUtpNklmNm13OGd0NlVNRDAzTG9yclRPTitxRmZweXNs?=
 =?utf-8?B?aG03SmpnRGtoVjRVWDRhc1c3Zm5aSSsyZEQ2bE8zS3VVcXB3WG43SVhzZFA2?=
 =?utf-8?B?eE1oY1YwTDRxTW1WaWc1N0JYOFl5NGo1TmFVTFY2M0JXeUZMdTh6ekRrS2Z5?=
 =?utf-8?B?TTg0bFRmT3FqVG9DdTVCN0pVZXB1dUZLeWs2QzZHMnVOSXIzMnd1YTM1aC9P?=
 =?utf-8?B?NVZ3SVZHN0dXMDJBNzM4SitkTENZVnRQc2Vobi9mWUFxbEI5ZUJjSUlEYkZI?=
 =?utf-8?B?OVRBTVN6SFQralhCUzRGWlF0aVFnTld6MzBnRFZmeVJHaTZoUyt3a2UvdmxZ?=
 =?utf-8?B?MzBPeVRIRG9VcFk0WW43NXo0aWFINVhuWHlFZkdHb3ZHQjN2WnJkZDdZWjd1?=
 =?utf-8?B?ZVhpY2JGTlhEVFJBS0VzL2tBYUUvK2dTamRGRmpPaTBnZUVXL2ZtSEVFWCtJ?=
 =?utf-8?B?c0hTN00yNkliWEtwSGJNUzdnM1VDSjRRU0tsR1RSR0Z6VUxMVHNqY3ZRRlA3?=
 =?utf-8?B?NEh0clVBZEZoRzhtZjIya1pjajJrMjJGdW1rK2hPdmVJNnJmMTlyMzhicmYv?=
 =?utf-8?B?RkVjZm4zak0xeUI1eFdvYURmNVBwVXc1QlViYjNzNThlTlJad2M1bE1tYVRP?=
 =?utf-8?B?UXMzcnlzSzdheTVCVVRjcWJBUEVZbG1mWjNjSGdOVkJ5SzFrM04wWEZmTzlh?=
 =?utf-8?B?N1VGSUtvc2hINFRrVys4cU5HT0VmNk1IQ0lkMStDcnBDZlVMMWVBajFqa2NF?=
 =?utf-8?B?QzIwSFVHVk1xeVJ5M0hVaU1Pamtva3VxWmVKSmxjL0VPOFBvZStqSlc2bDh1?=
 =?utf-8?B?QWQ1U0J6U2JnNkZCMzBneEcrUWlWblY3R2NhakNneks4a0k0bzBBZDJlVUJO?=
 =?utf-8?B?V1daUlBkNFM4RlVtNVdtdi9iOTJLVzVVUEN3TGYrU2hGeTI1YnBmUjVqL2pj?=
 =?utf-8?B?UG1UTnpnR0o0ZTFxMy8rSVQ1UFdJOU9kbFpLNnlRZmVpaCt5L1ArODFvZ1pO?=
 =?utf-8?B?MnpZaHMyRmlaL0t6Sm8wTUxPNVAzSW5pUmJKWUhwVGp6R0Fzd25NN0U2SUJk?=
 =?utf-8?B?WHdwVmpydFNKZ21GcnRoWmtwTkZlK1VFczAvZGRRMVRQall6eGdWM0d1M1lQ?=
 =?utf-8?B?WVIxZk1HZ0JtZDdiaERBV1NRTVA3NkFwQ2V5UDcwK1YvZE1VQWV0eGtkVUR4?=
 =?utf-8?B?MjA4WVJWMEZyb1RhRUQvczlJa0RPa3daWlp0c1B3bVNQcXlwUUZlSDN6emhE?=
 =?utf-8?B?RFVyZGFCaDN0SUJKN3NJVTJZdHNyNXJnTVZrVHNXRGd2L3gxbVNiMnJmeVcy?=
 =?utf-8?B?R25nSlI1RThGbWhETmFVZlJTa2xsVzAzc0wyUGt4SWIwdExHeEJrQ3BYQVVP?=
 =?utf-8?B?ZVJnNlREOTZxSFN6TU5CSHMzL1V2TXZ0ZWNOVHJPSnpCS1RGUlhCZ0gyU25C?=
 =?utf-8?B?RTZ1Z1gwZEJNbkZtY2JJMjA3bzRNZTdRNlRncVQ1WjJhM3VQY1NDa2MvYmJZ?=
 =?utf-8?B?d0NTN1lPeUIxTC9UNHNsRERtbTVHV2JFQ3gxZGpOMldIOVYwZ1B6aUZaM1k3?=
 =?utf-8?B?aEIxcTdpWmJ0akNoTlF4cTdNWFdTM0dMV0RyVi9iNDBNU29GMnJwS1ZRZXRn?=
 =?utf-8?B?d1dqRHl5V3NSaGRPNmdkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lTVndwRC9CVm1VL1lCclo1NnpUN2ozT3ZaaHJ1TXkwVFN4VHF0VnZiU1h1?=
 =?utf-8?B?TUR2NElFb3lHNGJIVG9waVhxRHRiUzk5WVpKWFo5b2RGR2RkRzc2dG1JTkZo?=
 =?utf-8?B?RWdEOHBrN21NSTdyc09EYk15R0dMYWFTQjU2dFMyTHdkaFppbzF5cTlNZWd2?=
 =?utf-8?B?cXd3YklEd2pua0xkR3lqd2pTYVJVam1FbmhiN2ZsbFIrMlRZVG1OeWZndHZZ?=
 =?utf-8?B?UHpzZVBsaDNtVFNBYXpmcHN1bVUxWm1KSjVxSEpnVWVqRjB3ak81RzZVNU1k?=
 =?utf-8?B?aUU4M3M3YTFyUzNrSDFQZ3hUTUxYaHJMd1JNYWV0QVJiM01rVGZDR2tPQUdC?=
 =?utf-8?B?MmtSS0dLOUVYUnI0bmtzWklVNy9ONnBtN2tkMEZEL1Q1RXJqU24zMTUzSUJn?=
 =?utf-8?B?TkZ4MkgvNVdQMHcvdFJ3YkVlUnhSOG9obEhxbDJlQ2xjTkZBYXNkaTRMdktL?=
 =?utf-8?B?U0RJNHNVUEhLNENCRlBzKzN6RFFaY2U1ZzRUZ2pMYzVERjBoN1JWYjBwZXJt?=
 =?utf-8?B?K2NhUWs2ZUcxcWl5NUlrcWYwa1ovbGhJNHI3SnZTNldxR0VHY0c1YVAyb25l?=
 =?utf-8?B?amRpZWE4cFd4VmhpZWFPRWxDRzBESm40dFNQNXM0VjdDTFozTDUyTERBdHNB?=
 =?utf-8?B?UkVHRVo2V2dsbXh1VXZPc1h3MGl1cTJqZnVmcUhiVTlucXBzaEs1T3dhL2lx?=
 =?utf-8?B?Vnk5RHVIUkZwbTFmdjlaTzVGSEZQMTZCaUtXQ1VDcE14TGNzOVZBZzZsSnlu?=
 =?utf-8?B?YUI5U2p1VEpJcE5kMXdxa1JESVVVVGszV0ZWRGFnR21OVUY0TExuM1pzY2g4?=
 =?utf-8?B?Ykc3WDAwZ0hWQ3hXTTZpMzFVVjB0OUZwMmFzZzdKWk9PRm9WWXVMMWRCU28x?=
 =?utf-8?B?cTJVTlRzRCtOZnIvN1hIU2pIclNUYUhUWkxvcVkrM3dtWEc3NUtFQ2wwajVm?=
 =?utf-8?B?cG1VLzhvQUE0L2FLcXNUVmRkNHZRQ2Ixb1FqY0NvWVNEZUN4NHp4a0dRd04v?=
 =?utf-8?B?ZUVjRHBwRDlSNi9JclNXVXJ3SXZEYUMraENJTTlPM1V1bEdKMWI2SVNYTXlX?=
 =?utf-8?B?RDdNbFVMRm0zK1JMR1lSTHl0VU5uVDRqWWVKRUxBOFR4a3NrUlFmdmU5a1Jz?=
 =?utf-8?B?Wk5IWjBwVUxhd09TREVoWDY3KzJ1UEJ2czNtK21mSzBvamtWbzZiTW45dHVr?=
 =?utf-8?B?R3ptQ1RHTldnMG9NRnhjK0FYakt1YmUrYWFQYUdMRHNlWVFPRXVjZVhmYmE3?=
 =?utf-8?B?c2tUajdQNGxRTStPME0waDE2aHZ3ajJBeVNZN1E4aW9oSFRxNElPMUJaSkFv?=
 =?utf-8?B?VnE2U0dSNmlBL21wNmorSDBYTHEvN29BUmFXeStWVEdkR2x4aWVQZkpBV0hi?=
 =?utf-8?B?TmZMRERlMG5yYzFPOFJReDRCYVFFV0dzYjZLQVRwT09tZGdvems4QW5BK3Vq?=
 =?utf-8?B?SXZJZ2ZpV3pSS3VIRlU1TUJISjF2b2tLWk9XRW84UjVFOWRVUURCZW00V3lC?=
 =?utf-8?B?YjVtb29JOXhqdVozeTZkWUUwV0xSbVdLREZnbmxRL3BOcU10dEgzV21lVUpm?=
 =?utf-8?B?d2pscEc4VmJUeElKTzYxd0NMMVV5a2p6cmFRZ0FvdStIR0hrd1oxcitNLzhq?=
 =?utf-8?B?REJPN1hXcWhiNTRaMm5nNWdHYllTVXZaTldkMDVRS1c1ZG1LV1cvSUtnT0o3?=
 =?utf-8?B?eFFKZk1qeHd1OGovVHV5bHEzbG96VUJ1eFBSNVV1SExPd2ZrYlliQlF3S0l5?=
 =?utf-8?B?T09uRnFUcTloRnBoaVNOZytyNUpZeUlVWnFCQ1FYb0hmOERvQXk1MkQ5bm1w?=
 =?utf-8?B?TXFRcFFaOVJzUkQ1QUFiZC9LODJId3JvOCt2N0x6UWdZOFQyYmhXTUM5NlhD?=
 =?utf-8?B?UkpQeEZpUGJzM2orWWZRWWdjK0E1SDVLYm90N2hnY2krQ3BJdG04cCtwbEha?=
 =?utf-8?B?bW5hUUJvV3BEb1M5aXd5cWFKWWNnZ2tsQThHYW9XSUxZalZPSk9JQXNPYXRG?=
 =?utf-8?B?MUI5NjFZQ3hvVGpqbWJyWURHdXVwL3BEMnlLSXoydlRuYlVBSUtYb29IbW12?=
 =?utf-8?B?alF0SUUzQU5rcXp2MTZMbzFQSXdaZXhRekRKTmcwVHBheEhNV1lQeXhDUjlO?=
 =?utf-8?B?bm90bWxtejVxRDB2aC9sV24rMGZHSVlsR3JFTzF3aFFtYTlNOXFGcGtiTVRZ?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d53c659a-d422-436a-ce2f-08dcd1cf64a0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:33:05.8497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA36cV/xZwiEazPRdURJgxO5EpIR+b0vp6i1MTCL/kARnv+rFrXFxcgRu3EDXYOxVWZqC+8vHJQXpdLoyzo4JvoFIQZKlrvQrYYZ4+XEVVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
