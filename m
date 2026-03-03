Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D2EDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 23:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044C910E094;
	Tue,  3 Mar 2026 23:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlzTo3DL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C1210E094
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 23:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772581453; x=1804117453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wISHDLggyDPouzuanAYk6MeR7WlFZfW3vYSy8Gkb6zY=;
 b=YlzTo3DLtp7tePAPAZsvlmGR1G1pR8/a0F40SHmE+MFJbWMD5cHOtHD1
 YxkM9eIg7osVuq042P9aUdljuMNQSwR6vKGi0EhA1BQSMOeIPifId7Ob1
 o97n418hKRAFycNSymZ9TEUo5Y3r9pr67uQJFsKofDziHpm+XYfx0lvl7
 Unp5f4zawJ15OaztEAd9z9HwfxTSMWtoknBoOySQUWMEnlYttQyP0LXfQ
 uBdt36nSdcJHQY+YT+HtoNy/0CBaD9rdaWpugSkvLgTdFP1lD8YNEFeVe
 3FTZADpZ4pGDORa+gA8iBk475kqWFk9hp7Q//t/T6XaaJWY4JiLQYtVNA w==;
X-CSE-ConnectionGUID: tjy/vuwUQSKnC8KrhcbX/w==
X-CSE-MsgGUID: /9NzNTBTShC3DBmvyZD+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77502364"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77502364"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:44:12 -0800
X-CSE-ConnectionGUID: yAp4zJDjSBebY92zuiQQfQ==
X-CSE-MsgGUID: G95d4GtDQKaLcuCkBG2K9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222320097"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:44:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:44:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 15:44:11 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:44:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oE2rVtDRSRB9O1UtK4p1EoWgv2SpZ89rsJEtQZx5FPVBKyeNwNEgzzgHZVzaDcE0eLoV5fDMZQHQiSq8GHB7mwH1n+OysGIhcScyVgCEZUembTeY1T9eQ9U1SPiXR49BUisxTrVXciOxc8i5fGo9QRrYMqlqsDCe/j2IGioptqv7rXuPZd/c52hnJLK6iUWyfRBDKVVo3BFY7hs4WjdRG1ggsfRU7r+q7t/0DZ2qtzHydFvl87GECk/jjHWsbAdrnvRgbP//lb3IEDOZQS1l2KKzwdWnAI/LLx8PZU10qMtBfC5gGzfppukUUt6UDLotrVmYTM4kF+UPTbcDfkfRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wISHDLggyDPouzuanAYk6MeR7WlFZfW3vYSy8Gkb6zY=;
 b=CtJp7VvcbPAwVSerao6a1dj9uFififeembyFtHmfkNVO1sl6z1DH3TegJo9WopjAGtN1PUh/6pyKdxDH7o9IE6QLA9hR1R94jlW0dwW1q7QhpO00kVNLnIguoXb/WQLKYkuxuS35HlmrvMAduI7WpOuTsb5qX7fwmD7ge5rGUH6r3jeLgGv1PsFn3eUFakEsvJKdrTN/wgPRZXlGJ7TmqS3LqnFgmYd3F/l4IavyqE1kr+fFUPLXS1MYoU2l4/i42IWD6ZIvc2LQ14/1R4Js8Ui9mLOct+64jpZSbs5BgBQ8q9s0SwAR8d7HXzjyinSkiAEG8igIa79kas3CLuwBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 23:44:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:44:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 11/25] drm/xe: Store level in struct
 xe_vm_pgtable_update
Thread-Topic: [PATCH v3 11/25] drm/xe: Store level in struct
 xe_vm_pgtable_update
Thread-Index: AQHcqFKFYMpoYAxomUO/OSzBNEpD1rWdfpkA
Date: Tue, 3 Mar 2026 23:44:09 +0000
Message-ID: <21bb4ed11411a9f1b927343d6e4b2d440026b950.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-12-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-12-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7358:EE_
x-ms-office365-filtering-correlation-id: 52e8aa8f-e378-42fa-3b62-08de797ec3d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: MRTSzkBFKDXubsEPRURkTSzXtELNR4EOB2XtrJBZcYJmC/Gq4rqHA9Xxq/MPp2ngdKtiwrSbrFp6TFU5j81K6CV8u+7j3h3XpardyARRICll4ImQDHQFxC11DIQgaiyXKvC8Ot/dxqq9kUUo+VLv/THatephushZGvVzDOyaSUG8HkQFT0TIvZ5E+KODi0rfishfb5FgIyda3PIa7bqFDDV7Oz5rhjwvIYhv7HZzBPDXhIhMAnnWFoo7RaQEqqfxiKsrAD4+rNRfPqUceMBQK+5h4HEMO70EnOpbVWiCyn+Jnia+8XHDdrGaw/rlzXn4KoslycYZkBw47Ovlfr10kyYcdLWBoC/JwAkdZmDRBwu+1cAp53fZOb+9jNfuziSBsdTFPYEnzhNYhQcmIfKC1k7ddHpkjrj00hzva7D/po6USkaUpRoiajQ4ykbViQiHkUvPIaBPBm3mwQPpQ6L0R9qQED9xeaEopAuekiMV6ouf4U/v9hw69dOFrX4mWB3wcJ8zag0Ghr9IOtmy+WkR/USQyb/wDuXvjX9/MSCvaJQmslfdHy623wdh2ieWmHDK4efo6yNLXuYVMJzWdXvOzK2MEo2x4Sx1e043Nm0s0ljyZ509CBArKm2smG71/tkqXGr5I3RQYB+gwtLb49gL3ai5VLPO0AiWPlQbYnQs5XmgIDWdf8ASD1LbaZnNCoT85usi8Il4l5zdBB2N8DsW8KlujCBGuN2mekQhVGqyFgCOWY+pJ81gBpgrfc1lC9f32O6qV9Vs7r2lUDbS3+nRXcywwjsWA/2MkFVBOtKUkNc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2RsZlhRdXVCZ3ZCSzlxNjNpZGExMk04eFZQYkEra0dSSURVZFJaTHNiYkNk?=
 =?utf-8?B?QW0rWEdsWTJHMitTU0VxeUZBamlkVFp3bndTTDg5eFZCb3NLQ1R4cXFJZ1ZL?=
 =?utf-8?B?UUVJSVIrem01YjVVV2RlSUxwQ2pjOFhGQVkyV0RuQnBQVmZQYlBzNWgvamxs?=
 =?utf-8?B?Q290RGpxZWpQTFVsUW5PcktIcmF1NGpZUmd0NzlyWlg1SkFnS2xqVHRiV2xk?=
 =?utf-8?B?dXU5bWdLRHpEdEY4ZExQbW90VU5hTUprYTBKaWpZTHlVUllTeVFZZ0c5WnRM?=
 =?utf-8?B?RTJFNk95aytYbkpFbmtnOWJDVzJrNW15K1F0RTVxU0RmSDdaang3cWlCMFpW?=
 =?utf-8?B?VEJpZVJsbktJbkpMTGkyN1BEU3QxbVlxQkVrdllxVnlBNFdIczYyYTg5NHhB?=
 =?utf-8?B?d3EyWmtZbHJycTJEdjV1cElVdTNKL25OWHRrcFh1WjhtN1RQSnBEU0E2b3lZ?=
 =?utf-8?B?QnE1cmZpbjJJaEtkRTFCZytIZU5uTGZkYTlZMXhoT1hhQVl6WlUwMmN0M1BY?=
 =?utf-8?B?cmp4S1Fpb2FaMk5wQjJEaE42YlNkWi9COHBKQVBtd2RsWnI1SGVhUVVDakx2?=
 =?utf-8?B?ODAvajlvOTRqZUhXTXJEaHE0Z1ovVndxcHVFK3cydk0xMG4zZjFJOUVsd04v?=
 =?utf-8?B?TlY4SCtiVlJneDVDQkNNdXBPdnNaclhlNm1qb2tKM3lNeTJOUndNVGYrTTgr?=
 =?utf-8?B?b3VFTjhhRkxwV21iL25CaWRLTzNoaXU1eWNlMnRNRWN0ck1WM0JmWE8yTEJI?=
 =?utf-8?B?bDNqSC9pcnJFTFVvNnNyc2MyUnpJdGZSeEk2QUEycWhoR1pDa29PeVlUZFE0?=
 =?utf-8?B?MnEvRE10UHRBNmZEYjFpcjRuK0s1SjR3YlFOeVVlQm56MFN5M0plVEFObHFM?=
 =?utf-8?B?N0VrZEtaeU5QcHl2OVY1NGVzenhpV0RpVzcrMEcxVE5aeGdRK0Z5cGNTc0Y4?=
 =?utf-8?B?TThxTUxLM0JWcE15amZhL2pOUTJTelV5RHBUSGJEUVdtSWZQOXhLSTFCRU9a?=
 =?utf-8?B?cU9sL3JVZCtrQWlEZ3FUejlld3FRa2c0RlJzZWtTZE5DUFpObkk3dW11STdp?=
 =?utf-8?B?NEJzYU5nTjBzanpJN284RXNwc251M3IxSkFlQ2JXM3laQTBhTXpFVzRtb3dR?=
 =?utf-8?B?OUxRc2MzbTQvSmlWZ1ZKNDJ1VGJuZmg0WjR6dEFzQjd2RHhQeFF5SmRZcHJN?=
 =?utf-8?B?akhNU2xUVWRORHVQN2JEM2k1S0t1a3d3RCsrNW5LMWdGVmtMbWxjeWhkbmQ5?=
 =?utf-8?B?NFZxNmNKd0J5THlvUUNGYjloaS9FNkZGQzlTTG9PRVRSZUZzZzhIQ3RkQkcv?=
 =?utf-8?B?Wkl5OTZLWlZTMStQWlR3NWZXdEJaS0dKbjRIdHgzbkJvTzA2bWVhenNiNGtC?=
 =?utf-8?B?a2RlMHIwM1VNZms5THAreEhjQUVIaTRuTFFzTHZKeU9TbEVsREwxZ2J4R24w?=
 =?utf-8?B?ajVPN3RTVXl4L3YzZFFzajl4NUZHckpFWGRFZDRrdTZKWEdhUlg5WkFJeSti?=
 =?utf-8?B?eEkvUTgvYlN3NFVuQnRjb0xhMHZLVEN2ZTlYalU0RWNCWnpQdmp5YVZ2WmVo?=
 =?utf-8?B?QnN3cnFVTGVHY0hNZ25BUkkvMmRBRlEyd3oyM3V4eWE1dkI3UzJEYXlSODJT?=
 =?utf-8?B?NTcvc0ZUY2JkamlLVVpkeWFrdEI4MjUwN2F0MlUzT29KWCtrL2cwcFZCY1gx?=
 =?utf-8?B?ZlNWcDBRdTR1L3dSWFNvbnd4RnFCZjFYckc4VUcrQkRSN1VMMlU2aitTallH?=
 =?utf-8?B?eno5T0VmbmVKUlB0dmdNcnI2clU0OWlxSFhXOC9JS1JicStzQWRXNWdzQzhu?=
 =?utf-8?B?ZGNlRjJxUXdmMFJMYTQ5WkIwRjdxeHRXQTN1MDdqQUQ2eGxUcSsyT1VwSC9m?=
 =?utf-8?B?QytOOU41Y0hXekMxZ29JSHExNUNRT2o1WDFsTDJDSnRsL2ZiTHhXQXFSenlL?=
 =?utf-8?B?WFdic05PRlZKZWRreUpEd0VYZzB2WVhYazJGTk8vbG02WTNtNDE2VElQdm9S?=
 =?utf-8?B?czQ1M2xTWEdmN0ppZjQwcXVibHhnTmVVMlFkN3o0K2hhUStoRU1ZeWVubkw0?=
 =?utf-8?B?Z0ZjRUV0bTE1ekV0UFdpMFpXTERKK1lCaGpnVzUzUW1uclo2cGRvWDhidExr?=
 =?utf-8?B?SGRKR0lhUEJ3b2tpR3dxMElWeis4dG0vWHVKMitHUE5zTzl4ZkNIN2ZCZ1VM?=
 =?utf-8?B?Q2g1MXMwNDZLdWVhY1VLalJtK2toWWUvZUlicUpmVjVsbWV2dkhLNnU4d0NZ?=
 =?utf-8?B?RERBWXFWdjR5T3V3NXk3SUd2V1dVL0FONlV4K2ozSmdCWnNJc05ncERUVUVq?=
 =?utf-8?B?SzUzZGh2bTlnR0FuNjhkUmM5ZmVHc0JWL0ZrQW4xYkg2TDhFR1pPdk81S0lE?=
 =?utf-8?Q?ZsJ9/AdOBG58wpR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31EB6E3A062DBE49BF4FC4740D6CD7D7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e8aa8f-e378-42fa-3b62-08de797ec3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 23:44:09.1058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGS2qbZQVVj+mrAwNvrYvmprNVAvSLB0pImmfKs2tP6XLRHJ/6t5v1bvaZnKFnYnZGOHlzRmCDNFwMvrZjdyeoEevddu2VYAcqC7ujB9EPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFRoZSBsZXZlbCB3YXMgcHJldmlvdXNseSBleHRyYWN0ZWQgZnJvbSBzdHJ1Y3QgeGVfcHQgaW5z
aWRlCj4geGVfdm1fcGd0YWJsZV91cGRhdGUgZHVyaW5nIENQVSBiaW5kcywgd2hpY2ggYWx3YXlz
IG9jY3VycmVkIGR1cmluZwo+IHRoZQo+IGJpbmQgSU9DVEwuIFdpdGggQ1BVIGJpbmRzIG5vdyBz
dXBwb3J0ZWQgaW4gYmluZCBqb2JzLCBzdHJ1Y3QgeGVfcHQKPiBtYXkKPiBubyBsb25nZXIgYmUg
dmFsaWQgaW4gbWVtb3J5IGF0IHRoYXQgcG9pbnQuIFRvIGFkZHJlc3MgdGhpcywgc3RvcmUKPiB0
aGUKPiBsZXZlbCBkaXJlY3RseSBpbiBzdHJ1Y3QgeGVfdm1fcGd0YWJsZV91cGRhdGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+CgpS
ZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4g
LS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuY8KgwqDCoMKgwqDCoCB8IDMgKystCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHRfdHlwZXMuaCB8IDggKysrKysrKy0KPiDCoDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
dC5jCj4gaW5kZXggNmI1NmU2MmEzNWMxLi4wYTkwZDE0NjBhOGIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3B0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQu
Ywo+IEBAIC0zODEsNiArMzgxLDcgQEAgeGVfcHRfbmV3X3NoYXJlZChzdHJ1Y3QgeGVfd2Fsa191
cGRhdGUgKnd1cGQsCj4gc3RydWN0IHhlX3B0ICpwYXJlbnQsCj4gwqDCoMKgwqDCoMKgwqDCoGVu
dHJ5LT5mbGFncyA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDCoGVudHJ5LT5xd29yZHMgPSAwOwo+IMKg
wqDCoMKgwqDCoMKgwqBlbnRyeS0+cHRfYm8tPnVwZGF0ZV9pbmRleCA9IC0xOwo+ICvCoMKgwqDC
oMKgwqDCoGVudHJ5LT5sZXZlbCA9IHBhcmVudC0+bGV2ZWw7Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKGFsbG9jX2VudHJpZXMpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGVudHJ5LT5wdF9lbnRyaWVzID0ga21hbGxvY19vYmpzKCplbnRyeS0+cHRfZW50cmllcywKPiBY
RV9QREVTKTsKPiBAQCAtMTgzMCw3ICsxODMxLDcgQEAgeGVfbWlncmF0ZV9jbGVhcl9wZ3RhYmxl
X2NhbGxiYWNrKHN0cnVjdCB4ZV92bQo+ICp2bSwgc3RydWN0IHhlX3RpbGUgKnRpbGUsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHUzMiBxd29yZF9vZnMsIHUzMiBudW1fcXdvcmRzLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBz
dHJ1Y3QgeGVfdm1fcGd0YWJsZV91cGRhdGUKPiAqdXBkYXRlKQo+IMKgewo+IC3CoMKgwqDCoMKg
wqDCoHU2NCBlbXB0eSA9IF9feGVfcHRfZW1wdHlfcHRlKHRpbGUsIHZtLCB1cGRhdGUtPnB0LT5s
ZXZlbCk7Cj4gK8KgwqDCoMKgwqDCoMKgdTY0IGVtcHR5ID0gX194ZV9wdF9lbXB0eV9wdGUodGls
ZSwgdm0sIHVwZGF0ZS0+bGV2ZWwpOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiDCoAo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAobWFwICYmIG1hcC0+aXNfaW9tZW0pCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wdF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cHRfdHlwZXMuaAo+IGluZGV4IDkyZDUwNTczZWQxZC4uYWExZDdjMGU4NjY5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdF90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0X3R5cGVzLmgKPiBAQCAtNjUsMTIgKzY1LDE4IEBAIHN0cnVjdCB4ZV92bV9w
Z3RhYmxlX3VwZGF0ZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC8qKiBAcXdvcmRzOiBudW1iZXIgb2Yg
UFRFJ3MgdG8gd3JpdGUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgdTMyIHF3b3JkczsKPiDCoAo+IC3C
oMKgwqDCoMKgwqDCoC8qKiBAcHQ6IG9wYXF1ZSBwb2ludGVyIHVzZWZ1bCBmb3IgdGhlIGNhbGxl
ciBvZgo+IHhlX21pZ3JhdGVfdXBkYXRlX3BndGFibGVzICovCj4gK8KgwqDCoMKgwqDCoMKgLyoq
Cj4gK8KgwqDCoMKgwqDCoMKgICogQHB0OiBvcGFxdWUgcG9pbnRlciB1c2VmdWwgZm9yIFBUIGJ1
aWxkaW5nIGluIHRoZSBiaW5kCj4gSU9DVEwuIE9ubHkKPiArwqDCoMKgwqDCoMKgwqAgKiBzYWZl
IHRvIHRvdWNoIGR1cmluZyB0aGUgYmluZCBJT0NUTCAoaS5lLiwgbm90IGluIGJpbmQKPiBqb2Jz
KS4KPiArwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3B0ICpw
dDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiogQHB0X2VudHJpZXM6IE5ld2x5IGFkZGVkIHBh
Z2V0YWJsZSBlbnRyaWVzICovCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9wdF9lbnRyeSAq
cHRfZW50cmllczsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAbGV2ZWw6IGxldmVsIG9mIHVw
ZGF0ZSAqLwo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBsZXZlbDsKPiArCj4gwqDCoMKg
wqDCoMKgwqDCoC8qKiBAZmxhZ3M6IFRhcmdldCBmbGFncyAqLwo+IMKgwqDCoMKgwqDCoMKgwqB1
MzIgZmxhZ3M7Cj4gwqB9OwoK
