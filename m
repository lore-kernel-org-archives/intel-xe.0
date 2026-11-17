Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65F606A33F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mhF8g56r;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hs3T+wP9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318810EADC;
	Tue, 17 Nov 2026 08:42:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB5710EADC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794904919; x=1826440919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jKkdi6wuFyLZda3atJat34cZChEwRLobJFnKJOPcXKc=;
 b=mhF8g56rrMf7r/cYoZLARNJVfKxiYBWcuTnU62hfqs8DhwgvhOAkwqqN
 PXR30NxREE8NPOwTdFW/AMbp+zPyqe/KP2yHlMwRoESdebWyuFL4lBS4i
 4f1bhPv8ujx5vmC8qatILEQ/XXvYqUCuQ+fppG5UXHfyvy5n+kW5HDBee
 6+cwevwab5sic3VZrGXoU+2Fa6xrJm7PhuWxV9y94gh5VarQdZXTieb1a
 YsY22dCSeozDQuElp9IGT5lQoNQWq8BQBP+6Umx0v0E6rUm0wb56+Vyin
 6p+pzERmGn4MXffEZfoNBfse/Fl62UDWOM5ewltcNwfvFNMCLVP7EHilq g==;
X-CSE-ConnectionGUID: QcOOKOwmRO2nVnR6zRZPTA==
X-CSE-MsgGUID: 7F2iB4roR3uEaazX/qaKyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3520671"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3520671"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:41:58 -0800
X-CSE-ConnectionGUID: MTKu33waT4OltFwvFqP+BA==
X-CSE-MsgGUID: BFczk+RcQTOJ4lxZP/u/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9682661"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:41:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:41:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 00:41:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:41:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O93RfmKaMwmhq6adezw+rZ4R9zJMW9aKPKuEjltXsJV0YG5b138Nd98hs9uG7B81l/tZhUoatjWo87jTmRtabez3hhSEUge8E6TwpQRqIZ1wSD61k3HpmE8UB6A6/XWXFyzAqaqCKy5hZuhzfjweRSagkM+4gm8RU9jV6TaSkDKNow3/lr1MsX6jfqbzDSnQBfP5L924PG2GLiC84bF1Slayvh5EA6zqPIOwljhd8ZXcscidbWh5IZxxAxO5EBrXQp/judW/EJ9ajsnemX/JlxSNQUbVF7AH72gy4MmGaN3/VNwyMveedlYYGq2TjFzAY5Sd1DV4WM42QkEwCRBqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcd08QmfNV3ch2Kd/W71TUYKSmnnQ31uxZfhmDq/ops=;
 b=E+uFXVb9UVYEKrJKgHvo27nlubyaMDta0C/1w/LzP6Yc+MnqXh3QjuSI9CrqamnIxCE74DRgA/59LXwVa5SFNfZFb+h1XJ1JKNMI++xLd6RzXFi+3VOWAIzn16jCVVYGBdtgYEQy0iOlKzkrGd84IIW2D+fTwUSVqsOLHm7J8+G5BNSYKxHNFCMARSj+6LG4g+0t5etLvVPw6KzOvZBKd1jDTUPPap1UoEg0T+dqx+3sBE3iXASWgqvDprFb4cVtsag2TyhORYYyrut7sMJYk9F6C1LWTQzktotLvGcJM24ZvIyBFCpiHrp2ej2h4y1iQWyVEGGs25e2OhudB1P4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcd08QmfNV3ch2Kd/W71TUYKSmnnQ31uxZfhmDq/ops=;
 b=hs3T+wP9zDSwAvORLlvxNWyB0z65E2XPdJkPHvlGSE+SLCIL+5kc3x0jkEjNgMB8XMTvkyWD2FjbQRI+WB/oPx4WVObNZmtSkIoipN22rVuIqyCCuFLfhb3B8Y0Qksjapv0fIg3rl1lB7Wf4+zQ+FCUqxjzLNGymHZDZGvNmv3E=
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f1e) by DS0PR11MB7457.namprd11.prod.outlook.com
 (2603:10b6:8:140::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:41:50 +0000
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e]) by DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 08:41:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Yadav, Arvind" <arvind.yadav@intel.com>
Subject: RE: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Thread-Topic: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Thread-Index: AQHdc3wNW904rLqauU+F9Hqi2hVXBLcsHfqAgAXZtnA=
Date: Tue, 17 Nov 2026 08:41:50 +0000
Message-ID: <DM3PPF4C5964328A1BB96EA16C59508A419817B2@DM3PPF4C5964328.namprd11.prod.outlook.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
 <avcqq9J7MHnVKlWv@black.igk.intel.com>
In-Reply-To: <avcqq9J7MHnVKlWv@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF4C5964328:EE_|DS0PR11MB7457:EE_
x-ms-office365-filtering-correlation-id: 0d2946e2-daf1-4da5-80f2-08df44869fc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|11063799006|4143699003|56012099006|10067099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261026140227099003|261022105027099003|261026121527099003|261022075727099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eHQaOgY1nV6BjBetE4OXA9uu+0kkEeTq8dGpMSX/aU14Qe2PjCVOo7E96n8NlofTPxNgaUV4ecsMOyXyP0SXb47tetcxxW2apnxKN4UhntoG9pm7npZdByjoTz6dPibCh0FygBUXswtbGtjSSjWX/iNNZBNFsbufG5kbkcdEPAfKkJifaESmTBqqZFMet8Af/rBa5XqcPQUAg8DrFrd78oCBLnnzLUslmUI+BX+W7IVuvvhaZobZU6ZFbkYBvYrZ/el73aNDTA+duUGMHiKb9wN11TmkWAkPFO5J/FmhS+Nprrxv7iOBse3cIJDC5qazGn5x/R4irFW2oVrkH3mG5kbJaRNDnvnUleF6kX/5F98nV2aLHIBf1Ec6H8NsoE1Yj2S3mbeKgI9wO5LoMx9Yxq0NztxqFxPgjPxhcpTnRd2mMsu+Wl8ouCGkzcsEYNTJGozBBrWxD4WGu9oG/WVcEretnKreh047vs2MI6h7PHeZ5sya2+HUpMuC3O8WXUbRs6ZBWoh2khUuQsNof84QY9U/PPzM+LaOUcEeeGBouua1R4fD56Cdz6pkAs6WypdYESwRxlITY4APoBW9ZJQtVX1kVCqSUgdrFwF1Dsvz4lK3kTbrAcR0h/a1UvgkyG54V93iBUY9UmqbxXhcx32UraWb6bvzppFQhcakmr8XZSzhffTIJBbuKXIzTBLG+c/rJueHR5EC/bU9rLcgqk8boH6XHs0USNGkVKYg6VMBa0I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF4C5964328.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261026140227099003)(261022105027099003)(261026121527099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X+Ncg8KBh9mIqc3bVcq1HfZ9Ve4xBkwJTypszHvD3EJHGZKPVIuMb96+iYza?=
 =?us-ascii?Q?wqxPDYpNJtP5bizcisy0WlJ5P7r1uvYGm6J/Z3HEdOEGrU5r1J0BdWsBkgFg?=
 =?us-ascii?Q?T46O3q9/KpjBhpoFImKjK0YgLV4B11tjL9WZRnsmFkJ1abWmYcB665PAMsMZ?=
 =?us-ascii?Q?nMXG03S7ExIIeifONIlH2RU/gcZtOCQzWUN9tP3ShkLjCwtlUC7UBY20Z9Xa?=
 =?us-ascii?Q?5bfrLaW8JsYWldfdqdewJYCDnQgE4m3UN9jRCAqOaE8MIL3PgveV1l4Sg74x?=
 =?us-ascii?Q?r98BTqidBFxRXHKRYtpJRiydtvq2qUirzBXhnK7NTtcoIoOeeFJP1wHqDGM9?=
 =?us-ascii?Q?cc6znuEYiyCjcX7rP0jJ9I4OSk18AAIlfGUI5WUNHTmsrqCapq+bcX6zRNId?=
 =?us-ascii?Q?zkEbe9KEh05wj49uHKgAtosVFX0Q5pNtYmnCZhIABV3NNKvhJinPPagEBoMt?=
 =?us-ascii?Q?A/BIgR1gKao8VNNE1TpRxahRzJsdihoxU7JrI6hbrbUe+TeUdH2bLmXkmWMw?=
 =?us-ascii?Q?ylugM/aCjIteWTgAScGJniB4kV/t4l7f2i/GwCzhw//kfaXmr1jXodO76WTX?=
 =?us-ascii?Q?iYWpKN42jV9aSpp4NM3E0oL03iyFeEXmyKoWYNrSP74TaJ9HPfdHUmkjiYSq?=
 =?us-ascii?Q?Xpnh0vH7LhGWoz0N0x3RFJ7MShG4/kiv77hX8MUwf04UsdwsF5VgfKXgaTM4?=
 =?us-ascii?Q?pOo5BTScI+aaMcjdDsYFKcGplyvuWJYF33didQB4Yn74l3cHU/u7UhX2XLyo?=
 =?us-ascii?Q?cjgkwGYOj/kRZjh8/HHWxWJ9czftx4CwmLuYsngvPWQYQPfQuCXMXUdrB5+g?=
 =?us-ascii?Q?9EFbtE/p3UQYUlLYH6VJSmAV8ymQhaNPfwh77R+3grxImVfyqjuLk7OyixuP?=
 =?us-ascii?Q?2hPpi840in9AHrBDvMFqXj6jg7p4HPShthyHzoHKtqoi1xR1ggtB77ui00NH?=
 =?us-ascii?Q?SR9DMFQpv1/QJnpuGNNv96vDWluIqRgEXycTgJl4Z2Akkbi2/hvHVsw0Akzd?=
 =?us-ascii?Q?iWlzKaLpb+6ZWDXTzp0TO1wWodE2WCCFphIKdg9kbQgv4hqsnY9mlZE8uDJ9?=
 =?us-ascii?Q?PuBgtUv/ooVUwfIinPvEq/3cG/b2TN/uIDdJmYhOH690B8OyOQoA82fh0mYO?=
 =?us-ascii?Q?+q9dSsgjM29XH5LzfC6aQVtXkxrarqhgSN5xzKucA+qHp0vRW30QZmjbzIjk?=
 =?us-ascii?Q?HeDyLQ1SBPz/fi4aCJ1/RzrXTvV5BYH2UmqrcQYsgKO9zzspx01blJlPk5/Z?=
 =?us-ascii?Q?isXyq2b/twUFyCvTn34QeCWcpYYSPVuhlltUExEbXVvrpmIeEwPC7NEK0+PN?=
 =?us-ascii?Q?qqQJ3NxlPiTGTYwnHixcZ6H0hQ7JYx/TMywcOXxu3uNgWUXN/QsZXEkIwUnk?=
 =?us-ascii?Q?2UYkeCCPk0t/ymwzvCd/LbQM6GmaxqEgSf6ysshbbzE8CsRa/ZTOaUi6Drlu?=
 =?us-ascii?Q?qFuvUV5ifGqkSYLktyqQ2X2PM+FOdXOInH1ZgEcstc8F7xiyscqE6iCzOEPc?=
 =?us-ascii?Q?LLq7rAkyrN0YSo8R6nTjBJrKRmI10NISbbcNjmUo91fU9PH6NULBod84Vqf6?=
 =?us-ascii?Q?GUIAFRtpElIbsnq5XkO9ORXU88jgYvXen3Bn3EHWBiIyDb6+9Yqw2nRwEq8m?=
 =?us-ascii?Q?7TxAvuqLm3QKZWSUAMzHipNgQ1KwPak6qoPnZ+OPy2w9Cu2w6r9OqkHzL1Oi?=
 =?us-ascii?Q?t18yADhwTxqM8cAyiP3dby2iar4bZzfgH4DAwd9cbZ94H2Im+ZGO2pU8AVDU?=
 =?us-ascii?Q?Saq8/VM8Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hnuv29qrWb5ivKmXh9RdNkjGDsz8+6vunlyX09XRzfVXL+QZwX1IRk6Xeh7wUuO97mnG6EN13mdXbNFSXSlITQbLwCbXjG7XmFLPZjOBiKbPXwc5Ok3cR2tji/NPTrXlzCzsCSL4NWUJhOsIh6MtXRvShiiPXQ15MGIjBQbGsgwdBcTR1PimqGIJkWiCVj0Z9XKugEfoEqZRn4MZXz+xhzRoPLFTCSca14eMUDCCPOM65iTK14wEDMvn/JHauV1pvbPzdESJC0kAHS55h9Yas2u7agsw6qNeCKO+m57m+INjNafP9GTq0+UwduFZXEpkA9lS+yTyHdjhLNGcjFph4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF4C5964328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2946e2-daf1-4da5-80f2-08df44869fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 08:41:50.6186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNi/iax/QYyn7KRjHPNYMT94H/JqUGtJAc0IM7i1HMCE9oRaJZCeYXj0MgYGVzALI7RhiLIUTb98pMYXUcbV8mbz2LVe4wO1MoGnPKSU3Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: 13 November 2026 20:50
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Yadav, Arvind <arvind.yadav@intel.com>
> Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and
> GuC CT pause-abort
>=20
> On Fri, Nov 13, 2026 at 06:51:50PM +0530, Tejas Upadhyay wrote:
> > xe_guc_submit_pause_abort() walks
> > guc->submission_state.exec_queue_lookup
> > and unconditionally calls guc_exec_queue_kill() on every entry found,
> > without verifying the queue hasn't already begun/finished its own
> > independent teardown. guc_exec_queue_fini() (run once a queue's own
> > refcount drops to zero via the normal close path) only erases its
> > xarray entry partway through its body, via release_guc_id() -- so
> > there is a window where a queue's refcount is already 0 but its xarray
> > entry is still present.
> >
> > This was caught as a debug assertion firing on both BMG and CRI:
> >
> > 	xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
> > 	WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at
> guc_exec_queue_kill+0x2e2/0x360 [xe]
> > 	Call Trace:
> > 	 guc_exec_queue_kill+0x2e2/0x360 [xe]
> > 	 xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
> > 	 guc_submit_fini+0x11f/0x180 [xe]
> > 	 devm_action_release+0x15/0x30
> > 	 ...
> > 	 device_release_driver_internal+0x230/0x270
> > 	 unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs=
, sysfs
> unbind]
> > 	 pci_iov_remove_virtfn+0xd1/0x140
> > 	 sriov_disable+0x42/0x100
> > 	 pci_disable_sriov+0x23/0x40
> > 	 xe_pci_sriov_configure+0x2b9/0x1350 [xe]
> > 	 sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF
> disable]
> >
> > Pin the queue with kref_get_unless_zero() before touching it, skipping
> > entries that have already independently reached a zero refcount
> > instead of operating on an object that's already being torn down elsewh=
ere.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index d76f125f9c3a..7a3bd698f217 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -3306,12 +3306,18 @@ void xe_guc_submit_pause_abort(struct
> xe_guc *guc)
> >  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> >  		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> >
> > -		/* Prevent redundant attempts to stop parallel queues */
> > -		if (q->guc->id !=3D index)
> > +		/*
> > +		 * Prevent redundant attempts to stop parallel queues, and
> skip
> > +		 * queues already dropped to a zero refcount via their own
> > +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> > +		 * not yet erased)
> > +		 */
> > +		if (q->guc->id !=3D index || !kref_get_unless_zero(&q-
> >refcount))
> >  			continue;
> >
> >  		xe_sched_submission_start(sched);
> >  		guc_exec_queue_kill(q);
> > +		xe_exec_queue_put(q);
>=20
> Please make sure this doesn't regress FLR flow, where we need to keep the
> exec queues around to reinit them later.

Yes it needs to restart, I have split the check in next revision to restart=
 submission.

Tejas
>=20
> Raag
>=20
> >  	}
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> > --
> > 2.52.0
> >
