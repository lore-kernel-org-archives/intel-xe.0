Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788C6C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 16:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B02410E4B5;
	Mon, 11 Dec 2023 16:45:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509B610E488
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702313114; x=1733849114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sL1kY2fWEwnfRkzropv/Ds7u3uhI89Bmxcxv5NHHak=;
 b=cLuIOUZxAuYms85R+WSRFMGoUUeOtp3QO0f6RPMy45mWWDH6sGYHVIQv
 VlaStoNBLAgL5NM2Djk1bWf3dpwWx4FE4qNYN/0YjxUmxusbH+b2lA8QT
 Py0eMFk9sz3s27Fvq/POv0qCaJRd6w6OigrCoECKAdAj4R3B2qeXLosw/
 O/i2Bjn19HM48VswKSEJosPwqjrL5rvm7+q7GE8TLB3ao7kQQVqRn52nr
 vSedCvj3S9W4ebWX6d2sMDaGo4Fewiuzx5N7q2UmTqg1VbdO4/Fq42fwX
 PnOHAckl+Ox+sEi8njFM788gbDiK1ukX7JnyNEBln9S+/3IxwazMLuXLp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="393548502"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="393548502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 08:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896525328"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="896525328"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 08:45:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 08:45:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 08:45:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 08:45:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 08:45:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLdtuI13LWRf7ozRRwuzJoZOWRT2/IYaOwybaenlOgW8lfQpyxoy4jJvCY94ELnss/bFYwYCnnnT1f3ZmxF1LlPScsag+623zCo/L3ZQ843yiid9aVcmvUQX3woadVg3vX/DQBIEBhRiv7q2IqYvp/ZhJFmVH1IvcyIyEKqfU4LpTm69d6m/wo94okJbgcWyTbRtSP66DTlXklTck4UFMwLxGtRtPF5gRe/QDMP53Oo3NBdBRdrCjvmq5OnHS3VNQ9SaNjFHfc8MkLO/9OmrzavvTgDpDBLVxvl/GaVT8H5+25WdO7FVFjW7CMjVku8uwYtR1wnfVTCoEHdGsRAHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+rXW0o6usR7hfsfmIIxPX+259N2ZM5ljzyjTMIx8vc=;
 b=jnravvv3JQm+fZMj6EcHepr+YP7U1LDjuyLEs5vcoBVZ/ItbPCJDwcVlm1Bp9dlZwkZiH0dlCBcv9Fdf7cNy8qTetWsyjcYYx+t6kdQHewIxHpJMkE6Q5PwQgGOtMrpxtWFxys+DKbJx9gZWNnVRy0IaGeyXlKbWc221eRxW98n+cT2aj0PnKhxqBpxrfqXsULQmwosKboc+IqLpxrzfEM4XzBfG4iq8lArV2T7IH0BqmMMVobeFzlS18oKKSOWz+NnhIIqcdgeVTSDXiAwuXv4J3Ha4D5uTCpHp+8lmMu8uRjKQT+McW+WRCOIhFxgBTL+uBdcKrdpoc3bC8WAqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA3PR11MB8048.namprd11.prod.outlook.com (2603:10b6:806:2fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 16:45:09 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 16:45:09 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Topic: [PATCH v5 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Index: AQHaKY4ih0OUbzxQCUu5Xwct2IuDL7CkT5Ng
Date: Mon, 11 Dec 2023 16:45:09 +0000
Message-ID: <SA1PR11MB6991F617BDF94AD17766B6FE928FA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
 <20231208041716.32369-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20231208041716.32369-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA3PR11MB8048:EE_
x-ms-office365-filtering-correlation-id: 65b5e632-c39c-40aa-1acb-08dbfa68895d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0+OMxIMRAukbOdND8rF4rli4E0uesizZ4/VdK5s+Mcvt6AU/ktTnKIz45loEWsHQkAR9OC5Sm1XeCKUtbV0SubwaBDhMOipO0C3oewSQbGqAqBwKXB+NjpoPztKLiliLvmKjcUTDPcyFqi2Q7smN16F2+z0xzUSKRHZsTOEDhPie2HNvLgRmeQQsJnKFcCiH6E00M5DUf7uBISOGhPzbK3dOkfzW2kynE23j037k3Zo1geykmTvra/grVexEjlM7GHgT9FLhlz6StWz8hKSmsHMwuvwGVH+ubaVJLjmAEOmZ4uaWnK4d+yhiQMlwa+ecyhRi73Xuw4VXAB/BJXMw3Eir1DSFkkKZAJHi7FJPhIjaCXix4SAwNb18HMyN1h+V7qHSZ4z4IWy6mBqSOm0B+rDXVk5G8PKZnLwHYnwSz6NY8RcVxcSdhSqu60iOIo6LcFRFSS1KbB3NejArJE0iTTG+U7o/iBsGvm9ehzM59beODKrey7WKoGZWbdkBUxKI1m0sjabtzp6j+4aWErTGcr6wt7DYEac/+7I2wcYbcIMlSTjoOTj48K/5jSKK72qTlSkURa2QgC4dIoDOrtUILVpi2eaqurAfe8HukSjSLgrE8cbGgpJll9PBsZwd8Lj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(41300700001)(38100700002)(122000001)(110136005)(33656002)(86362001)(82960400001)(9686003)(107886003)(26005)(478600001)(71200400001)(53546011)(83380400001)(6506007)(7696005)(4326008)(52536014)(5660300002)(316002)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(38070700009)(54906003)(8676002)(8936002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GEZeWGKwrZ33/53kaI1u5kK0mMJqp0nZDLANDMYuOz/vh09K4dnuwE6lsyUC?=
 =?us-ascii?Q?4gFTgbXurKWHdcSKtVDea/F6TBjAkQbtKlAfUzLJMV0AUuqYtFpJ0OvJdYjw?=
 =?us-ascii?Q?InRjUEiZw+tLOOxgivyYR2NDN3UwhZ99HQwkTRBcGwh4p20tQ6p72WJ2kuZp?=
 =?us-ascii?Q?p/aK+Ctw0DvT05jf04OppxuXkPPIJquRurDLdeov4fiBtOTgjctE3i90Hveg?=
 =?us-ascii?Q?B+/HpFovvjIj+vVP9aiGc25dfU2Qc8hM4xnCkDPT18VuLX1hZLPf9U2oJ671?=
 =?us-ascii?Q?kkn8RLvWkoHR6tERtuOECMyIWEW/XvWJJQMdI1WAw9LjMMQQIo+qOziVFSb0?=
 =?us-ascii?Q?XQRLQ8RbW0ZgWrDhfwXK40j0n0yxvFllMyeMkJYNvCiD82AX94m7jr4P/8/+?=
 =?us-ascii?Q?MHoCgcvdn4kUHSROkJgGrCI+HgpluvHcQXaOKnb/wlAsoin4jZjgRk08KIhF?=
 =?us-ascii?Q?w/AdOhB1h8fIy5fdbeCoskzaVWhNZUnhwW54t8GQGYRqvVW6bwaOM4zgSa9l?=
 =?us-ascii?Q?rFt1F3yeAFtXiwZOAV7jXzc+gkM7/DyVSqhWSQtb0TjUGUzhOJP3YkpzuJF4?=
 =?us-ascii?Q?d0ZrzyMaFnG02jos59YAMjCmZepCSAtYLPorzw/PT3ft2snZDUvBMCoZiSWc?=
 =?us-ascii?Q?NrsNPfElk6qdZJ2TS9QVzoNskASQ0IuFV4k/cNX0Djqsosfl75qMODJWRETa?=
 =?us-ascii?Q?NZeFDfHosmIlvmXDR4EXsRfiWHEz9j9S/k2weQR/cUSQRqcRClzyUucNYAwf?=
 =?us-ascii?Q?d1IKdCVBXbWDP30GjZ9KVouZoVD7pDmaxZLm9TxzLvUC2oPzqXjz4bI8D4w3?=
 =?us-ascii?Q?bOiacKrFCZGzNlsRkllQt9inhY/mu2T7hyWdybOgjVVEmBUb6lfnAmzdepvP?=
 =?us-ascii?Q?o5cF+GTwf8ctUkVTre6+WNNTLHMCZM3rjtJS/8VxISQUWrB07ShpPsr6qdIH?=
 =?us-ascii?Q?wFdIR1LCjCQHl3I9RnmrWXUr1hL7162llbeQ1k2y49AvgSde44rPQsUHYTGY?=
 =?us-ascii?Q?qnESPdcel9GyCWsphEqOsslkUoAoFgtBnN37O3d4nluJwf/jkqKrCh457TNZ?=
 =?us-ascii?Q?ebi7VAWZacqghv6oD0APOvvdJl9WL/30ChrbK8o/SDvxuGmEtJcLOqiUgSwP?=
 =?us-ascii?Q?IbGHKRrUb/rTABME83WRss0XWMkDyFmne4/1SKNFyg2fvBUMDmvmmM4yY6Lw?=
 =?us-ascii?Q?L1ZA34cKXpjvy1XUK25nddxyN0JWH7JRk1YbQm58tWPEpravIeqW6GEHY9xe?=
 =?us-ascii?Q?beq4T8+b98sY7kZGHx4XTfY5JFhjBhNKsKQyJgML+wn+l+pR2QzW8kJGccsj?=
 =?us-ascii?Q?/V+OrfyaH60MqYnk/G+8fmJkJZFDFtgjpuASi4MbkwRH2VSPt3OScZJh8bch?=
 =?us-ascii?Q?4sg+10CC4KMEQ3boQ+4VqngO24jNxn6TU270q59hc/JBvfte8HhDaMN3OcQS?=
 =?us-ascii?Q?K/kz2ZY4Kj5xmmsQOfbRn1kPYd3xTwXWINddgfxL4m/St2VnDI/1wbANyIm0?=
 =?us-ascii?Q?fLKsqd9/rd2WkNorwanJPaC4Hf/Fec0h7z71WDyoPYzhf1Yq/Xz7Q0fQRvrA?=
 =?us-ascii?Q?1T3kmLi9A32XvARE7lE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b5e632-c39c-40aa-1acb-08dbfa68895d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 16:45:09.0753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpK0ZnnMKEs/fbv+8Irw/TqR5jUBmKICKt41aMonHDwT5lzHtwxwKvWxTmWru5NgzWXQCDKadZwn+0twNDr6YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
X-OriginatorOrg: intel.com
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

Lgtm, Reviewed-by: Oak Zeng <oak.zeng@intel.com>=20

> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Thursday, December 7, 2023 11:17 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH v5 2/2] drm/xe/uapi: Return correct error code for
> xe_wait_user_fence_ioctl
>=20
> Currently xe_wait_user_fence_ioctl is not checking exec_queue state
> and blocking until timeout, with this patch wakeup the blocking wait
> if exec_queue reset happen and returning proper error code
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 30 +++++++++++++++++++-----
>  4 files changed, 43 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..dab41e99f3d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct
> xe_exec_queue *q)
>  	/* NIY */
>  }
>=20
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +	return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops =3D {
>  	.init =3D execlist_exec_queue_init,
>  	.kill =3D execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops
> execlist_exec_queue_ops =3D {
>  	.suspend =3D execlist_exec_queue_suspend,
>  	.suspend_wait =3D execlist_exec_queue_suspend_wait,
>  	.resume =3D execlist_exec_queue_resume,
> +	.reset_status =3D execlist_exec_queue_reset_status,
>  };
>=20
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..a42c3574cbec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queu=
e
> *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>=20
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct
> xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>=20
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	return exec_queue_reset(q);
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of =
XE can
>   * use to trap into the GuC backend. All of these functions, aside from =
init,
> @@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops
> guc_exec_queue_ops =3D {
>  	.suspend =3D guc_exec_queue_suspend,
>  	.suspend_wait =3D guc_exec_queue_suspend_wait,
>  	.resume =3D guc_exec_queue_resume,
> +	.reset_status =3D guc_exec_queue_reset_status,
>  };
>=20
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue=
 *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 59af65b6ed89..b0a7896f7fcb 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>=20
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -100,10 +101,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args =3D data;
> +	struct xe_exec_queue *q =3D NULL;
>  	u64 addr =3D args->addr;
> -	int err;
> +	int err =3D 0;
>  	long timeout;
>  	ktime_t start;
>=20
> @@ -121,6 +124,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>=20
> +	if (args->exec_queue_id) {
> +		q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> +		if (XE_IOCTL_DBG(xe, !q))
> +			return -ENOENT;
> +	}
> +
>  	timeout =3D to_jiffies_timeout(xe, args);
>=20
>  	start =3D ktime_get();
> @@ -136,6 +145,14 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  			break;
>  		}
>=20
> +		if (q) {
> +			if (q->ops->reset_status(q)) {
> +				drm_info(&xe->drm, "exec gueue reset
> detected\n");
> +				err =3D -EIO;
> +				break;
> +			}
> +		}
> +
>  		if (!timeout) {
>  			err =3D -ETIME;
>  			break;
> @@ -151,10 +168,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  			args->timeout =3D 0;
>  	}
>=20
> -	if (XE_IOCTL_DBG(xe, err < 0))
> -		return err;
> -	else if (XE_IOCTL_DBG(xe, !timeout))
> -		return -ETIME;
> +	if (!timeout && !(err < 0))
> +		err =3D -ETIME;
> +
> +	if (q)
> +		xe_exec_queue_put(q);
>=20
> -	return 0;
> +	return err;
>  }
> --
> 2.25.1

