Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DFEC43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 03:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ED289264;
	Thu, 16 Jul 2026 03:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0BBfRBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076CD10E2A6;
 Thu, 16 Jul 2026 03:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784174357; x=1815710357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pPOr23gNdlVDZcKyG1wtTeohLW+p6iaPkkWoCa7bPRk=;
 b=V0BBfRBcTgEA8TuBsHKsRrd/zvZtivYDVbNkfxWJtF8UgywBrSUAdWB1
 za9MlE5K7ArdpxP8KnQinhQUq5vn4iIuHBnr7os2RUlvb/yKF/ATL0O/p
 maPDpHGRbSuj+haXxvMZWDfVV2a3gBPaviOi7GROdzogaG5FyHMR3cMeO
 Bu+NVPWdM5CROFNOM7UpY9enj4E/3GIW+9MMFzoVpXvvkr/onmxjhtWKh
 mOVTnfuiHsokT+WL+V65M2UFcvUeRKhKeEQwwNM3UjGdkGWpQ2KrNuCPh
 WpqQxHwgHNWvbZ8Is4olBzwx4EwstTD8XqWxUcb3Sq1V2bnk7xM4dIKGx Q==;
X-CSE-ConnectionGUID: LTVRqCJbQj2s5ZACf3xmmQ==
X-CSE-MsgGUID: +KxHlIIUTv+2l8CaE9cRvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95966561"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95966561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 20:59:17 -0700
X-CSE-ConnectionGUID: j7b1hScGTbOzcBIoYfUWwA==
X-CSE-MsgGUID: xYmx4QWMS36xDV92wn6ppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="250010877"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 20:59:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 20:59:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 20:59:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 20:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki8JngG2fsCYr6Vqp1aTMQoMhdAPLEqM90HRw+qkkAhrAw8n6QtDmIUfc7Z2fitlTlmZZZja8vaOIcwt899EwMth6/D6s5dB66sNum65KKUEY804Wwu3OdwLpKis1tsvhjuAFes6Yo8bOT00RG1ryUICSt7bRfWpwbMNvNjO4BoDV7TmuOGVuWWeNMH0OcT13Nl/7emQG/uvqy04Deufn9rqQ65nAmUNJoO6ouaVlQaTxv2A0B3Dl2YZ0EIB98xfQARldRlu4w7nIgLOrgxjS1S4VOoHbGiAagprbNN6hGGzD9cF2aZKUh/synJSX3FnR63l5ZB6YF4MKV1PQzLFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPOr23gNdlVDZcKyG1wtTeohLW+p6iaPkkWoCa7bPRk=;
 b=N0etp40AMno/Wnyd3Qz9Nx2/u+qGmFXTCOib5y3XSpYDCRD+qnLj+X+LwUD5RHff2gznUEtEa/nHlmMFEgOWhTfSlJzrEzoAqajCCs2ee5+kCT7cW8r1S4Lu38KEidPFRTkJwG6A0XMaft7cQrrYk8sj4WxxYM2Oy7jMvpKH+YXT22ryRtllUTqV6OvlKJqfUULr26azEfhsQKJuWje/MZ3/0/3yKejvrl/3lQOYtSLHzN2Qzfs9NGyoZqb/KH9QXM5nN8hUxfa6JT2561YfGyJIHmJIIXg6QmkoIN7ge8keXL9gCX4UtkmRCKLDPDBuvJDgbHI3yxiz0Y77qi0z7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:59:13 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:59:13 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/i915/cdclk: Use intel_cdclk_ppc() in
 intel_modeset_readout_hw_state()
Thread-Topic: [PATCH 1/4] drm/i915/cdclk: Use intel_cdclk_ppc() in
 intel_modeset_readout_hw_state()
Thread-Index: AQHdFFLW7zBdxdrqRkSwWxmJngQ8gLZvhZBA
Date: Thu, 16 Jul 2026 03:59:13 +0000
Message-ID: <IA1PR11MB64674FB77A284683898FBB8CE3C72@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
 <20260715120926.10786-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20260715120926.10786-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SJ0PR11MB6719:EE_
x-ms-office365-filtering-correlation-id: 2618ce02-64bb-4b78-8097-08dee2ee992a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|22082099003|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info: n7NIyg8EkAmx4ugFuX4BDEE0fdC+bAX4KmV4ntS8hUgtU497Qu8Kx3hb0hId+ansC0JD5DTn0n4BdTDQiU46jS3obcWuWR1CyYM1lNOM+Jaj7bpVyWMVnWD0AvivoA4z+h4/zT8gL09qNJFt0vkN/olBEMRHJpXhR5G/IKAzDpBHL2Smem7mq7cMatUwD3t9+Ld8ZkJk8t+8Py1xP5JpsohGqh3YmP8/ECpVfTiRRSfznvENT4RxXq13EiSt7rJ4bevV/f4TIq6r6APoK+4vb7BfqMslq6yyS/IffMJl0PQ7G3ntK48es3M11CZsifTSIGvU55qBbfV0MiU/99QocCxTnBIOA3PFpubX1awWa/A3WHGTLjURTB+tKRNN1DzkSjSO/oY5uBHaU3Imu/8n80JkhFsX9ARGWvwqYBF0BNqAjw2+I6JIRLdc639ZbTJQkkRciwmpmGqSEQRXtpBwH2X/0BTkw7A2C8ojfMThIzjx3JfAQInW5P91JUkfs7x87efBULrTFy9p3UXPK9opY/Jo5lqZJRgRvBFHKnrl2+8fljnVLHNh77YU5SPmCHE402swazz6mkuTobV7TLnNW4ipuRlr7PPchfEcycFVW6rQKGIOfw6hlIurkjJfNsJYZPB7FCyzOdpz6trhf7l47IkB8WqW4Itmwy4dxslc6FTJz6Wdg/YU/zrjVxSOJFzykc0xWCbxqRgVZWU5j1/KiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXR1NG54L0NGUE00eCtiTGV3S0NzN0VrcWhTUklVTDRBWFZqYm03NU03T1N2?=
 =?utf-8?B?YkQwYnZCNFpHMUlaY2kvUnJlandYamx5UG41RlRNd1VVTkhSZXVncVY5a2dO?=
 =?utf-8?B?UUt4Vy91akkwcjhHWjh1L1VBUGRZcmFMamVJd2kzUnVsK2g5N1NzcWVWRkpE?=
 =?utf-8?B?ajd5b0JLRDdXU01TZzA1Qi8weWNPbkQ3NEVFMzgyZG12dkJLQndvS0dqbm0r?=
 =?utf-8?B?dExNdnFpVi9td3ZFemoyQjlBR3pyaE9JbVJxYkJ1dFhmemFDTGtCRVB3ZFN4?=
 =?utf-8?B?TXF6RDZBM1o0Q0VFQjhYbjAwcVN4NE1XUFE0ZWZSbUpTZzY4a2VZQ25vN3cx?=
 =?utf-8?B?SGE2SGVqbHJDZGwrR2l2aXRLYVZFWGJPd3NxUk93a1NiZzVKSWV3Vks4Q0Er?=
 =?utf-8?B?YXlZRGo4VmF4MkdMZnJDM2tlMDMyK1VNUFZ4SVRxeXNhRlVrRFJqUFUzZXZz?=
 =?utf-8?B?Z2RiTnA3VEhhSFVKZnZ4QXBBbnhGRThLYWNpZ3dkemxpbld2aGVnb21PNktJ?=
 =?utf-8?B?RWFXNjQva3RyZllRaDBQSFpVRi9PQnh1b3R4L0JtODkrZXVURE5UeE5HKy9v?=
 =?utf-8?B?Snk0U2JVVFBGWjZBVm80Ky95VFI2QWVNM1dJSUNYNEJ5cE0xdDdyalJ5c2hy?=
 =?utf-8?B?SVhFcDBEWFA2VHVvaitvNVlkcUhoOWZsakpWc0Uxc0xpQ2diYm9SMW1YMVVv?=
 =?utf-8?B?TWVPT09qR25wWVk3YzZOQ2N6ZC9MakE0VHNhUEgrQi9uM3pQWkVkVTZzUnly?=
 =?utf-8?B?Q1ZWTmRrSDJUWi9RR1NuVGdibkhSejJVNmZRcVB0eFZLNnkvNHZtRUdNL2Rn?=
 =?utf-8?B?dmlwdk5YMzZLanZkZ3cvaHZudzJ2ZHFQMFFmMjYrL1Uwb3RTcjlUNEYyZVp0?=
 =?utf-8?B?OXAyV2hBWTRNQ2lZaTM5UmlHQVE2YzcwS2Zsd0w0d2ozc3B1V2lsSnVsU2dH?=
 =?utf-8?B?eHRzd2NDSDVyQ2d2WEk4bnFpbTVuZy8rcVBESGoyNFhuL2FPRU04L0Y1RXV1?=
 =?utf-8?B?bTJsMzVqQ0wwSkVlYzROUDc2dDBmdWJJN3hYY2laWHBYYll0UzJqUnhrb1RI?=
 =?utf-8?B?T1RoVlYyOGF1cFNnQ3BWck5IdXNWVnRDWXFoR3E4djJyRDM2OFJnSzNaZTJ1?=
 =?utf-8?B?VjN5c3JMaDZrdGFEazhLT1FzcXpsVTJlcGdFbHpzd3A4UmhFSEYyY09ycHhE?=
 =?utf-8?B?R0NzeFR3VjZmWW9aSlNIQkI0RDEyQjNCcDlwTG82aFpRTmFRMVBkTURjKzVO?=
 =?utf-8?B?SmJhQjRQdVV6Umd2Wlo5VTJRTjc5em9TWWtlTnFrLzVWVXlSeFkvZTRNVDFN?=
 =?utf-8?B?Yks5eEpJRGNPbGRVTTA3Qmx0eU1SeGJ4eWp1eHBRTjFZOUJRSWllSkxPYUZI?=
 =?utf-8?B?T0xvb2VaczNvTG9ZeEpvcXJQdk1aZnc2Qk1yS29TYWN2YkNNbFNsb0dYaGlj?=
 =?utf-8?B?c2JFUDhkenI0bkk3OTZYL3hwQmc4WjdBWXQ2dUNZRlMyRE03cEV4a2VrdEFp?=
 =?utf-8?B?WVZhTld4b3Nzb3pOREo4VDFXaG5USnRUYW1HU2V0R0NKaEcyQmp6S3l0bVBP?=
 =?utf-8?B?R3pGb2xiQ2FFWDlvVVM5cEFPRUt3Y1JMTHBBc3BIeTBwd1luZHo5cWlweXRZ?=
 =?utf-8?B?MDZuVjF4Rkd4bWd3Y0o4elkzSFJRQUkweVE4dlBQY1dvZXpsK09kN3lNdXV2?=
 =?utf-8?B?WjdoK1oxclQrcjNoaDdxWm5jRHZJNjVuRjRTK0lMeTBzaFdwYnppanlxd2VV?=
 =?utf-8?B?N0ZjWDRielVjTVhLY013NGxMZGZMVzFraFpvMWI1MDA0ZktoSW10RmtPclZ3?=
 =?utf-8?B?Nmc2YmVlSW1LQk9IMngxbHJFZUJYbnh4YkYrZmVFeEVqNHlLdE51U29IcE5W?=
 =?utf-8?B?TElHN1E0bEpxYWErRE5xazBxMFRlK1Y2bjRISmhpbkNIWWx2V2p2ZTNtT3Rl?=
 =?utf-8?B?M1dxbmNtY3IvQytIVkx4TmYzSE0xakU3M3pIeis1RkVDcGdRZHQ3YlVqRUZz?=
 =?utf-8?B?elZDZFgvc3U4U29BcXFDdnNPY3NqS0VNbVhMRi9aejB6MHVoQVorMGQ5Vml5?=
 =?utf-8?B?N05pZVQvS0lWckZMb3Z3RDRhRkdseEhNTit0UXpTU1RhZXhBTzdpdXdHTUV4?=
 =?utf-8?B?M3Q4NW5LZXV4aDlYQU1jc253OVU3RE9RQzh0SDF6YUdQSDNaZDlldFY5WXZw?=
 =?utf-8?B?Tlo5U2JGR1Yxa1dEdU5NOWpNWGxLV3Zsa0xoelBkR3NBdXVlSHExcitQUTZQ?=
 =?utf-8?B?dWszaHJOdUJiQklOdFFNaUJtQnpqVnpodUFWZXRjd2ZQZ2lZamlzSzVWK2pS?=
 =?utf-8?B?SVFhR3BGVjNMZ0FRc3hGa0Rnai9UdkNMZkxxaVMvSmxUamhsTGFVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hl4EBVmrcWWem3MVIgGBXx43OSpcPh26JCHyiG72dyODNnUW/1wYTsr9xYZbvz7WalDGBPmSLAAAxWs1DCwN26JG7RF9ZULUmneryJP3uoTXb1GTHQ2mInD8QhKpUe3+rwTf5wNXWuInjdOPFB0mWsw9rFcmshlwPRH3EZotGTxiMumXGbrHtT90EeZN0yHhEiFIqwYhxBsKWGu33Ls4kZkHGvNfxOdMiWSIOWNJ0Wn+8w7QN3y40mqM1ZodEoh7gKDg5TZe+h76OhSIIfQY/X2JBcGyu0hQary22vc/e1BO53GB17XaEdwB0erQLUtZtXOqNgs+Q7zfxGdQVWirpQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2618ce02-64bb-4b78-8097-08dee2ee992a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 03:59:13.2451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVbRYs6gVelNlRFjDLPQMD2FJPBwENPHHDGdw1gbdht1NMlKEipgW6WYrFNuJJbGmsixcLNSyXlFL09SIKhZvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZQ0K
PiBTeXJqYWxhDQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNSwgMjAyNiA1OjM5IFBNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDEvNF0gZHJtL2k5MTUvY2RjbGs6IFVz
ZSBpbnRlbF9jZGNsa19wcGMoKSBpbg0KPiBpbnRlbF9tb2Rlc2V0X3JlYWRvdXRfaHdfc3RhdGUo
KQ0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gDQo+IFJlcGxhY2UgdGhlIGhhbmQgcm9sbGVyIGludGVsX2NkY2xrX3BwYygpIHdp
dGggdGhlIHJlYWwgdGhpbmcgaW4NCj4gaW50ZWxfbW9kZXNldF9yZWFkb3V0X2h3X3N0YXRlKCku
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfY2RjbGsuYyAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY2RjbGsuaCAgICAgICAgIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9tb2Rlc2V0X3NldHVwLmMgfCAxMiArKysrLS0tLS0tLS0NCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiBpbmRleCBkM2M1ZTM0
MzhkMTkuLjFkN2ZmMmNiYWViYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY2RjbGsuYw0KPiBAQCAtMjkwOCw3ICsyOTA4LDcgQEAgaW50ZWxfc2V0X2NkY2xr
X3Bvc3RfcGxhbmVfdXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlKSAg
fQ0KPiANCj4gIC8qIHBpeGVscyBwZXIgQ0RDTEsgKi8NCj4gLXN0YXRpYyBpbnQgaW50ZWxfY2Rj
bGtfcHBjKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LCBib29sIGRvdWJsZV93aWRlKQ0K
PiAraW50IGludGVsX2NkY2xrX3BwYyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwgYm9v
bCBkb3VibGVfd2lkZSkNCj4gIHsNCj4gIAlyZXR1cm4gRElTUExBWV9WRVIoZGlzcGxheSkgPj0g
MTAgfHwgZG91YmxlX3dpZGUgPyAyIDogMTsgIH0gZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY2RjbGsuaA0KPiBpbmRleCAxZmY3ZDA3OGI0MmMuLmE2MGNiZjc0NWVl
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNs
ay5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuaA0K
PiBAQCAtMjIsNiArMjIsNyBAQCBzdHJ1Y3QgaW50ZWxfY2RjbGtfY29uZmlnIHsNCj4gIAlib29s
IGpvaW5lZF9tYnVzOw0KPiAgfTsNCj4gDQo+ICtpbnQgaW50ZWxfY2RjbGtfcHBjKHN0cnVjdCBp
bnRlbF9kaXNwbGF5ICpkaXNwbGF5LCBib29sIGRvdWJsZV93aWRlKTsNCj4gIHZvaWQgaW50ZWxf
Y2RjbGtfaW5pdF9odyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSk7ICB2b2lkDQo+IGlu
dGVsX2NkY2xrX3VuaW5pdF9odyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSk7ICB2b2lk
DQo+IGludGVsX2luaXRfY2RjbGtfaG9va3Moc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkp
OyBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9tb2Rl
c2V0X3NldHVwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX21vZGVz
ZXRfc2V0dXAuYw0KPiBpbmRleCBlMjdhNTMxZTFhYTIuLjE0ZDgyOTE3MWM3ZCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9tb2Rlc2V0X3NldHVwLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9tb2Rlc2V0X3NldHVw
LmMNCj4gQEAgLTg1NCwxNCArODU0LDEwIEBAIHN0YXRpYyB2b2lkIGludGVsX21vZGVzZXRfcmVh
ZG91dF9od19zdGF0ZShzdHJ1Y3QNCj4gaW50ZWxfZGlzcGxheSAqZGlzcGxheSkNCj4gIAkJCSAq
IEZJWE1FIGRvbid0IGhhdmUgdGhlIGZiIHlldCwgc28gY2FuJ3QNCj4gIAkJCSAqIHVzZSBwbGFu
ZS0+bWluX2NkY2xrKCkgOigNCj4gIAkJCSAqLw0KPiAtCQkJaWYgKHBsYW5lX3N0YXRlLT51YXBp
LnZpc2libGUgJiYgcGxhbmUtPm1pbl9jZGNsaykgew0KPiAtCQkJCWlmIChjcnRjX3N0YXRlLT5k
b3VibGVfd2lkZSB8fA0KPiBESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAxMCkNCj4gLQkJCQkJY3J0
Y19zdGF0ZS0+cGxhbmVfbWluX2NkY2xrW3BsYW5lLQ0KPiA+aWRdID0NCj4gLQkJCQkJCURJVl9S
T1VORF9VUChjcnRjX3N0YXRlLQ0KPiA+cGl4ZWxfcmF0ZSwgMik7DQo+IC0JCQkJZWxzZQ0KPiAt
CQkJCQljcnRjX3N0YXRlLT5wbGFuZV9taW5fY2RjbGtbcGxhbmUtDQo+ID5pZF0gPQ0KPiAtCQkJ
CQkJY3J0Y19zdGF0ZS0+cGl4ZWxfcmF0ZTsNCj4gLQkJCX0NCj4gKwkJCWlmIChwbGFuZV9zdGF0
ZS0+dWFwaS52aXNpYmxlICYmIHBsYW5lLT5taW5fY2RjbGspDQo+ICsJCQkJY3J0Y19zdGF0ZS0+
cGxhbmVfbWluX2NkY2xrW3BsYW5lLT5pZF0gPQ0KPiArCQkJCQlESVZfUk9VTkRfVVAoY3J0Y19z
dGF0ZS0NCj4gPnBpeGVsX3JhdGUsDQo+ICsJCQkJCQkgICAgIGludGVsX2NkY2xrX3BwYyhkaXNw
bGF5LA0KPiBjcnRjX3N0YXRlLT5kb3VibGVfd2lkZSkpOw0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6
IE5lbWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQoNCj4gIAkJCWRybV9kYmdfa21z
KGRpc3BsYXktPmRybSwNCj4gIAkJCQkgICAgIltQTEFORTolZDolc10gbWluX2NkY2xrICVkIGtI
elxuIiwNCj4gIAkJCQkgICAgcGxhbmUtPmJhc2UuYmFzZS5pZCwgcGxhbmUtPmJhc2UubmFtZSwN
Cj4gLS0NCj4gMi41NC4wDQoNCg==
