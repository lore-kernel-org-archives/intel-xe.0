Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68342CEE35E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 02:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8E10E219;
	Wed, 19 Nov 2025 02:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8upnVaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E910E219
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 02:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763520515; x=1795056515;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=qORvh097S8d64g6GfFFGmEWVEfKpqqs74S2oYPxjU+4=;
 b=m8upnVaQfT3x8XLQbvwa5WgI4XQG94rF44SdfTzNSPmf8krQuIOUKTmm
 MjrLPtrtSH60piw1NY5iaNUjxe0Ppc72D05/iyWkZwTZdHBtoafSzQcZh
 zxSfAPhsd4jwXiR1ZHD9aODoEAiOipBhg4Iz1b+HgQA5BJdimcukj+zd8
 AmkRNvEnU4uv8d1sjcB2wPGhJYQhbeMY6lFitacIFAmmzKlLbBClLPIvb
 Ax/tvJYSMg7JVeonRJdtNATbeXxHZaM2kIwDgJB5QvFyiNl4wY5d+iFeV
 qbGwd+kAE/88/rpHR8pQQtG2P/oeyqNZLCLuMhVSKYKt7yvCEFQaih7qa A==;
X-CSE-ConnectionGUID: yPFaNKEISYigKs4Yh6rSmw==
X-CSE-MsgGUID: c3Clc17DS1ikfyvHza6jVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69406806"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208,217";a="69406806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 18:48:35 -0800
X-CSE-ConnectionGUID: /xXZKQzRTe2HD+iMkeWWlw==
X-CSE-MsgGUID: I8kWEbN1TsevHtGRI+QlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
 d="scan'208,217";a="190178405"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 18:48:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 18:48:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 18:48:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 18:48:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRhzAM3UjWv7wZhSHj+PCMa/Oh6BoIV6KHYJFSn07Hz6j8C7uxrUhg0hTF6cYOJzOv9n1aeJ5PDWbwL8MUiulqptlSKT09cNF9Ie+JpvxUvjjNmQpcUYV3hB6l8myENomDhsNUbaLeEapLaOCIC6aM4rWo3ORYUq80N5yOZ79euGRs/5evnvlDaBxAnJvEPx9oFf6mrgesEOkaINtC4HBWfrwj5HG7tO1b8urkrDORPLTz9/YivwqaqE2Q5K6FIiQ9BSuV3NGG6gynrhAXDlWDWcP0aF3xEBr3qPWWoNmxG71eXeucpQLe1ddF4lWIiukj/qsGPPnOuluX3PO5WsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ALHtJgbfYiSqCRxl9v48cc/brYFMNRe7ZOMpB9x+vs=;
 b=nKbIt58lGN3qA7De3Qjr74RTrUczoPxtqNn/KTHgjWzkPHZ/pBEo7gily2GTWt6aVyxFAIGdU1jDVM/y6ANH0rfVuCMJYk41hQKeWnYIoMVVnMFjwjjhQ0JRi0JFKe0OylJ5EdRfe+MotJyLvaXR09nr0znvGFMkNrJ6uVQPIIPBTWoU8VNMp6EbBq0RSthip+sZDbdclJ39S9eVox8eVJpKPTVskAzaAixvxbybtC9ui+IAyCUE28iqHklusPxgVByrYFzmTvCzqDoNjtbUgbk5cZ1Dn3BstrWa11v910vDnGV7lpfT4goEdgki4KHhkcBEP4VBeCBfhoMa7r+cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 02:48:33 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:48:33 +0000
Content-Type: multipart/alternative;
 boundary="------------QyqwybwJTPlc6y4IVvTrCoPm"
Message-ID: <28f6a7e1-469a-4f83-8492-94cf9396c58a@intel.com>
Date: Wed, 19 Nov 2025 03:48:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled job
 during VF migration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251031201345.3015516-1-matthew.brost@intel.com>
 <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
 <aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af2677a-926f-4333-9c2d-08de271620d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGt0ZEREYWhLa1VtQ1NQQnZpYVhxU2t0eG5xdmpSbjVDeGI2N1F4dmZxc3JV?=
 =?utf-8?B?cDNJRXhJc2swTVpmdlJ4SGlRSUhsaWtCNDNSaitaM0RkUzNQYWZNMnNRdHFE?=
 =?utf-8?B?WEtodUZFZnFqNVJicng3U3YzQXk1RG5qcitEWXZjUm1iaEU5SkZEYmxaMWh1?=
 =?utf-8?B?QnpvejdhNHphc0daRVpUTmdKVTkzRWdNanE3Z0Zld0hKeS84YVdNU0FzYWMr?=
 =?utf-8?B?SEdsK3pzb3V0QkRMK1k5ZWhRSGRPUlI2OFhUcU9VYzdmazQ0ZVRzQVV1Kzdx?=
 =?utf-8?B?R1JQNUZWbUNaY0tRUm9PTEpkalBmc3FyalJvdWUvNm1jRDBCdDBCaXRCVlRO?=
 =?utf-8?B?S2Yra0Y1bDJ2NUQyb2lleFZRNkxFbUQ4VVBqRU04VWJob0c1VXdhblFmT2l3?=
 =?utf-8?B?ZWlEaUVxeXdWOHVOTEE0WmJxekt2cFB1cTA4OHpuUFRVZzJPUVRqeGhZa0dZ?=
 =?utf-8?B?UkluYndTbXJONXp2dDZpM2ZRK29DTGc2N0E5eDFObzJUOENFN0hGTi9yeEh3?=
 =?utf-8?B?aXVSTTRVbW9IWTNReVFrcjlxbmI5dWQwaWgwSDV0U1UzNnJ2ZlhWYlpMWnpN?=
 =?utf-8?B?QXQrbjl4eDdwTG83OGpaMloyS0xER0V5Q3E0dVpEellOaS95NnVEVXc1ZzZK?=
 =?utf-8?B?UDBSZWpxeVMrdUNhZ1ZTanhxY2RGVnRZTkRLYUoweGlOWHVVeHpiVHJOL0dF?=
 =?utf-8?B?aUdsUXI1OTNWU0ZtMHdqQ1g0UUkwZHRXb29CeVZpUGF4amJTcnEzeHZ1ZndM?=
 =?utf-8?B?ZkVaYkpmcWFkVEFKK1k3aXR3bysxNVFHd2ROVkduUWIvQWNRRzR0TG1oZkhh?=
 =?utf-8?B?Wm0xbG1WU1ROVUlvMk5DTlNhKzhVMjRiL3pJdG0rUGZkWDFFd1FFS1JqVE5r?=
 =?utf-8?B?dHBwa0srRklzYmROTUZYMWFEQStwNlQ2OU5ka0E4c3hpR1JabDgxT1dDYWJy?=
 =?utf-8?B?WG54RFJVL1lOWEQ2L3NHem96WjBvL3F2RW5BU3hKU3pjN3YxRVU4YVVneFJr?=
 =?utf-8?B?c1pZYUQyOHUxak52bE11U2pQakJ3UTNYSjRMcjVNVlZSMkNvZWU3QXF6WDVV?=
 =?utf-8?B?SzhXVGwvaWJGakVTT3hBV1RRMkVNa2JJYnQ1WUFtdkwwSFBRblNITW4rdEcz?=
 =?utf-8?B?cngzQXJ3VTlta0xWYUJlV2ZibzdFcERiS1VVVzUvUElCbGJ4S0dCYitoWi9n?=
 =?utf-8?B?b1NWNW9WZ1J5OWdBdTJWeWx4YmlsNGFrKzIzd1dEc08zRkg1RGxyUEJzS0pT?=
 =?utf-8?B?NDBwSFpobmhPNE42T2cvODdkOXNQbHhUelQwamFNRzFtWndROUg1SVJaRVZT?=
 =?utf-8?B?cnhDTGRZR2syMzg0ZzhiOW1KOGVwNHFxVE1XSW8zY2hycUVIUkM5OU5rV2R0?=
 =?utf-8?B?L24veGl6NGNrUDRBZU5KRUdGL1VlRGM4bWQ3V3doUW5DUlJ0cHZXK252Z1J1?=
 =?utf-8?B?TEJDNXQwalg4YTg3cEhBV29XejRNUFZQUGVUa1J2d1kzaWFjdkI1QW9LeVNW?=
 =?utf-8?B?TUxRcFJLcEJHeFRsYk0vMk1BM1hYbEViNVpxT045UWpIR2o2VkNtS3BLZWFV?=
 =?utf-8?B?QVBmWnQ3KzNCOFN4djNDUkN2QnlSMHVabW5PL2NlaExFSXo1eFVVSTkvajhv?=
 =?utf-8?B?Qnc0TE9oU0dIWmJlOEwwbUpYVGMzR21WcFNnMks2ZExSTVBQZmRrdU9leW4z?=
 =?utf-8?B?dlFtdVpHRGRwdmQ4b0dsYUwzZDlsU2VucXlKVk0vQ2hCYWRHb0ZtYnFlU2Yw?=
 =?utf-8?B?OXJieTdPY3RLMHpYTk1BTEdRdHM4TTRhQWd6Y1haM0xLZzBPQm52Q2hJeTBX?=
 =?utf-8?B?VjFtQzA1ajQyNWtjMHpodDV1K3ZYSlVOWEMwQ254NkQyZFRRaDI5cnA1cE1K?=
 =?utf-8?B?bTNib0d3Q0xKYS8vL2daRUJEblJtNDR0RFNGampiNmJHZ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWl4d1BTTXhOM0gvYUExZHNnMDY3U3NoYjhYaW5VUEdWaFFhYlp2V1ExcFdq?=
 =?utf-8?B?SWJMSnJyVm5TajBVd1AybGc3aXlURnNWcFBHbUExeHIrOTM5OFJYdzNuNHJr?=
 =?utf-8?B?S0lJNU5iakdVbTgwUFNublZRc3UvR0NjallrQ0lhb2Z4SmJSbTlTNnpqc2hH?=
 =?utf-8?B?cUIyYUJKMXFSK1Bzd3NQaFBkbVdFNGRnc1Zaa0hjUnlhR1czUm9YTFVIRjh1?=
 =?utf-8?B?eDdCQmJqaDdYRWR2YWV5Q3d0UGRmKzFXbjdwMTJrMGtvUTZUM0l3aFNOU2lI?=
 =?utf-8?B?VldaaW9SRjJxMGtnNlY1M1RKaCtvRHZJZHdwUVNlSllXTWRrSFhaUlhSc3ph?=
 =?utf-8?B?NHpHSVNMZlp5djJpUlo4MnRCUWZyN2JQbEQyWEhSRmcxbTFoWCtlSDZvM2li?=
 =?utf-8?B?dEVVZEh2ai9XbEtwWG1DZ1N2VnJ3b0NEMnRjcjlqM0hFdmVBeTk3ZEpneUxy?=
 =?utf-8?B?VW51SFVvY3M3M3ZjaDhncjluem0wajdDdzJyY2YycnNmdDhSR0lvL084MlVo?=
 =?utf-8?B?MWNJQmhPNXBrQUxOZTIrQTdTbTBMb1lDU3ZsUlRSdWR2SCtMZnBQbzZ6VDhG?=
 =?utf-8?B?SDZVVjcyWERCeHYzemM2cnhEVXY3TnNpL0ZXRERNb2Y2RUtnSXpQcnNHSFpX?=
 =?utf-8?B?cDI5cGpWd2dFc2RIQmJ4TEo3MDc5bUZyT3ZNMTQzYzJkMEFJNXIrYTd3TUZr?=
 =?utf-8?B?cmRqMTdxZXVHV1Z2dmlrNUtPL2JSNEpnUGJ5MjFlOTV1Mm5oU1Y0MTZscVR0?=
 =?utf-8?B?SnJPbCtCaU4rejdZaWRPVnREQjJqdm9ueVZyTzlvOEN2dTl2TEJCZEpWOFNE?=
 =?utf-8?B?ZHk4U0RFdHJMR1RtNk05SmFONWdZbnJVS2lybFF1c1pMWEdMaGgxOUFpQkJv?=
 =?utf-8?B?UnRxOTArMVRWT09Md3NySGJ2ZHNycTFzSGxQYzhzNmNaaXQvMzFoV1BIOUtx?=
 =?utf-8?B?bWhYNVBJaTR6TDFXV2Y5aTkrRHFGTlJYS2JmckFRWU8yUFU1bVNVOHVKZVRG?=
 =?utf-8?B?V2Q2SjY5cVdXZlhaWmFpd1AwVEV2dGxyMGk3a1lxcDJZc0h2M3VGaC9sL2sv?=
 =?utf-8?B?Uzl3Z09aTVVkZ3JySExPdThYdVFxRWYyc1pXOTVtY1pTellIWHV5RXNvU0lP?=
 =?utf-8?B?UTZvWDhFaURPc1pUOGFhS0ZuVVAvczVad3ZPcWI1U3hUZWxGUzZFUjYxaHZY?=
 =?utf-8?B?VWNtMVhPeXhJSTFLcUx5ZUV3UHlnNnIrRHBiM1JFU0owemViWU13N0Jwd0pR?=
 =?utf-8?B?dGROVEhzVkoxVTFmamJHZm1VUnY0NEZsTUNqc3FYczluMmgzU0VsUERFUC9t?=
 =?utf-8?B?anZvZFhXSlo1VjVlNEtocUhxNWl4WGhFOTZYdHBUeE5tK0pWVDJQZHF5aU1J?=
 =?utf-8?B?OTlHekswUXhablVTVFZYV3k0RC9ZMjRYQWJndEV5enF5NmtwOWUyZlBxSkdQ?=
 =?utf-8?B?OUI1V2VBYWJrZWlGR1F0ZzU4REIzZGJma0Jnd0VTcmtMcGtWYW5xMGh2Skxy?=
 =?utf-8?B?Y1FXOHVvZk1PdlVkYkt3U0ZLZjZKc0ZaMGl4K1Y3aXFaa0xMdklMRDM1ZnB5?=
 =?utf-8?B?R3ZzVmUza3FVU1UvUmI4Um9iVGUvTEt6S1M5eHBxTWl5ZldGeHppQWxMYU8w?=
 =?utf-8?B?TjJKNktXY2E3MlYrRmZ1ZW8yWmhHWFhCTkJFbU9SWDRWUmFMMDJZUVpDRElB?=
 =?utf-8?B?OG81SU9rZHpidHExZ1lhQ3lNRWhoNW51b1BneHovSEs1STJ3M2xWK0tPN0VD?=
 =?utf-8?B?Z2I3U1FBaVlzRnJ3NjBzSXMyaHBwc2Q4cWRCbmtNTjgzb044cWJaMktCeEN2?=
 =?utf-8?B?V0JEcGZ3c2dtZnJRdEhFZWxqTjlKMGpKcWVNL3l2OG5KNW1GeGpwcmJtWjFx?=
 =?utf-8?B?b05xemYxRWFMQlFybzRLNXlDZ0thVEFmKzc0R3Z6RzhIUzlSLzRocUhSYUlp?=
 =?utf-8?B?VEdOd0UxMTBoOWRKSzRnY0NIazFLSzc5TU14NENHOG5QbnZ6K1Rob3RSUk0y?=
 =?utf-8?B?NGZlV2paNU9tTDAwVnMyRlZaS29pOUFUbFh6bGc0Vm1ZNlczQmJ0UzIyMmI2?=
 =?utf-8?B?NzJaQ3ZOUzgxL3NKcU5HRG9uczEyelZ6a3RIM0JmVkdmVkViTXU5VXhsVWZv?=
 =?utf-8?Q?+hFey9lpMcXMjZnc9JfWky56y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af2677a-926f-4333-9c2d-08de271620d8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:48:32.8479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSY60NY8Tdtp7ObqxoQzqlvbZgag9ycwun+gqTQCtXAcF4c7IvNL/3gB4BB/r6G52rhqYEYRYKYOEC8ONzzWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

--------------QyqwybwJTPlc6y4IVvTrCoPm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 11/7/2025 8:48 AM, Matthew Brost wrote:
> On Sat, Nov 01, 2025 at 02:33:07AM +0100, Lis, Tomasz wrote:
>> On 10/31/2025 9:13 PM, Matthew Brost wrote:
>>> The LRC software ring tail is reset to the first unsignaled pending
>>> job's head.
>>>
>>> Fix the re-emission logic to begin submitting from the first unsignaled
>>> job detected, rather than scanning all pending jobs, which can cause
>>> imbalance.
>>>
>>> v2:
>>>    - Include missing local changes

Explanation of previous remarks and a request for a code comment below; 
but other than that:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

>>> Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
>>>    drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
>>>    2 files changed, 14 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> index 9955397aaaa9..357afaec68d7 100644
>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> @@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>>>    static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>>>    {
>>>    	struct drm_sched_job *s_job;
>>> +	bool skip_emit = false;
>>>    	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>>>    		struct drm_sched_fence *s_fence = s_job->s_fence;
>>>    		struct dma_fence *hw_fence = s_fence->parent;
>>> -		if (to_xe_sched_job(s_job)->skip_emit ||
>>> -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
>>> +		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
>>> +		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))
>> This looks ok, but what is the mechanism which could lead to a job after the
>> first  `skip_emit=1` job to have the `skip_emit` flag lifted?
>>
> This shouldn't be possible with the current code, since we're checking
> hw_fence. If we were relying on the software fence (i.e., the job's
> finished fence), the state wouldn't be stable. I think our eventually
> the is goal is to use the software fence [1] to avoid DRM scheduler's
> violations, so defensively / future proofed coded here.
>
> [1]https://patchwork.freedesktop.org/series/155314/
Makes sense.
>> Wouldn't the only possibility be that jobs were executed out of order?
>>
>>>    			sched->base.ops->run_job(s_job);
>>>    	}
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index d4ffdb71ef3d..f25b71aca498 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>>>    	job = xe_sched_first_pending_job(sched);
>>>    	if (job) {
>>> +		job->skip_emit = true;
>>> +
>>>    		/*
>>>    		 * Adjust software tail so jobs submitted overwrite previous
>>>    		 * position in ring buffer with new GGTT addresses.
>>> @@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>>>    					   struct xe_exec_queue *q)
>>>    {
>>>    	struct xe_gpu_scheduler *sched = &q->guc->sched;
>>> -	struct drm_sched_job *s_job;
>>>    	struct xe_sched_job *job = NULL;
>>> +	bool skip_emit = false;
>>> -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>>> -		job = to_xe_sched_job(s_job);
>>> -
>>> -		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>>> -			  q->guc->id, xe_sched_job_seqno(job));
>>> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>>> +		skip_emit |= job->skip_emit;
>> All emitted jobs have the skip_emit set, unless their EQ got submitted to
>> GuC which clears it, but if it got unsubmitted without finishing then the
>> flag is raised again.
>>
>> So this does seem to select unfinished jobs.
>>
>> Though this introduces an assertion that within Command Streamer ring area
>> of a job, there are no GGTT references between seqno increment and end of
>> the job commands. Maybe worth commenting in code that we're working on that
>> assumption? Example issue would be if someone introduces saving some kind of
>> metrics there.
>>
>> (this assumption was in power before this patch too, but now as we're
>> skipping fixups for finished jobs still in pending list, it becomes more
>> important)
>>
>> Also we're emitting jobs which have a flag names "skip_emit" set. This
>> disconnect needs a comment too.
>>
> I am not following this comment.

What I described might be non-issue; but regardless, let me try again:

Every job has an area allocated on the ring buffer; the area contains 
commands, which:

1. Jump to the user batch buffer

2. Increase seqno (by GGTT write)

3. Trigger user interrupt

4. Do some finishing commands


What I tried to describe before is a situation where commands from (1) 
and (2) were

executed, but then the context got preempted, before reaching end of 
(4). In such

case, the code with `skip_emit` would consider the job finished and 
would not apply

any fixups. This could become a problem if during (4) we did some GGTT 
writes.

Now, it this realistic:

* Currently we do add some workaround commands to (4), but MMIO writes only.

But since there is a precedence of placing WAs there, a GGTT write could 
be added

at some point.

* But the whole premise requires that there will be preemption point 
between end

of (2)  and end of (4). This is not a case, and I would be very 
surprised if that ever

changed.

So, the above is not an issue.


A second remark I had is that we're introducing a code like this:

if (skip_emit) then do_emit();

The issue there is that someone reading the code will see it as 
self-contradictory.

The first thought will be "did they forgot to negate the condition here"?

The code is ok, but a comment would help to avoid this confusion. Ie.

/*

  * If emitting will be skipped when re-scheduling the job, then the emitted

  * commands need to be refreshed now, to keep GGTT references valid.

  */

-Tomasz

> The idea is that in guc_exec_queue_pause, we set skip_emit—this acts as
> a marker to iterate over and resubmit jobs regardless of other
> conditions. As I mentioned, if this marker were based on a software
> fence, the state could change between guc_exec_queue_pause and
> guc_exec_queue_unpause_prepare. The current code uses the hardware
> fence, but that could change between pause / unpause too.
>
> We need to keep the iteration consistent because it also affects the KMD
> software state. Even if a job signals during this flow, there's no issue
> with the hardware; the key is maintaining a consistent software state
> throughout the iteration phases: pause, unpause_prepare, and unpause.
>
> Matt
>
>> -Tomasz
>>
>>> +		if (skip_emit) {
>>> +			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>>> +				  q->guc->id, xe_sched_job_seqno(job));
>>> -		q->ring_ops->emit_job(job);
>>> -		job->skip_emit = true;
>>> +			q->ring_ops->emit_job(job);
>>> +			job->skip_emit = true;
>>> +		}
>>>    	}
>>>    	if (job)
--------------QyqwybwJTPlc6y4IVvTrCoPm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/7/2025 8:48 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Sat, Nov 01, 2025 at 02:33:07AM +0100, Lis, Tomasz wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 10/31/2025 9:13 PM, Matthew Brost wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">The LRC software ring tail is reset to the first unsignaled pending
job's head.

Fix the re-emission logic to begin submitting from the first unsignaled
job detected, rather than scanning all pending jobs, which can cause
imbalance.

v2:
  - Include missing local changes
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>Explanation of previous remarks and a request for a code comment
      below; but other than that:</p>
    <p>Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Fixes: c25c1010df88 (&quot;drm/xe/vf: Replay GuC submission state on pause / unpause&quot;)
Signed-off-by: Matthew Brost<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
  drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
  2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 9955397aaaa9..357afaec68d7 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
  static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
  {
  	struct drm_sched_job *s_job;
+	bool skip_emit = false;
  	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
  		struct drm_sched_fence *s_fence = s_job-&gt;s_fence;
  		struct dma_fence *hw_fence = s_fence-&gt;parent;
-		if (to_xe_sched_job(s_job)-&gt;skip_emit ||
-		    (hw_fence &amp;&amp; !dma_fence_is_signaled(hw_fence)))
+		skip_emit |= to_xe_sched_job(s_job)-&gt;skip_emit;
+		if (skip_emit || (hw_fence &amp;&amp; !dma_fence_is_signaled(hw_fence)))
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
This looks ok, but what is the mechanism which could lead to a job after the
first&nbsp; `skip_emit=1` job to have the `skip_emit` flag lifted?

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This shouldn't be possible with the current code, since we're checking
hw_fence. If we were relying on the software fence (i.e., the job's
finished fence), the state wouldn't be stable. I think our eventually
the is goal is to use the software fence [1] to avoid DRM scheduler's
violations, so defensively / future proofed coded here.

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/155314/">https://patchwork.freedesktop.org/series/155314/</a></pre>
    </blockquote>
    Makes sense.
    <blockquote type="cite" cite="mid:aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Wouldn't the only possibility be that jobs were executed out of order?

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  			sched-&gt;base.ops-&gt;run_job(s_job);
  	}
  }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..f25b71aca498 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
  	job = xe_sched_first_pending_job(sched);
  	if (job) {
+		job-&gt;skip_emit = true;
+
  		/*
  		 * Adjust software tail so jobs submitted overwrite previous
  		 * position in ring buffer with new GGTT addresses.
@@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
  					   struct xe_exec_queue *q)
  {
  	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
-	struct drm_sched_job *s_job;
  	struct xe_sched_job *job = NULL;
+	bool skip_emit = false;
-	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
-		job = to_xe_sched_job(s_job);
-
-		xe_gt_dbg(guc_to_gt(guc), &quot;Replay JOB - guc_id=%d, seqno=%d&quot;,
-			  q-&gt;guc-&gt;id, xe_sched_job_seqno(job));
+	list_for_each_entry(job, &amp;sched-&gt;base.pending_list, drm.list) {
+		skip_emit |= job-&gt;skip_emit;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
All emitted jobs have the skip_emit&nbsp;set, unless their EQ got submitted to
GuC which clears it, but if it got unsubmitted without finishing then the
flag is raised again.

So this does seem to select unfinished jobs.

Though this introduces an assertion that within Command Streamer ring area
of a job, there are no GGTT references between seqno increment and end of
the job commands. Maybe worth commenting in code that we're working on that
assumption? Example issue would be if someone introduces saving some kind of
metrics there.

(this assumption was in power before this patch too, but now as we're
skipping fixups for finished jobs still in pending list, it becomes more
important)

Also we're emitting jobs which have a flag names &quot;skip_emit&quot; set. This
disconnect needs a comment too.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I am not following this comment.</pre>
    </blockquote>
    <p>What I described might be non-issue; but regardless, let me try
      again:</p>
    <p>Every job has an area allocated on the ring buffer; the area
      contains commands, which:</p>
    <p>1. Jump to the user batch buffer</p>
    <p>2. Increase seqno (by GGTT write)</p>
    <p>3. Trigger user interrupt</p>
    <p>4. Do some finishing commands</p>
    <p><br>
    </p>
    <p>What I tried to describe before is a situation where commands
      from (1) and (2) were</p>
    <p>executed, but then the context got preempted, before reaching end
      of (4). In such</p>
    <p>case, the code with `<span style="white-space: pre-wrap">skip_emit` would consider the job finished and would not apply</span></p>
    <p><span style="white-space: pre-wrap">any fixups. This could become a problem if during (4) we did some GGTT writes.</span></p>
    <p><span style="white-space: pre-wrap">Now, it this realistic:</span></p>
    <p><span style="white-space: pre-wrap">* Currently we do add some workaround commands to (4), but MMIO writes only.</span></p>
    <p><span style="white-space: pre-wrap">But since there is a precedence of placing WAs there, a GGTT write could be added</span></p>
    <p><span style="white-space: pre-wrap">at some point.</span></p>
    <p>* But the whole premise requires that there will be preemption
      point between end</p>
    <p>of (2)&nbsp; and end of (4). This is not a case, and I would be very
      surprised if that ever</p>
    <p>changed.</p>
    <p>So, the above is not an issue.</p>
    <p><br>
    </p>
    <p>A second remark I had is that we're introducing a code like this:</p>
    <p>if (skip_emit) then do_emit();</p>
    <p>The issue there is that someone reading the code will see it as
      self-contradictory.</p>
    <p>The first thought will be &quot;did they forgot to negate the
      condition here&quot;?</p>
    <p>The code is ok, but a comment would help to avoid this confusion.
      Ie.</p>
    <p>/*</p>
    <p>&nbsp;* If emitting will be skipped when re-scheduling the job, then
      the emitted</p>
    <p>&nbsp;* commands need to be refreshed now, to keep GGTT references
      valid.</p>
    <p>&nbsp;*/</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
The idea is that in guc_exec_queue_pause, we set skip_emit—this acts as
a marker to iterate over and resubmit jobs regardless of other
conditions. As I mentioned, if this marker were based on a software
fence, the state could change between guc_exec_queue_pause and
guc_exec_queue_unpause_prepare. The current code uses the hardware
fence, but that could change between pause / unpause too.

We need to keep the iteration consistent because it also affects the KMD
software state. Even if a job signals during this flow, there's no issue
with the hardware; the key is maintaining a consistent software state
throughout the iteration phases: pause, unpause_prepare, and unpause.

Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-Tomasz

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+		if (skip_emit) {
+			xe_gt_dbg(guc_to_gt(guc), &quot;Replay JOB - guc_id=%d, seqno=%d&quot;,
+				  q-&gt;guc-&gt;id, xe_sched_job_seqno(job));
-		q-&gt;ring_ops-&gt;emit_job(job);
-		job-&gt;skip_emit = true;
+			q-&gt;ring_ops-&gt;emit_job(job);
+			job-&gt;skip_emit = true;
+		}
  	}
  	if (job)
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QyqwybwJTPlc6y4IVvTrCoPm--
