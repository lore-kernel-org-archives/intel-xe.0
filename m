Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C3C282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 00:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2BD10E2D1;
	Fri,  7 Mar 2025 00:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfST7gAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827D10E2D1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741306158; x=1772842158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RnzUvKXn9R3eqzYftVcC72io/lTy/HEie60EBdqLLsg=;
 b=AfST7gAzLtGLUVbkDO36Oop5tPn47aW61V950MMih6y0N747FAwrvMT+
 BXxn1OEHFq7bioaq3KSGn4KNDBP3KejGDxLPOQHnQiQB1ONRdZdz0dcv6
 SrZnvVt3HUy8fTRtsMLxdeMqQYEmXVt/WgpQtBGHP+N43dON8XlESnqpO
 ODHziadP/1fpiLxAmgzLUQJpQg4MHnProxjvOKEDxcAlG3n0t/LodVi/K
 Qo4iHgNPGmTcxVXy84oz8WvOZG1dih/jqGch44CBfxcm7H+6Bggf18hap
 FRR/pLBXEXnnTcgGZFC9WyB9T8JTSifpG+igLMVNewWa2QEWbTPp4DHsS Q==;
X-CSE-ConnectionGUID: NFDLohKBT2auuNVihRUl2w==
X-CSE-MsgGUID: mKI55MLwQE6azXbafj9GOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52987806"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52987806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 16:09:17 -0800
X-CSE-ConnectionGUID: Jjt3cE3JSdmg80qCqo7kiw==
X-CSE-MsgGUID: X/wZFrjUQg2u2KIgosQ0VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124378348"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 16:09:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 16:09:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 16:09:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 16:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJ0jrDcbd7YY74JNIYv3fFlWW5Cil8XNEpOIW9p/cj5I8NCS/zmXbqfgJ+CCw59DE2PlPYWyEycKzc6WWTHqCjdpYGi0RCvkOOtXjUWqgdE5q5vPiBuomsdgRGdy86Ekqt3kCpgfaOU1RKj906C17ONmop7rKqZhdwMlGyZgClaOzYRGidOfjM6YSMO/WFl79IGDcBRlQ3vDXE1rUdy1Nr7twT1n+Jrgvoe0HAeCfkgcU8hzxx9b+Acg60WXPg47dukxvbh1itxPp2Z40B5n53zBZxA8M/RN0FJ/TepQ6O3+vVoGouSO9sR4JdIfX2dOGB+ZQyJBDOMUiVIAr+6w/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em3RYopK7rBC9a0NCC4x63XL5KVS+El1kN918tGKvv8=;
 b=LBXIO92jTQhhEeoUuWprjf/LQwVi7bbRR1FUeyJe9cLPfn4J1ZZ+/lmI0huR6zwJpsyEhVQtcGZM+OvFan6BrQfuJ4wiqGqXUexickacJW/nQddJHvWyyDdyhC678iTFUaw5+LDxRMUffKWO5ZALZQ3i2Mi/pJP7dkmTIcg+a5Hyrs09eABk1+loJ89Bg/C7aevKnQm6vparqi4K3rXQPyAf66HdmVdPYIARKQq/cjH/U5wKa6Uji5gLowVFWh1z9gBG1/i8VjWYD+a+gXn5EriVNuWu4WfiG+1l3M5DnoiKJEvaz3WpSmkpcfuLQxLDG5sHwPv2+m52zu9r6WHm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 00:08:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Fri, 7 Mar 2025
 00:08:58 +0000
Date: Thu, 6 Mar 2025 16:08:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/pf: Enable per-function engine activity stats
Message-ID: <Z8o5GHw6PCsGic5b@orsosgc001>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
 <20250304095743.3274062-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250304095743.3274062-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: bac7a4c3-b0ed-4931-4a84-08dd5d0c41d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUErRS9zWXVrdzFUalBIN1A1VmRvem0xNHZuL2lHTVZJbWR0WTBMT0ZwVVds?=
 =?utf-8?B?c1ZJdTU4TjZhQ2FNSUdTbU5VdW9vUVZCUG5MaVd4YVVUZG9MTE9lNjA1dU1M?=
 =?utf-8?B?TWloZzFMbTNCbVZhMlI4MnpubjN2V0hwblM4enNVNkkza1dwMFc2ZkhxT1Ax?=
 =?utf-8?B?aVptNWVXTVJHY1NDVVUxRzJ1cnZOWlprUndINWVBaGtOTzRBMXMva3E5Z2dM?=
 =?utf-8?B?bDBDaWxkYzh3T1BwQTVUZ3pBdGViZndtWHA3NUdsMEZJcmlqR0g3NkJaMDVm?=
 =?utf-8?B?ZDJsci9WazBmV0RQL1Y3QmUvdzZ5YS9YdUowb3M3VCtmNzQrZ2xSTnVKY0pQ?=
 =?utf-8?B?VWxZK2d1UVpoOXU4bzlJbDc1Z05DeG12NmtWQjdWZmd1MFNDaGdQWGVoQktK?=
 =?utf-8?B?QnVJWVF4VkVLeUJVREFMMnhBTVhUdDNkcThwR0lyRmplWnRaRkxjVHlhd3N2?=
 =?utf-8?B?TlVnWGljRHhFTmRybm93SVYwdW90ZCtQVkFnbUxTN3FzbGRnbWQ2TnNQcTJy?=
 =?utf-8?B?OUJZVXFjb0xFc2RFVjdPS0tNWlpFWFlOeFdxV0IwWlNqdGJQb2ZwaTZSVXpT?=
 =?utf-8?B?dDBucENZTDlTczdyTmJNbGlaLyszMFZ0YmIrandaa1NsUTU2dmZyeXM2Q2tv?=
 =?utf-8?B?aUdYUDBwc0g0cVYrVVZpWXdKNTVvcSs5TDI1LzlZekhmNDBuUm83Mmkycy9Y?=
 =?utf-8?B?elBHb3ZzRU1FVFJsV3BMM3ROb0RJNXRiVlhzUXdCUUpSM0ZoaGloM0VPTDB0?=
 =?utf-8?B?ZzFub0N0aEg5bGdTUFpKY20rQU8vbndzcVJ0OTVBNXZxbTBIcjdjQW1VdUdx?=
 =?utf-8?B?NHBESmwvT3E3R0VHV2dTTUxRUVZqTlF1dDVJY3JrZnpjSlFOWGt1dk1kNEJP?=
 =?utf-8?B?MDNoNHF6WkxDVDFHNXdUZFhZczNzT1dlemQwZ3NjalBwc0xKenowZEhvcU9X?=
 =?utf-8?B?KzBtUXM1WU1tNzlRb294andVTkxaMnI0SjhOQU5PYTZuRXhudXJjZXFXMkZp?=
 =?utf-8?B?Z0lMaVlmNVlyVEJuanE0SXdBTXJYWXBsamI4Ull3VVB1eGg5dXFxbWNOWkVh?=
 =?utf-8?B?MjBVeDJLb3Vrd29TalZ6V1ovMHlkKzlHV0VUanRSWTZlMkRuWHZ0KzhEcFpw?=
 =?utf-8?B?WlNUL21lbk9EUHpnZEUyc2dQTjF3Y2xlQkxYQVVUN3FtcWJ3RTZlcmgvOFhk?=
 =?utf-8?B?SURoUnBNZEl1VnNMOEg2MXFabExmOWNXVWJGQWw1QlNsQ2pSU2xJS1hNV05t?=
 =?utf-8?B?aFppbkN1U3dCaFU3WjJuVXk4TWJFNGtsa0g0Q25YQlI4WUFaMmJ3T2FQWUw3?=
 =?utf-8?B?ekU1ajYvOXNqQm9Cc29PQjUzenVOZGhvRXgrVEpRNmZqYk9NR0Y3VzdkN3Uy?=
 =?utf-8?B?aWtqUVprZitIcU1DT2F3b1loc0h6cHJ0THpqSXN3RWRFcGhYLytnT3NpRXda?=
 =?utf-8?B?RUF5UktITnlwRWYvNndUTysrbHhnY2FwOVVTL0pybjc4YTJFYXpXVUhWRFNk?=
 =?utf-8?B?OWdNNU9iMEpzamJWU1pILys4cVBxWmhKNklzbnNQSG5MNWJhK0p0Z2Zuc24y?=
 =?utf-8?B?bktKZ2hYMERZOVAwSUNhN1M4d3hQeHlUYVFOcTduTTV6aHJtS0VGK2lWQlpp?=
 =?utf-8?B?U3djZjE4TjBPTnkwQUk1aDVlVVZUV1ZBeDZSWGRLNTloY3hzMU5uc2oyYThY?=
 =?utf-8?B?Uzl4MUw4Ly9ITEVPaXNQMmxQUmtHcFlsSkdGbk1FRGU5dVV0S0RtU1hkbktH?=
 =?utf-8?B?M1V1OFZYalVxd3VBY2x5M081UVJkeGVBTFg3anovbmhxdHBxdGwyYTdMamVr?=
 =?utf-8?B?WWZKbFFQVmwzQ2VnYyszbW85MktNeTM4NWRTVzBJSE45TVF0TXkzeVgrZEhv?=
 =?utf-8?Q?A5nZebjIamyxd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2Vwd3Vmb2dVaUVYODNDbVExUzQweDJNbktnOWdUZE1iVXZ0Z2J5dmxwb1l2?=
 =?utf-8?B?TkZZYWRhR21kMkprOFVJY05pMzNvNVcyYytwWTRRQWwxRXNGSk1RNnhkaGlO?=
 =?utf-8?B?Mmxra3h6TjJrSi9uQlRqcVlPT285VXNTUXNtU3dJNnVBd1dxZnA3bDQrMzF5?=
 =?utf-8?B?ZTBIMTQycEJZYXVwcHM4K0pncm5NeEVYTnpid1Z0NGwzTGVoWi9jTjZ2aThE?=
 =?utf-8?B?ZFlIZnlhK3lHWjF1c2hiLzZidVJ6QmNLMkpaVWVuM1pSbzMwR0JuNHFXMVhl?=
 =?utf-8?B?azFmNGxNM1NjOHRHdDJhUTQ3UFdEYnlQSzRYNFZ6Y3lNMnpyMGRvUDVUUVRM?=
 =?utf-8?B?dlRGR1BoV1FES2FEK3U4bjFIdU9RTExtTnBhV3YvT1RycHBTRXRSd3dTNm5J?=
 =?utf-8?B?NHRpUWxMb21MeTg5WFIvdlowdkxIM3Zhb2phNmZtOEtudUl6UXMvcHlIWUFJ?=
 =?utf-8?B?K1pHakFQVHowQ3J5QWJ0VmtFQXQ2MkNjeDE3M3BkYW85SGk5REk1aksrTFNn?=
 =?utf-8?B?Z1N6c3c0SE16eUlNaUwyWnVOd2xEZ3RJeE9iK29CU0pOMlllV0JHdGtvS1ZH?=
 =?utf-8?B?MitNeG5WT2laK0dyaVB6OWp6Z3pMMGlJeEN3ZEFLZHZxVkU4bUljTGNORHIx?=
 =?utf-8?B?UFlrcTlmeDdiUFViRzNBZ1c4YnNWK2l1VXRzMEZaMm1vY1l3WU96NUVyK0Yw?=
 =?utf-8?B?ZVZWTDF1bXpyLzlheGU5UjR0bitzK250QlJ1K3hmT3VHYUNXU0dVeVN1ZG1z?=
 =?utf-8?B?WnNRQTdSNG1mYjVwd2gzRHRUQjIrOC84WTRiaUVmYUp0ckUxemI4aUFDYWRy?=
 =?utf-8?B?U1kyc0ZVOGFUTVJtYm1XVGpmRkxlTWZLb0R5TVNsNUpzUEVkQVVRQ05RVHdD?=
 =?utf-8?B?YTRDUWxnS3o0cW9PRldkdzY4bTR6OEwzaFBVNW0yZThJSlBCNHBic1laT29Q?=
 =?utf-8?B?MVVaZ0dFeU9TYVhoVjNmUjJhcUwrdnoxTmVkdURPNy9zR3JoSjcwMlViVW0w?=
 =?utf-8?B?YWVnZkZrOUlkeXlMN3Fzd2pQT1RaVk1FUzJKaTM4Yjl4NmFSTmtSTFZ3dEln?=
 =?utf-8?B?QmEycjRMMzNMNFcxdXp0a0pacm85Q2NBbFQ1b1UzaHo0WFRma0JjVkJkSmE0?=
 =?utf-8?B?cmI2QlJjcURTd0pZYkw4b2FzTTJwTCtOeW1WM09MRTJteUowWXY2YXRzRHhu?=
 =?utf-8?B?VjdlRG16N0ZHcjdWN3JyVEpXL296cnMvVnd2UXVYOXQ2UHUxWE93QnhCdDFR?=
 =?utf-8?B?K1kvaW5yQlN2WmdSbXRhZGlORjlOb0dtMTluUzVHZFBRRzhkWWhaY3J6VytV?=
 =?utf-8?B?SFhhakFhYlhjQ3RPbExsKzZKbVZOa3V0cFdzdEZMbjFrMTRtWms2OVViWC9Q?=
 =?utf-8?B?YXlxdDBWemVsSlQzMXhsL1l3Y2Q5Y1pldkVYUWhxMDVVaDB4bms1SUt1S0ZP?=
 =?utf-8?B?bnU4dS92ZXJMMkJvdUZFQVR2aDMvdmJxWlYrTlpDZHYzUkt0S1BYSStiR3pi?=
 =?utf-8?B?TGFMSVdicjJQSUZnUCtVcTg4K0lORno3d3NCNk4wVGpuMkpnNVRZWG1ITFZy?=
 =?utf-8?B?NmsrcklZUnUwdWZSYU1jYmFTZ28vL3g3Q0drTGNPVk41a3h6NUVxME9XNnJa?=
 =?utf-8?B?eXFxNGtPL2Z2M1dnL0ZIM2ppK3lsL1BOUW5HQW50THRRMWdhekhoblVsazg0?=
 =?utf-8?B?REdOQjAzT29oK1cxZ2tYZEFCRkhxdm9vbEI2MGNvNVd5YnhUbU1zZ0pEZGtY?=
 =?utf-8?B?S3pzeGYrdVJwNjZwUm1UMlo5Ymx4NkFuSjI4TVR2SjdiUnl6OEZSamI0MHBT?=
 =?utf-8?B?TEE4dkt0WUVmWlRac0d4UmV3K1oybHlDY09idDZlTFV5MmpubmZPSG5vSkt2?=
 =?utf-8?B?UkliL2lxTGhBcUhIdzljN3NQc0hBSlVPZjB3YTQ4NnFkVFgxN0dPcWMrY2lN?=
 =?utf-8?B?dFpSaWNMSU5QbFJTRElpT3N4SU9xYVkzaTZwem1ZMTFVZFlZbHk5NXI4MjZC?=
 =?utf-8?B?OFRHbDVOd2RlZlo5MU1NQWt2WGtKNUc1aytUOWhlUGtZZEtYU2o3UStUZXQ0?=
 =?utf-8?B?ZXE1VU9RaWdPN3NxVkYyQ2oyWkovY2pIS1ZEN2ppOGlVRGtKNUxiWTJLREVU?=
 =?utf-8?B?MHllekxwS2tJeStxZ05rbmpPMU12eVkvTWx3ZmRqMDZoVGVCalc2c1VSZ2JW?=
 =?utf-8?Q?BBUXMf31BcUO8UuL8oZB5BU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bac7a4c3-b0ed-4931-4a84-08dd5d0c41d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 00:08:58.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPFB+Q0jLbGD2rVCWHJHSMFVE+TPDWvqxXHXv+XphXgV+67HfMqLiKhcgh183esR7WxXKxaqBepkoZ786dln4zK1segrWC7f7dVf0IBSxFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On Tue, Mar 04, 2025 at 03:27:43PM +0530, Riana Tauro wrote:
>Enable per-function engine activity stats when VF's are enabled
>and disable when VF's are disabled
>
>v2: fix commit message
>    remove reset stats from pf config (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>index b9ac3b4e0497..d78e57070931 100644
>--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>@@ -7,6 +7,7 @@
> #include "xe_device.h"
> #include "xe_gt_sriov_pf_config.h"
> #include "xe_gt_sriov_pf_control.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_pci_sriov.h"
> #include "xe_pm.h"
> #include "xe_sriov.h"
>@@ -120,6 +121,20 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> 	}
> }
>
>+static void pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
>+{
>+	struct xe_gt *gt;
>+	unsigned int id;
>+	int ret = 0;
>+
>+	for_each_gt(gt, xe, id) {
>+		ret = xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
>+		if (ret)
>+			xe_sriov_info(xe, "Failed to %s engine activity function stats (%pe)\n",
>+				      str_enable_disable(enable), ERR_PTR(ret));
>+	}
>+}
>+
> static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>@@ -154,6 +169,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>
> 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> 		      num_vfs, total_vfs, str_plural(total_vfs));
>+
>+	pf_engine_activity_stats(xe, num_vfs, true);
>+
> 	return num_vfs;
>
> failed:
>@@ -177,6 +195,8 @@ static int pf_disable_vfs(struct xe_device *xe)
> 	if (!num_vfs)
> 		return 0;
>
>+	pf_engine_activity_stats(xe, num_vfs, false);
>+
> 	pci_disable_sriov(pdev);
>
> 	pf_reset_vfs(xe, num_vfs);
>-- 
>2.47.1
>
