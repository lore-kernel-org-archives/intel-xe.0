Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0CBE95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 12:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A8610E265;
	Mon,  9 Oct 2023 12:01:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A1010E269
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696852890; x=1728388890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iIeapLKP8TeoAFYT32cwibq2jyxX5S6H7yoVb8AO7yY=;
 b=VfyjyRD5tflm+NEf+ZiXh8uKGs5CMoAD2367znJM4kWZapNOXzagyGNK
 /3V2LjdmhSls8P1VxPEMbZMHxF5JdCR0CnR8x9mdHhR/LpJaDMjUWZC1X
 9gOcQUlSx53voZPoI6k323cYNF2aZqINSdcRoCZOXJiWOtZ7LYJUfalZ0
 JXlP0Tg/Ons219SU1L7hxma1CvjJycRRZXnO89SeDGOYWlgUbt1JFhFmO
 rD1bX5kLG7I4JOPLMfx7zsaIQO/1UK0ztErzX6n+LO7GN3PsGq52znzoT
 McaGgVfhoh82VV3AFZEbeMlaFsfHR4H/Snukaj3Q9TLZsCHbb259hnH+O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381389254"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="381389254"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 05:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="752997118"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="752997118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 05:01:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 05:01:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 05:01:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 05:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8K9O/iSUdWk0gfiScHGx6l90uH/AFflKWKTcWHxYx3Qirm/i3Ai2k9gu2vONT3NhdjuJtVkVo/iT/ZOtcAVV8jWlW9/1lJ4k838Lkb9WXJqV+IPc+g/3IEbbEMPADudENhJOVvHFwIuRAD9aqbMAPjeknbhNtAlAY286/LtCwoO/S2sFm9rdyzc4mYXWFnJXG2dgo+K87DM/w2OO1z2zc5erHoKKstJluq4hVPjaCpfLyjrik93t8lceCRO/wAygfprkz5snr6eSqzlLsAeUMXyx0LXy36bBA1t+Tf99oXrCMRP5mX0y2dwppZ2gmxJAS0wEjjtwHNHJ0gnntcpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgWQEoVljynbUYr9L54Ic87kljSX9KLiw84S8VQyVW4=;
 b=PW29HOOuUmNrjS3Z+ZswNSyaHd1vfgAHUFrRlmJyIg0DhYnEN5GEq/pV4PItdHzFvf3N2sxQ3UMDJHk+34Bf/h/Z0rwzm2LKlVv3OYr+kYBZgFbu38RF8iNU3HwLChC0SxnDk+clS+2JvVUBKozg2LHaF0Tbq/vprJnCz+50a9VTOlrBKcxiwZZ23gNt3DDI+lQnQW7MTOuu+i9c6sxL6p6NU1w/kL9tQbl9/TXerVKTHnB/affxfChJDLHwT97vKUe+gzzlcdM0voAuRyIth1JdFJByDAcb9FEgZQafDow9hvwVklHlb5Xpdc6HN9uvajxToAGh5LlIzTG24C3e6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SA1PR11MB7037.namprd11.prod.outlook.com (2603:10b6:806:2ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 12:01:24 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::81c5:d638:ec8e:99f5]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::81c5:d638:ec8e:99f5%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 12:01:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Thread-Topic: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
 driver errors
Thread-Index: AQHZ8px7fXgX+bS7zESwNbO0LOjVurAy4SOAgA6JgAA=
Date: Mon, 9 Oct 2023 12:01:22 +0000
Message-ID: <DS7PR11MB6197414068E01310BE3EE87081CEA@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-3-tejas.upadhyay@intel.com>
 <ZRe5GQHmyqjs+wFU@nvishwa1-DESK>
In-Reply-To: <ZRe5GQHmyqjs+wFU@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: aravind.iddamsetty@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SA1PR11MB7037:EE_
x-ms-office365-filtering-correlation-id: 809499c5-ccad-45ad-3a6b-08dbc8bf74fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B7QqipNUJhAU4xUkq1nKby/jR0zddKdwWiykpfhprrbziCey73rI8FlUOWGXkO9nP1gSfUcH/EmSeXPn22MoaqT18O+pVXJtcYUtE214uxcLGCwgNUhrw6C9LIGvQf+7780spytagxWnSioFpFnQW7qF7qktklpMPgdCcY1olVPrjvvToIvECbeyZddkOTLNSyOS4LapATC3p8lUqDTsd8QKKyoLtSIZSVnnupsKknr8qrkwqWzparzO6Dc6ZGUNNVMR3qBEd49GDn2mhnrdSHcFDAhG26Jm3qiIRlma8TOslJ+qCDRzpl1wnYWWh9XVRX8mlCw0NX+zvjDsV5Jb/sLHkIgtsA7qxGC8Czz0tmFJTQIyjY9+XFOkw5Okm5VlF1f+HpWp6JrjhrKDcN1Ve6USJp846h9neg7P1ICm+hUmLNw32bSv/oCKY5ROJrKqDchUYg1P4biWPP1CRO132gCnbBgg0LcALRLSXMlPoaSy21UR5ql6uINuLelkjX6Mfd8ijn3K0ttSnoL46BVL8ckNc8wLgusIISfGa1tDBmhA5avYKVCc3mG/uo5r2OIIOffOM+9x5iYRUbAfwfUd4XHZNAHiKIXPLeBUN3O0uWQGaYp2APQaN1suifzHh7xZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(83380400001)(107886003)(26005)(66946007)(66476007)(66556008)(76116006)(110136005)(66446008)(64756008)(6636002)(316002)(54906003)(8936002)(8676002)(4326008)(52536014)(5660300002)(41300700001)(7696005)(6506007)(53546011)(71200400001)(15650500001)(9686003)(2906002)(30864003)(478600001)(33656002)(38070700005)(38100700002)(82960400001)(86362001)(122000001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N+v2Gi8oh2qGT5BsbCMJxPlghOlbMQTH+VGiJTb9D9XmC2+PgmgGkxSuQu7H?=
 =?us-ascii?Q?ZdpasK8Q45m6kApy+No+MDVAR6/PgDYvI17Jg85DFiR6Qwu/6ynWAOzsFKj5?=
 =?us-ascii?Q?25EaFQiB72kHTQcLTeEBRVXV7Rquky9EY7CMQ5ZxGynMrZdvgqYDrNhN2qjn?=
 =?us-ascii?Q?KUpAK8TagZblz0OtpPJgVngg7cdhzh1W+/YJD+SooTEoZfoN7Pm0cPqehjfY?=
 =?us-ascii?Q?uHImrUCK+XQIanvaEjvlZYnFmtK3kfyD9N6dZQbKnPhVHQHkSdfZhhf7hFOG?=
 =?us-ascii?Q?qbUVp4Fn1S4SPCTd4XD5qWyntL9EX2coBz4G4UOOh1BKWSxdUD3CLlKlLBgu?=
 =?us-ascii?Q?kwTUPazM2TALJJJZAY8YkTpHJBllAEScCvWP12f3vcfaMBmdpK0kcuKd9w7s?=
 =?us-ascii?Q?IBdhjoVmudR2X/k+sR8UZfrzxTFQvD1clJYsbRV/QExGkzctgz8CekOt6Pxz?=
 =?us-ascii?Q?utrSAk1Uvuk6YMErVTh92I/+rAW2FWIsKaTbsBYSB+oM9tKuI5FD4MzxUwwA?=
 =?us-ascii?Q?TrmaD19ozDK6CDy3pMnV2Une5eNCrkA1kVaqI8jQ12NF/HlF2jNVYC8ZpUJR?=
 =?us-ascii?Q?kkj1RWfBbdp5kvjbVVET2CiBcGSMDhP91okwkaIxjzO/qlJ1eQm3cBUeSUO9?=
 =?us-ascii?Q?xFAI0SWLgqq2DQvaWp8ygIZ9zpzeWoHJFmnahtrIQedP9ux+yFKO8h1psMwV?=
 =?us-ascii?Q?QxgIhswuhIYTrDYzqf9qdlegnzm76Ep3M5VXfmTXqZoX6pEKE7acmosDpY8D?=
 =?us-ascii?Q?zUpEWL7xS/9hJ3LEMmaHF2QR6vDqj+SUz61l1X3kxjIJrk+q4/8sUV/2VQBw?=
 =?us-ascii?Q?eNZIk/aLpyU6/QdTK0jOB3QNQnbU6iyqwlmIOgFANN/OCr6ZOLFYy3e29YEa?=
 =?us-ascii?Q?i/1Tx7AO8BjJnbr85E/hDxZuoqE1pJEefeiyfB/ptIzf7WrgUHAznnieJ8Kf?=
 =?us-ascii?Q?f0W+pxwZpyELQPorE31vydjJ31pItFXxZSGGCom4qoH/PbPAFpY3Q/336J0o?=
 =?us-ascii?Q?710miUG4vcReSAXwweDXGTiyo04NWHmdGzi2BwQHO3lTJzrr3SCvkYDbAu+y?=
 =?us-ascii?Q?O9F2W58luvesa1h3tdq+CF1QVIGiuS0qLlBWR6xmtVLlG45xvsgobOTMzk+R?=
 =?us-ascii?Q?KklwfxWM++sN6ub+heHm3uAcokcktjPCHrcC35JHq4JbyOA8OAb0CS2E3WCo?=
 =?us-ascii?Q?LRgroms2V5c+Ag2mKbyES2LZQW5k32rP4Ljj5LS+6EwJ9DtSIvOFLmy9XkcU?=
 =?us-ascii?Q?pY9wspu33pW8Vb6VzKwB9YrNc3P0MtRBffLhWF9kSdJ2J7cwvH5rH5O7kpKm?=
 =?us-ascii?Q?AWl4yvp5LIZ4ElEktp2yVZWK5qHfHF6t9ej4TlXMjrtzFjkXaFqdeF0S3veg?=
 =?us-ascii?Q?EXf19ahPDUkkHd9iiIahQaQdPjsnfXOoWWmfxp9UWqNqUc4MJkGwho039xU9?=
 =?us-ascii?Q?RVMWIi/AGvuTk4OILP4jx596erUBujzbAh9KMsFAWZ5a1uzou/5iIfL3NwS7?=
 =?us-ascii?Q?KV1gvN9xHhajQaHfPx0rO+q996yQKvmfVpDGpHfRknFboQTEN5ZcfrOAYhrO?=
 =?us-ascii?Q?CZJJ8+rMRghzhPSKkltclf8OaU0wavNQoa17I2IN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809499c5-ccad-45ad-3a6b-08dbc8bf74fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 12:01:22.9880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ry8lLnpfLbay8MRIQlQs3rW1+SAfxhPhwczaULzDSwj9aXemsRB/GdoluafkzVOiHOXqzByh8Xg5hxuZBiIIwikpPKhMkBeDV/kGki2/Fio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7037
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: "Roper@freedesktop.org" <Roper@freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko@freedesktop.org" <Wajdeczko@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Saturday, September 30, 2023 11:29 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper@freedesktop.org;
> Wajdeczko@freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low lev=
el
> driver errors
>=20
> On Fri, Sep 29, 2023 at 11:54:20AM +0530, Tejas Upadhyay wrote:
> >we added a low level driver error counter and incrementing on each
> >occurrance. Focus is on errors that are not functionally affecting the
> >system and might otherwise go unnoticed and cause power/performance
> >regressions, so checking for the error counters should help.
> >
> >Importantly the intention is not to go adding new error checks, but to
> >make sure the existing important error conditions are propagated in
> >terms of counter under respective categories like below :
> >Under GT:
> >driver_gt_guc_communication,
> >driver_gt_other_engine,
> >driver_gt_other
> >
> >Under Tile:
> >driver_ggtt,
> >driver_interrupt
> >
> >TODO: Currently this is just a counting of errors, later these counters
> >will be reported through netlink interface when it is implemented and
> >ready.
> >
> >V5:
> >  - Dump err_type in string format
> >V4:
> >  - dump err_type in drm_err log - Himal
> >V2:
> >  - Use modified APIs
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt.c                  |  6 +++
> > drivers/gpu/drm/xe/xe_gt.h                  |  1 +
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
> > drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
> > drivers/gpu/drm/xe/xe_guc_ct.c              | 44 ++++++++++++-------
> > drivers/gpu/drm/xe/xe_guc_pc.c              | 16 ++++---
> > drivers/gpu/drm/xe/xe_guc_submit.c          | 47 +++++++++++++++------
> > drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
> > drivers/gpu/drm/xe/xe_reg_sr.c              | 20 ++++++---
> > drivers/gpu/drm/xe/xe_tile.c                |  5 +++
> > drivers/gpu/drm/xe/xe_tile.h                |  1 +
> > 11 files changed, 123 insertions(+), 53 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index a8b5f012588b..3c174b7430be 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -47,6 +47,12 @@
> > #include "xe_wa.h"
> > #include "xe_wopcm.h"
> >
> >+const char *const xe_gt_drv_err_to_str[] =3D {
> >+	[XE_GT_DRV_ERR_GUC_COMM] =3D "GUC COMMUNICATION",
> >+	[XE_GT_DRV_ERR_ENGINE] =3D "ENGINE OTHER",
> >+	[XE_GT_DRV_ERR_OTHERS] =3D "GT OTHER"
> >+};
> >+
> > /**
> >  * xe_gt_report_driver_error - Count driver error for gt
> >  * @gt: GT to count error for
> >diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> >index 9442d615042f..70c131022f59 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.h
> >+++ b/drivers/gpu/drm/xe/xe_gt.h
> >@@ -67,6 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt,
> struct xe_hw_engine *hwe)
> > 		hwe->instance =3D=3D gt->usm.reserved_bcs_instance;  }
> >
> >+extern const char *const xe_gt_drv_err_to_str[];
> > void xe_gt_report_driver_error(struct xe_gt *gt,
> > 			       const enum xe_gt_drv_err_type err);
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >index bd6005b9d498..63a152d74176 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >@@ -9,6 +9,7 @@
> > #include "xe_gt.h"
> > #include "xe_guc.h"
> > #include "xe_guc_ct.h"
> >+#include "xe_tile.h"
> > #include "xe_trace.h"
> >
> > #define TLB_TIMEOUT	(HZ / 4)
> >@@ -35,8 +36,11 @@ static void xe_gt_tlb_fence_timeout(struct
> work_struct *work)
> > 			break;
> >
> > 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> >-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence
> timeout, seqno=3D%d recv=3D%d",
> >-			gt->info.id, fence->seqno, gt-
> >tlb_invalidation.seqno_recv);
> >+		drm_err(&gt_to_xe(gt)->drm,
> >+			"gt%d: TLB invalidation fence timeout, seqno=3D%d
> recv=3D%d [%s]",
> >+			gt->info.id, fence->seqno, gt-
> >tlb_invalidation.seqno_recv,
> >+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
> >+		xe_tile_report_driver_error(gt_to_tile(gt),
> XE_TILE_DRV_ERR_GGTT);
> >
> > 		list_del(&fence->link);
> > 		fence->base.error =3D -ETIME;
> >@@ -329,8 +333,11 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, i=
nt
> seqno)
> > 				 tlb_invalidation_seqno_past(gt, seqno),
> > 				 TLB_TIMEOUT);
> > 	if (!ret) {
> >-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out,
> seqno=3D%d, recv=3D%d\n",
> >-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> >+		drm_err(&xe->drm,
> >+			"gt%d: TLB invalidation time'd out, seqno=3D%d,
> recv=3D%d [%s]\n",
> >+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv,
> >+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
> >+		xe_tile_report_driver_error(gt_to_tile(gt),
> XE_TILE_DRV_ERR_GGTT);
> > 		return -ETIME;
>=20
> Should there be a more fine grained counter here and elsewhere?
> For eg., this could be XE_TILE_TLB_INVAL_ERR instead of generic ERR_GGTT.
> (btw, it is ppgtt tlb invalidation, not ggtt).

We do have error description along with ERR_GGTT type. Any comment @Iddamse=
tty, Aravind ?

Thanks,
Tejas

>=20
> Niranjana
>=20
> > 	}
> >
> >diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >index 84f0b5488783..a006de620b82 100644
> >--- a/drivers/gpu/drm/xe/xe_guc.c
> >+++ b/drivers/gpu/drm/xe/xe_guc.c
> >@@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
> const u32 *request,
> > 			     50000, &reply, false);
> > 	if (ret) {
> > timeout:
> >-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
> >-			request[0], reply);
> >+		drm_err(&xe->drm, "mmio request %#x: no reply %#x
> [%s]\n",
> >+			request[0], reply,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(gt,
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return ret;
> > 	}
> >
> >@@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
> const u32 *request,
> > 		u32 hint =3D FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT,
> header);
> > 		u32 error =3D FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR,
> header);
> >
> >-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
> >-			request[0], error, hint);
> >+		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x
> [%s]\n",
> >+			request[0], error, hint,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(gt,
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -ENXIO;
> > 	}
> >
> > 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=3D
> > 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
> > proto:
> >-		drm_err(&xe->drm, "mmio request %#x: unexpected reply
> %#x\n",
> >-			request[0], header);
> >+		drm_err(&xe->drm, "mmio request %#x: unexpected reply
> %#x [%s]\n",
> >+			request[0], header,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(gt,
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> >b/drivers/gpu/drm/xe/xe_guc_ct.c index 8b686c8b3339..f68d7fc2c486
> >100644
> >--- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >@@ -732,8 +732,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
> >const u32 *action, u32 len,
> >
> > 	ret =3D wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > 	if (!ret) {
> >-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
> action %04x",
> >-			g2h_fence.seqno, action[0]);
> >+		drm_err(&xe->drm,
> >+			"Timed out wait for G2H, fence %u, action %04x [%s]",
> >+			g2h_fence.seqno, action[0],
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
> > 		return -ETIME;
> > 	}
> >@@ -744,8 +746,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
> const u32 *action, u32 len,
> > 		goto retry;
> > 	}
> > 	if (g2h_fence.fail) {
> >-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d,
> hint %d",
> >-			action[0], g2h_fence.error, g2h_fence.hint);
> >+		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d,
> hint %d [%s]",
> >+			action[0], g2h_fence.error, g2h_fence.hint,
> >+
> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		ret =3D -EIO;
> > 	}
> >
> >@@ -840,8 +844,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32
> *msg, u32 len)
> > 	origin =3D FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> > 	if (unlikely(origin !=3D GUC_HXG_ORIGIN_GUC)) {
> > 		drm_err(&xe->drm,
> >-			"G2H channel broken on read, origin=3D%d, reset
> required\n",
> >-			origin);
> >+			"G2H channel broken on read, origin=3D%d, reset
> required [%s]\n",
> >+			origin,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		ct->ctbs.g2h.info.broken =3D true;
> >
> > 		return -EPROTO;
> >@@ -859,8 +864,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32
> *msg, u32 len)
> > 		break;
> > 	default:
> > 		drm_err(&xe->drm,
> >-			"G2H channel broken on read, type=3D%d, reset
> required\n",
> >-			type);
> >+			"G2H channel broken on read, type=3D%d, reset
> required [%s]\n",
> >+			type,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		ct->ctbs.g2h.info.broken =3D true;
> >
> > 		ret =3D -EOPNOTSUPP;
> >@@ -918,12 +924,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
> > 							   adj_len);
> > 		break;
> > 	default:
> >-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> >+		drm_err(&xe->drm, "unexpected action 0x%04x [%s]\n",
> >+			action,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 	}
> >
> > 	if (ret)
> >-		drm_err(&xe->drm, "action 0x%04x failed processing,
> ret=3D%d\n",
> >-			action, ret);
> >+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=3D%d
> [%s]\n",
> >+			action, ret,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> >
> > 	return 0;
> > }
> >@@ -958,8 +967,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg,
> bool fast_path)
> > 	len =3D FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
> GUC_CTB_MSG_MIN_LEN;
> > 	if (len > avail) {
> > 		drm_err(&xe->drm,
> >-			"G2H channel broken on read, avail=3D%d, len=3D%d,
> reset required\n",
> >-			avail, len);
> >+			"G2H channel broken on read, avail=3D%d, len=3D%d,
> reset required [%s]\n",
> >+			avail, len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		g2h->info.broken =3D true;
> >
> > 		return -EPROTO;
> >@@ -1026,9 +1036,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
> > 		drm_warn(&xe->drm, "NOT_POSSIBLE");
> > 	}
> >
> >-	if (ret)
> >-		drm_err(&xe->drm, "action 0x%04x failed processing,
> ret=3D%d\n",
> >-			action, ret);
> >+	if (ret) {
> >+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=3D%d
> [%s]\n",
> >+			action, ret,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(ct_to_gt(ct),
> XE_GT_DRV_ERR_GUC_COMM);
> >+	}
> > }
> >
> > /**
> >diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> >b/drivers/gpu/drm/xe/xe_guc_pc.c index d9375d1d582f..8fb180f706f4
> >100644
> >--- a/drivers/gpu/drm/xe/xe_guc_pc.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> >@@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct
> >xe_guc_pc *pc)
> >
> > 	/* Blocking here to ensure the results are ready before reading them
> */
> > 	ret =3D xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
> >-	if (ret)
> >-		drm_err(&pc_to_xe(pc)->drm,
> >-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
> >+	if (ret) {
> >+		drm_err(&pc_to_xe(pc)->drm, "GuC PC query task state
> failed: %pe [%s]",
> >+			ERR_PTR(ret),
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(pc_to_gt(pc),
> XE_GT_DRV_ERR_GUC_COMM);
> >+	}
> >
> > 	return ret;
> > }
> >@@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc
> *pc, u8 id, u32 value)
> > 		return -EAGAIN;
> >
> > 	ret =3D xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> >-	if (ret)
> >-		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed:
> %pe",
> >-			ERR_PTR(ret));
> >+	if (ret) {
> >+		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe
> [%s]",
> >+			ERR_PTR(ret),
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(pc_to_gt(pc),
> XE_GT_DRV_ERR_GUC_COMM);
> >+	}
> >
> > 	return ret;
> > }
> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> >b/drivers/gpu/drm/xe/xe_guc_submit.c
> >index 870dc5c532fa..208ffde879ed 100644
> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >@@ -1497,13 +1497,17 @@ g2h_exec_queue_lookup(struct xe_guc *guc,
> u32 guc_id)
> > 	struct xe_exec_queue *q;
> >
> > 	if (unlikely(guc_id >=3D GUC_ID_MAX)) {
> >-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
> >+		drm_err(&xe->drm, "Invalid guc_id %u [%s]",
> >+			guc_id,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return NULL;
> > 	}
> >
> > 	q =3D xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
> > 	if (unlikely(!q)) {
> >-		drm_err(&xe->drm, "Not engine present for guc_id %u",
> guc_id);
> >+		drm_err(&xe->drm, "Not engine present for guc_id %u [%s]",
> >+			guc_id,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return NULL;
> > 	}
> >
> >@@ -1532,7 +1536,9 @@ int xe_guc_sched_done_handler(struct xe_guc
> *guc, u32 *msg, u32 len)
> > 	u32 guc_id =3D msg[0];
> >
> > 	if (unlikely(len < 2)) {
> >-		drm_err(&xe->drm, "Invalid length %u", len);
> >+		drm_err(&xe->drm, "Invalid length %u [%s]",
> >+			len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1542,8 +1548,10 @@ int xe_guc_sched_done_handler(struct xe_guc
> >*guc, u32 *msg, u32 len)
> >
> > 	if (unlikely(!exec_queue_pending_enable(q) &&
> > 		     !exec_queue_pending_disable(q))) {
> >-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> >-			atomic_read(&q->guc->state));
> >+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
> >+			atomic_read(&q->guc->state),
> >+
> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1577,7 +1585,9 @@ int xe_guc_deregister_done_handler(struct xe_guc
> *guc, u32 *msg, u32 len)
> > 	u32 guc_id =3D msg[0];
> >
> > 	if (unlikely(len < 1)) {
> >-		drm_err(&xe->drm, "Invalid length %u", len);
> >+		drm_err(&xe->drm, "Invalid length %u [%s]",
> >+			len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1587,8 +1597,10 @@ int xe_guc_deregister_done_handler(struct
> xe_guc
> >*guc, u32 *msg, u32 len)
> >
> > 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> > 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> >-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> >-			atomic_read(&q->guc->state));
> >+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
> >+			atomic_read(&q->guc->state),
> >+
> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1611,7 +1623,9 @@ int xe_guc_exec_queue_reset_handler(struct
> xe_guc *guc, u32 *msg, u32 len)
> > 	u32 guc_id =3D msg[0];
> >
> > 	if (unlikely(len < 1)) {
> >-		drm_err(&xe->drm, "Invalid length %u", len);
> >+		drm_err(&xe->drm, "Invalid length %u [%s]",
> >+			len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1646,7 +1660,9 @@ int
> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32
> *msg,
> > 	u32 guc_id =3D msg[0];
> >
> > 	if (unlikely(len < 1)) {
> >-		drm_err(&xe->drm, "Invalid length %u", len);
> >+		drm_err(&xe->drm, "Invalid length %u [%s]",
> >+			len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1672,7 +1688,9 @@ int
> xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32
> le
> > 	u32 reason;
> >
> > 	if (unlikely(len !=3D 3)) {
> >-		drm_err(&xe->drm, "Invalid length %u", len);
> >+		drm_err(&xe->drm, "Invalid length %u [%s]",
> >+			len,
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
> >+		xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_GUC_COMM);
> > 		return -EPROTO;
> > 	}
> >
> >@@ -1681,8 +1699,11 @@ int
> xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32
> le
> > 	reason =3D msg[2];
> >
> > 	/* Unexpected failure of a hardware feature, log an actual error */
> >-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d
> because 0x%08X",
> >-		guc_class, instance, reason);
> >+	drm_err(&xe->drm,
> >+		"GuC engine reset request failed on %d:%d because 0x%08X
> [%s]",
> >+		guc_class, instance, reason,
> >+		xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
> >+	xe_gt_report_driver_error(guc_to_gt(guc),
> XE_GT_DRV_ERR_ENGINE);
> >
> > 	xe_gt_reset_async(guc_to_gt(guc));
> >
> >diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >index def9369eb488..3b773d055871 100644
> >--- a/drivers/gpu/drm/xe/xe_irq.c
> >+++ b/drivers/gpu/drm/xe/xe_irq.c
> >@@ -18,6 +18,7 @@
> > #include "xe_guc.h"
> > #include "xe_hw_engine.h"
> > #include "xe_mmio.h"
> >+#include "xe_tile.h"
> >
> > /*
> >  * Interrupt registers for a unit are always consecutive and ordered
> >@@ -222,8 +223,9 @@ gt_engine_identity(struct xe_device *xe,
> > 		 !time_after32(local_clock() >> 10, timeout_ts));
> >
> > 	if (unlikely(!(ident & INTR_DATA_VALID))) {
> >-		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
> valid!\n",
> >-			bank, bit, ident);
> >+		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
> valid! [%s]\n",
> >+			bank, bit, ident,
> xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_INTR]);
> >+		xe_tile_report_driver_error(gt_to_tile(mmio),
> XE_TILE_DRV_ERR_INTR);
> > 		return 0;
> > 	}
> >
> >diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
> >b/drivers/gpu/drm/xe/xe_reg_sr.c index 87adefb56024..46ec3ade5577
> >100644
> >--- a/drivers/gpu/drm/xe/xe_reg_sr.c
> >+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> >@@ -126,11 +126,13 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >
> > fail:
> > 	xe_gt_err(gt,
> >-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
> masked: %s, mcr: %s): ret=3D%d\n",
> >+		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
> >+masked: %s, mcr: %s): ret=3D%d [%s]\n",
> > 		  idx, e->clr_bits, e->set_bits,
> > 		  str_yes_no(e->reg.masked),
> > 		  str_yes_no(e->reg.mcr),
> >-		  ret);
> >+		  ret,
> >+		  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
> >+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> > 	reg_sr_inc_error(sr);
> >
> > 	return ret;
> >@@ -207,7 +209,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr,
> struct xe_gt *gt)
> > 	return;
> >
> > err_force_wake:
> >-	xe_gt_err(gt, "Failed to apply, err=3D%d\n", err);
> >+	xe_gt_err(gt, "Failed to apply, err=3D%d [%s]\n",
> >+		  err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
> >+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> > }
> >
> > void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe) @@ -235,8
> >+239,10 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> > 	xa_for_each(&sr->xa, reg, entry) {
> > 		if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
> > 			xe_gt_err(gt,
> >-				  "hwe %s: maximum register whitelist slots
> (%d) reached, refusing to add more\n",
> >-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> >+				  "hwe %s: maximum register whitelist slots
> (%d) reached, refusing to add more [%s]\n",
> >+				  hwe->name, RING_MAX_NONPRIV_SLOTS,
> >+
> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
> >+			xe_gt_report_driver_error(gt,
> XE_GT_DRV_ERR_ENGINE);
> > 			break;
> > 		}
> >
> >@@ -259,7 +265,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine
> *hwe)
> > 	return;
> >
> > err_force_wake:
> >-	drm_err(&xe->drm, "Failed to apply, err=3D%d\n", err);
> >+	drm_err(&xe->drm, "Failed to apply, err=3D%d [%s]\n",
> >+		err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
> >+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> > }
> >
> > /**
> >diff --git a/drivers/gpu/drm/xe/xe_tile.c
> >b/drivers/gpu/drm/xe/xe_tile.c index 708dd385f2b1..6f70e4cf3e03 100644
> >--- a/drivers/gpu/drm/xe/xe_tile.c
> >+++ b/drivers/gpu/drm/xe/xe_tile.c
> >@@ -71,6 +71,11 @@
> >  *  - MOCS and PAT programming
> >  */
> >
> >+const char *const xe_tile_drv_err_to_str[] =3D {
> >+	[XE_TILE_DRV_ERR_GGTT] =3D "GGTT",
> >+	[XE_TILE_DRV_ERR_INTR] =3D "INTERRUPT"
> >+};
> >+
> > /**
> >  * xe_tile_report_driver_error - Count driver error for tile
> >  * @tile: Tile to count error for
> >diff --git a/drivers/gpu/drm/xe/xe_tile.h
> >b/drivers/gpu/drm/xe/xe_tile.h index 092a6b17a97e..a0e7a95f53e5 100644
> >--- a/drivers/gpu/drm/xe/xe_tile.h
> >+++ b/drivers/gpu/drm/xe/xe_tile.h
> >@@ -14,6 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);  int
> >xe_tile_init_noalloc(struct xe_tile *tile);
> >
> > void xe_tile_migrate_wait(struct xe_tile *tile);
> >+extern const char *const xe_tile_drv_err_to_str[];
> > void xe_tile_report_driver_error(struct xe_tile *tile,
> > 				 const enum xe_tile_drv_err_type err);
> >
> >--
> >2.25.1
> >
