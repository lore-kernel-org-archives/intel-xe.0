Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99950EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A9510E09C;
	Mon, 19 Jun 2023 04:44:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE45810E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 04:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687149852; x=1718685852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LQIx0Dlp94vob3/DC7n8S8ej7UP6Eyekuo2aNPuzKa0=;
 b=jDgXRqhpHgoqowoeeVCSeWjbH2+0BhgqBk7QvXPET6lAszTxMUDoGjbZ
 HFZN1QA8O8M4jxe43mHJQI5U/m+6aL8W4Lw0dTTjeFe7P1cApA4DQXwOI
 h5voVbeY6q2DfDs2246KP2oO+0FvXtr+o4uhE1vsIzfJTaPnvRsg7Wq23
 oyUryUotN45BGEGomhq6rr3ZqqH7xiqgY+v8ihJRo8AwKwaQL3K5Etr+B
 k1SxgkWWcoJ7bRj3xgn6W5M2V3iZcJzWjb/phmwT6GOur7LhKXUUaTzWq
 aKxr1n1KGcY8GwUrl7DDQdclYOm+4k0NfRPtCpu7ZVTHDcAr0jlZNmKNk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="425493574"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="425493574"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="743299088"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="743299088"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 18 Jun 2023 21:44:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 21:44:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 18 Jun 2023 21:44:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 18 Jun 2023 21:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZPSWrQqp5ydGraGZYsGkou7KPCoNAxj3eX4DCwEaEfIDWkLy1XHixNYQljbx8teoANYmYfYHG8VNwsDYe46bn93NzMAPxClZpE7gkP8EJbneMjnd8ARp7xlyrbCUmZ+/EllR4vkD7VdFUkUGWpoJ03ZYxxJkcoCkYxch1ELdmjX4g6x/UmbiZ5agQaWrkwi4YsYkh6i1C85CFnO6QMdW6nFfmBYzrBy7GXrLiQOUP9JAbMRDen4kCXr1wTcaKcdBd2R8Tx4PpHYw2l47YQXl4A1SjS9eSwNEKMvIfAlowC7JGDqKi60+HxI9JrMQBP/JMOLwZMJDJbGUfEXTpySng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uQK+VeWN62vy4LL+8kJUpLJPDYL+CI0MzGNNCUkl+g=;
 b=OVWoppkBSZAW2aWyi0jsk6U/vX6lwEVN0Pdyrp0a1rmLPSdTqBG0e9/oTjpxKHD5KqApn8TG6fo/dkNMXH2aUaAO7lPNTnVaKwcOMSA2xbpjoHH9pNB5nn1dXcNPf/ncHyimU+D08XoiLuT60rQ743jMn5PhST5O/s/DVOFo89KMxUGk0fbXTU2880syDPLF1s6cbK8DJgVqjlieS7V8gHdsLwK6ehPYzE+KMpP4tzo9DexvJGRy2ae8l2TQdiMxz4av6RhZ/dGW5vp4J0dTFDDyipioD6q6S0d0GuJZZbfaa1odbaKQnfXA7FHOAHxkEITWO7PX5XX4YiIrvd8E6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.31; Mon, 19 Jun
 2023 04:43:53 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::e6e3:34e6:63b5:9cba]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::e6e3:34e6:63b5:9cba%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 04:43:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZn5Opt7weKax8N0aPHY1M0eyYQq+N6tOAgAOkh2A=
Date: Mon, 19 Jun 2023 04:43:51 +0000
Message-ID: <DS7PR11MB6197189274A9EBB171F589B5815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|IA1PR11MB6369:EE_
x-ms-office365-filtering-correlation-id: c30309a3-60b5-4a9f-6b2a-08db707fc78d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LcJMmJISzAu2o7N7vrQhFYv7Xn7+l4UKUoXrh0KJIBwrkxrAAE5+g832pxTkgAIeYSUOpZ1dgLhMqECks0oyWHaCA8SnHZynemQOlbKP9L9jofX/IUtY/y2mLe1vL25yHuG/bBMEke/u7bHprGTLXPN9wvoEeM2vAR3Blf3KwGxJqTIDpbm7iGfRgEZ3YRIK+lUKck2XHRMT9h+x/XdGHPD0QkgHHrFuwp7Vw6pRJVGSjFQRj2furxzil2FSyou9FcCbylCQYKZ9ZH7MuC2LRh2NFfbkS0dIqY18dNvuibtK8pLfOFxxBuWiK9iSEz3ajjvldp2M7h0cY1mXHK0HEgTmOxL2S55uV0Cx3DqQb0UHDOD3dQM7Q7LStFldqA/txBKRxe18ddvo+oFwj6UQqeNlnS7HxPna66gy3+BAfVgns+afY4+lOw+yRKYup1FraobOMZwFXUx/Xaw4xTtrJcuPN8mDiAoR9ib056b/OjJVPhAthMk854lBZjG9EBRcC4rwssXm9kw1ELJPE3Vik4XXlxukOl0XQXL/1vhqmKBs18EHAHP4kl43BoQAhwZO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(966005)(71200400001)(7696005)(478600001)(33656002)(9686003)(53546011)(186003)(83380400001)(38070700005)(6506007)(86362001)(122000001)(82960400001)(38100700002)(55016003)(107886003)(66946007)(66556008)(64756008)(66446008)(66476007)(6636002)(4326008)(76116006)(2906002)(30864003)(52536014)(316002)(5660300002)(41300700001)(8676002)(8936002)(54906003)(110136005)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oDNy7w1XZVkPLmYk0X2FySncXdpitOJa0IZwp0SS8HeANaDmy9VCt0EUISey?=
 =?us-ascii?Q?TTeW8klgDocwpUAULYFMBtiFJa0uCOAA0Xyq0+1xjt7DRcauF5JlTcLAiJCu?=
 =?us-ascii?Q?ARsdRBHRhSaaS2Inr5LjgM13S5BcFm5O2AZbVbmpZAcyk0qNbZ7y5Z/j9sBV?=
 =?us-ascii?Q?ZO25tVK8qtLScxE0s7nP51ofHW4K8bBExAe4dbW6+RmxGcs1StULAqusyk0g?=
 =?us-ascii?Q?K8KXC0BNywDYPQziKAMCMSBfcE5L00TyV986RR8wOSMY+PpGWnvduu6mkm3J?=
 =?us-ascii?Q?BPlV9eGBIwTM7iuL8Kdiy4oLETLRl1oc9v2L2kliHqtcnYNCI0uqtt6hyK9X?=
 =?us-ascii?Q?lkNrnV8EAWeK46WycHF7HaPLdn9DAAWBV+EEdtfYwRm6H2F+CzKGjIs58ign?=
 =?us-ascii?Q?7ueGlJg0rP2UT/zDXPY7opcaDfKWZ2Q6ctSiBkeDQFPkcWSZVwUOOAGhIFt3?=
 =?us-ascii?Q?rtHJrhUPltlSMBYcXgcZa8J+BpGdeuG/d+rQiCv77fNf6X0o3hdHlpGFdv7/?=
 =?us-ascii?Q?nzYN7aRHwl6gWDZ7/Tt44WHVByV2tTOQpkWlMoEoAwGRLtiqZXtXbecwQdky?=
 =?us-ascii?Q?I/UsV/L6KTIihCi/PpC2wSCIkVOs2TWnx/thv8Unk1apWGSnrb+/6nDjEhNM?=
 =?us-ascii?Q?kqXrH81tD5l5nioGP8KzgrXJZmLnvRANKItu+b7SQcIVP8+OWKX9Laojb0Rk?=
 =?us-ascii?Q?H2o+VMjZYas5ZG8KSHSZZFwVmOMXGLm6/cJKxUQHdjBaqXItfjDi+pc/o7QT?=
 =?us-ascii?Q?+ZtHcYIC2gMYO2ATIgaET4J9SkWbmfd6iENmOo1hDtJ2zU/+TTpUi22QFXVr?=
 =?us-ascii?Q?xRJ5kdAQmVvD4OZ9oMUgDjwOIl98yMQ0HuG29jSkfOMrifyK/LphTERbl0IT?=
 =?us-ascii?Q?FXBi/IjQzFkTgRvJxUIRcQjiQHdcSpWouZo9caT3cWZxhPizRynMTgb50IUR?=
 =?us-ascii?Q?qhdadzFmibKXy6GixQyQxBgir0arO3227gbTp+c4UFYVSJcYWG2oVjKl0z+q?=
 =?us-ascii?Q?197trbCZy4kFQqY/Hhb2GyQJKPb6+z5wirqcuUInSecVv6aZ+7eO19nI6RVS?=
 =?us-ascii?Q?AZwWUQ4AWJZ5545BkRFjZ+92EcvhCwH0dBj17bMT/YK5XokpYtRBv22merJ5?=
 =?us-ascii?Q?4ySRUS8PSeovTLNUkPbRuNEqpck4xACW8dLTEq+alDvGS5Vvi256HOlVtySA?=
 =?us-ascii?Q?dc248aDniXYDe1rHYxnHzQNlTr7XImGswVi1/20kgpS3PPPobBBpWMGMlp5J?=
 =?us-ascii?Q?3scG6wGhtvyoHlyBTjF1ZMbaWMTKlt83nYHqyD0eStfdmcXdTjPnb7T7WVXO?=
 =?us-ascii?Q?zYBOA9ScwM9/6njuxuGteHHYO9yav96lNFf2mWdQ2ucRsYUU0M52B/APfX4+?=
 =?us-ascii?Q?fyxAoqgwk6eG5XK2uSaIS1m87yUIlb4uextKEu7yqF4krz5TLj0AUc1baruA?=
 =?us-ascii?Q?7QBewXF6F+i4Y+xzC6D5Vsv2RdU0w1EHJzkHa/XMs30edr71b/5wRBmdSaog?=
 =?us-ascii?Q?uYSw5c2EOvX6estosUpiVsRIR8/DLufyOIIhHhLWDl3eVxyXR92Ji7e1dN/p?=
 =?us-ascii?Q?fYtFf9JRa4avrsrpvlihjNYPXE7lz/HowHoK1j5M0yBSWVEES3wFBavCMT88?=
 =?us-ascii?Q?4IKpopm+CyX2zt10Ab3s1J6LmMSTmQ5R2c8bAQf8wtYE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30309a3-60b5-4a9f-6b2a-08db707fc78d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 04:43:51.3835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqJFHh7yK2tE/m3dQZDeD84v4QYqcextXpiok5eaXcLIe3zbf8eAfYx+zpKDIr6RCGkj5vz5VaGu8P4eu6k1UHS/hNPDX8tap2njWxumzrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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

I had discussion with @Brost, Matthew , and suggestion was to use 1 as defa=
ult min. But yes by default we can keep this disabled with having 0. I will=
 let other comment.

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

Yes we need because,
If elevated user exceeds configured sysfs min/max (he is allowed to do so),=
 which number could be below or above compile config min max.
As user can try any value through IOCTL/sysfs being elevated user, we need =
to check with second check.

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

I initially had fewer sysfs files to add, then after min/max introduction I=
 thought too many files lets go with create_files(). I will take a look at =
it.

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

I will try to put it on top of my patch. If see any problems, I will let yo=
u merge later. Mostly it should not create any.

Thanks,
Tejas
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
