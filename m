Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF3C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E1B10E6D4;
	Mon,  7 Sep 2026 08:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ernb28a2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5FA10E6E2;
 Mon,  7 Sep 2026 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788769216; x=1820305216;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=adU84y3v1VkR9ON3W/5BDA8NrfUxyrWQsdQhvm3J/Uw=;
 b=ernb28a2n/fO4BEMy8IW7ENXtxboax0tbuE4SnuWJ+i5SiiFQGNwRNxn
 UcudzysEBfLefo8Nv1z1Ed8OjiiqPZ2EgDl87jX5T6V0PvUmTZvp7waNE
 KcB194UoJY9vXNuU9pUNPhDdFEWTLNo14hMLvUmYWscKVcW5Y+IJzx2yo
 K4dXo0JQJ/KsW4p7D3cC8iquJoheHXwaDjjO2+ihJMAuhDjuMfi/ECwxp
 Ue+rUB0TfLgQwOiP2mSXANhhIITPdbf81JJL5WYUgOdfty/z45cYIUvw0
 qaPWB+tfGUwZYc4FKqiE813mXQqJD9Na0ynYD05ghK2COtfwj+kaiDWMk w==;
X-CSE-ConnectionGUID: zFxNzG1pTc2xl2yNr/ObBA==
X-CSE-MsgGUID: YEO2RKYrSN2d8yPHbtCmfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99828199"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99828199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:16 -0700
X-CSE-ConnectionGUID: uoaGgkG3SXy50F5sABaoOg==
X-CSE-MsgGUID: LMwQZRILQqqAsc3vZQ7GNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266296857"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:20:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 01:20:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyM5w9I6VG++QOyEGmxm3FKub4FiPcyloY/ORByl1G/rYY0l/z4xBavwQrQmkTMaR9befmMLUpI1/NG9MXznLBe7+xQipKQRn01XFAmMbmagBqmoCQAVP8RC1JvMzE59vhgw/GyWMZzvNsksLbFfqv+yGY8Ab4qjatCO5AJvQDzp0R9W3Da1+4cIVFAt1CDv95TpqK4huueO/Xs9erHYvbI48Ztwusfhkcz0+Yp/g4p1pRISPezKNT5NNSqoDrpNRi52M/e7u0fMTvA6iEY3flpt9jH2e566DUO7WPG2WGdg6ufkARIIR+K/56qf0epupIsVaZCyrT8nynHuTLVq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JljTA9BrYbPwIKAtADB80o2fI40Je640UxC2vGKEvyo=;
 b=TKChQiAYwGtAq72GTHYywKsrIqVdm4jXWmJhnzAWnpH7hgiX+uX/qgP1Z+yepcrqJp1AH52kemaWu5DDORa54id1+E1nBS8xB2TIYVTnSjbum9504QN8vKqfIy5LBAQrXzE0PQ6AcU/COwQQZkg9eeF2WCOxgTR/yGVWMlYGAs/2SYyONgD1NDTG0G1GChXiITc5NO6539Ta++g+GHzzow4417SjDNjyW0j59ltXt61V8ChZCa+D5wa8Y2BmhMrN/a3FapSm20Aw3rJxqNiyxqWRdF81mvYymIuCZvGJEzO5yD25W5t417Ij/97sdtKjDHTV9A1TQXVjRuWZWDFwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 08:20:05 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 08:20:05 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Topic: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Index: AQHdPoHipDrx6ywSyUCjYl15ste8M7bCwqmAgAACk0A=
Date: Mon, 7 Sep 2026 08:20:05 +0000
Message-ID: <MW4PR11MB68878DC19B5DDF9604992E34E3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260907042944.3127031-1-nemesa.garg@intel.com>
 <IA0PR11MB7307DC639D1A8A3428D96958BAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307DC639D1A8A3428D96958BAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH7PR11MB7097:EE_
x-ms-office365-filtering-correlation-id: a3dd155b-266b-4c46-9da6-08df0cb8d295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: E9g76IIY1dgIQRrkaVmk+T7AJouKJbYPHJE/v5v6m4EwQWff1SQN0t54I5VZc3fkuBfmWAqgJAjt4pH5Qp/x/8syQkmOGIPflNeD8v0F1sFbprP74wwGbW86cR7j5xs8OKaafgL3xEVhYLczS0NhXIj4axV1Rl/ePwaAoEMh2M9zl56tO1zSBgZSsa8jBFnawOUEIGr56SuDdU4RDcTUQkUw1oFKhu8Piy29kxUJtK+CY3jIbhpiyY6b3ewEqOrEST0RUnTDV3eNpBB9e55iDHLzYKrPLWHt3pD+3LRm7he+lC1uZk/5yYhTqfz+OhVcZL56Ya9xIoEf77mrE5TFep2qryJvHkn2ETamv/q4UwGyt+uPpkGHG69QqUllTT5kFut1rSLn5VsEZkYQnVjXxb8rcqfybo2oztSjsTJzj5qoHitqdfixo9H2joCQX6PEB14B9DE/z2he6O0yNTPWJYEundhzZ7wwQqkh0tDyGk6KvBuHIy9eellDPvQVYAd9KBOVjRidZA/M9ESffB4bjTGmSi4dAE/V1XQ+ha1Zlgl1oRrOGyvI/Sx7eIQUa2M7m9l5yztHrnA/1aiEUwyh30ANophP1ASCOuOadqiZBr1mZkwx1c+ZCz/axznbI20bFHjzC5ssiM/8gzae2KBv4aFZfvJsbrMuCVSDeadmJh0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pCyYSHthZKZkO22VtbDTxuQ8VWIYX7ZssUbGBMrUIAcMIbcBNwqpWiVeKR9J?=
 =?us-ascii?Q?hqppTa8UF68j/38cvriN4RY/Qc9nQRWw1uXh6ZJBOLh8qEMPZ9T53zMvnNX8?=
 =?us-ascii?Q?cl1UjG9nXGmTxEyHe6DF2YlIlPiBc3qBqOWPkmM1NvRf071wMIu0e3QBnoYG?=
 =?us-ascii?Q?pvEjyqvx6vYwVydWe8oBz4muXtXmh76J55lN4+7H9yAFYq8S6GmLJmICW2jW?=
 =?us-ascii?Q?yw/TfqrayRG8W2rb692a17uoT1FO372LW8HPXyRBNCQAFJ768KxI7yCWpGW4?=
 =?us-ascii?Q?kjULaXjYrUmDCo/T/rlJo+wZJaARTj0FZ3QWZwRYxnrAzdMRvoZcWDFo/I8V?=
 =?us-ascii?Q?VONxLogoAqekNsYaRzLk2iJbQI1e9mpdOrMM65yCHNM4JVemItJHII35Ax0W?=
 =?us-ascii?Q?nt7ntzGdY/nU3bH/tATUmYjVPbdvLjpVPX2PydeMruylm7Ew2L6TW4WomjWp?=
 =?us-ascii?Q?+Q6Dsm623F+/wXAIe2Ecr+Y45V0F62vDF5TcCR/iee+phG4u1FtYe/5/Me1z?=
 =?us-ascii?Q?kySoc5YfzHGpBTVJY6vlTvpaN/2EjqEQwb69jNDmo9kEHmnV8YyfdChX4h+N?=
 =?us-ascii?Q?pO8oGMl3SbxvcX/y0+yAmDN193beGxtu/ih5qtH2K1CkHryr01zKgGtLzKMw?=
 =?us-ascii?Q?aeInETMoPUvnMV4p4keb2hDip1705HLZ3mQJYdFKGFbn9IgJrT5yVtzcY2Kq?=
 =?us-ascii?Q?/U1SyWKKthJ5NYtN3XZNr19368wXaKmyaqUDe9TmECU/29FCN9Jdxb2TsgQj?=
 =?us-ascii?Q?+DWR9+4B/2/yAkDz4xU2dwL6OHDq7Jowql7uknWue0zNMClWXtqtc95FnUj8?=
 =?us-ascii?Q?KHlYkmVrEOGk+NXXM6Cp2GzIyvzMEAIP9FEv0dHDTH/Ag53Y87cJozzHttSn?=
 =?us-ascii?Q?vzGGwTn8JzrqHbB3+HsWZb52eLWpYiuNnljdQ0BVue1yev4qJrsPJ5s1pCHH?=
 =?us-ascii?Q?Tmbao0LAKd8FpkhUxmPjBmkaP6eQfqE0J76b+xvbhJcxTXgyI+DpeRe55PK2?=
 =?us-ascii?Q?lVt+AG9f7TqoxSwo3o4jlx8zkXXlpXmi+y9ERYzlQTfP6MS0o4C4y/u2R3TF?=
 =?us-ascii?Q?xdS7jsmqnp5mnEHZ66hd9BnBxfM++h6T0P0Cz5TY5P+14v+KqQzWSyNwLQzY?=
 =?us-ascii?Q?XIi55EplQMYYGiL/nL14dAiL3oGb14LsBnFhpX20Fn2YF9KdFCRlZwhS6rQI?=
 =?us-ascii?Q?PYYtpboMb44rItqM+16c/s1niE0pA7CuRoMf6yYgJViB7GsbXSwveA4Bwmxt?=
 =?us-ascii?Q?v/RLsuCNAHF/DLy+eozm2BDvCOT1egXsnhCcnE2t/tD1qUrZc6A1Q37yIdPa?=
 =?us-ascii?Q?rlqtOx7MR8dph8SGi51h7SlOia6mbLNR0NL8XnLLFfKCbVkC9hcEbqB7QX1m?=
 =?us-ascii?Q?5piHK1V0jDIuIKCPocudXCjMoLlIf6y39M5kG5lPyJYDFxjCQ7GfjkdqXmEH?=
 =?us-ascii?Q?V1ym21/MG5bMc9Q1QFc94Tw+yIbE/5FXWGU1V/7n0H5288GmDNV1Pz6fUg3L?=
 =?us-ascii?Q?9QD5xiw0dbxQyE3TxA4KZjbt73/JCDFCDVdZ2ACn8f9MDg5Ji953rWDEkGRG?=
 =?us-ascii?Q?+xbuYo5IRW/iQXtydRQqym+MORs6zS+8IfnlI2Uo2LmcOkEqAvpE2BEmXgd9?=
 =?us-ascii?Q?nfSET0YkQDulgRkgjksK9i5PvRjRIi2CJ2TrCUu422rOYotX5WV5EgPzJgXY?=
 =?us-ascii?Q?5T1PoH01yLY+UDWKsquag/bVYpT4+QCucdYlsx9sFawf1gzQz99DTKwKYvPn?=
 =?us-ascii?Q?yBv83iGD4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I7BN7Z4Mfd4tmgx02a41Euq6p1D/Ne0UTy52bMsZxkS5X0YkKbwlXp801TR3GcqkQgV6RJSH1lNTCDtdMixZqfsJ3RF/F8D10CKA+yo5XFx3q1LE+QrWTO5LjdheB6Ti8TtCrnlBypqpI4SbtLY3LU8DGSFPVR7SEtuJj5nUdEFn4rZKbSimKoMmbNn7CWX8jnZFhxxlFN98t53m41FuAVI4JOGdOSfkq6axyrYylz+D+9chtet2QbuzR60bV3cD0sPwCmgirX/SKarN3PUuh6ax5lsKKlTTthzwyZ5inGngWcKa5DrTx46uFlMWsPBIFviPVCR6mJTHjTi6gIHwGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dd155b-266b-4c46-9da6-08df0cb8d295
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 08:20:05.6397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YA1Ev0hvFQllJvTjgIbYA8QNK6JYai9InKnYlIiDkNH/fMj4R02Oy9OejBjrizt7NHRarjFyocgqF818xA5C+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
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



> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Monday, September 7, 2026 1:37 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: RE: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to suppor=
ted
> pipes
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Nemesa Garg
> > Sent: Monday, September 7, 2026 10:00 AM
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > Subject: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to
> > supported pipes
> >
> > Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> > plane disable") started clearing SEL_FETCH_PLANE_CTL and
> > SEL_FETCH_CUR_CTL on every plane and cursor disable.
> >
> > Not all pipes implement these registers. Clearing them on a pipe that
> > does not have them leads to an unclaimed register access.
> >
> > Skip the clear on pipes that do not implement the registers.
> >
> Looks to be a mismatch in the commit message, can you re-check?
>=20
Sure.

> > v2: Write SEL_FETCH to 0 only when enable_psr2_sel_fetch is true.
> > v3: Build fix.
> >
> > Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> > plane
> > disable")
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cursor.c   | 15 ++++------
> >  drivers/gpu/drm/i915/display/intel_psr.c      | 30 +++++++++++++++++++
> >  .../drm/i915/display/skl_universal_plane.c    | 15 ++++------
> >  3 files changed, 40 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
> > b/drivers/gpu/drm/i915/display/intel_cursor.c
> > index cce041e1da51..90173040d825 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> > @@ -531,18 +531,13 @@ static int i9xx_check_cursor(struct
> > intel_crtc_state *crtc_state,  }
> >
> >  static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
> > -					      struct intel_plane *plane)
> > +					      struct intel_plane *plane,
> > +					      const struct intel_crtc_state
> > *crtc_state)
> >  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >  	enum pipe pipe =3D plane->pipe;
> >
> > -	/*
> > -	 * Clear this whenever the hardware has selective fetch, not just whe=
n
> > -	 * the current state uses it. The cursor may have been enabled with
> > -	 * selective fetch earlier and had its enable bit orphaned when the
> > -	 * feature was switched off.
> > -	 */
> > -	if (!HAS_PSR2_SEL_FETCH(display))
> > +	if (!crtc_state->enable_psr2_sel_fetch)
> >  		return;
> >
> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0); @@ -
> > 592,7 +587,7 @@ static void i9xx_cursor_update_sel_fetch_arm(struct
> > intel_dsb *dsb,
> >  		if (crtc_state->enable_psr2_su_region_et)
> >  			wa_16021440873(dsb, plane, crtc_state, plane_state);
> >  		else
> > -			i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
> > +			i9xx_cursor_disable_sel_fetch_arm(dsb, plane,
> > crtc_state);
> >  	}
> >  }
> >
> > @@ -701,7 +696,7 @@ static void i9xx_cursor_update_arm(struct
> > intel_dsb *dsb,
> >  	if (plane_state)
> >  		i9xx_cursor_update_sel_fetch_arm(dsb, plane, crtc_state,
> > plane_state);
> >  	else
> > -		i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
> > +		i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
> >
> >  	if (plane->cursor.base !=3D base ||
> >  	    plane->cursor.size !=3D fbc_ctl || diff --git
> > a/drivers/gpu/drm/i915/display/intel_psr.c
> > b/drivers/gpu/drm/i915/display/intel_psr.c
> > index f490beb66629..702d4b6d62a4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -58,6 +58,7 @@
> >  #include "intel_vdsc.h"
> >  #include "intel_vrr.h"
> >  #include "skl_universal_plane.h"
> > +#include "skl_universal_plane_regs.h"
> >
> >  /**
> >   * DOC: Panel Self Refresh (PSR/SRD)
> > @@ -2162,6 +2163,33 @@ static bool psr_interrupt_error_check(struct
> > intel_dp *intel_dp)
> >  	return true;
> >  }
> >
> > +/*
> > + * A plane disabled while selective fetch was off keeps its selective
> > +fetch
> > + * enable bit set in hardware. The bit does nothing until selective
> > +fetch is
> > + * turned back on, at which point the hardware would resume fetching
> > +for a
> > + * plane that is no longer enabled and keep its DDB range reserved.
> > +Drop the
> > + * bit for every inactive plane as selective fetch is enabled. The
> > +active
> > + * planes are programmed by the selective fetch update that follows.
> > + */
> > +static void psr2_sel_fetch_clear_inactive_planes(struct intel_display
> *display,
> > +						 const struct intel_crtc_state
> > *crtc_state) {
> > +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > +	enum pipe pipe =3D crtc->pipe;
> > +	struct intel_plane *plane;
> > +
> > +	for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
> > +		if (crtc_state->active_planes & BIT(plane->id))
> > +			continue;
> > +
> > +		if (plane->id =3D=3D PLANE_CURSOR)
> > +			intel_de_write(display, SEL_FETCH_CUR_CTL(pipe), 0);
> > +		else
> > +			intel_de_write(display,
> > +				       SEL_FETCH_PLANE_CTL(pipe, plane->id),
> > 0);
> > +	}
> > +}
> > +
> >  static void intel_psr_enable_locked(struct intel_dp *intel_dp,
> >  				    const struct intel_crtc_state *crtc_state)  {
> @@ -2180,6
> > +2208,8 @@ static void intel_psr_enable_locked(struct intel_dp
> > *intel_dp,
> >  	val =3D usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
> >  	intel_dp->psr.dc3co_exit_delay =3D val;
> >  	intel_dp->psr.psr2_sel_fetch_enabled =3D crtc_state-
> > >enable_psr2_sel_fetch;
> > +	if (crtc_state->enable_psr2_sel_fetch)
> > +		psr2_sel_fetch_clear_inactive_planes(display, crtc_state);
> I assume this has to be caught in atomic_check stage.
>=20
Ack.

Thanks and Regards,
Nemesa

> Thanks and Regards,
> Arun R Murthy
> -------------------
> >  	intel_dp->psr.su_region_et_enabled =3D crtc_state-
> > >enable_psr2_su_region_et;
> >  	intel_dp->psr.psr2_sel_fetch_cff_enabled =3D false;
> >  	intel_dp->psr.req_psr2_sdp_prior_scanline =3D diff --git
> > a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 5cda1ab90e40..07a683293352 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -879,18 +879,13 @@ skl_plane_disable_arm(struct intel_dsb *dsb,  }
> >
> >  static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
> > -					    struct intel_plane *plane)
> > +					    struct intel_plane *plane,
> > +					    const struct intel_crtc_state
> > *crtc_state)
> >  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >  	enum pipe pipe =3D plane->pipe;
> >
> > -	/*
> > -	 * Clear this whenever the hardware has selective fetch, not just whe=
n
> > -	 * the current state uses it. The plane may have been enabled with
> > -	 * selective fetch earlier and had its enable bit orphaned when the
> > -	 * feature was switched off.
> > -	 */
> > -	if (!HAS_PSR2_SEL_FETCH(display))
> > +	if (!crtc_state->enable_psr2_sel_fetch)
> >  		return;
> >
> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane-
> > >id), 0); @@ -926,7 +921,7 @@ icl_plane_disable_arm(struct intel_dsb
> > >*dsb,
> >
> >  	skl_write_plane_wm(dsb, plane, crtc_state);
> >
> > -	icl_plane_disable_sel_fetch_arm(dsb, plane);
> > +	icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
> >
> >  	if (plane_has_normalizer(plane))
> >  		intel_de_write_dsb(display, dsb,
> > @@ -1646,7 +1641,7 @@ static void
> > icl_plane_update_sel_fetch_arm(struct
> > intel_dsb *dsb,
> >  		intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> > plane->id),
> >  				   SEL_FETCH_PLANE_CTL_ENABLE);
> >  	else
> > -		icl_plane_disable_sel_fetch_arm(dsb, plane);
> > +		icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
> >  }
> >
> >  static void
> > --
> > 2.25.1

