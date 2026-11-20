Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1D4606A515
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbaKmS4S;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZqBoo8IP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39ED10E227;
	Fri, 20 Nov 2026 06:07:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A453A10E0F0;
 Fri, 20 Nov 2026 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795154826; x=1826690826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TAuSfpPB/h6s5ql2RpTfCK3LeFwJef58WMvZuwi1JIk=;
 b=dbaKmS4S7E+TmHzTj2BWTriBUBB9mEhGAurF5tKsmlXqjZSMz3mHI/FQ
 EgoztcBIeCUPsBFta2s3FgjaRsC/NN4IJVoUAFeHP8monccFzAi7rGcvP
 9rGOshUlNY1TfIEgGbcnq79D9yiamBAPJtKzmsLR01APNPZxb/zIZ6ve0
 1olhG8W0pdHDFpCqiStlNxTVojOWgL1BQ3xiFI0YCNsWH1t7zHYWYA5+7
 WCUFe7QpaAdMqFBDHGroOP9IG3VTi6Z8oYr6wZkhamomrUktx2qFHuN4e
 MHgzeCQaNrTyO2lUMGoaCuHxEXvi8VJosylV84kPB5tewUuTpUAQw6F1b w==;
X-CSE-ConnectionGUID: AFju7iTgSkmVV68vXxMXNQ==
X-CSE-MsgGUID: Gcoorb38QJ+PQXgCnhdG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3940991"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3940991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:06:34 -0800
X-CSE-ConnectionGUID: f2a5Gu/4TSu8XFYOuKpEUQ==
X-CSE-MsgGUID: ZNOsaSOKSl6nGw9MwQNlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10972850"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:06:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 22:06:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 22:06:31 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 22:06:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCbteQfV2AxZpO8iJnPRP+cpGTV2UErzI3mL3a2h6illc8G2mNrxkaqJ1dThSujjsyEMjV7wYv3kBRcYRm6nwZUYQOC2hEzlCXV+DGJQfiSn6DY8WHixV2Q3lXhxAqhASCGhfuw75ZsTPd3t0yz8GL2I0L+RwkgZZbUXEfHNOouKl5f8BG29pjNZzkKZG81A4trHKVgjkJZ4NFE+ueAutih1VXyDDxGeDlXEZaHSNX0AVmwt/xLEDVgVFdZB75AmyLxObY73OmnMwJs+8D4IDt7LoYTVdkxPJIuhv5TABiVxOZ63npnbUn9yEJdH+EzhF9d83fIbf1gKA12dn1iF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOcfWagt67nmEd54MqacXlmC2HeBLfQFHSzpEyqluVw=;
 b=Vm5x+Wwfx1A85Bu0os/hkN75PETq08DgP4nwbIAuBLq468XFIBq0sqWVvqO7AUFPc8U9ATAufH6ksy2Jkju6xBlnK/CMeRFY7R+84LJwGpm9JWNtUlnnJjAcdmDenxZB6u/Mwoa2y6jxAdDD8mAx17idmrKjnVjE9DeL9QqFKPXpp5TV/f5WVEmSs4xbn9Sq4g7/x48qvRu2aepdusLProDnZy9x5enImdQEC6pPITvP2kYjWghToXIB5bGTeWxJ+Qf4jhglWNJElHvDGC/jJdyWvsxnzspzTy+qASj8MqAPdcS5GVoZKZxgKJhyWvhBtYGX6imRWhnIeo+KNoEo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOcfWagt67nmEd54MqacXlmC2HeBLfQFHSzpEyqluVw=;
 b=ZqBoo8IPbiJ6CcJTGH1dStRyRe+1uug9Ej90kAwy6Yh383dKgNoUZ1djZEzWQEs1PPqVkju8ts5njnq0upJpJEky1U4RmirNEK9vkwjIdryMv4vHJ1G+n3ZlUvLwuN0cMOwgYQd+86wVJerqElJjKs8Zb8A+yhVsuv6Jbblp3a8=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA3PR11MB9112.namprd11.prod.outlook.com
 (2603:10b6:208:575::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 06:06:23 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 06:06:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Xie, Xiaolu" <xiaolu.xie@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Kahola, Mika"
 <mika.kahola@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Deak,
 Imre" <imre.deak@intel.com>
Subject: RE: [PATCH] drm/i915/lt_phy: Fix the main link to TX mapping
Thread-Topic: [PATCH] drm/i915/lt_phy: Fix the main link to TX mapping
Thread-Index: AQHdd/SSNyeH7CQpj0iM3OHgVAWH3rc2eiQQ
Date: Fri, 20 Nov 2026 06:06:23 +0000
Message-ID: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261119070444.2106229-1-xiaolu.xie@intel.com>
In-Reply-To: <20261119070444.2106229-1-xiaolu.xie@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA3PR11MB9112:EE_
x-ms-office365-filtering-correlation-id: 65b19f0d-d21f-4665-2fb3-08df46cc6784
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261022105027099003|38070700021|261026121527099003|10067099003|261026140227099003|11063799006|56012099006|261021123027099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|22082099003|18002099003|3023799007|261009223027099003;
x-microsoft-antispam-message-info: EKDF9gcAJcwG1+wWSveFFRDUChAo1LNHWtNQC3kBGXFjsjGs9XYCke7cR4rlOKsgLuvSxN/6wRW57ZWte/UASwLFUBGE9A5sVLz6/z6FSccTDKXYWLiD93WsaIFnr3RnDx3InQl80Q+WFnK47pdaW+vz7/w3fe+Uh7g1faR8L+NjMDp+B+3P3oZT327DnQGoi5v5wIz69vLp+82TLwU3opicIzP+27HX3fRmxPKdCOic7aua9cJOw4yP5PbFSE55i4CHvqXvMPTiL3re7FL/sPxpKs8rtlT+hWQJB4wCiGSqRx8wsfniLUzL8DCpe4zA38YnwKI1dQuUibSJ4z/suBb/xZzs17iXk/uC5aaCI+3UNP1aj4WSTJM//cIaXJmln5UfuPIOj8TeYLcFWzx+E7PqMiIoqMs5sL7HqQyHp68gc12hlIRfaaGX8NsdBmSZ2TqxmXEmbpuJyJ9bpSIRNpCKv8/NMWoVUhKUcyoED7ktjyWxpID35TCqhFnbHVlPoTSwLhrcr4C9EalLN+d/mCOOT0r1P7juXAVF8/MidmyWTnRNBg4LDVcstG5AmbVtQUrX44QkmgD3Oa10okAQL4BXSi/e9xVOE5GgpHGG6Mt3s/JlKfIPXBY/qAa/PyzlK+pCe42860raYc5lNcNi5vPER0id07W6oJNb/2wHu7K3Wzaelw2ZcbCdped5vzOn7QfJlvXRioKu1OaA7bGPPwp4HTR7GaHgJ0lKlHGTN0o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022105027099003)(38070700021)(261026121527099003)(10067099003)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(22082099003)(18002099003)(3023799007)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xnEiVW5UQxBLeIRuJtImCXphhU/S5TeS8THLF6MsClpWf5GI91z1oMqvF5?=
 =?iso-8859-1?Q?tn2ENgao5YWRFuRCpa5g3I6J1Oqb6r/QRYAxhvLeUsXTSzOJU9vlEQzHrS?=
 =?iso-8859-1?Q?6I3gJnxLHO7Kvigm7zphDVnm97VWqAy0voy4k+2evTLRk/v9miaIUinsNB?=
 =?iso-8859-1?Q?y1pzEHrSJY7LX7kH9sdw1wxhtZnQ+WBKUJBYQy6HYrGxafjl8QZEQDZhyz?=
 =?iso-8859-1?Q?DT6uQ3BjfSfKY+fQCIPA+ygLuRjSPbeT51qFOKNuoaDOVCFKmoZ0ktOZRq?=
 =?iso-8859-1?Q?zh8zUxDAdJzDIPMr3UgRuI6eWghwl8Exns5+qJg5SVzU0ccaGIFxrTdL/n?=
 =?iso-8859-1?Q?RE1Ls615yxPA+J7WAEc/IYcEr2Xc7WLJcq5/FClxQ5jNNiUA9VGkQND4v8?=
 =?iso-8859-1?Q?sO5Jzj1pWn/5NBCs3DQmZ3z+qCSs3N3CUFC8Gk/iszaBez4FXpztfFzFs6?=
 =?iso-8859-1?Q?wLveE0AJkNT+tAPmFS+cRZrwvt9LegQXRW/BR/cmFPAzntb6fNGXlTogdO?=
 =?iso-8859-1?Q?7qGpdYZ3dIh4Prp5x6eamnXIPpW7+SR6oPYNsBkQm+OapbyjZhY8JMzz4d?=
 =?iso-8859-1?Q?+cKdkyIZLksrh0ILC860d9iw4ospYZJOtO/9Kr2V9rvem9VL1SXGqaX0RU?=
 =?iso-8859-1?Q?iLgpee8NpO11wqd66P1zTaHr08etNadI58q6nu14n/irMoYY6/6tKYYsrZ?=
 =?iso-8859-1?Q?mpwIvM8Km5D4SLfH8AZRA3PcoETKpSOT7aEui5Czo07ldTXyaj6QzhkhSZ?=
 =?iso-8859-1?Q?Uo6hMTzI510CcP/U3gXgzPU+LgOiYmWfhvKNB/0npha/alpEKobKcoskRy?=
 =?iso-8859-1?Q?MoDduZxI689vvfDyE4ceszFVjYXA6Um3trLHV8DAKK4/V1TVCf6HcoE3Zk?=
 =?iso-8859-1?Q?p63k8XfPNDdRlfgsxPhry4uoX44r2D6v+uVprmk3oTyzwNVXOw4UY6i9oO?=
 =?iso-8859-1?Q?b05YAsODo4a4Ly9X4c10uTs1DT4HvZCO+PHAfAghufBStwe+nM85+NslLc?=
 =?iso-8859-1?Q?HHmb2gmwgd8Mrx4x0Etr8Ng1b4YjMVjtZsfoZo8oZdaO51pJ5Pzxljd8Se?=
 =?iso-8859-1?Q?amT9ltNGLBSKaHX6Uf+K+ilSqyj5jN1ABohWTA5RiapQ1LPk1kSYM10tS1?=
 =?iso-8859-1?Q?lPcc+XdT1SeevG87IEhPWxTigUex3uSPWgnfzaXbSAiNtPUJzalZBLPT08?=
 =?iso-8859-1?Q?nHBF9IaCv2uIRtrMsDAEy+PfPPnkbUdNXMGa5crfySWj02ZCYoWKb8EYPK?=
 =?iso-8859-1?Q?flWybCG43f2Fn21og6Bcm/TBCiUmYQ6GbDuDAmFnLhfPoHDxVyP54b6iQO?=
 =?iso-8859-1?Q?Tmt8iHxnJ/zcatPfybOU9AF0QLHBEUMEZngspqS0is4/r57MPkD7TS5eBl?=
 =?iso-8859-1?Q?20SWIgMLKLgjjOaCF9lfQZWIAx1NmyQ0wilv3qSzNexJsj3Z6ZvFkdSioU?=
 =?iso-8859-1?Q?aIvWJXvwwkCbvLwgL/ycEH5QMh6EM6JNayeVNM81y+Y0r3n5iIb+QUMgqF?=
 =?iso-8859-1?Q?B2fefstGGrlrYP8bnCnN7qV2JtN3cE3erTyoDlz2xfUHIDvnl2wG6VZgv0?=
 =?iso-8859-1?Q?rwGSs1FrQm1kxwt3y8x0ctAb00EJnFVSa9gDGaOqqEcM5kxMFIhVBinbLw?=
 =?iso-8859-1?Q?qTewfMjeKuDa3qre87yvnZHs2VsbFAzBgx/Byb1Dkxvhy05aouMw19PEnV?=
 =?iso-8859-1?Q?vK+yP08v5+zZNxhH/1mEI8gARyhI9bzeC4sae23za/HgIA9MLFc5mnDen+?=
 =?iso-8859-1?Q?IuXS53wligbs9s4uYWiC6yTGymnBfd9rKUJ3tsWDHIN4uKtHiiUjFjbnOP?=
 =?iso-8859-1?Q?uMlxcCBiVw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PmihFwD/0vZIhFPmy331GEbAAtzJhviU53pIKy4V/k5r10HzBPOvyEm964tBw618j0h4tZsFkOA6k6JFzOtdW5FLZaa0wjgefnc++hB6yy2xGB6UF4cqNOp4gi+2aI1YA+RVMxUNbhc76CCrTDJGHAO4zRw1KQtHltUtmeCYXfBavtClnbvQl0ADIF8mjzUKbXozcE+4t9/RFhv0hJx59nk8ZQMdaOji9Am6vKHblxur0J8aEYhhpWZOeRHdbS+mmixieBrfXBEJihTMGOzp83PBZ5f9WZ2ADCl/jsHPx7gTBNvmhwrlNk+TkXgfwtUjAcFpmaoVyFeHjty0hUTA9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b19f0d-d21f-4665-2fb3-08df46cc6784
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 06:06:23.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3sccwZdrsgqxE5ezbRIPX5HEtMa8xmo6neLIl43FZwaeY6UhvM/IUzeb/qd+K7L+Oc/nUxG7Qs1ZwZRTuxnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9112
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

> Subject: [PATCH] drm/i915/lt_phy: Fix the main link to TX mapping
>=20
> Each main link (ML) is routed to a specific PHY lane and transmitter (TX)=
. The
> mapping depends on the connection type, on the lane reversal and, in DP-a=
lt
> mode, on the pin assignment, see the PHY Lane and Transmitter Usage table=
 in
> the LT PHY Bspec page. The driver gets it wrong in two places.
>=20
> The signal levels (voltage swing, pre- and post-cursor) of an ML are
> programmed to TX (ML % 2) of PHY lane (ML / 2). This is correct only on n=
ative
> ports without lane reversal:
>=20
> - In DP-alt mode ML0 uses TX2 and ML1 uses TX1 of PHY lane 0, so the
>   parameters of the two end up on each other's transmitter. With a
>   single lane the only enabled TX, TX2, is not programmed at all while
>   the unused TX1 is. Reading the PHY registers back on a DP-alt x1 link
>   showed the cursor values on TX1 and TX2 still at its reset values.
>=20
> - On lane reversed native ports ML n uses TX (3 - n), but the lane
>   reversal was not taken into account.
>=20
> Also, on a single lane DP-alt link with pin assignment D the driver enabl=
es TX1,
> whereas ML0 uses TX2 with every pin assignment.
>=20
> Add a helper returning the TX of a ML and use it to program the signal le=
vels,
> and enable TX2 for single lane DP-alt links regardless of the pin assignm=
ent.
> The orientation flip in DP-alt mode is handled by the FIA, so it does not=
 need
> to be accounted for.
>=20
> Fixes: 13ba213f921f ("drm/i915/ltphy: Program LT Phy Voltage Swing")
> Fixes: a54bdcb7142d ("drm/i915/ltphy: Enable/Disable Tx after Non TBT
> Enable sequence")
> Bspec: 74701
> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>

Please break these commits into a 2 patch patch series, one in which you
Add changes to intel_lt_phy_enable_disable_tx and the next one which has ch=
anges related to
Voltage swing programming

Regards,
Suraj Kandpal

> ---
>  drivers/gpu/drm/i915/display/intel_lt_phy.c | 32 ++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index 86492651b0..2e2fa8fa64 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -1827,8 +1827,6 @@ intel_lt_phy_enable_disable_tx(struct
> intel_encoder *encoder,
>  	u8 lane_count =3D ltpll->lane_count;
>  	bool is_dp_alt =3D
>  		intel_tc_port_in_dp_alt_mode(dig_port);
> -	enum intel_tc_pin_assignment tc_pin =3D
> -		intel_tc_port_get_pin_assignment(dig_port);
>  	u8 transmitter_mask =3D 0;
>=20
>  	/*
> @@ -1841,12 +1839,8 @@ intel_lt_phy_enable_disable_tx(struct
> intel_encoder *encoder,
>  	switch (lane_count) {
>  	case 1:
>  		transmitter_mask =3D lane_reversal ? REG_BIT8(3) : REG_BIT8(0);
> -		if (is_dp_alt) {
> -			if (tc_pin =3D=3D INTEL_TC_PIN_ASSIGNMENT_D)
> -				transmitter_mask =3D REG_BIT8(0);
> -			else
> -				transmitter_mask =3D REG_BIT8(1);
> -		}
> +		if (is_dp_alt)
> +			transmitter_mask =3D REG_BIT8(1);
>  		break;
>  	case 2:
>  		transmitter_mask =3D lane_reversal ? REG_GENMASK8(3, 2) :
> REG_GENMASK8(1, 0); @@ -2116,6 +2110,23 @@ void
> intel_lt_phy_pll_disable(struct intel_encoder *encoder)
>  	intel_lt_phy_transaction_end(encoder, wakeref);  }
>=20
> +/*
> + * Get the transmitter (lane * 2 + TX - 1) used by a main link, which
> +is also
> + * the lane and TX to program the voltage swing for, see "PHY Lane and
> + * Transmitter Usage" in Bspec.
> + */
> +static int intel_lt_phy_ml_to_tx_idx(struct intel_encoder *encoder, int
> +ml) {
> +	struct intel_digital_port *dig_port =3D enc_to_dig_port(encoder);
> +	static const u8 dp_alt_tx_idx[] =3D { 1, 0, 2, 3 };
> +
> +	/* The FIA muxing handles the orientation flip in DP-alt mode. */
> +	if (intel_tc_port_in_dp_alt_mode(dig_port))
> +		return dp_alt_tx_idx[ml];
> +
> +	return dig_port->lane_reversal ? 3 - ml : ml; }
> +
>  void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
>  				    const struct intel_crtc_state *crtc_state)  {
> @@ -2141,8 +2152,9 @@ void intel_lt_phy_set_signal_levels(struct
> intel_encoder *encoder,
>=20
>  	for (ln =3D 0; ln < crtc_state->lane_count; ln++) {
>  		int level =3D intel_ddi_level(encoder, crtc_state, ln);
> -		int lane =3D ln / 2;
> -		int tx =3D ln % 2;
> +		int tx_idx =3D intel_lt_phy_ml_to_tx_idx(encoder, ln);
> +		int lane =3D tx_idx / 2;
> +		int tx =3D tx_idx % 2;
>  		u8 lane_mask =3D lane =3D=3D 0 ? INTEL_LT_PHY_LANE0 :
> INTEL_LT_PHY_LANE1;
>=20
>  		if (!(lane_mask & owned_lane_mask))
> --
> 2.43.0

