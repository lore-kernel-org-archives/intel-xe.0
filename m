Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D0DCA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C92C10E09C;
	Thu, 11 Sep 2025 03:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo8aRf5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226610E09C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757560997; x=1789096997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pdb0qLA2Tu8vwPS3nvJe+ng8WSilsFukX2TxzVhOV9A=;
 b=Wo8aRf5rEpIumZ5agWjxBueNaDbsYWaQ3L8rnVgwZXuTRV7Rj9hH4wfd
 fsX4tCecksBNEINGCqNzy9mHJk+KTfs/prmusqFe1ng1YUmcHgdolQCaf
 GGrWiUXkPyxi5+kHaDV4npK4swcPI8jnuRtI5funDsiBkcOG4LgjSFR4A
 sf5yq6V5Z+/zZmJ1LS7H/+dBdJ8ozjFNHAF8LOC/gUH/KkwEJF3qcdm7o
 OL0YfQwRYRIYxPd13vu+8hALvXJB4uBAOFm6nsmP3OUOrGlPiCsJKNupv
 SU4D6K6rM6ZtDlo7EPwZV0YfA5tra8k1erW39yJeUZBShJg5bEy68tx5w A==;
X-CSE-ConnectionGUID: x3ty9TxhT821JB3UWbK9nw==
X-CSE-MsgGUID: +VdsNPQTR7qBZjsL2ZWmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77492265"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="77492265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:23:13 -0700
X-CSE-ConnectionGUID: CbhU/+ivR16c+7odw0R9eg==
X-CSE-MsgGUID: qzoW16O6S/SiYgCUYEkNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173154650"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:23:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:23:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 20:23:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRQb0ZpxZB7YbwEtVqeebajDJwdWqmr0qlUO6kmhQLPQCl6JD7qhp2ihTU0bi5pR8AZ+p22n78mh9qoWRxPPt07evAT3wxkVpOage/wfj0Af16T4IeXkNBzfdrdaQqcd+2nXB7/94zThgFsXqREEHQK9BLQvu6DjpZVxpggl7TdYC5NEcLRVoG6QOCrZMXH8qZx4zHwiPuEWnyzQuHpU+RQdDq9TBrFiHNbefjWVDQgLBfci4dR/JXlr/H9Fjcs2Q0BKIQvknyZkibZzNWlRGkxEWF+aRF29i3gkUYh1gV7d4wlS8pdWlNpdWLUzzx/XPenGf5Dusvz4KqUjL2jviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi0mQzFJ8LeVUmoNiM/zC/onjz+hUnDujoZbReDNtLM=;
 b=X6fw9ulcN2ugrf1WTbQOEwvbROvPPqRcdbyNK1dPktIZxlCtMNBAycZR9Gxl3CDeFvtfx2fF3D6lgTTKy/36mqh9AGSmnvNktASZ0QMeTsP40dfKtIjkjp0xFrW1GXwPizLsp2NjCY8KXpUvhlPDKN04bz0S7FIVWV+Ke7KvnpGYXFjqdZFKImnQrXFLVpa0ypBfqJTkumKhgKilYmVwHrhFQ7V2MoyXeRUdq1dP8c8bsbZhBrKJiUQjnuBXlh162AnikS84V1PK0zHCXCUDTx0tVdPhz5DwlLnBSa4gsLhJp8UTKc6ll70JDPVvdrDN0b1FN49V86r8LjPq7R93Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:23:07 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:23:07 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Thread-Topic: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Thread-Index: AQHcER/LKsZ4rcI86k6ykG/dk1wFXrSNdAEA
Date: Thu, 11 Sep 2025 03:23:07 +0000
Message-ID: <DM4PR11MB54567C12C35D39FDD4F15D12EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250819003957.2868064-2-shuicheng.lin@intel.com>
 <20250819153950.2973344-2-shuicheng.lin@intel.com>
In-Reply-To: <20250819153950.2973344-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH0PR11MB5236:EE_
x-ms-office365-filtering-correlation-id: 99132d0d-a1b7-4ea8-33aa-08ddf0e2870e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3PSEv+9F2TIbN9G3motzXcf5s63D+AvB/l4olFbDnILyxTookVuUZbtqTDQQ?=
 =?us-ascii?Q?5uZ8gJl0jaIG0y3+FIF2PRf7qgG0/I9cohhpXHqS3ehYrtji6UWKwJF6W1qu?=
 =?us-ascii?Q?qERmYPdH+vXsXGnUhVXZRWH+SKHrSINPUbIhiP94gWCo+vpC52PRglgJG1Th?=
 =?us-ascii?Q?I0X7PLdXJc2RKA6QLOHUK8ko28jZcuNaoEhTfhXqI6EMfB4RvpVKmsBzNJq4?=
 =?us-ascii?Q?/b8O4TYOeTvkyzPCjSG1wj4XZsJrGQa1CfRXfvgnOzAEMNuuWoTL8SkGIc4v?=
 =?us-ascii?Q?iJ3U5HJi5bPQ6Gpc3i36lIsc0JLmUQc1gzG6rW/dWx8ydZp7tPHqajDddEf/?=
 =?us-ascii?Q?hqD08pT0dJHl8P5wbnBQ8yEQnGSvMQAmV+LdffVxM9t6tAdspzFzJfMUizP9?=
 =?us-ascii?Q?DcCPdnmukQPzofx8cCPFfyJdJiSwizDdLwFi/+RmaK2YZkSWou9FwmmWOIjk?=
 =?us-ascii?Q?VNPB/yi5Vvs818rGsHd+dDCab+QuzjsN9pD5ix6hPrE5+XvW7cxkEBUoSKo7?=
 =?us-ascii?Q?5xnzgsdStoDhnVd/4RpMqlI+hK1MnStxRrqFIOdjPPY3bSwPvuAi/4FfsvWB?=
 =?us-ascii?Q?nVa75y2gUozgjCungYU9T/uj307OHzSYxGtHepfZJ1iXRe90n/ikeJpjsFKn?=
 =?us-ascii?Q?Pu3+lICKQAwpS0IyWJmxFpAdu/sGl/UtPfKdWcgkatAXZz+1Dyiu8OLScfMP?=
 =?us-ascii?Q?otaoBNVEAIbus2QrfzwE6PXSWZZEwfLwCaLi1KtRCH6eXl02bu9or/9BR36O?=
 =?us-ascii?Q?Kfa075HoRiaOAWyPlW49nplNsKkSkMnAyVs/yfKaOeG8Ob5GTgjTKbyMka1M?=
 =?us-ascii?Q?253JWSo87B71o6gRJZN+O7jmBzs2Iilv2Stsd/kYRSMI4D+m1v/DSqWtHjsq?=
 =?us-ascii?Q?mZ1axYo+IQ1Vwh3UALOuUI2TyIMbGFHnhPY7eBH6BGjbMn+YXdGPZn7MzZUA?=
 =?us-ascii?Q?skvgognnACredONyPQYobWTBUkJtsEzG39XXm46tQCtElbV/YluMNAcLVu4C?=
 =?us-ascii?Q?22wihkDBv2KzbYs58V9kJe09TTYeTMMlMmqcC87DtAihkCrxcINr9zuT1QbB?=
 =?us-ascii?Q?/zpepeTU9RrS2Zge5aKlXvohoXYP5Q6lVgSe286WRSeDyyANqWgUgvJEb8g3?=
 =?us-ascii?Q?oBYw5Yt9fklwoFJKeFup/9lDh4x7PjkFIMv9qWHFQs1Nub4YUhviUQmIkz9L?=
 =?us-ascii?Q?J4iPJXTqwsh2+Wq5D+0g0Mw7DW3C+0AbHMTZnUHxXASWAnyr4COMszg8paKh?=
 =?us-ascii?Q?jrohWOjs21oy6aR06UWnQjhL77Tdywyv3zISUr1Qsmn/dGxrcZNZ0WLOTCye?=
 =?us-ascii?Q?kTF0KD4WPF81tQvZe5ooD4c3TmnzZrZTKMbfs0az7zZNHm93p7JVw/P2mJYp?=
 =?us-ascii?Q?2yPoviK8X+6hD9moTHaRvSuqRH0Yj288GvAeY8i80okXjEPgk8W9EkYHLZLK?=
 =?us-ascii?Q?+szNmty2M+2j9uWKlpU9Sddk2Uga+4zSDdwWkfEOhEjeYLYWuaKuzFAVFz6R?=
 =?us-ascii?Q?E18W2DVSvunte1M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MwXT4FhsFk+Mdfk2ISkSLcLUnheUlxo0bL7R3RlXX0G+Cq3tPT0Gbv6xJrEu?=
 =?us-ascii?Q?J1NkfOJLd/otEQWJjHarl8rR1n1zdP0w7u7pE44wms3a06UJV7Rc9S1wNIcc?=
 =?us-ascii?Q?66ILIaHOAYozXMcxDjiQS8ZgAwh2A8Bp6g4Bavd6T5h1Ut49A2020fc2uYLm?=
 =?us-ascii?Q?B0i8JhyXGGVDZXQHTiKCJzYajXDyTR697y6s4WHZCyM58HkdtufUWoTXNTyK?=
 =?us-ascii?Q?f+7nJTgJxIGPa5nsxdzPiGVSWMDm9DDQHWtJm4GQMkaGDRZDGcFrifDKhrPM?=
 =?us-ascii?Q?FN34SF2DkCxLzV4lKEftp1CHgb9W918x9HlCT9BSXoGjQNufwnEROQUdYgm9?=
 =?us-ascii?Q?le3sU/YtL2d1YyjjZjst7ZwZn2AKcvVWVIFnn3d+UhSJKtDOjNMNLOCqwQW+?=
 =?us-ascii?Q?S2RjE3OEeSzzLM46nRa8b6XxViXPP0BVS2/gpw3g9VvCLTjc06f0kxXyNy8Q?=
 =?us-ascii?Q?zhqTWz2QOWc/35iXVc3exAY58y0+FOP59sbv+PT5QODcvth55NMaV5CgTx4a?=
 =?us-ascii?Q?SA866k2uWDf3RTZMeGVcu9H63SkGmy+IOog0qIBXt3JJOMpBtgaCEqLnaHFp?=
 =?us-ascii?Q?D9uME7/EzuTF/uZovIxeKe2Ta0hERPNes3T2ay9LOl7i7UPMIC2qHLUiZ5YB?=
 =?us-ascii?Q?URG/VRC+Z+5weSShky39xR6WNuHkMlnf5vPqEoGQMHcSJUFfNEcF6e6yex0b?=
 =?us-ascii?Q?ewN39V1pzvMpqOAEwHdsFkMFyYqCxyL0tzvqx4j6FToLSfqsaYkncgNxbFIL?=
 =?us-ascii?Q?B7Wm2QHEpDWCtFiwMRAba8O5W3LlZEw9g/y0+03Y0kMdPdrq2z4RBjSLNYdA?=
 =?us-ascii?Q?iBSDVuL04rC2g3Wyy756UzayPCRa+Fsrx7lyGtVtWwLUw7ny/NwxkQ4wWF52?=
 =?us-ascii?Q?WzY89WVo+d/4XTMsuA1HnNm/NJ/vgemksu+oRTVZCk7o4qey7ZpHOi8r72S5?=
 =?us-ascii?Q?teUeVPan+BWMATSTJM9VRiCguwTiimwUCM5CXyoW6PgZMeHVM8LWSqj1WjkK?=
 =?us-ascii?Q?mdom3D7nnDei5DGsGlVqCewn/ONJN5vM8xGU0MKt9AjFBlG5du8T/hyH7eZs?=
 =?us-ascii?Q?AEuTZ3hnWpB8Fi4V0Z0EESsfcvUdwGm8/saRYxKkjGX/Nun6P9QJkRb6Rp5p?=
 =?us-ascii?Q?ko6258ecI4+V6WfYjqUmorAAszjl8DU9x33otBv92QO5gordlTUE+U+KB/2z?=
 =?us-ascii?Q?7Ai0oTrv2nOpzWp6IuMmcCKQz98SYxBpwPxEeFurbRiugyPAWPnMuSk6gnHH?=
 =?us-ascii?Q?32hxOzFUoRdIig/cXqsN5E1GGKL9QC7a3xAy0pikfXEV/bR5d/xbscjzSDxF?=
 =?us-ascii?Q?Gf5aa0o/0U1E1j2TTKDgwdNQKlelSfm7LDy0uGKmZcpe0SSi3QWeyjeIQq3z?=
 =?us-ascii?Q?3VcBuWgQFwXx3UHlPIMkTyvz8YkYh/FjM717YmCDGYDiYZ0lDEdqeCKHrk+x?=
 =?us-ascii?Q?Gy/nyjhWsHajPL72MByKFww8eQa/l1blrzhTX8fjM1ERIJAtgg/J1ZF1A73o?=
 =?us-ascii?Q?JFsXCQhUxn8RiR/AAE0qihrOOlr9FtFh6yaiB8rI3VnpzsBPyhRuve3KjN1E?=
 =?us-ascii?Q?2hEkl3RMP9GvbhlKq1SPk13YRqSXqCEaSJObtUr4SYj9tMj5x1v8aS9iL9Xh?=
 =?us-ascii?Q?FrbI7GM1ZymmsGD4fVJk4u4fP4Z2C2XApIAE/jXBePX8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99132d0d-a1b7-4ea8-33aa-08ddf0e2870e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 03:23:07.5140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0AmKAVMLwbQ9EVhMCRe15AMkeWFY/UhOp75NTvy8zcjEPNzjxGpgf1MNDoV8414RtLpWU7bkIaiVccsbPIk0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
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

Hi maintainers:
Could you please help me review and merge the patch?
Thanks.

Best Regards
Shuicheng

On Tues, August 19, 2025 8:40 AM Shuicheng Lin wrote:
> Call kobject_put() for the failure path to release the kobject
>=20
> v2: remove extra newline. (Matt)
>=20
> Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation f=
ailure")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index b804234a6551..9e1236a9ec67 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -44,16 +44,18 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  	kt->tile =3D tile;
>=20
>  	err =3D kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> -	if (err) {
> -		kobject_put(&kt->base);
> -		return err;
> -	}
> +	if (err)
> +		goto err_object;
>=20
>  	tile->sysfs =3D &kt->base;
>=20
>  	err =3D xe_vram_freq_sysfs_init(tile);
>  	if (err)
> -		return err;
> +		goto err_object;
>=20
>  	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
> +
> +err_object:
> +	kobject_put(&kt->base);
> +	return err;
>  }
> --
> 2.49.0

