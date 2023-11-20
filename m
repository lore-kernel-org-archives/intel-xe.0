Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE621C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 14:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D910E3CC;
	Mon, 20 Nov 2023 14:09:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9C10E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700489393; x=1732025393;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EzeibX347oA8c4P34/FRoD+SLcsd4jAF0tjA5CV5nRE=;
 b=hsx5QVQlcnNyQDavQ4an3iYYiE2dtbZ25dx2hBtjlD51LRhH6sINg7wP
 P1IP9vk2C0/7rkhQP4fNX+WcWYdVeRcf/F1NsV40H4yiFcLO7RfzJGIl2
 seI3X+cbNAUdfBmPivLqK9gFeakxCcAr2amVsxIgdkVW/JNYvehWba39F
 54NOc7qQ7L5NqdUh5Wa0L5TDHP+/WKg99YyWUv8srmwUZQQvbyEyMRvpa
 YzQEbdkeKF5EdNU56TYgOVzYjE2kbV1lBNTWzT8PRx0k3HQFJM1BpUQYT
 JYHM/H8Ot49Cb+grq94T+qTruAT1MISz4EQBgi2f7Bh5sEFJzt0nlj5QM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458120789"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="458120789"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 06:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801183366"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="801183366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 06:09:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 06:09:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 06:09:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 06:09:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 06:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnGyw6+/QAfwexdhjKcWMVAhlopQajw555NQMWLSWlzvLDRZPmxnMzRairBLl3ijywF76xzjz677fbaB9uST0rEXSA/QzRdUwvUH+6axiDwdZH22ATXWGVDHjtbRvRUeRBlxFnDiHsQ1Ej6nVnVrEzCalA7N/3ui3eYVfQ9sb41eXQUltpbsUSFhGy8RaKof+UfxQ+L/X/W4+H7nun5Me6M3jd0bRGWQElGEvqNEeWsp2Y2w2LxlB3zB5IDSZ8ObjjbY5YPEoafIwNv6RD4XGUa1LUiGSPSK9sjsUCU5sCEPT+yX8Faal1z7n9xg9MPNsHA/1JgeKdzVpZ3cc0EU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTEcr2SJCFMSwofRZcS4WEkfmihXTF4KbFCAQzLa7AI=;
 b=VeUTGIrWKizuS9OaDgKylmSHmjkLjk/PHa23Gh1erlI64BHYHZmPzTc20V3N+CQLN0qkT/38etmVHxxfD0btQHK5L3RWgxGuTqC9z/j5JwADG0PdL7I5gqSzUgrS2cGAyQ0r96jRhBTzVAyXJlz8motGDsiRrPUZcR+zymA4aiEXVYqN2h9pelK5ahobOfK19iA0zcD7S/DEl8SKurmiEVLLFc+YMQrbJ9U0mhumUuPCsqnjqBrQyBktZluEDP5LX2wtidnW7F3sTtsA/1Itndt9yiIZMzdrKn9Fmbk8kFQeUaC7jsWMyTnA+bVQ0JzkKFDoTfiAnwir+2uTon/plA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 14:09:38 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 14:09:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Thread-Topic: [PATCH] drm/xe: Remove unnecessary "ret" variable
Thread-Index: AQHaG6N/9SgSfwAS10eEu60kuxJKkrCDPo/w
Date: Mon, 20 Nov 2023 14:09:38 +0000
Message-ID: <SJ1PR11MB6204F4993E4A57005234A13481B4A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231120111923.232396-1-andi.shyti@linux.intel.com>
In-Reply-To: <20231120111923.232396-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7639:EE_
x-ms-office365-filtering-correlation-id: c4fe24ae-51fa-4e9d-89e5-08dbe9d254f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yDAvLI5cUx1MSZM0bByRJZsRJ10fg4P6NpSV/ZsPFM4JVuXYlTb+ewoT0pVix39/H8/xw+e1PG2Tik7X9ys/qLUZJyv5vJcKGD9c3lc/XMw9a2+33ZkoOkdZFYPc3Shqu5BqvEDT6lvm3SY9PfxnDhsZWJ+k2BsoFZT3cUv4Kq3xIq/IB2iKcKPZbmmmxxpYFiwE5AHuSPUTE3fxSnAAwnmJQYzzf8wPyB24+1mflrOuYsZ0TxMKSEjKXmoVLrMsDs9NrYTfFR0ubdSdH7Y0+eaIiw+OI5Iml6qhHEdZyVwN2GZ7myIaE8QFGyxosFwUKdeEJIQGSnG2MY4W1/QjKz2Ub+76jQq5a1QFzWaE7V2MCufxPdIFe+RlRhZ8b0RJVLOVtXhVsJxKAJEoiTU+yJLIMVLunTMUDCLZbgupW3q/Nk5WBMr2BcFE061X2Llp4/it+PockoYSPKGBcdllpN+X3FkfNRreuBy+DSQzfBU11aUlQhYkok+3zajjoUTWVOYGI6eKxxsTYyNxioiwVzmtyIVoqMPhEJdsOg8kxbcWkqiFm2jMSrh+vUz/p9cbJMCYXy2E1UcPb7614f1VGrmsCtNeFiMXnaXhkCEtLgZnNtsrBvDA6HNKZGUQfQwT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(9686003)(53546011)(55236004)(26005)(4326008)(8676002)(52536014)(8936002)(38100700002)(41300700001)(2906002)(5660300002)(478600001)(6506007)(7696005)(71200400001)(76116006)(6916009)(66556008)(64756008)(66446008)(66946007)(316002)(66476007)(33656002)(122000001)(86362001)(82960400001)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t4EK/4+GZyjvY0voC5hXTM2G02cu6lwVstueWqTdSDstVHa5DmEsMt0J3bO3?=
 =?us-ascii?Q?ukrFXl0lc2Jhxv6R9kiKpt6jL9Mr3EkE2X8snYFDyN14z2BKHWj7RlnAUnCM?=
 =?us-ascii?Q?RFOSp6rSx7fZn5/o8I2BHewXKBJqj3ZJCKwbRbD12H/FnVXAh7ndQ25OZmV6?=
 =?us-ascii?Q?DQ2kNq6qbD4Y17jCj+iN7+gnRYl+5tqu8dYDH/awevi0CLmK65v05459IFYG?=
 =?us-ascii?Q?IH/3GK+n4ODUMbbd8SrzlTGAfMeucf9oksmkoZpcT5C3SVNTzbwGhA1c5npj?=
 =?us-ascii?Q?5pqdnNU0sxL6K0/k4IUzHQ0w3iPWbqzkFe0rc3HhY0W9/fXs70I+g8o/qbIj?=
 =?us-ascii?Q?S2FZQZxhaUERpSCMvCpoUgAgeOevil9m/E/apCLrgzz0kUmxAxqetQObetRx?=
 =?us-ascii?Q?e04O93+K3V1SgDJJcMZPhVjISsYLovqRiSEUb6v6ZxvkSdtNopGe+KFSBo6R?=
 =?us-ascii?Q?0u7FiFpdskVCFZ9M0TLg1oIctInEMoxo1ncTMqL5W4Uhe1cvGWGymA/f163A?=
 =?us-ascii?Q?wH4fpu6kkbzerYa2vQo0GXrU4bml9bDLYHJnND2fWjpfrDgVlgSh7tFGCfhG?=
 =?us-ascii?Q?gUe7m4oRjgzbwMKTA0v4bbIvVEseHAwcogl1b+5H7jU1xaeixv+WdjA8ri8/?=
 =?us-ascii?Q?Y/cSeQoCU1I/bGT0IsNPPrZgNjKTY+emW+AHg6Ezuy2P12R0WQEVqFfj7CMV?=
 =?us-ascii?Q?sXpKsnGhHsfjFlqWCnIsJ9hZKKzgoReNWmqJBO9M+TVT5li6hFw5VwNNpEWq?=
 =?us-ascii?Q?ve2YwMI8iokQpMgG1bvpNxRLcvqIRWBQENwnpIWukqHfkfBEg5nVw5Xz0NLG?=
 =?us-ascii?Q?9MdpPdEPXYckKvHvdCvuGwy287dy1yakc9z9V3SkHVJxCKrA1ljkETXnSowE?=
 =?us-ascii?Q?iJvco+KNtppLKTMtqudcjWZWFih6qvUQg+Ywdc/8zNGCrip5E3lGE+keHBlf?=
 =?us-ascii?Q?4FHZNDPU8t8aW6Df/i3eR81ZD2kkquaULvGBrO0wZJw/cK/PUoLIl/IKww3h?=
 =?us-ascii?Q?eYknKSDvndjwrFxM3YJs3/VuaRHWFdz4RN9w0u6BU31hMDZY5FNh0M3QNWFT?=
 =?us-ascii?Q?6bUBBWMtzZuu125CM1+z649dTQ+DLbtazu1td4Pp3Lcuhc/vUVfePFkonaJN?=
 =?us-ascii?Q?hUFS34gTeTmeQauLWPrs/HyT0SukE1cLOmhtXlXC6qaeVvc0mhIetpK5uvip?=
 =?us-ascii?Q?ZBA+jyeJ54aTowKJ8PJIuANz2TbLAJXECBuwCNmvzkYhF441WxsndUUH+xDB?=
 =?us-ascii?Q?NctC8uDBgg3c4xhoiMMywCmdkRTclVpQq4xInEysvUat/GCpiFx1NBXzfabR?=
 =?us-ascii?Q?H0cxuxDNS5bYmSD7OR2FddRaWF7AZ37m2PMBRz8d3KWFbRjZMAw/ajCgs9ob?=
 =?us-ascii?Q?GZV8pkcLs5AYV7E0HFnvLJAdvA8x2X3Nso03wPRjq+U1ti4WAx1+gQkWyLPb?=
 =?us-ascii?Q?7ZkMzBnZthYP7SeDc0egweppUG8ZKzpTIR+r59i91JmfSXi4HOTC4fUPDngh?=
 =?us-ascii?Q?MF005ldxQlIhSv4khnxuOn92faM5Qy++8TOIsJ62ZCTBXAtbMj8dqm7n2O2y?=
 =?us-ascii?Q?v239FQvGc7+XAovWalkDSI1bgTPm+fRzE9YiKRhX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fe24ae-51fa-4e9d-89e5-08dbe9d254f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 14:09:38.0632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxxB9d2Sq47ZWcTxf7/5It1oceoTOZQgu3Iyww+vqvHjJtfQOJJr4By8nvEubouH5eldPBHFv32R0D6ovYgSF5sB7V4DZbnvMhv6PddqW8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unnecessary "ret" variable
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
Cc: intel-xe <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Monday, November 20, 2023 4:49 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe <intel-xe@lists.freedesktop.org>; Andi Shyti
> <andi.shyti@linux.intel.com>
> Subject: [PATCH] drm/xe: Remove unnecessary "ret" variable
>=20
> Just a trivial removal of "ret" that doesn't have a good reason to exist.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8be765adf702..f5c7f19033e2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,16 +50,15 @@ static int xe_file_open(struct drm_device *dev, struc=
t
> drm_file *file)
>  	struct xe_device *xe =3D to_xe_device(dev);
>  	struct xe_drm_client *client;
>  	struct xe_file *xef;
> -	int ret =3D -ENOMEM;

I don't see any issue with the change.=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	xef =3D kzalloc(sizeof(*xef), GFP_KERNEL);
>  	if (!xef)
> -		return ret;
> +		return -ENOMEM;
>=20
>  	client =3D xe_drm_client_alloc();
>  	if (!client) {
>  		kfree(xef);
> -		return ret;
> +		return -ENOMEM;
>  	}
>=20
>  	xef->drm =3D file;
> --
> 2.42.0

