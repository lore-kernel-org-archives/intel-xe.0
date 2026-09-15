Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C69C88E72
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 02:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F04310F81B;
	Tue, 15 Sep 2026 02:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f647IC8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD51510F8AB;
 Tue, 15 Sep 2026 02:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789441114; x=1820977114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zoiNl5T2oLUcj9sqH8eqVLCd2ESi7NzOErUJWjb9CIQ=;
 b=f647IC8jGDe/7ZqAWEvmaLdxYNPjDwIc/qGMo7mgaer9JsCFdfl4BZDC
 0Vdpouy+NcHPHDqhK++F7KEfO3qpO+MDE8vbv5iP3drLyn8HAaM2rpb+c
 VmAZ8+atNv9E7ZlKIdb7pnE3dtAuLPp3/7P8IB5AQirmBxtnACxvvab99
 MjppRSDuOFucDvHYAA9OXnc/zP1KZsilxVr6w8c3Chy2olMypD7nbErPp
 YGYlv42w+0snDoeuhhFGkYd+7+dGE27hKAT6LBLre/5IpCbPxa/ipvMq+
 LNk63RK+J/Q7r68Nn6J/K8uRWdNnbo+8PfEw8Ve5m/bE6SxtIooX/Ffho Q==;
X-CSE-ConnectionGUID: KJvo/aDOQwm9VM9v83HyXg==
X-CSE-MsgGUID: 20NfOvuyRKmM9y4zVEhD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112564411"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="112564411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 19:58:33 -0700
X-CSE-ConnectionGUID: ODi6HS3iT/ar+euWp4ZV2g==
X-CSE-MsgGUID: sEZxplYtRUKBxHwrTr1l+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273336105"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 19:58:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 19:58:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 19:58:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 19:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enJ8lwAw9KBHrdgryE5PHsZIhdOZYNb9dOvIGyMeuYXX0QSvE4R9RfgKU51vFLPd8447Zw6ePCkknnxRMA5zNLhs84lbujzLMomKLrv4Q++kPQB7qr3M5iRoAEYYsjpcJQgnm7hvtACFBhuulEuh9l14RhN9sZTRWf4w8iZER5IbJ23yVWTFtqJ6rwhuptPQPHZwzjI7PrnMjfObokLE9P1s9kzlVhvWYf6dwfKgIKLiEKWT5pPSW1SWKg303+KQmHrDgQ82SMvWlOF4IM6j/0kO2MwuzLCf2IEitdcp6YN+u27wLViukhnTFaoop5c7LNE+3xEbFhpDpRp/6kvB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoiNl5T2oLUcj9sqH8eqVLCd2ESi7NzOErUJWjb9CIQ=;
 b=Y74ugkWIuvHg6s8QlTgftwhwaP5UuMYudiY6gopLaf4IMRr8zkon9Zx3QZNJLRoZCS4MEOiEDgzvZjbeHXmIO8uOQuI1WngfCrV3HZIyL34YVb6o4FSudWoJgiC7nMfkZbC0NWnhxKWWXKFTACK0WcXPr0BnDWwKw1fKMx0ZGTiIf1IXTc18Z2SzzbnY8ECsNweVSgSY5RHj5j+IENYtGR3qSm6gzDbrJY8Bv5QxTgueVb1mP0NnE2E8qSZiWeWKEs9pV5uGxpU+EOz/GQmlb+RKgPqqOIUn0BUFEG0/YCu10RtOiLeL1fTQO5GMp57f2Wa54FKdYbZ/IqVBEtT5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 DM3PPF7C7D8332C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 02:58:29 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:58:29 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Topic: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Index: AQHdNFm37szFkRcBEEiu/WLgFx6WsLa7EcYAgBP6bDA=
Date: Tue, 15 Sep 2026 02:58:29 +0000
Message-ID: <DS0PR11MB8049DA494121E72BB85F3AA6F9BA2@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-11-animesh.manna@intel.com>
 <fa29aad5aaab3725d9653def18afa6407002b67d.camel@intel.com>
In-Reply-To: <fa29aad5aaab3725d9653def18afa6407002b67d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|DM3PPF7C7D8332C:EE_
x-ms-office365-filtering-correlation-id: 9762c91e-0fa3-4dad-9c34-08df12d53879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 1ehAbqVbauPqw/60GKFWTjgWQUCroz6CQ8aXB+SdGJaXHx6480luMEKAuW5FbduVwfuFbAS+5zDj2wjhGwwSuy7x2uHi5k0RpYcn1k6wWxtrYhSeIltZEffZRZzwXOHcn40yxSm9/BJstPVWApddlaaxIPjTN278p6gdvEeFDmk1UEnzo75kx2Wcks6WIVp5ROSzYadKa57C+fUp1NSLVYDizpEOxNushsbkwv/LUJ7MrxfN1AYK1xMb04OVDfEWVlVcS07PI34n027CN6yFAdCjnxT2NLHHRzOA8L9JUSy1Q9hx5oIeFlYq6lJtp8aWk1zTaegsUrGy+MohINmQ8Rjz6/wPn2be190IMCrWMUZc/+DKezYSE37hvw54zDD46A8dr8aFCAQ9oH8fQkN+jk7F19Cb5hvBV0y2Y7Np6mCvpl3InjmQ29EpaI3H8g7E1di8QP0G/lgKG3IWmaWSFJ4i1Uq9sxpvMB3830nYxgCPSoE+mJ2/wsPBxEi27g31N1iFjg2SPE6H4ZVvzPnNE4fQ5M+SgQ3LfJOVG9PGrMLuljVS0Lg+vOL+Ox7PlK5MDlsmsTsrIqAnPL5PGemZ5qEaNibhJ1OXxC+jWn5yFP2dO7s0QLGyhTVD24vCCCEahJOzcUp4KAXLNPKltQFn4Jbe1Gc041y55JmW5VlGurnKXIt5gJ8hWtPafAEId6IxtBV1O2ESYQO8kx61t2ruuweNNMVk+M4D08Z2Q15xhhE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXZZdy9hTDNEaWUzbXVQWkRUQ0ZNQUQ0SWNuWGg4TVF6OHo2bC9JRVBKSjdW?=
 =?utf-8?B?dy8yellvSExtM0ZLU0FoQU0wbDl2VndmUHhReFJhdzZTL2V1WTBPSHBCSm41?=
 =?utf-8?B?MEY5dHhrMnFxWkFpNUgvK3RGVjJjWG1mY2IxU3lnMzFVT2M2eVRIcEk0WS9U?=
 =?utf-8?B?bDlPOFM1ZTYvR1BuRkMySlhlUEJrRzJYM0I2emwxNzB5cmUrTFFyeDRjbGRj?=
 =?utf-8?B?SmJpQ0ZwUERidDAyS0lmUVloVVRia2lIZW03THNVMTdjVVZrck9xUVdrdVhY?=
 =?utf-8?B?L1JJaWhzOW1xNzRnRHhxVCs3RzJQRGM0bFBySGlPUFZFaHhOTzJOM3l4dVR5?=
 =?utf-8?B?clJFb3dsN3U3T2pyUnNyYmkraHA5ZDZ5TVYwb2RKbEEwYXppYkFVTkVuUXVK?=
 =?utf-8?B?SjdZdTh4WDZsYWI1SjZWZ2huSTNMUDdWMzVCUm84dDJadFJxZEZMUmZwanZ5?=
 =?utf-8?B?Qy9kQ2dyRVdVVmpKS25mNjVwajR3SDJ3Q0Z6SitKQmxXQ3UwalNvMGFObzVC?=
 =?utf-8?B?b1NncjFBbE14NkFQU1FRdWJsNHowUVZ2S3hCVS9lL05FNmtpMlhzUjFFM3Zo?=
 =?utf-8?B?VHEwcll1RENSbFU3dm04TUJPOXgvTlZGdkNQM1g2a3hvblZxY0tLQzhlZGtQ?=
 =?utf-8?B?UEJYMVByMzJmaDZEYThCeW9WQ0IvZXJwWW1tanliRWNRVkFLbml5akVxS1Y5?=
 =?utf-8?B?dTh0bzVqS0ZkWFRCQ003T1oxQ3pjTEZRbkxkOTh3dTBEdTNBSStONHlzYTFQ?=
 =?utf-8?B?V1ZPa3lCdjdOWEt0WFppKzY1VG4zQlRjSHZTdVZ3RUViZU50cGFXSUFJeUwy?=
 =?utf-8?B?QlZRcDBETEdUVHRYZjFqSENPMkhNeE0vaVlxWWlodXZ2R01yaXNLNUo1ZlQy?=
 =?utf-8?B?WTYwN0NaZzQ5Qm85dlhPZUZQZWNrdjhGdEJQRVBXRHh5SEphMXBCL3l5TFd0?=
 =?utf-8?B?Q2gyL0lzdzhsRU1hUEd6aHRySUo0MGpPSHZEbnF3OFRuU1dYNWQ2K1ZQVkhM?=
 =?utf-8?B?MFRIT2hMTXl1QTBwQUlQa2tNdTEyU2JSN084aXZ4cmxQRkFUUXlUMGFXRUIy?=
 =?utf-8?B?djBSeEFuSk5oemdOR2trcVlWWHNFTGoxb0NEVFc4Uko2c3BRNy93SzlmOXBn?=
 =?utf-8?B?MTBjUndScUpnWjZLazhuaFllcUx0ejBkb0YveG9EZUsrUjg2R3hWOVVtLzZL?=
 =?utf-8?B?c0NzQ0RtSk50NEw2VUFPS1Z6d3ZFamE5RzhDK0wwQUxBNDh3VDErUksyV1RN?=
 =?utf-8?B?ZVR3VFd6NDArQ3hla2FuUUVVRFN2N1FFWE9ZZG5hZHpKZVkvOXJMYXAwUUFw?=
 =?utf-8?B?cFkySU5HQlczTlovODgyalRlNDkxb0pzd3RDZkRKd0ZJeGFoM1JEVTVpamlK?=
 =?utf-8?B?cXBBSzY3Y0tPSXBxcVZQZDZnZTNMTjZpcnZ1L3l5ZmZNK3ZHUXNZT2RSY1hR?=
 =?utf-8?B?dk1oUHBuVTN3R1Z5TjlTOWZEUjNwY1MwWTBMejRza0xZTzdYd24ybDVGQW4w?=
 =?utf-8?B?eEJzZ0l6NFY2bWowdG1VbVRvQ1lSZGx0UnhOT0ZSVEs5WDg1enhuOHQ1aFJD?=
 =?utf-8?B?K1YwbnNyanJiamJLVnBJcnp4dGNsTnBEanRmQmp5T1Iybm5HaFVtckV2dDRZ?=
 =?utf-8?B?VW5NWXVPUkR6K2s1RnArN3Jsbm55bHpsQ0JjNE5jUzRPT3I3ck1XZnprQXd5?=
 =?utf-8?B?R3dzNnpLZDlWVzFpcUtFcUFHRGVqem9XcW9jN3hISW1IeVlrZTkwcTBYeHRw?=
 =?utf-8?B?ZFBTVDc3MHBjeUJPM2p3cmF3RDNBZ1RlalNqUWpRbFFUYWNPWDl6cXlIc2s4?=
 =?utf-8?B?ZWpBeUErNUo3TUlud3RzUldzR3AyeHZtLzNzRVA1dkJneUxpVmlTSjlXZkhF?=
 =?utf-8?B?dWRGa1E0elJyei9kdGZza2ZrbjNyWlN4aUdBbzN2Sm1xZFkwNENzc0daWGw1?=
 =?utf-8?B?bW5abkxLTHF6MklGN3p0dHpCYzVDR1EyK3hnVkhCcWRyeDR6ZGV3ZDlIcjhv?=
 =?utf-8?B?bXBuV2RlUjFtMEpTa29JRlF1TlFOUmZzeHV4N3JmYkdCSzlPLzdkWUNQY3E5?=
 =?utf-8?B?dG1HSlJHTjFDSVFHTmhZdHFPRWdpb0w5WWEveGpUR1NJemh1MUFNN3BnR1Nx?=
 =?utf-8?B?WVkycENnRUtYVnZ0cHM5TEwrcFBma29veU1oeXZpNU9rRmJtc2hSU1FTdDRF?=
 =?utf-8?B?Y0tlaVYrUG10OStrMXN1S1pPeVRvbFhTd1g2MWFZWHMweUNpZUZrVGxrU1VX?=
 =?utf-8?B?Y0JxVnhnb25SN0ovcHYxNm8xMXh2REFwaTNzR1dwa2VDNFFXWlJXeEVTQXF5?=
 =?utf-8?B?NnBYai8wOEE0RWYxck4ra0tneEZsWUlaQXFzZFhUdk9JZ2lHMmp3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2CG8iZGlc+OcqhQ3OxGuYsgRjlh4nx1y7UG7PUs+XXfiHL0GmY5n8pbq3nN/s+OD6TnFVbCPSlKQQUB2Qh2b+WgkonTtLHP3IMIsacvd18aHeKzcaAJIfyxpLAVZQ+7eBopAo49/+KBz9J9GLatUvIgq2w9PNB/ZkJYFbwoZOrzqQOYxw7kzKWP3Dc+IicxsbMdxQJAC2HXqYMH2t8qPFzqHyLLnztWTaT6p1XBx1qcp+OIdpe708Mpu5x1Tj4NESkoqrW6X9OE0X9X5OEm9WHSeXytsJBUuZXXhfAkYVWO7h5gD+xYFykylBsip0u+dMe+HVK90Cxsn+ZtbydV+7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9762c91e-0fa3-4dad-9c34-08df12d53879
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 02:58:29.4572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iU9BlRLOYL4Z7YJhjw5OUA/WhnVtDYRf1YQvhmXJgkX+9tEHT3nmOqlFdf/MpDj3uz2nXDNaSPjWyqj8EzbOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C7D8332C
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVy
IDIsIDIwMjYgMjo1NyBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBN
YW5uYSwgQW5pbWVzaA0KPiA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NSAxMC8xNV0gZHJtL2k5MTUvYWxwbTogUHJvZ3JhbSBMVFRQUiBj
b3VudCBmb3IgRFANCj4gMi4xIEFMUE0NCj4gDQo+IE9uIFR1ZSwgMjAyNi0wOC0yNSBhdCAxMTox
NSArMDUzMCwgQW5pbWVzaCBNYW5uYSB3cm90ZToNCj4gPiBJc3N1ZSBhIEFVWCB3cml0ZSB0cmFu
c2FjdGlvbiB0byBEUENEIERQX1RPVEFMX0xUVFBSX0NOVCAoMHhmMDAwYSkNCj4gPiB3aXRoIHRv
dGFsIG51bWJlciBvZiBMVFRQUiBiZWZvcmUgbGluayB0cmFpbmluZy4NCj4gPg0KPiA+IHYyOiBD
b3NtZXRpYyBjaGFuZ2VzLiBbU3VyYWpdDQo+ID4NCj4gPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5u
YSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uY8KgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKysr
LQ0KPiA+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jwqDC
oMKgIHwgMTYNCj4gPiArKysrKysrKysrKysrKysrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCA4OTBiZjI0ODg1NTQuLmQy
M2YzYmRmMTMzOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYWxwbS5jDQo+ID4gQEAgLTU2Myw3ICs1NjMsNyBAQCBzdGF0aWMgdm9pZCBsbmxfYWxwbV9j
b25maWd1cmUoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVsX2RwLA0KPiA+IMKgew0KPiA+IMKg
CXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShpbnRlbF9k
cCk7DQo+ID4gwqAJZW51bSB0cmFuc2NvZGVyIGNwdV90cmFuc2NvZGVyID0gY3J0Y19zdGF0ZS0+
Y3B1X3RyYW5zY29kZXI7DQo+ID4gLQl1MzIgYWxwbV9jdGw7DQo+ID4gKwl1MzIgYWxwbV9jdGws
IGFscG1fY3RsMiwgbHR0cHJfY291bnQ7DQo+ID4NCj4gPiDCoAlpZiAoRElTUExBWV9WRVIoZGlz
cGxheSkgPCAyMCB8fA0KPiA+ICghaW50ZWxfcHNyX25lZWRzX2FscG0oaW50ZWxfZHAsIGNydGNf
c3RhdGUpICYmDQo+ID4gwqAJCQkJCcKgICFjcnRjX3N0YXRlLT5oYXNfbG9iZikpDQo+ID4gQEAg
LTYxMyw2ICs2MTMsMTMgQEAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBp
bnRlbF9kcA0KPiA+ICppbnRlbF9kcCwNCj4gPg0KPiA+IMKgCWFscG1fY3RsIHw9IEFMUE1fQ1RM
X0FMUE1fRU5UUllfQ0hFQ0soY3J0Y19zdGF0ZS0NCj4gPiA+YWxwbV9zdGF0ZS5jaGVja19lbnRy
eV9saW5lcyk7DQo+ID4NCj4gPiArCWx0dHByX2NvdW50ID0gZHJtX2RwX2x0dHByX2NvdW50KGlu
dGVsX2RwLQ0KPiA+ID5sdHRwcl9jb21tb25fY2Fwcyk7DQo+ID4gKw0KPiA+ICsJYWxwbV9jdGwy
ID0gaW50ZWxfZGVfcmVhZChkaXNwbGF5LCBBTFBNX0NUTDIoZGlzcGxheSwNCj4gPiBjcHVfdHJh
bnNjb2RlcikpOw0KPiANCj4gV2h5IHlvdSBhcmUgcmVhZGluZyB0aGlzLiBDYW4ndCB3ZSBqdXN0
IGNvbmZpZ3VyZSBhbHBtX2N0bDIgYXMgd2Ugd2FudCBhbmQNCj4gdGhlbiB3cml0ZSB0aGF0IG9u
ZT8NCg0KT2ssIGNhbiBiZSBkb25lLg0KDQo+IA0KPiA+ICsJYWxwbV9jdGwyICY9IH5BTFBNX0NU
TDJfTlVNQkVSX09GX0xUVFBSX01BU0s7DQo+ID4gKwlhbHBtX2N0bDIgfD0gQUxQTV9DVEwyX05V
TUJFUl9PRl9MVFRQUihsdHRwcl9jb3VudCk7DQo+ID4gKw0KPiA+ICsJaW50ZWxfZGVfd3JpdGUo
ZGlzcGxheSwgQUxQTV9DVEwyKGRpc3BsYXksIGNwdV90cmFuc2NvZGVyKSwNCj4gPiBhbHBtX2N0
bDIpOw0KPiA+IMKgCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIEFMUE1fQ1RMKGRpc3BsYXksIGNw
dV90cmFuc2NvZGVyKSwNCj4gPiBhbHBtX2N0bCk7DQo+ID4gwqAJbXV0ZXhfdW5sb2NrKCZpbnRl
bF9kcC0+YWxwbS5sb2NrKTsNCj4gPiDCoH0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jDQo+ID4gaW5kZXgg
Y2I5MmNmZjkwNjE0Li4xZDU4NzNjYjY0ZjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuYw0KPiA+IEBA
IC0yMjY1LDYgKzIyNjUsMjAgQEAgaW50ZWxfZHBfMTI4YjEzMmJfbGlua190cmFpbihzdHJ1Y3Qg
aW50ZWxfZHANCj4gPiAqaW50ZWxfZHAsDQo+ID4gwqAJcmV0dXJuIHBhc3NlZDsNCj4gPiDCoH0N
Cj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBpbnRlbF9kcF91cGRhdGVfbHR0cHJfY291bnQoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiArCQkJCQlpbnQgbHR0cHJfY291bnQpDQo+ID4gK3sN
Cj4gPiArCS8qDQo+ID4gKwkgKiBQcm9ncmFtIG9ubHkgZm9yIERQMi4xIGFuZCByZXR1cm4gaWYg
TFRUUFIgcmV2aXNvbiBpcw0KPiA+IGxlc3MgdGhhbiAweDIwDQo+ID4gKwkgKiB3aGVyZSAwOjMg
cmVwcmVzZW50cyBtaW5vciByZXYgYW5kIDQ6NyByZXByZXNlbnQgbWFqb3INCj4gPiByZXYNCj4g
PiArCSAqLw0KPiA+ICsJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApIHx8DQo+ID4gKwnC
oMKgwqAgaW50ZWxfZHAtPmx0dHByX2NvbW1vbl9jYXBzWzBdIDw9IDB4MjApDQo+ID4gKwkJcmV0
dXJuOw0KPiA+ICsNCj4gDQo+ICJUaGUgRFBUWCBzaGFsbCBpc3N1ZSBhbiBBVVggd3JpdGUgdHJh
bnNhY3Rpb24gdG8gdGhlIERQQ0QgcmVnaXN0ZXIgd2l0aCB0aGUNCj4gdmFsdWUgZGV0ZXJtaW5l
ZCBmcm9tIHRoZSBQSFlfUkVQRUFURVJfQ05UIGFuZCBzYW1lIGVuY29kaW5nIGRlZmluZWQNCj4g
Zm9yIERQQ0QgRjAwMDJoLiINCj4gDQo+IEkuZS4gWW91IGNhbid0IGp1c3Qgd3JpdGUgY291bnQg
YXMgaXQgaXMuDQoNClllcywgeW91IGFyZSByaWdodC4NCg0KPiANCj4gPiArCWRybV9kcF9kcGNk
X3dyaXRlYigmaW50ZWxfZHAtPmF1eCwgRFBfVE9UQUxfTFRUUFJfQ05ULA0KPiA+IGx0dHByX2Nv
dW50KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoC8qKg0KPiA+IMKgICogaW50ZWxfZHBfc3RhcnRf
bGlua190cmFpbiAtIHN0YXJ0IGxpbmsgdHJhaW5pbmcNCj4gPiDCoCAqIEBzdGF0ZTogQXRvbWlj
IHN0YXRlDQo+ID4gQEAgLTIzMDQsNiArMjMxOCw4IEBAIHZvaWQgaW50ZWxfZHBfc3RhcnRfbGlu
a190cmFpbihzdHJ1Y3QNCj4gPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+DQo+ID4g
wqAJaW50ZWxfZHBfcHJlcGFyZV9saW5rX3RyYWluKGludGVsX2RwLCBjcnRjX3N0YXRlKTsNCj4g
Pg0KPiA+ICsJaW50ZWxfZHBfdXBkYXRlX2x0dHByX2NvdW50KGludGVsX2RwLCBsdHRwcl9jb3Vu
dCk7DQo+IA0KPiBIb3cgYWJvdXQgaGF2aW5nIHRoaXMgaW4gaW50ZWxfYWxwbV9lbmFibGVfc2lu
az8NCg0KQXMgcGVyIERQIHNwZWMgd2UgbmVlZCBwcm9ncmFtIGJlZm9yZSBsaW5rIHRyYWluaW5n
LCBidXQgaW50ZWxfYWxwbV9lbmFibGVfc2luaygpIGlzIGNhbGxlZCBhZnRlciBsaW5rIHRyYWlu
aW5nLg0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KPiANCj4gQlIsDQo+IEpvdW5pIEjDtmdhbmRlcg0K
PiANCj4gPiArDQo+ID4gwqAJaWYgKGludGVsX2RwX2lzX3VoYnIoY3J0Y19zdGF0ZSkpDQo+ID4g
wqAJCXBhc3NlZCA9IGludGVsX2RwXzEyOGIxMzJiX2xpbmtfdHJhaW4oaW50ZWxfZHAsDQo+ID4g
Y3J0Y19zdGF0ZSwgbHR0cHJfY291bnQpOw0KPiA+IMKgCWVsc2UNCg0K
