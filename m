Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE319CEE33B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888E710E7C3;
	Wed,  9 Oct 2024 18:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USGGS00d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8011510E7C3
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728498334; x=1760034334;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UzMOriTWOVFkRsrM18Ewfade8/eYp3CSWxClfHF7TiY=;
 b=USGGS00d/cPIVIpSzKYOIc3IkKzKXpgh0QPDKto1cK+lGr7UuS/AR/2V
 SuEwSK3W5ZhgpeKqizNCbqXGE2LJ4oPtLnokDf2f+ylua54fgFlOvLKaG
 uiDKT8MI+1YyFy3VT/vFoi+K8wwRMpD3cKZcuzTKCy8GHZTpti4GcjWqV
 TPAyRnozySmzxGkaiOFEMM3vdsNCUtoZVIvvzNP/gNui1GC5NKNYrukZ4
 /WQ/xkhu40PAQI8g31jIGiUrLsXh9WEOwvYgTwpEUwApLWfuw9Iil44dE
 hpdwVSmKjaWAN8qghm1cehROX9U/n4HsWKMQRdMQpBoAPRwZPd35YgxJN Q==;
X-CSE-ConnectionGUID: FqsnsQ0lSqGLKd9uAUdblg==
X-CSE-MsgGUID: G5Wc7tfhTY6cEpgszXN7Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39213223"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="39213223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:25:33 -0700
X-CSE-ConnectionGUID: 6EHSArGPQTOU3r+v66Rfpg==
X-CSE-MsgGUID: IRyAyWzkSQSjPe8Fcm8uCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="80850908"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 11:25:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:25:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 11:25:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 11:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYjPEGwZhB49hz5CpDzkMF3MTBT2wHaMokQdTiWhHBce73YTLdls2qkfvL+5qFBP5oCqbthQin0irQ2iDbdJaR4q+90KH3zjlIDsYsx8LaQnUUUj++n/AxnVled2KZIhqDP88mSXV7I3ukTmWFJKSM3GmzKmknSXd3vP/t0S7aIs2wV7c5of1pyrtZt5fNHNRh1/jwdyNvA0F4iNEgxN4+iXSap98XhW0JZd2Zxl3NRwWgAq9szB5gKtQ6HfaaA4rsB/Q1f9iSeEsduuJC7maza4mwwr3c3GcmBKcFWkIv6IE8xWilYNYPfvqowlg2oqbOV4kgBc31Kn7fzgcs8ofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y6ymNChXNNQO+Pjc2M+MxdHYbe5vQ4XK0rI2onHFdU=;
 b=hRTe0ZetjBqXCRK86+faXJI8vTHCq+g7NQjlPXZNK28VdcuSVN/d8ia1J8W4Oz2EvFGlSqogDMg8mo4UTTCzqYcSkmNXtFMXUhIHZi7hAUD6vLUOyKLBOUS0mlQzxKF3wYGH27FEIynA7AtRDiNe3Y6ApzrCHcvsBdejulkOhGQhGK/8ZDRM1jKsDg7dkxLo47RVqwJsirdCsWIAyldTkGwY92OqY6DOh1Q9DxKLKiNNMXlH0wd7sN2Lp/H7l/xNo/HSr1+Eogv/wZZ4Fuir3wy+EX9lYRIHZh/lV8rO1etMslGpz5t2kaXu37YNAcayvEM37iiVIfe9btpEP8rOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 18:25:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 18:25:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Thread-Topic: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Thread-Index: AQHbGnSdwgIWrU9VJEmmiVgJOThVIrJ+uSwA
Date: Wed, 9 Oct 2024 18:25:24 +0000
Message-ID: <CH0PR11MB54446D79A14BA487F8A5FDAFE57F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241009172208.706894-1-shuicheng.lin@intel.com>
In-Reply-To: <20241009172208.706894-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7402:EE_
x-ms-office365-filtering-correlation-id: f2695ccf-7ada-4fdb-21aa-08dce88fbde4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9Ie1Tj3yk8XBAXnW3UNWbCMnd/EFNflPcUxJvmcSji/g9OK8pdW11t362K0E?=
 =?us-ascii?Q?+JblnQX6fPFGwzRK9e0g67EncLG1A/XkSEiXIbr1nVHNjOEvRhMdR2I883Dr?=
 =?us-ascii?Q?B5Amq8lG87wEbNkA9yP4of4hHU7lUQjU+8vnOK8XA2Yu3nCuA7ZtMZzMv3u6?=
 =?us-ascii?Q?t4OTEP93zTyin65Aoqm8ZdQot08Vrk9Kgg9GlR4zfwZs3Sd3ZL0MZEZfkKD2?=
 =?us-ascii?Q?4BiP7IyaI1yfJdxKmnKmCzHrmIup46lbaDpNL9JHtXND4ofQZfoWB2/LOUHX?=
 =?us-ascii?Q?1g9WpG9j3EdNdU9cvNZd78cSOxPbYZGSW0n+heksZtKaEK57V4aPndq7XPxM?=
 =?us-ascii?Q?pDcCi05saVKdHPJMK1R6oViX5qBkvqdLGsmyr3bUy2/XUSVjioF1JU93GrWq?=
 =?us-ascii?Q?ukw4NYodFbHPWQOfRObK+qEFVjdh6np8K7mWgO+xh8MPyN+5dIu40dPytyj6?=
 =?us-ascii?Q?7t6j0yKXTK9hNtVP6d8x1R27/t4Xu7bQOyjeJ77ux4H5h4JrNNylgAmiTdMm?=
 =?us-ascii?Q?y8RbLapcmEbS86VJc+F8eqhXpejYbOaikiuU9OAtghl2bQwEv/bX9qdyth3I?=
 =?us-ascii?Q?0MgeH9ZrqD50eUYKbANqjCs/38QrQnMLODzBHVwmpAOeGho/zZ5/FQijb2w+?=
 =?us-ascii?Q?f/nYdwNgRjBCVsNG6F6sZT+BLwDCg3o84pDhlytPx4TdNY1HYt8iBrTmljwH?=
 =?us-ascii?Q?DbmhgFbecdJJUqOALhUZjcOBFZhA6gE7mGttkYs0B/S5nWmAm+kW83XzVa4I?=
 =?us-ascii?Q?C/B8NHzEF/cEp/NSx7oYsqW03eaf7O83BvJnwVA6rtGcAhV8m7zjMa5CpZb3?=
 =?us-ascii?Q?RLPi9V9hy1ANKXmpxZvEr9BkPWS4CyG+PqqI2Hlyllmjoahs6LL3Qu+ruq6C?=
 =?us-ascii?Q?1eZ060/Z6eOy1+X5oAR6EckBgFaMc6Q9xLW2SntEXlF08PYrfx4YFmH8TVf0?=
 =?us-ascii?Q?vwndYUS41/kjFBmw3Dp3ivrkZ/YSpEjF7+WpSmYO8PD66IM6YwuH8e1mBRH6?=
 =?us-ascii?Q?3Etw6518WrlU/pnq8kddztwFXPcAD8zkngLkzZSfYZ8HDvNPztKqAQoR7WYL?=
 =?us-ascii?Q?cm0MT9h+68hxwYgvltf+m0wssvv7pqJRoJ7ktQPK6T6z5llmCv7jschNi7G0?=
 =?us-ascii?Q?HIlb3r4dyMLcvBrIw3Py5JbN6O6IRv2SRqMNGCXAQnIyphCxoc13BdUF1nWb?=
 =?us-ascii?Q?Jff5KagsGtB7QRZbJ3OCZJUcinvyl8EAeBm/0zX6wa2hfcZDI9sKuGXcWFqI?=
 =?us-ascii?Q?/4YwLr+p77zouQnsXh7z9ud5jLcRaV1bZnqehkbfQJUFB816UWVsY2NqQouU?=
 =?us-ascii?Q?gw1dBLTT7G4rf4M5OreDwjMEP0+EH6mioLK/j2vpcUXqmw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f9tfOzuQln10P2KdVZBsmzJlSyFuqW02nw8T68phlNYkhHynupH3Mj27gEtH?=
 =?us-ascii?Q?bP2WbMYJYbqFTMhXID4Cc4tHAx0SrWHr5BoI54onN8Hf2KXRq6a3I+PNnRH/?=
 =?us-ascii?Q?ik3G4NVkKh1KRJ2sXzSdqcFfhEFc5uTJqISyNDMED5ZpZnEtT5kXYl2t78xu?=
 =?us-ascii?Q?Pj8hkeOi35bfvqp9Xl4hQND+jU97owlojv2mDGkkK6DXPGiUMUI1yAwrZNkW?=
 =?us-ascii?Q?VYzHmKYAmMNCXmocfXDzp4M9IrMoX9LN6EjdxeZGbjKxH/rBcku2tY2MMqBS?=
 =?us-ascii?Q?t5jXgUsgRP306Jcxx0GAOY8MyHMxcpm2XE76RPo90GCFtvJppMPBpPfDVoek?=
 =?us-ascii?Q?d5PjR19mOm10JK2phzH3bSa433RVh2cGFSVlsp6sW6S/hxyk2KsugjnF0odB?=
 =?us-ascii?Q?sUMhbymRIMSvp+DsPso8Cj6ocjtoPo9Avn9rArJ8jR2l9uJ5DDAxlHKRxzLT?=
 =?us-ascii?Q?x/p0MQD4lwkdM0IfQiDQCfQGjdhrtY2hVKC+w/tFbx/qLQ6y3UGj+rRozpbF?=
 =?us-ascii?Q?+1nCUTN3Ubfj1bglkBFnL6GOv0vwtZmIY8QNk3TRLJ7jZt2FGJKd/17vYb+k?=
 =?us-ascii?Q?Uu01Mbb/EA3UBoYiC9JZPZ6N0x/d0ninjDUGFRxghhDUza0X6x0F7DCnTlvI?=
 =?us-ascii?Q?ryudBF2lAAkLD8pGc2MXWzKi0/vbVxIZzT6S0EfLlvdNV+BIRtqTZV7ZaWTK?=
 =?us-ascii?Q?LT54LEkIAsLrdDs7UUOdR8oEWAOQqsoMJaUrjsyN8iM9hEh0E5MUguFUu+eL?=
 =?us-ascii?Q?yKcRBCh7ZbB9lT7i6uiA+6MSBD6TngHpaHy1S56sPClbdcDIOAkZ7emOUAHb?=
 =?us-ascii?Q?68Wfb/LghWInT4fc5WapY+5k9hgdwckEz0fsfdx9ugtFUtEpSewhvPz7dJ8D?=
 =?us-ascii?Q?hGhIJtiiWxQX1q/qo1NoSi2aW1aXsf2UgqE6Kvm4r4RSQkkX8qr4wIhcyWWz?=
 =?us-ascii?Q?WlhIwnO24xONT6Q7jNomiND/6iNLPPW3JCQGQrBGqN03dx/ffwgnNfkHGkOp?=
 =?us-ascii?Q?lN5R45DGmfpOwpBFZFYQQhIfI/Aic3Vy1Fa5lBxx7MCyoeF+wOgKv4e7HZ7W?=
 =?us-ascii?Q?usV2zdNOULN1DnqoEFY3ZRtUzcqUuIYR0KWKFccxI8+H6a/ww2d16OSL923Y?=
 =?us-ascii?Q?f4TPdAFdEfMAs8FGMu4uyRQZ+Me1RNb846pLwhSfp1xxxRfN0o3UGTcFoSzp?=
 =?us-ascii?Q?WTkX+VPEmPQJfckWK834N46dLBudl/wPnDeZXI15SDhZXJUJU96n2RMPasse?=
 =?us-ascii?Q?GoqpwLUKALdB1o3HqmvTpckd3o8TnxbiuNDiVDRypEosH6IPFzUh9ol2Vl5q?=
 =?us-ascii?Q?1QxdxcEt6elIw8VMiaVc53yFnBPlPOnUcxm5aNf0RYP7xnwXCIfpVce1EJ6l?=
 =?us-ascii?Q?ll5/dKJG8tiL/N0KEwzcJ0lp9GTFrer7VqfFFsdwHp4tH6mr0WWUb6ohLy7Z?=
 =?us-ascii?Q?F7D5E8EI+bHIA5vDAdL3Fng0tpz6tom6Ue1GW0LH7DAal778q/ocbrKr37kK?=
 =?us-ascii?Q?exivneMVozCs+xK+vubRSQo22OKkCVuqe59p1oQ8Aq2U3Kd7to+Q/+mb8ppK?=
 =?us-ascii?Q?X+khh9joV+g1l2u1zdMr0MFiRVVZJdYwmmnoLmAyjkv6Gmu0Lxv5RkGRR7Io?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2695ccf-7ada-4fdb-21aa-08dce88fbde4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 18:25:24.3461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKOlyU0Vj8Y3l7po/k3qaOTYcc23cooDijjxiYLDTsAkVHyT/BtVw5ty/m5pZD94/3kEi9/qQ1w54kwbo9GLyvBW4KSYVdA+yqMLi/XB+3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shuich=
eng Lin
Sent: Wednesday, October 9, 2024 10:22 AM
To: intel-xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>;=
 Das, Nirmoy <nirmoy.das@intel.com>
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
>=20
> There is error message like below during stress test.
> "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation tim=
eout"
> And change the timeout value from 150 to 500, could help avoid
> this error message in the stress test.
> xe_mmio_wait32() is implemented as wait 10us at beginning, then
> double the wait value as next wait until the timeout value is
> reached. So for the normal case, the real wait time is not changed.
> The larger timeout value should take effect for the bad case only.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

This looks good, though maybe the commit message could use some work.
Something like:

"""
There are error messages like below that are occurring during stress testin=
g:
"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeo=
ut"
Changing the timeout value from 150 to 500 could help avoid these error
messages in the stress tests.

Due to the way xe_mmio_wait32 is implemented, the timeout is able to
expire early when the register matches the expected value due to the wait
increments starting small.  So, the larger timeout value should have no
effect during normal use cases.
"""

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index cd241a8e1838..60aebf7561ec 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	spin_lock(&gt->global_invl_lock);
>  	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
> =20
> -	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, tr=
ue))
> +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, tr=
ue))
>  		xe_gt_err_once(gt, "Global invalidation timeout\n");
>  	spin_unlock(&gt->global_invl_lock);
> =20
> --=20
> 2.25.1
>=20
>=20
