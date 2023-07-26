Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E48C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 15:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7887810E488;
	Wed, 26 Jul 2023 15:11:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2110E488
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690384268; x=1721920268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bJmIQO8WDqSBcg7vUtO9x/4N1epy0z0VcFROAI3vmSc=;
 b=Da25JL7ewZ9lbCL1h2QbYzSWyetSEvKpA7GZ1SSbNx+kF8MgNPuvQ60U
 ZCWTYKr0AKowTDzHY7yonVMDS9wNyJM9TejZfLQ8h2q0Ww2XO14/Sagmo
 3odpkGlK6SpwAQerykX1cYpoxrmv9Q7X3SjdtAe4YVReE2n85zWui/Xgx
 Nn/e7wVpH1WqjS0UA/QO7VrkQdo48rfn2sE+08mVZ75PHS67mWmewcdF3
 3r/YVDb2ni3Bwxf0tmHhGhvwVUb+SJGjOsBi7ZTOrFCZHCt5z8z7Pfdxl
 xM4kh7j0kcl4Nz+e0gBI9/mcNoVD3XXUvY4Haglg4eeYRafkjKR5q/+tk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370719394"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370719394"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816723806"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816723806"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 08:10:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 08:10:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 08:10:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 08:10:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 08:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcsswMUYW8L2NEk0q7Z+03iUhAb11Z1WtEwAuTFN/T+mi1tkQjKELBDsazEYP9VTOPaqHJGA9sgHU1tKkjEtPFRypIW/XioPv8fDIWBKJQNabqvKwhquJpvhFM2fTjuhHFG45ojQlkAKgNoFwfJTgUCOrt55OkzxI1fZRYuOwTz9GH2UFcJMBZLTi0SvZfWB1dVLL1vH6e8as6dyqFtr7F6rGb++0X0ccLjCl5iztNYMuWPkh8nRtAqn/rD38oeJZWON9gbBLCWKtMHwvSQ02BqwX+g1oefy9PkOtV6YY5LIwbuh69yw6FLt1DqK/+21Gu/ZNrTZ36oUtJWPnuEs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOtfxeWmKj/bQuuymlYJ0QyH952ttnmfuZ68vKPMDGM=;
 b=UaxNDp7IM635w5vojoby9k/EPTr3QOXgPuS2g3pym05V8GdnsRYFIyIKNGRJ3pKHvm+BrFdg4JUzu7OlNP03CwX0oOAAeBAUMxdNJ4XG2/GvKR7lhovb9Q+YjPShySl8oj7EzZMjkc0MqNW8eIqQEMggTyc4Oo/btQkvWje1L4xoPpVPcvKXBJ6rrXmeIBT23hpnDqIuD26gRdyPLKaivdpDjuaXtKv4Sb+IQHPUexxGtgYpbB3w6aOViWNpZQszdoEIQXUq9Q/45h9hiTJpapUyZnwZ9CJoNncd1uRl8y7EnPVzSVA2SXydfGfsDy5ckmTuBIicabEVEeggLmicSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 15:10:53 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:10:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH V8 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZv8PNgzpcyZuhXk2q8ZyGxX+Ina/MGGuAgAAOZHA=
Date: Wed, 26 Jul 2023 15:10:52 +0000
Message-ID: <SJ1PR11MB6204DE3DAA57DD8E3788C4488100A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
 <20230726132550.846300-7-tejas.upadhyay@intel.com>
 <ZMErFd6Kquei++tq@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMErFd6Kquei++tq@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8152:EE_
x-ms-office365-filtering-correlation-id: 45744ee3-d90c-4c91-e2fd-08db8dea80fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: peg2Vdgqjofm7+qJSpwJd1gyAxXnh+4a8PNGaoNBFjYsZYNREJ89dGOrXkDhOusolAoNhnEG+Uy1rQmgNymBRNXAWM5k1+aBw54O2L8uP22jGyHh7ZVgwvOJmlzMZoswvhKY0zCgWFLq0SJlON0Zn4a0pWMXV3sBk9OOp9ERNLKYUfzWOd1K8yppYvwsz6RWNMideAE+5qnzz0a0hoIPjpXpUqk+Fx84VYXaM5k8MlQWXpEs4QlWLfaxiYwQPTtsXdGRCbe+5wQUsmA4FBpLf/XjJNWrlJfYL0WW3ueEwn2uoKp7+xMboKQXONC89h1qRQ0oUAYXgYIkFv8gADdNURNsdz3lAI0R39OIpq3hBBGcU3liXfdn9KMQz/FGdoJHad3MfcgqZLc5YQSn/yhFj7hiL2gbbdxB3iyj+oPEmt0MiMWYbsOJuWiyB47Wn/rwxw7lvhrLksH/TIlgwrOCIgukmSAAjVATQJzhwYOpOkBJTXkVT35kD0eaREFWefQKIJu5bxjuCzOYriOcbiY1Qf3G/viEywPvgXkqUiokLbh5Qyewh/r33PbyOtFMCQcmzsWJADDICkF7liCAeayB1qqWtkDL7LYV7LOhb1qHPqs/KADbeheTH53CUidrBYFB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(186003)(6862004)(71200400001)(30864003)(2906002)(6506007)(26005)(66446008)(122000001)(38100700002)(4326008)(6636002)(107886003)(53546011)(66556008)(83380400001)(52536014)(5660300002)(41300700001)(66476007)(76116006)(66946007)(316002)(33656002)(8676002)(8936002)(38070700005)(64756008)(82960400001)(55016003)(19627235002)(9686003)(478600001)(54906003)(7696005)(86362001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Upl/4wG9OesBIBxiEyuFo9QAyAp6haOdKMZSVAzz3+aUAIH0v0KRslYbZhWN?=
 =?us-ascii?Q?AT/q55jOPwI0bVVRrT8B0RAdoQxlKCdwE5oO8muUSbnIp6I6feowMvhUd4ZU?=
 =?us-ascii?Q?K567lP0mcXOO2cT6YamrTwkpnt67q+m5JosnS6/qAjaP1pISxBdGUSkyybVm?=
 =?us-ascii?Q?kA4kE8j2R+QRWy0gqxiOgOKa9DdQ3Y1Ovt1KKPnk7YzX6jMYv+CN+d/BqJG2?=
 =?us-ascii?Q?qPKWCJomxM3kRUrouoFFrIrEwpRwyaQHV8NFBAprUnG/l1tyXfPBpAL4yU4W?=
 =?us-ascii?Q?8lxBLobMs7sT0+h/46DV+IOdtDv0cHreDd9lOgH+elwF86vO5/krPWCiar6J?=
 =?us-ascii?Q?V+fe7ftx9XAL7xcX5XtMVRB/2yFxkIk7fef8FK+QKxoAWmuQkufXVkvh/+pM?=
 =?us-ascii?Q?NCFvUxq1UK6ax4TOCqeKM7U7/9bKyHiXKSpw4Em0Xf0EtjVmrI+nW4hgsx31?=
 =?us-ascii?Q?K0ve71PVG2yQ7nXDL+DLW+2fh/cOaJdAoNTJR0Y4dXh1cSv7HsDDwNdyZu6p?=
 =?us-ascii?Q?luhKu74bcZTxIDW1S3Oim7pmy2tnShzkKmlwoW+ty7py3P7uD5SdjfwmoZpR?=
 =?us-ascii?Q?MhopKCbkS9xQBhQllxwSCweplm0ebaFvAaaSf0LMIR/6f9lsEx8yI9VG4+0x?=
 =?us-ascii?Q?PGl6goAMyumk/eRuGXlvlbE17Z1Xa9080fztCgSRNaZXm/aNhGLcrw5taWDE?=
 =?us-ascii?Q?PvKZpVQl74VUS7612l2Znkf0TD9w9zf5+WSmF0ZuH36V3HKu0IHNO21fYfDA?=
 =?us-ascii?Q?Kj4MTJT4DFz4iynHGjKspeuTrFQZc0JTp7Yn9604IlsnKIkmDBFZP78ONPhP?=
 =?us-ascii?Q?kKz8urs/Ol5tmBem5XCINZ+x2Fb+21faRC5SEy6+qWkDEtSMUMD57FKvPOrO?=
 =?us-ascii?Q?l5TKpaIB7Ddnu3GgDdKHBm5eurbtwncGJ/M8hiBg5IaMVG1AnmuVTovzp86n?=
 =?us-ascii?Q?fhMb4l0YqJqRBXzVGk8sgjC4XDWBxoPirS7NREahk1pBZePXAUG5jUZKml8q?=
 =?us-ascii?Q?s768XcplHit8voK/v8e+TNovVP0cSU7BRZ4QWJamrFwZ3FrLlj0enrExm/wT?=
 =?us-ascii?Q?CXjgHYLIjQiyfJIAXuUCnowb1UcSZ+xxw4GG8sPu/2vdPipjqmnOwAHECkYJ?=
 =?us-ascii?Q?1ucTtDZ9agXTLzLFZOQWsRaDcHS7wYJh9TqlCm0tInt0Fhr2QzHsFi8y4nON?=
 =?us-ascii?Q?1Oz+ImACh/xSWvInLtO3dWD7uMOPuFP8ly7afeM7mUmaBjrIFR/kyfOSrr+X?=
 =?us-ascii?Q?H/UwdO8j8IXJ2QMmPPPQHfm+swSiaERdmu98bCspigLW5g03CcHl2CLu3GDz?=
 =?us-ascii?Q?iiGuDrsyiFn66VXiJpOKbuh9vMxGKtTeECffcqExK0W3G9scPzezGRDxrx1y?=
 =?us-ascii?Q?UhthmRYacU3LS02kL+51VJcrIcxPvWk8Oiy16Lzfm1YSRUybmGACm5XEwi8z?=
 =?us-ascii?Q?SxUbkCSeV7u+SXqUdDJ5DFFiYGB0re30kwdzTFh5dtkTp3gnCEI9SyLTrScA?=
 =?us-ascii?Q?8zLOsw4D67ORZkZtf5xC4Eda5yn8B+b8fIJkBXgnjewOKiBtO9E+fYWcPgeK?=
 =?us-ascii?Q?XsJPs7D5nK6td2uN+E1Aenyw36aprXAlrNhK/ePk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45744ee3-d90c-4c91-e2fd-08db8dea80fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 15:10:52.8591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hn58WJ9lBmJ678kKUKmwDX3WZ1q7toJ8j1rZSiFttVcpMteJCtm8iycj674xeCnJB9G5GrG6E760HDik21P5NA6MMxesK4GBLGqWzrgXfVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V8 6/6] drm/xe: Add min/max cap for engine
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, July 26, 2023 7:48 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH V8 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Wed, Jul 26, 2023 at 06:55:50PM +0530, Tejas Upadhyay wrote:
> > Add sysfs entries for the min, max, and defaults for each of engine
> > scheduler controls for every hardware engine class.
> >
> > Non-elevated user IOCTLs to set these controls must be within the
> > min-max ranges of the sysfs entries, elevated user can set these
> > controls to any value. However, introduced compile time CONFIG min-max
> > values which restricts elevated user to be in compile time min-max
> > range if at all sysfs min/max are violated.
> >
> > Sysfs entries examples are,
> > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> > job_timeout_min         preempt_timeout_max     preempt_timeout_us
> timeslice_duration_min
> >
> > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > .defaults/              job_timeout_min         preempt_timeout_max
> preempt_timeout_us      timeslice_duration_min
> > job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> >
> > V8 :
> >    - fix enforce_sched_limit and avoid code duplication - Niranjana
> >    - Make sure min < max - Niranjana
> > V7 :
> >    - Rebase to replace hw engine with eclass interface
> >    - return EINVAL in place of EPERM
> >    - Use some APIs to avoid code duplication
> > V6 :
> >    - Rebase changes to reflect per engine class props interface - MattB
> >    - Use #if ENABLED - MattB
> >    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> > V5 :
> >    - Rebase to resolve conflicts - CI
> > V4 :
> >    - Rebase
> >    - Update commit to reflect tile addition
> >    - Use XE_HW macro directly as they are already filtered
> >      for CONFIG checks - Niranjana
> >    - Add CONFIG for enable/disable min/max limitation
> >      on elevated user. Default is enable - Matt/Joonas
> > V3 :
> >    - Resolve CI hooks warning for kernel-doc
> > V2 :
> >    - Restric min/max setting to #define default min/max for
> >      elevated user - Himal
> >    - Remove unrelated changes from patch - Niranjana
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig                 |   6 +
> >  drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
> >  drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
> >  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 354
> +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   2 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
> >  drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
> >  7 files changed, 481 insertions(+), 6 deletions(-)  create mode
> > 100644 drivers/gpu/drm/xe/Kconfig.profile
> >
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index d44794f99338..0a4ea965645b 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -83,3 +83,9 @@ depends on DRM_XE
> >  depends on EXPERT
> >  source "drivers/gpu/drm/xe/Kconfig.debug"
> >  endmenu
> > +
> > +menu "drm/xe Profile Guided Optimisation"
> > +	visible if EXPERT
> > +	depends on DRM_XE
> > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > +endmenu
> > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > b/drivers/gpu/drm/xe/Kconfig.profile
> > new file mode 100644
> > index 000000000000..e72f15ec4bf6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > @@ -0,0 +1,46 @@
> > +config DRM_XE_JOB_TIMEOUT_MAX
> > +       int "Default max job timeout (ms)"
> > +       default 10000 # milliseconds
> > +       help
> > +         Configures the default max job timeout after which job will
> > +         be forcefully taken away from scheduler.
> > +config DRM_XE_JOB_TIMEOUT_MIN
> > +       int "Default max job timeout (ms)"
> > +       default 1 # milliseconds
> > +       help
> > +         Configures the default min job timeout after which job will
> > +         be forcefully taken away from scheduler.
> > +config DRM_XE_TIMESLICE_MAX
> > +       int "Default max timeslice duration (us)"
> > +       default 10000000 # microseconds
> > +       help
> > +         Configures the default max timeslice duration between multipl=
e
> > +         contexts by guc scheduling.
> > +config DRM_XE_TIMESLICE_MIN
> > +       int "Default min timeslice duration (us)"
> > +       default 1 # microseconds
> > +       help
> > +         Configures the default min timeslice duration between multipl=
e
> > +         contexts by guc scheduling.
> > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > +       int "Default max  preempt timeout (us)"
> > +       default 10000000 # microseconds
> > +       help
> > +         Configures the default max preempt timeout after which contex=
t
> > +         will be forcefully taken away and higher priority context wil=
l
> > +         run.
> > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > +       int "Default min  preempt timeout (us)"
> > +       default 1 # microseconds
> > +       help
> > +         Configures the default min preempt timeout after which contex=
t
> > +         will be forcefully taken away and higher priority context wil=
l
> > +         run.
> > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > +       bool "Default configuration of limitation on scheduler timeout"
> > +       default y
> > +       help
> > +	 Configures the enablement of limitation on scheduler timeout
> > +	 to apply to applicable user. For elevated user, all above MIN
> > +	 and MAX values will apply when this configuration is enable to
> > +	 apply limitation. By default limitation is applied.
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c index 9e167b113963..a558918f9a64
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -12,6 +12,7 @@
> >  #include <drm/xe_drm.h>
> >
> >  #include "xe_device.h"
> > +#include "xe_engine_class_sysfs.h"
> >  #include "xe_gt.h"
> >  #include "xe_hw_fence.h"
> >  #include "xe_lrc.h"
> > @@ -191,8 +192,17 @@ static int engine_set_priority(struct xe_device
> > *xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_de=
vice
> *xe, struct xe_engine *e,
> >  				u64 value, bool create)
> >  {
> > -	if (!capable(CAP_SYS_NICE))
> > -		return -EPERM;
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > +	u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > +#endif
>=20
> The min / max here should just be e->hwe->eclass->sched_props, right? We
> enforce that the user cannot change these values via sysfs to an illegal =
value.

We also enforce elevated user to not violate compile configs min/max when C=
ONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is enabled.

Thanks,
Tejas
>=20
> Matt
>=20
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(value, min, max))
> > +		return -EINVAL;
> >
> >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +211,17 @@
> > static int engine_set_preemption_timeout(struct xe_device *xe,
> >  					 struct xe_engine *e, u64 value,
> >  					 bool create)
> >  {
> > -	if (!capable(CAP_SYS_NICE))
> > -		return -EPERM;
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > +	u32 max =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.preempt_timeout_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.preempt_timeout_max;
> > +#endif
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(value, min, max))
> > +		return -EINVAL;
> >
> >  	return e->ops->set_preempt_timeout(e, value);  } @@ -266,11
> +285,20
> > @@ static int engine_set_persistence(struct xe_device *xe, struct
> > xe_engine *e,  static int engine_set_job_timeout(struct xe_device *xe,
> struct xe_engine *e,
> >  				  u64 value, bool create)
> >  {
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > +	u32 max =3D XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > +#endif
> > +
> >  	if (XE_IOCTL_DBG(xe, !create))
> >  		return -EINVAL;
> >
> > -	if (!capable(CAP_SYS_NICE))
> > -		return -EPERM;
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(value, min, max))
> > +		return -EINVAL;
> >
> >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > index 569d5f89310e..4a749e91de5d 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > @@ -11,6 +11,20 @@
> >
> >  static int xe_add_engine_class_defaults(struct kobject *parent);
> >
> > +bool enforce_schedule_limit(void)
> > +{
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	return true;
> > +#else
> > +	return !capable(CAP_SYS_NICE);
> > +#endif
> > +}
> > +
> > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > +	return timeout >=3D min && timeout <=3D max; }
> > +
> >  static void kobj_xe_engine_release(struct kobject *kobj)  {
> >  	kfree(kobj);
> > @@ -39,11 +53,92 @@ kobj_xe_engine(struct kobject *parent, char
> *name)
> >  	return keclass;
> >  }
> >
> > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > +				     struct kobj_attribute *attr,
> > +				     const char *buf, size_t count) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +	if (timeout < eclass->sched_props.job_timeout_min)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout,
> > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > +				    struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_max_attr =3D
> > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > +job_timeout_max_store);
> > +
> > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > +				     struct kobj_attribute *attr,
> > +				     const char *buf, size_t count) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +	if (timeout > eclass->sched_props.job_timeout_max)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout,
> > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > +				    struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_min_attr =3D
> > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > +job_timeout_min_store);
> > +
> >  static ssize_t job_timeout_store(struct kobject *kobj,
> >  				 struct kobj_attribute *attr,
> >  				 const char *buf, size_t count)
> >  {
> >  	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > +	u32 max =3D XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > +#endif
> >  	u32 timeout;
> >  	int err;
> >
> > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject
> *kobj,
> >  	if (err)
> >  		return err;
> >
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout, min, max))
> > +		return -EINVAL;
> > +
> >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
> >
> >  	return count;
> > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct kobject
> > *kobj,  static struct kobj_attribute job_timeout_def =3D
> > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >
> > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_min_def =3D
> > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > +
> > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_max_def =3D
> > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > +
> >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> >  					struct kobj_attribute *attr,
> >  					const char *buf, size_t count)
> >  {
> >  	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > +	u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > +#endif
> >  	u32 duration;
> >  	int err;
> >
> > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
> >  	if (err)
> >  		return err;
> >
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(duration, min, max))
> > +		return -EINVAL;
> > +
> >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> >
> >  	return count;
> >  }
> >
> > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > +					    struct kobj_attribute *attr,
> > +					    const char *buf, size_t count) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 duration;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &duration);
> > +	if (err)
> > +		return err;
> > +
> > +	if (duration < eclass->sched_props.timeslice_min)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(duration,
> > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > +		struct kobj_attribute *attr,
> > +		char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> > +}
> > +
> > +static struct kobj_attribute timeslice_duration_max_attr =3D
> > +	__ATTR(timeslice_duration_max, 0644,
> timeslice_duration_max_show,
> > +	       timeslice_duration_max_store);
> > +
> > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > +					    struct kobj_attribute *attr,
> > +					    const char *buf, size_t count) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 duration;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &duration);
> > +	if (err)
> > +		return err;
> > +
> > +	if (duration > eclass->sched_props.timeslice_max)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(duration,
> > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > +					   struct kobj_attribute *attr, char
> *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> > +}
> > +
> > +static struct kobj_attribute timeslice_duration_min_attr =3D
> > +	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> > +	       timeslice_duration_min_store);
> > +
> >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11 +327,40
> @@
> > static ssize_t timeslice_default(struct kobject *kobj,  static struct
> > kobj_attribute timeslice_duration_def =3D  __ATTR(timeslice_duration_us=
,
> > 0444, timeslice_default, NULL);
> >
> > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > +				     struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min); }
> > +
> > +static struct kobj_attribute timeslice_duration_min_def =3D
> > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> > +
> > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > +				     struct kobj_attribute *attr, char *buf) {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max); }
> > +
> > +static struct kobj_attribute timeslice_duration_max_def =3D
> > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> > +
> >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> >  				     struct kobj_attribute *attr,
> >  				     const char *buf, size_t count)  {
> >  	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > +	u32 min =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > +	u32 max =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > +	u32 min =3D e->hwe->eclass->sched_props.preempt_timeout_min;
> > +	u32 max =3D e->hwe->eclass->sched_props.preempt_timeout_max;
> > +#endif
> >  	u32 timeout;
> >  	int err;
> >
> > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct
> kobject *kobj,
> >  	if (err)
> >  		return err;
> >
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout, min, max))
> > +		return -EINVAL;
> > +
> >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
> >
> >  	return count;
> > @@ -158,17 +400,129 @@ static ssize_t preempt_timeout_default(struct
> > kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >
> > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > +					   struct kobj_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_min_def =3D
> > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> NULL);
> > +
> > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > +					   struct kobj_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_max_def =3D
> > +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> NULL);
> > +
> > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > +					 struct kobj_attribute *attr,
> > +					 const char *buf, size_t count)
> > +{
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout,
> > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > +					struct kobj_attribute *attr, char *buf)
> {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n",
> > +eclass->sched_props.preempt_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_max_attr =3D
> > +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> > +	       preempt_timeout_max_store);
> > +
> > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> > +					 struct kobj_attribute *attr,
> > +					 const char *buf, size_t count)
> > +{
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > +		return -EINVAL;
> > +
> > +	if (enforce_schedule_limit() &&
> > +	    !engine_timeout_in_range(timeout,
> > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > +					struct kobj_attribute *attr, char *buf)
> {
> > +	struct xe_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > +
> > +	return sprintf(buf, "%u\n",
> > +eclass->sched_props.preempt_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_min_attr =3D
> > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> > +	       preempt_timeout_min_store);
> > +
> >  static const struct attribute *defaults[] =3D {
> >  	&job_timeout_def.attr,
> > +	&job_timeout_min_def.attr,
> > +	&job_timeout_max_def.attr,
> >  	&timeslice_duration_def.attr,
> > +	&timeslice_duration_min_def.attr,
> > +	&timeslice_duration_max_def.attr,
> >  	&preempt_timeout_def.attr,
> > +	&preempt_timeout_min_def.attr,
> > +	&preempt_timeout_max_def.attr,
> >  	NULL
> >  };
> >
> >  static const struct attribute *files[] =3D {
> >  	&job_timeout_attr.attr,
> > +	&job_timeout_min_attr.attr,
> > +	&job_timeout_max_attr.attr,
> >  	&timeslice_duration_attr.attr,
> > +	&timeslice_duration_min_attr.attr,
> > +	&timeslice_duration_max_attr.attr,
> >  	&preempt_timeout_attr.attr,
> > +	&preempt_timeout_min_attr.attr,
> > +	&preempt_timeout_max_attr.attr,
> >  	NULL
> >  };
> >
> > diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > index 683726563059..33c458606117 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > @@ -10,6 +10,8 @@
> >
> >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> >  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> > +bool enforce_schedule_limit(void);
> > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >
> >  /**
> >   * struct kobj_eclass - A eclass's kobject struct that connects the
> > kobject and the diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 96c32a815c90..06a98ea9800b 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt
> > *gt, struct xe_hw_engine *hwe,
> >
> >  	if (!gt->eclass[hwe->class].init_done) {
> >  		gt->eclass[hwe->class].sched_props.job_timeout_ms =3D HZ *
> 5;
> > +		gt->eclass[hwe->class].sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > +		gt->eclass[hwe->class].sched_props.job_timeout_max =3D
> > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> >  		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1 * 1000;
> > +		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> > +		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> > +XE_HW_ENGINE_TIMESLICE_MAX;
> >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us =3D
> 640 * 1000;
> > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =3D
> > +
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =3D
> > +
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> >  		/* Record default props */
> >  		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> >class].sched_props;
> >  		gt->eclass[hwe->class].init_done =3D true; diff --git
> > a/drivers/gpu/drm/xe/xe_hw_engine.h
> > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index 7eca9d53c7b1..3d37d6d44261 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -10,6 +10,37 @@
> >
> >  struct drm_printer;
> >
> > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
> CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > +#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> > +XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> XE_HW_ENGINE_TIMESLICE_MIN
> > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> XE_HW_ENGINE_TIMESLICE_MIN
> > +1 #endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> > +XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> #else #define
> > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> > +
> >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > xe_hw_engines_init(struct xe_gt *gt);  void
> > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > --
> > 2.25.1
> >
