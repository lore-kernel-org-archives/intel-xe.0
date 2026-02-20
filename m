Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA8EC5AD4D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 18:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FD010E174;
	Fri, 20 Feb 2026 18:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOIK8CIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6E10E174
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771611660; x=1803147660;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wU86x8ENJLI6aswmiCgiKD2tntOTuwN/dCgkKFkFjvA=;
 b=DOIK8CIn5mi+UNWBX5UicQeh00EoEPL0ZdACVqrSrAAsqsZCrW8u/B3h
 9Wrj62OLor7qC5A8u5ZDv5arvmLIAbfJsLn8ZI7OP5yOSHnaQ0OnXdeu7
 UMGNC6yeoeQx2/oqpuuKq+Zj5JmNnhYQ8DT3vaVrr4P67Nj23lShM+rhy
 YwXLJVdkGlM4cSE2T74ZmR8szYHBoTHDzXSUJq2MgrioEhtJ1wIMpD5EK
 8zctsPQCZiRYPypOsH/gJR+K1NrgMAFFdhdbxP9R3MjU4EPM794/69bi6
 OZ5EFnXJO0CGb+UkTUKJJhoDH98u3vvbR1QNocR05NOMnwV6P2lieVW/f Q==;
X-CSE-ConnectionGUID: DLi6Y7C8Sd+koZxn5F/MVw==
X-CSE-MsgGUID: GTipvFjeSMuAIfyE8J4f5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72751938"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72751938"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 10:20:59 -0800
X-CSE-ConnectionGUID: sVIWsgphSeWIF91qSp+QIA==
X-CSE-MsgGUID: wIErNbpyQa+VWA7CpvZn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237886536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 10:20:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:20:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 10:20:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:20:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1VMZStWJd9fCwS17xFoUONScAlB2Qnok0jEoZJQ4B08F/HTyV13FIw2eAi2A0nQHkOfhHn14SaceYAqGSXexEoL3F/t/rL9GxmawqgUJBRrtAOGQOFSHwrIMjVFkltWy20eKD44hyl4M4cfixEzZdE8Wpw+s/xFA9nUNn7XlwQjPIDlNPNsSZZmCWxGBLU64gh0Nn2rWnc30jBisAxEbbRcWBeW+wpcPczgyMKXVfkqWJsdhYWwexmEKyV+3DfW+otQERvd+mnGgG+bjgk4oo+7yLwmR3aoQwFnMd1aY82wJZ1pkA+2FZm9UFe9MHwiXXZoWLAyd0KsJ8GFGufpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGTLpJpcdPowP5a+yc532hD2DgyGe+1dLmIGMQY7OAY=;
 b=Lg/QuIEu3bcSbtUnGC42nR9hG+ZNZNJhZmLqFPn/g34BRgtqGPdcQdA6Z6F6Z4IDGwBlODDZ7UAejdvWSE9uTWlzMQzPUC/nWvumuokJEBFUQjO1MqXtL4LSMNHm4nFJHOcl8M6mEaDTSSfrbchjX7G/ErH2QPvEKkBlperzW0MzmXn1v3btN5qSYoM0PHrqd+xRdYrlxC8Mb1A7pIaxgioL4ni+sMKbHtQsP4ddiy2TDe7rqtWEdyECoqoohi31LLCLKfg9SgKCXTyOhlAMrY0un8FUKE1HFfNxHxsCTwg/nnP49dGRBL01n/70NPpUXWBXNw6bFwHtobjKBKMjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 18:20:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 18:20:55 +0000
Date: Fri, 20 Feb 2026 10:20:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/vf: Wait for default LRCs fixups before
 using
Message-ID: <aZimBOs1jp5I4NVU@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-4-tomasz.lis@intel.com>
 <aZdvsX0+ST//Lk3B@lstrano-desk.jf.intel.com>
 <aZd1KlxP27XeaH6w@lstrano-desk.jf.intel.com>
 <be611722-8388-44b4-85ea-ce97094ff40f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be611722-8388-44b4-85ea-ce97094ff40f@intel.com>
X-ClientProxiedBy: MW4PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:303:8e::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc05bb4-5dff-42f5-7fe6-08de70acc9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3MwakF3V3oyQVJSZzc3Q0RMWUVKenFFRCthdzlxL1NQc2Z2WG9WQ0cvY2o2?=
 =?utf-8?B?RFpsMWVqWTNDUWUyVmFucFpMUXdKaGpzV3ZZUE1TZUl0SFJ4T3Y5SndkRkg3?=
 =?utf-8?B?YmFJT2JidW9tOWxnSUlYQTkwc29ZTnkzV3RCVDVuVCtNcXkxcE16MllDL3BM?=
 =?utf-8?B?bmRpRjFqOTd0cXNHS0lNYmY4OUFlUFhoSDJaVGFJaGYvTWdoOGtEWlNTQ0Mx?=
 =?utf-8?B?ZHorVXlxaHc1cCtyR2h1SnNta0prK1Ezdk1QMWRWd2paak9uL1UvRTNSMElI?=
 =?utf-8?B?K2tnV0FYTndyMnVKcE5kMXI3ZUIyVzcxNEFhSVc1bnMrS2xYamhYMHhwQkxK?=
 =?utf-8?B?dkJhTWdRRG5hOWNXaE5NUWM0bkU2YVFtZGcwSTNDNHFKUWRIdWdFUFFqajho?=
 =?utf-8?B?MXFrZGlRSlFna0hNK1pydm82bFc5cmNXTHZTMkZha2V0eEFQY1YyYzBSTEwr?=
 =?utf-8?B?Z2hCQ1YrSXFSTkJDVmJoL21nZHRQcEN5a2loaGRBTTl1a2czRlZkM0k0bFYr?=
 =?utf-8?B?elVKYXdxNis0amR2czZYUkNsOWduZnVJZHVJQnFocEMxbEJoTnRMTEhacEhC?=
 =?utf-8?B?UDFwcmIrNEtCWmhQUm1MenY5UDlBSXBaWHhuQlY1WjNybFV6dHdVMGlHdVd1?=
 =?utf-8?B?ckZRQjkxK2szVlc3bXVjSjZqRkZPaGhzVXVKdXUrckJ1N3pQaXArL1NCWkda?=
 =?utf-8?B?MEZualpJYlRXVHdSQ3Q4aVpKbmVMeGg0dktCME10RTlhUlFEc3h1NUh5REJ5?=
 =?utf-8?B?L2Y2bjZpSmlVckFGYmhDZ01IeXhhY3k5Y1Q2QnZjRXhwUVJSSnRsZmZJejNi?=
 =?utf-8?B?UHdzUzJ4VFdTQ3UySnVqSXRpV2FuRVZGY1FETkhLZ2xVNXpGQ3U4YmxtV2hC?=
 =?utf-8?B?WGxQay9kNHFjN2dRcjhIQ1VnQ0Rta2k0aWhkUFFVd2NEb3UxcXhpdU15aWJW?=
 =?utf-8?B?cVRTVVFEUXMzM25NKzVmd1ZWbENjRHdNWHl1Nnh1WkJCKzZiN21TYk44bEVN?=
 =?utf-8?B?bEhhUldOOXQ4MzhvYTQ3amtLdG5aeXc1TTRHbkk1NmtUbjREaStXMjNteTFI?=
 =?utf-8?B?elc1UTZvWmpWWEN1bXViQVhsTnFGMEF2OFZVT2NpVmFhdzYxK0pFc2Zjcm5m?=
 =?utf-8?B?NWc2SFhSWWsvRnpxOXBZZkYwU1diZ1E1ZUhaSjVza0hEQTVLTmEvNXZhcEM2?=
 =?utf-8?B?RWRRdEp1eHc0bWZMSStuVk15U1lBcjVtNVNoVXQ2cnVYWkN4Y1JnQnRhZEFo?=
 =?utf-8?B?aGlIazdpN1RtdkwvVTZNQ2VzNkNRR3JsVTRiNURTSHE3NW1mUUh6d2s2M0dm?=
 =?utf-8?B?QUxuRG5vL0pHeDJIR0dRcTU3ZEVWMUd3Y20rZDhjbWtVTzBNOWFVUjhPVUl0?=
 =?utf-8?B?bEt0SDNqR3ZNb256SFAyT05Ca1p1dTFKVXRkOGZLaWtvV0FEYWE5RUFDYWlB?=
 =?utf-8?B?cm1rQngrMXhWcXNlM2xqTzZvUmJoZ2VmODNXakpCTGE3THFrUDhkd040bUZ5?=
 =?utf-8?B?NCtMYnpLdFp3MWVTYlRDWW1Kaldqb0JVVDNmZFBtdXhyWmZCWElRZURvSk1V?=
 =?utf-8?B?eEZaTkdxUGlxMHJWcDgycnNlMzIrb2t0NWxVSm91TWxEcnpwNXd2WW5mRVZk?=
 =?utf-8?B?ejF0Z2E1ckpNVVE1YzhEbUYyNzNTSzB1WHBmbUJmdmFadDBuNEx1aTZMVHkx?=
 =?utf-8?B?RGpCa3hmVmlrb01vaXQ2ZStmRytXbVYxQ3R4N2lLOXgxZVRpNUsvZ3hycVds?=
 =?utf-8?B?Rm9ISnNxLzZ3TFBSSEFkdklwaW1sUmtsZ0tiKzBLUUVGRGdyK3BBNGtlYjJh?=
 =?utf-8?B?WUhXRUVjMnVPZmhvRmNsckphTVVEa3g3aWNEcWFmNHNTK2hqWUpmYWUvam1s?=
 =?utf-8?B?a0RFdUVseHRLdTYrdnFhcTQzMG43UzFOcDI1cnlMZjRSVWJBYnZOSnRiNU5p?=
 =?utf-8?B?RjE5b0pOd1BYeXJLK2ZtS1Q4dWFGOVlza3Q3MC8xcFg1UlhaS2U2cElVb01a?=
 =?utf-8?B?cU1oQTg2U1drWlRKYml4SXp5SmRJaWVqdUc1czdwWnhXaThXeC83WUsxL2U4?=
 =?utf-8?Q?dmyVdl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHplSVQvaEJOY2JlNnRxcDJhVXkvcDJZTEhOdzU3M1JPcTRkVDhVSTlTOEpD?=
 =?utf-8?B?dzhlK3RqZTdyd3d3S1R3dmRxcVpES20xSWVLRkQ1MzROb2libWpJb0Fka2Zu?=
 =?utf-8?B?ZzQ3MU5PUjJMYUZpM0RLTGFxRENBTlFxcUJ3VzlQRndNc0htaVB0UVR1M3RQ?=
 =?utf-8?B?MDJScVBBdTAyVmNmN0Nyd01oZGR6Tm51MkxwdnkrWlE5NUNyY3ZpRTRPNGhY?=
 =?utf-8?B?eFJPckJGbFdNenFPaityVGthakFrQXJycCtqWjhDNkNTSTRrR0ZIVGcrOURI?=
 =?utf-8?B?bGNjeDJhZjBHOTlJQUpXZ0lGdEVxbEY4OVlmb0F3RXBFWGlmbzZZZldPS3ha?=
 =?utf-8?B?dDVKWEw2SXJzeXYrNkxKZ1l1YjB3QTdhelduWStabXo2a1ZKR2d5QVY1QjRp?=
 =?utf-8?B?K3ViQkwyYTM2TlNNSlVQTXF2VTAxYlRpOFlxbVV0RXM1ekdxOEFxd3lWMkNy?=
 =?utf-8?B?aWJjRDNHUUJaUXdCbnBSNXI5RUtTV0Y5TzNhOHhUTThlMEppVGhEQnQ0NXE0?=
 =?utf-8?B?ZkJGZy9WOWVtRWQ3Mk1vcDcxbXpHbUpxU3FMQVpjSDBvUWloYy9GV3BGVTlJ?=
 =?utf-8?B?ekljNjdyUEptZUtMZzhBbHFNd0IrUFU3RnVvd2VmK216TGpmZjlsdTJ2N2Rn?=
 =?utf-8?B?WloveFpwbnFoR09xTEN0R2JWbXZkTHpaTk0yM2RlUXdJMy94M2JObGxzVWhh?=
 =?utf-8?B?OTdieklUUW1ncWNEY0FYS0VRRGpYTFd0NXpoVE9UTDRJdnQ1QnpRS2ltVEsz?=
 =?utf-8?B?T3JBSHYzSTRhUFRqQ081d1M3YUd3VGtITXlvQ1N3VnI5bHp1VXRySUJDbjly?=
 =?utf-8?B?VDJlUjROZzd5YkdqZXpQZTA2bEg3bnRKcmRiZU93K1pxMDlkem5Rb0dLb05P?=
 =?utf-8?B?ekhTMHUxUzlkUVZWdmttWDFTNDRFWG95bVdtZkxBMXJmNFg5a0Z5K3dpOU1P?=
 =?utf-8?B?UW95d2tHL0tQVnh2L3NlblQrUlhEanB3ZVhrUzg1c2lVVDNDeEJkTFE3N09m?=
 =?utf-8?B?b1ZXVXZWZDJudzRNbVlZZVRramcxN3VwOWc5ckwzVFhzY04xSjkxMDYrUUt3?=
 =?utf-8?B?MDdJM29GVnlsZmlsOE9sVzAzVFVzclZ6U1pGQmNPWU52K1JqbjNDaC9CY3BB?=
 =?utf-8?B?RmNrUlkxWGp2K1QzUW5OeTRtK2QvMURkZ0FsSW16dTkwWG8wUno2RldFc2ho?=
 =?utf-8?B?ZmhZYzIzYjBRZVVtbWtPejN1TXlwV0F0SjVLNGFJYzVLMzlpcWwrbjZyTWdy?=
 =?utf-8?B?Uk9RUGRubWpjb21hRXlEOEdsODdsRUowZmFxQ0pFOVUyczl0bXprK0JENFdx?=
 =?utf-8?B?RGRnekZSYU9xZzRLYkVyVFloNmMrWEhWRC9Ra0pycklGcWpTR0NnQW5OZzVs?=
 =?utf-8?B?MTZwSkU5bkV5Lzlad1JqWWttUURwaGowK3pLMjlERHhVUnUrdU9FMkcyZ3Mx?=
 =?utf-8?B?UHNUYWRKOXhZb1VYQ3dVUEVJVVY0aisrNVNleEViY3UvS1FBQ3JIQWZhV3d4?=
 =?utf-8?B?ODJIYkJrQXozNnhTdzkwdVExYnZjaGhVZTB4cStPK0lhTXVjTEhTVlpPRTd2?=
 =?utf-8?B?Wmt0RVI4a0ppSFM4bmttQ1ZhTkYxaHV4WHFlNi9rQmwwZHhWWlRBc2xNdXE3?=
 =?utf-8?B?YjlTbERaaitoZDQvOVhPRGtGR1A0dldGMnVpMzlFa0loWkt2L2pUMlpXdW54?=
 =?utf-8?B?TWJUOWdndHJBbXNNQUVqZWVPYy9adzBiSmZCMGJ3Ym1jZm9hdWtTMzhxdFpY?=
 =?utf-8?B?MzFpNklBbDJWaWJEV0JqTXI3bWZUSDg4dlZlWnE3OUpXYm9NRHV1cSt1NGhu?=
 =?utf-8?B?Rklhak9ZT0pwdVlmNkE3NlY1ZVBEVCsxY0JTV1hMbnRJNERyK21UOW9jb0w5?=
 =?utf-8?B?THV2RXAyR2twZXpSbW94YnAxeXo2a1I5VHFabFlpMVNLUTVrK0hyOFQxTys2?=
 =?utf-8?B?UVRhLzNRdnVmNmpZRnFJZ1RzUk0vM1owbDVUbDY1WHNYZ2U5aUxHSXk4WjE4?=
 =?utf-8?B?Zmt3dmdFSmxiNHlubWVlaVJ2bTJWSzczM2tXbk4zVTVkRzR3VmVFOHgvQ1lP?=
 =?utf-8?B?SDQ1Y0FEVG5JcDlid0xhem5jaitmaElBMmZzWDhkNXRXTXp6WTdIT05mNFkr?=
 =?utf-8?B?YVVtbDBpN21rVEx6TkRGWHVTcGpqSnYwdTBTNmxKNWd3MTl6QlhJU3JLNlJa?=
 =?utf-8?B?cXBZSEVMWENRVHoxUFdFRzN5c2J3OFZPdHNqcmt4NDFLMHVXVHRhSFVJeENn?=
 =?utf-8?B?WDFwWUlKbUExNXRURG8vSGIzdFBwMTE5aTV0TW1ZN3NjOVM4WWc1OUVJMnJ2?=
 =?utf-8?B?Nk5za0VGTUdBNHJGMnRXdHRwKzhnR3ZvSXhRVS9xZUwwbmw4U0pSQlI2NzhS?=
 =?utf-8?Q?Wz3PVsNprwF/qkU4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc05bb4-5dff-42f5-7fe6-08de70acc9c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 18:20:55.6902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHhEHzygSYbuJqTx3rJuygYFmsiJOpY8xEaR0SIl10/wtu22FdI06sk4a4Y2vxoRpfgoESVNxxav6JUzUdg9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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

On Fri, Feb 20, 2026 at 06:20:32PM +0100, Lis, Tomasz wrote:
> 
> On 2/19/2026 9:40 PM, Matthew Brost wrote:
> > On Thu, Feb 19, 2026 at 12:16:49PM -0800, Matthew Brost wrote:
> > > On Thu, Feb 19, 2026 at 12:21:56AM +0100, Tomasz Lis wrote:
> > > > When a context is being created during save/restore, the LRC creation
> > > > needs to wait for GGTT address space to be shifted. But it also needs
> > > > to have fixed default LRCs. This is mandatory to avoid the situation
> > > > where LRC will be created based on data from before the fixups, but
> > > > reference within exec queue will be set too late for fixups.
> > > > 
> > > > This fixes an issue where contexts created during save/restore have
> > > > a large chance of having one unfixed LRC, due to the xe_lrc_create()
> > > > being synced for equal start to race with default LRC fixups.
> > > > 
> > > > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > > This is better than what is in place, so...
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > A little quick on this RB, see my comment here [1].
> > 
> > [1] https://patchwork.freedesktop.org/patch/705610/?series=161287&rev=2#comment_1298253
> ack
> > 
> > > But I think we need to close on why my suggestion in the previous rev
> > > isn't fixing the issue (off list discussion). If we go this series, then
> > We still need to figure out why my previous suggestion doesn't work.
> 
> Right. Testing this is even harder than I expected though. Not only each
> verification required 1000+ runs, but I already confirmed that there is more
> than one place within `xe_lrc_create()` which causes an issue if not
> protected by the atomic..
> 
> We need to, but this may take some time.
> 

Ok. I think that with some of my suggestions—particularly those in
[1]—we can get a version of this series merged. I've reasoned through a
few minor changes and suggestions in [1]; with those, the layering looks
solid, race-free, and memory-safe, all of which the current code is not.
So let's move forward with this series, assuming we can align on my
comments in [1] and in the other patches.

Matt 

[1] https://patchwork.freedesktop.org/patch/705610/?series=161287&rev=2#comment_1298682

> -Tomasz
> 
> > > my RB holds for future revs.
> > > 
> > > Matt
> > > 
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
> > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
> > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
> > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
> > > >   4 files changed, 15 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index e9396ad3390a..6eb561086e1c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > > >   	for (i = 0; i < q->width; ++i) {
> > > >   		struct xe_lrc *lrc;
> > > > -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> > > > +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
> > > >   		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> > > >   				    xe_lrc_ring_size(), q->msix_vec, flags);
> > > >   		if (IS_ERR(lrc)) {
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > index 527ded3c9c22..5ce06031018d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > @@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> > > >   	 */
> > > >   	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
> > > > -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> > > > -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > > > -		smp_wmb();	/* Ensure above write visible before wake */
> > > > -		wake_up_all(&gt->sriov.vf.migration.wq);
> > > > -	}
> > > > -
> > > >   	return 0;
> > > >   }
> > > > @@ -844,6 +838,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> > > >   	for_each_hw_engine(hwe, gt, id)
> > > >   		xe_default_lrc_update_memirq_regs_with_address(hwe);
> > > > +
> > > > +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> > > > +	smp_wmb();	/* Ensure above write visible before wake */
> > > > +	wake_up_all(&gt->sriov.vf.migration.wq);
> > Then with [1], move this wakeup to vf_post_migration_fixups after all fixups.
> > 
> > Matt
> > 
> > > >   }
> > > >   static void vf_start_migration_recovery(struct xe_gt *gt)
> > > > @@ -858,7 +856,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> > > >   	    !gt->sriov.vf.migration.recovery_teardown) {
> > > >   		gt->sriov.vf.migration.recovery_queued = true;
> > > >   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > > > -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> > > > +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
> > > >   		smp_wmb();	/* Ensure above writes visible before wake */
> > > >   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> > > > @@ -1303,7 +1301,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
> > > >   {
> > > >   	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > > >   	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> > > > -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > > > +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> > > >   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > > >   	wake_up_all(&gt->sriov.vf.migration.wq);
> > > > @@ -1499,7 +1497,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
> > > >   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> > > >   }
> > > > -static bool vf_valid_ggtt(struct xe_gt *gt)
> > > > +static bool vf_valid_default_lrc(struct xe_gt *gt)
> > > >   {
> > > >   	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > > >   	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
> > > > @@ -1507,17 +1505,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
> > > >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > > > -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> > > > +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
> > > >   		return false;
> > > >   	return true;
> > > >   }
> > > >   /**
> > > > - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> > > > + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
> > > >    * @gt: the &xe_gt
> > > >    */
> > > > -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > > > +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
> > > >   {
> > > >   	int ret;
> > > > @@ -1526,7 +1524,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > > >   		return;
> > > >   	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> > > > -					       vf_valid_ggtt(gt),
> > > > +					       vf_valid_default_lrc(gt),
> > > >   					       HZ * 5);
> > > >   	xe_gt_WARN_ON(gt, !ret);
> > > >   }
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > index 7d97189c2d3d..70232dc38f9a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> > > >   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> > > >   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> > > > -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> > > > +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > index 4ef881b9b662..8be181bf3cf3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
> > > >   	bool recovery_queued;
> > > >   	/** @recovery_inprogress: VF post migration recovery in progress */
> > > >   	bool recovery_inprogress;
> > > > -	/** @ggtt_need_fixes: VF GGTT needs fixes */
> > > > -	bool ggtt_need_fixes;
> > > > +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
> > > > +	bool default_lrcs_need_fixes;
> > > >   };
> > > >   /**
> > > > -- 
> > > > 2.25.1
> > > > 
