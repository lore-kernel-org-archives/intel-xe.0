Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE17FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 16:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C75110E813;
	Mon, 27 Apr 2026 16:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+uYxxo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9A710E813
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777307425; x=1808843425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dwry4/MFP25MNLmXsRgLGGdR6fjzIdpv7OQ5y/h58m8=;
 b=O+uYxxo7+TIMSZXbr20UOGBIJob5SurizB9xkhWx9nEYYdmYl2f578Xa
 qrMx66uIIytZfnG4cWn9aYbNFvjbN2gYuZaHIP/Q80PcYUHXOiAgXTDW+
 T5BTpuN6NNagA0ygeR5cqU2DpoI8pOB2DpZ4HvbHoEJrHYUcI5a6caEbo
 EaXGZGZgiNUmvfp40cEbSp2Zx669GuqBCMMLrPD+UQbtBKDp1Hy+G17RL
 r02wFWJAISqH4m/t3vdCywCxwwYP5kd7Tli/a+Lw3MM+asJitmN6jd14p
 0M6wD5O1C1WhcyFumGCMKiPvby38eZKLlx/OUgFnwwl7X/OfT/CJDxZJU w==;
X-CSE-ConnectionGUID: wA4JHpeQRY26/uHvCPbU/w==
X-CSE-MsgGUID: aVkDLuqcQISbRCGmTxxffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95763994"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="95763994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:30:24 -0700
X-CSE-ConnectionGUID: ek40kHBkSMq3tm9B0XVQJw==
X-CSE-MsgGUID: d0f6MWZDSZydnNShYpMzYQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:30:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:30:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 09:30:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 09:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxYwbz9F6tv7Rtoafp0azXamSRNKwVKWQYxUPD/YpR9sncThttXFAQBECpCMZPVwHHNmOGzQRrfY1sHNJRy3l0pBkQadeTNgECs/e/7B7N1nKiAv21l40RoPzX7gxfW7VDrydxS905e+VK9pYmHDEGBMEdCQAvxv7EHtwtR4gVj+DUZ0kPJ1BWaPmP3HZ9WpN7fuRn6BGNtKynO94oSbIgSReuuq4q/fky3rO2/JlRxXZuSv+NgPvQwqEgjRdahOODNUReer+JMcQCMWk/LO23MwSCz1g0RTFKRhLFI1CneVtnzVi5mKmjTvYZZ6d57aVqF3WSKj4Iw2XEvZ7gKmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwry4/MFP25MNLmXsRgLGGdR6fjzIdpv7OQ5y/h58m8=;
 b=U9TkUxgk+5BAIzMIq8X8inI2zoLrWpW16S0RbcEQrSKczfDGx1dfzDEJiaG0u3sxtT5RRkXDfpo/mbrX/T7Y7MrnoDFJB7tWMdwkSidUAVlO7nL/aLbLCXahgMUamXiE8Cng3VL/a5zqJpr+qvOPfoVTUNlRXgvcFzpGB6mwlIVyZSQUn71Kdb0ugxQjxZTo2ur1PLeu6BoAs5aRmr+UsX9aZ/p26TzMwJPSgWUQHpateDijE2Cw5IIS/7pMkqE4Kz1uh/hFB6nHAz3coig5zH6zKyD1ITbRdYSyfgcBAaG7c6HtLoT7XwKIWNWrgJxzumL+G1+0dFBI1exf4SGEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS4PPF706C623D2.namprd11.prod.outlook.com (2603:10b6:f:fc02::2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 16:30:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 16:30:11 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
Thread-Topic: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
Thread-Index: AQHc1CwN8PUNEpfbV0esMYduPGGoQrXzGQlQ
Date: Mon, 27 Apr 2026 16:30:10 +0000
Message-ID: <DM4PR11MB545671AE0E0F142BC6959768EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-1-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-1-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS4PPF706C623D2:EE_
x-ms-office365-filtering-correlation-id: 8f8c2754-ff17-4030-9f3f-08dea47a4097
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: NAuMCuACnHlijRxRXJebjeqjHlYnXZtnml5hG6E3n/8iIekrV8tvW/xSOeurDasLGLXmRM9CRHHg9KhkP5808mO21LnzC/pc6PgEsFXmKzSb04oYkEfCHgnwguKNQhUwYY7D3hdlDlC2qZzq3lSpleOhwHzJu5gA6SMnIlGbjU8rSkMZHXpZ4k5ejR3NiJ8MaA8j36J8Gtpv/uf1Iecd1cuo2TQ8RPcmrVN8iLr+knYw4SqU7N+RUe15lPzw35AUC2MBCYbTUpVyjJRC69j9lgE0IxwRqHgzUgC0EM6ZaSpF+nUlaEIDk5R2U7/x+tFNEW9swC6BFPuBAttya2ZBjOTRpKbSI7hJCVp+35kXjAr1KlxTFiOiG9h237u5upc/0XTKkOEYcTzbo1K+pm7HaSLiFM9ISeP0NOBI2emqCU4Tj/TgZvXBA5Zrjyt3bF+Fa2CQt2UmliygBJ3fRAF9ywRreemPY7l9fA1lfQgkkq8PoIix5eihZdXkXYTuXv/S/ox1LK88rw2gzItGkurEsJ1J82ZMlC2ysevAatkVsxLN54JjE6GhJy0nL1xctWgOjySLOXV37/7v7Ph9PsqwWf3VyqiIc5CChCeSuC+Mq381L4NpWz8LSJvoSpX1JYLtofsjUjG2+DCNII1mwVnEwuxEIhG7SQC7Um3VNJv8Qc9c68oafLJpNHSfx0UFyQm12YtgM+KLLtO+tmRN+5b8saBt09NnNIXDG53I2lUXQz7slOaWVii2+d4X4sbIaMxYVGRSJYpatLKG3kG0lF3L0q1fU7PgCM8wTd1h8BHb9xo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnRFRHlRS0ZZSUt0aTd2RnJBMThoNzNFcG15WnhMZHliazR3YWhIODNCM2Qy?=
 =?utf-8?B?NFcwazZabVlMNThsUG5pU0VOUXVyWVF2aWRSdnhQTUZyS0ZHRHJwM05mRmY0?=
 =?utf-8?B?N0t4ajFjRC91TEtzTy9UcXhxcmRmQkg2MFc5SVc5b2JHSzRtSkxadzNtUDIy?=
 =?utf-8?B?WC9Xb3dSZ1poWlJGb1dDMllkbkhMVDc1SlNKRTUwRTJBRisySzJqSnNQam1R?=
 =?utf-8?B?KzhmVGdrbGx5Wk9RZG1NSW5PUnBSUThtZDVjc2pLTDk0T2VYb3Zud2VHRGNx?=
 =?utf-8?B?TWJKMXRpaUxMUmpiSmRyOWhXbmFUR2VwVXpXY2YrOFBJWjVtY0VZTktLMGda?=
 =?utf-8?B?SFhwQXFFRjNQZFU5UUFxL3liMk4yZFFWeDBGejFwRVh1ZGcvRldoTHpBRG5p?=
 =?utf-8?B?VmpDa0dvYXk1V2NwdFpOQmVSKzk4M2dhTlU4dmswS2grbCtDVDFhR3FQUjEx?=
 =?utf-8?B?dU9RbUNkUXpLK0FKdEQzRTI5ek02SlQwdGJ3dFJlR25IZGd3M2RsVVRRLzdX?=
 =?utf-8?B?aVlxRjgzQUJFRDZRUXpRZVMyNFNVd3E1TlozQ0t0QVNvcWZkeGNFMTZzTUJW?=
 =?utf-8?B?c2lmYllKRDE0UVNZcHd4TjNKRVg3ZVBvZ3g4WVFoalFLc1NQVXdwZXJ1bjkz?=
 =?utf-8?B?UnlnUEhKNFVyeCtPMGlyZDJtdlUvU3dZM1A0V0VyOXA0Y2VoVkdRbHZkZGZX?=
 =?utf-8?B?dTIxYWkrMXNVcldvaGQ0U0pRQTE1NGl1WTQyVzJ4WC9XcWtuT0plaldGT1hp?=
 =?utf-8?B?OTNiSFRNNEVSSS9NaERBZ0tuMDQvZ1JJNWRqSHROZnd0TE5RMzZRSXpVT05l?=
 =?utf-8?B?RmdvT2MraWpHMmpjbXNENDkrR2grNzdnUzh6MVN3eW80SURlZnNHNlh4R1pp?=
 =?utf-8?B?aG5KTEcyVnAyblE5ZzZacDNrNDNjbWYwY1NEa2hQTHpScVpjKzZ3cHNoVG02?=
 =?utf-8?B?SW9BdTBLWnpUb2p2MnpoZHlqZUh2L3FMSW9xSldPQkMzV1RRK0xFYkNYUng4?=
 =?utf-8?B?VGdiQlNIQlUwVG9VakVUaURsSWlsZzRNWUJ1RDMyVmFmZ2REb1VWRWVMOXdr?=
 =?utf-8?B?TDY4ZnMzVGlYZ1NxMll3WFVvV3BwbjllS212TXR1ajZBNkVnN0cyNHFFa3Az?=
 =?utf-8?B?M0Z6Y1VudXU4TVVhbHNzSEhDK2NnWXloaFRJMDVCWEdhMm1rZzJLQlcyekJt?=
 =?utf-8?B?bVVUOUdVMEpkZzNEMnlNcWNTNlhxVElnV2M3Q0daNDRXMURYd0RXb0FZbnR3?=
 =?utf-8?B?ZWRsQktpNkk0SlZEL04vbmc1YmpKNmJMNkNIVUhna1N3OGpyaU9BakJOUTFu?=
 =?utf-8?B?OXFlMDcvUzlvb2lUdndWZ0MwdmxmYkxPZmMrdU1OeWd4U2E1b3FqTlo4WU9Z?=
 =?utf-8?B?ajZ0V2hPdXRJbXp3djRyQ3c3aXlWaVpCLzFyK3dFbEN2bHh2TWExajNJM21Q?=
 =?utf-8?B?cjBUc044V0E4TWdwRVlFODQ4WW9Cekp0KzNNeTNqRGZldzFkRk1qRXg5eEMz?=
 =?utf-8?B?MmhWZFJHdjJ4YVRYOEQzM0c2d0lOQ0srYm5MZ3YzeFJibmJid0hUNDluK1Y5?=
 =?utf-8?B?ZXIwZ3NtN253SVdZUmlUb1VpSjlKRWhmSkVacjZmVkZjZDlaOUVNY1Rwd2J3?=
 =?utf-8?B?RGpobzR6ZnJuSU5NL1VpalhDWit5S0ZzZmdXREdidlg2U2hQZVNVbEdFT0o3?=
 =?utf-8?B?K0I4cWVMRmFTdlZ2a1ZLNm8xdnlJTm9EUUdjSXU3ajM3QVRwL2FSaG1Nbnh4?=
 =?utf-8?B?S29qbGJUT0hIRm9FNWhRbjdTcVRkODVRODlqRUlhYTlqZENQRktjQ1dzZHRj?=
 =?utf-8?B?c0l4bmkwdUViWnZCTlFnWHgvdzhTeE84M3V2YmQwNDl2Tzc2Y2hkRlpRSlcv?=
 =?utf-8?B?WlNZdXhpUWZIb0VPMFJ4Y29oaHh6enM3ZENUejZ5b201SDlpamhKdkE0T25B?=
 =?utf-8?B?NDczbXgxU01obEliMGRhdC93Zzd6K1RmTFE2Tm9FdVp5cHdhSXlsdHBheXl4?=
 =?utf-8?B?K0pOZDcxcjYyaEVGeGc3cmMyWHp1bVNFcWdxcjFkNTBCeEE3UzdaenhBVUdO?=
 =?utf-8?B?V0xUYWh5QmxPRjBNNG84dEVKNDRxV2pvR2NpNEdrWExQL2ZiYTZoUEIrRjZT?=
 =?utf-8?B?QmJOSDhUeFJCSlRtM2dQWEtQQUhnUXpFaXkxeDlMMDFOQlRKb2NUZnkvRTVO?=
 =?utf-8?B?Rk5wR3V6Qks4a2pjVTVCdk5hNEVPNEo5anl0QUxnYnZTWVB5SENBOHBNN3oz?=
 =?utf-8?B?TEsyY0FXeklnYWdHM3c0VXc2ZHBpK2Yvc3Y1d2czV2JibFhGYm1KdW9mcENN?=
 =?utf-8?B?WURzN3UvRFR5VXNGdjRzMXA3SGNNTzh6bFFNYWNqVFU5dEljejQ1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KJX1YGiuAWs1NM5qwR72ZuDMAd5zwE8nwdFUdU35LzzrWHZSxQgMcnPKy3Ni+ptjPygM6dJlQKDrHtcXybeQFtxkT1uy7AWZFnK8xo0c/dwUWRCXzozPD0CHk5Qa7CZFExlG4Q24dCQB1yX+F9eisgSC+zdtN6TCqKHgvHmhulEuFs6JVo7TeGClIsU64sPqRYF0YlJoA8uIKhbRk0uChs+cphgCKie0PNWxeoc4jOxB4Dp//UeUZ1wyKbCxWQbPoji7M5UrgArkhrPtqKjWgdQHFt8j+nzSaH29gSTa3L6w5Ivo2p0xans/xraYxekxqEH9WAaX3SljdvXJX41Nlg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8c2754-ff17-4030-9f3f-08dea47a4097
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 16:30:10.9805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s12remXmNE7cq/zS+K1Wpa1yu4aSIA1GF5cXfLvSYl7JaZytzNUGUDEGtn17zm0uGwTRsmQ4rKPxRkzqJpvkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF706C623D2
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBNb3N0IHJl
Z2lzdGVyIHByb2dyYW1taW5nIGZvciBlbmdpbmUgc2V0dXAgaGFwcGVucyB2aWEgUlRQIHRhYmxl
cyBpbg0KPiBod19lbmdpbmVfc2V0dXBfZGVmYXVsdF9zdGF0ZSgpLiAgTW92ZSB0aGUgcHJvZ3Jh
bW1pbmcgb2YgUkNVX01PREVbMF0NCj4gd2hpY2ggZW5hYmxlcyB0aGUgcGxhdGZvcm0ncyBDQ1Mg
ZW5naW5lKHMpIHRoZXJlLiAgVGhpcyBib3RoIG1ha2VzIHRoZSBjb2RlDQo+IG1vcmUgY29uc2lz
dGVudCAob3RoZXIgUkNVX01PREUgcmVnaXN0ZXIgcHJvZ3JhbW1pbmcgaXMgYWxyZWFkeQ0KPiBo
YXBwZW5pbmcgaW4gdGhpcyBSVFAgdGFibGUpIGFuZCBpbXByb3ZlcyBkZWJ1Z2dhYmlsaXR5IChz
aW5jZSBSVFAgY29udGVudHMNCj4gYW5kIGNoZWNrcyBvZiB0aGVpciBjb3JyZWN0IHByb2dyYW1t
aW5nIGFyZSBleHBvc2VkIHZpYSBkZWJ1Z2ZzKS4gIEl0IGFsc28NCj4gaGVscHMgY29uc29saWRh
dGUgdGhlIHJlZ3VsYXIgZHJpdmVyIGluaXRpYWxpemF0aW9uIHBhdGhzIHdpdGggdGhlIHZlc3Rp
Z2lhbCBhbmQNCj4gY3VycmVudGx5IHVudXNlZCBleGVjbGlzdCAoaS5lLiwgbm9uLUd1QykgaW5p
dGlhbGl6YXRpb24uDQo+IA0KPiBXaXRoIHRoZSBvcmlnaW5hbCBwcm9ncmFtbWluZywgdGhlIFJD
VV9NT0RFIHJlZ2lzdGVyICh3aGljaCBpcyBhIHNpbmdsZQ0KPiBnbG9iYWwgcmVnaXN0ZXIsIG5v
dCBhIHBlci1lbmdpbmUgcmVnaXN0ZXIpIHdhcyBnZXR0aW5nIHJlLXByb2dyYW1tZWQgd2l0aCB0
aGUNCj4gc2FtZSB2YWx1ZSBkdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uIG9mIGVhY2ggQ0NTIGVu
Z2luZS4gIFdoZW4gbW92ZWQgdG8gdGhlDQo+IFJUUCB0YWJsZSwgd2UgdXNlIHRoZSB4ZV9ydHBf
bWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUNCj4gbWF0Y2ggZnVuY3Rpb24gc28gdGhhdCBp
dCB3aWxsIGp1c3QgYmUgcHJvZ3JhbW1lZCBvbmNlLCB3aGlsZSBkb2luZyB0aGUNCj4gaW5pdGlh
bGl6YXRpb24gZm9yIHRoZSBmaXJzdCBSQ1MvQ0NTIGVuZ2luZSwgd2hpY2ggYXZvaWRzIHRoZSBy
ZWR1bmRhbnQgYW5kDQo+IHVubmVjZXNzYXJ5IHJlcGV0aXRpb24uDQo+IA0KPiBXZSBjYW4gYWxz
byBzYWZlbHkgZHJvcCB0aGUgZXhwbGljaXQgYWRkaXRpb24gb2YgUkNVX01PREUgZnJvbSB0aGUg
R3VDIEFEUw0KPiBzYXZlLXJlc3RvcmUgbGlzdCBub3cgc2luY2UgYWxsIHJlZ2lzdGVycyBwcm9n
cmFtbWVkIHZpYSBSVFAgdGFibGVzIGFyZQ0KPiBhdXRvbWF0aWNhbGx5IGFkZGVkIHRvIHRoZSBH
dUMncyBsaXN0Lg0KPiANCj4gdjI6DQo+ICAtIE9ubHkgZW5hYmxlIENDUyBlbmdpbmVzIG9uIFhl
X0hQIGFuZCBsYXRlci4gIEV2ZW4gdGhvdWdoIFhlX0xQDQo+ICAgIHBsYXRmb3JtcyB0ZWNobmlj
YWxseSBoYXZlIGEgQ0NTIGVuZ2luZSwgaXQncyBuZXZlciBiZWVuIGVuYWJsZWQgb24NCj4gICAg
aTkxNSBvciBYZSBkdWUgdG8gb3RoZXIgaXNzdWVzIG9uIHRoZXNlIG9sZCBwbGF0Zm9ybXMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jICB8ICA0IC0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgICB8ICAxIC0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyB8IDExICsrKysrLS0tLS0tDQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXhlY2xpc3QuYw0KPiBpbmRleCAxZjhkMzU4ZTYwZmQuLjAyNmExZWMwYzg2OCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gQEAgLTU5LDEwICs1OSw2IEBAIHN0YXRp
YyB2b2lkIF9fc3RhcnRfbHJjKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwNCj4gc3RydWN0IHhl
X2xyYyAqbHJjLA0KPiAgCQlscmNfZGVzYyB8PSBGSUVMRF9QUkVQKFNXX0NUWF9JRCwgY3R4X2lk
KTsNCj4gIAl9DQo+IA0KPiAtCWlmIChod2UtPmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19DT01Q
VVRFKQ0KPiAtCQl4ZV9tbWlvX3dyaXRlMzIobW1pbywgUkNVX01PREUsDQo+IC0NCj4gCVJFR19N
QVNLRURfRklFTERfRU5BQkxFKFJDVV9NT0RFX0NDU19FTkFCTEUpKTsNCj4gLQ0KPiAgCXhlX2xy
Y193cml0ZV9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCwgbHJjLT5yaW5nLnRhaWwpOw0KPiAg
CWxyYy0+cmluZy5vbGRfdGFpbCA9IGxyYy0+cmluZy50YWlsOw0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2Fkcy5jIGluZGV4IDkyYzY5ODFmZTIyMC4uZDA0OTdkOWY0M2EyDQo+IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gQEAgLTc0OCw3ICs3NDgsNiBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IGd1Y19tbWlvX3JlZ3NldF93cml0ZShzdHJ1Y3QNCj4geGVfZ3VjX2FkcyAqYWRz
LA0KPiAgCQl7IC5yZWcgPSBSSU5HX01PREUoaHdlLT5tbWlvX2Jhc2UpLA0KPiAJfSwNCj4gIAkJ
eyAucmVnID0gUklOR19IV1NfUEdBKGh3ZS0+bW1pb19iYXNlKSwNCj4gCX0sDQo+ICAJCXsgLnJl
ZyA9IFJJTkdfSU1SKGh3ZS0+bW1pb19iYXNlKSwJCQl9LA0KPiAtCQl7IC5yZWcgPSBSQ1VfTU9E
RSwgLnNraXAgPSBod2UgIT0gaHdlX3Jjc19yZXNldF9kb21haW4NCj4gCX0sDQo+ICAJCXsgLnJl
ZyA9IENDU19NT0RFLA0KPiAgCQkgIC5za2lwID0gaHdlICE9IGh3ZV9yY3NfcmVzZXRfZG9tYWlu
DQo+IHx8ICF4ZV9ndF9jY3NfbW9kZV9lbmFibGVkKGh3ZS0+Z3QpIH0sDQo+ICAJfTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCAyZjljMWMwNjNmMTYuLjc0ZjI5MDI1
ZGQ2YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBAQCAtMzI1LDE0ICsz
MjUsOCBAQCB1MzIgeGVfaHdfZW5naW5lX21taW9fcmVhZDMyKHN0cnVjdA0KPiB4ZV9od19lbmdp
bmUgKmh3ZSwgc3RydWN0IHhlX3JlZyByZWcpDQo+IA0KPiAgdm9pZCB4ZV9od19lbmdpbmVfZW5h
YmxlX3Jpbmcoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKSAgew0KPiAtCXUzMiBjY3NfbWFzayA9
DQo+IC0JCXhlX2h3X2VuZ2luZV9tYXNrX3Blcl9jbGFzcyhod2UtPmd0LA0KPiBYRV9FTkdJTkVf
Q0xBU1NfQ09NUFVURSk7DQo+ICAJdTMyIHJpbmdfbW9kZSA9DQo+IFJFR19NQVNLRURfRklFTERf
RU5BQkxFKEdGWF9ESVNBQkxFX0xFR0FDWV9NT0RFKTsNCj4gDQo+IC0JaWYgKGh3ZS0+Y2xhc3Mg
PT0gWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUgJiYgY2NzX21hc2spDQo+IC0JCXhlX21taW9fd3Jp
dGUzMigmaHdlLT5ndC0+bW1pbywgUkNVX01PREUsDQo+IC0NCj4gCVJFR19NQVNLRURfRklFTERf
RU5BQkxFKFJDVV9NT0RFX0NDU19FTkFCTEUpKTsNCj4gLQ0KPiAgCXhlX2h3X2VuZ2luZV9tbWlv
X3dyaXRlMzIoaHdlLCBSSU5HX0hXU1RBTSgwKSwgfjB4MCk7DQo+ICAJeGVfaHdfZW5naW5lX21t
aW9fd3JpdGUzMihod2UsIFJJTkdfSFdTX1BHQSgwKSwNCj4gIAkJCQkgIHhlX2JvX2dndHRfYWRk
cihod2UtPmh3c3ApKTsNCj4gQEAgLTQ2NSw2ICs0NTksMTEgQEAgaHdfZW5naW5lX3NldHVwX2Rl
ZmF1bHRfc3RhdGUoc3RydWN0DQo+IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiAgCQkgIFhFX1JUUF9B
Q1RJT05TKFNFVChDU0ZFX0NISUNLRU4xKDApLA0KPiBDU19QUklPUklUWV9NRU1fUkVBRCwNCj4g
IAkJCQkgICAgIFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiAgCQl9LA0KPiAr
CQl7IFhFX1JUUF9OQU1FKCJFbmFibGUgQ0NTIEVuZ2luZShzKSIpLA0KPiArCQkgIFhFX1JUUF9S
VUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyNTUsDQo+IFhFX1JUUF9FTkRfVkVSU0lPTl9V
TkRFRklORUQpLA0KPiArCQkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9v
cl9jb21wdXRlKSksDQoNCklmIGNjcyBpcyBkaXNhYmxlZCBieSBjb25maWdmcywgd2lsbCB0aGVy
ZSBiZSBhbnkgc2lkZSBlZmZlY3QgdG8gcHJvZ3JhbSBpdD8NCg0KT3RoZXIgY29kZSBMR1RNLg0K
DQpTaHVpY2hlbmcNCg0KPiArCQkgIFhFX1JUUF9BQ1RJT05TKFNFVChSQ1VfTU9ERSwNCj4gUkNV
X01PREVfQ0NTX0VOQUJMRSkpDQo+ICsJCX0sDQo+ICAJCS8qIFVzZSBGaXhlZCBzbGljZSBDQ1Mg
bW9kZSAqLw0KPiAgCQl7IFhFX1JUUF9OQU1FKCJSQ1VfTU9ERV9GSVhFRF9TTElDRV9DQ1NfTU9E
RSIpLA0KPiANCj4gWEVfUlRQX1JVTEVTKEZVTkMoeGVfaHdfZW5naW5lX21hdGNoX2ZpeGVkX2Nz
bGljZV9tb2RlKSksDQo+IA0KPiAtLQ0KPiAyLjUzLjANCg0K
