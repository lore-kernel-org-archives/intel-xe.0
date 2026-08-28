Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7E8C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 10:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9656210F337;
	Fri, 28 Aug 2026 10:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZLOQJaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25D710F337
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787912905; x=1819448905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sFlOpgHVrsvy2Z8JRxUvU2ibMob6dwK1mlzaYPe7TY=;
 b=AZLOQJaDOo/mXdvMb9NqN4nsIUKlGb2QJcpI27qiS6hktLXAA88APQBU
 7jzNIN7JtFmn8D71PtbMzoRZrhOVXWjO/iKelsCKR0xbyFozSW5fAWrW3
 zngg0DCF6OzfTzKCQzV1LKQTIDcELpUIsFG63+2OKqCKZQ+yzVaqT0M1x
 GyUsvcOUt5w9KjCdfrYZxyUGNRaxtLaVU8m59WqVwAQqN4xsUcDfKWFmi
 eiOjEdvBMpZWzY8BWqxgS7QbPX33LtxX1csbi8OQTx/Xba8RssHlKAKsj
 nDN7WtCoKLf9FoED5GCyW/hA9pnap9+KL/cUlHbOR0yFpjtRoG5sQ28uK g==;
X-CSE-ConnectionGUID: +0X7v+X0RWyWdPsHqGW06w==
X-CSE-MsgGUID: eGM8DftJT2658DVijtWgdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105793704"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="105793704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:28:24 -0700
X-CSE-ConnectionGUID: MOMIeUGrQCi0unHRLwtjEA==
X-CSE-MsgGUID: No1s35seQmKQo1vsLnqxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268145322"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:28:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:28:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:28:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4yHS4LUTKv68nPkbz6cZoqOncNuiuDwBTbRAbPagXMaBpjKKCVqpxfWexdCOp/asac9Wb1b4DCnXqjJLM71grdWSsZuUrh88R3jB6/mjmrpcrEcT3rGKBjqjUQxWk8zRyxXyQw/Wy/fjOo2FG9RYQX98PRpToiknDQLvh6lVpYRr31q15XSPfXrmp3oWFUVfuNP7X/nY2Pr/GbqORQGPmJt+iXDzvQ8WiTrxtZmye0xymPS6d6Dyv74LB9RXhnIF7aO2hrtSl5K2dRVvlPO/G/ZY+VeyZ0HEVcWpatdsfX2Xudn9Hpvw1WSHhyvUUK3NVfLy29tukQlugKR42Lb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ykT9egD0VhY01NC9CEAIco64fhj7M5b9gv2PiIGZXc=;
 b=oo3ymPVg+QfiwdoLsmJcSKnrlyUiy4VOhT/TY34duQ4cvGUsjp4RDD6amoAoAGBWsyQJy4PuRkkLrnB8czUCbr/uetLLOphyGBZ638PMcJ9fFX12giuBxNqOeqJ+STxZotaBz2MkIUGLl1NpzICuSfRgC16nlXVGXa325LnmNvRermQyrXV5Tp9uUznv7vqnhVv6dv4hOLmM1uDajDtJjb4VvMpx5o8nUmULY6VdXz06YraeWzb4m0yBNb5Oq2iKvwDbED+nL9uAOwh+kPNlqwtdy8iUs5gKJAg3rQi7GtBDwLbsskzi5lXuGtk4G6Sr2bY1DVoRL4c/vmTBTYWrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 10:28:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:28:12 +0000
Message-ID: <8eeac07f-deea-4d77-a9dd-7fb5706af15e@intel.com>
Date: Fri, 28 Aug 2026 12:28:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/guc: Report reset-request failure using
 SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-2-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260828095803.2130312-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0021.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: f0533393-9e46-4237-fc9e-08df04ef1012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Tt5cZRoBWNRreo04WHpo6yvD9tnQrBAWpC9tLffCFhahsMsa+KXkk59uHiBzQhufdk+kcqgDP1vbqjeME13KUATU0q5o9Nhjyc/CIn05oR/QtrIdPJi1ZR6wWB2K08rk7yOwkaXd4bR/jqQv9gzTdIKvmmEBkjQctKy8ShWuy3FY3mKR6LTwMEG52KzY+2omjljQbYe6+/Z7iMz2wPoI1I+xg7aBMaw3WehFJm5qDcO8IjcvnuNalI5q4tiD1IIGYdXdK6PwsjdYuhQbTYMBf64KPTTDjD+NhJeH0E8xC9mdauUZZyHwSboz1VmtEDx+o5JP9/q1bWdGUJ7InOq2ckzvru0cQbF5k2t0ImGRgS6qF1k/hv1gotNwdWupBN6FoqlyiZ8xTtsLIlLfot/jzHl7LRr4AJvJNafUVX9pX5W5MDdlmwXB4j1W2gvEGKN+8r4tQx/gvmAnuwb7fGYcEJflAacXp0g30mugqxyGUFGkb4JehsaRDFRgoo1erBphOor7FGZfZINwHiboZAavUQtyF8RbufniJAxRoY0GaKWB5GvxnqfQARoROlDRFLWck2bTzy7qXJSclWKdDEftBhAqw1JW2mz5aWhm4IsDq0DI4/kA+FXp+DGwds1dNlD9EWgMpxg4D1TMOVoiE6EANF7v7oQ3LAhRkvgq1RS9weY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hPT1RoRUNKMXg5QnNRZ0ROTmlPVW96a3B2d2dEdWQybis3L3pWS0RmVEtU?=
 =?utf-8?B?QXVzNDBGYkV3N0NMWk5KNytJcU1vTGtnZ1Q3U3RIZFhsbEd3ZHFWQTg5S3dZ?=
 =?utf-8?B?cjFwZ21mZkFEV2lPT0RpcU9yRzhOcVZ2ZEtnbTV0b1NKekMvMGFjbTVGZHFH?=
 =?utf-8?B?Rm1xN1dNc05kcVluZjNNY2Y3UkZqWU1rUzd4dUFaMzJRLzl3NGdWYS93MDRm?=
 =?utf-8?B?NUZjZGxpc1VrT2xaU01BcTU1K01XRDE0SENudjFLT0VrSUZPTEovV3R3d3hM?=
 =?utf-8?B?dVVqbXdIZFBJSlJpT1VyRFE0ZmZzbkl1WFNRSUh5YmRwdGVyM1lPSlNLcEJC?=
 =?utf-8?B?WVNvMGVuWmNyOElZajhMZFRERnVMYlEwVnJ6MWJMNWpyb0drRlNMbnltdVJX?=
 =?utf-8?B?N1RqaGlNZmxrM2xjd1JINXA0ZStCeVpHdk41aURGVW5GMTBRMHJxMjNOY0Ez?=
 =?utf-8?B?OFQwS2lIelpESkVEYWI1blM4YktXY25sSkxyVmxyb0lzWE5VbllpWHVrTnNh?=
 =?utf-8?B?bkg4UCtzU3NmQzc0bFNwQ2M3enFaQ3dCY0tYNWJpVzJ5R2RaTmR2ZDcwekZ1?=
 =?utf-8?B?OTF1T3ZZcUxpSlJpMlNDY1dMeGZ4VGFOSXQvRlNyLzZXNkRNajNrUmxzUGMz?=
 =?utf-8?B?K2V0bmJtbXorMzZhN2lxVldCTEFGR3pubjJuMlVrd2EwbG54dzlrOFBVMDNE?=
 =?utf-8?B?SkFPaUVTTkorVGF1dzVlK1Vpekg3YjIzeHVrdGFMZStXQ0kvNXM0SXhjZmtX?=
 =?utf-8?B?V1drNnpOREdFZ1JPcU4weXhwbnBuVlNoM25KZ084aHpTM1RCcDRLVEJGb0dS?=
 =?utf-8?B?b0kvS0NpemhsdktINlVyWUlvSFBoMzNIc3h2cWp2bWpkZUNwU0puajR5SWxE?=
 =?utf-8?B?UEN5dkQ3d21Eb3liUmNqUWQzbll6WENNTW9Pbzk2YmFqTXV4UE9GVWxqZmp3?=
 =?utf-8?B?WWdzNmhlY3ZaeVJSKzVSMkxEQkNZSHNPZkZsS1luVFJtWUd3cmpRWXI0ZGpo?=
 =?utf-8?B?anRuNFhjbzJGMGhzcXI1UUEvM3NKMTVBc0czZ0U4RWFtbmN1RndyRGp6TWxa?=
 =?utf-8?B?TFU2Q0E4TGpUbmc0ZG54cFI3UXhFVlhJc2xmd1VmSFFqOU9TeFpzZS9vMFJq?=
 =?utf-8?B?cnBWbzVBYTRBS001WjFXa1FCWkJTQzRZZ21HVUtXV0xrdWRmSlpKYlVtbTVl?=
 =?utf-8?B?TTE1SzBXY3ZwcmVLcDh4UCt2eTBBdnUxL3lvaDRncXhGdUdkNDU0MHlMWU5P?=
 =?utf-8?B?L0xrTWcwL0luWlR2R2RnUStmeXVBSXptbXZST2huS0hJdlppRHJ5N2NPVU1Z?=
 =?utf-8?B?SVFhWjlJc0VLdVZHZ3FoWVliVHhsRXlLNStHbzVvTlZpUjczaFJ4S21nWHdG?=
 =?utf-8?B?cFBMVjdDSk5lUjlxSE0rRHVaZWZXNlR5K1JhQlp3N21sMkd6UTUzbDFCaXB6?=
 =?utf-8?B?bHBWK2thUXNXdUtvay81RDFiTTRVZDlFMXhiMHpJeC96RDRUdE16cTd0VFVn?=
 =?utf-8?B?dkdHZjZPcmFPODRsa3g4VGFJZ0FmcHRkeVgxRVgzY2JmbTlBZUF4eTBzNUxa?=
 =?utf-8?B?QTlBcEhVYXlwRjBCai9sMXN3M09aQlJYbUJ2eExCQU5BbHpBN0RReDZKU0oy?=
 =?utf-8?B?dHlmaTJXTkNaaExsTGpPV1ozcjI4ZlpsUjZYTitOaUlMTWNzYUs2cHlVbXJl?=
 =?utf-8?B?Z2VVazhJOGVDTzVBQmcydW5UM2c2S2R0RXNyN0RaaW5VY3IyUVppbWVPdUY3?=
 =?utf-8?B?QnBpeWp0RFpJdW41RzVDaW5TcExRUHhoVEgyQ2h3R1pFUnFqR0xxeDBVcWxQ?=
 =?utf-8?B?M1Q3NnJNclhuQXFZYmtTaDJhN1NTMVU0ZXh3VFdydTJZOE1lWndBWXcyL3VN?=
 =?utf-8?B?VUk5Q3JGQ3NxanVkb0RlVzdNc0wvRzNOWm1EOHQyL0ZTMU5hci8rWnZqTFg0?=
 =?utf-8?B?WkZXMk14Njg5bkRDYVRnd2VFcVNmeE5tODhoV0xsN0E1V0hVYnZxbW5OL0JV?=
 =?utf-8?B?RDhTeUZCUCtOeGdvekFDOCtLN0dwb3hNeHIwenN6MFpzZ0NqOFpMVVp6eFFE?=
 =?utf-8?B?UVdITEYya29IVzBLS2hiUGU2dkpzN2FVbUZTOVFLblRvL3JEcTUrZmdlN2dv?=
 =?utf-8?B?VndCcmVRL0dWd0RpVTFjN09BSUNMTmdUOER0TDlYWFBHcmtkbDF0d2wwSDZY?=
 =?utf-8?B?L1FlYi9NclVKOGlQNS9Vc0FweHg3WUNVWnB2bGRQYkE5bzladHRGYytyY0Qx?=
 =?utf-8?B?SUZCQVlnekxLZXBSb1lSZ2l1YTlQd2VaWitDdGJzWC9LWWpxdkxMWlBlTXJy?=
 =?utf-8?B?VHlvellYblliVnp6SkRJaDQ0dTVOdkhRQjdKQVZXYmVzV0huUEFYTUlZS2kz?=
 =?utf-8?Q?wDIt+ToSjAZwyEq0=3D?=
X-Exchange-RoutingPolicyChecked: 3KeF6dFqUEtg/Zd8pOXGeDDdGQxgjweqxA0EIbyIcofY+CFBMXsDgtiXdDzdITvXJoE2rhCAkKG4onCEiV5+w8WGdDIpJ3r2d+bz83jIR92W6ommnvO62BWqjwuEF8QG7+UJinONqybLvEr1njulrERUsYbHeEBKM6iOUOwUAlRHa1yzTUix7m/HTGyhwZ4ro69AoW0h3MgdG1NuZHpID3j1+KFFkvm9aINK45cWLf+oawfEzcB45lq42Mv1j5Va1Piz2/AHp6siFW1Ya0H6MOwoAGK44ixaKN6ZuwCXJTRdF7jNYAeQ0uJD6cSyIb126EG50carmj1apWIknLe1IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0533393-9e46-4237-fc9e-08df04ef1012
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:28:12.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afzia32vaHWLcD6FyRjYz5kJvnllMk9HPM2m07DnCyumE7uGdp0yaC+sMTHoYlZusfGEXtFPWB6a78G7zHKsSqjoLNN+v9HnjjGz2yT6ZMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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



On 8/28/2026 11:58 AM, Arvind Yadav wrote:
> Route the GuC engine reset-request failure through the structured SIGID
> logging helper.
> 
> Use the GT component for the engine reset-request failure, which maps to
> XE_SIGID_GT_TDR, and pass -EIO as the errno value.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> v4:
> - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
>   only the errno value. (Sashiko)
> 
> v3:
> - Split the GuC reset-request failure conversion into a separate patch.
>   (Michal)
> - Dropped GuC job-timeout warning conversions to avoid changing warn-level
>   logs into error-level SIGID reports. (Michal)
> - Kept only the existing error path that maps naturally to GT_TDR. (Michal)
> 
> v2:
>  - Rebased on the latest structured SIGID logging series.
>  - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>    helpers.
>  - Dropped paths already covered by the base SIGID series.
> 
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..c1d469624215 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> @@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",

nit: can we drop "request" word from the message?
it was not our request that we can refer

> -		  guc_class, instance, reason);
> +	xe_log_err(gt, GT, -EIO,

I'm still not sure that we should use GT component here
better to define GUCSUBMIT with GT_TDR as its SIGID

note that while SIGID documentation says we should avoid adding
new SIGIDs without good reason, we are free to add new components,
which are separate concept to SIGID, and initial component list
included in the SIGID introduction series was only "initial" to
show basic SIGID usages - there might be several components that
use the same SIGID - see GUC/HUC as most obvious examples

> +		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
> +		   guc_class, instance, reason);

with GUCSUBMIT component above message could look like:

 ... SIGID=106 (-EIO) Tile0: GT0: GUCSUBMIT: engine reset ...

vs

 ... SIGID=106 (-EIO) Tile0: GT0: GT: GuC engine reset ...

>  
>  	xe_gt_reset_async(gt);
>  

