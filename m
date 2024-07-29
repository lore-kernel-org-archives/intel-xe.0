Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C53C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 12:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235510E3BE;
	Mon, 29 Jul 2024 12:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acAKEODV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71E910E3BD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722256889; x=1753792889;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KE6I3J6Qc2kYflfKZC1Mw4imj506HpPgUS5SOfb0nn0=;
 b=acAKEODVapGQlV0cQUacWdK1Xr/CSZjWdnnc0tbAWvftWBKXKVy+GJRp
 1zGOcSA7WuU/iqS2ENG9OQ9erShFcI6X7z9ZYm8q7zJ03I5VnPJzQBCLQ
 QQ0NNYCPYBjPBKdfOwKKQgeBD/kGYFSYsBwHhgLkLXMoGTb03nxzfU1ts
 oDGupexBLd/Kp/Ag2+DToPZEqQvBYPXB2pLM4QGnlw2ZEl8/5iIFQ3kGP
 FoiNMeeESjOSgfdx01xBO6UF+V3sVuhytpLMGE230l1SEhZh9/MRnd1Jr
 H4wB0t5z+wO9VwbKhj0ZK4apPkJyPoEAbBhZ1cbGVpoyNfaEWuBtCxDIf w==;
X-CSE-ConnectionGUID: xPYbHC+8TrSQcP4ot9rqJw==
X-CSE-MsgGUID: i5wwhMMbSEOuO1dRtOb9iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12768785"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="12768785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:41:28 -0700
X-CSE-ConnectionGUID: qXZfr+xTQVSvpWB97Y7J6A==
X-CSE-MsgGUID: rSzpFUYLTDSPIZibCkHOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53919926"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 05:41:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 05:41:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 05:41:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 05:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1YOr6AJ8EYuojOCpy6KxWUkL6kRQzITRNkDTZAPnwR2flXqQfCU0R635jdBZIc2nEsUjP5B4EoHnGchCdzKTLruZs9Pz3+aWe2TViyne7oJ14xdap835KTfFy2ZpZleLA8T/yJoX6/tkTQP5JZEAfUu1eBBxCpuMG9qXhZ3dHmluKKYrqdb9NXXemUqRxRMJB8dk5FMGwvRLLY+bARUTAHt/qln9sC0hdsbBDoghha6lYrM7fv7Nm8Ctcp3uV1jymr6yKqPnCvAcZmd9CBEaP7IatAZiCYxGjYWnQomOtcItnE7cc3kf+BI1CcFaiSAkJlLh5kgXLnQ7MNvo2mxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q41EONg58xRVhuQoHrzzw2p5jeg+5MCCW/dBZcHEeSw=;
 b=xfqXJ/7Mw9YHTVPC76bTm5hQ5jqKtoKgukJ5Rlhz7RQ4hoBzKsC4XFLu762NUbNHR+grOzkMfWOIOWST2tzGNu79l9ypL8UpE5HA4O6Fc3W9to4xKem/0TDDVE2aE3yNsmPCQchrw/vhLQwjj0sX2P2HdzbZ/jg9FWXOS12xTtl1D9rrDT7W/umGjVcKL9zz5mGU8gfrRaNW/6vPKRIh2zasx7+Y9yI+Yo0BLgkD9QNGi1kYHlvGSOTdXKoq79OF5lILKOnnkZ9JWbXYvJ7MceJozwbf9hLStAcBQLfmAT6HuHPwwcLwSbP26CaPbtKapgKcMemLk3PRygx/H0fQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 12:41:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 12:41:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240729121526.448199-1-osharabi@habana.ai>
References: <20240729121526.448199-1-osharabi@habana.ai>
Subject: Re: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <obitton@habana.ai>, <kelbaz@habana.ai>, Ohad Sharabi <osharabi@habana.ai>
To: Ohad Sharabi <osharabi@habana.ai>, <intel-xe@lists.freedesktop.org>
Date: Mon, 29 Jul 2024 09:41:13 -0300
Message-ID: <172225687360.1863.15263627535988524380@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW3PR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:303:2a::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0878d5-e32b-4e8e-31ed-08dcafcbbddf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3RoSzBSamF5Zmlaa2c3Sm5ldmcrMDh3eHY0LzFnU2tzYXAwemZCUzduclZB?=
 =?utf-8?B?TldqbHNoTnpvdkVYUktpQTgzME41Q01DdjdTekVUQUJsMzN0ekZTNGpacGFn?=
 =?utf-8?B?UEt0VjJaZmJMV2E5ZkRsMTdOdWo2OXhrME5XNStxbmRYQmhaY0RiL3F6L01X?=
 =?utf-8?B?aFlBL1NIQmpmcjl0elI1ZnBFVUZMaWdEY1A3czU0RE5HL1ZmRmRqZWtGdXVE?=
 =?utf-8?B?aGxTRHVMakZYMXNYREM0WHh1eFczZFBhSkNuQVQxSjVKVllrSVhtRWY3dXFp?=
 =?utf-8?B?aFpuWnNpTTgxVnJ5SzFmdklpUWRJVzdodHlGZXB6YmxuZ3RESVpQZ0d6VXhk?=
 =?utf-8?B?Q3M4amtZR3YyL2VINFQ1WnVVWkpEU0l0SSt1YWxiRkI5QngvK3dMWm10em5x?=
 =?utf-8?B?MzhXZnpaeWZST09YRXVtOTVVL2IvQThVYXhHMGYvbE82RCtNbU5nWXhnbzc0?=
 =?utf-8?B?NitJRGRXMUM5Tmd0dUhGWUN4UG5odUVudmlVUmtuN1lQZ2Ric0pCZVB5WEV5?=
 =?utf-8?B?bnZnNmVldHVpZjZNQmNZRU03Smg3VDY3c09jQXU1czZIWk1DNXZwY1FZL254?=
 =?utf-8?B?NFY2ZzZGZllaUC9YMzNUb1gzK3VOY0VMM2k2cDdWekdUVjlMbS9ubDhYUTRt?=
 =?utf-8?B?S2d4Q01iOUpqcUtLSVNBMC9meURJTU1VSkkrZTRRdGU2U0ExZmlKMnpUdmZo?=
 =?utf-8?B?K1FqV0NhUTByUnFqeE4zS1grN0VrdUwvZW1oUnMzd3lzd3RHalcvUE85eEJr?=
 =?utf-8?B?SlVsdXZKUVlXUlRkQWRpbnB3amx6RXV5YVdBZDNhNmdUR0loWVd4RG40L3RP?=
 =?utf-8?B?b3lhbENka1duUkJSZm1QRzFjSjRoWTl6eEY3bzk4aDRBRlVBRHlqWEVmVTJY?=
 =?utf-8?B?QnZPSS9jdUo4QXRQVi9SeVRrRlZ6aDBwcmtKSUpjWUIreGhQMFJhZ2NWUU43?=
 =?utf-8?B?cjEyTGlkSnF1QzAveHdGdDlWQTkxQmduUEZsaE9TaUx3SnRzMGFxN0srS1Ax?=
 =?utf-8?B?NFlLVTlWd0tJQ1FxY2RpbzE4OUNraEVMQ1V3a3lPdjl6VmxrQm1HbVdrbXhB?=
 =?utf-8?B?QmxOVEJSa1gwVFNrWWZWVkhyV09aNFMzejk5VkN6VlJQdS9od3VQeHlaaUdL?=
 =?utf-8?B?elhnS2lsRFRYYUNIaDBqTjdNd29pRXF0U3BMeWJzT1E3Y1JYbDZHaG83Nlda?=
 =?utf-8?B?MFkyeWRDdVBtQUVvc3VCTXVpZHBIcHhtSUZ3NHRqMXB6UkN5cEdwdEJlNHVa?=
 =?utf-8?B?c0hybkpleGJha1VzYUNyaWdFQzdibHNUUWREYS9GSE5jRVVWb1RUbXp5Zldn?=
 =?utf-8?B?aGdhNnlmeElyY0ZpSElDdlR4OVpWRWdNa1QzaUsyZ3BlKzJCYy9aSGVmejZ2?=
 =?utf-8?B?cGVEQkR5SlJIMmhzUXg3KzVoUU03aVpVYmFHTlZnQUdUUTRpVk1RS0lsTDdh?=
 =?utf-8?B?bXo3SXpST21TZ09qRzlOaWNuRXgwUHZFdjZVQUxwN1p5VlV1L1BJb0RINExr?=
 =?utf-8?B?M0tUMDhKS0E3QWsvZmUzUS9RQ2ZnaFJ1MWlrTjlkU281WU83RkFSUzJSUElR?=
 =?utf-8?B?Y3NZUXdnejVpSE9VbHhYdlVidHpRSElqR0E3YU1nNXNvMm5CbFRFSk1peDJV?=
 =?utf-8?B?TWZhTElSeUExWSsydHNJSFltNmpIc1Qzc2d3R3F2WEF1d0tSV3lCSWlxcE4v?=
 =?utf-8?B?U3loMy96dzZRMlB2QlFERHdSYXdhSllwUWU5emJLWi95ZDk1UUxaQTR4OVZo?=
 =?utf-8?B?eHI4c2Z1MmFXSEkwRFdaUmJIaXpoSnY1Z0VVZytoaWZmMjd6SmMvdTArYS9H?=
 =?utf-8?B?ZnMxOFRzSzY2Z3ZyT0c2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdaRzhnT0N3bStpZlcwZE9aM2VqeDlDd0t2MGNxWUNNL0hJZjFTaElUcGp5?=
 =?utf-8?B?dTVzamdXeTEydlJ2QTlVYkxhWVFuSGxnYWdXclNtYmsvWFhMbmMzZkIybEln?=
 =?utf-8?B?N3FXRC9NcjlYVGllUVpOR1VDM2swMG14UUNrS0VIaElIL1BTbUtLNmVyVFNu?=
 =?utf-8?B?RGJFZFM5MmpIOUJNNGhKTXdBMUxTUVFIRXRmQW92bTNMYVU1TlBSSXhCbzgx?=
 =?utf-8?B?Z1k5R3RHdVNDUVFRdmtBR3NyczkwK2tiVjhMYktIcHBWU1hMM0hBUXRZUEdr?=
 =?utf-8?B?TFovdFNVNG9JSGVLVEVWRk0yUCtOYll3QTRyY1FDRWluUHg1ZVpCbnRxbzdm?=
 =?utf-8?B?b2xNZDJwRTI3YS9IVzg1L0luTkVlVTNVemYrTmwraVRGbTVBSzV6UHV4WUpX?=
 =?utf-8?B?MzhLUUoyMGRDTWR4eGlrYjhyMUFrNGRSTzA1NnRKMWpack1UdnB3QzRJVzRE?=
 =?utf-8?B?c2tWa3pNUTVDR0FrS3lLbjZGTmx3MVExTEVqTkZZNEI2LzBDWWcrbjkrVTBR?=
 =?utf-8?B?cjRONzNhSmxNZ0NZYXAzd2hKWG95dVd4dEl2OHlpNHpObTM1Z2NiaU5HT1hL?=
 =?utf-8?B?L3dMaGhmVGh3NUVUcDNLS2FBclY2TFQ4UXR2clFLSlhEMURGeERDQkRuZG5L?=
 =?utf-8?B?RjY4SDJVZEtvZjllc2xIOGo4d3BaTmN3dTRETGpVTFFvbThCTU1pZXRyWitV?=
 =?utf-8?B?L0U2TjN3cGRxeFJQeFVRdzRoeGxiS0ZyN0RLOTdZZ0pBcnFNaWMwWWlTQU40?=
 =?utf-8?B?REdjVUIvM3hsMVNpM21ac1FoRTFvMDNOZ2hyK0s5bUdCbENQRWlhSGtuSTJv?=
 =?utf-8?B?T1djbkFXUHlSNHZna25qUW9QbENFMTFyeGdnUDRMODIvOEp6ODVPNEUyNkcz?=
 =?utf-8?B?Njg3a2lOWG1kR1ZXL3BNZG9WQVB6RzM0QWlvWTFoQjJSMi9ydVdIa0Uvaita?=
 =?utf-8?B?aVZSQy9QWWk0MTY3MndORjFiMDFMQjNUcHYwWUMrYlNXa1VXRUNSSDZwSGIr?=
 =?utf-8?B?cHNrTTFYSW5PSWRXdk9IL0dWSmo0MzBXbDZEZnBlVlZxTytxVGxPU2taRVRS?=
 =?utf-8?B?dGVPS3c4NnFZMjdycTIraXRQVUxZQnUya2FUSnNSMVhBd2dRaVBTcW5ObDZB?=
 =?utf-8?B?Yms3UzZLUHpFYzhHV3lSVE54Zkd5blJ0Z0NkeEdmRTZqb250WDBCaFJqTlFL?=
 =?utf-8?B?SzBveGRQSDRHWW4xN29UVzdmTEI0c2pUVm9xUnpoQWRERlVUWHVuUHpBZVR2?=
 =?utf-8?B?UmlsazRBc0VTYndCSi9zL1ZVTUR1blN3NmxaU2pScHFVems5alU3VUNOaVoz?=
 =?utf-8?B?ZFFxc1F6K1dxNVJLcmY3ZzE4eFpKRDh6MjYzRmdUOWdwQnFnQnJGRVdETktj?=
 =?utf-8?B?TVFFOFhvMzNiM1UyS1ZRMWNydTlyRTFnZ3RXUG9oQWx4dHdVd0ZZK0JWdFN5?=
 =?utf-8?B?QlpKZFIzVlFCUi9SdEI5bWk4TFAxdmtleFVIRUFSdURYaWVnd29iYzI0c0NK?=
 =?utf-8?B?elVLVWpOUUkzUVhSUU5nY3ljWCtBZnpXSDZkaXZ1SzZPMDJoNzZZNnFjeVFD?=
 =?utf-8?B?ajRObWo2UUdBWnI1S2JTa0tmY3ovYUlsYVExSkl1My9wOG1DVUVVS0hWUFJ4?=
 =?utf-8?B?V1oxQ0Mzdm5FZGMwcFp0NmJacmptQ3lEN0ZFV0h5c3NGTEhnTS9vZVErQUNz?=
 =?utf-8?B?ekEyc2pZYlh5dmVIVTUxRHZmNW9vV3FIVU93UEVkeDhFakxEYU13bWxQL01W?=
 =?utf-8?B?WXZQUVNpT214QnU1WWptN2JnZXMrekdHcTJkd1N5T056N0U3alFTU3VyeDNE?=
 =?utf-8?B?WGJ2am9UelpuVlpGTjdJcEMreVlFdjRsVmRHYW9uYmlra3U2Q3lHdmxha0Vj?=
 =?utf-8?B?ZXVPYjJKNlRvQXZrUzRndHgzNjU5OXpHcmpNdm0rRldrNXdqd0RvRVhxMHVp?=
 =?utf-8?B?RjB5bkhUT0hEcFZmK3d4UDZ4RWVZZmE2WnpuVW1jWnN3TzdjVnlTQ1hPV0dH?=
 =?utf-8?B?U1MyUnBmckk2RnVtUCtJRUMybHNZcjNNNk00ZUlCRnBFM3lJVWFKcy9JMS9X?=
 =?utf-8?B?aGx1Y1dxVjBNa2ROcC9QbnI4cXFLVmR3N0Z3WUQwNGdhbk9YM2RIWTdRL0pq?=
 =?utf-8?B?a0FTR1Y5WjNoNWRac1VNYThlWitzcXJQYW9CRVkySFVoTGx3dVRGbTBXeGZs?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0878d5-e32b-4e8e-31ed-08dcafcbbddf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 12:41:18.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/EVAF5WCdt2oTUHL+oz7eCPRwPbMwfJH9BX1zJXxVu7Pht5NC+LyUkglnSOPr6jSaaZph/TE+psJetLqkWIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

Quoting Ohad Sharabi (2024-07-29 09:15:26-03:00)
>The config query has entries per config type.
>
>In query_config(), an array is allocated using the last element of
>the query config to dictate the array length.
>
>Instead, a more robust approach would be to use the standard "number of
>elements" last element of an enum such that one wouldn't need to modify
>the ioctl each time another entry is added.
>
>v2:
> - modify `enum drm_xe_query_config_type` doc
>
>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_query.c |  2 +-
> include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
> 2 files changed, 38 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 73ef6e4c2dc9..aaa60ff764ee 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>=20
> static int query_config(struct xe_device *xe, struct drm_xe_device_query =
*query)
> {
>-        const u32 num_params =3D DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIOR=
ITY + 1;
>+        const u32 num_params =3D DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
>         size_t size =3D
>                 sizeof(struct drm_xe_query_config) + num_params * sizeof(=
u64);
>         struct drm_xe_query_config __user *query_ptr =3D
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 29425d7fdc77..9222563cddc3 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
>         struct drm_xe_mem_region mem_regions[];
> };
>=20
>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>+
>+/**
>+ * enum drm_xe_query_config_type - Indices for the supported configs retu=
rned
>+ * in &drm_xe_query_config.info array
>+ */
>+enum drm_xe_query_config_type {
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bi=
ts)
>+         * and the device revision (next 8 bits).
>+         */
>+        DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>+         * configuration, see list below.
>+         *
>+         *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the d=
evice
>+         *      has usable VRAM
>+         */
>+        DRM_XE_QUERY_CONFIG_FLAGS,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>+         * required by this device, typically SZ_4K or SZ_64K.
>+         */
>+        DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>+        /** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual addre=
ss. */
>+        DRM_XE_QUERY_CONFIG_VA_BITS,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the hig=
hest
>+         * available exec queue priority.
>+         */
>+        DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>+        /** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of con=
figs */
>+        DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
>+};
>+
> /**
>  * struct drm_xe_query_config - describe the device configuration
>  *
>@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>  * struct drm_xe_query_config in .data.
>  *
>- * The index in @info can be:
>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
>- *    and the device revision (next 8 bits)
>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>- *    configuration, see list below
>- *
>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>- *      has usable VRAM
>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>- *    required by this device, typically SZ_4K or SZ_64K
>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>- *    available exec queue priority
>+ * The index in @info are the entries in `enum drm_xe_query_config`
>  */
> struct drm_xe_query_config {
>         /** @num_params: number of parameters returned in info */
>         __u32 num_params;
>-
>         /** @pad: MBZ */
>         __u32 pad;
>-
>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID        0
>-#define DRM_XE_QUERY_CONFIG_FLAGS                        1
>-        #define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT                2
>-#define DRM_XE_QUERY_CONFIG_VA_BITS                        3
>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY        4
>         /** @info: array of elements containing the config info */
>         __u64 info[];
> };
>--=20
>2.34.1
>
