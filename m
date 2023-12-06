Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B191C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88310E012;
	Wed,  6 Dec 2023 04:29:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE44310E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701836962; x=1733372962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZcT3CP+EcImZggn6+OIHTcyvqjiaBkAtB7Stb8dJoNs=;
 b=PhnewkYEeHAEnbnX8X+Ms3mWRG7MgjMQ4x46O8HZv5rbyNC00Re/66Zk
 lVKnvMn/3uAuEuUnKubc9khH1sSyAJD+Nyfvo1VOucGsp4nemznfbASAV
 4SO5fvVI+KufAUsftrw1nSIDo09o+2F0qXBlAlVJFtnqphG7m0w5q33NT
 5XO3T4A7TeUZz7D3z/Bzd7l+5u0SoSTlUe0LpA3zL0mMP/qCbEig73tnT
 LaPUMXvceGC0WMHfd9wiH6HpMrwqY5HZbML7BBNKp2dt0a5ORUFwCpUVG
 wX9rQd8W/YyijxQgcvnCblz3un7LUgGf3FxhrbFUxe3Sgd7+Q2C2HjCsV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15554605"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="15554605"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805515812"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="805515812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 20:29:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 20:29:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 20:29:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 20:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWyz9kIP5h6xDgpheQhGWLnwTb/rotw8uH9y0W6DQkrEuTmO+phSRWVUKJsrXMg6u0kU42c4feka9OmJZue3hkaj6Rsu78jyzYExSDwofm0Sw86CTUC5no3DYVXFVpa+Fj1jW32T4PVNTqRKQR6zmclnvgrL7gYamfXx7gdPv1Tn454/A8u21AR7nkxTxZZ63YTPZkwA/fz+8b6TMzeHD3+UYi9100V5kQKRSXKUnfURgEkhvtzACCPwM3Y6BjA+TZR0046e5N2zOfrN3mNJ7PFa3WjadDUrozXiKUejx8Nd51zMhSWgw4kSsXm54RQQvWLEv7URsDb2WwOYtEbniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQq1JtPsEdC0/vd4Phmi2aJbh9h3DD41NV5dBUvopfM=;
 b=bE6A1dGbWq7gJexWooZ9kEMVbiIY7BqjDG3beju0X1FZl0Jxyu7+4ufKGOiYI08xhIDYpZj9Nby6ojZewzaUNoD2AfG96FsCnRfDepfD8lVFaPkf3heTed00OS4i2fuF2hRG1goNGHKtqkJ4OOUyRGDhkqBqAJA6tHA0CFd27oZQzpW8zICMOyj2yNf1DVDj7u9cqoEbHuZrlIv4LncS9cjkwKZQPjm4v+RtInze2UbWE3xZRNTTkYQQMGkCC581v0kxAH+scn60nsLvJD8/gB4sQtXpWXISjG2KMMhdPhPbV9pLAc7TfavVd1XW7oTh6YlHR8D+8RTcA24yXgMyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 6 Dec
 2023 04:29:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 04:29:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH] drm/xe/xe2: Add workaround 16021639441
Thread-Index: AQHaJ3wVVStNr+iZ6EC3wj7XwuzCjLCbQTQAgABpAHA=
Date: Wed, 6 Dec 2023 04:29:18 +0000
Message-ID: <SJ1PR11MB6204F14304156785AB1A93BE8184A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231205131716.847721-1-tejas.upadhyay@intel.com>
 <20231205221208.GN1327160@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231205221208.GN1327160@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6430:EE_
x-ms-office365-filtering-correlation-id: 6b08cdca-796c-4c50-f60a-08dbf613e94a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJyTgylgVfXv+sWZDwWiZs0RucYFiAWBnricjxXXn74X0UsjXCFKjO6E1g0gKBRh8U15I9cx0DlsIXNyP7UwaoU9BPTH7gS5ANxZDMDISYIJ6Mvg0iX4oSz9eBzC+GeUIg/9lFylXDuGJ9gUBh32nW1ZU/2PKvx9DtNA6KEXn5JmvFrcB2CFS/sZ3gAp/8IEcy+W1ergX5Q1Wyr7LBQe5r5DXS5pmTMOoP4RASRf/IYDhpwdp8iR9YZB+uCD1pgQxPmOHPNYfzFwoBOKjzYJiKlcA5dxJedbu1ZKtCL1i5J5YJZs1UwF7CrPm5IzgAt14PTJwP4JdyHtBv8+LFpsThMfHqgVjPrJbYtbXYoQF7v0VNeyHqyssFrozE6tuG1YDv0vU4fOG2DXBCFdqW3fuXiyWfZy7n72j4c59HZpvv7I5G47VRG9ap6eYLqhuOJs2DyHC3WcIoGmHE0EGoKh4rQKSulIZNB2UHj5xz0tZc2zT7f1q/EpQrVdzHjR2hVZa9ioXadNllr1H1jmD1ZeuhBs13IpjeGLBeNwyTGjfVZFe/+tsMc37OwGeA2FVVupWEWIhkL81uOFORtHop8WB9LVY54SeLTVNPshEr+It4eNxieOHJ4DmIVl+i2F2P+h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(38100700002)(7696005)(316002)(53546011)(5660300002)(8936002)(82960400001)(55016003)(6506007)(6862004)(52536014)(66476007)(6636002)(76116006)(66446008)(4326008)(66946007)(86362001)(9686003)(122000001)(66556008)(64756008)(41300700001)(33656002)(2906002)(38070700009)(8676002)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YypacwMhpCV4oVxOb0RNdzWG1I/zUAMxRCddFJY5du3V4txY1y+/3HO6NpdW?=
 =?us-ascii?Q?eJxjgpw/9EYNBejukKgwCmExXtI3yiQcr/UFZCHSlrE87BDxiTLAgGUgyiss?=
 =?us-ascii?Q?352yYR6W/AQSWiEN4/KqrfUTWarEyJDE7N7zFHTRFSN3hC0ajFouj9WhPLuc?=
 =?us-ascii?Q?fWR34AfhKU4Q6YnLiu2ny3MlBVf5ggPmvI3QBsZYEdUy0hcGjiojo/qVzI9S?=
 =?us-ascii?Q?apweNBdujRyx9GrcC4OQKU6VPFdYcK4gEMcBBFzpnvBTV+JlUOLsEKeK/4A+?=
 =?us-ascii?Q?ETpUOHJ7U7NkIBhrst9VyZf6Vt36vVcGlQuR6kXnQKv+qs/4gFpJ3+UIBQ0o?=
 =?us-ascii?Q?BEBGyyzcQa8nE5GRNNQSkhmf4kjb0f0HwOtfS2j+PD2pwNdj+qSColpaPtFa?=
 =?us-ascii?Q?eS1mAs6dkhmg+zh4BxK4eeTsXHHIdvya+UleobsegDxHqverPfVnSgj8jOsN?=
 =?us-ascii?Q?xWvGERJ/LbKosmBxqlxVT/l1q6inOeVwTZEavMZbCdvqWSUyQJ6FHpbVXLsW?=
 =?us-ascii?Q?HzPbCxVZDAXw1keLITVV3WaRUr9laQw/uQeEZ4KtNINsURGB0h+V1vhz3wDU?=
 =?us-ascii?Q?QLYsckEkFCOwIfcdgTIYgi2X1mKmVByRCZCDIHhz3Fr2B6VJcO7ngQ1zASB5?=
 =?us-ascii?Q?PBv5O9xaMNzLJ8+rwKNKTeiT2/yUaDIQtDbTMJKRtMbXT6KEEJtdOc8CQwe8?=
 =?us-ascii?Q?T3cm567kCvIukh7zqMYA2on6zziJzmdExEK3dqQ+8Xj1VgoNnykQsRU4HScp?=
 =?us-ascii?Q?mzj3jzCPRxE78VAKj58LsLOwL9CespKsU7F2gF24xb1iYWt17WZBq407yqR+?=
 =?us-ascii?Q?+gQEJwtrIT8OUlMOTL7vCy5h7HEbAT8fWRvL4fCm++QLED1q9cf5C0wrNzOU?=
 =?us-ascii?Q?AG6JPw8KvMKenuA3q/hCTBj1kJutusgcdFjURHSXsLfz4y8a28yzn354mFBg?=
 =?us-ascii?Q?548QWwtJLmaFT7Bp88+EpkzCZSD7o8iygbti6/+6o2aNnat1vy1zeCjAikv4?=
 =?us-ascii?Q?mAyaZ46O9LARL2GaPDy/UldiuoQ9vUL+/1UtAUc3UYYUg8/E/5HpWhDa8fNy?=
 =?us-ascii?Q?dIt9DkY8Mu3YsP58u4bjygo7WL6U5w3xpGvFTgBBo6BQbfU+FER4ZHESza6H?=
 =?us-ascii?Q?ZVN3rChx5eNxA7N00VwI/5v2dz5viOqc2V4MPsMSHIM15tgI/Ix+YTlKCcMd?=
 =?us-ascii?Q?ORimJ4z0kcYHYz1VUEdwY1w+HRpe5zdgwQBkDBp2QrVj/1+wpo0GlfaR/NBr?=
 =?us-ascii?Q?4ubozC6UBDBFPLfFPeXgVnRkA3rX3tMJS6uKTKfdWSzCOMQv64jRaKWwX6LX?=
 =?us-ascii?Q?+ynVK4qaz2bvGNby0r/FBNwIa1fdLagLqkT2a4m2J9SYYazHJqCZrUatWWns?=
 =?us-ascii?Q?Q8IrJe3fm9hiiBn7n9mCvj1TnhCEzrwBzIhJipw2qU6nfqznHygRBPmX8jVE?=
 =?us-ascii?Q?/m7IXG4PsvZ46jZhJJlSumpVgaCYd/RJ81bPz+NSs9+xI8tcvdioaotOh1Hb?=
 =?us-ascii?Q?/X1QYiH1WaX7RxCv7BZdU/C++96NrTY5Gf8afLuqL6p5n+q3vNwv9hkJsDb5?=
 =?us-ascii?Q?/BZbS2UIcaYzhvOOuas0JbKrILdD6lmslueRGkgq+nkMPYhXUhTZbBhnQXB1?=
 =?us-ascii?Q?JoKsmMVOTAODsf40uIFKaNTXhF4Kf0JiY7BU2u4RkoBN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b08cdca-796c-4c50-f60a-08dbf613e94a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 04:29:18.1798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVqH1g+gBSQTju2ugSUJlOOzyL9PzsWRFHrm3Fv2Abq0cR1YP2f9sQiDLJ1pTbZWUXfog4oa9z1UBseF81R/LvcKHpMYCf9xI48THefrLiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16021639441
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, December 6, 2023 3:42 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2: Add workaround 16021639441
>=20
> On Tue, Dec 05, 2023 at 06:47:16PM +0530, Tejas Upadhyay wrote:
> > This workaround applies to graphics 20.04 and on non render engine.
> >
> > Workaround has three parts :
> > 1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
> >    (at least not right now) since we don't use MI_ATOMIC anywhere
> >    in the kernel mode driver.
> > 2. Memory-based interrupt masking - Memory-based interrupt processing
> >    isn't supported on physical functions, only virtual functions,
> >    according to bspec 60352. So this is probably only relevant once
> >    SRIOV support lands in the driver.
> > 3. Disabling CSB/timestamp updates to the ghwsp and pphwsp -
> Workaround
> >    is added by this change.
>=20
> This workaround is basically the inverse of Wa_18032095049; that one
> applies to RCS and this one applies to the other engines.  The difference=
 is
> that the RCS engine workaround is a temporary workaround needed only for
> a-step, while this one applies to all steppings.
>=20
> The CSB reports to gHWSP and ppHWSP have been discussed as part of a
> different topic on some internal threads and we've confirmed that neither=
 the
> KMD nor the GuC firmware use those for anything, so disabling them is
> always "safe" and should have no functional or performance impact on
> system operation.  I expect the same is true for the timestamp updates in=
 the
> ppHWSP as well.  Given that, it might make sense to just combine these tw=
o
> workarounds into a single record (and single patch) and apply it on all
> steppings.  Disabling the reports for RCS on higher steppings doesn't hav=
e any
> kind of negative impact and will simplify the overall situation.  E.g.,
>=20
>     /*
>      * These two workarounds are the same, just applying to different
>      * engines.  Although Wa_18032095049 (for the RCS) isn't required on
>      * all steppings, disabling these reports has no impact for our
>      * driver or the GuC, so we go ahead and treat it the same as
>      * Wa_16021639441 which does apply to all steppings.
>      */
>     { XE_RTP_NAME("18032095049 / 16021639441"),
>       XE_RTP_RULES(GRAPHICS_VERSION(2004)),
>       XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
>                          GHWSP_CSB_REPORT_DIS |
>                          PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
>                          XE_RTP_ACTION_FLAG(ENGINE_BASE))),
>     },

Got it, it makes sense if disabling on B0 stepping for RCS has no impact. I=
 will make this as combine patch as mentioned above.

Tejas
>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
> >  drivers/gpu/drm/xe/xe_rtp.c              |  6 ++++++
> >  drivers/gpu/drm/xe/xe_rtp.h              | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_wa.c               |  7 +++++++
> >  4 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 444ff9b83bb1..0875b2cc0f01 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -47,6 +47,10 @@
> >  #define RING_ESR(base)				XE_REG((base) +
> 0xb8)
> >
> >  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4,
> XE_REG_OPTION_MASKED)
> > +
> > +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) +
> 0xd4, XE_REG_OPTION_MASKED)
> > +#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> > +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> >  /*
> >   * CMD_CCTL read/write fields take a MOCS value and _not_ a table inde=
x.
> >   * The lsb of each can be considered a separate enabling bit for encry=
ption.
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index fb44cc7521d8..e84e08a66af3 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -309,6 +309,12 @@ bool
> xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> >  		hwe->engine_id =3D=3D __ffs(render_compute_mask);  }
> >
> > +bool xe_rtp_match_non_render(const struct xe_gt *gt,
> > +			     const struct xe_hw_engine *hwe) {
> > +	return hwe->class =3D=3D XE_ENGINE_CLASS_RENDER ? false : true; }
> > +
> >  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> >  					 const struct xe_hw_engine *hwe)  {
> diff --git
> > a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h index
> > c56fedd126e6..a30f89d80046 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -427,4 +427,14 @@ bool
> xe_rtp_match_first_render_or_compute(const
> > struct xe_gt *gt,  bool xe_rtp_match_first_gslice_fused_off(const struc=
t
> xe_gt *gt,
> >  					 const struct xe_hw_engine *hwe);
> >
> > +/*
> > + * xe_rtp_match_non_render - Match when non render engine in GT
> > + *
> > + * @gt: GT structure
> > + * @hwe: Engine instance
> > + *
> > + * Returns: true if engine is not render, false otherwise.
> > + */
> > +bool xe_rtp_match_non_render(const struct xe_gt *gt,
> > +			     const struct xe_hw_engine *hwe);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 63bd4bb1af03..45a910fe0141 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -596,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> >  	},
> > +	{ XE_RTP_NAME("16021639441"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > +		       FUNC(xe_rtp_match_non_render)),
> > +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
> > +			     GHWSP_CSB_REPORT_DIS |
> > +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))
>=20
> The RTP engine base flag is needed here (also pointed out on the other
> workaround's patch).
>=20
>=20
> Matt
>=20
> > +	},
> >
> >  	{}
> >  };
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
