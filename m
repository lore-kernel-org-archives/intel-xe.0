Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E6C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 06:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5474E10F2FF;
	Tue, 15 Sep 2026 06:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qkom1xhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA0810F2D4;
 Tue, 15 Sep 2026 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789452099; x=1820988099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AAH8XR2kMi8dcP7yqdpSWGjvaQDYLb8h3JgIpbhWQU0=;
 b=Qkom1xhItvp/7bHybKwELCGqwQpuBKFjps54MzvnwsRKEJn0mG67CkxR
 KlC5wF5RkGN0pLANa+KrAP9pkAZG/rDtGxIKsfzQG4LhH/fj7IX8sY5kT
 g1edywo1xa5tYHvq1GmmYhGKlwbsooCog244z9jTdXAXoWYMzM3wv6llh
 lh/CG21BM1cx5j/RMEwy4BU2Y4jqxfUR21FX2E1EIHqjwH3TbMxWVoGXh
 joX6bF4SDnLmP0JcEtSPFIC0eUTcgahFcVNuJQUKKMmHaa8ucSHboHT3Q
 7gACcfAmbrc6iaUKrFxIL8ml0t1jTGAf9BIMMFJy5+zSog1sC0y72en+1 g==;
X-CSE-ConnectionGUID: bNhL2KHES2eJnq4nOpQoFw==
X-CSE-MsgGUID: GUTaKHDaTcKn3vwIffBkPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107178339"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107178339"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:01:38 -0700
X-CSE-ConnectionGUID: krhRVJMqTDq5TxLiirYbQg==
X-CSE-MsgGUID: r65DkNn+SPadYDnhtnyUVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296348873"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:01:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:01:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 23:01:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVxKlrWwGf17elm/cLh0K90sWBSUC+9enlX1HOyVjejPZWeBiOFVPVjo3had/lcUb3eCFO0pGhXqGU26DlbzDg+yXF9KQ5As7/vCkes5TCwmXQYc4KDj/9O/hQ6RG+kIkjKWxAMDuLpjobl+bKAg7A0mWfU+E0VDwunun9myrFGyR3OB3DWa1zU0SOtTsGe6OExvYmg6mCPDZ7riBH/BI4GEUQwj8sESorR8oemkPlSnuYrVRrANLtZherGC0i1rlEEVmdewr0P5Mk18NwNZDzu/JgOU1u78aUP2n7KTlNG2XAPUhkwnoq0u4fvo69sN3EoUWhObijx4HkoM4tmuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAH8XR2kMi8dcP7yqdpSWGjvaQDYLb8h3JgIpbhWQU0=;
 b=k2VEPHlkjqySRflblu72JPeiw9wHWFXV/4978VVsweTM6FuTazwTIeF+AhEHXXU7mm10hav1ZV9KuUvt3cUv1Ov9e/cWa9JxPfYydVMcbxAIF4D635WBTv7ALPsDbBL36rcEG8dT/xLMWgd7wpgYElbHHVYqf9WfIYcy13LwMmlhYS714wXEl1GZk7nTIJyweQ1wyguB165eLDh59n+jvrnXwkva97L8qag2JAEe5VCRM3GZyY3kvM61TAqG9qhRf6XALKVShqavKCqjtrxuQ9voVNOo20w0dmB6v1vDoeBxK1Z+RgYwTJ9hqK7KIl/F59CgyB3p60t2eiahWsXCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY5PR11MB6187.namprd11.prod.outlook.com
 (2603:10b6:930:25::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 06:01:33 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 06:01:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Lankhorst, Maarten"
 <maarten.lankhorst@intel.com>
Subject: RE: [PATCH 3/4] drm/i915/display: reduce indent in
 intel_atomic_commit_fence_wait()
Thread-Topic: [PATCH 3/4] drm/i915/display: reduce indent in
 intel_atomic_commit_fence_wait()
Thread-Index: AQHdQVypxY+rLd059kGYHHEeRCRYsbbPLHhw
Date: Tue, 15 Sep 2026 06:01:33 +0000
Message-ID: <DS4PPFE901A304F5BB844012A7E6257EA94E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
 <8ee588437fb214a20c57d8c181f28c57b81cacaa.1789069102.git.jani.nikula@intel.com>
In-Reply-To: <8ee588437fb214a20c57d8c181f28c57b81cacaa.1789069102.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY5PR11MB6187:EE_
x-ms-office365-filtering-correlation-id: ba47a6de-a3dd-4fd7-8118-08df12eecb59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: mpj0zxLcCykG+vfnRs1zv3vvy2hHIAEaNOHbYsx4tGXVp2dlEfSmDt8ZNGwcm9yVD7oLqbJb+FAH4DDZYHO5uLSIgFMfsokrHwX/V2Pk9Tb5fHeqOkQrNCGau0+W9I/xOB+yf6hYw10U0Rao/cnMXVdmgpu6eSDEgNpDbTuxjiqSzfScT9mpkTsMBIJzacoY4/07d3wYfirfOlEG7uCwrvWCov5Dokhyv4YSVXy+Cj606R/2r8xyiQaEDI7Ux4Eg92KoNygKElSc3GTJ9YO4tGPzi7Vm1rRVnmwlgH75zhOZtGuQdFqtpaxoUX/vuYBlrmesFFY0d8NO8dU/1X0JusIDeCSBepcKau/Vj4u4K6qhIrKbgebAYfFLdC94sogYVYGHyzfatKkPJinAp2NfDgRPZkI8NiTo+baw8JgB/PveRrpi5OjymFXtdnToj5KNPNflhfvvKtK7WEYlKVSogkI7FTYKSvk3kyUjB3iimWOBdmP48GdfEVTtwxHCmjYFzKGGnWS0EQanWp9v3KAB8NRnzyBDdXe3ixrPhihkuFxdIxZsjVGsqrL8oRblb+LRjzEmXa/7uIDznbnPUlEQhX+3ho7IK1roVnWaOcJyuekfVfqO6x36uWosISg2zrZ9Jz8LgY6pmu/phvF0TLGqi4dpY5g67jjq4AuKXWZNLjouQG4VV1iXTqu1SLUoEtARHBZmKet3O8yB+XKZ3GGZJJsyFf5xVNMOIn5sjq6SCm0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHhDamN2OWlKYzVWdUNwdG1wSmt2bGMwWjNFLzhDVGRVWkJJZkx3cENocjA3?=
 =?utf-8?B?ZStmcCtjZ0dUQTExdkFnMXBxK1paeFpPNWo1SDdLUmhLK1l2YlR6TFNGNFpu?=
 =?utf-8?B?T2VLNlFaSzlBcHNJZkt6T0FBZTVuRXJaZU1rM0gzelZpNk1kbFp3V0RqY0dm?=
 =?utf-8?B?ZDA0andTR1dhNjUveWRRVGJUMEZublRjcmNtVmVFbnd5cUtmNTdiN0hHdlRE?=
 =?utf-8?B?dE5EbWlRNVNKelhMenFacmU1YVd0ZE80OWtYR3hWdWNCRFVpZWkwVXdESU5s?=
 =?utf-8?B?VThrMHdHV0kzK2NlU1F1dWpmR29FK2E2K3lSbFR1STJHclBCRnh5R3p4ekJF?=
 =?utf-8?B?eDRvQmxSWkE0VnkwaFdiamFkbzJwamxTQUNwWHJLSGUvTGprL1NJcEdZU2Qv?=
 =?utf-8?B?ajk1dUJyQTNyNHpoZWFNUFN4U0JsblEvbncvcVREQmt1SHhyZVl2OStNYmtB?=
 =?utf-8?B?MUpIK2d4QzZocGVLaDNtdDNVd3g4M2trQklKV1ZFT25uSGdsQ2R4TzY4bThh?=
 =?utf-8?B?TThlbFdHSlgxdnBBTk9jZkZVYnVxbGx6T3B0NzFXTWhkRVpXVGcyRXhHSlRJ?=
 =?utf-8?B?ZjV2OWhtM0x6TURyeWVKZHJZZVdZOTVsRlVHMkczUWRoQjhncjRMdzVUNDc3?=
 =?utf-8?B?dmR1UmpKK0pUWHQ5UnJseGIxdU43RGxjNjBXMERGcE9DRkpTOEJjbzdEWmZU?=
 =?utf-8?B?YXJ0R3pFdXYzR3ZEdm9kOFdTcVFEZEhQNFFMUEN5UGNyNWFLQkZ4bkxRUDJB?=
 =?utf-8?B?NWVvejV2anZEQWMzUjh3M24wcHFxZHpELys3SWE2WE44ejZBdS9UdmpXb2U1?=
 =?utf-8?B?TWpSSFh3YWZ0RHJKZXk3c1U4azUyUjJpc2Z4VkpMRVRtbVRERmJKNDVlUlAr?=
 =?utf-8?B?QVFyOW9qSm9GWVpFbW1WL2ZjMnNpQklVMHNjSUZpWitXaVVLMHJSbEZCM3pK?=
 =?utf-8?B?MHA2anlBbkg1aWN5TVlxZlNIODkwZzRUZ1dmTXZhZEVjMVNqU2dqejFZd1Bj?=
 =?utf-8?B?QURsQXgyYkx6aXoveFpHbmNuWHk2YjdsVlkzVHErdGhnUTRXai9Bcm9nc1Z0?=
 =?utf-8?B?Q2FLR0VUbzFmY0hQcFk4NGkxSzU4TXlaUHRab0k2Y2RPTFVZK3RFMURac1Yy?=
 =?utf-8?B?endObzkzVjVvZnZ1RzFyd3l1OEZuaXBXbW16NVBCNndRZmhkbE0vVVpXTDZ6?=
 =?utf-8?B?QUp5Z1hhSE90Uk8rckdqRXZFVWxzR2ZGL2ZkYUxwOE1teXBCL2FMRi93Tzl6?=
 =?utf-8?B?NFlib3ZSZ1dpbFhXSExNcXMwRis3U1JaTThOenJZR1krWXpleFBxM1pFMkNT?=
 =?utf-8?B?eFlsWDFuNWplZEZXd2ppRWZDbDhOTWEzaWpwSEJodzZwV1pDcUdlYjJhY2hx?=
 =?utf-8?B?NUgrWUM3RlpTaHk3a2pCS2duOVArWGtSYWNZb1M1NXhXWkJJOGRCaEc1OENT?=
 =?utf-8?B?WHRnbEw4ZklpNmVzRTFORVY4SDdMOGVIQ3FUUEd0NmVGb1o5blJ2VDZNTTl3?=
 =?utf-8?B?ekdoTFBUajA0dmVjdUxBR3lWblRhcmcxSDVIc1lTT0VnUDJuVXBCK3VHa0Vj?=
 =?utf-8?B?ZUltc3JFRDY3a3BxYVhZS01xamVGdGY0ZmFMWGh4RjhyMTZBSWNKMGJNdmZG?=
 =?utf-8?B?bUlaUElvaVNsTGo5a0ZFdVY5RTAvUlBsb0lac0pRUHNYQWM1VWgrYU5wK09U?=
 =?utf-8?B?V09SUExhTGNaQTk1YW8yY0UxR3BwR24yVXZuOWswTUVLL0NaU2x2WUF3REV1?=
 =?utf-8?B?bnhHUXY4Z3Eya2Iwa3NET3Y5SFcrRlVFT2t4RlV0Y1gxRnI3cFd1MlJWYTlE?=
 =?utf-8?B?SFJzdEN4N3hEaEFQcm9hV2Z6elJwNDNmU05hbkFOb0FVTlZqUFowY2JQYTJv?=
 =?utf-8?B?cEpVR29KZUtRUnZBTnd0RlBCejdqVUNSajQ0V040NEhmTkJQaVRPWGtnVUNC?=
 =?utf-8?B?U2RCU2swWENyb05VdnJlL1hCTkNhNG5pT3R3cjdhaXIwbWJtNHlSYXdTVlEy?=
 =?utf-8?B?ZHV0elRnVjNvS3AwZnhFL1RUV0l2MnNNOW9UYU5nUkpTL3hrQ3pvZ2tFWFZW?=
 =?utf-8?B?N3R5alg2VW1sZmRWSFByc3k0L2xoeitIUUVPaFFHU2w4cGNqUUVmb1FxaTdp?=
 =?utf-8?B?MnVKOGM5Uk0wSldidUIxNmtrVGovRzRUaW9Ld2ZKYmozQjNHRTJCaTNPRTRY?=
 =?utf-8?B?NGFDdDhEVVVRT00wZEZXNEJtdnRKOVRBMExVaVNNazVhOHlUVUJPSWdkRmhC?=
 =?utf-8?B?OGZkbmpsWklqS25xd3JMbUFJdUNkdERURU5xS0V6TTNFbFBxWTViNlYzZE1J?=
 =?utf-8?B?cDVjaklVd3ZyVUwrbWxjWXZ3UEhaM0ZwY3FXanpJR0NzY2FwbFhiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LZDdtO9AVfIDcXSimOt6ZHh0epRk1dBN3iYZPp+OKg5uwhuQXFdZXFv+nRi/ObZVTuV2JvcTqjcLV7bbWHPTwYsjLHUtx8aGDptYhewliTogssjA8cUkIgyWvqxSTL65B9wIurO+YDAbnd8vtSo5wQyEF7DUcVSHqaXu4ZOO+qhWUyzAIcvb3T4AxQsq0miI5PenBFZeiiqcp/pVUTzTWd52Ev7EBJMHpIOUOLazalEa4nIlfp59Ujh1Xu2uWKrMbiUizDjttA0SBIfOr1pd4M7x+1gbGVRdkQKuYqBmdcOzHO8D5l0R1+VH/oDkSWZzAZXdhyz0KeJrz8EujMXjlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba47a6de-a3dd-4fd7-8118-08df12eecb59
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 06:01:33.2842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9D9RHROyEIQCknT+/B8MxGtV2TZ8ZIvaLhUZk4kMLvPftsAiL+MfbfPabvZD7pTxyL8IfZNcK7CJkUmEKvGxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

PiBTdWJqZWN0OiBbUEFUQ0ggMy80XSBkcm0vaTkxNS9kaXNwbGF5OiByZWR1Y2UgaW5kZW50IGlu
DQo+IGludGVsX2F0b21pY19jb21taXRfZmVuY2Vfd2FpdCgpDQo+IA0KPiBDb250aW51ZSBlYXJs
eSBpbiB0aGUgbG9vcCBmb3Igbm8gZmVuY2UgaW4gb3JkZXIgdG8gcmVkdWNlIGluZGVudC4NCj4g
DQo+IHYyOiBSZWJhc2UNCj4gDQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5r
YW5kcGFsQGludGVsLmNvbT4NCg0KPiANCj4gLS0tDQo+IA0KPiBUaXA6ICdnaXQgc2hvdyAtdycg
Zm9yIGVhc3kgcmV2aWV3DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMgfCAxNSArKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBpbmRleCAxYzJlNTBjNmQ5OGEuLjk4
M2U4NGJjYTFlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMNCj4gQEAgLTcyOTYsMTQgKzcyOTYsMTUgQEAgc3RhdGljIHZvaWQNCj4gaW50
ZWxfYXRvbWljX2NvbW1pdF9mZW5jZV93YWl0KHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0
YXRlKQ0KPiAgCWludCBpOw0KPiANCj4gIAlmb3JfZWFjaF9uZXdfcGxhbmVfaW5fc3RhdGUoJnN0
YXRlLT5iYXNlLCBwbGFuZSwgbmV3X3BsYW5lX3N0YXRlLA0KPiBpKSB7DQo+IC0JCWlmIChuZXdf
cGxhbmVfc3RhdGUtPmZlbmNlKSB7DQo+IC0JCQlyZXQgPSBkbWFfZmVuY2Vfd2FpdChuZXdfcGxh
bmVfc3RhdGUtPmZlbmNlLCBmYWxzZSk7DQo+IC0JCQlpZiAocmV0IDwgMCkNCj4gLQkJCQlicmVh
azsNCj4gKwkJaWYgKCFuZXdfcGxhbmVfc3RhdGUtPmZlbmNlKQ0KPiArCQkJY29udGludWU7DQo+
IA0KPiAtCQkJZG1hX2ZlbmNlX3B1dChuZXdfcGxhbmVfc3RhdGUtPmZlbmNlKTsNCj4gLQkJCW5l
d19wbGFuZV9zdGF0ZS0+ZmVuY2UgPSBOVUxMOw0KPiAtCQl9DQo+ICsJCXJldCA9IGRtYV9mZW5j
ZV93YWl0KG5ld19wbGFuZV9zdGF0ZS0+ZmVuY2UsIGZhbHNlKTsNCj4gKwkJaWYgKHJldCA8IDAp
DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQlkbWFfZmVuY2VfcHV0KG5ld19wbGFuZV9zdGF0ZS0+
ZmVuY2UpOw0KPiArCQluZXdfcGxhbmVfc3RhdGUtPmZlbmNlID0gTlVMTDsNCj4gIAl9DQo+ICB9
DQo+IA0KPiAtLQ0KPiAyLjQ3LjMNCg0K
