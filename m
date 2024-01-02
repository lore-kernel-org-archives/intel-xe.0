Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8CFC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 11:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B2410E136;
	Tue,  2 Jan 2024 11:30:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C9D10E136
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704195042; x=1735731042;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o0CLPkZcyVeh/HLnoDqXF0lAIl1iV6CU4NDpXrAUOao=;
 b=JTfV+gCz2RYX4qJCuS4j73lYeNxZVrkxf+RnJpme054ZsySYcbyUKOgv
 VfEjKBgyT3txWJTBdtVRh8IHiKpQTqVJEuiok5iCKFW9qPpWmeMzAGh5q
 WlgA5zxlQuqsaoRE34OgKK8f4hlXLbAAoS61Rj0eXsaJJv91e59Jz6mUz
 k+7Spd0dqmpwBMPViKHKlsqv9yDCryms6MTdhLjWd1oZkOlb6lMont4uT
 wfU2OSg60x7DT8n4sB8zAjzQsYP6mQN+ixmPdu+G6cQ36t+yV3wCVAHWg
 Mg2GP2uCLl79OZKVWjnk46/fZuAkJIIq0gbJ5gmUutgrzxA9Fi1/mp65P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3682225"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3682225"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 03:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="779669114"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="779669114"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 03:30:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 03:30:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 03:30:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 03:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk9Hk4TsHWnQr/oTCTSaFg6bSnPxi8hzgXQvVaA1VvXXnhuHB/vvwwywB7HaeX/MjkYPvk9b+rYVs53AZOOr9/4lXEOH7lshfFLXIOuPqH1ZMn2G4BxGGivfJIkc5QEbOGEfmlayV9e3w1KfRl2eRkjqfE8TDa5SUFRzIgqb6X6QHaevmutZfOp9I+Qr8YCiAFxe2Xg0TZ7D+7PUSlgaqpTKT/wWvfVG8UKPpT+iAU+sJvz9izQfHRQS+1pxpmOcMfkociG4JTqQcmnE7FwzXYaZdqjRECtDqBhC98zsq68DYRFzERTn2gx9SJxGIcMSN+/e81nN249RWXlS6JEOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQRiFVkhDGr3asY69ifgkGhW/gX6urKGW5QxI7JKrZI=;
 b=Eoyh20uXjDrDvGrczvvRkJiStKhbhAknNRCNaS0haOUe2g9l1vC3mAgyiz8i58q4G7BY1tXPmC38GDlqpi9xRDfc7vB9LfBnmSW1B8rP9q0P0JjSSRGhYj7ywUY+tmXMNb87UWXlBuC4hwXq185YnrSjUxodrhBMShEzqhw7Nu+U/qfL0FXsYmseyRIQVon+r0bHLAlSR7zzSN4bEQGlePH0gQJHQOVFT+ZMPjOizSoiRXaSwZ8JYOqCdY4AaBz0C2Gs1ikNzuOq/Mn68TDg/7V1OKJlmewBI6SkuROs6MXHU6y4gJ5jLhSCAVIOsvr4pCGj9o1253JM66aLONtCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 11:30:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 11:30:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [RFC 07/20] drm/xe: Runtime PM wake on every IOCTL
Thread-Topic: [RFC 07/20] drm/xe: Runtime PM wake on every IOCTL
Thread-Index: AQHaOTNvzvXvPJjLAUuCdHGdfa4fZ7DGaBMQ
Date: Tue, 2 Jan 2024 11:30:31 +0000
Message-ID: <CY5PR11MB6211DFEFAD251EE8A643922E9561A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-8-rodrigo.vivi@intel.com>
In-Reply-To: <20231228021232.2366249-8-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB8550:EE_
x-ms-office365-filtering-correlation-id: e7ce0c21-6e42-4430-6cd8-08dc0b863a40
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDXzLqNYpOIm2B5yH/C9tXY3QlV5qXywkb/vbzpqbB0stHWIg45NBY3Rhlm7livtpyF1Qe3QEM/Sb+SBNhItSK+ZbhnLcCuTSnobv6rjb+lKTtIL3Mt7qWy6gR1h3JkRA7yUXeQM6z50yzft2Spcaxt2rOs5g6sHx2qjQrtm3GZEq2AexKzhsZVn1fGu/9cxdSwRzcHB4BIY+90QKFvjMIAcA2STt/819d1RicTiaIWWeFFYLE+cZZw6vjd8oG9e8txXzzPUeMXOnI4TY/xWkFXbJvOTpPPI2Myk6V/WJeIkgpzWoRtSGzs67+M/7S7NIE5rAfzi8wh9aYxUUXChMHdhYM09hyQa0/IXHFV/gNTNxMqJdZUw6XycRx+4EA0jjca+qXBN1neTUgzRibUPgJYGwxIRphh4tZ9sc10FVS4TqPe86kHO7LTMe4tmqG0ROHOUBGzVqcUVRE4VZdgzpduP8C/vR9Bw5S2ulAi/vD333HgPLpMQSHGK224fJZ8PV5YD2DcJDJUieg7cW4SrlwbLCN63Hfsx0v4Y0VSHrCP+ROiHiin2/S1iXsn8TZw/8wWQ67sHyVW7EQeLig4HZh7Sw8+wI4IUTNkjp0M5V4kHyPQo0FflykSwLVgLaYIS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(41300700001)(26005)(107886003)(83380400001)(38100700002)(122000001)(82960400001)(54906003)(316002)(8676002)(71200400001)(8936002)(110136005)(52536014)(4326008)(5660300002)(478600001)(7696005)(6506007)(66446008)(64756008)(66476007)(66946007)(76116006)(66556008)(9686003)(53546011)(38070700009)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DF9Xy2uIbevTSlQdNFZRBM8PNJiFXCK0UgaF7g8d/HeyOrhyeSbQ6MWErduB?=
 =?us-ascii?Q?VSCNrOIa/BIaqKK5aJXuDO6Iu9lmXy1nbTOiGGOsGBhA4Uy+x61J/GPV5W0N?=
 =?us-ascii?Q?Es5NqYCJ3mK3Tpc43RyLCRJ1PCbieT/d33+XiX2BCelePloI1VAPmmP5sDDD?=
 =?us-ascii?Q?75cF3TswyrNvoMKEewkut3aYnnrGEf095M06fa3VtyZRolPZn8GmK3M5AcBK?=
 =?us-ascii?Q?3hDESxSlU/hP2iTT1/dL9KJSHNjGE+4n/2PF05wI8E7fqu9njAqQG0elMHdm?=
 =?us-ascii?Q?WxLgD3ZQmsCMaDYdKhGjlKePFywJvSoYopiPBiwHRKxkfMJL0Cpe/MyC/lK+?=
 =?us-ascii?Q?SyMKPnLRMnREPX4zJY8TEkoEM7JL5WXWEeQfgtOxHHg9fqbviuFy7z+fzwdz?=
 =?us-ascii?Q?JnasDanMkbafYPcppfV99J02IJjku7nh8B/zc386SgaFkp64g2B+liAOiAg4?=
 =?us-ascii?Q?zm5adNUW5/5ED3aPsxD1o1VMwRQ0WmAjBdHwNxFB/1+f3J0GSfUAOfHFAOL4?=
 =?us-ascii?Q?w0cNoF3DQziNmM7DIuEKdgb3gegezPJIeFvAJsWap0OscS+wg084qfc3cyuh?=
 =?us-ascii?Q?m51mTLfHk0WLJkQvfLLFOHoGHMFMk/PKToFeHtrDWHyOI1NgdokeOQQU6p4X?=
 =?us-ascii?Q?4uib/btEafZMx3JyWazMmKRVJBdWNXrQH91nkLTzkpDjTnDeT6ofS+eCwaBy?=
 =?us-ascii?Q?81U9vkBN2NNcbm/FA/9Spyo1mxMS06F1UAqBvmefTSOfoKvGdl1Ljx2IJRp6?=
 =?us-ascii?Q?qnfaMix2fImTn2STa5KskOybBjvVTtGcp5xRxrBd6cFZtleCXsUG4xGcDGOw?=
 =?us-ascii?Q?lWHhAUSj9R+SezfXwwFj8hInaVTEmVPANwWiMdx3dSWsra8NtJOxm41OdSr/?=
 =?us-ascii?Q?f5cMjJFkDrqVrZLD+HTtHfWX4g5/Z1JXD4dkTcqZyTtOsQ0UmOSz6SILF5oa?=
 =?us-ascii?Q?gQrhUWrczJVKSbjNeiHrlbcM5Q52tpjE1PxXLrDiJrS7pB4u5uOTQFz1v2Bs?=
 =?us-ascii?Q?AKVcAw88uCmwxAQ7YCsPv6pnrCSZ7JVZ1+QwVeQAoiFxxXcW5OEk2Qk6+yQY?=
 =?us-ascii?Q?HVkQ3+iQJFfGXUmRWkTS3OU+ULdL6U1Bxci+N6bHXu3eFx7yoaJx1Yqt7kSQ?=
 =?us-ascii?Q?eUq4OuOvc2G6RwTXspHTJAAHyK0Wye9ORlaVkNFKgkjxdZ0C1jVl3V0U4CcO?=
 =?us-ascii?Q?/Nz8WG1cgRLDyDqk4GV0wWS7CAKMYvix1AebloCUadFETPJcjbgd1dClpw1D?=
 =?us-ascii?Q?v6rkZLBvqxygPfvzI+oJPEq3SE5f6Q9QgF7BrVUaD+/o6jZzY9TVmH2US355?=
 =?us-ascii?Q?WY8jp6wSHazzgKOyYcxlzGAH9C7OITHoOWlW8HWDSenT6rHjo6fesHNALbSJ?=
 =?us-ascii?Q?+OSMEcPmjuMOcZyHTUm1c7lJwPnSIZMXPubj8ZfCrT63BQl1Q2ZrcH9ZcLe4?=
 =?us-ascii?Q?0MV7ZFP8jknlUxIbAHzijRRHIJcYVvKi8ZLpjODJF9y/TpMn8YfoRm7UTy34?=
 =?us-ascii?Q?L4jzH6SO+wiYPNUaFTAzTHUGclfsQFPdm1WNW3kOlysV1tbSWUt619UsTLcc?=
 =?us-ascii?Q?/cx7TjO55iPUWi3EYsBiW8qcDnWkGhkXIs+qJ1HM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ce0c21-6e42-4430-6cd8-08dc0b863a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 11:30:31.0556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7uhIFgkTHp7I6xaPcth2GM0DU0u5ufePHfnQayHztDAL+EX4sqjMNflKY0TZk1ahl4gqU/borSEacsZa7MIioBVtRxQggVMu9y9sCwbtNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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
Cc: "Deak, Imre" <imre.deak@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Thursday, December 28, 2023 7:42 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [RFC 07/20] drm/xe: Runtime PM wake on every IOCTL
>=20
> Let's ensure our PCI device is awaken on every IOCTL entry.
> Let's increase the runtime_pm protection and start moving that to the out=
er
> bounds.
IMO we need to decouple dc9 from runtime suspend as prev patch " [RFC,05/20=
] drm/xe: Prepare display for D3Cold"
added that. Let dc9 to be enable when all display are off. Otherwise blocki=
ng runtime PM on every ioctl will also block
DC9 unnecessary.
Thanks,
Anshuman Gupta.
>=20
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 32
> ++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_pm.c     | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h     |  1 +
>  3 files changed, 46 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index dc3721bb37b1e..ee9b6612eec43 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -140,15 +140,43 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D =
{
>  			  DRM_RENDER_ALLOW),
>  };
>=20
> +static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned
> +long arg) {
> +	struct drm_file *file_priv =3D file->private_data;
> +	struct xe_device *xe =3D to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret =3D xe_pm_runtime_get_sync(xe);
> +	if (ret >=3D 0)
> +		ret =3D drm_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd,
> +unsigned long arg) {
> +	struct drm_file *file_priv =3D file->private_data;
> +	struct xe_device *xe =3D to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret =3D xe_pm_runtime_get_sync(xe);
> +	if (ret >=3D 0)
> +		ret =3D drm_compat_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>  static const struct file_operations xe_driver_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D drm_open,
>  	.release =3D drm_release_noglobal,
> -	.unlocked_ioctl =3D drm_ioctl,
> +	.unlocked_ioctl =3D xe_drm_ioctl,
>  	.mmap =3D drm_gem_mmap,
>  	.poll =3D drm_poll,
>  	.read =3D drm_read,
> -	.compat_ioctl =3D drm_compat_ioctl,
> +	.compat_ioctl =3D xe_drm_compat_ioctl,
>  	.llseek =3D noop_llseek,
>  #ifdef CONFIG_PROC_FS
>  	.show_fdinfo =3D drm_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> 45114e4e76a5a..f599707413f18 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -411,6 +411,21 @@ void xe_pm_runtime_put(struct xe_device *xe)
>  	pm_runtime_put(xe->drm.dev);
>  }
>=20
> +/**
> + * xe_pm_runtime_get_sync - Get a runtime_pm reference and resume
> +synchronously
> + * @xe: xe device instance
> + *
> + * Returns: Any number grater than or equal to 0 for success, negative
> +error
> + * code otherwise.
> + */
> +int xe_pm_runtime_get_sync(struct xe_device *xe) {
> +        if (WARN_ON(xe_pm_read_callback_task(xe) =3D=3D current))
> +                return -ELOOP;
> +
> +        return pm_runtime_get_sync(xe->drm.dev); }
> +
>  /**
>   * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device ac=
tive
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 67a9bf3dd379b..d0e6011a80688 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -26,6 +26,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
> int xe_pm_runtime_suspend(struct xe_device *xe);  int
> xe_pm_runtime_resume(struct xe_device *xe);  void
> xe_pm_runtime_get(struct xe_device *xe);
> +int xe_pm_runtime_get_sync(struct xe_device *xe);
>  void xe_pm_runtime_put(struct xe_device *xe);  int
> xe_pm_runtime_get_if_active(struct xe_device *xe);  bool
> xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> --
> 2.43.0

