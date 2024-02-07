Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3130EC4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 03:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE481130B7;
	Wed,  7 Feb 2024 03:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX03S3yr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E51130B7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 03:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707277897; x=1738813897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8u6M4E8+wMq9MErFDuLWdNwKudRk/w5D2yOHqpovt78=;
 b=AX03S3yrrVr+RHmAvm15JIdSO4Ugt15crPWEaEfpVD9kH2+KFjJLZ4Bm
 JV01gqtxNPl/AFfbKCoiZqrcqcm9sjrIYGXgNWihnQoiKFa1f+nAB4JWv
 TEJTu40WsgaJZG5xuRcmip1P+5/otrJvkJKUxye+Dt309Nefi7YnequsD
 Kg7qaVEa8F79ASYRB4UU+uu2sC78BC7uHC27wEWNoeL6rD4DOTaZVxP+H
 rPCeM1h2aD/bIPGpv7Iu6I99NyyJG5NeaF6r65tbbJeUB515PMuNqE5EN
 I9+7Dr1fPX1yu7YGZAGP9LyyFY0NaAXQ6wpbSthI4GPdLABY+fDmiKfav Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="789848"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="789848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 19:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1213422"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 19:51:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 19:51:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 19:51:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 19:51:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9sygCURgIIqeugfui9QtGsAYM2UvfqThrOQB3WV4V1ljJSQHqxd4r3hGGQIvNiMY1Nwr7JJ/fQzanb+yaF8QZS4FoMQWWPHql73jXxog2GweBJ8AGGX39zG9+mFnVH4U0iw7Lr1dUiv1BtqD8NRpPpPj5CmbPsh1EQ9AI+NM5AH8D80B60zKCRRvplJyJyx7w5teoYx8iMrrQTZV5u/Z2iZaIwOCTZ2SrIVlgSAsSUdZXEMcjhUtPkV5gLfjqwcJwsOOMQhys8R6bpFg+bhHAc0BBvMhmkFIzD02IQFFpwMPJDcmKGg9vpJf+BI18iHQFahIGfFwf4S3EqrXP33kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QGkoQW3QIZDK3/WgZHKKe7p0MFBoGEufGCSIXQh/HU=;
 b=CdvHU9mo77PJR5V2T39ktO6i1vQbffkPQ7FSmGPD8EDPUEpXlABMv2c+Cws0WcUofFfDZmSjKl0PpHes8eEIFgbZuF5Tr5sE3+CdlBr3htSuUi1lWH4B1UJQcF62/PSwwgN0TT3CnkSBgwP7BrtF2Q6teg6ce2pWNQxX0Sz+NBwJFqDkuYrv4jm48eTdf2w6HPPA6AAFpBs3p1ki6/nsB4zWSUTidiPMCycrAUzX+ChSbMgNBcozivw7SUpsZqxhkSV9EYn/21vdBgDuzSdSj3KC3Usg0iF5j/i5z38usmtEIPsIPAGGh4aPhW+juuEayhntZ8EX2adQIqXYIUPQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 03:51:33 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Wed, 7 Feb 2024
 03:51:33 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Haimovski, Moti (Habana)" <mhaimovski@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Haimovski, Moti (Habana)" <mhaimovski@habana.ai>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 Bharat Jauhari <bjauhari@habana.ai>
Subject: RE: [PATCH 2/2] drm/xe: support to export VM as fd
Thread-Topic: [PATCH 2/2] drm/xe: support to export VM as fd
Thread-Index: AQHaWQduMNDsPTKuD0+iapbAJwqHD7D+PVgA
Date: Wed, 7 Feb 2024 03:51:33 +0000
Message-ID: <SA1PR11MB6991986243D4ABF5848FD47B92452@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240206141820.264977-1-mhaimovski@habana.ai>
 <20240206141820.264977-3-mhaimovski@habana.ai>
In-Reply-To: <20240206141820.264977-3-mhaimovski@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB5958:EE_
x-ms-office365-filtering-correlation-id: bf7b2717-524d-477a-6e22-08dc27901362
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7q9TlqYTMwfs5kMDaw8qg2AADyvF+CDM7Ad328lr/FYxqaPb8U0CQoPK9NDBuXS1SY7mBAlfl/XRjI9BUX2xNaIedaAHMg25HTaD1cLtDTh9Yly24871lE056moTenZcheoW8c856OmZ9kJHRGzQ/KBhXN2ayc/UMUXymv+D6VEpu2UhX6xueS8XSnIj/4cwbhYvbqpcItaM5HXcxR+3HCpIRqoQRGFrghe/xCCWQkwyMa4+P5OVVGUxuZBRQvoyrr9Sl4JAzZLsDLG4aVZA7vVyXOT51WvRrYgyU24Gy06FAaTlILTPIUKkUIo59xOXY24P+hQAEbiutEzjE3yvzr6ZKQuzs3s6CTPPty2KvdivhFGjdFxZx/wloWWsOV2CIbv0NEapbMFFa+VpZvexOlCF38FVKyhmb6o8tWfJnKlh3+9oleF5ddjZPEfb7J+0FmPHtvtDOh3EN/YwUmgt8j/MByYS3iQBTRV1brzaj3/adnXfYsI3UzBhVf90BzzjkV7dhLyQSSMyL7bm+k4zWeV0JOzmvNkIbOlLqMzkcVcbfT6JUHVXBKvwI9UX5ytqzHOOjnnayq/VjTtNt65z83lCO7xLDKN3++3Aa1BACLwLRBlYrb/3jR9aIPGOVNtI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(38070700009)(66946007)(54906003)(64756008)(66556008)(110136005)(66476007)(66446008)(76116006)(316002)(5660300002)(4326008)(2906002)(52536014)(8676002)(8936002)(83380400001)(38100700002)(82960400001)(122000001)(55016003)(26005)(6506007)(33656002)(71200400001)(7696005)(9686003)(53546011)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?198Hs5qaVmvv5sftzHiDY/Rtuu2Dzih2EXaBTddV/6/sajnkpoO0uH4Px0OW?=
 =?us-ascii?Q?2Xa7qj/qXdjW9nGMUjFGqQoVfcEQQF/n7caTiSJsbEEjyxOdLGaR8+B2Mz+z?=
 =?us-ascii?Q?qj+38FPFTF8LNRDglBlV3zrs6e9dKBxqGNqF81ZkuVjPIpA0kzb2zx+WgX1H?=
 =?us-ascii?Q?fbpPHgX6IUFRvjUVsTo3349dIB9MgBxyBrTamSuGVKbmPdC9SgbQHc6f2sIh?=
 =?us-ascii?Q?b9lTw31YWkokA6cQpY6rXzZzaydcd6M7FS4QQYtXNLxlE9ATga80W/qEp5M/?=
 =?us-ascii?Q?D0tp1nzM9C97V4ty9W0cZREDNkSkuPwD0UJZNQxBKMpT7RxuMzf0xZDF//2B?=
 =?us-ascii?Q?V3DKZfPhMTLPKQBoO68TCxnsdj22/K3NoPAOH5DzT5qrT+HvrDQBVKsc37oY?=
 =?us-ascii?Q?aU31t0HoYZVi4Sw2Nix+e7QhKLFuLxQRY358u+mP6nvq40f5X1zXHZn993o+?=
 =?us-ascii?Q?ONKp+zECpUixV3ikMuqCPWiefBpBKXDMQ6rZPnCNKcjFahEve9Go5ydfoscv?=
 =?us-ascii?Q?3KfGjD4sRLvTEd6nuWqWAL2R07IFyDSf6xzoAdkVvVNAl4S8PTM2l9Staw/O?=
 =?us-ascii?Q?G2TepL2a5OFXjQfS9tc5Q3GWvIpb5wHTdkr+evz9BpHRISFmmvXVFhMGjRUT?=
 =?us-ascii?Q?dn/y4WR+RS5QqaLaMNPoT4VV7rbnxTjJ16TLBGTOixRXmJ8M2z/Ui2uR0GW2?=
 =?us-ascii?Q?KulSnuqJQh8+72UWmsxL+02dgl9BUpgdSHwpsOK2HuoDoNutJlpjmW9kEh7b?=
 =?us-ascii?Q?E5VveGVfqWajFGbuiJ3dCJNbEJcuhFmoRbb+m8PUvzDuu8I4EfNeceZtSdr2?=
 =?us-ascii?Q?S/53UtwKjRIVNivnmFc+IzxEvyMhA6ukRM6Pc+LgLWBEkJJIgSb527sI9/0U?=
 =?us-ascii?Q?e0NX44QNHGmUW7mhhmJV14XpZrB6acvFz3q6ZLajfrlOA01sHRMvH45a+ECf?=
 =?us-ascii?Q?ZJJ1Qc7qpFeTL+eqn+ue8i1rPE1NHt/Hl7G/uGxsSrYUtoQ7wRW0uJ2gJ4yJ?=
 =?us-ascii?Q?/+3iDqpv+Q09scRGp7BZY9uGefSKnhoqL0PPuJsLLLuQrJj8enimwYrZAu9r?=
 =?us-ascii?Q?oSK2h+RtNxb+AbA0arouUYFXI66B2AgtLWR+MCKaEgUyl42eB+UsayQWi6jI?=
 =?us-ascii?Q?C555NIa4j3MzkgIGr6tQ6PaGHLEImZ6KxIxsKQfLEGcFhqBwJJigCSPdtkNk?=
 =?us-ascii?Q?/JOBK8viS4HdyHurQfMeGWukuBKcfxW1yuG1rVU/WnvC7YSUvsi/Bbj96h9J?=
 =?us-ascii?Q?biOtewyJGkaORgjL3p77f5fFe8IxqPEGvc69hDpC+LiZFupdgEh84yHxoxU+?=
 =?us-ascii?Q?Ri6R/SiS1qV4ILYFgMDilYCrGawwDgS+trtj+MOiT0Ynmrw4BeFuyDxJcBMB?=
 =?us-ascii?Q?i+J+hI8grli9M/AEEmyo/9KrXmKi9rlu8jUmOY4C+9U6PtN9EY51TaRvb9eT?=
 =?us-ascii?Q?aM46mdb2VQqj64co2BBYFpKDcSVmf2fHV32qOJILhUI4qwt2z76OM0goalmB?=
 =?us-ascii?Q?2A5JaKUYE+OW/NjUZxxsLTYmW2y2DaBIs9jEwbbj3lVL98kjyrUpeYZb1BAv?=
 =?us-ascii?Q?1Orjqd+cdXSnfI/Snos=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7b2717-524d-477a-6e22-08dc27901362
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 03:51:33.3430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z97U6mfJSDzSSZHw291pSbqhUQS2iyRt+0aLGXhhkx1ADCEw+n72qmoxszIL2Sxhr426kTCcb3pWPcUSozq2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Moti
> Haimovski
> Sent: Tuesday, February 6, 2024 9:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Haimovski, Moti (Habana) <mhaimovski@habana.ai>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Bharat Jauhari <bjauhari@habana.ai>
> Subject: [PATCH 2/2] drm/xe: support to export VM as fd
>=20
> From: Bharat Jauhari <bjauhari@habana.ai>
>=20
> In some situations, drivers and applications need to share a VM.
> Currently a VM is exposed to the user as an integer. This integer
> has no meaning outside the context/application created it.
> This commit adds support to export VM ID as an FD which can be shared.
> User is allowed to export a VM only once. Consecutive calls to export
> the same VM will return with an error.


Hi Bharat,

Can you give more of the usage model? Do you want to perform vm_bind and xe=
_exec with a vm created from a different process? Such as:
Process1: create vm, export vm to vm_fd
Process2: get vm_fd through IPC, convert vm_fd to vm, vm_bind(vm, ...)

I can't picture how would this work w/o further usage model details.

Thanks,
Oak

>=20
> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_device.c   |   1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 121 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h       |   2 +
>  drivers/gpu/drm/xe/xe_vm_types.h |  28 +++++++
>  include/uapi/drm/xe_drm.h        |  27 +++++++
>  5 files changed, 179 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e75bca060f473..14773afd3ab1c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -175,6 +175,7 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
> xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_EXPORT, xe_vm_export_ioctl,
> DRM_RENDER_ALLOW),
>  };
>=20
>  static const struct file_operations xe_driver_fops =3D {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 78952a9a15827..ce8aaafdc1045 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -17,6 +17,8 @@
>  #include <linux/kthread.h>
>  #include <linux/mm.h>
>  #include <linux/swap.h>
> +#include <linux/anon_inodes.h>
> +#include <linux/file.h>
>=20
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -1936,6 +1938,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, voi=
d
> *data,
>  		err =3D -ENOENT;
>  	else if (XE_IOCTL_DBG(xe, vm->preempt.num_exec_queues))
>  		err =3D -EBUSY;
> +	else if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm)))
> +		err =3D -EBUSY;
>  	else
>  		xa_erase(&xef->vm.xa, args->vm_id);
>  	mutex_unlock(&xef->vm.lock);
> @@ -3260,3 +3264,120 @@ int xe_analyze_vm(struct drm_printer *p, struct
> xe_vm *vm, int gt_id)
>=20
>  	return 0;
>  }
> +
> +static int xe_vm_file_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_vm_file *vm_file =3D file->private_data;
> +	struct xe_vm *vm =3D vm_file->vm;
> +	struct xe_file *xef =3D vm_file->xef;
> +
> +	down_write(&vm->lock);
> +	vm_file->vm->scale_info.exported_fd =3D -1;
> +	vm_file->vm->scale_info.exported_vm =3D false;
> +	up_write(&vm->lock);
> +
> +	xe_vm_put(vm_file->vm);
> +	xe_file_put(xef);
> +
> +	kfree(vm_file);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations xe_vm_file_fops =3D {
> +	.release =3D xe_vm_file_release,
> +};
> +
> +static int xe_vm_get_fd(struct xe_file *xef, struct xe_vm *vm, u32 vm_id=
, int
> *p_fd)
> +{
> +	struct xe_vm_file *vm_file;
> +	struct file *file;
> +	int fd, err;
> +
> +	fd =3D get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0) {
> +		err =3D fd;
> +		goto exit;
> +	}
> +
> +	vm_file =3D kzalloc(sizeof(struct xe_vm_file), GFP_KERNEL);
> +	if (!vm_file) {
> +		err =3D -ENOMEM;
> +		goto alloc_fail;
> +	}
> +
> +	if (!xe_file_get(xef)) {
> +		err =3D -ENOENT;
> +		goto free_vm_file;
> +	}
> +
> +	xe_vm_get(vm);
> +
> +	vm_file->xef =3D xef;
> +	vm_file->vm =3D vm;
> +	vm_file->vm_id =3D vm_id;
> +
> +	file =3D anon_inode_getfile("xe_vm_file", &xe_vm_file_fops, vm_file, 0)=
;
> +	if (IS_ERR(file)) {
> +		err =3D PTR_ERR(file);
> +		goto err_put;
> +	}
> +
> +	fd_install(fd, file);
> +
> +	*p_fd =3D fd;
> +	vm->scale_info.exported_fd =3D fd;
> +	vm->scale_info.exported_vm =3D true;
> +
> +	return 0;
> +
> +err_put:
> +	xe_vm_put(vm);
> +	xe_file_put(xef);
> +free_vm_file:
> +	kfree(vm_file);
> +alloc_fail:
> +	put_unused_fd(fd);
> +exit:
> +	return err;
> +}
> +
> +int xe_vm_export_ioctl(struct drm_device *dev, void *data, struct drm_fi=
le
> *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_vm_export *args =3D data;
> +	struct xe_vm *vm;
> +	int err, fd =3D -1;
> +
> +	if (XE_IOCTL_DBG(xe, args->pad) || XE_IOCTL_DBG(xe, args->pad1))
> +		return -EINVAL;
> +
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	err =3D down_write_killable(&vm->lock);
> +	if (err)
> +		goto put_vm;
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err =3D -ENOENT;
> +		goto release_vm_lock;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm))) {
> +		err =3D -EEXIST;
> +		goto release_vm_lock;
> +	}
> +
> +	err =3D xe_vm_get_fd(xef, vm, args->vm_id, &fd);
> +	args->fd =3D fd;
> +
> +release_vm_lock:
> +	up_write(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index df4a82e960ff0..e1b93b872d83b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -180,6 +180,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void
> *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_export_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
>=20
>  void xe_vm_close_and_put(struct xe_vm *vm);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1fec66ae2eb2d..7d1f91e16c40d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -119,6 +119,8 @@ struct xe_userptr_vma {
>=20
>  struct xe_device;
>=20
> +#define xe_vm_scale_in_use(vm) ((vm)->scale_info.exported_vm || (vm)-
> >scale_info.registered_vm)
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -281,8 +283,19 @@ struct xe_vm {
>=20
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
> +
> +	/** @scale_info: aux/scale information related to this VM */
> +	struct {
> +		/** @exported FD: fd exported to the user for this VM */
> +		int exported_fd;
> +		/** @exported_vm: VM had been exported via the vm_export
> ioctl */
> +		bool exported_vm;
> +		/** @registered_vm: Indicates the exported-VM is registered
> with the XE driver */
> +		bool registered_vm;
> +	} scale_info;
>  };
>=20
>  /** struct xe_vma_op_map - VMA map operation */
> @@ -374,4 +387,19 @@ struct xe_vma_op {
>  		struct xe_vma_op_prefetch prefetch;
>  	};
>  };
> +
> +/**
> + * struct xe_vm_file - VM file private data
> + *
> + * This structure stores data to check the sanity of the VM id stored.
> + */
> +struct xe_vm_file {
> +	/** @xef: file handle for XE driver */
> +	struct xe_file *xef;
> +	/** @vm: VM object which belongs to @xef object */
> +	struct xe_vm *vm;
> +	/** @vm_id: VM id */
> +	u32 vm_id;
> +};
> +
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9c..d69bf015324e4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -80,6 +80,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> + *  - &DRM_IOCTL_XE_VM_EXPORT
>   */
>=20
>  /*
> @@ -100,6 +101,7 @@ extern "C" {
>  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
> +#define DRM_XE_VM_EXPORT		0x0b
>  /* Must be kept compact -- no holes */
>=20
>  #define DRM_IOCTL_XE_DEVICE_QUERY
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct
> drm_xe_device_query)
> @@ -113,6 +115,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> 	DRM_IOWR(DRM_COMMAND_BASE +
> DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct
> drm_xe_exec_queue_get_property)
>  #define DRM_IOCTL_XE_EXEC
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct
> drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,
> struct drm_xe_wait_user_fence)
> +#define DRM_IOCTL_XE_VM_EXPORT
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct
> drm_xe_vm_export)
>=20
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1339,6 +1342,30 @@ struct drm_xe_wait_user_fence {
>  	__u64 reserved[2];
>  };
>=20
> +/**
> + * struct drm_xe_vm_export - Export VM ID as an FD which can be shared b=
y
> another driver.
> + *
> + * As part of networking support, application needs to work with both XE=
 and IB
> driver
> + * sharing VM. VM ID by itself is not unique therefore we export the VM =
ID as a
> FD which
> + * can be shared.
> + */
> +struct drm_xe_vm_export {
> +	/** @vm_id: VM ID allocated during DRM_IOCTL_XE_VM_CREATE */
> +	__u32 vm_id;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @fd: Returned FD */
> +	__s32 fd;
> +
> +	/** @pad1: MBZ */
> +	__u32 pad1;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.34.1

