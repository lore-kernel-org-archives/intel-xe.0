Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F663EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 04:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE20610E28A;
	Tue,  4 Jul 2023 04:19:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A910E28A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 04:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688444375; x=1719980375;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1iolw7NCzmD9l6vobN4oYUDHvvoPEy51QJaJCKbapPI=;
 b=Wtizaike7uB8qmIUaBDrumSZwCTFum4LfVkPUUvxP1DKQcyeQ59dyGiM
 8UJh+2ZQOMe/Lf+KZTw8YUKhbUJgQw9cIaX03j5IlilorFtTotlpklBBj
 1LQQQLwM2oW/ZNpcb6Xc3TPj7X92svi2jKCec+e5ncZr/jImkxjdwOiEg
 I7r1ix1wX6FxAZe+rOmaZ53OcahRrxC5gGIbZPBtHebRhN9o0Zmof/7+j
 GgEQ7NuM71f9BD8KQZCyQwdU85GqQGGsU9FaZCQQ2Au5PfSnm7GVPBNmJ
 0EqaodnVSqt1uEEyTod2wyXnUabV3aBnbfOSlfS0mYuty4lORj++LF91C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429065587"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="429065587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 21:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784087349"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="784087349"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Jul 2023 21:19:33 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 21:19:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 21:19:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 21:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca0cRoBOQTsDQb7d5S1peLzZXPitKUILx0YiEubQ/1fjzoUHpAahkaTElIhX0FguTy7vdVUPUNwnAwkCCykQEQNc94hQ6G9865P7uRued2XzU6uHH3j9Q1rPbQuAGgrgEdF7PwgIm9CoTn0J9ZajWolu+bGJwVDnipi9X09sWMfAFF6F9qPi1gxisT4F2qGafqrRi1rmYyuxwmf8Ijfb6tdcuTNP3vV6gZXrEikzsDl0oAdTybRUFzj+52CsNgp4fcS/27fmnkidVirs3pNIAFGcp28xTJl1KPwVCIiU5JKDOugnzNS0EwhGm0XkydDl+eOtNL77NfMfvk8wlZk9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6LuzignzPIG6FoOX/PXtY6MBWWMoN0pujyYNhp+pAo=;
 b=a1ZqxAgnOxhTcO4efUUDyHUeXT5AgP4I4SuS1WPWqK71ROi85mk2L6KOQiyexE2BvEF0m03sloH4NZxR5aZ3AbkzkGpz2dPEBVv3jRWb60XHZ6HSvwTCtalnQQAqZxUbS4kWsLDC4dN7n5b1wpCtAxwuwnJ+/vnhwqWplNlWQNZqM86xTvQHXh3eMlDSzpIBGHjoa2Rxn8qGLVveO3aK3+DMXtXqFkfkyEIKuZg7qOibUHxGYZ7SQZs5xuo2TlAAf04xAHuShwz4C4Fj2LZZbUl+JoBWiDqO/4mUdqA6tOZXo8PE6UmJm7B45fx9UsDyxGYHgK+AZ5vVjYOu0vdZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 04:19:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::fa3:7378:70b7:a21b]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::fa3:7378:70b7:a21b%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 04:19:30 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V3 1/6] drm/xe: Add sysfs entries for engines
 under its GT
Thread-Index: AQHZqbWEKcNAFoRAdUabQwCHxLkOa6+pCVZw
Date: Tue, 4 Jul 2023 04:19:30 +0000
Message-ID: <MW4PR11MB705646C54D031BF48ECD495FB32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-2-tejas.upadhyay@intel.com>
In-Reply-To: <20230628114732.3598169-2-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA0PR11MB4543:EE_
x-ms-office365-filtering-correlation-id: eae7a5ad-2289-47d9-cd93-08db7c45dd27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsUIiJqAacMOhR1PsY26zVOTdZwDkkP8ODbTjVJVAxKBm9JvYOZvT+5iiS/qfQ/Up19ak5bjlUhdcYmMaWeAwo9nj99z7tvljFPpBj8kYUdhjJ/M7jbFzpiMgKGn4pET5leqkhuOa5WcDC8C3/dCv1csCM4MOwfxgTGHAmU4mU758eRi0EA6R2TTwEyt1IgaR5YZfdkL5AQA0wM3iWG+yuW07km4kkJXZHkuMOUSKAbTZVqYfX+EhXLjc0aT3hgrC4c2fWzznaSZnrf1+77ISEH1eBjodd6M5WHo3iKcOkyv8bSpWzATKYXLTUz8JwroIKx85xpEsF7PxYVlkqZLycVS3d6o2DsMzeTsFXaj+Pv0+LEgdKIOxhIW5Zwo8iHG7Q9ZLlzV7lMtNOMrGPZlwJKQfrFQRRABsTY2AB/raZMHw3WPDKflgFAC8pJAfViLBxIs0fWtZqFV6oMg4c9UN5OA6295LH/JFa4NIer8etMvfha1JKnwPYYyjk+QOj46cB/IUEW43ibFUm0dfdzzm/0MlJ0UK7oqhJY9ldS6//DfNAczytTO5/c8ffXZdk8awgqGEV5uFdy8bkOJ31yQD2Xbw4q3O7G8b1Gf4kEDNO+GaBA2Qeg+bRaCmuOzYbW0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(26005)(478600001)(9686003)(71200400001)(82960400001)(6506007)(86362001)(186003)(53546011)(38100700002)(64756008)(66946007)(66446008)(66556008)(66476007)(83380400001)(110136005)(7696005)(76116006)(316002)(122000001)(8936002)(8676002)(52536014)(38070700005)(41300700001)(2906002)(55016003)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/EypbcdWzg9B6nGARM+tiogTpK+hIpbF3/Ro+fv0YV1xZqNy9Pc6XUYwnVRh?=
 =?us-ascii?Q?UzjZEymdIXdc+98s59aIdwa6dRoTd1MioqhVV93e7gS4KqrVjJo8Dux0hy9T?=
 =?us-ascii?Q?u0Yl0On0brXqdg77Sht6iz8/t+HXe7HNPXLtVICFbV0a4y8lKcqyz7JDU/wF?=
 =?us-ascii?Q?U4FJ/q1LvK+jvfqMyLffLNlkxRBC4E9QmGIhfeqObnqiCFMIH1Caof/0sXZ6?=
 =?us-ascii?Q?TQJnsyPyw4vZvA/IbDgVT4jEhdyDi2urppKWRfEZ9d+PF8qzP9pQcQJ8690I?=
 =?us-ascii?Q?gkQCUcQT1hhp1Ud9hCLTOdrn4sDKTOqpjGqIM2wDAVwqQyhMxwrfvQzV6myS?=
 =?us-ascii?Q?N+T6WSORA/6wUVlYYV5TM6JM/nhBgPJp2K+DjsUf1SCWFbYpEW0rTBYHMAWm?=
 =?us-ascii?Q?K7hmRb/UQXG0CVyd0u8sDvV6NtucgqeLVNK8ieXV2eH/wpX9K8JyUBgKysed?=
 =?us-ascii?Q?1XE+h4ESVopaxiPd+7MH5GhgBE0pJE5DBeoFnXET9AIZKkR9b7/hq0xNHxWF?=
 =?us-ascii?Q?DlJho1BtmdrKk/fO7r0uJHIhgqSiigEjqmmhrw63Oyj6jTXtcK8udUExvJBV?=
 =?us-ascii?Q?uf9rkd0+cudvPNt+SLDjiEn6PpHGmR8C97DdhvG2SP3U4dugs11tcGg4DDCW?=
 =?us-ascii?Q?w4ti+wwjC2/erpVE8Eqgy5JGkpzwY6jCBsYhFwKjHWm9Qi6V1KfWp9yyeX2m?=
 =?us-ascii?Q?NH7+xFZbejXX9tEkLwcRpqPO/U4HSj0QecI8I4Mw7cC+vEPueFbxxNL5q8CK?=
 =?us-ascii?Q?uZ771r43U7kYyKs3KBoNJl5HvgzkhjEptH5cO7fZGg0R4R4WZGAnvGreMNIG?=
 =?us-ascii?Q?8g8t36BWlxtkB7w/O3IFxpAUVYBzw5HxEyCsdCdQgzrlaQd6QgOzaEOmhGRg?=
 =?us-ascii?Q?RlGdO9KX1Bdpn8IOVXCI8Gstu2eiAPjamMsjcvg0p4bGxfcvaBC4srm3zlyV?=
 =?us-ascii?Q?/3MOSdUEekhrJjhKbGGqqlJBQYtyFQrArZfxWBN7JoA7M/gyhNs6YO4u0b5F?=
 =?us-ascii?Q?AHLdmDcC4Mc3ET14kWdWNKS9ne86ayNgHEA/Va3LqC7pCEAwH5Noqc4orghb?=
 =?us-ascii?Q?hvTTBwIm8Rb8D1LY8E5w9cLjsjN136mer2xPQp6pPys3VX+im7e4ZVk6gAbd?=
 =?us-ascii?Q?TumVDN7ZQXdUKAnR+Y9wpIGpIqwGul5Q6/MAO5Zhh10M8O2LiAhlDSlSWH+b?=
 =?us-ascii?Q?VYw2nRKwgmHUKFYvQz5Mp6rFrPfajosRCa5kKK49a7AkYWdeFUNa15Sk+mTH?=
 =?us-ascii?Q?Z3t9SIAdPuwX7cBQBqSJVA6ZRdEsZlJqRxdzdlstC9ktRY4u8YwT+Z0eVskZ?=
 =?us-ascii?Q?0YT7U+GT5DNV4mcDXyYnwcq3YEGMF/zkzGqXdiCT34k5Y6je6j/pb9NI9V3a?=
 =?us-ascii?Q?8HUqrBSY+l/6NDeIfs82Ld61YsOmIJy3jlb7eB4YZnT5M/hya/23CcOjT5Nn?=
 =?us-ascii?Q?1vHXsTWErJ3j4dwuIRlpwadWJF4xOnXjbjiKrOmj6iXOq4otY+ZQPCJM7Jox?=
 =?us-ascii?Q?nLGGnuHDXW2oCmgeEsP4+EEZl/m6ySOTdzGnuETxVAfdy9YbFZiaXY2Ojocq?=
 =?us-ascii?Q?Co3cLqyjc6kwWN1GPIUjQceII8zC+Tpo5lxZYa+FJJSHMNe5qzS3CNjxZW/5?=
 =?us-ascii?Q?vA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae7a5ad-2289-47d9-cd93-08db7c45dd27
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 04:19:30.7721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mhxrIdjqGXbkrMbpdHfrLa+5EifCDpkZdGD/ziFPbyf4mHKl1uz7FlhdkdF7r1wwG/VP8pxmRAcDEp9RYORJ68o+9ExgBgwlw96steiU84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 1/6] drm/xe: Add sysfs entries for engines
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
> Sent: 28 June 2023 17:17
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH V3 1/6] drm/xe: Add sysfs entries for engines
> under its GT
>=20
> Add engines sysfs directory under its GT and create sub directory for all
> engine class (note its not per instance) present on GT.
>=20
> For example,
> DUT# cat /sys/class/drm/cardX/device/gtN/engines/
> bcs/ ccs/
>=20
> V2 :
>    - Correct class mask logic - Himal
>    - Remove extra parenthesis
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c       |  6 +++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 92
> ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_sysfs.h |  3 ++
>  3 files changed, 101 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> bc76678a8276..5166265b5c1d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -322,6 +322,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
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
> index c01cc689058c..76bb6441e9c8 100644
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
> +static const struct kobj_type kobj_xe_engine_type =3D {
> +	.release =3D kobj_xe_engine_release,
> +	.sysfs_ops =3D &kobj_sysfs_ops
> +};
> +
> +static struct kobject *
> +kobj_xe_engine(struct kobject *parent, char *name) {
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
> +		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER ||
> +		    hwe->class =3D=3D XE_ENGINE_CLASS_MAX)
> +			continue;
> +

Please check can set_bit and test_bit be used to achieve below logics.
With this LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +		if ((class_mask >> hwe->class) & 1)
> +			continue;
> +
> +		class_mask |=3D 1 << hwe->class;
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

