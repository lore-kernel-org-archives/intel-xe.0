Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E1CD2E9F0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 14:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419710E4D8;
	Mon, 11 Nov 2024 14:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvWnY+WF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207210E4D8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731335497; x=1762871497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RPk0dg9ytncjlzpjg0OOAXbOg3rOdzjX8XpOVWyBBk0=;
 b=lvWnY+WFl/yHb0WKAUMtJ+ZAE7Rqwz2PEJ+/RERVOzmp+N3EtVUkOyFp
 0ByE+wbq0XDVKCeEXZkIvbEHT/x3g4bnHkrActGBZCBor26eoo0i2yTyl
 8BhNimXH3ZfkBmsfkCcpitaQ/EYoCJli6Kwud0cPJ+WgIo7uDyGznWWmh
 AmW0Zg0lfQ4p/EYrN0eAiIEXhPRoIlia85DxD0OEwU2KAoC1Rs/VNK1um
 l9VxxhPDhybC9jGYnA3v5/ilfHZWsSejc4klLAD2Jddxr24uqIFWaXE2S
 zZezyzv/gZeses3REnEjpPZZJYDNZmwzqJsWyVQlQ3R4Lvd68US4xKIQ8 Q==;
X-CSE-ConnectionGUID: aZWlk89ZSPCc2uecZ3UYZw==
X-CSE-MsgGUID: eguPXO4lS4CkpC2eHAtyYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42236955"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42236955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:31:36 -0800
X-CSE-ConnectionGUID: aOyTnK/ZRqS5ZWj+RcIq9g==
X-CSE-MsgGUID: xRRzxAbBS3qeXf+eG0lxdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="86511429"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 06:31:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 06:31:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 06:31:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 06:31:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK3g6NuFBG7x04OvBhHM8BalOgAP6rETL1AC+y/kUcpzgKUlBNO4dlf0tV3xnd/OuGBlCAAGPH7kCCHLbmwUxJdnG0mVYt7D83KMRFXNL/q+iOEMRVDQoYaWIO0HiKrx4FRNQeZ8ZU7imT+s0gT4mFxc73s1mtnxpU0urJGZratg4y+awh4krjesMp/88BMz6mlV42wuHJnrvE5qr3xBloyShEXMbRvdIcFoLekNKmMUToMFTWSBRvC0GgmwQTOCuD3OvXGJEMhogIJn0sDkjpbJ5VdwY5FbKdoZRog3QsR4oljoD6eZM6+4x5UXZH2V9hmNGQMUaxMRg6UjNYz8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPk0dg9ytncjlzpjg0OOAXbOg3rOdzjX8XpOVWyBBk0=;
 b=lt4anLPknZPqyi8J8gK2VGCfYsSReTApYPV/eJ6NqjnjrfHDqWNFYEId85tj2gPJSeQpUIFr7SWBK6qhDbYRpwYefNpuYYb5sudp20i+RhzyeuYWyabDMr8kC+hx6UPBgFew6UuTtYAXyY5SvuvuFbAZfPerUa4w6dyfoENuvP2bbYeKaZpHzDqr3cIVAFZKEkzwAXvaxEku6AEg9d8TMSWVC1Fw8AUgVLR+4mAq0q+m3Ltd8VgDnYshoBIYyQ4q1LQ/YiwQwG7ERLFqkT0FcqCwxSULs5OZJBQXaChYJj3wn2lJLiUMrrD4SnCit8sPAlwXy1pawzMEqmHL8c7c1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 14:31:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 14:31:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 0/2] Disallow OA from being enabled on active exec_queue's
Thread-Topic: [PATCH 0/2] Disallow OA from being enabled on active exec_queue's
Thread-Index: AQHbMjLU9o/ClufS5k+2KPgQypaICLKyKGMA
Date: Mon, 11 Nov 2024 14:31:30 +0000
Message-ID: <d0c25af29401371ae71086e48ae509a8c50c3199.camel@intel.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM6PR11MB4691:EE_
x-ms-office365-filtering-correlation-id: 8b0d83a5-0450-492d-ba5a-08dd025d88d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bGdzSkJCaFA1L1FKVDNnUTU2bk1lT3JHZHJ5S0RxczhjbUZkeVU1eVFYOXlH?=
 =?utf-8?B?NzJucWtsM0FMd1RwY1IxdkxJL0FPVVNXU1AzWkE1T2hNVjdUQW9QMUt3YVZK?=
 =?utf-8?B?SWRlUUpvaVdtVDdpRXV5N28vT0RRUm95Y29Nck5Vck4zalQxUEgxQ3E2TGNh?=
 =?utf-8?B?cXhzTTFlMlU5NEFMNVh1S3RLUllPTDJha0pSbndpSGtLVUYrVUFnWGJxNFk3?=
 =?utf-8?B?bGVNZThlWHpSV1FUdFdmdFlqNWszZnlvNlFOd1hKSmJKQzRlckQ2b0J2UnVn?=
 =?utf-8?B?amFnWDVYbXhCZVlQdWE3dlozQkVlckdqa2ZVc3FkWnBzZXdaaFVqcFpiVE5B?=
 =?utf-8?B?Z1lXblFlSjRWNnFjTHJabERJZjNVZXZhS01HSHkraUpvWHFrdmFyYTVzeFpt?=
 =?utf-8?B?azByWFFIUXhEM2ZsaHhsZmVUdVlGb25Jd3pZNTVhWm5ld05rbFJ3QklmWW5m?=
 =?utf-8?B?UGVsaVQ0cVNiT1RubVVRaWVsVWZ3VWpwKzhQQkVKSks5YW90dEF4Q2NKclZv?=
 =?utf-8?B?K3RTbGFNQk1Kclp1K05oR3dUbnBKZkZmSXZjL3BKU2hBMjFySzNHTXRUOVJu?=
 =?utf-8?B?dERML01GZFMxdkR2UkZWczZiR0tVcDJSRWJ1cUxpcWt1a2pINklFUmI2NkRy?=
 =?utf-8?B?YVZJdDhMdit1UmtJK2FhVXRIRUp3N3hBOTlMUFJnc1ArdHcrNC9aVGVrdkxD?=
 =?utf-8?B?TFFLS0V3b25iUjNoTkVYbDZSU2RaVEQwV1pJRW92eDZqdFRFYW1jdmJYZ1l2?=
 =?utf-8?B?S3NqejBvalRiWm1uTEhUNU51VXBOWUIzSEZpdVYyeUVmbzhBNnc3UG9JVE9S?=
 =?utf-8?B?L2RaMmxYRGN0RnZtSEwxV3JZNm5yU245RFFBbWtlM3RzaitwQmpzOHJobHAr?=
 =?utf-8?B?ck95V2dKTE93Zzk2eGVEYmx1cm9kdFlUeUVZK254a3Z5c3h1dkJEM3gyZXZV?=
 =?utf-8?B?ZDZoZHdKL21waGpqVkFMNlRidHM0TkdvbURoQnE3OThqTU1ULzJUQTdVaHE3?=
 =?utf-8?B?MnpLQnZaWGQ3RFhxZHhZQzVSclZVQjVhRi9iSW9PV1JORXRlRW1vRjU2Znp5?=
 =?utf-8?B?azZ2aUlvbWJZa0UwQW9tbnlMWWNUeTdYUFZIRGFCbDFLeCtKZFQ1NjNSN2JV?=
 =?utf-8?B?NDRwWHdzdEJyMFVHdFBIb2s2WFdjZXZ5a3laNmVUVkp3Um5iczRJNGFxd244?=
 =?utf-8?B?Nm12ZVdUZC9XMmozdEpnUlI5Q01yVG9PbW1rS2lPcUxSRTliWnRyM3djaUF0?=
 =?utf-8?B?OEw1bGdwaXVTSHExSEVxbjR1ajZSMHRvY1RJT3NvcytTK3BYNWJDUVNBTkFx?=
 =?utf-8?B?a1prNnpNUlQrZm1aRTBUbS91alVPbk11Q1J1Nzhhbi9UR1ZaMmZVQXk0Q24v?=
 =?utf-8?B?RU5ZY1NMZGVwSGJLa2VsQncwUWp6dkJDeXdqd1VsbS9hRVlEUEpMZ0VoUy95?=
 =?utf-8?B?dFlhOGJBaXh1d0Jpck90ZlFmc282eTF3UjJwRWhjbDdNVXlhY1h0cStTKzNQ?=
 =?utf-8?B?Ui9LMThjL2ZqdUxDbFZWSEFKazFVVFBZWGZjU3hwVzNHRHdvL0JTZ001SVc3?=
 =?utf-8?B?YldQWkduL1RxT01Mdk9rZ2c0V3RCdFh3ZVovVWZvNnhvem1TZU5kRzM2Nmxj?=
 =?utf-8?B?dU5NcytpR2pCRHNxK05uKzZxSU53WjVNMTFBMzZhaGxQaEk3UFYzOFlBTkVm?=
 =?utf-8?B?U3BINndva0p1R082UHlETm5mN2lOeVppREJYRVBaRHQ5eDVwRm84cVhkUEp1?=
 =?utf-8?B?MmhEM3NQTGxtQzFpSG50RkRoenpJK1pyb2RzbkdKYitncGpvSHNwTDhiaC83?=
 =?utf-8?Q?WHmduj8dAePPZQJ4C/gSoFHnucvwoqepeu5L8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3NqUWMzMHBET0t5TitHQngzd3MwVFIwMmJhMHdEQjJGU3JFWWJjenJubUow?=
 =?utf-8?B?dHhBY0xvUGhnaEQvVTAzMkxMaDVjSjJCMVBOUWF2WGx4UFRrNHBXQ3R0S1Er?=
 =?utf-8?B?YmFkSUZ5cGt6WHJXM205UFlhTWpkS21odzZGekpTZmNOMW5jb0VJYWhEOGw1?=
 =?utf-8?B?bTZLTnM1MmlpbnFjcmcwT3FMNmZMZG1ySGpOSUt5UnFQUkRmd2xHZUo1cWc1?=
 =?utf-8?B?SDNMT1dYNHhFL1ExSTgvVnFZeHI2R1ZQYlRRMTVjL1hKQ002RGFBYTBrc1JN?=
 =?utf-8?B?aUg5bE5RaEV5UU1XU2pjajA4VldwZFd3Z0VOVEI5WVJRdUVEWGJ5cGo3K2Nk?=
 =?utf-8?B?UE1WYWtBR3BDeTRSQTg2TDFNV0hwbnJmcnkwQnZua3lJOWRGVnRTU28xQmwx?=
 =?utf-8?B?Tk4yTHlVamxzSEkra1JJUWNBMHBvYzdjNjFuL1l0LzFERkhkeDdObmFuR1FU?=
 =?utf-8?B?amR6eldoa0FCZFltMjNoQmJLcjQ4UnVleTNKaFlZNy9XTlQ3MThNRUQ0VXhH?=
 =?utf-8?B?Q2c0ZHlJbHBNdkFhaU9KT3VRczZiV294U1ZGWUVWcHBwazVrb0cwaEtBUXUv?=
 =?utf-8?B?cEsrNklrWjFreHpIRVU4Sys3OCt1c3p1Y3FJQjVCSE9HWFNXSUorWnJOdE41?=
 =?utf-8?B?bDNMNC9qRmdZdTJYaXUxVEozYUhtQk00R2JEQnE2bGE5VTZmSVI0TWgvdm50?=
 =?utf-8?B?TE1YbnpOMFpuUE5KL2xjT1NXODdrbU5XUERGVVVxbUt0Qkd2Qmt1TkZJTGVS?=
 =?utf-8?B?UXJrZTd3ZXhjNzdjdjBmMUcwV3hHazVNa2F2K2JyQ2dEZTF5b2ZhRk5qVmlS?=
 =?utf-8?B?UldGTm1kekdoMWNDaGU2YkxFcUNDQ2oyUE5Fb0NQbUYyYXVlOGFzQTg2aXRS?=
 =?utf-8?B?ZWJyMXFWWjVyaUxzRGUxRDhtN3NKYWF2MnZ0WlM0aktYVDRnRXdUa252UEtO?=
 =?utf-8?B?ZzlqcVN3cEkyajNNNjI1UGQydVFTYXl5STEwWTlnVTBydVlHNEQ2OTI2ZU4x?=
 =?utf-8?B?RUE0YWJnck9yTHYyMzYxM1Y4ZWZERFpvVzI0RjMvcFprdGx3dGxRdlc1UFV4?=
 =?utf-8?B?d3NaN21FUXB3VU9SOG1PbU1Wc25JL05TTFFiTFI1MzZ5RTlUS3pSQWQ5dVJv?=
 =?utf-8?B?Z1F1S0N5ZFZrUXJTZVV6U3VjUGtXSVg2Y254YWZFY1NVZVdCWk93UzJ3cmxC?=
 =?utf-8?B?WFVZdHJ5QUFFS0FGZWYwQ25OOVY5eGplRmkxUmdQTHRsV2hJVm5RZzRLRFN1?=
 =?utf-8?B?azNsOXoxQ0tKblExS1V3ZUJKcyt5NjcrbGxBeTFQWjB5MWcrNkxheTUxNkYr?=
 =?utf-8?B?WlBVT3AydDNXZGZXMWQwU2xaVzNNcFMzQXVWUDAyeU9HdW1kQ3JqL0kveHNk?=
 =?utf-8?B?OEEyVkZyM29FMnVDRlhxaVRGTCt2Q0lwMWxVYlNDM1N5cHJrM3RQTHhWM0Zj?=
 =?utf-8?B?SmJ0bGdsS3ZnQjFKeVBQNGh6VVdqUmo5K1RNbzNiODNDbS8xUWNZZ1Z3dVN5?=
 =?utf-8?B?SWhKanRwUTkyUlpKaVBLYllJTzFYV0NURDBvQmg2d1VBWk9UNHF2WlA1dmlt?=
 =?utf-8?B?ZTIxTUtoeTdiWlQyS2QrQmYxTDJGNHZ4VW95UUhRTmNWMnFablk4ZEZma3B6?=
 =?utf-8?B?bHJEaVk3ZmtqMXJuVjNERWN4TTkvVHUwMGF6NkR2VGFyVE9VbGF5b0tubWxz?=
 =?utf-8?B?TVJHUy9QKzVTNG01R2dQRHRVNGZ5QnAyV2ZpdzVpV2l3OWF5b2VJK2ZpaFly?=
 =?utf-8?B?dmNmTlorWm43OUdRUXZlZllhNXFTaGJkYnQyc0VhenMyUnZlYmQxRVlTRko3?=
 =?utf-8?B?UjRSak9oVWN0SmFXV1h1NDlTdVdEQmpnK3dkR0I2QmNOQUxiQ1lKQVJaNi9h?=
 =?utf-8?B?SE5kNjB6K1ZzY3VhNTc5L1pwKzNXUjdVd1FHcXJzWTdaOTJrSHpwc0xqZXVt?=
 =?utf-8?B?QmxDdjZnblVtcFFTRnZ1WTluS2p6R0p0V216MWI4Nm1JUkc5ek5iL2k4bllO?=
 =?utf-8?B?VUVlN3dSRWt3WWJXRGw3Qy9mQlhzNUJpaDJkWW96Wlp6OWVKcktjZE1zZkV4?=
 =?utf-8?B?Q3BMMjRXWnNDczVHcFhWNDAyZTBzaEltN2dnalRlSG9jYlYxMGZuekc4Y00w?=
 =?utf-8?B?bmsyeVVPRDB6RDg2bmFxQWVsa3hIREx6YjlNV29SV1c3Q0NrNCtnVUZlc3Mx?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89AD8D27E565B34B8BC16202AE6EE05B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0d83a5-0450-492d-ba5a-08dd025d88d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 14:31:30.6698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdKk/an9DnVNez6yRGDmzY6IPEUz+wRsbs4t5Z7JgGoXF7eYUZQ8hXquNyoo+WLBMK1XxnMstI+lFbQKF/4R9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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

VGhlcmUgaXMgYW55IGRvd24gc2lkZSBpbiBoYXZpbmcgT0FDX0NPTlRFWFRfRU5BQkxFIHNldCBp
biBhbGwgY29udGV4dHM/DQpJIHJlbWVtYmVyIHJlYWRpbmcgaW4gYnNwZWMgdGhhdCBpdCBzaG91
bGQgYmUgcGFydCBvZiB0aGUgZ29sZGVuIGNvbnRleHQuDQoNCk9uIEZyaSwgMjAyNC0xMS0wOCBh
dCAxNTowNSAtMDgwMCwgQXNodXRvc2ggRGl4aXQgd3JvdGU6DQo+IEFzaHV0b3NoIERpeGl0ICgy
KToNCj4gICBkcm0veGUvb2E6IERpc2FsbG93IE9BIGZyb20gYmVpbmcgZW5hYmxlZCBvbiBhY3Rp
dmUgZXhlY19xdWV1ZSdzDQo+ICAgZHJtL3hlL29hOiBBbGxvdyBzdWJzZXF1ZW50IE9BIHN0cmVh
bXMgdG8gYmUgb3BlbmVkIG9uIGFuIGV4ZWNfcXVldWUNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXhlY19xdWV1ZV90eXBlcy5oIHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmMgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuaCAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jICAg
ICAgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCg0K
