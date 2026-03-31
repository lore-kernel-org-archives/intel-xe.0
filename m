Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B5FFF60D8
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 07:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9583910E8AC;
	Tue, 31 Mar 2026 07:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCnDG3XL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9A10E8AC
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774941955; x=1806477955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hmUMpOL8otMr29gBKQHVKwXuv+DOgB7aHcF4oYqRqa0=;
 b=JCnDG3XLGw7a3MbM/YQrtfDrXhmVSPGuQy4Kxatbz/KCQjE8pF23ZLVN
 iCm4p0sLeKSkg1EHFHKZalIj6DJo2c1m8YYaik4KGTCD4VUefoTZoMrve
 pV+Xwl+ylX+OqPWGEKnUDfFTG17KXSUqmEKHb9FTH/9fgr7fdiZjeM97x
 ppfejAVmXC2dUPpIqdTwANGH5D5ln98k+1v6VH+S8E6Z5Vr7eFFkQpM9K
 ua37FRdwb2Mx5sfOrzAzmW9kdJOnTzz+eZ7s7ahxDsruIQIyQcByaVlwh
 BfZsZJCaZdHjn9Etema99siI5zgnntPBZt5UAnXEZc/3J0b6Ek2iaJwP6 Q==;
X-CSE-ConnectionGUID: JCMFehz3RE+Zw4tR+5OJUA==
X-CSE-MsgGUID: 89RkLStNTum2lziPASsiQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="78538382"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="78538382"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:25:55 -0700
X-CSE-ConnectionGUID: wX6OKTddSzivFXAOB4n3/Q==
X-CSE-MsgGUID: RTzudxmuTFSNpOK0vc6TIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="225455652"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:25:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:25:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 00:25:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsjQeMz58CMDN9fOZXKNo9d7kAL4UsqympyXNmx2aV3aNo5hRlNWKcbEIatyIcjJ6eJ/5o2R5mgTe3jFBitoluLw64OCdCQzoatDXqMgDIBFA30Z00eoM6Fqm2rg+kcbFDx8ZwrjLKLn82lfzGH9BXwPZB+YvtRrEy//z/M4OKquwpnEY0uiI7lA0Qp7jngiO7yRXVo17L9kAiOWsyzo3ZQZ6uKcZVGmJiSN5dxIalGvw0yRPWWTbFoSWHL0SdNLjw0FOemH24Mu3d7qEsdC09MlhAMNoHXnWcPmqZF4rsy48KPeOit4EGNJO4k/dS7rWp8LPbvR/JG1i0KJo6cahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGjJvb4/8rRST44YCyL4JowQqNwMPAh1V+jWwLPhNiE=;
 b=V3xO5DOZBSq7B6F8vN+CmCQNy/4FwhL6bK8AKUKIA02bV9hs5mN9T5eLDYAjXglSevAEcm5y3Q7uDtFtuGhxiRJj2bAyiuXpbRNHnQ4fKRvGb+Es7WlNbjH/p911a/q3yMdDjhPo7+YBHJxwB5mwL5R00l7ALNlnlXWMRiwtqiKf7drUU4mhMViz9ZPx5SdViNBkJDxLImEH0JyABsefd4V1BqzuYU71eX1XAL5TWS3igXJWO+5W0LJ2d3EcU/MmjVhFQf1lKnYfxhISTKLJAlHGSlo5r4zGkvTJDrxBnc9LBGuvwKkuMnUD52Jw8lvtuv88AYpIunj/2UBna1FKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:25:52 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 07:25:51 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Add Wa_14026626235
Thread-Topic: [PATCH] drm/xe: Add Wa_14026626235
Thread-Index: AQHcvcC8YgxWIHepNUCfDW3VeF36WrXG3jsAgAFcIBA=
Date: Tue, 31 Mar 2026 07:25:51 +0000
Message-ID: <SA3PR11MB8118E1A1A191E04F122847CCD053A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260327080719.2136248-2-nitin.r.gote@intel.com>
 <SJ1PR11MB6204547CC4533FBEBA5319348152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204547CC4533FBEBA5319348152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SJ0PR11MB6574:EE_
x-ms-office365-filtering-correlation-id: e6b9ff12-4a83-4e1c-582c-08de8ef6bd1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: IO+zvvR/wZez6MCgi6uNb/JuBxG7OdZWP3OhRzoeLi7FAAe2vBX7nX5LFwNHECeZEOaEy/1rhghHOlu1OFpEROsF3nGcm4V1byIahKVe7qIu/NkGO0D9P9txuK/RucKgubaogBnl2aIeJ0+oMTaO9xHypKlagEO1SaBnsKwEWXTgBZnCTmHrTdmB3PrzEZgkDQY3zyxiZ42jaW4TCTcNwvkZjRDUf8AYwYNMVtpI+3HxkPY0sELkEXrm+ZuNKFuiVweMoE4Gt8o4l3XBWGHQuq9RXw185pdmXp+NCA9FvdN26OajgARzIeiTOTwJx+7QCSOB6aw+CUTsashoa7A7OjujKldw+8alWlJ9SKt40Vx28SXHngZAPeJzHPbnY3oQIVOsnmn4EQqcfnVuI2Mj1MfBS3gvWUWBanbsuP+OILekS1f102oBENLsTvhiuiyMrHuIa6+TN7SYGuoHK8zkrm84q4QdG0hfI6Cu1rtvgFidl4ntQHWQtJswt7+QWr2YMJOwqtvG3Rd8xVTaNNAu7N+5P0zeN0vkVd5BLr0/Qv2Txd8K6OlsYooZcIgkwregEHEnpAdNZ2LsCQddGMpjCEx52tALFgtATJFaKz3n+X8g2ZzzKIrWIkG+jMq7GYdPbBcTjXCGOPL3mT03jm7afFd7poHMQwINkG3TODdxObRdtQTlXCzxhWxR2aHCTlqxYOuO/hjGD4l/x1Zv1mg4eXilXTSMB+UMaM2ETgCP+qCuDzAEYAgPrcPAecr1as7K85vlbnCqc7vyaj5ZXgNLvLWsHOW2qBLiZTHQjWqN2pU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2kNgeJRD3ezigiCof1Du/MRLABlnb7BPdkmWTpzwd6T2oph3F+CUmjyTBtMX?=
 =?us-ascii?Q?m++OsjEwNQSMmCLUUhBkMidXOLA0RM6MoERkP8M/NBNflbdNpeB8RyJRyDSR?=
 =?us-ascii?Q?fe/LuOYlWKVc0vZvw/90aU92SBwKgV67cw9X/tG/bpk7CygVlcJ6z378bwbw?=
 =?us-ascii?Q?AV8Jnb2xEV665RHxh0GBASMs9xaY710EgWYgpF8zDOZEAqi/r9fGAEB8H11I?=
 =?us-ascii?Q?ANx+YImpC97X88KS6Rsp6Z3vu13Yv6R0lcICC+BhyaPZPPgiW0eY4Irowvrl?=
 =?us-ascii?Q?HYpnJSTDHNIbfZLgzQ17OGZX7/CrxUNOjG++RtWvWy4WTyRC47ABsi8lc59f?=
 =?us-ascii?Q?E3rSiw3kIn+ff8pKIn9URBDn0CHvjtPaeg+aLob88/FCDb8LhXeZGrpXL6Ft?=
 =?us-ascii?Q?EdGijIbqEDBON5Cg5BjTK64XA6qghnTjMVqMhNIQOE3u66A4h+KHd8hZ4gAt?=
 =?us-ascii?Q?WKTw2j6RBrUWuVI7WFXTg1D13YlA3lJjjQMSSFb9kX1tsHtF3HZvSJ0GAQn5?=
 =?us-ascii?Q?+Qxh/Xj7B+BN7H23xjBkoJ86DWBoQYh0fL3B122nCEv9FIb7fcsqae+yBDHJ?=
 =?us-ascii?Q?AHR7+jUuManc6MfOXnucdkzdo/tVsyJNkANhNJ1JxHWbmI72OGy9Wv1/Ou74?=
 =?us-ascii?Q?XwHmsMqNSvKdXjMrWjDAz06IB/3ymFrzwzKvUrtGLlByIZRqFqfKwhylH1gV?=
 =?us-ascii?Q?A4is+YYXwvCj71PFReT+wVTvK/Xa3i2n/SfoUHqPfKs0tgiYWMFrc9G8s78q?=
 =?us-ascii?Q?y+KsoQrghcXVDJ9+7FjUZe4h0YHF3trmyDUTlWn2vJrL7tCw+tPl/LFPUekP?=
 =?us-ascii?Q?fdOaBzQsYbHlkV+c4p8OluZTJk4Rh0WVnG4aNDm9f9+LH6UcU7v99u5xqaZ0?=
 =?us-ascii?Q?AeyXrHIG1ELOH35LVc/qvvOL0NA8yQxSFTlpA6/U+2jSNWKYAH0Bl+yO3SHR?=
 =?us-ascii?Q?l6pLO4lF/yv32CXCk7GMuJGKCGH1c9wce0MaYrs3YvGdUwv0TgwDDPevPo01?=
 =?us-ascii?Q?VveD8iEqFxveJEWBr0CFkg1P9UYXDETscceIkIWbN4tGWDLDP7xcYbf9Crux?=
 =?us-ascii?Q?LPOOhf1aCrvJkvThgG4URtUWj160my+lFFXGbM1kp2RqZuxEUWxQDgxKY4hM?=
 =?us-ascii?Q?gfscuBCKx6xP31NUICyoyRH69oxc9u201eQn91n6eucd9tq01dKDBmI8iQNt?=
 =?us-ascii?Q?ENslyIPytjR2Lwvb5ZkXqSZ70fld+tYgnj9YP8X6pdNZqsFz29q/SsmMkV+h?=
 =?us-ascii?Q?EAnIAFrXBh/TPdKDPn5O9S6urfSP1qRSXTG/VebIR5OB3iB1dHJ7IlExjcW5?=
 =?us-ascii?Q?5O3LeIGDVldQmtGeaHPzqgqBzGFT8D4raNxm3gFSNkSzuq5TPaiWIcSod5L9?=
 =?us-ascii?Q?3ybFvoCFzrNWLvV6aJwi3nzd49q+KwAv+MoDXJYm894ddG4K4xUnNk1YvzAC?=
 =?us-ascii?Q?uI6rBf2l5B6QxRYS07osd45/M1pD+3qYMc1lF4omn2S2xCTyo3xIC3eX7HrJ?=
 =?us-ascii?Q?J1a8O41BUgaNfSOl5wyHfNxFRcWy+kkQPm3UlIxjtjcuXERBQuz195MpyV9T?=
 =?us-ascii?Q?4eS6JTnUTeCfgMw5+lKiptPiQma+079apxsV9uUUrGzSvVxDYBYBUbWSAEcb?=
 =?us-ascii?Q?J8mtkhPEJFziu0kERf+XMuwcfqqDWTct8KD5q5mgNa53CNgKVKvQYUq95fFT?=
 =?us-ascii?Q?LwBKhi6AHgkKFTdTAtiLNYw7zjcUNDZEWRAiHLrLO7zQZxL+yWJOHXUKyudk?=
 =?us-ascii?Q?VplTjrv64w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vqp7/oTlhnVwjHu1tf7Uhgb3wQKZ2vxFdHU5d6rs3WHuuie8i4tvcu419UQ8Jbmugcn1ne+9AB0uqJ+REE0beWtEeGnTBYQRqGvYNgCgtooHnAzp5CwQpXxytP1Bbp5iOEjUc82TQlu+RikjEcDIx2diu/EUCwmYEJXkg9r9hWs7CZAe4NHCkVLbmI/OrIA7QhZP+7mUG0XwraLBKuPFq0ZAg15RNTRaaPHyx+C1q2zIT5vEkTYBKu9YLl4eTEupeiMB7HX8pdXR/bK6LWy3RhFJPLja2r+F/0pjC2JZ7WDZ4/FpX/C3gEpzdMOhFgWjFyY7t/qqQqH5dFKw8UeP9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b9ff12-4a83-4e1c-582c-08de8ef6bd1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 07:25:51.8342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2EMn3r9qHFsMiDv10ynMV7o+DgZNsdPg5L7Rm3Z0r+1wfpAxD0w9UC05cMzt5pLaZSjbuvUAttq/oX519+bGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Monday, March 30, 2026 3:36 PM
> To: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.or=
g
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: RE: [PATCH] drm/xe: Add Wa_14026626235
>=20
>=20
>=20
> > -----Original Message-----
> > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > Sent: 27 March 2026 13:37
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH] drm/xe: Add Wa_14026626235
> >
> > Wa_14026626235 requires two changes for graphics version 35.10:
> >
> > 1. Clear bit 6 (9th on state change mode) of PSS_CHICKEN (0x7044) via
> >    an LRC workaround applied per render context.
> >
> > 2. Disable preemption for the render engine by setting the GuC
> >    preemption timeout to 0. This prevents the HW from halting in the
> >    middle of a 3DPRIMITIVE command and inserting a flush.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c   | 8 ++++++++
> >  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
> >  4 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 4ebaa0888a43..db45d7908ebb 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -167,6 +167,7 @@
> >
> >  #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044,
> > XE_REG_OPTION_MASKED)
> >  #define   FLSH_IGNORES_PSD			REG_BIT(10)
> > +#define   PSS_CHICKEN_9TH_ON_STATE_CHANGE	REG_BIT(6)
>=20
> Name should match Symbol in spec!

Agree, I will update PSS_CHICKEN_9TH_ON_STATE_CHANGE name to STATE_9TH

>=20
> >  #define   FD_END_COLLECT			REG_BIT(5)
> >
> >  #define SC_INSTDONE				XE_REG(0x7100)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a145234f662b..d2bb574d422b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -12,6 +12,8 @@
> >
> >  #include <drm/drm_managed.h>
> >
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "abi/guc_actions_abi.h"
> >  #include "abi/guc_actions_slpc_abi.h"
> >  #include "abi/guc_klvs_abi.h"
> > @@ -44,6 +46,7 @@
> >  #include "xe_trace.h"
> >  #include "xe_uc_fw.h"
> >  #include "xe_vm.h"
> > +#include "xe_wa.h"
> >
> >  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
> >
> > @@ -531,6 +534,11 @@ static void init_policies(struct xe_guc *guc,
> > struct xe_exec_queue *q)
> >  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> >  		     !xe_exec_queue_is_multi_queue_secondary(q));
> >
> > +	/* Wa_14026626235: Disable preemption for render engine */
> > +	if (q->class =3D=3D XE_ENGINE_CLASS_RENDER &&
> > +	    XE_GT_WA(q->gt, 14026626235))
> > +		preempt_timeout_us =3D 0;
>=20
> I think      .set_preempt_timeout =3D guc_exec_queue_set_preempt_timeout,=
 also
> needs similar handling?

Thanks! You're right - guc_exec_queue_set_preempt_timeout() is the runtime =
setter called when userspace changes preemption timeout via DRM_IOCTL_XE_EX=
EC_QUEUE_SET_PROPERTY.=20
Without guarding it, userspace could bypass the WA by setting a non-zero pr=
eempt timeout after queue creation. I will add the same check in v2.

>=20
> > +
> >  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> >  		slpc_exec_queue_freq_req |=3D
> > SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 546296f0220b..fe9ca153b33d 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -789,6 +789,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> > DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> >  	},
> > +	{ XE_RTP_NAME("14026626235"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(3510),
> > ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(CLR(XEHP_PSS_CHICKEN,
> > PSS_CHICKEN_9TH_ON_STATE_CHANGE))
>=20
> It looks like default value of this bit is already 0.
>=20

Yes, the default is 0. However, the WA spec explicitly states "Do not set 9=
th on state change mode bit. PSS_CHICKEN[6] =3D=3D 0".=20
Adding the CLR ensures this bit stays cleared even if future code or anothe=
r WA inadvertently sets it.=20
This is defensive programming per the spec requirement - it makes the inten=
t explicit and prevents silent regressions.

Nitin

> Tejas
> > +	},
> >  };
> >
> >  static __maybe_unused const struct xe_rtp_entry oob_was[] =3D { diff
> > --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 80b54b195f20..3f2582568171 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -58,3 +58,4 @@
> >
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> > +14026626235	GRAPHICS_VERSION(3510)
> > --
> > 2.50.1

