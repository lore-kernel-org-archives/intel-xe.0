Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB915E81E1E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B43C10E553;
	Fri,  6 Oct 2023 17:30:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665AD10E553
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696613429; x=1728149429;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LftRUyJvivjojBOVIdJuSClGPybLQAqWfbA3Lp3me+M=;
 b=ObCY03wWK90LGvQr6CqExQtCFJBNHGLKqkPzfi6eKulUouLVKftLd6zX
 drnpILTltkXYONbBiNrDQ6lHluzrQa+/MD00+ooDuVopL2aA9VfU5ngrJ
 Hon/3HF16wk7vyobgaBaOyvTbdICc9XEeNbfGG8LIo/Zy+46yI2zQ+9xO
 LlQJvAf4jmIocXLbaQ5RMNPfsva/6Y7HGuTFfMNzqVaDnQeiwrfWBNpvd
 rLR6M8xvQRTax/FtNfeJYx9ETV1e37rU0vyZDRmcyNPduyNVZaqK8FA3t
 t9v8EgGzeiFgEdiqvu4pgiyIxZ7rf6WGyXvnLjCLfiJvEqeDpZiCAwOYY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386620060"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="386620060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="895967817"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="895967817"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:28:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:30:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:30:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:30:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjhR4ImdKpIOHdDLKTtEJxm/iS6U5LfQalRl9aQHaCugUbh1tsF2N2R7WRzOCrwh5LH/VuS9yg8FWZsQmwNk/StqcarWmz1x+1Tqx02NzrUdT2Oc9stV4SKBPZAn2IOT8Kd1AZ0KSmBgapzFeqpsqDYcR1pHx2q4N0KKOTg3jR9IMvtXr/Lrw76W61c8tm+Nfele2aJ54IGYJ51GyJPloAgit6x1doqmOXeV49RvO127Ro0vJtOHBB8vtDd1wAIIyJfF46e9oUNfqOxUIBcURyGba2TVPxhijS7vtbPWHjXdiKw4tAzhNbwRx4rvdw5B6i0BCvQYwpQpAs4013Prqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2fOWU2e9YLGo8EKLQfVtT225lDKf9Iehmpz0GmWa3o=;
 b=ltCN6bVkePSm5clegf4Qd2yXSgWiXtvAa4J+OsRkQ5tITRKIiamsZUF6AI9WmqRbUcAF5dklaNgs52NQeA4vyPA9tQOk9gBB2oFyf28TMUrGTdcq0YPOvT+2FmdI553xj1bcqQXkN2pP3eCNoYM0MTs8xjyr0MN3XwwYoR7SetgXnKcLWeaZbRiamuJJ0S2M6z8mmo4XhWxZbprVoE33V4ZvN4sWnoMOpwKt4WBB2CMYN7mjV+7F28JO8eYbUIaJzvC5IOjSrAgVh++mwP+v00aEguq6iqTH58P4Ut92v7qM2A/+9ihLyWfk4QYf029x7VueNYbFY52za/0F2YE35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 17:30:22 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:30:22 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v4 3/3] drm/xe/display: Don't try to use vram
 if not available
Thread-Index: AQHZ+Ft/ISUmuHBAO0i7OaB4mBYIorA9BLMQ
Date: Fri, 6 Oct 2023 17:30:21 +0000
Message-ID: <IA1PR11MB64180D3D13402C2884E87854C1C9A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
 <20231006134540.332716-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231006134540.332716-4-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB5661:EE_
x-ms-office365-filtering-correlation-id: 867a4efc-d8c7-428e-8811-08dbc691eaf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yblUNqgwMvmbK0/3s7gnD1KdqsdUtb0HnOnN/OGeBxh+wB9ZLkWgaY5KcgOjM8JqJ+//mYRpyD5FsXhCo2ghlMkV5VrcafCDzJkWDSAHN6utsAd4wVjNM24z+d+r1QSVNheU9G+kr9xxK0XwI9JUiCi4cnR8f/Ru3rm2a3S3ROhY1E1qhiZDqXVEBZldC7rLvKwfi8Pkm1TkxgI4ocV2q/A2c32pl0FspesNLUD5EiZlG5TZreoXjb3dr/qFLtYK5m7SS3nD9Wrq0+sCwdyT/ITjovf1/KI5NyclfRPeU6hvoqKoC+wqUCwz40ppTSPSiavMgSGicwltkgP5ItTnLTmb5Sjk6OdJB5IJGTWP3FsZEwCWruPCfimj7ZqaYwwqCixDotj1NleQHMB5K6gWFojUZinO0V+FNsvAzJni5RllFpFTY9WjOUBwpfehfYHRFhb/7xHe2k1yf0oBHru4Mb7mbG/Bre+y0ddQBmr7MDWAECSMQUWE50Hc01QV0a0BLBjwOkiNUWe08Y9Y9G77RqUH/6KYp7MhZN3oJF+waDCaDAZA8DUsfJHzyas43vB21wAFnJqmheawW/doNM70ZFrVdJRL1Stvpg6XR7qoa2sXz6pB1hEMt8JQAI3uJnTz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66556008)(66476007)(316002)(66446008)(64756008)(66946007)(41300700001)(33656002)(9686003)(71200400001)(122000001)(26005)(7696005)(6506007)(38100700002)(38070700005)(83380400001)(82960400001)(478600001)(86362001)(76116006)(110136005)(55016003)(2906002)(8676002)(8936002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V2i0qnzOQfP2K781jOYyzq8pm0FH+GQs79hVLba0GovT3M1pKy2V5oSaY7Qf?=
 =?us-ascii?Q?I8v2JWFYE0/58M3BkB0o7WTI1Ht1MN6Iw8oiAVqxy4Sg43YN6gqrS9+rmiSE?=
 =?us-ascii?Q?poF4gfwk7GutZtOlbf6T5cE4WTanKnQQhpQTaUSd34kEgcAsICLF1n7Z8+Nq?=
 =?us-ascii?Q?Wd8Qd8EKjh995HRsmlpG0Jkf8yIsBWQM1rDP/Bw2WXnS5Rp0yDpZI+Wq0BZR?=
 =?us-ascii?Q?FBTW/jJGuZOCu9qf5euXpGko83lL6OFVXcHwiAtkw0WQ5c3XQXe+eHAFiZcs?=
 =?us-ascii?Q?rlfozy6oO7MiJullSUWGP7ydvM9XBhuDslvhA9J0+S3F+E0hk47HIG0vBHTp?=
 =?us-ascii?Q?fiBl++b3uBadEKpXOzz/KjCkxinwVed/OqJRL5NFpg6QiTGyGrYdD8X0bSK8?=
 =?us-ascii?Q?6zQALW2eJx1QC9GjtA+SyGX7xHELVyEhSGYWxUqvB6+wE+ZJIQiGV8rqLAk4?=
 =?us-ascii?Q?kH48XWGADe2n+sgIA6ZVFsqob5i0qMUWP5NPzOrrH3hpBTT3CwwzUrWvgCgQ?=
 =?us-ascii?Q?QGQKMZsw5iyq9sAnTl3aywbYDWI80FSw5walfVAJ5IrIpfN5dpUH7ZRosq4v?=
 =?us-ascii?Q?rnKKy5avi7huOSk8A8Vq+Vrk+e2VVAyvYsPBwB+EiX536ghBQ3SskHG3FALF?=
 =?us-ascii?Q?SyKWX8YWM+VXIxes+jSqD5YCNiEjg0l+sc1cN0e8M9L2fLm3srULXEhJACYX?=
 =?us-ascii?Q?3KBIJiwUdK1M0jBHSQyZRXWyTP4VVwsfDEhrNGr7UTtsPUYAEDTrNUorduLs?=
 =?us-ascii?Q?Jqobb6yyf5kAYUXiKK16uPNe2j2i/i771TDulNpZbVGQb9/RJTURx7A62sK+?=
 =?us-ascii?Q?zeDEHgyT7Jo/M+kWw5tQCVrB5EPtB2x/W30NSsQKgn/14P1Lgw15kCvR4OyS?=
 =?us-ascii?Q?z9mM13CS7etsurMwFD4JMWyY/fw3oHI1J3LitvQYZ2NqiIR2a2oXC/mQ+mY/?=
 =?us-ascii?Q?X324+yH765rIOVEtmkuJn228qcr6LD3sqI9GhKG1BMyQSpgme3z51GPB2zY8?=
 =?us-ascii?Q?oKsA34QlnJc/PLhyme7+S5v1GGylw/WX7RE5kT1q8zeOykmDd+TAw19WoC4e?=
 =?us-ascii?Q?xXrnsXUZh+Kirm7g0o428jryWOCcSy1sHaP5nFS/kcEONQSwlybgupMsNt3I?=
 =?us-ascii?Q?azvhTJcowzOJoy/7DrsozN88dLxdzurb91W0UenJ/9HLyQirlZC17x6qLFTs?=
 =?us-ascii?Q?oKaovPPSnBTaH/v124PQw/AnV0S/MrlMEGJ6iLxjb60gySm3tuHqeE4b7p+u?=
 =?us-ascii?Q?ssPSkEaPeWwH3hTGJLy9l4KdJ5i04eA8tKq53G5oGTAcITfFPzgbGYWrtFod?=
 =?us-ascii?Q?gpQufaOw4thPwsTIyvrknCnjETmGNjfQysFnc8lPIn6wxZ9TRgq42UAr5avx?=
 =?us-ascii?Q?9Ds5hYKycs5aqqDe4GgBZ7Gw7FfybewagFUxWc/o+lgBCiJbPRAcCPET8Qoq?=
 =?us-ascii?Q?2Z0Q+DZ6CsGRq6bZn1RLLatqyuwS2IMXrk5NKZdonUl2/xEKhX3VvGUI817T?=
 =?us-ascii?Q?/TvwWHvyPg0IebFWA+awmlHII0QGNJA+UraJI07AUIiQ5lUDuqaMlCmmcQC7?=
 =?us-ascii?Q?p6Ur7LaZ7Ya+f/g+25c4KcINhBSgpCaU5zkDd60/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867a4efc-d8c7-428e-8811-08dbc691eaf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:30:21.7104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QSMKC0AZOHhNpg4QMBo6tKQMLO25DBo/c3FMz8dwiYaMgxBDMfvivJcsSBTN3QJTqVTLoxdl8x6EIGNTMHsbYjEyqQHVX4tTOk+BqPNMns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/3] drm/xe/display: Don't try to use vram
 if not available
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



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-
>Pekka Heikkila
>Sent: Friday, October 6, 2023 9:46 AM
>To: intel-xe@lists.freedesktop.org
>Subject: [Intel-xe] [PATCH v4 3/3] drm/xe/display: Don't try to use vram i=
f not
>available
>
>Trying to get bo from vram when vram not available will cause
>WARN_ON() hence avoid touching vram if not available.

Looks reasonable.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index e8e38091c8e6..c46fee304f92 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -96,11 +96,12 @@ static int __xe_pin_fb_vma_dpt(struct
>intel_framebuffer *fb,
> 		dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> 				 XE_PAGE_SIZE);
>
>-	dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM0_BIT |
>-				  XE_BO_CREATE_GGTT_BIT);
>-	if (IS_ERR(dpt))
>+	if (tile0->mem.vram.usable_size)
>+		dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>+					   ttm_bo_type_kernel,
>+					   XE_BO_CREATE_VRAM0_BIT |
>+					   XE_BO_CREATE_GGTT_BIT);
>+	else
> 		dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_STOLEN_BIT |
>--
>2.25.1

