Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E097ED30CC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 21:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCCC10E54B;
	Tue, 13 Jan 2026 21:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT2ZCqIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21A510E54D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768339986; x=1799875986;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tTL9zZeOPhtVN9b4ihnzX50g+8CLH16/4x5iTXq2LgY=;
 b=eT2ZCqIVBXjfdqccuX05S8M5Ea3jEN6hB1NhJp0go7S/SxWwIC11aX8H
 bEUaQLBTaM2nfGcgkVhzthd+T3FI8qQzBkHB7wf/ulmswbwCJa/iRL1Z6
 NV1P2/GHEurmReqzDLkijId6xkrdexgB5S2tgDdPJp+V7Nw5q3lj34OKV
 sya6CNGc2o2JQRoijkXdDktJnmFy0rvkgvS6SU94x75C9hGxdSbEJOJqW
 mZKChjvybu2JsdCFU3aABSfEcGJ9ENSRydXhC2rjBQbRm9ViHeS8xM5tj
 zdAfq/QYiXGBhPhrq0SAVZL25DKtdQ2stG5csM6taUYNJSqjvkoRQ6UBC g==;
X-CSE-ConnectionGUID: +wtK5R0CTKaOr5skuG+bjw==
X-CSE-MsgGUID: wE8skrlYQsSlCS3Bkno8Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69691716"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69691716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:33:06 -0800
X-CSE-ConnectionGUID: f9vA004LTmSgGnLIi7vVOA==
X-CSE-MsgGUID: tVKMLpQ6SDOSiPhy25eMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204512558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:33:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 13:33:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 13:33:06 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 13:33:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrY+nt12IU9OoEk/xlvWxeMNnVOZdCZeicNckY30+2p4cv+tU7UkjHz/rhYUU0m1pUKbU+P+JFKJqFsrvhj1Q+emlJ9re4GFe2GQB2dRAKkQZ3x9J54w+5kHhy1l1KZul1n3B0vd21MPiwYaWoRRc72PcjIHrDj5gz+esxbqUi87rz4SRTPwb08TtJWKDz9ORirvmbQ8H2e54br7V0DXzrO7XD8bfDRnhGCeB5eHcAie9FG5Fn9+5jAo2pg+fLBJjohyWrThn0n/qQmY4AaSXD6N5ARxqC8s2RCNBw8/a7SZkdq6bj0PpZKn371uBlZmgw6HRMsjJqMU65MVMwHQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTL9zZeOPhtVN9b4ihnzX50g+8CLH16/4x5iTXq2LgY=;
 b=ppBPJrh9XQKGcD1ihrcmMdd5h7jnNJqM+qqAd7LBAe3LLemIq8AJJ85BHJ1+nsBCuaymR9c9D3e7AIWSHl2dknkU23WptKc5mTDsk6WoUWHaXxYwhXXGUf4HBAki91Lefmc/g72XHHo/wTzd6GFpF6shsqTtL7iSpRjNXNQa5lT1ESIg+4/BApaWMtITI101xrGCToP80BDkoEe1GCo+BA58AOXRvlTpXlKfw4bnnnkSSeGnOh9G0MrXQOPlrE23EmzWJmDINfjQuZte/juZbKl2XI/q0V/rgBqc3IoEly5cKtTZ23moioFO1gZ1xaV/KFQEygB22rc6m1TxNUZirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 21:32:58 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 21:32:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Topic: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Index: AQHchDe0SuBnIDUK9U+ntLOGaNjbl7VQn+0A
Date: Tue, 13 Jan 2026 21:32:58 +0000
Message-ID: <ea9d5cbec2dfd68f0cc2f54834b28055ca29ab92.camel@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-11-matthew.brost@intel.com>
In-Reply-To: <20260113025232.3504648-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB8159:EE_
x-ms-office365-filtering-correlation-id: 41e1b9dc-0c52-485d-ab94-08de52eb5218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RjA5N2d5QVZsWXN3cWxyOEdmU2pLeWk2bGt1UTkrTG0vRTNXUks5UGxKdjBq?=
 =?utf-8?B?cWNISllDWmljazhqQTBXalpPVXR4NHJQelE1N3ZjZENybVNTdDRMS1o2ZThP?=
 =?utf-8?B?aU1scUcxMzNFcU9xM3NiSlVxRXV4VVVZVlgyWm03RHNoTEh6NmE0aDQrem4r?=
 =?utf-8?B?TlV2eGFVQnNpSWYzaHFOeVNrcFdGeXluNndIYjhhVWthcHdQTXNjMnN0WTRS?=
 =?utf-8?B?OGdFQXRoaWNmL0dhVTRWV3h4V0Nhd1VLN2xTM2I2ejVRZno4NDYrMEttZkEr?=
 =?utf-8?B?TGcvRGtMY2J4RmkzT0hRWktBVE90ZXJZVURCaGtYT1FObVk0dS9QVDJTdlJV?=
 =?utf-8?B?S2lINGpTeTdyaFUwbGtPSGlkdzNKalZ4azMyclNTVGJtUW5BSmNuVUFQWTNS?=
 =?utf-8?B?Z3F1RU0xM1dsdVRkVGY0cS9XTStLQnN3Nkc1VjROR1lMRm9SNEdVTHB0Lyt0?=
 =?utf-8?B?UjZyVjVrVTNVaVlqdHJRUG4yRXorYytZMUtwU3NVdmpjVGRUSEtOZXJxYVY1?=
 =?utf-8?B?eDJIQ2ZYZnV2dHZxWEVsOG5FbldjV2ZVTlNLcUl6dThmZTR3Zi8wNzA4Wmty?=
 =?utf-8?B?ZXJKVC9KaC9MOVR3NVhrelJ3dEl4TXFtS3ZPVFVSLzZSdDdNS3ljNVBPUVFP?=
 =?utf-8?B?aDVXTHRRYzZmbFBzK05sZWVlTktYWHJjTVFoL3VyRWUxdXpDVy9WWmIya21F?=
 =?utf-8?B?NG1VUHczcXBjeGYvS0ZrcHlMNTRmZmNSZ3p3blJGUzVzNlFnYTFoNFRUa0sv?=
 =?utf-8?B?a2ZJVGozZVpXTThmbjRod0VmVW5BVTk5azZ1WkhoVzlCeXNLZWpQdE8zcWds?=
 =?utf-8?B?Qm1wVmZJa1VKaVJiRWpxUzRXZnQ1SHpHOUJDR1EzRXF1SnM3YzFPZERsVFRn?=
 =?utf-8?B?UGlhQ3AwUm9jS01xTGcrVlIraEZHNjBxUWFOZUt5U09EMElya1lTUVRnRDZH?=
 =?utf-8?B?a29iU1JWTFVEZHl0MnFZelhqTlhuNWN4SEczOWxGZnlDWTlDb2hRME5vRlk0?=
 =?utf-8?B?QnRDVGh2UlM1bytnTGk0dkQ3d1lhUDIwclZMSXgyUWxrZkdUUjNSVTRiNzJQ?=
 =?utf-8?B?cGl6THM2OUFlRHFVQkpMcWJRd1ZFeHJ2dWFObEpwbWRZQ2RITGRmSXhITWNH?=
 =?utf-8?B?S1FLZUNBQmpEYUxLQ3I2V3ZZWURLRkcyYm5iU1hiajd2V0lvWUxSaVZLMU1l?=
 =?utf-8?B?SFNnd3hMd3RnRGRQQUljdGdmQVRsbHVzd1d4emsrVnR0aC9tQXhjdFBtQndn?=
 =?utf-8?B?UytTU0gwZ3AzMU1HeHI1QzlmamY0Y25YRVZSTG5tMW96TjBmRXl5LzRZbjly?=
 =?utf-8?B?NVRTdDNmeVZHVlRXRGgrZm83ZXVLaDZGek95T05haU5IbWtzSXkyYURsLzlU?=
 =?utf-8?B?R0VJL1NsU1ZnOFZacTNuWSsrd2JmYStSK2xTTUJ5LzVvWWNkSktXVEVEa1pJ?=
 =?utf-8?B?dFkzc0VDMHV0SFdZell0UmE4R05sWkNUMjF5c21Gb0hvSE1lSlRtazFFVVNO?=
 =?utf-8?B?LyttYmpsMEI4QTc3clBuZkJBUWxNblpZd3NYWEJxWktMcExZTi9vRCsrSkVR?=
 =?utf-8?B?bjBuQnVSc05UQngxTmRacFRYVjVpRUExUFZDWUpDRE9wM29WSmtyY1c2YjBh?=
 =?utf-8?B?L1RLMWR5UHArMnB5NjRPVUZzNEE2YWY2cHlQWTF1YkRyeG5vcHo1L2pKR1U2?=
 =?utf-8?B?dGpmWnAxSEJCb1R2dnJsalI1ZllqN2toRFpBMW9ORmRLYlY5QnVGOUNRd1pU?=
 =?utf-8?B?dzhjaWZTbVlBczBPRXVteTAzbnltNFV4OCtpd2NiTDhiQTgzUHBScVp5NTY4?=
 =?utf-8?B?Wlo0L0xCZ2FFdnZweStmRW4xaUtDOGNJUHFidXhUK2pMaWdjbGtZZy9zVjJt?=
 =?utf-8?B?WGRQcnFGRkNuM1d3Zk9qcjM0WXlmS1RHY1RkaGFIOWFKR29LU09YTjVmM1Zl?=
 =?utf-8?B?eWtRMS80NWJHVnlvVnUvK3NxM0FlazR1K2owTmhsNnZ2UFgzYTFudWtXVHRG?=
 =?utf-8?B?WTI0a0t2MmtIYVlkTFp5alBqZWdUcDY5Yzd6a0FjZUdaaUF5VUhGRGUvekUv?=
 =?utf-8?Q?kYDJle?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXNFUEcxTHRNdmZzWWlxMWFFRGpyRDB3QjNDTk5nY0dvL3RVb3IwWk1FVmFP?=
 =?utf-8?B?Nk5waDJDeDFORmloa3dtaGhJYWN1WFcwTnREYkVqMEd5YXZqWDdBbjg2QTYy?=
 =?utf-8?B?MkxCd2dRSVU1ckthZUZlOVNoZEhZZ0JkVlQrcUJrblYrTCtmVFRrcERONnpw?=
 =?utf-8?B?THIxaTFqcGxoejVPR0s1K0t3d216QXhWYVRvbG1RbVdrOVdVQ1J4MUlnUlZv?=
 =?utf-8?B?V08vWCt1bDNNNTR6ZGlOMnBXNW8vcVZsb0JHUzQ2bzZTWmYya1E4eFE4NGVy?=
 =?utf-8?B?SmNNdGVJSUpzMFZkQ2VhNk05dnZwOU5zaFhGRXZrRnYrWjlnZDBOMDN0Z205?=
 =?utf-8?B?NmJPSXlUck0wSXM0aXRFQVNwMjFEREpBNW91Q01ubSt4SjhlcHhVU0FMdWtv?=
 =?utf-8?B?Zi9sYmIzejdnRjVGTk9lNmJ0NnQ4MnFxY1JmaW9pQXRvczlWendubnpPbEk3?=
 =?utf-8?B?MWZyQk0rNHMxcTJnOE1JeTBCK3BoOTZKY3lSM1hYbEVpT0tOMjNxV1VHamVh?=
 =?utf-8?B?OG5GdU1WbHBDZVk1Sk5YQ3Bad1V4SWJaSXg4YUxQMnMyZ3NYOUhtYWo1ajli?=
 =?utf-8?B?bzNuWkoySEpOZzV6NDltVWMycDA2NGN4MW5OenUzcHpoWklONGJ1eFFaMDlQ?=
 =?utf-8?B?endic2FBN0VtejdTZy9ZbXVjOU9DMXZlS0dVc1BNakNKVlVGVVFVakJ1Vkcx?=
 =?utf-8?B?ZTdIdks5RmtLazlVZ1ViV1liMUs1a3hiUXI4QksxRk5ZNjdqb0crb1ZoNDQ2?=
 =?utf-8?B?emZKMFNLd04wQVd5WG9nQW9IVXhDZ21nc1hsN3BOeWtqS3AzSG9wSk5YWDZB?=
 =?utf-8?B?L3o1RFVibzYxNUlzYW1wRmxOZVRYOTl3Q2NiNFg3RmloZi9oOWRCWWtWZXVr?=
 =?utf-8?B?c2g1MnJseldLaWpENGh4R1dOWGk4U0o0b3Q3bmVJTnBTZHF5U0c2bkNZbjFT?=
 =?utf-8?B?QzBzSUpsLzYyUFpXY0loZ1dpbGw5NFkvMDBDeUVNcllSWjI0TXJaU1RnVWdO?=
 =?utf-8?B?dkhEcmpzZkdFRU16eGYzbC9CMXpybVBFTi9HaUJDazlFWG5YSzFsRnNqQkRB?=
 =?utf-8?B?dnRYc0hYMXEvNXRIUUtWbFdQWG9rSE9qb0ZlbndzQ0RhKzZHNzlSekJEK2o4?=
 =?utf-8?B?TEJ3THRTdmFMNm9RaVFsMGhnci94L1o3bzBRT1VqTU5zWFZQV0pFcWpYWGRX?=
 =?utf-8?B?RXFGa21QVkRuRGtPTGRaOUlRM1lFa0lRUGtsbS93MmZUS1NIb0tjckJWblZm?=
 =?utf-8?B?cUR5QjZYRlZrRXcrY0FaRlRtcXFJWldXOXhPc1FZNWNzaUJuVDBrS1NubUxC?=
 =?utf-8?B?dXI5eldlNjc0VjRlOGdjSTNFajE1WmtVUUxhWkNUR0s3YVY4bnFjaEQvUE5V?=
 =?utf-8?B?dGxKb1liTDNINFBWaVhNTEc0a2Z0aTYzSVdhb2dWZFppaUxPMm1EcUg3U2kx?=
 =?utf-8?B?aWxQV1FGNFBKalVYMlZqUjIvSWRsY2RXRnVDeEltQmNuZjBwSWVIKzBGYU9R?=
 =?utf-8?B?NnBVdkNJLzRYOHBxdXp1VmVuQ3VERkMxK0VtdHNOMWxxQytPbkRjMTdNMjZn?=
 =?utf-8?B?ZWNUbGJOeE5RMU81Tzd4eTdQdFY3RWVMR0NscnhSZlN3MnV0UzNmTk91RllD?=
 =?utf-8?B?Uko0bGxxang1aDhPaXFka09jWXVrckJ3a0VnQWJOY0lCZTIvZTlUTm1Fa3hD?=
 =?utf-8?B?Z1l5UnJyeFJ1WDZ0cVFDcG1hUE9NdnVjbE9COUNZU0s0NjBOdTkzVFBiL08v?=
 =?utf-8?B?TmdvN2hWUjFjOWsxUVVacjlJU25zOFEvd0d6dWs3bCtNZ2NXWGt1cjVQK0Ru?=
 =?utf-8?B?TzJLcm82T2t0ZTA2TkhuMHJqRHd0cDlnWlVYWGxkaHkwN1dSdy9ieUgyVHlH?=
 =?utf-8?B?YTFDK296NmVrcmlIZDl3MmRjMkxYUUh4U0VVc0YvV3FzcGNXaGdtSTNWaUhh?=
 =?utf-8?B?M2tYYkUxRE5ZNFVkV0MxTU9raXVWZTlkY3FJM1Radmp4d0ZjbVVQNzF5a3o3?=
 =?utf-8?B?QTc0dHRWVFNSOFdaRUpzWi9WUDgzT3FRQ21jZ0hyZldSRWVjbWFVaGFJR2dO?=
 =?utf-8?B?TzIvTGc0RDFhN0xnT2QwWCt2SjBpZ1dsS3QrMGRJNy9hSGd1VjlZZDdVWVZJ?=
 =?utf-8?B?UDRDT2NPTVQ2TlBDallRWUlrY3NJT1U4NEtNRmQ2eUV1VUlWaW1DZ2hVQ2Uw?=
 =?utf-8?B?WEx2TVZiMWNkR1NTUENsRXRleDdxd1J0WWRWUDU1cTliaUtJbGllL3dROWFP?=
 =?utf-8?B?WEJqa2Q3M29KV1RUajlVT0NiVHRGN0NzYXIycndVK3dndzdaTHRQWUFjalph?=
 =?utf-8?B?TjNmSXJOS1MwQ0xoVk9DaDRCVEZrNUFnTGVkNU8xK3JucUtYTDZMbzRwbTd5?=
 =?utf-8?Q?uea27tOAW3WTG4pk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89272546A97E0F4693C1F2DD9557DB1D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e1b9dc-0c52-485d-ab94-08de52eb5218
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 21:32:58.1177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pln0vidY+CsuPLuzyNZHoZXGFxoCYM5dt+BbnfrCBxoNt1Y4Cxejz9jCmp6HUsPWAS0t1JmLxgfoBE1fxgevTJz+fviB1kJRDR2g/xAOK8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE4OjUyIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBJZiBhbiBleGVjIHF1ZXVlIGlzIGluYWN0aXZlIChlLmcuLCBub3QgcmVnaXN0ZXJlZCBvciBz
Y2hlZHVsaW5nIGlzDQo+IGRpc2FibGVkKSwgVExCIGludmFsaWRhdGlvbnMgYXJlIG5vdCBpc3N1
ZWQgZm9yIHRoYXQgcXVldWUuIEFkZCBhDQo+IHZpcnR1YWwgZnVuY3Rpb24gdG8gZGV0ZXJtaW5l
IHRoZSBhY3RpdmUgc3RhdGUsIHdoaWNoIFRMQg0KPiBpbnZhbGlkYXRpb24NCj4gbG9naWMgY2Fu
IGhvb2sgaW50by4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19x
dWV1ZV90eXBlcy5oIHwgMiArKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5j
wqDCoMKgwqDCoMKgwqDCoCB8IDcgKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmPCoMKgwqDCoMKgwqAgfCA2ICsrKysrKw0KPiDCoDMgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1
ZV90eXBlcy5oDQo+IGluZGV4IGQzZTI3ODljZjViYy4uOWNjYTU1OGM1ODA5IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gQEAgLTI5OCw2ICsyOTgs
OCBAQCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMgew0KPiDCoMKgwqDCoMKgwqDCoMKgdm9pZCAo
KnJlc3VtZSkoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpOw0KPiDCoMKgwqDCoMKgwqDCoMKgLyoq
IEByZXNldF9zdGF0dXM6IGNoZWNrIGV4ZWMgcXVldWUgcmVzZXQgc3RhdHVzICovDQo+IMKgwqDC
oMKgwqDCoMKgwqBib29sICgqcmVzZXRfc3RhdHVzKShzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSk7
DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAYWN0aXZlOiBjaGVjayBleGVjIHF1ZXVlIGlzIGFjdGl2
ZSAqLw0KPiArwqDCoMKgwqDCoMKgwqBib29sICgqYWN0aXZlKShzdHJ1Y3QgeGVfZXhlY19xdWV1
ZSAqcSk7DQo+IMKgfTsNCj4gwqANCj4gwqAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjbGlzdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNs
aXN0LmMNCj4gaW5kZXggNDZjMTdhMThhM2Y0Li5lNGEyNjc0ZjQ4YzcgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjbGlzdC5jDQo+IEBAIC00NjksNiArNDY5LDEyIEBAIHN0YXRpYyBib29sDQo+
IGV4ZWNsaXN0X2V4ZWNfcXVldWVfcmVzZXRfc3RhdHVzKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
KQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRp
YyBib29sIGV4ZWNsaXN0X2V4ZWNfcXVldWVfYWN0aXZlKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
KQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqAvKiBOSVkgKi8NCj4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9leGVjX3F1
ZXVlX29wcyBleGVjbGlzdF9leGVjX3F1ZXVlX29wcyA9IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5p
bml0ID0gZXhlY2xpc3RfZXhlY19xdWV1ZV9pbml0LA0KPiDCoMKgwqDCoMKgwqDCoMKgLmtpbGwg
PSBleGVjbGlzdF9leGVjX3F1ZXVlX2tpbGwsDQo+IEBAIC00ODEsNiArNDg3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB4ZV9leGVjX3F1ZXVlX29wcw0KPiBleGVjbGlzdF9leGVjX3F1ZXVlX29w
cyA9IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5zdXNwZW5kX3dhaXQgPSBleGVjbGlzdF9leGVjX3F1
ZXVlX3N1c3BlbmRfd2FpdCwNCj4gwqDCoMKgwqDCoMKgwqDCoC5yZXN1bWUgPSBleGVjbGlzdF9l
eGVjX3F1ZXVlX3Jlc3VtZSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5yZXNldF9zdGF0dXMgPSBleGVj
bGlzdF9leGVjX3F1ZXVlX3Jlc2V0X3N0YXR1cywNCj4gK8KgwqDCoMKgwqDCoMKgLmFjdGl2ZSA9
IGV4ZWNsaXN0X2V4ZWNfcXVldWVfYWN0aXZlLA0KPiDCoH07DQo+IMKgDQo+IMKgaW50IHhlX2V4
ZWNsaXN0X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1
Ym1pdC5jDQo+IGluZGV4IGJlOGZhNzZiYWYxZC4uMTkyODJlNWNhODk3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTIyMDMsNiArMjIwMywxMSBAQCBzdGF0aWMg
Ym9vbCBndWNfZXhlY19xdWV1ZV9yZXNldF9zdGF0dXMoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUg
KnEpDQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXhlY19xdWV1ZV9yZXNldChxKSB8fA0KPiBl
eGVjX3F1ZXVlX2tpbGxlZF9vcl9iYW5uZWRfb3Jfd2VkZ2VkKHEpOw0KPiDCoH0NCj4gwqANCj4g
K3N0YXRpYyBib29sIGd1Y19leGVjX3F1ZXVlX2FjdGl2ZShzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAq
cSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGV4ZWNfcXVldWVfZW5hYmxlZChxKSAm
Jg0KPiAhZXhlY19xdWV1ZV9wZW5kaW5nX2Rpc2FibGUocSk7DQoNClNvIEkgdGhpbmsgdGhlIHJl
cXVpcmVtZW50IGhlcmUgaXMgIWV4ZWNfcXVldWVfcGVuZGluZ19kaXNhYmxlICYmDQohZXhlY19x
dWV1ZV9kZXN0cm95ZWQgcmF0aGVyIHRoYW4gZXhlY19xdWV1ZV9lbmFibGVkLi4uIEJ1dCBpZiB0
aGUNCmNvbnRleHQgaXNuJ3QgZW5hYmxlZCAoc2V0IHJ1bm5hYmxlIHRvIHRydWUgaW4gR3VDKSwg
aXQgbWVhbnMgaGFyZHdhcmUNCnNob3VsZG4ndCBiZSB0b3VjaGluZyBhbnkgb2YgdGhlIGFzc29j
aWF0ZWQgbWVtb3J5IGFueXdheSBhbmQgd2UNCnNob3VsZG4ndCBiZSBpc3N1aW5nIGFueSBpbnZh
bGlkYXRpb25zLCBzbyB0aGlzIHN0aWxsIGxvb2tzIG9rIHRvIG1lLg0KSXQgbWVhbnMgd2UnbGwg
YmUgZG9pbmcgZnVsbCBpbnZhbGlkYXRpb25zIGZvciB0aG9zZSBJIHRoaW5rIHRob3VnaA0Kd2hp
Y2ggY291bGQgYWRkIHNvbWUgcGVyZm9ybWFuY2UgaW1wYWN0IGluIHRoZSB0aW1lIGJldHdlZW4g
cmVnaXN0ZXINCmFuZCBlbmFibGUuIEZvciBub3cgdGhvdWdoIGFzIGxvbmcgYXMgdGhpcyBpcyB3
b3JraW5nIChzdGlsbCBkb2luZyBzb21lDQp0ZXN0aW5nIG9uIG15IGVuZCBhbmQgSSBoYWQgc29t
ZSBxdWVzdGlvbnMgaW4gYSBsYXRlciBwYXRjaCksIHdlIGNhbiBnbw0Kd2l0aCB0aGlzLg0KDQpU
aGFua3MsDQpTdHVhcnQNCg0KPiArfQ0KPiArDQo+IMKgLyoNCj4gwqAgKiBBbGwgb2YgdGhlc2Ug
ZnVuY3Rpb25zIGFyZSBhbiBhYnN0cmFjdGlvbiBsYXllciB3aGljaCBvdGhlciBwYXJ0cw0KPiBv
ZiBYZSBjYW4NCj4gwqAgKiB1c2UgdG8gdHJhcCBpbnRvIHRoZSBHdUMgYmFja2VuZC4gQWxsIG9m
IHRoZXNlIGZ1bmN0aW9ucywgYXNpZGUNCj4gZnJvbSBpbml0LA0KPiBAQCAtMjIyMiw2ICsyMjI3
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9leGVjX3F1ZXVlX29wcw0KPiBndWNfZXhlY19x
dWV1ZV9vcHMgPSB7DQo+IMKgwqDCoMKgwqDCoMKgwqAuc3VzcGVuZF93YWl0ID0gZ3VjX2V4ZWNf
cXVldWVfc3VzcGVuZF93YWl0LA0KPiDCoMKgwqDCoMKgwqDCoMKgLnJlc3VtZSA9IGd1Y19leGVj
X3F1ZXVlX3Jlc3VtZSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5yZXNldF9zdGF0dXMgPSBndWNfZXhl
Y19xdWV1ZV9yZXNldF9zdGF0dXMsDQo+ICvCoMKgwqDCoMKgwqDCoC5hY3RpdmUgPSBndWNfZXhl
Y19xdWV1ZV9hY3RpdmUsDQo+IMKgfTsNCj4gwqANCj4gwqBzdGF0aWMgdm9pZCBndWNfZXhlY19x
dWV1ZV9zdG9wKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEp
DQoNCg==
