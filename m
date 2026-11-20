Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F2606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmqX8KIe;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HBsVC9BM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C23A10F074;
	Fri, 20 Nov 2026 05:38:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42810F074
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153128; x=1826689128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JTQJ7pbCnEbjO/Rl10Hlt6+mQzkFt3GgnS0VVVvtz/M=;
 b=WmqX8KIet3NK1UPOfgchfC98VEynZeE0zeoSugnO7HyoKxK4yNLw558Q
 Nkzo8QVnbXyWa8hWzGXi1bZv1Y0K+R1UDeLzZuISBc9QqXTPmTDwGu4p+
 AKU0AzGDDbXhFwD9Y+NruWZ6OnpBHLYotOA3ItPZcIROPmiAfooEyc2fk
 bvWIc9u6fBpY7ySFTI29OVnrVdTWtsDEKk40n6jXr0myW6dWCzQtINy29
 mBeVpmvocUCZVyeQhAFx3q7rnM6o2GK/C9pYF6uQ4L0Uk6pNC7Ei2s6XY
 VUwyjr6n5kxS8o5Y94hzzHNdqSgZleAILjAJsO95W5Tg/4r2+dbuu5aMx A==;
X-CSE-ConnectionGUID: ZKMULoHNTRmnfGs23hhJ9Q==
X-CSE-MsgGUID: hDDwNWcNR7mhG46wZK9alw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3947442"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3947442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:38:47 -0800
X-CSE-ConnectionGUID: LYB4lDZOS6G7GHuHGfmVpg==
X-CSE-MsgGUID: s+3Bb0fYT/KmWRt6jZyxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10632778"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:38:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:38:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 21:38:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:38:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dy44SabkZZorzU1K387Lg/y+u+7s1vxPIV3qxTKu2rwBYuO6qqH4lD0/tZtkr4XSuE/NHm+m/9OBitlmyPil6xU7kZidQcBFLb/9VF/X+w9iaNwyR89KvqOg23+f5S6y05ikhB0oD0Umq4DkYM8PcwjdALoWolvjZf0gQ5hwvJh/YNqDKbbYiQVDx+c1MRVaRIou/a44FbryUUChaN1hrxl0d99/GRBD0WBJMseNrhNErzwCinULuSPxD5w1pLxUJWH4tlS1uDUwcuElBmMKOCLJclkxuyuRAoAj7pWTuOxAvqZyUOGG0BOlaIB//IX+0rYZIFjVxU3aX3BQnBN0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHa4Jbzz/LzRG7rjYJuF77sAavvAKPxTo04Q1ZC0PaQ=;
 b=wxeMqzpUf2r+GLIM8uXaezC56sPcDSUIWqKehPiNBNuAnomowafVCeQHZaMH2FFHNVABOD6bWszXO94gidfiD6XUloozPfl3izNtdHuPe3PlKXjTgJWFdWQ5N9pd3mlh13TD4u6Tu0LBSQz7u1rtPEkFL6it3NHn3wPWkEhIF9/IbpkhmsD6iPWGIox8cjn3EhtrH44cp5UW7+G1NnwMMq7jpUl/UhIFNOgoY+va0GB/xcyBeqWMvokapcjFh8ubsHo2PdaOHMuVoVx/bUPh6A0rI4ckfULrzmhBp7l6xrZypKb659tUGNuQhTnSbSObUt0B+iYqd0GwaJ8vMk8dNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHa4Jbzz/LzRG7rjYJuF77sAavvAKPxTo04Q1ZC0PaQ=;
 b=HBsVC9BMcThWL91Pnr4+MhMvuRF9OGTh+bcTimmeYknFmUlsc6Ap2pat1e+C7qqs+fU3B6Whb28aVTQRZ1g7mSPHo6T/gRyqY0FUivDRVuGCRsTRUhN/r/eNq/fuJVTuvUxK9Rp55g+Gk8o1Sj5sGdAAmdPWSbH0Cu0zBcTJ6tU=
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 (2603:10b6:303:309::12) by DM3PPF49E43CAC1.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f1c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 05:38:38 +0000
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3]) by EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 05:38:38 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
 recordings
Thread-Topic: [PATCH] drm/xe/gt: Wait for context teardown between default LRC
 recordings
Thread-Index: AQHddZ6vi0vMWuXz60iJMLdvIVY7YLcx3+0AgASUozA=
Date: Fri, 20 Nov 2026 05:38:38 +0000
Message-ID: <EA3PR11MB406321653F72AD53F8E965A771D0782@EA3PR11MB406321.namprd11.prod.outlook.com>
References: <20261116082716.2636317-2-nitin.r.gote@intel.com>
 <DM3PPF4C5964328911776D4018D01D13B22817B2@DM3PPF4C5964328.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF4C5964328911776D4018D01D13B22817B2@DM3PPF4C5964328.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA3PR11MB406321:EE_|DM3PPF49E43CAC1:EE_
x-ms-office365-filtering-correlation-id: f9dfc700-3d5f-4b4b-7ae9-08df46c886f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261022105027099003|261021121427099003|261026121527099003|4143699003|11063799006|10067099003|261026140227099003|261022075727099003|261028144727099003|261022115727099003|261102123227099003|38070700021|22082099003|18002099003|6133799003|261009223027099003;
x-microsoft-antispam-message-info: D0CkeM6sbPu1Db9IfQeVXjAGbhkOUBA0rakoUr6L4d87CUd1tshNMg00qqYJpanN313PlrAunyB7ZHrvBKUELetfPUsXOSZ2/P2H61P7WyV9QrNSLxyGHVUxUArXvwwCs1UHyXb3BD73pZ8z5LfaODb0rlZB9fmFO4z9kD9Zng9+qZ6pOATeA+YVPbgk1LICX7sCSM7kVum6VLmzSarhXAWIyG/pIfbDjZRb3evln3jm+7zDTnsW/UOLtYAcySYd7AZlzQ/tZK8REMBv3YuVmNkjMnpOTPYyPTT3zO660MtY2TvOp76s8uZgWp2FQ8Oaz12iAHHmKAnWYqIzIe8ubc8rtcoI7dUnX4G/r86pDp7hSmsaheuiH9zo9JnQvztnJ6yGktlMgW89fQMvhIEEaXZ5qit6hD9Y8sYTjiqdn0v2zDWxKAicTUzotM4FFsp0CDAFFWnWBwp3Pr0RPccksDzFkvRgjbU6tUC5KLLQmgE9vnokdXsfPsAXgPoLyo3O3tonlaohfbQrJFlaD0Svi+N0UwxPeH9rivqfqEnncv0JY5EX9v13eV72qjiFGlqqQlaVD+mmV0JfBTXF6TPZkx8jyUp1ZkcO997AN80+xne2h68OonercSiQ0uyxPwLP0kTdVA2eVj4dL1MMv3OtUaB9cUD3OGYfl8W3vb+zjXPQ/nq/Gxg4BVFqY70kH+5K5HU+8mRQUY/KzVuzcIm+SUf5/CSbqT9pFEMyQJ8jkWY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EA3PR11MB406321.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261022075727099003)(261028144727099003)(261022115727099003)(261102123227099003)(38070700021)(22082099003)(18002099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fm/WjwtTd8jsDYAv6O1a/uWGp9ymbOcNADazihUkBovVhoYpw1u2Gurvd4EV?=
 =?us-ascii?Q?YnJRNfRyYJykgnDKy7aHXSTtuIf6FXRFnrV9byCs7XTVUJvV+MDXUp9zm0jh?=
 =?us-ascii?Q?A1tPP5BhEXwqJb44ADA/Bqf2VIYeSq1M4iGp1L0iDFIcPkAU/O5gEvX96agO?=
 =?us-ascii?Q?fA2DDiGgnjCJoeztg00XDeylXa+YbLfW2xHHnrojcmazDHIZrM3wQXKjVv3y?=
 =?us-ascii?Q?Ov1RnNv6IZwSUl1ZEefQ/VRynU7M8ooSkX6f8AShJxjRwB7S7Ccg5/Ns5pI7?=
 =?us-ascii?Q?JxfixiPltossb1UnJJKI1tnLbPdoWwAfKyowECzmmc/CLmn00Ul5nzXs3F0R?=
 =?us-ascii?Q?JrEX31Txo8m/sAj8zeYhNKQAqGTRuIr8WhyGYMIjhsv8KNEVc6CTggpsCmEH?=
 =?us-ascii?Q?JP3cRzmeAOWb1Web+etN93Tf3sAvwgkLkDPFZMLVlCSsik60QXhYBOl0F17D?=
 =?us-ascii?Q?iS9o/vp+I6AzKTbGjNSzUSnBI46GwIgudMcL7ASDsWrkfmx6t5wBOxbazzrh?=
 =?us-ascii?Q?CaZnwvg9TmobwUqCdV57L1DpULQRy4XxYGa6DqGiQeKKjQnByUp90bHhTb1J?=
 =?us-ascii?Q?SiCGn6MVSZtrbYIhBZL6ztfy3FuH1AxJVbEQ6wfLboeFS5/cAwpWhLiMyohk?=
 =?us-ascii?Q?ONbqpk3yUBzQqbsRntFdWfIIUSHLPt4OKYxe8wf7ngbQIfdsOwiZ365ryU2m?=
 =?us-ascii?Q?4b4SasoqViICR0MAA56nq6s+CUh5pe3+mP5N2b4Rsb4sZ4cOJjD2HaX/m5aq?=
 =?us-ascii?Q?2Uj17F/FQhsrCsX8RSafI07VnMg8ZxrMkoXdu0q0fio/Gy2tytPfNyLU8h8n?=
 =?us-ascii?Q?sbXL04rkPglVjWAdVSBq4S7rMXa08k1pywwq5BktzeC6okCb4TKglIuhmaKt?=
 =?us-ascii?Q?F1GyZ/eDvdbJBspTnPeW8d1MWLhZfmin5faf3VO/d1JhoLrA3eACyAxqm6Ml?=
 =?us-ascii?Q?XvecJ+zF2+qlBdaYoke4ioQ7wBhQBqX0eVkieLiYf28sLfn1I5qvVduhvV2E?=
 =?us-ascii?Q?C924vcG0AGSU9iDF5iHqbsozFwHpkseoArAMhHj0yyOhoSmLLCPME9JOYcQJ?=
 =?us-ascii?Q?A0qC2EndsMTCQzYZDcJLV9pSzejvC3ijpnXWjCmDR0xq+Zm4JwDisGr/Iv7X?=
 =?us-ascii?Q?En2ZxS1k02G9cTrVinujDyYgCAy2EI8CutvHSymxcem4AoTtTUEbUOztqVct?=
 =?us-ascii?Q?7X/MTloO9KqmNqyj5uQiyVG4TQukpi6IQt3nLreCDeM0xXGEJi0p49CaNHkG?=
 =?us-ascii?Q?U5zcSTSkOZK5TFwZN7V5wo+Kun139DenNX7m/90fJ6mtayKyx1yCce44xTuW?=
 =?us-ascii?Q?6OB3g67vQ3Ag9AIVg67S+W+QxNcmvWBt+kvgylrblgpxQT8bs/BatXc1dFEv?=
 =?us-ascii?Q?EKfO2IYLvHnOhzzu4D3PMDH9tP2hq+CH60pqhgvnpJYa4VZfbtTgOgWlzuLt?=
 =?us-ascii?Q?S9zZtUHLnFnUpbnxXbaBJM0e/0JogAYQymqHPnZ6dWs0Dt4hRygkIHuo6s8t?=
 =?us-ascii?Q?c5EvUPp9y10ZhyKkRSmcpTUqOlXJpisnqJpOn/8EwZgfEGbpjpuEome06dSP?=
 =?us-ascii?Q?/5tD8uFnUfX5h/2gyCAKVjHNLh/Yh9Kyaam6ZZP0dXyQxvAYGeOgI/pvvNx/?=
 =?us-ascii?Q?mMyvc0o+yiLahXCLaZJCTygNtvZIMZmRgJ5Ifh6ECOJjLxwOkOahONl+xrTz?=
 =?us-ascii?Q?Yr2AI5zJhlpxr/EB/IMgtFx5upIPv79D4b4VrSE1JmYv5YTGIqyTdWDhpLTk?=
 =?us-ascii?Q?m3XA/Qeguw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yb6OfXp1GajpAEx1N7FUeoCh/8CtnQvOrDHrGksiK534h/hpcMUeXPYEbskzvw7T+JM0DoD7QpIz/yT4d+fxHxgSXbeUDX3RzByzw2we8a2I32hsMFJfVs/xLZ2i+DcuHKR+976N8LpxrdWAhQYHRAf8xSnpfl2NUWttGxQ3/ZVflGUt7R9Kr6Yx5VH5vqWAi6Ps+0gu2SqkHJybTN9WYm3Pybh4dDn07tyOJiWhQ5vZh6IyfVZLufl/4A23GXBTorjDIy67wY8Ct9txCmCpG7tyBm3IpHCidAxTXRM5aUquT3teUSCDE/YW/+EpJ2uZ6BDloLHnVSztnJ792emvBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA3PR11MB406321.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dfc700-3d5f-4b4b-7ae9-08df46c886f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 05:38:38.1401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1DKDhO82CNO9/oEuST5yxJEPQbwvWDIDJL1shWgxuYZzw09y+zvdGmXn83HmAuaY2eLnEVXfpRXuKtprSP+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
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

Hi Tejas,

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Tuesday, November 17, 2026 1:01 PM
> To: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.or=
g
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: RE: [PATCH] drm/xe/gt: Wait for context teardown between default=
 LRC
> recordings
>=20
>=20
>=20
> > -----Original Message-----
> > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > Sent: 16 November 2026 13:57
> > To: intel-xe@lists.freedesktop.org
> > Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH] drm/xe/gt: Wait for context teardown between default
> > LRC recordings
> >
> > xe_gt_record_default_lrcs() records one engine at a time and drops its
> > q and nop_q once the default LRC image has been captured. However, the
> > associated contexts are torn down asynchronously. The LRCs and their
> > GGTT ranges are freed only after GuC acknowledges the deregistration
> > and the destroy worker completes cleanup.
> >
> > This allows cleanup from one engine to overlap recording of the next en=
gine.
> > In that window, the next engine's nop_q can reuse GGTT ranges
> > previously used by a recorded engine while that engine still has the
> > old nop_q loaded as its current context.
> >
> > On CRI with ctx_restore_mid_bb enabled for compute, bcs1 is recorded
> > immediately before ccs0. If ccs0's nop_q reuses GGTT ranges previously
> > used by bcs1's nop_q, the q -> nop_q switch can fail, GuC reports a
> > Memory CAT error, emit_nop_job() times out, and probe fails.
> >
> > Wait for both queue GuC IDs to be released and flush the destroy
> > worker before recording the next engine. This guarantees complete
> > context teardown before any new context allocation or execution.
> >
> > Assisted-by: LLM
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c         | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 27
> > +++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_guc_submit.h |
> > 1 +
> >  3 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index
> > fe71cb011d3a..65f91b8e1ff7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -395,6 +395,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >
> >  	for_each_hw_engine(hwe, gt, id) {
> >  		struct xe_exec_queue *q, *nop_q;
> > +		u32 q_id, nop_id =3D 0;
> >  		void *default_lrc;
> >
> >  		if (gt->default_lrc[hwe->class])
> > @@ -416,6 +417,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >  				  hwe->name, q);
> >  			return err;
> >  		}
> > +		q_id =3D q->guc->id;
> >
> >  		/* Prime golden LRC with known good state */
> >  		err =3D emit_wa_job(gt, q);
> > @@ -433,6 +435,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >  				  hwe->name, nop_q);
> >  			goto put_exec_queue;
> >  		}
> > +		nop_id =3D nop_q->guc->id;
> >
> >  		/* Switch to different LRC */
> >  		err =3D emit_nop_job(gt, nop_q);
> > @@ -454,6 +457,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >  		xe_exec_queue_put(q);
> >  		if (err)
> >  			break;
> > +
> > +		/* No LRC GGTT range may be freed while the next engine is
> > recorded */
> > +		err =3D xe_guc_submit_wait_id_released(&gt->uc.guc, q_id);
> > +		if (!err)
> > +			err =3D xe_guc_submit_wait_id_released(&gt->uc.guc,
> > nop_id);
> > +		if (err) {
> > +			xe_gt_err(gt, "hwe %s: context teardown timed out
> > (%pe)\n",
> > +				  hwe->name, ERR_PTR(err));
> > +			break;
> > +		}
> >  	}
> >
> >  	return err;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index d76f125f9c3a..254e19630c5b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/bitmap.h>
> >  #include <linux/circ_buf.h>
> >  #include <linux/dma-fence-array.h>
> > +#include <linux/iopoll.h>
> >
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> > @@ -1908,6 +1909,32 @@ static void guc_exec_queue_destroy_async(struct
> > xe_exec_queue *q)
> >  	xe_destroy_wq_queue(&q->guc->destroy_async);
> >  }
> >
> > +/**
> > + * xe_guc_submit_wait_id_released() - Wait for an exec queue's
> > +teardown
> > + * @guc: the GuC
> > + * @guc_id: GuC ID of an exec queue whose last reference was dropped
> > + *
> > + * Wait for @guc_id to be released, which happens only after GuC
> > +acknowledges
> > + * the deregistration, then flush the destroy worker so the queue's
> > +LRCs are
> > + * freed on return.
> > + *
> > + * Return: 0 on success, -ETIMEDOUT on timeout.
> > + */
> > +int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id) {
> > +	void *entry;
> > +	int ret;
> > +
> > +	ret =3D read_poll_timeout(xa_load, entry, !entry, 100, USEC_PER_SEC,
> > false,
> > +				&guc->submission_state.exec_queue_lookup,
> > guc_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe_destroy_wq_flush();
>=20
> This fix looks right to me, on earlier platforms like BMG, we had executi=
on in such
> order of engines that the issue wasn't exposed.
> Though I would add some more details why we need to use
> xe_destroy_wq_flush(). With that,
>=20

I think the xe_guc_submit_wait_id_released() kernel-doc already covers this=
, as it explicitly mentions flushing the destroy worker to ensure the queue=
's LRCs are freed before returning.
Thanks for the review.

> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com> Tejas
> > +
> > +	return 0;
> > +}
> > +
> >  static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> > *msg,
> >  						 bool bound)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> > b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 7a81d0aa19bb..8397c5bb6bfd 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -52,6 +52,7 @@ xe_guc_exec_queue_snapshot_print(struct
> > xe_guc_submit_exec_queue_snapshot *snaps  void
> > xe_guc_exec_queue_snapshot_free(struct
> > xe_guc_submit_exec_queue_snapshot *snapshot);  void
> > xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> > +int xe_guc_submit_wait_id_released(struct xe_guc *guc, u32 guc_id);
> >  void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int
> > ctx_type);
> >
> >  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
> > --
> > 2.50.1

