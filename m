Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08031606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnhGG6KE;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Fs6a9JAN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3F8112082;
	Fri, 20 Nov 2026 05:50:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE0F10E163;
 Fri, 20 Nov 2026 05:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153794; x=1826689794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n3AVhamfGcRCA43Lt3JXo27PBQlSZ5BU73gHjMv286k=;
 b=LnhGG6KEZMM5cM1iRj2SgrUGroC57CrrKHaK7pH0zlD1oHKdxB4gKVJ7
 fcajWzUdysWwvaWrZdgPvjuDenD87mcPxtQ0jx9mxg3QRhRE0qSAoTzeR
 x6b5Fdqu9eUgU248H4feP3ZZ8xl5F/zzrhsvOMAYMdPaZxE4QZA+vjZ11
 z+Q82Py+Ke5jVCS9YTNlSe7XRfCXuDGhfrTrq0HxQM3YZ428sWKJlCm3X
 cVJLwhZQBBcuS0m3A7VnwCUx55R5WeWBe+hEcAi54uSRuQQc7PqNC51Gr
 mdmh3EplMXxCZS9jfv5fjmZHl+k9Muh3ZIX+tSnvBAycbEOdJpZO97Vwo A==;
X-CSE-ConnectionGUID: IHBjxzsDQE2Jj8SXyxXAAg==
X-CSE-MsgGUID: M7KSBoXmROaEcWtVxMi1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4105700"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4105700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:49:53 -0800
X-CSE-ConnectionGUID: U54Dh/NuSKmgXewnzu1fhQ==
X-CSE-MsgGUID: 5gyy0TSdQwWyJhRbckE5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10705519"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:49:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:49:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 21:49:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:49:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTk8s8C/Zh4RDuR1Y60vKgkt152ViseiHKu9yt4xgkk67/LiuHmn2/oLGDwE4z1ugwwrCSgMLuquruxxn9kZMWLGfoTwlaEWzA8EiOtAps2BbwvgpAKvR5koUU62mfSNbh2X5im0QIdjSZ5C9c6S1Yd0hkwvrLJa02C0zgfFYvA0ftn9azqCm5/z7YwD+3THDqBKP/nxpG0+ebXi20ksh+0676YBa/e/5lSgFCmjN0IotAvKEcVkQkBDrOnp2ion1YMMNqd46Ny/e2rR7/RVWl5Oy5BtZ5GEfylUZM97P7R4qIoRzPP04ayyUfF6Z3kXaANemQhFkRE1Bl5yfd5gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFaF/pg8hlup7rshuSeIJnypMp2O0kIvcEg1cHpS54Q=;
 b=gyj+dIb+iYgeaLSE7rl0WBkjxBEDxp+Agq7Eow74J1BiXL+ME/Y94/szHWkeyhqmV8czLNvVs71ysw07ePgZWEedlBpfLn+9g0owkAMq6rQ5UptTBwf60q8VcNInUJiK/YWhOH2yKenLPj0HyCN4I9sTwg2PojtbYris99Lkadn/S46mxl3Pjxw/i5Hef7kgKhKTKzbXM2PW1FUBsSvQMBNpSC3laiIg+u9/R4uJwqgmc33XmIPFo5YoiiF6gKQeOl5YO1rOZbEa0jkbGJCYoKz7+F7tdxkLxOTV/Jn8K2usXIgqwL2a4ccSuWMsZLAhIFqw/qdQDlO59hJ8EEFwIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFaF/pg8hlup7rshuSeIJnypMp2O0kIvcEg1cHpS54Q=;
 b=Fs6a9JANcSLQ4rs0MSM6FPV5ujaihpVUbrJG1EomFeLb5RP9NdTkltMe8dA2TpIisvj26CkmJQgUJ6OLvXOuMG2jFLqfN3yFaxLarT8BOzLxFbPk2bJzXH61D6EL9UuGS1K3DCMrZxYhvpz0DyMKlLb26YWekAXl4FwYYjJ22Ug=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH7PR11MB7050.namprd11.prod.outlook.com
 (2603:10b6:510:20d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 05:49:41 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 05:49:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Xie, Xiaolu" <xiaolu.xie@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Kahola, Mika" <mika.kahola@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/i915/lt_phy: Fix the PLL table values to match Bspec
Thread-Topic: [PATCH] drm/i915/lt_phy: Fix the PLL table values to match Bspec
Thread-Index: AQHdeDuIXx6KQpLKMkK8HMhc99/sE7c2dQSw
Date: Fri, 20 Nov 2026 05:49:41 +0000
Message-ID: <DS4PPFE901A304F677353CA4A54B60E48E0E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261119153235.2311650-1-xiaolu.xie@intel.com>
In-Reply-To: <20261119153235.2311650-1-xiaolu.xie@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH7PR11MB7050:EE_
x-ms-office365-filtering-correlation-id: 15707d51-cd20-4071-46bf-08df46ca1235
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261026140227099003|11063799006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|56012099006|38070700021|10067099003|18002099003|261009223027099003|22082099003;
x-microsoft-antispam-message-info: t+DD7uVcIoGYMcfqGsNYdu59QiJY9TGFQ61SXFb056jJBFiPrYVPabfWg2KXqnHKDzRF7ELii4FGZX5rk5RS7lGqAaCAl/nec7Axx4t6eCBR58p7wBgoO3OHZer9cxqiK8g29hVYe5bkp8gEYA7cEmPIWtn8yRH+N+dgLCNcCZJS0upU+oLKuPTefD0Xkrj1TObS8uKkh+POjK9XDQMTNouD6Q652a8Mz+PQONlVANRaV/pRxtlX+YH5cOfD20cnceV/NFr5179bPsAmFG9CZzgMuf9VGpPBZYs/EM29B4P6KrkAGurLKql/GLAuxhD+JqDFg441R2V2zyRIpCBH+jHffl34Dztb5LWuMLb5FBMPrDlMThzoLrHfndNj9d0nnFT4lmVdbFmDkRwBdWY3nuOqlo/xFYAy+KzNyMOwWiWyY+5hpvaw7SKvxKtoti95+rkjsMJkfh0v49Lc6AtVooHak96EZO0H6Gy8U7ZeceFbdE57vUdFnJJjMSN4e7KA7QBY9h41qAZspVo3oAxc2ZzxDdm4jwYWe9inSOGNBsCo5VZWiT/nJWf40ELHn4Iwdrl+6b7r4T9khr2Yd5oRnWvmnRCf2oFJ6an696jrN98jfNNlJqudbdYh26ylRPQd5RHjBy/BbkUYU3tD1u4f78RTjTd/CsWPL0sSYTWP13VpmH0V60msyG6s+DfOp2+kwPDvzPgEdLnySxBH/ChB9KaRLUFk/q3M2cqsQNajxNw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261026140227099003)(11063799006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(38070700021)(10067099003)(18002099003)(261009223027099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vM8Vf6FJeq7Ht+QLhY7vHHmTJ2Zwngx00aiXNubJ2nxa9AAMVFQrZ8g7aG?=
 =?iso-8859-1?Q?f8MvsQLaba04WpFyXSoHsNJfB7uw0Lo48iT1itAx7P253uOpmW94pPzf4y?=
 =?iso-8859-1?Q?zNd+pJ/896Xt5JGplscOACCTxT8t8EBaj1EAlB26KHh+cQoU6B0rsrIrAR?=
 =?iso-8859-1?Q?Nyni7uL+fbA5JlA5PUUDwSc6XmWilgpcXFvkZrmxZVk0Adr8JddZbPBEiP?=
 =?iso-8859-1?Q?f2pRwG+t1j833SFhTSwlpNwFepSkfzB2zanvB4rvvj9AEHQu8TmLoCaf2p?=
 =?iso-8859-1?Q?K1XQe/QoBmEgoERZJ0fhQxzRd914GzK2t45HTjK6iMbWnPTA/hO6O+4sED?=
 =?iso-8859-1?Q?+DvWJboqrTNin7/1tsWEW1tthlkCEnHmkqu6cSLjnaimQQQTc5kAfPY7nR?=
 =?iso-8859-1?Q?q/DsnYXnfHTTlxe+OUh0xFQmsJ8Z9kS/gQwXgHRdHhC0EMi8BbNZK7FRaT?=
 =?iso-8859-1?Q?+48y2ApFAAktWFh1EM69K7KlDnwK3SJqA2wzWbzw9Ed9JvuvUeOe2TcLUG?=
 =?iso-8859-1?Q?maRIN7Lt/zVx4qHE9607y3ci+gRx0tkKff8jzFUALBs1lmbi24dbfgkZNv?=
 =?iso-8859-1?Q?bHvij3QpWjkyNOTuD8TqXhrctwfvy9MmOzm5qXPn6EJI9DOj40zZ4SZdIg?=
 =?iso-8859-1?Q?8H+RW0pT1LBd6SJ/1+LygmExCxtkrqnH+SKoGO6JumI7LfqAL4FkJcOVaj?=
 =?iso-8859-1?Q?wZ91Qq6oGngBumR9nL+OU3EyYBjmO+YqLRY2I7rEEBpZSqIEHAcz/q7nJj?=
 =?iso-8859-1?Q?un8i6hOGKiEEACktjc2aADBLtGqDLZM19zNcVRvlXnlVDm50G0s9VeOy3n?=
 =?iso-8859-1?Q?415FSDsVTNFv/xpM/rF9ONPgSOw5BgGWX3CZnQABJlXHd8bq7TCXGJii90?=
 =?iso-8859-1?Q?kGPmeQtkLDdo1jnlfjFzSEpHihTbTk08UqCXWOd62oE+EosAVpMVT7GZYU?=
 =?iso-8859-1?Q?IbHVu3XdawOuo8PY6tKmAXgP0Hdf+FLrajMJyZ84QeBl6gbmwgZ7iistdx?=
 =?iso-8859-1?Q?O++Dvk8YFJ3KsKvG7TqqDOVW13IJCCv2hVFINg7LHCPaCR4lXcc6H6K3dG?=
 =?iso-8859-1?Q?WjHQSZLIeYbBASesvDDF6spw4lSw5idgZkUPbhc2jlXVZx6w5ndzLO522g?=
 =?iso-8859-1?Q?Hj85y79YTbgGRN76biIEztGNszzFfYKF4NduShaAqUohA2JOBOBBJwHfAx?=
 =?iso-8859-1?Q?TSATorxsr9DerYmyy2DygKflO/iinr0cmqCl6PlmX+6BFPtM6AZ13lY3vj?=
 =?iso-8859-1?Q?Itwu25mpkjpOFB4trlw5CriKVF5FHyKHbFCr0ZDSVXaNQ+j3nuTFjQKyyx?=
 =?iso-8859-1?Q?wuYR0uMUMaiQAj69DSVwrAjT6/sMaM0gl4GzJ8SbvoBPEEKniHT8J+bDuX?=
 =?iso-8859-1?Q?Jq6DHIGWrON7B4BBJVnfjmEggkWRbrrJp7uiOI5XTt4YxlDTLWbC7Rcjbs?=
 =?iso-8859-1?Q?yTwVsABt/hJEOAGgDgPKgNwm8Jq6gHgSHwb296aiTvQsyh7ko7Km1O4iqS?=
 =?iso-8859-1?Q?Tx2DxbM+pT8C1RFKFBo/0d3TqhctsZpxzT8aVJ4qPo4SO7ctyERPzpOE4i?=
 =?iso-8859-1?Q?jiiF9Nr/jlYUlGmFohGmrWaJlod8RNBZc+MOkrV15RH34Qha+UXLTts6Wd?=
 =?iso-8859-1?Q?oOQ+jNXmt4Rr2Y1jxa61zQJF30hjGaT+KZBNJJ7EswGaX+QSqFZWGqwpsZ?=
 =?iso-8859-1?Q?TLj9EE2tYt84LjBklah5cUxzF9arSUdiPtROVE3Af7aipZpl6kKbOFLqCm?=
 =?iso-8859-1?Q?BnTWj6x5C7p8TQ54JZdgGzBomVOId3B2QOmbwfCFVe+YXgStbQyr0wuG+4?=
 =?iso-8859-1?Q?wd+uk6qRjg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fxuD1xOlueL6cL3BbvlEzOZz3hHl3HJYukWdQoky2+LXhvUNlGN0Gp6/4J2qa6+UXCGJPsfbTDdbm2p1n1d+Otq/u5Ow22VjQbXuf7wauHFwJwVxCLpdWucqHYOvdPLMstf1vXnwS5xzD+6cDJnj7MyVHxUzY4bIBv9f5q/TUsL/Fk/uErGDfaw+wKQazA8MfkmHNjMS7FHc5kOUyISq2TY5AQgGFAs9Uayccye1kzcblMw49oX4STDfV4jPWfYB6dZKiy/FwcLxcSyjsSeG2fuBCYCOmyLBcck0yVOK3kZ99XZuv4BtHJknyVItQy5fxggblA/yoJgx+Z+t2WEX8g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15707d51-cd20-4071-46bf-08df46ca1235
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 05:49:41.2438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lC69FReKM+sJLV+n72Ths5bwHdU2K2oPgXmQ8i79Jc4kx6+WuEQagzGW5lID57e/KtAiqsjgf7JJaH4Am53IkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
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

> Subject: [PATCH] drm/i915/lt_phy: Fix the PLL table values to match Bspec
>=20
> Comparing the DP, eDP and UHBR PLL programming tables with the Bspec
> message bus register table for the DP, eDP and UHBR link rates shows that=
 two
> registers differ, all the others already match.
>=20
> PHY_VDR_9_Data3 (0xC3C), the DCO med setting, has to be 0x80 for 1.62G,
> eDP 2.16G, 3.24G, 4.32G and 6.75G and for UHBR10, UHBR13.5 and UHBR20,
> but was left at 0x27 for all of them. The eDP 2.43G table has no DCO med =
setting
> at all, 0xC3C and 0xC3D were left at 0 instead of 0x27 and 0x08.
>=20
> PHY_VDR_11_Data2 (0xC49), the SSC injection setting, has to be 0x57 for a=
ll the
> UHBR rates, but was 0x5b for UHBR10 and UHBR20. UHBR13.5 already has it.
>=20
> Fixes: dc5742b6197f ("drm/i915/ltphy: Add LT Phy Programming recipe table=
s")
> Bspec: 74492

Looks like the programming recipes have changed yet again.
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lt_phy.c | 22 ++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index 86492651b01..68ffd6e5107 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -107,7 +107,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_dp_rbr =3D {
>  		{ 0x84, 0x26, 0x5,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x4b, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x5b, 0xe0, 0x0a },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -319,9 +319,9 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_dp_uhbr10 =3D {
>  		{ 0x84, 0x26, 0x4,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x45, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x14, 0x2a, 0x14 },
> -		{ 0x0,  0x5b, 0xe0, 0x8  },
> +		{ 0x0,  0x57, 0xe0, 0x8  },
>  		{ 0x0,  0x0,  0x0,  0x0  },
>  	},
>  };
> @@ -372,7 +372,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_dp_uhbr13_5 =3D {
>  		{ 0x84, 0x26, 0x6,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x49, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x57, 0xe0, 0x0c },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -425,9 +425,9 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_dp_uhbr20 =3D {
>  		{ 0x84, 0x26, 0x4,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x45, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x14, 0x2a, 0x14 },
> -		{ 0x0,  0x5b, 0xe0, 0x8  },
> +		{ 0x0,  0x57, 0xe0, 0x8  },
>  		{ 0x0,  0x0,  0x0,  0x0  },
>  	},
>  };
> @@ -506,7 +506,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_edp_2_16 =3D {
>  		{ 0x84, 0x26, 0x5,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x4b, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x5b, 0xe0, 0x0a },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -559,7 +559,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_edp_2_43 =3D {
>  		{ 0x84, 0x26, 0x6,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x47, 0x48, 0x0,  0x0  },
> -		{ 0x0,  0x0,  0x0,  0x0  },
> +		{ 0x27, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x5b, 0xe0, 0x0c },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -612,7 +612,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_edp_3_24 =3D {
>  		{ 0x84, 0x26, 0x5,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x4b, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x5b, 0xe0, 0x0a },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -665,7 +665,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_edp_4_32 =3D {
>  		{ 0x84, 0x26, 0x5,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x4b, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x5b, 0xe0, 0x0a },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> @@ -718,7 +718,7 @@ static const struct intel_lt_phy_pll_state
> xe3plpd_lt_edp_6_75 =3D {
>  		{ 0x84, 0x26, 0x6,  0x4  },
>  		{ 0x0,  0xe0, 0x1,  0x0  },
>  		{ 0x49, 0x48, 0x0,  0x0  },
> -		{ 0x27, 0x8,  0x0,  0x0  },
> +		{ 0x80, 0x8,  0x0,  0x0  },
>  		{ 0x5a, 0x13, 0x29, 0x13 },
>  		{ 0x0,  0x57, 0xe0, 0x0c },
>  		{ 0x0,  0x0,  0x0,  0x0  },
> --
> 2.43.0

