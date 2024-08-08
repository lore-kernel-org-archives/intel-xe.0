Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CB3C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB8310E81B;
	Thu,  8 Aug 2024 21:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czXhplAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694D10E81B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 21:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723151924; x=1754687924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jag4u+7tNcK+Evn8q7PMxBzO/V+l97rIRS3g9wgYy6k=;
 b=czXhplACvzzphKHZxwkzGFJOVLtudJH1EwQRtyPxCUOmSPr7A3FsUSeD
 NhXqDmt57Mn+RK92FUTWdrcurgFzyemY49QcXngcJYOyVxyBT1uTay5Dz
 BT7/CBWPQZDP9SU6A7ksxTH8hQfh/+3Z2sKeWJi/akFZQIcb6oYe7FPFl
 VxFYKoqxAJ+O1yTD6VDgFcZ02Scn3VgxIuP+4KGtGeMiuKIIvmDe2JDTE
 q476m9Hamj3j2T73BY5h587z5HmiU8eoSIR8t1jvbus7DAvRpeQM5eClm
 TX9kU7HftmaDNryoszIo0TXvgd9uL0tkSPCdeGHjNXCPjmug/xdD2y1oM w==;
X-CSE-ConnectionGUID: Vo1nN4uzSaS4OLSj5Z9UGw==
X-CSE-MsgGUID: lYuoeNsXQ+mZ2jS7cu2j+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21450962"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21450962"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 14:18:30 -0700
X-CSE-ConnectionGUID: m5j1Y013S5SbvQHGCAPYXQ==
X-CSE-MsgGUID: PvmcySFBTtiXNgow0HZv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57004030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 14:18:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:18:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:18:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:18:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9QcVbh0NrilswNL1smXJ3QJ9rr3ca1CeUO24vb/4AI8TJlgVyFO9Pubr6UQYXW+IjA4OztsV1ctybaKnDilVtbMf2iUcQQx3xl70KS9sXDvlupaj2NyKg/UoM+T8LlJ9ICmUNmiLJ1rsCROfUtHyoxdOI7q1pJx5Xf5Km3fXAP9gM7uIaPdZhOKrKRcXe8uhyE70+t8YHmT4cWwGvp8Fc7YnjG+KkjdXRh0T24GH1o7np5dlczuJsM1MSLR+s7dEeAhvY6rccnuGDZQCvj4riWHVl4nq1+dS0sK0rvEhRbSqXVyGh78lBPjlhP+qGmAIKYma1YiTYp5wlCt9F/s8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qvMf6+6bcKeRSx7O6+9eH3dY32Nbuzc1nJuMkFvs34=;
 b=EU6yU46IqFjNTJkWZ9PV/FskZqMaJYI6DoHU9PS4dpO0gN6SWofYVktEARh17h7HGgYR2wmPLM0PaAuKfp1hwN2mxmh+FTW+P7+Smkd8yilknjxjOT/srdZWaz/FJn4ZXmRxbuMUEppNOCYCiP10QFmVoPKoOcOopnbcZ7BmZGsBTb1xhgZLgVmLmq2Un2+uatA0L/2wdQLz6uOr3obpSndbTNbJ/KmdHCNxjk0NzghkqafaTEKndFB5x1JrOBLY0fujuQId/3hJiu/5Zh7TwlopExQw1y2c4EC8HUd11t9oHEDp8OqcpegnKnBEZGHel0JE2HwVcR7jWhU9SSi/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Thu, 8 Aug
 2024 21:18:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:18:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 6/8] drm/xe/oa: Move functions up so they can be reused
 for config ioctl
Thread-Topic: [PATCH 6/8] drm/xe/oa: Move functions up so they can be reused
 for config ioctl
Thread-Index: AQHa6bpJxCKnMQiPa0KDcCXzUFR3MrId3P8g
Date: Thu, 8 Aug 2024 21:18:25 +0000
Message-ID: <CH0PR11MB54445CF804FFA0101E778951E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-7-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-7-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7192:EE_
x-ms-office365-filtering-correlation-id: 9b75a43b-46c9-4b38-9d43-08dcb7efa3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BqO7b8CaZr0+oxXNuOBwN4Aw7eSNa3DYEgIum6/LpvxR2IlALB7GoIUtJq43?=
 =?us-ascii?Q?V9Ww4ej3ldZLDPnVGaHdfQAKrprKAw19qQWxKI71TQntrNzT0kRtkDM0mjsl?=
 =?us-ascii?Q?pbC+hDHSUF3of2dTqqGsWcdbKctfbJ2syKKHjjQUCrOe3cCxg8DOM1mByR01?=
 =?us-ascii?Q?kUYMPS+eMoM5YIKJd5ivbi/k6454Idr1lIZyqwxRL1cbj4CboZ8PQYcS0MQT?=
 =?us-ascii?Q?wshgAZ4KYdcrkD+fMViOuOpxZfhsmtOyim8T22atQC5KIN9lEyLfGMk/wotL?=
 =?us-ascii?Q?aVBgRM5gsjTcbO/IqQH6tDXzwrSnAd/Qu0AoYJxkpcq5DiIudPhQLAPr75gt?=
 =?us-ascii?Q?BaApIOTyAmyqr81mZHXzS3Xz0663LnPzpsPnDkUIQ7mRte8S1IPkzeiyUqux?=
 =?us-ascii?Q?CII1Z5HtociKyA8MR4kW55rxW9UdJo1drTZ0Uf1+KVY8B5+vPg0DgRUNhi+w?=
 =?us-ascii?Q?Z5yo8ImruOD3NWiKFCd/bbfP4nfeCeKeFE1TMnvIERUxkFEhhx1kAeRhuLbs?=
 =?us-ascii?Q?GS0Mi8D0draJf81iSJVGsGmMkp2iPCsDDBX/QOUMsyKY24xwTAp+k2Jos+UL?=
 =?us-ascii?Q?baJNrDjG5Lmcxarw4XDT8j4V5bfIoRFFch+aw9jFLX4IW/pIuaJyIQZ3ZZ3n?=
 =?us-ascii?Q?VL0oL8U6+/jnIkC3mGNNW3ISNhreXJ2ZtLHX3WyiCASwh8Hp/viMeHh/c4rh?=
 =?us-ascii?Q?pVVZdCcMi0QcBPGkrxkn6///gzO5coG/SbZH9HIBM1RkwpXGlrtC7XuICPKQ?=
 =?us-ascii?Q?dqxCx0W8pjDmEyjtVCzBFUxrLP/MhaY9wgMxVI2tGzC4vCbMl4chodGGW8gY?=
 =?us-ascii?Q?6Ta0DMPSCMEpQqlXSsgw83AK8UbFmepQneA2NVN/YVdLMip2ypUHu87eXPI9?=
 =?us-ascii?Q?cWbKrq1Yso2DKRCQ1PwnLH2uGxBW3nek3Ccr43qfvf547JZRGqUgWkkoPAJC?=
 =?us-ascii?Q?6BpDPvjDG/KUTG1H/WUJ1atNPhxH3YLzhijPhKy7kIRH7cR0APQC+SuBXWFT?=
 =?us-ascii?Q?1eM+uSqGpcQs9lBEVW4MKoO0sjUeoEg7dQdtPd0i4p9pDODO+dlUZ2MQ808O?=
 =?us-ascii?Q?EaFftO5pKxOmhdRak5gmF9dDMYAdCGBQEdqQN4hCMIdRaQ4hmvv9pvDDKv8f?=
 =?us-ascii?Q?ZSOhA3lWZbqW0G0TahsTtHDm3eg2gzj4MAbn/MnIdF60+k027LJRhmFNgh3+?=
 =?us-ascii?Q?RKCgjhLzA6nS6GT8pjgvkapiWBoWIHknbajnn6O4Ax70EHhYIy03lOozEqtC?=
 =?us-ascii?Q?JUz7Kak5Lpb1A5KnbjsU+U56hnPcVivqqwvpvBfpOBNpndlERaI4wbmNt7NF?=
 =?us-ascii?Q?kzDarR5UDVZ7igHGznqdJUQ1BXYBNxRbSFLdNKwQDoFsoGKWR6viufLrn6ES?=
 =?us-ascii?Q?8kq5/RRjhX4GaQyRZrVasiQLtcxGD4N1f4WnmTaMA8R/huaKQg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dlk4j+Y8JWPMmmz80WQfgSwd+JU6SNTt/pdPxRntXl3ava0ydVK8VrAulojX?=
 =?us-ascii?Q?mwIQRjhPgSXhuzf3tIl6vsG5KrbzXbNW2PcNVTdW5oOlALv+X0gHr8eXYmOI?=
 =?us-ascii?Q?O8sTJeZdbXmf+XV15Mh3mA/nKu5Jby7JcbKQAZBDF/KzU6MSxBqM9K03mHQl?=
 =?us-ascii?Q?9Bq/nx3OiXnOu1hvqrP/h9DtTNZNDMIp0zS5tR6U9qZn5O1cgx6vhIst0K64?=
 =?us-ascii?Q?tay9OUvKOQhRl+LBXbGQbdLye6MpwZuoKuuuWHWZ1qD0PXzcNpnzZrtxlAVQ?=
 =?us-ascii?Q?hn5BZ11pZpVFsp617xeSq6om2DQBtM5txJZ+IrgfSp7EH3SXN6sZqLx1GylE?=
 =?us-ascii?Q?jXS42bDM/AqN8dwV/rYKoOwe/6299kJJcgf26ow2pUFVCgXPu2OnxiujLne0?=
 =?us-ascii?Q?Mx+tCSU5CLQC5/r289sZQqAEF0fWTC3RiJb/TIaqNBgx+kSLHp9jfZXp90Ew?=
 =?us-ascii?Q?wN4hPS7JL6suWvujBotaSwO5y5HDh8HoaFT+D3S5k9ilE+eOqAND+bTyACUj?=
 =?us-ascii?Q?t8Q5l163eMwt+/avX2s8i8nqOQF5pBk5MI2zCPs50KEsptO7h2n4JkUF7BYM?=
 =?us-ascii?Q?F50jIp0pYk/iDVmOSBEjqNsnqTAUNRECh/1XR0UosYRqk+FYuaIjHtHCbvcF?=
 =?us-ascii?Q?sR7SH54n0HqcKibZOpmzBbzqzOijSubgHoiHqplVRgUc57rr0bD+r0FIrrBt?=
 =?us-ascii?Q?jw9xRzPDTd0wzlrlQP6g+Laa3vaMa0A2kW4X0zDucLuIuWZrZsYtHPJ86pPb?=
 =?us-ascii?Q?bLqpfvc6HSI5pXKEP4jOFjWk5sJnVMDAubP5gXHtpc/mSqzJ/1AM2X8WWLyV?=
 =?us-ascii?Q?glD7IcPheHAWwTKGZRFrdNTPLmnGQnVfxQzyL0qYU1RhT1KEekosxsGpJtxE?=
 =?us-ascii?Q?OmXnmvy7R5pvPdGTI78SHeNKzvEOxWf2mERLx7k6i3PJlflJbRFzI27qddiv?=
 =?us-ascii?Q?DgtWAtex91gONxHCx2ERmHWXcNyE8s4KZxhUvkez2xZpVqT9buvDhHvBInPL?=
 =?us-ascii?Q?6oO4vfBDtPvO099nbTRP0HruV15SkX3kpJ/zFlKs18HwOZd2Ib8kuuqMRsaK?=
 =?us-ascii?Q?eOv0tL2IxrBrG39xbgL1iDqr8j/9pHwdvUsvQIeN/bFEnmkavLVwBXJmBN3z?=
 =?us-ascii?Q?JjYWBXc3JwPxaonXvWdtBlWe03t8hpC5G+pmw96ss/6VGrDUQy6MWim8DELf?=
 =?us-ascii?Q?IO0b/pI2N3d7HYiDt1JuCo2pqohZpQzshTmv2iAukhfC0wTzQ0sjlI8ydSE4?=
 =?us-ascii?Q?uPVLHwFC6RHcP4LvapPxz8ETWidhmVaL1W/3XHzYitzwRUOnA/lbtBtTuJY3?=
 =?us-ascii?Q?9Cxjfh/xaxUF47GZoCIFgiOMmNzpZ9bI2uprtjQMcn0Wg0TaFf8EwrCk4McM?=
 =?us-ascii?Q?0qufPGefxwPp07LT5XuzNdRqnYBQ0kkZrl11vYOosS3m6k4nvwNp4H5Q2j/N?=
 =?us-ascii?Q?az0WJZhFbL/inkugvRohTUt/BRxm9wF+7qQR3aDQRzRxV30sxMBIdcl6Y4dB?=
 =?us-ascii?Q?zUMt7ih6NTw0pJzAifG5HQK1SYz3nuI9+CR8dsfJ1HJgnbWhde76G5PlyzsH?=
 =?us-ascii?Q?psxkk6zwvOYd4zW7oN80j2djwm3wuvd1Brrl8+iu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b75a43b-46c9-4b38-9d43-08dcb7efa3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 21:18:25.0914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eyF3Fcz29ltwh5K7z3tnjKSKodG3Nn5RE5xHDw1AAuBzvd9fX78si9AdcorZCK/EhwHowEQ0sF6MNxA/EZunLvjDia0OcKq2WuOvRs0jEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 6/8] drm/xe/oa: Move functions up so they can be reused for=
 config ioctl
>=20
> No code changes, only code movement so that functions used during stream
> open can be reused for the stream reconfiguration
> ioctl (DRM_XE_OBSERVATION_IOCTL_CONFIG).
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 458 ++++++++++++++++++-------------------
>  1 file changed, 229 insertions(+), 229 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index bc421cd0af6ba..5520208a46b2c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1111,6 +1111,235 @@ static int xe_oa_enable_metric_set(struct xe_oa_s=
tream *stream)
>  	return xe_oa_emit_oa_config(stream, stream->oa_config);
>  }
> =20
> +static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format=
_name *name)
> +{
> +	u32 counter_size =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt)=
;
> +	u32 counter_sel =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
> +	u32 bc_report =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
> +	u32 type =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
> +	int idx;
> +
> +	for_each_set_bit(idx, oa->format_mask, __XE_OA_FORMAT_MAX) {
> +		const struct xe_oa_format *f =3D &oa->oa_formats[idx];
> +
> +		if (counter_size =3D=3D f->counter_size && bc_report =3D=3D f->bc_repo=
rt &&
> +		    type =3D=3D f->type && counter_sel =3D=3D f->counter_select) {
> +			*name =3D idx;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param)
> +{
> +	if (value >=3D oa->oa_unit_ids) {
> +		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
> +		return -EINVAL;
> +	}
> +	param->oa_unit_id =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
> +				    struct xe_oa_open_param *param)
> +{
> +	param->sample =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param)
> +{
> +	param->metric_set =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
> +				    struct xe_oa_open_param *param)
> +{
> +	int ret =3D decode_oa_format(oa, value, &param->oa_format);
> +
> +	if (ret) {
> +		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
> +				      struct xe_oa_open_param *param)
> +{
> +#define OA_EXPONENT_MAX 31
> +
> +	if (value > OA_EXPONENT_MAX) {
> +		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONE=
NT_MAX);
> +		return -EINVAL;
> +	}
> +	param->period_exponent =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
> +				   struct xe_oa_open_param *param)
> +{
> +	param->disabled =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
> +					struct xe_oa_open_param *param)
> +{
> +	param->exec_queue_id =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> +					  struct xe_oa_open_param *param)
> +{
> +	param->engine_instance =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> +				struct xe_oa_open_param *param)
> +{
> +	param->no_preempt =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
> +			       struct xe_oa_open_param *param)
> +{
> +	param->num_syncs =3D value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
> +				struct xe_oa_open_param *param)
> +{
> +	param->syncs_user =3D u64_to_user_ptr(value);
> +	return 0;
> +}
> +
> +typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param);
> +static const xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {
> +	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] =3D xe_oa_set_prop_oa_unit_id,
> +	[DRM_XE_OA_PROPERTY_SAMPLE_OA] =3D xe_oa_set_prop_sample_oa,
> +	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] =3D xe_oa_set_prop_metric_set,
> +	[DRM_XE_OA_PROPERTY_OA_FORMAT] =3D xe_oa_set_prop_oa_format,
> +	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] =3D xe_oa_set_prop_oa_exponent,
> +	[DRM_XE_OA_PROPERTY_OA_DISABLED] =3D xe_oa_set_prop_disabled,
> +	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D xe_oa_set_prop_exec_queue_id,
> +	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D xe_oa_set_prop_engine_insta=
nce,
> +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_no_preempt,
> +	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_num_syncs,
> +	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_syncs_user,
> +};
> +
> +static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> +				       struct xe_oa_open_param *param)
> +{
> +	u64 __user *address =3D u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err =3D __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext.property >=3D ARRAY_SIZE(xe_oa_set_propert=
y_funcs)) ||
> +	    XE_IOCTL_DBG(oa->xe, ext.pad))
> +		return -EINVAL;
> +
> +	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_=
funcs));
> +	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
> +}
> +
> +typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
> +				       struct xe_oa_open_param *param);
> +static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] =3D {
> +	[DRM_XE_OA_EXTENSION_SET_PROPERTY] =3D xe_oa_user_ext_set_property,
> +};
> +
> +#define MAX_USER_EXTENSIONS	16
> +static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ex=
t_number,
> +				 struct xe_oa_open_param *param)
> +{
> +	u64 __user *address =3D u64_to_user_ptr(extension);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext_number >=3D MAX_USER_EXTENSIONS))
> +		return -E2BIG;
> +
> +	err =3D __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
> +	    XE_IOCTL_DBG(oa->xe, ext.name >=3D ARRAY_SIZE(xe_oa_user_extension_=
funcs)))
> +		return -EINVAL;
> +
> +	idx =3D array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_fu=
ncs));
> +	err =3D xe_oa_user_extension_funcs[idx](oa, extension, param);
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, par=
am);
> +
> +	return 0;
> +}
> +
> +static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *=
param)
> +{
> +	int ret, num_syncs, num_ufence =3D 0;
> +
> +	if (param->num_syncs && !param->syncs_user) {
> +		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +	if (param->num_syncs) {
> +		param->syncs =3D kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_=
KERNEL);
> +		if (!param->syncs) {
> +			ret =3D -ENOMEM;
> +			goto exit;
> +		}
> +	}
> +
> +	for (num_syncs =3D 0; num_syncs < param->num_syncs; num_syncs++) {
> +		ret =3D xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_sync=
s],
> +					  &param->syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC);
> +		if (ret)
> +			goto err_syncs;
> +
> +		if (xe_sync_is_ufence(&param->syncs[num_syncs]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
> +		ret =3D -EINVAL;
> +		goto err_syncs;
> +	}
> +
> +	return 0;
> +
> +err_syncs:
> +	while (num_syncs--)
> +		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
> +	kfree(param->syncs);
> +exit:
> +	return ret;
> +}
> +
>  static void xe_oa_stream_enable(struct xe_oa_stream *stream)
>  {
>  	stream->pollin =3D false;
> @@ -1684,27 +1913,6 @@ static bool engine_supports_oa_format(const struct=
 xe_hw_engine *hwe, int type)
>  	}
>  }
> =20
> -static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format=
_name *name)
> -{
> -	u32 counter_size =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt)=
;
> -	u32 counter_sel =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
> -	u32 bc_report =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
> -	u32 type =3D FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
> -	int idx;
> -
> -	for_each_set_bit(idx, oa->format_mask, __XE_OA_FORMAT_MAX) {
> -		const struct xe_oa_format *f =3D &oa->oa_formats[idx];
> -
> -		if (counter_size =3D=3D f->counter_size && bc_report =3D=3D f->bc_repo=
rt &&
> -		    type =3D=3D f->type && counter_sel =3D=3D f->counter_select) {
> -			*name =3D idx;
> -			return 0;
> -		}
> -	}
> -
> -	return -EINVAL;
> -}
> -
>  /**
>   * xe_oa_unit_id - Return OA unit ID for a hardware engine
>   * @hwe: @xe_hw_engine
> @@ -1751,214 +1959,6 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, str=
uct xe_oa_open_param *param)
>  	return ret;
>  }
> =20
> -static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
> -				     struct xe_oa_open_param *param)
> -{
> -	if (value >=3D oa->oa_unit_ids) {
> -		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
> -		return -EINVAL;
> -	}
> -	param->oa_unit_id =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
> -				    struct xe_oa_open_param *param)
> -{
> -	param->sample =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
> -				     struct xe_oa_open_param *param)
> -{
> -	param->metric_set =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
> -				    struct xe_oa_open_param *param)
> -{
> -	int ret =3D decode_oa_format(oa, value, &param->oa_format);
> -
> -	if (ret) {
> -		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
> -		return ret;
> -	}
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
> -				      struct xe_oa_open_param *param)
> -{
> -#define OA_EXPONENT_MAX 31
> -
> -	if (value > OA_EXPONENT_MAX) {
> -		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONE=
NT_MAX);
> -		return -EINVAL;
> -	}
> -	param->period_exponent =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
> -				   struct xe_oa_open_param *param)
> -{
> -	param->disabled =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
> -					struct xe_oa_open_param *param)
> -{
> -	param->exec_queue_id =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> -					  struct xe_oa_open_param *param)
> -{
> -	param->engine_instance =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> -				struct xe_oa_open_param *param)
> -{
> -	param->no_preempt =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
> -			       struct xe_oa_open_param *param)
> -{
> -	param->num_syncs =3D value;
> -	return 0;
> -}
> -
> -static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
> -				struct xe_oa_open_param *param)
> -{
> -	param->syncs_user =3D u64_to_user_ptr(value);
> -	return 0;
> -}
> -
> -typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> -				     struct xe_oa_open_param *param);
> -static const xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {
> -	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] =3D xe_oa_set_prop_oa_unit_id,
> -	[DRM_XE_OA_PROPERTY_SAMPLE_OA] =3D xe_oa_set_prop_sample_oa,
> -	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] =3D xe_oa_set_prop_metric_set,
> -	[DRM_XE_OA_PROPERTY_OA_FORMAT] =3D xe_oa_set_prop_oa_format,
> -	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] =3D xe_oa_set_prop_oa_exponent,
> -	[DRM_XE_OA_PROPERTY_OA_DISABLED] =3D xe_oa_set_prop_disabled,
> -	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D xe_oa_set_prop_exec_queue_id,
> -	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D xe_oa_set_prop_engine_insta=
nce,
> -	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_no_preempt,
> -	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_num_syncs,
> -	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_syncs_user,
> -};
> -
> -static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> -				       struct xe_oa_open_param *param)
> -{
> -	u64 __user *address =3D u64_to_user_ptr(extension);
> -	struct drm_xe_ext_set_property ext;
> -	int err;
> -	u32 idx;
> -
> -	err =3D __copy_from_user(&ext, address, sizeof(ext));
> -	if (XE_IOCTL_DBG(oa->xe, err))
> -		return -EFAULT;
> -
> -	if (XE_IOCTL_DBG(oa->xe, ext.property >=3D ARRAY_SIZE(xe_oa_set_propert=
y_funcs)) ||
> -	    XE_IOCTL_DBG(oa->xe, ext.pad))
> -		return -EINVAL;
> -
> -	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_=
funcs));
> -	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
> -}
> -
> -typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
> -				       struct xe_oa_open_param *param);
> -static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] =3D {
> -	[DRM_XE_OA_EXTENSION_SET_PROPERTY] =3D xe_oa_user_ext_set_property,
> -};
> -
> -#define MAX_USER_EXTENSIONS	16
> -static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ex=
t_number,
> -				 struct xe_oa_open_param *param)
> -{
> -	u64 __user *address =3D u64_to_user_ptr(extension);
> -	struct drm_xe_user_extension ext;
> -	int err;
> -	u32 idx;
> -
> -	if (XE_IOCTL_DBG(oa->xe, ext_number >=3D MAX_USER_EXTENSIONS))
> -		return -E2BIG;
> -
> -	err =3D __copy_from_user(&ext, address, sizeof(ext));
> -	if (XE_IOCTL_DBG(oa->xe, err))
> -		return -EFAULT;
> -
> -	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
> -	    XE_IOCTL_DBG(oa->xe, ext.name >=3D ARRAY_SIZE(xe_oa_user_extension_=
funcs)))
> -		return -EINVAL;
> -
> -	idx =3D array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_fu=
ncs));
> -	err =3D xe_oa_user_extension_funcs[idx](oa, extension, param);
> -	if (XE_IOCTL_DBG(oa->xe, err))
> -		return err;
> -
> -	if (ext.next_extension)
> -		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, par=
am);
> -
> -	return 0;
> -}
> -
> -static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *=
param)
> -{
> -	int ret, num_syncs, num_ufence =3D 0;
> -
> -	if (param->num_syncs && !param->syncs_user) {
> -		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
> -		ret =3D -EINVAL;
> -		goto exit;
> -	}
> -
> -	if (param->num_syncs) {
> -		param->syncs =3D kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_=
KERNEL);
> -		if (!param->syncs) {
> -			ret =3D -ENOMEM;
> -			goto exit;
> -		}
> -	}
> -
> -	for (num_syncs =3D 0; num_syncs < param->num_syncs; num_syncs++) {
> -		ret =3D xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_sync=
s],
> -					  &param->syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC);
> -		if (ret)
> -			goto err_syncs;
> -
> -		if (xe_sync_is_ufence(&param->syncs[num_syncs]))
> -			num_ufence++;
> -	}
> -
> -	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
> -		ret =3D -EINVAL;
> -		goto err_syncs;
> -	}
> -
> -	return 0;
> -
> -err_syncs:
> -	while (num_syncs--)
> -		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
> -	kfree(param->syncs);
> -exit:
> -	return ret;
> -}
> -
>  /**
>   * xe_oa_stream_open_ioctl - Opens an OA stream
>   * @dev: @drm_device
> --=20
> 2.41.0
>=20
>=20
