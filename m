Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE007D4335F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 23:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E07310E8C3;
	Thu, 11 Dec 2025 23:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8T09qze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC43F10E8B4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 23:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765495168; x=1797031168;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vSjNCNBgI14j/sw99cxksIW/qWAr81nZRoJ47vTbxmA=;
 b=R8T09qze5CSsgsg6JvhK/kdS5xw/K4k9Si8jyQp0HcS0Q5DagDOo3Mhl
 B3C2nXl3zCm5lIoT9Z/hLxlN4FU4maq+vaoc+Af0hrYTLbFgcLYoYsZuh
 yWAd9FmesyW3bwpqmFhtejfSO1zzfc3bNoWNhFfD2qpbLHJRiPkh8PkIW
 YdaeGqwFvFdWQs/ZO2YIoSXWYmGCLxJWUUkUnsRR1rjDW/nK8ULm6Cxby
 49aMQQtr9JM/O62KZqLeDHN+Xph4CVYKcqq5TUPzdlOoQh4hR1FBHyuVM
 iXxfKgkHuMPaGEZPj15BDVG2Ye+LXsHQn0YZ6YraSLL+sHJHCp5moqsgL Q==;
X-CSE-ConnectionGUID: siYYxh0ERSCV35hXgCxVrQ==
X-CSE-MsgGUID: FZT/sInySb24FhNSNqZ1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78193738"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78193738"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:19:27 -0800
X-CSE-ConnectionGUID: xJlPlyJISrqioA2yyyx2OQ==
X-CSE-MsgGUID: CAHpEF1CSAqNzA7djR/T5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196915142"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:19:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:19:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 15:19:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:19:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4Pgzcs+5X9eY9a/IrXHWp1B/pMcXM6L/NCHAdr66VyTljQe9hhUyqge7u5xgXDK9xw8A1vv5l0vlGqEGTZ9KlD9pf1aeDIGCjc5Db6ErqjcQlVQL4fMjF/5H+TzUvPP2VcgANS/LKDXSJ7W6mkdc0IyVJCiSMbfPsWObuN46+JTMln/5u0bWStuURxH9dZb8Noog0YbMmmb6jzz14ZabiCSITXOahFqcx7WL5XIBdWXEmzgy2hpayFVf7XJxe+VngpPg/AwPPIew91SAtHiR+ykupz3WR6ETlDYXWvuk6YQHJsQg2bbMbv3cKwfhJqWbN4bSUqfOvQLX1MgzOKbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uAwFL9I9jMYYLSBP7v3FMOZ/PdYN2ADSUSLwr+D28k=;
 b=gp3EZY7PeDMZooLi+gV1xGo07Pvngut7mGlBRwS4b36Ar5QJhzpub2YvADYN6cJSD0G/zU6y4nbZR8Oois5iR8ix7+/5R+nxEVOY2tfmGzZ7PsZD4DSrKT7NeCRqeMGNg9oQULmd9G3+KT6UKoa4a3pCst6p1QIOBKNYfHY+WkUq+agp9njCnWWBXWvAevvZCvk4NPQ1UckY4A2WFj/nIoSoPD/abIJ2doXHgxP6gteYxAhrqlrtfspNsL9zDqn0w7wO/F4uXoiHkdPZennPpz9pu/EsACleUH7ks+HPf8aocJXptF8PWUQBe3uUd2B3xtVC0kweyuLU+2R1+xFpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF10DD61CAD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 23:19:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 23:19:25 +0000
Message-ID: <3dd5a9fc-d749-4a13-8781-acba9b3bbbc7@intel.com>
Date: Fri, 12 Dec 2025 00:19:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] drm/xe/sriov: Add handling for MLRC adverse
 event threshold
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-20-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-20-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF10DD61CAD:EE_
X-MS-Office365-Filtering-Correlation-Id: 54995dac-78a3-4509-6e69-08de390bb94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUlEQkdNSW9FK1FrNUNhV0ZtOGtmam05cjBxMlkwV1BhU1NqTWtUalZReUFB?=
 =?utf-8?B?MHI4VjIzUFRRU1VISE5xSk45bXZTVkVjeDBqcUJDNURmdmk1TVh0dDFucE5x?=
 =?utf-8?B?dnlnNWYwTFRUTVJlYmVieTBPYnBHVExzUi9YaG1KOUxtUFYvM3kzb3h6ZUVU?=
 =?utf-8?B?TU5vR0g1SWZqMFljZ2o4UmlDVlFlUHBFaFhDeGJiWVc5RnlSNkhhSUFwMXZk?=
 =?utf-8?B?Sk1NWjBCSmc3UGVTSEp3LythQkZvVlNzTWxXSzZXRUxaOU4vUmFLdS8rRWxy?=
 =?utf-8?B?R0FzZ0Jxbm5ya2hnSjhsRkNUMUNrNEE0ZFR2UHpzZ3p6K1IyZnA3TWJROWYw?=
 =?utf-8?B?ZTdwTDF2dWtsK0wxWDZuWk9FNXpXWXI4MThUek5ZWlFZR3UyZmhCcWhIeXhG?=
 =?utf-8?B?N2hlZVI1VU9SdDh3YzNIOEtTNzU2cGtOUzNQcEdZUDRMZlNtaDF0Sm8xWGNY?=
 =?utf-8?B?YWgyZ1AwRFlkc2J2ZVczdnBsUzlJd2tCNHRzODJUVGx5RFI0aEM3NE84UVZS?=
 =?utf-8?B?aWR4SlBkNzdVeFoyTTZZWk1EYnY1ZUhkSlZEUEJ3bi9wM2RzZU9KZldWVU1J?=
 =?utf-8?B?WVNjejBJWEZpaWUxaTNja0tLZE93bU5tUG0wTk40ZnUwUElzMU5qRC81b3Zn?=
 =?utf-8?B?eW5NNEhEYXE5Rm5uNXFDQVhmeitoa2hRUktqRmlpQkgwYlVtdTJKZk9FbUwx?=
 =?utf-8?B?WUdiZVZtY1VUQ0x1Q3ZhZUNISmJ6Y0NyNjRwT09LaVUvSW1yVlhjYTV6bGNJ?=
 =?utf-8?B?eFJ3RlVMRTdEaGxuck1IUFlPc25mb1FuOE84dEQxTDdpWGR3TDZBZkJhY1E0?=
 =?utf-8?B?T2ZMUzV1ZlhSVDRaSVE3N3hQek0xc0gxeER2THBad0hqcFo3UmVPeTBvMEZr?=
 =?utf-8?B?NGYvMVhsRkJ3TXdMejFvblROZFVUMXd6OEJRUXI2TzZLcDlNZCtNRWpuYTFS?=
 =?utf-8?B?dVAwRmQ2VENURSthM3FMOTlpeHVCZk9odzlPMHhPT2J6b0ptWjRONzkvSWZn?=
 =?utf-8?B?MEtiWmZ0QmFUamk3b3NBY2xJVlpDVFpoT3dlYmw5VXhLMGR6WUFCNHVTT3ZP?=
 =?utf-8?B?TUZuNllYVy84dVQ0dDcvVkxucnBoUXFHSFNJc05BdXJkNDhWTlpNTEh4OXZT?=
 =?utf-8?B?eHNBRWkvbkhVUzRiUkxhZFV2QUpvVHA5RzdkbEczTWJkWENSVys2L3ZaeWNk?=
 =?utf-8?B?bjRWeFVjRWx3NTVWcURmTms4Z2tKNVRLZVUyT0RLbFloOUt5UWZQOWpzYnRR?=
 =?utf-8?B?SFRkSGIrajcrSmcrQ2dFdnNTb1d2bXkwR1NmUDhMcCttU2NhRWVBSE5sUmRJ?=
 =?utf-8?B?RDdNMVh0WkNLMTgvNWc0WVJBVlRTdG5KZ25NWlNLOEgrQ0ZCdnVzNFlneGJ0?=
 =?utf-8?B?aGp2Nk5wVmhqVnBoRkp0ZFB0RjJCYllibHc3bHljT0F5VXkzdkpwUUZuMUtw?=
 =?utf-8?B?OWlqYXNMZ3dYSjBXY09OM3VBZ1dxeWFQdTVRai9oMWdwYm9iR3JoZ0RBVytw?=
 =?utf-8?B?RktRYStITEhqTFZkVTVFVjBVNWFWN09jeXAzcjgyRHVXdDhubEhaTkpITUt5?=
 =?utf-8?B?WkdPOG93Uk9CcDRRR1VvUzhYdnZoVmkvVnQxWWxCemhVRkJsT2pjUVdKclRh?=
 =?utf-8?B?LytQaTNyWjZwMllSVnpVdmFKb3BJYWgwYVIwTzdpY2VObERUOFhGU2VEVllp?=
 =?utf-8?B?S0h4OG1IdEJMWXFUT1VWLzZuTGVNQ1ZsM2wrT0JWS3dDclo2U0Z1R3dlNkhH?=
 =?utf-8?B?TEgzRHdlZ2c1WkNyMGNWSHNEK0s4eTJmL0psNVc1cnU0dmh5VTFha0wvR1h4?=
 =?utf-8?B?VVlXeTkxbWVTdVFTYW5DOFNZR0NVNCtuNU5FM0YwUjZSQnQraVNnRk1UYmtM?=
 =?utf-8?B?YytOTlpodE9EUU13em14eWZUM0Y0U1FiWVJMV2xmcFVvRy9PR1VMNzZsaEIx?=
 =?utf-8?Q?PoOKrPGbJjD+ChZ5BTWOuDrw1dIcDp3Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5sL0dpRGRmMTcwV1I2UHBWZ0VsaThoUmlaNlI4OThZUlZCY3BNQWIxeDJm?=
 =?utf-8?B?R1c3OVJidFZ1WXl0T1UvdG1xSzd3UytnWjh1aVluRGJIS1c3MGJodjdZaDUr?=
 =?utf-8?B?VnEvYnpXUTVyY3dXNS9DRnl6Sit3Q25RWWN5L29Pc2U0THF1YXc0K1ZhQkNt?=
 =?utf-8?B?L3B1UTVxcU1ZckxaQnA0L291cUpsTmFTSFB5WXZ3SHNaMWNXQlVNaDBVRHQy?=
 =?utf-8?B?MHJtNzB4UXF2VTY3ejQybERaeUk3NmpsdTRkY1BjZy9aTFBCd2tDRXBsVUJn?=
 =?utf-8?B?R2VYSjZXOVJRaUNEVm56ZTJEQWljQXQ2YkN2dit0T1JtazZRS2dCVlRRR3Jq?=
 =?utf-8?B?NHI0TDQra3N5Qk04bUlZNkZReG1ZemxocFJWUzFRRldGZEFZZmNSYjJFYk9N?=
 =?utf-8?B?M0dnZHExcysxbUVsWjN5dmxsS1ZYb214anZFeG1TQmxSTjFTWmcxbWlKcHhz?=
 =?utf-8?B?TWVhbW0wSW5qS3h0MWdtK29aY29GUWNGaWRhTWk5Q2VQS05jVGxJandFVEVL?=
 =?utf-8?B?MEcxVy92VEg5WjJMZkFsNDgxWStBY2o0YW1JSUNhczVsdlZveDdWZGg5RWs2?=
 =?utf-8?B?aXQ0YVFxQmJxa1VaRmRJdnFaVk5pTVI2R3R3a0RId1NtWDFqUFh4NlN2VHc4?=
 =?utf-8?B?bkVmL2liUU5wbko1cndTRDZISlpKaFNnQk5sY2d0Z2dPNHAwcjhCelZWM0Zw?=
 =?utf-8?B?MTNkMFUvVVVrdUJycE5Ldi9od3dCVmVkUU9RaVlzMXcweGYxejBaUkdiQlc1?=
 =?utf-8?B?dXlEWW9kSm1TWkdUdlFaUE9aejZZZmIzRTFIS3ZLOGhjZlhZUE5OUmZyZlhx?=
 =?utf-8?B?WGFhQStvNW5uZGtRMkFlOVorNWczeDhBTENRMG1IVzFlc0Q0MWtoRWtuWGFU?=
 =?utf-8?B?OEY2YUgxa2ppU2RKQWFtaTBIV1pQcWVNRWNiQ2dOVUt2ZFVSbVQ5VitGV3c3?=
 =?utf-8?B?N0VGaysyNWNmeS9ZM0Z1SkZ4VEVGM253cXhrVHAyMGZhOVcvSHlxTkRXUE4v?=
 =?utf-8?B?czg0OSt0ajJoVVJDUjMyOEJKU2hFc2dwWlJySEJpNUloVzhNdnU5clR0N2Ey?=
 =?utf-8?B?aFczVjB5UnYyaUF5end1ODZzbWR2NlVVWldKc3YxSStVNHFpRVFxTVBnUjd4?=
 =?utf-8?B?MDFaOVQ4R0J6Wkp0NnVRbUFWS210QWh1Z2tDenpjUG1sY1hhRCs5MUZibE5W?=
 =?utf-8?B?cnFWUFVvcFpIZllpS0lLK2lIMWFrbWhjeXVhdWhma3dvMkcrSVE2RkdNMll3?=
 =?utf-8?B?RFZhZ1dCQW5GZ2s3WlZnVzlDWHlsOGZiY2dtM2p1UTExbElHMktGV080cjRT?=
 =?utf-8?B?MGVTbGwwYjJSb2dlcS9ZVjBOZDRacURSaTM4N2lHbkRaQXhWWTZwWXBRYjVr?=
 =?utf-8?B?SFRwcUdXZmxBSHIvQlV1SVIxU1VnbWU0ZExVaUhCN216RHRIOVlVL1M2YlRY?=
 =?utf-8?B?dE9HM0pWbUcxWGFCMG1mVEU2T0ZDQmtTUXlKRDV0Y3E5RzBnbTZJVnRWbDJJ?=
 =?utf-8?B?MlQ2VTJFL1pBdEp2cDgzdkpDRGdKQklJcFg0SHZLa2Fqc1Z3bkhiREZybGVU?=
 =?utf-8?B?S2tQT3JpMWRYUDAyZlJacnZIUHpzQjVxeEVZZE8wSHU0TWp0OXVCYXpjVzBU?=
 =?utf-8?B?MjZydjVEcnJINWdWcGppRHNUcGQ5Zjc3MFhoR1JDMUFNaWxFZDkxNUg2NlBN?=
 =?utf-8?B?UU1taUI3aGJ3dHN1Q1dzNGg0RGNqN2U2V2tMVE5JY1FCODg5VnJvVDI5Rlpr?=
 =?utf-8?B?MG9ZeXdQMWUyLzdCNVNRdFFTOUQ2SFBtOWRUdVJyRlMyRTVBTi9xdzNmOVFE?=
 =?utf-8?B?TjVIbFFRdC9sdWd2NTdGemV5dTY2YWRyNWc1WTlZNFdCR0dkRGp0RWN6WXFn?=
 =?utf-8?B?N2Iwa1J3UkpLbnN4dnRxNzlzdkt2c1Q3dy9kYWx6L1d6NTh0N0hvSng3Szho?=
 =?utf-8?B?MWhOVU9OUnlNMW1ta1FZaEtOUnRJZlVlaTI2MDZLWGZTZTB5TllxYTZmeEEy?=
 =?utf-8?B?SkREYWtJRlNkQmNGRStKRmR4cThla04xaVQ3dkdhS2dsRU1SaGtqa21yL04y?=
 =?utf-8?B?LzZKM3ROeGpzZG5acXBudUgyRDFxMnIyN3ZGL3hKc1Yrd21PeFdwRFpLeDgr?=
 =?utf-8?B?cmhkem1kUHVibFFLK2xZR1VBZXlSVWppbXBWZjdPRC94SnltUk8wM0VwbTVn?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54995dac-78a3-4509-6e69-08de390bb94a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 23:19:25.0418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFpCeHWwXb1QkTXBFAdIEHkKuq2+mV2KVgur6xXk0dte6RvpdDgY2SmmR6oehrq0bstfi6PupstkHqeNruwRYgPBxqw5wy8TeeF5rxOpJzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF10DD61CAD
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


for PF only patches, we prefer prefix:

	drm/xe/pf:

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Since it is illegal to register a MLRC context when scheduler groups are
> enabled, the GuC consider the VF doing so as an adverse event. Like for
> other adverse event, there is a threshold for how many times the event
> can happen before the GuC throws an error, which we need to add support
> for.
> 
> Since this is the first threshold that we have that has a minimum GuC
> version requirement, support for checking that has been added to the
> generic threshold handling.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: split from previous patch, add GuC version checking
> v3: don't move version code to its own file, call MAKE_GUC_VER from the
> caller instead.
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 17 +++++++++--------
>  4 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 5f791237d0ab..186d4fa162c9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -378,6 +378,12 @@ enum  {
>   *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>   *      :2: HIGH = schedule VF in the next time-slice after current active
>   *          time-slice completes if it has active work
> + *
> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
> + *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
> + *      groups and cause the latter to be turned off when registered with the
> + *      GuC, this config allows the PF to set a threshold for multi-LRC context
> + *      registrations by VFs to monitor their behavior.
>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -436,6 +442,9 @@ enum  {
>  #define   GUC_SCHED_PRIORITY_NORMAL		1u
>  #define   GUC_SCHED_PRIORITY_HIGH		2u
>  
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
> +
>  /*
>   * Workaround keys:
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 59c5c6b4d994..3d9bfdd305c9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  }
>  
>  /* Return: number of configuration dwords written */
> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
> +			 const struct xe_gt_sriov_config *config, bool details)
>  {
>  	u32 n = 0;
>  
> @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>  	cfg[n++] = config->preempt_timeout;
>  
> -#define encode_threshold_config(TAG, ...) ({					\
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> -	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
> +	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> +		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +	}										\

actually I found the way how to generate this where VERSION is only added to the
impacted KLVs, without need to hack/pollute other KLVs with version 0.0

I will post this updated patch (with preparation patches) separately as RFC

>  });
>  
>  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  		return -ENOBUFS;
>  
>  	cfg = xe_guc_buf_cpu_ptr(buf);
> -	num_dwords = encode_config(cfg, config, true);
> +	num_dwords = encode_config(gt, cfg, config, true);
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
>  	if (xe_gt_is_media_type(gt)) {
> @@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  			ret = -ENOBUFS;
>  		} else {
>  			config = pf_pick_vf_config(gt, vfid);
> -			ret = encode_config(buf, config, false) * sizeof(u32);
> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>  		}
>  	}
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> @@ -2551,9 +2554,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>  		return pf_provision_preempt_timeout(gt, vfid, value[0]);
>  
>  	/* auto-generate case statements */
> -#define define_threshold_key_to_provision_case(TAG, ...)				\
> +#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
>  	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
>  		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
> +		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
> +			return -ENOKEY;							\
>  		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
>  			return -EBADMSG;						\
>  		return pf_provision_threshold(gt, vfid,					\
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 0fd863609848..7833a7118039 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
> +#include "xe_guc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_provision.h"
> @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  				   &sched_priority_fops);
>  
>  	/* register all threshold attributes */
> -#define register_threshold_attribute(TAG, NAME, ...) \
> -	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
> -				   &NAME##_fops);
> +#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
> +	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
> +		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
> +					   &NAME##_fops);				\
> +});
>  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>  #undef register_threshold_attribute
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 0a028c94756d..611a99224888 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -23,15 +23,16 @@
>   * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
>   * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>   *
> - *	define(TAG, NAME)
> + *	define(TAG, NAME, MIN_GUC_VER_MAJ, MIN_GUC_VER_MIN)
>   */
> -#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
> -	define(CAT_ERR, cat_error_count)		\
> -	define(ENGINE_RESET, engine_reset_count)	\
> -	define(PAGE_FAULT, page_fault_count)		\
> -	define(H2G_STORM, guc_time_us)			\
> -	define(IRQ_STORM, irq_time_us)			\
> -	define(DOORBELL_STORM, doorbell_time_us)	\
> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
> +	define(CAT_ERR, cat_error_count, 0, 0)					\
> +	define(ENGINE_RESET, engine_reset_count, 0, 0)				\
> +	define(PAGE_FAULT, page_fault_count, 0, 0)				\
> +	define(H2G_STORM, guc_time_us, 0, 0)					\
> +	define(IRQ_STORM, irq_time_us, 0, 0)					\
> +	define(DOORBELL_STORM, doorbell_time_us, 0, 0)				\
> +	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)			\
>  	/* end */
>  
>  /**

