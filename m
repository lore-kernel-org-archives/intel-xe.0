Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7BBEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 04:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160F910E021;
	Thu, 29 Jun 2023 04:19:19 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6697F10E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 04:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688012356; x=1719548356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tr8+vGs29MN/kbRECDNZYqt2pzv+Xng/Bt4ZMZF6VHA=;
 b=cDx8ZK+4negslNRzrFp2TRWDsIO9E1vA5XHkRxI/K7YudD06kVRCqjlF
 7b2Tt3i5FNO2n3Bh+tRhZ1108eds5msHmOuKAMvC32M1sSOw8xCc48p2L
 7O+uv8Xos2pBeJxio8Dovewace7eX+rtQuGppJ7kDON5P7Zfa2rRxZBPN
 rhuwMm/9yBR8Fyzh9NmaERmmMhTTCAEvldAR42VKJl+s7Qb+k+HEbE8jt
 7grqG2OAcCeeEb2CG0pvydjfBgKSO9rorGGPjmHnCCWTWpw0fVP3GWr3P
 1QHedak8fHuTuCtIvfY8zLFmw3RXTzOZiQwgTH4lgP/ZW5UKozCzd5QfZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="342354986"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="342354986"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 21:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="782537784"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="782537784"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2023 21:19:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:19:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 21:19:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 21:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnhUyzuoPqB1Ddhe+dErbuT5F5kEPd0YPD4GPKZm5gN0UCHqZ95jX2crVQ41Osi2tDteGp+XZ5tim5J6c0zjSX1BaC6TTEJFpOMiB/znuivYPRe+mzTz8372a4UCFYhgk+CKw/rzx6Zrj4fITZ7bw/uLglGFM0wXgBGVuHqy+RUZ/GX9wZ2f2YSr9DtoQ64nm1QIfloyXm+VfxbW9FrvflLDWqgquF/OhZoY0jcgMeeAJhHEtwow39c2JB+EwgmNEm9CHlDyZJmEDhan5N3YJWhVZfq5Z3tWLCoCOjHLehne2zqqnIc8nY9DjyVYu5/inP6JuY+91ELFwCx08zT7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGpP369Dkqa1hkKCJVvPLQNC5UacEkLrYFiUtwxhASM=;
 b=R7we9gAPzbfDX21Mj67DA8alwctAtVw96C+wKPsRP6r9HmbA+vQvtzHnM3huZbStkbRjFolMZj8VKvPRaZgbW7/X1AXeqmqY23maWnzWscoVfdvgP2VUAabyiOdUXNIxPEejek/GihE7Cm7CAgRZPPILe/RxgmIoXK9Po3AMKcFMWhqkoo9lxNuLM3WAyjamjI+d1qd0JPJXjvRLEv0UOQ6d7og0rKlht/62l0dti5EqAaHW1Ly1AV9iQ7qsYxuRcOwvbfwjN+XyJbOjeEYgrdp9fKS/KQnPMK2NB0zT0e7MWBd645abP2z4GAxaZV73m3BL/IGZYzTJ171pvxovAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 04:19:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 04:19:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
Thread-Index: AQHZqbWB4dmXTEEAV0KOs61wPsVEyq+gzz4AgABaKkA=
Date: Thu, 29 Jun 2023 04:19:10 +0000
Message-ID: <SJ1PR11MB6204DE43A6D3CC609D8DD5938125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-7-tejas.upadhyay@intel.com>
 <ZJy2hLdxM4DDhl8P@nvishwa1-DESK>
In-Reply-To: <ZJy2hLdxM4DDhl8P@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: 5da0de0c-c89d-454e-cb5f-08db7857fd0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+GSgc7P5zT+2e1GzJqT3AWQVad8K58xZ90jqVNf25EcbOMpUC++TTg022lpyoKoirIKx80MM4xZsspMBlXGLdEiLPnreJDy9aIYs6iaWn/65n3hT2fdFVgvMZzeEEiTj3TLPp4WcGFV064Badd8RTD4Rq+Xt9qz6pfN16zanOKjBmwlRQtjHWcVsigmTjYYwiDfkFXsLiqeWHMwscNhLOwF4kKPuU8Ml0TgR4irbe3YC32VrkCBxWRoqASTDI5YFiwuIvkxGyPkR2xBvtZx088H73KTNsqXExzKnC2RfqoM6uwWMfqD8kiJpNWyj7//1v0fVgdl5eqa6FVms/euacj7gPgLrmEXSonVewJ+LrUIgDShvHpOT5rNQde01qC9En9g5sPP4O57o4CCBKac75utEonZV3VC/dvVAsSpwzvyiIpjr6vUFmQOuI1Ufi4/iCEk2LEea3GBWCAauX+VN42reOwU3yvvNzx4ZZa040G0IzxYVJTihZAKikiSgRBTkDFSiyCpa8kDqkVBNvUPNLbxu4a8NOcaYaYR9Ka9vu1IsO0Ccy+Q0kro+DUlgfbxsA+r9kUsW70GHuh9umvo+S7XhGbwH+5mhu1T0gvUcXgbTQ1BteLvoCm0pXZ6icXI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(5660300002)(6506007)(52536014)(33656002)(64756008)(66556008)(316002)(66946007)(66446008)(478600001)(4326008)(66476007)(76116006)(6636002)(6862004)(8676002)(8936002)(86362001)(2906002)(9686003)(55016003)(41300700001)(7696005)(186003)(30864003)(38070700005)(71200400001)(53546011)(83380400001)(38100700002)(122000001)(82960400001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NPK6MPF706heG+Ob6GQAsuq6e7uKxeC7U0qvJjkDfn1hV4VKEyubFbyw3y+5?=
 =?us-ascii?Q?RRcD2gmmA3qjHiMXZf2iN+80yu0WM6hRadIk1WmmrR/akpaPfS9CRk4LOGAl?=
 =?us-ascii?Q?+umcJ4m+CQWwJFjmZ/v4lq4AhWhLGeYkFYk0YnM7DQAB72Nb7nnoZ5q6DX91?=
 =?us-ascii?Q?EvOEkRBnGv1VaVvDGcFh/GDNvW6rFuCM8nTynAtlL+bP6fkSgjTj8cuwPRbN?=
 =?us-ascii?Q?QM48KeNcr999KOgugN84eHGNeybM/9jNI+DwH6jI0AbINMd1vcLn/A4e8726?=
 =?us-ascii?Q?oQjXsKw5HPjgplVXDhebtpPIepoffcPHcw4AvluZfRiTGLo3EdWaZqz1Jfao?=
 =?us-ascii?Q?3UF210xOyYkBb3bv5/zU/iPxza5gCxJr2d42XJiaQ3wxjZ7qvVDtH4lcYRp5?=
 =?us-ascii?Q?Mzg7noAluIrylsjWfEncpweDMNZ9vjw6B9NzARuuLQCqY+Y/FMYrE/IfH4yn?=
 =?us-ascii?Q?+72HZ1UCzpg00kH7D+p6flfXItOotncuUoC5W5mgYttG27Xb95z4VlBfQ0Ul?=
 =?us-ascii?Q?TweaC4r3W6imuJ5yA/D9V0SvpRbWQIG6un7jZEt7L+jI64aDi9oW0CfwZ/ff?=
 =?us-ascii?Q?R2coAvnzRZgU/+bwzMIMiglp2eirZT/JHv7d2k1pFLTKn/0YdWyeXorcK9NI?=
 =?us-ascii?Q?t2i8CJQHrG2az7HMrfmiOOTODME1ae8AKi0lpVMzN9W6LrFpOUZVF1CHelFS?=
 =?us-ascii?Q?VzWc54xvB5wRxr/ccFhh0x6+v/dwr902+FtN1JLBDXbArYCEtAdYLCowHVrs?=
 =?us-ascii?Q?n8vu01xXuLErfL4V6rjoY86DMjPVroJpkHTSaU7lq+pkvCrIJ9digoIW5iZ0?=
 =?us-ascii?Q?VkXWrXzzqmjDaFfOFbzWrlIgcyaMlrzkj99Gor9uLBVozWLMi45Lw0deW4/H?=
 =?us-ascii?Q?ujPH0gML0xBk/secwUL5xeaHti4LtggvoMRr9s21HXVQcqTsCz8bqwy8alSW?=
 =?us-ascii?Q?70g6HZ/5GMSWH7ph3ZtpFdWITzTuzXRgbgLZaNwLGnrLx1u7y4Ow1XCgHTBf?=
 =?us-ascii?Q?+2mrwfPGgvKSpkzR0tDesdU9kZcML1FV9AHqoyaw8AIYUV1v3RpEjwMGeoGc?=
 =?us-ascii?Q?j/24FTL0DVd1ACxg93N2dFLRCpO2GJYOgLxl+ONvjDcmcNwTpflG50HJMtiG?=
 =?us-ascii?Q?efQIi+RfJeVccAxL3ZrdMx97YrwJLy0QHezYWHCt4b0TKHlizM3/I0KekDjQ?=
 =?us-ascii?Q?pjYSMLKN0rmbLGr3TtQXjgCldkCRdmaIsZBD5NZtbeGFc1F6QLgPplHgnqNJ?=
 =?us-ascii?Q?zJ7BL5OD8t5L2fJ1jmKwuScqR3PAwxEl8ukvFu+qAuMxHVMm+sb3Gjptik35?=
 =?us-ascii?Q?PxCp5z7NoMM5rDUabovWXwioCK9fNqmhJl2+oEA/dzVGNzfr2024yie+fHIe?=
 =?us-ascii?Q?HwYzcJtGZBl0k8UDQDJ/WnUxEvwARP4ZHmHgHDQZcvbi/ZpIZvudophkeFEA?=
 =?us-ascii?Q?AOjhJqCG92zkV3NDb7FeR4SEzRYeufz1wpDbu2UC6QrHCLNh4kRuPkUZMORi?=
 =?us-ascii?Q?jeXGUeBHR2ixGkwylE+HTXUNYwRbAtbp3cJw/HXMhzoV8UmuFskAyQlYs8hL?=
 =?us-ascii?Q?znmV1TdebELC1igYbPOYlHd+umGRXnr0h8aA4VBvXeiBY+7bUr9jSdm2uuHT?=
 =?us-ascii?Q?EFoppYXW1EwHurjpVzIl2IRHVDyaFLSvZk7qowYiHPg6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da0de0c-c89d-454e-cb5f-08db7857fd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 04:19:10.5719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dn2Dd7I6/3Lt721I/fTF09b6P9xoRsR+8u5uzkKmxkd8FrCklOAsfxrGZNmuuTeSowNQcnlfFBejkxesns1uFtu7UpT0v0UbZ/EK26FiH5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
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
> Sent: Thursday, June 29, 2023 4:09 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
> scheduler properties
>=20
> On Wed, Jun 28, 2023 at 05:17:32PM +0530, Tejas Upadhyay wrote:
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
> >V3 :
> >   - Resolve CI hooks warning for kernel-doc
> >V2 :
> >   - Restric min/max setting to #define default min/max for
> >     elevated user - Himal
> >   - Remove unrelated changes from patch - Niranjana
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/Kconfig              |   7 +
> > drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
> > drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407 +++++++++++++++++++++++-
> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> > drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> > drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  16 +-
> > 8 files changed, 550 insertions(+), 14 deletions(-)  create mode
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
> >index 000000000000..bc65326d52b4
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/Kconfig.profile
> >@@ -0,0 +1,38 @@
> >+config DRM_XE_JOB_TIMEOUT_MAX
> >+       int "Default max job timeout (ms)"
> >+       default 10000 # milliseconds
> >+       help
> >+         Configures the default max job timeout after which job will
> >+         be forcefully taken away from scheduler.
>=20
> Should we also mention 'default and configurable upper limit"?
> Similarly for other parameters also.

'default and configurable upper limit" are same. Do you mean we should ment=
ion that?

>=20
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
> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >b/drivers/gpu/drm/xe/xe_engine.c index 33d1fbae560d..37c33a231f00
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
> >@@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EPERM;
> >+#endif
> >+
> > 	return e->ops->set_timeslice(e, value); }
> >
> >@@ -201,9 +219,26 @@ static int engine_set_preemption_timeout(struct
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
> > 		return -EPERM;
> >
> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >+
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >+		return -EPERM;
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EPERM;
> >+#endif
> >+
> > 	return e->ops->set_preempt_timeout(e, value); }
> >
> >@@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct xe_device
> *xe, struct xe_engine *e,
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
> >+		return -EPERM;
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(value,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > 		return -EPERM;
> >+#endif
> >
> > 	return e->ops->set_job_timeout(e, value);  } diff --git
> >a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >index 4c8f589870ba..743ef9f105d0 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >@@ -34,6 +34,11 @@ static const struct kobj_type kobj_xe_engine_type =3D=
 {
> > 	.sysfs_ops =3D &kobj_sysfs_ops
> > };
> >
> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> >+	return timeout >=3D min && timeout <=3D max; }
> >+
> > static ssize_t preempt_timeout_store(struct kobject *kobj,
> > 				     struct kobj_attribute *attr,
> > 				     const char *buf, size_t count) @@ -46,9
> +51,26 @@ static
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
>=20
> It is still confusing to me as to,
> 1. Given, hwe->sched_props.preempt_timeout_min/max is already
> subjected to boundary
>     check, why we are checking again.
> 2. What is the logic with CAP_SYS_NICE here?
> More on this below.

Non-elevated user : will have limit of what is configured through sysfs min=
/max, which might be same as default/compile configured min/max or differen=
t one under limit of default/compile configured min/max.

Elevated user : Will also have limit but of default/compile configured min/=
max, which might be same or above range of configured through sysfs min/max=
. For example, sysfs_min =3D 2, sysfs_max =3D 5, default/compile_min =3D 1,=
 default/compile_max =3D 100=20

Non-elevated user tries :
1.  set timeout  3 --> in limit of sysfs min/max --> allowed
2.  set timeout  6 --> out of limit of sysfs min/max --> not allowed

Elevated user tries :
1.  set timeout  3 --> in limit of sysfs min/max --> allowed
2.  set timeout  6 --> out of limit of sysfs min/max --> in limit of defaul=
t/compile_min/max --> allowed
3.  set timeout  101 --> out of limit of sysfs min/max --> out of limit of =
default/compile_min/max --> not allowed

>=20
> > 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> >
> > 	return count;
> >@@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct kobject
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> >+
> >+	return count;
> >+}
>=20
> I still have few concerns here.
> 1. If the configs are defined, then we don't need CAP_SYS_NICE? If there =
is
> some logic here,
>     can you add a comment with the explanation?

As I explained scenario above for elevated user.

> 2. XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX already checks the
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/MAX
>     if they are defined. Then, we do we need separate checks here?

This is correct, I had this change to use directly XE_HW_ENGINE_PREEMPT_TIM=
EOUT_MIN/MAX locally, somehow missed to add it. I will address this.

>=20
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >+
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
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
> > 					struct kobj_attribute *attr,
> > 					const char *buf, size_t count)
> >@@ -77,14 +183,116 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
> > 	if (err)
> > 		return err;
> >
> >-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >+	if (!capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     hwe->sched_props.timeslice_min,
> >+				     hwe->sched_props.timeslice_max))
> > 		return -EINVAL;
> >
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#endif
> >+
> > 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
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
> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >+	if (!engine_timeout_in_range(duration,
> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >+		return -EINVAL;
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(duration,
> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
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
> > static ssize_t timeslice_duration_show(struct kobject *kobj,
> > 				       struct kobj_attribute *attr, char *buf)  {
> @@ -109,8
> >+317,25 @@ static ssize_t job_timeout_store(struct kobject *kobj,
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
> >+		return -EINVAL;
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > 		return -EINVAL;
> >+#endif
> >
> > 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
> >
> >@@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject
> >*kobj,  static struct kobj_attribute job_timeout_attr =3D
> >__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> >
> >-static const struct attribute *files[] =3D {
> >-	&job_timeout_attr.attr,
> >-	&timeslice_duration_attr.attr,
> >-	&preempt_timeout_attr.attr,
> >-	NULL
> >-};
> >-
> > static ssize_t job_timeout_default(struct kobject *kobj,
> > 				   struct kobj_attribute *attr, char *buf)  {
> @@ -143,6 +361,28 @@
> >static ssize_t job_timeout_default(struct kobject *kobj,
> > 	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);  }
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
> > static struct kobj_attribute job_timeout_def =3D __ATTR(job_timeout_ms,
> > 0444, job_timeout_default, NULL);
> >
> >@@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct kobject
> >*kobj,  static struct kobj_attribute timeslice_duration_def =3D
> >__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
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
> >+#else
> >+	if (capable(CAP_SYS_NICE) &&
> >+	    !engine_timeout_in_range(timeout,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
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
>=20
> Why is this moved down here?
> Looks like things are not kept in order.
>=20
> >+
> > static ssize_t preempt_timeout_default(struct kobject *kobj,
> > 				       struct kobj_attribute *attr,
> > 				       char *buf)
> >@@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct
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
> >index bd94155a28b3..2b053ee0af80 100644
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
> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif
>=20
> So, we can never have a preempt timeout of 0?
> As I mentioned before, guc disables preempt timeout when it is set to 0.

Yes I will add min as 0 for pre-empt timeout.

Thanks,
Tejas
>=20
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
> >index 7a8d275df6db..d47e34e32a6c 100644
> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >@@ -107,14 +107,28 @@ struct xe_hw_engine {
> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
> > 	/** @engine_id: id  for this hw engine */
> > 	enum xe_hw_engine_id engine_id;
> >-	/** @sched_props: scheduling properties */
> >+	/** @sched_props: scheduling properties
> >+	 *  @defaults: Default scheduling properties
> >+	 */
>=20
> This should be done patch #2.
>=20
> Niranjana
>=20
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
> > };
> >
> >--
> >2.25.1
> >
