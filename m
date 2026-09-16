Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2136EC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93F510E787;
	Wed, 16 Sep 2026 09:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr8apw7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A21B10E38C;
 Wed, 16 Sep 2026 09:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550980; x=1821086980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QOBzfDwV+8AxW8RrUjCm+i1IrJ1zY2G85ojr9jSCJ7Y=;
 b=Hr8apw7bZnPudB2nZdyXMzGPLwAhUZe93D66GBq7zwQkBXL9Vp+5Bh0F
 LoUSd0Vtaw5W/ADlbyxEDlb8uLtByBkotY8ApdStejzXTwxULZ4yDo2xe
 POylXNw1tArCnSzZvklIQZUUVBeY41cNPejb585oEm9r7v4tsxSYmtWb+
 bE8eX7aGVnbTXsLG1CW5yNccEsazslF0WTos9pD9meIO43roR+QYxQMZ+
 tbrOQslSNA4F/iL6GsmBdaofUFOHTyAM+DxCnN7w0SQxRuEXIj8NkQjvG
 Tnl/0roKJKFZ5JhzaHyt8PgCX56HT4yMlqgQVaxCB0SgD/KdfqGt2PY/Q A==;
X-CSE-ConnectionGUID: dJOn+2PWSX+OMeIzWhbelA==
X-CSE-MsgGUID: W992pY8LRrmo1PGL9tyNsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77485039"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77485039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:29:40 -0700
X-CSE-ConnectionGUID: d9/6SEunTSqWkb3pS0ESng==
X-CSE-MsgGUID: FG6GZegoR4eSCzqlujGlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311557408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:29:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:29:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:29:35 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBFw+IXAVzYiCV8706falHCFehyVS95Xzpl0ECIOCM5k+tSjMzTAwU8WXXrrChEG9xxmYc2bjtWJHvuu0tVmcoDDA9GaKIeMkKWGD55YnV5f+dMEIy5SEr7aF4iyyQ3GJy+3S2Ahafg58Wol6rlO7CVInQpok1XhnJUYrDmDl2GOr9MsEQnAHsZyb2Y8x4LKmJPEQkJaUTMEzkVE4CtimFEC3cPfD+4eh7tUGGyEh9ziGaS1dIdGY9BRAcRrTHaC3uv3Wu+sQtQlu2DaZ5K+0G87EZMKVLkehybvVPMTY48+N1vf1+hMlN07joPgcozZAep+/a66qdzqQeE27g+bkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKuZTBMrAeye98HroNWR79nBJjcj5fI2y2UrSw91QH0=;
 b=mC3USlMrGNePuEHCWrBLwVwxmbPbPR8QHaosvSZ6Kp0Rv3A2O0aqlqeInUTImUVgVxiU9uLwE+up/22bMn+NGBiuv2N8yayxs/hxlxQNvyxbydypXamE4KubFeoftwiwjZNDLZ5rkygcSfh703KpqYjeXyelP7MHTFC2tVzwpZEav1vS/Vxys/iIgb3Opn4eLFS2tB0hohbUXU5yaySgOyhVHNP+jkPwhuw0BKwy9nSRN30wKBZidNw/lIBDcza7Ir6KXhpExmOkeAlO/fcOS7JkIoOKdbbA2gZ7GvP0XybXG/7JhIUNK9XaAL248WneFQ2CSnL2QqDeOmcnTFRZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by EAYPR11MB9948.namprd11.prod.outlook.com
 (2603:10b6:303:2d2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:29:33 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:29:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 09/11] drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
Thread-Topic: [PATCH 09/11] drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
Thread-Index: AQHdRbaNYLIyXlvmSUaL06zbvm5ZhbbQ8DXg
Date: Wed, 16 Sep 2026 09:29:32 +0000
Message-ID: <DS4PPFE901A304FA4C3986AF2A668854792E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <26dfbd4d99f86c19efbff89613728ab967ec4f67.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <26dfbd4d99f86c19efbff89613728ab967ec4f67.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|EAYPR11MB9948:EE_
x-ms-office365-filtering-correlation-id: 38ac8a0d-e21b-4ac0-6bac-08df13d503f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|38070700021|10067099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: M8lzlF5fFG+4n6iGVLXw6spiw9qAbEW7SGypcBUl0kb7sX6reqSxJ2SS3oas3ZXskjNi5IHUIltGLrqTi13w3hGKgK4LzShwyS0aIA1oR8m0yKKpkrvZvDjjBY2a53hO3UzR7b53QlUgWX+cqAjC0zEW7gZfnW4GiNpm6qkj9Xz9E6W9Kz3KnxTBTW4cyypPXLYBCnb5JIqeZmeo5BodpRXed/R1ClQgmtnewiKOTJGIYWCPaW7lZGgI4Y7RoFz/qmRgtbZ6J9UbAgfLvWY0McHWNErTUCEQgD/GL64El0w66Trlcq/LGGNpgjkyn8BcJoQMZPhLu5+mWbs3j6lgoY9gcN11097PI/k3r9L8XaSdGh/+bDT8zOlYb3bKk4ipj2RAV6Prsax5nkEAaea/4VggpvGicURPY+YrxeqrXU5LEeDitS6J/eZLS/MgZEw4CuENxCk0Uk9FWDyugWj4JgiXht7cGTD3g/ndgZY6A+FIObOPo8w8MiIK+nnCDkwmUUEsl1gLdrUJKuL63LlQng1rLX0skP9OAXDznlZhpfNt+KOXDjzvExDXZ4iS8MsuZBea0ah4B3+P/vNUsEPi90fQvuSbOEr74b8SeFZYfVHcWx49RDj6/vfDnyyGs80l7thgcB7ybLg5Oem8zEphuv/YM5WSCjwGfdys3xKLULN3ThdnbPKq37wuRljo0gZ7rL+wRJJufAT1D15PA5BqV6c0JRsul6/3o8EG89dqC0k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wIMDJF0tueVbaoTCtDHLuk/rvsQkpx4ImWdw3sR2in7HbsznSMYiyU6tPVqp?=
 =?us-ascii?Q?DUV3nrr+iFpBI4hFKL/010anDwmZToSJ5GiD9nRs3ASZHBFeIL26MUtQLvWd?=
 =?us-ascii?Q?tC7buLzdgMu1MNIDxhLHDoutKM2oHiSm/GcTRdWFWNRvkHzBVffxs+jPZKYL?=
 =?us-ascii?Q?R+dW/JoDB+5jtuavwIBbDTjaydEdju6GIScwmykD6FXtm1k9qoj2Y8YVJEs9?=
 =?us-ascii?Q?CtTI3nHGy/t5eWQxQCK9n4xu4VBidd6BDYjGehcpWItIZYVlEupLcyuhCDvz?=
 =?us-ascii?Q?jvh+Njuc3nRU2zscl3FAgHd3pRdiBPWnqpx2m++7ZZCABYsyuoQHGOaqN0u8?=
 =?us-ascii?Q?VnijkiD1sfA91HoqXxtJDQNyVjVSw2AfTq11bIzJ3pdC/rNTuh6JjTb1do4w?=
 =?us-ascii?Q?922dVtjJpPw+mouq6K/linw8xlPKgst4rAeRWaJQcFhjkMVUTM+I6lkh6ZoA?=
 =?us-ascii?Q?hsNoYgdDZ7rK6GPqNE72MFsZHC3RhL5UOqAV/I8ENs8jptY2ki5oqkq5JpUo?=
 =?us-ascii?Q?hNR5pHBmZTEUSzpzP75JKv59jvPoMjZDGdEmrv3Tt27vaqAoEjJoZqR1atJb?=
 =?us-ascii?Q?gqwzqnvVlQJsH2Da1osU20t+s/l55Zzv13wheLRLQDpL2JiLWFP7zoZhUldM?=
 =?us-ascii?Q?PU8kaEwopDYO2z0rbdtgpLWnTALEG+ZqwBwo2E6mNLolD4elNF30DAyjJLfH?=
 =?us-ascii?Q?dDlJAopRdCCJjesT1VEqwFk4BNJ64HHvYZXRuCZkgOMwFptqG2TUwZHICrZo?=
 =?us-ascii?Q?8GKOptQfwrddRBUrnrmWmvjRXOwbELdOed0Ha5nglW0fcIwddfkBBUQTt0yl?=
 =?us-ascii?Q?14Yj8kWdp0TosGrN6m/3hc0w5aJ74Klk8aenXVMb+hpekHpMniJbFKYN6ex5?=
 =?us-ascii?Q?3YVnEUG+gzVvMafnuuqq/jPDUlXB9JwdyArOUYlkNMDk+wg/IMYY3XI5klnF?=
 =?us-ascii?Q?3J6rfAkftx7CcuN75kKREh51h2lUezx+sVDGgUCC0JXOgxOxt8XjsV4JRvSa?=
 =?us-ascii?Q?JveGObvU6qCTw6gyrc7fkQ/pONi05w9XDOSJiKQCOyHyXtnpA/fZW4F3XNp0?=
 =?us-ascii?Q?B9Nn4AkNYFeNzkrpCOoOz+DmZhLgHt7e/LPY0JUJ409pADn9TQYuf3argkem?=
 =?us-ascii?Q?UtksxSrqjBl73YP6wQ0FJ8/hVu6UnCbULW8vqbbSN8k3q6NbCcxe0/i7SkYo?=
 =?us-ascii?Q?9DEqkOBnMaDtuVDfs3TpR1xzbsWzEyGjWz2ypkVhHpP6pj5/SdtmUjcP+y7n?=
 =?us-ascii?Q?ikhLTXo8i+c/kfTNuX8uokewpTfENAneeWVSboK4f3pmbBvheYBlEcazyZre?=
 =?us-ascii?Q?zvtE8XEssp4uOQp+SiY/A+bFVX8VhPcWo1YjHgTAt0AH76liwIR9XCDNGR0b?=
 =?us-ascii?Q?af6cdyEueUf9bz+TKCQ/HSWWhhWIK9PN5+D0ZhuyjubHRenSbVCxYMNmMA7g?=
 =?us-ascii?Q?UsKKiWWQb4Sgrs2Vg6IirmpwgNZy0Fy+/+g33AnGMBeJTGj+acA8wpxByKPX?=
 =?us-ascii?Q?d1eBu+RpZ+9tacv6g26Y/lubzxnthJkrxkzE3AgjPr12roKGytqM+sXYOLYO?=
 =?us-ascii?Q?9nrDE0AjIDX7JNoRCSW5BO5+U29uojQR0N5meb1Wl+V0y79RiIC7w/ozf4PQ?=
 =?us-ascii?Q?GN8cP687OD9KoobjZ31Bl5Yb62m3UNl+Sr+7Zw6nGclCwjAb0+0ROATcA1H4?=
 =?us-ascii?Q?ZZKrwkb+jW5fQg3XfL6y3WFLzx8xnxkLMaW4G6BT6kN7oTYxmYMrGUgxuJnX?=
 =?us-ascii?Q?RDL0YE7gkQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Wz6fDJdS921RB+4xPWii/Ch6GQSbmAUR4dEewnDBwz6W+jDcsoPH4O5xbuIyTtWdo+Sz5Wa+3TdCAD3G2nFHmyWYuv6OfVRP5yxsumTNONWGpOhbH0v6Fc4H8xJQNHuhQfwEVqZh6VR1W0II1gK8+ndn3IRFlx221slOhfW9b3qagoeEYfLsBWtz8pSluUZ/DLcQ8ciWsh9fh3lAwkZP6wKxqlEZaOIJOFrT6cZW/Nyda7NKQ/ImbphG5os5zAR3l0TV9ivl0C0+81ImeDCSQc6QahWpheWC7IJ17qfJ8FAofhTOPzkOuWTXvl5TgOCIq5R1EZ24h8LAgfgHAQ9r5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ac8a0d-e21b-4ac0-6bac-08df13d503f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:29:32.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7XHV4cUbONyXsXBclq9ubQdmXzY/X401Mk/EDQI5TXoe3/LI/Aowz0iUDlU+Bb7fAMgmZcwEMaR46kh8YRx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9948
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

> Subject: [PATCH 09/11] drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc..87aea2a8ee69 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -2230,7 +2230,7 @@ bool intel_dp_mst_verify_dpcd_state(struct intel_dp
> *intel_dp)
>  	if (!intel_dp->is_mst)
>  		return true;
>=20
> -	ret =3D drm_dp_dpcd_readb(intel_dp->mst.mgr.aux, DP_MSTM_CTRL,
> &val);
> +	ret =3D drm_dp_dpcd_read_byte(intel_dp->mst.mgr.aux,
> DP_MSTM_CTRL,
> +&val);
>=20
>  	/* Adjust the expected register value for SST + SideBand. */
>  	if (ret < 0 || val !=3D (DP_MST_EN | DP_UP_REQ_EN |
> DP_UPSTREAM_IS_SRC)) {
> --
> 2.47.3

