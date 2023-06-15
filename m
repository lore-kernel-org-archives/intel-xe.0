Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2395AEB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED26310E49F;
	Thu, 15 Jun 2023 09:00:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3810E49D
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686819638; x=1718355638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eyIK+NRftuYi8pLTQrvwPr5YFRKtfKsk33I8pKp98WQ=;
 b=DQN/RDrkF8Q106Qhx3CjUE/Kj5N4up13ezWYyJQdy940SR26jrRF5po+
 Y6/Wb2pswstCldtBajqBz7qcNJ3NYQkTL/b8p/MGLOriFRwKj19gD+S6b
 8XiUHg3v1DT0fNqXbsYB3cFT51Md0FfWN+SZCJa/BjMR6VqPtyXJtvrrZ
 JXewiks1Tt1GqbBAJ+xjbfYlI9VFmNTa12TuXg+HwtkI9ZITs0E3mjDxh
 3dzor9jaOl7NNAFE8c4uo9/s2F21OcmOw2w99WUUFuQNVXBsSIm9RmLPT
 Y6GZiUtc0HiNu2a/aw6yA4bUZs7LKSf4DLd1t5AADdOKBia3yNlAZM+Ej A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387287698"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="387287698"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="715550064"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="715550064"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 02:00:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 02:00:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 02:00:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 02:00:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 02:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGGhnlfh5Fm0TW4yNVYT63iF2nmlOTXwkq8ctdBz40j4ejK4jNo8mLlCpFnhx5iwzf6vN9yZo6wsyUjnA405zENnq3GyGrCg+5in+TgZ2a0ErJsrp7Ds0xNTFlzeX0jHHFZaDKv8D7QH0z9hwdLlnBveQ4drqk2ISUlzqw9AEyuLZrg8oVquKeuYt8XK08TyA40VA+WYezxHtxtcyIXkAlvXfo8R0A10q4EaNqPpzwi9RvEWajF0PG6Mu+kXyZK6IBZqlwOZAie1frKwH1pX0njLT6/paanRAv1UaQtUg5r9FPH0HeGnM2AhnV5ybWDv5dRRDcC6JVY/Z8vCDm3o7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC/L3V59OvhMbLwI42sJXVmcGmoIHDf4nWMWATZV99Y=;
 b=K40L9odLf8KDYH1jZJbK+8BonBMZGc9VeENAYhKiwPJzwnjxWYzqu5pA4ejAGKcNKndXCAEpniO7zWgrkph+4gHl3KUyFlvd5umAeZpLLE/73iAEbASXTS2/ufhc0aJRvHXcKknWxMVCjTombTtOinB7HEz5Dw79tp26U9YZpTnB0/64qaXNFSTX8u1+FcBfeMW+5QANK+/9sw5ib+Qyp7NnAq6izoiovBN/l7qIrJ/DrTVk+kMC/ZnxpPC/jN/h7A/zI6A639x2rRztE+LMtvLWGfWbTHveJjhVtDjKF4zDXZCpyUxQOYRoQ3VDlqypUVL4izkGVNyTq6tv3BMoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 09:00:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%6]) with mapi id 15.20.6500.026; Thu, 15 Jun 2023
 09:00:34 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset failure.
Thread-Index: AQHZn2cCJuvujmqxuEu+WgsPIF3o/a+LkLgQ
Date: Thu, 15 Jun 2023 09:00:34 +0000
Message-ID: <MW4PR11MB70560B11A95D4938BDF82EB9B35BA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230615085848.3398419-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230615085848.3398419-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB6241:EE_
x-ms-office365-filtering-correlation-id: a4aee468-a5ae-4c5d-8b75-08db6d7efb13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yxhO04Q2PA+sl2jBD+j2/1YGH5N1IwjqR1Vf2w4UaObJpTtTCUEPtvKlcPoftDjrWZtfRDVRnCDAcAdxW/D/WnJlO3p8OqFkzfBLi9MQRUSUBRkUFXLd2+9iBcu4IySV35gnPyNSak4erxZ6L2JhkKqfIKPDW+mD+ep2RYpBxv0iKxa0T4RIiApEzta6wpBrsJmInMgez12iTdo8rCDli7XMyhBy/istuznqNInBGtv6japzGgddS7FtVD0+j2UEM0kVAzVecYx448zNbI2NpJVvu/NpGGYklxd7BTdZusafgAvP+nWWHL0hsUcnZ6EubILRW3a04cu6eS+jBaVBUe4Nu7ky5uk5sSKbJttKxgou23IaWF9DINtfEvYjEeuUe639KNpZ5FNwBhGbLALa+VrF0lxooGTYTRTEtt1lJSHR/CbvYLrEj46ppNQoidaOJ5Hx/9x+QvrvxzpR21AJP5o4bdR2agGms8l5V79a6MpdtJRS5qN8oGd566LuHk38DrcPYb0hK59UqgvyyXAiYSZm6lzBid9IzE1ROHzdBXOIuuaTRh6nxx3PoWWhDdl9DakAN2f/XfTXnSrbKp0HEqlkbPxLfphOeJn0CdVsLEjyZt8qNMTYqZgaNxRGH9TV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(64756008)(66446008)(66556008)(66476007)(66946007)(76116006)(316002)(107886003)(6916009)(54906003)(478600001)(4326008)(86362001)(33656002)(38070700005)(6506007)(71200400001)(9686003)(53546011)(186003)(26005)(83380400001)(8676002)(5660300002)(52536014)(8936002)(7696005)(55016003)(2906002)(38100700002)(122000001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zO70P4uPrLwPrpL8o8WIO/JxKStK6OfSthZGBoyaJY/l9Di7OKifRSC6R+5q?=
 =?us-ascii?Q?Opoexb+6pDGVnbnRWKmTXEcACdX/t1MPjis0lcrAGKq8487hMeSUbXfv6+2Q?=
 =?us-ascii?Q?z2Wg04CkL3qBxg70m+ZSFbR/WybHNEyVv3EeOmgQacLi/tRPJaZ8TjqLNs2S?=
 =?us-ascii?Q?wwd2HMhFUDsGAmkjZt2lQPmYlN4yj1oBfnc7S/2z06l2Hfi0PXFrkRcPoABS?=
 =?us-ascii?Q?AXWUaJiNzXsm/L1IFvOtqRN0j4GwBIlcB0+ngE42EG83WwABrfc7gvV08tKP?=
 =?us-ascii?Q?MWfyhmPhFDr3EKB8ecQgfbY+t/fropTVIKCL0DKY8dHL8J6Sx8Sk+3v5RutY?=
 =?us-ascii?Q?iqrOWFUv5oKhzzAd77c4XHwHxYSLpO7ZKNKPGeLUeeInkEyn0HeFV18oQ/6b?=
 =?us-ascii?Q?EGGwbwIPsI1xR4XN78KQ2rV6ccT+78XQ6xwE6JNPlq8pYaOZlpI1WBxVHKkR?=
 =?us-ascii?Q?YMWxGgKOY06mcsCb1xmBHUqrPDyGosezPfAG9LJQTLyDGrW7Uy7wm+kmuHz+?=
 =?us-ascii?Q?3WpECOJnBzCBh/HhPmUGio79No8PUKsswxBYQCIux8BfaEgIIjf/7Nazc3kH?=
 =?us-ascii?Q?61h2m5QsCIByRAQyZ3IZIm4+UGJ3QDLAAQrLpMnK51HFBBOGCKNqBE7CT/wL?=
 =?us-ascii?Q?sQFZUyncghlAFcRQ7imZZKgEX4EMAb4C9wfown5XRf/rHXmnPos/fOP6fNdw?=
 =?us-ascii?Q?qCa+XCCfxqgArqN8INKMVbPJN/NtWCgbdNARXFtinJlWFxY8t8pf2NfWc+oz?=
 =?us-ascii?Q?xYcXLqkDRbktw3Yriyot3yWzR/FTn7nc0j0DLF7XIEdyA/RWNjysAPDm8YiO?=
 =?us-ascii?Q?aSNCxsAwIul3YCTIYNazIFnAh+nXd5v8UatcLiyaMVt+KXk7Q9h54rj3Eya+?=
 =?us-ascii?Q?klfDz1LiIUkmmMZyE9gJcP87OpJOycXH/KH9JyyM+WJdoswm/ji68rFNh0QK?=
 =?us-ascii?Q?GnY0s6yB2f5h62957rmtEfL/Jq7l98Dcxor+agCKczNwBe99HxjO3gyWV48V?=
 =?us-ascii?Q?L1sDB287Drqvx4JFFEUNJg32Rc9hk4Gx7LiqWKh7JI2HSqvVfNBdjT0RDRcI?=
 =?us-ascii?Q?2wDImCFzcXYaxyMYUAfunFENQuTbium6ARPGeoe7DWnG+S9ZBhT2CCtzE41h?=
 =?us-ascii?Q?LxIOh0TQJGmduN+jwZ0/Ip4xS76DkGM6dznXG4Ql2cSOJeoS4soNb6eMftmj?=
 =?us-ascii?Q?+miDYXveMlKdgTNIe6EAjyfxV3opYOrzZKq8wKrL+v+oLnZLIUfPc3tAd/XK?=
 =?us-ascii?Q?pQviL0UFBw/90d4CxVxE0xZZyvPTeVvmYSHoZjR5JPOQeY9adIf1l60RmbYc?=
 =?us-ascii?Q?6P3EE8CQL4KmLRHwjEZutW+8FZIIB0JXWoA6q4YTmtj+mNqeQeYRUlAAdWtA?=
 =?us-ascii?Q?SjoIEzjNkyHubR2RTEIILlxGfpxmJhoRyuVtBV071qv9PgcHcC6nZcB5BUny?=
 =?us-ascii?Q?PFyMSZn46C/yGlQ8N/bNi/YGcl9Nhnk2Ah0LVgY6yaZdll1/7+8z5Nt/cnx4?=
 =?us-ascii?Q?cNykFJGVgNo/zjkkJmhpXGD4xTr+v1/8fSger/Hq1iSwrYsskURsxek7TxmD?=
 =?us-ascii?Q?J04HZ/GDl75fKdcTlk7R4XsJ5AOopwrfp1yrw5f8TZw2TTz328ThsrciJLkC?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aee468-a5ae-4c5d-8b75-08db6d7efb13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 09:00:34.8587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gv8g7+6ry/Buv+lRppzOwv21Y+RcRKX+MXkf3/KNgtvTcGE/V2+p7uo89LoBtH6Gd/6Ts0q0wasXhz9EcBiJ9kuAJnwAvE8D6VlO0RA8Fk=
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

Please Ignore.=20

> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: 15 June 2023 14:29
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
>  drivers/gpu/drm/xe/xe_gt.c         | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h         |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
>  4 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 2458397ce8af..e70af81f2db5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -497,10 +497,27 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>=20
> +void xe_gt_fake_reset(struct xe_gt *gt) {
> +	gt->reset.fake_reset_failure_in_progress =3D true;
> +
> +	xe_gt_info(gt, "Fake reset queued\n");
> +	queue_work(gt->ordered_wq, &gt->reset.worker);
> +	n
> +
> +}
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
> @@ -510,6 +527,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_sanitize(gt);
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
>  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> @@ -543,6 +561,7 @@ static int gt_reset(struct xe_gt *gt)
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

