Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87FCC04A6A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 07:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E6410E3A8;
	Tue, 25 Jul 2023 07:30:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A377610E3A8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690270200; x=1721806200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EFwR08Z6AKUuRgF+VJygCIY5rUxJ31lb/lZVEOn/dK0=;
 b=f034rjScJbuqKrPsmqTYWaNntoBW8t1qgQgvi1e0rwLZUZqvkljor352
 M/CXERJoY1SqScyPRF8eUchoEIy1WdMB3sPEZgTn0Pl06yu+gDGjm7+p0
 Z4oXc9LvIGs5bXHleJxR1FTtqEm0BPskgh4+/Z9P9zb6UenCPhReY0JJ/
 HgqNmkh2Xuuplz6idZPuqlu7dRj4xFda5kTjxNswi3zDzk+jUQ+i2Whm1
 ZuEQiK3l0LpBXjJjrYbJe3LjI6yh9fOwbYE/Z07DmzG9rb79+mLxefV5n
 AZz5VmOLcq/zejBgtQNcEgabPk9RO25lQ/gNGntblCyxIYhEqlKHEnDyw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357645816"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="357645816"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 00:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="816162638"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="816162638"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 00:29:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 00:29:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 00:29:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 00:29:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 00:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzlEYk7M4JlMIGSyQgwCXeTyy06wPonkFohAs46AZvSiR8bJ8v//PI/Mo/i41w4G62fT9abQHOpF6aMSOxyG5vseDoxjutdWK1oPb6G2mj2dV1hnToUckJ1xTScN4cSNKPfXXSaovM6YLxWXIv6vCNULvfP39S/1XDThvkqawKv29gSX39BubA1dgqzqB73ViMmWlSgihRPVp4uqS59mkkM2YuCyVXsaygx7sMLrnm2IkqMoDrx93Zw8v+4KjMCJceJ1hy0OfSRkDpvxJMt57jLldX81391fbUWKbU2AfGrBnWICNbYlAkwES+yMvwUBf58PBL+zJFNViIe24ixKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgvdXHpkpDt4lvruT7fduaZZmOrgJaGjZWfxzVAoX8k=;
 b=b9YuRimmrNtV/fgxpRnoqul9JpMcul42neoxcb6gCgDTVdFeV5giXQP3nhny7y8ldrT3aXcrSB91O1/CPUpOYOzaxS8cF/Mn1RWOMkdpzEPQUFLbRawz+/xfDitjdV3LWNtfQqgvoANwwoRkdKEDkMU59BJdqgO2yTCBPiA5VhaAhpByat29WtV3MJWbmdQ7G0BKjhagt4oi5aRUcCi/cB+smekjP4/YFJ5YPq00s57/Pp4APGK8GeirCJPoVAPmbau9U6WcelRKDiWlEBLk8TPNGIR8V6aVfIwk1KsXROh/NaDV+HtEv1mgfOip84Z/u806IJEytjmWKKwKVkzknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 07:29:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:29:34 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V6 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
Thread-Index: AQHZvhL53uEK8S4Gk0e7IK8tsITTlq/JF94AgAD+gyA=
Date: Tue, 25 Jul 2023 07:29:34 +0000
Message-ID: <SJ1PR11MB62046F7025F6D266901386B18103A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230724094733.720266-1-tejas.upadhyay@intel.com>
 <20230724094733.720266-7-tejas.upadhyay@intel.com>
 <ZL6jimuSheIhllN5@nvishwa1-DESK>
In-Reply-To: <ZL6jimuSheIhllN5@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BN9PR11MB5353:EE_
x-ms-office365-filtering-correlation-id: 81f2392b-dda6-401f-2767-08db8ce0e4b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BECMO7Z2bYhDQ7OlzolDL4+FxEHOPFwEtdlReLRwKlhVdrLlBqOMTHF+x6lcqNYOzViGKYYK5EWYNhdWXgatcYHWENQ3LuhgRnMYtvBdzUGJ5TU0eM99J2L92688l5HRB3RTQMCFdPPCVWsfpnGJRtLQzIyaT3nDjjN/2kfmmPB0acjSRKjXVlfHe2B9Wh+sulGSqkDzw8gwvYMGH+upacBbg7kMVye57QgBDCIvjJJnpA9mL6DkSJ1t/kGAECOsa6PnaW/MRmyZtZcoQAY72dzIf3pi4EDXzs8QLIkAHxcvf+KjMEz2wMGTK01wQ8YLUE2IIw5LX6YJ3dLuHSXJD41oZm7dMeHX+8LQvDx+feTYWw2r8rlhbbmMZb+/d8BUGHl2MYljJOd/YMztj0gl+A0Bdpf4ub9+lJKFsOQM/5+G6wFKqxdecs/5K4pr70g++sykmOnsOH3mCyGlrBk2enzzpSxWwqUxqVmFLEibUj925Ze/zX+9gXvQIys/V8BFL9zgK3dkRwyFaIyg+wPvUEs+J628tiz/AfdDOlgdxxICrRFeduq8K3Mm7Vef/erUhEpdjJ+GETifzZB28yVBTLNPtReX96pSwbc5MU3Bv00omzQbRhABhgP0lkQOjNYR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(86362001)(38070700005)(33656002)(122000001)(55016003)(2906002)(478600001)(30864003)(19627235002)(82960400001)(38100700002)(26005)(186003)(6506007)(53546011)(71200400001)(8676002)(41300700001)(6862004)(52536014)(9686003)(7696005)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(6636002)(76116006)(8936002)(83380400001)(4326008)(316002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2gfWfrQIh3hfHS/ep3l3CT90YFE6ady7IhkWjy0KWhLyB7vSbWVQW9Lbq+Q?=
 =?us-ascii?Q?Cq7M/JILxb9CvG0SrHqFbGyoSqyCqVBL3l8zkVSLi0Vh36ySxuAOUXaqdNxK?=
 =?us-ascii?Q?ebYZAUolLyDLelsmJTq5LfVXtVwJACIxGPdz1WzhcnTKaRE7/rUgrgcObrvk?=
 =?us-ascii?Q?J6YtP6EjvK+tNecNO3+6sMkmHaGhIdrF4Y5pxScLgJc/ivrHYAJcwFTDhsRG?=
 =?us-ascii?Q?ZF2gQF5jzd872sqUEInTleIQ+oAlAcQNy3UBGKIwlU350+89UkN0Njgv5Mvo?=
 =?us-ascii?Q?WIrzJVfJBdNwu/FmvDzWsjjf/VZV31y/wjPdzTPKrtRoHK9x+NMYKel1tTht?=
 =?us-ascii?Q?oyxw0uFOaon+9Y9T3BaaLcsJJZIZ3xoGWEWkeueKU+R5arZWdSE3UpHcMPNC?=
 =?us-ascii?Q?bYpWmSJJRMyXIgan+q5seJU1s0i7EdQns4x4LrUyJyWOEWzePxVHeUIG1OCc?=
 =?us-ascii?Q?dLpX1/gUxmku00IlyGoWOIcJuPtxxxKivnjgccE0emV0JeSoiB13XM7mzbQo?=
 =?us-ascii?Q?HjoK8+uvPebRK/tzDoof58qKihnWMyhacIhnB3sBNu5xW2KRPZQVDOEFN/EM?=
 =?us-ascii?Q?4ZAviVB1gPRKOvjwwiUX8ElKD2U+1MD2hCmAeDkCoZki3Pty51SNEDjlwZyn?=
 =?us-ascii?Q?rknYLMFIpmJIg5TPHGXgSNV0ty+GbJRrCpjaOuyYAt212ATjnz8QLF5FIDwB?=
 =?us-ascii?Q?5akXWJ3CJv8eLfGV5yAYqUHIq7kwWERKNYCo4JnJF+YYqzzYsVg5I7hS0lBw?=
 =?us-ascii?Q?CG4/ewt5JcPhEdMLd74VFy6g2Skr9RzbDuhIZWZTZ8VKRAUmAGN/eju0S02E?=
 =?us-ascii?Q?/rBySpnY2HExc+ApyheWBRirtNe8U3Ajvmu9RIgNYB80bWZHyNegLXqdWmMN?=
 =?us-ascii?Q?HcKiX/jf9jl0D1QENge2IXWtzPOqjYbjBz1l0GehmLx2c1w59KJ1uhC76DoN?=
 =?us-ascii?Q?sAJqzsero5FscSTWg+5Fb13vQY6onTtVWlG+qqWiID9YHTqLHbT33tSl2iv+?=
 =?us-ascii?Q?gJncA4G0kmSpwG6omgudQJlh+DdIxCvbiRIf7ZL7nwhdZQYkaDrP8BseUOBA?=
 =?us-ascii?Q?mL4G6urew5vOOBvljIV49yay2/urdcCv04cfcBUCdnS+c1qGcQTBB0HbVEqu?=
 =?us-ascii?Q?FdzjSAm+gL7AjR2gf2MEPcys64lotDuXFqwuuC8dvm52IvhI0E5jDugbSzcg?=
 =?us-ascii?Q?Y5lc1bcWR0TciNaWHyQyyaCw7epKl8jsFCXm20xssjHYCnK1tLiHolbuqXD+?=
 =?us-ascii?Q?cxBt1PgTfOu8MtHKnw05V+oy/+IVu2E/WqD4VhsRur63dJvz5BcBOAgB/q20?=
 =?us-ascii?Q?3Ml9mxuJMYJIzxGHGKOFTa0H1w9LtRsc/Z72Jvbt8s2WPvz0xqsqqAg3JVs+?=
 =?us-ascii?Q?ykqmZUXPXr6tfUyScq8enVKbYox1eCzDt5WYAn6mcTnAcCZHe9vMSUBKBens?=
 =?us-ascii?Q?pgDmo6c7PO9Mdm0L9GlZKYBWvlmcwJME4xYAaer9mv+xyplfLDSl8SjfOEIi?=
 =?us-ascii?Q?RxZDXUz1xRjTA7J5x4qzX46e5az/1ZX3Oe2V6W/cDCuhxrjWNbJFM5DUX9Ye?=
 =?us-ascii?Q?qwUwlMvh3Z76MaogmDRd0EoJOeuWVYxTVNZl3Kf4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f2392b-dda6-401f-2767-08db8ce0e4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 07:29:34.0332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IE1G7v53zNeA9rH3qSLoYucd8EYjmLqYwVnKl+hLdiVGCNzfJxqxJJHOtDtkzVaCsxBkPpjaREe90r5XQ8opaxe7WCw4RhABARBIA/DIyPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V6 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Monday, July 24, 2023 9:45 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V6 6/6] drm/xe: Add min/max cap for engine
> scheduler properties
>=20
> On Mon, Jul 24, 2023 at 03:17:33PM +0530, Tejas Upadhyay wrote:
> >Add sysfs entries for the min, max, and defaults for each of engine
> >scheduler controls for every hardware engine class.
> >
> >Non-elevated user IOCTLs to set these controls must be within the
> >min-max ranges of the sysfs entries, elevated user can set these
> >controls to any value. However, introduced compile time CONFIG min-max
> >values which restricts elevated user to be in compile time min-max
> >range if at all sysfs min/max are violated.
> >
> >Sysfs entries examples are,
> >DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> >job_timeout_min         preempt_timeout_max     preempt_timeout_us
> timeslice_duration_min
> >
> >DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> >.defaults/              job_timeout_min         preempt_timeout_max
> preempt_timeout_us      timeslice_duration_min
> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> >
> >V6 :
> >   - Rebase changes to reflect per engine class props interface - MattB
> >   - Use #if ENABLED - MattB
> >   - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> >V5 :
> >   - Rebase to resolve conflicts - CI
> >V4 :
> >   - Rebase
> >   - Update commit to reflect tile addition
> >   - Use XE_HW macro directly as they are already filtered
> >     for CONFIG checks - Niranjana
> >   - Add CONFIG for enable/disable min/max limitation
> >     on elevated user. Default is enable - Matt/Joonas
> >V3 :
> >   - Resolve CI hooks warning for kernel-doc
> >V2 :
> >   - Restric min/max setting to #define default min/max for
> >     elevated user - Himal
> >   - Remove unrelated changes from patch - Niranjana
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/Kconfig                 |   6 +
> > drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
> > drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
> > drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 381
> ++++++++++++++++++++-
> > drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   1 +
> > drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
> > drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
> > 7 files changed, 507 insertions(+), 6 deletions(-)  create mode 100644
> >drivers/gpu/drm/xe/Kconfig.profile
> >
> >diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> >index d44794f99338..0a4ea965645b 100644
> >--- a/drivers/gpu/drm/xe/Kconfig
> >+++ b/drivers/gpu/drm/xe/Kconfig
> >@@ -83,3 +83,9 @@ depends on DRM_XE
> > depends on EXPERT
> > source "drivers/gpu/drm/xe/Kconfig.debug"
> > endmenu
> >+
> >+menu "drm/xe Profile Guided Optimisation"
> >+	visible if EXPERT
> >+	depends on DRM_XE
> >+	source "drivers/gpu/drm/xe/Kconfig.profile"
> >+endmenu
> >diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> >b/drivers/gpu/drm/xe/Kconfig.profile
> >new file mode 100644
> >index 000000000000..e72f15ec4bf6
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/Kconfig.profile
> >@@ -0,0 +1,46 @@
> >+config DRM_XE_JOB_TIMEOUT_MAX
> >+       int "Default max job timeout (ms)"
> >+       default 10000 # milliseconds
> >+       help
> >+         Configures the default max job timeout after which job will
> >+         be forcefully taken away from scheduler.
> >+config DRM_XE_JOB_TIMEOUT_MIN
> >+       int "Default max job timeout (ms)"
> >+       default 1 # milliseconds
> >+       help
> >+         Configures the default min job timeout after which job will
> >+         be forcefully taken away from scheduler.
> >+config DRM_XE_TIMESLICE_MAX
> >+       int "Default max timeslice duration (us)"
> >+       default 10000000 # microseconds
> >+       help
> >+         Configures the default max timeslice duration between multiple
> >+         contexts by guc scheduling.
> >+config DRM_XE_TIMESLICE_MIN
> >+       int "Default min timeslice duration (us)"
> >+       default 1 # microseconds
> >+       help
> >+         Configures the default min timeslice duration between multiple
> >+         contexts by guc scheduling.
> >+config DRM_XE_PREEMPT_TIMEOUT_MAX
> >+       int "Default max  preempt timeout (us)"
> >+       default 10000000 # microseconds
> >+       help
> >+         Configures the default max preempt timeout after which context
> >+         will be forcefully taken away and higher priority context will
> >+         run.
> >+config DRM_XE_PREEMPT_TIMEOUT_MIN
> >+       int "Default min  preempt timeout (us)"
> >+       default 1 # microseconds
> >+       help
> >+         Configures the default min preempt timeout after which context
> >+         will be forcefully taken away and higher priority context will
> >+         run.
> >+config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> >+       bool "Default configuration of limitation on scheduler timeout"
> >+       default y
> >+       help
> >+	 Configures the enablement of limitation on scheduler timeout
> >+	 to apply to applicable user. For elevated user, all above MIN
> >+	 and MAX values will apply when this configuration is enable to
> >+	 apply limitation. By default limitation is applied.
> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >b/drivers/gpu/drm/xe/xe_engine.c index 19a7a05bbbc3..7efc3a239f4f
> >100644
> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >@@ -12,6 +12,7 @@
> > #include <drm/xe_drm.h>
> >
> > #include "xe_device.h"
> >+#include "xe_engine_class_sysfs.h"
> > #include "xe_gt.h"
> > #include "xe_hw_fence.h"
> > #include "xe_lrc.h"
> >@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device
> >*xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_dev=
ice
> *xe, struct xe_engine *e,
> > 				u64 value, bool create)
> > {
> >-	if (!capable(CAP_SYS_NICE))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     e->hwe->eclass-
> >sched_props.timeslice_min,
> >+				     e->hwe->eclass-
> >sched_props.timeslice_max))
> > 		return -EPERM;
> >
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EPERM;
>=20
> Hmm...probably -EINVAL is the right error code here?

Thanks, I think -EINVAL should also be fine, I will change it.

>=20
> >+#endif
> >+
> > 	return e->ops->set_timeslice(e, value); }
> >
> >@@ -201,8 +213,19 @@ static int engine_set_preemption_timeout(struct
> xe_device *xe,
> > 					 struct xe_engine *e, u64 value,
> > 					 bool create)
> > {
> >-	if (!capable(CAP_SYS_NICE))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     e->hwe->eclass-
> >sched_props.preempt_timeout_min,
> >+				     e->hwe->eclass-
> >sched_props.preempt_timeout_max))
> >+		return -EPERM;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > 		return -EPERM;
> >+#endif
> >
> > 	return e->ops->set_preempt_timeout(e, value);  } @@ -269,8
> +292,19 @@
> >static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine=
 *e,
> > 	if (XE_IOCTL_DBG(xe, !create))
> > 		return -EINVAL;
> >
> >-	if (!capable(CAP_SYS_NICE))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     e->hwe->eclass-
> >sched_props.job_timeout_min,
> >+				     e->hwe->eclass-
> >sched_props.job_timeout_max))
> >+		return -EPERM;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > 		return -EPERM;
> >+#endif
> >
> > 	return e->ops->set_job_timeout(e, value);  } diff --git
> >a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >index 8e0021cdb10d..3dc9922cb3c4 100644
> >--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >@@ -11,6 +11,11 @@
> >
> > static int xe_add_engine_class_defaults(struct kobject *parent);
> >
> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> >+	return timeout >=3D min && timeout <=3D max; }
> >+
> > static void kobj_xe_engine_release(struct kobject *kobj)  {
> > 	kfree(kobj);
> >@@ -39,6 +44,90 @@ kobj_xe_engine(struct kobject *parent, char *name)
> > 	return khwe;
> > }
> >
> >+static ssize_t job_timeout_max_store(struct kobject *kobj,
> >+				     struct kobj_attribute *attr,
> >+				     const char *buf, size_t count) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 timeout;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &timeout);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
>=20
> NIT...here and in other places, would below format be better?

Below is good suggestion, it will limit duplication code atleast 90%. I wil=
l add this.

>=20
> static bool enforce_schedule_limit()
> {
> #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>       return true;
> #else
>       return !capable(CAP_SYS_NICE);
> #endif
> }
>=20
>       if (enforce_schedule_limit() &&
>           !engine_timeout_in_range(timeout,
>                                    XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>                                    XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>            return -EINVAL;
>=20
> Avoids some code duplication.
>=20
> >+	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_max,
> timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t job_timeout_max_show(struct kobject *kobj,
> >+				    struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->sched_props.job_timeout_max);
> >+}
> >+
> >+static struct kobj_attribute job_timeout_max_attr =3D
> >+__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> >+job_timeout_max_store);
> >+
> >+static ssize_t job_timeout_min_store(struct kobject *kobj,
> >+				     struct kobj_attribute *attr,
> >+				     const char *buf, size_t count) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 timeout;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &timeout);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_min,
> timeout);
> >+
>=20
> How are we ensuring job_timeout_max > job_timeout_min?
> Or, we simply allow it as the range check will fail during actual sched_p=
rop
> setting?

Yes validation of timeout totally depends on range is what I thought to sim=
plify validation.

Thanks,
Tejas
>=20
> Niranjana
>=20
> >+	return count;
> >+}
> >+
> >+static ssize_t job_timeout_min_show(struct kobject *kobj,
> >+				    struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->sched_props.job_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute job_timeout_min_attr =3D
> >+__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> >+job_timeout_min_store);
> >+
> > static ssize_t job_timeout_store(struct kobject *kobj,
> > 				 struct kobj_attribute *attr,
> > 				 const char *buf, size_t count)
> >@@ -51,8 +140,19 @@ static ssize_t job_timeout_store(struct kobject
> *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     hwe->eclass-
> >sched_props.job_timeout_min,
> >+				     hwe->eclass-
> >sched_props.job_timeout_max))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > 		return -EINVAL;
> >+#endif
> >
> > 	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_ms, timeout);
> >
> >@@ -81,6 +181,28 @@ static ssize_t job_timeout_default(struct kobject
> >*kobj,  static struct kobj_attribute job_timeout_def =3D
> >__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >
> >+static ssize_t job_timeout_min_default(struct kobject *kobj,
> >+				       struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass->defaults.job_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute job_timeout_min_def =3D
> >+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> >+
> >+static ssize_t job_timeout_max_default(struct kobject *kobj,
> >+				       struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass-
> >defaults.job_timeout_max);
> >+}
> >+
> >+static struct kobj_attribute job_timeout_max_def =3D
> >+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> >+
> > static ssize_t timeslice_duration_store(struct kobject *kobj,
> > 					struct kobj_attribute *attr,
> > 					const char *buf, size_t count)
> >@@ -93,14 +215,112 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     hwe->eclass->sched_props.timeslice_min,
> >+				     hwe->eclass-
> >sched_props.timeslice_max))
> > 		return -EINVAL;
> >
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> > 	WRITE_ONCE(hwe->eclass->sched_props.timeslice_us, duration);
> >
> > 	return count;
> > }
> >
> >+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> >+					    struct kobj_attribute *attr,
> >+					    const char *buf, size_t count) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 duration;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &duration);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->eclass->sched_props.timeslice_max, duration);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> >+		struct kobj_attribute *attr,
> >+		char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass-
> >sched_props.timeslice_max);
> >+}
> >+
> >+static struct kobj_attribute timeslice_duration_max_attr =3D
> >+	__ATTR(timeslice_duration_max, 0644,
> timeslice_duration_max_show,
> >+	       timeslice_duration_max_store);
> >+
> >+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> >+					    struct kobj_attribute *attr,
> >+					    const char *buf, size_t count) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 duration;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &duration);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->eclass->sched_props.timeslice_min, duration);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> >+					   struct kobj_attribute *attr, char
> *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass-
> >sched_props.timeslice_min);
> >+}
> >+
> >+static struct kobj_attribute timeslice_duration_min_attr =3D
> >+	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> >+	       timeslice_duration_min_store);
> >+
> > static ssize_t timeslice_duration_show(struct kobject *kobj,
> > 		struct kobj_attribute *attr, char *buf)  { @@ -124,6 +344,28
> @@
> >static ssize_t timeslice_default(struct kobject *kobj,  static struct
> >kobj_attribute timeslice_duration_def =3D  __ATTR(timeslice_duration_us,
> >0444, timeslice_default, NULL);
> >
> >+static ssize_t timeslice_min_default(struct kobject *kobj,
> >+				     struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass->defaults.timeslice_min);
> >+}
> >+
> >+static struct kobj_attribute timeslice_duration_min_def =3D
> >+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> >+
> >+static ssize_t timeslice_max_default(struct kobject *kobj,
> >+				     struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->eclass->defaults.timeslice_max);
> >+}
> >+
> >+static struct kobj_attribute timeslice_duration_max_def =3D
> >+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> >+
> > static ssize_t preempt_timeout_store(struct kobject *kobj,
> > 				     struct kobj_attribute *attr,
> > 				     const char *buf, size_t count) @@ -136,8
> +378,19 @@ static
> >ssize_t preempt_timeout_store(struct kobject *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     hwe->eclass-
> >sched_props.preempt_timeout_min,
> >+				     hwe->eclass-
> >sched_props.preempt_timeout_max))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > 		return -EINVAL;
> >+#endif
> >
> > 	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_us,
> timeout);
> >
> >@@ -167,17 +420,139 @@ static ssize_t preempt_timeout_default(struct
> >kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> >__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >
> >+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> >+					   struct kobj_attribute *attr,
> >+					   char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->defaults.preempt_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_min_def =3D
> >+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> NULL);
> >+
> >+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> >+					   struct kobj_attribute *attr,
> >+					   char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->defaults.preempt_timeout_max);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_max_def =3D
> >+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> NULL);
> >+
> >+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> >+					 struct kobj_attribute *attr,
> >+					 const char *buf, size_t count)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 timeout;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &timeout);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_max,
> timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> >+					struct kobj_attribute *attr, char *buf)
> {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->sched_props.preempt_timeout_max);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_max_attr =3D
> >+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> >+	       preempt_timeout_max_store);
> >+
> >+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> >+					 struct kobj_attribute *attr,
> >+					 const char *buf, size_t count)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+	u32 timeout;
> >+	int err;
> >+
> >+	err =3D kstrtou32(buf, 0, &timeout);
> >+	if (err)
> >+		return err;
> >+
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+
> >+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_min,
> timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> >+					struct kobj_attribute *attr, char *buf)
> {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n",
> >+hwe->eclass->sched_props.preempt_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_min_attr =3D
> >+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> >+	       preempt_timeout_min_store);
> >+
> > static const struct attribute *defaults[] =3D {
> > 	&job_timeout_def.attr,
> >+	&job_timeout_min_def.attr,
> >+	&job_timeout_max_def.attr,
> > 	&timeslice_duration_def.attr,
> >+	&timeslice_duration_min_def.attr,
> >+	&timeslice_duration_max_def.attr,
> > 	&preempt_timeout_def.attr,
> >+	&preempt_timeout_min_def.attr,
> >+	&preempt_timeout_max_def.attr,
> > 	NULL
> > };
> >
> > static const struct attribute *files[] =3D {
> > 	&job_timeout_attr.attr,
> >+	&job_timeout_min_attr.attr,
> >+	&job_timeout_max_attr.attr,
> > 	&timeslice_duration_attr.attr,
> >+	&timeslice_duration_min_attr.attr,
> >+	&timeslice_duration_max_attr.attr,
> > 	&preempt_timeout_attr.attr,
> >+	&preempt_timeout_min_attr.attr,
> >+	&preempt_timeout_max_attr.attr,
> > 	NULL
> > };
> >
> >diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >index 492a84a22c30..7b4ae8b726a3 100644
> >--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >@@ -10,6 +10,7 @@
> >
> > #define MAX_ENGINE_CLASS_NAME_LEN    16
> > int xe_engine_class_sysfs_init(struct xe_gt *gt);
> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >
> > /**
> >  * struct kobj_hwe - A hwe's kobject struct that connects the kobject
> >and the diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >index 96c32a815c90..06a98ea9800b 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >@@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt,
> >struct xe_hw_engine *hwe,
> >
> > 	if (!gt->eclass[hwe->class].init_done) {
> > 		gt->eclass[hwe->class].sched_props.job_timeout_ms =3D HZ *
> 5;
> >+		gt->eclass[hwe->class].sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> >+		gt->eclass[hwe->class].sched_props.job_timeout_max =3D
> >+XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > 		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1 * 1000;
> >+		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> >+		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> >+XE_HW_ENGINE_TIMESLICE_MAX;
> > 		gt->eclass[hwe->class].sched_props.preempt_timeout_us =3D
> 640 * 1000;
> >+		gt->eclass[hwe->class].sched_props.preempt_timeout_min =3D
> >+
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> >+		gt->eclass[hwe->class].sched_props.preempt_timeout_max =3D
> >+
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > 		/* Record default props */
> > 		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> >class].sched_props;
> > 		gt->eclass[hwe->class].init_done =3D true; diff --git
> >a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> >index 7eca9d53c7b1..3d37d6d44261 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine.h
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> >@@ -10,6 +10,37 @@
> >
> > struct drm_printer;
> >
> >+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> >+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
> CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> >+#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> XE_HW_ENGINE_JOB_TIMEOUT_MAX
> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> >+XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> >+CONFIG_DRM_XE_TIMESLICE_MIN #define
> XE_HW_ENGINE_TIMESLICE_MIN
> >+CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> XE_HW_ENGINE_TIMESLICE_MIN 1
> >+#endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> >+XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> #else #define
> >+XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> >+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> >+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> >+
> > int xe_hw_engines_init_early(struct xe_gt *gt);  int
> >xe_hw_engines_init(struct xe_gt *gt);  void
> >xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> >--
> >2.25.1
> >
