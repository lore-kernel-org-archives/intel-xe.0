Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62A0C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03B10E2D9;
	Mon,  7 Sep 2026 06:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiczH5T0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33BB10E2D9
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788760831; x=1820296831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z+ATiNRLC47UExu8sSKI4YYJWLl3a64yvO42vsmFf/o=;
 b=hiczH5T0UZhx1KwquyE+3lY6UqGpYo9Pw2WNsw++Di7acrxXL3hh45FZ
 SAbWKsid8x3N6rbEE7haX0JrooDY2YZm7ozOgXawlbJqoAuwA5BQg3eys
 SgK0S2q13V4TsJNr+RfzoVYxbUkx7g3DHjBuMKb0HNwIF6qFKU+WbBu+G
 ZTDEmtyIq7+qG7tyW9v8cVThfeAITFT8I7m1FFGNNdzzeFywHztkNSj3j
 rmSklmBr/SAiak8PqxqKzvQsTZS9OJpKaeJ98uphvz6BqPB4N7L3Ga4ve
 paIxNI/Sb7/3iUdd19jGSFJc7+sUodrXTJ7D9ZqeQm+YEdQ1vmvkmc2ko g==;
X-CSE-ConnectionGUID: FHPDn8+aTHaCPYLRnO8DGA==
X-CSE-MsgGUID: E/01Sdw5TyOo6p2pjpt1FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89283320"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89283320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:00:30 -0700
X-CSE-ConnectionGUID: A3JInCmSS7uoWbTGp71twQ==
X-CSE-MsgGUID: dFTXqlpxRn+Z6pTTfRx3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="274134809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:00:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 23:00:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 23:00:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 23:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K13BLa7QDwU8Z8EQJ7pj6Z7huHdzSPw1sc5AhtFlQYX8iBNMm2zwrGk9gcgwQa1cQt13Cb1v5CUhZBnF+7MuuluiyNpQu5sDJxf9A+NdOkItBWWV699FovH+NN//XUyMqaUzAoOcCe2RFlGe2vukPQn55rSqbtJFZbjb0Ve0fwckw3oBs49g7H/CZM9gIFeh8lPWxttR58S28UnBGvqeQHR0FWf9ZwI80u+Qz469Vc+jQJFo4ou7f1aafhcvxfe/eNkElOqmBf5ASx0CFQxeGUmbvtAdOiS5ZnEPlVx8LTd8vMrKwNhRhht7ujBgxHN9Ui/hAsyhudxJWhItrzTP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWo8YMA556O4trJRpDgGQ32yp/q1Q1odfshiGekZ2To=;
 b=l8T9unpYiGB7ARvnwDPWPjVZnkNBjUQcrQC1A/9KjMnzsaAoez8H+C+at59DxMzsyzmfxoskQzQu1uGVufKsWwi/w9JsOEyLxYWed/fr5aA+RpPAIsL454X4TlgklKMAMGrOvs2m27c7wXjJqxjSXPFlMvq34oD5564ODeszNwHJQ5REuoa/8PIr694BI33Jgwn5IBPFTVrLJYpm+G6e76lUgq0RRmZfZJk2fwi+8HZkAhhIskkPQSAwOjM4Q52St1btElIxHW4aP/KEw664wKrczJzzeEwbatYlrC1Xgj8b/WIieXP3kTs+cewBPDaZ2cwfP4ZN5js5cgRmpcBwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS6PR11MB458385.namprd11.prod.outlook.com (2603:10b6:8:499::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 06:00:17 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 06:00:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Topic: [PATCH] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Index: AQHdOupyBBDj0762z0SAO7kDgVYYQ7bCo6wg
Date: Mon, 7 Sep 2026 06:00:16 +0000
Message-ID: <DS0PR11MB87184DEF23CA82EEA77B752F81B22@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145016.3351123-2-varun.gupta@intel.com>
In-Reply-To: <20260902145016.3351123-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DS6PR11MB458385:EE_
x-ms-office365-filtering-correlation-id: a31bfa0a-47aa-418b-9d20-08df0ca54a96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: +X6eIcFhZlWKoTN+mhnbCPKzebGxya94GmtGO+Tmnqh5LC3M+Q7Rv5m8PilyknVxXDhn4mGw0sQFBb6aKlir6ZikQ7nMuKdPu9r9pddGIePPcCTEUjKwbE7A5as+FrqQEM7qYl98vI4plB5Tc5rNwdGraQMGp0Cx8QrS7RSvciWwEsBau+9fUt/QDUxZS6qlDrHM4SnBLz6+sMFSr2ZX3wgjwBPSM9Xd/AhEIX5geQQvYa5yC9btoHUIKNipfQ9XC7JBSUIrZB48pNGqU2CAR4jErW/fWnyHrRSj9nqgQ1x6wNGtgISI5XKXgbbmV3iO7Y5CZH4yn6HP7mXtVdmjd4zOKvc33N2Cq/JJTVwigOVUuFbAkIGV7m/8669ikmPF8KCOctsSSo0xi8BkHmFG0yMTWAvlV/308KTp06AplHi99i9RhfgBURbt/hBhPbHvawOZtIg/fRg7+QhZ1gFYGDdB+kxn0L0BoXdEkO6K30XSXt1d/ygOySon/xwwfVJoYKtDk8Bv8x9VxVb4quCCFtE/I6lo8aTWv6QcYHZIYfLK3/3iYGQdNBgbu1E6UN6Eq0OBOB0oIf1rb9y+vcg2TqjR52EajWT7Dwrkb52eaL5c5RwyYzTIW21araXeOdtN7gfM1Yu9VjJm3wv6sc/yvf4kaKwdCQ9vD8RAmOys+P5jppSUv7rpQ9u5Z7C5qLZ6Mm7JDQ8OwPVKSsCmFkDZBO5CC+iJ/YO9qWOT1lBq0A0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H2Sycr9P80UR3Cct+gsUN6O3wW/7kneuy917W9V1tJHaxMq1Hnku1k202Pqj?=
 =?us-ascii?Q?pRE+SzBcXo5TYZHaegJDWKk2qwQjL9fdSphP+M9mN3gBkqMx7BT3MnO/2sgJ?=
 =?us-ascii?Q?djKBoILKBZ6yX0uykylNxkaIxfEN/xFwuidwD3Y3dsE8OemRl4Mdkpn7AYeZ?=
 =?us-ascii?Q?L+wyTJNs7pBYkq0A9UkXEsSzBWRoybLTf8odFrCWNB53qYNh+6KDM4U0z9jG?=
 =?us-ascii?Q?bugUZco0a821kxkl5id3HLvbc+SK/iE2y0PHUIMG4hDanbhKgn5cMO9HX/pG?=
 =?us-ascii?Q?oEw8wRT7S9BESP5/iapu/AOhC520AUkM1eqrZJHUhFL3MoIIXgupA9jixd+G?=
 =?us-ascii?Q?G76V5vBppEGhZYpE3BU7nTCAdOb92YCCTpwk60npLOY382nlfF100TzSz3BF?=
 =?us-ascii?Q?6yhA0iyeojI6XudY1QJbU0BD26I0ls8I8zy/K2ZlNjdFO/ofqne9oPWtbOLK?=
 =?us-ascii?Q?WMvD7T2rnNgeOk7P2ZCOzp6PA5/mrMJrbTIF/fF/OmZLN0Cp65np6Fm6zlyH?=
 =?us-ascii?Q?XywGyEyNoGJ5hmpBuCMcO+mpBj1y6uEd4rQtA2RcxPClNHsVKdsWvvx/wy+3?=
 =?us-ascii?Q?W3qDnPX6HRRXyTprt2LhY/tUNobItcf4zZTWHYWYi1/taL5GALxMEqHWxjxN?=
 =?us-ascii?Q?yFzdKToEy/PWTqCjyb0gNfmxfLTLBJGASKIDL+lexlIKelk8EjE6cp5zmF4v?=
 =?us-ascii?Q?JkoXjbNaDgMwiHZdjGBgNxIg3fOzkK/qG4xGT+0fiF5xpD76lc/UoTMuDMTY?=
 =?us-ascii?Q?n83nhXM1vKI9sKIhm8cdr9QL2fcme+/DQZoM6/+tS9qNFMNWxG3r1ie/7CNU?=
 =?us-ascii?Q?op/s1KDr7VWQPqsleI9oF9Dkv+eUFe/WqV/8l4B4v2E4jg5ebEBkKRZ5skC/?=
 =?us-ascii?Q?mYx1F7diz9tKN7I+V9oLfpqHh+ZTYTZkXqXDJgDyEKPeJ+tU6PsFCVzC3cgb?=
 =?us-ascii?Q?xyHXUWTYCeE/vwS4Rx+HrnQiD+7XrVeC5FPdc807vdKsKPeM6EAjOphvTR5g?=
 =?us-ascii?Q?TclrbwxtaqDFq2Vg5EnTgb1XspdTWxwQSzZ+5d5N+4fJ04wcQMYYE1++cfJq?=
 =?us-ascii?Q?XsRljd9v2JQq5tRUrSaLVNYXOk77rzC/H9Fd+tc51DToraAhSyUY0mY5deg7?=
 =?us-ascii?Q?qRMvLjkXTFc/r0WgJZm8zHAYLqpNUa9LS9woRBI3PtBp9BiOcHcH3Z6+xl+P?=
 =?us-ascii?Q?l2GAzZrIkgQHHhsEb+RyGoMGYPCGtwdYzIg543/qMRHZOPz4sBzgdV5j+sTC?=
 =?us-ascii?Q?05oVV/bLANEl6ijiMEkx1aaGp5pfpy3L6/4MnlEB6c5Ka9sGQXnrkhPQiu3i?=
 =?us-ascii?Q?cGoc4UDOvorHTW99lk5ewjW7LJEcnuB494mAfm7z3ftq58M6zD4g7ipl5Z5M?=
 =?us-ascii?Q?OUZw3UwL8xRKekTJ6jc0arJSTZl6lv2UnEZBqTlzBQeVQMDDkM0JgwhIQAO+?=
 =?us-ascii?Q?Nl+Nuak+r/PEOdsqZs0Cd1OWYYHUYaa/5dbkr6qvHkwZ2h0IDRAKefys47Nf?=
 =?us-ascii?Q?j4lsgfx+iKhvIV/KAXoarxz2h8bOtAjX4TRIvdVPBL3FcH0XCTBpZh8XZONI?=
 =?us-ascii?Q?p0y15JJaIu5vrLV9/hE3mJD1mB3xWQQ8d63mR/ZGzfF/atxe1kv5btJ+gRhp?=
 =?us-ascii?Q?S7+16OqZGfZvUbeUksdqUopgGLEJOWEZNcuErf3F2zt8H7X3wY02mLgVnE9b?=
 =?us-ascii?Q?1gxsy3iQIP/R5wR+d1ZIcZeNpwXefqRSzWZk+rQrydfcPmrHBkRecduIIO+I?=
 =?us-ascii?Q?cGLZyagVxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f9Yc0Fc9zgdW8b2OuMXnDI/aDGsj6+L2itFNYVM+/Cgnk3jgFxfH5STpiC5UuaOBoBy+6lhdcA7tOGN76ueYiKKCsXzxkiwa+YRbv4UTPSYQcT2IQhPD4ffBJh1NPi6aMcXtX8eatX+hDV1QZ3Qw90Zh/VNeWXAMJklOaJr3MKuVREC9TWi4dqDyEeRnS7tKZ7LyFPbNzUVDhVoUM/hU5OPSd5vnwgWKC4iDO6uEwSAf90/iw8gE65yCit/ZtAG5nFoFf+3gpEyqcgf9gbFj1KtSMgQ/kuvmPxyW2rzNHxM3hgxdTFNP0Rq8vGeHiPxVi+pi0XryQH+2wuwf/RKJ9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31bfa0a-47aa-418b-9d20-08df0ca54a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 06:00:16.9354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUHgR/YalrLdjn5aKLxe3tOGQAjKZ7J7rhipxIM2t0EaXPEFMLjidivgxne7A6kITfZC+dEvcAHL4RLrNiSa0nGxkCcL9+/ebXJuvm5LoiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB458385
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 02 September 2026 20:20
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Add multi_queue_active_lrca debugfs
>=20
> Add a per-GT debugfs file, multi_queue_active_lrca, that prints, for ever=
y
> engine supporting multi-queue, the currently active queue ID
> (CSMQDEBUG) and the LRCA of the exec queue occupying that slot within the
> running multi-queue group.
>=20
> RING_CURRENT_LRCA only reports the primary queue's LRCA for the group
> and does not update to reflect the active queue in multi-queue mode, whic=
h
> makes it hard to tell which queue is actually running when debugging mult=
i-
> queue CSB/context-switch issues. Resolve the active LRCA by matching the
> primary LRCA against each queue's group and picking the queue at the
> reported active_id position.

Does it practically verified :
cat /sys/kernel/debug/dri/<n>/gt0/multi_queue_active_lrca

verified active_queue_id and active_lcra matches for queue running/switchin=
g context?

>=20
> Bspec: 60321, 73976
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 48 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c | 59
> ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.h |  5 +++
>  3 files changed, 112 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 361a70234d1f..6efbee06a642 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -13,11 +13,13 @@
>  #include <drm/drm_managed.h>
>  #include <linux/math.h>
>=20
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_guc_submit.h"

Wrong placement

>  #include "xe_gt_idle.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
> @@ -130,6 +132,50 @@ static int hw_engines(struct xe_gt *gt, struct
> drm_printer *p)
>  	return 0;
>  }
>=20
> +static int multi_queue_active_lrca(struct xe_gt *gt, struct drm_printer
> +*p) {
> +	struct xe_guc *guc =3D &gt->uc.guc;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u32 cur_lrca, active_id, lrca;
> +		unsigned int fw_ref;
> +
> +		if (!xe_gt_supports_multi_queue(gt, hwe->class))
> +			continue;
> +
> +		/*
> +		 * Forcewake is dropped before
> xe_guc_submit_active_multi_queue_lrca()
> +		 * below, which takes guc->submission_state.lock, to avoid
> holding a
> +		 * GT forcewake ref across a mutex acquired elsewhere in the
> opposite
> +		 * order.
> +		 */
> +		fw_ref =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref,
> XE_FORCEWAKE_ALL)) {
> +			drm_printf(p, "%s\tforcewake failed, skipping\n",
> hwe->name);
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			continue;
> +		}
> +
> +		cur_lrca =3D xe_mmio_read32(&gt->mmio,
> +					  RING_CURRENT_LRCA(hwe-
> >mmio_base));
> +		active_id =3D
> REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
> +					  xe_mmio_read32(&gt->mmio,
> +
> RING_CSMQDEBUG(hwe->mmio_base)));

Xe_lrc.c has u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe) =
API which can be used. I know its oneline only but may be centric change wh=
enever some changes happens to register def here. So reuse that?

> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +		lrca =3D xe_guc_submit_active_multi_queue_lrca(guc, hwe,
> cur_lrca,
> +							     active_id);
> +
> +		drm_printf(p, "%s\tactive_queue_id %u\tcurrent_lrca
> 0x%08x\tactive_lrca 0x%08x\n",
> +			   hwe->name, active_id, cur_lrca, lrca);
> +	}
> +
> +	return 0;
> +}
> +
>  static int steering(struct xe_gt *gt, struct drm_printer *p)  {
>  	xe_gt_mcr_steering_dump(gt, p);
> @@ -248,6 +294,8 @@ static const struct drm_info_list
> vf_safe_debugfs_list[] =3D {
>  /* everything else should be added here */  static const struct drm_info=
_list
> pf_only_debugfs_list[] =3D {
>  	{ "hw_engines", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> hw_engines },
> +	{ "multi_queue_active_lrca",
> +		.show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> multi_queue_active_lrca
> +},
>  	{ "mocs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_mocs_dump },

Move "multi_queue_active_lrca" here

Tejas
>  	{ "pat", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_pat_dump },
>  	{ "powergate_info", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_gt_idle_pg_print }, diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..1d9b55909504 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3853,6 +3853,65 @@ bool xe_guc_has_registered_mlrc_queues(struct
> xe_guc *guc)
>  	return false;
>  }
>=20
> +/**
> + * xe_guc_submit_active_multi_queue_lrca() - Resolve the LRCA of the
> +active
> + * queue in the multi-queue group currently running on an engine.
> + * @guc: the &xe_guc managing the exec queues
> + * @hwe: the &xe_hw_engine whose active queue is being resolved
> + * @cur_lrca: value read from RING_CURRENT_LRCA, identifies the running
> +group
> + * @active_id: current Active Queue ID read from CSMQDEBUG (position in
> +group)
> + *
> + * The running group is identified by matching @cur_lrca against the
> +group's
> + * primary LRCA; @active_id then selects the active queue within that gr=
oup.
> + *
> + * Return: the LRCA of the active queue, or 0 if no matching queue is fo=
und.
> + */
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	u32 lrca =3D 0;
> +
> +	/*
> +	 * submission_state.lock also protects exec_queue teardown: an exec
> +	 * queue is removed from exec_queue_lookup before its
> group/primary
> +	 * are freed, so any q found in the xarray below has a live group
> +	 * and primary for as long as we hold the lock.
> +	 */
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_exec_queue_group *group =3D q->multi_queue.group;
> +
> +		if (!q->multi_queue.valid || !group || !group->primary)
> +			continue;
> +		/*
> +		 * Multi-queue exec queues are bound to a hw engine class;
> +		 * GuC dynamically schedules them onto one of the class's
> +		 * physical instances, so there is no fixed queue-to-instance
> +		 * mapping to filter on here.
> +		 */
> +		if (q->class !=3D hwe->class)
> +			continue;
> +		if (q->multi_queue.pos !=3D active_id)
> +			continue;
> +		/*
> +		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
> +		 * bits reported by RING_CURRENT_LRCA are not meaningful,
> so
> +		 * only compare bits [31:12].
> +		 */
> +		if ((xe_lrc_ggtt_addr(group->primary->lrc[0]) ^ cur_lrca) &
> GENMASK(31, 12))
> +			continue;
> +
> +		lrca =3D xe_lrc_ggtt_addr(q->lrc[0]);
> +		break;
> +	}
> +
> +	return lrca;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index ccade320dc69..29abf07d8f04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
> +struct xe_hw_engine;
>=20
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);  int
> xe_guc_submit_enable(struct xe_guc *guc); @@ -55,6 +56,10 @@ void
> xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>=20
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>=20
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>=20
>  #endif
> --
> 2.43.0

