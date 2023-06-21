Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB66EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 05:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BE810E3AB;
	Wed, 21 Jun 2023 05:19:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B70A10E3AB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 05:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687324785; x=1718860785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hacW7vt6HF+vYCrGD4a8LYsTiIN4uR+itF/qiRRQ0MI=;
 b=QGpM/7fDIo97n7RimhVNO4ubysi+XKkNm5R2jeP/PFZM3sHqsqFXTPnV
 SAL4cJYTrfUfmB0mIozFPrfItZd5BjoTuh6ayeGYbtM2HkHUTZssdgGSM
 bgHFeK71jNLK0tmWFfdr+k7JtK7urAfgOuuA8Uozon4KXj/17tVVNDpr0
 YW9236zaTEGvsr6YGnWx86ZvHy2QYF4Ww02kMyrAaWSMpkDpIfRN3Q/P2
 nmvu8eX13RevS6l05VDBLGEI9f+C0KjO+LWxOnQv3jBf+Jcy8MVzIHBju
 dsAgLTtmbO18PX0shCuRIlbAWJUhbj4sKWF60CgewGd3bEn7+MOPAavvo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="360082288"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="360082288"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 22:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="1044561460"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="1044561460"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2023 22:19:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 22:19:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 22:19:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 22:19:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcMvD3q9TxUZJML4DNVNMxL8GDu4Ok8P793Xgk0b7RUEyVg49Ov04cY8/D0qKJiL7Atb8NwLlsMznEcxFGWha0szl5BA6kJt0kJ1+Ni/9SgtFCq7yPDlZtB/qbVLpIzjuOnaSTqPvFBZNaQjRQ93PEmliMzlPgaB4+O6YmhJWRsU7ft/KQGlknucLYtprjVWm6Sy8at4+WdWgseK6bE3C2pM97LekSRBnW9smQcRVoFjKU7o7m7/6KA7Ie8YbbkX+wSlpCNC+S0ZQE2I96B70Ev57bBAta/lC5WTcuGqu+rXAjjLXEBF6TngfJGV/cCeFuQQ+mHsR15HQ3JdrdiKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hC43bDn6UQf3Ta2trLm0RquWKgT8ED8wcpDwnQPM4vg=;
 b=IBLbKScpqqH5nL1AdOLsVhBG33vNVrVa1OZi+es2BCGytWbWCLKSllyuDH8HguDXiovCqEvtlxiQhHBbtEvKwkky+oIUj+2LQ5q+ajqS01cuRied1FKekV8ZUWlJWgVRI8wdB0+9EohqdLKkArJzI5BMj0wausKZCSflmRxkktKzYMcOJaohaJVdgRJKkSwhLOM/SEV9G8qDSs4hSg6SjNgnbME2OBqfqHqI2yd+aBLMiP0z9QV9aEXF00wGgZpmvxtcSXXkdwBtbr6fcjjXBvaUy8Rm7sOT8wSpE2EZq1LEqVqlX3vaZE+Lcw1yTXg3Qt2yP9+7CqbTLvMew3tz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 05:19:31 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 05:19:32 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZn5Opt7weKax8N0aPHY1M0eyYQq+N6tOAgAOkh2CAAxnlgIAAFtQQ
Date: Wed, 21 Jun 2023 05:19:32 +0000
Message-ID: <SJ1PR11MB6204FDDB84CCF235A241830F815DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
 <ZIzMbz7Jk0F0tpf6@nvishwa1-DESK>
 <DS7PR11MB6197189274A9EBB171F589B5815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
 <ZJJ0qfR/5JMDA2Sk@nvishwa1-DESK>
In-Reply-To: <ZJJ0qfR/5JMDA2Sk@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7879:EE_
x-ms-office365-filtering-correlation-id: af6802e6-0428-455f-c475-08db72171877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E7qEgRCAJf+z6i7czXoAXYamHJHfDB4IxYhpKLLxCBksLH5YH5qHLqETXLCNwtK5kvPu1uzeDV0Clr02o2IY6v9j1Q81E5Q6Lp3AF965mFbv/qzJJxMKKGrtSJ7jy12CujFkydqDua9etvlzTFn5zOybPowlQ1c6Ho9f67jhroum026VX2CQeyn9JXTZE8I/MjnqtXA5BSEl3LZvhz87d0piWrbZIQy+17r8+9Jcuar5M5ztmfOQBSgXI4Zwm3AudNp18+2LuRPM3u2G9FNjmBV7/dt8miCm3znjzmPYNg5Cu4nO3Lc5J/TBDAAn6i42wc6o6Z72ATW+ErBb1W+BSsb3385u06uoyblRBd1v2vON7Uu4TuqjHMb+SVWCIzbolME4kyuTB15t7O8pyvforlZ48+61AVydBYnHqiSLA2JvUszdV5H4aOEVPguJAjAKQuyhn5EBAEz/12NDkQO7Z89nocms0WWYjo72A7nUgzRS6eyX9cbaulwS3rs+rsDyLAvvy+z8MQ8Xg84oXbFmtdbi8hZAEPrlLo2UGNFLWQLeE0VAXytCQhB6aGjCTdWscE+1fiy5367Fyx93UBVfki2EWn4O+iHvIjik6eWXkSN2PFcFd6Nbb5nVXnhZz442
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(478600001)(7696005)(71200400001)(76116006)(54906003)(53546011)(9686003)(6506007)(26005)(107886003)(186003)(66946007)(2906002)(41300700001)(66556008)(66476007)(66446008)(64756008)(6636002)(4326008)(316002)(52536014)(5660300002)(8936002)(8676002)(6862004)(122000001)(82960400001)(38100700002)(86362001)(33656002)(38070700005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z0a61IDArP69Fm+MZjLREtwVGCbuXz94WndANJzGNw/70ZI+X0tzGulXhN0W?=
 =?us-ascii?Q?wiPeR0cAJjfhBOjUQb4EBsI+ApLxknl1zFD0B81glwkNh8+8YP11ace0pHDt?=
 =?us-ascii?Q?t/3je3T7Lun3jt71V5NpzlAJemzxmp8+O7fdvmzMXxNTC2sfhNgV2BneFa3g?=
 =?us-ascii?Q?+gBcL8m6enPbT/KHhLjx/WG7kQyxEyB+IRW9kL6T/tEKR2k6zqlMOBwWhm/a?=
 =?us-ascii?Q?cH7nAJbKsIdtrp/vdhPc0C146CkBTlD4K7g8V+GgFuZj2ifrCk7Y9asbxMYa?=
 =?us-ascii?Q?rEvK+I4kCbzMTq8jiJ5RkJaP55y+5me3I+Yel/dnyd2EXsFrmCrv1boslocJ?=
 =?us-ascii?Q?8wItAw2VWSfkVyYywH82uAJrfWlZ/WxH7VKRpMBHnQFFIcmT8bLE23cA2PE5?=
 =?us-ascii?Q?78zGllMnNHY6tfMCjMmHdFNsgXwDl27I4yXQdff3SW3JR3hoYBKqHje8fAE1?=
 =?us-ascii?Q?WnLDvol/XuOGm1oR+tQjhUgaoaSpHlhQgPXZM+eLypFTIfUQJ4tnLa/UGNLI?=
 =?us-ascii?Q?UJVXbQa/8nULegDXJzjfLDuampDrqht45tgQnGYfgqVezvroyiTwIgXjVtXh?=
 =?us-ascii?Q?E8SHeQ86ercGsLc4222uwkUPBZI2rez1tov427L1dBteS9Q3YN5FhsoctFbD?=
 =?us-ascii?Q?Um99lo9/dt2n1Zx1uW51VDDtSQkh8IMTWHLLLQpUITFP7NnyeHsmFY6KdI/q?=
 =?us-ascii?Q?jsYX9deocIvC98HIxjVsO1LocfidIMsLX2HvdLBX4Oavv1iwiIWhpdoa+3Nw?=
 =?us-ascii?Q?SUg8z/4l+/OGOaN0GHbTkIamtePyRiqyHjrhiuKVZFTPS21mAyJSC3tz7kOO?=
 =?us-ascii?Q?W5poBcIUAz5XwHTqYOzZh+sx9gPyOeEq+4nyadwHc/E1T3lAwxGDca5ftbam?=
 =?us-ascii?Q?u7Bt040Viu3T7a9HJ/7M3BZVRU8bye5OXvbtoUkJyGvGH90QqtjZxegFA49L?=
 =?us-ascii?Q?nWR3Ou+2MJlMUGRXpkqCLddrdCgWj7VbQed1sSoA74Nfl8xLtDK1Fz0tRjaz?=
 =?us-ascii?Q?2sX0laboz1rZUI0/ISAlmBuOLZW9/kTJcMB/fx3X8H0AkMeEPXbk+Z0ZB/Jr?=
 =?us-ascii?Q?9+h2EQ5j8nonk2IjW1Yz+/9peKSrqw5NuFY3FYviEHrs+oEH2Yf+DgGCdzuu?=
 =?us-ascii?Q?PcTq4gCGrQrpn7mmEhz2Bh3OjAsaUePxgYm6f/kapdI7kLlJONgplHEZCWge?=
 =?us-ascii?Q?fQphK7VUhUB8Zrt/z4yhJFdkBYu3HZa+nLivdJWis7kHlP3PSS9NWJEbIW9h?=
 =?us-ascii?Q?NH8I/73XoH3870Qp4+lwrRoFFar5y4LHXmpXvNX2HGge9jZBbFv+FZErE87K?=
 =?us-ascii?Q?WycZ+w2/WeF9au6npsQhQqUBMKNcH0TWcjqimZOEks9UVR9OVWeL4Awr2f8J?=
 =?us-ascii?Q?eLEcEXmn3ke2eM0zcpYi/9f88Ne6ah3bPDnM813q55LKIaezHDAJCB6ctdiG?=
 =?us-ascii?Q?vvWDEL8PuenQY51ZsRpuItPoH2Hp023foSyN9IGOQiWPt0dYqt/CZ42HW5/+?=
 =?us-ascii?Q?z4Un++CS2aDEy8wW8J9FZTFaPPHIy4Q0dJCCm4jnHvmGNlV/QcS2FGJtsRJj?=
 =?us-ascii?Q?FbdJm1qE267qT5uK7193ivq0iOu1Y12GT6KXwBDo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6802e6-0428-455f-c475-08db72171877
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 05:19:32.2860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JIVlEv/sOKRqkkmtexk+3FBdPTRMpe1JrZ2J/l8EjJVENhJXS9a9+W7AW66kLcIBU/zh3En1du2wFnBxE30QPvsq5yHnwljQstFocsiB0E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add min/max cap for engine
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
> Sent: Wednesday, June 21, 2023 9:25 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Sun, Jun 18, 2023 at 09:43:51PM -0700, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Vishwanathapura, Niranjana
> >> <niranjana.vishwanathapura@intel.com>
> >> Sent: Saturday, June 17, 2023 2:26 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
> >> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> >> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> >> <matthew.brost@intel.com>
> >> Subject: Re: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> >> properties
> >>
> >> On Thu, Jun 15, 2023 at 07:49:33PM +0530, Tejas Upadhyay wrote:
> >> >Add sysfs entries for the min, max, and defaults for each of engine
> >> >scheduler controls for every hardware engine class.
> >> >
> >> >Non-elevated user IOCTLs to set these controls must be within the
> >> >min-max ranges of the sysfs entries, elevated user can set these
> >> >controls to any value.
> >> >
> >> >Introducing compile time CONFIG min-max values which restricts
> >> >elevated user to be in compile time min-max range if at all sysfs
> >> >min/max are violated.
> >> >
> >> >Sysfs entries examples are,
> >> >DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
> >> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> >> timeslice_duration_max  timeslice_duration_us
> >> >job_timeout_min         preempt_timeout_max     preempt_timeout_us
> >> timeslice_duration_min
> >> >
> >> >DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
> >> >.defaults/              job_timeout_min         preempt_timeout_max
> >> preempt_timeout_us      timeslice_duration_min
> >> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> >> timeslice_duration_max  timeslice_duration_us
> >> >
> >> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> <snip>
>=20
> >> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >> >b/drivers/gpu/drm/xe/xe_engine.c index e72423bc398a..c368ffd5e461
> >> >100644
> >> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >> >@@ -13,6 +13,7 @@
> >> >
> >> > #include "xe_device.h"
> >> > #include "xe_gt.h"
> >> >+#include "xe_gt_sysfs.h"
> >> > #include "xe_hw_fence.h"
> >> > #include "xe_lrc.h"
> >> > #include "xe_macros.h"
> >> >@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device
> >> >*xe, struct xe_engine *e,  static int engine_set_timeslice(struct
> >> >xe_device
> >> *xe, struct xe_engine *e,
> >> > 				u64 value, bool create)
> >> > {
> >> >-	if (!capable(CAP_SYS_NICE))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     e->hwe->sched_props.timeslice_min,
> >> >+				     e->hwe->sched_props.timeslice_max))
> >> > 		return -EPERM;
> >> >
> >> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> >> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >> >+		return -EPERM;
> >> >+#endif
> >>
> >> Do we really need this second boundary check given the in the first
> >> check above, the e->hwe->sched_props.timeslice_min/max values are
> >> already subjected to these boundaries?
> >> Applies for other below parameters also.
> >
> >Yes we need because,
> >If elevated user exceeds configured sysfs min/max (he is allowed to do s=
o),
> which number could be below or above compile config min max.
> >As user can try any value through IOCTL/sysfs being elevated user, we ne=
ed
> to check with second check.
> >
>=20
> I thought CONFIG_DRM_XE_TIMESLICE_MIN/MAX are the default values of
> hwe->sched_props.timeslice_min/max
> which user can override. But looking at timeslice_duration_min/max_store(=
),
> looks like these configs are not default min/max values but a boundary fo=
r
> min/max values. I am confused.

Yes it is boundary for elevated user to config min/max as well as default v=
alue if not configured by user.

Tejas
>=20
> Niranjana
>=20
> >>
> >> >+
> >> > 	return e->ops->set_timeslice(e, value); }
> >> >
