Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9F8CA101E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 06:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CE610E408;
	Tue,  3 Sep 2024 06:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1KlJl1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C447C10E407
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725345200; x=1756881200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gwwZlvL4fRWMLCiBVnn8zZSl4YrsFlTg3vY5EP8JuVc=;
 b=g1KlJl1BcpsgsqTA28Vr8AteiwYm3wBcsZbWrGlSi02iUd42WmbP1Jdn
 Cr4+OY41hKDUT1OGdGeu4Y6W3kitAGx/XiQlMcI6v8ONM5bpkp4O5b38M
 e6ArqvELJFZSgzhrmrXJTXopaew0OBVQ2qhEYyCMq9eOCX2U31XXZF8LQ
 QOJ9Cwrpnr5rJRaG/tSkoIS8cXBakAuzv6vHC+8SqO5tmLMSikdtFnTJZ
 sLlQ4KDztUCmjAO7ZRwCZhxME352CvReWq5CCyRN+gALajXi2INnrqYvW
 6ofwHqIugp4D1JxBViEFrOElr3m//WZv4ppxAxH/cTHZV44VxeQ2+M49+ A==;
X-CSE-ConnectionGUID: PlznmQYaSlCel792+8iEtw==
X-CSE-MsgGUID: 7SMX14IlRO63u3MFvlivwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23788657"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="23788657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:33:20 -0700
X-CSE-ConnectionGUID: tII80ZNaSy6UIGDn7BDLfQ==
X-CSE-MsgGUID: 7SsVUUrtTVC8B14pJ+k7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="69168053"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 23:33:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 23:33:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 23:33:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 23:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQMwih62GGHZ0xKkYV5NWxu6rvEqwRAT7a9B9y06adHnNvJ1ftvyBaVGqUqrVu0VNH02Wk0S58vE70j25wt9wpHU2bufe8maBh5it0eIvw+qKymscJiYkJTBxd9kRlGY0ibrq7kBIRtLTLNiJMDg8fESE/DBzUV7l7W9Vp3O0/B0MQpFoCt1FQLnRySxCRPC8B/wqDVJG9O6lJX3HHNs5Uo6FVx4odTLTWZtcynkvGapk0fkEIAoUT+GieqKFX7gEYC4LMhXnzNrBHeix+Um3O73wKXlHF4F+a0aWj83aRbc7RHT0lnLfgSzNlVWm9E53fIF2lhNSJkgKbiIuV63zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc0wsPx8o2mR/sbwOMGuumpARssRh19a/Vp+uDYm/18=;
 b=JqONIttxrP7AfFp1kYTPuaC0j5Ge6uguHsFuPXl7Ld14irCO3WDB0+uyw6SHdK3/8VGFHXgRkjeSTb4gsRZUWP+4pjjXi3G4Y1XTRBha+uWUluiBZLj9zJUNjIHo/q+HaHO+D5dYGD9wYveh4x26oaAzmzf1gSr8zxZEU3LXPUnt4exbzjC/d08QcVHx7fRNM8uhymatQ+fJuh4PLm2FFP70+8VkBpyXXLH6jNutrPEz88hGhjv+xwDFN2zutBC+PBqEHUd5E9mQN5NZixgXh2WwwYGVhuFZhpfIYwLXRLoWPjh/O1aMtRA+9HbQEdBLVQrOjeaKjMBUdaxVla1wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.24; Tue, 3 Sep 2024 06:33:17 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 06:33:17 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
Thread-Topic: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
 for i915/Xe Driver
Thread-Index: AQHa/UOnmQzQLBqT0U2TL2rFPYp72rJFmpEAgAAAsPA=
Date: Tue, 3 Sep 2024 06:33:17 +0000
Message-ID: <DM4PR11MB52935A36D63D34BC1879549E9D932@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
 <SJ1PR11MB620431508E06662033257E0481932@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB620431508E06662033257E0481932@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|DS7PR11MB6224:EE_
x-ms-office365-filtering-correlation-id: 5cf254bf-3dca-4140-bf30-08dccbe24beb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Hl3oruVO3/m263jkSrsjDz+L+KgUudSdLN/34EwlUiAA8sCQtzkCnVNe7nIg?=
 =?us-ascii?Q?zFxI0DSKXITZ6UYQKmHyCs1fG3fg9ZWFVN0tR+EEtqTovWyFNMUbL6YA36e0?=
 =?us-ascii?Q?c5LNPbT/HxJHumXzWLPkMFcpuAEuY9IKI63gh/8AEH2mts+aTioWuag28evX?=
 =?us-ascii?Q?TBEzJnmzf1RpjwaX3CScDzuC4rCe96Ms5NVYpH+HItxPg+4WgUFLwQCiMcEh?=
 =?us-ascii?Q?HYcPBgSA6Wie/wMKgduMHsSJeyHd2IDk0fF7Uv7kJdTJx/jabnziDY93Y256?=
 =?us-ascii?Q?OMETrwg9R3qNyOWSy/bAF+GLe/L0xtX5a6xlxOkNuwup9LvBcdGhNjiBuyRv?=
 =?us-ascii?Q?f5KrWQFxis/d3Y3kJg433+lE4VWV0Hsf+ickAITzrfqcsfHu9wn7811CGUqY?=
 =?us-ascii?Q?JqOoUXi8+pNXXX7rOzudUhxkV/1CbSA8UtjAOouUEfCntA1wTzvX3MKXCmkl?=
 =?us-ascii?Q?kf4COVxGhHJUrImHAgdFeDFczTy66LHsFIcZlYdVNTmv2L+7exvP1igoGJ+1?=
 =?us-ascii?Q?rd7nHoGbC73AvgPDBt0qyJxKmW86R/X88p7+BnCkHp1e7szBGB4Px583I9U9?=
 =?us-ascii?Q?jsksJZanWIfWGrv6y399FAY3JbTaFw2Ts4Vno6teXxFqJxKHfd+MdtaPuCr8?=
 =?us-ascii?Q?6EZlpTiq703MFIYfRqg07rMRk9zVToiS+lGQdJb/jFm2hZ5vtfY+nNAf4rzB?=
 =?us-ascii?Q?rSN0F6VNmAlABSYqJ/1+NntoLsqSvkFbKOcZIig91FfQo69JfuLvQga9m7P9?=
 =?us-ascii?Q?4y7DEp6Ch+Npfztsd8nRsHDD17IhR3RjkZxBGf/vDqeMTgow0qiU6/YLYXzh?=
 =?us-ascii?Q?FP7QyxQOjONI3NAmH3fbu9kB8KM2aDQ0C7Q/xbakwpp8Zz2p9JOlpUtFF4kg?=
 =?us-ascii?Q?NhTqwEyp2pZxpEGjHKvGfI/tT6iAxVKhTenO/jiv2M98odbIAuLEqEKK7LCJ?=
 =?us-ascii?Q?e0aAP/6P/vT0Jz/z0L15A6ajOgMDcopaI2xHrkbLZNWO4PiV26dKNwJ/mFQG?=
 =?us-ascii?Q?rmKrsUUR5RH8jrMGhJ6IInyxDlscehcmeX0OsMjWQnAU1CqUXiAOykeFsio2?=
 =?us-ascii?Q?Vp7YO9MMwJHfrhGmuYIqBoBXf8F1Y3sMfidtyU1h8Nyz5M58rcn2caF7wr/8?=
 =?us-ascii?Q?KPeHUz+EL4gOJhU8X4IoekuX2dURXmIKlA+CKpab2hL0GTF/dH6XKkjj3uSZ?=
 =?us-ascii?Q?ZdZ+E6hrnOUqkPkoLFnJJ0SCP/g+LWdhm97Fr6wyI1gMzeQsC4Xqf68Ywbat?=
 =?us-ascii?Q?yj3T8NkP7TnMExszN5fbJLjDX8TUABI6lA+fCIq/CCk1K9CCrGpNVQ1Zd09X?=
 =?us-ascii?Q?4dH1wpPEiaup2+LW1CFApl6g7Ft6oUqBtPyrDmSYBpFsHw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/b/xLxIov5Hk95mmthmiaV7zaTUCSJ9Vi6JqAQZoiXagoCyztTufXy6KQ2yv?=
 =?us-ascii?Q?sTUJ1vMDf+FjptUzIia1rXs2sfhs6/gs/cobpvmohW8GcBTmx4TDHev/4MLI?=
 =?us-ascii?Q?g/tMXqnJPqqBs0T0QNVKVTOtF/UimObx6QNvsIJtpZ7D86ScY5Ja12kW0rL1?=
 =?us-ascii?Q?6fRhkoEQk8n3KERFOaCHnmkzFkDgc00fyVJpcYsU2ywQ+V5ioCPNxQdQAb7X?=
 =?us-ascii?Q?74YblU94cCWjHY9oCl4pPbzmI4Osmzi34L6aKyGtyYhms+v6+uAeqWlZ56Bw?=
 =?us-ascii?Q?P3BFoMsgQOZjaKCG5mW3HE8UhgbnlZrSnHMWhDJFC37z2tg2uYxoD8LRhJrd?=
 =?us-ascii?Q?z5mZ/urgQxuZaOVi/NRSVhbCX0J7Xf1d8eRInWzQI72izRULG5n+ikby7Sor?=
 =?us-ascii?Q?JxyYkXdFY31F5mehptHy1uSakCxALeuj0LPluq+XzyDP9BioqxtCWSuuL22K?=
 =?us-ascii?Q?imEJHViOnOkWVacI1ctgMYh98bGibCdE8AhJO+3+YHIlTQh0ywm6PWco3kkR?=
 =?us-ascii?Q?yWVtB7IJtv+5MA17zEWczzFTyLemonRkoAM5S74Zd9DfP5EIjbjj37Sl/VRc?=
 =?us-ascii?Q?xYkyDa1O5vWhq9eQ1dgYVl1WcUubWm1LzxNto79HWxYrj0XrAT9ain7MzuGI?=
 =?us-ascii?Q?D0d44h5txWtvN+G5+mD+Q3GjGG2bmphWnylv/XWPUFpiI8OuXVkO9iIqBOrL?=
 =?us-ascii?Q?MNN01gohnWvG6wpO6D6zgCkcmcOaVT/mcM0HO4+hQZ07o21nPD5MyY/P7pOz?=
 =?us-ascii?Q?Q8cxV0RzH5zv3s0zv8CeYK5gjZJH9lBj2dkG5AqRJ+aTEZQEnkUDJkd7Zq1R?=
 =?us-ascii?Q?lQdVti3u8pxyX4MtXDnI+zpLWJ+iB+qvusNI7SPOwpI9r6xevjgTh9pm7ZRD?=
 =?us-ascii?Q?o9h5VImzjsdCakZjMEzIfS3Gvcf1XkqgRtRbPSBQOWnMxTEFB7seHFvXnp37?=
 =?us-ascii?Q?uSFtA65KS1tcEeg3fwVhMRVDBh2h91CNOLVbdqEvRtCnYZUR6iJgF0M5aLMo?=
 =?us-ascii?Q?eqHx8B6TE/0B/N0od7c6C8j3qVJq1UvP0lF3HCPKeUptVcVwWukAsmSz7gwq?=
 =?us-ascii?Q?fL+HWPN8sRYwNLe58zcC5xds3IJv902rfZ15FPisor+kXQ7D2E+kp7FcaHS4?=
 =?us-ascii?Q?B9dgLS0b0vpAbMsn5y70OIOBkOrVSzqBibqHpbE70Pj5UGlZR9joEnreJeg3?=
 =?us-ascii?Q?S5nmXvPHaGRkaaUK7BW5MjyFoxMVPkNY3YD9qwOpgQFBEOfgPcKg+UaS1qHd?=
 =?us-ascii?Q?U0ePZ1/1xxlde6Euegkn67NRhmCKJcriOwUWxAL9F2AtMkMGHDC7cCG92GgD?=
 =?us-ascii?Q?ER25lgOZOUDBV+EierTQQXhZQGDWnYmSlTaQPP68YpUYeCtWipKdJ88/L1q5?=
 =?us-ascii?Q?CInoqn+/ba4SE4HsRTIO2BA9tu5M++S8dUhCJPMx5EI+sGzJTrG+X4fzZzuo?=
 =?us-ascii?Q?tMZl8Rzl/IevVWBxwCco/jxSFhtSzz04YvZ7bIz8mjeHyKelZSfjX+rEGCO2?=
 =?us-ascii?Q?BJXaOieiFZrFQHGWMfQ6KWttz9W7hsjGH/eYmCjmSJkW1H0Ss6XU66efRMGG?=
 =?us-ascii?Q?WTtZ4wKUdOmUZD7XqoFmlK2ZzTaS4NJJKYOeUo9n18B0bnSJOf8IAGGTply/?=
 =?us-ascii?Q?fFOJvl5BzOdJm+7OYQI73wGYpvEqD+sPEYTqrXE9SMbm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf254bf-3dca-4140-bf30-08dccbe24beb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 06:33:17.6251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSa1bE/hav0sgmMqOi1qOwxLxIjF84vb9rlhs3GEgm8aNpxrYi1pMxpNI0UwuJ1Ep3TetMWzzBZHZxofp54E94GeQNFGDKrTJVAhPwjv3Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Tuesday, September 3, 2024 11:59 AM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: RE: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Module=
s
> for i915/Xe Driver
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Bommu Krishnaiah
> > Sent: Monday, September 2, 2024 7:41 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kamil Konieczny
> > <kamil.konieczny@linux.intel.com>; Ceraolo Spurio, Daniele
> > <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>
> > Subject: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
> > for i915/Xe Driver
> >
> > This update addresses the unload/reload sequence of MEI modules in
> > relation to the i915/Xe graphics driver. On platforms where the MEI
> > hardware is integrated with the graphics device (e.g., DG2/BMG), the
> > MEI modules depend on the i915/Xe driver. Conversely, on newer
> > platforms like CLS, where the MEI hardware is separate, this dependency=
 does
> not exist.
> >
> > The changes introduced ensure that MEI modules are unloaded and
> > reloaded in the correct order based on platform-specific dependencies.
> > This is achieved by adding a MODULE_SOFTDEP directive to the i915 and
> > Xe module code.
> >
> > These changes enhance the robustness of MEI module handling across
> > different hardware platforms, ensuring that the i915/Xe driver can be
> > cleanly unloaded and reloaded without issues.
> >
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_module.c | 2 ++
> >  drivers/gpu/drm/xe/xe_module.c     | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_module.c
> > b/drivers/gpu/drm/i915/i915_module.c
> > index 65acd7bf75d0..2ad079ad35db 100644
> > --- a/drivers/gpu/drm/i915/i915_module.c
> > +++ b/drivers/gpu/drm/i915/i915_module.c
> > @@ -75,6 +75,8 @@ static const struct {  };  static int init_progress;
> >
> > +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> > +
> >  static int __init i915_init(void)
> >  {
> >  	int err, i;
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c index bfc3deebdaa2..5633ea1841b7
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
> >  	init_funcs[i].exit();
> >  }
> >
> > +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
>=20
> Ok, I read it again, its " MEI modules depend on the i915/Xe driver ", sh=
ould it be
> reverse? I got confused.

Yes, it should be reversed, thank you for pointing out, for more info you c=
an see IGT patch: https://patchwork.freedesktop.org/series/137343/

Regards,
Krishna.

>=20
> > +
> >  static int __init xe_init(void)
> >  {
> >  	int err, i;
> > --
> > 2.25.1

