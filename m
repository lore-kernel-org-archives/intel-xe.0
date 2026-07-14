Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013AAC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 22:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94A10E0DA;
	Tue, 14 Jul 2026 22:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtM6hWfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC7C10E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784067345; x=1815603345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMVq5gtZjCZLla0h4Nm6TE9L+LHON7LUrjCMdf/RXh8=;
 b=MtM6hWfk3uf3paoVRzryn/ETznP6uKJM/KE/nOT8RncoIlLqvgzLtMyW
 DRZevUHD2LCbkWSW9cdBB8EzwBrvRCMTBFv3h3438LvAIJZACs/svpcfX
 ZZL7P8DSyZgRPkUUBOs3L8+EhmOoG039IgU0Ml4DwCCO4UPTxYHsZU4Ea
 zPys3p12P6Ob+QHa4MQRQx6cfjOM3ZEM4EApJpxp1n18sKvcPtyiPKAhE
 g9k0cAreR88octvpro4ZJeXELFhrvjsHysjtbeHhk1VvW1kbvAIhO4h2W
 W4ep3C+o2r7SVjmB/MHZKkmndL+EhNjPE53bWTZBNBuv18vxhVzhk/PBG g==;
X-CSE-ConnectionGUID: sKXCWU2ESSiaeHdNIRJu1A==
X-CSE-MsgGUID: bcDlyazTTiSHdAd236bUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95299247"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="95299247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 15:15:45 -0700
X-CSE-ConnectionGUID: doIc7xZiTkaHDRgdSN2TFQ==
X-CSE-MsgGUID: ds3jciXpRXSgc9mfCx5erQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="252018244"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 15:15:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 15:15:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 15:15:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 15:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuylbEHYR132QSAQ+umKgJLULNhVt3EFlC7ven0bm8aK2ko2HradebqRBgp7XZtQinDTTbdTB1nrYULY87tKDFyJzNOEzTuyStf6d0eopmDm0LWwPjHoDJFmDQGPD31iqQhKxv1MzBENkec4zTCiFWcJFF95TY11KTNohINANMlVGm01BLYrZgTYNH235HTitWUzbHbnA+d1BS42y+W6UfAbS2CFB4LjjWWJrnc12yGt5fELaMt+E+zCqX0IuZuw0Ub/TA0r37oZi07ghohEqpkNfXlBfqfOXth3EBdmcvadRzd/e3RSIfs531pkRrJ/c849UB026YwsqrmPNsmzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMVq5gtZjCZLla0h4Nm6TE9L+LHON7LUrjCMdf/RXh8=;
 b=F2v3XB+LCJYh8MYH3zdr8nVkX/sCQOMTdnTQ1SEeRzqXj/QBPKXMskgWyNgyVuxLM7fcR3f0BjaNJF8ICP89uYcx/C6phXA4LPcJAkpSixkxjNg+Ol7tubRkmLFZyLYOraYrKwbAaZ35IfMqHdXCoffOOhjpu3hElHbXMmqXI6lzovCXoQuS76gm7JYkzis7Pm6HQLKNzJUQe7GSdFRQ1/qpG0yHLTKPj8jb2xCPk6u9B0QuEDXvPLsxPFf4Xo5Hv+mk2k2WYdmnDTZPA5VbSnyEp9WkLPEX6D81Qn+/99/iq71jb+7b7NpvavjOx9OR3Qp0TxYV96hY1dSutys0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 22:15:36 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 22:15:36 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
Thread-Topic: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
Thread-Index: AQHdExWJYVP0ey5jQE6hUcLR9c82O7ZtVVrQgAA5QQCAAAPSUA==
Date: Tue, 14 Jul 2026 22:15:36 +0000
Message-ID: <DM4PR11MB5456C2F7644C58A143E3C4C1EAF92@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260713221758.3285744-2-daniele.ceraolospurio@intel.com>
 <DM4PR11MB5456397EC19AD088168820DDEAF92@DM4PR11MB5456.namprd11.prod.outlook.com>
 <351145c1-5b82-4b91-85fe-e66cafcb033b@intel.com>
In-Reply-To: <351145c1-5b82-4b91-85fe-e66cafcb033b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ2PR11MB7426:EE_
x-ms-office365-filtering-correlation-id: 98143bbe-20f5-4767-9ed3-08dee1f56e39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|11063799006|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: xQ2hBsvTH9/MK/vJc0CWRsLttylqcyMsuMJ33/SIDuirc+/cj9grJpa+7Zi1rpxjhvlYPPp+bsLAcyP9pStgmbQrGwCvvTaHLWF0KLF1H9MNWeirtyrx/eAQx3RCX8uraKGFkBS641SNbsezMuD8rFJxoMFFyNYsSQ+A8U4sKczvMSL9q++P6itT3wHPtX6CETDrhgqLFL/fGwEoICTh8UNa57goudvlortKkKU7Ux9rR/pbev5IXc4dQEGT7yJjyIJuiuMa70RPwN+pspKxIHK7HE+hZhZYXSOf4wJ48Yk+QwzxJAeutTV81kgal8aIl1dNJfqxBhcl+CAbiVoXMWOgEJ3lFm5KgbPHoeDQBGpIc6VLWllCm0SNgZPwTMBWf6y8joU4WkZmEs/GsFPrYMHaUhc2uDK/9HORZxWupIpz6hhCmA+3TXLV32xZkWuNd7H0cqBYnNxKOyLBQ3xvG1u1ti1LdlE3S5t0+WVhDBLO3BlMdOliQTP6bUepsaT04Ewp16hyX2AcJ2+jGr7FGw6GhB7y6MQB7b2l/dbMsEMXH8hMwJ5TfSk34ptvqoXTJ852GIrmahGEZZ291py/ND7fKntueoutXNa9IWsGO4Bu9pvZE0uRxqkbk1BeQYTKB7SkcHkn8pyAiBDbOrn51O4IdYx55cs9xDr6GUAZvLfvf+ihSy2RAEKeGdbpoQbX+f3+5JZm0/kyYK/DVxANBw1GxLaVOupX2jLcPHC2e/A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2JoUkREOVVndDJtS2ZFOUtybmZ0QVR3Q0ZvMDFqRmpiTVFUZTQ0WG9OUS9E?=
 =?utf-8?B?VW01bVNtMFJNakxOaityVVdqcTljNk4zZC9sT3A2WFdEbjBmUEdtQ0JYY2JQ?=
 =?utf-8?B?VDVJdTBSZEExdGtnSSs0akFFdFBLQUlGSExPTWxBVi9WbWdzZmVjWFZtQmVo?=
 =?utf-8?B?VGttR3JBWXlCa2h6Szl3NkZhNitBR0hXUDkxcm5pbThhTmVXVWV6TjRmM25L?=
 =?utf-8?B?OUZLN2s5dFR6S2J6WVEvYlpITW40cG5BQkMzbWpwOFZsWmYvQ3hUSUJjWGsx?=
 =?utf-8?B?TituM1VNRnE5WGdUSVhFVW1UaXVpQkZFL1ZoSVpwRVlYZ1JPNGI2S01BZG16?=
 =?utf-8?B?Q0NBMi9FNG5vUVJselh5aVdaWTVuYWNOTG1NWFZaWWFOS1NPNmNmamQ1T1A5?=
 =?utf-8?B?dy9tamgvZVdLa2ZWVUx5MmtodUpINTM5Si9ENEptN1ZRdmQwODV6dlpTZ2FW?=
 =?utf-8?B?dzdNVDA4RWJKczk4aEY2aFlWSXhFQ0xXWEZ4L0k0NGNaNzVmaDN0T1hsajlI?=
 =?utf-8?B?MDBsVm1TcHFJZ0cwZEhxUGpGTm9xdHVwWGd6ZEc4OWJNaU5Gbmtmb1VhclN5?=
 =?utf-8?B?aHBlalFHclFEK3k1OTgrb0FaVHo0RHYzS2I2cVFxdjJKREZNaVYydjZCbzNq?=
 =?utf-8?B?WmUydkpHdVZ5K1BBT3RFYXVGR1Z1TS9pUFc5bnF6ODFhVmdhSlg2ejRQbTMr?=
 =?utf-8?B?bTMyMDBvWlFpbTBVVTNFQ2I2OEQ1ekxmRnZRUlVLK1RXR0loSEhVMWZwS0NE?=
 =?utf-8?B?bFhjUGdxWnUrR2MyRCtQeUUwZkdndXAvUjgxTE1UaWQ5dXZVMmx1SEV0cFhH?=
 =?utf-8?B?TlNqTzNVQWMzY2x0N0ZPbE40ZlVLWnJjM2pHZ2xpYzRXUTBSellRK202b20r?=
 =?utf-8?B?d3Fhd3Y2LythalF0V2F2M0ZQSlFUWHJibEpDY3JUNWxwSHU5Ry9YMkVLRFFO?=
 =?utf-8?B?eWNPUS9OdWh3QnI0ek03bjlvSjhtT1BaYm1qMG5QaitjV2VvMmQzWU9naG9v?=
 =?utf-8?B?RE9USHFWS1hVS0tTay9BRk1zdWl5ZkpWdloyL0JST0UrZGNSU09mbzhWM0da?=
 =?utf-8?B?c3NKcEtSLzZlRGZhT1YzVDNEeUVVM0pVOTlrM0dOREJiMkxsMnVwM3JnaWdN?=
 =?utf-8?B?TGY4andqWW1zWUVLQnRRWDBHTEE4SThtL1ZQMHVnZHFTZkVGV042eHA4Y1pJ?=
 =?utf-8?B?RkFIMzZ2cjIyK05wNDE0VkNwcUM0dVJVOGh3UStCVmg3MlhQTyswdW5OUmIy?=
 =?utf-8?B?ZE11My9iMmUyT2pOUUpVMW84NzhyKzVydUJMbDZWbW5SL2xEM0dBbk0xdFNq?=
 =?utf-8?B?ZUxVdUZQOG1ESVpiWUFGVEdaQUlGaXhOdEdZQ0RrQmtFZ0tYMkMwODFRYmFn?=
 =?utf-8?B?azRabFIvRDZRbFltclZSK3NkZi9uMmV2VWZGWFJQLzRjaG80c1pOOElmeE85?=
 =?utf-8?B?OHBya2JqSEJxd2U5T0ZWcEF3b2xNOUZYSGs1TDd2TTIxV2NQWU5jM1dFdU5o?=
 =?utf-8?B?WmQrTS85L0d6WUVlU1BxUnVWZGhPQlA1ZVBBdU5SbTRwYnNYcVErcldUNTNE?=
 =?utf-8?B?VjRzQzdCcEJNbnpGem9IdjR3VU45OWM2TUM1V0krVDR1bFVCb05OTW5mM0JZ?=
 =?utf-8?B?TnFIQTlOY0R5RmtOWHI4WVVKU0VHMGFrbUc4dUxHUnF3dnVoZlcyQVlXMkJP?=
 =?utf-8?B?S2x4eHg0YnROeGhzMnNGYjZLSWNKVWZnOVdaK0w1SFFTd0tsemhYRVJKVGo3?=
 =?utf-8?B?dTRFMWdnQ1J5RDBFc3BFRzN1bG8zeGt4WUx4dGpPWTBYU3RTMVlNYi96NTlr?=
 =?utf-8?B?UGtrYTFkSDFOaHlrR0g2V3NNeGJSRFNSTFVIa2ZxeXhmZE9lTWszbkVheTRj?=
 =?utf-8?B?TlJZVUlSSGFjRDBpdGlGeFhoa1B6QUJ3NTBrVFVCSkdvV0kvVXUwaHNpOHJM?=
 =?utf-8?B?NW5ub051RVQ5cG1QQVhnWmpYZW5GRUVGOGg1NFo5T2JQdzA3VlBOZGRaYytJ?=
 =?utf-8?B?ZDNLVnRBcXdyNVR1YmJpZWlNZ3Z1eWZEYThBL0oydVBBYkhPY29pT0ZrTS9K?=
 =?utf-8?B?Q1NOVkdIWTZpbEJLcUJ4dUs3U0dFR3AxelJOUktzRUxPbHdvSjBTRWlCWk9H?=
 =?utf-8?B?M0h2WHdsY01ocmJQaWFNOUtkbml0bkVsV3BNZ2dIeWZRVjJxc201YzZYcXZX?=
 =?utf-8?B?ODQyZ2kvaXN2ckVmaDd3VjZOcGpBcmdyRGJYT0dlUFVIZ3VaSWtoTG5mVDhG?=
 =?utf-8?B?SStHOTBqc21EMW1Nb0F4QVdQVmJBTVlVUFRxejd0ZjFRT1prODBOL3R0WVp5?=
 =?utf-8?B?djEwcGowbUVqMzZEaFpZdmpMQkVhWjFVTEVVaWsvRGFBdnBCUHBoQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gQpVtvN8hEiyX19Wz4jCVWqhtCsSLUzv2NeV9BjCGP6JeYdEw6w0oqlO4bI9VZ44fO2tFn8RIfEaXydu3xdXs/q7/9de/GOvItF9tzji6nrIq9ALfdXoKWGPHFdk0rSdDot2O0qM+e+6wULQEdOuYDe0pNIoYXZam01hjgajZwfb+6DORwSablJOG6d6Y1OlXYONc11eSChodaNza0Mg8pnvXOTee/hkdxxdVedUA69zXcBAt3pXG22XzbiADpm1dA1e/wS89sMI9T/H0JR7EZYgIRl4iQeVHNr+I3/EUUgFz7yMvIEDPK26tmp00SggH93daPFxasmXNllHbXr36w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98143bbe-20f5-4767-9ed3-08dee1f56e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 22:15:36.4675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfZRuPA54La7EFhaAbwgu51ymk7DDlq9sOxBCGWhkPw8hXjV9JHNFSKiT0msJIOJWlc+mA5wxguMDiEiWufI9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
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

T24gVHVlLCBKdWwgMTQsIDIwMjYgMjo0OCBQTSBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdyb3Rl
Og0KPiBPbiA3LzE0LzIwMjYgMTo1OCBQTSwgTGluLCBTaHVpY2hlbmcgd3JvdGU6DQo+ID4gT24g
TW9uLCBKdWwgMTMsIDIwMjYgMzoxOCBQTSBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOg0K
PiA+PiBTdGFydGluZyBvbiBMTkwgdGhlIFdPUENNIHNpemUgaXMgOE1CIGluc3RlYWQgb2YgNCwg
c28gd2UgbmVlZCB0bw0KPiA+PiBhdm9pZCB1c2luZyB0aGUgWzAsIDhNQikgcmFuZ2Ugb2YgdGhl
IEdHVFQgYXMgdGhhdCBjYW4gYmUNCj4gPj4gdW5hY2Nlc3NpYmxlIGZyb20gdGhlIG1pY3JvY29u
dHJvbGxlcnMuDQo+ID4+DQo+ID4+IE5vdGUgdGhhdCB0aGUgcHJvcGVyIGxvbmctdGVybSBmaXgg
aGVyZSBpcyB0byByZWFkIHRoZSBXT1BDTSBzaXplDQo+ID4+IGZyb20gdGhlIEhXLCBidXQgdGhh
dCBpcyBhIG1vcmUgc2VyaW91cyByZXdvcmsgdGhhdCB3b3VsZCBiZQ0KPiA+PiBkaWZmaWN1bHQg
dG8gYmFja3BvcnQsIHNvIHdlIGNhbiBkbyB0aGF0IGFzIGEgZm9sbG93LXVwLg0KPiA+Pg0KPiA+
PiBGaXhlczogOWM1N2JjMDg2NTJhICgiZHJtL3hlL2xubDogRHJvcCBmb3JjZV9wcm9iZSByZXF1
aXJlbWVudCIpDQo+ID4+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8NCj4g
Pj4gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4+IENjOiBSb2RyaWdvIFZp
dmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4+IENjOiBTaHVpY2hlbmcgTGluIDxzaHVp
Y2hlbmcubGluQGludGVsLmNvbT4NCj4gPj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiBJIGFtIHBsYW5uaW5nIHRvIGZvbGxvdyB3aXRo
IHRoZSBwcm9wZXIgcmV3b3JrLCBidXQgSSdtIHN0aWxsIHRyeWluZw0KPiA+PiB0byBmaWd1cmUg
b3V0IHNvbWUgY29tcGxleGl0aWVzIHRoYXQgY29tZSBpbiB3aXRoIG11bHRpLXRpbGUsIHNvIEkn
bQ0KPiA+PiBzZW5kaW5nIHRoaXMgb24gaXRzIG93biBpbiB0aGUgbWVhbnRpbWUgdG8gZml4IHRo
ZSBidWcuDQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93b3BjbS5jIHwg
MTUgKysrKysrKysrKy0tLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfd29wY20uYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93b3BjbS5jIGlu
ZGV4IDkwMGRhZjFkMWIxYi4uZmU2NWVkMjQ2Nzc1DQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd29wY20uYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfd29wY20uYw0KPiA+PiBAQCAtNDksOSArNDksOSBAQA0KPiA+PiAgICAqLw0KPiA+Pg0K
PiA+PiAgIC8qIERlZmF1bHQgV09QQ00gc2l6ZSBpcyAyTUIgZnJvbSBHZW4xMSwgMU1CIG9uIHBy
ZXZpb3VzIHBsYXRmb3Jtcw0KPiA+PiAqLw0KPiA+PiAtLyogRklYTUU6IExhcmdlciBzaXplIHJl
cXVpcmUgZm9yIDIgdGlsZSBQVkMsIGRvIGEgcHJvcGVyIHByb2JlDQo+ID4+IHNvb25lciBvciBs
YXRlciAqLw0KPiA+PiArLyogRklYTUU6IExhcmdlciBzaXplIHJlcXVpcmUgZm9yIHNvbWUgcGxh
dGZvcm1zLCBkbyBhIHByb3BlciBwcm9iZQ0KPiA+PiArc29vbmVyIG9yIGxhdGVyICovDQo+ID4+
ICAgI2RlZmluZSBER0ZYX1dPUENNX1NJWkUJCQlTWl80TQ0KPiA+PiAtLyogRklYTUU6IExhcmdl
ciBzaXplIHJlcXVpcmUgZm9yIE1UTCwgZG8gYSBwcm9wZXIgcHJvYmUgc29vbmVyIG9yDQo+ID4+
IGxhdGVyICovDQo+ID4+ICsjZGVmaW5lIExOTF9XT1BDTV9TSVpFCQkJU1pfOE0NCj4gPj4gICAj
ZGVmaW5lIE1UTF9XT1BDTV9TSVpFCQkJU1pfNE0NCj4gPj4gICAjZGVmaW5lIFdPUENNX1NJWkUJ
CQlTWl8yTQ0KPiA+Pg0KPiA+PiBAQCAtMTc5LDkgKzE3OSwxNCBAQCBzdGF0aWMgaW50IF9fd29w
Y21faW5pdF9yZWdzKHN0cnVjdCB4ZV9kZXZpY2UNCj4gPj4gKnhlLCBzdHJ1Y3QgeGVfZ3QgKmd0
LA0KPiA+Pg0KPiA+PiAgIHUzMiB4ZV93b3BjbV9zaXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSAg
ew0KPiA+PiAtCXJldHVybiBJU19ER0ZYKHhlKSA/IERHRlhfV09QQ01fU0laRSA6DQo+ID4+IC0J
CXhlLT5pbmZvLnBsYXRmb3JtID09IFhFX01FVEVPUkxBS0UgPyBNVExfV09QQ01fU0laRSA6DQo+
ID4+IC0JCVdPUENNX1NJWkU7DQo+ID4+ICsJaWYgKHhlLT5pbmZvLnBsYXRmb3JtID49IFhFX0xV
TkFSTEFLRSkNCj4gPj4gKwkJcmV0dXJuIExOTF9XT1BDTV9TSVpFOw0KPiA+PiArCWVsc2UgaWYg
KElTX0RHRlgoeGUpKQ0KPiA+PiArCQlyZXR1cm4gREdGWF9XT1BDTV9TSVpFOw0KPiA+IFdpdGgg
dGhpcyBvcmRlciwgQk1HIGlzIGNoYW5nZWQgdG8gOE1CIGFsc28uDQo+ID4gSSBjaGVja2VkIEJN
RydzIGh3IHJlZ2lzdGVyIHdvcGNtIHNpemUsIGFuZCBpdCBkb2VzIHdpdGggOE1CIHdvcGNtIHNp
emUuDQo+ID4gU28sIHRoZSBMTkwrIGFwcGx5IHRvIGJvdGggaW50ZWdyYXRlZCBhbmQgZGlzY3Jl
dGUgZ2Z4LCBpcyBpdCByaWdodD8NCj4gDQo+IFllcywgOE1CIFdPUENNIGlzIGZvciBib3RoIGlu
dGVncmF0ZWQgYW5kIGRpc2NyZXRlIHN0YXJ0aW5nIGZyb20gTE5MLg0KPiBOVkwtUCBmdXJ0aGVy
IG1vdmVzIHRoZSBzaXplIHRvIDE2TUIsIGJ1dCBJJ20gZ29pbmcgdG8gaGFuZGxlIHRoYXQgYnkN
Cj4gbW92aW5nIHRvIGEgSFcgcmVhZCBpbnN0ZWFkIG9mIGNoYW5naW5nIHRoZSBzaXplIGhlcmUs
IHNvIEknbSBsaW1pdGluZyB0aGlzIGZpeA0KPiB0byByZWxlYXNlZCBwbGF0Zm9ybXMuDQoNClRo
YW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLg0KTEdUTS4NClJldmlld2VkLWJ5OiBTaHVpY2hlbmcg
TGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCg0KPiANCj4gRGFuaWVsZQ0KPiANCj4gPiBU
aGFua3MuDQo+ID4NCj4gPiBTaHVpY2hlbmcNCj4gPg0KPiA+PiArCWVsc2UgaWYgKHhlLT5pbmZv
LnBsYXRmb3JtID09IFhFX01FVEVPUkxBS0UpDQo+ID4+ICsJCXJldHVybiBNVExfV09QQ01fU0la
RTsNCj4gPj4gKwllbHNlDQo+ID4+ICsJCXJldHVybiBXT1BDTV9TSVpFOw0KPiA+PiAgIH0NCj4g
Pj4NCj4gPj4gICBzdGF0aWMgdTMyIG1heF93b3BjbV9zaXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPiA+PiAtLQ0KPiA+PiAyLjQzLjANCg0K
