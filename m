Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B2CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 11:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5B510E1D9;
	Tue, 28 Oct 2025 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJQA5oxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF14610E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761650240; x=1793186240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2UC5SxhxPs9Tu1NSKlNpEkpgwOyt3VnL/uDuaPTS+RI=;
 b=kJQA5oxDPsvSPObzIrSLc6hyDqYsIk/HoSa2ZthOuwSN/OeJ0kGPU9Am
 wpISU6ga2ht6jUQej8q/fn1FDSjjxqkOET/EsnfMepSDGTpJZ1Lr3ayVR
 UuzX4/irIvYj9LIMcKPdMHs1m5pcK5IC3E8Yom4p+g63A1labAWkVZc2u
 1TyuR4nZcZr0FBvwJzWcCWZ1+wDwGo0gPG0mDPaMEoszlf9CL3ZvRMCcG
 Dlm2/iAccup5j9jbc6wzmR8M028RY60DwMcdzZC5qLWDQqxNqsx5J1y4+
 AEWlQ1f4uO67o4SykD+dg4SsdriSldm7xK75lhmiUwZOw/xrBHBYEsNHp w==;
X-CSE-ConnectionGUID: HjOvgJvsQxCxLGAu0AH+8Q==
X-CSE-MsgGUID: hBtnXX6wR4WdpBd2oWfPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51320123"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="51320123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 04:17:19 -0700
X-CSE-ConnectionGUID: xoqlDxYTTyqZlujpxy9LAA==
X-CSE-MsgGUID: NEAF5hvUSQSwCO/0jsE0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184554065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 04:17:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 04:17:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 04:17:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 04:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDB/SGgqLDcRMI8QbLBRJcLapw5MPAJe8ydu/UG0QX8rQ2vuc4Y85nz5ix369sXcNm8fQ3GL35r3d40ZXVXrE2Z/o7mvb22veCajW8unqHrIpASB1cJCgV6g6r9e1HKYDuSlvm1C9g5Okz1HnMCXkEMM7Yi+pQYDlvYcE2WsTSqdXiQg6dwiQvoYim5et8SFa/uTmlhU2rhDfRNZfsKOib5WuSC85Z3sDvTrSlHc/T1S7LONwnmAwOGMTNgjsZrqFJjFqYXwLh5BdUq49VAHZAKYKIWL17D3AU1NybcIQtUS9HzowKcn0F7rxNlXWbAbiMF3K8uDMLRu9LDOS4OUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGqRuCwkMd2L9y8mWbUP6FSyK+0/hA+tcbnriuGo2qE=;
 b=ryLcMu/Lks2FYrKvRJsRBYNm1q4BEnbU7Q3BDfSUCHm2pNHelGhGFCuAJruz+rCCMNA16Ej6vIkTbKVzHqzIUl3k3P8OAXEsti4nfa/k2SGIf6cAzIPPwTkVuMcdqDR4T08WJ9DK/eM3k/uFy7qup9rKhAr3oeeCr0Zx3fNkXhAJR8styAdM8dHffRqjL3nt+9vU722UltHiY7McFA5v8iA/fYaFP/S7wINzak6t/qKiRAmi2tzdaOH54zx4yoV+aiOuUUXnnXIU5XBmFqZaRQbRKOHE3HNC0mi/4HDU8cCpdqMhTpTLI6XIbJcrtB1K6+m3DwwFPQc4L68yMfikog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 28 Oct
 2025 11:17:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:17:16 +0000
Date: Tue, 28 Oct 2025 12:17:13 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/14] drm/xe/pf: Add functions to provision scheduling
 priority
Message-ID: <20251028111713.sf4cw6uxvxxz6lwz@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1d0f26-81c5-4b76-3a96-08de16138d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHdNdUF2L2Z6V0xLTVZhRytIOG9KL0kxZ0FySE5LNURCRnZ1ZmwrRzR0QnhP?=
 =?utf-8?B?eHZNRzUvWmorb2JVZXYyZEkxRFFkdUxWL3YrMkliaS81aDVyb1lYTTRKSnAy?=
 =?utf-8?B?OFg3OVJpb2xlRWZSQ0U4RG9Ja1dDMU13NEFOZnhDZnBvckNtYmZJMlVZZjNB?=
 =?utf-8?B?TE5DVDhlZDJZR3VGc29yVko5NW9lNUlvTitXRjlMMjNZUDFSUXduOXlkMmcx?=
 =?utf-8?B?M1BFN29STUtvWGtVaVJZN3pBWEpGV0ZpbUNUbDU1Sm5WNDJIZEd1MzEvWi9r?=
 =?utf-8?B?K2dMUHhkNmhmN0xPQXNCVVZBOTByb21DRW9jcHh2ZHNBeFQySlQyNE9OVits?=
 =?utf-8?B?WnM0SFMwRjNMMzJmTnF1YlNpWW1CYVRxUC80N0FBV2FRMWhhai9BVnpWQkFj?=
 =?utf-8?B?eENLendDdFZHdGliMUxVaEd4Tm9LMUVub0UzbGk0K0xnaFJNSWtQdCtwenVz?=
 =?utf-8?B?dVZuKzVxeFFudit0VjRhZVdvMDNJS2Vzcml4YnBIek1UWTl4d0FOVUhYK1Rs?=
 =?utf-8?B?aGYzU05hQm5RVUFhYnljUzBQL0gxdmFuL1ZQWERicjRiOVhuRncyU1gzTWVj?=
 =?utf-8?B?S044TkNBc2RaT1BSOFFWeVVRNzIwNnRrWEozODVQOG9vMkNNMlpTWVZ5MTlQ?=
 =?utf-8?B?REViM1h5NFNlV0FvRHhvRDdVbG43dlBFbUJhSEd1N3RtdHlXWmY1S25GUys5?=
 =?utf-8?B?a2taVWVUTXVjaVpSb25obXN4M3lOL3FaTlVEV2U2MkVxS0lWblBXV2JDMkli?=
 =?utf-8?B?V2VWQVI2eVlUOVB1cUpIaHBNejVEbkcydGJKbGFvR1FyS3V2SXdIMFFjeHNI?=
 =?utf-8?B?NGV2MGpkQjBaTUtzRnNTNVBUWHl1WGlrb2lTRjBSN2QxMmlJNGJ2b2FiaGx2?=
 =?utf-8?B?NHM3bnlLSExabjBCWTQvSTVJSXNnZTltVVNMVm5QNVpUN1lrVFI0Rm5jalc5?=
 =?utf-8?B?T21STDZMWGpRZ051M21GN0xuaDUwaW42TElxaXJORUUrc1dGUHdsZjlWcDhX?=
 =?utf-8?B?MHErMTFYMnJHSUpwNnFuZkZRS0FUUk5rZURqc1gxZlVFK1hKSWlTdThNTTdR?=
 =?utf-8?B?d3h3ZzZ0ZU1DVmV6TnRtdGpqNFVsQXY4bEgzRHB6eDNYSGZnZzY0N2lpdFQ3?=
 =?utf-8?B?WHVDRUZaaXhSQ3dXQkdKNDV2TmFCd0o2QnFFUkhvdm9VemJpZVo2eFd1dUll?=
 =?utf-8?B?eCt1MjlDUUhjbC9SeWZjTm5MSmc4SGJoVUlBTHRmdVU0clI5SGZSU2U2a3Er?=
 =?utf-8?B?STNMZjJ4M3BHVEdEcUZuTUlhWGZQOFBmWWM0WlkyVGYxNXphSHpIMzdLOWo2?=
 =?utf-8?B?QTNaN04yYkZWSVp4VW9yakIyQ1NyQzlCQXg0WFlCRDAyOWJQNk0zR2dUbnlO?=
 =?utf-8?B?bGwxUHVJQmlkRkN1N0VoVExmNzZNRjBaakc5enh2S3dEdEUvOFloSzB2SUxw?=
 =?utf-8?B?dTA0UzZrTU5ncXBPaHppWnBrek1oM2RDcFdHSDNIK1E3ZXEyNGp3QUtMbjdH?=
 =?utf-8?B?eXhqMGFVZ0tRMnhEdG1hTXVzVlE2TGJ4bnlhVkNodlpMNDV6OEhyU3BDMit4?=
 =?utf-8?B?di82SGRad3VkUGFXYVU1TVZSbndCVGdvZFN5aTk3RHJycWdRZmNSMjdOK2dm?=
 =?utf-8?B?YVZyUTZwc0JJZVpwK0I0endoZXJXdzNod0o2Z05VQk9mRnlXN3R5aWdKL2xx?=
 =?utf-8?B?K05zclFTNXhTM1FrMXIxdkcxczVIV1RNdXdYM25PbTRVTG1qQkhtWnd5QTQy?=
 =?utf-8?B?ZnpXdnJBREd2eWVVTFExVVdNYm5IcTZZLzZzWS9aUE9oNU93YlU3TzYzR2E5?=
 =?utf-8?B?MTUxZ281MnFGMlRucXY2aWQxZUdKeFBEUEVDclpRdUF6UGtWVVQ1VnR6TjR3?=
 =?utf-8?B?TUhpbWVuYWpDSFBpeWp1a2FYM01nc3FHaGRUNFZ5M1lkOFpWN2Z1Mit2Vjhh?=
 =?utf-8?Q?rVw8xOlvdwCj1iFf9dkFaUSPCKVzXX7n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXJtbnZYemNhVC9DYWhyYm1mZ09uTWpjdis2MUwvdFlFZXVQc29adGtNS1FC?=
 =?utf-8?B?dWZCNEsvM3RCOS9pZkZPYU84U3gxU0d6a1ltTStISGhQZ2l0Z2djR09NTWd3?=
 =?utf-8?B?OW1IUEZPZEpmbmF5Nyt6V1Z6L3pwZUU4OXNkN3RxdWZBbnJUQmZnSGdKUm5N?=
 =?utf-8?B?Y2xDbFBxQ3J5aWJLWk5JYndsSmJxVis3ZmtKQVNwZWlndnBnSjh0cW9pRTJD?=
 =?utf-8?B?dlV1Yno5OHlsY0QvbmZOeUcxaUVpWEFPaTc2QmlZRUs1eXdZdi9uNUtvNTdB?=
 =?utf-8?B?cTR1YXBWMFd2akNFTXBBSTlHdVJiU2FVMzdBR2V6MU04aHBRUFE0Y1ZRRGlh?=
 =?utf-8?B?U1BDWVhhd3c0cTdsckhQcmQ0YWNlWHhCVy8xbnY3c0ZwMm1uUUVjcTVSM2V6?=
 =?utf-8?B?b0Z3RGRhaEtCVER3WTRTTGtNWFRsWGErNHFPQi9HbVVtcVVPbXJUeG1JMEVL?=
 =?utf-8?B?VUFSMTNIUGxGNk9kVWpqSE9IYmttdHg5aWdiaXU2SlBTdTd4YklBdXFWQk1U?=
 =?utf-8?B?UkRrcjZoczVKbGxDajZtajFjVWJhTXNPZjNPTXZucjloUTBDSFZ3V3BVQjlO?=
 =?utf-8?B?WFNEbFVpaTJKcTRvZzdVTUpSMzg1OGpFcDU0bTJvS0RkbUx6ZlExYTBXQ0Nv?=
 =?utf-8?B?a2c5R0hMZk82MlBtOWhwc3E2Z0M1WXRjdTBCc2tpZUE2UGZVOXJ5TGdLb2J0?=
 =?utf-8?B?eXAvQWlBRzM5YWJEaDdXUEw4WXNqM1FiUk1ueGx2WVZVYWtVNnZ5WVYzU1hn?=
 =?utf-8?B?ZHJ3dFBEOVlZSWpmN0xieEprNGNnaHhJMlM2OWg0Qkt3K0xNSVhsT3Z3RlRu?=
 =?utf-8?B?NHUvY2M0cE12d2c0eEhHOGM4Mk5QcVByNFBGdWZOQW9CM2MyUEpLZEVjN0Ju?=
 =?utf-8?B?UnU5ako3Z011b29XSXpKbng4Nk1keGQ5SkVzcEp5ZGY0QTVUVnd5dzJXOE1V?=
 =?utf-8?B?TitUOE9HdWEya0R0YWZBQ1N5bkMvcXE1dUFxeDhwR1ZIUnFWYzZtclhGSjJK?=
 =?utf-8?B?Y3c5U1lqb0huZTh0dFVEdThXTWljYzVqcVdVL1ZiWDF0NkFuWURoQ3Ric0lV?=
 =?utf-8?B?cnRsY3JWQmplanBDcW01SUhYN2ZwOXgvYTFqVkNxRXRiZjJqaUQreXNhaHAw?=
 =?utf-8?B?RXhxRUprTU9Gc1ZKeWhtSWFIejFYMkpQdzRWSXllTDU3VDZJNzNESkJURkt2?=
 =?utf-8?B?WUwxakNZWFd1YytBbUtUSFJnR2hEOGNIUUR0Q2pxdjcvNGVLMlF6MkVpdlpV?=
 =?utf-8?B?YU5KSVRXT1NqQitEcnM2eEhXUEhEV1lKblJOWVI5RGVJdllFN0ZXa1JsRTJu?=
 =?utf-8?B?Z0VSc043bTNsYWFZdnE4WjQ2cm5MTmhIWFo4SlJzSitKZXlZM09NbGc2VWIw?=
 =?utf-8?B?TDFIdVcxZXdUUzBKVEphVkFvNXhLbzErMTZGQ3dKek91K1JEQll0eVEzN0h0?=
 =?utf-8?B?VUd6bHV3QURIelRyZVNXaUNCcS9BYVdLcVVxNjVLVVc5Nllud0RBSzBKeWs3?=
 =?utf-8?B?MlB3WFhxcWZ5dFJXUGZvNUNYWWxaaW04UW9TRWRlQTNQeDJZWlNmZ1ArelJX?=
 =?utf-8?B?YWRoV1UwZmRTT1lKdWRKSDVjbjQxdFA5cEI4UlE1M3pIaWlrSFcwZjlsSGlz?=
 =?utf-8?B?RzhzL1VLUGZlc05nNlVoWkl0RVFhZE11eU5ETTZhTWpMc0wyWDlJVSswREFn?=
 =?utf-8?B?NnlRYm9HVlRVbElZaFE2Mnk3K2pLZWgvNlZqTTBJQnVVRWtSdlk4QUJwNkJF?=
 =?utf-8?B?bm8ydnNCKzBraEZuRE9vL1REYm9yZ0g0Q0JOT1VWQ1M4eFJDUVlWeXE2WC9u?=
 =?utf-8?B?TGJ0Vm00Z2FmUGthYlFsK1k1V1RpOFZxcXc0bGpEdlg2eXU2V09OQm1FQTZJ?=
 =?utf-8?B?UlhjYnllQjh3YnpiUzl1OVZhdFI3S21qOU9XLys1NjQyVWozdEZXVTlCUXpz?=
 =?utf-8?B?WmIwNm14dlJVM3RIZDVoZVM4bTI0cW5CcFhZdWpSbDVzczlVOGs4OGtTNkVW?=
 =?utf-8?B?b0FNWEJiYkxuTi9Da3ByVzRoL3JpdzF4VnNIL1hwMXl2NUY5SlduaEVwNHZG?=
 =?utf-8?B?cldGOXhHUTVkQWtORkdPNW1neEFqRXRUOStYVUZHK3VhS1ZkZTJCV0F2SGhu?=
 =?utf-8?B?MS9tbE9KejlRUWllTnA5YWF5c09vR2E1cDdFVmVyTTFrZWdTVjdiM3JyQ1Rs?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1d0f26-81c5-4b76-3a96-08de16138d3a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:17:16.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xsPWkDN9WTcZrvr8AZU759fqoUO0tB0tmgGiazjyNAiNQ8Vp8x0ShKzyqHljQNePrSWseTfl4BrMifV2ZNxcmHdnMqHrx+HxNNrNG751eY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2025-paź-20 20:24:08 +0200]:
> We already have function to configure PF (or VF) scheduling priority
> on single GT, but we also need function that will cover all tiles/GTs.
... on a single GT ....

> 
> However, due to the current GuC FW limitation, we can't always rely
> on per-GT function as it actually only works for the PF case. The
> only way to change VFs scheduling priority is to use 'sched_if_idle'
> policy KLV that will change priorities for all VFs (and the PF).
> 
> We will all these new functions in the upcoming patches.

We will use these new functions in the upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 92 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  4 +
>  2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 44c52c7e241f..3a3806055616 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -320,3 +320,95 @@ int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u
>  
>  	return !count ? -ENODATA : 0;
>  }
> +
> +/**
> + * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
> + * @xe: the PF &xe_device
> + * @prio: scheduling priority to set
> + *
> + * Change scheduling priority provisioning on all tiles/GTs.
Change the scheduling ...
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
> +{
> +	bool sched_if_idle;
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	/*
> +	 * Currently, priority changes that involves VFs are only allowed using
> +	 * the 'sched_if_idle' policy KLV, so only LOW and NORMAL are supported.
> +	 */
> +	xe_assert(xe, prio < GUC_SCHED_PRIORITY_HIGH);
> +	sched_if_idle = prio == GUC_SCHED_PRIORITY_NORMAL;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_policy_set_sched_if_idle(gt, sched_if_idle);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_priority() - Change VF's scheduling priority.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @prio: scheduling priority to set
> + *
> + * Change VF's scheduling priority provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_sched_priority(gt, vfid, prio);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_priority() - Query VF's scheduling priority.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @prio: placeholder for the returned scheduling priority
> + *
> + * Query VF's scheduling priority provisioning from all tiles/GTs.
> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int count = 0;
> +	u32 value;
> +
> +	for_each_gt(gt, xe, id) {
> +		value = xe_gt_sriov_pf_config_get_sched_priority(gt, vfid);
> +		if (!count++)
> +			*prio = value;
> +		else if (value != *prio)
> +			return -EUCLEAN;
> +	}
> +
> +	return !count ? -ENODATA : 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index aa8a95b1c0be..bccf23d51396 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -20,6 +20,10 @@ int xe_sriov_pf_provision_bulk_apply_pt(struct xe_device *xe, u32 pt);
>  int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
>  int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
>  
> +int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio);
> +int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio);
> +int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio);
> +
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);

Some comments in commit massage and docs, but overall it looks okay:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
> -- 
> 2.47.1
> 

-- 
