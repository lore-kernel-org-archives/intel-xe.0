Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63729C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 06:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2622D10EADF;
	Fri,  7 Mar 2025 06:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGN00kSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B04E10EADF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 06:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741327438; x=1772863438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wv9A+dmRcbgWADHY7j9JjDeoE2z4TZx1Tn6PR0iHoIw=;
 b=HGN00kSlAuL6mrdG36U4puZtc0cDtrgkn1T/5C6pjG7VG8tG/plvN4hp
 0fKSMpZquQrXxYnMVWQPC0jB7KfrbuuUP52KXrAk+1EwxXCxnWN1cJunO
 1U4fm7pivtznnY6pyOk0ns7eaC/CpHBEmshKB6rju+47XCSLXwEXU6Cvv
 NxZcYJliJ7buNyPouZGyp18lUiz828E4HjFFd8gCvm99/U44XzcWmTNp1
 /IxruiYY14sr//d4cWk3OyuNcnQLZaB2gbNSmUXU1IFwPt74RjCarVxSJ
 MnJ/iO331uh1N+z18aUzB8fB7eu0DEk8vcrgofdkEM/FqEIv2oavnBGAL Q==;
X-CSE-ConnectionGUID: iFTWJCabT5qHc6R/uXFP8Q==
X-CSE-MsgGUID: uVHgdhJSTXaosgwrJv8e1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53356088"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="53356088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 22:03:58 -0800
X-CSE-ConnectionGUID: lRegTBYJTWakdqOshYlcbQ==
X-CSE-MsgGUID: TC0ColkVSqeG0+DNNXRNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="142470570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 22:03:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 22:03:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 22:03:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 22:03:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWOcV+46lwybh0BOEcDJCnXvr+P95ccUx9H7K/fL+hK6t9IVCZHN+CvUS1nzhKbxVuzDR+Igs1BbygxLB+RouRWPJQgdae5R4Vo9ROXNRETqD3R+GKiUd3MRy+D7DGPDBNtreoSlzyqxZLifKwVgoacNgzdQs71ndY1ca7lHqqclgi4P9OeiLzrTS6L9bZZl5od5nxDVkIaYPbnApqYMNidyeE5AoxdRvelW9b/Y7w+br3jqVCF2rScKT7hWuYHO2tr0vQB5C4/rloFTTQXzVrZuUwzfhE58+oKsvIt01zsv3C/jlD8FUbEJDB6mlVQumUpK+oX4YxKoq5W0HBHNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFlXRl8Tf4HmLMeQch/yKOMMa55BZ2UQbvqumrRq8YE=;
 b=GOF1lPKuLfL9KF+tNYo26XyvKK6JKgzc+b47T1kT+hyG6sgM/j7YRqvDjAU+aAyvbdtrtOKMHu6dxwy7DPlyuiG7OvV4D8BvHlGZO0bVnKa93eE7oz0gfHGQ9nUn14iDdj9BOtd+n0l3eDaUysmljsGFQ0AZfqbRdIy2RuxeGdNMhrRfciix9NodA1y7X+l8V2ZcJ9ZXqlnrRZ/dVoeVBbX/bav0HML3lk5gpICrCQ5rBqpsXOctuPUjEuo4Arno2l+no/JrGUW5zzpCHUd/Tbg4P7zuIyMFEN7xTTPyLoWTzxE7rY0rESWNYP2Uek4QAOWyAKFCitYXM8GslmwSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 06:03:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 06:03:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Topic: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Index: AQHbjphvr1CXU+LOHUiIH0ry4VJdhrNnL9OAgAAABHA=
Date: Fri, 7 Mar 2025 06:03:53 +0000
Message-ID: <SJ1PR11MB620426A08AFDAA4DC2DCAA0C81D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306131211.975503-1-tejas.upadhyay@intel.com>
 <Z8qL9RW3DCzkS0q9@lstrano-desk.jf.intel.com>
In-Reply-To: <Z8qL9RW3DCzkS0q9@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 57c6e01b-6fb7-414a-032b-08dd5d3dd71b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o6FxunTFrAciCCML+xj8IAhHIT9pmKBXBPFOukFBTtnHHaz+ZiMivJygJM0D?=
 =?us-ascii?Q?FXt/8/0H4HGCj/R5qlsluQ6f3xOpH9hH5Q4xnlT4XBeWshoCRPfv86RcBONj?=
 =?us-ascii?Q?IsGpZ+xl4yx+91+8vFzltrYpZH/TsHYHebQK3LIekpn24pQl+qgrztof2YRm?=
 =?us-ascii?Q?/SQeLBLcGxPp43AfSfYYR9dVuJwZf5z/TdTpZsyCcbKVx0ceS2XFwA1O16aZ?=
 =?us-ascii?Q?TZg92Z+hAIam7/RTEO9rTQk50iPGMY/kebIUD1cRoGorV2Zl4okIt7q8IQwQ?=
 =?us-ascii?Q?E2X+kztxk89CezImlX7obyomZFAm7lID6CX2kj7PEDijsfPKMMrB5A4qnqN4?=
 =?us-ascii?Q?eSTpGvxjbpxj2RvSYrjCs3+JkDzofMN7i8guRpSIv8Zu+ZIscb8PnV+p4SUj?=
 =?us-ascii?Q?MOhEpuQH+BAe2MAseyf5kUdC0DztBbONdxs7TINSlk69kzAEftfYx0EyCcaw?=
 =?us-ascii?Q?6stTl//HGQV1M7rSL2thvg3ygsxMTPCnzsICbih7y8Epe7tzTOswJhE8NzFT?=
 =?us-ascii?Q?0NlOyH7jgCWqHcxlf/p0MhJdI+ackww/x1Re+E7jYTlcwcwz285r4jsHTemC?=
 =?us-ascii?Q?xjj6MzTaA3xOgS8CZHVEIdRm4VX2Jks2t/m+vI3to7geQWizFgLOMaX/Y0U+?=
 =?us-ascii?Q?k941qLSFkKulXIfL9Zq0RBy2cvGbYW6VrsxDy4zUoyiPRs2Wwq2+/2oofcQi?=
 =?us-ascii?Q?7gyW52qss0z/J+ZK6ZFruEh4WytFhSKuMoT5LF7DQRrtLhc+vXkBwcb4gX6x?=
 =?us-ascii?Q?+ccPxLMTXc0z0jVy2W/xamLGV56/yyxzVm7YcYTiSREBjjrWbhtMRtmKiYFW?=
 =?us-ascii?Q?Z0lqLz9NtvFuvFL+RjEhhRifuaTWfJc0nfev4Sm/JtRCsIWUWfbleegfXHTq?=
 =?us-ascii?Q?+oJSmf+MbfyAf4412H7wpiGB5ydQg/S8DAgH7lEAm7PKSmVzhMSM5XHgehbb?=
 =?us-ascii?Q?zwl+iG7+/f4dmenjXg689cx6jzUwYI8IsM/WpYXJTVfpV2yaZzUlbW5/1ckd?=
 =?us-ascii?Q?FM4e1pe2lyiFp+FmVLGZQ9YZt3J6oEH7zipfNrHTg43u89vux3KloQSb7A5B?=
 =?us-ascii?Q?GQPYAq5P0eFuw7FC/KN9nWc8YA2VuZexq16u9ZsPR/4R0/eGMqyI9o8NwTqp?=
 =?us-ascii?Q?NFk6cWkDZz670xeXAfEUvPmjg3rkITcQYynZLnS9QpkjRYp60aC3G7ol2XY1?=
 =?us-ascii?Q?+rS5oa4ueb+gKLEgk7OYt3tIpmJz8vtzQoKPVjJCZXcKYXPp+BX1dCQwm+zq?=
 =?us-ascii?Q?Hr5AKZ+tsH6PHc3AcP+ZEICyj1R0iTAkToV45pi6J9Ajb/gg5JzzgK8yYpMn?=
 =?us-ascii?Q?B9KNFuXymOL1vOj15zqdNDTCDLhkj2jxa5KGB0IrAqdfv/xYJpY/7V48ZoeJ?=
 =?us-ascii?Q?ICYR/vLmXNvOvNFRSP6R2+4sOxI6t0NFCVF/txle+p5EMajJmg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YX4XoarRNPaeV2wHfss1V7McGvf1RZkYyaGIno+WCzeRHVcrCVeWLvb5+RnZ?=
 =?us-ascii?Q?QXicWw1hPRXmgC2BojRASO1KExWe6ayjpwdcVzfdHYFQyQrq2EhFBXYs36J0?=
 =?us-ascii?Q?C6dD9D7sEx/RTSww2/jVHd/vKqSccnxdJptcXf61tLwznaFiHHtQ/Dhdmxff?=
 =?us-ascii?Q?1UqZqybDcqatMSz8ySN25g3fUX34cnPm+wDfrIkugvHuc6MM9V24ZtsLPqbL?=
 =?us-ascii?Q?FbzdTQR/RBe0LsUtJ2lLJbFzL0u8MeiZfLW5KPZH/FC35vHkpQclioZmczfc?=
 =?us-ascii?Q?d6qEyxr3DLUAKq0Nv9shTqBjWPIWCO/vg8OK998C8wvCnV64pBrbFQbQ3nDo?=
 =?us-ascii?Q?Z3pgK9tNYKMM0CRpMVDLO9fT8E7b0uiZmpNtZjGBke2dYEcib2DCDkWb4UXi?=
 =?us-ascii?Q?0rqSmoFNOpfzZdo5ZLdGFBLS45f/fiiKNYyC/mo+2WU5XJduxHyBbdnf/tlE?=
 =?us-ascii?Q?6lojwkma9noi1mNTAeNQdKJCuIKfNrpo7cr6YYAh3QqglNSoPi1s4JrAv/kJ?=
 =?us-ascii?Q?aZ8/rsyMV2nrVErlaysCcxACjZqp4wnjq2jz1Hx9UKblGk8jeqTXaHcP+S2M?=
 =?us-ascii?Q?+Yglhwo9tyd72N2Mh/lJX25n+lcMvXNz620l7i5ikiEBA+pUghMiIi4YV4vt?=
 =?us-ascii?Q?hnBQD1IIuMNVINjUERQSoRpIavF7TOm1r0c+o97GPC9nrva7UFeKTow6Ulpw?=
 =?us-ascii?Q?OronGkmaMCcNTaI24wTh8TjSCn3X7rfJ+CL+4o+HeqLHAolQLey2l4bKxBQo?=
 =?us-ascii?Q?rBXeRlnLTJEiznlFQcq5Qh5AllMsVq1kKz9ALiqJFPN9YxtxLyWKXvH/UxY9?=
 =?us-ascii?Q?wCtFjROa+nyPbw/BypI1sxG4IGILMnncqR8RtA5k4l+FtIyzGOH0NtR2CIMt?=
 =?us-ascii?Q?07ew73AuyHmf1iKro5Yq24yXcE/JTdqiFNJTc03n5hZt93SS71oMBHBn+uR0?=
 =?us-ascii?Q?12IhIlCvsA2mpxuQv68bcF9rjry5MaenHHlXYdviSojGhBcpKT+Wvgq1fi4H?=
 =?us-ascii?Q?ysksd25ebHMhxmI4cRnRntblBHU2BkxEfoZNtUo4UqxqAdXkZWcBbl6amU7e?=
 =?us-ascii?Q?Bb2ON0SHLdo0joNMsFScr9akpD4RicfORvSEmcpGIbuIRUqWW0FtZVB31zDh?=
 =?us-ascii?Q?tsKuPs127taN+L5I1rQiu9gqr3+7C7cq82ELDkiPv/eAt8m/LGTbt7D6NDhy?=
 =?us-ascii?Q?VyQSue9ytdBCbUwrxtmcxFk/ReQqSSzZkBLAHyB1D3lS3OGrSDGIrBBCq1ov?=
 =?us-ascii?Q?zkLCFM81XxQe44PDpUgV81Q0v2AVywBiNF/S8f7UhZDooHZNhND/CpXWrflO?=
 =?us-ascii?Q?B8IeaJDg0U5vyNs6QtSSdWaCbud1Ok8Gehidu13ty0qi6tvmkF0Ng0kxtH6r?=
 =?us-ascii?Q?qEhGZuUL+CmBpCwFasvNORUYgq9mIOyMOxma4cf+w/D8bt+/0Zwr4N73T9vA?=
 =?us-ascii?Q?WbMUWjlsj7TY0VqN2DumUBd7u9LuAzVNFI2tiC3OyBPsZ6EXJO4jbgW4iJfU?=
 =?us-ascii?Q?Dal0b9mFNottB13Kotgb1TN27AX3Ovv5SeuqQRvxa60Nbo2lxfpRhW9OkywU?=
 =?us-ascii?Q?qksxJwMW6sWoqyDCpbaf0G7L3pw2/0pB85KJRgGV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c6e01b-6fb7-414a-032b-08dd5d3dd71b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 06:03:53.9175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0cqbuKVpGlc3BDgxNoejiKgsTDsKXdJiV0Ej6DdfULor0kBQB23y+fR7LntVZDBU38a9W6bq2LGWqqW16w3HrgySYAHKcmHfGjiKgwxDCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, March 7, 2025 11:32 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
>=20
> On Thu, Mar 06, 2025 at 06:42:11PM +0530, Tejas Upadhyay wrote:
> > A GT resets can be occurring in parallel while cancelling work in
> > async call  which can requeue these workers.
> > to avoid that, lets first release guc ids and then cancel work so they
> > don't requeued.
> >
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> > Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing
> > scheduler")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Were you able to verify this fixes [1]?

It is not reproduced with or without fix, Ran 1000s iterations of whole tes=
tsuit on BMG as well as on LNL manually through scripting. May be CI can te=
st it better.

Tejas
>=20
> Regardless pretty sure this change is correct and required:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2561-
> 3de9463a46e57221df6a0b5f2f5b7f33207d76f7/re-lnl-
> 4/igt@xe_exec_reset@cm-gt-reset.html
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index b95934055f72..31bc2022bfc2 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1254,11 +1254,11 @@ static void
> __guc_exec_queue_fini_async(struct work_struct *w)
> >  	xe_pm_runtime_get(guc_to_xe(guc));
> >  	trace_xe_exec_queue_destroy(q);
> >
> > +	release_guc_id(guc, q);
> >  	if (xe_exec_queue_is_lr(q))
> >  		cancel_work_sync(&ge->lr_tdr);
> >  	/* Confirm no work left behind accessing device structures */
> >  	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > -	release_guc_id(guc, q);
> >  	xe_sched_entity_fini(&ge->entity);
> >  	xe_sched_fini(&ge->sched);
> >
> > --
> > 2.34.1
> >
