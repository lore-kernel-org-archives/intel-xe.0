Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F5606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOaTlYfy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859210E375;
	Thu, 29 Oct 2026 06:53:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BE10E375;
 Thu, 29 Oct 2026 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793256819; x=1824792819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/w9pICLOcJzO3PnFe8uk1tWH3/LHquRtFlwVLzG+RpI=;
 b=eOaTlYfy2bzuLrRYpVzHzPxQax0tJFiwSVzJL5hGTMdh2lVyoy/LrXZu
 2/T18apf5uxVFQkg8Q9mYmzMU76wp8Efq/b3slWYN91+u202+lrvvl0Wj
 3w/LnUGutbyYJiwcgN5Uuo4kKUGLLtXgWSxbBZrBoU30tpEs7+M6Ad+ki
 RHqDXB5o48n0iliDJ4qVdIzX5yB/MxyvOb2Z+SzcyJBu8ovvM9ixhKl1x
 fqHuyzmfMUQid4cJN1UhzK/ezB7+UhvrUTJGhbmkBHKV80Is8CLmt7h2o
 eUNQUclY3gHxJ0s8J/pTQdf898XM6XfVqw083J33CyO9R/PwQffH24LWC Q==;
X-CSE-ConnectionGUID: lNM6siiQTaWh2d1YCROvOQ==
X-CSE-MsgGUID: Z8Up2I7QQuSsCIa/bkx9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1867770"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1867770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:53:39 -0700
X-CSE-ConnectionGUID: 69nids3hR7KcsOgSMLRjog==
X-CSE-MsgGUID: qRohWbHHRdaCKUPBYjnYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5067111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:53:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:53:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:53:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK1ZQVlf8i++xZzrZqbbaVvRZRiFs6IfYZoIhFXZHibtboj+coOcAFCbWZSSaiZ3WwIqoiN42A+eaV6zmhwOmbpdnSeI4wD+J3WpjQUk0jDzn0Ov1mCZXJV2MFVl8XJ0kF8sojTYLeMiDD7o4rI6JXENx2D/9KkGpZZqe9KHFVcsHlvcgbTUlEC0g68WesDQAAd4CNEepxLYeXjuNSBkgs26x92OXd1+MAdcC7DozbAtSpikkBQNdLdlRFwWy8xwxRwnNSdeL5lFa7SWcy7ugCJNnk+inSvaPwW2tURuocv0U9lHvBK2Y8t5XXMSNsjEaSF5CBVquPtMQb6g+3kPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w9pICLOcJzO3PnFe8uk1tWH3/LHquRtFlwVLzG+RpI=;
 b=UV6j3mKR1Q3Of5Q8Bx1ixK7CHqFxkVNgK/uUEy8At2fAhgRn0dxo5Gj3urBPiTZzJPMfGRmNZqYBXYIzrV/X8KxL990W20Wge+hvWXpjSiT7ZZloc7HGbALEPbEWHKtVlgSex7us1/GGlfp2ImZW/85BikVO+LtBBDzHafkfoBA1gVVX4VS6FvQ70XfGoX/NzTjxtDTbED+0eF6VgDTnuop+AQAF1+9Y6Zv54RnyOkodtbwWqwFb6GSvaOyCmEglX7iR7HxXuXBM635ElhfyolJWLOwgfDnH1w+NjmGQq3x70FwZk1nJtb+ia7HhytYz+RDXcJEjrmGF9/OXAq/cHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 06:51:34 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:51:34 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v2 1/6] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Topic: [PATCH v2 1/6] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Index: AQHdZphOhRsZZpUR2ki2WxzHsdwj6rcT+LYAgAAdwlA=
Date: Thu, 29 Oct 2026 06:51:34 +0000
Message-ID: <SJ0PR11MB5039472D9813F4C3A085825DBA6E2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
 <20261028-vlk-64036-dp-symbol-tg-v2-1-43849c325d32@intel.com>
 <DS4PPFE901A304FA2B0319E172963C40BF2E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304FA2B0319E172963C40BF2E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|SA1PR11MB6990:EE_
x-ms-office365-filtering-correlation-id: c0d3f900-041e-41d8-524a-08df3589122d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261009223027099003|261026140227099003|4143699003|56012099006|11063799006|261022075727099003|261009221227099003|261022105027099003|261021123027099003|261021121427099003|261028144727099003|18002099003|261026121527099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info: KJFStLlmcAfYO9vhBujnlwY4nvqFQYLj0vTZ5VNZ4X1PhRI5gbD+tNjoWF0v+w8TTP0lqiQcVEXll/ZRokZYswsG8IFgjBK4Pirup73n78Eb4J9pxw9jY2ucaO/8PvOsHyfw72uc89P3FGg1yw/pOs7eNLOmSJLxzFVIzNmmzWRN6ruwsutrADFaEQipfJQ7sWuTYQegQhT8hnLlAEO0IVm9VrxFipPCu2dHsLp7Bl4MkX4h4wTbxTT5oN49MxBqss/wj5ZOpngSoSvIFGJrfR6XylXexopuDVmvtu80MrJX1uYNGEWxN6FE2A9c0Hz3uQniAiaROnbHtxH8Bt3TJGb1SMeqwEizzid9qMLvIx83uPxhc6T73jOKHu+b12UmqkKhbUo4Q0aOUWNd2c/ZokmsVw6IdjpbR3nv/zauiHG2Jh/tYfnObxCkcmUrNkW2C5Ui5PsNoWtKJ6b2xp6yVTP2nLkGfJDCPxU3nOF86DifK5uUNaQ9nX0C+8ZsMYe28OebDJAI5d3hMWSGukiZn6yeAac71c2Jfg23t5RJ9zMeTZIks4HnDFpyS71SqMnRA9SApxrtsnimBymW2EjFqFhJfvlm5PdDDqxNxIEa4+4/zMCOJHmtBYIgK0LiNlsdfqTsCmOGXwCYcnoBHIOK35396XbmaBZB++UKbckDGsPY3YKhkiNHgbXCwHFzYLXolYtxx5pHfS6dCZwVOzyUBzWWdsokaFLSbgHUJK6CmG8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261009223027099003)(261026140227099003)(4143699003)(56012099006)(11063799006)(261022075727099003)(261009221227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261028144727099003)(18002099003)(261026121527099003)(22082099003)(6133799003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGRsaEQ2Z25uL2wrUloveVlwUXI5Vlp0dk5qU1BDWHY2ZktycnNxaHh2elRL?=
 =?utf-8?B?R2FyK3phQjZHcXRsaGpISXBWRXRHN0J5TjdLQ3pGdHA4UzBoUjNOSGxvd0RQ?=
 =?utf-8?B?dlF1dC9OM1IwU0YvS2FNdHBtaWwxVmdlUkpTUXMyZ1ZKV2hOYklxUCtVWGF2?=
 =?utf-8?B?NFBRODMxWVUxMTRUUXlaQmkvQzJpVVBkZDkrNUFGbngzZFBoUWNBN1RleEFj?=
 =?utf-8?B?MnVDMndLTXQyb2VSSThaQU1kbVkvVjFSUFgvNzBHSEk3eEJUZUx4alhyM1lk?=
 =?utf-8?B?TDZDVm9WOThXN214STNXWUlJM1daWC9ZbmxwZnNSOWtxQVlEREZsUDUvYUdh?=
 =?utf-8?B?VlQ5M2hCaVhTZmFPU2lsM0JycG8yYWtMUWZYS0pNWmRBWHJlOGZwaWwwVy8w?=
 =?utf-8?B?TUxlYUZBL2ExL0dWRzhBVmllYSs4QjQ5NEd0Rit3TWYrU1ZzeW9BTFZHVFlu?=
 =?utf-8?B?QkpSREgzNXh5S3pabUZiZ3lTRjFXVFAwNjZnNC9TQ2lUNklBYTQzRHFhcFI1?=
 =?utf-8?B?eWgwRTh3NzFYWXlWM1grNWNVSTN1RlhtaTduS2lmZm5lRjNKWFVYd3dzbjRi?=
 =?utf-8?B?eTZZWmNCVlJuSWhTNjlIREcvUEpMSlNRc2hsQk4wRkcxSVNDY3lqdVVvZTdw?=
 =?utf-8?B?RVFvOXVSWGVqOE1nanFOVzR4dWRORFExb3V4OUQ5dXdrb2JDSnA5Z0NtTEV0?=
 =?utf-8?B?UGxHUHF6MGl2Tkx6Z0hkdEhOcTZleVVqMHp2SEdrb01GUm1IL2tTdGpRSGZ1?=
 =?utf-8?B?bWZmV0pINk9XMVlPNUc4MlhGc20wbEUrbjFhU1dDMlZrZDVVYThHb21ITEtt?=
 =?utf-8?B?NTE5QXpkcVgydDhOQ2ZOcTFZNnBsdjA1RUdWOUZOenZnRUZqb1ozOEVlcXFV?=
 =?utf-8?B?c1JUNDA4WTRxZmY1d3VKaUZuOFdtK0pTNFhwU05mb1BZSnNBSTBrcUZjV3RP?=
 =?utf-8?B?VG1qVm93MTZpaEswTlEwNHErT2FyeTV1K2xnUXVybGxnMnlud0lEV1RBTlpS?=
 =?utf-8?B?L1FlaHhob0ZjVEZTc1lUTFp3VXYwV21PL1IvQm5jWWx2TnZqdGc5V1p2bGU2?=
 =?utf-8?B?RE9JRzBVL3YydW9lT1poZTF3SC9YTVlwOGNkWFNncm1zTTdKcmJ0aU8wVXcy?=
 =?utf-8?B?MDhmMkk1S3N0MjQzL3h1SHlFUlZmR0l5UzdGTW10NFphWTJzQTFtOWIwdGRv?=
 =?utf-8?B?SU4wcFBPM25oWlZJRzI3WFNrdS9QUFJNK1BoQjJGOW14S0ZhNXVCZUQzdlNm?=
 =?utf-8?B?bFJnd0ZKcUhNaTErQmlpM0ZPMkt6eS9STkFodGgvQWZJTnJzNUZLdUlSUkdh?=
 =?utf-8?B?L1d3ejFocHdIbmZQSVduczdOSWFndytjWStYZzJqclBwY2RDbnlybXIrSzN2?=
 =?utf-8?B?OVBXOGNybVBPQU5nMlBoZ1Y0QWZYRmxlemx4Mmw0d1pSc1lvRG1aTUlOaldN?=
 =?utf-8?B?azVIdzh6STVEWWEzeTVWa3pVZnNZNVVlU3ppOVNXRlRxZS80NTlqMzVoaTVi?=
 =?utf-8?B?OVptNFpYUFV4ek9LdnNCekdpZTJIVmdITTVJUDVCOGdIZXRBNWJwKzJDYVBj?=
 =?utf-8?B?Uk1OOHNBSTBWUFJpbjZtSG5qUU1PUEtkMDBnREszZVp5UklSL2gzZDhrbVho?=
 =?utf-8?B?dEp0ZkZtLzRFVktQOXU5Rmx2WUtCQTF3c3VjNEJJc21ralNwcmxrZnZzd0Z4?=
 =?utf-8?B?bzRGMVhNaDVTTU4zdFVOKzhINGxaNnZpSEVPUnZRNGdXTVMvczhqNzVNczI2?=
 =?utf-8?B?RFRxVVZFcHdnTUIvalFMR2c3cWFPOHRadzlNczRGRXJIOW9KWFBWN2xiTEp2?=
 =?utf-8?B?aDN2WloyK0tXcmdqeVMwS0NNZjU5R09kRVlhdWhzZDBscEhXVVZnOFBTbTlU?=
 =?utf-8?B?Mk9OM0ZVVjEzRk9EZTFHWFBmakFVcUJRMElzZDRVbjZFSDZmUFcwVWU2VzI3?=
 =?utf-8?B?MTdIbHR0VzNUTDZRRDcrVVRpQXAxekNxRkFzTnRmUisyRGJJemJQUDN5T1BC?=
 =?utf-8?B?MWRPQW5NZjNzQWlzNUtBUkM4cWNtcFBneEcrWUUxM2R4SlNoMFd0NER1SXhE?=
 =?utf-8?B?aERZYmJQZkQyWm42SktwS0grY3RWM0YzY3ZjQ2k3eW9abDNaS2hWZVhlUzhY?=
 =?utf-8?B?QkJvTi9aYTJ0RFhyMGgyWEpNK0hBb1o1RGtQaDczSGhRelNuT3pYT0hQNXU3?=
 =?utf-8?B?bnl4TUFRbnM4RDk2STY1clc5T0lRUnhxTHY0VXo3TGJWYlJHZm9uTmo1WUdT?=
 =?utf-8?B?eXQrUkpTMnRYOWhiUzI3dS8wcnRiZTh4ZFczanY0UU9OVzJSN2RKZ1kwSHlQ?=
 =?utf-8?B?WTlQUTAybnROVmRraUlNSmhJVnBmUmFlR2laMXJEelVqRGp5YS9kUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L5N7BeDyHKY4k+fEEuNrRzpb2Yg8OW9iWxLE62A7byJ6IEBZGyNM3i/fhx8ln7LOvwM/MnD3VqlDKamNSASIIgCpYbjrlXkGhplDarz64lTU+6vIgd2Hcgq3jjJELBPg7/uMh9p2NGTEZG2jwVzp5hMH5VmtxQr9ntyqEkoss6LXfHWH1Nr90d41/zlnGh+czUENNxs1MH+mBZkfRMeq6j0/Mvq7I+OL5RXegSnhZxJsHc3sJDpVOM095qM2bieRYPMb10OxM0nUGBTbA2AHSCtR9iuEhpbyqKoUakdmhhGNe7lmuCbWr18ds6CnwZo1jNnQAp8iF7egDP6+kqHMXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d3f900-041e-41d8-524a-08df3589122d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 06:51:34.1632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CrJeibIBXHH8Sm4G2d1hl9g9HDigHp9PD8NR0t26pJiAJgy18Q21a/GKbIQZPXIgHUM3fjf3gNHARMI3bt7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbmRwYWwsIFN1cmFqIDxz
dXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMjksIDIw
MjYgMTA6MzQgQU0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT47IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBp
bnRlbC5jb20+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2MiAxLzZdIGRybS9pOTE1L2RwOiBGYWN0b3Igb3V0IHRoZSBEU0Mgc2xp
Y2UgY291bnQgYW5kDQo+IGxpbmsgYnBwIGxvb2t1cA0KPiANCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
djIgMS82XSBkcm0vaTkxNS9kcDogRmFjdG9yIG91dCB0aGUgRFNDIHNsaWNlIGNvdW50DQo+ID4g
YW5kIGxpbmsgYnBwIGxvb2t1cA0KPiA+DQo+ID4gTW92ZSB0aGUgRFNDIHNsaWNlIGNvdW50IGFu
ZCBsaW5rIGJwcCBkZXRlcm1pbmF0aW9uIG91dCBvZg0KPiA+IGludGVsX2RwX2NvbXB1dGVfbWlu
X2hibGFuaygpIGludG8gYSBoZWxwZXIsIHNvIHRoYXQgaXQgY2FuIGJlIHNoYXJlZA0KPiA+IHdp
dGggdGhlIHVwY29taW5nIERQIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9yIGNvbXB1dGF0
aW9uLg0KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDUxDQo+ID4gKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IGluZGV4DQo+ID4gYmY1ZTg3YTcyMTA4ZWFm
Mjc0ZjI0YmM5OTdmMmU4ZTJjYzgzMjBhMC4uMzgyNzczN2MwZDgwODIyOTQxM2VmOTYNCj4gPiA5
MDgyZDU5MjQ5YTZiOTZiMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMNCj4gPiBAQCAtMzYyOCw2ICszNjI4LDM1IEBAIGludGVsX2RwX3F1ZXVlX21v
ZGVzZXRfcmV0cnlfZm9yX2xpbmsoc3RydWN0DQo+ID4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0
ZSwNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgaW50ZWxfZHBfZ2V0X2Rz
Y19zbGljZXNfYW5kX2xpbmtfYnBwKGNvbnN0IHN0cnVjdA0KPiA+ICtpbnRlbF9jcnRjX3N0YXRl
DQo+ID4gKmNydGNfc3RhdGUsDQo+IA0KPiANCj4gV2UgdXNlIHRoZSBuYW1lIEludGVsX2dldF9z
b21ldGhpbmcNCj4gV2hlbiB3ZSB3YW50IHRvIGRvIGEgcmVhZG91dCBmcm9tIHJlZ2lzdGVycyBh
bmQgZmlsbCBpbiBjcnRjIHN0YXRlIHRvIGdldCBpdCByZWFkeQ0KPiBmb3IgZWl0aGVyIENvbXBh
cmlzb24gb3IgZHVtcC4gSGVyZSB0aGlzIGZ1bmN0aW9uIGRvZXMgbmVpdGhlciwgdGhpcyBpcyBh
Y3R1YWxseQ0KPiBkb2luZyBjb21wdXRhdGlvbi4NCj4gQ2FuIHdlIHJlbmFtZSB0aGUgZnVuY3Rp
b25zIHRvIHJlcHJlc2VudCB0aGF0ID8NCj4gDQpXaWxsIHJlbmFtZSBnZXQ9PmNvbXB1dGUNCg0K
VGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cg0KPiBSZWdhcmRzLA0KPiBTdXJhaiBLYW5kcGFsDQo+IA0KPiA+ICsJCQkJCQlzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yDQo+ID4gKmNvbm5lY3RvciwNCj4gPiArCQkJCQkJaW50ICpkc2Nfc2xpY2Vz
LCBpbnQNCj4gPiAqbGlua19icHBfeDE2KSB7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAq
ZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ID4gKwljb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSA9DQo+ID4gKwkJCQkJJmNydGNfc3Rh
dGUtPmh3LmFkanVzdGVkX21vZGU7DQo+ID4gKw0KPiA+ICsJKmRzY19zbGljZXMgPSAwOw0KPiA+
ICsNCj4gPiArCWlmIChjcnRjX3N0YXRlLT5kc2MuY29tcHJlc3Npb25fZW5hYmxlKSB7DQo+ID4g
KwkJKmRzY19zbGljZXMgPSBpbnRlbF9kcF9kc2NfZ2V0X3NsaWNlX2NvdW50KGNvbm5lY3RvciwN
Cj4gPiArCQkJCQkJCSAgIGFkanVzdGVkX21vZGUtDQo+ID4gPmNydGNfY2xvY2ssDQo+ID4gKwkJ
CQkJCQkgICBhZGp1c3RlZF9tb2RlLQ0KPiA+ID5jcnRjX2hkaXNwbGF5LA0KPiA+ICsNCj4gPiBp
bnRlbF9jcnRjX251bV9qb2luZWRfcGlwZXMoY3J0Y19zdGF0ZSkpOw0KPiA+ICsJCWlmICghKmRz
Y19zbGljZXMpIHsNCj4gPiArCQkJZHJtX2RiZyhkaXNwbGF5LT5kcm0sICJmYWlsZWQgdG8gY2Fs
Y3VsYXRlIGRzYyBzbGljZQ0KPiA+IGNvdW50XG4iKTsNCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQkqbGlua19icHBfeDE2ID0gY3J0Y19zdGF0ZS0+ZHNj
LmNvbXByZXNzZWRfYnBwX3gxNjsNCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJKmxpbmtfYnBwX3gx
NiA9DQo+ID4gaW50ZWxfZHBfb3V0cHV0X2Zvcm1hdF9saW5rX2JwcF94MTYoY3J0Y19zdGF0ZS0+
b3V0cHV0X2Zvcm1hdCwNCj4gPiArCQkJCQkJCQkgICAgY3J0Y19zdGF0ZS0NCj4gPiA+cGlwZV9i
cHApOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICBpbnQgaW50ZWxfZHBfY29tcHV0ZV9taW5faGJsYW5rKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlLA0KPiA+ICAJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUN
Cj4gPiAqY29ubl9zdGF0ZSkgIHsgQEAgLTM2NDIsMTIgKzM2NzEsMTIgQEAgaW50DQo+ID4gaW50
ZWxfZHBfY29tcHV0ZV9taW5faGJsYW5rKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0
YXRlLA0KPiA+ICAJICovDQo+ID4gIAlpbnQgbWluX3N5bV9jeWNsZXMgPSBpbnRlbF9kcF9pc191
aGJyKGNydGNfc3RhdGUpID8gMyA6IDU7DQo+ID4gIAlib29sIGlzX21zdCA9IGludGVsX2NydGNf
aGFzX3R5cGUoY3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0RQX01TVCk7DQo+ID4gLQlpbnQgbnVt
X2pvaW5lZF9waXBlcyA9IGludGVsX2NydGNfbnVtX2pvaW5lZF9waXBlcyhjcnRjX3N0YXRlKTsN
Cj4gPiAgCWludCBtaW5faGJsYW5rOw0KPiA+ICAJaW50IG1heF9sYW5lX2NvdW50ID0gNDsNCj4g
PiAgCWludCBoYWN0aXZlX3N5bV9jeWNsZXMsIGh0b3RhbF9zeW1fY3ljbGVzOw0KPiA+ICAJaW50
IGRzY19zbGljZXMgPSAwOw0KPiA+ICAJaW50IGxpbmtfYnBwX3gxNjsNCj4gPiArCWludCByZXQ7
DQo+ID4NCj4gPiAgCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDMwKQ0KPiA+ICAJCXJldHVy
biAwOw0KPiA+IEBAIC0zNjU2LDIyICszNjg1LDEwIEBAIGludCBpbnRlbF9kcF9jb21wdXRlX21p
bl9oYmxhbmsoc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gPiAg
CWlmICghaXNfbXN0ICYmICFpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpKQ0KPiA+ICAJCXJl
dHVybiAwOw0KPiA+DQo+ID4gLQlpZiAoY3J0Y19zdGF0ZS0+ZHNjLmNvbXByZXNzaW9uX2VuYWJs
ZSkgew0KPiA+IC0JCWRzY19zbGljZXMgPSBpbnRlbF9kcF9kc2NfZ2V0X3NsaWNlX2NvdW50KGNv
bm5lY3RvciwNCj4gPiAtCQkJCQkJCSAgYWRqdXN0ZWRfbW9kZS0NCj4gPiA+Y3J0Y19jbG9jaywN
Cj4gPiAtCQkJCQkJCSAgYWRqdXN0ZWRfbW9kZS0NCj4gPiA+Y3J0Y19oZGlzcGxheSwNCj4gPiAt
CQkJCQkJCSAgbnVtX2pvaW5lZF9waXBlcyk7DQo+ID4gLQkJaWYgKCFkc2Nfc2xpY2VzKSB7DQo+
ID4gLQkJCWRybV9kYmcoZGlzcGxheS0+ZHJtLCAiZmFpbGVkIHRvIGNhbGN1bGF0ZSBkc2Mgc2xp
Y2UNCj4gPiBjb3VudFxuIik7DQo+ID4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiA+IC0JCX0NCj4g
PiAtCX0NCj4gPiAtDQo+ID4gLQlpZiAoY3J0Y19zdGF0ZS0+ZHNjLmNvbXByZXNzaW9uX2VuYWJs
ZSkNCj4gPiAtCQlsaW5rX2JwcF94MTYgPSBjcnRjX3N0YXRlLT5kc2MuY29tcHJlc3NlZF9icHBf
eDE2Ow0KPiA+IC0JZWxzZQ0KPiA+IC0JCWxpbmtfYnBwX3gxNiA9DQo+ID4gaW50ZWxfZHBfb3V0
cHV0X2Zvcm1hdF9saW5rX2JwcF94MTYoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCwNCj4gPiAt
CQkJCQkJCQkgICBjcnRjX3N0YXRlLQ0KPiA+ID5waXBlX2JwcCk7DQo+ID4gKwlyZXQgPSBpbnRl
bF9kcF9nZXRfZHNjX3NsaWNlc19hbmRfbGlua19icHAoY3J0Y19zdGF0ZSwgY29ubmVjdG9yLA0K
PiA+ICsJCQkJCQkgICAmZHNjX3NsaWNlcywgJmxpbmtfYnBwX3gxNik7DQo+ID4gKwlpZiAocmV0
KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4NCj4gPiAgCS8qIENhbGN1bGF0ZSBtaW4gSGJsYW5r
IExpbmsgTGF5ZXIgU3ltYm9sIEN5Y2xlIENvdW50IGZvciA4Yi8xMGIgTVNUDQo+ID4gJiAxMjhi
LzEzMmIgKi8NCj4gPiAgCWhhY3RpdmVfc3ltX2N5Y2xlcyA9IGRybV9kcF9saW5rX3N5bWJvbF9j
eWNsZXMobWF4X2xhbmVfY291bnQsDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KDQo=
