Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77665D1CA38
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 06:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6C010E117;
	Tue,  5 Nov 2024 06:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxcrT9FY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECEE10E117
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730789242; x=1762325242;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UXsSV2IxytyoNn6ZtQsTWawnmC0o7f1kqTX5x7kiQpQ=;
 b=YxcrT9FY9WiU1sHmd17l8sP+JwpTaM6nLZ+UkANRIxYfs8gKsxWoxktg
 s2LezRqN0FcymSiqMRrsE+UGmL1AxUNWN4Bw0IQjOETolTaFEgfdydBgk
 MXGwYuBdtQlCJRpzQchk64KWwNhnDiPPxWvVuRjPUpqmA4y4Tnquez3WA
 +CiGHCmkjDcf2WY1EQfGzysRspmqOuRZ/tBY+fR2CMsp1KCHhTpjtfnnf
 lU3Faph51l69/SZYq9b7+Ee4gNAOqS/bxFPWXJZ5vJiuVx2+KFUOy7SFQ
 acVH4TB/7ufkntIRd/U/jAC/Phg+fvdAsLRTbYxPkIiL6KiyxYLly9r0L w==;
X-CSE-ConnectionGUID: JJXWS6CiRkiNLG3iHRyj9g==
X-CSE-MsgGUID: UiirXrU2RqOsrrHdFEFBRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34301040"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="34301040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:47:22 -0800
X-CSE-ConnectionGUID: gsAxErtxQq6ItPyX7K7nAw==
X-CSE-MsgGUID: kYdjZ8YcQqS1jfuTdMtMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="84711854"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 22:47:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 22:47:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 22:47:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 22:47:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKEk4Qn3Rcyg66AoGw8RqGbXWd9eQ+/T+A7CwlQ3NV2gbLWZeaIsQU4QZKAo3ejWK8qnpC2jdz6A+wtYB04nvhk6eHWYtQygi6a5A4dURzBZa7vRDnE788VHk7K3W32P2jtVgL65DYKF5Wbnn53bVwnSEZEQWfc2g4dG57XnfhwuLp3XhcfnZwMmU1braqaUG6gmrxpr3mu3rZB662YWDKILjgdR6LYt55sGNFsGT6Qiblx1QfrzKm65SrWZVqPVLR+pojx9v643GlMS2uDDACT4WHq+oMXnBVHpwjBK9u4InEBju8wcHBkTIgQo6GQepRq/ThT/hNgEf9yNyzbWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XTiv1w2TW4meMfH3aMRrRNY8yP4ISC8oKEwmtF+hXU=;
 b=eV/WSt4JRrYNS6ZyJieESQLrb77JHIXaAWFdB4NOyG025vub4Xs/ByJZwHuDpKWm9VlN9QOKzHApnGtFu+0BNtX6KPJQQBOJ4a0AOIxrv9ZJdLesv+5Ag5hDCbHbCfgh6pbX8NLMC1yKk3p7hPo1omJ2HPwBpB5A0BxLpN738GO5/j+Kvsk44nbGMHwlaVVL/+FTFoLIMnjsI+yrccWliH8swOvToaFqvUNje6Bo/SoRtZ/ahe4dvN+YKo6Ku5cIOIuehunHSp9hiqn2PvtSwNs8rM+8XETLiPKlTrL7DP/E+MSkWS5HHlMZL4uxd97f22FD5p+AnPiHZBbBktmJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 06:47:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 06:47:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get
 failure in exec IOCTL
Thread-Topic: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on
 xe_sync_in_fence_get failure in exec IOCTL
Thread-Index: AQHbLzweoD3+16FwvESkBPtutN63a7KoPiRA
Date: Tue, 5 Nov 2024 06:47:17 +0000
Message-ID: <SJ1PR11MB6204A53F8761A84E9E90700281522@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
 <20241105043524.4062774-3-matthew.brost@intel.com>
In-Reply-To: <20241105043524.4062774-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN6PR11MB8172:EE_
x-ms-office365-filtering-correlation-id: f25339a8-dd76-4d66-31a9-08dcfd65b0c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D0Z2/NVREGZ5KthyZ1tS6lP+Ip1n4Z0fg/ycUC7bz/l1eRg+DxWK6vdGwzQb?=
 =?us-ascii?Q?ZO+Os6pCBV0cHAZ2IZ/3/US9N0+v+vx1q6wcUcX3HzHnaPEkb1gBM0Un/Dc2?=
 =?us-ascii?Q?lHV0xoAYtyu8xvICzXYEDIVzEZs2S+ISAV0bwFL8ovG6lQhlpCkd5sJzq8Ro?=
 =?us-ascii?Q?ZND+FgSg99YXna0zJNSBBoI3FiJA4sAmLtNX6CPR0sAWosFKXEFPnCymtpj3?=
 =?us-ascii?Q?maaKjoTCcHuh7n7uDv57lKKvLTh+3ZLPoy4jXLVkMyx/EHE/2dNQ/pIqjFI5?=
 =?us-ascii?Q?Dxb9CdgYcPcFwFC0MIYAW9xKsOmA3dT+7YjCnVJwSECS1e1OOak3CkGegEN0?=
 =?us-ascii?Q?2k8xH61qLiaMkY7tjP2xpuftLD7ntjd9bg2yxCDQV2t0tMBsC4s1YFXqNEgJ?=
 =?us-ascii?Q?wcIge/yH6yJfJHpkfKyTzAt0a4seETLVwoPKHe/2zgMcIMTUC9GT3Hh25QWt?=
 =?us-ascii?Q?Q8YyXDy30e38PU5z4tDn5ymMqe1XlYY/lqTTRHKNrmyEFCMIEb/rstlIZj0N?=
 =?us-ascii?Q?VsEUgfFBpEoXvRRWuCXAl92BTBJpaqt8tD8dZ9yLQJklpavYFA0AWtsN4WFW?=
 =?us-ascii?Q?QNUPlQQrXFPqt3WkZq55dvQzC/fxZnIRJhVonWWEYxnzeMPFDEiTG3viYM+k?=
 =?us-ascii?Q?QwLYN+uma2FBogpdJlItp9Z8iPF3DxSpbSx1hPXlDJ4pt85WvGVGyPbu/lcq?=
 =?us-ascii?Q?zez1Lp+vi6k+JqbT4wSRqxGu740hyWt4e3xspwD+AwtMOYj0HQdryWLUCN/0?=
 =?us-ascii?Q?ePd/zyWMe1ZuFssjMi6SvbAZZfERQ3ibq8XrPOWBD1hvRSaYufL0ahFXp7fk?=
 =?us-ascii?Q?rHHng3gwOald3VMFEnLsV4ByyVHBvcAeI2fGvDhMMjoIOFd7XGbOyKfuLwF2?=
 =?us-ascii?Q?1sv2AMr/Ne72t1EV75DNlDdLvvtjdlQWD5Bv2pnOw4mmhmgzghJiTdI7Y4+R?=
 =?us-ascii?Q?SO88MC5PnVaExVE4+1m5qEGC0wmJ35xdfC5HvMTOzguobwl7YegJOr2pknrT?=
 =?us-ascii?Q?MUCJmHKIkHbj0k9lO4NigzhqalOU0KkIZKHrwxFiS+fn3tgk1XW4E6s/YOMr?=
 =?us-ascii?Q?falMZCWMwUTVHC/dmQB6Sz/ln/ZyfTa5eNHzaCCM8OsGeKYW/lHuVTgsNzV/?=
 =?us-ascii?Q?/ZoCxnW5eJOTCQaNb0VCmP52XnVuyNkKk2ykrJHDB0ult1naqDS6JG0VaWol?=
 =?us-ascii?Q?5ziRO0v6Y8yODd4JoTkD9RKTohtbbUDkuYHLjVct3gjHpitcBDiUgVh4iMkv?=
 =?us-ascii?Q?0syX5ygDtTkCwI0RdERWt7a7MljlGGuhkaLjvBujRbfWnPZ14gsB0xkFEvSQ?=
 =?us-ascii?Q?Alev5SwwTH1iGnZ0Yn3xnKbQpKE+oPBabK5GiiE0g6NbpS+t7umdJb9WuRiK?=
 =?us-ascii?Q?Z1muZn4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FpL9j0hpkNQIhBW61eUgCGF2vu/bzFReyUbuj2JqGx9/kU3HzFgV4GfIij9F?=
 =?us-ascii?Q?Vo2TGC4VPQ64V2VCZfasC2DLTBbG4uFZidGX8W2pSrN1HUTQt/zqB8hB5nLT?=
 =?us-ascii?Q?AW+OwIGtT25TBGXQEECmBTejUwucLxiA/g8wEh/v3UI/wR4VKmkkP3YDTJ/H?=
 =?us-ascii?Q?C2vJ3t1guoJmdWFcNluVJ+frPyOgoMYX19ZM9fy41H1ata6zj5ypSLVCKEMq?=
 =?us-ascii?Q?w64+Z8fbX+zpEWQ3GisRKFM4NLtumX6FvtlV2jMcxz+BviD1Jg2Y/rjr+WOZ?=
 =?us-ascii?Q?zlrwwJfLMkIaqRLeKhFoAqlLiQ9IQ5DGOoprVes9rM8y8tQpsoipRvQYTr36?=
 =?us-ascii?Q?1wdhSRgfpvfyuJI4IukQ8VWlQHjVK/vauqKLBSpVBaaVgaQMQj9VM1IcG0aD?=
 =?us-ascii?Q?3k4naNtv+kyWgMT7rXejVePyX91RVkp3Ktn8nmqwnNV9BjMfa5lVNZCMc7Fl?=
 =?us-ascii?Q?UOaS8Y7K86m0n+3SGRf9RIk5jMave+BISV52KfpCKqEVKKwImxDmtbKF6EkR?=
 =?us-ascii?Q?VZ4YE1s/26Vk+gfzxpEkNiCJ3pgu8EGtqSdNnkMB9MLUlFefWvVFFJ7Qgl32?=
 =?us-ascii?Q?8vBp3ILsx4y/NC6YgCDKgfqk+Zcb7UpahEM8fJOLqN4kRqn5etYNl65SRPtL?=
 =?us-ascii?Q?pqzK5J3O85VU3zYfbumituFfr3n4VugiTiSig1fAhuwySf5elKYPRFLBhZ4a?=
 =?us-ascii?Q?oMrx9BTshtn4829ZMMTysYjmo//960Un+Gi748luLhd5qHRKELuCFqKFWO/S?=
 =?us-ascii?Q?Gb0MpSXtZJ2x/pJxKzF+z8r6w+o+5QFiAFLTVXToAa9yY4cJm2QbifTZb+ZQ?=
 =?us-ascii?Q?84K3oXQ8YjHLmRFUU4ccBAXN5j4S2AczntrjXQow4pBTBbMWToZap5mpsqES?=
 =?us-ascii?Q?087tTek3m1gGaG4nQeioRN23A3On4uxdPjgJ0mVJLqMhgQyNcZibE2UmS5AR?=
 =?us-ascii?Q?hMiv0yqWAtnxWIk213k8oDY5BVGcqGbuyru4WiFBBieEb26KZs8ES5WoBZau?=
 =?us-ascii?Q?2ZsgByPoYBnrdTRHo5aVQHPGMvG3UX95UqZL5+OvPo4kDdOAqJjfHUBld0eN?=
 =?us-ascii?Q?tHQxGhanN1Jppvsk3/2DmZ+nNbHUlQCLajvUZ57ROLsOFme1CKnmPATGaaXH?=
 =?us-ascii?Q?+zBaRKaWQWgOx8p5TK83dP1H9jlBzWsccjOMHdNVz8ZsSKpHOny/xK0uh8/6?=
 =?us-ascii?Q?QrVQSb31Dj936wXuqP0UmUZ5B21HvFRDJqsWtgsGEBs9d/VfKxw/Lt3Wbhnj?=
 =?us-ascii?Q?PtDgMjGQGf/Y1ThYrbsYtToeMMFnYBFUIyEBElwEPCqON/VBlF63DkaWAgH4?=
 =?us-ascii?Q?7HnPhu6t2KMTA28J7UysHlC9RoQ4d41pnyeHxMSXKyCVDKdulC7g29onUgkR?=
 =?us-ascii?Q?+ZgrVCSwLHeHO6I5dPpfGBPyxgijR8y+3x2psHNz778OFf0SxwaYf2h6+gmK?=
 =?us-ascii?Q?jDwDo06FJ6gamtGva0ccWco1JyuFDbJWCZXfyFaMvKoBHW1DeuIYlAisf/np?=
 =?us-ascii?Q?RneSzTm91KhvMKYZX7Q/02U1OkWpBoJ0K5TDWStJ7TsZoDBKVcGkTbmeuJfo?=
 =?us-ascii?Q?QBMxxBS/m6xCCV5Mx8jEoV6knI1TAJ2xq3Ecx/rw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25339a8-dd76-4d66-31a9-08dcfd65b0c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 06:47:17.8395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXZylKTcAFLy7315ck8gl+f0SP4bkLsKvOFbLcqENIwdrDtnHstJuRoze/ozabIzfCivBV40adtS6apLeC0hEklSAdtMDqOnteVGWbmpmdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Tuesday, November 5, 2024 10:05 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on
> xe_sync_in_fence_get failure in exec IOCTL
>=20
> Upon failure all locks need to be dropped before returning to the user.
>=20
> Fixes: 58480c1c912f ("drm/xe: Skip VMAs pin when requesting signal to the
> last XE_EXEC")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 6de12f91b865..756b492f13b0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -224,6 +224,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,
> struct drm_file *file)
>  			fence =3D xe_sync_in_fence_get(syncs, num_syncs, q,
> vm);
>  			if (IS_ERR(fence)) {
>  				err =3D PTR_ERR(fence);
> +				xe_vm_unlock(vm);

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  				goto err_unlock_list;
>  			}
>  			for (i =3D 0; i < num_syncs; i++)
> --
> 2.34.1

