Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413CFFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 21:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892310E46B;
	Tue,  5 May 2026 21:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLAFJT83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85BB10E46B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778017542; x=1809553542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l86vGcsiWco/vbV8YzPtKqrigMW1TNrc4PvYJLl4xOo=;
 b=HLAFJT83KFstdoi32GidEVfKOvVDgRI1wl7OAtXH61DfiB1P0qytQRqv
 kGjLIGC9q2OdnR9aYbQO4QHkO9lEGnvMB8LzJ+0YIIfDO0cJf18qOO4Tt
 ziv3cFoCcIWAsEoBQcdBwVdSrvyph7kJpMWu3CqbCVz9NdGjnQwMQ3aHi
 pVpnKXFP6gQgGO3kTma4Bp9nICIzxlyjjdAJXaj1qEQ0rvvmzUeannK26
 cAKWXfqKHyXNd1Q4UzjQNTFqdjaM6HW+Oe4yx78dVQF1xp/iiLlZoXSSC
 dJrQPqsUjytIP0ESDXOfKeQZxAkyj/XaLkobPeJx1bdKUmar1h19Dr75l g==;
X-CSE-ConnectionGUID: ZPrucz2nRl6rK/svU8xIvQ==
X-CSE-MsgGUID: f3+rm9kjSamlw69wefy7Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89496260"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="89496260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 14:45:41 -0700
X-CSE-ConnectionGUID: oZd6y3reT42aRAYYLfywbw==
X-CSE-MsgGUID: fZVk8OBDQNWTBhkX6awyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="236004488"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 14:45:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 14:45:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 14:45:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 14:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkIZ3jgBS/z7onh88Qeh5+rEwV60VOaExG2nhjaNYHBH26qwH6A7E9IRcPqI+6xYNM9JLeQJDetC80H51W+lPebLuG9c9K73FKvG+SMjmRHY1EMxq9o+VWov1G8Cxq38qDPNMoqbYkWp+QLvnx9ngo2wqDQHeaDFTxozebvM4d+qUZnpLoIyGB8lbWlOvGyyhzNy8pbidv4K3h4gm1gZgzzWu7ZcSKvR9/qLC7OxjZJocJMI29eCO/zd/74Na5QwSdp1rnBlUOvbZHtJZqFvbkE7SVfDOZqp8pCskWYM+wZH45wnxbY8CbdHLBqvCvMV5VY377XcGttchaEGz4MTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l86vGcsiWco/vbV8YzPtKqrigMW1TNrc4PvYJLl4xOo=;
 b=DwmnSJ9NQbprrhmh+ucCeAOid2Ky2hgI1JxI1ZPjXRmQCmmnxlGxq1SVVf+xLJ/LqWts94MIAGZNEuQUvapAbaffD5LNMojgv3SlSVBFx9D/r04fcc/uJ3zTcP5Eg1ckfI3FPufyk9xtnW7fHNO9LBWaJ4IXtScLBK1qMbTrhzelx544ERRMuLIBtZIfzcYpnPilPEWWzcpUqzCp+WqfJyujEIQeVv/xC8h6OP0SdF4rM9gcAl0ghurIgSyy/KVeNFPQ3w9FlxCc30LWSFh4Fwt3Jt0NjOw973nNAMC3iiyIRCMKAvb2uNiLdCgUzHv13z5pM0iIc5Ipe/eufm2vtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 21:45:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 21:45:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHc24CiQo5s8b+4uE6kK9lOFblYaLX+Ai2AgAACSwCAAfWFAA==
Date: Tue, 5 May 2026 21:45:37 +0000
Message-ID: <55592f3c76a071e19db5aa6ea2c573f718eeb5c8.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
In-Reply-To: <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7847:EE_
x-ms-office365-filtering-correlation-id: ee6403c6-5b51-4a68-2926-08deaaefa53a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: MzCTQGaYAVZZX75BrDQSlIBxnTlwaNqYdQZzefxnNIWV1rXNjr8jRvezzJ3tksaZlqnrZgAuCD9Xwv4t74HEneCGNPrShSYpD41+VHM9EjkECFT/ZePQsA8ZEJ2zqjftAg3mMRhJRXw//Sz3iLqVLGhmN76hVyUzVH0LuFdAzcxfNlIF78/5EnipNpxRnmfHfS8qzv/f6olq34Ofejci5/Bzel7daCv9ZiNe/lpPAMKCIDC14B2jUdMCLfIfTeUVK3YMUZvseYQErEff/GIsHXbfw3fGvP5pgs9TqCd1oHYSXAvWP/lvM7i2l4qzG/pDaKAszB8N+YFguPL5efqxQ4+tv6sIhFV3Ww1YlqoCUfFhoU1HSsUump+ldO9qF8TrFMLqe38IyicStyqf6Nb0ioCtCXmFvxGLeNUu+8iFuICwjbx/RhtKAb7nrgyjPtmvIOFhUlutE5VkzYKppE70C5O009awGiDHJ9TL+8wi3hbh/JbmA2F1R3Iyj8aY9gTXCE8q+MGRu6TisOMs9QNtZdl3XVXArevLJmp9VbWRkpESc4A8/6MEfoxRY03qdOWYKN1Wty3itFvRcK/Km67zzncmnVpiDWTGvUhnEExYnRLaqveeumHlMCLphAJzI4ezyuL5jCvOMlESaMaM0vKY85NG4Ol8W0ywYGlh+b/QV6L9R8Ip1YY6gAyM4bWag6NmT3Bmwy5TCl6PEehEXOxYSFld3RekoUNuYreXEo1ekdlrOp+W60dwyb0A1R4CwSD8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkI2YUxya1FJZ3JZT2lJRFBYb0gvVThtbjJuMnkreVpISno0LzZLeXgrb3Aw?=
 =?utf-8?B?WTdLUzVjUTJnNGRWUXdSY1lkRENHSEErU095QjZQTTZhR1VRUTBhRWZMWno2?=
 =?utf-8?B?QjRJaG03KzY4cDBvVXZrdkdxdEV0UHJoRUtQTnQ2OWdROGJkK1pkVE5GQVI0?=
 =?utf-8?B?a2FIcG02c3FkM0ZjcHZoMXVPN0w2UzZHWmNOY2ZGM0xZK3pKMm9HY1pJTUFI?=
 =?utf-8?B?bGZFZ0YyK0tGb1JvRXladWFmMjlpNTROam1Ta2M5YVMrM3NjM2cxTDZEUWZM?=
 =?utf-8?B?bEhhWi9ib1pmRlpJVkdJTTZIWHZnRnIxWDhBMWR2UEhCa2dEb0VwZlRXSW4w?=
 =?utf-8?B?eGluN2l2clUzL0xJQlNjbEU1ZlpzZ3pjem5wb202Vmg5TVZjanQzRmlEM0Yw?=
 =?utf-8?B?bW9kNE9GTDVjUkpkTEdFOTlBTkpvQXVXVTVpQ3hLdVZsMm1hdS9iSHlEWFJC?=
 =?utf-8?B?RVFOVGlid3FPMzNCNEoxR2FYRlJ0ZWdMK0FMNkZraGRhSVdFYXNvbncraW5K?=
 =?utf-8?B?bGNiTnlyYVVNWVBZbE5qQ0tZOHg3aHc4eHVmZGRjeHE1Q1Vmd2I4cDQyTzJB?=
 =?utf-8?B?Z2xJZTlGR3NVRlE2c2Y2TiszSlEvVklUcDBzR0xDZGhlOTZod1p1anUyYlNm?=
 =?utf-8?B?N0tuZURDQml3STNtS2wzSW9zM2hDTFZBRWRlallGdzduN1kvdDdoaXJYU0pB?=
 =?utf-8?B?MmpLd3hNdFU5RjU4OVpZUitZOUlGbnJEUCtHV1A5czM1dkFqSWdzUU9kN01v?=
 =?utf-8?B?NEdSdHpHSklwRXQxd0JCSXhwSnhlY2JVMUMwdEwxVXZSVjZiMWxzOW45eWFq?=
 =?utf-8?B?M3dJZUUwa3VaQmxxRFY1dTlrM0ZBL3lTNGN5RnB1MDJ5UHZRMTluaU5Ic3ly?=
 =?utf-8?B?VU1lWElTQXhUdFE3OEhwTnlDR0dWdVNiUjZwVWFmVlZPV01hZXV3bkhuL0N5?=
 =?utf-8?B?cWYwakVJa0NOOGVPSDJqYm4xdGl6NEtBQXNUR1NFeG1uckkwVGRRT2YrQjRH?=
 =?utf-8?B?enMyVUgzNHE5aDRPT2FUWjdCUUVCY2Z2ZWJFMDgwT0lKUktxMHZqVXNwMzR5?=
 =?utf-8?B?bVhFbUtxOFl1MDBla250V1JFempvOEdidWhGR2tNTGhKZm1YckNoMFJ5a0Nn?=
 =?utf-8?B?WGpJRllmOHk5akJJb0lCZXRvZnNVZGl3bUZKampiSUFJaTQ4NVYrYUxYZEE0?=
 =?utf-8?B?a3NQK3AzS2dhUU9yWW16NEZxMGRPUjhwbmNzcWlpdjBCekJTZDM3QUJrVlVU?=
 =?utf-8?B?RWtsZlV3WXFTcCtoR0xrZWwwck1RY0RLSFBhYzRWQ0VySVdCbnNyaExvOGlQ?=
 =?utf-8?B?M1ZSaG9scnpaaUFhSEVmQklkNkVWem5rNnJFTVlCM3Y4Qm1KdDZoSnBKQTNi?=
 =?utf-8?B?SUdaVkI2b3pvZkQ4cE85RkRkL2ZPaGNOcEtkZWd4bVF5cTB3Sm1VU2xaUnZn?=
 =?utf-8?B?Y0w1Y2svWVFZZmZBVk9MUGt5UVpmSFlSc1NrWTY5OUJTYzF0L01TcFk4RWRG?=
 =?utf-8?B?VWNmSWpEb1YveE9SNDNyZjR1eDdyei8rZEJhN1pxM1JnZlBwbEk4c3EvRi96?=
 =?utf-8?B?N0Z4akNvOExzYWExU0J4TW41MVBqaUVjVnRVWDhiMTc4ckFOZXZrWUpvRTll?=
 =?utf-8?B?S0dMWlZUYjAxZzVzZmV5V0Y0V1BQOUtUL1F5ZEhzZ0lMUklCZ2FrdGtQa0FS?=
 =?utf-8?B?NE1mMHljb0IycWY2ZE9lSFVrUjdDTWJwYk1CekQrbUFhbWNHQ1Z6TzVGdXk0?=
 =?utf-8?B?a3RkT3UyQlp2bC9vL0loY1lxUzQ5d1NBZ3pPK0hnSTJPRWtpcS85VmN3WGJE?=
 =?utf-8?B?RkZnMmE4bWR4RmNaWEFXcEFiRHRkdFI4Rys4VVAzMzR2OUZvRGVDajNpUjNM?=
 =?utf-8?B?SkNERXNRbXNSVnNxSmUxbFlFdjVIZW5yMisyem12U3czaHdMN2xkM2YxWnZH?=
 =?utf-8?B?N0FKTlF1dzNEckN4WmVMaWp0V3cyZXhtbXZpdUE0eWFnT1JHVHNtVEMzWkdr?=
 =?utf-8?B?ZUtDbWIrY2pqZ2ZlL2JBaDFMaWpnU2V5cmRjODR1WjZOQnZncXkwa3A0MXly?=
 =?utf-8?B?TFB1MU01WDNiM3d5YTZvamtOeU1yTUFSSDhpdnVkK2hzWng5WG4vUmRLendY?=
 =?utf-8?B?LzU3Y1B6azFrSXJhNG92VkkvRG1yUlBWaWczNW1tZFdsNm90eGVMaUV1R25k?=
 =?utf-8?B?RVR5RDRtZWUvMWhmakN4LytCdSsrWERvanpWWVF3cktxd29mQ2Uxbmpscm8r?=
 =?utf-8?B?ZUY3cEtEQ205czIySFBJL3h0TW1xSmlHQTgycnBCVHRWUldpdU1GVWc0Y1pu?=
 =?utf-8?B?T0NvSkxWNGsyMVFnaGtiTmM3aXZINzMzdTJPRGNjS3pRQXBuTXgxcmw3OEV4?=
 =?utf-8?Q?DUsfy29iS+YLAR7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CBD5A06AAC62644BBC4DC8287750C79@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tM6/b/r7Teq6Qi1R9X1eaYzBhwV3GQb1J4b1wqm88pskgF06Vof8coGWxKMtyWMN+/l0GiJFGFuDu43/1npW/9WtgcvxP9NKNKKoKQr9+jdJ3cWP5OzpelS1PbgBHyEswKxcV02kroUHmdOIkPut6uRUteiEcibojuiymUhgv4OlW3euNtIbIf9udT8mFIQsLwrVxEbFzw1aSDJuoZjAt23I1r2NRNTP5Cy1v4bD0MROt8bhNa+VYPEb9aYNKVBzxMmqAYnK34Sn1652C00n6HzNk0tlLrirZrJAzTVluAzd6u/0ewkE8xBGOGGdvlUjTY97Ce22AmZZl1i3M1FRLQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6403c6-5b51-4a68-2926-08deaaefa53a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 21:45:37.8732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eQwp/2OZom3nPItw2z1deHSCMWMfTOnj84z0uvLHyUfFh1kR/RePLYggAK0ImJOz0bf0uwzHLkueFn/EcOz5hQGzpIDGnjxNN9wMBveHHxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

T24gTW9uLCAyMDI2LTA1LTA0IGF0IDE1OjUwICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNi0wNS0wNCBhdCAxMjo0MiAtMDMwMCwgR3VzdGF2byBTb3VzYSB3cm90
ZToNCj4gPiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPiB3cml0ZXM6
DQo+ID4gDQo+ID4gPiBBZGQgdGhlIHNrZWxldG9uIGNvZGUgZm9yIGEgbmV3IGRlYnVnIHNwZWNp
ZmljIGNvbmZpZ2ZzIGdyb3VwLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gQXNzaXN0ZWQtYnk6IENv
cGlsb3Q6Y2xhdWRlLW9wdXMtNC43DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArKw0KPiA+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuY8KgwqDCoMKgwqDCoCB8wqAgNCArKysrDQo+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jIHwgMTQgKysrKysrKysr
KysrKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmggfMKg
IDggKysrKysrKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVz
LmggfMKgIDcgKysrKysrKw0KPiA+ID4gwqA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KykNCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmc19kZWJ1Zy5jDQo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnNfZGVidWcuaA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmls
ZQ0KPiA+ID4gaW5kZXggMDk2NjFmMDc5ZDAzLi5iNTg2NjdiMGIxOGUgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZQ0KPiA+ID4gQEAgLTE2MSw2ICsxNjEsOCBAQCB4ZS0kKENPTkZJR19I
V01PTikgKz0geGVfaHdtb24ubw0KPiA+ID4gwqANCj4gPiA+IMKgeGUtJChDT05GSUdfUEVSRl9F
VkVOVFMpICs9IHhlX3BtdS5vDQo+ID4gPiDCoHhlLSQoQ09ORklHX0NPTkZJR0ZTX0ZTKSArPSB4
ZV9jb25maWdmcy5vDQo+ID4gPiAreGVfZGVidWdfY29uZmlnZnNfb2JqLSQoQ09ORklHX0RSTV9Y
RV9ERUJVRykgOj0NCj4gPiA+IHhlX2NvbmZpZ2ZzX2RlYnVnLm8NCj4gPiA+ICt4ZS0kKENPTkZJ
R19DT05GSUdGU19GUykgKz0gJCh4ZV9kZWJ1Z19jb25maWdmc19vYmoteSkNCj4gPiANCj4gPiBX
aGF0IGFyZSB0aGUgZG93bnNpZGVzIG9mIGtlZXBpbmcgdGhpcyBhdmFpbGFibGUgZm9yIG5vbi1k
ZWJ1Zw0KPiA+IGJ1aWxkcz8NCj4gPiANCj4gPiBJIGltYWdpbmUgdGhhdCB0aGUgZGVidWcgY29u
ZmlnZnMgY291bGQgYmUgdXNlZnVsIGZvciBzb21lb25lIG5vdA0KPiA+IGludm9sdmVkIGluIGtl
cm5lbCBkZXZlbG9wbWVudCB3b3JraW5nIHRvZ2V0aGVyIHdpdGggdGhlIGRldmVsb3BlcnMNCj4g
PiB0bw0KPiA+IGRlYnVnIGlzc3VlcyB3aXRob3V0IG5lZWRpbmcgdG8gcmVidWlsZCB0aGVpciBr
ZXJuZWwuDQo+IA0KPiBTbyB0aGUgZm9jYWwgcGFyYW1ldGVyIHdlIGhhZCBpbiBpOTE1IHdhcyBl
bmFibGVfcmM2LiBTb21ldGhpbmcgbGlrZQ0KPiB0aGlzIGlzIHdoYXQgd2UgZXhwbGljaXRseSBk
b24ndCB3YW50IHRvIGV4cG9zZSB0byBhIGdlbmVyYWwgdXNlciBhcw0KPiBpdA0KPiBjYW4gaGF2
ZSB1bmZvcmVzZWVuIGNvbnNlcXVlbmNlcyAobGlrZSBoYXZpbmcgdmVyeSBoaWdoIHBvd2VyIHVz
YWdlKS4NCj4gQnV0LCBoYXZpbmcgdGhlIGFiaWxpdHkgdG8gZGlzYWJsZSByYzYgZm9yIGRlYnVn
IHB1cnBvc2VzIGFzIGENCj4gZGV2ZWxvcGVyIGlzIGV4dHJlbWVseSB1c2VmdWwgYXQgbmFycm93
aW5nIGRvd24gY2VydGFpbiB0eXBlcyBvZiBidWdzDQo+IGF0IHRoZSBoYXJkd2FyZS9zb2Z0d2Fy
ZSBpbnRlcmZhY2UuDQo+IA0KPiBUaGF0J3MganVzdCBvbmUgZXhhbXBsZSwgYnV0IHRoZXJlIGFy
ZSBhIGJ1bmNoIG9mIHRoaW5ncyB0aGF0IGNvdWxkDQo+IGZpdA0KPiB0aGlzIGNhdGVnb3J5IGFu
ZCBJIGV4cGVjdCB3ZSdsbCBoYXZlIGV2ZW4gbW9yZSB1c2UgY2FzZXMgb3ZlciB0aW1lLsKgDQo+
IA0KPiBSaWdodCBub3cgd2UgaGF2ZSB0byBob2xkIHRoZXNlIHR5cGVzIG9mIGNoYW5nZXMgaW4g
YSBzaWRlIGJyYW5jaCBub3QNCj4gZXhwb3NlZCBleHRlcm5hbGx5IGFuZCBJIHJlYWxseSB3YW50
IHRvIGNvbnZlcmdlIG91ciBwcm9jZXNzZXMgc28gd2UNCj4gY2FuIG1vcmUgZWFzaWx5IG1ha2Ug
dGhlc2Uga2luZHMgb2YgY2hhbmdlcyBhbmQgbGV0IHVzIGRlYnVnIGRpcmVjdGx5DQo+IG91dCBv
ZiBkcm0tdGlwLg0KPiANCj4gPiANCj4gPiA+IMKgDQo+ID4gPiDCoCMgZ3JhcGhpY3MgdmlydHVh
bGl6YXRpb24gKFNSLUlPVikgc3VwcG9ydA0KPiA+ID4gwqB4ZS15ICs9IFwNCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+ID4gaW5kZXggMTJiN2ZlNjU0NDZkLi44NWRm
OGNlNWNmMmEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmln
ZnMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPiA+
IEBAIC0xMDA2LDYgKzEwMDYsMTAgQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXANCj4gPiA+
ICp4ZV9jb25maWdfbWFrZV9kZXZpY2VfZ3JvdXAoc3RydWN0IGNvbmZpZ19ncm91cCAqZ3JvDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9pbml0X3R5
cGVfbmFtZSgmZGV2LT5zcmlvdiwgInNyaW92IiwNCj4gPiA+ICZ4ZV9jb25maWdfc3Jpb3ZfdHlw
ZSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ2ZzX2FkZF9k
ZWZhdWx0X2dyb3VwKCZkZXYtPnNyaW92LCAmZGV2LQ0KPiA+ID4gPiBncm91cCk7DQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVC
VUcpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBjb25maWdfZ3JvdXBfaW5pdF90eXBlX25hbWUoJmRl
di0+ZGVidWcsICJkZWJ1ZyIsDQo+ID4gPiAmeGVfY29uZmlnZnNfZGVidWdfdHlwZSk7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqBjb25maWdmc19hZGRfZGVmYXVsdF9ncm91cCgmZGV2LT5kZWJ1Zywg
JmRldi0+Z3JvdXApOw0KPiA+ID4gKyNlbmRpZg0KPiA+IA0KPiA+IEkgZ3Vlc3MgdGhlcmUgaXNu
J3QgbXVjaCB3ZSBjYW4gZG8gYWJvdXQgaXQgdG9kYXksIGJ1dCwgYmFzZWQgb24NCj4gPiB3aGF0
DQo+ID4gSQ0KPiA+IHJlYWQgaW4gY29uZmlnZnMgZG9jdW1lbnRhdGlvbiBhIHdoaWxlIGFnbywg
SSBzdXNwZWN0IGl0IHdhc24ndA0KPiA+IHJlYWxseQ0KPiA+IGRlc2lnbmVkIHdpdGggYXJiaXRy
YXJ5IGhpZXJhcmNoaWVzIG9mIGNvbmZpZyBpdGVtcyBpbiBtaW5kLsKgIEl0DQo+ID4gd291bGQN
Cj4gPiBiZSBuaWNlIGlmIHRoZXJlIHdhcyBhbiBBUEkgZm9yIHRoYXQgdGhvdWdoLg0KPiA+IA0K
PiA+IEJhc2ljYWxseSwgYSBjb25maWcgZ3JvdXAgaXMgZXhwZWN0ZWQgdG8gYmUgYSBkaXJlY3Rv
cnkgdG8gY29udGFpbg0KPiA+IGENCj4gPiBzZXQNCj4gPiBvZiBjb25maWcgaXRlbXMgb2YgdGhl
IHNhbWUgdHlwZSwgd2hpY2ggaXMgbm90IHRoZSBjYXNlIG9uIG91cg0KPiA+IGN1cnJlbnQNCj4g
PiB1c2FnZSAoaS5lLiB0aGUgInNyaW92IiBhbmQgbm93IHRoZSAiZGVidWciIGdyb3VwKS4NCj4g
PiANCj4gPiBJIGd1ZXNzIHdlIGFyZSBhYmxlIHRvIGdldCBvdXIgZGVzaXJlZCBiZWhhdmlvciAo
YmFzaWNhbGx5IGp1c3QgYQ0KPiA+IHN1YmRpcmVjdG9yeSBiZWhhdmluZyBhcyBhIGNvbmZpZyBp
dGVtKSBieSBub3QgaW1wbGVtZW50aW5nIHRoZQ0KPiA+ICJtYWtlX2l0ZW0iIGhvb2suwqAgTm90
IHN1cmUgaWYgdGhhdCdzIGFuIGV4cGVjdGVkIHVzZSBvZiB0aGUgQVBJIG9yDQo+ID4gaWYNCj4g
PiB0aGF0J3MgbW9yZSBvZiBhIGhhY2sgb24gb3VyIHNpZGUgYW5kIGNvdWxkIGNvbWUgYmFjayB0
byBiaXRlIHVzIGluDQo+ID4gdGhlDQo+ID4gZnV0dXJlLg0KPiANCj4gSG0uLiBvayB0aGF0J3Mg
Z29vZCBmZWVkYmFjay4gSSBkbyBsaWtlIGJ1Y2tldGluZyB0aGVzZSBpbiBncm91cHMgYW5kDQo+
IHN1YmRpcmVjdG9yaWVzLiBJdCBhbHNvIG1ha2VzIGl0IGVhc3kgdG8gc2hvdyBvciBub3Qgc2hv
dyBiYXNlZCBvbg0KPiB0aGUNCj4gS2NvbmZpZy4gQnV0IGxldCBtZSBnbyB0aHJvdWdoIGFuZCBt
YWtlIHN1cmUgdGhlcmUgaXNuJ3Qgc29tZXRoaW5nDQo+IG1vcmUNCj4gc3VpdGVkIGhlcmUuIEhh
cHB5IHRvIGhlYXIgYW55IG90aGVyIGZlZWRiYWNrIGFzIHdlbGwgaGVyZS4NCg0KSGV5IHNvIEkg
ZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3NhcmlseSBhIGJhZCBpZGVhIHRvIHVzZSBtYWtlX2l0ZW0g
aGVyZQ0KZm9yIHRoZSBsZWFmIG5vZGVzLiBCdXQgbWFrZV9ncm91cCBkb2VzIGNvdmVyLiBJIHNl
ZSBvdGhlciBkcml2ZXJzDQpnb2luZyBib3RoIGRpcmVjdGlvbnMgaGVyZS4gVGhhdCBzYWlkLCB3
ZSBhcmVuJ3QgZG9pbmcgYW55dGhpbmcgbmV3IGluDQp0aGlzIHBhdGNoIHNlcmllcyB3aXRoIHJl
c3BlY3QgdG8gY29uZmlnZnMgaXRlbSBjcmVhdGlvbi4gSSdkIHByZWZlciB0bw0Ka2VlcCB0aGlu
Z3MgY29uc2lzdGVudCBpbiB0aGlzIHNlcmllcyBpZiBwb3NzaWJsZS4gV2UgY2FuIGxvb2sgYXQN
CmRpdmlkaW5nIG91dCBpbnRvIGNvbmZpZ19pdGVtIGFuZCBjb25maWdfZ3JvdXAgZW50cmllcyBz
ZXBhcmF0ZWx5Lg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVhcnQN
Cj4gDQo+ID4gDQo+ID4gLS0NCj4gPiBHdXN0YXZvIFNvdXNhDQo+ID4gDQo+ID4gPiDCoA0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2luaXQoJmRldi0+bG9jayk7DQo+ID4gPiDCoA0KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40NTYxNzI4MmNlYzUN
Cj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9j
b25maWdmc19kZWJ1Zy5jDQo+ID4gPiBAQCAtMCwwICsxLDE0IEBADQo+ID4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiA+ID4gKy8qDQo+ID4gPiArICogQ29weXJpZ2h0IMKp
IDIwMjYgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiA+ICsgKi8NCj4gPiA+ICsNCj4gPiA+ICsjaW5j
bHVkZSA8bGludXgvY29uZmlnZnMuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
DQo+ID4gPiArDQo+ID4gPiArI2luY2x1ZGUgInhlX2NvbmZpZ2ZzX2RlYnVnLmgiDQo+ID4gPiAr
I2luY2x1ZGUgInhlX2NvbmZpZ2ZzX3R5cGVzLmgiDQo+ID4gPiArDQo+ID4gPiArY29uc3Qgc3Ry
dWN0IGNvbmZpZ19pdGVtX3R5cGUgeGVfY29uZmlnZnNfZGVidWdfdHlwZSA9IHsNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoC5jdF9vd25lcsKgwqDCoMKgwqDCoMKgPSBUSElTX01PRFVMRSwNCj4gPiA+
ICt9Ow0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19k
ZWJ1Zy5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+
ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTE3
MGRjMmY5N2UNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+ID4gPiBAQCAtMCwwICsxLDggQEANCj4gPiA+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gPiArLyoNCj4gPiA+ICsgKiBD
b3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gKyAqLw0KPiA+ID4gKyNp
Zm5kZWYgX1hFX0NPTkZJR0ZTX0RFQlVHX0hfDQo+ID4gPiArI2RlZmluZSBfWEVfQ09ORklHRlNf
REVCVUdfSF8NCj4gPiA+ICsNCj4gPiA+ICsjZW5kaWYgLyogX1hFX0NPTkZJR0ZTX0RFQlVHX0hf
ICovDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5
cGVzLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4g
PiA+IGluZGV4IDkzNTA5N2FhZmE5Ni4uYzlkOTRhM2MyNmE3IDEwMDY0NA0KPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc190eXBlcy5oDQo+ID4gPiBAQCAtMjQsNiArMjQsOSBA
QCBzdHJ1Y3Qgd2FfYmIgew0KPiA+ID4gwqBzdHJ1Y3QgeGVfY29uZmlnX2dyb3VwX2RldmljZSB7
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGNvbmZpZ19ncm91cCBncm91cDsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIHNyaW92Ow0KPiA+ID4gKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUcpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgY29uZmlnX2dyb3VwIGRlYnVnOw0KPiA+ID4gKyNlbmRpZg0KPiA+ID4gwqANCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfY29uZmlnX2RldmljZSB7DQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB3YV9iYg0KPiA+ID4gY3R4X3Jlc3RvcmVfbWlk
X2JiW1hFX0VOR0lORV9DTEFTU19NQVhdOw0KPiA+ID4gQEAgLTU2LDQgKzU5LDggQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgeGVfY29uZmlnX2RldmljZQ0KPiA+ID4gKnhlX2NvbmZpZ2ZzX3RvX2Rl
dmljZShzdHJ1Y3QgY29uZmlnX2l0ZW0NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gJnhl
X2NvbmZpZ2ZzX3RvX2dyb3VwX2RldmljZShpdGVtKS0+Y29uZmlnOw0KPiA+ID4gwqB9DQo+ID4g
PiDCoA0KPiA+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUcpDQo+ID4gPiAr
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBjb25maWdfaXRlbV90eXBlIHhlX2NvbmZpZ2ZzX2RlYnVnX3R5
cGU7DQo+ID4gPiArI2VuZGlmDQo+ID4gPiArDQo+ID4gPiDCoCNlbmRpZiAvKiBfWEVfQ09ORklH
RlNfVFlQRVNfSF8gKi8NCj4gPiA+IC0tIA0KPiA+ID4gMi40My4wDQo+IA0KDQo=
