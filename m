Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065ADC04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689910E0AC;
	Thu,  9 May 2024 00:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yowvzzd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F45F10E0AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715213047; x=1746749047;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xitocgNxX1cxttl8KCN9IV7ugBf9epTpDyJ5s4cvQ44=;
 b=Yowvzzd8sjRMe+Niq+ZwI7EMlR+e9Cd+GIG9g8NCDdAvNyf5O9OBYCX5
 JQZlfDjnnd699e4VA04ms0MSF7gxa7vppJlzR0xz98bGOL/dN9RX8dRnE
 STHYUtybbA2arG7J/IrjigkutgfnHhQfm6LEjtYR4p9Q+cD9b9MZ/q9gf
 npBysRxa8H3uIya4qT8C61PsfNSos5nvkApVmYe71lNjvWGhCjAWMJ7+M
 c8+OImtX/Pe22jrW4bWJjZMlr14hJHgdI5ewlAx7tdlTSElMoyVl+l3rv
 bHa2wggF7vMW/ZR51focv4Y8OJawC8UeBqf7w/3L3Pm10rmWuRLzsvMtY Q==;
X-CSE-ConnectionGUID: KcQYesVqTKykYxmo7ajDKg==
X-CSE-MsgGUID: k7ULYGtRQPywfUyq+vXJLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11262237"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11262237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:04:06 -0700
X-CSE-ConnectionGUID: mSvD6iJjQBal+YfsO9jysQ==
X-CSE-MsgGUID: cfe7SgndSFKECygoz8biBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33526629"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:04:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:04:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyq5Jq1lnS3kdw7aXFB67uxuwQnerf+nMQLVrsw5cxT69spEjqHOHkKe0nf8qRPlYh3/y4T/inOhWJmxzms8aEAqIKYixfepRg7dU6pdgnkOFvItIRE33XqIrAY86OjB0pIZcqUIkiJXwj0kFJji28+9WK2lGYIY6n+nAeIB5AiGWzyCsp0MP2DnrtS6d+54v8XnQ3BOrQsJOAyNqaf+7AgZpbswfmLjWGycKsN6vypRzmzUcAlMt5MxtBxF6zE5eDGhZEMqtF31/U7qrPst6UccOelNoqWr2HJCj4B5ndhJs5llhN+6Urq7QZwMPC14YKWbXKh/JfR1QEEH9cUj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MMqO+MoHfjy69Re/JM/lXxsDzn2+zYWobTmpLb7NtE=;
 b=W5ZCpiBvZwFMLfFbWQPA1xIR9WZg0Vc/avwPGSekDvhkpwhkmfeRoch35xVzyOXd0sneZgEXCY+1Rv1wa+v9TUQAQLUvxGZcAcUfxDrN8MJUXkAANuSOGQSCb/tkKzslWWb6mIL2gDID71U+K1Kk/v12gZtFvb7i1oLhUP9Kag7pUVcqAoXbr/qJIiz8EveTLAU/RgognROF+Cv0PpkH3Zcw4EvvZXk8q2uLh3Uk64kI34ESZ/qoysQjzG+SMMPJ8VakPf91EkCB3JZiZ5Z421P+J8O5z0XXCd7CBrX6g1bQrnNTkmK5HpVXKWdR+yOuldpKePhu+s10yr1EC9OTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 00:03:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:03:25 +0000
Date: Thu, 9 May 2024 02:03:23 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Drop useless forcewake get/put
Message-ID: <c2i7fyqwxeyz3oovzuuubunnp2fcn2ojkvdev5ls2i5ew45s43@kbum5j7us3xs>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425182410.2705061-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fd0b6e-69dc-447b-69f4-08dc6fbb728d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3pmRjdGQlVucldMTWl4SU54QnBVeVZFS21NeFBsNU8wNk5LNCtVRmk4dmFJ?=
 =?utf-8?B?ckJ0VWtHSnBCTmRPR1Z1akwvVEhSY1k4VG03M1RrbFU4SjNqQjFCTlZ4alFR?=
 =?utf-8?B?NEZJVFJVNC95cGpBWjJIdndBZ01Ddnhqc0VFWlJwNlBwcTFIc1pONHBpa1g0?=
 =?utf-8?B?NG5QSjRrRlBaN042VWVKMW9Za1MwVE9FWUN4UU9uTVFuZ2tDVEpBYTdqM09n?=
 =?utf-8?B?Sm1FbjZSZjg2MjZqUlFOaGpqQ1hCbnp3cmtZUzV4WUNISUkwbFNIMjh6Q0xy?=
 =?utf-8?B?UDNac2tORGp2UzBtR2ZNODNCMUJYY3Q5TUxpSzJ3N3lUdFdvY0VyQ3UyVVMx?=
 =?utf-8?B?VVRtYXpHRmZMR205QlNudk9TaURPanBRNVNmZVU1RjBsb3p5bm9mNzdKQTNj?=
 =?utf-8?B?UkRBUE1pR1dRUFBrMWxxWnFMWHBWdHR6VVdNbkZISUpEZWcxK1JxQ0NhUHBT?=
 =?utf-8?B?bHlkSDRrekVrNU45di9CVUQxYVhiYTN6YnZUMTlCMDJXOVBFMXhqTDVGcnhT?=
 =?utf-8?B?MGJJVHFTNDlHMk1nYUZCVVFiNU83K0tJQmV2RzE2a0crcDRHODdLUnVvR2Fr?=
 =?utf-8?B?TnJOTXdQYkFNTVArTmNXWllGODV2d00xeUFOdVZycm1tbTFKYzJ1TkpoS2VD?=
 =?utf-8?B?TnhtaDZkbnJyb0VvMGdSbGV3THNQOWxYcWorWUJ1QVBWSWpPSy9XNms5MXRt?=
 =?utf-8?B?UjNoUUppdFcya3NVbFZ0RG1mUEFEMnEyOEtxNEhaK1dDS2wxanFaZTlkaEJJ?=
 =?utf-8?B?TkJvaysrZThSTHBSTENDdld0bk10aitjZzdDWFZWUHFVWFdZOG9jYko4RGI4?=
 =?utf-8?B?cS9tanV0S0tvTDdlRG5yaXc1TVZiSlRpRzZOTnJabW5icENlUjlKNGdvYno5?=
 =?utf-8?B?ZzJ0c005cTVnVEE4NjhGYkR1K1czZkpQWkNTTzNGQjg1TXVneWszd1llUVpa?=
 =?utf-8?B?ZFJRUVZpV0FSM091bVpXNDZGZFNCQTBYY29UV1lzYVdqNGt4ZkpISkdmdjdJ?=
 =?utf-8?B?Q0lCK2d4eTRBc0kvMmdrUEI5MWIxb1Y2SC9PQWtzKzN1WU5Ta3VtRm51YTVs?=
 =?utf-8?B?Ymc3cXBIV0Z5OFc5dXVrRGF6ajVXWVRvbjhWVkRjUUErUStZVlRaQjJwZGFN?=
 =?utf-8?B?OTRpVTFpZkdZbXBqRm9EOEEwZCthK1RxMm1jSVpZcUV6SnZrTC9yRG5HL0Iy?=
 =?utf-8?B?d001UjZiR1FEemEzblAzQkc0SGk3OE9KRWZZUHNaSDBPRDNENkJ2aE5yOVJr?=
 =?utf-8?B?NmFZMnN2SUw1bW9mRFMxc2RESTVFZG5EVzlJV0poV2lOSWtFMTFxNldoNTN3?=
 =?utf-8?B?Tm9Vb3ZoSm03YnZuT245NmxWaFk1NWFPWVF2cTlqcE9FZE82elBUTERLSWJ4?=
 =?utf-8?B?R1I2ZFFTNUhBbDQrZkw4NjIvY1NJb1RVa2FmMlNReFVWQUJVY3NVQXJ6bnJC?=
 =?utf-8?B?bUNhMHREYjJHeXlPcjRScXZ3djVwSFhEUFVWQ2J0UHJBWm94T2Roc0g5Q0cw?=
 =?utf-8?B?eVV5YzdkNzJwT0xWVFVqQnRyc2s4bytOY3FxSnVTZS8wNVZCTzBLQW8yZGZ5?=
 =?utf-8?B?VyswT0lvazVDemxleGZSMDI0VWpweWM0TFIrQmIyc3FLQ3B2Sk9iWWZsM1V0?=
 =?utf-8?B?Vjk0MEhqcEdFeXVrSE1jbjZBSE5XZDR0czJHYlhuOHVXcUlXTjdSS2lVVHlX?=
 =?utf-8?B?UTBjWHhKcUYwNUhQcWUrRCtTeG1IYkxHb1UrdXVLZmtBWTJueDFXcldRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFFVMkRxb2x3TUlPdW5Yd0JvMFdFL0lsOFh0Z0x5ZzFqVFNlL0NSdVBIWGNQ?=
 =?utf-8?B?aXVaeVh2U1BabnZUVUJoMVVjT3hwc3VLR1orcTJBc1RRNGdORERaK3RkUWtU?=
 =?utf-8?B?dVk3QTdDQ2VBTUVjM202bjNxMXNvME92RjlFZlliZDY1cEliUjRRclJsVEg2?=
 =?utf-8?B?blBOclRCeHdZTy9wYUJIMTJjY21nMHJXVmRkTE05NVByZjdwR09RY0lGS2Zr?=
 =?utf-8?B?dHRzb2V1ZWpBL2JabVpJSmtsRXpyNDhLR3J1ZytWWmVlSWFZV0ozNm9KaGxY?=
 =?utf-8?B?aVdqZ3puM2VVb2UrZWdwYklHR1JKVHQ0K0hCb21hMHMxUnpnYloxODc0Wi9B?=
 =?utf-8?B?enlobWs5MGJob1pHUDhOSWVPM1hXMGJkcG9VUkhrVlp0T3l0YW8rOU8xRlUv?=
 =?utf-8?B?eDlXSk8zWTJXNXNJcDZZcVRKMFdaLzQ1b0FzdmtaVHNiS1RmS01qYWpFMGho?=
 =?utf-8?B?OFZzL09WMk1wZEVORmZ5ZTZGMm52cUVsMVE4c3ZhdEplVjFxaUJlQ1lFeU8z?=
 =?utf-8?B?bDZUZWJwMFpzbFN5SWVSSVNuUU1neWVGVnZ3MW5LRXBBSEd2U3l5Z0JZSmlD?=
 =?utf-8?B?a0FQWUFmLy9vV1kxaDNGZng4U0dwaWVyaUVtenJENjZHVnlMRHVkUnF4dlhU?=
 =?utf-8?B?TjE1V1NkZEtKTkpSZDVid1l2TURMNkhYUVNXbjF5a1ROcmVxdzg2dnVSeE1I?=
 =?utf-8?B?anhmRm45eUtLRFlOR2w2L1o3M29OOXBIeEJrWkd5eStkVGJGd2NITis1b002?=
 =?utf-8?B?K1NVMzhkU2RYdG9JUk5HTnZiNFZWbkNxVjFRd0JxVWd0U1dWUWlCOUtZZjl6?=
 =?utf-8?B?V1NGaEZLRzZJZkphdWMwNURyaTR2aUVEU2xnMTlJaDk1Si9UUjgwbFFhRnFP?=
 =?utf-8?B?NHJ0VDBuV2hKTjVvWTc0aytpV3lHb0xURUg3UEF4QUZ5UGMrajFBZ0hGS0th?=
 =?utf-8?B?bjA1OXpLR3hhMEhzUC9NYWhFRlNmbnQvSVRWeHdlOXFINEZHT2ZRMjBhWXcz?=
 =?utf-8?B?R1ZEN3lMbi82QlkxeVFlbmdwU1N0ckQwUGJIaksrQld5Qy95dTVBL2l3OHY1?=
 =?utf-8?B?by9udExGVE95dlhkZ1p4dlhaNFZZQVNEaFMrRENKNTljNkdjUnIydlpHcjVM?=
 =?utf-8?B?OCs3TmRyRXJNMWU1ODF5R0wrUlU2aTBPVlovQ2JaRC9WRnBLcVRuNVlSb2FG?=
 =?utf-8?B?T3J4UWNSSmtIUUI4R0dxaDl0N1ZGbnBQZDBTbUhYSGdmZUdkaXA1SFFQMlpU?=
 =?utf-8?B?YUlXa2FzdkF6dmJpenV2ajlSS0U1dVpVQTNETWc4eWlabXpzU3hTZmpUTyti?=
 =?utf-8?B?TzBkU0w0WWdCR3N5bmlXVExKbysvQ25uM0VwU3NWY01jZlJhL01zbUQ0VXFY?=
 =?utf-8?B?MC84NVZFRXVoUFRSSStPaTNpblp3VWhVdkNmNlp5d0RsWXhSVFRiTENUUUhi?=
 =?utf-8?B?bWJ4K1JEaCtnYk5zUjNEaEFqaXkvcThqRCtUTHU2TWJHWTVFR0luOU9TWU41?=
 =?utf-8?B?ZGRuM3diU0RLRW84SjlEd3RDUDVJc0ZHOWt6dUxZRlAyU3VqMWh1Rjl0ekdl?=
 =?utf-8?B?Q08rZkFRWTZkeGZtSk5DUUtySy93Mng1b3FUdjhEd3JKek9USmdYdFJCMCtw?=
 =?utf-8?B?L1dmeXkybUNlOU85WnJ0Z1JxZGp3Nm1wSlZuOUthY0F6Q3EvTzF2SmtJdDFI?=
 =?utf-8?B?U3dScTlhV21ZSTdTS2xYV1UxZzJMdEJMNUZuMS9WSGFlK2NaSUx6bE5aUHox?=
 =?utf-8?B?RkZ5ZStuZnAxLy9mVVUxU2g1QzBNUWN0SUt4ak0xTjdNMzlSMXVaNklqVE5F?=
 =?utf-8?B?MWF1dE5nYTRlakRObkFsYmswZGlxbjA0SWtQcHZmVEcrZnRGY0NmbGJ4RjF4?=
 =?utf-8?B?VkJSLzkxRFJ4d3o4OFUzUkNwbDBNRHVteFREK2t1Wmh2R2QyYlk0bWVWU0sr?=
 =?utf-8?B?UEJVNE1tbFRSZmE3K0dDWE1JeERwUTZFZndvcFMyVkhyaFhzbnRVUXdLVHN3?=
 =?utf-8?B?ejByREUyZmFwalVzay9DZkVpZkdWRzcrS2gzK2tBakJocjlsVXBEMzI2TklT?=
 =?utf-8?B?RFUrRTkyNzNJYkgwUFpEYVlSMDNJSWQ5KzhmK3FKN0tQcmZOeE5pR0dtcGFJ?=
 =?utf-8?B?ZER2T2pCQjFpTngvbVFDUlZTM3Z4elBuK1pTdVZSN01wZjgyS0dLOVBscTll?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fd0b6e-69dc-447b-69f4-08dc6fbb728d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:03:25.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z8YALn2fr20LqTkQ+iisfhK0zUYWY9vkcgUlqckB4eZgsw69ycdrxBjcNSlp55weXqtO61cgUjgnFF9puuLQkqoMFKMKkRq9UxZZEuV+sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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

On Thu, Apr 25, 2024 at 11:24:07AM -0700, Lucas De Marchi wrote:
> Forcewake used to be needed in xe_gt_init_early() since it was calling
> xe_gt_topology_init(). That call was dropped in commit 4c47049d93b7
> ("drm/xe/guc: Fix missing topology init"), but the forcewake calls were
> left behind. Remove them.
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 00a22cf2f5b5..805fd0acfc03 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -318,14 +318,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  			return err;
>  	}
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> -
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> -
>  	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>  
>  	err = xe_wa_init(gt);
> -- 
> 2.43.0
> 
