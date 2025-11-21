Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0286DCFC50E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 22:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FAD10E90E;
	Fri, 21 Nov 2025 22:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeACpZ2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462910E90E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763764341; x=1795300341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kcINsGimwkbU65ii1n4LG+B58aqzo3rTwQh6kXSZgas=;
 b=WeACpZ2MlDEUUMoc7YFcT3efJdiN8ZEOth9iWhv9DGlPwFJK70V0KKHu
 I2YOULZsQmauOdmtx+oGvG+n0cPyJO/W0eSKzAd+aQUHZLy2KXgWhNqZ1
 74mGkpVPDP5qBcjl+OOOlw9UdUGfl0oa6q0iEIo2f543SfnFe0/Tp3e/Z
 Uxz9sakML+Rjz7qdOeRwdJpMjJYbj1+mMZI2J26B9hanzFp/51P/B5OZe
 AA7xj1EhLtwFDvhuvJmog6U+xvcyKc0BcOb7L3KM2/3rGhuBowrfZlthZ
 RZeDsbZollzMw4uTaSSHKfNLpJHe42OBBGcv+h3nfvI43wORWgIbIlRDp Q==;
X-CSE-ConnectionGUID: lBjRL+5iQNamduv4WHH31Q==
X-CSE-MsgGUID: LCEfAckiTT2FqWMyOFxmgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65815127"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65815127"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:32:21 -0800
X-CSE-ConnectionGUID: 565zt6z0S0SY0f90xwBDaw==
X-CSE-MsgGUID: D5p1UaV0TnCKaFjIt58K2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191837668"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:32:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:32:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 14:32:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:32:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHcOVSHwgpq3Sg/MrDBqtntJ94USvjn8eZOL8shtwftRrp/RhHoHkUtCNpoteAu8iv1pC2Jjj10viAjxyBrjUxwbRiokCLCHzkSDYT5XQyZ0xmg1D4nnOZ51hdwMXGWcFnIIbDZbtNVNXcDHkG8UzTAnyK4fgGRr7SJqCW71deVaoW6pqdQdMaTOPRoPBK51mKkk0o8MY+7Olvb8WSnl0aP0jMQUYL+8jMAFnPP9lKZwFAFbMXpKhrZqkmgQAXcAi9DV0hanuDUyc1lKSDhe69+0zqPlE8osKT85NYMBn6zgvpsLWTtDnqj3zVir3taVMmjbATfdsFJ7pKNhXsRG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoNgpskSSbMlYUJCmaro06euFDnQ/rQEO2Wpryb6ASc=;
 b=CvhQKoeFisn3ALs0zHHyquvWevYKRbScHF8vFjb7x+7Z1xJyCFwcMPqSRCb0Yalslen5iivbo1Q7wabetsJ+4eYhJw3ozSVG/hirptNHAJQFfArG7ZmiG1V6umARAK8fH6ll4JPzTI5TOfZ8J+PVpIx1RVvJ1JSSvBPfppg559VOKKLTu4RVtExmWjvTC5c21cCzvagtenPfH9ZWK3D56GbfW6w5rIdcRLvnkthOU4tw1r6I8uiT6AmMbGS+cdBWBfOOXwl9A/rkAlSWd3AxGdz9YETvlkzfglriEFVDyxuS2xVBI4GX03LlOKWwn/rQfVXMRTyaCoYmFlcCqnrApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH3PPF97652A3E1.namprd11.prod.outlook.com (2603:10b6:518:1::d3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 22:32:18 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 22:32:18 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Topic: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Index: AQHcWGqhr3m0z8QqpUKovZejwUhIvbT9t+xQ
Date: Fri, 21 Nov 2025 22:32:18 +0000
Message-ID: <DM4PR11MB54564110FDF041964B4411A8EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-12-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-12-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH3PPF97652A3E1:EE_
x-ms-office365-filtering-correlation-id: 7fc34754-af38-490a-af13-08de294dd488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?H0v5bbvocz6x39/BZwxNegKVgyX3QHsBH5WyNfGH4vx8g6XY7LF63ydQpUJH?=
 =?us-ascii?Q?ecIKplL+MR2vj8MuEB3T+Dsqg78962gjEPku8XamgUIVzy4Gk4B6H138PPYo?=
 =?us-ascii?Q?M+dWrHccedku2YSq5yREy/G8FBH/LigswDYGhekOgJVjbL8Zz8LrcdWpKHQB?=
 =?us-ascii?Q?Ifrgg/uwn6VSWSdPJNE9ak+OEJoJmz3TM1faiCCW4Zn19AO0KJA+mBz7gsli?=
 =?us-ascii?Q?okrmO+g+qKGSDVFh0hMD/gfk/G/BcuUuLNUxMTVhfsFs1YKrnemXI/uRVMn4?=
 =?us-ascii?Q?DNFkN9HDpDGrOEV+wWpFEGOy27SO5Hh0OKwsW8n18WfR9Ql/slYDlYk1NuOC?=
 =?us-ascii?Q?/hJ+ahu7BSJ2h36ewSjBob4IbRHpxO7ahi74BpOKCY+eidAd5QLxs4DAo6W7?=
 =?us-ascii?Q?2nR4I58EC88vBiZWBAiz07/B0ccNfBce82e0JOfU5UXAXp0/Tt6hloHWh6Wv?=
 =?us-ascii?Q?jAyep58rnPIhAMnn0PBjeEsRaZoN7Whknjq+kfM9GhEYAXKYUqOKe6UXSB/f?=
 =?us-ascii?Q?rqatkoE2p94m9zR8TAH/01bI33AKYciAxUgjG/CkZgxmpzOHxFuapu3lk5U1?=
 =?us-ascii?Q?Z3RqnLW4DQPw6rE7s+a2iOfZQaOARRoYOXmxnlEE2uKumn5Ljo4ldDkk/v26?=
 =?us-ascii?Q?h68NCFkNvX4DxmZpUbBNSUMKEw7y9Xje/ghNDMmdQ+xB6dWjHptQt4t/I0RV?=
 =?us-ascii?Q?NlJbbWGBp4gVenKP4hn3EfsYFzaPl/V8toSN60bBLoDsMs+NxgB9sxMVSdEm?=
 =?us-ascii?Q?1GglqbHNtNC7Jzdnj2IWPKAmB10pfxMOtLsSRwfS6X0RrMzOD7hEfnQUOU8c?=
 =?us-ascii?Q?CygzD1wu6L/KfMGR3RhFWiGyjV/V4VDL2dUVArAUkGQ1uptnEksMNj3uZRwa?=
 =?us-ascii?Q?b31yQaT4QjvrkM7ndGVcdDbxeJRMk2iZnG2K+Y0D5ScZwCc2sVCsaFsNa6ir?=
 =?us-ascii?Q?TR828k7vqUDIrJj1PGhJ7hS1cEN62PUNmfOntU+sWwVJnXVqFApRww0JujPM?=
 =?us-ascii?Q?40YytfUER6xyTpih16nj3XB26mobA2iAYhBvkinRZtAPT3HLimJFELrux34U?=
 =?us-ascii?Q?EufLXOGzm/cRjmvyXv743Al6zT/zhOVPhQDlwz9uaPIxDAtzeFiM5je3zfRL?=
 =?us-ascii?Q?y7sO+oCt+ADMMBL4hKMCGq/P0OFyxFdF+MS35sJ2ZQqE6aonF/hGnnWhbcds?=
 =?us-ascii?Q?0m4ENVInH7a/UT6CwrC5aSDnqS2wsDZyeC7e2v6h1LwpERAQCfN1QE0HCB4U?=
 =?us-ascii?Q?V5OXtCCBBXdhcV6E5OalRp3KdgqpsNx7X3UIAMwySgZuESt47v8SvWnkiPjK?=
 =?us-ascii?Q?80VpwnShA/n1/1rmLKaPIliceFVROJEccR0PbkaNV/lnkRTht4PuXxuXIEdo?=
 =?us-ascii?Q?CllJLdLE/0fKWvs5wwcfBByQNGq67j8XmnhPZEGdqi7uo/zGuQJf9nigVtrO?=
 =?us-ascii?Q?ym5rR0A/Yz2MIdtDGyRSlZyuv3TcSDCTzYTb0rjIrqtIc0mRtDGjQGyOfYDU?=
 =?us-ascii?Q?XUjLd4lFFdr4rIIUOoXQ8J+MDl0c97ejt9At?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07zKOjEcDhz4D0c+OIGMllvy9xgMZS6202MDl4UZYpVjBcBKoid954SH65ZF?=
 =?us-ascii?Q?9hTDIQeg+cw09Pyp3NIvct/xhLRaa/0l5FBCNbA2bLnu3zX1b56akn1PlCSD?=
 =?us-ascii?Q?rgFtU/7Fk+E9yAJFmTIUTMPAkZekf8FhmmZKmaEdkKNU/6sLQlLg2U2fhNAT?=
 =?us-ascii?Q?hzW63D5GrrGY4aSHeaWWh3Tm/xC3W2jUpuZm+9EpKrQzZa++hcf+ZXlOmqqD?=
 =?us-ascii?Q?n1RdgwhEwNqNfRrI+wgYp7vEr5+rL+nzDockOQ/yKYLpipPwwbTlX4SId/da?=
 =?us-ascii?Q?oXWNW0eeivhi6ilSjuAFH2nB6gBZ7NaPVM/DVIi90TU7Qe3dq092p8hCcWlS?=
 =?us-ascii?Q?cJj8kUSCqHeibl2dh9LnXGQ3Cpyz1T/61G1b7eZvv1IZuncBpqWnL7+68O9t?=
 =?us-ascii?Q?Xtiaxq+qgKPnlAkeMq7H/R1/QgDBuwe3PSlrwVgXCnUE07Kd5YAPx0qzjXJF?=
 =?us-ascii?Q?SMIji/T5m3c2bVQ3wZa7ZGZ/lzkxQIb3sKNwkDxBDQOD4ykAzAphnEvOig03?=
 =?us-ascii?Q?YRF1WdlMKtz0UTV9gTMDd8yKHuY+p8uuBSkRGUU3y5/zhAu88YNvZDtLfjT2?=
 =?us-ascii?Q?L9p1QMP9Kw3KyTxE/iUp0ywF0r95XxImg7GR+YyjgWCYPXEGZmCv2t8/yf+x?=
 =?us-ascii?Q?ZEH5FmFfSrEv5m5yfS90FpccslIAcMKQNb/gkHah89PKG22Nq39rVshlFfpV?=
 =?us-ascii?Q?VkJPbsSFOFsOHkjhtZc0GtFYChZ/LsKr44O2g/uwTfqtZx+phwnDkaET4gDw?=
 =?us-ascii?Q?ezkmfA/tySYWl3GcF92cPoaIttEc5FVR64ZZppEKkcWm/S1jNvzYQM/3/IJo?=
 =?us-ascii?Q?V0hOYiBVoAD2ySZWQAErTWXYz20YgM7XuVYvgwnOGu+JokvWpY31w/c1TyE9?=
 =?us-ascii?Q?dtvuEWul82qhUjEDygeh3rFz9qgFDBN7fEZ6eawpWgEGAmwpGaQ+MQ1SSxQI?=
 =?us-ascii?Q?TcNb2P8nlZWTLhGTdMv72R3Df6UWQWPK4zWqzv6zMskEWb4llWQspng2J7FD?=
 =?us-ascii?Q?Tksvifcj+Ok03l27giCNCpBbFeThEQnbpMM1P/AwXEG1gTH9T7m+cD270iqI?=
 =?us-ascii?Q?Jza7K/FY+Crzf06Hve7K2l33DN9bmxUwltKPpE3oGYp2WwZ4KjAGrdAsIiuG?=
 =?us-ascii?Q?C29crroWiXzehwU8YW1HqQW9nGPXnSV78xcolr8Tk89EhGHjlllG5AoGZvhW?=
 =?us-ascii?Q?+STUEQmA0UlyZ3Yrwt2G9IsCq1W+vH9pTQSVt0e4qp2kEXgjqWm0pviGZDk0?=
 =?us-ascii?Q?GIt8pkXdF2EAPAqFupd19aAhZw2/+4d7HQ8Eb7yOOiPlb6WixJCGYz1Qygft?=
 =?us-ascii?Q?jueGDRZtjxNwMzjQs7kTcW6fJhkWmnF//J8CUVFbqNdk2ptwyrbJW5r2tS6g?=
 =?us-ascii?Q?IFBA5BhC6Qxn+lvBwztJLAKGbLfkwko0VPYtv+ROagOwgpThYr1qIFJwY1ro?=
 =?us-ascii?Q?66BIOhGOqCoubASdZEzYExqvP+q5cfUkn4xSGAzvP6ER46y2i139OyU3Xxke?=
 =?us-ascii?Q?SUgI03Cu2PE8sesDjMk5TSrg4EyYE+EQqltmzLSpO00eFa5TpIZePInSCZIg?=
 =?us-ascii?Q?1/Iqgl+teKO2johtAWdLwxl8gR7vdnr80j7meLuM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc34754-af38-490a-af13-08de294dd488
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 22:32:18.7613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MINvslMxxMsWqrPs91B7e0+zPZqT9p4gxMzWhnWSABpc3gPWqP5LHLftuQubrFgwAssnYB0SgrouaPyk1zN91A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF97652A3E1
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

On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> Allow for runtime modification to page reclamation feature through debugf=
s
> configuration. This parameter will only take effect if the platform suppo=
rts the
> page reclamation feature by default.
>=20
> Move xe_match_desc to common header for debugfs access to read default
> device values of xe driver for current platform.
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 11 +-------
> drivers/gpu/drm/xe/xe_debugfs.c  | 47
> ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c   | 10 +++++++
>  drivers/gpu/drm/xe/xe_device.h   |  2 ++
>  4 files changed, 60 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 9f6251b1008b..efc6d0690b27 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -15,6 +15,7 @@
>=20
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
> +#include "xe_device.h"
>  #include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
> @@ -925,16 +926,6 @@ static const struct config_item_type
> xe_config_sriov_type =3D {
>  	.ct_attrs	=3D xe_config_sriov_attrs,
>  };
>=20
> -static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev) =
-{
> -	struct device_driver *driver =3D driver_find("xe", &pci_bus_type);
> -	struct pci_driver *drv =3D to_pci_driver(driver);
> -	const struct pci_device_id *ids =3D drv ? drv->id_table : NULL;
> -	const struct pci_device_id *found =3D pci_match_id(ids, pdev);
> -
> -	return found ? (const void *)found->driver_data : NULL;
> -}
> -
>  static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)  {
>  	struct pci_dev *physfn =3D pci_physfn(virtfn); diff --git
> a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e91da9589c5f..572c61ee1e29 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
>  #include "xe_mmio.h"
> +#include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_psmi.h"
>  #include "xe_pxp_debugfs.h"
> @@ -297,6 +298,49 @@ static const struct file_operations
> wedged_mode_fops =3D {
>  	.write =3D wedged_mode_set,
>  };
>=20
> +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *=
ubuf,
> +					   size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe-
> >info.has_page_reclaim_hw_assist);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> +
> +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __u=
ser
> *ubuf,
> +					  size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +	const struct xe_device_desc *desc =3D xe_match_desc(pdev);
> +	unsigned int val;
> +	ssize_t ret;
> +
> +	ret =3D kstrtouint_from_user(ubuf, size, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * Don't modify if page reclamation support isn't normally
> +	 * supported by the HW.
> +	 */

Nit:
/** is reserved for kernel-doc comment. So it should be /* here for normal =
comment.
How about "Don't modify it if page reclamation isn't supported by the hardw=
are."?

Other code LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> +
> +	if (!desc || !desc->has_page_reclaim_hw_assist)
> +		return -ENODEV;
> +
> +	xe->info.has_page_reclaim_hw_assist =3D !!val;
> +
> +	return size;
> +}
> +
> +static const struct file_operations page_reclaim_hw_assist_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D page_reclaim_hw_assist_show,
> +	.write =3D page_reclaim_hw_assist_set,
> +};
> +
>  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user
> *ubuf,
>  					    size_t size, loff_t *pos)
>  {
> @@ -403,6 +447,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("disable_late_binding", 0600, root, xe,
>  			    &disable_late_binding_fops);
>=20
> +	debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> +			    &page_reclaim_hw_assist_fops);
> +
>  	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1;
> ++mem_type) {
>  		man =3D ttm_manager_type(bdev, mem_type);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index c7d373c70f0f..16afddc5e35e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1295,3 +1295,13 @@ void xe_device_declare_wedged(struct xe_device
> *xe)
>  		drm_dev_wedged_event(&xe->drm, xe->wedged.method,
> NULL);
>  	}
>  }
> +
> +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev) {
> +	struct device_driver *driver =3D driver_find("xe", &pci_bus_type);
> +	struct pci_driver *drv =3D to_pci_driver(driver);
> +	const struct pci_device_id *ids =3D drv ? drv->id_table : NULL;
> +	const struct pci_device_id *found =3D pci_match_id(ids, pdev);
> +
> +	return found ? (const void *)found->driver_data : NULL; }
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 32cc6323b7f6..a66e8e4b3e01
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -193,6 +193,8 @@ void xe_device_declare_wedged(struct xe_device
> *xe);  struct xe_file *xe_file_get(struct xe_file *xef);  void xe_file_pu=
t(struct
> xe_file *xef);
>=20
> +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev);
> +
>  int xe_is_injection_active(void);
>=20
>  /*
> --
> 2.51.2

