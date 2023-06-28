Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB21EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 06:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B90410E362;
	Wed, 28 Jun 2023 06:58:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2669610E362
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687935499; x=1719471499;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TE0ehfd39uv42raYcnurlLBCefY/A6coPGE4tZjyhig=;
 b=fIPV4HQx0Tc+/3Xp8jG38rk2Ka3+mPQhIOGU4FSLeFW46s8ZRiI3MM5A
 HLkEoFh5g9krbrU74Dh3jqWP/54a8MHdw1XnScAmoPVDnRfSbgvhukNtU
 8Z5F2MG6PXRRRO9l24RnTRkDbfSAiMbsYUGIKf8MpwFO2a3WaCD9itSXV
 QcIg7VvvaI72gkVdxN/AyQAr6P01JjvCUCq2TOj/W+J3naNnlbe29VtdF
 MdmLBNhre1mZZ/E84S5kvJACZoH8FNLYLAf0eUec6TCsgkmJEEsJxYd9j
 ZuC+tCbnU0gUTb89Jn3Pe+n3aa6fPJfmTSYRmbS8FCuTcajZvkVbEvl0B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360619108"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="360619108"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 23:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963480498"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="963480498"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 23:58:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 23:58:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 23:58:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 23:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f23HPFuLrSBNNK3KUyUn2QWW2s8R6JHRn5YrOkPM69UjColIQdrLVXrYsPm3e8KqpZ7WS/aG94fpa7/6CSyYIX23UrR9yOFgX0ABsC284t4Y1VIQ1WG9pQ7De+8+naL+L6Qdjkmgb1c3mlEfDuRaQxr5HiGH3KyCCqv41wJzH9+PPKvmMTN7Ph8P6TJAn9fEAzCAZziFowPS1PUY4tbBAL12Hqt9BRjFbvuXZTHwvfLVt6Y2N4VkZTt8LjphtETOoCHNY8T8KeSa5q5wDGqSWEWtIWO92LRcdg9s86CoZBr65kGcfYxHofQj5/9PcC+XqN0PFx53crbU9emPHukjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49q0aRQrUMbIhfk1yE8bTVoYRDJXyMCf0npBpr87G2Y=;
 b=USuNxfDuug30mEf2uVx8XxEBwmzaGyHJzmrrSBKhvkqNqX49FRzHlpDM6Zor8MYW+ndXbgWxtb54ty1LML/5nbOKP+zCHQHyPYZ7FHVUdlQJxEmw/E6iZAEFbQ+xhmAWuzfeHuR+6Kh1EIB3UyIPhfgCXdtwQ5jvIY+w1iCHveSipif5vsV+/Yeio3ZjZutRS/i1zmsIxqYov/K7Po+BPQcvoTqW1vGfxkAGOOLeieAdRFGvACKczQOxy+RT2LTkiEOO8OXhCAsVl/G6gN3R8GH902dNVw+qgzEZyfiLZUrFBBrNC9T7eprA4GTDdV4DqoA3ryaAnYR6EUr5pdaf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 06:58:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 06:58:08 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engines
 under its GT
Thread-Index: AQHZqBaA/AFSdgWX70W2TMWCkYG2y6+fwdLA
Date: Wed, 28 Jun 2023 06:58:08 +0000
Message-ID: <MW4PR11MB7056C42A9E92C8047321835BB324A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
 <20230626101648.3480340-2-tejas.upadhyay@intel.com>
In-Reply-To: <20230626101648.3480340-2-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SN7PR11MB8263:EE_
x-ms-office365-filtering-correlation-id: d4d5f9ca-45c5-4fcf-22ef-08db77a507a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Vx7mmubz3UQhGWz/hK8yYqiRqWmX4ZOA69fi2kS7JGFlLa2yu8hTpU1gzJ7UjxqJeYo/A/8i0Er9kb4yWfSPE2LJ2o01InylVimUZg/Go7ydAyBFwfKSDRLXIecLQDMF1qPbydXCwCtQ99CWFzNrYifa3UH9J+tQaQpUC++/UthZBHYsrec1ll8bCn/hizuorsqfDm/MGi7uS0hTpd2/O4U60Q3P4yYqucV4R6W/n6Pt+YzXlGA3k/NquZjjUOLg0OmhbfaoLwa8qQuAZ1MGu9LhQqvzXxAVf1K7ILYwD/Gpl3iDL3/7QvU2Ams2oKA0Pd0Y57tr8AXoDS9ZCGAc/x8Pdq3XmARJYaqeJG3PVAQtYJrgZZ7KTitNISbunU/TCcsnkX2c8W1YksHcXI6awALPer+lgHeIBp0bgsW4O2GxeefXVfAXxt+8JNAwKrR61Z1tsGLhQ72IUCLejI6k8fstFr0p2y0QcdhXm2fspP93DsH3aRXOFVEj8N73FWjL+qA8IO3uNLG07aCSo8lclXJhDC2JS2sBG/RdnbxItMxpoE3nxFF+Iavj3FAhdVQ5zsfBSjNIErmelJbesy5iYNw5ggJ4V3fyXeGuG3mShc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(2906002)(966005)(7696005)(53546011)(9686003)(83380400001)(38100700002)(82960400001)(26005)(71200400001)(122000001)(6506007)(186003)(55016003)(41300700001)(110136005)(86362001)(38070700005)(478600001)(66556008)(66946007)(66446008)(33656002)(66476007)(76116006)(316002)(64756008)(8936002)(5660300002)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MngJMJYdHKijrQEjT/kCZQmoMth+6Y7WRbmE1ONYwX8JDazo+vtDJTogtzEt?=
 =?us-ascii?Q?Rvbc1h0GezKPey5FBzcujH63KKo7ejnc3N6tMcairsn5A/7qhr2jOnaIsvrF?=
 =?us-ascii?Q?vf0Xnq5mg6h57dWYkV+97Cea51BzSbtA5S2bnQt9mI+DrbsXWM6hBtBQor36?=
 =?us-ascii?Q?w9u+t0cMJ56nKRGe2ppAJYbPMp7W/vJHSoUNKngQl5xIZLqzcwa7/qS6sxU9?=
 =?us-ascii?Q?BxurZIuxE8FP7BVKy+XZRJvmY75ym6ZPA3glwvbgCss6d/ZX9LRfrZng3MXk?=
 =?us-ascii?Q?9yZ1791AnbOiG7i0Pw4+gowGiQis7D7CLnfszuXXnAJ1A87lMN2j/IC+HNV4?=
 =?us-ascii?Q?EKEWGijgfcKMohYFT7RGAAEW2mrV34Wmez2d4kF/t1df5ke1XwjbRtTLmh4b?=
 =?us-ascii?Q?dkt9s6vm7i8032OqMOTc6T57HM7LGw5tvz6y6Z116ECFBrTCyy/yAWwAeMsz?=
 =?us-ascii?Q?KRB8FnfnGDdjC7Q0Va8VBKjBEcGnSkpTQW9bvQSneJXDmapV5lCgm4GS/2gr?=
 =?us-ascii?Q?xHe/l+t9xyHD+oJo++P0X2Mtt95mtwOLMbnCJISWQVD5WoGUdVBKzFfnZ57w?=
 =?us-ascii?Q?pid0mzc+vv70T8CjmIaGNY+R95BJ5SdRvtE5c58DoV7+VrqzGWUpWZTcJ8KO?=
 =?us-ascii?Q?fdK76LRc5Rks+7TDDEgXBMbvUmSur67POv7Wt1b4MM35JbN3dK34mWzzKnL6?=
 =?us-ascii?Q?yf2Cmxx2gcyON5z/N2lHe3kFu1/FV6k31cl6/BYq8033JisZC8HTyYnooSU+?=
 =?us-ascii?Q?BR8WfeBviXKFOwBwI5w8efHNANBTUvkE5HBa0cJu3HXtjDwhCTwYaEZKmvEt?=
 =?us-ascii?Q?TmhouirYfGtD7McBG//v8gdAbhuRxk8sEDaQgpYGBAvO/LKHP/T1Q3wP66Ny?=
 =?us-ascii?Q?KCX7rpUe55Ow8zFG4VdLw809NaBgq5fD0lf7UF2Cdie0/WXut06YCgBwUGIK?=
 =?us-ascii?Q?4GtMYyzPem6m66QXX5RzcbyUTQpd+g8WWOWKj2tMGSEscOEJaxUR1qkj3+hV?=
 =?us-ascii?Q?6xdOMbs45FaecZFf3sLLHnDmLrp5t+d2w38DvWNkDb6wyc4G5dm7TCe6jdeq?=
 =?us-ascii?Q?/aTO1HERXa24FtXC4ziCUREgWirCv+ecZsBvN1xhEscvjyNMOje58unWA1zs?=
 =?us-ascii?Q?Uc0NaMNHulvbzqUMyHDkMi7+4Pngp9LOc1yP5r27FHgGeN2VfrCtCd3HZrtf?=
 =?us-ascii?Q?tvx1/HclPFx9VuNWzDuqCROg48rpn6jg/jIffRd04VMTxm+Hf0pEXxa1TYRH?=
 =?us-ascii?Q?UnzAMw2uJVHXUDibKUgYZiBzciqK2pd5JGHMAeiYNWB4dGGmLMUXNkZh1mAJ?=
 =?us-ascii?Q?nRLgT/ZXZr8dcgEEW0aWUA6d4+Q/ACCPaPCapGnlN/F0X9eYAbS6/8mwYu0S?=
 =?us-ascii?Q?CQcLq77LqWbmirAZbgIwBdQAGOMYIhv67HFlz/N5x3L0JwkzSiohKcfnuw7U?=
 =?us-ascii?Q?0g1UpBDj09KfhGflMiePYEYxJlYvvMwUJWxus4NudCBvMv5NGB3AITdK4BYV?=
 =?us-ascii?Q?MJpLZITop804nO1DpmWSv5H9RBsUFEmHIE+iO3BrnK51Bp58s17jM9QCmJRY?=
 =?us-ascii?Q?1tvND1yngU2J8/YpyBK+iC/2VIUNo2rmCFLZoyDHMZFDvmloR54WWHsdZc2q?=
 =?us-ascii?Q?Zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d5f9ca-45c5-4fcf-22ef-08db77a507a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 06:58:08.4259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SOl7h9JwdatUT95jXi/mVmy9jAuDrxrFe3gIJ5N3iQXLd62Qo2tW/+AIsGw8prBxuA0gd7YrdgluiHaLfAKcYlJPam+P5kNsk2ME6/O5TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 26 June 2023 15:47
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engines
> under its GT
>=20
> Add engines sysfs directory under its GT and create sub directory for all
> engine class (note its not per instance) present on GT.
>=20
> For example,
> DUT# cat /sys/class/drm/cardX/device/gtN/engines/
There is series https://patchwork.freedesktop.org/series/118927/ which brin=
gs in gt* under tile*.
Please address the sysfs path accordingly.

And better to have directory name as engine_classes  instead of engines/ wh=
erever applicable.

> bcs/ ccs/
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c       |  6 +++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 92
> ++++++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_gt_sysfs.h |
> 3 ++
>  3 files changed, 101 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 2458397ce8af..19c7964a064f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -319,6 +319,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>=20
> +	err =3D xe_gt_sysfs_engines(gt);
> +	if (err)
> +		drm_warn(&gt_to_xe(gt)->drm,
> +			 "failed to register engines sysfs directory, err: %d\n",
> +			 err);
> +
>  	err =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c01cc689058c..7528cc723699 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -22,6 +22,98 @@ static struct kobj_type xe_gt_sysfs_kobj_type =3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> +static void kobj_xe_engine_release(struct kobject *kobj) {
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type kobj_xe_engine_type =3D {
> +	.release =3D kobj_xe_engine_release,
> +	.sysfs_ops =3D &kobj_sysfs_ops
> +};
Make kobj_type struct const.
> +
> +static struct kobject *
> +kobj_xe_engine(struct kobject *parent, char *name) {
Instead of engine/engine_class seems appropriate.
> +	struct kobject *kobj;
> +
> +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return NULL;
> +
> +	kobject_init(kobj, &kobj_xe_engine_type);
> +	if (kobject_add(kobj, parent, "%s", name)) {
> +		kobject_put(kobj);
> +		return NULL;
> +	}
> +
> +	return kobj;
> +}
> +
> +int xe_gt_sysfs_engines(struct xe_gt *gt) {
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct kobject *kobj;
> +	u16 class_mask =3D 0;
> +	int err =3D 0;
> +
> +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	kobject_init(kobj, &xe_gt_sysfs_kobj_type);
> +
> +	err =3D kobject_add(kobj, gt->sysfs, "engines");
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		char name[MAX_ENGINE_NAME_LEN];
> +		struct kobject *khwe;
> +
> +		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
> +		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX))
> +			continue;
> +
> +		if ((class_mask & hwe->class) =3D=3D hwe->class)
> +			continue;
> +
> +		class_mask |=3D hwe->class;
Seems error prone. Once   XE_ENGINE_CLASS_COPY is handled class_mask will b=
e 3
and for  XE_ENGINE_CLASS_VIDEO_DECODE  and XE_ENGINE_CLASS_VIDEO_ENHANCE
if ((class_mask & hwe->class) =3D=3D hwe->class)
		continue;
will skip sysfs creation.
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_RENDER:
> +			strcpy(name, "rcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			strcpy(name, "vcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			strcpy(name, "vecs");
> +			break;
> +		case XE_ENGINE_CLASS_COPY:
> +			strcpy(name, "bcs");
> +			break;
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			strcpy(name, "ccs");
> +			break;
> +		default:
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +
> +		khwe =3D kobj_xe_engine(kobj, name);
> +		if (!khwe) {
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return err;
> +}
> +
>  static void gt_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_gt *gt =3D arg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index ecbfcc5c7d42..a531aebd10d6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -8,7 +8,10 @@
>=20
>  #include "xe_gt_sysfs_types.h"
>=20
> +#define MAX_ENGINE_NAME_LEN	16
> +
>  int xe_gt_sysfs_init(struct xe_gt *gt);
> +int xe_gt_sysfs_engines(struct xe_gt *gt);
>=20
>  static inline struct xe_gt *
>  kobj_to_gt(struct kobject *kobj)
> --
> 2.25.1

