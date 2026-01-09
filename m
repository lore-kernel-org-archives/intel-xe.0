Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F2D1A638
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 14:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA67310E338;
	Fri,  9 Jan 2026 14:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpSXy/GZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E792410E338
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767968645; x=1799504645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bz1Zk0kqcfAmVYAG59BGxh9th5Yx1WtgqxpH1ChQRpo=;
 b=OpSXy/GZsLZ6TPdZ0WRghp+dl673aDtnScbvX5D/nEgBQEwdv4r7/fT/
 e0qW/YBCignagpWNQJvjLSZK5p/zqeZTMsOKXdNw1l1VEW0fSvb7ecIOy
 zZMpTBuqUheiTuqJtbar6q/A3BCVASrcKEQqCP9Ji96zpQdkjahUCt/Nt
 V2kJ5DyQ5hIaixnerNicx6Lj4BnznMiuHILteyVSQeDX2Yr5wzlRtjp3L
 YpVElyV0/F5ZSa2vmmzPkMgPcBsK5XDCWzot0fkZo7gmsFc2gtbolmp6I
 IjjkosY7OdWBKC7XkyqnZWHNlzkL235wpvRNFFJfxjuCHudPOCckXZd6k g==;
X-CSE-ConnectionGUID: ZUucVq81RQKvGiG2/lQ/2A==
X-CSE-MsgGUID: kIPPQXUzTzi0x69ByFiDZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69087154"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69087154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:24:04 -0800
X-CSE-ConnectionGUID: NI7nvU5IRFG1Y/k89KvErg==
X-CSE-MsgGUID: yxLZyfo3TiC66ozyLi15VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203500307"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:24:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:24:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 06:24:04 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyU6FFdj6jKLlBlOM1COqeBglHANh0OXwT+E96viKg7g5OHw5JmstdSp8qkFNCCKpzeGmET0/7bDZDfd6XaKa7czKM5/2aULEa8FJhSfsAGXIShK7pcE8WzjHphPIgzdYxD+Qabh5nTBv0wS1ObO0S5JnijkIcboeeiznIGAbb76k0Ay6A727RZnAEOJySFE2j+2mamf1CKC2V79rCjQZSsKH9a7Lbm25RyoBzh3okLqlqM83tCo/rdDZHymDQfdBJzlCJ2WCpz4V4BDXquqzP2cE3uJSq/pvlBZbnNHiWBScaEYMz1WSegJlPvYKT26Rlik90JlFBZUvCso20rxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JVjDuz6Rktl2FS5sbcnwNX7Aj6s/5NbD8JxZJJrAhA=;
 b=MyTv0BW4hnk0RL+6IWF7n6Bm2ALeOv2JDozS7LzWmUcCVQAMdWpg5FwrRCRn2cOGwS43ALvPdn1LpF4KX5ZJ184UeEXvl9rtVEU8fr8YiNYLrEAhyGBBoHIDxZkNDr/xHwV0+0Yxt3r5DGum0b3d45kX6s9cIxfJ6OtD8qZdBzN3y7bBA9a4/RVVwrG3C9SI1yPpiFV0MOOuVTombUzc1t35Q/hRI//FvlxT7Phn3jZMGy/C29pzKJgwX/vQIVYrXMSD7BP/Q3FHa41/XshQc0fknfd4RNITxDL0hlDinpXNoNQ6/R585NVVRFD82dxyOLmgnh4+MZ9qQsVCi/NmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SN7PR11MB6680.namprd11.prod.outlook.com (2603:10b6:806:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:24:01 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 14:24:01 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/4] drm/xe/hwmon: Expose temperature limits
Thread-Topic: [PATCH v4 1/4] drm/xe/hwmon: Expose temperature limits
Thread-Index: AQHcgJ5dtDWFtbPWoU+h3fQ7/zoZxLVJk4gAgABGyYCAAAswsg==
Date: Fri, 9 Jan 2026 14:24:01 +0000
Message-ID: <CH0PR11MB524933B57EA4A211BFCEE1C1E582A@CH0PR11MB5249.namprd11.prod.outlook.com>
References: <20260108130323.426531-1-karthik.poosa@intel.com>
 <20260108130323.426531-2-karthik.poosa@intel.com>
 <aWDKXG14vg-7Ajza@black.igk.intel.com>
 <0476ce78-0609-4324-82e5-35d6d60988e4@intel.com>
In-Reply-To: <0476ce78-0609-4324-82e5-35d6d60988e4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5249:EE_|SN7PR11MB6680:EE_
x-ms-office365-filtering-correlation-id: 4ce8c228-d6f3-4188-03cc-08de4f8abc3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hzj4TpFmEXVQqDm17IppQf+1MNKLEkGhODYl44hu8WuhHCsbIf3ZqDc+t6?=
 =?iso-8859-1?Q?RgExgPJtaH7H6J64zIq9Mq7XblPzlThm/1UdY982PUet+aDBbZ9nCvx1sT?=
 =?iso-8859-1?Q?1s/MRDAdbPeeAWwxLq09D4IzM6B5EnHBrF6OVnUuypUfCPux3Ukfzn2J2t?=
 =?iso-8859-1?Q?Bx8VLk8y7EamvNvqCCkRPedtLJuoRuxh45umZKpYRjPm/Lx5ZzqlG1Aa8I?=
 =?iso-8859-1?Q?ubXoZFHKyd4Mo1XrPMR8tp5retAuUQBg9vjPxjkQZCLWfXJsGphgyskYLD?=
 =?iso-8859-1?Q?qzN4ritjALXEGjnIMUe/S2zz6KS2xQ4XOPnd77K4jsoy3WhlWJApMAugtl?=
 =?iso-8859-1?Q?sn5GtAtgY3hzc4j17wXtcbG/H1j+u0IahcE58blkH6kcFC7FEzOz0460Td?=
 =?iso-8859-1?Q?0UUWALLHk6bfD/Dloq73vSO0bhJgyBHc2pGeGEg4nBfaqVy1sOcp5mSE8v?=
 =?iso-8859-1?Q?c8gRdJcJVtNEZn1PZ51Sq7fih5o6b3AmS0XDk2Zf3WAwzde8B/9u7ruE4J?=
 =?iso-8859-1?Q?pGnypMinAQWz7tvZbiHQj4fw+WZdDgpnHtnOza8SeXpqeLSN1e0yHsbhoF?=
 =?iso-8859-1?Q?G1FMoITN8SjvNUISW2d4ZwExskn5GmZTd0/gYIB4Ha1/wQpx7Dx5KwHcEK?=
 =?iso-8859-1?Q?saSQ8rOcqALYCB453HHDZAul9wHPd5yqXN0mCiu+BsXTeAgjrCfjnMS8ZA?=
 =?iso-8859-1?Q?nh+09y9f6G6+oUechXsVBuh70YaNOiwk5n3bsZHQjXlM2IFpmDdUh7d+xy?=
 =?iso-8859-1?Q?OXMd7z5TH3GDTGKeRhmqIU7FqjSccTNkukiwxm0wW5B2ye3L4KaeO5Xaxe?=
 =?iso-8859-1?Q?kB8vZI82d5E81b68wPPkT3DfhOY8lNZ6LnszRIWU+UYk92i9Hp4A4lRKpH?=
 =?iso-8859-1?Q?9Ex/Y31dn/Imx+Rr0FGc9kM3Pne6g1UGIVagXN+jYeUWiRjTTc8h05zK0h?=
 =?iso-8859-1?Q?3zh7/5nmvuOuo2vnu3Otp6AEU4L8I1Q5RbDUw0kKiJPpT/hJIwUDEoupcQ?=
 =?iso-8859-1?Q?Sdd6T0HuN/+E0lhlDmQP+9MdsImmcYyOD6Xqww2/+OlCAXTeZ3KiJTEE3V?=
 =?iso-8859-1?Q?angWnyCaX2rFVzfp/YfrXNSfZYQpAp1vfJG6hR6MErtRJRi6ggvXNPpO1e?=
 =?iso-8859-1?Q?GPxo/etr7N+2R6zVAmLoPGeuUS5H3CftFyCQSrhqQfImFp40HS0471E+n3?=
 =?iso-8859-1?Q?MYFlmZlvHEnIwOUU3NYsL5fbaF2mMmkrwf8csR9cqcCJSe+30kjvEnEPuM?=
 =?iso-8859-1?Q?zp8A3W1HvXYxa4yO6UL7geFxbSkEtxlrrXeCiEc090nxN62Gkwd+PwGAsZ?=
 =?iso-8859-1?Q?kIapoJbHw/U1BrUVInz5dLX64Zp4MlteshLCt3dxFLAAbxTk/EX6l8c0Re?=
 =?iso-8859-1?Q?11mCotsNXBHtp3321yzogJqqo8I04+RLOCZQ4NYwvLdJ+Ub6UfF525jyfC?=
 =?iso-8859-1?Q?u2emeRkzs6FX138DoX0kqgl683sSBwxVAV0agBU+BEiWH03PR56UbjNepW?=
 =?iso-8859-1?Q?R+KpIVLaSxCZU13owgOmZjqbOXjesMLDNwKGAkLp6CY4Ro6TOxM52D5I+R?=
 =?iso-8859-1?Q?9tea65S2NH+pTJ5VqvtZC6fq4oWv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LFoOYd5JLpwWbXkd7h1akD9TpyzUdQ/425fQSlAZn5iTB2vOPJ5SL8k+5v?=
 =?iso-8859-1?Q?wU2hoVaTna5AR8+isQRie7ddXT52rDa4N+N5ig9IfCrUGYXu0QBqueiUlN?=
 =?iso-8859-1?Q?rTSJxlD2yYko7MlXqdvq6bZbhUZOjtb8PYhv1uM9D87Bi3q2SAPsVVMXda?=
 =?iso-8859-1?Q?991oM3ab97QIWCBhdhyjWwc46Mu0QkYvtOn9RrOZ55Y9DsgQHATkj6mb5q?=
 =?iso-8859-1?Q?4BfX4nvdh6zxwXhNeaW1ZPnhAhNvhtS+U38ITA+uVVZAeQr36utUEotrfY?=
 =?iso-8859-1?Q?2SZ/VVCvybWOgzaF4Zj8e+QMP08jaGo1tYcIid0zTQqLVhC+EnrXKC4uuF?=
 =?iso-8859-1?Q?lbIxdmPC1JiMOtnMBz3IN9PVc6MyiOnnvXEtQ1g0ub67gec4bEjWsluiPK?=
 =?iso-8859-1?Q?Gds4w+IYmh6Qm9qv2p7BE219vvbKFF+kWiZzwgAdvmbpdYQjBVQ6y2+VLa?=
 =?iso-8859-1?Q?RoLuqVyAVyz2sqCy4jYEw/9dku3CSOA6QG9ibV08ggOWzVy6T5CzrzAUU0?=
 =?iso-8859-1?Q?pRdo06rMbMd9I60ksvF1UnnadCA8DHQTWThBSZ6YGbqDN/832sgFipUu1G?=
 =?iso-8859-1?Q?QEfzJXcnyXOptoqLQupMaiwZf3/xWz6+teGPJzRwaiQDK7lB9+gdinVb/U?=
 =?iso-8859-1?Q?DW1IuML+ylZJOEf5/8DFMuw/kGObhbYGwvGwb3UedcKWYzG4dEQcNoBiBL?=
 =?iso-8859-1?Q?ePNVdBd7hm6eAwJhyJucLPlUZxLz4NmJ4g5zy9EeLH9I9rFb6zYQcNQ13w?=
 =?iso-8859-1?Q?fKQ3VQFw3v2iqvxpfCCkXNqFCo+gz1ygYBhYC3xw8JL7RgVmBSuE2MKcmS?=
 =?iso-8859-1?Q?8HE/dRh1+Q5dGogyEa9/m3YgP2Whq0vKEgA+xIcFtL2MKsuHplZ50tdtvx?=
 =?iso-8859-1?Q?CAWHiyIKcogQglSHmEWvaL3rNwffTCc6vBfFCEIw5bbUUShsLKlR8EZWel?=
 =?iso-8859-1?Q?COtZJXnBPx0U8uyocpF3bLUCCAh3SDaqkm/rPab43ysa2MaPrJ4cRTA/OU?=
 =?iso-8859-1?Q?bg7/Ljt1D8Rm1IOBTyFtqjnl5iCctWHoqPnM0Kt31gHwy8JBxFNxwyzLJ7?=
 =?iso-8859-1?Q?YD4XcCoNtfRbIewkxr0B8+xtZiXLmXlpZO/JSVlxVNfqaWexHSD9RR7DyF?=
 =?iso-8859-1?Q?wo60SJWtcTqONT9a6h0Km9TmvhdmHRwOECGycM1e1rzS4dPQWdMfWg1EuD?=
 =?iso-8859-1?Q?X1fwDolsQDOOpzFfCIjM5Bz6bKr+fjC3EsM14PUuz2WqqJYteNo1T0APbF?=
 =?iso-8859-1?Q?rCBu3eh2xBskGdvqZ8EnJbKzIwfmsrFFJetEsq/oGWAF3Yk/nMovLGfHvu?=
 =?iso-8859-1?Q?SesOIqtCHzLIPcUGLp57OEqC/rJjK2OYfTdNNt5ngCvF1/7ej7qRrZM4Hd?=
 =?iso-8859-1?Q?ehFj+Y9AlBp5sPWnip4El0v3yN5nea1gqb0e4p6RXMnV0Pni3EzXisp6Vw?=
 =?iso-8859-1?Q?OHo5EyKmIwOJ+kSnUnEzlRolCPcRpf1tz7yQGtEevE9LWxcEHZz96jKbU1?=
 =?iso-8859-1?Q?hKLUEHxi8CG0d8A2L71+GhvBFOxyjs7ogo5D7wEZudgAWU7wK2rnUwm4jl?=
 =?iso-8859-1?Q?MllZjIQfR65t/dixe1A1iD6MFkh+aKaqdbQtrZlz27EVGWomRTrenwL1Yq?=
 =?iso-8859-1?Q?dSE1ZMGfUYuSlBKEVxxR5XmhCl7cACPcWJIBkF9ohRxqZz0/RnTzV/kvfJ?=
 =?iso-8859-1?Q?9+dtccVBeoC/7WPIpGgzAy9eQdb4GwXgUnOs2WOtPsRnBPo7tIld6eCKIT?=
 =?iso-8859-1?Q?X/OKgJDIx63i4BYdlECtifMMCtPZQF/vlKiRIsRsCI7HRcCbIejLbgMHDt?=
 =?iso-8859-1?Q?/K3aHJZhog=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce8c228-d6f3-4188-03cc-08de4f8abc3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 14:24:01.5174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TVnYk+k4ZZgrDycrowi2171gGcwKiTiMtc7RsH26YQmtgo8k3IGolptg2yuc0vjmI38sLrONcEc9pZnhCHdnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
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

________________________________________=0A=
From:=A0Poosa, Karthik <karthik.poosa@intel.com>=0A=
Sent:=A0Friday, January 09, 2026 7:12 PM=0A=
To:=A0Jadav, Raag <raag.jadav@intel.com>=0A=
Cc:=A0intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>; Gupt=
a, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel=
.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=0A=
Subject:=A0Re: [PATCH v4 1/4] drm/xe/hwmon: Expose temperature limits=0A=
=0A=
=0A=
=0A=
On 09-01-2026 14:59, Raag Jadav wrote:=0A=
On Thu, Jan 08, 2026 at 06:33:20PM +0530, Karthik Poosa wrote:=0A=
=0A=
Read temperature limits using pcode mailbox and=0A=
expose shutdown temperature limit as tempX_emergency,=0A=
critical temperature limit of as tempX_crit and=0A=
GPU average temperature limit as tempX_max.=0A=
=0A=
Looks like this can be less lines, please utilize the remaining space.=0A=
=0A=
=0A=
Update Xe hwmon documentation for these entries.=0A=
=0A=
v2:=0A=
 - Resolve a documentation warning.=0A=
 - Address below review comments from Raag.=0A=
 - Update date and kernel version in Xe hwmon documentation.=0A=
 - Remove explicit disable of has_mbx_thermal_info for unsupported=0A=
 =A0 platforms.=0A=
 - Remove unnecessary default case in switches.=0A=
 - Remove obvious comments.=0A=
 - Use TEMP_LIMIT_MAX to compute number of dwords needed in=0A=
 =A0 xe_hwmon_thermal_info.=0A=
 - Remove THERMAL_LIMITS_DWORDS macro.=0A=
 - Use has_mbx_thermal_info for checking thermal mailbox support.=0A=
=0A=
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>=0A=
---=0A=
 .../ABI/testing/sysfs-driver-intel-xe-hwmon =A0 | =A040 +++++++=0A=
 drivers/gpu/drm/xe/xe_device_types.h =A0 =A0 =A0 =A0 =A0| =A0 2 +=0A=
 drivers/gpu/drm/xe/xe_hwmon.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | 107 ++++++=
+++++++++++-=0A=
 drivers/gpu/drm/xe/xe_pci.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3 +=
=0A=
 drivers/gpu/drm/xe/xe_pci_types.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1 +=0A=
 drivers/gpu/drm/xe/xe_pcode_api.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3 +=0A=
 6 files changed, 152 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-hwmon=0A=
index d9e2b17c6872..c3b367c42741 100644=0A=
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon=0A=
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon=0A=
@@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (T=
au in PL2/Tau) in=0A=
 		milliseconds over which sustained power is averaged.=0A=
 =0A=
 		Only supported for particular Intel Xe graphics platforms.=0A=
+=0A=
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency=0A=
+Date:		January 2026=0A=
+KernelVersion:	7.0=0A=
+Contact:	intel-xe@lists.freedesktop.org=0A=
+Description:	RO. Package shutdown temperature in millidegree Celsius.=0A=
+=0A=
+		Only supported for particular Intel Xe graphics platforms.=0A=
+=0A=
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit=0A=
+Date:		January 2026=0A=
+KernelVersion:	7.0=0A=
+Contact:	intel-xe@lists.freedesktop.org=0A=
+Description:	RO. Package critical temperature in millidegree Celsius.=0A=
+=0A=
+		Only supported for particular Intel Xe graphics platforms.=0A=
+=0A=
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max=0A=
+Date:		January 2026=0A=
+KernelVersion:	7.0=0A=
+Contact:	intel-xe@lists.freedesktop.org=0A=
+Description:	RO. Package average temperature limit in millidegree Celsius.=
=0A=
+=0A=
+		Only supported for particular Intel Xe graphics platforms.=0A=
+=0A=
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency=0A=
+Date:		January 2026=0A=
+KernelVersion:	7.0=0A=
+Contact:	intel-xe@lists.freedesktop.org=0A=
+Description:	RO. VRAM shutdown temperature in millidegree Celsius.=0A=
+=0A=
+		Only supported for particular Intel Xe graphics platforms.=0A=
+=0A=
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit=0A=
+Date:		January 2026=0A=
+KernelVersion:	7.0=0A=
+Contact:	intel-xe@lists.freedesktop.org=0A=
+Description:	RO. VRAM critical temperature in millidegree Celsius.=0A=
+=0A=
+		Only supported for particular Intel Xe graphics platforms.=0A=
=0A=
Group these with existing temperature entries as per channel index in=0A=
alphabetic order.=0A=
=0A=
=0A=
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h=0A=
index 7d46d5ecda91..e359889b4378 100644=0A=
--- a/drivers/gpu/drm/xe/xe_device_types.h=0A=
+++ b/drivers/gpu/drm/xe/xe_device_types.h=0A=
@@ -322,6 +322,8 @@ struct xe_device {=0A=
 		 * pcode mailbox commands.=0A=
 		 */=0A=
 		u8 has_mbx_power_limits:1;=0A=
+		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox c=
ommands */=0A=
=0A=
Nit: "supports thermal ..."=0A=
=0A=
=0A=
+		u8 has_mbx_thermal_info:1;=0A=
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */=0A=
 		u8 has_mem_copy_instr:1;=0A=
 		/** @info.has_mert: Device has standalone MERT */=0A=
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c=
=0A=
index ff2aea52ef75..db00728c89e4 100644=0A=
--- a/drivers/gpu/drm/xe/xe_hwmon.c=0A=
+++ b/drivers/gpu/drm/xe/xe_hwmon.c=0A=
@@ -53,6 +53,15 @@ enum xe_fan_channel {=0A=
 	FAN_MAX,=0A=
 };=0A=
 =0A=
+enum xe_temp_limit {=0A=
+	TEMP_LIMIT_PKG_SHUTDOWN,=0A=
+	TEMP_LIMIT_PKG_TJMAX,=0A=
+	TEMP_LIMIT_MEM_SHUTDOWN,=0A=
+	TEMP_LIMIT_PKG_CRIT,=0A=
+	TEMP_LIMIT_MEM_TJMAX,=0A=
+	TEMP_LIMIT_MAX,=0A=
=0A=
This is guaranteed last member so redundant comma.=0A=
=0A=
=0A=
+};=0A=
+=0A=
 /* Attribute index for powerX_xxx_interval sysfs entries */=0A=
 enum sensor_attr_power {=0A=
 	SENSOR_INDEX_PSYS_PL1,=0A=
@@ -111,6 +120,18 @@ struct xe_hwmon_fan_info {=0A=
 	u64 time_prev;=0A=
 };=0A=
 =0A=
+/**=0A=
+ * struct xe_hwmon_thermal_info - to store temperature data=0A=
+ */=0A=
+struct xe_hwmon_thermal_info {=0A=
+	union {=0A=
+		/** @limit: temperatures limits */=0A=
+		u8 limit[TEMP_LIMIT_MAX];=0A=
+		/** @data: temperature limits in dwords */=0A=
+		u32 data[(TEMP_LIMIT_MAX / sizeof(u32)) + ((TEMP_LIMIT_MAX % sizeof(u32)=
) ? 1 : 0)];=0A=
=0A=
I think this can be (((TEMP_LIMIT_MAX - 1) / sizeof(u32)) + 1) but please=
=0A=
double check.=0A=
=0A=
=0A=
+	};=0A=
+};=0A=
+=0A=
 /**=0A=
 =A0* struct xe_hwmon - xe hwmon data structure=0A=
 =A0*/=0A=
@@ -137,7 +158,8 @@ struct xe_hwmon {=0A=
 	u32 pl1_on_boot[CHANNEL_MAX];=0A=
 	/** @pl2_on_boot: power limit PL2 on boot */=0A=
 	u32 pl2_on_boot[CHANNEL_MAX];=0A=
-=0A=
+	/** @temp: Temperature info */=0A=
+	struct xe_hwmon_thermal_info temp;=0A=
 };=0A=
 =0A=
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u=
32 attr, int channel,=0A=
@@ -677,8 +699,11 @@ static const struct attribute_group *hwmon_groups[] =
=3D {=0A=
 };=0A=
 =0A=
 static const struct hwmon_channel_info * const hwmon_info[] =3D {=0A=
-	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,=0A=
-			 =A0 HWMON_T_INPUT | HWMON_T_LABEL),=0A=
+	HWMON_CHANNEL_INFO(temp,=0A=
+			 =A0 HWMON_T_LABEL,=0A=
+			 =A0 HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |=
=0A=
=0A=
Let's make this alphabetic order.=0A=
=0A=
=0A=
+			 =A0 HWMON_T_MAX,=0A=
+			 =A0 HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),=
=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL=
 | HWMON_P_CRIT |=0A=
 			 =A0 HWMON_P_CAP,=0A=
 			 =A0 HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),=0A=
@@ -689,6 +714,19 @@ static const struct hwmon_channel_info * const hwmon_i=
nfo[] =3D {=0A=
 	NULL=0A=
 };=0A=
 =0A=
+static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)=0A=
+{=0A=
+	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);=0A=
+	int ret =3D 0;=0A=
=0A=
Redundant initialization.=0A=
=0A=
=0A=
+	ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THER=
MAL_LIMITS, 0),=0A=
+			 =A0 =A0&hwmon->temp.data[0], &hwmon->temp.data[1]);=0A=
+	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",=0A=
+		hwmon->temp.data[0], hwmon->temp.data[1]);=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */=0A=
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)=
=0A=
 {=0A=
@@ -787,6 +825,34 @@ static umode_t=0A=
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)=0A=
 {=0A=
 	switch (attr) {=0A=
+	case hwmon_temp_emergency:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;=0A=
+		case CHANNEL_VRAM:=0A=
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;=0A=
+		default:=0A=
+			return 0;=0A=
+		}=0A=
+		break;=0A=
=0A=
I don't believe we'll ever reach here, so please drop the dead code.=0A=
=0A=
=0A=
+	case hwmon_temp_crit:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;=0A=
+		case CHANNEL_VRAM:=0A=
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;=0A=
+		default:=0A=
+			return 0;=0A=
+		}=0A=
+		break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+	case hwmon_temp_max:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;=0A=
+		default:=0A=
+			return 0;=0A=
+		}=0A=
+		break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
 	case hwmon_temp_input:=0A=
 	case hwmon_temp_label:=0A=
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 044=
4 : 0;=0A=
@@ -807,10 +873,38 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, =
int channel, long *val)=0A=
 =0A=
 		/* HW register value is in degrees Celsius, convert to millidegrees. */=
=0A=
 		*val =3D REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;=0A=
-		return 0;=0A=
+		break;=0A=
=0A=
and we don't have a reason to continue here, so let's try to return where=
=0A=
possible.=0A=
=0A=
=0A=
+	case hwmon_temp_emergency:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			*val =3D hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_D=
EGREE;=0A=
+			break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+		case CHANNEL_VRAM:=0A=
+			*val =3D hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_D=
EGREE;=0A=
+			break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+		}=0A=
+		break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+	case hwmon_temp_crit:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			*val =3D hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGR=
EE;=0A=
+			break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+		case CHANNEL_VRAM:=0A=
+			*val =3D hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGR=
EE;=0A=
+			break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+		}=0A=
+		break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+	case hwmon_temp_max:=0A=
+		switch (channel) {=0A=
+		case CHANNEL_PKG:=0A=
+			*val =3D hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGRE=
E;=0A=
+			break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
+		}=0A=
+		break;=0A=
=0A=
Ditto.=0A=
=0A=
=0A=
 	default:=0A=
 		return -EOPNOTSUPP;=0A=
 	}=0A=
+	return 0;=0A=
=0A=
With above in place, this won't be needed.=0A=
=0A=
=0A=
 }=0A=
 =0A=
 static umode_t=0A=
@@ -1263,6 +1357,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *h=
wmon)=0A=
 	for (channel =3D 0; channel < FAN_MAX; channel++)=0A=
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))=0A=
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);=0A=
+=0A=
+	if (hwmon->xe->info.has_mbx_thermal_info)=0A=
+		if (xe_hwmon_pcode_read_thermal_info(hwmon))=0A=
=0A=
These can be a single if condition with && operation.=0A=
I kept it this way to avoid showing unsupported logs on platforms where sup=
port is not probed at all.=0A=
=0A=
> Please disregard this comment; it is incorrect.=0A=
=0A=
+			drm_dbg(&hwmon->xe->drm,=0A=
+				"Thermal mailbox support not present in firmware\n");=0A=
=0A=
Nit: "not supported by firmware"=0A=
this can be "Thermal mailbox not supported by card firmware"=0A=
 }=0A=
 =0A=
 int xe_hwmon_register(struct xe_device *xe)=0A=
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c=0A=
index a1fdca451ce0..776ed4bd538b 100644=0A=
--- a/drivers/gpu/drm/xe/xe_pci.c=0A=
+++ b/drivers/gpu/drm/xe/xe_pci.c=0A=
@@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc =3D {=0A=
 	.has_fan_control =3D true,=0A=
 	.has_flat_ccs =3D 1,=0A=
 	.has_mbx_power_limits =3D true,=0A=
+	.has_mbx_thermal_info =3D true,=0A=
 	.has_gsc_nvm =3D 1,=0A=
 	.has_heci_cscfi =3D 1,=0A=
 	.has_i2c =3D true,=0A=
@@ -421,6 +422,7 @@ static const struct xe_device_desc cri_desc =3D {=0A=
 	.has_gsc_nvm =3D 1,=0A=
 	.has_i2c =3D true,=0A=
 	.has_mbx_power_limits =3D true,=0A=
+	.has_mbx_thermal_info =3D true,=0A=
 	.has_mert =3D true,=0A=
 	.has_pre_prod_wa =3D 1,=0A=
 	.has_soc_remapper_sysctrl =3D true,=0A=
@@ -686,6 +688,7 @@ static int xe_info_init_early(struct xe_device *xe,=0A=
 	/* runtime fusing may force flat_ccs to disabled later */=0A=
 	xe->info.has_flat_ccs =3D desc->has_flat_ccs;=0A=
 	xe->info.has_mbx_power_limits =3D desc->has_mbx_power_limits;=0A=
+	xe->info.has_mbx_thermal_info =3D desc->has_mbx_thermal_info;=0A=
 	xe->info.has_gsc_nvm =3D desc->has_gsc_nvm;=0A=
 	xe->info.has_heci_gscfi =3D desc->has_heci_gscfi;=0A=
 	xe->info.has_heci_cscfi =3D desc->has_heci_cscfi;=0A=
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_=
types.h=0A=
index 5f20f56571d1..20acc5349ee6 100644=0A=
--- a/drivers/gpu/drm/xe/xe_pci_types.h=0A=
+++ b/drivers/gpu/drm/xe/xe_pci_types.h=0A=
@@ -48,6 +48,7 @@ struct xe_device_desc {=0A=
 	u8 has_late_bind:1;=0A=
 	u8 has_llc:1;=0A=
 	u8 has_mbx_power_limits:1;=0A=
+	u8 has_mbx_thermal_info:1;=0A=
 	u8 has_mem_copy_instr:1;=0A=
 	u8 has_mert:1;=0A=
 	u8 has_pre_prod_wa:1;=0A=
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcod=
e_api.h=0A=
index 975892d6b230..6c84c1780fe9 100644=0A=
--- a/drivers/gpu/drm/xe/xe_pcode_api.h=0A=
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h=0A=
@@ -65,6 +65,9 @@=0A=
 #define =A0 =A0 =A0 FAN_TABLE				1=0A=
 #define =A0 =A0 =A0 VR_CONFIG				2=0A=
 =0A=
+#define =A0 PCODE_THERMAL_INFO			0x25=0A=
+#define =A0 =A0 READ_THERMAL_LIMITS			0x0=0A=
=0A=
This file is full of randomly ordered commands so at some point=0A=
we might want to order them correctly. For now just add this above=0A=
PCODE_LATE_BINDING.=0A=
=0A=
Raag=0A=
=0A=
=0A=
 #define =A0 PCODE_FREQUENCY_CONFIG		0x6e=0A=
 /* Frequency Config Sub Commands (param1) */=0A=
 #define =A0 =A0 PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0=0A=
-- =0A=
2.25.1=0A=
=0A=
