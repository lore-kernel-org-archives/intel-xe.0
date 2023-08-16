Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A411C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 05:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208BA10E2C4;
	Wed, 16 Aug 2023 05:05:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD89810E2C4
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 05:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692162355; x=1723698355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uwljbx+CvTvlr7GQ0CbBKtG91VpPzgGB4HQ14FEi/YY=;
 b=OdfJXYjMqsuEU6qTfG5lhhmqMvUBIKlKcpqi6PZGRvXl+z8AC5OyBU5L
 x6SxueuKiRKWpf09PFs1Hm3eLXpu6ukzNbujfoBMyuUY7HQFX4I1hVUbv
 yRwAU14ZpGFkkAFpMb05Ywk/wbi9PPkFJFD8bulRYKpu73lE1W/pE2FSG
 j7Vjd3JtMWVLzeI6mphLOWctq4FVnrVTn5NgDE4j/iDqUlR4MhYcag1aH
 92cRzVifpeB/2nU5qfNHWZRECLQ9sHKcK0pIhLwx1zhehbER2eJuao6A6
 ETdoG2BVJp57X8UzwcmuiV9vD2HsGuh26WXt+bMXgTydXbNvB/hLyvctU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403421188"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="403421188"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 22:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683910790"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="683910790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 22:05:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 22:05:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 22:05:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 22:05:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 22:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+d3apaLCJ5uxnlV0RTuXyRiCGCgXec7r94mSxxwGKUmoyEgY1EH6RPsyyHvOme2D7qAi7wJuFELgyR32S8a/tN3tszVGJKHicdXacD/+bqRwhL1CLKyN2OXz4+SmD6gklEItdmyLHmxjGLM75uDok5NzIWPjoTM17o+HevmWWp3c7OIeLgyD+pUMF90Ga1LhdWZal1rVsbcFPxs+eVO+aGtx6yeKDYFoaUdHJ1pICKd+SVmysWEfsZd3XIVNlV1fKyKRSz39+WTlkXUrL7Uqpd9wAJsxS5OeR4ost65Cx7XTIFuJRXhGBnzISkRlrzqMBzWRTAB6Tj26ievEiePAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owkNaz12UTWaTgwUIHmZ62ZvCUH0pjbT1SkQzK8qlaw=;
 b=DuRlnVTcpGTe5U06juawCxyRsdbLyHKVYRpSQAIon6KCzxPJ+fmf/n9DKTzVieCbfH2yKthG5jjLI4YoLim0ss7Vzvu6xhYdjy4+HDvkn7L6ohyyRepBA/WAZjffhDvjeQd6i+/69bFSzyF9JmOb/HKq2fYeUPlFzrEJYeYfV2/VoJZEqzKRowe+pVFY2sVldEs3KQh1WT2ZeFv1KP5hEkMpe9B223ss83FhS+v7X4sXuE/qGhpyhYLgaQmdyXUOssILAgx6I3XLDtMjMKFKmRfRqjKtxm2z50xzCvYB2izOnuk63i6/lONgxU5n60kvNB/xF5V/ZgsWUiAxB3xkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 05:05:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 05:05:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 3/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
Thread-Index: AQHZyiWPmsi0gVyx8EOfgLGydLSPaK/mQkQwgAOraACAAnx2QA==
Date: Wed, 16 Aug 2023 05:05:51 +0000
Message-ID: <SJ1PR11MB6204930FB84848B3B10DCAB08115A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-4-niranjana.vishwanathapura@intel.com>
 <SJ1PR11MB620457BF2B85DA4195524A4F8111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZNpDGDsAHOsRzsnq@nvishwa1-DESK>
In-Reply-To: <ZNpDGDsAHOsRzsnq@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN6PR11MB8241:EE_
x-ms-office365-filtering-correlation-id: 27131e80-6368-4bd3-03ca-08db9e167680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EIVVIpyNrsn0xl9ip5GEqGxwEmp2latvkH6aWakY2YYkNjHJQN0LCerR+ZQS7Oz98md++sgK66Cq1qhPxUf/tS1fMkfWnzLZFWg8ehfpJRzI740CIneiKSiAt9tGvf35YfsBtJZN/WCg+lRnyNaXtawXMreR03PS6XVM1zVvWlRnFdEqYQg5t4f89wVN8XenoCxgwMtnIoq6W4sj6XjP9xf8KIH+zQ7MBZN+BMm//9rwVBl1bXK9BpmcgDfZSFiYj31LcLuFPt9IARiCTiKG21imV8CRweYTNiTvZM6lFm+RTWv7NBPYDXAjwXFmpV5ZwOurmlfPMN3jUr3ADVi9bVAvoomWmYBdby8vXmcnMQ/W2EI6LXY8dUBCJrLtFkoFAfy2xzJpNptjA+YbJkCRm8v+W4Ii3zNyDILCoj86NHkRQYH0richbRIhb3Thhp91wDpJdS+pcXuvgyya6SuDHUo6H1xFFLM6iekAUwszQHkSTEZk3HrAiSYej1imzKjlzs39EYyGL4lY6XbAuq06e2PeqpcExnangGgbPnjQnJvd2N2WyCsB8s8RGAZt6m2t3BynFiMnwswJx2rU8sZvclsrRwBgHajzIltaAxZXxoGPu2Py1h105hn/X2ev2PGm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(7696005)(6506007)(2906002)(478600001)(9686003)(26005)(107886003)(5660300002)(83380400001)(6636002)(52536014)(41300700001)(316002)(53546011)(8936002)(4326008)(6862004)(8676002)(122000001)(38100700002)(38070700005)(82960400001)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MlWbe1XpVE8GzTXeVgwQD+RWu7d5DsoawGxL1VW1zca1ROCIix6kjtDpPoqg?=
 =?us-ascii?Q?xgPT8zmZnTYo5jZa7pj0e3zV9ujaGD729uaVL5ca8U0hA3Jea3T0ddwweWVA?=
 =?us-ascii?Q?L/rd/1JzQSeAXglJa9TWMbgXozjPxBXJS2mOakJf6borMMh+/nN/AAh0n8MT?=
 =?us-ascii?Q?TqrUoNPOfdIafyNxK77IdSdQLTJvtgWw14kWz6R6Iq+LbPPUnlpFh4omXvEl?=
 =?us-ascii?Q?zi+nqbJIKLr9Ro0xITzl8kVj45zR7/z878HGU83gcZBmw/EwVQo2smz5q+Ye?=
 =?us-ascii?Q?k3SHspUMlzUgfWhWadjW0c7E+DNJFoGkMnOJML2fychQoy1kiJBbOepvB6T8?=
 =?us-ascii?Q?RvD6oh7QESQ7fUNRDO3NsdH2MupgbUEcHAKdd/30jRYhho38aQ1t6km+GMeD?=
 =?us-ascii?Q?9lWBofOVFnxhFGDvQmkGh8+fNUzRzWNvKza2qK53SvjPHId5kF56lbngjKSG?=
 =?us-ascii?Q?cgCt9ykochw9Wvw96+VeGtxiGJKhRgSZcsL16fE/CWoZTGJwKcuuo2jy/hUx?=
 =?us-ascii?Q?F0jLBDnvkwFCyRRzoWjBvUztc0DsAm5iHKNsUmjaFbKvY+QdVHEVphJIOBni?=
 =?us-ascii?Q?jDYYtAPnhoRGTra0hadlh+HXna8ZZpo+RtS2Nq0teOI2SKh7N7/mcu7+YyBJ?=
 =?us-ascii?Q?SUBN5v9gLvAHI67fTJu8R9KxJtbMbSDSG3s6SWaIHB9Pk1VM74z1fsdEx5TB?=
 =?us-ascii?Q?3Si+nvGG8DuLtK16b/6wjr0poVNjdzBao5Zrr6SdIKW3U3JCH9QTlLGfEuQv?=
 =?us-ascii?Q?bE0Am5sBdFsNTYLwu6Y40XgOuZk7/iAzAGMGWn1cLgIKq1mEoY/Kr0X1mjm2?=
 =?us-ascii?Q?JpQDQZcb3A4/dZ3r1pPVLB8tTKxGorRozqthnfdvlNXAZC+Ynm4ojzkjXF00?=
 =?us-ascii?Q?WLNBKiUT5mQBbmr5XP+dEIUgTqFoAjQtx0FO/fN/4zs7HxYei5y9jfB18JzY?=
 =?us-ascii?Q?0Nb14oF9f/ZSmoYaGXSvv7rb/aklKqijIDtrhrcAkt7BQzm84OHmeK++7XR3?=
 =?us-ascii?Q?EHVM1NVASGBka2LFaOpWvoFYeC6Eld4OUoA5PH8GS1hR6bbmGVtPmUC5mWTP?=
 =?us-ascii?Q?7t58sTexhG6f+d6dM2DiNmCIHIgAU4L67Qijsh0/uBVJUKdbaDrkTntIj2dw?=
 =?us-ascii?Q?cdNEowMDEKiq1HtwheSqvMRpjEDgk4Axkfw3QpnJnkoMLtFNT8FWjXBIZqTF?=
 =?us-ascii?Q?fiPZIcen7nOuRco/+pVchxkICgA3ZwAbuuO8hgdesJ9gYbuUfkj14Jk6iPsP?=
 =?us-ascii?Q?tPjdza1X4aeTbJfe969qxP1NUO0/Wivx5RiJ/c+tQ8CrOzkuiu4CUjsElMOz?=
 =?us-ascii?Q?lnuNFb6Fjcgjsr+c+Mc9QOTaDPulCzg9kmRrnXiNS/g98KsgoLi93yPcAJ2Y?=
 =?us-ascii?Q?95DmORk5d9kS6iba+T2qWcRuxDrJV9eIHImjMmIMiFGp0MOFmOqg/KRD1wF4?=
 =?us-ascii?Q?NfWkz9MJ/BaJ3PSq49byaBTOxp3XzsEUOK0Q+tUIP3yRjql3YchOWzkM1e2y?=
 =?us-ascii?Q?l6X7Bdbl9ZN1JIjgVformYfSArVv1W2qrLsHfE9O94sV24L817iky7cvWzuQ?=
 =?us-ascii?Q?lyWIboFC9nmtEBuPnKvEwDPf2FLAyrU2hIpIyq3c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27131e80-6368-4bd3-03ca-08db9e167680
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 05:05:51.7200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9W1dqj2t21y5eIxicDs0h6xVuBxusxYc8vhoCVxqx/MrSzxRYj43N4MjumlTkdeTz+z9OjpGe+Y6wWLiI6nk9v9lPRcVNLyoMrXEPCetJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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
> Sent: Monday, August 14, 2023 8:37 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Harrison, John C
> <john.c.harrison@intel.com>
> Subject: Re: [PATCH 3/4] drm/xe: Add
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>=20
> On Sat, Aug 12, 2023 at 12:08:05AM -0700, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Vishwanathapura, Niranjana
> >> <niranjana.vishwanathapura@intel.com>
> >> Sent: Tuesday, August 8, 2023 11:54 PM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
> >> <tejas.upadhyay@intel.com>
> >> Subject: [PATCH 3/4] drm/xe: Add
> >> CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> >>
> >> Allow preemption timeout for compute engines to be specified as a
> >> config option. The purpose is actually to give compute tasks longer
> >> time to reach a pre-emption point after a pre-emption request has
> >> been issued. This is necessary because Gen12 does not support
> >> mid-thread pre-emption and compute tasks can have long running
> threads.
> >>
> >> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> >> Signed-off-by: Niranjana Vishwanathapura
> >> <niranjana.vishwanathapura@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
> >> drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
> >> drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
> >>  3 files changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> >> b/drivers/gpu/drm/xe/Kconfig.profile
> >> index 06742e192206..5ca3305a22b6 100644
> >> --- a/drivers/gpu/drm/xe/Kconfig.profile
> >> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> >> @@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
> >>  	  an arbitration point and yield to HW before the timer expires, the
> >>  	  HW will be reset to allow the more important context to execute.
> >>
> >> +	  Value should be within the
> >> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> >> +	  This is adjustable via
> >> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
> >> +config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> >> +	int "Preempt timeout for compute engines (ms, jiffy granularity)"
> >> +	default 7500 # milliseconds
> >
> >Same comment as previous patch about us unit.
> >
>=20
> Got it.
>=20
> >> +	help
> >> +	  How long to wait (in milliseconds) for a preemption event to occur
> >> +	  when submitting a new context to a compute capable engine. If the
> >> +	  current context does not hit an arbitration point and yield to HW
> >> +	  before the timer expires, the HW will be reset to allow the more
> >> +	  important context to execute.
> >> +
> >>  	  Value should be within the
> >> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> >>  	  This is adjustable via
> >> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
> >>  config DRM_XE_PREEMPT_TIMEOUT_MAX
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> index 25bad007a85b..57a0fb50852c 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> @@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct
> >> xe_hw_engine *hwe)
> >>
> >>  static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)  {
> >> -	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> >> +	if (hwe->class =3D=3D XE_ENGINE_CLASS_RENDER ||
> >> +	    hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
> >> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
> >> +	else
> >> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> >>  }
> >
> >Probably API in previous patch continuation of this change, but it does =
not
> make sense to introduce change in previous patch at least.
> >
>=20
> Responded in previous patch.
>=20
> >>
> >>  static void hw_engine_init_early(struct xe_gt *gt, struct
> >> xe_hw_engine *hwe, @@ -569,6 +573,8 @@ int
> >> xe_hw_engines_init_early(struct xe_gt *gt)
> >>
> >>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> >>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> >> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE <
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> >> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE >
> >> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> >
> >Can this be done shorter with,
> >BUILD_BUG_ON(get_default_preempt_timeout(hwe) <
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> >BUILD_BUG_ON(get_default_preempt_timeout(hwe) >
> >XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> >
>=20
> No, we can't. The BUILD_BUG_ON is to detect errors during build time, not
> the runtime. Any config issues must be caught during build time.

Oh, I got it. Thanks

>=20
> Thanks,
> Niranjana
>=20
> >Thanks,
> >Tejas
> >>
> >>  	for (i =3D 0; i < ARRAY_SIZE(gt->hw_engines); i++)
> >>  		hw_engine_init_early(gt, &gt->hw_engines[i], i); diff --git
> >> a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> index 582be209355b..c4f0969efc06 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> @@ -35,6 +35,12 @@ struct drm_printer;  #else  #define
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)  #endif
> >> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> >> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE \
> >> +	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000) #else
> >> #define
> >> +XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT
> >> +#endif
> >>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> >> #else
> >> --
> >> 2.21.0.rc0.32.g243a4c7e27
> >
