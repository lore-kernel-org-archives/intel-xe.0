Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF237C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 10:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7312710E04F;
	Tue, 20 May 2025 10:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4/FOiAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D9710E04F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736501; x=1779272501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vro4G3NwHUG5hsJt4Ki4os8hlriqqu9te+yS8xZKCHQ=;
 b=n4/FOiAgWeNMF7mGRe1hipihD8sNucuIW3dmfqzKLTip36sf74zsLMwY
 sKkApEofP/d7OxABvZYTX9gkj8XZCobjB/WnkbafZTNKd5hVNEG38szMo
 8+sCPi3N6z59KeAdPeRGueW66CUE+kwH+ZfmjWK4VnPGPoLwNiE5fHgku
 wOEy8+PewLkbW3/KF33saMa60pNFyTedW5/wfc2ak4sOY3KP0J5Fl9S66
 UbCCU27jtCEGUqOQIVipe5lER7p32n+fID4OeE6QEq3JnRRQiYIn9aLzF
 Pd1xOeG7A+TWQP//+T7BqWu/Je+7m9He1pMV2SW9E59TQ8d/BYNJSBwPB Q==;
X-CSE-ConnectionGUID: zDb5ccgmTrSAkgqUVOMnsw==
X-CSE-MsgGUID: iGEvHMk0Sfe0Np+2hu3EgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48916468"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48916468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:21:41 -0700
X-CSE-ConnectionGUID: JdQ7jMwyTE6kOok73PzzQw==
X-CSE-MsgGUID: sitcptHwQnmouqrSayj55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139552380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:21:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:21:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:21:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJFGy09Rq3ocRjPH06u5MQYQ8LKZf5XHzQ/CHILJmmlsyzitI8TJ5Me2BTefawiGgitRz1Umz0hskFH8pe9vvcJWKW5AYmOpH6Z3h41okNy6x/3e4gwfWVmYwR9mf315C+Zc6GEALQBDUdT5pbZ5A1sB1pMHSauZ+Pf0D5FquGbGyQgDVceexQElhKn6JTBFMOvIWYmNLOkPHpDoY7Qrz9LdCAJXdykPhA5wy+Gb+SpU06hC6Mq1nDeofcdZQmp1eQM9NVBusyc/+zugTXmQXyivc2AGmM+teleHYzsnPiWPnIB5hHQ8YCy+uY6q9LzV7xRrDU2GOiOz44hK/G/nfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyiMiSdX/WHyh4Tgqwm/vgYn433/l6qxxloD9ChvhdI=;
 b=n4a62iUUa0DvM2hOGiDgZzJakPot502eFptuyt+VxRlW2Toihi8uP6BYEDW8wdWmrGSgTYcEMoh6aj/pFhKk1oKsIPMrCoGVV5a0zn5pow/6f26SdM0iJWimve2CZakfHbjJUjI1hZ845zPGtPuDGLLlVdwHCXG9L5TKte49/b7LwnSFXTwWLnTcpHpdwqsIUUSRAp6im0AtEldMXjcnvIryeWH1LpvvMhZC5Bye0vg3xouF5tu+i8YCCPrn/yS1EhGD1GbAQU5+82ukSBUZpJ+xJwM28UO+wkOYKg6hqgZMMLpskPCJdHRjR5Pn6MQOjMG3HFKOFOd+e9vGvp1s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:21:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 10:21:33 +0000
Message-ID: <e8e052c4-65b5-4618-b4ef-61596e042b78@intel.com>
Date: Tue, 20 May 2025 15:51:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/32] drm/xe: Allow CPU address mirror VMA unbind with
 gpu bindings for madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-25-himal.prasad.ghimiray@intel.com>
 <aCTs4du68Hs4Kgla@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCTs4du68Hs4Kgla@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d0b3d9-45c0-4fa5-b198-08dd978817cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlhuNXIrc214MnNndmxLdFEzL3NhR3dIM21uMFVKenlZcHlRZjlFTlF6Nlpz?=
 =?utf-8?B?NktFak1OSWh1blJ3ZGtKaXRVNk9keG83QzFJQVZoaXdSZWFDTlB5YWdWV1RL?=
 =?utf-8?B?ZmEvRE0yVGdOMVNlK3BHdis2R1NseW0rdGE2VVY1Y2tWZXgyTFBBdk1NLzEx?=
 =?utf-8?B?eFpZTi9yUnN5Z1o3SUVkd0hsZGNZdlpqTTFEc1NFWDZaQVJxUkZMNlQ5aUNs?=
 =?utf-8?B?NStmb3pQd2svT0IxUzJ5UTJRc0ZCWTZuSEhSS3BoWXV3NzZhY25BWnZNbWdR?=
 =?utf-8?B?YkRuazlpaEVPUG5xZWQ2Zk1uUFMxc1BYcnF5ZUtPRFlwR0s0dHBFaXYvbXgy?=
 =?utf-8?B?aEpUZmhaWHQ4UVZid2xBZTdKdDF5eXhhbWcyQUZ1bG9BMWlpTENhZ0JRUDNV?=
 =?utf-8?B?NjIyaGVyWndRcE1QMWpuR3lwUUpaaHd2UlNNZXE2NG5KVXQrTHhSMXQwazhl?=
 =?utf-8?B?TGxVQ2FOZzFiTjE2cm02L2JuUkhkaTJPQmMzeG5kNmdMNGdyNUhCb29CN0g5?=
 =?utf-8?B?SFBGNThjeWR5MXVGWTJJQ0F0MVE5K1YrOXFmcURGbnYzSGw5Y1RYbzZwR2xl?=
 =?utf-8?B?eFJCdXU4YktMNk1OOHpPMDJKc3BzcCsrWVlZaDNBUUlGVG9tbGloeEJsM0NN?=
 =?utf-8?B?M2w3SE9NdDNwZ0RjMkpla0pnNVpJMHBFZERHNkxzcFRrQ3E5T1hGWnhDM1Fy?=
 =?utf-8?B?a0RXZzNvVXNNN0dTTkFPRXY3amVPSkp6bmR2NW8walpnN2lxWUxyYmRiYS9F?=
 =?utf-8?B?SVV2Um1EV25JSkEzVTBFOUI1S2ZlTTR2WG5laU05NjBib0trSllOZnNDdUNN?=
 =?utf-8?B?Ky9wL0dmM0FmUUJPR0lrcGdFQVJucjRnWGNMZUgxWnpVSHZQbTNaVlN4eHdo?=
 =?utf-8?B?bGlRRWIwMXg4a1JnMnpNeWJ4UWZXek16VEZLMG1pcnNUeThvVmo1MXhCRkpq?=
 =?utf-8?B?YThxS3l1MlFMOWNVb3FtcWgvOVJ2Q2NIcmd4MWVySTQ5NTBudEt0bCtLdVhL?=
 =?utf-8?B?YTBXQTRxN0tqMHdVblptMlNkblE2b3ZhYUVobFVWVlJkR3NmMm1YcTh2aDhV?=
 =?utf-8?B?K1ZNYzM1QkYyS002UHZTQjFnRENGeDE4R3RtekpqSmYzaitmSWVsbys5ZVhy?=
 =?utf-8?B?eFVISjhIYXhTZ1ZNRlRzUlFBbi9jREwyUWxxS3h3RUx0enpvVTcrTW04WU9R?=
 =?utf-8?B?OFE0V1NSaFlxdm9JY2l3REJQQjJwZHNrUW84Tms5L0tjWEJHQWE1YnZaY2J1?=
 =?utf-8?B?SHFDakRYRUptd3M1SnpWU1psMTY5L2lxNjdJZjBZZDJqaEF0cHNzeWEwQmNu?=
 =?utf-8?B?VThzdTBLT1ZwMmNSQVhJbTliNURHdmdYR2psL3RjTWtZcjVrVy82djFOYm1U?=
 =?utf-8?B?WmtLWmdpMitDVnI4VWNIQjFCM3A5aC9EZmUzSS9NWm9oQmlaVDRudUpFNFBU?=
 =?utf-8?B?SlAxbjB4THN2ZU9lTTVVckhKVUxFRzQ5MXFlaVFKaHFSdWhNMlYxUjR4SGtL?=
 =?utf-8?B?TG1ISFBaQldBTGphcmYzTy9HMG10Vmc3OWdtRklkSm5pbzR4d0RYZ3lENDdj?=
 =?utf-8?B?NW45Tm5sZmt2b2hEZ3JMUFhwOG1KQ2dWUWVvR2lmWTFkcW04aGppdEZHckcv?=
 =?utf-8?B?TG1JUU5hRGFNSXpJQmhEdklodlYza21GdGgxRVVBWWJ6eXNWVjBkV3F4SzVH?=
 =?utf-8?B?eDZhb0NLT3Vaell0QjdMYlk1ZDhKRXJQT3lReDFmL2x0WEFuT0FOSFJKdXhS?=
 =?utf-8?B?RVFnL0pDTmZTc3NaZ25tZzJlNjVHdGRTR3M4bEhVa0NYM2VnOThDNG5mN1hW?=
 =?utf-8?B?Y3FJczZIb2N2WkhnakdKUGUxSnNZWnJESnE4U1JZcG9xZmNKZmpRcWxDZUpt?=
 =?utf-8?B?ZGpUZWJ5L1BLOEh2TnJOVkRYSFdONmVDNGZGeGNLWWFvZFQyMVZZM3J2c293?=
 =?utf-8?Q?PoYeQA6lAm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lqZ2Y1cnl3WkhyYTd3ekFvTDU4NzdCK0d0dXdhT3diNnBPVXM5N1JxVjlT?=
 =?utf-8?B?MU9TZ1JwdW51SVJ1Umh1TVdSWU5nVGxGMmNjUmZWZlVOUk94MlByVEUxalow?=
 =?utf-8?B?V1JYV2RzVGJCYzMzOTBEZTZCbTFNUW1VQmozWFdob3JrOUJZZ2NNUERJVUg1?=
 =?utf-8?B?OGJLemJ2OFlYbkJPbGZVbXlNeTl4aEZ6QWVEQzh5NU45VjdZRm9yRDNmMTVq?=
 =?utf-8?B?aGxRVUVZUDI3OVJKUlBSVGtZZXVQUWo5OXZTQzEvL3RYRnFFYldZSjB2QnRo?=
 =?utf-8?B?VDZ0aldydFh4cGp1MmI0YlNiMDI4OUZrNDhvVFA2eVU4VUh2SlVLalNieDJE?=
 =?utf-8?B?MWw2Q2NqOHU5OXJkcGFGVmtXOG1ILzZzZlRwWWRxSkl5cG5Pa0s5bmtzVDlw?=
 =?utf-8?B?TlZYUUhySU9MYlUrNE11bG1kTUdNK05ZUWxueDBOMm9oSkpUcVJjNytuWHFR?=
 =?utf-8?B?SDliK01NdVBuc1drOUYrdk5FakxwRXNKM3cybFNrNjRIM1JWZzhHWkhibUor?=
 =?utf-8?B?VWgrNHVPOGNWWmVKVU5EY1k3VEdrMUdwWWhmOEtNeFgwZkhyOTFXb1hIQ3hs?=
 =?utf-8?B?cEtsYkU1QU9CS0p0Nmd4bmNyUm91b1ZpTjR0UTI1RGEvWDBNK2pBSG00eUIw?=
 =?utf-8?B?dnBFdkt2NmRESm44Y0FSRW8vMGJweEdXajlFYUg3MkFkVU0wK1ZNcVo1Y3pm?=
 =?utf-8?B?Q2RXTitNSzRhT2JIRWVQa2VDTXJpRlJESmlTd01mcXNtMndmaGV6bUw2RWR0?=
 =?utf-8?B?bHo3Z0FUUFFRbzNZR3FPM3NjOW5UYzNSWkUzSjV4ZTMvbFBaN09MNnZqd296?=
 =?utf-8?B?TWFvd1drcE1nM3JSdGVHajNjRHg5ZFI1RFZzQUNKdmV3UzI4RTdEMElucjND?=
 =?utf-8?B?RnVIZC9JQnhLaGJtblVTVDRkdzhpWGZDUi84MysvNVN6RS9OZUh6UEl0ZWts?=
 =?utf-8?B?ZDhpSE5NR0dibFhWb2tOdVBIVjVvM1kvU2o5UElvM2pGVFlUTVM3WEE0eVBB?=
 =?utf-8?B?WFVXeCtrRDV4a1I4TGN4dWI2YTQ4QlVURlpwRWd2cW1iTXZHN3ZUUFhoNjNZ?=
 =?utf-8?B?b0dpTHdzajdMK0tVOEx3eFl3VDltNXVBM1JKdERJaVlLN2tGU1hNV2ZLbGN4?=
 =?utf-8?B?Yysvdnl5Y0RBOEZaUlFCT2xMZ1RuVmk3WUpzNWVSSVlGMkN5VXVvTEladUh1?=
 =?utf-8?B?b1VKbjFoOU82WGNIWDAxQzdNdmFOU0UvRGVQaXVmWkd2ZnN0ajdKTlBpdlZB?=
 =?utf-8?B?VSsxbDhrdjB2VmU3NTVEcXJJclhyS2ZsZmplT0FFVk52VlFFZ0xHempYempH?=
 =?utf-8?B?YXFBdFQ0biszaU53SmJ2b0NPNWxoR2o5MnNIOUVxdTY0eFFKYVc1eFFpQ3B1?=
 =?utf-8?B?aW1JeUZMUTgxQ2VDOEZoNHJXQVJXL0d3WUJTOENlcDlBaVJ1anVmUnUzTytr?=
 =?utf-8?B?Wm00dmJCeEtGR3A2V3JFejl3UmI4anFGa05IUHVlMXp3WEJWc2QxR0xWcys1?=
 =?utf-8?B?cTlKOHRNSnBSbnJaWlVHTkhON3dQTTNIVGRtNUpnOXRxVWxCdEtleVZhMlVQ?=
 =?utf-8?B?QkViOWNudExrZDgxZUhXeEhNMWpMdEFMdVJrTVNvSW1vNU0vKzU1RnZ4ZUtE?=
 =?utf-8?B?SzY0V1lpT3E2MVczV2FWbjBjZWluNXpCNDFQM2Rjdjh0QlV3dC9aSjV0dWhB?=
 =?utf-8?B?YkYzQlVQb1ZBdmt0bitsa2EzdDl2Z1J5TFdEN3dpUEdUUjRYdVJEN2tFOEww?=
 =?utf-8?B?M0RxbWlmNnZvbWM5NHhtc1dpb3dsYXJMcmlhbm94dVlocmxmM3NkKzQvYkVu?=
 =?utf-8?B?SlhuOTZ5TytSTWwwczYyNEU1a2NQVURFSnpYcU52b295L2Y5eXRYUVFuOG40?=
 =?utf-8?B?aEJRRERydE1SblZoeU5kL3lDSENaMmUyZmMrWnFvV0p6alcyTGU1R09VQ2xE?=
 =?utf-8?B?MGJCWTRrMmFORGYycmtGd3ROd3d4dTgzcmVPWTVUZ0dia0t4dGhsRDlGR0h1?=
 =?utf-8?B?ZzFZVy8zRkt0SXZOUXVOb2kxZDdtcWo4S0RIMUplekZ1cGdFM09qMlFDVzFJ?=
 =?utf-8?B?em5uMTdidmVkREVLWkp6RFM2bE1EcXBuWEJtUkRpQUhqYm1GSzNMbXZvL25L?=
 =?utf-8?B?TWtKc3hPSVlBQmJ6aWN1SXZYWVlvZVkyWWhqcG1pL041Mkd6azdWc0dJK1dZ?=
 =?utf-8?Q?wf8yu2XHsbZMUn4Z831w6n8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d0b3d9-45c0-4fa5-b198-08dd978817cf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:21:33.0124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yQy/nG3n6Hp6MEis0TV2x67BF2RRVTGAKKuEXV0hCLwcjh07sZI0tRe+5p0Olbr/rYEc12KjH6MPdRT80QuBXCGJWT3XhsgnNnTgQYrIYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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



On 15-05-2025 00:50, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:11PM +0530, Himal Prasad Ghimiray wrote:
>> In the case of the MADVISE ioctl, if the start or end addresses fall
>> within a VMA and existing SVM ranges are present, remove the existing
>> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
>> unmapping of old one.
>>
> 
> I'm quite confused why this patch is needed. Why is invalidating the
> ranges not sufficient?

how the madvise is supposed to behave if start or end of input range is 
within existing svm range ?
for example lets assume :
svm_range of 2 MiB exists in offset and  offset + SZ_2M, madvise is 
called with offset as start and offset + SZ_1M as end, in this scenario 
vma boundaries will change and previous svm_ranges needs to be removed.

> 
> Matt
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>>   drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 7ec7ecd7eb1f..efcba4b77250 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -903,6 +903,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>>   }
>>   
>> +/**
>> + * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
>> + * @start: start addr
>> + * @end: end addr
>> + *
>> + * This function cleans up svm ranges if start or end address are inside them.
>> + */
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier, *next;
>> +
>> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *range, *__next;
>> +
>> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
>> +			if (start > drm_gpusvm_range_start(range) ||
>> +			    end < drm_gpusvm_range_end(range)) {
>> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
>> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
>> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   /**
>>    * xe_svm_bo_evict() - SVM evict BO to system memory
>>    * @bo: BO to evict
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index d5be8229ca7e..d00ba6d6ba53 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -98,6 +98,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>>   					u32 region);
>>   
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -291,6 +293,11 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>>   	return false;
>>   }
>>   
>> +static inline
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c7c012afe9eb..92b8e0cac063 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2362,6 +2362,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   			op->map.pat_index = pat_index;
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			struct xe_vma *old =
>> +				gpuva_to_vma(op->base.remap.unmap->va);
>> +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
>> +
>> +			if (op->base.remap.prev)
>> +				start = op->base.remap.prev->va.addr +
>> +					op->base.remap.prev->va.range;
>> +			if (op->base.remap.next)
>> +				end = op->base.remap.next->va.addr;
>> +
>> +			if (xe_vma_is_cpu_addr_mirror(old) &&
>> +			    xe_svm_has_mapping(vm, start, end)) {
>> +				drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +				return ERR_PTR(-EBUSY);
>> +			}
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> @@ -2653,7 +2669,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   
>>   			if (xe_vma_is_cpu_addr_mirror(old) &&
>>   			    xe_svm_has_mapping(vm, start, end))
>> -				return -EBUSY;
>> +				xe_svm_range_clean_if_addr_within(vm, start, end);
>>   
>>   			op->remap.start = xe_vma_start(old);
>>   			op->remap.range = xe_vma_size(old);
>> -- 
>> 2.34.1
>>

