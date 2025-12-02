Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2437AD12673
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ADD10E6C0;
	Tue,  2 Dec 2025 21:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQNRv/K3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8310E6C0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764709258; x=1796245258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7AK4ePu2Ml3goVEGK+x3Ymjav7GsFfQsBy0IwsoBHqQ=;
 b=NQNRv/K3Wuj7UVE24qirsHk+sbLzuvUhfamPhlf2bCldHYYqb/ZNxxDY
 vtTMGlESQFRSPmphuRXeqwOkkPFQL6pNQbz4f0YzafdUjozCodNxPjce/
 HGIJLLnP8r1rrk3veSe2652rMDI7aTIRng/OU6D/rSgOrgwPrLVwIhROY
 b8ng3iD81LfQ9dJRf+NQ+/Eh5k4cbiVML4oKgQHON1BK4Is4+1ighaIcS
 Z55zUFntUwsroXGY8zi5wKMiKn2IjOvg/eyyF1cSZe42TCvqMn01WBkFO
 0zq71Z3kabivYl9p/gs+eT/w/Qx6XYZRkoGmjgaZZvj3XnTcLdCuVxg9X w==;
X-CSE-ConnectionGUID: NRToDrdORyyFfVKLLIgJEQ==
X-CSE-MsgGUID: 8eI56KTURdOfri0sdd/iSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70544009"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70544009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:00:58 -0800
X-CSE-ConnectionGUID: kDeJAAAkRjqFiO7LvU54jw==
X-CSE-MsgGUID: Ytblib3LRf+rECFRIBk8aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198662825"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:00:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:00:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:00:56 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:00:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvECpEmiMGhePhJVp3ZsJyILMmaGfgXNndW2LrInv/2x3zju+JA3lTmtCFCsDqSnEhReLKn+Q3We07wV+epjiRvrB9mqt4LgQ1YsXD8h92cGDO5udmC1b6Wbm0QZR6+XGoC++OTAJHX9f0oj6Py0xL4R9aYo6bCUaxdRCJVPdURtAhLrVKtHPUvoBdd1J76mHDRxO0CcXS6jRB7YpZbz0DRIgyB5rpuzVXLbwCRhLCyHZ0vm7OgSMjgBEZSKuMxbrp/lgBKkDcACNYPwRv+DWlNePJVwiIbUwl+sD9swgjwxLHTBWhSvro+XVO5qdeeym9plAm7fwafsYVf1v+pd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnpxPq5J1n0fzHpCbOsdEduSK3vdIDKc9UKsJ+NA7aw=;
 b=xSDc84eSkYniTd9f5EwnhB6W7iKagCDVpCK90Z8AMo4D2p8erY+saqgccM/f2pPhhES+4jz8dKW1f+R34yH/kcvX9MjnJrUMcdDGgoHmXfx8IH8iSQLijDLaLfsaXg0qRmwqUcVBkQkJp1FortFXmAfNyv6/kaEsd9q/mUbxgNcYQgFY95BnqOvRg97JAe7t0ayH2OKtMsfilqjWl308a0i0YMydRT7RVwvJIQq4WIZGY4R+eh/LiMuHT6ZBjGbBYntaDbjSHA4FjjsY7T7/sDyD6mmemBkX1Qju0+raNpZoh8HXehe2CqxOK78lBEs2rnGST0wGAR8EjRBKC7GY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:00:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:00:54 +0000
Date: Tue, 2 Dec 2025 13:00:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/remapper: Reprogram remapper index on PM
 resume events
Message-ID: <aS9TgCh1hjxNGf7v@soc-5CG1426VCC.clients.intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
 <20251117205315.1458477-10-umesh.nerlige.ramappa@intel.com>
 <1e82f705-e1f2-4d98-9646-8734f8d17c14@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <1e82f705-e1f2-4d98-9646-8734f8d17c14@intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 660bde10-2618-499d-bef8-08de31e5e1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blpsRjVKY3Jud3duWkJIemUwSEVIR3FJRzBRYk4wSmw3WERIWGRnWlhHMjZR?=
 =?utf-8?B?dUF5MTJuT01OTGhMM0VNWVNReVFINEFLUi9pYkhaV1NtRXJydWFQRGtCOFdM?=
 =?utf-8?B?aGhrb003S3Y5MEQvd1lEMldCWE1KTStUWHVTc0tMeURnRUVrajJ6eEhQMmE5?=
 =?utf-8?B?VnU2T0twZkZNTWQyVHpEOXpDZ05ObTNDaFhJeUNVWjl1SFRUZ2dhbUZzUHlz?=
 =?utf-8?B?MUdiR1huN25UbGJEc3QvYXIwbjdneUNRcjhxdjFKeW1nTm51Nkl2T0I4ZUtX?=
 =?utf-8?B?YkhwSlIxSys5SW5SVkdSQjdKVVRKOVkvVVh3bmhvV0pXL1BoZk1MbW4xMDlZ?=
 =?utf-8?B?MytPS2lhWUtsaDVVWXk5Y0xZUTFJakVuVWI4MGFhSGlCL0RnVThXWTNQcUFy?=
 =?utf-8?B?Rkc5dEFXdktJb2Q1Y2M3UFlKZXF3TTZidmNpeDRwZi9qMUxYd21DaHNvcjZV?=
 =?utf-8?B?c1NqMzAvSE4vRmFoU1BOUEJRNmlYbEVoa0tIekJhbnN4MW1qSXJxMlJBclNv?=
 =?utf-8?B?RGdXSVdqd3h6NTNoZnh3Q2o3OXdGK1B5dWhqUXNjTjV2dkUvVEFwSjVMaGFN?=
 =?utf-8?B?UEpYU2NjdzZvVmVJL0twZUs2RVlpZlZMVks5czJ0Ulo1VzRjem1MMlZkSHZB?=
 =?utf-8?B?eGVsdTlkTWJuUWh3TWpYekorUWhjRFUzUUF5UW94dEFPWXF5dnFGdEpLVVNs?=
 =?utf-8?B?Ym9LWUxTSW1tTHBnZzFjS2xaWnN1UUVXN2VuVlliUFYxb2FaUlFaZnRUNlBM?=
 =?utf-8?B?TlI5ZDlJa21kRmk1MUE4THdDWkRLcHV1MGF4elRkVmZXSThLcnJTR2dNcUY4?=
 =?utf-8?B?Snk2SjdyclJ0WnJ2aHVabUNVcHdrNE5JWncxNGRsa0xmU0NSYjRwWDk3dDRY?=
 =?utf-8?B?UXYwNW9qZWFwZm5pYnpuTUxCanlIUTBBU0lFWGYxV0FlUzNRUDVCVkRnN3BJ?=
 =?utf-8?B?d3NyaHB6cEtEMjl2bE5mcE9DRU5JZFNkeFBsSERBeUx4TjlHWjYyd0gwZTF5?=
 =?utf-8?B?MjFSZVNLSHBPM2tNSm1pTHVFNUR0MnhWSnlMeFA2MTg0S3VxbGUyVHNjYmg4?=
 =?utf-8?B?MTZQTHR6ZGtUYXRnSlVUem5QQkdLbk96elM1R2F1KzAvWDA0aXRpZFM3L1kx?=
 =?utf-8?B?U1hjRmgrWXFBT0VuUmxSWjV0eThkTzI4aFRKRWNzTFVTQ25MdkRNY0JwSitN?=
 =?utf-8?B?VlpodU51Nlc1blBQYkRZeHNESmFPZVcyMDBPWTFDY3BOeTYwYnU3Z1JnWG5X?=
 =?utf-8?B?SzhqczBBaUpsMUFyNW5uRlZqZ0Rnb0ZpZWN2TXB4WVprdklJT3JUb3J2WTNX?=
 =?utf-8?B?RUtkYVkySkZKdU9oL0hkTkhCd0Q3M0EyeEpVQjdYUXVTZmExZzBXWlZxeTN3?=
 =?utf-8?B?K05CSkZERjBtRnppODVJa3ZaNzFVUkl4YXdoOFBEZ2t6VUM2dnh4R3JoMlho?=
 =?utf-8?B?WGp5Q3N6N3cxOEdyYXZQVHFsUEhCVTN5diszbFRQYTgyM1Ivck1lSWtOTFZ1?=
 =?utf-8?B?RWUxaVl1YWh0eERma05Lb0xsUTBuNkppbjZUQjVaUkNsZXNsSHYxUnlVck02?=
 =?utf-8?B?RExGbGtSaGkvazRSYng4OERIejFCVnBBMmhZMXJiN0NNbXFzM2g4WXJkVi9v?=
 =?utf-8?B?M2NyRElHOTNEWVYwWGc3TTUzdG0zZ2tVOTdhOGsvNFl6UDFvS3FoZmxHNVFZ?=
 =?utf-8?B?bkRiNDJZYldsZFRVWUQ0T0NENSsvZ1prcnFxdWNXMkhOQ0hxcUFwTFA2QlRZ?=
 =?utf-8?B?ei9IdWNXTkpzaklCSlVzN3BUaVZ5ejc5Z0ZQTU1ESzBGeXROTWNTUWxrMHpz?=
 =?utf-8?B?Tkl3aTlIaVh2Mm13UXI0TjZ5UmFrWDV2amtqZVJMcWVPL1JtUUpVVlZ4YmJr?=
 =?utf-8?B?WnlwSDBYZFRXMEhXcXR4SFVQanJwNmpSSDFSeEtCSlZka3pEa2VLQUNDbGFn?=
 =?utf-8?Q?sibTsJ71RDsjREB27d4r8/fauXpe+oIi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFjWGx5UW9rdTVsYm00YWFTakhXaEd4dGNrWTZkOTBtZm5FeXh5WFhHRWdK?=
 =?utf-8?B?ZDZxb0Q5U2JTZEhWbmdtWHF6RnFGaDNVTktoWXBIZTZQdXZWVnRDZnFXU0JT?=
 =?utf-8?B?WHFoZEpuOFViUjBjbUMzOGdTV281R2xSZTZ5Rk45aDNXVlYvbWh5eExVRHg5?=
 =?utf-8?B?dFYreGdSazdzVmZZV3dNT0JSUnpjMUgzSWZmOGtHOWJwUkxueEZITXAwdlV5?=
 =?utf-8?B?bFBTQllGN3d1K0JVVnRxaGczU21jT2hQQkVpL2lXNkswSGdDL1g1eldmaEFO?=
 =?utf-8?B?WTVTKzc0aEZaR3Q4bUl5V1ZpaEM5VlBrYW5JcGx0N2lFOXVXY1poeG9NNlZz?=
 =?utf-8?B?R2gwUUJINkIwZGxSWTFGZDhoQW5ieTN2aFRzK0ZLM0tENHlONHRrMU92akdG?=
 =?utf-8?B?U1FOZTI5c0xGY1YxTCs3K3poNlY2aytOMHhOV2tOVWYveFRPUGU1MEVnU0lX?=
 =?utf-8?B?WjBYTGYxcGlybnhhSzh6ZVg4MEpNcmhnWDJmOTYzS1R1MTFSem14WG1jKzR0?=
 =?utf-8?B?MkJDSElFQ2JweUlyNWlSYlM4NXoyR1JoaEFLQlQ0WE5jOHFOTDhkUk0yaC9E?=
 =?utf-8?B?NHA4OFZtRVVPbkppUkFYWFN3OEJrWVAzZ3ZNbkRjTkNmaHByKytvMFdQUVZI?=
 =?utf-8?B?WlhQdk5FTGh2TnFMVWlCejJDNTBsQmN2VHVhVXJqVm9icloxdnFXQnVOMWtP?=
 =?utf-8?B?eFhZejFsek5DR2FhQXAyckxhN0NwYTJPOU1zcGJTMU5Ma0pHMjlIUjFuWjVu?=
 =?utf-8?B?ZXREaUFVeXVGdXYyd0F1ZFl1ODM2Kyt2eEdMQlkxdU9FSytqRUl2MjBwQmFP?=
 =?utf-8?B?N3ExYm43bEhpMmg5VlAyVkJKZkU0NGczTXlIMmJRUEFoY1NtVHNwSUhPSmlk?=
 =?utf-8?B?akRNR0ZoaGxmZzhESFA4ZHdwMU8yeVlOcGtwV0lrWVlWeEhjZk91YThCRXRp?=
 =?utf-8?B?MFhRRXdzck0waEJrWXhHV0dway9scnBLck1CdHl2cFpNQ20rbVN6Z29HQlNu?=
 =?utf-8?B?eGtZS1ZBOGwzQVMveGFzdEdYMFRkemZmZ3psU0ZqUUsxdEdpeFdRU1ZNZTM5?=
 =?utf-8?B?bVkwWGN2VXU1OTdYQTh0OExzSlE5Mk0rb09taUppVW9sU2h5aFNaU0dDbFZt?=
 =?utf-8?B?aVZTRXhWSVo3TEh2elVNZHpOc2ZYU3g0bk9uTk9Hb2FRazFDN0dYckpaYjZy?=
 =?utf-8?B?L3NRVG01SGZWMGdJZXk4K3hOeDNVV3VXc3NjM1BuOFhsZnkwZlQ4ME9LdURm?=
 =?utf-8?B?dVRDNzNlNWhOTU91QmpiL29WcXI2aC9xcDFsSndCUUF0WHBsbjV4clhMZnVQ?=
 =?utf-8?B?TDhmY3JQZVh0djR5bmlDTkVYcTh6L0swSGt5VkZZUHpXYS8zbkxXYWxqRXFy?=
 =?utf-8?B?RjEvTi9qSVVYYzl1Q0tvbzdqeTk3QXRUTEhyazJuSERNR2w3UVZhbGN6V3JY?=
 =?utf-8?B?eG5MNkZKR0ExdytqbHZEbzhKM1AwUzNDa0Q4TU1jcE5qdmVSK095Wk1md0dn?=
 =?utf-8?B?RjNSMjEySVVrTm5nZlFGMkRsR3lrMDBzd3BWS28xSWpEODdIM3FlcFEwQW03?=
 =?utf-8?B?N0ZFTWlRMTgzY0YzTnJPeDVhTmltZmVVYmVEeDJFdXBpSStLZkVycVlxM2Fk?=
 =?utf-8?B?L0N1TEJtUkJpNE5aRVJmYzdvaFdtUU4ydEJWN2lsWUZvMXM4NlpScW96Z3VC?=
 =?utf-8?B?OGR6d3IvSjFta2xHMGEyV01DeWd0ekw4YUYvR2dJbDhkb2VXelhqcVlrVkRR?=
 =?utf-8?B?Smw2L3JiTEhPdUdaak00Q0VmbmRkRTVqZ0hqSmF3TExhQ2FPSStqS2hqRmI3?=
 =?utf-8?B?bno2ZldMM29QMEcwTnFaUmVSSmdqQWtBTkplMld5eWY4NE80bWlJRlhYcHor?=
 =?utf-8?B?V2V1RVI2M05OU3liVU91ckxpUlE4QmRhVHBRZlQ0VlhUNkc5aUNnSys1YitS?=
 =?utf-8?B?am9jaUV1STQxamdCM2FZdmdoS1A5dnlRcmJ6OEN1V1BIOXpnOExwOGNuQ2NZ?=
 =?utf-8?B?dG8zZ3BkV1JCSmkxOGxrR0lyRXl4NHF4ZXdLVk00ZWRPQ2I5Z1pia2xlQnBL?=
 =?utf-8?B?MnFFejVxdkdwMTlDVml2WHhybmlKblAzbkNCRndaQnEzOVUvZHUrVXNvaVNI?=
 =?utf-8?B?WUdlTDZiNzJ5cnlzOUZsdEVtaWdnODQzRVVnUmM3aE8vUkNURnVRcDlGbFNH?=
 =?utf-8?Q?uvuI/4pWx7dDWAGIEe05odM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 660bde10-2618-499d-bef8-08de31e5e1e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:00:54.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5GxyRZgjvjiaRXPvlzBr50OhLzR8yxsYflaLR63vhcc1xUEUet0FB//SJs13tL/VyULfh0ro1MAj5tMp4kE6DGsYjI96OtL2c2l9NuRRxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
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

On Wed, Nov 26, 2025 at 08:16:51PM +0530, Nilawar, Badal wrote:
>
>On 18-11-2025 02:23, Umesh Nerlige Ramappa wrote:
>>Device enters the D3 cold state during both runtime and system suspend,
>>which requires reprogramming the SoC re-mapper index
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>>  drivers/gpu/drm/xe/xe_pm.c           |  5 +++++
>>  drivers/gpu/drm/xe/xe_soc_remapper.c | 17 ++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_soc_remapper.h |  1 +
>>  4 files changed, 28 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index de23fff3262c..9875e3db4a1f 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -551,6 +551,12 @@ struct xe_device {
>>  	struct {
>>  		/* Serialize access to SoC Remapper's index registers */
>>  		spinlock_t lock;
>>+
>>+		/* Last value of INDEX1 register */
>
>Use prescribed kernel doc format, here and other places in the file.
>/** @soc_remapper.state: Last value of INDEX1 register */
>
>>+		u32 state;
>>+
>>+		/* A flag indicating state is initialized */
>>+		bool state_initialized;
>
>We can eliminate this flag by initializing state to an invalid value 
>such as UINT_MAX, and then check this value before restoring the SoC 
>remapper register in the resume function.

I agree, this is not looking good. I am not sure if writing an initial 
value to the register would be a good idea since it may trigger 
different events in the HW (also some bits may not be writable or 
reserved). I think we should let each of the callers handle the resume 
cases, so they can set it to whatever index they want when resuming.  
Then the PM code will call those resume helpers and this layer will just 
apply the config as is. I can add those helpers to xe_vsec and Anoop can 
add it to his system controller layer. That way we don't have to 
complicate stuff here. Does that sound acceptable?

Thanks,
Umesh

>
>Thanks,
>Badal
>
>>  	} soc_remapper;
>>  	/**
>>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>index 44924512830f..8a1b440df4ce 100644
>>--- a/drivers/gpu/drm/xe/xe_pm.c
>>+++ b/drivers/gpu/drm/xe/xe_pm.c
>>@@ -24,6 +24,7 @@
>>  #include "xe_late_bind_fw.h"
>>  #include "xe_pcode.h"
>>  #include "xe_pxp.h"
>>+#include "xe_soc_remapper.h"
>>  #include "xe_sriov_vf_ccs.h"
>>  #include "xe_trace.h"
>>  #include "xe_vm.h"
>>@@ -236,6 +237,8 @@ int xe_pm_resume(struct xe_device *xe)
>>  	drm_dbg(&xe->drm, "Resuming device\n");
>>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>>+	xe_soc_remapper_resume(xe);
>>+
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_idle_disable_c6(gt);
>>@@ -633,6 +636,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>  	xe_rpm_lockmap_acquire(xe);
>>+	xe_soc_remapper_resume(xe);
>>+
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_idle_disable_c6(gt);
>>diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
>>index ed6b6c594e51..c425195f7152 100644
>>--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
>>+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
>>@@ -13,9 +13,12 @@ static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
>>  				       u32 mask, u32 val)
>>  {
>>  	unsigned long flags;
>>+	u32 old;
>>  	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
>>-	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
>>+	old = xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
>>+	xe->soc_remapper.state = (old & ~mask) | val;
>>+	xe->soc_remapper.state_initialized = true;
>>  	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
>>  }
>>@@ -31,6 +34,18 @@ void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
>>  				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
>>  }
>>+void xe_soc_remapper_resume(struct xe_device *xe)
>>+{
>>+	unsigned long flags;
>>+
>>+	if (!xe->soc_remapper.state_initialized)
>>+		return;
>>+
>>+	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
>>+	xe_mmio_write32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, xe->soc_remapper.state);
>>+	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
>>+}
>>+
>>  int xe_soc_remapper_init(struct xe_device *xe)
>>  {
>>  	spin_lock_init(&xe->soc_remapper.lock);
>>diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
>>index 289aa41c3408..507701c74f6f 100644
>>--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
>>+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
>>@@ -13,5 +13,6 @@
>>  int xe_soc_remapper_init(struct xe_device *xe);
>>  void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>>  void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
>>+void xe_soc_remapper_resume(struct xe_device *xe);
>>  #endif
