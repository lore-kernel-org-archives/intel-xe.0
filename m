Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7133C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F1F10E07A;
	Wed,  6 Dec 2023 03:37:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0210E07A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701833827; x=1733369827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZkVkhru+81xslznFQD8jR4KATNExa7onnOfL6sDDjj8=;
 b=S8EGytUOUMwVcQlhFZRmQ4bsINlEJD/QfRY5X6ixlNqzmge1sNuoCmaA
 5edysUFLV/vUG2dXX3bbSfb7UuK+PxsWKfTu9fQFEkevyppQpCULjLgpj
 TCJYmTluWAJkg6Zst1tzrGjP1LhWvE+iPCjfAXXZDKo7W3+31YaWHk+t+
 WU8RbZInx0gNDr5uZOaQvP+ulA9grPcxBWtJFO6lYNb2FEEVcJWlT449p
 TgARn6jb98PFacCd6zOyujhFx9s/2Z+MhqqlOPALG66mT4aDneg5y9Ql+
 5WNTr+S0C3qCFH4XDSIQQLJNc/jU/y1byBkD1IOGye30++e71lMB6B3By g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="839138"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="839138"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747459603"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="747459603"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 19:37:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:37:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:37:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 19:37:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 19:37:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZIN7hHzsnSBvwhyi5lXhGpTxj8UcdvvGs9hNPJZZGqirNojPEkeR5t0IxYGKSFdgpPG5EEdbVITv+d3wGaqoyBppGZqV8lz+UqKH0DmdGDfJu3bsWCkFuvyXkBXWISEVAd2PdVM8RBTnCrZVWfqr9Poi6lc4AzQ7X/1TA8DTTGIrSIvOBt1nmplrkaabkLJSL/bG4rH0wPidZhtNevhQK3aH8fjyqtioBPcou1UOLsKDf28Wf69zGPj7Ro+OQ7P6fMQi6EriOe6DxDK11hN+ulMdlbowGxdmI9WjhTjOumNca5RslOkdrjZ3dYauEWCjaXVI1M35ikNyhJvZGX4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTaXJQ+HFW7Y73qyXKGMdMWDIILzMtixzGFkdr9uYpY=;
 b=Q7xJ2UiSZDrLNnQFCznM5iBmdqkkDb0xazSHH72e3TNmGn+kwy/ReMJOcdBj8CiSrFDHJ1QI3+h7bmcwvggEr09o1i3wmUzH409RMZ0YdieYuZvTEwfyKK4nd3Y/Ut+lGB01rsf8c8uswm52IDa1IORrjoasLsGxZpy7fV5D9uapasaakesag81mM3bWby7KC0nGztxTJeKPcE6ZQb+wTCQCuI+uXBIRyf3yBuzpDKDUyTb6gZ8W2LNgyMmS+ZewWZccHaVzuYRy0V11ed2rJhuq0uxJYDpmRNXeWu6QsNp0Cp8KAm9+aiw8CIe88MGg+h0A84UK4pCUbouK+F/jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 03:37:03 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 03:37:03 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Thread-Index: AQHaJ+70fKt7IKzJ+0uErO5DEMtJnLCbmiKg
Date: Wed, 6 Dec 2023 03:37:03 +0000
Message-ID: <SA1PR11MB699100B3B802FF09D91C48409284A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231206024523.29164-1-krishnaiah.bommu@intel.com>
 <20231206024523.29164-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206024523.29164-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CYXPR11MB8731:EE_
x-ms-office365-filtering-correlation-id: 3297d064-1dc4-477b-50ca-08dbf60c9ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: idJ8+feM9EZ/dA5bEwgmv5X0vIU4q3Jd4qRw+6HlI0M7+puOYTm/cy6Tg7y4CXgC0Vgxp+NsyNlROSpNvPAhScjYH82uA/PMcNhzbWg0hF40p68+DyhLtAqVJqgXYwMPVI///lpgnSuGVt9w+fAhQ7yW06Gm5DHFYbQp1sJFwUxP05WiEsOS19mLIPx+EoKnb08+66k5cfIf5Z79dQLaV/4RPzic93dUj6a0RWF7xi++Ygfh55Vz0QsD/mo3kYvWCOV8mQRK54OFDj4kbSvFw0yOv6G0hUBZi6ZyXQ8NL3zTq7xkay7OeYDcNtsBO9y5EPwtAUfIt/ruWLIzScAB6tBOaAVQH5TwzFpGgRYJnfh4S8ShWkTnZ3ssmw4QID7tyz8bFLy6BVbLzKZIxAQrnJ72+pviAJ0zP677dtxo/xEl0W3g9VWP+q2pYTqbWqAdSDKkMuMV+WhQMKl8MK4z6KL+EKTozyTttMxz08n3bmwBqfE9e3bFrOqR3LRriGcXMP3untI3RMb8yJ0enF4fyF9lHTIsfuoNqCjeUtHbP1x7WFRWYvr5MYxLzilhnD3RykPm0t7PgyQONFPrVgZql7DxhmBPqayj1FQk/mF3z/1l5Qvpo1ZPGvbec85XFxa4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(54906003)(64756008)(316002)(86362001)(66446008)(8676002)(4326008)(8936002)(52536014)(66476007)(66556008)(478600001)(76116006)(110136005)(66946007)(41300700001)(38070700009)(2906002)(5660300002)(33656002)(122000001)(82960400001)(38100700002)(107886003)(26005)(7696005)(6506007)(71200400001)(9686003)(53546011)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t6gNM+Mgc5tLOC277G0nzUyLogysTBuuOBNi5XY0kl/nfZ/kmKsY9nsLVhvq?=
 =?us-ascii?Q?QSCT3Z0rwiQhcuRhLls4vitXsszQCHDcKJrZU3bj8R6iCEWdtb/394oBafYb?=
 =?us-ascii?Q?UbVet/zi1sh+m6Yt3YebBXD+oidAiqnJ0FhIWrNLMwoPV3fIjxbOuIN7VofX?=
 =?us-ascii?Q?lBArtoIlDj9RyilsZ1OahdmBy+NPToV7gyk1UgogKdNtNxtOU48R6WrLrUDW?=
 =?us-ascii?Q?MgYLN3xHZGrtVbfipCQd/veVDX/4PVFBgaV9Uyj4XV2uWaI6fUCYbkfDyBES?=
 =?us-ascii?Q?g4omRKh0Z8s4r1YcmmiA6CM9Dw7EBWqv91pZlOHCLZKise0unW5V6GGdSqFK?=
 =?us-ascii?Q?RmHwDBVVgw/pN6AOW8yBDctE/rddkinn0N6+XP3jBnTskQr/6oThoF+JhfPf?=
 =?us-ascii?Q?xvx0fVoVlIDYDWflE9ri1jLdakfmH0Za/+NHPOal5S3CWT18yF/oihKVe3kj?=
 =?us-ascii?Q?gqJe52fNcHiMODB+re9KXJvC8dFape+ZrVEgwn14B4tlRBIwjFmsmdD1DpAT?=
 =?us-ascii?Q?bQ9jQsk/FXZPyGpVIOdtkh0RnUEMcGhznuprfTVxBIZXRs6W0zW5ASyn7YyK?=
 =?us-ascii?Q?8/SdoeAq2PL5IL9rPaHRBhEmw+GNVRmckV49F3hxVcKljfGXjaUV5SVEpo5p?=
 =?us-ascii?Q?XlWEViqHxWJaoHgOF5AZadxBQnLBKlsIWVrLvr5CoHlBsIbKrigRDP81nXtY?=
 =?us-ascii?Q?ESusu6wYzbFMQgRzs7OuvXnMEB+ci6syjHCaJcd7yA0vi9rFAHdNcY9awWs5?=
 =?us-ascii?Q?aquSlIuQV2aAC90wZFoqyDnQ5a7xJ9+YRgmcQTlMy9R8xuUfRUFPuTJBpTIO?=
 =?us-ascii?Q?frAW4gflUYCXuwND38ouIbU89GGYSS1qi8VS0+6S6BTz9ijl1T+LW7ubW55G?=
 =?us-ascii?Q?1m2oVmQCUdqXdQ1IHAojuu6SQsdDYDVAC/iWi8x4hU6xoXEMvmtDqWr5dxXO?=
 =?us-ascii?Q?HORUyHZ0/oo40SNXN8vfpbUTzDChpRwZ4Ddi2kg6ybDdjtFRulUGUjWTN0w4?=
 =?us-ascii?Q?Ga1JxWOeydVuG+X7yVxtJ9iZ8gXjpPgqRDssjsCTAHG2RK3z7VpjDIsXFb2C?=
 =?us-ascii?Q?hJ7HcT45CUrWoV572sk87dAUor4xCdSVESgZYwcZvTxxcRz7YAk+mz24F7GE?=
 =?us-ascii?Q?l1sNL/73ZkAJQPPBbVrC0TEZ+KBysWtZDtrKBRzZcbAgu5XubRNM+cOqTzn0?=
 =?us-ascii?Q?uvamdORxONcL37CZbxBYVwb2OoI19MUAwzU0eKnYoKHvJGD/ZJX+44bvIB8D?=
 =?us-ascii?Q?T+sMSuZZHyAAhl3cyNI1y2rQpqOZk5mQx9MQdJlohlGbIMTZW+SNeyYbktej?=
 =?us-ascii?Q?DdHFMwsdNI3JpCwj/PHsCVKGomLBMsMbV39gAOB2BJhG9VRc9s6/b//wfYrO?=
 =?us-ascii?Q?VO/LSNVsxo+c0iJhGU3x4K5RHqDE76MX6UtdWzrwGL/ShjZBe8svCA342gBP?=
 =?us-ascii?Q?pmcSjCpbjcsn+lMS+RQO34xq2PvfKM6his808pItc6vZJh2lY4Qu73aNKsay?=
 =?us-ascii?Q?+DhtgYHYhuGawe95rJMtmjaV+Jfmm+Mly3coVTjx3IvJgD9K+JJVHuXzhzGf?=
 =?us-ascii?Q?iFE7WfpwDzE/ufUVCOE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3297d064-1dc4-477b-50ca-08dbf60c9ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 03:37:03.3516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQXQ9LuFn6BlpPVmVtmGZCplqboVOIX7zANssHnf6wp+B76+DPdJu6BmppgxSkIjnyRjoqagfLntDaUeb8+Mow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/uapi: Return correct error
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



> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Tuesday, December 5, 2023 9:45 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH v2 2/2] drm/xe/uapi: Return correct error code for
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
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 +++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 27 +++++++++++++++++++-----
>  4 files changed, 41 insertions(+), 5 deletions(-)
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
> index 447e4cfd204c..b3740c3d306c 100644
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
> @@ -108,10 +109,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
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
> @@ -128,6 +131,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
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
> @@ -143,6 +150,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
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
> @@ -159,9 +172,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  	}
>=20
>  	if (XE_IOCTL_DBG(xe, err < 0))
> -		return err;
> -	else if (XE_IOCTL_DBG(xe, !timeout))
> -		return -ETIME;
> +		goto err_exec_queue;
> +	else if (XE_IOCTL_DBG(xe, !timeout)) {
> +		err =3D -ETIME;
> +		goto err_exec_queue;

Those goto seems not necessary.

You can just write:

if (XE_IOCTL_DBG(xe, !timeout))
	err =3D -ETIME;

xe_exec_queue_put(q);
return err;

Otherwise patch looks good to me. Reviewed-by: Oak Zeng <oak.zeng@intel.com=
>

Oak


> +	}
>=20
> -	return 0;
> +err_exec_queue:
> +	xe_exec_queue_put(q);
> +	return err;
>  }
> --
> 2.25.1

