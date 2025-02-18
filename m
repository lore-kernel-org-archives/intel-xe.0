Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497AC021AD
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 20:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F82D10E0FD;
	Tue, 18 Feb 2025 20:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPP7mYqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95610E0FD
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739911051; x=1771447051;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UzKOqZ5u5+XzHnpF5caeXEimQyIq6w4NiIfVL5d0sCg=;
 b=DPP7mYqp60zutChX3sM0bu5ZUtrlhVeb5ILmNcswvAVVbHK8Nj/KOmsL
 eisCJeCb7MBLwuCM+07S8DTtixtChgqGglzB3HZspVt2QSinvPd0fcIkB
 CuU41DMKB2v7qMsdG82EVhTgPaxJpYr7Ek50ixBSstGlQxMfGt42N4Yy/
 9T890Qyh0GkSodo/cHGGDKFHdTCi4aaBNBf2cvBaFQGyIcWaVLeVaR4pm
 tj9HL95Qu5Kj1U//5iI+OY83n6oOgA1CNTRQPwNySMoS41bC7Xz/EdLzF
 Hr9rSDoKsE2wTaZWFw/P3anU3O5NmXxZQS7d3fU9yzDXjIv1f5WzhY/QT Q==;
X-CSE-ConnectionGUID: w8vdLpn2QeSR8MD1pHrvfw==
X-CSE-MsgGUID: atep6HK8RhmYEun8AL857w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43458386"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="43458386"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:37:30 -0800
X-CSE-ConnectionGUID: ne2+l0E5QnqMQ6PCrHjVOw==
X-CSE-MsgGUID: pIosW5PyTluMN+vZgNMZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114364328"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:37:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 12:37:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 12:37:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 12:37:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN+3NJe9ZQjuW/Um2UcBkrYxb1nx4m4DC1YFkYxlKtlKMJijlcTpZriiDJNJzh0fmbLYZk9rx1ugSP/KurJA4D51GtSUj2PGklkjeGvDzMTVYkevOEaZt/0JVea7p8Zq9ICu4dYbu+Bd9ZX1lJDjFmH4S5HJA69L2z//0MWMQPmd4ggN0fca15fb9E5Lfd58orgpt0TX9U/vGljVJ3Mi1L4/cS1WE66Vu82RgNUGAmaXWRxsANYfkCFic9/pY2iNwfi+K0QkyGUWZyOprcg51CBSwNaxYnzkzrGT1rnWlt0dsy6XkBi4X0A3uy9Gyv5fxT0x5IO+wF5Hq2kpYfoLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyVohbvS+USNN6DtS0t3sP5a/Nai2nQ1gwuD36ukLUE=;
 b=QdFQPob5D+Jy54loO+fenV3SInwY20b0ee1cwatXJJIg4/8yrvUd6M8qaGcGuTwECxOMNv+AAlN8STNk0YRh4SV12PivG/7jEqljAaMinzTe2dOG3BGIlYglceGv3gYd1XG0m5rzCASJkZBGb5jpHIPDh3/NFt52j+/mt0pkDna80oJ8/Jm7clUqc1rJkdC7N9JnTRCRxRm//FR7Sh45cpXYGP5JxWz/Qw2uApU78XBhYyutUasodnfUW7OwiIEBC2qQs5XUiA9tPJ/+i8NTIlFPSOyVNnc3HH5AM7Bi/eOFDHpvvmg2WVDh4NJlfZ1kcWbnwpMhXpNNuqee9xGnXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB7178.namprd11.prod.outlook.com (2603:10b6:610:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 20:37:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 20:37:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Drop unnecessary GT lookup in
 xe_exec_queue_create_ioctl()
Thread-Topic: [PATCH] drm/xe: Drop unnecessary GT lookup in
 xe_exec_queue_create_ioctl()
Thread-Index: AQHbgkB6cg5oWvEd8UOR+2XvupDvT7NNhFXQ
Date: Tue, 18 Feb 2025 20:37:23 +0000
Message-ID: <CH0PR11MB5444BDC3651A8902118A0600E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250218200511.4050060-2-matthew.d.roper@intel.com>
In-Reply-To: <20250218200511.4050060-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB7178:EE_
x-ms-office365-filtering-correlation-id: d72089d6-cacd-4ced-295e-08dd505c0c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qJYhlR6/KkTceDjFGWvD6GjIl472tO9ZNbM7LtkbXigIQv9kEj56qU8OiWd+?=
 =?us-ascii?Q?yKyp++z0ju3y69Yug6wy624VSjTeXKzypHFfSsZ5JK8XsjtrI8MqPEd4K4RI?=
 =?us-ascii?Q?zRab5HTi963PXF0RyFKg1VNAdhQsDZSY7ALMVWbH7tKgrUSEh2HsnWpnbex8?=
 =?us-ascii?Q?tFK7bi9w6pBJ4F1eCspUAXjhc0wTxkVb7iqichUQEMElT0Ita/2wM9sGgGFC?=
 =?us-ascii?Q?ViArGgdnzPZ2Myf54JyZNagC5udL6y8etUhq1bYChhJOznNqpLhOUAj8gpSh?=
 =?us-ascii?Q?rXfz3ledzkAM0UUKQEFNRl+iYDMOwZNjApXMWS6Ybb5R9Hez6tOrHK5ERjrU?=
 =?us-ascii?Q?2wTFopDezxAMHfNjaERPkBU36lA3nLWNgeJ7dHPuVhFrhHGS9LRet9xFmMJs?=
 =?us-ascii?Q?a3iVzjK/YcQrPGhUvHy3aJB4YM+O6bt8S7tYMYzpoOHW3FRURD1oFM8jGZcc?=
 =?us-ascii?Q?ypoPg8bnXwVVT0FPOh9zRk/pTA/UkQ40Fk7icT5OYNdZrbevv7kCxK5x8E2x?=
 =?us-ascii?Q?bBd6ntz49gHTYiLtpCwldBtZZerhxB5VWPNkvM3VSYSZED2ZJGED9kRQWuOz?=
 =?us-ascii?Q?K9QDK0DpvPLVfo9osP6cRCvhJDKvt0aUZ0VxuK9ilOgQ5rhMZ5uEhydO9Opc?=
 =?us-ascii?Q?P7clY44C30dNtHXMNGvHq44bV/FPLJzGN24YtvpvGzjXujzm/MYF4dVkAEkS?=
 =?us-ascii?Q?jGIQCpsyQZ5eblBweBoq8OVCT+pcKMtaSz1uyHbQGXNH+jfJBORXgurVwH9T?=
 =?us-ascii?Q?MI+cGG1/ITWJmUyR+tvdZsFR8gG3pvG69gWqVOZ8tgqXAPEM5iF26YB6ja8q?=
 =?us-ascii?Q?6GXXVk5ASlFodocX2IEBK0ecU9hrswx++C16XbwbVVSSwg6J+or1hA93wmvp?=
 =?us-ascii?Q?n2lyUZuHZAewD+bU+weTaSDhWBDo2r6i5O9qLc+SIMvURpG0Ahed7NzsZV2O?=
 =?us-ascii?Q?3Qsu3wtkBPspO2M1E0hu+aN1d+HDYKa3XN4Ae9gOqurv0T9lRQHAORKpl9Wp?=
 =?us-ascii?Q?DrZe8Cf/dEmTljPYi3qh17KvyL/Y+LEIXJkwXPXTQ/iWhMXj9OcH4PDJ85e4?=
 =?us-ascii?Q?ou5+6YtCYdFCCz0TkUwwDJ/G+JTD8ojA43VoA5nOk3B2IjAhO/Aw1G8H+2uI?=
 =?us-ascii?Q?JN3oC61oPDt6DPdRdY/zndLqnrAVL75GBkXpY+B2RV0POCougqvL4XePEfFJ?=
 =?us-ascii?Q?izSlqF9CNCQVuH+NXGTVYR+uz+YKWQSrBMx3XKfyJqOE49vKBjwjawTkYyp1?=
 =?us-ascii?Q?oEcJQD7HYeIK2zSBUcmGnPz9gIbLLJtHBzeUSsK1xBQGqUvo/l33l8dQY4Z8?=
 =?us-ascii?Q?epIYXSGBLG+7QXD8qw1tKP+G/pJtDv4nQFP0YJsOr83bIAw4ab7m4cD4r/iW?=
 =?us-ascii?Q?+NsG5abI9z02QYJC0pvmIdvbFOHVJWFq0EG+8KTEnBaNd85d4+9XPOVD6Aqy?=
 =?us-ascii?Q?lhtaXqeAXZ8AZqrCm2hV6tYOLEJoCoMZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rdgpnswhQ/4iz5H4sQm+W7OLaZMdNzGDLt3SAy+8qENqZhYuTzgdQd7EjvmA?=
 =?us-ascii?Q?YxF4BMYr97mVGzWEusAHAVeiqbEjEMFE5EAmBY34Dd8Kg2LAJwXOZ47GNIcL?=
 =?us-ascii?Q?n3ITjIGe457b6fXiHk/i8xRnY9DqY2ZjN2ZQgp34KtbQBMfMANmRuEBfeoCz?=
 =?us-ascii?Q?c8zwN6s9ZwamLhoEqSUesbKjb6A74SuxnQLKNgCRHUE37WtEV+IrT61wodx+?=
 =?us-ascii?Q?ff2KJxFJ4TOZCys5tFLI2b72/5vn5YSQKTOEJ60uBtl92eR9Gh6GgUwpb0yW?=
 =?us-ascii?Q?esIVihGc1Ro1OvtFqGj5w4CrZT6cacFBhsKi2Mio3MQuPLSCh62154WZt07A?=
 =?us-ascii?Q?oJXs7wh6KtfH54YOHBsFEmdcYio4UoAuhWnHkRTQ8QwUr9fGebk0VPssrb4K?=
 =?us-ascii?Q?cm0tRrW1r9+6O+gNy1pjV0aq3ktdQKpFJWgyyUORzbIqUAN6rZaU7HXa2A/1?=
 =?us-ascii?Q?3onxnX9ChOk9nrsbjBlYXGJ0K3jWK3jzqtTMglsgxuA2scvmuI1dVO6hXKEd?=
 =?us-ascii?Q?xp0rKcuZ3Iv3+owCXMPnrVIdjbhWN1YNuYGV5IPr5mhbjpbdlpfxnlswPU1a?=
 =?us-ascii?Q?xA/gznmFhamYImX1hwZMDBNrhGV0nvxZiaJGKBaajCNGInFG+r/l5m0KidaR?=
 =?us-ascii?Q?cDKP7SwVi8zzj8cUeoqCkIesVmkQuzD8Sqosaft2c3h7cS8kN4ooCyS8sLFE?=
 =?us-ascii?Q?luorAMnT+NMwVn+fElRBYRrmOmZbnvTDOQFzqsALF26+ao4AZqUselOXA+RQ?=
 =?us-ascii?Q?i/oBGBQ5JUqUl842HL9lzrEKiYuJOoisUAyAF2xBjQPLOKys89gvlDNFUDyL?=
 =?us-ascii?Q?kbGCrUG34TU+7K3oklx7KxZJayPyL7Y0ArKikKYNx6II4dgvDAKbZVYvSTeI?=
 =?us-ascii?Q?Mh9u8/7ZdmFGJrYvUu4lRUalBxacZCYeCQcANU9/2Daz2rAh+Ve7l7g+8iG3?=
 =?us-ascii?Q?3kaf7KJiSj1fM99bMYD1P+wCk8CljwgXobw/JrCZCLnIlf3O6pvBYazzOwcD?=
 =?us-ascii?Q?ecwFRsutXlZ7D3DB9nIPvo77ZLFSo4KzhgS8AfkgxNwhtY+ZvrmcXHTBdlSz?=
 =?us-ascii?Q?PwUO0DziUYUhsFYCwgpQRz9NCH1w+LaAn5/lJLCvNRUyEIDsc6CJKH3nsWRu?=
 =?us-ascii?Q?xITVOhOkvEG8bPA1H/KWPDseocidSUhiA2BsUmn2ABF4o6ZjtuiqfNb3+BsE?=
 =?us-ascii?Q?qUsHINmtLh7cVcfV3UZW7Gk3hNgmTmGLudEC15Yc1Urhz6k+aXBgfhy1v/Q/?=
 =?us-ascii?Q?cQhfm8HxqujR/L7RRCDbZ1Niswb7YXZqK6UxhgMK11LcXK3njwvlHTiPnzn1?=
 =?us-ascii?Q?3pO1xky5Qo+Gj/zgKZ6vFz6fw8alJxCmkO+K6sFB9BsrBdorV7BVDXmqWCCH?=
 =?us-ascii?Q?zzZfLHc61SM09JqCrAz0MnOgGK6penGZCTLoegLXEZa30S313sAyX6OIHuTL?=
 =?us-ascii?Q?im0oSBDRUjvjSyaIVxek+pceJ9383BO7AQSQREsRZNYIgcyTAPlkFWJphTzl?=
 =?us-ascii?Q?F93cwxCfb95p2IXvGcKgkaZNaXDlydyIo6zIPK1xVLQZ739R4RjSzYTnDL2C?=
 =?us-ascii?Q?x+96qkzqRq0z8+cf+bLwfPcANJuz79AdFQJ/3ybL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72089d6-cacd-4ced-295e-08dd505c0c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 20:37:23.3890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oB6/ZJCZ/uaViRFad4DultwZYdH8zN7j5qnRPEOmaAxA4spHscRgqJxPdLK+yXlY9wADO/141+lTPsrhDWMRDB5NGEOCBYjCx49so1rS1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7178
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Tuesday, February 18, 2025 12:05 PM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create=
_ioctl()
>=20
> xe_exec_queue_create_ioctl() performs a lookup of the xe_gt for the GT
> ID passed from userspace, but the result is never actually used.  Since
> there's already a separate (and earlier) check that the ID passed from
> userspace is valid, the unnecessary lookup can be removed.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Verified.  calc_validate_logical_mask() uses eci.gt_id, but not struct xe_g=
t *gt.
And *gt is otherwise unused in xe_exec_queue_create_ioctl().

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 6051db78d706..23a9f519ce1c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -539,7 +539,7 @@ static int exec_queue_user_extensions(struct xe_devic=
e *xe, struct xe_exec_queue
>  	return 0;
>  }
> =20
> -static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt=
 *gt,
> +static u32 calc_validate_logical_mask(struct xe_device *xe,
>  				      struct drm_xe_engine_class_instance *eci,
>  				      u16 width, u16 num_placements)
>  {
> @@ -601,7 +601,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev=
, void *data,
>  		u64_to_user_ptr(args->instances);
>  	struct xe_hw_engine *hwe;
>  	struct xe_vm *vm;
> -	struct xe_gt *gt;
>  	struct xe_tile *tile;
>  	struct xe_exec_queue *q =3D NULL;
>  	u32 logical_mask;
> @@ -654,8 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev=
, void *data,
>  					      &q->multi_gt_link);
>  		}
>  	} else {
> -		gt =3D xe_device_get_gt(xe, eci[0].gt_id);
> -		logical_mask =3D calc_validate_logical_mask(xe, gt, eci,
> +		logical_mask =3D calc_validate_logical_mask(xe, eci,
>  							  args->width,
>  							  args->num_placements);
>  		if (XE_IOCTL_DBG(xe, !logical_mask))
> --=20
> 2.48.1
>=20
>=20
