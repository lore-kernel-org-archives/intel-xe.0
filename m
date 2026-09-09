Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0369FC79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 08:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92D10EFC2;
	Wed,  9 Sep 2026 08:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQLRTCOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A710EFBD;
 Wed,  9 Sep 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788942228; x=1820478228;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aeoULznJpIQYTM2s7s37CI8HyLWbK4/nnKRY+P/3JOk=;
 b=UQLRTCOhUCzCCXuDLBNzmn8uhQLiopLHJaK/lZjv+YVkHPIJuleaC5F4
 erBXno7awa7k8pfkrjBxfjeO3L+EPtiT3gQ8Gfa/Qvgl9/tKYH/arXTgw
 fdI1RIS3mpzlsTIRe9sCeC8g3idqQx9tvUeT3HIqV/TCDM6DuGc36gV1h
 a1pHBcEUN2XwPGWR6siv0lto/AbzWph2TP/JXhDye2QykodmWkb0WMW2w
 qAv1OBD5kQbBJdIXlBERaQh5OUmrIG0DypqWAwJKXIbU8MxY23ghzR7Bp
 U1VGfxKoLXf2QRAPXMOMBMtEOtY0BmNjj6FBMmvXKc5YOrUy3Mn7ZyPb+ g==;
X-CSE-ConnectionGUID: k8JeHTf0S7u4G5HTUI7a4w==
X-CSE-MsgGUID: wtvSfSDNSc6XmvqU284GRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100019380"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100019380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:23:44 -0700
X-CSE-ConnectionGUID: xcPukXiFSZO2PLyu+cBXWQ==
X-CSE-MsgGUID: C4ZSaHPVQbeVMduZOdRLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273219871"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:23:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:23:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 01:23:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0/R9Jghs4p/VNgSAxUqKje3CG0ERIpJi5jTwJBiAuj5qpTJPGBnA1V0ugvgEX00UvGY/sEG937C1BTkCo8mF7HLSIGzQhT4aTdkV+w/5IVF2vWAQH2uBFPDsw+/+Kr1vFSTvsG3k8ipLAQvdi1gyuzAEIKJKuufs65+q8CAY3Sd+Caw3hvP5Kc2lmFJJdPVs716Ui8t7rN4jnEOwhYuvRhTvToP30jnfWhQQLXPnA3F1UOoHSmZz44o5Ax4IfCDlRHs0TqDlnkbS82EYVS4kMg1S+7J38pACuYs/rdPeKvwRFIusBu9fIOhwwBMy7NiYWhDDdfEuzSsmzUCe37YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeoULznJpIQYTM2s7s37CI8HyLWbK4/nnKRY+P/3JOk=;
 b=PGx2cO0n50e4o1a8SzzgLkUqr9XcN2QN6pN3MfqPcoL/MUqVeIrFVp42Gn9JTDZ75pT9iFR/VMQ/0oA15QPBix8y2SxGb9OSNi7JpOerfuAkTfIB+DfmP2NIAXWhjTFfuKwiKVbSWU5Ma+MRi5AvSSzJDDfhiW0SB82lWJwXZYdMd1kctx13qrAPSfDke0jF3hBUsRqkMxcEmDOXKnF1VvfqccLoaW+gMU12TZ7Y/uPGyKfFccnAgDydgmVbANfMb/BHk4f3ASkRSt+ysaKXqLLqSfidiQCjBXdvfipfApUki50O1eDIM3LBHxQGPqCTiZDMH84cEEwQ2qq9OfERyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS4PR11MB616614.namprd11.prod.outlook.com (2603:10b6:8:53e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 08:23:37 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:23:37 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Garg, 
 Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Topic: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Index: AQHdQCRtOFHnI+fZDEmi2Jc36bCGzLbF6LQA
Date: Wed, 9 Sep 2026 08:23:37 +0000
Message-ID: <4b3b6f2b68fb62abf88a5be7e19d84ae23550c81.camel@intel.com>
References: <20260909062523.3516962-1-nemesa.garg@intel.com>
 <20260909062523.3516962-3-nemesa.garg@intel.com>
In-Reply-To: <20260909062523.3516962-3-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS4PR11MB616614:EE_
x-ms-office365-filtering-correlation-id: a3a00213-15f6-49f2-7297-08df0e4ba5ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|56012099006|11063799006|3023799007|38070700021|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: P9tO9ddmlDmsMh+CzHoRKMEX+VqoUExKs6c2RyFHuvtaBzrLGRxlZSwRjwOU3u4hWhZp5enK7VXbdz3XcpU7LkCfuUOjuxX3Jngyu7s+/o+UO8ESQp1+KHJ4ODokhckAlfcl32CderOUs9jWADrBV9PYZQWyfOjl7mvCJYPRorPKUiOGpch9DXa1I68p66z2TJbUw1sVOuF5XW0w6LM0monMeZ1r76eI+4o46JZ87rRuSmmV+2YqDLEuIbt07WRPXKS1uSIVg1erY5SUXNynejNhmUDr3PFH8u30aibYfwM+yND4ivFjn6g28W9DrRXXpmzo22lS8JLkHKwnrOk7glcdTCb9NzFvobKvbJTssijng4IA80h6MnpV7jBSr6LJ+IWuI9FWb2SS2VESOE/IEPMDk2/W0n+hNMRVXOff2BkoKovRGxc2YY+POKfvPr07SY3IwV3bdLRHngbDJx5j0NhA3nT99Z1kI5qro5/d8hIt+3LkEwKgfYd6aYwwPXfXEBPp0m9j0+KgInI/vd2qz/6zdzfOR15uYCdJKZEx8BnPuiGt6+LEGIVuGm3cqMX/ZvhQymMWZiNKETGvpgePCS1wg/0hZJ9fF2sQYSYje8oa3v+nHX60k4qbQ5ac5xxeSH6r+H03CAe0eeWCGrxXimgXqYfFQ7yBzjmL5vN50Ts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(3023799007)(38070700021)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFpCTHlvSFpFaGZSQndjSHVyWHJjK0IyVjlEcWE2a2REZGdWY0lwSE9TVGRa?=
 =?utf-8?B?anVlLzVyZm5kUVBuQnA2ZWZmQi8rOXM0Wk9DalE1SHVOb1Ntc0l5aWpnYTIr?=
 =?utf-8?B?MVVHM051ZzRHR2tzWHNWUDdUM3VPbWVIOCtac0RWQmNKTUtxZzQyUml3MUdG?=
 =?utf-8?B?OHFucmVES2FkL1g5Y3Uyai9ZcWRaK21uSG04Ni9aMEx0aWVPeWxOVStuVk8y?=
 =?utf-8?B?NzZiOWRtU291dXBMMmFIcG1xeUlMdCsxTTdqOFFWeDU5QTU5WUREb09uZHA4?=
 =?utf-8?B?RGlNSUZFZ0FKRmVWQkJwdGpCdVdkWVRLbDd3cFcwT0V3a2xOcEdsb2tiZkZx?=
 =?utf-8?B?UkpKeTlVSkdpbzJmeHpxOE0rRHpNU2poNG1PNnBlVmgzYWFoZE5QQTY0bVp6?=
 =?utf-8?B?eGVhb2tqVUk1TGQ2YlVpSitjZlk4dXZwdGFYM0h0L3Z1ZTZIenFBWlpkRVdW?=
 =?utf-8?B?TVJXN055VE5tTkJYVU5FOU95M1BMNDJQMnVlVUdvckFWMUtUQSsrV1E5MER6?=
 =?utf-8?B?amdLREczbVMrTUIyVVJsSUNGelpFZ3RPYVlOV2IwOENlQlNrSHo2blNmcncx?=
 =?utf-8?B?bmRZdDMyYWh1bnQ1cTBaZVFZaTM5dmV4QXdWOWQzOElkZXg5L2xZRWdVa1Jz?=
 =?utf-8?B?dEJZZ2FNVUxMM3BZdks0SjdxTEkvUkpsMDB1dEJTRXFnS1dZSGkxMG9Jc2U1?=
 =?utf-8?B?eUNlN202MlZKcUo4RHhSUGtub1dOakd1ZDlsMkQ3STJPdWd1SWtUWXd4eEZU?=
 =?utf-8?B?YlBBcXJ4c0ZSK2gwSU90ejZneDl2cStjdnpsZkhWSENiNVNjbG1zeGluMFAw?=
 =?utf-8?B?T1lzbzlSYXZzeWVLK2lrcVU5N1U5cUt4bmQrZ05qL0RmRFdWSWwwYzdOVUEw?=
 =?utf-8?B?RWxwV1NKWmtoWTBHVGsvQlhnejROWVI2d2FDU1dicHpRalN3UlJpTERSd3dZ?=
 =?utf-8?B?R1c0TUI2eXo0SmpyRjF1S053RE0yNzF3Vm1VTDRsdGJhY2xYWGc2TmVwajJC?=
 =?utf-8?B?VWZUc2xwejNudmtkY3M2RWZLWkVIZkpzZ3VIMGdpNStqQnFzSlM0NTd0blRR?=
 =?utf-8?B?Zi9hSVhRSmdraWFYVnNiWno4N1hBbmNNbkJ1SFRnYmJoVWdsMHdSc1NQU0V2?=
 =?utf-8?B?a2ZDaWRwMDh5N0ordm1aV1UvT0dVRERveTVYS3RBb2ZvS1N3NHBWK1F0OVd5?=
 =?utf-8?B?bFArZXJkOG15bDZ5RDZDQkxuUERIM0tzN0hYYzc4Wmx0UjZKZW83TDAwTmRI?=
 =?utf-8?B?Zy9FdjEra0FNYTBoV0xnRnBodGMvWFltUmNsa01HNEhWVWxVVzlzeGZKUGQ2?=
 =?utf-8?B?azltNGFac3orWWZTWE9NbUFEMld0L09lSVEwUnZlV1pzaFBsaXlBcTR2NmxN?=
 =?utf-8?B?blRjM0FkQzJBNmJjT0tlL0tEb0ZvK1BTWFZsZ0VIQkFITmkyejg2d2hqR0JD?=
 =?utf-8?B?Ym1mUmpiTTFxd0w1d21Fc2RqczluMnMzM0JwZE95cGZBZTZlQjdxbU1DbDhV?=
 =?utf-8?B?WU1PNzJrcmxWcysreCtIN2NkeEU5WHM3ejRnK3IzWUtjMk5hSTZkeURIczg2?=
 =?utf-8?B?RmErc1dTdWROZm52azNkZFk5c3hzdjYyV1czM0RVREFKRlpaN2RkUE43ckRq?=
 =?utf-8?B?VS85TktJUUZ6OXlvYkREbWFKWWxjZndTQ2tEYUIxZDljRHRJZWljeXc2eGo3?=
 =?utf-8?B?TDJpVkEweEcxSzhhM2FIMkpwRGdsczRUbENnUWpkdmdhbHQ5QnRhUUVIN2JJ?=
 =?utf-8?B?dENZam1pdFZYRStJMUhpendyRllWbE9lNnVMWk9kNzlmQW5YYTFRYUxYWDgv?=
 =?utf-8?B?ZG01alNRV0dxdmwwUDF6VERkaHN0c3p5NklLZGhKNGZQQis0MGRoaWttVWs0?=
 =?utf-8?B?ZXNQWTdFTUdQY2Q3WjBKS2FVblVva3Iza1FHKzQ1QldEMWdLUFNXeGRiaXh0?=
 =?utf-8?B?dk1kVlk0N3h0NzZqYitLUHA1TngwM1lHNkFOV00xZjB4VnZHNEIwVlBzcXV3?=
 =?utf-8?B?RGVNNXNYbHVsL1BGN2VTVnFnMXRKRzFxajV2cENiRXYyTlFTRFc5aWxpNVF6?=
 =?utf-8?B?OER5R1RqZm1GUFR0YUFxUGhrRWp2QVlMeC9PcHN2bmFTZ05GUkxRaU5Hb0tq?=
 =?utf-8?B?cTJ2dGl2NVc2N2M0cmRlckViVWVoNWZpeldicmthNkFDS1EvYWRVNHRxalNK?=
 =?utf-8?B?R3I5Z2RXWE5OQTlQMEFsaTFtb3Y4R2FGSWt2d3lEamdJUnFJYVVCaXZFYWhB?=
 =?utf-8?B?STdLSFFrMDI5V2NqQXZTRWFPYTVja2hZZFhyY1puelpyTVRlRitYSE1ZcEVU?=
 =?utf-8?B?UmdRMEpheXZTZjYzczlRM21vWlRpSm5QZnc2Smx6QndrUnloOUFqWUFjN3Bn?=
 =?utf-8?Q?f4ATd/PQys4c/bbo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2D06272ED01864DAF8B10A5D33DAAC5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vg9iuBd/7P3RymHrWC6/sMa3Xb1FV8JClHJtaL75WfBie8kLMXd60I07T/ZFK31avyTWEvmK6YYPXkf//FGpfESqLlM3+5yS52iHNssJBptgpWxwNj1DqqGkAif3YJKkJe7xA2q4oKG31RsISEX6B+oLENNN05KECaoAp6D3fBEEIoUmp+kssVPe4XN1j/sjQ7JHc9IZYMxcVT614PWLV+hA06RXS0N4tHIkLKF9EdREEcM4QiqDrl5DuXUuE0HAPZvXoXStchYnC8mf/QslIM/eMx+bmTshaCUVcyyNhLEy95k+z2WugWvEsPNFZvTo+x8/+GubjkjF7Fx2kvqP9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a00213-15f6-49f2-7297-08df0e4ba5ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:23:37.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xffpJnV7PdW2QqpDq1R8kp/rShwbzarhl9uvs2YLMs95ZTDgm+gTfhCggUV7VKid6VnFWuhz6SrTDhaXz3523hfTxBBD1JJrDaelZqgaeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB616614
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

T24gV2VkLCAyMDI2LTA5LTA5IGF0IDExOjU1ICswNTMwLCBOZW1lc2EgR2FyZyB3cm90ZToNCj4g
U2VsZWN0aXZlIGZldGNoIGlzIGRyb3BwZWQgd2hpbGUgcGlwZSBDUkMgaXMgYWN0aXZlLCBhbmQg
dGhlIHBsYW5lcw0KPiBrZWVwDQo+IHRoZWlyIFNFTF9GRVRDSF9QTEFORV9DVEwgLyBTRUxfRkVU
Q0hfQ1VSX0NUTCBlbmFibGUgYml0IHNldCBpbg0KPiBoYXJkd2FyZQ0KPiBvdmVyIHRoYXQuIEEg
cGxhbmUgZGlzYWJsZWQgd2hpbGUgc2VsZWN0aXZlIGZldGNoIGlzIG9mZiBuZXZlciBnZXRzDQo+
IHRoZQ0KPiBiaXQgY2xlYXJlZCwgYXMgdGhlIGRpc2FibGUgcGF0aCBpcyBndWFyZGVkIGJ5IGVu
YWJsZV9wc3IyX3NlbF9mZXRjaC4NCj4gT25jZSBzZWxlY3RpdmUgZmV0Y2ggY29tZXMgYmFjayB0
aGUgaGFyZHdhcmUgcmVzdW1lcyBmZXRjaGluZyBmb3IgYQ0KPiBwbGFuZSB0aGF0IGlzIG5vIGxv
bmdlciBlbmFibGVkIGFuZCBrZWVwcyBpdHMgRERCIHJhbmdlIHJlc2VydmVkLg0KPiANCj4gQ2xl
YXIgdGhlIGJpdHMgYXMgc2VsZWN0aXZlIGZldGNoIGlzIHR1cm5lZCBvZmYgaW5zdGVhZC4gQXRv
bWljIGNoZWNrDQo+IGhhcyBib3RoIHRoZSBvbGQgYW5kIHRoZSBuZXcgY3J0YyBzdGF0ZSwgc28g
cmVjb3JkIHRoZSB0cmFuc2l0aW9uDQo+IHRoZXJlDQo+IGFuZCBsZXQgdGhlIHBsYW5lIGFuZCBj
dXJzb3IgYXJtIHBhdGhzIHdyaXRlIHRoZSByZWdpc3RlcnMgdG8gMCBmb3INCj4gdGhhdA0KPiBj
b21taXQuDQo+IA0KPiBGaXhlczogYjFmNTI3OWI1OTgxICgiZHJtL2k5MTUvcHNyOiBNb3ZlIHBs
YW5lIHNlbCBmZXRjaA0KPiBjb25maWd1cmF0aW9uIGludG8gcGxhbmUgc291cmNlIGZpbGVzIikN
Cj4gQ2xvc2VzOg0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5l
bC8tL3dvcmtfaXRlbXMvODczOQ0KPiBBc3Npc3RlZC1ieTogQ29waWxvdDpDbGF1ZGUtT3B1cy01
DQo+IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmPCoMKg
IHzCoCA3ICsrKysrLS0NCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5
cGVzLmjCoMKgwqAgfMKgIDYgKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAxOQ0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKg
Li4uL2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jwqDCoMKgIHzCoCA5ICsr
KystLS0tLQ0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2N1cnNvci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJz
b3IuYw0KPiBpbmRleCA5MDE3MzA0MGQ4MjUuLjRhZmQyNzVkZTg2ZSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jDQo+IEBAIC01MzcsNyArNTM3
LDggQEAgc3RhdGljIHZvaWQNCj4gaTl4eF9jdXJzb3JfZGlzYWJsZV9zZWxfZmV0Y2hfYXJtKHN0
cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkg
PSB0b19pbnRlbF9kaXNwbGF5KHBsYW5lKTsNCj4gwqAJZW51bSBwaXBlIHBpcGUgPSBwbGFuZS0+
cGlwZTsNCj4gwqANCj4gLQlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCkN
Cj4gKwlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCAmJg0KPiArCcKgwqDC
oCAhY3J0Y19zdGF0ZS0+Y2xlYXJfcHNyMl9zZWxfZmV0Y2gpDQo+IMKgCQlyZXR1cm47DQo+IMKg
DQo+IMKgCWludGVsX2RlX3dyaXRlX2RzYihkaXNwbGF5LCBkc2IsIFNFTF9GRVRDSF9DVVJfQ1RM
KHBpcGUpLA0KPiAwKTsNCj4gQEAgLTU3MCw4ICs1NzEsMTAgQEAgc3RhdGljIHZvaWQNCj4gaTl4
eF9jdXJzb3JfdXBkYXRlX3NlbF9mZXRjaF9hcm0oc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDC
oAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkocGxhbmUp
Ow0KPiDCoAllbnVtIHBpcGUgcGlwZSA9IHBsYW5lLT5waXBlOw0KPiDCoA0KPiAtCWlmICghY3J0
Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoKQ0KPiArCWlmICghY3J0Y19zdGF0ZS0+ZW5h
YmxlX3BzcjJfc2VsX2ZldGNoKSB7DQo+ICsJCWk5eHhfY3Vyc29yX2Rpc2FibGVfc2VsX2ZldGNo
X2FybShkc2IsIHBsYW5lLA0KPiBjcnRjX3N0YXRlKTsNCj4gwqAJCXJldHVybjsNCj4gKwl9DQo+
IMKgDQo+IMKgCWlmIChkcm1fcmVjdF9oZWlnaHQoJnBsYW5lX3N0YXRlLT5wc3IyX3NlbF9mZXRj
aF9hcmVhKSA+IDApDQo+IHsNCj4gwqAJCWlmIChjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zdV9y
ZWdpb25fZXQpIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gaW5kZXggOTAxNmJlNTJjN2VhLi5lYWUwNWE4M2RiODAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oDQo+IEBAIC0xMTkwLDYgKzExOTAsMTIgQEAgc3RydWN0IGludGVsX2NydGNf
c3RhdGUgew0KPiDCoAlib29sIGhhc19zZWxfdXBkYXRlOw0KPiDCoAlib29sIGVuYWJsZV9wc3Iy
X3NlbF9mZXRjaDsNCj4gwqAJYm9vbCBlbmFibGVfcHNyMl9zdV9yZWdpb25fZXQ7DQo+ICsJLyoN
Cj4gKwkgKiBDb21taXQgdGltZSBkaXJlY3RpdmUgcmF0aGVyIHRoYW4gYSBwaWVjZSBvZiBwaXBl
IHN0YXRlOg0KPiBkcm9wIHRoZQ0KPiArCSAqIHN0YWxlIHNlbGVjdGl2ZSBmZXRjaCBlbmFibGUg
Yml0cyBhcyBzZWxlY3RpdmUgZmV0Y2ggaXMNCj4gdHVybmVkIG9mZi4NCj4gKwkgKiBOb3QgY29t
cGFyZWQgYnkgdGhlIHN0YXRlIGNoZWNrZXIuDQo+ICsJICovDQo+ICsJYm9vbCBjbGVhcl9wc3Iy
X3NlbF9mZXRjaDsNCj4gwqAJYm9vbCByZXFfcHNyMl9zZHBfcHJpb3Jfc2NhbmxpbmU7DQo+IMKg
CWJvb2wgaGFzX3BhbmVsX3JlcGxheTsNCj4gwqAJYm9vbCBsaW5rX29mZl9hZnRlcl9hc19zZHBf
d2hlbl9wcl9hY3RpdmU7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYw0KPiBpbmRleCBmNDkwYmViNjY2MjkuLjc5Y2U1MDgzMTQ5MiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0yODg5LDYgKzI4ODksOCBA
QCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNf
c3RhdGUgKnN0YXRlLA0KPiDCoAkJCQlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykNCj4gwqB7DQo+
IMKgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShzdGF0
ZSk7DQo+ICsJY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlID0N
Cj4gKwkJaW50ZWxfYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7DQo+IMKg
CXN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0NCj4gaW50ZWxfYXRvbWljX2dl
dF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7DQo+IMKgCXN0cnVjdCBpbnRlbF9wbGFuZV9z
dGF0ZSAqbmV3X3BsYW5lX3N0YXRlLCAqb2xkX3BsYW5lX3N0YXRlOw0KPiDCoAlzdHJ1Y3QgaW50
ZWxfcGxhbmUgKnBsYW5lOw0KPiBAQCAtMjkwMSw2ICsyOTAzLDIzIEBAIGludCBpbnRlbF9wc3Iy
X3NlbF9mZXRjaF91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+
IMKgCWJvb2wgZnVsbF91cGRhdGUgPSBmYWxzZSwgc3VfYXJlYV9jaGFuZ2VkOw0KPiDCoAlpbnQg
aSwgcmV0Ow0KPiDCoA0KPiArCS8qDQo+ICsJICogU2VsZWN0aXZlIGZldGNoIGlzIG5vdCBhbHdh
eXMgdXNhYmxlLCBmb3IgaW5zdGFuY2UgaXQgaXMNCj4gZHJvcHBlZA0KPiArCSAqIHdoaWxlIHBp
cGUgQ1JDIGlzIGFjdGl2ZS4gVGhlIHBsYW5lcyBrZWVwIHRoZWlyIHNlbGVjdGl2ZQ0KPiBmZXRj
aA0KPiArCSAqIGVuYWJsZSBiaXQgc2V0IGluIGhhcmR3YXJlIG92ZXIgdGhhdCwgYW5kIGEgcGxh
bmUNCj4gZGlzYWJsZWQgd2hpbGUNCj4gKwkgKiBzZWxlY3RpdmUgZmV0Y2ggaXMgb2ZmIG5ldmVy
IGdldHMgdGhlIGJpdCBjbGVhcmVkLiBPbmNlDQo+IHNlbGVjdGl2ZQ0KPiArCSAqIGZldGNoIGNv
bWVzIGJhY2sgdGhlIGhhcmR3YXJlIHdvdWxkIHJlc3VtZSBmZXRjaGluZyBmb3IgYQ0KPiBwbGFu
ZSB0aGF0DQo+ICsJICogaXMgbm8gbG9uZ2VyIGVuYWJsZWQgYW5kIGtlZXAgaXRzIEREQiByYW5n
ZSByZXNlcnZlZCwgc28NCj4gaGF2ZSB0aGUNCj4gKwkgKiBwbGFuZSB1cGRhdGUgZHJvcCB0aGUg
Yml0IGZvciBldmVyeSBwbGFuZSBvZiB0aGUgcGlwZSBhcw0KPiBzZWxlY3RpdmUNCj4gKwkgKiBm
ZXRjaCBpcyB0dXJuZWQgb2ZmLiBUaGUgcGlwZSBpcyBrbm93biB0byBpbXBsZW1lbnQgdGhlc2UN
Cj4gcmVnaXN0ZXJzDQo+ICsJICogYmVjYXVzZSBzZWxlY3RpdmUgZmV0Y2ggd2FzIGVuYWJsZWQg
b24gaXQuIFR1cm5pbmcNCj4gc2VsZWN0aXZlIGZldGNoDQo+ICsJICogb2ZmIGlzIGEgbW9kZXNl
dCwgc28gYWxsIHRoZSBwbGFuZXMgb2YgdGhlIHBpcGUgYXJlDQo+IGFscmVhZHkgaW4gdGhlDQo+
ICsJICogc3RhdGUgYW5kIGdldCBwcm9ncmFtbWVkIGJ5IHRoaXMgY29tbWl0Lg0KPiArCSAqLw0K
PiArCWNydGNfc3RhdGUtPmNsZWFyX3BzcjJfc2VsX2ZldGNoID0gb2xkX2NydGNfc3RhdGUtPmh3
LmFjdGl2ZQ0KPiAmJg0KPiArCQlvbGRfY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNo
ICYmDQo+ICsJCSFjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2g7DQoNCkRvIHlvdSBy
ZWFsbHkgbmVlZCB0byBoYXZlIGNoZWNrIGZvciBvbGRfY3J0Y19zdGF0ZS0+aHcuYWN0aXZlIGFz
IHdlbGw/DQpJcyBpdCBwb3NzaWJsZSB0aGF0IG9sZF9jcnRjX3N0YXRlLT5ody5hY3RpdmUgPT0g
ZmFsc2UgJiYNCm9sZF9jcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2ggPT0gdHJ1ZT8N
Cg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiArDQo+IMKgCWlmICghY3J0Y19zdGF0ZS0+ZW5h
YmxlX3BzcjJfc2VsX2ZldGNoKQ0KPiDCoAkJcmV0dXJuIDA7DQo+IMKgDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGlu
ZGV4IDA3YTY4MzI5MzM1Mi4uZWI1ZWQ5ODFiNDBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBAQCAtODg1LDcg
Kzg4NSw4IEBAIHN0YXRpYyB2b2lkDQo+IGljbF9wbGFuZV9kaXNhYmxlX3NlbF9mZXRjaF9hcm0o
c3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSA9IHRvX2ludGVsX2Rpc3BsYXkocGxhbmUpOw0KPiDCoAllbnVtIHBpcGUgcGlwZSA9IHBsYW5l
LT5waXBlOw0KPiDCoA0KPiAtCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNo
KQ0KPiArCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoICYmDQo+ICsJwqDC
oMKgICFjcnRjX3N0YXRlLT5jbGVhcl9wc3IyX3NlbF9mZXRjaCkNCj4gwqAJCXJldHVybjsNCj4g
wqANCj4gwqAJaW50ZWxfZGVfd3JpdGVfZHNiKGRpc3BsYXksIGRzYiwgU0VMX0ZFVENIX1BMQU5F
X0NUTChwaXBlLA0KPiBwbGFuZS0+aWQpLCAwKTsNCj4gQEAgLTE2MzQsMTAgKzE2MzUsOCBAQCBz
dGF0aWMgdm9pZA0KPiBpY2xfcGxhbmVfdXBkYXRlX3NlbF9mZXRjaF9hcm0oc3RydWN0IGludGVs
X2RzYiAqZHNiLA0KPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVs
X2Rpc3BsYXkocGxhbmUpOw0KPiDCoAllbnVtIHBpcGUgcGlwZSA9IHBsYW5lLT5waXBlOw0KPiDC
oA0KPiAtCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoKQ0KPiAtCQlyZXR1
cm47DQo+IC0NCj4gLQlpZiAoZHJtX3JlY3RfaGVpZ2h0KCZwbGFuZV9zdGF0ZS0+cHNyMl9zZWxf
ZmV0Y2hfYXJlYSkgPiAwKQ0KPiArCWlmIChjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0
Y2ggJiYNCj4gKwnCoMKgwqAgZHJtX3JlY3RfaGVpZ2h0KCZwbGFuZV9zdGF0ZS0+cHNyMl9zZWxf
ZmV0Y2hfYXJlYSkgPiAwKQ0KDQo+IMKgCQlpbnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwgZHNi
LA0KPiBTRUxfRkVUQ0hfUExBTkVfQ1RMKHBpcGUsIHBsYW5lLT5pZCksDQo+IMKgCQkJCcKgwqAg
U0VMX0ZFVENIX1BMQU5FX0NUTF9FTkFCTEUpOw0KPiDCoAllbHNlDQoNCg==
