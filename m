Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA7DC0015E
	for <intel-xe@archiver.kernel.org>; Sat, 12 Aug 2023 06:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9E310E436;
	Sat, 12 Aug 2023 06:57:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7369110E1C5
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Aug 2023 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691823457; x=1723359457;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JlD3WPn/uPYZEkoYuSs1vBhrzV3EB3EMNE6QRLW+b5w=;
 b=AlBI9Z3DEImhVLxYG2t6fDKf6Ievr70MUKVmt2SYbQm6DKzYr9y2rYpm
 LUv294BMGYVBjeO6WD6uwBOWRNGxe3Y/Yg8eSG7ZXb+nwnXtBzRFzdVf9
 UU8x/jnVIVwJY9IJc3BGnS1bjr9rfMMSr2ZFWmnHh9XWE79jb9F3wK6ub
 lBLstHje7V9NQXMwz+YOXMwLtyhlqVXmsT1p5m4I9Kgy3Uj0ZEGZZv+Ws
 +O09IpB469Pc1+Rgh7GnMRmh2QZe04CUz3CzKKoShoXiBqb1aVu4uWrSP
 ZcQV3SU7MQeU2WsCk/ruIXpE63PZ6IPGjEpK41KyZhoQlF042Zbs2TcwR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370710065"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="370710065"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 23:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767896179"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="767896179"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 23:57:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 23:57:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 23:57:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 23:57:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 23:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPuqwoUucvh8IEr9FujvRRFg79lHb2wDv6zHPh7J47t4eg1DUAayvfqn9w7syX2k0dduA8zlQLYCf5Gu3hzqSaxC+4DZK6JMLbYarvI9cJdvmWTW5KL956Qomh1HodXbrn367cDZZDYVYj6QLwXdhQ1roishdY7NiEj/AEEPuTR5Ji86ejX4nTUQBfFc8GPgEhzfB4z8oOAcoMbCDCn6kTOlF/KEiAWLGC3Sy64h0DvBsXoFYVWDhc0tDkbgklO3IVrs4mM0/3cVfvP6cOjZxFe8adACrMYiVjVyGFfQb9Yh85a99z2oQOkiEKjVnT1hhYRRGu74Kk4iS+Jv7U+Rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6LpqvPjJAcOysnzqBqJpWiq8XmEMfwzEd7/a3CQw6g=;
 b=CXSvo4Skz4Z2mi9xi5prVBnpGr+8gViFg5anw49CJVOKZ0qBv0w6OGQaIgAclkHlEs/d18kwaHn6B6NJiWmgDgfj7xl94QUkJvHvPpwVtZJp+xnpTLO9X2GxTTNs5DzZUoS6GwzdwEdw6mhIaUtaZxZ9FLc33HENhHGlhcZmhrUfE+YSfChWj/VmIfZcfEIdaMwH7/idyXeij/IXmdyW68YQzh23wd3+LeUYmx91su8cpYsBsHbzGlA85KbofMGN15CTNO59dXgjgmMvamuIdj4ERSbChp2knKzb1U6craHqpjHEnD/TbaVopCjFZrCIrjYZsSFPm8D+y2f2CjI+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Sat, 12 Aug
 2023 06:57:31 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%6]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 06:57:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 2/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
Thread-Index: AQHZyiWPVs1X7IGABEyuLvdK9lIT6q/mP4FQ
Date: Sat, 12 Aug 2023 06:57:31 +0000
Message-ID: <SJ1PR11MB62040FD4DDBB81A598E7E9678111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230808182411.31354-3-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8069:EE_
x-ms-office365-filtering-correlation-id: 645ab7f7-430d-400e-dc3b-08db9b016634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bIhRsjqakc5ggGpWXyagSd1u46XpKg4N8ubljWo+1fj7kwD1gAoc8CHr03PBZL15NyA6/MLwIWaVSnSK1a0YvKTOPEf+DobBpy4AIKUragzTbdlGei7Qz4nmGXi76poolwkiBjpWhhXVbEdyS4n35s1qeP9xZfSx6UjAvd84d0wUMdFI2/L2gAKrj9ldxAgyCaaFpIjx68x9FphDd1gmt7R6xVp+eNW06QawnkRm+QDRmvPhOsqErw1qRwPSwtr6AmMg9v6ajGpBScx6zOu98I1T7F1CRaqaWyg8clJbgXvTgUheiWE6ktrbBsLGAqPLMGSz1+qKaj7ptVGTgVMOoFKXSZB5ZiS8C2T/UyzOJGGnw4sUuqJmGmL7THTZWx0l5Jb4JfFnR9V/VJg2+N3bENYOdIGDD8lH/SMel8tbt6+ba2iQitTsFSyyyDhVVCCmvqTegnA8G8z/UQXsROAIDriw794CyxLIHYYZgvCVXDWmoHsxMiwjMsDUmYJGmqbM6AdXHv9Vc6h0TbLwjgmbT4ju2Aw2lpDZmQr3HVXBYz8mQUNAQQu8f2kERN7Yqf3xOvRxX0AmBzhMVrbM+qTvtKB7yzeWojKe1FmTzfFt1osi3S29kBKnXuj5iX5PNZbh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(186006)(1800799006)(7696005)(71200400001)(9686003)(110136005)(478600001)(55016003)(107886003)(53546011)(55236004)(26005)(6506007)(2906002)(316002)(4326008)(76116006)(64756008)(66476007)(66556008)(66946007)(66446008)(41300700001)(5660300002)(52536014)(8676002)(8936002)(38070700005)(38100700002)(33656002)(86362001)(83380400001)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UzeTor4oKl/MIoslPMw0VrovMH3oUnj6xvH6tdIaf5m2LBw+U3yq03TUZyWc?=
 =?us-ascii?Q?pedws4LQPDPfnZLYNwYoFnie3kTiy/gHKUR8l1ugbvwQLrtyJi7nKpgcyFrk?=
 =?us-ascii?Q?FpvlAGCzu7D3vhj0BtRClrktgeIDxEp0c/ejbM6aArVRBKZ4IQhipFQMsIbl?=
 =?us-ascii?Q?E9kRJs3MyBUBgtvRCdIgAHd9P9OWWRN7EbY2xgW+7dU0L2qkoUG5Ra6NyUze?=
 =?us-ascii?Q?vcOUmM7uOdtCbOpGObYMDEBcSOadMeN/CntWmrY79H60SJ+BZY+8rCseZ0dH?=
 =?us-ascii?Q?uESwgmhYh2CQq0XRh9+9sSQIMDm0AG9JOMidU8b6EKIstXKm9y+Mt5wr/feA?=
 =?us-ascii?Q?olyJ/plrEICpP3jo4opTMePHYLJLjXj9izT/rNoXG2I/qclKKi4MVRqwAJV1?=
 =?us-ascii?Q?hA1RmByywf/8T5F0FQfwbKB6q1bvqVG8pQXm8SZttRklBjYhTL7GSDHupD+t?=
 =?us-ascii?Q?Ll9gYbX4ANIgt40T9a/E9UEjsLpTOfttzdpfC7QrzRESkNXT9n8VatGtxFS5?=
 =?us-ascii?Q?eKfFKVGpOyo2I91n9tQjt6wZkZGUNlm1S5q6yh71a0xJz08/AK23wLeyMBKN?=
 =?us-ascii?Q?QH21FUgJrXWGC82ZcOvIYlpi7cabhv3x0Ag8CgkbS1V8kWsDWnGT+b6Zk3Th?=
 =?us-ascii?Q?AHzmFnib1/iC+t+cZ2eZ1Hirpgp3w2g7nD4UujNUcX1gNjmfgn/83R/okxkq?=
 =?us-ascii?Q?0jczSNNmTxEvZDtZG3XnQCpTc4iSebz+HYevONB6trRg767ima8iX9fGxgmk?=
 =?us-ascii?Q?wDhIm4ERWxZUdC/dpXYJlPcahHsaLudO7mpRvWQgw4VEGPEHebHfxThfzxA/?=
 =?us-ascii?Q?Nme+K7ap4mhsTCnR8YmUh39bg4Efh5alAkyVUAEg7DLfnmmPP4lUDQo2nG2q?=
 =?us-ascii?Q?zkV27eyeSRt/clAhRSyHIB7LJo/gPxTrc+XI8yfFUEEtquKT9CISPWvR3OzS?=
 =?us-ascii?Q?n889ojxRkCSkQe9mrBuxvRkiaFF5ddYXbycQX/VPyqYK9agQrlmk91/pWZHM?=
 =?us-ascii?Q?ejgVhU1KrmpKPALOK4JsHhFciNSpr/KFKKHDO/dfmGyC72clFAHcpm0RM7ey?=
 =?us-ascii?Q?BoKjnqXHQ+aWSe72n0WHWzCG2JnszH1xpmlPyJWbas4tghR/aVrQYCii3OBE?=
 =?us-ascii?Q?W0vn+U6nXbPciGBTU3xrN+5UfNwSlJ9pabqhvb0ofVMoBKj5wIWix0OM/HDK?=
 =?us-ascii?Q?szfmEVAg/Y3bAS/rAfHvpe+DXs1l90FRnnEU/Cq83+NvlfxMvObcufQnqhcu?=
 =?us-ascii?Q?blA2B6C1HQBnveMNYr6FRy7ys3Mvx3275bPZ1brysPSJYTQJkCeVyLg6BKpl?=
 =?us-ascii?Q?kDc7iz9AGJ1P+3Y/BYBWBoZweAarqYliON8l7XHBIfuiSfDjqJPsrv5D3zQA?=
 =?us-ascii?Q?Rgu9jVBLH7HJkKZEmEtLLnmtvC20Rcc6F6r+MPvofuvUTh2j/FCC0QRZ52GV?=
 =?us-ascii?Q?zcSeVKUDjQIMLoi6P4Q9S7ri+v22Fg8dZgCwWf4WXncFcivIV0v0gI4mIZQR?=
 =?us-ascii?Q?VhCf9rmJb3ExFA/Bk4MnI0HpiXWsXLIfFXsbH1VC+kI43Dz0j2HUoGxjdF62?=
 =?us-ascii?Q?9QRSiYkRCrgclpCwZi05h2Z6Ax84i19/peAAG0YW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645ab7f7-430d-400e-dc3b-08db9b016634
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2023 06:57:31.4740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lV/3HeA5vUU1AroLkwAFNRxI4QEzCgeaq8ofxw8W7MvYPI9Uh56MuP6dC0RJOO5MDA63WcX3EgRL7WEc8zyvuxcJ/S0CMswlq5RgUyD5wTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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
> Subject: [PATCH 2/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>=20
> Allow preemption timeout to be specified as a config option.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.c  | 10 +++++++++-
> drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>  3 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index 9ad487647ca1..06742e192206 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT
> +	int "Preempt timeout (ms, jiffy granularity)"
> +	default 640 # milliseconds

Why cant we represent this in us unit? At least it keeps uniformity with ot=
her code.

> +	help
> +	  How long to wait (in milliseconds) for a preemption event to occur
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
> index c44540684462..25bad007a85b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -338,6 +338,11 @@ hw_engine_setup_default_state(struct
> xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);  }
>=20
> +static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe) {
> +	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> +}
> +
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *=
hwe,
>  				 enum xe_hw_engine_id id)
>  {
> @@ -370,7 +375,7 @@ static void hw_engine_init_early(struct xe_gt *gt,
> struct xe_hw_engine *hwe,
>  		hwe->eclass->sched_props.timeslice_us =3D 1 * 1000;
>  		hwe->eclass->sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
>  		hwe->eclass->sched_props.timeslice_max =3D
> XE_HW_ENGINE_TIMESLICE_MAX;
> -		hwe->eclass->sched_props.preempt_timeout_us =3D 640 *
> 1000;
> +		hwe->eclass->sched_props.preempt_timeout_us =3D
> +get_default_preempt_timeout(hwe);

I don't see purpose of using this API, also adding hwe argument does not se=
em to be any useful.

Thanks,
Tejas
>  		hwe->eclass->sched_props.preempt_timeout_min =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>  		hwe->eclass->sched_props.preempt_timeout_max =3D
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  		/* Record default props */
> @@ -562,6 +567,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
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
> index 3d37d6d44261..582be209355b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -30,6 +30,11 @@ struct drm_printer;
>  #else
>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)  #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT
> (CONFIG_DRM_XE_PREEMPT_TIMEOUT *
> +1000) #else #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> #endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else
> --
> 2.21.0.rc0.32.g243a4c7e27

