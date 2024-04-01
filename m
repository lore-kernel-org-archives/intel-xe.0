Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ED8CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED6F10F27C;
	Mon,  1 Apr 2024 16:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7FaJ0yQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EB610F27D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987320; x=1743523320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C2Mp6V6ap/DxY70jPM5e6f4XsY9NFp7KmbTQPNn7FXk=;
 b=m7FaJ0yQldeRkdWA4csI+lgT8xwykTiEXccWcWKPXCK0wfzZL9/NCWsr
 AVgeONRhdfW6JOKuTqgpL8V/2BM2see1eCyXhX/B30WZZ5rM2wcuRpC4r
 RGdawVwjtQdHKEfSKnYKUJRgaAW1yJbSz7jJHR2HDErB9Ydd69XmuAlqw
 da3h2G0r+dibSajrD0XC/Dcmx0sC9QQp9lh8/j5cOhOvnv2PJkS+9HRM0
 btf6Peih0pN4dn89a4z6AN8vwMQ3fdp9D/3m0rxjcDtc+AIWmv0VO3RUU
 1qj3NCTUZuXEBOC0MbavJUIHvIMYv0/lLrCZiYahi+3DvpuDEZqk78keD w==;
X-CSE-ConnectionGUID: x1av/GX6QWe43UndFzN5HQ==
X-CSE-MsgGUID: xatKPhsJS2K4c9fwEf4Dkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7235189"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7235189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17839765"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:01:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:01:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:01:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:01:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdB1LMcRPmRgk3nt5LaL++qsUxtVHb9RAR5ry6Q3yMycOT2wJy2b0dyrR5H7BkHCowkIiNvs507eGX5XViTDkzipoen7PQ7mbUwIZmlxzIXW4gJ/nuvoay5iLxMJfCV614ruFRDSDiNd3LlKCydkAiQNeGLSiR+Jl/FWdP0U2cqcRnNsuT+S80wM9XF6t+JAVNc66Hhm2Df0XEZIiE+NZ7lc9/s4656i4QkzKZtcUXEAkjMIyrdtRlURQ1Vb2GfuYmZgNfDE31K+woHI29gk/lRtGtCqj8n3ET6Yd7URjOHppRWHSIKPkvEdA1JRglJzwfWMmNuYBeeendKiu8WJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ3Rq1OXO2ux2Q85k3o8BXGeCBCMGn/c04WCtO+lM3Y=;
 b=KIV/H7Dm7ZSz+qbghKzpZdcIsUxi2WJWRJ7EFc18UuIyYQGiMs0jX4ChQ7K6tWMA7PwBOicK1kMh0PLaeREozCV662qpfzoeYzsTJ4HGpsjJTqWUkJz1Ofss40fCebswjwrEiWsQMudl75VbdGXrmm1neqEjuUKBWz6Cbzu0EHQViCUgV1kazRnzq/gKuBKQ1pV155T9YSLOTBPcmcl3qFBQYE96YE2INop4dL0I0rRMf+RsBMtEsVOSqA+QxCCrchl57CdEi4/nR5VOEqMblnqTTiSn/QkV7ddf/LoQuDYzdVqhJ5bwM6S6+1zSbDeRJBHnOESbi3lMvZnXdj9C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6880.namprd11.prod.outlook.com (2603:10b6:510:228::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 16:01:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:01:50 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2: Add workaround 18033852989
Thread-Topic: [PATCH] drm/xe/xe2: Add workaround 18033852989
Thread-Index: AQHag/KdPtfWLdMXXEuxta6SreE2P7FTj8MAgAAD5LA=
Date: Mon, 1 Apr 2024 16:01:50 +0000
Message-ID: <MW4PR11MB70560BD45E6C7561FB4BEC3EB33F2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240401052142.3799284-1-himal.prasad.ghimiray@intel.com>
 <m3jjlg2pkwi3wg4hmh36clzwlwr2gyc3pv2jo2s7wpl3pqss46@gktupq7r22z5>
In-Reply-To: <m3jjlg2pkwi3wg4hmh36clzwlwr2gyc3pv2jo2s7wpl3pqss46@gktupq7r22z5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH8PR11MB6880:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vNd2tPorsYfl/D70jbqjIQn154cBrWf2H5gPXTYbuwMA+N8z49mK7eIkZlQO3X4oOw8VcTaxelyjL4L1i9mh3Oq6Q+RRFNLqyFpG09E9Djx//NfFuiH/R9A9pCzL5SJnatEpXPYyxSwWPhkh+w1pfXNbfJL4EGR/Ke2sIEHj4SFIyBNw7/CnAm4ayKBB8NIY7CIvtCNpnMDSOWfsWLazgeNAXYOTG+xIAlKMVXAEgecdckZqLm9kJd1LNF2ZdQErLutrVp3qZtzrAh1MCrTiFg3WTe/L4DYiNgmUCtAktROPbp3UrXNh5e5e2FEwjuGDw9DlLYizMxABfEiuCjx2iSgEWA88TjP4aKagKVczXMfzFb7S+SnPAI30a7JTjoSYf02ObBl8Ihc2nLsW3rkeVkuvLI2R9EJC0y112CwjUD9xR2fRt90090DbjXiPTV9G1y3nd7egdqCou6IGH9P0RvahLcN9bUJQ4mqD7Ek4QqLeqnQOnUXq22yDGSTV+QMILdjVn3Dy/ofWjE1MJB43avjsMyLFn7XrHLOJlZPnsX4slpIonUG8M/fzwyB0kmmlYnWyGiuAZUCfUuRUI6dFb2zKMq28rqo8amCrsFas21KqKjzIu0pyrQV3GAlBpI4BDPaK386N7jMmDLlVWDf58H93BqR8C68w2EIIWiZSMzE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?drEtQ/ynHTT/duZ2XznMJzaflgXvN/XqXWURJNgLzXIzHeL6ntsGUZlORQWS?=
 =?us-ascii?Q?38VLAxKJGxxlCm7djWkUH3GH27p59FHO9saoyZSDpXiTHbjdlP59cTsqRBr7?=
 =?us-ascii?Q?Vj0TZ49R/Q0E40buSi6+a9GzSMoknENaA75q1yg8rrrs2DQaACZLSnUoGNLk?=
 =?us-ascii?Q?Sus1910EE0IZAPHGY4NXkyTXEu3Em4fEerGd9TMITPx3XvbIaD8oDokRvC8b?=
 =?us-ascii?Q?7Nv/Z3brI3qr0OKIMkj44lOFLQJPgossOiZRxwnWpQzIqUa9YFh4fBabEFy6?=
 =?us-ascii?Q?vm0eVN3Zl/AlejmyJvuy22CifKtJ+Jp6nPYU48moY5HgycSaUC+cWbr8zjx6?=
 =?us-ascii?Q?9YP0HYWhMHmgepLvlyD9fbYQBUUcf/Jxrm58qRGVWSMER0oPzeyj3dAylLF9?=
 =?us-ascii?Q?G28x1OhAHbLKB7BBd+8x7hfoPvtEPoqfeCo6MU5LsYIEfOolI9gPWbbp+iB/?=
 =?us-ascii?Q?fYocIoV1uq3OPBdlnv3j+Fz/u1TvgLwrSsHH8mHlhMOcS30mx2LJskZ38jFp?=
 =?us-ascii?Q?l+mv29+51Md2yN+LPbqwus5CI7VeszgUB6sJ0k4zu6LAkFwA/WrxD/l1zc9R?=
 =?us-ascii?Q?Lt2gNEmxXBYvMUSkN9io4ftn1PZ1+TmrcppzfddUDUyEkfHuUWp0bFfxgyGO?=
 =?us-ascii?Q?Tw9aDc//bDue9BPOE6pvkCoMz5lMyxzzWLewn5jbSsq2UM/XxPrfIQ6B7n+k?=
 =?us-ascii?Q?Qu5RzeYxgWu2W5oRtMFUnYNoDqQxXZm+Y0miPnJdvIWvJKilYiSN+KRUVR+d?=
 =?us-ascii?Q?m48k6994Eto5Q3f5Ii8BuUCLDm/PhmJ4nG0TbWroDumNLfN77tc3PjZ9m4j/?=
 =?us-ascii?Q?+qet1S9aTaK8VOseIBreySPRutaCG+QNnBUyaWGlC0rLL1d3bR8n7CvYLPUU?=
 =?us-ascii?Q?womL9uA7p6EwZabyUS4m1MI6Nol53kPQ7oQWzXe0BA6FrMvSJKFrhSPiHhiw?=
 =?us-ascii?Q?Gsel0wq+Z61RMUjBFtoQpLYeinMbo7V4wK4QYNukvQM4mNcjrgNWJo3jXoMg?=
 =?us-ascii?Q?ncvajV6CFtw5wglOD9CI8sxhdURmX9Qji6ETZO16a6BCi+e9/XWqDRVGSbM+?=
 =?us-ascii?Q?tnfHKyD0AeqFWHRZrU6CDeFvvj6uO2uZax21gnSgfSr3QcHLShAfjFEuaj/j?=
 =?us-ascii?Q?3bYOML0RmbGQ1vGw8BB15u/1gE2ocSFTgyWGbU30aHgP4PAtOhEEMb6MSqIl?=
 =?us-ascii?Q?2GNMYzR+8Sb0OjMGWpI1Li+oP+ULX4P5Kfp7JvGH3BrfsxXahwNAA7WYzU6W?=
 =?us-ascii?Q?9WvVlkyxnDC9F26t6qZ9j5A7Yvz2o9chaLVVmGAJGIpb5EQQnhNnL2ODY3nm?=
 =?us-ascii?Q?xk9HPIhyMAVSdXSOscwKbPMACGdQlxpzx54jDE53gf8myiBkSKNrirdNvdfk?=
 =?us-ascii?Q?NK/pjBCQwLDMSFULpLXhzRGK2qJMA5Rmqfoc/z29A163nsFHRoHG7VKifJ7T?=
 =?us-ascii?Q?PDrD0nEMxoLls9qfk6CuDqMSvi26XCFhM6G45HsGEilNLp3A3m8PJBJzBJQM?=
 =?us-ascii?Q?ewlyIqFEw3qu84TfYly+h2umxhqnHBNBfN7HRWa63b0EVr3/7j7QXtKifAao?=
 =?us-ascii?Q?I7V4c0yuTmVEFwIMO9FDG4XF5/jLirYIXREmgyvB2vDO/GJMzLZSC6YufdMe?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd336175-2918-4c2e-d0cf-08dc52650ab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 16:01:50.4485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVLk2CwPiB4CoXraO9e+x/lRJPs/bJSHL1XCRuL7qTEIW7ek2ZefpZdHXYKTacZn9n9R47Sx9lQNZ2VeUFwfHrtddSlyRuoDaMehyigksSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: 01 April 2024 21:17
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18033852989
>=20
> On Mon, Apr 01, 2024 at 10:51:42AM +0530, Himal Prasad Ghimiray wrote:
> >This workaround applies to Graphics 20.04 as RCS engine workaround.
>=20
> It applies to render as this is a RCS register, but since it's part of th=
e context
> image we classify it as an "LRC workaround", not "RCS engine workaround".=
 The
> code below looks correct, so I'm not sure if this is leftover from previo=
us
> version.

Thanks for pointing this out. Will upload new version with rectifying commi=
t message.=20
>=20
> Aside from commit message,  Reviewed-by: Lucas De Marchi
> <lucas.demarchi@intel.com>
>=20
> Lucas De Marchi
>=20
> >
> >Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> > 2 files changed, 5 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >index d5b21f03beaa..9728d9da9931 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >@@ -98,6 +98,7 @@
> > #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> >
> > #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> >+#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
> >
> > #define HIZ_CHICKEN					XE_REG(0x7018,
> XE_REG_OPTION_MASKED)
> > #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE
> 	REG_BIT(14)
> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >index 74b33a3845f2..c904e55ced9c 100644
> >--- a/drivers/gpu/drm/xe/xe_wa.c
> >+++ b/drivers/gpu/drm/xe/xe_wa.c
> >@@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
> > 		       ENGINE_CLASS(RENDER)),
> > 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE),
> ENABLE_SEMAPHORE_POLL_BIT))
> > 	},
> >+	{ XE_RTP_NAME("18033852989"),
> >+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> >+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> >+	},
> >
> > 	{}
> > };
> >--
> >2.25.1
> >
