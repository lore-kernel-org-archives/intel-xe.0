Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954B606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKnOadpW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VKmn9Xrx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1403010EE12;
	Tue, 17 Nov 2026 07:31:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631E410EB15
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794900664; x=1826436664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AttrUpPBu5iHVQ+TQGQ48Nwanz5lxoUAWL/8Tf53njI=;
 b=hKnOadpWhbGrZR7TSViluT+kZDyj/7ehjldIihbJdZOPsJGKFbr/rbjo
 q7iOw2SU7if/F1pzZf7t8YRGm7cWc+ZzAo1Wo8Is4othfI3x5sU5dJnLb
 FIGq+7oGUX6w4/MTC/uq0Fd8hH29pTLbXBKNoXRoUd94n4De/uuuos5Iy
 3uAevzsMoL8eFjD7yB4LNdP/jloBpNogsplmcT3jfuVbY4ppzBhhHBxD1
 g37CWSSG+41Tml+AcdGyil/MKtTDU/2NMkCvlTl4hHZlpoe1ZYd0rvd+h
 8+8+p7qVnKfd0Kxdje79mqvDm65tmL3T23WVsJUrJwCq4kFbEq3EQRfPA Q==;
X-CSE-ConnectionGUID: eBK6lSKCTuO6PPIBZhcvLQ==
X-CSE-MsgGUID: LpqTjphPT0qriU11b6aLKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3541286"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3541286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:31:03 -0800
X-CSE-ConnectionGUID: x6UdyOwRTEmU+vIuuCohaQ==
X-CSE-MsgGUID: WUtv36WXRimVtF7y06/wpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9553058"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:31:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:31:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 23:31:02 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:31:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAlczkvgTPfDwo7o2Gh6ZPIoq2RCSvlcC6O42zKRE2BIOl5Pqz1GuSAgB14rcp+zTHxzCiVjWDd+3xPvn5LEUFaPmXznGamfr7bhZ+PVWdaJxvoenG+z3VBG09keHU4+l6iyAPNhcwTb7evlcefgfbMXeYyI7Qh2vqizI9KHyLzj2YkS1YXGu7B29U0JjxEsQBtKBucXksph5g0+phuD0crPJ9DNpSMODLs3+irKmXsNaXokts8r36OY3jpUVcCV4Gi978dQOAsE8Vhna40qV97P7scPqnuNhw1ophpJXkAEZsFmBrsGO0vbk/Zu6IalU/kvn62cZGmeWK2wYWXNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cG4P73uGnSoL/gHmxniohQrC9KjYiN7FVda6xVR1po=;
 b=HDeZQpK/MOisLmK3oSc3Wpgj/jzI5DRmfUV3Zay/D5dLaYGdI/l9srqZU1is2fBWGNGVoVZ7I9S0QTOfWU8jizUbzqDsSAqf76ilgD/f1ik3TdNSrNRJjXaNXT77XjtwE8OOtjkosksHZ5Us4mnI/e7GaXjegojn59gu3SiWzblKt7H46KKtvU+nPiP7GvvvmwHrdF63bWrtt7Zfq0tmvyu28muQ9p2s0n/16RRopDKkqQxILxBQdLSVgG0dlQw6nYCekLhaaTPofRp6vzVd7BP6cPnAeKMhnaX+zpyWd+dLHQVu6Oa/MwGG3cFC26f1l7pdCjbjIrR5kEPKVGuPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cG4P73uGnSoL/gHmxniohQrC9KjYiN7FVda6xVR1po=;
 b=VKmn9Xrxy99ri2nYKoF9xNSAkjjPoOF/zg0JVZujN8WRlzMkjMFg+/0Twawg81D3wO+kmBghMGWUTrWvhZwu2hZZTPdGH+x+WeNTzc9mgHLlCaPB963GZ8uwiuGicuKBLjs5P61+N3THKGrkEOKxIIdxp797aJueS8Ad3jLxB6M=
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f1e) by SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:30:57 +0000
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e]) by DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 07:30:56 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
 recordings
Thread-Topic: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
 recordings
Thread-Index: AQHddZ6vWSu9gR/fmkqiXiTtlC6kOrcx33rA
Date: Tue, 17 Nov 2026 07:30:56 +0000
Message-ID: <DM3PPF4C5964328911776D4018D01D13B22817B2@DM3PPF4C5964328.namprd11.prod.outlook.com>
References: <20261116082716.2636317-2-nitin.r.gote@intel.com>
In-Reply-To: <20261116082716.2636317-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF4C5964328:EE_|SJ0PR11MB5920:EE_
x-ms-office365-filtering-correlation-id: 79f052a0-a338-4889-c292-08df447cb83f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261102123227099003|38070700021|56012099006|11063799006|261026140227099003|261028144727099003|261026121527099003|10067099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: fAAfzSPsCx5c+ZgAUIOkQUsZ0VTucP8av5Qw113YzZ6P1Tj2m9xJ4fZiHxuNILpAnk3K1r9HzN8qOdur/7sp6Vs9MAdU3o6WECSNqm5f4pmrpsT2nVAQQvBgv/tVHLUsKtH6QOyCbIAA4KU5gRtppOmOUARbiM3Yc3khElPoAuMjr66M4O1o6ZUmIUlk7pN+MhuDESryfjWRDZ8ZbijFwaA6C2fN2elGZUhFYCv2qRy0jrHzDnSfJOlbgM1K+m5MD8ldigm44rX9tHskxBuSS5i7/N5RfidjJiDDVn5R3YZEdqIJ7oRbuFCk/t3aD5CAAqXKbUYEYSOEY5qRqBIENC6hkqVOTwMeXGxwDVUQB3hN0VHM1jezq/SFql7Unek1jZLM9oW2laBOXOZIFVipXsjzoUPjjUhdLKXHTg/v+1v45VsPx1bj6lZIkU2CEmfw8kF+sth7ojrhbDS0mFXPIe4A1um4KTYAV/DvPPQnUDGFWwZwrPUKmg4XmTR2uRqKwQFSJfczBof/PsJFgwQ6k1m8OFu3+W+0MPnNIldZYjMzkHmk6pBYzOSJXq/r+llUrmt3s250grMGy9JSP+d5+DgOiQ3BkgRcmpGYpSDfuBZ5nY2d2xXlyegPKNaRx/gtgbf0hSS1hqMYt15SaVXrXPICmszNW4x9Hqi2CFOoFVSh1xW8aIKHo3x9vH2w6vgUGdHe4KFH6VEl9Ue+UOlFds3WTjrMoVxk2fUzHiflBzo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF4C5964328.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261102123227099003)(38070700021)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(10067099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+GxdSsnWqugbe2zKSOyiwwPhv9Ip/Qu9hVHzf3Dqbcq59C1Ypn2A5ZM+6MX0?=
 =?us-ascii?Q?uc628ixlqmJmr9oc+K7il9mSdnkEP3UcqhRtVgIrfEdnFw47/oIV9y4kZQ70?=
 =?us-ascii?Q?BUh7m7L5Xw6rNBYzvVzcOyYGkWj3PfvBCx4a5/ot1XkTYcwcIn0WldR1fYfZ?=
 =?us-ascii?Q?m+9KG0Qjd2qWmuXKXNJIccZQA36nYHKzMzVifbaV8Tkj3gNZyfN5AUpsB60e?=
 =?us-ascii?Q?QJT8HUelCM/tr6anPBdYqMhz/BZTMfZXqFgSu+xCTydnxe8blxDLvJCSmvTH?=
 =?us-ascii?Q?vEogG3TRgvmESfPpiYG533uiRRVogocFwlAxXqc5NrQFERjuqegOthzEBctD?=
 =?us-ascii?Q?reFjNQEiggnBekBpPYfxVco2D21bH3LaLb2ytVmEjdp4ZRqIGgPBMGzqiXH7?=
 =?us-ascii?Q?bcmVlgi8u4fSHRtUHrCzfkOZxc1izIqlNFy0Wx5oe2xHKAWOXPZXPxA2rSBO?=
 =?us-ascii?Q?wmqSb3nPOrUsEK4+h4yG/8yvOx7h02zmvWQPzbx1t6YIIF+IYBPFu1Wlk+Vp?=
 =?us-ascii?Q?EusW44IQaPs+gAlaNMba9RU7Y/BZiVe0/tdSmyoXyJmLEShKrDG5CMBrDOvn?=
 =?us-ascii?Q?E8y0VDgaDD6D53tw3ToU3T2fcEQ6bVaDVArmDqAMIbzukQmfMZe8YBYSQt8c?=
 =?us-ascii?Q?i8/CRpNz+yPlhOzpn3u2ulvhfhe0xg4IMDZ0CasEXtBjKPzzCpRI6O/h5GZ+?=
 =?us-ascii?Q?1GpHSnIgNCuWZbxWlnJms8IbBEmJ50gGpuTobeABKDaI98GveZHXJkyZ5PpQ?=
 =?us-ascii?Q?R1tMbUAKeJiHSutSlE8FwOaAGfHq9DmL3ei7igg/cc12xB8vLpAiRWMpJsQe?=
 =?us-ascii?Q?mX1rm3o7drrLEQ1zIAtpHlPtN1M8MhCVBjlsYgPZu+I/fSFwkfmpEQS6wbbR?=
 =?us-ascii?Q?B7Ts3UNUzSN1iWEwhA1LpalvM6z4XJLJJI/q/5arSS6yK/e9S4B4r2j84GAr?=
 =?us-ascii?Q?k/4GcZ+tT5MWa11wHsggtXSAY44+S2O+hl7qCZOWIm7kh3sNGK3WBsDaEA5c?=
 =?us-ascii?Q?UT67wyeZpuqFPGhAaJ13o5HlL9WNWU6IeVqAD/aa1JkZVigJx8TSY3HOqlkb?=
 =?us-ascii?Q?mBjmjrAWtPfTeFPPvj1USdXw/YZW9cfXQwacySasitKcdBIZMFrZgFs/NAsA?=
 =?us-ascii?Q?tGyx3wX7g8XOkXKZBMMeG0PEUk8VP1hQPgetJCDYe2O7XCxNmaVOVnY+Qsp0?=
 =?us-ascii?Q?7d2B1h/nI1matTzZ9hj6ygFxP5ulCSXHFJOfP5jy1PDHIzeT1/8fsDsHaYTp?=
 =?us-ascii?Q?hk42HmdeeYojHrBGKPEX0m62tLXgGFHQzVBb00Lt33oAPrPZwn4YQ1TbIZLF?=
 =?us-ascii?Q?esD9QwocwenJhoWB4rDgg/Ec+3GW5cG5+E29FwcRqbZpuSH/CdReuxJodBNY?=
 =?us-ascii?Q?T+MNV0XvfXJRNw9Em4htwcFQYMnyd7Dh9n3rUJnySbN7omlg5ybNsrr6HFQz?=
 =?us-ascii?Q?e4mfSHwEEsil7W4Lj1aAUI9wSWe+pU6w/UsuZu0Z7yJQ+xxl7mrxJQMJSRyA?=
 =?us-ascii?Q?H6JBURgihvEwHGc6Un4SDJfrbM7rXRpssx+yn7OLr4wPIZXMyRlX6qV2c9DN?=
 =?us-ascii?Q?oeal3G7QuKGVa1tl8r1HSwm1KqXSEXnXiuJdjqzJM9p8xfuVXfcTja6tKNu/?=
 =?us-ascii?Q?g5KXSxREPHUWj9l8W5wS1CtPDoxqHFILIBO01CoTzEZEbXnM7BDqbvn5sKe8?=
 =?us-ascii?Q?W0t/STa4BIurK4dtDtPCz/17SVUQK5DuYaB2QWICGaXnS9qnokvzk+g4TdeM?=
 =?us-ascii?Q?q/PlJsL4Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B5c1oUW28L204zNUeGlDOIaAQ++zn9R9gbZRoq63SyW9ioo5OIzIxafz0m49Wg6mgADIo+SD9FXH9hObVca+lFm+xk4bJ4VXVnftTQLUC8SHBib/YO7G1OBLwAKxasBTDbpIJlNJ/XifXnFEEr03tQnThJ/9jK/VyJb8ERIqw7g6dRifelkceHXLPV9KgbVqkvqJVWwFlAJ08nYjMIwLrz2YMUKOL0CuPXvxxceLTW+VFSxFLaQdSUbldN1xPtBIOQ2PRmO99w9ZMbHXj4lcDii1LEW5EtLOSd9rSQcQoKy3mh/8JTbtiO5xLs576imoXv/KC+GqkjPnysoQjR32eA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF4C5964328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f052a0-a338-4889-c292-08df447cb83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 07:30:56.7577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LofkJw5Hn4JK48n8UApOdvGfj51fRv+TLTrfaDp6j7UFMDr1aq2yTj7455J42i1n1MxUh48NHN1P/klypUo17+8jJd57ivjOs9pFH5f46Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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



> -----Original Message-----
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 16 November 2026 13:57
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
> recordings
>=20
> xe_gt_record_default_lrcs() records one engine at a time and drops its q =
and
> nop_q once the default LRC image has been captured. However, the associat=
ed
> contexts are torn down asynchronously. The LRCs and their GGTT ranges are
> freed only after GuC acknowledges the deregistration and the destroy work=
er
> completes cleanup.
>=20
> This allows cleanup from one engine to overlap recording of the next engi=
ne.
> In that window, the next engine's nop_q can reuse GGTT ranges previously
> used by a recorded engine while that engine still has the old nop_q loade=
d as
> its current context.
>=20
> On CRI with ctx_restore_mid_bb enabled for compute, bcs1 is recorded
> immediately before ccs0. If ccs0's nop_q reuses GGTT ranges previously us=
ed
> by bcs1's nop_q, the q -> nop_q switch can fail, GuC reports a Memory CAT
> error, emit_nop_job() times out, and probe fails.
>=20
> Wait for both queue GuC IDs to be released and flush the destroy worker
> before recording the next engine. This guarantees complete context teardo=
wn
> before any new context allocation or execution.
>=20
> Assisted-by: LLM
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 27
> +++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_guc_submit.h |
> 1 +
>  3 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> fe71cb011d3a..65f91b8e1ff7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -395,6 +395,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>=20
>  	for_each_hw_engine(hwe, gt, id) {
>  		struct xe_exec_queue *q, *nop_q;
> +		u32 q_id, nop_id =3D 0;
>  		void *default_lrc;
>=20
>  		if (gt->default_lrc[hwe->class])
> @@ -416,6 +417,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				  hwe->name, q);
>  			return err;
>  		}
> +		q_id =3D q->guc->id;
>=20
>  		/* Prime golden LRC with known good state */
>  		err =3D emit_wa_job(gt, q);
> @@ -433,6 +435,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				  hwe->name, nop_q);
>  			goto put_exec_queue;
>  		}
> +		nop_id =3D nop_q->guc->id;
>=20
>  		/* Switch to different LRC */
>  		err =3D emit_nop_job(gt, nop_q);
> @@ -454,6 +457,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		xe_exec_queue_put(q);
>  		if (err)
>  			break;
> +
> +		/* No LRC GGTT range may be freed while the next engine is
> recorded */
> +		err =3D xe_guc_submit_wait_id_released(&gt->uc.guc, q_id);
> +		if (!err)
> +			err =3D xe_guc_submit_wait_id_released(&gt->uc.guc,
> nop_id);
> +		if (err) {
> +			xe_gt_err(gt, "hwe %s: context teardown timed out
> (%pe)\n",
> +				  hwe->name, ERR_PTR(err));
> +			break;
> +		}
>  	}
>=20
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d76f125f9c3a..254e19630c5b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
> +#include <linux/iopoll.h>
>=20
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> @@ -1908,6 +1909,32 @@ static void guc_exec_queue_destroy_async(struct
> xe_exec_queue *q)
>  	xe_destroy_wq_queue(&q->guc->destroy_async);
>  }
>=20
> +/**
> + * xe_guc_submit_wait_id_released() - Wait for an exec queue's teardown
> + * @guc: the GuC
> + * @guc_id: GuC ID of an exec queue whose last reference was dropped
> + *
> + * Wait for @guc_id to be released, which happens only after GuC
> +acknowledges
> + * the deregistration, then flush the destroy worker so the queue's
> +LRCs are
> + * freed on return.
> + *
> + * Return: 0 on success, -ETIMEDOUT on timeout.
> + */
> +int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id) {
> +	void *entry;
> +	int ret;
> +
> +	ret =3D read_poll_timeout(xa_load, entry, !entry, 100, USEC_PER_SEC,
> false,
> +				&guc->submission_state.exec_queue_lookup,
> guc_id);
> +	if (ret)
> +		return ret;
> +
> +	xe_destroy_wq_flush();

This fix looks right to me, on earlier platforms like BMG, we had execution=
 in such order of engines that the issue wasn't exposed.=20
Though I would add some more details why we need to use xe_destroy_wq_flush=
(). With that,

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Tejas
> +
> +	return 0;
> +}
> +
>  static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> *msg,
>  						 bool bound)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 7a81d0aa19bb..8397c5bb6bfd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -52,6 +52,7 @@ xe_guc_exec_queue_snapshot_print(struct
> xe_guc_submit_exec_queue_snapshot *snaps  void
> xe_guc_exec_queue_snapshot_free(struct
> xe_guc_submit_exec_queue_snapshot *snapshot);  void
> xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id);
>  void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type=
);
>=20
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
> --
> 2.50.1

