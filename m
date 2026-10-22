Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC9606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6ehBi1v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B32210E3A7;
	Thu, 22 Oct 2026 02:40:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66E210E242;
 Thu, 22 Oct 2026 02:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792636836; x=1824172836;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nrSkEF6C/rh8XtVZJ/cMTYc0SzReOQEdKY1wRL9j+j4=;
 b=c6ehBi1vClkKZ6UpgQhGKR3/c8ua2jAZq3q6g+qlO3dZFJq2fv78aEo/
 Qdy2dhoA650u/0n5YV06iwKsl5/LjPZHaT8Yv8iS5+TBomFY9OUujsxlP
 auS/4G3+FnQtP6AajlL/D29eFy3LOeRai7g/c37PMeIkSGTCsPg7p0931
 /WpUUZjoa+Gb2UtSsBEdHEeh4lnmmMSyK5Kj4rDFJCXmJ8xRJe0VGugRA
 Wiu/dL1+gh+Du8sq09Gi8OGl0mxQFkDeAy92S7uf8/5GVSnfDyNOPqLDg
 ijvZYn59t9QT+VZwxBDK8pXHl1WomgzyNjoPBieV2r3unZsd4Rs0JaOcp g==;
X-CSE-ConnectionGUID: pqx1UQ/PQaaZEGMUMq/Rdw==
X-CSE-MsgGUID: vux21tnzSTO6ABSX3T+0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1262313"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1262313"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:40:35 -0700
X-CSE-ConnectionGUID: +M3hHFqGRlW/vaj1ZMiikA==
X-CSE-MsgGUID: EQsve3ibRZK6j6sdh2/5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5054488"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:40:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:40:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 19:40:34 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZ6pFYHmGbx0YAZTL2Wfv7EK1RZAn5PTk+mkTEYYxUBAX7P1GJafrGdjHh3FCgdt2dZyUZFXc6wwFYM4172pcEr+blqx4EouLFcvzTA6EmxE7uPm4u7PgUckqJp2wv+SfEgaUIfhYjv+lkRvLhxuTuQShH0Y+Dm6+nz9O4WPumOxeDtB/GNEqfX2HsBnAAYvGCNkLkjX7FX+0dkeD7rjRYO1JR1oBocCsgOGmDJ4h7IMQdIpHi0GOoTGYzN2Kb9B7W7zItSmGTRsRgSqx9EbF6Ap7f9OptZoLwWvk8GEoH1EW94Gm4ELJMzQSwWrh66wtvRIJ7T+dtvpXE2xLZL23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMTgT4kEw2hSJlCVoitzh3A8hUoTi5/w6FAgYCpswHQ=;
 b=Gtc/M6afGEl3ZDbZ4Rp0o3jS5vtQy6qcBkTVUjT38/8n3vKN1CXul/pXRcPOqC3fvIzFGe7vvFyI5+VPRaOaODH8pWlB2ZYYKiyFv9e+ttMZN25P6dMSZ8hgG0FfLpdhGXna0zlOatdmJQ95YZxuYilwDrv5klrjWh2I9DUVlqshYuDMqSG+cGS/j9OygVoE+UhjgGsmDACavf4oKxXxhdpWk8Fd5KdiH80RBx+W9kGQTOtgB6ztsGDVTvLR7GQg1N2HuRG0O+sCU401ZhDHLph0+q7NGt2e4W6pVcJ6mA3f9FXLiaqOt/G0OrliVfLKvkCF+73V2JXJZ7eB6AmCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY8PR11MB6963.namprd11.prod.outlook.com
 (2603:10b6:930:58::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 02:40:31 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Thu, 22 Oct 2026
 02:40:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 03/11] drm/i915/display_wa: Add support for
 Wa_14014191401
Thread-Topic: [PATCH v6 03/11] drm/i915/display_wa: Add support for
 Wa_14014191401
Thread-Index: AQHdYSvMcvPT88n9Ok6x2/PGmS/oNrcIO0kAgACfJuA=
Date: Thu, 22 Oct 2026 02:40:30 +0000
Message-ID: <DS4PPFE901A304F45A4934739C52B7E4EA1E3652@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-4-suraj.kandpal@intel.com>
 <BYAPR11MB3783FC1B96A694B9A629492CB2662@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3783FC1B96A694B9A629492CB2662@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY8PR11MB6963:EE_
x-ms-office365-filtering-correlation-id: f1406298-1d2d-4471-c00b-08df2fe5d699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|261021123027099003|38070700021|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|22082099003|18002099003|261021121427099003;
x-microsoft-antispam-message-info: mzpuxZeKScSJ4LUwToiu7epNV+VVaGkNx79CcAciunme0ksAgOfnqll5nCMAGX8n9TP7OMSHf6Z+2JqFHXRyPNywsxkKsAVTnclQeRLQSktttgxDLcfxXvqO2bCB8XsQSgM8ErsDcKm1LNyjEP8QxN0D91K5SK5a0tPUSRd/DT2sbG5zKDMZUiJ6uxb/MGoxNcoYzj2TEWOVsj0tkeyPmabV3uZOiFlye7Xs/UcXFPkiwMKvqkui2X30FfIpmMlJjiEJsRbLV/0ulz7TM234iHGNrAhccpsaLWZsHatIfFOFV8oFzaBUJbTCVtW01mwvD735j5Bcec14Lorht1PW7CUNE1mTqIP614x8sPIG0Dn6DM0TG+HK9SKDsbrZShdmZkNdwFrOAdrcwI8HrDLVWXyqPirjOFIglBdRVJNN3MgmVsboLf4bzkH8bjgajVFcUaLyc9aelztSLZXfdyE5L18y1wOvvy6ebK6Z/dsXSqSbkW1f2KZqCIff+oFrlwBpfLV7A95CD89heq21/Na5twD44q9YMv2/C0x7nPUBqWOHw+Txzv6TxiAhx0UjHFjm4AABT94+TZ0Pe33qCwZ1hJBkfxWcSPGTMuD7KkhzasNgXOsuglttBTfXXcBq8XKrW8j7rj9soQLyeANYkGbwrxmGyLmkyZznn7TSiJJ55fVrnxBAQjOH4bqbpyYb9/L5CDLxVSNFwvvts1eEv7xMYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(261021123027099003)(38070700021)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(22082099003)(18002099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0KTpD7e7ai3yS7PfsB1YaLgAkrTm1SBzZy3sb+wGCL1OWhoUy+EJhNNzqV+M?=
 =?us-ascii?Q?Uk04UNu6nq6DYTdyYrVho4vMQdpWvnf7Vw3Pr0eQaaWOOCPgIRu0fztY6Rp5?=
 =?us-ascii?Q?0msdBRyBQmhTJW/zitjW/o2F3zOTW3ss3ZLkbs4zrtbHsQooWXyHf7sZUijh?=
 =?us-ascii?Q?iBeZOqEXACks56AclkBifM5sCFsWWXAOoogf1aj0DbEs1YJNjvdliCDmwddv?=
 =?us-ascii?Q?+hURB8L0zHEPFmkW6War42JIO4qdk6sIlJeLsCoWPw5WdvY709avZV13abej?=
 =?us-ascii?Q?HQRq/snEMpcZGg1VbKXIslbxf9/1n+Jf/YJ/o0GGoVNo5A89sAKfULqBBLU+?=
 =?us-ascii?Q?td/w2TOi5a620+L6tx8nli0w74lyavc9rQ9q/V9cUkFw+wyyrIhh+GUgZ7rn?=
 =?us-ascii?Q?oAnQr7MMWIfmV3z1Xj3KMus70Ulh3ESVkL1++tz7QUAiDeJXKgJzCQx6H1ma?=
 =?us-ascii?Q?aCBBJqRzhOwid8KdQyxZIeD1uc4qoA7yQ0/lIVVCScOXSGLkMtp0hZgYWQhq?=
 =?us-ascii?Q?mb2TdQ+2B7BXDtDbr+BJWJVO89yjz4VFAM4aS9WPVnyZHvjGNCsyiPimcQaS?=
 =?us-ascii?Q?sZv2IcLzpQ5dxDmP93xONpwQizuXH5156hOyUp7GGdjFP0CxAXa8MBlq+B+i?=
 =?us-ascii?Q?XIQN8zLZvaFUZktHv9dGmWart66smyxTckHUpZN50rb+eEt4/CwYCJbiiAPu?=
 =?us-ascii?Q?TAmI0NEG72MKFvcDw120p1rxIxeqrdySs9pyHhCBqYNkNIAPnKpATYYZazxa?=
 =?us-ascii?Q?Rjk1/7Ed8opvS80t4omvEJi484gXy9DvKAFQmtaUdwCvErofzbf4JN3/I9gT?=
 =?us-ascii?Q?s1lHmsAZtQOmzZZpaeNvgqwkN/r7lrbf8XU8nutam+FCYZi4FWh8AYgi8Bv6?=
 =?us-ascii?Q?sYRh6eVQKk8Yw6ItgjcxKcMawjkyJJfcfHXZN0fSgxlAOralh7UtwYkPjQ+X?=
 =?us-ascii?Q?sflJCQ8BYPZzKT/W95Pcufvax2ULKRRBkmtPIX+ZvT5A0n7XXO3MwhwRGX1g?=
 =?us-ascii?Q?oW9htv0nGGbm99vnW7I6o+BebK3AgBSov5XJml4N0WHQvyodHxPkczESIEu1?=
 =?us-ascii?Q?Ax0buyw2dbjcjYzzhi3GwCD5zA+HWllFSMJyVpiP8W5NkoW6vNHTJ9v1mF51?=
 =?us-ascii?Q?3XcZ956Ib6pJEiT8puo9yqxaqu2ZhvOSaUIKczeOsSJxZfElLP9YzjJFi5kW?=
 =?us-ascii?Q?gXBsJ8hK1kIj4H6ca0SC1qf8/0DpqFtpUGRNfJWy6oapc09LP1nyDTm//hS5?=
 =?us-ascii?Q?X8qa8MXj2IdGTggHNAFHRK3kXsXIyrtyMgNy+0lSy/G0B91YayCLY6TpYHdD?=
 =?us-ascii?Q?fOY+XvDxdRkY1EeefrVCP6kwCf0g3T0BcroESn+fXl4HaX0Hd44ENSM/svoj?=
 =?us-ascii?Q?D/hhT4brYX+ngDuqVSAnkbN0JrbmJn/t9XUdFlMEODU2CKE73hBUoQbCeZ0W?=
 =?us-ascii?Q?MfRO9oVvKqe83X085p5jt6riOW6UMNi/iN1U5Lnu2WbMu3CNgigDM3bVy9TA?=
 =?us-ascii?Q?Pug+/Sav8p0qbx0y1fZ5VGv5lF1sP7Pqi9jrTWpAIrv0yEly9LkLHcNrpMKu?=
 =?us-ascii?Q?hHGNVY+wVYhfBo0Y8aUTZ/owpxRqphYFSFl/GI+zu8hXcTRLzk0eSFf+5aSp?=
 =?us-ascii?Q?yGP5fDvv1qnKAvnHQx5kn2X50gMUxYN1i4pPNh0yIOzaXb8YGrQ0IUn5oXWR?=
 =?us-ascii?Q?4Mp2NdcsYzyPpmYFlQGG/+sPQ420TVOhZTZ+LCP2N7GaPQc0TEqFulHULdja?=
 =?us-ascii?Q?DqX6MK6rfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: x9QDZhMWGuJlZyxlqlCaO/b0Niset39ziMfU28gPQTH4T25A4mrKN9L2Crey9cU1dyrf387YoEeamHwmSWCGh3iUFvZgBtL/b15TkPjMZjBDWJtEVpKLr7sAaOoTOFBknHdu8PafE2wczNUBXn0FLxiPZrU/taVUVaQcj2ve7IKKtNVtKkJAN++EtCms7h1+lpqp6GMVcZtV68LJq42kTI/8dGbUO6QdrWT1qw+sv0aeHxS0semkibUGaINnsyA5fmaiux6Py0lEp7/vVIFsiWrX0KX4jDHJwAFFSZrIJ/wjkIHrKSIhp1fazpfqouDcmeed8y+X2G58beUD3TJDog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1406298-1d2d-4471-c00b-08df2fe5d699
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 02:40:30.3205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2JHVciV7LVqsndEmp3zEvtSA1qdeQwsQnWoK1gf2Kc3IZx/bUYjrPcAkrUl8LkFw6uBDfHaPkXYd6dlWPg5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

> I think the patch order may need to be adjusted: swap this patch with pat=
ch 2
> and move the current patch 2 to position 3.

The patch ordering cannot be changed because  the function in which=20
if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
was called was introduced in patch 2, hence the patch 2 needs to comes firs=
t

Regards,
Suraj Kandpal

>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 21 October 2026 12:44
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>;
> > Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v6 03/11] drm/i915/display_wa: Add support for
> > Wa_14014191401
> >
> > The DG2 transcoder timing generator DDA only supports a Link M/N ratio
> > of up to 4. The Link M/N ratio limit uses a bare platform check for it.
> >
> > Add Wa_14014191401 for DG2 and use it for the limit instead.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
> > drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
> >  drivers/gpu/drm/i915/display/intel_dp.c         | 3 ++-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > index 2e3ff4861ef4..91395076e903 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > @@ -94,6 +94,8 @@ bool __intel_display_wa(struct intel_display
> > *display, enum intel_display_wa wa,
> >  			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
> >  	case INTEL_DISPLAY_WA_14014143976:
> >  		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
> > +	case INTEL_DISPLAY_WA_14014191401:
> > +		return display->platform.dg2;
> >  	case INTEL_DISPLAY_WA_14016740474:
> >  		return IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0,
> STEP_C0);
> >  	case INTEL_DISPLAY_WA_14020863754:
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > index b707147a7587..f41e58d1d6e7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > @@ -31,6 +31,7 @@ enum intel_display_wa {
> >  	INTEL_DISPLAY_WA_14011508470,
> >  	INTEL_DISPLAY_WA_14011765242,
> >  	INTEL_DISPLAY_WA_14014143976,
> > +	INTEL_DISPLAY_WA_14014191401,
> >  	INTEL_DISPLAY_WA_14016740474,
> >  	INTEL_DISPLAY_WA_14020863754,
> >  	INTEL_DISPLAY_WA_14025769978,
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 7ceb7c02b597..f3a79ae49b18 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -70,6 +70,7 @@
> >  #include "intel_display_regs.h"
> >  #include "intel_display_rpm.h"
> >  #include "intel_display_types.h"
> > +#include "intel_display_wa.h"
> >  #include "intel_dp.h"
> >  #include "intel_dp_aux.h"
> >  #include "intel_dp_hdcp.h"
> > @@ -1271,7 +1272,7 @@ bool intel_dp_has_dsc(const struct
> > intel_connector
> > *connector)  static int  intel_dp_get_max_m_n_ratio(struct
> > intel_display
> > *display)  {
> > -	if (display->platform.dg2)
> > +	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
>=20
> With above suggested change is done,
> LGTM
> Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>=20
> >  		return 4;
> >
> >  	return 10;
> > --
> > 2.34.1

