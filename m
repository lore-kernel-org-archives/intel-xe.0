Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C537C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 17:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C9010E1BE;
	Mon,  5 Aug 2024 17:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UK6t6un1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E013010E1BE
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722879815; x=1754415815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=67hv+E9b7HmL3Jg1Jb6NK0hHk8Az08JW9Fns6vBsJgo=;
 b=UK6t6un1WNxohbygSVhGJZx1TPiYCGZyL9uGsIYunTIjQAkzih77FT9T
 yUbyXUy61yh9FffLFCqPWLcoCUKgW+yWSMxIygijNb1kon+o4zufKxPZV
 oUb54qV4wv99d0nnPMLAGVorosDWlv6h+wFLkiDqvDTe58UCHmKtyUglu
 KgbEHTWD2vZ5UGRna1LzaFwOLs5C//mgkplOtDmZJnJ4jwNWH3JER1qtT
 zq8MoQMpByaW+pwvPB/Q6uO8ESKY0Z8iFi3FGa492i4pKPyA+uTo6vOfh
 wpx9lNRkOX3F+sYTTkJEcSewHSipVJwh3ZlyNRo5LIMG9q8M94/A+xyZb Q==;
X-CSE-ConnectionGUID: 8n0e/USWSnaEpEN0JTuyMQ==
X-CSE-MsgGUID: 2HP/CByxTQaYQmCfjWLS5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="43383136"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="43383136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 10:43:33 -0700
X-CSE-ConnectionGUID: AUPVuBRsSIihjUBI3AvLmQ==
X-CSE-MsgGUID: XZ8EyrHsSC+1cZcfPR8V6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="87173783"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 10:43:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 10:43:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 10:43:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 10:43:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 10:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaPNp54V32Ojc974fwufdj0quPd3kyodw9+MpeTpjx9HAJoagixhF+vmrm4sFchl1eaNfYdjhoVh4FdelomLb9lg3Grkw0Cu/kzeaHlnmkP6YRuT9HX5U5YbW88+TzclR+r4MzRO1Oly3cBh63jCydQllXS49S0fGZTpUMp9EooSUihfPUxfKTo8XtYcc17nPCkO/1Cq6PrNkZHR68soTBE2HANIBnfutnTrgOASqzyY8fAh+T0Of1TE6bQcI0l+DfzHuRovLQ7GJiqZW6YRFiBanSxLulKGOrP+3qEt+n1jhdwzShaNEJXIvGbbhxlLgfzRoKkzQ+jLyuMS2/ab6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hylPhriu+ZKsuU06RMJ+8T5N0/rYqoWtoM1gCbRv5Ck=;
 b=zWBoy48/E/DKfWw2qbAwipbQe9lZnLz6eMafWRZQ2/HYdjouAlQ8wCc/M8Z/uwfUl3yTNOg7ahpc3+kvRb3af7WrNrlMWRGjenvM1ZXZSO1QRaRknfxO3Ns1k7CNwLWEfILVsHzaDES3Qty7YCWUYoXn1jq+FXTQYArO34STz4YKyq4Y9EfBFBZsv6LLYUhTu0OTFWAYBM0wj62iBUPv4qxLN4IoSijast7Nv/aIAS4BDIzKZv//NBxfDKvL4eQ1lJI+NpbWxIsMrZkVTZzbCbPmbdLTyGMcv86uYn+AvGxDsj4WsbyLtyyyoQIkQS5QquO5UoqYG69TJaMtvOT6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 17:43:24 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 17:43:24 +0000
Date: Mon, 5 Aug 2024 10:43:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] drm/xe/observation: Drop empty sysctl table entry
Message-ID: <ZrEPOSEfqx3m4TAs@orsosgc001>
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: afb75206-0080-4e4e-230b-08dcb5761ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWd4RmlVcXpoZldZS0tUdW9qZnFNNlFDd0RGclJsZmh4T1d1RDQyd1p6eUM4?=
 =?utf-8?B?Q2hGT0IyUW9CSmVuS0Z1UHRwSEltRThWLytEUkVTakIwRXYzZjMxVUpEVXg5?=
 =?utf-8?B?eUZ2Q0dmOTh4NWpGcXRRc1RJWlNWcHBIbWtGcjZYYkl6SnJwdmkvY0F4NW84?=
 =?utf-8?B?OHNXbmtkYXVxZCs4UFVyNEhIbDQwRFYvSWYrOGx5VE92NGM0NDllUm5sa0dV?=
 =?utf-8?B?eEZNVmNja0JQdDBiUTJ2UHh5Yk5FV1VEMUlUdFBER0ZhRUZVa0oyVmx3Y3I2?=
 =?utf-8?B?T0NMUkZ3MFM2cjRaT1dTZTNhNG5DbjBDeGtNdDhIcG9abXN4ZkVNWVRPSU5x?=
 =?utf-8?B?SjlWNzFKYWtDVmpaMzdMeGliaVpJclFTc3NoV0J4ZkdGU1BWR3h3OVBYdUNq?=
 =?utf-8?B?T1VNOEFneVBhV3g1T2xTTm9BYktQTEpTWTIvT3c3Z1ZFeElrQ0ttdzZ3SEtU?=
 =?utf-8?B?SzFjbFArNnU4M3crMEVBMDlkb3VBRThoNjhhbnVUMEtKbm1wN2w0Tkk3SXRZ?=
 =?utf-8?B?U0hIRVRtRHFpcVB3OTY4dW4xc3lIYWF1VVE4MCsyQy9HVG16K05iNzlDbkFx?=
 =?utf-8?B?TmdDS1RsQUFtaGRkTXN4blBCSWF6WmpmcC9heWxtQWVSdHF3azk5cE5iMUJX?=
 =?utf-8?B?eHhrNXhZc2hxS1dXb1hSaE9GSUNsUTJCQ3JESUlzQWJHUUtZOTdBb3lNbVhU?=
 =?utf-8?B?UEMxcm9yZnpkT0J5ZGxiQ2xLZGNEMmVDMVg3bndielkyWVp0eTJRMEJKbG5K?=
 =?utf-8?B?LytlMnlFWGl2YXVrYW5QNXRiYWNwQ2h6b1BZVVl1and2c0IvQU5NelJpK1Z3?=
 =?utf-8?B?SFVkMWZ0T3QwYjZVTzJWanZRamYzZXBVMTNQQlA4RGZFaUVock1mQlltVEw3?=
 =?utf-8?B?VDRSamorQkc5NTZDcmI0bDBIZTJuTVhVL1lTUGdMZ0pnU0NIaktlbXBHanlt?=
 =?utf-8?B?VG9NM1pLWFVUSWYyMDJNMGxKRS9jdElMNS93UlZGOFlONENRMVIvMW5zZXdz?=
 =?utf-8?B?S0tzY3Buczk3dXhKODR4MFVMNmhYQVd4bVUzZnArZHFTUXpDTk9DdlNmMkRO?=
 =?utf-8?B?bVkrUmVXZlp5aGV5SDROb3BVWFpNM0ZvTVRGT0tEMjhkU2FqY2JzaDhYQUpy?=
 =?utf-8?B?UC9oWC91NDcxRXZRU25IKzVuc1BkL1NLSGpncWtmM0VPNWNzSVg2a0RZM0tV?=
 =?utf-8?B?MVkrTmNXZk5McERKdHZDTDhKUjkyZzBjVHdNdXNoMWRiNVVSTzRmOVVoR2Ri?=
 =?utf-8?B?TUt6eUhmK2t5SnZFM3lLM2hCRG1JM3N1WlFuMGFVNVppU2F5NWFSbG5kOXBQ?=
 =?utf-8?B?SDBTMG1Nc2FNeDBBN0ZYZlhMR0dIU2RqL1RJRFlueEtZRnNBTk03SzVoM2Fo?=
 =?utf-8?B?V1NVd0NSVlF4TTZ6VEZab1FuMlVQcnNrT2xrdENhMWw0OWs3RGQ0czIzdVhG?=
 =?utf-8?B?Wmxka1hudFN1ZGpqUmRrcG42dlFjZmEwdDdTaUQyeTM2ZGVKaWQ1OS9EVnlz?=
 =?utf-8?B?dlM3RkpwRzkvejJuLzRlbENBOTNQK0J0eDRVeVBtSFF5RlZ2dE5NT1N6aGtF?=
 =?utf-8?B?TGl2L25ndWRneFNvNHptVXI2bWpsYTB2eDBQTmRPOS9FUGg1YjBqODN5dFdO?=
 =?utf-8?B?MWc2U3hoSUIyVzBDbWtuMGFCcEhUbncvMzJabFAyVFBzUlBORjhiSHNxcHhy?=
 =?utf-8?B?QTlPZnNKb2I2ZFlxWHNjL0pzR3BibHp3UjVEc2pwZnBPaGFGZDB0SkQ4M2hS?=
 =?utf-8?Q?n39Si53DANhhmhKiCs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZNZm03ZEo5Z1lmSW55Z3FFa2FvM3lVblJWZ1o4bHpvK2NSWTQwaG1ydDF1?=
 =?utf-8?B?eEZJdHJiSkcrVEFmTGMrbDBOMDhFNlE0NVRMQXp4TGozQkxsRlpReHVSR0tB?=
 =?utf-8?B?c2dycUJKdFhFZWl3d2NERVVZRmF1Q0FZeHlDYjY2cWZuY2k0alREcDQzcVdI?=
 =?utf-8?B?dTQxTlU4dE5kMFpkcVVIRk90OHZ5Z2lhVm9YVDhWc0hIT29IUmlFZUtMN2FD?=
 =?utf-8?B?U3YxU25NdEFvMHVWK0dKcGZUTzRUalZvdVFqMHJqZkVicFgyTWZyYmZxTlFO?=
 =?utf-8?B?NHVVcWVaWTBLNlJPb2xCc3BqcmUyN1NJWHdKbEVUZzJFYWJuanN5V0Z6T0wx?=
 =?utf-8?B?U0ZPSERMQ0tsNDR6UWtOeWlsd09zSW5iRVNxVlJUL0E0OStvSDFUQmgrZ0FW?=
 =?utf-8?B?WGZ4T3cyWUM5L1J5STZRR0tHWW1ZQVlQWXFLMjBXUXNkaGhXM2JLTTNHTkxQ?=
 =?utf-8?B?Y29Mdm44ZjFveGtxTUxUR0g0ZzRZOFJ0eVdWa0xEQnlkeWxsVXQxVGZINk1k?=
 =?utf-8?B?UzJKUDNobGg0SCtxODF4dVF0UXpmcUVIVHpKUTdhcERlTnNJMVJDekV3UTJs?=
 =?utf-8?B?cHV6blQ0Q21QekJZNmJWcVdXYlF6ZGYrRXJKam4xYUNreFl6a0ZZNURjQTI2?=
 =?utf-8?B?aGRmbVU5MDZUTHpsRUFGSVkvYW1QSXVHWXhoRzJVbDZxSTJhVUEyTGdhRElm?=
 =?utf-8?B?Tjd1c3lHTDJUQ0RUUUVYeGtXeFZlcTNNUlhZSGZqTXc0R21JeWZYQS9uV1hW?=
 =?utf-8?B?c0RaZHo0TzI4eG00Ym83MW51WERJOUV1eldQSUJxeUs1RFQrMERrdWpCU2pO?=
 =?utf-8?B?UkJuam8xc3ROd3FWTlZSTXlBRzh4bVpCNFRQWjNQMDhUSlpVZ2Z1dThDekhX?=
 =?utf-8?B?NFdBUDN5OU84MHFnZjdIWTA5eVNDQUQ1MkVzL20yS2FKRUVucEpZWERpVzdL?=
 =?utf-8?B?MXRucGFMaEc2RHN2MDlvVXd5eDNERU84MkR3bVgyaWdJdGhvU1UyUW5yRXE3?=
 =?utf-8?B?Yy9CVER6TFBlVDltWGpXTG1hS0tjLzV2UHVyOTdyQnVoQXpBMXdnTXhkc2gw?=
 =?utf-8?B?Vk5lM1ZtQjV3eDkxY1VVSC9PcktlamNwV2lWMzBUcEhHa3QvU1d2aXNTMGI1?=
 =?utf-8?B?eHVIVGhKbkkzN1VJYnoxcGI2L0hYelQzVm9ISGpVMzA4cWthek94MzBYRTVs?=
 =?utf-8?B?WVdBZm5NU1NrZXZUemdVV3pRZEprVUtlNXZOT3ZQKzBkVkdqTEQzeHN4Mkho?=
 =?utf-8?B?Q2xSUjhYQTlPaGk1SThSazd5TmhQTS9zYXNvV2k1bk1HSEVRcjlEajUzRTNX?=
 =?utf-8?B?WGIrc2FGQnJCeU91RncvZ2xuRFJTbHZOMHBMaXNSWnFHWitKbS9TaVAyZUlm?=
 =?utf-8?B?VGZpZTBXS1dVNzRXcy9vV3QzWjB5bWFneXl6YkdUNlFVdlI5dVVOMlhJUnRY?=
 =?utf-8?B?NXl0ZVZwdko5OUF0T2RkWVpCMlFyNjZaL2YvN1lTRHRzTHE0S21lL3BsZWFN?=
 =?utf-8?B?YzNYckNabVRpejRPMExRYWtlSmFuNDlTU2Y1TmpLdm1rRElSUys3ZnhCN2Ro?=
 =?utf-8?B?Vm9VMkZucFZmclkzWndKalAzbC9udTh6Q212N0VzOUZFK01pcDY2VG43TTdx?=
 =?utf-8?B?bC8vWndlV2VobGdCQ00vbHcvM3lEem9tRDZsV1JyNS9ZRGVWeXluc2ErTDht?=
 =?utf-8?B?UENBWHpDT0Y1eHRVMUw0UUZSUGtsdGJ5ZitCMnZFMndreDJ2UkpRMHh4SnRi?=
 =?utf-8?B?Y2M0VGJrRmxKRUlKZGwzMkNDbDdmZjdHMGNKb3FBSzZ3a0diNmtkNEY3Ujl2?=
 =?utf-8?B?dUpUT1dmTHFERWJKdnpqU3kzOG9zRzh0RW5Mcmtzci91NjlnYThqdXRJRWY0?=
 =?utf-8?B?WHpOZGVuTmQraFpFTmQwVE94TUFDZGN2QUszN2hla0xzQ0loaTg3dXZ4SUoz?=
 =?utf-8?B?UU1TTE1QZVIwU09DTStIc1l3TDAvZjAxQklVN1diOHN0RVBvYmcvM211TkIr?=
 =?utf-8?B?NVVYKzRTdm1zWkRuWDdNRGg4TVk0RE5jelhFU0xtNFVNR29yV2ZIQzBnQnFF?=
 =?utf-8?B?ZUJzMnFoRFV5YnBzVzU4NW5LeVl4Q2dWbnJUbHM1L3hUelFiZWF5K0ZhZFl2?=
 =?utf-8?B?NVhuanVSTlVCMTV4di9Ea1NXM2RmR2pFVE1hS2ZYQUQ1M1BVdkViUEFhRHRM?=
 =?utf-8?Q?TCl9atEBioXFshntLuSypIM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb75206-0080-4e4e-230b-08dcb5761ab8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:43:23.9929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lwtGyqQGXcdycwVAu9MnVQ+pR4lY7U6E9oiyz6HeEW8u+9t26E0f3V1OTyEev5okplkqAEiOpscJ1Hfl+xhfQqDYJdP4uta655XE2vPhJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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

On Sun, Aug 04, 2024 at 11:20:57PM -0700, Ashutosh Dixit wrote:
>An empty sysctl table entry was inadvertently left behind for observation
>sysctl. The breaks on 6.11 with the following errors:
>
>[  219.654850] sysctl table check failed: dev/xe/(null) procname is null
>[  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler
>
>Drop the empty entry.
>
>Fixes: 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_observation.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
>index fcb584b42a7d5..a78c92a44ec2d 100644
>--- a/drivers/gpu/drm/xe/xe_observation.c
>+++ b/drivers/gpu/drm/xe/xe_observation.c
>@@ -66,7 +66,6 @@ static struct ctl_table observation_ctl_table[] = {
> 	 .extra1 = SYSCTL_ZERO,
> 	 .extra2 = SYSCTL_ONE,
> 	 },
>-	{}
Looks correct. I don't see this (sentinel) in other drivers using 
ctl_table, so this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
> };
>
> /**
>-- 
>2.41.0
>
