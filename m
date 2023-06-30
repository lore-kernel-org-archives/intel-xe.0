Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853AAEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 04:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3016810E0EC;
	Fri, 30 Jun 2023 04:32:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F3610E0EC
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 04:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688099551; x=1719635551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MMxszFgQufiZ9PNbIBDINAy8M1eodRnkN4etHZ2MPfo=;
 b=KkvMalCoox8AadzzUHWyWUTgXK3T8POD1TqEi6NVRtGjJU+iumJHA1eL
 rBEOsX6WOUEZRI/7TNrw/O7EEPhy4nU0BMoWeAgRhj+Xk8BdunLSEb0SO
 Sm2mqcD7MV6mPAVGtPytRaKiFMVnEmT8ZFGKSKOViNukPYIoTP4Ggmq58
 2cHFRhm4cNCOAQza2FuJQzNyO9mRv7hXF5u3tUX5bVMrgVDAMqahYdlIF
 kgMNzbp2M/WB/INS6PMr/qSaIrHPfG08I8RYMZ/QXts66l6u/Bm649xev
 J/UfmgDGlCYR2f8Gj+LT2coGMSx3HvrM/IJtnOAaIbMBuoiFVOh6LX9Ao A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342649276"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="342649276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 21:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="830799249"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="830799249"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2023 21:32:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 21:32:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 21:32:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 21:32:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 21:32:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJHX9T9Je8EXp/nvN2O4yxdRgGpRglNJaRRYkpvSYpZIyYvlLNkMCqP4gZ2wv1NGVVpQYLpT0YFg9c7M0byiX0z7ShNtFyoLiZUoo9ECiQ35DXW4atedakTmNiFzqOg/32vDdP/CZjbLAL9BmiqE0O/PhMvkQp6+ohz3shOU8D+bUHcZspamtsA2kNvXMptaeqzMMkBOaGdUQM4RbA3SHGLubcDSse7o1B1BTCh9mCfe/3UEveecXuJgd2GD1lxvBMFgQsk15NW3mvXsFXZ6VbjgXS6ToOAOuf0kH0CS5HEceLNcKqYfDjJN2SB5Apzhlv9KpJ9ViQ/tywVo9GFjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwEA2xGYEBt8bDEJdkj/vcU1ZQ/YOHW82PLbZzS9O94=;
 b=BA7nwdkqloiwQ0FjsER74ou/uErYzt2qq9EQKWOW7Ky4MoD9R2eFJ7uVMp7L5xGgDagQpuzweMOSD0l/LYF/gPbMoPZ8YTDe4XA4TZBPZEqMB6quhqNQm336p2GNdaWwCy4rH3hfXvrmYt/DmycRc56EkumN36t5sm3PU5fZ+U6hA1P/yAD561Y+RIBVSDttDLFIXLFLxr/WYKnGbql4jxExEvp3WSBno5PZb5wotz3teXqc8MgTYZ242zmNBQRYR1WyygU+UMnYPGxdbvpXVR50QRB9ezcO2vNvibxC2soPLKgo/YSvE8RY6Tx6xEgyDpS0rZMGlozH6sOs+B49aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB5391.namprd11.prod.outlook.com (2603:10b6:5:396::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 04:32:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 04:32:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
Thread-Index: AQHZqbWB4dmXTEEAV0KOs61wPsVEyq+gzz4AgABaKkCAAQ/FAIAAibiA
Date: Fri, 30 Jun 2023 04:32:17 +0000
Message-ID: <SJ1PR11MB6204011B97978837EDB5F1AF812AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-7-tejas.upadhyay@intel.com>
 <ZJy2hLdxM4DDhl8P@nvishwa1-DESK>
 <SJ1PR11MB6204DE43A6D3CC609D8DD5938125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZJ3mIM9asFnVKoyW@nvishwa1-DESK>
In-Reply-To: <ZJ3mIM9asFnVKoyW@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB5391:EE_
x-ms-office365-filtering-correlation-id: 7cddc952-2c3a-47b0-21fd-08db7922fc78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdGQOavE6qhV3UA13+4RGSFZIXhnP18MmHVnYswPgS+P7tRABfdzI0LZo9ruaaCau5uvQXpazwq7Fa+iQgpp0JFOpKhpmHmwB2jEMvBgO+zrwdtW/dlDENrISd2WZ19MIsghxrZAZErsHX5YI4+f74pusU77EaMtyEDJf+cyHe0aAHh0U2ABnTfl7Mq7d0BmnrgiM9edXm9RjaPeHw2/BkZlTTunPKL6XH2GIesAnSf/QrFBrCo+ornSvV6sFe8FQUqWacETXOL1+I5p3X4JKnyWdnW5D30w+Kj1ecTnnhlb8Tnw9iICt5Sgmmokq0LCkiqxKrOgNpHCzZMFxhNgDig0f27YYMLi8WKiDV15U5LT+vD3bmOssnBiWO60GiOeHeZe/Io9zYfrmvOcDs2XbP64eJC/EGLZ5CEbOll1rQ/7ykjShTXINRhRc8QZXD/i7mUXJH8Artv0jIGrJR2vAz/ZlenW/u3FfwKzOPojeSaU+bjCehf0a3JRp2ZRaimz9erlQUjHg3bSPoPQEh+f0hqjrhclvREgH4uRiDF4ZNN2WxCHact5VR1YJ47SFMz58ZwplaJTT/+zvzX1n9+zmKzNeXEse402SR+9mMyc6xB/nOndqN/wEexrkPHDLGhJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(83380400001)(30864003)(38070700005)(2906002)(122000001)(38100700002)(82960400001)(55016003)(8936002)(8676002)(6862004)(5660300002)(52536014)(86362001)(71200400001)(41300700001)(66946007)(66556008)(66476007)(66446008)(64756008)(6636002)(4326008)(76116006)(316002)(7696005)(33656002)(478600001)(186003)(53546011)(9686003)(6506007)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hUh+lMeNVeTVRqsK0ImOGps5l+lc/64PvaEmb4TzfSgN/kjbKlJTxYr1d7wu?=
 =?us-ascii?Q?gS17avhTx2m9/P6To/0EH3qdT7ooKlnetsH+eKITk3R47RwXSrt3dVQIUfrm?=
 =?us-ascii?Q?CGBxxGNsBLCoBXqzkSHxUZw8YxUi47xhhPFTmZM7aI23Sbiebqimro0/E6JK?=
 =?us-ascii?Q?26kapq5Hp68DRt+FR+boklhnjFpz+gFYV527uh8fY+0FiL7Tlka0TTcM+H1S?=
 =?us-ascii?Q?kroYZqKj0HUuR7plR4DbnqM9xkqZITfLDyZnolCgrDUlu1xlv1+/EdrGpmof?=
 =?us-ascii?Q?YjB3S05k/ZEEhKikRaV73LXGqFoHSqmUB9y8DPgy8Vmz9EmQTx92fRlbo8mD?=
 =?us-ascii?Q?xXkq6F9X3Twg/qoEKnzQ5ox64AlBeFB7+LEJ8hw7LJUhAj/SJxOr7sSISQNc?=
 =?us-ascii?Q?5GH5DZzYhrYS9zeFIcfGdRtw8h3VfwfPumIy068IJx7pPpN2qUwHDCdL0xy7?=
 =?us-ascii?Q?72dupIJ43sgNDsbuOPezUAtwwo6rfSakxF1uZHwDvqpoDm0BjdyKVq8oNCBP?=
 =?us-ascii?Q?po57HPtyOcfkcwDIACK7rFuZ1oJq57xIKEKAWmjaqYHzeLqKdlEjKfX0K7ss?=
 =?us-ascii?Q?B7mlji4l2ZApQ1OK50+dudVDArn3Ya2TU+TOFBV8T+QYatpsqNtxEWx8aOBq?=
 =?us-ascii?Q?nEVuvVEu7JWW6XecB70hvIAvst6KDC9DXMOrpfzJamUSTlTwAHKo4Z5S/cva?=
 =?us-ascii?Q?RGknf/pHbknr1vcUBEKAZzwtvPKV0mL/OylCgu2MAQF0hs9E5ETmwA16/Q7o?=
 =?us-ascii?Q?JSaO3lRDflDV4utX+zt0XJQzqw/4JTltvcLczruMP7QUGs8srINwq9Dy4CIZ?=
 =?us-ascii?Q?cd5QlWLvVwNYYIlHJr82fA731hyqtyvQUZtgwl8GbyVSlUx7RojI5n2S1Kww?=
 =?us-ascii?Q?V5U87HTyaeFd45BrIkTXZ6CPwjxn5v0+bv5SUBwifbOqNHzbcwWCNwjJU+S5?=
 =?us-ascii?Q?jxJ3sF+n4823uMTzGoOPu+raHhpEPMgycpchNY4IRMgjGNXTVIbB33bElN8O?=
 =?us-ascii?Q?xv37ZeYr9QQkVOC03iikJaE/VKZf4gY9hXVCFhptP3Cy+tzaKxRunTA8CRul?=
 =?us-ascii?Q?Czw/jo5/2w6zMQLiBZqlkvIHmnoS6ERdFbJcHynbjvl8E/kAOQZ0BZJ8Gr5m?=
 =?us-ascii?Q?5iPPtjaXsiqBwyHh2OU3tKP6ctjijJMOjLpd3syrXFJY34xUjiFvE97RGNY5?=
 =?us-ascii?Q?oF3BMobFHF6W1dfZKxu8Iiy/cOPfI6xX4pBbergJK/O3ALpbEU+SYCdIqDlC?=
 =?us-ascii?Q?DzV8q+wr3/kiFCTwqp2BE6Ii5CIPlJegbOL1EV+lbLafx62H5YJtCWRyLnEf?=
 =?us-ascii?Q?i154LLrfw+I1q8tGXJwUkKrPMydt1Mk1/q5D6eerSkJlJSum3BDVJZote0hQ?=
 =?us-ascii?Q?k9JH9CqanO9Q3FuW0j4ncDjvw3GeOTvyj4S+VFq6euVoS5IccOPjItkCOVy3?=
 =?us-ascii?Q?FQUNje0R36995b4tkXpdAvP67QHxN+KLUI6xu5aJAn9xmE8EZqaf9rmEz2jb?=
 =?us-ascii?Q?6Tyj7G5+An1/sh+QMsMDRky87TNglmoqeLoZd6qFY9sleeOoovhjrYr4WH1N?=
 =?us-ascii?Q?5mPZ7C4Eqm9eWPGCVpZy6n5g0gj+CC0zSuLWWha9RR5rMs98frTecMH5AvSO?=
 =?us-ascii?Q?srQnHM5v48wIZZIxfLv1bnSAXxvFD5fpuo4sHhgmYP2a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cddc952-2c3a-47b0-21fd-08db7922fc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 04:32:17.4416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+XgHYHm9Tj343yUTZxHgA6hOnT/AEFCbIKQpNS3yInpVc+1AUGxofcOragnIwwftsq96CFAdxxJq0udRYrSg/zslsv98tPXfIfaqnkyEvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5391
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
> Sent: Friday, June 30, 2023 1:44 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for engine
> scheduler properties
>=20
> On Wed, Jun 28, 2023 at 09:19:10PM -0700, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Vishwanathapura, Niranjana
> >> <niranjana.vishwanathapura@intel.com>
> >> Sent: Thursday, June 29, 2023 4:09 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org
> >> Subject: Re: [Intel-xe] [PATCH V3 6/6] drm/xe: Add min/max cap for
> >> engine scheduler properties
> >>
> >> On Wed, Jun 28, 2023 at 05:17:32PM +0530, Tejas Upadhyay wrote:
> >> >Add sysfs entries for the min, max, and defaults for each of engine
> >> >scheduler controls for every hardware engine class.
> >> >
> >> >Non-elevated user IOCTLs to set these controls must be within the
> >> >min-max ranges of the sysfs entries, elevated user can set these
> >> >controls to any value. However, introduced compile time CONFIG
> >> >min-max values which restricts elevated user to be in compile time
> >> >min-max range if at all sysfs min/max are violated.
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
> >> >V3 :
> >> >   - Resolve CI hooks warning for kernel-doc
> >> >V2 :
> >> >   - Restric min/max setting to #define default min/max for
> >> >     elevated user - Himal
> >> >   - Remove unrelated changes from patch - Niranjana
> >> >
> >> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> >---
> >> > drivers/gpu/drm/xe/Kconfig              |   7 +
> >> > drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
> >> > drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
> >> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407
> +++++++++++++++++++++++-
> >> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
> >> > drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
> >> > drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
> >> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  16 +-
> >> > 8 files changed, 550 insertions(+), 14 deletions(-)  create mode
> >> >100644 drivers/gpu/drm/xe/Kconfig.profile
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> >> >index d44794f99338..964c440a1135 100644
> >> >--- a/drivers/gpu/drm/xe/Kconfig
> >> >+++ b/drivers/gpu/drm/xe/Kconfig
> >> >@@ -83,3 +83,10 @@ depends on DRM_XE  depends on EXPERT  source
> >> >"drivers/gpu/drm/xe/Kconfig.debug"
> >> > endmenu
> >> >+
> >> >+menu "drm/xe Profile Guided Optimisation"
> >> >+        visible if EXPERT
> >> >+        depends on DRM_XE
> >> >+        source "drivers/gpu/drm/xe/Kconfig.profile"
> >> >+endmenu
> >> >+
> >> >diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> >> >b/drivers/gpu/drm/xe/Kconfig.profile
> >> >new file mode 100644
> >> >index 000000000000..bc65326d52b4
> >> >--- /dev/null
> >> >+++ b/drivers/gpu/drm/xe/Kconfig.profile
> >> >@@ -0,0 +1,38 @@
> >> >+config DRM_XE_JOB_TIMEOUT_MAX
> >> >+       int "Default max job timeout (ms)"
> >> >+       default 10000 # milliseconds
> >> >+       help
> >> >+         Configures the default max job timeout after which job will
> >> >+         be forcefully taken away from scheduler.
> >>
> >> Should we also mention 'default and configurable upper limit"?
> >> Similarly for other parameters also.
> >
> >'default and configurable upper limit" are same. Do you mean we should
> mention that?
>=20
> May be we can say "sets the upper limit configurable job timeout max valu=
e".
> We need to document somewhere what you responded below on min/max
> values and CAP_SYS_NICE.

Ok.

>=20
> >
> >>
> >> >+config DRM_XE_JOB_TIMEOUT_MIN
> >> >+       int "Default max job timeout (ms)"
> >> >+       default 1 # milliseconds
> >> >+       help
> >> >+         Configures the default min job timeout after which job will
> >> >+         be forcefully taken away from scheduler.
> >> >+config DRM_XE_TIMESLICE_MAX
> >> >+       int "Default max timeslice duration (us)"
> >> >+       default 10000000 # microseconds
> >> >+       help
> >> >+         Configures the default max timeslice duration between multi=
ple
> >> >+         contexts by guc scheduling.
> >> >+config DRM_XE_TIMESLICE_MIN
> >> >+       int "Default min timeslice duration (us)"
> >> >+       default 1 # microseconds
> >> >+       help
> >> >+         Configures the default min timeslice duration between multi=
ple
> >> >+         contexts by guc scheduling.
> >> >+config DRM_XE_PREEMPT_TIMEOUT_MAX
> >> >+       int "Default max  preempt timeout (us)"
> >> >+       default 10000000 # microseconds
> >> >+       help
> >> >+         Configures the default max preempt timeout after which cont=
ext
> >> >+         will be forcefully taken away and higher priority context w=
ill
> >> >+         run.
> >> >+config DRM_XE_PREEMPT_TIMEOUT_MIN
> >> >+       int "Default min  preempt timeout (us)"
> >> >+       default 1 # microseconds
> >> >+       help
> >> >+         Configures the default min preempt timeout after which cont=
ext
> >> >+         will be forcefully taken away and higher priority context w=
ill
> >> >+         run.
> >> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >> >b/drivers/gpu/drm/xe/xe_engine.c index 33d1fbae560d..37c33a231f00
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
> >> >@@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device
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
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >> >+		return -EPERM;
> >> >+#endif
> >> >+
> >> > 	return e->ops->set_timeslice(e, value); }
> >> >
> >> >@@ -201,9 +219,26 @@ static int
> engine_set_preemption_timeout(struct
> >> xe_device *xe,
> >> > 					 struct xe_engine *e, u64 value,
> >> > 					 bool create)
> >> > {
> >> >-	if (!capable(CAP_SYS_NICE))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     e->hwe-
> >> >sched_props.preempt_timeout_min,
> >> >+				     e->hwe-
> >> >sched_props.preempt_timeout_max))
> >> > 		return -EPERM;
> >> >
> >> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EPERM;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EPERM;
> >> >+#endif
> >> >+
> >> > 	return e->ops->set_preempt_timeout(e, value); }
> >> >
> >> >@@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct
> >> >xe_device
> >> *xe, struct xe_engine *e,
> >> > 	if (XE_IOCTL_ERR(xe, !create))
> >> > 		return -EINVAL;
> >> >
> >> >-	if (!capable(CAP_SYS_NICE))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     e->hwe->sched_props.job_timeout_min,
> >> >+				     e->hwe->sched_props.job_timeout_max))
> >> >+		return -EPERM;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >> >+		return -EPERM;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(value,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> > 		return -EPERM;
> >> >+#endif
> >> >
> >> > 	return e->ops->set_job_timeout(e, value);  } diff --git
> >> >a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >index 4c8f589870ba..743ef9f105d0 100644
> >> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> >> >@@ -34,6 +34,11 @@ static const struct kobj_type kobj_xe_engine_type
> =3D {
> >> > 	.sysfs_ops =3D &kobj_sysfs_ops
> >> > };
> >> >
> >> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> >> >+	return timeout >=3D min && timeout <=3D max; }
> >> >+
> >> > static ssize_t preempt_timeout_store(struct kobject *kobj,
> >> > 				     struct kobj_attribute *attr,
> >> > 				     const char *buf, size_t count) @@ -46,9
> >> +51,26 @@ static
> >> >ssize_t preempt_timeout_store(struct kobject *kobj,
> >> > 	if (err)
> >> > 		return err;
> >> >
> >> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     hwe-
> >> >sched_props.preempt_timeout_min,
> >> >+				     hwe-
> >> >sched_props.preempt_timeout_max))
> >> > 		return -EINVAL;
> >> >
> >> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >>
> >> It is still confusing to me as to,
> >> 1. Given, hwe->sched_props.preempt_timeout_min/max is already
> >> subjected to boundary
> >>     check, why we are checking again.
> >> 2. What is the logic with CAP_SYS_NICE here?
> >> More on this below.
> >
> >Non-elevated user : will have limit of what is configured through sysfs
> min/max, which might be same as default/compile configured min/max or
> different one under limit of default/compile configured min/max.
> >
> >Elevated user : Will also have limit but of default/compile configured
> >min/max, which might be same or above range of configured through sysfs
> >min/max. For example, sysfs_min =3D 2, sysfs_max =3D 5, default/compile_=
min
> >=3D 1, default/compile_max =3D 100
> >
> >Non-elevated user tries :
> >1.  set timeout  3 --> in limit of sysfs min/max --> allowed 2.  set
> >timeout  6 --> out of limit of sysfs min/max --> not allowed
> >
> >Elevated user tries :
> >1.  set timeout  3 --> in limit of sysfs min/max --> allowed 2.  set
> >timeout  6 --> out of limit of sysfs min/max --> in limit of
> >default/compile_min/max --> allowed 3.  set timeout  101 --> out of
> >limit of sysfs min/max --> out of limit of default/compile_min/max -->
> >not allowed
> >
>=20
> Ok. But all the '#if defined(CONFIG..." checks seems incorrect.
> We should just check against the XE_HW_ENGINE*_MIN/MAX.
>=20
> min =3D capable(CAP_SYS_NICE) ? XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN :
> hwe->sched_props.preempt_timeout_min;
> max =3D capable(CAP_SYS_NICE) ? XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX :
> hwe->sched_props.preempt_timeout_max;
> if (!engine_timeout_in_range(timeout, min, max))
>       return -EINVAL;

Looks good, I will add this change.

>=20
> >>
> >> > 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> >> >
> >> > 	return count;
> >> >@@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct
> >> >kobject *kobj,  static struct kobj_attribute preempt_timeout_attr =3D
> >> >__ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> >> >preempt_timeout_store);
> >> >
> >> >+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> >> >+					 struct kobj_attribute *attr,
> >> >+					 const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 timeout;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &timeout);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >> >+	if (!engine_timeout_in_range(timeout,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> >> >+
> >> >+	return count;
> >> >+}
> >>
> >> I still have few concerns here.
> >> 1. If the configs are defined, then we don't need CAP_SYS_NICE? If
> >> there is some logic here,
> >>     can you add a comment with the explanation?
> >
> >As I explained scenario above for elevated user.
> >
> >> 2. XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX already checks the
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/MAX
> >>     if they are defined. Then, we do we need separate checks here?
> >
> >This is correct, I had this change to use directly
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/MAX locally, somehow missed to
> add it. I will address this.
> >
>=20
> Ok, also, here we can endup with min being greater than max.
> We should check against that as well.

Ok, looks like we need to check that as well. I will see that.

>=20
> Niranjana
>=20
> >>
> >> >+
> >> >+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> >> >+					struct kobj_attribute *attr, char *buf)
> >> {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe-
> >> >sched_props.preempt_timeout_max);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute preempt_timeout_max_attr =3D
> >> >+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> >> >+	       preempt_timeout_max_store);
> >> >+
> >> >+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> >> >+					 struct kobj_attribute *attr,
> >> >+					 const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 timeout;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &timeout);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
> >> >+	if (!engine_timeout_in_range(timeout,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> >+
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
> >> >+
> >> >+	return count;
> >> >+}
> >> >+
> >> >+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> >> >+					struct kobj_attribute *attr, char *buf)
> >> {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe-
> >> >sched_props.preempt_timeout_min);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute preempt_timeout_min_attr =3D
> >> >+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> >> >+	       preempt_timeout_min_store);
> >> >+
> >> > static ssize_t timeslice_duration_store(struct kobject *kobj,
> >> > 					struct kobj_attribute *attr,
> >> > 					const char *buf, size_t count) @@ -
> 77,14 +183,116 @@ static
> >> >ssize_t timeslice_duration_store(struct
> >> kobject *kobj,
> >> > 	if (err)
> >> > 		return err;
> >> >
> >> >-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(duration,
> >> >+				     hwe->sched_props.timeslice_min,
> >> >+				     hwe->sched_props.timeslice_max))
> >> > 		return -EINVAL;
> >> >
> >> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> >> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(duration,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(duration,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> > 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
> >> >
> >> > 	return count;
> >> > }
> >> >
> >> >+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> >> >+					    struct kobj_attribute *attr,
> >> >+					    const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 duration;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &duration);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> >> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >> >+	if (!engine_timeout_in_range(duration,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(duration,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
> >> >+
> >> >+	return count;
> >> >+}
> >> >+
> >> >+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> >> >+					   struct kobj_attribute *attr,
> >> >+					   char *buf)
> >> >+{
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max); }
> >> >+
> >> >+static struct kobj_attribute timeslice_duration_max_attr =3D
> >> >+	__ATTR(timeslice_duration_max, 0644,
> >> timeslice_duration_max_show,
> >> >+	       timeslice_duration_max_store);
> >> >+
> >> >+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> >> >+					    struct kobj_attribute *attr,
> >> >+					    const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 duration;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &duration);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
> >> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
> >> >+	if (!engine_timeout_in_range(duration,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
> >> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(duration,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> >+				     XE_HW_ENGINE_TIMESLICE_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
> >> >+
> >> >+	return count;
> >> >+}
> >> >+
> >> >+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> >> >+					   struct kobj_attribute *attr, char
> >> *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min); }
> >> >+
> >> >+static struct kobj_attribute timeslice_duration_min_attr =3D
> >> >+	__ATTR(timeslice_duration_min, 0644,
> >> timeslice_duration_min_show,
> >> >+	       timeslice_duration_min_store);
> >> >+
> >> > static ssize_t timeslice_duration_show(struct kobject *kobj,
> >> > 				       struct kobj_attribute *attr, char *buf)  {
> >> @@ -109,8
> >> >+317,25 @@ static ssize_t job_timeout_store(struct kobject *kobj,
> >> > 	if (err)
> >> > 		return err;
> >> >
> >> >-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> >> >+	if (!capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     hwe->sched_props.job_timeout_min,
> >> >+				     hwe->sched_props.job_timeout_max))
> >> >+		return -EINVAL;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> > 		return -EINVAL;
> >> >+#endif
> >> >
> >> > 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
> >> >
> >> >@@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject
> >> >*kobj,  static struct kobj_attribute job_timeout_attr =3D
> >> >__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> >> >
> >> >-static const struct attribute *files[] =3D {
> >> >-	&job_timeout_attr.attr,
> >> >-	&timeslice_duration_attr.attr,
> >> >-	&preempt_timeout_attr.attr,
> >> >-	NULL
> >> >-};
> >> >-
> >> > static ssize_t job_timeout_default(struct kobject *kobj,
> >> > 				   struct kobj_attribute *attr, char *buf)  {
> >> @@ -143,6 +361,28 @@
> >> >static ssize_t job_timeout_default(struct kobject *kobj,
> >> > 	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);  }
> >> >
> >> >+static ssize_t job_timeout_min_default(struct kobject *kobj,
> >> >+				       struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min); }
> >> >+
> >> >+static struct kobj_attribute job_timeout_min_def =3D
> >> >+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> >> >+
> >> >+static ssize_t job_timeout_max_default(struct kobject *kobj,
> >> >+				       struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max); }
> >> >+
> >> >+static struct kobj_attribute job_timeout_max_def =3D
> >> >+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> >> >+
> >> > static struct kobj_attribute job_timeout_def =3D
> >> > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >> >
> >> >@@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct
> >> >kobject *kobj,  static struct kobj_attribute timeslice_duration_def
> >> >=3D __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> >> >
> >> >+static ssize_t timeslice_min_default(struct kobject *kobj,
> >> >+				     struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min); }
> >> >+
> >> >+static struct kobj_attribute timeslice_duration_min_def =3D
> >> >+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> >> >+
> >> >+static ssize_t timeslice_max_default(struct kobject *kobj,
> >> >+				     struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max); }
> >> >+
> >> >+static struct kobj_attribute timeslice_duration_max_def =3D
> >> >+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> >> >+
> >> >+static ssize_t job_timeout_max_store(struct kobject *kobj,
> >> >+				     struct kobj_attribute *attr,
> >> >+				     const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 timeout;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &timeout);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >> >+	if (!engine_timeout_in_range(timeout,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
> >> >+
> >> >+	return count;
> >> >+}
> >> >+
> >> >+static ssize_t job_timeout_max_show(struct kobject *kobj,
> >> >+				    struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute job_timeout_max_attr =3D
> >> >+__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> >> >+job_timeout_max_store);
> >> >+
> >> >+static ssize_t job_timeout_min_store(struct kobject *kobj,
> >> >+				     struct kobj_attribute *attr,
> >> >+				     const char *buf, size_t count) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+	u32 timeout;
> >> >+	int err;
> >> >+
> >> >+	err =3D kstrtou32(buf, 0, &timeout);
> >> >+	if (err)
> >> >+		return err;
> >> >+
> >> >+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) &&
> >> defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
> >> >+	if (!engine_timeout_in_range(timeout,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
> >> >+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#else
> >> >+	if (capable(CAP_SYS_NICE) &&
> >> >+	    !engine_timeout_in_range(timeout,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> >+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> >+		return -EINVAL;
> >> >+#endif
> >> >+
> >> >+	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
> >> >+
> >> >+	return count;
> >> >+}
> >> >+
> >> >+static ssize_t job_timeout_min_show(struct kobject *kobj,
> >> >+				    struct kobj_attribute *attr, char *buf) {
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute job_timeout_min_attr =3D
> >> >+__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> >> >+job_timeout_min_store);
> >> >+
> >> >+static const struct attribute *files[] =3D {
> >> >+	&job_timeout_attr.attr,
> >> >+	&job_timeout_min_attr.attr,
> >> >+	&job_timeout_max_attr.attr,
> >> >+	&timeslice_duration_attr.attr,
> >> >+	&timeslice_duration_min_attr.attr,
> >> >+	&timeslice_duration_max_attr.attr,
> >> >+	&preempt_timeout_attr.attr,
> >> >+	&preempt_timeout_min_attr.attr,
> >> >+	&preempt_timeout_max_attr.attr,
> >> >+	NULL
> >> >+};
> >>
> >> Why is this moved down here?
> >> Looks like things are not kept in order.
> >>
> >> >+
> >> > static ssize_t preempt_timeout_default(struct kobject *kobj,
> >> > 				       struct kobj_attribute *attr,
> >> > 				       char *buf)
> >> >@@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct
> >> >kobject *kobj,  static struct kobj_attribute preempt_timeout_def =3D
> >> >__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> >> >
> >> >+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> >> >+					   struct kobj_attribute *attr,
> >> >+					   char *buf)
> >> >+{
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute preempt_timeout_min_def =3D
> >> >+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> >> NULL);
> >> >+
> >> >+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> >> >+					   struct kobj_attribute *attr,
> >> >+					   char *buf)
> >> >+{
> >> >+	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> >> >+
> >> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
> >> >+}
> >> >+
> >> >+static struct kobj_attribute preempt_timeout_max_def =3D
> >> >+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> >> NULL);
> >> >+
> >> > static const struct attribute *defaults[] =3D {
> >> > 	&job_timeout_def.attr,
> >> >+	&job_timeout_min_def.attr,
> >> >+	&job_timeout_max_def.attr,
> >> > 	&timeslice_duration_def.attr,
> >> >+	&timeslice_duration_min_def.attr,
> >> >+	&timeslice_duration_max_def.attr,
> >> > 	&preempt_timeout_def.attr,
> >> >+	&preempt_timeout_min_def.attr,
> >> >+	&preempt_timeout_max_def.attr,
> >> > 	NULL
> >> > };
> >> >
> >> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >index a539cf031c7d..a7ac7b9a9768 100644
> >> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> >> >@@ -12,6 +12,7 @@
> >> >
> >> > int xe_gt_sysfs_init(struct xe_gt *gt); int
> >> > xe_gt_sysfs_engines(struct xe_gt *gt);
> >> >+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >> >
> >> > static inline struct xe_gt *
> >> > kobj_to_gt(struct kobject *kobj)
> >> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >index bd94155a28b3..2b053ee0af80 100644
> >> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> >@@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt
> >> >*gt,
> >> struct xe_hw_engine *hwe,
> >> > 	hwe->engine_id =3D id;
> >> > 	/* FIXME: Wire up to configurable default value */
> >> > 	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> >> >+	hwe->sched_props.job_timeout_min =3D
> >> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> >> >+	hwe->sched_props.job_timeout_max =3D
> >> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> >> > 	hwe->sched_props.timeslice_us =3D 1 * 1000;
> >> >+	hwe->sched_props.timeslice_min =3D
> >> XE_HW_ENGINE_TIMESLICE_MIN;
> >> >+	hwe->sched_props.timeslice_max =3D
> >> XE_HW_ENGINE_TIMESLICE_MAX;
> >> > 	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> >> >+	hwe->sched_props.preempt_timeout_min =3D
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> >> >+	hwe->sched_props.preempt_timeout_max =3D
> >> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> >> > 	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >> >
> >> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt)); diff --git
> >> >a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> >index 7eca9d53c7b1..3d37d6d44261 100644
> >> >--- a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> >@@ -10,6 +10,37 @@
> >> >
> >> > struct drm_printer;
> >> >
> >> >+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> >> >+XE_HW_ENGINE_JOB_TIMEOUT_MIN
> >> CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> >> >+#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> >> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> >> XE_HW_ENGINE_JOB_TIMEOUT_MAX
> >> >+CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> >> >+XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> >> >+CONFIG_DRM_XE_TIMESLICE_MIN #define
> >> XE_HW_ENGINE_TIMESLICE_MIN
> >> >+CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> >> XE_HW_ENGINE_TIMESLICE_MIN 1
> >> >+#endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> >> >+XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> >> #else #define
> >> >+XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> >> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> >> >+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> >> >+CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> >> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif
> >>
> >> So, we can never have a preempt timeout of 0?
> >> As I mentioned before, guc disables preempt timeout when it is set to =
0.
> >
> >Yes I will add min as 0 for pre-empt timeout.
> >
> >Thanks,
> >Tejas

I think we cant set 0 here, as Matt Brost commented below to me, please see=
 :

"0 is disabled, right? i think per dma-fence rules we can't let anyone do t=
hat, I believe Thomas H had a rant about that somewhere"

Thanks,
Tejas
> >>
> >> >+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #define
> >> >+XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> >> >+#else #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 *
> >> 1000)
> >> >+#endif
> >> >+
> >> > int xe_hw_engines_init_early(struct xe_gt *gt);  int
> >> >xe_hw_engines_init(struct xe_gt *gt);  void
> >> >xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> >> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >index 7a8d275df6db..d47e34e32a6c 100644
> >> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> >@@ -107,14 +107,28 @@ struct xe_hw_engine {
> >> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
> >> > 	/** @engine_id: id  for this hw engine */
> >> > 	enum xe_hw_engine_id engine_id;
> >> >-	/** @sched_props: scheduling properties */
> >> >+	/** @sched_props: scheduling properties
> >> >+	 *  @defaults: Default scheduling properties
> >> >+	 */
> >>
> >> This should be done patch #2.
> >>
> >> Niranjana
> >>
> >> > 	struct {
> >> > 		/** @set_job_timeout: Set job timeout in ms for engine */
> >> > 		u32 job_timeout_ms;
> >> >+		/** @job_timeout_min: Min job timeout in ms for engine */
> >> >+		u32 job_timeout_min;
> >> >+		/** @job_timeout_max: Max job timeout in ms for engine */
> >> >+		u32 job_timeout_max;
> >> > 		/** @timeslice_us: timeslice period in micro-seconds */
> >> > 		u32 timeslice_us;
> >> >+		/** @timeslice_min: min timeslice period in micro-seconds
> >> */
> >> >+		u32 timeslice_min;
> >> >+		/** @timeslice_max: max timeslice period in micro-seconds
> >> */
> >> >+		u32 timeslice_max;
> >> > 		/** @preempt_timeout_us: preemption timeout in micro-
> >> seconds */
> >> > 		u32 preempt_timeout_us;
> >> >+		/** @preempt_timeout_min: min preemption timeout in
> >> micro-seconds */
> >> >+		u32 preempt_timeout_min;
> >> >+		/** @preempt_timeout_max: max preemption timeout in
> >> micro-seconds */
> >> >+		u32 preempt_timeout_max;
> >> > 	} sched_props, defaults;
> >> > };
> >> >
> >> >--
> >> >2.25.1
> >> >
