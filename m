Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C8DC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588D010E125;
	Mon, 10 Mar 2025 05:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lod9eh1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E1F10E125
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741585719; x=1773121719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R94P1Oz2rxduOA9f8QOZQ7TpJhqwe6MEaiQ9JcW4LLI=;
 b=Lod9eh1U9VC0/dPcZueQMqTRWLAgDPh0+qV3ZG47K9zQ3iqTgkl+krik
 ATDMeoGS2HslEAcE1jbnOjBrq8BnP/QLrSYpiPLZ7Qg5JbD9aDZOEe1Ki
 N5uTVWXXvheLdyDB6gXD77l+e7lTWgoLQMiPmcqIc1KHmIVRvJK3FhWdP
 GdqMW/a7GmjziUk73AyDMcEECA9sLjz9D+yuKezYhT19rYalJJb8/Sf4G
 duUZ/EBbYv7lwhVqeYjBIF+SjToHc8X+M1dRERUA6TM4tjqmnH0Cq+3CX
 Em1kGqYx2aG800vWPt2pnGLRX6BzOpE7FxU4YZQ2PBWoNrcaflwAw+XK2 w==;
X-CSE-ConnectionGUID: oOsoSKCsR0O/iZVyJoLM0A==
X-CSE-MsgGUID: BpFk9AvhRrmNEtihP4LPQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42756776"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42756776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:48:39 -0700
X-CSE-ConnectionGUID: 4YqFw73DT1q6ti2MZ+VZ1w==
X-CSE-MsgGUID: 1L1Uf7csQs+s2708791jMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="124055163"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Mar 2025 22:48:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 22:48:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 22:48:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1VAyDzgcdY2cqr3AX7abaaskPM/+U6GLUDBqz0L04VGwLOrnSYKx+iZt6JIn9vUQDa4Zs8tt0bHDIH/Yl9SNMVkFdQVpsrP/LQj4cwqld5JtvlNoOQNkyjshqqHgh903cZyJ6ITu6WRoSp3UWUQkW8Ms1ezOeSmdb0OWIfTjYLrqplBiueIB4oQWsiSiESw5HBjgcFcFStVoKOtKzMdYaYHWjeo3j8LEFJiq5GXA1nZmIOP5kgEc+22NNykPtujtRCOiCklfbqXpDzw3PwQGDiRbisyc3bI/L34i6JHMA7JZeIDeN574HurncPYVAf0JZy7W2zDEoswsceKSrxBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85a/Q9USg0s6tg7jIfpMtjI8SbuM04Sq2N6EW/HbaBY=;
 b=ekunHmnVQKMsxPnsSeqF9SzR39KreutiiNal1+Lr3RJAaVeC7MDJ5bHSp3469AootCq/eeib5Xa+zI45cXsYtIDCcKICAdOQ+RDIXarwrrYvx4ZQ8e7NA8IaRTsT0aS1ezm3eA84hfk4olPm7MfprjUWZzS4yE14V/nf67ecIFd2rQTD3yiGXp0qmJ76mUfIeaM7ns154j3zVrqz5dHpTd47KaRahovoAyX52S/b7pCr4ITYaruFaifdXouWMHlFnBMPK7MNDMag+tmU7pXNwRcNKCxKxhRyS6uRgq5jvHGCiEPIC6XUuklzJ9hhGxQYW47k0+grG+DrWLQi6WmMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 05:47:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:47:53 +0000
Message-ID: <606244e0-3dda-4772-9924-82f0cfa20302@intel.com>
Date: Mon, 10 Mar 2025 11:17:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/xe_pmu: Add PMU support for per-function
 engine activity stats
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
 <20250304095743.3274062-3-riana.tauro@intel.com>
 <Z8o4q8za9PlUHBfc@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z8o4q8za9PlUHBfc@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 267e6b22-68e6-4ed1-bc23-08dd5f971987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZYK3hoNXhGUzJScVFiZC9jNXRwbEwxU2pQdEgrZUwwbCt6ZjlIc0xMZXZh?=
 =?utf-8?B?b0dRK3NNTmo0WU5kMDVQbW5FTjRmMTJhaGUzWTkvYjQ4ZXBoTUdjSU1BUDZy?=
 =?utf-8?B?VWlKdTFjblBHRWlXNTRGdktuSmxneEUwdnJ5TTVlWTh4WWJjNlR4UGtiUHYy?=
 =?utf-8?B?aENNL1ZqbHNKTHVEYUl1VFVKUHdrczB5ZHJCZUlZVXdkeDVSMkdZTzVnSk9S?=
 =?utf-8?B?clFJWjhLM3BOZGsvMmtRd1RYZzY2WTE0UFhaanJzRWRuOUdVQVVjNDdmT0tZ?=
 =?utf-8?B?Yk9vVlVVV3lzelNGVktUL1NsRlpRYXA3WHNrVjloQmJjcnBDekx5ZHlFTTEr?=
 =?utf-8?B?MmRTSythaUhiV2lxaEFSakw3bjNlayttVVlkMERTQ2RzNC9GK2REYmZxb25x?=
 =?utf-8?B?VS9JM1ZuSTVTVVJFT2JJcDhiWUY0dElVMW5NNHBmNmpTTUpFUnVvZUQ1eXFw?=
 =?utf-8?B?ckttQ3BEZFRWY2FjblVGSkl0M05iam9jZ01sRG1QTHBPTFgyQmJzeWN5YW93?=
 =?utf-8?B?SzA5MmdSSjBrUzdXN2hhUmdUM3NaNnZHMFdjL3V0TGlwS0hDdHp5ME5yZkdD?=
 =?utf-8?B?ZGZ3L1pvSEI5MTZGbVhHT1dLYkdSeDA2N0ZXUWVhS1BqUllLS01TRWpCaWVO?=
 =?utf-8?B?RkdqYXNZaE5yOEc5d1Z5QkMwTXRoRmhJUVBHeVoxNHNIM0pyWWV2aHB5UUgy?=
 =?utf-8?B?Zy9yVWNoYzJpRTl3ajZiY0p3d1I3bDQ2emEwNjB1Y3ZPcjdYUllSSk9kVFAz?=
 =?utf-8?B?cmgydnE3UVBTbVJBbGVqMmFYYWFMd2xIN3ZSOWREaFY2WkRGRTVrYWdJSCs4?=
 =?utf-8?B?TDg5RUpGVFMyTjQyZmdqVDBsOFM1enoyN0RyRWtpY0M5bGNkN3I3TVNmdzUr?=
 =?utf-8?B?b1dTeVJnL3RwVUcyM1NsNlFkcVRDRnR0R1JoOFU1Q3ZSRElic2NtbnFkTHdv?=
 =?utf-8?B?TEtwekFHaEFUck5LT0U5MzdiRWZNVGlGYU1KOHRxK29GdnpJc01RRzhnZmhp?=
 =?utf-8?B?eFFiaDF1VVhYa2thWndwVUgxWWRBVGZITy8zdVh4QW5OZ2RZQjBEZ254aUZi?=
 =?utf-8?B?aGtqdE9LNk1xcnM0dTd6VWRaT1RaV3drYXZad3c2cnNDbFliQ2xPRkhGSWt1?=
 =?utf-8?B?aHdhdy9DclJERWpzL3UweTJRTzFwZVV2RGw0TE5OWlJKWGV1dWZ6TmVkdDZN?=
 =?utf-8?B?bktDLzQ3ZThuRU5oVGFvRk9GL1ZCZXNtTnh2MHNvSnhUcHZOcXJmakFCYWhx?=
 =?utf-8?B?V1BkcGhPeHQ2Qy9Fa3FLYzJTSnArYnZLdEsvN1hKOWxGaHVnV09ia1E4MC9y?=
 =?utf-8?B?UlVpa2FjUlh5enJOemFDLzA1a2V4ZGNCQndrWmJMLytpdW4zYk1lMGg5bUZ0?=
 =?utf-8?B?NDNEUWs5UllMZkxQdTBPdTVOaktuOXB5V2lMRnBrdmNPTzJiVGZ5NWlLV2Ux?=
 =?utf-8?B?akZiODZCVi9xWkJmNGE4YnFLTmlrT1ZkcTVTSGp0NzlXakdsRVZib0JCdHdL?=
 =?utf-8?B?dkhJZnRpSlpNZ29DT1Zsd0pMZUt3RDNucG4yaTFac0duQXRWR1c2ZXoxUE5S?=
 =?utf-8?B?ZVQ0c0I1dnAzak9TWlpDK21OWmJjWHNKTHp0MUJZVWJqR0E1RmdlRHJTWmt3?=
 =?utf-8?B?ZnJsNFBic2FzNElETjBQbkFNZmJrOHBjcWJhcVFvNExyVHF3a0d4eVJqS1Bl?=
 =?utf-8?B?KzIydzg4cWNPT2tMeXBWVE04Q1B0b3JueUhtNG1SWlVRU3RiRDIvV09wRFpX?=
 =?utf-8?B?K0hKODZoeHA4M1hWYnZnYUxzL2grcVk1NTJQMERZS2lUekVXQUlPUWlrTHpm?=
 =?utf-8?B?NmlST2xNWjBHQ1JHNHM5blQ2K1FPTXNUTTFLM3p4ZloyaEM1T2FaUnplMUhU?=
 =?utf-8?Q?8Cw3e2cCPJ8ar?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDNmVStzRERDTnVoQmlXbERWQkZyc0J1YmkzODdYa2llRzluTVV2WU9EQzNo?=
 =?utf-8?B?R0QxdHNnMmkvamlFU3FjUkxVMldzV0VOd3FQZWJ5MWI0L29mcm9Pa2xJdy9W?=
 =?utf-8?B?Y0dPK3J0NlYzNktFUXUxSHY3YkZScGJJZ3k0dDU5STlqYlc0MC84aDBsOXB0?=
 =?utf-8?B?eDVzK2pRbTc1eDUvU1B0ZFVRZi9pMTJ2UmtYQ0JWTkJtb1hiamljcklsM1J3?=
 =?utf-8?B?ejlyUjhPY0RGWXBVVHZid1F4NTR0eFl0c1lrZVJIVFhLMEtNd3c0S3hPS3Nt?=
 =?utf-8?B?dUc0YXZVNHphQUdEbkFML3NSWFc4a3dqcXhYMFhDalBmYTdDM0xndnQySlRI?=
 =?utf-8?B?dzRxUGpxUnJQWGtNNHBIbkppSUVUWm93a3pydzVudy9GUXdIQ2RibEpuTExK?=
 =?utf-8?B?bDFqYUUySlVtaFRPWU1EVk9xdDNFNDVjV2RuekN1QW5kQWRHVVlOcmFEM0R6?=
 =?utf-8?B?ZnBya2VLSGhNMkF1amNDcmt4TFBzdTEvTng4b2pvTDNtMnVuNndJOUVWbEI3?=
 =?utf-8?B?c3F0ZGtmeFV0bVNDajRHSmlyZFBrcGZiK3pIT0xYUjU5SUU2R0Y3OHFmR1Nx?=
 =?utf-8?B?TXZHNU1MVzZwdVBySEFKNlhRSSttSEJhYTdSWDlycWl3YzNialk3cjRiUXh0?=
 =?utf-8?B?aEJyelJtR3RzWTM5Y1dacEdYQXZodDFmcG9DWUgvWWNnK1d0b2YySHRhbzhh?=
 =?utf-8?B?bFlmUDhtMGlpMkxjRXR5T1dyYzkxdlZIai9jNTRsbW8xZStmZEFVZkoxZVN3?=
 =?utf-8?B?SzZlbzRRbTJMY0lyUVlNS2FQOG1PZ0MwQkpuYStOYmRyMUhWRWtoaUtlWUJC?=
 =?utf-8?B?aUtOekY4UjVFd2t4Mk9vbVVKNmRCbzg3QVp6Q0dhVDk5YnA5Uk9xd1AyVnIv?=
 =?utf-8?B?Vmx4NzhoQzg5ekdiTUFnSE53ZGxFM3hwcTVMUS8zSEd4UG1LS1o4TjhFYU15?=
 =?utf-8?B?eVpxMEhLVU83Uk5NUlVVMHhRdTB1VFVPZEhkRU44WkhQVHNtR1p5TFhPUEpG?=
 =?utf-8?B?UUY4UHV3OWpBcEY3WDc4aVJObm5iRzFneHZQY1Y1Nkk2anBVS2tFWGRGUU95?=
 =?utf-8?B?OHpyTzdDODlDck1Kc2tnM0R4RUtvNHd0NkRHTTcyS1U2OElwbkFFdUtoR05E?=
 =?utf-8?B?ZXlNdjNsZmVielFFdXNMT21xRGdvdjJ3WUJHZDZreXZwV3hBeWZLZ3g0SVZy?=
 =?utf-8?B?Wm5pY1lwUm0zRHo2Rnc3WDN2TjBXN08rdGJ3NjhNSHpQd0s0SUg1aUNyRTRs?=
 =?utf-8?B?OEQ5ako0Vy9ZVUFaNmtMT0R4WUZoZmpMVWhZc1lrdDZOd3ZOUzJxaktyR3l1?=
 =?utf-8?B?eWt0ODRib1RQaVJ1NlQ5S1owTTVrdTEzTUFhZC9xb2QxalVMTU5UZU1Hbm8z?=
 =?utf-8?B?cWJTWFN2MnNBajFJU3hvczNsbEZ4NXBUMGZtWjI4aG5CbkZoZHhvQkQycmYy?=
 =?utf-8?B?dnc3eXNnUnAxd1k1OVF6MnNySUNoeHVjcEVmVXM1eGZRWExza2RIemtONlpN?=
 =?utf-8?B?ZjVoYi9Tb2t0VnQvc0VBTkdmeGN5OVBSSVE5U2t4N3NuYnNka2hYc0I2MERU?=
 =?utf-8?B?ZU93T0RmcVNSR05MdXhYd3dVWDJnRXpsMDJYWmRGMERIeDEyL2NmY09ZNlRz?=
 =?utf-8?B?SGFSYzQzMXUwMDljVldFLzc0ay9xcDJtQ2JOR1I4NGZodEczWmZzY2E2OU1O?=
 =?utf-8?B?K0xpOTlyM1VPMlJnazdhT1VvblRiWXRvYkUySk1tbWtVdFFsNWN3enN1YVM5?=
 =?utf-8?B?b0ozRzJBeUFqdW9kT0drWWJNbG1NTS82alYwTzJSa05wUUlmTmVtd0ZkUUxG?=
 =?utf-8?B?djV4SDJHRFNGdEJMYUs0YVBaMWcwMjVGQnVyWkNJRWU0YjNyZ25wMjE0c0JN?=
 =?utf-8?B?NzVpQk9PbXJ4MEFMVjZ1YThhSHBoSnZtUVI0Nyt1aVlJWTg2eVRMR0VYM1p0?=
 =?utf-8?B?TmR0dHBVZGVRcVB4YnpyZm9DejRVRFVaV1UzbXh1WVBJMUNETmtkTk5zd2hq?=
 =?utf-8?B?dnZZWC9kMHBXajV2TnhmRFY0WnVFUWxUaDlCd1hGVFppVVB3ejdNVVNxdHlr?=
 =?utf-8?B?VUFvWTVWejFQbVMyclY0Uzd4UUdRcGo1SUJaRTNySUhNakpwMjJTdmlBMDJq?=
 =?utf-8?Q?dPXuO1H10FVCHFeSAC7fMHRrR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e6b22-68e6-4ed1-bc23-08dd5f971987
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:47:53.3410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5CKx6stoSOgqBqkHEDgVfsh3986vV2s5DXSoxfwxqauN5JomuWim55/fS9PspgNyJpEj604h/FLuD3qb2DT1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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

Hi Umesh

On 3/7/2025 5:37 AM, Umesh Nerlige Ramappa wrote:
> On Tue, Mar 04, 2025 at 03:27:42PM +0530, Riana Tauro wrote:
>> Add PMU support for per-function engine activity stats.
>>
>> per-function engine activity is enabled when VF's are enabled.
>> If 2 VF's are enabled, then the applicable function values are
>>
>> 0 - PF engine activity
>> 1 - VF1 engine activity
>> 2 - VF2 engine activity
>>
>> This can be read from perf tool as shown below
>>
>> ./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>>              engine_instance=0,function=1/ -I 1000
>>
>> v2: fix documentation (Umesh)
>>    remove global for functions (Lucas, Michal)
>>
>> v3: fix commit message
>>    move function_id checks to same place (Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c | 40 +++++++++++++++++++++++++++++--------
>> 1 file changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index f8f6ebb7c9c6..8922f53ebf93 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -13,6 +13,7 @@
>> #include "xe_hw_engine.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>> +#include "xe_sriov_pf_helpers.h"
>>
>> /**
>>  * DOC: Xe PMU (Performance Monitoring Unit)
>> @@ -32,9 +33,10 @@
>>  *    gt[60:63]        Selects gt for the event
>>  *    engine_class[20:27]    Selects engine-class for event
>>  *    engine_instance[12:19]    Selects the engine-instance for the event
>> + *    function[44:59]        Selects the function of the event (SRIOV 
>> enabled)
>>  *
>>  * For engine specific events (engine-*), gt, engine_class and 
>> engine_instance parameters must be
>> - * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
>> + * set as populated by DRM_XE_DEVICE_QUERY_ENGINES and function if 
>> SRIOV is enabled.
>>  *
>>  * For gt specific events (gt-*) gt parameter must be passed. All 
>> other parameters will be 0.
>>  *
>> @@ -49,6 +51,7 @@
>>  */
>>
>> #define XE_PMU_EVENT_GT_MASK            GENMASK_ULL(63, 60)
>> +#define XE_PMU_EVENT_FUNCTION_MASK        GENMASK_ULL(59, 44)
>> #define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>> #define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>> @@ -58,6 +61,11 @@ static unsigned int config_to_event_id(u64 config)
>>     return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>> }
>>
>> +static unsigned int config_to_function_id(u64 config)
>> +{
>> +    return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>> +}
>> +
>> static unsigned int config_to_engine_class(u64 config)
>> {
>>     return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>> @@ -151,7 +159,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>> unsigned int gt,
>> static bool event_param_valid(struct perf_event *event)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> -    unsigned int engine_class, engine_instance;
>> +    unsigned int engine_class, engine_instance, function_id;
>>     u64 config = event->attr.config;
>>     struct xe_gt *gt;
>>
>> @@ -161,16 +169,27 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>
>>     engine_class = config_to_engine_class(config);
>>     engine_instance = config_to_engine_instance(config);
>> +    function_id = config_to_function_id(config);
>>
>>     switch (config_to_event_id(config)) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>> -        if (engine_class || engine_instance)
>> +        if (engine_class || engine_instance || function_id)
>>             return false;
>>         break;
>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>         if (!event_to_hwe(event))
>>             return false;
>> +        /*
>> +         * PF(0) and total vfs when SRIOV is enabled
>> +         */
> 
> single line comment should be enough here ^.
> 
> with that:
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Thank you for the review. Will fix the above review comment in next revision

Thanks
Riana
> 
> Thanks,
> Umesh
> 
>> +        if (IS_SRIOV_PF(xe)) {
>> +            if (function_id > xe_sriov_pf_get_totalvfs(xe))
>> +                return false;
>> +        } else if (function_id) {
>> +            return false;
>> +        }
>> +
>>         break;
>>     }
>>
>> @@ -242,14 +261,17 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>> static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>> {
>>     struct xe_hw_engine *hwe;
>> -    u64 val = 0;
>> +    unsigned int function_id;
>> +    u64 config, val = 0;
>>
>> -    hwe = event_to_hwe(event);
>> +    config = event->attr.config;
>> +    function_id = config_to_function_id(config);
>>
>> -    if (config_to_event_id(event->attr.config) == 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> -        val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
>> +    hwe = event_to_hwe(event);
>> +    if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> +        val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 
>> function_id);
>>     else
>> -        val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
>> +        val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 
>> function_id);
>>
>>     return val;
>> }
>> @@ -352,6 +374,7 @@ static void xe_pmu_event_del(struct perf_event 
>> *event, int flags)
>> }
>>
>> PMU_FORMAT_ATTR(gt,            "config:60-63");
>> +PMU_FORMAT_ATTR(function,        "config:44-59");
>> PMU_FORMAT_ATTR(engine_class,        "config:20-27");
>> PMU_FORMAT_ATTR(engine_instance,    "config:12-19");
>> PMU_FORMAT_ATTR(event,            "config:0-11");
>> @@ -360,6 +383,7 @@ static struct attribute *pmu_format_attrs[] = {
>>     &format_attr_event.attr,
>>     &format_attr_engine_class.attr,
>>     &format_attr_engine_instance.attr,
>> +    &format_attr_function.attr,
>>     &format_attr_gt.attr,
>>     NULL,
>> };
>> -- 
>> 2.47.1
>>

