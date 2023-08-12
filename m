Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B2EC04A6A
	for <intel-xe@archiver.kernel.org>; Sat, 12 Aug 2023 06:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907F10E1C6;
	Sat, 12 Aug 2023 06:42:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BA610E1C6
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Aug 2023 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691822546; x=1723358546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4I0zc+gAe2SxE4RYLERBYhUM6kUQVaTue3mMwFkGeiU=;
 b=LpTxHmWybSE88gKy585UfYeWGdWzlAv412U0Bn8DhMzjYsO6garfdsG7
 am9m9T2ng7I1aGncw17j3MJF7/QrZjF6G6ffLyvteZZvH2Uo3rIq2bh6K
 188SmzNNwfoaj7Ppn9lOkCDwEp12/pswCnBy9Q7JWuQEvKTVV01RRNC6i
 In/95c8kc8nyFk8+XHXVbtrxj0VqnxKz3knvUd5sFP/+XDholVknKQDfh
 pp2Z8E91tmlFx02qGO+bYxbiIVY37aEbddWgGGSlZq4UWkNUixPz99yAC
 BZTxOcqrtEsFW/q3ChDajYw6tZdOrt61/0FhG9Gfpl9ToEsJcFsd4Y4JX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371813922"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="371813922"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 23:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="847007640"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="847007640"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 23:42:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 23:42:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 23:42:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 23:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jztnI7CZBUvfgJ7LrKN2JfqJkbKBiHzUc6FKUK7LOCptdYZhXRyoh4QGkjN8fRzv+mzcOQIDlNFJb8OBupoQklIAYM1BMV8bb3lXtT4kYPePPYpGRXG+J5byzpqxjwNEoufijSLR6eRtdQZ6j/tl6NUucePk9F3MLj3hMKN+uyxKoClVsTOP27HQLjiAMm6DSan8EYNJ/KzHZccuOeqNxCHjenLCuBAC1DflfFQ1OAxh/NiDTaD1W+ST+Q/BF5POHEjGeiKqNTzRd7dOMSquFxiL1wu3xlXS6OWr82HWdufsstob1OEOE2zrUu13achtRh3ncQcM5gimqydVaPpAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmdHb+1bjjfqNG+WbcyNqYAEtIgwd6K9Yb+9EW253AM=;
 b=gEYHlkfPlWbDc5mli3lvO08NDBCgVzlArpF0h26v7f4bmZ4nLFkmLGAeKVUYx2uXAzM6QWYi3Hc5ehQuNAi43vrwn/tyLrItHsWo4RHYly0wchKgMSXijupLPa2uay/lx8RH1YbK4U/bdQn+ahzGHH36XLXxnLAJttAeH1Ygx9cnStWuxifcljrXBCuZorA35HvWTkOnHJ3GQ7nvWeN5mFvlz2PUmofdicm6Le2RtvqeJ9S40mP0kZL9MbYquWLWbc3xjr93yQSIRm9CkQ8IIWqgyAz6ll6n52sJ6Wi05m+3gP+9XDKL+Uf+uq7djsytywFH5qCjjm7tMjMpXMFzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Sat, 12 Aug
 2023 06:42:23 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%6]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 06:42:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/4] drm/xe: Simplify engine class sched_props setting
Thread-Index: AQHZyiWPBYXjKqXzn0SvUDkKC6yOmq/mO6HQ
Date: Sat, 12 Aug 2023 06:42:22 +0000
Message-ID: <SJ1PR11MB6204AD29BD19AA79D23567B08111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230808182411.31354-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7570:EE_
x-ms-office365-filtering-correlation-id: 70b524b3-0110-4b0c-fce5-08db9aff486f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: upAsFxvZ/hrDI3E31kB5XLdBBy+Su+XqGFX4RHjHTQQdEs61qFdmJvGOhnlT4zGka4jJ94yVZCW5TAzgdn/aNV+mXchgBlDara9iDz5vt5L1IoVZ/p6ViFy7ZLNoxqj2RkF4KLIg3Hl+8ak8EJiyqWGymupwS7Jyu+FltskIiUkZ1wsgjkQt63Jk4Ff/maRgNmCmsyfdrN0pXG0h3SY4A/71+OeAfHlf6PaduesfpWt3iMssiMTKUcLLIeOmsqPyNUDegiqDRUHa9FxQGCI1CZHZHJ825NOjpDH2qYhZby4yiAXBHAvj2w2zx7DFnPZhgFDvMZOENA/QA4W9f4iJGJ6NluGRIqTrpyRX2m1RP/Sv1rCCJeQHgkOSe22UJxyIehz7mhLfCg05gAPG3pniWq6J9j6QzB5D7w8mSQfWe+1LPQk3f8dSrn8bbbhHZtZHfTcocZ/33Bk/hk4EVOFRb/nXd9PVF93XaPSKF4e+y11R7GIp/4fBWbbYojd/Zv1/f4izdopj/BIE0lxmyhacVvukZ5Sx6vlyTUk7STlNbk94xo++DtOtF3+eSLsPGwDIyltdaVIWM0oPHUwTPOanwoVMF4NTuHsoddWm+vtjKsTlCfE+xLviPJaeC0h9vnx3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(186006)(1800799006)(7696005)(71200400001)(9686003)(110136005)(478600001)(55016003)(107886003)(53546011)(55236004)(26005)(6506007)(2906002)(316002)(4326008)(76116006)(64756008)(66476007)(66556008)(66946007)(66446008)(41300700001)(5660300002)(52536014)(8676002)(8936002)(38070700005)(38100700002)(33656002)(86362001)(83380400001)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9vgAMXLMz6g5A2JEvBgJzqrJ32/hgtPktXkatnw1S/t4XL+1mcvoF/tvKLBm?=
 =?us-ascii?Q?eoEqw63tx94BQdjPCfbCdFIJguYU12CcpDbIVUkyGKwAtLUQcVApRVk3oaIz?=
 =?us-ascii?Q?l3AtEUOcZRB1OTa77WSLRKWoWBiny8ZpigyMXsg9FZmTh7X1J91wmA2fF7kk?=
 =?us-ascii?Q?g4m6tfvX+oVcLvTEv5Fp0tLHE+AsUZY4s43MeHkR6Ij57WtSAwVkn0bX2fqI?=
 =?us-ascii?Q?gmYAEYsfZBlJ+HvaBTFx5vJmPKsAKeLhhQktF/AS9evkh4rWOEhxRLtz6vSz?=
 =?us-ascii?Q?miMVH8WnWgUR/GNQIr8Ztcf7+3bQjF8nxLMzRrCyA2fy8ll88/0JB2eY0Su6?=
 =?us-ascii?Q?gaPo4X73UDiYrN7xTY6NDGaoRuRcXD//3w1lqbjjHFHmNFNjl1Mg/x/RPkjk?=
 =?us-ascii?Q?LeTGDOBLJt1Srvxg910WD0Z7XpDWWQC0QzTHkgiICbKmrgVutTCY/+5yDkdK?=
 =?us-ascii?Q?YTrebb3KAUm6Rl9gg1tpentNo9BdpX8q2nxYEcSZdLxI/wlCCjnJKUmrWEHS?=
 =?us-ascii?Q?R0+Ks7fVW0B0bM5h3imVq4ydoCIWOqTvxLLycA0KySBJ+YouD4d6PVeYsAD2?=
 =?us-ascii?Q?SC9y7yIlqFacQn4eGvzG7pUxNcYNr+myKSKYWDLQ3ZmqYBpdMQxu95FsExuG?=
 =?us-ascii?Q?rCsEP1S3B15Vy5M5Pbeg3s2/0JUuv/gQ9Cb7MHz0wmxTLiYxHPdCEgXduVfA?=
 =?us-ascii?Q?LlpPRpuPPt1IlVqdTdTAxXstnhqm16NWWWCOrbWsHHlXoj/dGAECIS9TMlsc?=
 =?us-ascii?Q?7bDc20DrMR3F8sGgxyiBnLKkwS7Va/JBYhC5HCO1PU8tZ+kf6eYxhSktLLC0?=
 =?us-ascii?Q?qTmyh6hCDAXb8eEPxj+JHT1Yrxz/0hvEzbh3grDJ5LkR/nLcvjZHf/gQf6oC?=
 =?us-ascii?Q?80RW8/td5Q6rKISQBTh6aSBRuvEmjM304oCvPEbOVxLHSPjhBo3SdDsJDuYE?=
 =?us-ascii?Q?wV4j1TUJK5hRmndPBuJumSVMmc29btX8uQ7nOig5Ge6EXmPfTEXvrEFuuVbn?=
 =?us-ascii?Q?/24OseAEduJDkUDIov2ps2s6oJvM7diKXh52y0nQ/U+Pqvg5FN1eVqmzYnl0?=
 =?us-ascii?Q?j8H2f1ppnmGHBDfw4zMHLxmDlzn1hKGvI5QApa+SPtTwaaGAp6ASqN99eHJ+?=
 =?us-ascii?Q?heW5JNDL+aITKQBzqcL8jWPbJHLEiolf51VoOmZ8UKCPgBOO8gnNXUB3QKeN?=
 =?us-ascii?Q?wNmke3jacwP5k3eO+zhghbjsnmnQfMhiAlDidDsCOyzZAwDAWuilouX470qp?=
 =?us-ascii?Q?cLnMorYKKAx8L46Ljc7eES6eSci8B9sDdZ2H1Pe/xH36elza9fU3BMapl78E?=
 =?us-ascii?Q?47RrIpyZd2bvt2OR5DaPSSL68F4QqLBIsZ49Q1diCJK8FgvckLrheHZUwONA?=
 =?us-ascii?Q?NkE8dDtaCMKuYzbAoRPoRZYtugR9G9rNmdcwITHsyHONbqUR6SVgZ5TgZHZU?=
 =?us-ascii?Q?261BDCJxTUYCqRQ9y0mhjzC7beHE9Wb4avx+GH1i3dLP13pOXV2+UHJyFgvf?=
 =?us-ascii?Q?BsanZTZkS3J1ssPkdN7wPUVpa9fKLug4y1z9C6N2RGLoMQ9YI357OVatgMuf?=
 =?us-ascii?Q?sqapPHOnl1ZHpaDfyKvRV+oINiJr2MqWeOheMRyq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b524b3-0110-4b0c-fce5-08db9aff486f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2023 06:42:22.5588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jjmbuHddlOS+W5wO1d0t63ZWi77Fl1VaIfUl5JJ0ONORTJ/v6oL2bc3/44lwyctVuRWsD4RH0+kAVWwxDPTy3HYw6y4HMG0Dz/Cz2d7RyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Simplify engine class
 sched_props setting
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
> Sent: Tuesday, August 8, 2023 11:54 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH 1/4] drm/xe: Simplify engine class sched_props setting
>=20
> Shortens the too long code lines.
>=20
> Fixes: ccafbcc61fa5 ("drm/xe: Add min/max cap for engine scheduler
> properties")
> Fixes: ef811a09e28b ("drm/xe: Add sysfs for default engine scheduler
> properties")
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b8fcc6e985cf..c44540684462 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -362,22 +362,20 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
>  	hwe->fence_irq =3D &gt->fence_irq[info->class];
>  	hwe->engine_id =3D id;
>=20
> -	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> -		gt->eclass[hwe->class].sched_props.job_timeout_ms =3D 5 *
> 1000;
> -		gt->eclass[hwe->class].sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> -		gt->eclass[hwe->class].sched_props.job_timeout_max =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> -		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1 * 1000;
> -		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> -		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
> -		gt->eclass[hwe->class].sched_props.preempt_timeout_us =3D
> 640 * 1000;
> -		gt->eclass[hwe->class].sched_props.preempt_timeout_min =3D
> -
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> -		gt->eclass[hwe->class].sched_props.preempt_timeout_max =3D
> -
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> +	hwe->eclass =3D &gt->eclass[hwe->class];
> +	if (!hwe->eclass->sched_props.job_timeout_ms) {
> +		hwe->eclass->sched_props.job_timeout_ms =3D 5 * 1000;
> +		hwe->eclass->sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +		hwe->eclass->sched_props.job_timeout_max =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +		hwe->eclass->sched_props.timeslice_us =3D 1 * 1000;
> +		hwe->eclass->sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> +		hwe->eclass->sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
> +		hwe->eclass->sched_props.preempt_timeout_us =3D 640 *
> 1000;
> +		hwe->eclass->sched_props.preempt_timeout_min =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +		hwe->eclass->sched_props.preempt_timeout_max =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  		/* Record default props */
> -		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> >class].sched_props;
> +		hwe->eclass->defaults =3D hwe->eclass->sched_props;
>  	}
> -	hwe->eclass =3D &gt->eclass[hwe->class];
>=20
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
> --

Looks ok to me, it helps reducing some letters of code line.
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> 2.21.0.rc0.32.g243a4c7e27

