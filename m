Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360B8C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 13:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F2A10E0BB;
	Wed, 16 Aug 2023 13:57:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1A10E0B6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692194276; x=1723730276;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SMdBz/btxMyFDLQlys/zH/qi3xaf2k9pbA2zOoftNBs=;
 b=Uu88okqYYOoQueuhh0127IAUOqiXUr+tNoUG3L4ydL4db+lArtp2XC/2
 GLPQgzWlF9QAuWPjumAToldiJVyzUpK2xKOdfktbrhbq1FKG5MPhGtMzS
 0RE58jjfTQpIN4VzVx6FjV8AowiSzMJfly+LbxBAkMqnaO7BBl/nf+y7v
 le/vhdmd4i5Ik/9SMv4gA/OG3dY/6f8KyJnCREG2WTn++rABXD5RNeNOF
 s4XREQfsjI1eCp/ElyvEDYr8wU/4JyyD0A/JZG44ZsrEG74BeEtikT7IN
 UTrpAQ+K5MGjxFb90/hdEDXxvzDwnpH4qgeswUzPKQNRmLL8GCuLKVIgZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436439086"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="436439086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 06:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734216084"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="734216084"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 16 Aug 2023 06:57:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 06:57:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 06:57:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 06:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3G8T9WgsuDVEeM96ZApwbl5I6gehnmnnrdR9KMQOwPUgc/LhNIM4JL4c9++LN36y6IDOABCLrpD/Z/6d4wlRrdwi3npqyiw6VjGVvszhUZ00iyjQYBIzL2GyI1TQEQUfkMiko9S6Qdj2N0eexbuLu3Yc+bktA3DdmnjHmbUhmoGFzEDcw35rutIlkAXbOMq/pDWPBai1Sl+6YFBqzLoCfVjGlZQlyoun9rqppdp4JJXdd5o54G2AeYzBKLEAdPdl8gGw4p/l0JMTXHYRgqKclwGYSfIytYJj/3vJePg2B+qSNXj1Sad/60hE9WdG8XeFQXuvHiMSeXvSAZXKKKTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7DtdxALYgCoMcLubEXSWSkyNLkqGJoDyq6dIw/X4Mk=;
 b=HRm34f3AbjtEBtlHYvZDFJHjkw2Ko8cLEAnck2SNljUIM3ijNBvBDUsrdpN/2V++fmhbfXwU+gKfTA4EIf+z2AJB2HKJRMhh8E0zFwMOyWv6S0744RiENf6qY49v/kqB9njmopekmZZDhYVyLTajoJOGXqdbepp5yA7uSBhTEZ6xoPXBBy+7yyGTMBYPKAhj1Oww0/Mvi02K/dvHCZioxDKwsCPAkb2uNe4wuz2mf20uQij15lSpdEjddchNU5Vu8bW2nHT4XA+caR5hSl7qMHHcXosYKa8vindhkzgNieZdkGkOphGYmXUOE8hQ7bDNcA+RqMV0QPfanJrvc2WYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 13:57:53 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 13:57:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 2/2] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
Thread-Index: AQHZ0DguYBJLjluMOEKSc4Yh8KNzia/s8sUQ
Date: Wed, 16 Aug 2023 13:57:53 +0000
Message-ID: <SJ1PR11MB62040931404AFB86627467FE8115A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
 <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4605:EE_
x-ms-office365-filtering-correlation-id: e427d1e3-b250-4bee-eac2-08db9e60c963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hp86MxeYZtADwDnu0/178A9jByJ62vSpQtAOiSRSphgMTpk9o4Gg81Y9WMwP/nn1smhEMOF/AvZkWtffeH08GXo95oAzSNbFW7n6fDhZSp8tP4rd4AJl2YrGKqyUdgZ0LSIRzpfLY5dEgGYNY5UfJp4q0Eq4Vsd5suPIZLyhT0OW2DUMIrc3oTN091VWVTsjaz93luMShaMBAqWSJs3nQpAhaKXWYMG6NZRchTsvzFAHDopyjKIBrZvqOAg47lfPwpdydnDEb2SMxx4KEIkFZMHqWd+TzwfjpwKyIY3bBLZJZj7/i4VuqAW4fgGV1mt2f5yJyBcJrGj1cuaozZIixPD58GCgkjqJMeDM19FQFyiuPuIFrh4NlzimaHd2iSbpY/Eyb4s5q9olqoIIRz+eeQDOAy+aiILmwcjddLfj4a4LBt2zoddZHEIeqz0DPQaSYFwDJwMiWIWWtipcZsKGrJDT6JE33SLn4Q4BS+yBWWg+c6OBB0ugA8DkMD3qLiMdEF6IVzbwt7N4iA8f4jfyF/LPb9mYJk0qtG2s98HqbJX1IRN19BNZB8kcwJA+IpC9t1Ob6/Y4WYX/ajgm0LT39xt+EoWF/+Xcw/4/8E9fQJc9xkXZ2RqFwF8WSvRuUer
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(76116006)(66946007)(64756008)(110136005)(66476007)(66556008)(66446008)(122000001)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(82960400001)(2906002)(83380400001)(55016003)(478600001)(86362001)(9686003)(53546011)(33656002)(107886003)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0xcC1Cl7QXkHCuXaFpTI2yEiI5QvNI7ZJCHfUmLnCVtagB5IE/FA846kjYyh?=
 =?us-ascii?Q?fqxRgtbDL193I4hCz3XYj8WGhJJqql1HATEcduYtc5Ihw+dCkQUNczNQGJhE?=
 =?us-ascii?Q?F71k997mx0TZPxH56X5wh5meR6DCPcoCOtKwWykdLngHRbH2LRtOsFEdieGs?=
 =?us-ascii?Q?W1QODiL1WPhQklALPGhE9IRyxe4cNLdKT/AoDqhPqHpalaNMK0/tZYKfm8p4?=
 =?us-ascii?Q?Lq+b4rB88uHf6QFRFCR4lQXIE8IZM17P3soz9+R1Rgn1kI2hKATDzlRRSBN7?=
 =?us-ascii?Q?uY5UVT+gYENheq/Ff4yCTQznoQsQHt/z8QYtkU6b6tKSR99FrK6SgTJOPaIH?=
 =?us-ascii?Q?jm9r0Tu6RE8cVHrIiQtwYZz80cY43ZbBT56fM9hG08CwtacFCxQK7J4KzpjE?=
 =?us-ascii?Q?muvEEm6PT1qgO9ZP3ob6r8qOg1F4aOMAFJWZPfyH3T9xfdD5ynYPTsYHyRL3?=
 =?us-ascii?Q?gsPT2B0J5plZKib9qeaXp7MSuShxSK8xt5TD0kKkhF0dz85xOTo3r7J7DZcL?=
 =?us-ascii?Q?vFgpt7ovz4IHhIPSwxb2L9scqKusXr/nmvEvLje256AcHIvFI3HG3cdRPSjc?=
 =?us-ascii?Q?bQsEj+yZnsO9zSMLCiQ5lH1k19XHbqNZ+uGeYOxJQbNjmwQCgDeUGVBpog4V?=
 =?us-ascii?Q?SnbRhcvsTqBSW4Jfbl14KIwcfMKn1wtKFtEg1Z8cP/lXEhP04FkqlhY5hBc4?=
 =?us-ascii?Q?qgvpOZckfMCIpFK9C4nhGbm9lqXh0sX2EDxxHNW+2xfP2r4EwlMm8qMmdYaW?=
 =?us-ascii?Q?lnmqMDNcDCYjQVkmarVn+uNAj5I3HV5cxn5rgnMhHJSOchyOHuzDf0J1jmI1?=
 =?us-ascii?Q?CKJnZxw0mngjuU3Y2DyuurX3DDEyanfMUfMvvnTpmiqm9ZPNxQZ2he3LI48p?=
 =?us-ascii?Q?iljWTgCeJiHgoPcPd3dRPacdMRe0P6/aeu88bF5mTOJY62+A3QkEPjCpy97a?=
 =?us-ascii?Q?xouSe0excqVoc2zYrwmqIZz4TBDqNkw+DOpBorgxIZ88aOuJ325VQ9PqWxDp?=
 =?us-ascii?Q?debvr70wiKbfmZ3RtHxoLmQPLaRkyl0D/QsxiL+T48ZA/HW1er0a49y2enU2?=
 =?us-ascii?Q?KXhGjsyL9eTvrtqmawkrLZcriPOI6bJI3aSUYaqc7DvnPbLjJRyBuO8afUat?=
 =?us-ascii?Q?FgjC+ngUxwUnmg+0A9zwQHyR3Tw6qWLF6VQUMeOXpdRYHPwem/QqpgZ7nC7P?=
 =?us-ascii?Q?9oTGtxIpRj3whQJPKrotBwGX6/4UoTkhGimov2roWTl81Fja+dQwXKyKzaBG?=
 =?us-ascii?Q?Y+HkExptjmVy3AJKWFg11tkjpyW7uO/86Y96RZxPrPWaCJqmniC2vwMvQc1A?=
 =?us-ascii?Q?nyuckFmrr7/tjewWu+w6+I2hOr9eYEiWT5L526Z5kfOnUgZmGMYxQdEg2ay9?=
 =?us-ascii?Q?5oxSkmQ/k9x3x30IG0ekVOsHmoHs1yWOrm53WgxmiXfczBrwSx/wvuB8gGDB?=
 =?us-ascii?Q?AbwM21EC/kJeu5ro46B2x6tuSYyroPGzmu8HWQeB1+bvqz79SxPQht6TZXxG?=
 =?us-ascii?Q?qgkXjzxWAUwTS+/tD4cAdMoJfyxW+n1QY1axHB7qLh5KpQ5hxfyN+ZvGifC/?=
 =?us-ascii?Q?O3omZuCxvmOQjEAkGU0UUJxaZiyliDgN2c2wX0i8saMD5XfSZNMCvERnSj5Q?=
 =?us-ascii?Q?vvWCu+fnm9+L2y5c3QLtIQ6BafSmqbJf8Z0ICxugfv0M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e427d1e3-b250-4bee-eac2-08db9e60c963
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 13:57:53.5424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: puZn3mDfMzVSodEM4okiIkQ/QA7pgheRAD1jtVqwS5iW2r6P+nezHOMPcWEl8An1a+61ZHc2pleGzT4FEjRMd5U8uKw6u95B68Zu6zMIEd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Wednesday, August 16, 2023 5:23 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3 2/2] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>=20
> Allow preemption timeout to be specified as a config option.
>=20
> v2: Change unit to microseconds (Tejas)
> v3: Remove get_default_preempt_timeout()
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
> drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>  3 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index 9ad487647ca1..a3655ee6978e 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT
> +	int "Preempt timeout (us, jiffy granularity)"
> +	default 640000 # microseconds
> +	help
> +	  How long to wait (in microseconds) for a preemption event to occur
> +	  when submitting a new context. If the current context does not hit
> +	  an arbitration point and yield to HW before the timer expires, the
> +	  HW will be reset to allow the more important context to execute.
> +
> +	  Value should be within the
> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> +	  This is adjustable via
> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	int "Default max  preempt timeout (us)"
>  	default 10000000 # microseconds
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c44540684462..4c812d04e182 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
>  		hwe->eclass->sched_props.timeslice_us =3D 1 * 1000;
>  		hwe->eclass->sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
>  		hwe->eclass->sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
> -		hwe->eclass->sched_props.preempt_timeout_us =3D 640 *
> 1000;
> +		hwe->eclass->sched_props.preempt_timeout_us =3D
> +XE_HW_ENGINE_PREEMPT_TIMEOUT;
>  		hwe->eclass->sched_props.preempt_timeout_min =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>  		hwe->eclass->sched_props.preempt_timeout_max =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  		/* Record default props */
> @@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
>=20
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>  		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 3d37d6d44261..71968ee2f600 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -30,6 +30,11 @@ struct drm_printer;
>  #else
>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)  #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT
> CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#else #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000) #endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else
> --
> 2.21.0.rc0.32.g243a4c7e27

