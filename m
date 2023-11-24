Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C37C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E910E21C;
	Fri, 24 Nov 2023 18:18:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902110E21C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700849889; x=1732385889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ZDpkF1BxV2TDO+tSQnHfIS2qGrJ679Jf7oNzsvsaFY=;
 b=NoE/beE4v2BtnDMdeh9nU5y4WzBDiqzskgO1Qvc5dfLpj+mOosIQM2WN
 XgDQK6M94kyWA7C1m7sWSAqh0ZpOor/1IhtRCF55kukzuKbRi3l1ez5Hh
 bxrBcVFoG5wz/BFH5zTqO7weFf/ppOqzrRXM63CtJS/akD7VM7hfmq1hJ
 7CdU0N7E3I+ohR6yIk+ArzWZGRVx0ZuTGmIiyf8za2D2N7ZWJIkNjRwEx
 JWvLvpVf9gG39qpdkAyn6lNnlXLRRHv4PkLvmaha4keqbf/NEc24B/Wc+
 NjkOkeeniId/SoUY8BQlNH5k0QNIhrcxSGUPMQfW1Re3b4MlWFmhZR2sx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382856430"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="382856430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911500715"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="911500715"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 10:18:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:18:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:18:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 10:18:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 10:18:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWfeh4sj38GYve9fokDBD/HLkMlXiPjNy94oJsJMIBoWPj/qB0PliB640ducPOEerQjP4MkfNqej6Kc2hUVvShyVSg8T++bD5KZJDunLvULjwROcNl61PSqshT6gjcX06MI4NXFHe/L7OYTggn2jchYbWKT5NHw078ADjSWl2m7nKmyC2pg+j7kOnom5UpRfG+aqH+q3cMZTNXe7y7nVTpT7xL6vQigdC5dyMvJ92K0Mb507409giSuYgMnrFX8NMotoTcHhypyr+by3cbDv4US0PEqFv/yjmgrcDGJ2Nb//mb7INIYxGArZIoYHB4TBJfR/GjXBJgpEFBMMjM47rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqIjxiwj1w6PrR8T0eIAfvb5mYvtq6MoczyxmrFEUzs=;
 b=EQxpWn3aJ7i4eDsxOHuyXwLjyVi0Znqwm20s3o7NoryOoHhXAJgce3bF0SSbRtX+ksGnS2dDVAUkMmL3RWcj8ihKzf9W7XXvHUvwltVOcMqiS3RxsUCEW47VyfMuwB6l8MIv7bThFfxWOBKjBO4K81CzGoAYCIue6pxqnP3oNbJ7mYKx0+Z+MYSvtpRFHMOEbIH7EKXXEeEbbZeRRT6rFEjZEqfRfwV2kyrpLIhJ8zWIYp1DD0oYv/AsdSCEeAyb54lIlimHSMz+ZOcdg4lnxESo4Hu/lMnY5NwhPyrN/rotETgS/89m4tsR2vk/16lQQ7M/vSqvw0Bwym98URIqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 18:18:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7002.022; Fri, 24 Nov 2023
 18:18:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2] RFC: drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Index: AQHaHPwBSJGCS6w0TU2lEELOwkZ4srCJyO5Q
Date: Fri, 24 Nov 2023 18:18:04 +0000
Message-ID: <SA1PR11MB699147D9656046AFAD1D303192B8A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CYYPR11MB8405:EE_
x-ms-office365-filtering-correlation-id: de1b8565-c936-4fe5-e794-08dbed19b37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wb7tc0Pml7B33fPXl7XXd3bJWE23D+45YnDUV47v8yt7Ei2tIVsLCpOC/alkSY30SgC7YxJtT0LoFwm3TDvlVpRGJYpWf2tA3tSQCgcQGAjHVfEz1/lgfqMvIYlCSlYCrAwRk6XUzgwdVucpjs3yTKovbXkL7XB30zXvxMdLDLnOoGbKiWch94x9BxYFn12hjrxrKH0nST7wlf2qrtJSSto5NEeSWK6ZallgStMyYBX+piJVuQXYM47dWRzWxZtwdMjsuXIfzF+HmLR4BFeRXaR1J2uU6OrXUJVZkIoPuUD+Bjct3maZJ5JNDfv2dDCBdYj00WwwSkgItrqhzEJUQbMkQNEUuwF9bHHvbicJo4jqtR9Gu9xvJmsvRat78eWWG7+2WZilLz4GLn0Ye79uKjf7ZkOny5LetAm4QWsdfGOGvtV5K8c+vk0a8a5P1T+qaSR0XZrZkTQ98PWiUKgwUIlzgrZpX0dVg6jnsrkiZXscaXk85mtO2YZGvm3T1rZkuz20xyM8fAYm0TbdDKTzunJyA+FxD5cFZRqoKGE9VK383B1AKPr7//FYfFVaM4U3GDWrT594ygwaXeaLpeKAXZKPlPw21vI1QA2e/2j7owtvMo/Hp9uWw9Vp4tcEJSXu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(107886003)(41300700001)(33656002)(5660300002)(86362001)(26005)(55016003)(2906002)(9686003)(82960400001)(6506007)(7696005)(53546011)(38070700009)(71200400001)(52536014)(478600001)(38100700002)(316002)(76116006)(66476007)(110136005)(54906003)(66446008)(64756008)(122000001)(66556008)(8936002)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kxASaYryrIifFHu/OUsoTPOw7bjJgWe18RZbTBQATb3ZxsoWYHrvKwQlxasP?=
 =?us-ascii?Q?yQZAi+YyXmJbc0TO58wlX9DleFsUuFIiEHEjYeNJuUSL8uvQ7wFkdddWyRq7?=
 =?us-ascii?Q?eEHBtdogYU2V20G3NYVPizNA3d5ydkdM9E0Lr8AlarwtQ1jTsJXr0ZnucqBD?=
 =?us-ascii?Q?+iJ+pyNdY55wWwuwpILvcOlnzh41joP/O1QDEXCLYfIcx0MY4uxLwX7nigY6?=
 =?us-ascii?Q?uSDm2B0Sh2Nja9UW9XsOprgbFvVIAmc6dGiD9WQODHTT2lBpnSIyA8LgTgwz?=
 =?us-ascii?Q?08A9C2SPR2UXVr+wvmZWX2dHVlF2eljHtpmVPcYvRAAsYja04okc4ctVc2Hs?=
 =?us-ascii?Q?fH7F4S5vvbf7PjueEVpvR95rlRrBqPbdgz8W0Y8nYAA+HVgIGn+PXbIf1hFN?=
 =?us-ascii?Q?TNd6ZDRPR1ax04pJ2RJ5u0PswpW9BRApRDGho3Ap1sLWOs/V9ZNt3gNNgg47?=
 =?us-ascii?Q?TYTSZhjhoMi9GAj58K731ibhjkpyrAanIRY770jf4tp2KhFa11Vu7fK1voHc?=
 =?us-ascii?Q?KAajcY39VPIDl8N2uy94PC9XyuA46hY+cIkZcm2FpoVYo8k6lEfo0YGRdwCT?=
 =?us-ascii?Q?FmxeY7/f2VTjJB12P+0KeB8GW6i+1C5q3CuJsl5gmXOOyuOX3SomR484/955?=
 =?us-ascii?Q?K72HjTaHNwzXNNiukQue6fQ+kYtmDXaYd3VJX+lo+T33XVp6Oj2N5U/AGybq?=
 =?us-ascii?Q?8A5K4GCWNN/e81mfSrBGe9wEP21A/2vy7mfkbtYL72DHyyDvmLWin2SF1ZdP?=
 =?us-ascii?Q?sLoF0+oF/nQ4FbQ1rMBrag7j2lQNnwfibvhzcvjhBR/OKGs+2lGmWeva1R2/?=
 =?us-ascii?Q?a/EIQxwe91mH/npXacDeRipXZpWSaGKB63mlnh0wsLrY/tNG+ffW8L9A0GfL?=
 =?us-ascii?Q?exorTkHxsBZJcwE9lNgV7zdWanXo+JIiRWk1blYbEjtSC2z0KFsu6LRJhAhC?=
 =?us-ascii?Q?CHHkMTUBVoallIO36zZdF7s+fZUq6E3/OU84Kgpf7YmjFIG11q7v2fLaVo6+?=
 =?us-ascii?Q?EA4A7GOodDXWie1QGNM47hz+rpF+un2lkxCwpHe2AbpF6sgk/5KmHUE2yJ6J?=
 =?us-ascii?Q?XXEogbNkMSZi6AhcX9QnbceL3XnV8vlKF2MVHs8JZ1DEZ+yW8/+tdOBG5d57?=
 =?us-ascii?Q?q1in6SnkIFOUGTgAdMTHHhSoP0VH03F0Bpehmhk59cwt7E/CNa77kWcXZs3Q?=
 =?us-ascii?Q?0aIIIVv9vkyQXkTtaXluKPPc7+/xUgT6PsbGgB0FzYY57DsUcA5FWsFgseJi?=
 =?us-ascii?Q?KJFTZOtvR+RTkSGjzcrbsykrzN7JTbQst0rdFpaROIm0uqMSDETDqLTwbPx1?=
 =?us-ascii?Q?98lNAB17D4t+cWnzFUuyJMcrOBNX3hB7BgASgMXj8eMnquxRPbOCBR6WxXOF?=
 =?us-ascii?Q?uP3bECZwaHIDydA3gjC1/kFa3aeEhNzMmHGc2ypZhAHb9n/VGqK8fxjVe63J?=
 =?us-ascii?Q?YHY0wGIVwbjMNde/NRvK8Y83YUuV6sXIclIaln5SyWENVBdrQYd3tRHf+sGr?=
 =?us-ascii?Q?grM0X0WEcJASF2ekXSoqGw8Sj1ecdCu6I9zPZSt1QjVgcCQbEv0pKXUENjUe?=
 =?us-ascii?Q?4nCB9HGsBO3pFKudOkA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1b8565-c936-4fe5-e794-08dbed19b37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 18:18:04.3883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7NZZVQPRzO47NG3M8LS9D3+HZDISp50uYJRxrFdmSxBG2Bw+5j/Mbk4ayYWyXxR8O1WS4y6KWKyyMvS8vsq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] RFC: drm/xe: Return correct error code
 for xe_wait_user_fence_ioctl
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

This version seems good to me. See two small comments inline.

Oak=20

> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Tuesday, November 21, 2023 11:22 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH v2] RFC: drm/xe: Return correct error code for
> xe_wait_user_fence_ioctl
>=20
> return correct error code if exec_queue is reset/engine is hung
> remove the num_engines/instances members from drm_xe_wait_user_fence
> structure
> and add a exec_queue_id member

You also added a reset_status interface to exec_q_ops, need to mention it i=
n description. Or if you want, I think this internal interface change can b=
e a separate patch in this series. A small patch each only do one simple th=
ing always help people to review.

>=20
> v2: Addressed the review comments
>=20
> Need to validated the changes
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
>  include/uapi/drm/xe_drm.h                | 13 +----
>  5 files changed, 37 insertions(+), 58 deletions(-)
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
> index e8754adfc52a..3b390f047108 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct
> xe_exec_queue *q)
>  	/* NIY */
>  }
>=20
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	 /* NIY */
> +	 return false;
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
> index 9e9e925c7353..e13792e49a67 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queu=
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
> @@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct
> xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>=20
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	if (exec_queue_registered(q))

Do you really need this check? If a queue is not registered yet, how can it=
 be reset?

Oak


> +		return exec_queue_reset(q);
> +
> +	return false;
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of =
XE can
>   * use to trap into the GuC backend. All of these functions, aside from =
init,
> @@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops
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
> index 4d5c2555ce41..97af879ee923 100644
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
> @@ -58,27 +59,6 @@ static const enum xe_engine_class
> user_to_xe_engine_class[] =3D {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] =3D XE_ENGINE_CLASS_COMPUTE,
>  };
>=20
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =3D
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >=3D xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> @@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args =3D data;
> -	struct drm_xe_engine_class_instance
> eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =3D
> -		u64_to_user_ptr(args->instances);
> +	struct xe_exec_queue *q =3D NULL;
>  	u64 addr =3D args->addr;
>  	int err;
> -	bool no_engines =3D args->flags &
> DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>=20
> @@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, args->num_engines >
> XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err =3D copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout =3D to_jiffies_timeout(xe, args);
>=20
>  	start =3D ktime_get();
>=20
> +	q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
>  	 * for everything. Could be optimized to have a wait queue for every
> @@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
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
>  		timeout =3D wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
>  	}
>  	remove_wait_queue(&xe->ufence_wq, &w_wait);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 88f3aca02b08..ae2457dc30ad 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__s64 timeout;
>=20
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
> set
> -	 */
> -	__u64 instances;
> +	/** @exec_queue_id: exec_queue_id returned from
> xe_exec_queue_create_ioctl */
> +	__u32 exec_queue_id;
>=20
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> --
> 2.25.1

