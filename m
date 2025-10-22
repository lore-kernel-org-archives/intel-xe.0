Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6073DCCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 23:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2946510E1C3;
	Wed, 22 Oct 2025 23:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObvhZSe3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15510E1C3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174592; x=1792710592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1UbojOXrcBMln3aGYIsOmGVwR4D+L3AERKdtK9h09ZQ=;
 b=ObvhZSe39TQZA+9selPxRX87F9arDbQH0c+q7D/3uQbKJVvnLL/3DRut
 omqRUFA1UUobJEaYL5L8WMZ4rJE3Oz8nylPILZWpbq0TEYl5c/F0bFi6t
 BNcAL2GenY66kOd86Y6LAwZdYtO1CGt522r4Kul5SDyiGeJ5FSk5cCyVO
 fOdfbiK1GhuXO6ZtW71T5wUletcZNWJ3wAdhRK1ZoZU0GmWVpBzzrZs0P
 LA3jV6utzXzt6y8nyKHSwrqog6cC/+adFpZ8iha25LIHx1fLV/bD3XGqF
 EisCN50roZta/e65zuaecwEmX4C7pEI7PmRtHaqxWURNSGMHSh5N2ZXRo Q==;
X-CSE-ConnectionGUID: TIX6YSaaRAiUUypaeEkx/A==
X-CSE-MsgGUID: pfBxe6UqSfiQjuow6VU2+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62365330"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="62365330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:09:52 -0700
X-CSE-ConnectionGUID: H/ThJVUvTQyYMSXjKoZ/VQ==
X-CSE-MsgGUID: GpTUjjjSSu6ds5kUP7abfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="214933707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:09:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:09:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:09:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM5WYWRf89lDBiC+KozewwMMunFEqJ/CZENpNhcnJT7aElPhCCdOCPBKNNCdm36Lo68+Lm4+5Y32mwMenFwhTAYYyjyepic3F7aQaH74WWMUA4sDfom6uin7FXuQe5ZfNU1HGCsw59wch8rcYZRdMxkRedgH4q3lZwciZ95WoeivU7YMyGL76SgxEjX9I1i3fFGES0THmywcqblwIRaQYdVuXY1eY3pT2QSrD14Tu/dQvIOOrr1Y3xJycG4shrNrfbrn0zfX1w1klRWnEgv93ZgwZZx53cW037I1XrwH6xpJzaVmRiOw/sjzFKjUt/XG4dj8VNU6dkHUA8P75szTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl6SejfbIrteisnKGSLETt4AlC0b/ZIQKFmdXBLg0Bs=;
 b=SR3yulHg3cn7z1+Y6i1KEQGfNw+N5c2Ic3smtPcGP42GLb7ZgjKKcdk3LUe18I5aD19oeeh1h7FSsT6rWu48BgP6PcXgCI6oG2Ir3nL7UT6Vv3qpSNhcTJJ+MDOBhMf19uCXbBSnRrMoDwGwgySpHCjpbkJc4xBcW/XJKJN6FuQcNfRfW3Gb1fbG3VODq/Jb3w6UlYKFLpNdjnppRquOfSwnSG+ezv4Nw+LmpVRf4GDLOEDpclh0SKS/q79LKNKWnk3q4uaOHJ0+l6xfuhryR2gH7zSU/2CCKegM6W+NP7WppMcGjglxnmTYm3/Pk4hh0AFmyvkhWEeLaWuDaTOXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV4PR11MB9467.namprd11.prod.outlook.com (2603:10b6:408:2d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:09:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:09:50 +0000
Date: Wed, 22 Oct 2025 16:09:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 08/12] drm/xe/oa/uapi: Expose MERT OA unit
Message-ID: <aPlkNWXl36HixZZL@soc-5CG1426VCC.clients.intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-8-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-8-bf11e61d9f49@intel.com>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV4PR11MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: c117e3a4-e120-44e7-5c3a-08de11c019d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG4zdGFMMXRURjJRRHl6VmlFZHR5ZHJFRmw1bFVsUCttV0s4R0hIVTdwOW9O?=
 =?utf-8?B?OFJjWWhWdVU4UVp6SzA5N0NYd3B3N2hKNWZEN0pvOGtRbjB5OGU1SHB0SFo5?=
 =?utf-8?B?c1Y3RHZQa3M4OFV1N2tlRXJPdFpubERySE14cHVsY2N4R200b3ZIVHpHRVJv?=
 =?utf-8?B?T3ZGN0RxRXo5Z0YvdVBIaTlRNEhIeloyVHZCTjg3UTJyK0NZQXUzYzQ0KzB6?=
 =?utf-8?B?dUlUM0IwaGEwb2lod05nQVEzOGREckl5YjlvN0czRnRPRzk5ZFVYYXpaZ0V6?=
 =?utf-8?B?cXY2ZFRQZG9vYUtWTktXYmpubHRhckIzOXM0QThOejk0QkRpYlg3QWNlelY3?=
 =?utf-8?B?KzVVdkZ0cUZrYm1OWlRxSTk1dytZV3RITWNoekorT3gvaCtnZnkvajRJbTdQ?=
 =?utf-8?B?d2s5TURNL0xFYTlpMjNUOGZ4U1NXcVJBTkVtb3FFWVJnTm90dnRTOXBpbkVk?=
 =?utf-8?B?VkwwcjRnM2tYeW5PUlZHZ0lUZnJFSTI5L0lVclR3MnhiR25WYzN4Z3B2eXVM?=
 =?utf-8?B?TVJVMjl0WTAwbmhtV3ZpcC96WG5HQnI4SVE3cEtwVHRnTnFML2dQU2xBdis5?=
 =?utf-8?B?R3JFTUtPOWxJb0ZqY2ZuM1VSZ0Urdi9xK0I1WDlZR3NLTWVhL25KVVlzU29N?=
 =?utf-8?B?ZHhqNjlsZ3VCd1RHZnBQdy9zUnNrK0ZLdFZ0bkZjcWNCK0tweUY2TVJoQnRw?=
 =?utf-8?B?bGIwR1Yxa3o2Nmptb2VNVnpFckhvVldKbzQ0WWVDVzdJSVpFYUx6dllZdm5L?=
 =?utf-8?B?QUdIN09XUFlmQng2UmtGUXFvN3VybVpkakhLN1N1WmhIOERORGwyZjlTTHNK?=
 =?utf-8?B?NmQ3eEFnanFSa2dBMnQwemY5S0xFTmw3eUNzc2lkL2tJUmswQjIrSFZrUlRu?=
 =?utf-8?B?SlNuMnkyalRCblV1OWF5UVdNaFV3Y1BXUkF6VkQ4UjVxdXUrQTdIWnh3K09V?=
 =?utf-8?B?RzFicWtxZ214NGgyY1RsVXRxdVZjaGxIdXplK0FOckJCb0d2TkdLVEhCVDl5?=
 =?utf-8?B?ekxVZll1SDJ0WWYzUzFCY2NreUMwMHp1WG5POTdvbWliQytIUEZvay9FbU1n?=
 =?utf-8?B?aHFRaUZ4UnpNQ0J3dFR0L3VwYWR2MTQyUXhFZHJWY0k0b2VCOG5ESnpVeStV?=
 =?utf-8?B?RUR1dWp5Rkx0U0dEdzBxTkQwR3BCUC95b3E3S1lFTjJRTkRzMXVXTnNTVTdN?=
 =?utf-8?B?eG1VQWYwSkJYRXpOQ20xMjEyWlNxVU0vUGd5andFMHJLZllRK3IrT0RoNGFS?=
 =?utf-8?B?WUZYRVBBUURxOFo1d0o3eTZ6L0VZSElaZUJaK1d6dk83OHhlbm5hQ3dYK0Vt?=
 =?utf-8?B?ZElRQmU4NlU4VGJNM2lDS25mblBRYmNqNmx6NkwzQ2dVSlFlcWJXN2RjTnZY?=
 =?utf-8?B?OTh0RzhvVnA1L0U5aWEwTHBnUDZ4Z1pNc3JGaUtDdUFENWdnZU1DMEJHd05I?=
 =?utf-8?B?aVNOeWt2SmNBcHAxS0NQdldmbUNsZllTdlpmVHVPdXN2eHdmNkJ0VzNJbE5o?=
 =?utf-8?B?c3lVOXgzMUd6QTR1YWdWaUErT1VidVM1MTVVcGJuM0FjRWFYbzRmNWhxUHN6?=
 =?utf-8?B?ejZlNGJvaVRjUTArYmMzOUY0VTl4eFhvOG1FKzlwb1pNc2tFUkRTUWVLQ0FD?=
 =?utf-8?B?eUZ2MHBJcHMxa29JM0lTbGQ4Q012MFM3R3hQc3VYR2l1TVJTRlp0TW9GUUow?=
 =?utf-8?B?cUpJL2NpcUpBVW4xVFFnQW16RnV1UzUwR0RJK25kejFXTHFWOFQrWUlqTTdx?=
 =?utf-8?B?cld2OVF2MzJhTlpjeXUwT0REekxJSzhaa2hmVStsZ0V6a3FRS1lXZnF6WkRr?=
 =?utf-8?B?UFU0RVIxQ2o4OEVYYmUrVFQvQXlaanFiUUVKOXNVMXp5NnpWZGVTOHptTFFY?=
 =?utf-8?B?YU5sb0pGR0tZTUFQeHFWVjYyUzAzcjltdDRFUEszTHRxK1QxczN4akhxelpC?=
 =?utf-8?Q?dOzFKGFZWCU/PJkq4QrLstFFNaiMiQjC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9UV25PbXF1ZGNlbDBQL3FhNExJRFBERUkyUnIrZUwxZkNWbEcyK3Vjd2pu?=
 =?utf-8?B?RzNteG5ZVlQ0VDBPVUtjNnptZGUrTDJRK1FVMEtJb21VZkNraUFuZmFvNlRS?=
 =?utf-8?B?eHgrUXgxMjJWbjVKTWFRSWF1dTI0UkJ3UjhSMnpyR3o3eGZDTjNiSHNLM0RT?=
 =?utf-8?B?ZXV5V0ZOSnFXL1lWcXplQ1hiS1JDR0hrVmRUOTZQYVBwL2w3Q2IrNWhnSmpG?=
 =?utf-8?B?azEyRyt4U3JYSU1aWmh3MHVWeWNWYVgzSThpYzZGL0pjMFZVdUJwbVBETE50?=
 =?utf-8?B?QUNJWEMvOGtjd1NGUkE5MWRRcDlodDhFQ0FWT0FFeUZDVXdNc29vSTUxengx?=
 =?utf-8?B?Z2FsbG5abUNhVHNuL2dVaDZWUURoelZqbUpZNDc2RHRRZUw4amxGTDd0YTMz?=
 =?utf-8?B?YnBzNndLQnJSTkhDaVNoaGtrekZab0EvRU9aY3gvOWMzYlE2NG9QVlZJYTJs?=
 =?utf-8?B?RjZxZGpVNnRZdFQyL0dySWJ0bnpDbXpwVk5rd1Nlb0h1Qk5KbmROTVE4Nkhm?=
 =?utf-8?B?cFA4MGlWaUpsblZ0eGYyZEUxTVJhb2Y4KzErWDBkczdpUk1BNUg1Vms3MFpu?=
 =?utf-8?B?RHdlTUZGTEJIMDZHcGdrT2cyUytxblNOMVhoVUZJQXdPTlh6Y0ovbWtLWE94?=
 =?utf-8?B?MWYvQWxSOVdZV2F4amFxNHJma3dHNEZ1MFByV1VyNVJJd29wakNHZnFrU0Rj?=
 =?utf-8?B?c2F1VEw4d1IvYzd0TWd4WmV4bEl2Z0RpY0hpN3BVM0NiUXFFVndQWVYwME5I?=
 =?utf-8?B?VUd0c0ljWGVFdk95a2ZaelJ2dDNHcFdERTJ0OUxZbUZQVDRLU0NtaDZpYVYr?=
 =?utf-8?B?K050WSszVDNGNDl1RWl4Nk1MdWVmY1JNbGJ4a2VlcjVzenBHYjlES0xjU1R4?=
 =?utf-8?B?R3hJQVR3Y0ljb0JlbElSTWE2aXlOeHR5a2RpNVFUTW9CdnZqUWwyR2NjV2Vn?=
 =?utf-8?B?Q3hMN2EwRjdVTXR4T21NQ1h1QU5FWStwTEJyZEhSZVJ1ZTFKQ3loKzY0dmRn?=
 =?utf-8?B?KzNTMDRib20rQm9IUXpoNThsaVdENHdFYnFtL09VUlM1QmlFSXpCaGpORmpy?=
 =?utf-8?B?SEFQWm1NMDFheVFtWXRiL29JSzc2RG5UbFFueFlWTy82WEU5WGc2YzJHU0Zt?=
 =?utf-8?B?RkthcEswd3lkaDROZ1RFMlRYcWo5eDZaN2FyRWlsRnM0cjFTeitlRy9VUU9u?=
 =?utf-8?B?bm5jODE2emZRT2NQemU5Z2kwQm5pTjZJeGhnRXJtZlc0alByVE9GYmkxR0xV?=
 =?utf-8?B?cCsyZGJyblgzMmV4RjZNbFlyaVJiNzh5OGl0MEVmQUFWU0JLSFJ1Q1ljZm5K?=
 =?utf-8?B?Zm01RnVYblZUM2FuNGFMNXRicERENGJPTktGQXMybmtlNTV3NzhJVXVyeGhX?=
 =?utf-8?B?V2kwODM4QXBmcUt0YXhNMVNKb3NURGoxazFDL1grQ1FIMm9vSnJrNVBwQ1F1?=
 =?utf-8?B?NWVwU2VwaFdMMFMzcnZjVzc2c0h6VGVidi9QZXN6OWtIaE9FVkl4REZIa3JI?=
 =?utf-8?B?Yi8wd1pHZ3llTC9uZFhrQXFpT2dnY0ZQcit4N096UlFNYlpVeTNraUZBaW5G?=
 =?utf-8?B?WTgwTEdWcUpjbHgzeXdSc3AxQVVwc2lCR1VJQUZESzJINkxHSDBMM1hUb0dM?=
 =?utf-8?B?bGI1eWVEZDNCS2xGMTRMZXA2V3VZZGloNE9JcHJZUUdMQ2ZBUzNESGRVcDl1?=
 =?utf-8?B?UE4xcHNQSTgrVXRMT2EwK25EQ3l0RFhqMmhBZDdiTGhyM0ZXRk84UTRRUUtQ?=
 =?utf-8?B?eVRHcmc3UVpyd2tpVzAyOEZXZFZaNkNkOWM3d2JHYVY0RXgzTU0zZGVKNURD?=
 =?utf-8?B?eXA1TjFUSUl2UGs1OStmTEtYa2VyV1BacGdHVlBYNnc5cjIxTy9EdlZpUlcz?=
 =?utf-8?B?ODBaQlZlR3YrYUZ4VnZCZ2dYRDViZ3hJdWJMRTZHejRSVFM2aWZPZzVaUWpi?=
 =?utf-8?B?cExoV0w2SzZWTUVQQkJSc0xkRVpzS1puQkkwSkpKTFZVbjhSK1dwVDEyUWxJ?=
 =?utf-8?B?RUR6TTI2c0paeWdqaHpNVmVpVHVjekNudlJhNWxzaHRnNnNWZ2UrYkhKdE5P?=
 =?utf-8?B?UDJzdVJJUXdsbFRxQjlyVitLRHNVYWJFaFNxOEhyNGljbzQ1d1VWSjg3bU1W?=
 =?utf-8?B?b1YvVGVGbEJsdUxYTFRGVk43VTFlLzg3TmtoT1F0bWpKdjFaMTlaNVFKWDNi?=
 =?utf-8?Q?quXh4rwhr8s3BJla7HOfyYA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c117e3a4-e120-44e7-5c3a-08de11c019d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:09:49.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaV+j+N0Jz5n8G/i9LUIOub0tVRNEcjYPp/mTbclYEht1vy4VIhkJbLpLDatj/KYds2BZwTcHCPTmwrnmHvh5Ed8jAhojGYEh352EewU74I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9467
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

On Tue, Oct 21, 2025 at 10:17:40PM -0700, Lucas De Marchi wrote:
>From: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>A MERT OA unit is available in the SoC on some platforms. Add support
>for this OA unit and expose it to userspace. The MERT OA unit does not
>have any HW engines attached, but is otherwise similar to an OAM unit.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h |  9 +++++++++
> drivers/gpu/drm/xe/xe_oa.c           | 36 +++++++++++++++++++++++++++++++++---
> include/uapi/drm/xe_drm.h            |  3 +++
> 3 files changed, 45 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index e693a50706f84..72334bd660751 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -100,4 +100,13 @@
> #define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
> #define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
>
>+#define OAMERT_CONTROL				XE_REG(0x1453a0)
>+#define OAMERT_DEBUG				XE_REG(0x1453a4)
>+#define OAMERT_STATUS				XE_REG(0x1453a8)
>+#define OAMERT_HEAD_POINTER			XE_REG(0x1453ac)
>+#define OAMERT_TAIL_POINTER			XE_REG(0x1453b0)
>+#define OAMERT_BUFFER				XE_REG(0x1453b4)
>+#define OAMERT_CONTEXT_CONTROL			XE_REG(0x1453c8)
>+#define OAMERT_MMIO_TRG				XE_REG(0x1453cc)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index f901ba52b4032..4aea94d438d40 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1915,6 +1915,7 @@ static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
> 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
> 	case DRM_XE_OA_UNIT_TYPE_OAM:
> 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
>+	case DRM_XE_OA_UNIT_TYPE_MERT:
> 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
> 	default:
> 		return false;
>@@ -2206,6 +2207,8 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
> 	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
> 	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
> 	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
>+	{ .start = 0x145194, .end = 0x145194 },	/* SYS_MEM_LAT_MEASURE */
>+	{ .start = 0x145340, .end = 0x14537C },	/* MERTSS_PES_0 - MERTSS_PES_7 */
> 	{},
> };
>
>@@ -2495,7 +2498,12 @@ int xe_oa_register(struct xe_device *xe)
> static u32 num_oa_units_per_gt(struct xe_gt *gt)
> {
> 	if (xe_gt_is_main_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
>-		return 1;
>+		/*
>+		 * Mert OA unit belongs to the SoC, not a gt, so should be accessed using
>+		 * xe_root_tile_mmio(). However, for all known platforms this is the same as
>+		 * accessing via xe_root_mmio_gt()->mmio.
>+		 */
>+		return xe_device_has_mert(gt_to_xe(gt)) ? 2 : 1;
> 	else if (!IS_DGFX(gt_to_xe(gt)))
> 		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
> 	else
>@@ -2577,6 +2585,21 @@ static struct xe_oa_regs __oag_regs(void)
> 	};
> }
>
>+static struct xe_oa_regs __oamert_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		0,
>+		OAMERT_HEAD_POINTER,
>+		OAMERT_TAIL_POINTER,
>+		OAMERT_BUFFER,
>+		OAMERT_CONTEXT_CONTROL,
>+		OAMERT_CONTROL,
>+		OAMERT_DEBUG,
>+		OAMERT_STATUS,
>+		OAM_CONTROL_COUNTER_SEL_MASK,
>+	};
>+}
>+
> static void __xe_oa_init_oa_units(struct xe_gt *gt)
> {
> 	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
>@@ -2591,8 +2614,15 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
> 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>
> 		if (xe_gt_is_main_type(gt)) {
>-			u->regs = __oag_regs();
>-			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
>+			if (!i) {
>+				u->regs = __oag_regs();
>+				u->type = DRM_XE_OA_UNIT_TYPE_OAG;
>+			} else {
>+				xe_gt_assert(gt, xe_device_has_mert(gt_to_xe(gt)));
>+				xe_gt_assert(gt, gt == xe_root_mmio_gt(gt_to_xe(gt)));
>+				u->regs = __oamert_regs();
>+				u->type = DRM_XE_OA_UNIT_TYPE_MERT;
>+			}
> 		} else {
> 			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
> 			u->regs = __oam_regs(oam_base_addr[i]);
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 47853659a705e..09599dcc816d6 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1654,6 +1654,9 @@ enum drm_xe_oa_unit_type {
>
> 	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
> 	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
>+
>+	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
>+	DRM_XE_OA_UNIT_TYPE_MERT,
> };
>
> /**
>
>-- 
>2.51.0
>
