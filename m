Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544DCC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 21:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23BB10E3AA;
	Fri, 19 Apr 2024 21:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKvltLit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80010E3AA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713560778; x=1745096778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4faUAYyJbLtBv+go1eTo7hFAiv7veA52xhOEqf6wEVg=;
 b=JKvltLitWsKEaVC46ls3zIStnPTpjK8GPcPB0E/aClwmATISDADfqONa
 tG0JI1ip+GHoXfbFWmNTi8VHz900P+CiLF66Dqn71gmwjGdNxgQ8AOK/j
 Md+WEHj7xm6uE5nvT3FLw7g/Wcs7LuguRev3OkpzMe3amos13Fs7vBd5A
 eTjo9cbf1/t9qzKU7ibdG0ALJjY2d58TnJ2DByE6ChCJAFaSONY9WdbpA
 GCkQd3bk39jEtrQGKJPNucKN02IM2JTHLF/3Kz0sFHg/WzEvkZed8EmbK
 +tfe1jPzIQbM4W7cydyv6n7eO2cuq87KRN0B30x0Q4FMwvaIIUCsyvt8H A==;
X-CSE-ConnectionGUID: WwNz8vzjQSSvYotG7gDYxA==
X-CSE-MsgGUID: PxWo8v1TS5SkftQLIouSGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9352271"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9352271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 14:06:18 -0700
X-CSE-ConnectionGUID: 5KjHeGs3TgK1qybTAOwFBg==
X-CSE-MsgGUID: G/YitQznTk2SpCDLcWZUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23432088"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 14:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 14:06:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 14:06:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 14:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EriLPUPSBDzJUic7mQB9rje0sP3mi+8PcjlvBgYPapKx2vatZ/T6tjVMRDHaZOP6LAtmK7skZErLP5yN1cbxx52zyPJFubwAolRhmiTf89/HZ1jRe/BG6urPjaA39hrpMgVLqDisA+zrYCNwfturbX6Y+cqD8tfweJP5sq+gLw2C1ESWUzQZmYwWvRXDg57v0xnhMq5BjQgV7CF6XPsrgxtvAdTtcWhsVoeT0Q/GGRXexTiAkttxcHwcftXlKQm28X8RWGcOCasHFj5yUlrVlesqjT/ltfbvkFVXNPMRSGX9syDuJjPzUCYZb6BFmIF81Cp/2eh1gYNw6M5q36oiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdeTq0xAEx7IIxirlYB1v/BVt+kZCp3jG8a4ln4J4kw=;
 b=OPk9c/ocADjkQROJXRNmgpFhIGJSbOJTqSZuKaPJU2IgQtH9TIWUsz4UeJcaHdzOuGvNc97WMKz4ulJlMTpQWpylwQPA7vuyS4tBDsLPOtU93aMBbggyMWjs/PehFQ2G3qz2aNVTVTPRItiw6rrFrFohBHpB/Cz/gtAXcWl3L053L8aLjFa66RrwerxcCB5zwvwUqI+sUQaZeLPfRDWkIsHiIrfBp800C+dvtOre7ByYUN2u/h1EFkvl2XmhF99ZNduZoZKbMekSxdePcTuCosCrzGfp1oAbA3DuMhIpiogkFWep99qId3dVrtDTvwyfgSfxa6MSo/4wSc3PTCCM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 21:06:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 21:06:14 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
Thread-Topic: [PATCH v3 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
Thread-Index: AQHaj0auc5eKyyOki02dpJNXvADx57FwHC7g
Date: Fri, 19 Apr 2024 21:06:14 +0000
Message-ID: <SA1PR11MB6991DBA8732F72F5F47D4A68920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-8-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-8-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB8667:EE_
x-ms-office365-filtering-correlation-id: fe7c6c5d-445f-4daf-0027-08dc60b48c9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?19+jydbRNhjAFyYPViOcKFK15XZz6obDZwyFsKmkLpKsGySdGxKzEqj5pABE?=
 =?us-ascii?Q?dWmUA2LUoxm4B1s4oK70P+MpCOizIzx1XCy+hmw+wwqz1qgMp6ZtJETEe7NG?=
 =?us-ascii?Q?wACULb8YvXzKtDGK/SCZT6Ff+k2Er+mvm3EZcCGAXClzL5hVT5r49Sw9VuW3?=
 =?us-ascii?Q?MWPQmthguootMIxjnBXTH9B1H1I8aCEbZfG5NdzEGdhnR8mTLmcfypWg0odE?=
 =?us-ascii?Q?YOaMJogtJiLz7uFQBrEmrmKfWpsN6S+2W4rUl4E733J3powKJSXKhhRX0+3k?=
 =?us-ascii?Q?wsQq83WgYpUs0/WT+7EUKrKH5B3fehBy+dFdgFbV/QqD5yUdTo0upBRPLLzs?=
 =?us-ascii?Q?KI6qofVV+oDCNSZM5J0+I7cREPyQ9kqYx2wbpKkMA5pXNWbYET/7MRHrZvo8?=
 =?us-ascii?Q?u4YX/uuOGLhjO+60a2DyxscY05+NjSZawKR1aRVvstiwwGa28eua8hefoEg8?=
 =?us-ascii?Q?Zd/Z0/Zr4k4zS9aIlnOJuwLXtLWmfEgd3KeTjmQhjgbnGlOiZ6g25P52QP2J?=
 =?us-ascii?Q?kjnm3yDfPBCeJBDsIe7gLvJ36a6kCDKGpzZAlpUhosoYzrP0UBb3cevuzkPA?=
 =?us-ascii?Q?gMAFRQUGJUiyLTyZUOdoOLW9Tgf3eW/DhHeV5Y15qrE9AtsEVpUWTCSnq1lQ?=
 =?us-ascii?Q?flpuNJeHbYeX17xS5CfpwQcXhX9TZthwc4QoTZghuF0L8Y4hzK24SGOeUXKA?=
 =?us-ascii?Q?PN03EiPXPuYegSll+6XKynGbxz+05vy9nUPZ1Qp21qMuAzjvJ0jM9xXVvk0y?=
 =?us-ascii?Q?cxkLngm2W3stmz6sEWWfAq2lR1X5iLh8HfkfXAbnAZog/WGNhm5E3n/9yppV?=
 =?us-ascii?Q?9tNnVm8QRqC8iOtT7Hn3WJg8MDc7n5tR/AVDerUmKD4dAVQx03qgpK8A7w2A?=
 =?us-ascii?Q?lqTA1YLt3ZPh9eON1+q4aVNx6hh0PC40c/WM4zRapmInwd1ENVptkT9iX1eF?=
 =?us-ascii?Q?dCu/0Ro/BmhV8bFjBjvcvWMRnO8co473u/h0WmXBmDD7hX8zdBtGI+v8M8dL?=
 =?us-ascii?Q?3D3GK9rgo+kSp37ezQ4lkep3pz9Tlsd48Z4ypqzFBzsKWtuEF6mNPUYJBCxD?=
 =?us-ascii?Q?JnnAUV0wkNTKG3IGU2rNR9ubox+PmeyCSR5nBCJPO1MIfsBOh076LMC9dkdn?=
 =?us-ascii?Q?KcUTerzf9DfQfVxJi8VJZsUd9Rqqy7ZvSNRI9Sr2XiOAhVw/ue9gcvAQalnE?=
 =?us-ascii?Q?ACDBfMg80UGHKj2nIZbdMES8Z7t9YM9tBo3kam4WlzT7HYv4mwwZdonIYs4s?=
 =?us-ascii?Q?fp58bssdtzn8oLcVpWlSvAJCztibbbTgG3uiDGtLf/DN2jgp80XsZuxqYgrl?=
 =?us-ascii?Q?ysq1FVVcp83Joqf2eSo0PflvUPmPum53ms0c0YTZpEJH7Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I0rujI7H/UHMtk+UmgxMJLG1X+dWJ7Cyu77fzTyv0APAmtQqU9LnDiIoKBhp?=
 =?us-ascii?Q?vR2lWKBekd+e8vcCIn95SldLRaKHEOvsECahHgsTx0DHtxm0p1DNLVJwtJvh?=
 =?us-ascii?Q?OO/PTcwEBMa5lvNMbEwj4oZiam+mNZbaOx7jx071AJbmfk6oS3V780It1lDn?=
 =?us-ascii?Q?As8kMrrEmBdqWz6GFaJCtenDfcz3XezT2edt1NqpokfZ/NAxksFawt+Ybki9?=
 =?us-ascii?Q?Ff89QiMbB/ayJ9g58JgYeIxNKcnDG0rtLRejqx5C+V9GSrExIt3NqHrGKhPq?=
 =?us-ascii?Q?/ulZ0XVe6CdpJsvY9bXNSC9Q7OuUw/AhRN5o2wLNIJ3AmD2AQCURWlEkt4oL?=
 =?us-ascii?Q?prN4RwN1fUAiR/kV6n3UmCWQQWoXVrlQRyzvWWfZdQVeIS3wONqnlEKB3fii?=
 =?us-ascii?Q?STdW1QYeeFucdJXUCF651VjJexeqtSRhGvmhJEOL1nLVlcTIVAYGtIq8yvTh?=
 =?us-ascii?Q?mN4tPHjR598FoPLBIERpP5af7ODqnEpT+TvdFqGBIymZFvokARcT/rSfpa8z?=
 =?us-ascii?Q?YUb6lW0nYvLa0/p6yxZtmnrnp0vlz+fseIFxbeWeeBevGDDH9/TA88YJFXLy?=
 =?us-ascii?Q?NlR9hmS7dN9FMC7FMFqV7Xp3/PK7ymVv8tLGY5amEZr6ys65FN2e5ybQLxp5?=
 =?us-ascii?Q?mtN208Qq+f2ien457vv4oogMHrVwneaQOTii1DhGYaWOqkKxGef82cvkH+mF?=
 =?us-ascii?Q?YAj7Sdg+c+BlkBixcoN7tLQydxO9wRF/fbxRlDuyhDdSxg2Fn6D3dgELk6Sp?=
 =?us-ascii?Q?awf0+LuuHbm8wT+6hP9SyBpM6MDLSLp2M8iWktdCUjAPbZZucwHF4+w8JAJA?=
 =?us-ascii?Q?S24lDHmXAW9yTjkLzieFJzI/HKpGQbmqk1g4fC/fX0Ao79y/TAmAb8eqG8j6?=
 =?us-ascii?Q?PF2/X4wdaR1Jqi0BsGLOyfV4zMiwpQq6lVkgrpL/LKWzOkQg6ICFcohzZU+i?=
 =?us-ascii?Q?4thoTHSvjdBGNm7jdUDJ7vOQvrIgoLT7SMg4jU5FYKkjFoGwBFgbH//sJZcW?=
 =?us-ascii?Q?bKXu5z0ww8qXtDsBYbHu/ezxTaCaROLZBmmE0TI4XaxldU8W7UFU8wO75sIs?=
 =?us-ascii?Q?CI5z+DmQjZAiYcR4HSPTG6Ca9ez6FZdimEyobyolQ10M5xMRZKPhdxFD7BNt?=
 =?us-ascii?Q?pIprJUpR2pBL4myBkkjpWRdKTEkCIZCtmXWAUAZCaKq3AuAzd6TUH0l2q+fF?=
 =?us-ascii?Q?i6UGS71wanBTN4zzRvfwMiePlm9RH1Dcpdh9+V5q7TaZ+zIJljBHjNZ6gU2d?=
 =?us-ascii?Q?DYcxaC9pokZzGxj7mjkD1s9a9Vt6WndqwwhjXBzBwWiRxE7mSnSseTfPKv6Y?=
 =?us-ascii?Q?wJOL3VG3/ll0O1yw1VF0U8UishLTYDOjXiJ8yoOlnMzt0Nlv2zckbjO0/GSY?=
 =?us-ascii?Q?aewDbAg+3Vro98xB/1HglFzgKTqn1OzCqNEuRLQk5k+G6uGQKsZkhdPec4fH?=
 =?us-ascii?Q?Mgq6D2dyXDAv7dWZ7w1TSiu1iyGaVeJZq1i2WT/H+SydF8kowXM/tnDLMOJL?=
 =?us-ascii?Q?RWmc42L4Hqii+4Zosc8XjeuYjJFjQYpsOpSaTzjbaRHypzzAJN+oFYCwDwX8?=
 =?us-ascii?Q?WZAdIALb6/EHN0GH4uy70q/KBbbHoxmehFmFyTs5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c6c5d-445f-4daf-0027-08dc60b48c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 21:06:14.9342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLw3be/1zvVXs11boDO64LcVOHkDgy07Bil9vsEwKhVU6AA8xUkdZkMxCCxlinbEkGXA0mW/XoF9n3vciO8SyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 7/7] drm/xe/uapi: Add a query flag for
> has_device_atomics_on_smem
>=20
> Add a query flag for xe->info.has_device_atomics_on_smem
> as this is platform dependent. This flag can be use to inform
> whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
> applied for a given platform.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 3 +++
>  include/uapi/drm/xe_drm.h     | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c
> b/drivers/gpu/drm/xe/xe_query.c
> index df407d73e5f5..43272fdd5442 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -336,6 +336,9 @@ static int query_config(struct xe_device *xe, struct
> drm_xe_device_query *query)
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =3D
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	if (xe->info.has_device_atomics_on_smem)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> +
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ca4447e10ac9..80fff6fe3199 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the
> device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM -
> Flag is set if the device
> + *      supports device atomics on system memory
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> address
> @@ -404,7 +406,8 @@ struct drm_xe_query_config {
>=20
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> -	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 <<
> 0)
> +	#define
> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 <<
> 1)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> --
> 2.42.0

