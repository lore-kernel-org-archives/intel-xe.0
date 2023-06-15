Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099E0EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1110E49A;
	Thu, 15 Jun 2023 09:03:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC9A10E49A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686819795; x=1718355795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+FU+wYMhtGbVtjVC/PF4mFa0Xyeo+KNF7FJBmz81Rbo=;
 b=hhAVRGkyRjcjR7ZvPsQO9wel9qEopweNsj51HG54XAhUpNbjSbED7/Sw
 dl19Vsq+8FuFWxlk1+oCB9KNecXB9fyN3JyZnxHGVZ7KrMwKOXuP2AYIw
 d9uxZgHxfd7U7vnRFgn39r3Lh8ltAkzjkKXfDJaB+RJ/KnqXywqLTZ0Kv
 EMpWp73JrHoSPDdawcLcNVGFBzAUEcIEahjFoS4FpxiIhdgbbr5KBVzaR
 65Mru2GEhEIHuIjeCKChmexLrd0Zl2kUk6yzO1EBu9R3L/PRaCZWVys3S
 fuh+jfvwE8j+QqJKAGcVqq2oJNTekcF+ZmMNI6HzcQkzp94gH8xgcmYv5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="357737216"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="357737216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836534172"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="836534172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2023 02:03:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 02:03:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 02:03:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 02:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MELmiT7SIXbHjcmR2S7x46Eg4sNMrOUJQgofJofzUNGfc3RXdIRCuy4prDx/S8kh4dKqGMPjZbHdZVOW8B6iwR2ieUiMcCmdgYGKf51ulQ3FhuJwOoT/bd6kwTMcKZei/wGMZsuhx0yFHgnA+7H6uAS06Pann4UMIQ5IiQlOhfUsZDfeIJUqrw0IVJD+ek5KBEmDH68lGLx2ubotxoL1a6WJbAy7+ZC5+r6fmR2vOnDguSTzIAOttD7NJUlE/gwBN7u9Xyb2cSePL3Be8o6yMacAcHz+6CVFAMt3u5XmEeCAhUQYJTzZ2/X+jPJxEuMMyyV6sOqiM5gv10+POdCtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvdYC+DZD875uf0TvtWh24p15tSx45TUZEQxHGMpzj0=;
 b=od/VsrDlCA+wfIcPkUfzYuqLBCBuOxeSvcfxk/Pqdx6aatAzgbIUq8Ed4esRrcfJqwCEV8Gxpz4HEufzU8qyWviBawUwn6qZgsC020/sGARQctINXYihCMhSUDLwK2br/IqUE2TGjnfvM7FEB2L+xhS5FTu46kRHiBn4dGi6siKcC5vs2WuxM5Htm6eHWYsJiQELXtXb2LVEzDfkr+PQciaZyVhfGEdFzz+4/2jpFQggUjqGV/NU7mDHtPs2sQhlI9hfJLQVHuvdpToVbXShJMON3TdVSh3B6TMjT7RzY+e0Jy1lOF6ZDBG6ZtJT3tu3DTszmHhzk2BMuDSHXoj01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 09:03:11 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%6]) with mapi id 15.20.6500.026; Thu, 15 Jun 2023
 09:03:11 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset failure.
Thread-Index: AQHZn2eS2kHXbPpqmUi6peyYI+bxpa+LkV5g
Date: Thu, 15 Jun 2023 09:03:11 +0000
Message-ID: <MW4PR11MB7056C78E16160EBD7970CDB7B35BA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230615090247.3398590-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230615090247.3398590-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB6241:EE_
x-ms-office365-filtering-correlation-id: 87bb0fb9-a4c6-4038-6d90-08db6d7f5878
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1jX+RnPoReSzcwBzAEpE7LhB7UYbMagKav4Zt5OyQP43SQwSsjr5o5FIgyJG86eH5ghxtH+AvHHj3hlpL/P+0YMZksUdQlykbz8FOxS9XVY4q0m3JYNGfEjAhM0lpxWeXU+8nDZqwsMCbam10vNox41o12Dyfd4qncPyeL45dgxPCt2VOV5a/qj717aNRVQBorxrSBKhwqtIOfQzKtwDCB1Fo000ipMceC0zMYTjT/yXIfxoCJK0b7BvFuvjXh0DQtqTOKW3XV8/V3Xz5Q6QNR74LpN0nn4pHXT01AjrJj6wWOrtmzMs5r40InmfxWWBXshqsgvHAzDuPDIcaEzWgdZyUWu/GhHyofqDAfpYVcZyPiiyAUl/t+lS0fmbFVvb10cYopDamnS2hkdQPZUmq4CoswHTmfDNjckpEuxs9PWqFdQPn/3exrkO3GSgD+/Q+W9PDA6ZJC0qOxujkOVGPMe5t1TtvBDLBWrn9s29p/LSJkC9puQq8/To60lJbaR3wWxulKNAeFASIUOwtPQP1xkimhxn/IDLwuCUYoma7dW0r9jLmEUqZaSCYVIhaO0TVZ/H4sOJ77oU1Dh/KJB9oOENPgTom14TeF/KNmHZJuB1lHoIGtMqoi2KbRMdWL+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(64756008)(66446008)(66556008)(66476007)(66946007)(76116006)(316002)(107886003)(6916009)(54906003)(478600001)(4326008)(86362001)(33656002)(38070700005)(6506007)(71200400001)(9686003)(53546011)(186003)(26005)(83380400001)(8676002)(5660300002)(52536014)(8936002)(7696005)(55016003)(2906002)(38100700002)(122000001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eV0jPfyaTGc0b3SAWBiTdeNv4yUSMRyD/O8OxthZEsV9C8xzkl0Jv/l6w8Pb?=
 =?us-ascii?Q?clhi3WuY3L9ycfmTgzL/x3Le0ydpkdhPU9G0Y1wTZBnOYEa+9xJwcy0bLuqs?=
 =?us-ascii?Q?zO9DWWtM/pV723vAXNZANqVjt7kpkvaVLbPqdZW3QyFsuenDiMIqPKkXjOHE?=
 =?us-ascii?Q?k9mQynmlprwdXhPM0ZFNIXKtxI6nD/c6K1B3CLzR0r0ZNKqmMu6vBVgmZuHc?=
 =?us-ascii?Q?3jGXUP/NLx/gtn7tbb437CYmG/ChiMQ4NSyJbPQKtqy0kL7r2DZKP+UA3KuY?=
 =?us-ascii?Q?YcvKZturL4gXn1+kytx2OmNvPNdp149xB5DGsmDqWLCnZOL/SoK+dOFWHYrz?=
 =?us-ascii?Q?ItWzLRccjHQW0xjrNX0o05TP+xUTGhVT+mLfQUP3fyC6dkrHFZj8+ag0i4Wr?=
 =?us-ascii?Q?6JZUIdqT2Qri0uPCz3h02RZ6rcUJvPnywOOuxsyeOallDZazL4XaLCrqthEH?=
 =?us-ascii?Q?MC1h/au30J5Ochd9XHuolXuwMMDEl61v4ZU9jauTP+W35K+hae/19IzX6HG6?=
 =?us-ascii?Q?Xxqlqtus/QV1m6hOqh8X5y+RSYU+F3eIlNi9Svy3nlQj5iJWpG+lR7Co+Fg8?=
 =?us-ascii?Q?1iCQ2UURcgGJudk7t+YHz/kst4RBSsLgz+aDJbBXelultMpzTorvZcu0qnzP?=
 =?us-ascii?Q?CP4/mPTJ/bDiZOQPUAsRB1s72jtB4tfYd5UGjLcAQUmFA6a5uFWL+EeHrC2G?=
 =?us-ascii?Q?Vb+81wtcmeEgZor4SPDlSk33hHtNb5rHAqng95aQYdYsql9CnX5MfKEB+l87?=
 =?us-ascii?Q?tuC+TFwqVpguBVGdiF2Jm1klqIgjCAXbGZQjHlHRV03lgXD8XbEztDNNvH5h?=
 =?us-ascii?Q?C6/guEHAQW9QeUeveQZzsf965rDdCzLLqavBZeV3BzESEEym410rbiO9TuJW?=
 =?us-ascii?Q?n7YQWrPsmwXvpZc+GwUM6SGcfLeKT3WpSJP51IMsVrqLRe9k/qLao3FznSdf?=
 =?us-ascii?Q?MEZ2nm3EreVhvyl+571/oeZshZSB61o/RSN9N7xcdCq73b3RxVNeJKnuTLed?=
 =?us-ascii?Q?kvdRXBg+2ATcmk5tb9xCWA/wys84+EQKDihb4kB0wwr4BdJPo6wqZ0gmNkJH?=
 =?us-ascii?Q?3Mjc+myvDUMjf+OqE7y/9h4dohPm+tQJtmC+4gA2hyK2GNzTzjQjSxQJtFQP?=
 =?us-ascii?Q?5nMCW9b7xKW9pKnRDHvdQ/XBMcjzZ8q8rgj0ECm9WZLUiEt82G0ddFjsPNcL?=
 =?us-ascii?Q?Fj+Bv/TqkMhCZAvMIbV6KfTlENxgwMzKApAAMBE0iN6IUW4Xc6tB7+7tQn1R?=
 =?us-ascii?Q?P7VzRa5QzTyX0wMfVHvIRfR5wrBzHnFaVimN2GLhoaehCyVyZ0w6rMt4ylAL?=
 =?us-ascii?Q?Uvm30H9Pz3xG45ncnz/F3ZvG8MjzsBHquamUNJyVrWghXQfTV1j0zIGNxzFT?=
 =?us-ascii?Q?nznicCRM90J36XMihLIXBUOqIt1OyR022XS4t3LwZYMUNn/XH85UoRSm/Spc?=
 =?us-ascii?Q?3FezrIYlO9y7MheZ3mIhc98nyIwPntmloOGtL/6Ozdft3MG/tkM1e4+vl8c+?=
 =?us-ascii?Q?0dvznUV7M2u2SEN4JhfDO4gT+Csou2i7rfJ6dQTvg//zHK/02pwNUYAEq6+k?=
 =?us-ascii?Q?orJkSd8v2/TdqxKglu+G6J/JHEP0Ts2/6XcEygbn9DTAlACYT5Zf6jxrbmgU?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bb0fb9-a4c6-4038-6d90-08db6d7f5878
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 09:03:11.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbRrpJMtJi/hJmX1sK5PVdhwD3MXFToZtmcBeX7sTYTn9sDtAehGhh1MXSjtSSlBxCrOrsMXWcI7er6I+W7ZKYcFr3x1a8E1LIn8DAjTTaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Please ignore.=20

> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: 15 June 2023 14:33
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Vivekanandan, Balasubramani
> <balasubramani.vivekanandan@intel.com>
> Subject: [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset failure=
.
>=20
> In case of gt reset failure, KMD notifies userspace about failure via uev=
ent. To
> validate this notification we need to ensure gt reset fails and there is =
no
> mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
>=20
> v1(Rodrigo)
> - Change the variable to fake_reset_failure_in_progress.
> - Drop usage of READ_ONCE and WRITE_ONCE.
> - Follow consistency for variable assignment. Either use
>   functions for all the assignments or don't use for any.
>=20
> v2
> - Add description for variable.
> - Define xe_fake_reset(gt) function in xe_gt.c to set the
>   fake_reset_failure_in_progress.
> - No need to explicitly initialize the fake_reset_failure_in_progress
>   as false. (Rodrigo)
> - Return proper error code in case of fake reset. (Bala)
>=20
> v3
> - Move gt reset worker call to xe_fake_reset(gt) which ensures fake reset
> goes through even in GT suspend state.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
>  4 files changed, 33 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 2458397ce8af..b3025f60f666 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -497,10 +497,25 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>=20
> +void xe_gt_fake_reset(struct xe_gt *gt) {
> +	gt->reset.fake_reset_failure_in_progress =3D true;
> +
> +	xe_gt_info(gt, "Fake reset queued\n");
> +	queue_work(gt->ordered_wq, &gt->reset.worker); }
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
>=20
> +	if (gt->reset.fake_reset_failure_in_progress) {
> +		err =3D -ECANCELED;
> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +		gt->reset.fake_reset_failure_in_progress =3D false;
> +		goto err_cancelled;
> +	}
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
> @@ -510,6 +525,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_sanitize(gt);
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
>  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> @@ -543,6 +559,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> +err_cancelled:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>=20
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h inde=
x
> 21d9044088de..22afae04fa3c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -24,6 +24,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);  int
> xe_gt_suspend(struct xe_gt *gt);  int xe_gt_resume(struct xe_gt *gt);  vo=
id
> xe_gt_reset_async(struct xe_gt *gt);
> +void xe_gt_fake_reset(struct xe_gt *gt); void xe_gt_migrate_wait(struct
> +xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b5a5538ae630..8d888153c477 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -138,6 +138,14 @@ static int workarounds(struct seq_file *m, void
> *data)
>  	return 0;
>  }
>=20
> +static int fake_reset_failure(struct seq_file *m, void *data) {
> +	struct xe_gt *gt =3D node_to_gt(m->private);
> +
> +	xe_gt_fake_reset(gt);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -147,6 +155,7 @@ static const struct drm_info_list debugfs_list[] =3D =
{
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>=20
>  void xe_gt_debugfs_register(struct xe_gt *gt) diff --git
> a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 99ab7ec99ccd..0b6e1df3ca36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -141,6 +141,11 @@ struct xe_gt {
>=20
>  	/** @reset: state for GT resets */
>  	struct {
> +		/**
> +		 * @fake_reset_failure_in_progress: A bool to indicate a fake
> reset
> +		 * failure has been triggered
> +		 */
> +		bool fake_reset_failure_in_progress;
>  		/**
>  		 * @worker: work so GT resets can done async allowing to
> reset
>  		 * code to safely flush all code paths
> --
> 2.25.1

