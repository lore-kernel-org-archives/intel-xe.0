Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDD7FB5168
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BFD10E2BF;
	Mon,  6 Apr 2026 21:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlbOijvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4469F10E2BF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775512795; x=1807048795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tyty0XQDQYB+1tahv/ruLuDVC5Bct8lBrxLsMCuMebk=;
 b=nlbOijvAZgPQ5I+mNUK29Ql3y/JD/IPmjMPUfPjwNpr47UPNRYfOALlf
 dE3besV0T0tJdgNuDcPiS0zUcGQcVLvnNv1Vwgq4vrwQN5NIqQWH9e+6V
 Xb2DJdb74tMH+moeCyHb3sfUAAQHA1Y8T6O8jwX1Szmhipu8t7r0kxUM+
 pivVlLoNBYirQgaaKYpgJjm4JzynbWOFMms//sF6PmkrYM8YLaAiAOuSn
 rM6zYSRsqkN+fNjSH5YhSNncpHZgS26r8fpH4vns7aQ4PWZyhvU2Wi54x
 o+y/Z6FVc/XaETxtN4fxvFIuXoGSjGdUekHjuCDzfO0mPfjX53q1CIY8p A==;
X-CSE-ConnectionGUID: k5Js923xSK+eido5SvzXNQ==
X-CSE-MsgGUID: 1hTnURYiTRKbDXKfZbS2fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80059428"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80059428"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:59:54 -0700
X-CSE-ConnectionGUID: c7hK7qwJQFW9zshPYLB96g==
X-CSE-MsgGUID: 0qwG7OrpTrC//GLT1Rggwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251257577"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:59:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:59:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 14:59:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPadazEgMMdVwPQsXRt0QH0mgkPHFTKJF9KzVpxcRBi2KLFMAuZoGWtZUwDEcjVdyUZ4o2k42qopcHSHgIQw8CWBA1i5NWO4pApjYcYzy2+q4n0ML/xhfpquYaaeE+uONFGN+h5DpqutHzLIaBSIzMfb8ZL0bJDNzGXIa6mLcOX+n70pEGwvkCmaySrPHQQtwToXXM3D/few1PaRwKHZEJRrZPO6Al+KIRp2iEWzt/ip2NfSuUftBk4o+4PG7BWmxY9F6JrquzoCgBb5nif9wstoT/jG9jd+L5iJjZFHnhot/ttB+Odg8fgK4tHfNmgupCRHU7Zx9ZgRL+ClSeFg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCNG8wqGQ0BF/d0mYCYoRj0Zps3Lsro+EVI82FfhGY4=;
 b=OuD8YDiTgMQgUpnEJCjl1Xqs0canJq1awtJKP9Sc57UngTuRldc0emf+LjEiOSGOBd+IgCTyS2NTrTWelaKmIbt4tGGrGff7Dk/+Od9ARakQaDcX5p2eemcS0/fwf2/f+KtsgSIhOJdetTifBLpD/HMGb3FbfEx/e79stOm2VMiduYzklB3ba3TLaCYwNJoxBpgVX38zr+SkS75/UUrZvTb8WNx1oJ2yHvoKU1FqNG+t/3IF2iQKI4o3PjjDaNiCjR63a0x+CE/fBgNoZebs0Rk3DUNnYMfCjrL5xc6+qe8tRWJ5N6dNjytTakzmkubzvXlJ2GUO8EmKZatfyLjOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Mon, 6 Apr
 2026 21:59:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 21:59:50 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "John
 Harrison" <John.C.Harrison@Intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHcp3dr+FC/YiDdEUGM1N2PFRHsK7XSyUPA
Date: Mon, 6 Apr 2026 21:59:50 +0000
Message-ID: <DM4PR11MB54564F458C0E63579DE834E3EA5DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260226232648.675128-1-stuart.summers@intel.com>
In-Reply-To: <20260226232648.675128-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA0PR11MB7933:EE_
x-ms-office365-filtering-correlation-id: 7e7d35ff-d3fb-4de1-3b3f-08de9427d391
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: uN93DpJNtyujPbHIdEgxAFP/QTgszHIfBtcvLuG6QzgPilPVfpX3D9INBlVYxZXJTucUbRwsWj4E2sWcL9UbX/GRqNXQVQ7h9+jXUhCrwXCVv2h4ONT11EDBpTqTZN9ME1nXltVdH7PxQwF+SIhi9MpUL6yLToKW/sGQ1iJzUgt1mHTKeLzLEQ8Sl5fuqclZZFUM2Jjn1fFHPoHnmMarnU6noaNSgzhPdvud2X3LsAmZElF17GKIRUyTJMCkjx4OO8p4IEZANc362563Vbq5gCcIPpDBHaKtJA3xsJJBt6pLAyN2FFDPKm00CnLWpOLW+PQl5d2yyQBO3zsYF+WX6Np+QmnLrMjPejbU1vBPTtbyrDW62Xy6pgovt9mhitrvx/sObfXKIVJccrh/lUD0hMsUpj7Ev5Dd7bAIb43akEsd7h5fQJROF29QuYUzwdzZzpmuylDavJCRYDe6UbZl1p6jgnC37j/XUj4omlWIWhshHkm4I84Yo+ozl87qY2L0XGmw5gTXfTii2XHKyqOmfhzutjbNY/FsUn4ZcVy8d4bAxMMXaTr7TyFZszOrJl+4Di+XCbD4SCNPR6u9qc8kt8se+2rMCRScDWuUs1TCDPONrnXPRO8FO90XgSui49s5Zc9mEkJiGHr4vpg++4giLwFYnaR48OlKL3cQjoMpm3P9VGZvtFliE9clGY7jhxmbIT7HtUaDduq+T/FrPAotWrVuaBsGxKCLonTn+Hv2KlBdi0rSTYKzI3FPfmO7cfZqr2DUTBjxzltewT8P0ZmGqXux2Mo709g5tDtqYkwfC24=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YSZy8FtiftwCjq1ivcic8/0kzgbjeU0f1LIhKa8WbHHtxIpqGXTFyBNOU4t5?=
 =?us-ascii?Q?gst8lIFYi4i12vp930/YO33u9Xj3wsU6uj715IjKh80VWa2+xZzPRhJILnl1?=
 =?us-ascii?Q?u13VkNlvIC2H2lj+rm3stuuROJKtZ5et2ZbH0vGbRMkaJHO6gHtFsgMPtCLw?=
 =?us-ascii?Q?+Ku8P+WXHOebNpqjnZfrQj1+b9PJxV+1I6kLfDkwltI+HSH3cA24tAYizCnB?=
 =?us-ascii?Q?SfuOkrAn/EvW5lQtQm5Ea7t1KAjs4r3z25LAOIXYFUvR6Re1hA2e6knbI1qh?=
 =?us-ascii?Q?+3/upH4eG05HuZE6ZvUUYx1T2aAjLjUKjUup1Mya5UqMGHv3GdA4ggT7qt3J?=
 =?us-ascii?Q?ME68D8bm9n5SuGtwdOteVR8MF2/+bB3YWIdblxZjFCI/r+pyc9TMg5FWiAee?=
 =?us-ascii?Q?3uBB3PBgj9mpVmkH/LHU//4veLDPn/ZZtn5M6L73NDfyu0FsBfgbQOggHVDi?=
 =?us-ascii?Q?PMHbBoFhnz+nqr2kNkub4eu9nIJ+VC2kakRgKTLdpeTz/hCPzU6+grXq7uk9?=
 =?us-ascii?Q?A5nUROcJHldb6w+HG36Z8s8aDau1Cgs1B/tMzck80pxgZu4x1kibY8qxrSkH?=
 =?us-ascii?Q?Dw1jFk+rguo16+duRzM56ec8QFjkhYzlhytczjyiLZpqp3hiK9FMJYVT6Ksy?=
 =?us-ascii?Q?fbl1aYrCqiA6H1vcSxMYU0JKevsnPuB8NKB+jA9BYcFpxxvlG+/v8Ad4rE/K?=
 =?us-ascii?Q?BzpGQGDkjkrs2YtXZ57GFUt4FT2vN7AzwmMHfx2el7i+2tLEVdsXJyREiZeM?=
 =?us-ascii?Q?sPrn6/u2JjThv5bNTpaPv3HYYbhdgQQqLv2Qm4EwAwA8eZXMkG0n5bwhEfml?=
 =?us-ascii?Q?YjOgO520/r5aGOWI+aMXsEjrCfv4U4iYGQD7q5rfvsvXRYJa8m2saASMi2yh?=
 =?us-ascii?Q?Q4/qB9ZHqyVG+FEk6YH8x7jvD7qNRgVLzrCCezrXpfOqpibGEf3zGeY99IQY?=
 =?us-ascii?Q?Bx83z7geSjGVdupc7hwSpnhu/hmNkjEVg01A55cyhsFzqThxUlvpG2ijgpdZ?=
 =?us-ascii?Q?jdCAliC0Bqt3iP6FOKQLP2pkjPfV69nas20eSNoU0lcKQW3e0gLutD7j1Cks?=
 =?us-ascii?Q?w6iKsxufa+0OzaHRnpKfOz3mpSmfRg1BDPnx7SxVU6whdn6Th1etlTHrvUNq?=
 =?us-ascii?Q?75liJTrKqLw7Euye3HXX9obu/VXBztD0z/bc70MC84uyaKWRrTZfNCZVrr/q?=
 =?us-ascii?Q?KLVPxGP/myH5qHlE867e3Q1Qxqol/IGOcTAu7q8ile4PvYYeM14e3vh80Gct?=
 =?us-ascii?Q?8+3oaXB+Fcft0AUycMuJijY63fygiBmM0YYKEjXCCJWXzZxuuqZBXezJugU/?=
 =?us-ascii?Q?d9IXLO/TmCVVCAHLTFqGabOFppuxAqBrkRpLjIW4tlD5CIcR0DTB5v0ikjOF?=
 =?us-ascii?Q?/9G6tCF+wZPOinsoe0X6BJIzSujkU57rMIjQL3Pyn+ruMJlbBwE3BAiKbC/U?=
 =?us-ascii?Q?TTceM289ex6d0MrwwLtE3AztUcnkP1UkyLzbdKKXXRD1ew33gJi7wkW7m76n?=
 =?us-ascii?Q?aXAxv7SLyK9PXwYn4d46OO1WOQzTNucOlW/KGqSIBy/5pU60uMT1Y0R53LAs?=
 =?us-ascii?Q?z2j1M41jStet8s+ccV67Uf5XFu08ENHV/X4XBWzUULY4FhxLdDblprcZ+REw?=
 =?us-ascii?Q?KiK3a8yY/JUKqwDAFJbmiLtR8+Aikh0i8ju26KqIZFzAJ/b7Bjzsitir/nvE?=
 =?us-ascii?Q?llLo1bkHHcJm6RmENwrYFRNqTfkXazAS9CYC8bFeKFs9F7sdE3T6adF1Ug38?=
 =?us-ascii?Q?5d/HoDcWnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Tg+KyNiMCkct+BPr1ev0p9pafAg1mMNeN7zH7f79CG7PY79RAHbsB/92rPR4FcM2ZQUCoJX0POKEjYHdLdknLOiOTwDX5YwV62wudWM8OS42Dr7+50R6NUFSzH0+Kb8NXea3Csu+AEr4l7lGTACtPBI0k6TP8sC4QXvRglAoJZo2D/gDQX4M8cPxIiz/63FVR1SnysWgCaqpxU3V6mNLm7yRJgHBmG8nDtswIvPSWfFiQwgWiKv30e3nD3hfN77G42gGqhEv/QjoD5MLSHoiFUpWP7DKV18LtGL5HWS9Erp8NKyaNGxTWNJ/g6qYzAleaFNbrw/lykYeaqdQR+c5rA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7d35ff-d3fb-4de1-3b3f-08de9427d391
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 21:59:50.6697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W26SIxJWaqYep24smPraUTZ6EaKI3rsJbNwt/JXtk1ypbqz6mFAumy5nc6ONYH8aDmvw8wfxuxnGqbPuw5yVIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
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

On Thu, Feb 26, 2026 3:27 PM Stuart Summers wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> GuC provides the ability to gather logs through a hardware interface call=
ed
> NPK. For certain debugging scenarios this can be advantageous over gettin=
g
> logs from memory (or in addition to).
>=20
> Add a hook for this alternate debugging mode via a configfs. This transla=
tes
> into a parameter passed to GuC during load time.
>=20
> v2: Convert to configfs from modparam (Matt)
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Some nits below.
The code itself looks good to me. But I don't have NPK environment to verif=
y it.
Acked-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 60
> ++++++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_configfs.h
> |  5 +++  drivers/gpu/drm/xe/xe_defaults.h |  1 +
>  drivers/gpu/drm/xe/xe_guc.c      |  7 +++-
>  4 files changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 078dee985d24..e0c21328af75 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -83,6 +83,16 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * GuC log target:
> + * -------------

Nit: The underline must be at least as long as the header. So there should =
be 15 dashes (2 missed).

> + *
> + * Set the destination for the GuC log. 0 - memory only (default),
> + * 1 - NPK only, 2 - memory + NPK.

Nit: This line should end with "::" to introduce the code example. We could=
 add " Example to enable it:: " as other cases.=20

> + *
> + * 	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target

Nit: There is space + tab between "* 	#", and that space should be removed.

Shuicheng

> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Allowed GT types:
>   * -----------------
>   *
> @@ -256,6 +266,7 @@ struct xe_config_group_device {
>  	struct config_group sriov;
>=20
>  	struct xe_config_device {
> +		u8 guc_log_target;
>  		u64 gt_types_allowed;
>  		u64 engines_allowed;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> @@ -277,6 +288,7 @@ struct xe_config_group_device {  };
>=20
>  static const struct xe_config_device device_defaults =3D {
> +	.guc_log_target =3D XE_DEFAULT_GUC_LOG_TARGET,
>  	.gt_types_allowed =3D U64_MAX,
>  	.engines_allowed =3D U64_MAX,
>  	.survivability_mode =3D false,
> @@ -357,6 +369,37 @@ static bool is_bound(struct xe_config_group_device
> *dev)
>  	return ret;
>  }
>=20
> +static ssize_t guc_log_target_show(struct config_item *item, char
> +*page) {
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->guc_log_target); }
> +
> +static ssize_t guc_log_target_store(struct config_item *item, const
> +char *page, size_t len) {
> +	struct xe_config_group_device *dev =3D
> to_xe_config_group_device(item);
> +	u8 guc_log_target;
> +	int ret;
> +
> +	ret =3D kstrtou8(page, 0, &guc_log_target);
> +	if (ret)
> +		return ret;
> +
> +#define GUC_LOG_TARGET_MAX	2
> +	if (guc_log_target > GUC_LOG_TARGET_MAX)
> +		return -EINVAL;
> +#undef GUC_LOG_TARGET_MAX
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.guc_log_target =3D guc_log_target;
> +
> +	return len;
> +}
> +
>  static ssize_t survivability_mode_show(struct config_item *item, char *p=
age)
> {
>  	struct xe_config_device *dev =3D to_xe_config_device(item); @@ -814,6
> +857,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);  CONFIGFS_ATTR(,
> ctx_restore_post_bb);  CONFIGFS_ATTR(, enable_psmi);  CONFIGFS_ATTR(,
> engines_allowed);
> +CONFIGFS_ATTR(, guc_log_target);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>=20
> @@ -822,6 +866,7 @@ static struct configfs_attribute
> *xe_config_device_attrs[] =3D {
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> +	&attr_guc_log_target,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
>  	NULL,
> @@ -1094,6 +1139,7 @@ static void dump_custom_dev_config(struct
> pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>=20
> +	PRI_CUSTOM_ATTR("%d", guc_log_target);
>  	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> @@ -1146,6 +1192,20 @@ bool xe_configfs_get_survivability_mode(struct
> pci_dev *pdev)
>  	return mode;
>  }
>=20
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev) {
> +	struct xe_config_group_device *dev =3D
> find_xe_config_group_device(pdev);
> +	u8 target;
> +
> +	if (!dev)
> +		return device_defaults.guc_log_target;
> +
> +	target =3D dev->config.guc_log_target;
> +	config_group_put(&dev->group);
> +
> +	return target;
> +}
> +
>  static u64 get_gt_types_allowed(struct pci_dev *pdev)  {
>  	struct xe_config_group_device *dev =3D
> find_xe_config_group_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> b/drivers/gpu/drm/xe/xe_configfs.h
> index 07d62bf0c152..fb5cb7c57e75 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -19,6 +19,7 @@ int xe_configfs_init(void);  void xe_configfs_exit(void=
);
> void xe_configfs_check_device(struct pci_dev *pdev);  bool
> xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);  bool
> xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev); @@ -38,6
> +39,10 @@ static inline int xe_configfs_init(void) { return 0; }  static =
inline void
> xe_configfs_exit(void) { }  static inline void xe_configfs_check_device(s=
truct
> pci_dev *pdev) { }  static inline bool xe_configfs_get_survivability_mode=
(struct
> pci_dev *pdev) { return false; }
> +static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev) {
> +	return XE_DEFAULT_GUC_LOG_TARGET;
> +}
>  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> { return true; }  static inline bool xe_configfs_media_gt_allowed(struct =
pci_dev
> *pdev) { return true; }  static inline u64
> xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> b/drivers/gpu/drm/xe/xe_defaults.h
> index c8ae1d5f3d60..fbe670668a04 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -12,6 +12,7 @@
>  #else
>  #define XE_DEFAULT_GUC_LOG_LEVEL		1
>  #endif
> +#define XE_DEFAULT_GUC_LOG_TARGET		0
>=20
>  #define XE_DEFAULT_PROBE_DISPLAY
> 	IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #define XE_DEFAULT_VRAM_BAR_SIZE		0
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> 54d2fc780127..d98d5d051f1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>=20
>  static u32 guc_ctl_debug_flags(struct xe_guc *guc)  {
> +	struct pci_dev *pdev =3D to_pci_dev(guc_to_xe(guc)->drm.dev);
>  	u32 level =3D xe_guc_log_get_level(&guc->log);
>  	u32 flags =3D 0;
>=20
>  	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>  		flags |=3D GUC_LOG_DISABLED;
>  	else
> -		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY,
> GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY,
> +				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +
> +	flags |=3D FIELD_PREP(GUC_LOG_DESTINATION,
> +			    xe_configfs_get_guc_log_target(pdev));
>=20
>  	return flags;
>  }
> --
> 2.34.1

