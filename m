Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C94EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 10:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4457F10E52F;
	Thu, 22 Jun 2023 10:06:03 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0827510E52F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687428362; x=1718964362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uT083uSVmZYVCt20o33O96Yv0/bRESeS4B2raVcfQvo=;
 b=Jw5XuJ//SZ0DzoeTfH57tvxm0A6/az5PbkYsO/LeXkabFRZqArPK9eW1
 hp875DWslxNoZq+SuRVm7bmBPlK6/plGvt7IcBDKOv8RktrgQNG2/dKTs
 VfEWM6Bf8ten9yXVGn7P0b3tO0npH9sZb9aYDYMR8yH1/OeREQFABvfBD
 AHg5JTdv787slSnk6RFMGDrSbmOc7vkcWY2gwiP3tXwB8Nmxurd7aRUaF
 NlbWGY3ozRzVNv2oOVXqlpQgQqHB03t0qkFbV87xF3cQD2Mcw0OqPyU5i
 4VZtCCwsnEMI9HItr5YQq7cqitGrExrPk0oMlFB97hXxk9q6/A0jvZhmD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="362978835"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="362978835"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="665003987"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="665003987"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 03:06:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 03:06:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 03:06:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 03:05:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDBKoeSzy23+QDlMFjWLVBHP6p1YToawMHhpFfMtRDiqRFTF/pZjH4IyPtAF5KYkPmqWAC/o3+2+JWuCyA/k7+BQFZpivAZlno5F5CAmokY6NezhKwQO8aCvYpfr/+JcvjepPgJUw8N7+xQP+iGV+riqO/AfIPzUqu9iu/O31Qur/5eLNZ4crLNeD3zAG6HutNpH6XWwWkaWKS9O+t3WVOVRbdpuGcfxvUe3Zb3mdn+5J0IUl6rnIZNO62iJ2I5Bo0XqRczrekigm3fYJyQGBUmzmGD8N9ehrayLtDfV/vdkAKGhmifIqjWN9PprYHfHHbETbB1FngFtoVkZJk/CZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI6XfEO77LHiPoHwclpzQuRzOBNFUNQYOgmoEzCL8uc=;
 b=C986Qq/IGTOQwco/NgqTJ/3IAmdz0oCxJZEREcf2i4jD53WiE2v6vfig6ldlx0GTXeCh0pNT8zywBtSxBMPQCg3MyXIlhwbEQduLCZxGrHX69g+Rx646Iw6aKA3PT150RHppX6xWbf6tJzVF4hsM5vGSHQo/uIL1yfnYgRM9dexE5ixANQOsgimH3UDe5T4boUkvzsz+mE8JpglVLyMCE8pupBWuqR93iNLsCmOB0vF02PJ8s7Ai8Z38J5q/hK+loXFQLvaq+nPkQdLwZ/lR5z2bYp62hNk1UWsXlq49/Uo25ajVJX4R6cYXePD1tQL/EqLjeWSXEbeE1hCM1mhB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 10:05:57 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 10:05:57 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZn5Opt7weKax8N0aPHY1M0eyYQq+Wm+8AgAAGkdA=
Date: Thu, 22 Jun 2023 10:05:57 +0000
Message-ID: <SJ1PR11MB6204A9A2EF7F706F8AE1248E8122A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
 <MW4PR11MB7056A594D469F574838332A8B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056A594D469F574838332A8B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB5327:EE_
x-ms-office365-filtering-correlation-id: 99e523ae-49a6-4207-b030-08db730845c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ugSC9pxka0W5wk+HJFkBEoaMIYMDV6RiMiB5o25Ng/J4GtKlmRtcEm7b4+DDPxRthFPRj1/FLyLVTHhaNvTi5v3J8NhL25ybxm0asCe+h5kamWIQqZZmGsa8h01ILVSfWsRpX6DxEuCKl8ERUpqEKONzYX6j6F1daZJjsQtee6n6jWDeKUIk6CVwTGI8hM3gx9640ALk16S1dBq9Rj3aIuCgmhzZ1oIwhCW+W9m1bMdSsB8KFQAKhQQAPUZ5G0Mi0foRttalBpyVKqZcFIvC6rz6eU8qVAZya4J7ViiiOAExH4h0hddpU2gYsGS7pNkf7V2Hnd4QgVl9pHk0HwDkGTg2L1zr3nDAdvml3nMkc1+vuO1I5KD+JqfOHB3R9z+0YeVZ7B/32yOZqS3DMD7uQXMSV3oeCyUbe+iumPC8rfNO0rumjbzzbn/VcLts9rgIdQ2tEL3coeSbQfT1NWIiRyyWseLqy7fUWXaOnDJIQYtjFdAhLSWWu8ADGQ4CKfV/PAlmd50fkH31lqXA1AEpgiLD7Alx4Zl5xK415ENjNfhgjnd389WGh7WNDH4H8eS7Zsig4bNoJRFW2F5P51rTfz0zEmUhR+iRJA3viqQjfJBGZ0jxPl0TnIliiYzCnbRE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(478600001)(71200400001)(107886003)(7696005)(53546011)(5660300002)(83380400001)(6506007)(52536014)(110136005)(54906003)(76116006)(4326008)(66946007)(8676002)(41300700001)(66446008)(64756008)(66556008)(66476007)(8936002)(33656002)(30864003)(2906002)(9686003)(186003)(38100700002)(122000001)(38070700005)(82960400001)(316002)(55016003)(86362001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ihpV0sKHthSRPU/LIXcETaa6N4wIZ3FMc8WENVYzaqnnUqu2ws9mn2YgPv2s?=
 =?us-ascii?Q?SjZAjVEZqJyE+4y8gqFHb5mDT7KNovxSRn8JlPnhsnTJWYjH1sV9FQadIog4?=
 =?us-ascii?Q?appr8Wly9uZT7dXaoOjssg9EA1VN9DnxxlBAn9t1Tx5MUsstNBtaOAhZi5aL?=
 =?us-ascii?Q?/FvAM6zVq97iY0WzgwmXJM9n5SvRYiyUZaBwyGewNKQN8k8hZVkGalxrV0B2?=
 =?us-ascii?Q?QDqczSbEXQSvT/s8nIcQTJK0H7ePgQgq8v54aYPkbTeCbultMsmX5zdkecM9?=
 =?us-ascii?Q?9t/QSnI5iCm51+txrT2nR91jVMwapc+u0LS+66W7OtgAH3mo13Pgt7RBvJk8?=
 =?us-ascii?Q?S/P06xJ61uzovf2kSR3a/5jPKkWg/G57bfSsR4p67NUEm1uSSyKhSdP/6TkB?=
 =?us-ascii?Q?vQgJ5++4/q3DZhfrDuOptrSY9CLpCRKd2gn8z9yjGnlTKTZo9cQBk5ArFX6w?=
 =?us-ascii?Q?vijN1gFgvKlDLvD7qbPmvkXBHvtDhLpKR8bbRsFahUs03V3rWzu4NwGuvVfP?=
 =?us-ascii?Q?Q96eXnVsq4sT55O6XsDIVmCnwAExNSfwzasbQm4xPhhUSSs4n4KP9tex20qi?=
 =?us-ascii?Q?pkgqwvFAjBRPMZTbUe/GDoRQO295aWCJrtz52YOByhvvtCV+q8xjNjhb28Uh?=
 =?us-ascii?Q?BmE8JqAl5bbS3ZDecsHNObmBS2XfkX0N9zI/zA/NXpY70rtDfy6sXMtXaKVs?=
 =?us-ascii?Q?lGxLyiycKIw/KMjGM1onN539Nr7UXUIZayglPErE3xKAfsdRLJwT5hUAN0sO?=
 =?us-ascii?Q?2qR3Qt4BHNzp+4bB9lh+xNDwoY2ahzfQ2Fz1ZXNEPqFndK4f6IdhC0NvbRgD?=
 =?us-ascii?Q?V3CRnvwZRIMHxLZHHCwQZMD+K1baKAp+GDJu8ydqiDsQL5o+Y6hdvUWZNEAf?=
 =?us-ascii?Q?HEb5dmQqhPq2JVVyd27VMzgO05BX8yPywkveaSCLqhbfdXDJJuhSYjlbKqAk?=
 =?us-ascii?Q?+G7Sf0RfzkehZ2AwFTi0ueeCZrQAnTCfY8g3mgVzoXIpNNihWOneIzA+A8za?=
 =?us-ascii?Q?VeDpZd10URRwMxZUlzG1JWUJCuWdRvuaTKbmvZiCs8RAVG2x0HKaz8263Wyu?=
 =?us-ascii?Q?urlocU6EC0DpJRdFAnQocRLFBy32qJLbPtuSjCvV2phRdmYvXhedCN4o4eVH?=
 =?us-ascii?Q?/ic/kvdBBE8thhJNBPfC+gj10zVM1TA24TKndVCSrr9LYB+px7a4P7ENHzQ3?=
 =?us-ascii?Q?7P1wbMLWXoXs3jGJ0WbQbqrtSSRxL9+nK87zSA0z3UNI0PTZBZk1TdFQzD7O?=
 =?us-ascii?Q?w20F5BisSSbMKDPQJ/AGrIBIUSxwiguKACCDYHC9johduYUbVaUyCevn82pH?=
 =?us-ascii?Q?KjSQ3SL17X7d1iN6CsbkCsU8TTO3GF46/T0hKmsFgnzjC+cgpxLHcZp2Yd72?=
 =?us-ascii?Q?bGPknbEwFg/KEYPBxnTt5ikqouLQH+HpTR2EBRemRWVSMHiGTKycLkiCx54K?=
 =?us-ascii?Q?3ahSvMgiuPEOKvvKU4TSwkdtiCv4OZ/EogW+DzK20tGNaLfDxlSI8K76hJAV?=
 =?us-ascii?Q?clC6u/gupWBA0cQQU71QJVPxc3RazPq2GBQWl0PDsR4OveYZcv7zr8zMJRZB?=
 =?us-ascii?Q?d1ABOIIB6X833MVe+QZ4hML1lkgSldd8Z3CvkI7s5BCkb8fRPbbeIgJ6TKf5?=
 =?us-ascii?Q?NjmZuMSp3o1JNCpDevelHF5/FWiAMNFpEooYBJj687iV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e523ae-49a6-4207-b030-08db730845c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 10:05:57.0362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5XmVGP6zFa6Qm/DTtLsoukVU9utKGOvWHVb6Cjy+M68mzAlj138l5dkqpBnGgsDH3quIAKp/hiZXDUbD1VpJWPDYAvMVyOgs/zvKNWLW1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Thursday, June 22, 2023 3:10 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: RE: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
>=20
> Hi Tejas,
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: 15 June 2023 19:50
> > To: intel-xe@lists.freedesktop.org
> > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Ghimiray,
> > Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
> > properties
> >
> > Add sysfs entries for the min, max, and defaults for each of engine
> > scheduler controls for every hardware engine class.
> >
> > Non-elevated user IOCTLs to set these controls must be within the
> > min-max ranges of the sysfs entries, elevated user can set these contro=
ls to
> any value.
> >
> > Introducing compile time CONFIG min-max values which restricts
> > elevated user to be in compile time min-max range if at all sysfs min/m=
ax
> are violated.
> >
> > Sysfs entries examples are,
> > DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
> > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > timeslice_duration_max  timeslice_duration_us
> > job_timeout_min         preempt_timeout_max     preempt_timeout_us
> > timeslice_duration_min
> >
> > DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
> > .defaults/              job_timeout_min         preempt_timeout_max
> > preempt_timeout_us      timeslice_duration_min
> > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > timeslice_duration_max  timeslice_duration_us
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig              |   7 +
> >  drivers/gpu/drm/xe/Kconfig.profile      |  39 +++
> >  drivers/gpu/drm/xe/xe_engine.c          |  40 ++-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 373 ++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> >  drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h |  12 +
> >  8 files changed, 485 insertions(+), 24 deletions(-)  create mode
> > 100644 drivers/gpu/drm/xe/Kconfig.profile
> >
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index
> > d44794f99338..964c440a1135 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -83,3 +83,10 @@ depends on DRM_XE
> >  depends on EXPERT
> >  source "drivers/gpu/drm/xe/Kconfig.debug"
> >  endmenu
> > +
> > +menu "drm/xe Profile Guided Optimisation"
> > +        visible if EXPERT
> > +        depends on DRM_XE
> > +        source "drivers/gpu/drm/xe/Kconfig.profile"
> > +endmenu
> > +
> > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > b/drivers/gpu/drm/xe/Kconfig.profile
> > new file mode 100644
> > index 000000000000..cffd73e44ca9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > @@ -0,0 +1,39 @@
> > +config DRM_XE_JOB_TIMEOUT_MAX
> > +	int "Default max job timeout (ms)"
> > +	default 10000 # milliseconds
> > +	help
> > +	  Configures the default max job timeout after which job will
> > +	  be forcefully taken away from scheduler.
> > +config DRM_XE_JOB_TIMEOUT_MIN
> > +	int "Default max job timeout (ms)"
> > +	default 1 # milliseconds
> > +	help
> > +	  Configures the default min job timeout after which job will
> > +	  be forcefully taken away from scheduler.
> > +config DRM_XE_TIMESLICE_MAX
> > +	int "Default max timeslice duration (us)"
> > +	default 10000000 # microseconds
> > +	help
> > +	  Configures the default max timeslice duration between multiple
> > +	  contexts by guc scheduling.
> > +config DRM_XE_TIMESLICE_MIN
> > +	int "Default min timeslice duration (us)"
> > +	default 1 # microseconds
> > +	help
> > +	  Configures the default min timeslice duration between multiple
> > +	  contexts by guc scheduling.
> > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > +	int "Default max  preempt timeout (us)"
> > +	default 10000000 # microseconds
> > +	help
> > +	  Configures the default max preempt timeout after which context
> > +	  will be forcefully taken away and higher priority context will
> > +	  run.
> > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > +	int "Default min  preempt timeout (us)"
> > +	default 1 # microseconds
> > +	help
> > +	  Configures the default min preempt timeout after which context
> > +	  will be forcefully taken away and higher priority context will
> > +	  run.
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c index e72423bc398a..c368ffd5e461
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -13,6 +13,7 @@
> >
> >  #include "xe_device.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_sysfs.h"
> >  #include "xe_hw_fence.h"
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> > @@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device
> > *xe, struct xe_engine *e,  static int engine_set_timeslice(struct
> > xe_device *xe, struct xe_engine *e,
> >  				u64 value, bool create)
> >  {
> > -	if (!capable(CAP_SYS_NICE))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +				     e->hwe->sched_props.timeslice_min,
> > +				     e->hwe->sched_props.timeslice_max))
> >  		return -EPERM;
> >
> > +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> > defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> > +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> > +		return -EPERM;
> > +#endif
> > +
> Incase of CONFIG being not defined, you are allowing privileged user to s=
et
> any value which seems wrong.
> If CONFIGS are not set,  for privileged user the limit should be same as
> unprivileged user.
> Same applies to other routines too.
>=20
> BR
> Himal Ghimiray,

Yes had two options in mind, either use configured min/max as cap or use de=
fined (not compile config) defaults as limit factor. But wanted to discuss =
first, which option looks better.

Thanks,
Tejas=20
> >  	return e->ops->set_timeslice(e, value);  }
> >
> > @@ -201,8 +213,19 @@ static int engine_set_preemption_timeout(struct
> > xe_device *xe,
> >  					 struct xe_engine *e, u64 value,
> >  					 bool create)
> >  {
> > -	if (!capable(CAP_SYS_NICE))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +				     e->hwe-
> > >sched_props.preempt_timeout_min,
> > +				     e->hwe-
> > >sched_props.preempt_timeout_max))
> > +		return -EPERM;
> > +
> > +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >  		return -EPERM;
> > +#endif
> >
> >  	return e->ops->set_preempt_timeout(e, value);  } @@ -269,8
> > +292,19 @@ static int engine_set_job_timeout(struct xe_device *xe,
> > +struct
> > xe_engine *e,
> >  	if (XE_IOCTL_ERR(xe, !create))
> >  		return -EINVAL;
> >
> > -	if (!capable(CAP_SYS_NICE))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +				     e->hwe->sched_props.job_timeout_min,
> > +				     e->hwe->sched_props.job_timeout_max))
> > +		return -EPERM;
> > +
> > +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(value,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >  		return -EPERM;
> > +#endif
> >
> >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > index f88f8f7dfc7b..415b60845eef 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > @@ -32,6 +32,11 @@ static struct kobj_type kobj_xe_engine_type =3D {
> >  	.sysfs_ops =3D &kobj_sysfs_ops
> >  };
> >
> > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > +	return timeout >=3D min && timeout <=3D max; }
> > +
> >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> >  				     struct kobj_attribute *attr,
> >  				     const char *buf, size_t count) @@ -44,9
> > +49,20 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
> >  	if (err)
> >  		return err;
> >
> > -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(timeout,
> > +				     hwe-
> > >sched_props.preempt_timeout_min,
> > +				     hwe-
> > >sched_props.preempt_timeout_max))
> >  		return -EINVAL;
> >
> > +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(timeout,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> >  	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> >
> >  	return count;
> > @@ -63,6 +79,78 @@ static ssize_t preempt_timeout_show(struct kobject
> > *kobj,  static struct kobj_attribute preempt_timeout_attr =3D
> > __ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> > preempt_timeout_store);
> >
> > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > +					 struct kobj_attribute *attr,
> > +					 const char *buf, size_t count)
> > +{
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> > +	if (!engine_timeout_in_range(timeout,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > +					struct kobj_attribute *attr, char *buf)
> > {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe-
> > >sched_props.preempt_timeout_max);
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
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> > +	if (!engine_timeout_in_range(timeout,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> > +
> > CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > +					struct kobj_attribute *attr, char *buf)
> > {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe-
> > >sched_props.preempt_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_min_attr =3D
> > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> > +	       preempt_timeout_min_store);
> > +
> >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> >  		struct kobj_attribute *attr,
> >  		const char *buf, size_t count)
> > @@ -75,8 +163,19 @@ static ssize_t timeslice_duration_store(struct
> > kobject *kobj,
> >  	if (err)
> >  		return err;
> >
> > -	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(duration,
> > +				     hwe->sched_props.timeslice_min,
> > +				     hwe->sched_props.timeslice_max))
> > +		return -EINVAL;
> > +
> > +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> > defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(duration,
> > +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> > +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >  		return -EINVAL;
> > +#endif
> >
> >  	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
> >
> > @@ -95,6 +194,79 @@ static struct kobj_attribute
> > timeslice_duration_attr =3D __ATTR(timeslice_duration_us, 0644,
> > timeslice_duration_show, timeslice_duration_store);
> >
> > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > +					    struct kobj_attribute *attr,
> > +					    const char *buf, size_t count) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 duration;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &duration);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> > defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> > +	if (!engine_timeout_in_range(duration,
> > +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> > +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > +					   struct kobj_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max); }
> > +
> > +static struct kobj_attribute timeslice_duration_max_attr =3D
> > +	__ATTR(timeslice_duration_max, 0644,
> > timeslice_duration_max_show,
> > +	       timeslice_duration_max_store);
> > +
> > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > +					    struct kobj_attribute *attr,
> > +					    const char *buf, size_t count) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 duration;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &duration);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> > defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> > +	if (!engine_timeout_in_range(duration,
> > +				     CONFIG_DRM_XE_TIMESLICE_MIN,
> > +				     CONFIG_DRM_XE_TIMESLICE_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > +					   struct kobj_attribute *attr, char
> > *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min); }
> > +
> > +static struct kobj_attribute timeslice_duration_min_attr =3D
> > +	__ATTR(timeslice_duration_min, 0644,
> > timeslice_duration_min_show,
> > +	       timeslice_duration_min_store);
> > +
> >  static ssize_t job_timeout_store(struct kobject *kobj,
> >  		struct kobj_attribute *attr,
> >  		const char *buf, size_t count)
> > @@ -107,8 +279,19 @@ static ssize_t job_timeout_store(struct kobject
> > *kobj,
> >  	if (err)
> >  		return err;
> >
> > -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> > +	if (!capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(timeout,
> > +				     hwe->sched_props.job_timeout_min,
> > +				     hwe->sched_props.job_timeout_max))
> > +		return -EINVAL;
> > +
> > +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> > +	if (capable(CAP_SYS_NICE) &&
> > +	    !engine_timeout_in_range(timeout,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >  		return -EINVAL;
> > +#endif
> >
> >  	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
> >
> > @@ -126,6 +309,89 @@ static ssize_t job_timeout_show(struct kobject
> > *kobj,  static struct kobj_attribute job_timeout_attr =3D
> > __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> >
> > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > +				     struct kobj_attribute *attr,
> > +				     const char *buf, size_t count) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> > +	if (!engine_timeout_in_range(timeout,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > +				    struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_max_attr =3D
> > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > +job_timeout_max_store);
> > +
> > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > +				     struct kobj_attribute *attr,
> > +				     const char *buf, size_t count) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +	u32 timeout;
> > +	int err;
> > +
> > +	err =3D kstrtou32(buf, 0, &timeout);
> > +	if (err)
> > +		return err;
> > +
> > +#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> > defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> > +	if (!engine_timeout_in_range(timeout,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> > +				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> > +		return -EINVAL;
> > +#endif
> > +
> > +	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > +				    struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> > +
> > +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_min_attr =3D
> > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > +job_timeout_min_store);
> > +
> > +static const struct attribute *files[] =3D {
> > +	&job_timeout_attr.attr,
> > +	&job_timeout_min_attr.attr,
> > +	&job_timeout_max_attr.attr,
> > +	&timeslice_duration_attr.attr,
> > +	&timeslice_duration_min_attr.attr,
> > +	&timeslice_duration_max_attr.attr,
> > +	&preempt_timeout_attr.attr,
> > +	&preempt_timeout_min_attr.attr,
> > +	&preempt_timeout_max_attr.attr,
> > +	NULL
> > +};
> > +
> >  static ssize_t job_timeout_default(struct kobject *kobj,
> >  				 struct kobj_attribute *attr, char *buf)  { @@
> > -137,6 +403,28 @@ static ssize_t job_timeout_default(struct kobject
> > *kobj, static struct kobj_attribute job_timeout_def =3D
> > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >
> > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min); }
> > +
> > +static struct kobj_attribute job_timeout_min_def =3D
> > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > +
> > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max); }
> > +
> > +static struct kobj_attribute job_timeout_max_def =3D
> > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > +
> >  static ssize_t timeslice_default(struct kobject *kobj,
> >  				 struct kobj_attribute *attr, char *buf)  { @@
> > -148,6 +436,28 @@ static ssize_t timeslice_default(struct kobject
> > *kobj, static struct kobj_attribute timeslice_duration_def =3D
> > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> >
> > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > +				     struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min); }
> > +
> > +static struct kobj_attribute timeslice_duration_min_def =3D
> > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> > +
> > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > +				     struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max); }
> > +
> > +static struct kobj_attribute timeslice_duration_max_def =3D
> > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> > +
> >  static ssize_t preempt_timeout_default(struct kobject *kobj,
> >  				       struct kobj_attribute *attr,
> >  				       char *buf)
> > @@ -160,6 +470,43 @@ static ssize_t preempt_timeout_default(struct
> > kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >
> > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > +					   struct kobj_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_min_def =3D
> > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> > NULL);
> > +
> > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > +					   struct kobj_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_max_def =3D
> > +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> > NULL);
> > +
> > +static const struct attribute *defaults[] =3D {
> > +	&job_timeout_def.attr,
> > +	&job_timeout_min_def.attr,
> > +	&job_timeout_max_def.attr,
> > +	&timeslice_duration_def.attr,
> > +	&timeslice_duration_min_def.attr,
> > +	&timeslice_duration_max_def.attr,
> > +	&preempt_timeout_def.attr,
> > +	&preempt_timeout_min_def.attr,
> > +	&preempt_timeout_max_def.attr,
> > +	NULL
> > +};
> > +
> >  int xe_add_engine_defaults(struct kobject *parent)  {
> >  	struct kobject *kobj;
> > @@ -175,15 +522,7 @@ int xe_add_engine_defaults(struct kobject
> *parent)
> >  	if (err)
> >  		goto err_object;
> >
> > -	err =3D sysfs_create_file(kobj, &job_timeout_def.attr);
> > -	if (err)
> > -		goto err_object;
> > -
> > -	err =3D sysfs_create_file(kobj, &timeslice_duration_def.attr);
> > -	if (err)
> > -		goto err_object;
> > -
> > -	err =3D sysfs_create_file(kobj, &preempt_timeout_def.attr);
> > +	err =3D sysfs_create_files(kobj, defaults);
> >  	if (err)
> >  		goto err_object;
> >
> > @@ -286,15 +625,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> >  			return err;
> >  		}
> >
> > -		err =3D sysfs_create_file(&khwe->base,
> > &job_timeout_attr.attr);
> > -		if (err)
> > -			goto err_object;
> > -
> > -		err =3D sysfs_create_file(&khwe->base,
> > &timeslice_duration_attr.attr);
> > -		if (err)
> > -			goto err_object;
> > -
> > -		err =3D sysfs_create_file(&khwe->base,
> > &preempt_timeout_attr.attr);
> > +		err =3D sysfs_create_files(&khwe->base, files);
> >  		if (err)
> >  			goto err_object;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > index a539cf031c7d..a7ac7b9a9768 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > @@ -12,6 +12,7 @@
> >
> >  int xe_gt_sysfs_init(struct xe_gt *gt);  int
> > xe_gt_sysfs_engines(struct xe_gt *gt);
> > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >
> >  static inline struct xe_gt *
> >  kobj_to_gt(struct kobject *kobj)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 8314429cfa90..e52324eb1efa 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt
> > *gt, struct xe_hw_engine *hwe,
> >  	hwe->engine_id =3D id;
> >  	/* FIXME: Wire up to configurable default value */
> >  	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> > +	hwe->sched_props.job_timeout_min =3D
> > XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > +	hwe->sched_props.job_timeout_max =3D
> > XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> >  	hwe->sched_props.timeslice_us =3D 1 * 1000;
> > +	hwe->sched_props.timeslice_min =3D
> > XE_HW_ENGINE_TIMESLICE_MIN;
> > +	hwe->sched_props.timeslice_max =3D
> > XE_HW_ENGINE_TIMESLICE_MAX;
> >  	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> > +	hwe->sched_props.preempt_timeout_min =3D
> > XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > +	hwe->sched_props.preempt_timeout_max =3D
> > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> >  	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >
> >  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt)); diff --git
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
> > CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > +#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> > +XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> > XE_HW_ENGINE_TIMESLICE_MIN
> > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > XE_HW_ENGINE_TIMESLICE_MIN 1
> > +#endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> > +XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> #else
> > #define
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
> > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec); diff
> > --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 406a1e33a05e..8582193b4947 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -111,10 +111,22 @@ struct xe_hw_engine {
> >  	struct {
> >  		/** @set_job_timeout: Set job timeout in ms for engine */
> >  		u32 job_timeout_ms;
> > +		/** @job_timeout_min: Min job timeout in ms for engine */
> > +		u32 job_timeout_min;
> > +		/** @job_timeout_max: Max job timeout in ms for engine */
> > +		u32 job_timeout_max;
> >  		/** @timeslice_us: timeslice period in micro-seconds */
> >  		u32 timeslice_us;
> > +		/** @timeslice_min: min timeslice period in micro-seconds
> > */
> > +		u32 timeslice_min;
> > +		/** @timeslice_max: max timeslice period in micro-seconds
> > */
> > +		u32 timeslice_max;
> >  		/** @preempt_timeout_us: preemption timeout in micro-
> seconds */
> >  		u32 preempt_timeout_us;
> > +		/** @preempt_timeout_min: min preemption timeout in
> > micro-seconds */
> > +		u32 preempt_timeout_min;
> > +		/** @preempt_timeout_max: max preemption timeout in
> > micro-seconds */
> > +		u32 preempt_timeout_max;
> >  	} sched_props, defaults;
> >  	/** @sysfs: sysfs kobject pointing to this hwe */
> >  	struct kobject *sysfs_hwe;
> > --
> > 2.25.1

