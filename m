Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40829C02198
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 00:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86C10E9C6;
	Fri,  7 Feb 2025 00:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5WlfESk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580710E9C6
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 00:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738887706; x=1770423706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kx/pJAuI1n3fW0AmSpeCOPYkOyryqqlCLHMuvzh0YII=;
 b=d5WlfESkYKqcPFdx20cmv/6z5X563epHZZva5IS8oFDHOME2K2agxjTk
 7pigmFxxjw5TqGF6LYVkhBeyLUiMA9tWWsPui/rtoYFSgses9g7JqwS7V
 cZeDEn9jfsfUpCFBUTZpM1gIxBsKDjJgSKapRBo52xXFG4o01NQVj7Miv
 9p2xmYcNDsDpYxcYOB4vmvLTlvIq1ZrV099eda7+y9NSENb5n5GYyljFy
 EUMeITLBNJVMi3WdUrIB6rbcBmtwxvXioyWR4CnsPoMSJQvQaxj/YLXiu
 5wSOdxhWk6K6hD4StejB/RnJ8GbWFYIuV3yl5dfJWiCDThGG0lWkMPZzQ A==;
X-CSE-ConnectionGUID: o87BIi/5SOC04oekmhexSw==
X-CSE-MsgGUID: Amx21EQFR+2cuU08MQw+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38751203"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="38751203"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 16:21:45 -0800
X-CSE-ConnectionGUID: 7tbN6Uf3RE2GXJar9r742Q==
X-CSE-MsgGUID: cjL3q6kJRRqaEEcDhrHroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111297453"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 16:21:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 16:21:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 16:21:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 16:21:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyFKKPBMvxz7t4dly8dOuDD46eNTQX33Jot5xqs8Z8Qk2f0KrXSijDGrophC62xq6cw9oaQmuOmTcMxpG0f34KT3+uhw4TDsry2w+9qJYRxClvJV5VvFt0t3MujYCwkjK4oKzsvr94AvKVFIKZPPepIA/W0/SLoB6gxR5szBVVY1mxe4xGZwddH080K/HW37H8TU5CDUOPtpcziA6sqQ7S6MifkEE78KL6P4/afeYw4DNnc4DyPt0tQxOubOJhGLkMTevLyH2F5mZdDYwg6v5MC6mK/fLbI9Yumz46YH11RHDOFFjSqbfk6w1LfC27rWN51s12I7rdO3qqx28gEQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzyWGQ+/nB1sQaEiVB1I14fvM1Dn5Kw3Kq8CAKGue9o=;
 b=XuCcZfe/nKHUQ5TNFklRVebLBALBTdVWYo413AU8xg27UlPH39vf8s4SqdZ8JVLXEpbHuT2Alf5vg1RG4NljV3rrxGvnQsic8GZttgEZIU8dabXzreT4gbENrLtHbrWRlgDQ+RTGB0VygE14jQ8KLyIphhhVdrxe+tVakX98sHi6XICNS4YSFClUlvDLxroXWKys2PhaB5ek0u3hKqdXHK0wpVWzS2JpFCPty5sPjEuJvYRA30elWW40deQfQCbHoJ9s5vYs88Vz1jooZ96D3OiRJfISjhoYm+VjI8EkOHF1YnxG6QH9Z8Ud+6VXSGOwWztofbJ8Ne+EnwX7flpmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 00:21:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 00:21:28 +0000
Message-ID: <ca37bf12-1810-492b-bb38-bd41cafe686e@intel.com>
Date: Thu, 6 Feb 2025 16:21:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/xe: Cleanup unwind of gt initialization
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-8-lucas.demarchi@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250206232333.2660325-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ca49d8-8582-4e14-dab9-08dd470d5d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0I4Umlrd2d3TmFSZEQvNGYweVRkTDY2aTEwY2h3dTRBN0Zycmozc0J5MFEz?=
 =?utf-8?B?djJRMHhYNC9CZXc3NzNVOFpwdTZaMENHajNmbzdqNXM4MXJpVHNJaDFhbDVn?=
 =?utf-8?B?VHpEdTRaYkUxdlJhRG4vMThVRTJNZmpLMkFJQUdLMlRCUThxRmpqZTdaQXpi?=
 =?utf-8?B?SHN5RXpYNTZkVVAwb01VZ1pEOEc1RDFoQjZMT0dOaUhFbzhScUlSOUxjLzlS?=
 =?utf-8?B?Y3VNOHlia0t5dDljK1F3M0t0QXY3UW5VVzJNV0NtVGg5cVQ5QkhQMk9DSklE?=
 =?utf-8?B?KzQvU2FMYjR1TmpkcGJXRnhCc0VEM1NmRFdqTzJuNWZCM3Y4ZEliRDJZZVA2?=
 =?utf-8?B?Tkgyak42QitHOVBhTWdwVnhCa29iL1hhQldsTWZ6QmZoaFVJSkx3bVo1VE16?=
 =?utf-8?B?ZWdqRSs2QktINE5EN0RBc1BEUm1YbzhMeG84NzdxNW50V3FmQTBsdjgrZnZT?=
 =?utf-8?B?VytuWFlQdUs1alVJcTQvWU8zVTFhY0JnOW9FN09WSU5FV0NXbUpqZG9aSjdm?=
 =?utf-8?B?Zm9CZTBaL3pQNHdSVTdnWGQ3QTVSYnl6YjNKSnNPWEkrSHU4V1JuWVVXZlFv?=
 =?utf-8?B?QnNhL0QzWDBNUnpHa2xaNUl6Z0REbWpYemp1OTl0S1ZIZVB2QUJvbG9rcWto?=
 =?utf-8?B?SlM5UERBUEdYSGs0aUlFelVGSDlmOCszRjBTZ290RHJERWErYzgzUEtzUFdN?=
 =?utf-8?B?RDhvN096K1JGeXo1M3E3TUszWU9wRWRmamJ1UFJqQ0tXb1hWaWNtTEFERDNa?=
 =?utf-8?B?OWJLQUZiR3pMSW9JcEpZMVF3cElXVGRLSVljVEhYdmJuV2VsNzNTc3ZLZjRE?=
 =?utf-8?B?MHVybDh5aDJKdzNna3hYSGFXcHhYT01tUHI5MUdwdzhqSm1neXdiYlFnQVNM?=
 =?utf-8?B?akxYTHV2akt1SEx1M1BKei82UnFobTNIbG1GZWFWZU9VSlkvazdScmd3dmVT?=
 =?utf-8?B?V0ZSb1VTQzVJZXBHZ2tMTG1ScytDZHRoTXJZRUswakpCaDFWaklINnlZaTJy?=
 =?utf-8?B?UjZYSnh5YUl1MDhiVDg2WWhVNk1yMzZ6am51d09HSU1iNWhhNTczRzRiamFi?=
 =?utf-8?B?TDlXdmRsUVhma0VyZDBCVEFzRVpOUGhKT0Y1d3B3UU1tNFYrNTgwOGJ2K0d2?=
 =?utf-8?B?N1BLWi9DckdSWk55L1NnS2ZPY0RlTEJ5Q2R6enNTcTllODJhZkUrc3c1SDl3?=
 =?utf-8?B?RUJkYUhzeDVYdEs2dWx0OVFVMCtMVEZNWDdldnhQNUdlblJ6bnA4T0k4dFp0?=
 =?utf-8?B?R3J4VlVRcnlRTTBkQUVYSEkrVkg1aWVZM1gvYnF1Y2FtY1EwK3NpRGR3Y0Qy?=
 =?utf-8?B?aTV3NlkrTUxlZjNxaG96TlFzdUUyZk1WODB5bFJSZGZBczZUMElBUXRoT1lF?=
 =?utf-8?B?WVR3L0hBbWsvdzBmSzZOU2lHSnFsM2pTakhyZGRUaUdQWlZRS3ZXQlZRRzNk?=
 =?utf-8?B?YWZrWDBhd3JOVllqb2lsRjNGcUZOeHU5TmNvdEIwVjcxaElqaGhWWm04Z2hL?=
 =?utf-8?B?OGVmRlVKMTdnV2ZVZXdpN2J2d01TMWVFWXIrbzZNdnlnWjgvNVpXRVhLNXlH?=
 =?utf-8?B?ZURrYVFlVGhDcW9kSGdOTUk3NCtNY2lYYkFlTUovaUZUTkE0VFdHb2ZsWEpM?=
 =?utf-8?B?R1hITk5NL3FKRktuVGRHTHZFajZka2tmTWlTekpXQTNaLzBDeGg5VVd0S2kz?=
 =?utf-8?B?WlliNEV3ajR1enB3RmtxUDdpSHBxUGNwMG9GNTA4NXpCQWhmSEtBMXRJRXF2?=
 =?utf-8?B?TlRlUHB6dE8yWWwzZDIwbm9FS016c0FoRGcrZnp5RG53NWkyV2l6ci9OVHhn?=
 =?utf-8?B?Q2FyTEVCc3VISnNLRzdMa1JjaUNxWElZVHg0SWhBb3FENGtta3RsZmJDODY1?=
 =?utf-8?Q?4KxqGF9nLuTZ7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5QRHlyWmwrOGdpUHNQUENZSFkxMTJDN1NEd1RqQkRpSERXY3VRR3NjNlEx?=
 =?utf-8?B?Zy9KcDlIMnNVc09FNmswOHNDOUJTcnByRHNOUUxDZWhkdWo3dnpORnVpemM0?=
 =?utf-8?B?L1RBZGVZNkZjbWNTUlp6dU1lSUY4aGhKcUpUcmdDa2NSRCtMeEgyTkdMcW9H?=
 =?utf-8?B?Y1lvVGJpQW15V052QTNOQ3NSL2ZQSUpZS2hPbFlhbmhIbHNuS0MrTkExOGJS?=
 =?utf-8?B?S1Ird1JhdlU1eUlMUGVGZW13WFZWQVcwMWRqVEt5NFZzMlRCeWZsZ2ZQaU0x?=
 =?utf-8?B?R1dRQnpCdzhGWmQvUE4wZ3Q2ajNreXFuQkluNHFGanFYc3k4VERLSGJPdm16?=
 =?utf-8?B?NS9OL2tlVUVvZGVGUjF3WndmL2VnUnVQdFoyaUo1Zks0K1hwTmo5QitldXNq?=
 =?utf-8?B?d3dBaUNPcmh6cmF0dkxoVVNmU0hxczUyc21WSjB3Zkl3TFE3Y1lCQXBTamJY?=
 =?utf-8?B?TFJMSC9mTzJCcllKbXFneWl5NUhWNjRXQ1o3dnA0SkZlL2xUR1I0bE1ENUd4?=
 =?utf-8?B?TjBBVFF3ZDNjVS83MjBVYmRYNnF4ME44ME9SdEc0OTBHcTZqSlZkKzBFSnd1?=
 =?utf-8?B?Y04xTXR3UDZPU3lyTHRSeTZrZDZPb2FnaHUzTUYwSlp5dmNpUVNWRC9veTd1?=
 =?utf-8?B?QWZiYnl0WFJwdHF3b01tUWczVFZUUU1qYjU2MjZjV0JaVm1nQVFnRGRVNTVL?=
 =?utf-8?B?T0NUeXNtZ0JZRy9IRkhuQ0NCc09kYjdhTEFDUk1IME85SmhOaEcrTUdpYWRD?=
 =?utf-8?B?UzU5aGpSRHRlTUdYTm1YUjlJclVuUElGRXNxR29RMDBORVVLaElMaGRaVEtE?=
 =?utf-8?B?aGN3ZlJTbGxYSlhDT2NNNEljUTdFRENGNXhFUzJoc2hRUk8rTW8yNUlNd1Zq?=
 =?utf-8?B?U3FvNmpzSG1XcGFZVzFNelpEWThWS3I0MFE3RDF1UjBNMThMNmYzQzVPWCtL?=
 =?utf-8?B?bWFrdHB4OGUzWGF3RGZWSnBkSm9VY3IrdlpqeUZnUlhIOHNVM0xOcERjRjF0?=
 =?utf-8?B?dWsyUXlpZUkwdlBZeWVmYythWCsvUEE0MFkyLzZxYkh6YXloK2lQOXZlMDZn?=
 =?utf-8?B?NTBsODMxOEt4YTgycS9ScGI0dkpPZ0tCclJEMHczSXdLMHNOQldJWXc5ZS82?=
 =?utf-8?B?UkNSV2wwUndWTUFhN0o0S3duaEtRUEJDcnorbHRiL1U4VXV1ZXFkOTlTSVNE?=
 =?utf-8?B?TmMxVEV1QzVPM3cyc3pYQnBqSlYvM1BnNGVYYXVMSDlldFFLL1d2VE9wZWdo?=
 =?utf-8?B?Y1R5Wmo1dU1MNmN6QmZOS252WXRWeDMrRlNEMWlDTzRYYlRCTHFpc2JkbStI?=
 =?utf-8?B?VWJhOTlWeDIwamNXVlN3MjkzTXMrTG5tUmlaZkNCSmdxSFNkSFl3dU9kOFdH?=
 =?utf-8?B?TDVaclIySmFINngwU2wzMjEwMEpKUVppVnl4U2R6SU9PT1BmVjR0N1BITTFR?=
 =?utf-8?B?U0lHWDlJWE9UY3k2ckZ1UVFPOHBvSDVhNXFrRDU3UWtZQ1FCREhWSVdsL3hs?=
 =?utf-8?B?dE80WWhGbml0K2NBRFB0clVIa1V6MGc4Q09zODByWHJLb1VRQXBJQWRoY3JO?=
 =?utf-8?B?Vk5raDBlaDg3dG85NThuY0NOb3k1cWJBeXV0ZGswbHdjTGkwMGpidUNURklZ?=
 =?utf-8?B?N05WOTRBb09sMjNLZlVqOXVxOHk1K0x4dmNTRUhDR09OT0ovMDhSaU1yeGNm?=
 =?utf-8?B?ZUpiM0d1aVlSWklwN2NNMUJMWWlWTUQxUlpUK3ZjR3dxNDFxbEVQd0d6YUR3?=
 =?utf-8?B?RjR4WWFkK1p4dlgvS2x3KzFiM1JTMks5RXNvT242dTdCWE8yaW1BRWFlZXN6?=
 =?utf-8?B?YzNUYVZJUlJCZHJCYm9IZ3dhcXFRbGQvTXI2NXBZS1Zwd1Z5amIwRlo2a04x?=
 =?utf-8?B?cXQrV1l6WTB2RVNtaTNyZ2wvYUlMSmw3U0V1YisvR0VXQ2d1K3VXQll0TzIr?=
 =?utf-8?B?MEJxSll5eVhMMHZ2ckZZb0Z0RVJsV2NudzNSTGNxb2I4dUg3NlUvSFBKUHh6?=
 =?utf-8?B?dXBlRFkzZlQzdEI4VHdBcXZ2b2hRVDdyQll4WmtzcnNrVFV2bmY5UDZ2Rk5v?=
 =?utf-8?B?c1Q1Q2kzV3J2dnNjenJpblA5a0VRU1Q2TkRQUWcvckVRNFdBN2U1MmRHbStT?=
 =?utf-8?B?cXE3SUNJZUJqeDBBSlUxc3UwSG1HNjluWU8yaVV1RldVdFdpbnlkcVkxZUVj?=
 =?utf-8?Q?yf6r2bY1xm2VzL1VH7DSV3o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ca49d8-8582-4e14-dab9-08dd470d5d5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 00:21:28.4848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvND7tsQFy4BqBtl0yg4SdW7OSWI8RgjM1go16hQO62wsuQl/dcNqTTISNK8Ouj3SLJ9lTi53XnOs+fWHh6dEVrOpSyBnMMkEfef89muE9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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



On 2/6/2025 3:23 PM, Lucas De Marchi wrote:
> The only thing in xe_gt_remove() that really needs to happen on the
> device remove callback is the xe_uc_remove(). That's because of the
> following call chain:
>
> 	xe_gt_remove()
> 	  xe_uc_remove()
> 	    xe_gsc_remove()
> 	      xe_gsc_proxy_remove()
>
> Move xe_gsc_proxy_remove() to be handled as a xe_device_remove_action,
> so it's recorded when it should run during device removal. The rest can
> be handled normally by devm infra.
>
> Besides removing the deep call chain above, xe_device_probe() doesn't
> have to unwind the gt loop and it's also more in line with the
> xe_device_probe() style.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c    | 21 +----------
>   drivers/gpu/drm/xe/xe_gsc.c       |  9 -----
>   drivers/gpu/drm/xe/xe_gsc.h       |  1 -
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 63 +++++++++++++++----------------
>   drivers/gpu/drm/xe/xe_gsc_proxy.h |  1 -
>   drivers/gpu/drm/xe/xe_gsc_types.h |  3 ++
>   drivers/gpu/drm/xe/xe_gt.c        | 35 ++++++++---------
>   drivers/gpu/drm/xe/xe_gt.h        |  1 -
>   drivers/gpu/drm/xe/xe_uc.c        | 13 -------
>   drivers/gpu/drm/xe/xe_uc.h        |  1 -
>   10 files changed, 50 insertions(+), 98 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5fc4e696262f9..09288558e4e44 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -744,7 +744,6 @@ int xe_device_probe(struct xe_device *xe)
>   	struct xe_tile *tile;
>   	struct xe_gt *gt;
>   	int err;
> -	u8 last_gt;
>   	u8 id;
>   
>   	xe->probing = true;
> @@ -855,18 +854,16 @@ int xe_device_probe(struct xe_device *xe)
>   		return err;
>   
>   	for_each_gt(gt, xe, id) {
> -		last_gt = id;
> -
>   		err = xe_gt_init(gt);
>   		if (err)
> -			goto err_fini_gt;
> +			return err;
>   	}
>   
>   	xe_heci_gsc_init(xe);

unrelated to this patch, but still tied to probe failures: AFAICS we 
don't call xe_heci_gsc_fini when the probe fails after this point.
I'm not 100% sure, but it doesn't look like this is intentional for 
survivability mode (because that one has its own xe_heci_gsc_init/fini 
calls), so maybe xe_heci_gsc_fini is another candidate for using a 
remove_action callback? I don't think we can leave the child device 
cleanup to a devm call.

>   
>   	err = xe_oa_init(xe);
>   	if (err)
> -		goto err_fini_gt;
> +		return err;
>   
>   	err = xe_display_init(xe);
>   	if (err)
> @@ -905,14 +902,6 @@ int xe_device_probe(struct xe_device *xe)
>   err_fini_oa:
>   	xe_oa_fini(xe);
>   
> -err_fini_gt:
> -	for_each_gt(gt, xe, id) {
> -		if (id < last_gt)
> -			xe_gt_remove(gt);
> -		else
> -			break;
> -	}
> -
>   	return err;
>   }
>   
> @@ -978,9 +967,6 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> -	u8 id;
> -
>   	xe_oa_unregister(xe);
>   
>   	xe_device_remove_display(xe);
> @@ -989,9 +975,6 @@ void xe_device_remove(struct xe_device *xe)
>   
>   	xe_heci_gsc_fini(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_remove(gt);
> -
>   	xe_device_call_remove_actions(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 1eb791ddc375c..fd41113f85725 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -555,15 +555,6 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>   		flush_work(&gsc->work);
>   }
>   
> -/**
> - * xe_gsc_remove() - Clean up the GSC structures before driver removal
> - * @gsc: the GSC uC
> - */
> -void xe_gsc_remove(struct xe_gsc *gsc)
> -{
> -	xe_gsc_proxy_remove(gsc);
> -}
> -
>   /*
>    * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
>    * GSC engine reset by writing a notification bit in the GS1 register and then
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index e282b9ef6ec4d..d99f66c38075c 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -17,7 +17,6 @@ int xe_gsc_init(struct xe_gsc *gsc);
>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>   void xe_gsc_load_start(struct xe_gsc *gsc);
> -void xe_gsc_remove(struct xe_gsc *gsc);
>   void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
>   
>   void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 24cc6a4f9a96a..0da33d5e9b1c0 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -423,6 +423,34 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> +static void xe_gsc_proxy_remove(struct xe_device_remove_action *ra)
> +{
> +	struct xe_gsc *gsc = container_of(ra, struct xe_gsc, proxy.remove_action);
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref = 0;
> +
> +	if (!gsc->proxy.component_added)
> +		return;
> +
> +	/* disable HECI2 IRQs */
> +	xe_pm_runtime_get(xe);
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
> +		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> +
> +	/* try do disable irq even if forcewake failed */
> +	gsc_proxy_irq_toggle(gsc, false);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_gsc_wait_for_worker_completion(gsc);
> +
> +	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> +	gsc->proxy.component_added = false;
> +}
> +
>   /**
>    * xe_gsc_proxy_init() - init objects and MEI component required by GSC proxy
>    * @gsc: the GSC uC
> @@ -461,43 +489,12 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>   	}
>   
>   	gsc->proxy.component_added = true;
> -
> -	/* the component must be removed before unload, so can't use drmm for cleanup */
> +	xe_device_add_remove_action(xe, &gsc->proxy.remove_action,
> +				    xe_gsc_proxy_remove);
>   
>   	return 0;
>   }
>   
> -/**
> - * xe_gsc_proxy_remove() - remove the GSC proxy MEI component
> - * @gsc: the GSC uC
> - */
> -void xe_gsc_proxy_remove(struct xe_gsc *gsc)
> -{
> -	struct xe_gt *gt = gsc_to_gt(gsc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	unsigned int fw_ref = 0;
> -
> -	if (!gsc->proxy.component_added)
> -		return;
> -
> -	/* disable HECI2 IRQs */
> -	xe_pm_runtime_get(xe);
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (!fw_ref)
> -		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> -
> -	/* try do disable irq even if forcewake failed */
> -	gsc_proxy_irq_toggle(gsc, false);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_pm_runtime_put(xe);
> -
> -	xe_gsc_wait_for_worker_completion(gsc);
> -
> -	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> -	gsc->proxy.component_added = false;
> -}
> -
>   /**
>    * xe_gsc_proxy_start() - start the proxy by submitting the first request
>    * @gsc: the GSC uC
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
> index c511ade6b8637..fdef56995cd43 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
> @@ -12,7 +12,6 @@ struct xe_gsc;
>   
>   int xe_gsc_proxy_init(struct xe_gsc *gsc);
>   bool xe_gsc_proxy_init_done(struct xe_gsc *gsc);
> -void xe_gsc_proxy_remove(struct xe_gsc *gsc);
>   int xe_gsc_proxy_start(struct xe_gsc *gsc);
>   
>   int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 5926de20214c8..3649239f19622 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -13,6 +13,7 @@
>   #include <linux/workqueue.h>
>   
>   #include "xe_uc_fw_types.h"
> +#include "xe_device_types.h"
>   
>   struct xe_bo;
>   struct xe_exec_queue;
> @@ -57,6 +58,8 @@ struct xe_gsc {
>   		struct mutex mutex;
>   		/** @proxy.component_added: whether the component has been added */
>   		bool component_added;
> +		/** @proxy.remove_action */

nit: should this have a description?

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		struct xe_device_remove_action remove_action;
>   		/** @proxy.bo: object to store message to and from the GSC */
>   		struct xe_bo *bo;
>   		/** @proxy.to_gsc: map of the memory used to send messages to the GSC */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9fb8f1e678dc8..c33040278e1aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -141,26 +141,6 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
> -/**
> - * xe_gt_remove() - Clean up the GT structures before driver removal
> - * @gt: the GT object
> - *
> - * This function should only act on objects/structures that must be cleaned
> - * before the driver removal callback is complete and therefore can't be
> - * deferred to a drmm action.
> - */
> -void xe_gt_remove(struct xe_gt *gt)
> -{
> -	int i;
> -
> -	xe_uc_remove(&gt->uc);
> -
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> -
> -	xe_gt_disable_host_l2_vram(gt);
> -}
> -
>   static void gt_reset_worker(struct work_struct *w);
>   
>   static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> @@ -583,6 +563,17 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   	return err;
>   }
>   
> +static void xe_gt_fini(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	int i;
> +
> +	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> +		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> +
> +	xe_gt_disable_host_l2_vram(gt);
> +}
> +
>   int xe_gt_init(struct xe_gt *gt)
>   {
>   	int err;
> @@ -595,6 +586,10 @@ int xe_gt_init(struct xe_gt *gt)
>   		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>   	}
>   
> +	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
> +	if (err)
> +		return err;
> +
>   	err = xe_gt_pagefault_init(gt);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index e504cc33ade4f..187fa6490eafc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -54,7 +54,6 @@ int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   int xe_gt_sanitize_freq(struct xe_gt *gt);
> -void xe_gt_remove(struct xe_gt *gt);
>   
>   /**
>    * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0d073a9987c2e..d8167e818280b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,19 +288,6 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> -/**
> - * xe_uc_remove() - Clean up the UC structures before driver removal
> - * @uc: the UC object
> - *
> - * This function should only act on objects/structures that must be cleaned
> - * before the driver removal callback is complete and therefore can't be
> - * deferred to a drmm action.
> - */
> -void xe_uc_remove(struct xe_uc *uc)
> -{
> -	xe_gsc_remove(&uc->gsc);
> -}
> -
>   /**
>    * xe_uc_declare_wedged() - Declare UC wedged
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 506517c113339..3813c1ede450e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -20,7 +20,6 @@ void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);
>   int xe_uc_suspend(struct xe_uc *uc);
>   int xe_uc_sanitize_reset(struct xe_uc *uc);
> -void xe_uc_remove(struct xe_uc *uc);
>   void xe_uc_declare_wedged(struct xe_uc *uc);
>   
>   #endif

