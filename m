Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2D5C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 21:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F5311A6CD;
	Wed, 29 May 2024 21:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QL1Im6bc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3711A6CD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 21:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717019771; x=1748555771;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=P1XJK3gmc5016oN12WW2ppNetF9kQmIFghm4/cp86M0=;
 b=QL1Im6bcWhMdkcsKodbzE4NVE6qux55MxCOpoD24kkaABHPSSdCNBr6p
 uT//xm+X7XrMo2pra8pCK86n1OfAKHvLGvqJzYMCxvMBXpeaHdkqWxwq+
 ljSlxLQZ7E1oy4bvZ+e4LMbg59Uiyk02yO1qKAaqE8eqrVouWz9HdsZWb
 VE/qybSpbTaBiT6lC2M3cyWhvd0DX5cq2AdDOeXgG3LoXFoaov6tUDoJg
 6X7P8V0MZbIia2sWbMhUAi5yKyHdpq82Dxj1w83Y3iJ1DtqKvTiAi8f9P
 jagrcdlR/QIzAQ++K/dMPaDXgKqp+sr/ZHDEGLeca0NbG3L9ILrIVr99e Q==;
X-CSE-ConnectionGUID: Rf8N15ijQa2EizqgXZCUrw==
X-CSE-MsgGUID: vLb+KQvXRTeSHmGYPWcNhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13585080"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13585080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 14:56:11 -0700
X-CSE-ConnectionGUID: 5wQZu+HCSPyK9wlBoC/4gg==
X-CSE-MsgGUID: tBtOg+EyQGyafcjesrK4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35656962"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 14:56:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:56:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:56:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 14:56:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 14:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC4An0Tsv5Drm/PO4VQKUlS+TL/5I1WMhX9yWDXDPNFKIhOA7DcGB4byRYay8R/i4VDUQwi+1wibR92sTW2YSrj4cJAlAaRd4r04Ix4Mm1qL8/O7GT21lI8ARWYgYlDV7dT1G9P5eXCEkB6psvjH7bqbtXtllvAFwGFdg97iBN4ugaHxRzMl+aMQ+IVvMlHOLzEicwVS52GzsB+Sf/wObAIhox1D8O+pdnvia/q9p3YNYAG0P6vjVGMLA/ZSp9jrP80OUcU9r9MvQTFRnJAIKM2n8gztlGH1DemM8n8RB+7rsjmggaVY1KCkYEs7y0htjEUrwzXIsuTDvUWPXuOy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8QQ5rL5t97ibiITlWHJf7vzsk0yyaYH7hG93Fb6u2s=;
 b=AkRIpqT5/yq877aX0V0chgFcJ+wt3QOxfAXfI09wZ6uTiDaMdQtSWfS/3DJhTTDq9XV+TB1Sc1BjlMd/b9Cyy6aQ1iDc9VaDgUoFzcGcdZjvbB2DvGHOXjHK1mYk0cUOWk5k8jJWaAFPCyY6n8KbkhxDpGSNAdTDRb2/BzmUM3aYpedgK+kp3rfau7/quVdnnK8NAwBofm0+j5PvLrQX0TTtyg0t0qO6Wfwb5TsCBwXcBmGTu+BLIYpL0rhTxMSC60KWE/6agYFVj2WbubijHESw3Qlh7XI2VJYQ9LIzJeSf3GQa+tk7pqFW4Muq7VyKgImZsYdunlEPpCMaPjmdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Wed, 29 May
 2024 21:56:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 21:56:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Add missing runtime outer protection
Date: Wed, 29 May 2024 17:56:03 -0400
Message-ID: <20240529215603.105082-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f1239ec8-65bf-4f32-c298-08dc802a24c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cERxUUpRNlI3djhHSFJhVytRWHZ0bnJVUmNFTWE4cTlQeHdiQXVna0xmeC94?=
 =?utf-8?B?VExCUUN4enBhenBGU1dPUmdXVVpMalVOclpUNnU2dzROSXkySDlYZ0toYTBB?=
 =?utf-8?B?REg4NG04aitzMG95aC9VOHArQ29hOW55QnNBWVhSbXZobEU0d2p6MHNsMU1R?=
 =?utf-8?B?WmZiVGtCMjlrL1NiM1VxaloyN2VOV0MrbEg5Uy9YNU5jenZxbysyNGo5UUVS?=
 =?utf-8?B?VHZNSTcvVjVDakZFenM0QVNpNGxVeGVRbVl0dUFFTndkQUJzUnhva0R0bU85?=
 =?utf-8?B?bHBvcHF4VjMwUEE4WkYwWDNtWm1TQm1WdjA3Y3doYkVtb3ZVZ2pLQTVSb2tz?=
 =?utf-8?B?emZEbXYwYWdlMXRDV3JNeitmT082QUxVME5uT25QUXcxNndpYmZGTGgwSTdI?=
 =?utf-8?B?ZnZyWjRqem40czYxSWxqMkZ1aTI4OEZwc3MvTWVOREo3TzkydnFxMnkwcnNm?=
 =?utf-8?B?V3hDcllSOVJhZ05CMmZXbVRUS2hEdktaSGp4ZFBrQTZHOThGcC8yaW5Hemxn?=
 =?utf-8?B?SFV3bmtzYnJQY2F4T21GNHRidExrUTBPbnhQcHJ2Unp3cjROc0sxU01NNmRU?=
 =?utf-8?B?YjJkQWJJS3dvaVU3aW1CUFcrcmxWcjJIQUpnRVlIY1FSczVhM21UU0pGSUgv?=
 =?utf-8?B?NTVuK1phV1JwR0hrQWFsUk9KRXlRM2hwdDhPTDFaMG5oQkcyLzcxQU0xQkRY?=
 =?utf-8?B?L3RqM2R0MUNMaFA2Y0pIbDhrTlNkcm9MVDluelJXcFhjaCtub3NRTVVvLzZO?=
 =?utf-8?B?RTRzNG5za01sL3ZMbVBSbUpXS2NYSm1iMDJkeGpJWnRqMVR3cnFwblVFdjBH?=
 =?utf-8?B?N2lteDJYRmcvUFhnc09iUVROQ2VDMGZ1MjBrajQvb1FXaDVHdDVzUjIwSytM?=
 =?utf-8?B?aFJNREpSQ2xvRU9NRGhDYkhVSFQ1RXZuSkJFZDllM1N6a29hNkNERzJYa2ls?=
 =?utf-8?B?RVh1KzhneWx1aERyakREU0xaUTZYS0N6Z0pOSzJVZVZJZXhIbUFjeU9UTHps?=
 =?utf-8?B?eWFpQjFRLy9jaXQ1S0FobUtuYnVLYjNYRGxib2ZzanV1cHNBZmg1VkFRYldt?=
 =?utf-8?B?TXgzNkNsenFOS3J3NlNFaTJhNVVLMjBabGh5bi9Na1ExR1U5dERKR3ZKMzBX?=
 =?utf-8?B?ZDErck44WGNEU2U2UTNrU3pwVWV1VjZqdEhuYkYzWjFyUjREblNRT0N3eHZQ?=
 =?utf-8?B?UWRqdlB0MzNzcWE0a2kxRUt3ckNtSUR4clQwMjB3SnlybVFzRHF5akN1SXBh?=
 =?utf-8?B?ZkYrVHEyZ1Z0cEpJK1BrcURBT2NObnk2alF2YmFCQkhqUk16ZkhzNy9NSjc1?=
 =?utf-8?B?L0QyK1U1NjRMeHlwY1lJWmRnMXBBbFZoc2t5Nk92QS84Q0ljdDFmb01Xcnln?=
 =?utf-8?B?cW1xVXhnekdSZUxuTHlkWi81UU45SG1tRUpINmpRVERUbjZIM2tvbk9xbVla?=
 =?utf-8?B?WUxlZE9TTVdRNk1leGd5ckd0dVJIQ3VUL2JHQXFoMnpBSTZ2b0YzOHZhQ2Zi?=
 =?utf-8?B?R2c2NlgzUWhoSjNkT2xYWGdpb1lkRktnSzdkZjNhNDhkQ3M4bWFVTEd3amtB?=
 =?utf-8?B?SmxEM1plUDlJNUlaVlRid0xpZ0FmeEcyMFRKd0EzYWo1Si96YmQxWVMzays5?=
 =?utf-8?B?UGo1TFBySS92dlVYajhJb0l3M3I2TE5ZRFBjck42YjlheWgyUlRWR3JtelVW?=
 =?utf-8?B?RGpqRTlvOUxnMjZpWThZR0RyLzZxZFFvUGFYMjFBLy9NNU91TXlIdk1BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0YxQ242d0wxdnNvb2VvdXRlb1VQOWlHU1lRWm5Pd1FJRnhYb3JMc0R2VjhP?=
 =?utf-8?B?ZmZGclozRGdIZk5XTHZHOGFpTmdpOGpyR3VrOXExTnhOcXNIMnhzdWlLVnhq?=
 =?utf-8?B?anYrYjdXQmFRMFhFTmp5NWgra2wwSE5EYWQ0WDVKcEdkd08zL01RNm1WeDBi?=
 =?utf-8?B?MEp3TlF6WWVJNThnM25Ca1p5cnMrbVplZmZhRkJzb3VyV1RUTjJrQWtURkRs?=
 =?utf-8?B?U0ZIclNZU2R2Z0pHWnB2dkZ4L3hvaHY1Qkt2bHZub2txLy9waFBrYW9GTXkw?=
 =?utf-8?B?TzBQTWVWbENzSVV4KzY1M0Y1NTQyNC8vZ05rRzJNY2VhSmVYTmltZHFTZjBl?=
 =?utf-8?B?alJGakhLazlNSkdSSk85eW1IMEdaOG9SNWdEdlhrL0ptTFpQcld4OE1YeUpl?=
 =?utf-8?B?RVg2WVRqdHJYTUg3SmdBazQzQmppTWVHZFBBMXArUlQ5UXRTSDVWeVU4UjBV?=
 =?utf-8?B?Vzl1TUwvSUdGa2pRNTlIcnZmQUZiTW9YSXNvV3FvZnIweGVlT0FERlZsbUw1?=
 =?utf-8?B?R1JWeER2bFA0dERCZTlLb0dCaWx3aHpPazJLS1RuZ25GanpBNkxDaTlxTzIv?=
 =?utf-8?B?S1NTLzM1MkFGM0hrZTRuU0JHbjl4dzZYZVp0bFhkbzFvR2tOV2U2OU1rU0Ex?=
 =?utf-8?B?QTZjYTVDWnFYaWk1ZENPNEI1eVhINzB0em1URTl0K2E2aWx1WXhtV0E0Qktx?=
 =?utf-8?B?TUU5RTByR2pBRDBwSVdxOXdwNjBTYTkxWC9Fc28vejg1WkV6aW9FYWhWbVZS?=
 =?utf-8?B?eHY5aS96Um1aeDVhdzNwY3NrR3cyaWNnckZoQlN4YnFlUWFpZGZwNGZqcTRt?=
 =?utf-8?B?NmdOS1VNS21wTjBheVZQa0F1eXZidXludmh0anZ2aGEwUjZjWjhJZTk3UEU2?=
 =?utf-8?B?SzhyYmR2UTUraWJoSU9NejBDUFBNTzhmQms5UjdZYUJQOTJwajlkNk44emVw?=
 =?utf-8?B?WHllMWkramZOcEZrcGl3UklNa3pwajA3eWFlYkdLR2doT2dmNlBOaFg2dE85?=
 =?utf-8?B?bENpUXpQbS9JaXZYemU3WmN0dFJ1a0NIWGt1L0hFWmFFK0NvMStmNSs5MlNq?=
 =?utf-8?B?ck91RDdac3hWRU51ejdlcndSbjlMQ3d6UHRWTGxWWmFpMTV2MXBnVDBKUTg5?=
 =?utf-8?B?ZE00L3A2RHhSRGduS2w3T0NweHdUOHlMcGd0cmswOGVjSmhGUDluM0ZieVZz?=
 =?utf-8?B?aHpPMnZKb1RqbmxkeGo5blp0M1RvVVBJMklqaE1qd2dPNHFlY3JjcFd0WkI4?=
 =?utf-8?B?NFFnQkVBQTBTWS94R2dRZjhTRzBFSkhpK2E5LzVRZE9HY0k3RzlpcldlY0hY?=
 =?utf-8?B?dS9ob1k2RElwMGQvekFBOHF0aDhacjZrR0tsYUw3bWUzVTdrZzRBU3lxb253?=
 =?utf-8?B?R0tiNEk3MGVnM0pPenpqb01PMDgvQUtrYnJUQWRwRno1a3hGMDQ2YUZkQm5s?=
 =?utf-8?B?OEtuS1hUTWNQT01Od3FEcjM3S0tTQjEvMDJra0sySkJ6bXJiWG1wOE5hS3RB?=
 =?utf-8?B?cW5sbG5JdXI0VzFhSHhCUmNlbWtJWHV6ZkxWVWNVRks5QlJMNUpab0FJbTZS?=
 =?utf-8?B?ZG0wQXo1cE9hSlB5VXBIQzhJNVdwc2FZN2R3NW1GNFFLSmVZcXNGclZLdkRl?=
 =?utf-8?B?b0ZaUHdYVzVFOThBcnYzN2IveDV5WlpZcEw0SWRucGFYd2RMU1lsU1JHTEJv?=
 =?utf-8?B?Vy9IRDl1dHBaN2pJSTFkaUwrRHZLK3NVNWNLRW9pR29RNWhybWRyR2p0ZGMv?=
 =?utf-8?B?S0lCbUR0NUhJc2hMYmVNM3Fod2E3aHlJL05VMGlYN2ZoMUNTZ2pRR0NJQzZG?=
 =?utf-8?B?MWkwNHNRaElrNEZoUk1KVGp0U2tWMEc3RENsdHVCV081cE16eXhNbHRra1Z3?=
 =?utf-8?B?NzRYeFRaUzlBYzN0VjJsL051UDFPby9RbGZwbnBPek12WGpaWUs5dTdTcmtu?=
 =?utf-8?B?ZEVlOTIrZGlZR2VrenJIYWpQcWhZa1c5NTRBbUEydnFRc3F4d2poa1dOanlo?=
 =?utf-8?B?TkxhUFdGUmZsaWJ5YWhYdEVWRC9zcFVudmhRY3hsYXhyY1ErTkJrVkRhSEkw?=
 =?utf-8?B?SFNqMHhma2ZqY2dyN0tiZy91SUhoU21PSUsxM1p6c1hHMVNOVFBxM2o4a1dx?=
 =?utf-8?Q?ejkz0hwYiKnqeHcV6G9cKbDcx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1239ec8-65bf-4f32-c298-08dc802a24c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 21:56:07.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzVUxwsX4Y36YaULdGhaQOGU4T0loojLIb4hF9xVDewU5dc9gfLgaja2GlY1hJoVPvPqzH/bG60bTNJP7K37gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

TTM BO destroy is called unlocked as a ref count worker when it
gets 0 users. When that happens we could be runtime suspended,
and waking up from inner locked places like ggtt_remove_node,
could potentially lead to deadlocks. Our warning system against
this case hit this case:

[ 2295.891269] xe 0000:03:00.0: Missing outer runtime PM protection
[snip]
[ 2295.891604]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
[ 2295.891717]  ? report_bug+0x18d/0x1c0
[ 2295.891722]  ? handle_bug+0x3c/0x80
[ 2295.891724]  ? exc_invalid_op+0x13/0x60
[ 2295.891726]  ? asm_exc_invalid_op+0x16/0x20
[ 2295.891730]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
[ 2295.891816]  xe_ggtt_remove_node+0x93/0xf0 [xe]
[ 2295.891870]  xe_ttm_bo_destroy+0xe9/0xf0 [xe]
[ 2295.891935]  process_one_work+0x225/0x730
[ 2295.891940]  worker_thread+0x1d8/0x3c0

Add this outer protection to avoid any potential deadlock.

Reported-by: Paulo Zanoni <paulo.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..a902f23bec0c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1066,6 +1066,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 
+	xe_pm_runtime_get(xe);
+
 	if (bo->ttm.base.import_attach)
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
 	drm_gem_object_release(&bo->ttm.base);
@@ -1089,6 +1091,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
 	kfree(bo);
+
+	xe_pm_runtime_put(xe);
 }
 
 static void xe_gem_object_free(struct drm_gem_object *obj)
-- 
2.45.1

