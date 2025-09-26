Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7BCCAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727E10EACF;
	Fri, 26 Sep 2025 18:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EvZfDzWV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135F10EACE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758910243; x=1790446243;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n9l5iHm9/7jP1hCTfSzr/zTk22dGhzRSqq7sztngIFA=;
 b=EvZfDzWVAoOMyPIo2hfWbAeuPDuQDECF5XIn1Jwf7tQClZXXEKP5OZFL
 y97Ah0ZR0W5OqeLHrirsyXwmlFO2AY81Et7rkMCZ27JFner2qF1DbNhAs
 eN+9twLKAj8Z1v62W+AqjRW8M3vEZNgQE5PuMTF3ZWPZOgTiSnQmkY4VZ
 5tHGmyad3vvpPHzgionusTEl7Z5RZgconHoVhlW3UqZdpQfD+tO3/teE/
 dwpQJKRLpd8ExkVoja0s5957IY4xPhfNKrHf9kJSeS2nUBqZb7gf6plsW
 parWqYvgEnQesSPZCOw4IuMPmeygN+q/7+4EsGpRhj+fgaSnNRN3b86nC g==;
X-CSE-ConnectionGUID: 3t3/a7CsScSZrvAChaiuxA==
X-CSE-MsgGUID: LNwV854iT+ycBiqQDabeAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61299341"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61299341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:10:42 -0700
X-CSE-ConnectionGUID: UKWdifc2QqWSWx2XQC/egw==
X-CSE-MsgGUID: Fdaf7oHIRT6Gi7Umkk8cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="178086583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:10:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:10:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:10:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh9n/QHi6FCOXjyrjYAaXaFr1dNMg/zvumJsNa+zPmJPjor9nGD3K0sM1ELFYJZOnzTw07IA8Y6hjo+yQI/OgORjP1ghTnusZXK7evwcmoa5G1oYYu8IdV6m9dyuIkncTsHJJUBHEDcDSVuptL7QvBhobee+58qOMV8Qo7QxgqU567qTBmNZQxCeRyON5Tt2HLLbZWnkeJi7Lez3trUXgNsisH/B78eH297ioqUW57nNBOLL2R0Ju9tM8nBjzfHYfCNbxWfyJ+xD0HC3bmiob1kGKhauPLLML8Je6ZoVr1ccA8OYWGjJzOEK8XqWHmr3H12rPAiEqpZ9JOiJNScyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+SBZFllwMLfNpQ6Mxj5JFZqACJsPmxmGx8A1XPMHXM=;
 b=mjcZA1xx8RrK0rv0jzsw8Wlrm2dSjM48no4oXHmdUoU/wUZ+u7t5cMKnNm79PP4Tr/3VDMJXJLwyk4YfFPe9n36p5Wdr5/0+4Lpi3ZfP9yyiuVTOgvLUDhGzB60748bgPOfZZ/V6Nbi3dnGYDZLujrFl4k4NPhhrCS63XFOAkaaroHCavFJzHvFod3fTo2/dGCM5WfCL3FuvjSLo1bA3z4MPo2ujiiw2uVDvDdIecYJk0Spaz90aK2R5pSsd1q3zkobQ/5aZdfROU4VsvYQ37JHsx0u+44M/N93qkuAOvQfSIKDkazry+aXjUzL6XmBXyy3CDur7be/gbA823Xnydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 18:10:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:10:36 +0000
Message-ID: <dd003ac0-510f-4b12-976a-006a7839a1e8@intel.com>
Date: Fri, 26 Sep 2025 20:10:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe: Guard against NULL GT in xe_sriov_vf.c
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-8-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250926155948.145934-8-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: ca51301f-edc7-4c1a-069d-08ddfd27fdfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFBkTUdzMUJPTU1HYVczV05BTWQ2QWlIdnNvZG1rdWI2akdlVnJHclkyTUo3?=
 =?utf-8?B?bjB4d0hVbUFrOTVheUgxZTBtQ21zVDZVcjBIcWFnZFVyZXQ5NzJhVEh2bWs5?=
 =?utf-8?B?R3lQeUk4c1RrTWpGOWh2YzJmTUp3YUVGTXFVaVo3UU9Ub05aRURKR0hoZDMz?=
 =?utf-8?B?K1JKUlNzYTg5MkZDNkxJRi9DZGt1N3RnbU5CSFRYTlBOL3ZINWMwTmRVNmIx?=
 =?utf-8?B?OVJNbW5sd3ZTK0NqMzU5Q3pHKzQrSE8wbWJhVWdHeFQvVDhvNlJraDg5dktD?=
 =?utf-8?B?Ni9QOVBxTHoxRnB0M2RMZEQrZmZ3ZFhzSGRvNjEwQ2hCK0JvT1A4bFM0bFNU?=
 =?utf-8?B?L200M0ZMdFk0KzcvaE91ejVNeDZpdXhRS0Vjbi9rZkxRcTBDWFdIdmZZR2po?=
 =?utf-8?B?QW5hVUFkOEhDVHFQSFAwSEhnc3pQYWVPN0RFc3lKek9QWldmK3lxSDBTcXFT?=
 =?utf-8?B?Z0VEdERsUUREbWNXSkppdXEvQlVtZGUzNUo1K1VsNi8vWEhOczN5VjFLb29w?=
 =?utf-8?B?cGMwMWlvWlZhMTBQWG1ra0trdlF5bFBGT2xSRzBOUnFVc3FtNURmZGp6TUxy?=
 =?utf-8?B?TzFrWURQSDVJMUlQcXc3b1JCZSs1RTI3aUtXWVVkWjd1dUVNd05QbVd3Nnk4?=
 =?utf-8?B?Z3BEWTJZNGY0cDZhR0lVWDB5VzF3N1kwNUxZNVVNSVFIWG5zNVdmT1RZMmhq?=
 =?utf-8?B?OEFmQzdVMlRwZHFtNzBjUlJud3JiUlZGaFNYZFBQYitQSWg0TXdVTUd5ZXRi?=
 =?utf-8?B?VHVpNHdkc010d0lSenFha0FlVW9JUGE3NURObk50UlhOUG53dlA1Vk84bUZx?=
 =?utf-8?B?a0lHSk5rQlBobGNwRmlmVDd4dFJVNEFXeWdpL3NVb0YzbkVBVllPZHlwcmJ4?=
 =?utf-8?B?SWEwdHh0OUFOZVZjMGYvVzJmYTVrQzdlY1RWRGJ1cXdESVR3K3FCK2l6Ym9Z?=
 =?utf-8?B?Z3ExWUhzTm1ZNlZqV3kyL05sTmxlUEp5SzNTVHNXZmlBUFZwL1NNKytpN3Nr?=
 =?utf-8?B?S1JsV1JLcmNQbzBrM20vS0NGZm04YkExTk9aOVA5bmsrSHZ1Q1hyK3R4U1M5?=
 =?utf-8?B?a1lIZGRGZFIrZUZSSjR5eEl3ZFEwcWZ1SG02RjJYamhYd1dFVERMV1h2bzhr?=
 =?utf-8?B?dFdoakgycVNZak0wNk15TFR5V2ozanZCZXo4ckErNWdlU1MweXY3Yzd3Qkty?=
 =?utf-8?B?VDVWQUNSZEFiWFh3b2ttNnRFMGc1U1l1R1ZpRzJVR0x4MElZbSsrc2JJeFZU?=
 =?utf-8?B?VlJ4eUZqaDFTdkIybi92WlNUTzJkMy9FNHhmNjlvQ2hOZDNIUXNBYmNNZWlw?=
 =?utf-8?B?UVAyN1FzTmpUa3lyUENVdVhrMXhQbG9PZGhKZzRYRGhXS0tmU0VlQ2l2bzR1?=
 =?utf-8?B?WENQQkFScUNWYi9MV0xiNFZ4bVNmN201WVZqYUI4VlNmZDlhdUEzaWVEc0Vh?=
 =?utf-8?B?NXludlRuaVJ0aDJRUEZ1OUhNRW8xVVgrUDd0aFgrZkw2UzI0TkMxR3k2REVJ?=
 =?utf-8?B?Tkp2UUpkS1BHYnV2MnlYejFMa1MyZDAyZ1REcnZvK2lXWlJQaC9pc09Td0JL?=
 =?utf-8?B?eXVwcFJXWC9WYlhJbGN0RWNLS0dOK3BGMkpmMGZCTlpGQXZJendtQ1dtcjZz?=
 =?utf-8?B?ZFV4alh3aGRyQTVsOURGZ0t4bEpveit0MStLTzBlTmVqUkVlUU1qY0hBWW1K?=
 =?utf-8?B?bTJGWmZZaW11ZG90bm4zK2ZOVGcwYTRNUUdZZnJaVURUaWpxM3Y4R1YwSGdK?=
 =?utf-8?B?VFpZSTVkcWVRNGpKRVFxZ2trbEpDQ1FISmlYTnJRT2s4QkR2V1dTbVJoZFNk?=
 =?utf-8?B?SUFXZUpWTUJxRmkvRkNVOGZucXozTm0wT0o0bTBSTk5RWXlRck0wVUI2eGp2?=
 =?utf-8?B?SzZyWjZBR0VJWmh6WFBsbDVZa2tncS83TnNqTjY1cnh5MmROa0tCVEJOeVVV?=
 =?utf-8?Q?vwDISzHh3Kj/0I/w06TxBPBwUxlHmCdl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUYvRXZNaXBLdEVhWlNMRzRrRWRjSVpqMnY3TEFpS1UrUksrSkNrZVRvTThp?=
 =?utf-8?B?RGpmYXdIY0thazlsTU0rcjdzZWVpRys3bHlKU1BjdEtYdlJJbGJ3NTA2emJQ?=
 =?utf-8?B?dWtqbHlvcEF0OXVHZlZXY1pqd0xBWUFVeDNFamx0R1FGeXZxcnk4Zm50TGhp?=
 =?utf-8?B?ME84UlZpM0V0U0lXbUpKZC9RY0MxU2NBS3BHZFJoMDg3aXFaWVc4YWdBZE5q?=
 =?utf-8?B?bVM2ZUpjZ20wN01VaStNSUVRMC9nUmRVbGIwWk5HM25oVEFBbnBVNkQwaWQ0?=
 =?utf-8?B?RGhIYnFHZXU3RGFEb25Jd2JFM2o1R25jQkxvajN5Y0xHbjEraUhzQ3JQdjFG?=
 =?utf-8?B?SUQ1RG1PdFdMMnlaWlVyVzk0MFBuT3BaYlZWaU0zN1NPdjRrcnFaWGx5ejB0?=
 =?utf-8?B?WFBHVTlONzR5M2VHOTFyVys3TW1kMWs4ZnI2U2psTWFIVVZBWERRVStaaElx?=
 =?utf-8?B?SU5LNlBZYnlHU3ZJK0FNdjBBWlBxaUc3ZUl2NjUyNjVvT3lDTFJTN0dBRlhK?=
 =?utf-8?B?OWppVXZyUEJrYmhwWFlRU05PbUd1eUVlRXJKUERJRkdTSit5KzZpd2x2U3Qy?=
 =?utf-8?B?NzFIOWd5cHJ6MVpWZ3pFeTBwa2Q0eU9kSC9McFlLaWN6NXhacDBETWZJaWhk?=
 =?utf-8?B?Nko0OC9VV1l3OE94NDVRWkN2VGlVSzNDTUd5bk1QOFV4QnB0RU50RWlaN2Zv?=
 =?utf-8?B?cDJUSFc1ODBEbXhJaHVjaFJDUHdYaG5sUWRQL0lsUTVTL1RXbUx6bFlFdXJx?=
 =?utf-8?B?eGRiQ0hWb1VQOVA0a0hoYnRHNjRpQTNQdmpmUENwaUxIdU9jOXQ5T0dvL2I2?=
 =?utf-8?B?YkZoUFNJQW9zQjljUGRVYkxRc3lCdUdZNVhPRVNMR1pGMG5tTjBISEFFTEI2?=
 =?utf-8?B?V3BMeC8rQ3BVOW5FUUM4QkJYM2txczQ2ZmQxdW91aEdCazdlYmF3LzVzNWtQ?=
 =?utf-8?B?U1lzTFo0VnpSNC94djZCRUszb2tYdC9URXZnT2YwS2pSM0s4WHhuT0hRa3BG?=
 =?utf-8?B?ZzdkRzcra29IeFQxU1VOQ1FpQS9VV2JRNXIyalV1cVVNWVV0eFNSMUJ4a2Vp?=
 =?utf-8?B?cUdhaWJ3ZUo1dWFMM3REWitRcDRKTmRQVldpR0taa2NoNFpjQllFNFQzRXRC?=
 =?utf-8?B?cmhYZTVNaTB4a244TW05d2ppNmtyNXVCeC9wOVcraVk0bGRYTU9oQUlOQUxQ?=
 =?utf-8?B?NkFzU2wzUmdWalhoSE5vOElyUDRBcTFOWjB5dmpacUpKd29tZU1BOVMwakVx?=
 =?utf-8?B?VVFVU2w4OFFvU1NJQTlLZG5PZFhUd2lFRnhHbjZOQkNFM0dmTVEyMTUrcjVC?=
 =?utf-8?B?bmVVdDNwVGY2TDMxRXJydGd6ajhvcUxmNEF2alJtN3JUd25NRnVwUUFvcFVG?=
 =?utf-8?B?NDBlaTFnc1lWaFZ4ZFNwTWVyODl2ZE9JSWJnV1d5bEdXRnBMUFpCNTM4WG40?=
 =?utf-8?B?NTV1NzNIRGsxWlRjbGw5NVd0MjJEMzhvMVRpaFdmaTVCTHRtUEk5RnE5VzMx?=
 =?utf-8?B?WC83Nk1RMHYzSGdDeVlLZ0lPTHUvOFZhK2VGOVIyZGFjczRRQ3NWSUg0ZTBn?=
 =?utf-8?B?emNHa05rbG5BS0ZMZTJ3THdKcC9oZW0vYS95RDR2QTJRem5YNDFGd1BnNUxP?=
 =?utf-8?B?NmttYXlvNDBRNWJUQ1lkcDg4azFFdFh5RTJKY1M0Vk92dnhXdi92cjJ5N3Fw?=
 =?utf-8?B?c1dIMkxRZWNIN2tyK3ZRWGE1cmNFMVVSOWFrNU13UEltRUdBTVljM3cxVm9z?=
 =?utf-8?B?MHVBYjJLbVQ1MkF3Y1hPdjFFSitSdVdyNGxlMG0vOGJJbjFrY05UZ1A1SzBw?=
 =?utf-8?B?a0hmTjhpOTRNOVZTM1NuZWpUVVVpc1ZUUmVmYkJMcm1mcy82R3hRa1ZqNmNz?=
 =?utf-8?B?dFNjRFgxd3EvcjVKMzBRNEZBOHhIT1kyaE5reE12ejFwOUY5TmtHZnlLRUlp?=
 =?utf-8?B?eW5Ua0o1NjFOSHZrUU1rM1FmNHlIL1RmY2FINnZyRmNVa1dQWThtdndvbEsv?=
 =?utf-8?B?QStvN3VXeTNXYTZsVkFlaHRibkEyblhSMytYZ1RBNi8vMWtnUnUzOVE5bjdq?=
 =?utf-8?B?czJ0TmUzWXBnTUZIc2JzOFF1S3hOZEZyMWtKbXV3Y29WWWNRYTNCZU1NSDlJ?=
 =?utf-8?B?cUhUSWxIK05VZisxMEJlYlFhRVBjbVU5ZDYxck1oWndvemtQa1doaFMrb3Vx?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca51301f-edc7-4c1a-069d-08ddfd27fdfd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:10:36.4516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oSSSSAjXpQDVWBmmSox8Kk1pfOCAVdU0rvF5fQffVY+8uiD9HflqdwFN9etJw+LVWwc+TmbNyF/XcmEmh3b1bswBmIK0JtoQ0h0qr3MJYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
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



On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Add guards against this in xe_sriov_vf.c:
> - Use xe_root_mmio_gt instead of xe_device_get_gt for the tile 0 case.
> - Check the return value of xe_device_get_gt when this is not possible.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..28b9c40d79f0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -178,7 +178,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	if (!IS_DGFX(xe)) {
>  		struct xe_uc_fw_version guc_version;
>  
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> +		xe_gt_sriov_vf_guc_versions(xe_root_mmio_gt(xe), NULL, &guc_version);
>  		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>  			return vf_disable_migration(xe,
>  						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> @@ -361,6 +361,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
>  		struct xe_gt *gt = xe_device_get_gt(xe, id);
>  

I'm not sure this can ever fail, as ID it taken from vf_get_next_migrated_gt_id()
which uses the for_each_gt loop, so all IDs are taken from existing GTs, there is no guess

maybe just assert here?

> +		if (!gt) {
> +			err = -ENODEV;
> +			goto fail;
> +		}
> +
>  		err = gt_vf_post_migration_fixups(gt);
>  		if (err)
>  			goto fail;

