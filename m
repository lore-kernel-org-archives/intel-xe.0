Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD9C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 10:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C2810E2DB;
	Wed, 14 Aug 2024 10:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hz/Pxepd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F94C10E2DB
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723631869; x=1755167869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=HjorY5Mg0u2vkLfzXXg7BeeelDPNRKklN7NfTrgbPd0=;
 b=hz/PxepdJZMLcLd2y38ijHPFl7MO0AAIEH56EKPXKMJBM/fi+0Q7KldH
 n1Jh8BPuIR6PKVuE0J/TW4PbLgoj6B3za+oQusprDZjYlbNHqugG7nQb5
 nGe4p2/eaPWZ5Qu5G+u66pOeLzTFDtrL5mdNGOE8awtikWLoJxg+ghq5D
 lKJim+E4F+tL6FOZJRR7ecK6qeJHXgcV71oxQiHie1MmkLtX1603824rZ
 jNFHUMu04Ym7kE8HAPlQsQcRQ6bKlT+uH5xhEtzfW3kpXx7SBVG5Niq1d
 YVdd6Z1c/efx3wXf9jUBRTi6s2B1qFPGzIg4Fc8MYc+ocbCRBnVl56Lal A==;
X-CSE-ConnectionGUID: nWaMjtjVT/CLRC8pxfN3Hg==
X-CSE-MsgGUID: skX0KUflStqYokSeh8TzAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25640550"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="25640550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:37:47 -0700
X-CSE-ConnectionGUID: +bpIPkY4Ruq6V27Jsl2m1w==
X-CSE-MsgGUID: Eq3uDmP/RFiwo5zJLojzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63120223"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 03:37:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 03:37:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 03:37:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 03:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=je+u9vTQQUu/GiNdgiE4NhHDruenfCMppfsFV6qivhUGkqgEtATaPQp5C/TQlHxQxSMTkc8m9IaSskzvEWGrl85pH2wRgKb48P8lL9Sw7gn13CP4JyMUngEe51LLSA6lzUMrimHW19fHtJMo4nSePyb97jkEOlM/TI0ggfRBD6LXCjdkuLoGkT9BO2ptUegfKJ3feUoEzUHyaXGMkkMJSYgvWBzbfTKl0x6RAK1tZn3sB66i7ChtT4s19+AAzUK+nnukdcRoyBKR5LcyvpYGYBBOvFDO9HEwqA/cGzA7juUhdnu3o+cn69QMq89OuR54hkapiy8LjsETDirD1B3G9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7OwL8eHFRa6/xaKOsNITbf/je6h/5otPW8l0iS+k0c=;
 b=DxJRhV50L18Q7g4sZbMRnN077SCUzjy1bP4GZxLH7WmnE5+gtdfCB09mdvPuQ2BrCE4Y7AvggWVUOGHvVUqWbvQtjs9GpFsgf/3XKsbtBMe3viWZ6T5KRUPFDC+1VX/4JA83Cw/cAXIMZwuJWyit07miu8yDpWbM8/oM2bbmHd4mEXpw8Di5m43thmCVwvKIk2ZynuvRa9iDgwLBCuoVScoBhze51L6H4qa9zoQUKQWz6f9msuTGdliEUUEG0xmoHlEF3X2cVdpYAQjgkhKQFDetM3h3lMP95vSuvikQnwRJiUkH6tzaL3dMf9dGNPfS0+DXs6zlwyje4zdwpI9Qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 10:37:42 +0000
Received: from MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::18ff:958c:8bd:aed6]) by MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::18ff:958c:8bd:aed6%7]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 10:37:42 +0000
From: "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Thread-Topic: [PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Thread-Index: AQHa6kvgEScIA2TQxkOVBhLPfQ8vFrIml0NQ
Date: Wed, 14 Aug 2024 10:37:42 +0000
Message-ID: <MW4PR11MB582126E74DFFB6E4DA26D98FF5872@MW4PR11MB5821.namprd11.prod.outlook.com>
References: <20240809104736.10423-1-nirmoy.das@intel.com>
 <20240809104736.10423-3-nirmoy.das@intel.com>
In-Reply-To: <20240809104736.10423-3-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5821:EE_|LV8PR11MB8745:EE_
x-ms-office365-filtering-correlation-id: 51914683-ffe1-43d6-348b-08dcbc4d209a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?V4au4+OnzO0duqa61f1cKsoTlXt//l4DawSQWPSQgxedSxv8H7YR8kcM0snz?=
 =?us-ascii?Q?8Es/QXjCoq9Ij7oa3BNkxz7hhPgdI9w8XcSXTSx9QH07UNQwMU1Rdx4zchgb?=
 =?us-ascii?Q?1+LnBBw8M9cvgbgxxwPTDv2FvOI1v2SPlIv/RLKVLY8DEiiVdNBVHrQFtYgg?=
 =?us-ascii?Q?rC5cTMUfy/FxobQ6uDBynkfvm78vTt/dI4aO85HjFqO698pJ6Ykn7VrRtZIZ?=
 =?us-ascii?Q?qunYEk7dLRnYwHUP0Ljt6Xgu9xQ7U6aDpEWx0thY6/VgzGVdU8qrwwlcd+kw?=
 =?us-ascii?Q?2WdopZinDr64NeMZcW0/xFTcVlddtFMDWMD1pvP1DUzacl/2deq2Zs3DQRlO?=
 =?us-ascii?Q?7/eSoro5zOaWOlaAPe7Afiwusom0W9ENwp+T8Abq5W8Fm1FX5tN3gUaBObYi?=
 =?us-ascii?Q?MtblzBrgSBkzEmzwqCK9fQj39Ss3FZN3et8YTYQyE7NBzGniXC6Fk/CD+Cjq?=
 =?us-ascii?Q?bqSRzDaGA/X6of2kyExz25qXMSYdQY3TR8Ld83URl9ZqsGL1GpB4d/bp3FgI?=
 =?us-ascii?Q?Do8p6wQGg2SZIwKwAQNTq0oEv2KDQoZlUKWTJIrz6rpyERqJN4qq8BYZOoU8?=
 =?us-ascii?Q?E5fY8NHiPnHHViU913SGreGZ6ElmLlJ/+vpTuKAHdnd0LOaTALVHyQyhUB6x?=
 =?us-ascii?Q?nhRJmEhG8TyhZNDF39CYLfqKTQvqSjATTFFF1fzCQX0ByquYT/+6jr2VLrdg?=
 =?us-ascii?Q?W+bwqgMoqCo/Ob/iNA4CrCNwDs52yj3L44eAW8nG3DUghUtBcYGiRgS869OG?=
 =?us-ascii?Q?lyx1PSAXB4KnI2kLVKZOmCWgXgkX/gtwd/fitXrume9mv6qxKXHngA6DDLS5?=
 =?us-ascii?Q?O66xpIBX4stDGwGnDE1P22JGEZ1xNsl2JtkWHxDTZkp/KBkUktGALf5cImPX?=
 =?us-ascii?Q?xXch/aJbH8Aj+ZBYOstihwIRYIvK9ko2M0wwDT42is9tDCKfyv6YjK6n2fGu?=
 =?us-ascii?Q?ywStnFCU/5B5ntA8TTeO92tw6JAzi0URpPZi/7XM5K15VS8bL9ttY902MMAx?=
 =?us-ascii?Q?PYMxAaIh09yd/9vBJ87lZ9mmZ1+bCGyLKJz2qvRqlwh+ROrkayDg0JZ9dDaO?=
 =?us-ascii?Q?gMu+1przVPx4nTO0rifVxQGQcrMw9QJMEA3WKuHv2XzrOj/JTi1llYyPXV4T?=
 =?us-ascii?Q?OWjZzl28bO87GjfzI+PgA8lXJwA1rYFUrprpQ5LRVNbWh/qt6/XJFHD4e+I0?=
 =?us-ascii?Q?L+eHDX+iT7uDIaF2S4qOIIm5TVtPzTBZKPpI7ct4XOKuTAROZLihZ1xZNNNH?=
 =?us-ascii?Q?QUQZ5UXoyfa7fCHJPL4QJyVX4HpmzJ6gMW8S42nA+Eb/TGEdwT1NTATqqalY?=
 =?us-ascii?Q?Owh8uu2FrC160ONhKqXuVfBDNuiH8R4LEQNlMb0SxO0d6qLvdf9iM4aphJde?=
 =?us-ascii?Q?pDEEDfyNZIfBjBt6yfhIxROlqqFMUiv+ordlyMhXcLnr81wwVg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pHfxcbzwAsFhi0cR1P49djh5O1xsRfPgXjgBnpceoFaOfEv7GybyKNdvgsLj?=
 =?us-ascii?Q?6vn0QB2Y9QHPUmDQdBGzRojM7PFy8PTrNJYEnYkLOj72JwPGLRliA0+ho8c6?=
 =?us-ascii?Q?Xry9os76VIphcTC9qAlclCBb5gXqw3vyzspzRvqpwxR4QZ3JGV5byxvH77+f?=
 =?us-ascii?Q?hdb1DXpyjtpcGpjzN2UFcZGoW09ghq4u+00/y6X5bHKkx17/a34HdG8yotUA?=
 =?us-ascii?Q?wrufholdeg0lA+HFE4SeysCSKSoxZGfETMNtUqdSYti1rHFFf9mqVWFMd0oM?=
 =?us-ascii?Q?RnuZIWHkx5eCp6Y4FQuU3dntlL5nSkoDipdwYiMjP95lTz5vqOpj0sYPBpV4?=
 =?us-ascii?Q?mV5EnN9G9BssM94EM3RnsGjClztmUosGpLI8pZAMLxTQTgtaG5EV/XY+cZ5u?=
 =?us-ascii?Q?q0rswhf36Kgg+U7g7JUM5FVM54KuHLzAC1JtCz7GX2XfH6E7piuEyWUh15rK?=
 =?us-ascii?Q?D4WOJ0E0wajW/Hemf4flwyA1Gc4NI/PMsMp87+OFR+Kj2LRHc1HCdTP5G2NQ?=
 =?us-ascii?Q?uI88P87d0KiVOUgcIAaW4e6xEfDL+EiIaIoF4vHDm/x1HSfU3T3IRFhVPzf7?=
 =?us-ascii?Q?RL/nkOi4md1gc+eP2C90VllJFBXZkobwmqgYUAkYpKVkCHdjXs+paEYU55RW?=
 =?us-ascii?Q?vVJfQy8LT15uXErJzcOS+DJc3arxaNim+37DcNbE6REybl1zY7VHOI6ztBe7?=
 =?us-ascii?Q?Sh5OUtq+P+1r5yWvKCEEwM4EV3+Ajwz0sL3LnH8ZQVHxeq+s2+lzBPeTPQ4m?=
 =?us-ascii?Q?c1CTGBYNFQsQdFUbj+0BQiTZChERqGUHJO6FdwO69I6cgTKx5BSlKOphQL6d?=
 =?us-ascii?Q?UMEJxglvqSCCXwgR89TGQs6KE4I1t8ELe6gFcS4n2/HEsO9Iqwcy8IMa9SKE?=
 =?us-ascii?Q?PkdsHc7kCZiW7vwcAGJc9boJdJkpUphu84tFkuIw+xgwjU/23xciDixJ7/RP?=
 =?us-ascii?Q?5F2RRjZS/sIvckDjAX30Dgz9jfB62vQXRN7AQE9Z8VRwwE2834+s0ZyiXKUL?=
 =?us-ascii?Q?YhZZAhFYnPG/m9HP35BDDBj7931TfJD57ePqvZfWW33OhrPlgZfeInor6g75?=
 =?us-ascii?Q?SEfkJ8sMyPcfmoO/k+OU0wUxwYWf4jbm7izbf8tEEkNZ2zPbb8hgXYrZ47VX?=
 =?us-ascii?Q?CRCrD9nJTGXiyK39+/BQf+j39bi0Ezf8lo6D7EwG5upZ/T4DgW1NofesUy14?=
 =?us-ascii?Q?tN3HwLIqENCx99J55pql1Z2SdGukDroQVTSUKKYXOmEqeFhwf8+qiZF1wh3n?=
 =?us-ascii?Q?+sRs1DyvhGNVQu6nd29A79gcXVen01eP1J9ebkuz9pR8jm9BrNSb0FTsE5rY?=
 =?us-ascii?Q?IcJQGWOknfqHBBMFV8U2/BOzjKO7OIzuOQjI2Xb/QAtyGHyK97fg1D//5W3Z?=
 =?us-ascii?Q?5XJGlWgypCqtFhNAri0jqSor4ahPEHUqO3y8ds8aHBEDHACpZXiEC6nImgpy?=
 =?us-ascii?Q?p+oS9+RWTA4paVP8QN10IuqNhRVtwQa7UKXFRFQ298qHuzii08Pcy5MVZBG6?=
 =?us-ascii?Q?6PPdCtK1oUiU+hd35FX7JcQko966f/aCgKMGimgeDFap7qMD/rbOWEGm7oP3?=
 =?us-ascii?Q?Vy5Sn1sjGCz5LTS4UZT1vyC9CYd0xzz5cYoNxfG4?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51914683-ffe1-43d6-348b-08dcbc4d209a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 10:37:42.4737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nX12QFxIi0bbbUdMFBdpr8/k7gqO7PXK04ttFeDlI6jaX2/ugnnA3jV3vk38k+mO4cR/KBIbbmc0q0SGsYguTdcjORsjOT9Pnarj/X6HrBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

Add capabilities to engine struct which can be used to expose various capab=
ilities of each engine.

Add wmtp as engine capability which is retrieve from GT info.

Take a field from the reserved for that purpose.

v2: Use 32 bit for capabilities(Lucas).
    Only Expose Compute engine till there is user-case
    for Render engine(Joonas).
    Don't use BIT() for uAPI (Francois)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  4 ++++
 include/uapi/drm/xe_drm.h     | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c =
index 73ef6e4c2dc9..005f4f2da3d9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -213,6 +213,10 @@ static int query_engines(struct xe_device *xe,
 			engines->engines[i].instance.engine_instance =3D
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id =3D gt->info.id;
+			if (gt->info.has_wmtp &&
+			    hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
+				engines->engines[i].capabilities |=3D
+					DRM_XE_ENGINE_CAPABILITY_WMTP;
 =

 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index b6=
fbe4988f2e..975666b6fe28 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -247,13 +247,21 @@ struct drm_xe_engine_class_instance {
 =

 /**
  * struct drm_xe_engine - describe hardware engine
+ *
+ * The @capabilities can be:
+ *  - DRM_XE_ENGINE_CAPABILITY_WMTP - represents a engine's mid-thread
+ *  preemption capability.
  */
 struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-
+#define DRM_XE_ENGINE_CAPABILITY_WMTP		1
+	/** @capabilities: Capabilities of this engine. */
+	__u32 capabilities;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @reserved: Reserved */
-	__u64 reserved[3];
+	__u64 reserved[2];
 };
 =

 /**
--
2.42.0


Acked-by: Mateusz Jablonski <mateusz.jablonski@intel.com>
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

