Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89436C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89110E076;
	Wed,  6 Dec 2023 03:55:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D0F10E076
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701834945; x=1733370945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B78Nw47Txfs16zBEZhdmY0VzOHYaMPvXwMwq3BqGfsc=;
 b=iD/EF5dPcVAcQDk3rYisU1AnQFuWt1tLf4LrXYu2/opbStSA4d8SVSJE
 rgWjKc4YE1zEZyd58ewF6UTlsQmXL7j0o79iMlPfNWUiMCkYHWm3nZk7U
 kXJQuQZ+wAWrnnTzeXDB5dXtiPYnLMxRHhwkaYLTbbVBBkT55g0G5ipG5
 asPklQ4LGD83Z+7r5wofepLtMelGwOXm2c9Rp6lV6qlMpBHOSVB5coLz/
 kXD4oq8z5xOB9ZjTUPjDMaKaKps//L9GRYl9Zia7+6mPlL7UW9K3X3tsa
 aQEWKp6Nk03JcsoN4ZunF9hz0sEDffvY/NTI70sSZFkpB7nx1w/izsIkN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373462926"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="373462926"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861979620"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="861979620"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 19:55:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:55:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:55:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 19:55:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 19:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWpyEdMNrpYLSp1rrQZ/BGWtzJ9pJq/HiVi9gHcPVnfT4tB8l9Csi2yDqFq5k6M33N/CGsNx+bE7BxC348REKYkisDzl2q0VTNb7T7vXgGiX1AgXfOSD9ITErpc+YhWe+Rx5dyXYA7kLgXKyl3VpygCY0/oFJqt9WUkUHcexpPYIiInKtLA+5gm3V82quEdkxp9IcUIQ2C2OHmfScQh6oSmmGiXJCRl0J6nFxOl38KStT4ZTXSrIixZ3It242/NRuWEGTEPNuszIiisRJiMGym709GcTc4NowVcznJKu1c90956JGJWCp7/3R7Imht0nOgexvCXSZcKCbIzwXZCKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqAg1R+sv1Em/6XuPnqBkNxK3qB5J2GuKnDpC0pYhTo=;
 b=N3FfRMV29YMOJv2v0qd+7Aeiwx9y/LBv4KDCqmRl7r/Obt2nXXylJcQUFkpzFSH2b0cGAHIwUo5+VOQBSozswpDRKgj6PBmZFhcUqi3B/lQE9cbtrmXTviv7CrpfT7vJy49YA6+gfauMdj1rW/1XxfHYQ94xMUlb+UE3jORmO6RUt+GomisS9kDJrt2rnoDOMMoHBEUTuLmDyLlH78DzZMDlGIq+iu3kchMItnbVdtrRGJvvLBNwOOSwAfcWmQFGQJAeF3EeJY3edH3JVd15K1jbvSaUgltfloGWKmAgNElnFknFP2pq36+PbLXthAU184e/pN6g0SAhfwdCT3hitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 03:55:40 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 03:55:40 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Index: AQHaJ/bNj4Sht/rXLUef/iacs6rD9rCboCXA
Date: Wed, 6 Dec 2023 03:55:39 +0000
Message-ID: <SA1PR11MB6991A1DA7AD25B2AADDA7FD59284A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
 <20231206034130.7897-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206034130.7897-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|BN9PR11MB5452:EE_
x-ms-office365-filtering-correlation-id: a067d830-fa73-458e-e375-08dbf60f365d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6GxKeQM/ADZFznLD3gjd2hRNmyNH5DbdS7ToeY6da21K3AdIK6Yo2JmVmFbbQ3/5eR1euHuNYtvmoaOHezZLEUHSruPSMJg4owwcX3JYtycEBDb8cRJ48u1I0+Cv2Uu+VJ/LcQz02kbrCYFwU2zMvmI+7PeR1xLCPh4/Ee6xI/ON3yE4BkIDREHRcERywQwk+ptbtlU5QBmSapMXZDIFNJYoisHaANUTRUP+9aCDeB94q/AeykNOZYbXNg5JDmxJjJd0f9cGMbgK3c17OcT76bb/z6GcvQF5gYDo46KLjbs5NR6YShhDTg4lRvFee7hTiJr8rgZtKr4Gh1Tna6hM4//yeaJF1xwBA2fSWXc/4NfJ0zB0HdQvkfYx6AT9/PsRly9OU82BptUNBLJk9ArDOzNktcHh8zheUec4jxJfnRLof6tZLxZRrrv5WJlWNPtELjNTZGTxV8u0WJzmPcEV6GpmVM9tXZBYKDd9cCJ/5oLnOhMpboDblwIc29n+Fwnzp2Wjtogt4J8FeoDD2ZQgS9rtUhI1ker+0OrnF/xATyBFdenPK/ANBynPrFOy42gNFtRFLoMOo2Le4cNIIBXFk5U0BwhFqG3KvDQfxui4y4PjCwc4D+YfR6R+5G0EMYzB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82960400001)(2906002)(52536014)(5660300002)(38070700009)(33656002)(86362001)(41300700001)(7696005)(6506007)(478600001)(9686003)(71200400001)(53546011)(55016003)(38100700002)(122000001)(83380400001)(26005)(107886003)(76116006)(8676002)(4326008)(8936002)(66946007)(64756008)(66476007)(66556008)(66446008)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JGkELCFxo6rPky1yXxYdRYUPRMVZhb6KtrRrWVv+HtL0GCDngvFLT9sGbdz+?=
 =?us-ascii?Q?0+xX6ah6n4UfYLrT+A7rs+EPA7DcvmS86lPvsXxIZjMuKDc7pUPMB9qnb8iC?=
 =?us-ascii?Q?JdpEY9jCpUN7hD//hrXTS4ubsLm6k4lY81VbLpXO8Y79Ou2WlOBp8iHEnWpt?=
 =?us-ascii?Q?DXMpBZxGSeQ0cOAkBTkyvEUwjAeOaXq8XlOLSva/y/uEOoRwE/yTxsNbLv4V?=
 =?us-ascii?Q?f/rBMEoR/SdcT5MUAX18SMOLjEs2xRx+I+6Q+nVJ4wdfXjgO0p1ie9XHDizL?=
 =?us-ascii?Q?02Hx1xw/FmOs12ot04f+xMp1J6aRGoLtNsR3Lux91YOpXbF0/HbzRte56Soq?=
 =?us-ascii?Q?3HIDr4s8/zQ/turpQ/Qvg3FVoUbj5B0PhIuf+HRgafhfd8G/jqXf44i0oOxy?=
 =?us-ascii?Q?AKteln5wH02hcVCxFIxMm345suWXvdrtpeT8rItZhrR4TZ+E2lvzMm3oWXnW?=
 =?us-ascii?Q?CTquGSkGjA8U75oEcz2k9y12l6R4R85h43vYwG2WtrW10+IlKuDWfxV8NCZM?=
 =?us-ascii?Q?iA5lKSUPb5WkXe6+xkypHqTCTsggboYVzsVe3ZoeHeyNFGkX1sWEcdC2jVyo?=
 =?us-ascii?Q?gDYxAsA9jpGhuPmewy/MN+G1Fej1LtZ8+90Aaww//aeZlEn1hLXQqQah1cvW?=
 =?us-ascii?Q?RWFN9Ck1rQ2UwGWMyewarSFvSTdgMki8UCrLahuhGU3ZV4oBJHva0tE9RR7U?=
 =?us-ascii?Q?EoiYokZOUbNwKVAVsSTsXvhRMMajblVUxyWhZ02ywSs939Q6xN1SRQCKOC3R?=
 =?us-ascii?Q?Rzp+L2LLrQeLN6gB3MgAesOLdQI8kCNMetLqyVdT5vVhKzWy5MH1T8xoYUL5?=
 =?us-ascii?Q?ahMcs6Dunjfbq+ZMLCCswFbde+9BVYhDa/GioWaKPQ3GP4BJe+B8dko0mobD?=
 =?us-ascii?Q?xyizdUN9MPsMQkrKbhuZ3ibW0dfbAO2IKNxEhfh6nhjRPnCMQYyVxTw7Xfv5?=
 =?us-ascii?Q?ZB2pD+PL0UxeWY6KeJcPc4JNAFwyqJxJ24K79qozBiwSvSq/3+dYKXWsHt9c?=
 =?us-ascii?Q?hug62vdRRd5kzUVONramfx70R7noZFapSxaEiLxBdzpTI+Hwh3V7MUDRVuTm?=
 =?us-ascii?Q?1hvznL9Gms83wKlwHlZFhpKMW8UcFyibPq9DoRtl8V95cqtXJBh+Kaw0tjNQ?=
 =?us-ascii?Q?+R2OhQ9NGYypa+GBDldVGxJ1/r8W7wUatUEmbsE4WSZnf4B7eEqbBNFpPNkM?=
 =?us-ascii?Q?yGAFQGl0EQ3eSZSXqN2+YGXACpgs9bj2LPea3DyUhZ3eAt16iJVJpSzLsb20?=
 =?us-ascii?Q?+qFNlDWWtZX8XcQ0LiaOm4N/lwZzh1f10mH1Q76GzCdCBPhdoh5OcgT/e21g?=
 =?us-ascii?Q?a92qagTmnywrDsx/c7zAesXntI1shg5KsNwxfGTmK1amd87gto0EoOXBulKz?=
 =?us-ascii?Q?CuYGgdbuSP3NkinWgY2qfp1l1H3MxsIXhl6w0iY0nPj58s8PMlAK2y9PIzda?=
 =?us-ascii?Q?wF/iY7gREyKFbDephy393/r7cHIo0EzXdtAFzb7glMOeCmwl/gMpXjIjPILu?=
 =?us-ascii?Q?fpcvO6WCKvN4NSEOqJ8PAs+rBvw4QGjEJNdV2/EAEFJopA+3Pxlnd4gt3GFr?=
 =?us-ascii?Q?wAvbeMfv0LbJE3qDV1E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a067d830-fa73-458e-e375-08dbf60f365d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 03:55:40.0025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kjRd5FiOSt7JpYEx/c5qdKu/vdOBlrp6YD4XX3nsCGxUckZ6bt2XDhwKkF1etHXmKeJ5OIzdwVVBvxRUWb8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5452
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/uapi: Return correct error
 code for xe_wait_user_fence_ioctl
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Tuesday, December 5, 2023 10:42 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH v3 2/2] drm/xe/uapi: Return correct error code for
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
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 24 ++++++++++++++++++------
>  4 files changed, 37 insertions(+), 6 deletions(-)
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
> index 9f272bbaad95..74f72dad2d0b 100644
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
> @@ -120,6 +123,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>=20
> +	q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	timeout =3D to_jiffies_timeout(xe, args);
>=20
>  	start =3D ktime_get();
> @@ -135,6 +142,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  			break;
>  		}
>=20
> +		if (q->ops->reset_status(q)) {
> +			drm_info(&xe->drm, "exec gueue reset detected\n");
> +			err =3D -EIO;
> +			break;
> +		}
> +
>  		if (!timeout) {
>  			err =3D -ETIME;
>  			break;
> @@ -150,10 +163,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
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
>=20
> -	return 0;
> +	xe_exec_queue_put(q);
> +	return err;
>  }
> --
> 2.25.1

