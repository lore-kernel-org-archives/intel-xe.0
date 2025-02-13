Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7087CC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 21:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07210E131;
	Thu, 13 Feb 2025 21:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cge4NUSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4AB10E131
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739483717; x=1771019717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DaWRJPsr4XBHv1tN+TQgt6bcKFxD/nVY8o5meblhRWE=;
 b=Cge4NUSaGp6h/6klU9QxeN4tKuMmTrDCTM/H2tElajY8Lj9+wncnLNMb
 e66KVpLSh0foOUHSMV7VVMCazYOxqv3JaaPatibrIf2L9CmHXQk4mDsQK
 3txU3jMwMFkumNArRrECvHWimLnKUclcn3CndWbeAxkxrRZDNLhBzYwuj
 gUjfkxqDH777Uci5z6RgZ5zVDvc2qyk7sPPbWbG44lX0lUKnLj4P5j0SY
 umgOAF022B1s/z93zzRykhfc2lihMLWCiViw8WzBkXdX4YmsFDhckiomi
 fEI3rcCl4H2KeRpxaVfPL5FKEbmifwNrGIKaLpBHmy1PERhEVDkgBi+Cu A==;
X-CSE-ConnectionGUID: GbCEPfCqRyi9o4HAWj8dyw==
X-CSE-MsgGUID: FQQR9X8rTi6yX3Qov1BKLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40247973"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40247973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:55:16 -0800
X-CSE-ConnectionGUID: b2QIbSyyTdqkIXyRYLkiJw==
X-CSE-MsgGUID: Bg1KSuwuSqKpLmlDowC0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118477796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 13:55:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 13:55:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 13:55:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 13:55:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi8VBp2AGV4K3eSyT/Pi6Cw7b6GgMTr6r33ptbW9ntxMxXRdr072pdmJtME6qywjLCw+Syu+cKts9oKiNrPFM+fyC5zOQD3MoLr1Emk6PG++95ufXiWQi7xl53VyV9DUBWdA9VnWNb/XKA1uUEu+q5suhBrWicrBhK4IghQhSJuR8zsBeHPJRAQKVL+wsHLF9AQqAdr7NUnfudV2RVVS7rsxzswu+ymlMCaKeb2ZyOPXqtWvFYDHZAz317+g0ba4kaSzP0DENVJCkF2MGxkgZkitGik2lJXURcXBzxer43U/72uUagy5+964hTgKPEzAvpeAaL0iDofViHMDRLxFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzthuIHPWC46hDKJ05HFNArheE29/OqGPnglxpoxVb8=;
 b=We90Z8fuIOODNEAqdjtwP9cBSG1VRKwT3aw5kNNLzPEIC8bKb1qExxTE78fts2TwM69/pG05UsAhWHybQGLvnHxpn+AGO4AgGmeogAURgMabwoZslen8/r5seGnpw2XT+GkHjVFGOUIon0HhVGFK4Fi0LZvpF0AA5lEmZCifBpOZ5Bo7gXBc2galmF38q9PxWqAfuwUWdZNlWwGIigIt6mjE+kt4ewhdq0yCBhUqgWs6tQIM6z6Du1HxVCauArYxqZ8mtt5fHCG70bCXqYurMhmgrlPD+eTCgyZkUQerZjMNhKQD9tlBZd8fOekUmkdoBOcbrgasYTtODw30fej9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 21:55:12 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 21:55:12 +0000
Date: Thu, 13 Feb 2025 13:55:06 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 5/8] drm/xe/eustall: Add support to handle dropped EU
 stall data
Message-ID: <Z65qOnhFNxtjyjTi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <c47e43598403dd36346d3236c9eb880f8ddd549d.1739193510.git.harish.chegondi@intel.com>
 <85tt8y73v0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85tt8y73v0.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d8b590-319f-4195-d7cc-08dd4c791713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGpOY1F1bTJDOVhHelVscTJrTVl3anpPckR3aWFscjZZVVh1MGlHS2luQU0z?=
 =?utf-8?B?Q0NaL2E2eXdJazdLcGNXRnNrajhiSURwN0p5Sjl4bEphVXVrYmpTTHZ2THM3?=
 =?utf-8?B?dTcycTdMd2IvUkd4ZGtqaXpYMHpISzJRa044cXE5eGVvWFdsdzNpcFVSYVgx?=
 =?utf-8?B?blB6aUd6TXFxdU1RcVJlblFJRWhjUjErQWtzMWl3ZkVlZTloQVJIV1RUbDZa?=
 =?utf-8?B?T3BpYlZHeG0zTmtqVnUyK1Y3QU5jbWZiN2Jkd1krSVlUdGRZOFRxNkFPcW14?=
 =?utf-8?B?MXJLSGRTaUg0UTJqNXhOTVB6a28zcXhNRGZxQjU2Z2FWVUMvTVFyNU8xejNa?=
 =?utf-8?B?S2NoajloV21nMjVETUgremYzaHR5MGRKOHlkcW13ZjhRdFRiZEZlWWdlZGNr?=
 =?utf-8?B?RkdQS2hDZGJWQW1sSndZYkZuVTFBV1NYS1VLTVhURzV5V2dwQ0dsSDZ3Umdy?=
 =?utf-8?B?Z2Y2TGdrcS9uZDMxS2RMdTc0cnQxU0NjT3RpVHdNY2w0R1pDRFg1aXJTNGhV?=
 =?utf-8?B?dUQxOFZYZGEwQmxlT3ByMTN3eHJLRFpmUnZJWmxSVldUMDJleVdOZDVZWkp2?=
 =?utf-8?B?eUEyTE4yem9uK0tCbHNlUnhMNnp0cG1OODkzS2VQSUI0VE5zdFNybVFRRmlx?=
 =?utf-8?B?UUxoSVFlbTJVQWFPd3ZVaUpmN2prN3RWR1VVSUtoK0hhRHlZTE1USUpFWkRj?=
 =?utf-8?B?Myt6RjFIRkN1YXpFdDE0Yzd0eHlYd1pCWWF6UEdLOENIcUg4ajU2aWFmd2Er?=
 =?utf-8?B?LzF5bTRrMUF4NVpTYlp1RkZ2L1pyZlJNQ1JsWTNiazZCZ0VPZm9Tb1ZkYWd5?=
 =?utf-8?B?Wm5mczArWVhETmxTaXVGaFhIQzdKZXFZSmJ3VmJpbXNoNndOSTNJaXRtZTVo?=
 =?utf-8?B?bVRiZ0F0dTZRWjJScmx4Q3dxcWpZRW4vL3BDZnl3WklOTzdYLzFYdm1iNTRw?=
 =?utf-8?B?cHZjOHVLVDJNYVRIV2Ria2paRkhUZmNIaUdtakxSRUJ4SldCclNvdHIzMkZJ?=
 =?utf-8?B?U2I0QllSaXFmTTh3NEhFTkdQVGZ0TmxoOUpQV1paRDN3ZTlwVVU2VlovZkd6?=
 =?utf-8?B?dlJkeVlyNEhhdlE4NVZoZ1FCWWRjdHlMdUVySmJVcFhMdXdZQmtONlFhSmhh?=
 =?utf-8?B?M1JYRFVKTTlTanpRc3BkTzdIMXVyWGhreWQ2Yk0xcisrQlpOaDBYWHFoNkN5?=
 =?utf-8?B?S01zTU1maVJybFVSS0puY0dybDYvSW1hQTF6dVFWQno5bzFNUjQvOU14dFk2?=
 =?utf-8?B?WkQxczhzQkpRRjRBS2Frd3BxOSt4b1dUUHltV2VTMTV3OTNXMjhCdjlsTnRy?=
 =?utf-8?B?bmNQRTl6NFd6MUFTb21aR3lsdytPSmJ3czBWeGZPWDkxVDFEU3B3SGtoak1H?=
 =?utf-8?B?ekZVZEZ6Q3NRTSsreE5JZWJCM1BvRWNVZlh5WjN6bjdhcUNjT1pHNG04aEZR?=
 =?utf-8?B?Y1lKWnlkTk5La0xLRmhBQVBpV3JQdnUySWZoZTlGU2tDN3pLRm5MTnVtamE0?=
 =?utf-8?B?QzVTQU11c3RMTXJyU0VRRE44NEZGRWVtSXFyZHgyNHU0WXZPR3EwY1JqcVhy?=
 =?utf-8?B?QkxPenQwUWxRYi9BbkdHR01zME84dEE4OFAyd1M2ZUhHb1MvZXMrbkdpYjMw?=
 =?utf-8?B?VzRoSm1zL29VOExwelRYbndyVnlORjVBT0NhVnEwZFlVcllkd1NjcytzMjJy?=
 =?utf-8?B?eVNSNmFZRVFYR2x2c0RmMjNEMW9tc1ZrcDM2Nk1HR010MmgwU29NRkxxOW1k?=
 =?utf-8?B?OEMxUHdIeGhmMldGc1VuQ3JtdHkxWlhxRWN1TS8yeitnSFRNRzUxQ0tvOG5Y?=
 =?utf-8?B?VXBnQjA0dVV6NjB4MkNpUVhFcnFySnJkSG1VUFR6RXorT1hmekN5VVpDMXNq?=
 =?utf-8?Q?8BNSH0TPCTqEw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGRxV2NvUUlMQTZBZStra3c3MUQvbzkwak9rcTZKZndZZDJLQmFzTG01MXNI?=
 =?utf-8?B?Qi9kMHFUK1NGamRwOVRiMUNpVitsakhqaFRLWTFtdURuSXBoZGZRbm1ra3o5?=
 =?utf-8?B?VTRYSWY3bkhVeDJvbS9zMHBaZ21RMkxVUC8rTlNySE0zRmYra2FwNWxjSy9q?=
 =?utf-8?B?aGdXWnA2VzNROCsrZDhXTmpZZ1VyOXZseXA3TlNtcUNkTXVQZDNNOE56ckQ3?=
 =?utf-8?B?QzA5L1BvT2VncVNpUzF2Z05hQy9PUUFFMXhOaGZRS215eEhtazZFQXA0cVkz?=
 =?utf-8?B?Q0NuKzcxdE9JSDFCczNqZHRmbWRHZ1hKMG9ST2I0SUd1MStUQ01ueFZkcDVU?=
 =?utf-8?B?WGxpellMbnI0ZUVLWVdyT3VqdlcwYjFBTHFKMW44bldSZzdjaWtweUhvN3NV?=
 =?utf-8?B?K0Rsdkc4dzVRSzA4TGM3R3hvOGZXTU5oUlptSGN2ejRmNWFmM0ZoWnJTcUIv?=
 =?utf-8?B?YkhndFZzQ2RqQmJDZFRBYWZsUlp5UkV3TllmcDdmbHV3TTBHc2xtZEl3cVJY?=
 =?utf-8?B?RE5aSFNwU2djMzVUUDd6a1dkcmxkV3pPb2lWN2VqdWIwd2QzK0d2VERxMWQr?=
 =?utf-8?B?OSt2MCtnWVB3MzVhYjhNWjlFL05iclNUUFpKczF1NWtud2RBVnV3THBHd1hE?=
 =?utf-8?B?Q0R6bElRUzNTL2xSNVBZSnJyOHZRbzhpZkdLYVhwUzhKOE1wLzBkQWhHL1dW?=
 =?utf-8?B?TmtBSmU0RTRvTTJVYzRZN2xOQnFwNWV5SnpIVGpybjI3SE83UG43WFMwR2Nz?=
 =?utf-8?B?eUNJZXRQQUdhSVN0WEJPTUJaSGJva24vKzVINmdaOWU2VGlJUkgzQWdKbXVw?=
 =?utf-8?B?R2Jpc0VUZ0dQdXhPc2dzWERhT2hZUklCblVYcyt6Q3pUVWlpejVxb2dsT0dJ?=
 =?utf-8?B?Vzk1R2xFNk80KzZwekNwVnVDUDVSNUpGMFIwQ2d4bTYrenBmdDExQUZEMXJH?=
 =?utf-8?B?WDN2N054NE83ZWVPRUVJdElHK0xUMHJSc2lLSWVBb1pOU05NcTJsNXJ2US9x?=
 =?utf-8?B?dWV0SkovNFJaOUFWZDd1N1pKczhGR0ZVT1hEOHJYY2o0Zkd6SnpxRkdjQ0Rs?=
 =?utf-8?B?K3VydCs2WVhLZXhndXpmSXZSbkptNm00RXdKcFVMVUx4WnR0S2psSXRSbGk3?=
 =?utf-8?B?WkdPVEw2bUtTTmZjNCtjNFFrMXFraW5vTFk4TERuU3VkbFdlT0RrYW04SU52?=
 =?utf-8?B?bEVDckdoQlY5a09wbVlSWkhQN1FCU0lkNFVBcG10RHNjQng1V25ZTUJzcjRH?=
 =?utf-8?B?dFV4ci8xTCtLeXUzME82RmNhNDAxSmZkL1lUU29URDB1VVJvVitzUDJGTE45?=
 =?utf-8?B?TmRZendENHk4MEpZUU54ZEdzVk9LTmNPdlpYQ0VoZWNPRXNCQWxLVFhuMXZV?=
 =?utf-8?B?ZzIwNStFV0ZzeVpncGxTR2J3ODZyNHFZVVhzaVV6U09YL0VPSGd0R1NobFZK?=
 =?utf-8?B?MGFyNitGQXRXK2hKaVc2RDNWcDFQRjNCRW1HcmwzckhINmV6MDJ0TUpNQUJB?=
 =?utf-8?B?TWU3RTBOTC9VL3hySVNITmNlS0ZxR25IRi8xYzAwNWpRMnRhWks3YXUvY3M3?=
 =?utf-8?B?bFRVRFdhY2k3Qzh6YktzV1lONXBMYjQ4RnEybGszV29XT09sTFVMaW1rVExh?=
 =?utf-8?B?RnluQU9qZm9Femo2bUxRNTl2SGNaTEovRVdkMXVpNUNrZG9LbTU3NG5YbGdQ?=
 =?utf-8?B?eCt0OUhTdERhaHJPZGVpNXRZUEllaGc1OU8xbThwMEVlOHBKdkxKUlJiRXl4?=
 =?utf-8?B?dEt3ZjBaYVRIbDBXbk9nZTF4dE4vNGJndXplcFN3M1FBWW5VU01lL2xEREd6?=
 =?utf-8?B?ZEJOdXBQNFY2MVN2SDU4NEdvN3hnL3NZVW95M1A2b1RrODhNbURBcGt3ODlk?=
 =?utf-8?B?Mm01aUwwVTJJR1puNWdqbVJIc3JGcjgrRWcrK0ZVUjZNemcxdm9JUlhPZGlQ?=
 =?utf-8?B?YzA5RjJRd1FFaCswVDBKeHlMSzA4c2xzREVmWlBsamdCYzFCVGpFaDZpMzh3?=
 =?utf-8?B?c05FSEhuaUtXSjc4MUVabFQranNKa1NsMjRJMW9lT2dwRzNpZG83bHBHQUpC?=
 =?utf-8?B?cE9ONjRyZnpkTEorRWp1VUY0aGdtMGVmU2RBMUJUZG9pMmtnajg4VVhLK1E5?=
 =?utf-8?B?WG9UUkpacWFOYm03c09nWTYwMDhqdFFBcnVqR2VIMTM3R1V4ekFjWUsyVEFx?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d8b590-319f-4195-d7cc-08dd4c791713
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 21:55:11.9520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1gOXVd9q7NIcRm5x8Hn9fWbnXQGGlELHutw6ByMIADy4WvyuVEE28dEu8EmFOMplZhjLoyzXMi81MfT7RTbFKJvDXHvX0MZ87AKh1Ygr/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

On Wed, Feb 12, 2025 at 10:31:15PM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2025 05:46:46 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > If the user space doesn't read the EU stall data fast enough,
> > it is possible that the EU stall data buffer can get filled,
> > and if the hardware wants to write more data, it simply drops
> > data due to unavailable buffer space. In that case, hardware
> > sets a bit in a register. If the driver detects data drop,
> > the driver read() returns -EIO error to let the user space
> > know that HW has dropped data. The -EIO error is returned
> > even if there is EU stall data in the buffer. A subsequent
> > read by the user space returns the remaining EU stall data.
> >
> > v9:  Move all data drop handling code to this patch
> 
> Good, separating out makes this easier to review. I would actually make
> this the last patch, but anyway it's ok as is too.
> 
> >      Clear all drop data bits before returning -EIO.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 39 ++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 53f17aac7d3b..428267010805 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -53,6 +53,10 @@ struct xe_eu_stall_data_stream {
> >	struct xe_gt *gt;
> >	struct xe_bo *bo;
> >	struct per_xecore_buf *xecore_buf;
> > +	struct {
> > +		bool reported_to_user;
> > +		xe_dss_mask_t mask;
> > +	} data_drop;
> >	struct delayed_work buf_poll_work;
> >	struct workqueue_struct *buf_poll_wq;
> >  };
> > @@ -331,12 +335,24 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >			if (num_data_rows(total_data) >= stream->wait_num_reports)
> >				min_data_present = true;
> >		}
> > +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			set_bit(xecore, stream->data_drop.mask);
> >		xecore_buf->write = write_ptr;
> >		mutex_unlock(&xecore_buf->ptr_lock);
> >	}
> >	return min_data_present;
> >  }
> >
> > +static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> > +{
> > +	u32 write_ptr_reg;
> > +
> > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> > +	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> > +}
> > +
> >  static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> >				     char __user *buf, size_t count,
> >				     size_t *total_data_size, struct xe_gt *gt,
> > @@ -436,6 +452,22 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >	unsigned int xecore;
> >	int ret = 0;
> >
> > +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> > +		if (!stream->data_drop.reported_to_user) {
> > +			for_each_dss_steering(xecore, gt, group, instance) {
> > +				if (test_bit(xecore, stream->data_drop.mask)) {
> > +					clear_dropped_eviction_line_bit(gt, group, instance);
> > +					clear_bit(xecore, stream->data_drop.mask);
> > +				}
> > +			}
> 
> This is not making any sense. How can we clear_dropped_eviction_line_bit
> before reading the data? The HW will set it right back up.

This bit is being cleared here because the driver has acknowledged to
the user space all the data that has been dropped so far. Any new data
drop after we clear the bit *should* result in another -EIO return.
HW will set the bit again *only* if it drops more data. User space is
expected to do another read() to clear the buffer ASAP after getting
an -EIO from the first read().

> 
> At least the code in the previous version made some sense. So we should at
> least go back to that and review that. Though it also had issue with how
> many times -EIO is returned etc.
Can you please explain what is the issue? Every time there is a new data
drop after the drop bit is cleared, it *should* result in another -EIO return
The driver ensures that two successive reads will not return -EIO.
> 
> The other issue is the locking. As I suggested in my comments on Patch 4/8,
> I don't think we need a per xecore_buf lock, just one ptr_lock for reading
> all the DSS's. And then we can use that here too.

I used a per xecore_buf lock so that the polling function can update for
example subslice 1's write pointer while read() reads the data from
subslice 2. It would lead to more parallelism. With a higher granularity
lock, the polling for new data blocks during read and vice versa.
> 
> But at least let's get something sane for review first.
Before I spawn another version of the patch series, I would like to
list the approaches to take here and cons for each approach.
Feel free to add any other approaches you suggest here. Feedback from
one of the EU stall consumers that they read data even after an -EIO
return means that any approach to discard data in the buffer 
is unacceptable.

1. Approach used in version 8: 
   First read() returns -EIO without clearing any drop bits
   Second read() reads the data and clears the bit for each subslice
   Cons: If the user space buffer is small and all subslice data is not
   read, those subslices whose drop bit is not cleared can cause -EIO in
   the next read(). This issue can be mitigated by user space buffer
   large enough to read data from all the subslices.

2. Approach used in version 9:
   First read() returns -EIO after clearing all drop bits
   Second read() reads all the EU stall data that can fit into the user
   buffer.
   Pros: Unlike in version 8 approach, even if the user buffer is small,
   all drop bits get cleared in the first read()
   Cons: Because the buffers are full, if the user space doesn't call
   another read() soon to clear the data, there is a higher chance of HW
   dropping the data again, setting the bit again.

3. New approach: Hybrid of version 8 and 9:
   First read() returns -EIO without clearing any drop bits
   Second read() reads all the EU stall data that can fit into the user
   buffer, but clears all the drop bits even for those subslices it
   can't read the data if the user buffer can't accommodate.
   Cons: For those subslices whose data buffers are full and drop bits
   are cleared, there is a chance that the HW can set the bits again if
   data is dropped again unless user space calls another read() fast
   enough. This can also be mitigated with a user space buffer large
   enough to read data from all the subslices.


Please feel free to add any new approaches here that those don't discard
data in the buffers, also add any more cons to the above approaches.
Let's agree on an approach for the next patch version.

Thank you
Harish.
> > +			stream->data_drop.reported_to_user = true;
> > +			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
> > +				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
> > +			return -EIO;
> > +		}
> > +		stream->data_drop.reported_to_user = false;
> > +	}
> > +
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> >						gt, group, instance, xecore);
> > @@ -457,6 +489,7 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >   * before calling read().
> >   *
> >   * Returns: The number of bytes copied or a negative error code on failure.
> > + *	    -EIO if HW drops any EU stall data when the buffer is full.
> >   */
> >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >				       size_t count, loff_t *ppos)
> > @@ -543,6 +576,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
> > +		/* Clear any drop bits set and not cleared in the previous session. */
> > +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			clear_dropped_eviction_line_bit(gt, group, instance);
> >		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> >		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
> >		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > @@ -554,6 +590,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >		xecore_buf->write = write_ptr;
> >		xecore_buf->read = write_ptr;
> >	}
> > +	stream->data_drop.reported_to_user = false;
> > +	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> > +
> >	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> >				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> >				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> > --
> > 2.48.1
> >
