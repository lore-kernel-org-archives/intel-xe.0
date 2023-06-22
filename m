Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC11EEB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 12:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C5B10E55A;
	Thu, 22 Jun 2023 12:57:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285FD10E55A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687438630; x=1718974630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cmLemvAtC0G59PfV+DzKZPd86dr15Rfs3yiUuYklhAE=;
 b=c2gU33z7jvBnwP7FkFH0HaB9nxBGe25OMyzHZHmD2AUmKJSTNiZOlXwb
 UjJMRLwbJ13dR3S95jh50ayu6KYb6X2USGOOAA1rXWM8BKUEAMnZiTDKJ
 7aCuhSWMszEsV+YWRq5IRGIkD5PT44M8uPGAmmWNsXcvaKLiCr1pknFNn
 ks2YjXtmYzFlFtqgEbw476ar2388TickKpTjdAdOYIiqS8qlg861efu/f
 QqnEHPattPygOH/0KDyJ2yxMiuqKQ5cBq9cBX1WfZCokmisgLSYE/COOT
 47T/fWVZ6L5Avryqk5JgKlo6WdLRKpIhLPzfoAFaX1dL20ghRVCmaiHXB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360496203"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="360496203"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1045155919"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="1045155919"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 05:56:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 05:56:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 05:56:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 05:56:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 05:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By6Yw+l5D5GIMiYLZCQXaP45V9XsyqXI9Y9yZz1q71VUQXwethOG2dqd48q8eMDDZsIHBUW0p+4bA01Zpo3LhL6CMES5lr3l7/XkZX0pMypXVvM6BTjjmGD4HZLjk5WPxFVjVWQ45RIljwDFkVlWy8LVUwSxeGUPv1sDjhUCJIexHJYBLekrQUbbJ8YAoEsztK5fVgEdOQOwGG3NVzwOQoKHqq4FoK9ztCUJ66BrSefgCaS8/UmMXgZhlgj6Vg5cJtQWeyG6FsYUUzV8jz+Ahsu2KUE6ai9DVyoQwSGwb9dX5Y0DP2sl4egABmIMXPJPh6mVb9RmJkDxJP9OMDNRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ie34rAP0KcmGKygRyjkB7B237J9BPxgPCWaMrgIQns=;
 b=LxLNB/FVTO9FfhBvZM7GSGwkUPbRdeig6u4LQ+1tVho8hRIPL/cyqMeKl16/Io47d/eL7hlRUnsI3lqWyP74QsHRGkWb+M3hxjkOiPED4ePhdqwi+xh2RLhdZT+STdVs3mHSi3KKZL+9Wb058wAG+K0Ra5BTlrEJLmQdJTckdCEDBSVwnWa4I3vEIElI7MTWW09MUJzsqEcqThgNVL3/wiPNffiXeBd9HFjPx2LwDXo7AvW3gP63v+QqwGt3paTXn695fuyW4NgMj4FVlV2d3nN1MO+Sjoh7yAybgyIgiu72kH0qmrFFoCnKia8S16vic9IQxxnru6+VYIjYtXuU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 12:56:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 12:56:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZn5Opt7weKax8N0aPHY1M0eyYQq+N6tOAgAjmvnA=
Date: Thu, 22 Jun 2023 12:56:38 +0000
Message-ID: <SJ1PR11MB6204D940A82A01DC20D56DE08122A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
 <ZIzMbz7Jk0F0tpf6@nvishwa1-DESK>
In-Reply-To: <ZIzMbz7Jk0F0tpf6@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7489:EE_
x-ms-office365-filtering-correlation-id: 8d8b6913-fd3c-4cef-6559-08db73201e69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rs2bwTkF6oEHIOfvAbrGVKpviU3prsh8xffzPZxfLpbh1ISQ99nbTIqs0ZcamFhoPJeNg1+RRT0vMRrG5Pgr5L6GYresLFA9CGbEI6BxZLG4kuKsSyAGXgYVdJM+kf5xMbGVVBazeIvBCA+mG9QjNrX1rbBJeuwSqkA9r9dIRjAD2+ckblu/J/HroIKMj+5Lx9arm4rdi9uq9dKlKyNR94y95RT6DV8+dz14Ib8+YgnDRDjGxKDyHi+DegsGHpvqCbrgqD7ufBby3P4wGFced493WM4Ofnchinzl8BrrBmv97fidIAZXwM/PLx2rDn5m9TVN6I/MLadtqL6DpBaoQd4ijRPrjv0544NQ82+RoHFyXg7azZrFbWqt+rTqLGEhYCyaP3Ia5YjJAsRfF5SvKKiPZtdf9jk4Kt6afY4nwPjBOH44UndRZF8cQEnDAEAQ3EGmzitOSGRk2LuGD2/ZBkKvi7mbvvmFFUd3VHU5ZZRM+0oauhdllUDUYvU0BUReryt8OzHVCSdXRFrgaqAVAdRfdey+xy4vPMwjenc5ytA4B7phMJhi4+h5moDOSmkmCxjP4NOurYwMShcnBNtuul85quz3cw3RWPC4exuhIpw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(110136005)(30864003)(2906002)(38100700002)(7696005)(9686003)(107886003)(122000001)(186003)(83380400001)(82960400001)(6506007)(71200400001)(53546011)(966005)(41300700001)(54906003)(55016003)(38070700005)(86362001)(316002)(478600001)(6636002)(76116006)(66446008)(4326008)(66946007)(66556008)(64756008)(66476007)(5660300002)(52536014)(33656002)(8676002)(8936002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VVqMdKzQ7786egEhwASQoLqOX9GBaHc5AuxOXYL0XN/u6ii2+i0yM4ttg2KA?=
 =?us-ascii?Q?MmOZoyHxpEhUz0hLK389FHYfpmi1lcWR883UXOf9Pji1s8p44cGg9LHJYw+p?=
 =?us-ascii?Q?t6wOqJQPHxQYRi1qHJfkwVnHwW8HiMFGztmE2YPFW6wQwebEZI7VGtE+U57G?=
 =?us-ascii?Q?CACbMBwsZBQfXfsnVzMyxCMRzOS958hFMJJA3ZEkkOoq1nkntnlPbbLlgGD/?=
 =?us-ascii?Q?vUXoOC74dhyhzRk++0ppGOnYGAfBps2QXc7Lbr9EfsVyo/lsC90ZDDH9ZSdK?=
 =?us-ascii?Q?ZK16AgzNjDl1AV3kzHlq48ln6XZHFyd6qkOgqQjJ5Zczh0e+JIGQSP+7yHOa?=
 =?us-ascii?Q?l0azoGPXJE7SHS6i0geR9oC50pXNVgYMLm1uE/SPgzi4UZT4bfrnvpIZFYf3?=
 =?us-ascii?Q?294GrDLmHf17z/XhebQ8VPwReDFpzZjIySUQClcyFY9M3W1K8TwXjzR6Gynp?=
 =?us-ascii?Q?CpIaJFIFYxL8DeOY2dxQyDL3WqS53eMtXUUq4e8OR2f5XgFurOOgd5MLkdOs?=
 =?us-ascii?Q?S2KS4CYtTiJzbmtrVd0NjeP+oy3fin3MdhOO9d0DPZW9lvaNXd3goX3MWR/S?=
 =?us-ascii?Q?zRIJqe07be8bg1NVIOM5Vfne4KTVS1d1qnys5tHNaZfQgdBQE5Cjq+BB0pYq?=
 =?us-ascii?Q?rCI9TNDnYLfVn+Uv08OTHBIGIlffdmYZ61HwQkQFXMNqjXXSBe4XgE7xlqXe?=
 =?us-ascii?Q?p0IbiemMLm/pYnecVVVEKVFIfnim2Ud0ao68BnuJyR3/lCZTUtoxXAsarX4d?=
 =?us-ascii?Q?EHSUZLU+zLXS1nmhfKIrM9KcSfBimzeXTMZiKOTjE+J/spWjJFwXCrdW15RD?=
 =?us-ascii?Q?R+X0wd+aPP5NhhkGtfw8JLPRcq5iGA+oDwZrxnCQuGyIMUPhEIttoRcxcoo4?=
 =?us-ascii?Q?ShLzQ84KPasfuyq+sklOWDrMjvWIOv2AEpfZdrK/ChzgwA9en1o76TM96SD0?=
 =?us-ascii?Q?Aqyr1G1SC8kKSZEEqCuyFUjRjC0CPum8PY3t6QlXHFOGOsT3XCF7MgimLMIv?=
 =?us-ascii?Q?vUM7ykxHZQ5VYCx1UZW/rCXqe+X9N3Ac+y2AD8sdccdykmWf/1gmL6A73MsI?=
 =?us-ascii?Q?vRdHmt9mJQaIuj4KHNiVMQCPkXor0W1T5oFUmo5EkxbqRLwTUdzPlIYtdq0b?=
 =?us-ascii?Q?fY8qOaiNqo0rPjQaTkcXWCiWhbEMJ4DiHb2WNFvXd8O5PBXRXeSHnuct8xui?=
 =?us-ascii?Q?QTLr3sVwwpJ+jbof6CzKDFZuS5cxq0nY7TnsOHAY1zmuHskAmjGWZAZyGCT3?=
 =?us-ascii?Q?S+hILXMv+3gzuPCkb7qzViul/X6IUZOsbtC7P8x90LR4oE+9wu8nUuG9fbEy?=
 =?us-ascii?Q?U/payGQll0e2YJH1MvGxsGBmRZ9TgX95ozJEWFNRVecnCnFRvtT2dVInpUq4?=
 =?us-ascii?Q?mzpJSi5rx3iL1hhn6lIjaAQosxvo1JH3vRhZqW0mrt1B8SqCr+PfjLXoRGKk?=
 =?us-ascii?Q?9NWRAQ0OJ5LlmkgLw5D8crnF4Jq4rJrz5ESYWQlqNfx0U4PnJXR14qCpBdPT?=
 =?us-ascii?Q?uq4W/2YKHzn633s+KFPFnLlViWkpO6CBlsV9JLFZU16jTbT6/ej6ueEQ5vxp?=
 =?us-ascii?Q?CTtP0U4qptNQeagwtneS2sMlCmgZR6Q0jO11sEEOIhfJWsSxUPCk8Q2Znsrz?=
 =?us-ascii?Q?fMAHW18ae7N3oGhQZi0ez+vqOCZzKRsCCOJ/UcyFt24D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8b6913-fd3c-4cef-6559-08db73201e69
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 12:56:38.9326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OPNClxN4ZmUtko1sxCirTJJHzbCcBeT1yDjlKAa/yDLD6MD8sDw9zFGIQliRDIW+yRJrQewD7SYXYVGkBU6Sx3LVMrkZEwrIngsKB0AFVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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
> Sent: Saturday, June 17, 2023 2:26 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Thu, Jun 15, 2023 at 07:49:33PM +0530, Tejas Upadhyay wrote:
> >Add sysfs entries for the min, max, and defaults for each of engine
> >scheduler controls for every hardware engine class.
> >
> >Non-elevated user IOCTLs to set these controls must be within the
> >min-max ranges of the sysfs entries, elevated user can set these
> >controls to any value.
> >
> >Introducing compile time CONFIG min-max values which restricts elevated
> >user to be in compile time min-max range if at all sysfs min/max are
> >violated.
> >
> >Sysfs entries examples are,
> >DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> >job_timeout_min         preempt_timeout_max     preempt_timeout_us
> timeslice_duration_min
> >
> >DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
> >.defaults/              job_timeout_min         preempt_timeout_max
> preempt_timeout_us      timeslice_duration_min
> >job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/Kconfig              |   7 +
> > drivers/gpu/drm/xe/Kconfig.profile      |  39 +++
> > drivers/gpu/drm/xe/xe_engine.c          |  40 ++-
> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 373 ++++++++++++++++++++++--
> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> > drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> > drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  12 +
> > 8 files changed, 485 insertions(+), 24 deletions(-)  create mode
> >100644 drivers/gpu/drm/xe/Kconfig.profile
> >
> >diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> >index d44794f99338..964c440a1135 100644
> >--- a/drivers/gpu/drm/xe/Kconfig
> >+++ b/drivers/gpu/drm/xe/Kconfig
> >@@ -83,3 +83,10 @@ depends on DRM_XE
> > depends on EXPERT
> > source "drivers/gpu/drm/xe/Kconfig.debug"
> > endmenu
> >+
> >+menu "drm/xe Profile Guided Optimisation"
> >+        visible if EXPERT
> >+        depends on DRM_XE
> >+        source "drivers/gpu/drm/xe/Kconfig.profile"
> >+endmenu
> >+
> >diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> >b/drivers/gpu/drm/xe/Kconfig.profile
> >new file mode 100644
> >index 000000000000..cffd73e44ca9
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/Kconfig.profile
> >@@ -0,0 +1,39 @@
> >+config DRM_XE_JOB_TIMEOUT_MAX
> >+	int "Default max job timeout (ms)"
> >+	default 10000 # milliseconds
> >+	help
> >+	  Configures the default max job timeout after which job will
> >+	  be forcefully taken away from scheduler.
> >+config DRM_XE_JOB_TIMEOUT_MIN
> >+	int "Default max job timeout (ms)"
> >+	default 1 # milliseconds
> >+	help
> >+	  Configures the default min job timeout after which job will
> >+	  be forcefully taken away from scheduler.
> >+config DRM_XE_TIMESLICE_MAX
> >+	int "Default max timeslice duration (us)"
> >+	default 10000000 # microseconds
> >+	help
> >+	  Configures the default max timeslice duration between multiple
> >+	  contexts by guc scheduling.
> >+config DRM_XE_TIMESLICE_MIN
> >+	int "Default min timeslice duration (us)"
> >+	default 1 # microseconds
> >+	help
> >+	  Configures the default min timeslice duration between multiple
> >+	  contexts by guc scheduling.
> >+config DRM_XE_PREEMPT_TIMEOUT_MAX
> >+	int "Default max  preempt timeout (us)"
> >+	default 10000000 # microseconds
> >+	help
> >+	  Configures the default max preempt timeout after which context
> >+	  will be forcefully taken away and higher priority context will
> >+	  run.
> >+config DRM_XE_PREEMPT_TIMEOUT_MIN
> >+	int "Default min  preempt timeout (us)"
> >+	default 1 # microseconds
>=20
> I think a value of 0 means preempt timeout is diabled. GuC allows it.
> So, probably we should allow minimum of 0?

I had discussion on min max default values with @Brost, Matthew, and 1 deci=
ded as default min.=20

>=20
> >+	help
> >+	  Configures the default min preempt timeout after which context
> >+	  will be forcefully taken away and higher priority context will
> >+	  run.
> >+
> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >b/drivers/gpu/drm/xe/xe_engine.c index e72423bc398a..c368ffd5e461
> >100644
> >--- a/drivers/gpu/drm/xe/xe_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_engine.c
> >@@ -13,6 +13,7 @@
> >
> > #include "xe_device.h"
> > #include "xe_gt.h"
> >+#include "xe_gt_sysfs.h"
> > #include "xe_hw_fence.h"
> > #include "xe_lrc.h"
> > #include "xe_macros.h"
> >@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device
> >*xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_dev=
ice
> *xe, struct xe_engine *e,
> > 				u64 value, bool create)
> > {
> >-	if (!capable(CAP_SYS_NICE))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     e->hwe->sched_props.timeslice_min,
> >+				     e->hwe->sched_props.timeslice_max))
> > 		return -EPERM;
> >
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >+		return -EPERM;
> >+#endif
>=20
> Do we really need this second boundary check given the in the first check
> above, the e->hwe->sched_props.timeslice_min/max values are already
> subjected to these boundaries?
> Applies for other below parameters also.
>=20
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
> >+				     e->hwe-
> >sched_props.preempt_timeout_min,
> >+				     e->hwe-
> >sched_props.preempt_timeout_max))
> >+		return -EPERM;
> >+
> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> > 		return -EPERM;
> >+#endif
> >
> > 	return e->ops->set_preempt_timeout(e, value);  } @@ -269,8
> +292,19 @@
> >static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine=
 *e,
> > 	if (XE_IOCTL_ERR(xe, !create))
> > 		return -EINVAL;
> >
> >-	if (!capable(CAP_SYS_NICE))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     e->hwe->sched_props.job_timeout_min,
> >+				     e->hwe->sched_props.job_timeout_max))
> >+		return -EPERM;
> >+
> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> > 		return -EPERM;
> >+#endif
> >
> > 	return e->ops->set_job_timeout(e, value);  } diff --git
> >a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index f88f8f7dfc7b..415b60845eef 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -32,6 +32,11 @@ static struct kobj_type kobj_xe_engine_type =3D {
> > 	.sysfs_ops =3D &kobj_sysfs_ops
> > };
> >
> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> >+	return timeout >=3D min && timeout <=3D max; }
> >+
> > static ssize_t preempt_timeout_store(struct kobject *kobj,
> > 				     struct kobj_attribute *attr,
> > 				     const char *buf, size_t count) @@ -44,9
> +49,20 @@ static
> >ssize_t preempt_timeout_store(struct kobject *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     hwe-
> >sched_props.preempt_timeout_min,
> >+				     hwe-
> >sched_props.preempt_timeout_max))
> > 		return -EINVAL;
> >
> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> > 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> >
> > 	return count;
> >@@ -63,6 +79,78 @@ static ssize_t preempt_timeout_show(struct kobject
> >*kobj,  static struct kobj_attribute preempt_timeout_attr =3D
> >__ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> >preempt_timeout_store);
> >
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
> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >+	if (!engine_timeout_in_range(timeout,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> >+					struct kobj_attribute *attr, char *buf)
> {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe-
> >sched_props.preempt_timeout_max);
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
> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >+	if (!engine_timeout_in_range(timeout,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> >+					struct kobj_attribute *attr, char *buf)
> {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe-
> >sched_props.preempt_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_min_attr =3D
> >+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> >+	       preempt_timeout_min_store);
> >+
> > static ssize_t timeslice_duration_store(struct kobject *kobj,
> > 		struct kobj_attribute *attr,
> > 		const char *buf, size_t count)
> >@@ -75,8 +163,19 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     hwe->sched_props.timeslice_min,
> >+				     hwe->sched_props.timeslice_max))
> >+		return -EINVAL;
> >+
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> > 		return -EINVAL;
> >+#endif
> >
> > 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
> >
> >@@ -95,6 +194,79 @@ static struct kobj_attribute
> >timeslice_duration_attr =3D  __ATTR(timeslice_duration_us, 0644,
> >timeslice_duration_show,  timeslice_duration_store);
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
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (!engine_timeout_in_range(duration,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> >+					   struct kobj_attribute *attr,
> >+					   char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max); }
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
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (!engine_timeout_in_range(duration,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> >+					   struct kobj_attribute *attr, char
> *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min); }
> >+
> >+static struct kobj_attribute timeslice_duration_min_attr =3D
> >+	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> >+	       timeslice_duration_min_store);
> >+
> > static ssize_t job_timeout_store(struct kobject *kobj,
> > 		struct kobj_attribute *attr,
> > 		const char *buf, size_t count)
> >@@ -107,8 +279,19 @@ static ssize_t job_timeout_store(struct kobject
> *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     hwe->sched_props.job_timeout_min,
> >+				     hwe->sched_props.job_timeout_max))
> >+		return -EINVAL;
> >+
> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> > 		return -EINVAL;
> >+#endif
> >
> > 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
> >
> >@@ -126,6 +309,89 @@ static ssize_t job_timeout_show(struct kobject
> >*kobj,  static struct kobj_attribute job_timeout_attr =3D
> >__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
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
> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >+	if (!engine_timeout_in_range(timeout,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t job_timeout_max_show(struct kobject *kobj,
> >+				    struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
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
> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >+	if (!engine_timeout_in_range(timeout,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
> >+
> >+	return count;
> >+}
> >+
> >+static ssize_t job_timeout_min_show(struct kobject *kobj,
> >+				    struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >+
> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
> >+}
> >+
> >+static struct kobj_attribute job_timeout_min_attr =3D
> >+__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> >+job_timeout_min_store);
> >+
> >+static const struct attribute *files[] =3D {
> >+	&job_timeout_attr.attr,
> >+	&job_timeout_min_attr.attr,
> >+	&job_timeout_max_attr.attr,
> >+	&timeslice_duration_attr.attr,
> >+	&timeslice_duration_min_attr.attr,
> >+	&timeslice_duration_max_attr.attr,
> >+	&preempt_timeout_attr.attr,
> >+	&preempt_timeout_min_attr.attr,
> >+	&preempt_timeout_max_attr.attr,
> >+	NULL
> >+};
> >+
> > static ssize_t job_timeout_default(struct kobject *kobj,
> > 				 struct kobj_attribute *attr, char *buf)  { @@
> -137,6 +403,28 @@
> >static ssize_t job_timeout_default(struct kobject *kobj,  static struct
> >kobj_attribute job_timeout_def =3D  __ATTR(job_timeout_ms, 0444,
> >job_timeout_default, NULL);
> >
> >+static ssize_t job_timeout_min_default(struct kobject *kobj,
> >+				       struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min); }
> >+
> >+static struct kobj_attribute job_timeout_min_def =3D
> >+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> >+
> >+static ssize_t job_timeout_max_default(struct kobject *kobj,
> >+				       struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max); }
> >+
> >+static struct kobj_attribute job_timeout_max_def =3D
> >+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> >+
> > static ssize_t timeslice_default(struct kobject *kobj,
> > 				 struct kobj_attribute *attr, char *buf)  { @@
> -148,6 +436,28 @@
> >static ssize_t timeslice_default(struct kobject *kobj,  static struct
> >kobj_attribute timeslice_duration_def =3D  __ATTR(timeslice_duration_us,
> >0444, timeslice_default, NULL);
> >
> >+static ssize_t timeslice_min_default(struct kobject *kobj,
> >+				     struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min); }
> >+
> >+static struct kobj_attribute timeslice_duration_min_def =3D
> >+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> >+
> >+static ssize_t timeslice_max_default(struct kobject *kobj,
> >+				     struct kobj_attribute *attr, char *buf) {
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max); }
> >+
> >+static struct kobj_attribute timeslice_duration_max_def =3D
> >+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> >+
> > static ssize_t preempt_timeout_default(struct kobject *kobj,
> > 				       struct kobj_attribute *attr,
> > 				       char *buf)
> >@@ -160,6 +470,43 @@ static ssize_t preempt_timeout_default(struct
> >kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> >__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >
> >+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> >+					   struct kobj_attribute *attr,
> >+					   char *buf)
> >+{
> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >+
> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
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
> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
> >+}
> >+
> >+static struct kobj_attribute preempt_timeout_max_def =3D
> >+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> NULL);
> >+
> >+static const struct attribute *defaults[] =3D {
> >+	&job_timeout_def.attr,
> >+	&job_timeout_min_def.attr,
> >+	&job_timeout_max_def.attr,
> >+	&timeslice_duration_def.attr,
> >+	&timeslice_duration_min_def.attr,
> >+	&timeslice_duration_max_def.attr,
> >+	&preempt_timeout_def.attr,
> >+	&preempt_timeout_min_def.attr,
> >+	&preempt_timeout_max_def.attr,
> >+	NULL
> >+};
> >+
> > int xe_add_engine_defaults(struct kobject *parent)  {
> > 	struct kobject *kobj;
> >@@ -175,15 +522,7 @@ int xe_add_engine_defaults(struct kobject
> *parent)
> > 	if (err)
> > 		goto err_object;
> >
> >-	err =3D sysfs_create_file(kobj, &job_timeout_def.attr);
> >-	if (err)
> >-		goto err_object;
> >-
> >-	err =3D sysfs_create_file(kobj, &timeslice_duration_def.attr);
> >-	if (err)
> >-		goto err_object;
> >-
> >-	err =3D sysfs_create_file(kobj, &preempt_timeout_def.attr);
> >+	err =3D sysfs_create_files(kobj, defaults);
>=20
> Why add code in previous patch and remove it here when we can can have
> previous patch use sysfs_create_files() to begin with?
> Applies to other below parameters also.
>=20
> > 	if (err)
> > 		goto err_object;
> >
> >@@ -286,15 +625,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> > 			return err;
> > 		}
> >
> >-		err =3D sysfs_create_file(&khwe->base,
> &job_timeout_attr.attr);
> >-		if (err)
> >-			goto err_object;
> >-
> >-		err =3D sysfs_create_file(&khwe->base,
> &timeslice_duration_attr.attr);
> >-		if (err)
> >-			goto err_object;
> >-
> >-		err =3D sysfs_create_file(&khwe->base,
> &preempt_timeout_attr.attr);
> >+		err =3D sysfs_create_files(&khwe->base, files);
> > 		if (err)
> > 			goto err_object;
> > 	}
> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >index a539cf031c7d..a7ac7b9a9768 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >@@ -12,6 +12,7 @@
> >
> > int xe_gt_sysfs_init(struct xe_gt *gt); int xe_gt_sysfs_engines(struct
> > xe_gt *gt);
> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >
> > static inline struct xe_gt *
> > kobj_to_gt(struct kobject *kobj)
> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >index 8314429cfa90..e52324eb1efa 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >@@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
> > 	hwe->engine_id =3D id;
> > 	/* FIXME: Wire up to configurable default value */
> > 	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> >+	hwe->sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> >+	hwe->sched_props.job_timeout_max =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > 	hwe->sched_props.timeslice_us =3D 1 * 1000;
> >+	hwe->sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> >+	hwe->sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
> > 	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> >+	hwe->sched_props.preempt_timeout_min =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> >+	hwe->sched_props.preempt_timeout_max =3D
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>=20
> Can we define a config option for preempt_timeout_us also?
> My below patch series tries to do it.
> https://patchwork.freedesktop.org/series/119165/
>=20
> May be you can include it here in your patch series or I can push a patch
> series after this series gets merged. Thoughts?
>=20
> > 	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >
> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt)); diff --git
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
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>=20
> As mentioned above, a minimum should be 0?

This answered above, though I have question should we set these defines and=
 compile time config defaults as same value as I have done here? For exampl=
e in this case if CONFIG is not defined then still we will get same default=
 value through #define, that should be ok, right!

Thanks,
Tejas

>=20
> Niranjana
>=20
> >+#endif
> >+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #define
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> >+#else #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 *
> 1000)
> >+#endif
> >+
> > int xe_hw_engines_init_early(struct xe_gt *gt);  int
> >xe_hw_engines_init(struct xe_gt *gt);  void
> >xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec); diff
> >--git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >index 406a1e33a05e..8582193b4947 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >@@ -111,10 +111,22 @@ struct xe_hw_engine {
> > 	struct {
> > 		/** @set_job_timeout: Set job timeout in ms for engine */
> > 		u32 job_timeout_ms;
> >+		/** @job_timeout_min: Min job timeout in ms for engine */
> >+		u32 job_timeout_min;
> >+		/** @job_timeout_max: Max job timeout in ms for engine */
> >+		u32 job_timeout_max;
> > 		/** @timeslice_us: timeslice period in micro-seconds */
> > 		u32 timeslice_us;
> >+		/** @timeslice_min: min timeslice period in micro-seconds
> */
> >+		u32 timeslice_min;
> >+		/** @timeslice_max: max timeslice period in micro-seconds
> */
> >+		u32 timeslice_max;
> > 		/** @preempt_timeout_us: preemption timeout in micro-
> seconds */
> > 		u32 preempt_timeout_us;
> >+		/** @preempt_timeout_min: min preemption timeout in
> micro-seconds */
> >+		u32 preempt_timeout_min;
> >+		/** @preempt_timeout_max: max preemption timeout in
> micro-seconds */
> >+		u32 preempt_timeout_max;
> > 	} sched_props, defaults;
> > 	/** @sysfs: sysfs kobject pointing to this hwe */
> > 	struct kobject *sysfs_hwe;
> >--
> >2.25.1
> >
