Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D9C982D8
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 00:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21E510E343;
	Sat, 19 Sep 2026 00:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5MdtnwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE7310E343
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789776793; x=1821312793;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=THVf/Ie6ZxvQxFcmbcyUQ8fPdc9hAlZcex52oORca/8=;
 b=k5MdtnwUtPtIla8NOigPkNwITWFp7uJFY/7fLZvW4B1G7/Vn3GkbWmPP
 rMLkAQk0FoKZIVa+Amgx58hHvVsIKCGo7WEY8DlVxsCwHlg2I3Mf/PYDr
 IwqN8hBAXsNiX6U81p9EIpkvbOMt7bsf/2rXEvfCKAvz9Epj2CINiGSdV
 xe79yXpXMlJkNZE6DOeZk1E2d8keV9ycEHhK1liSjHFKhvkTyrWbBnGti
 +0XzF4pJvbaAPy3d9UXw0dckpggo0yUIPY5yXBNn+9GK23s1i1uWDBawp
 tPb3DCooZxAXov/wQgisnYixdoEqx1zgF1lbq6dfIdz/u+IGtphcIPb0f Q==;
X-CSE-ConnectionGUID: 7kGqKPqlSNupPe3t8RZaYg==
X-CSE-MsgGUID: AOZJCq6GShy9oUyc47L/RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101664325"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="101664325"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 17:13:12 -0700
X-CSE-ConnectionGUID: egcnsL0nSeCzZsQ91dGIhw==
X-CSE-MsgGUID: IRBczi5FSoy+2hmpB00d1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2840800"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 17:13:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 17:13:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 17:13:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 17:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2t+qwwwVx8xWUoHxrDpf3h7JPd+5oKQFRzrRFfNDNTzCSCYwDN80Zo/maBxpJUhakSMnSox1QKqLRdb8ZnJzbDSVVEyD42YjWk+hEXCs/qay7AhhPASwwWnxGCPM3+eL40cq31/KSW9WmfPE7xrLFR44u4qPRI/0efalRD3qOthSdDHzf9kTy5SB6Nvbc6yxb5ohNd5xJAvH5XXsW7AayLGLMKbfo+xWowdgiF1hqJ9rmuokE1TbJJ/BK/FVxCt46/K6qoVrv7Jcv0/JslX4Xs6C9p4Z1Ogxf7J1HAwkT6ptc4z7FdPvfFsggB2UyN3msT4ZVng5hKxomDLO8xRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/1WobK8dOPvJ+QccO0A2pf1nYdGubGaQQ2PJYLjzyc=;
 b=d6b7uHYizfvpES8krf39Z1FllqO+dvVKk8LcPQcsT6JlmHjeUlnpXr3vLKNQrvspOTiV362TgGPInKE7MR8SwylamGxC2SKmiuEGq8H1DAazQdQNJKoH4itlKwnknLVYymxVb0lTz8oQH1tZz5NF9nHv2XOjTjnf6YcJYIiHkcNhOiqRBxfjKZE5qe46v60KI6eFgsx2kKJ30VHvOcREJv+PdOEj1xl4z/Zjo9ph9ivMjtXoisJlZGiwklJYHdAFpeENMWOGTwSzSvMUdVyZrUwuGrvA1vmuEDfxkbYbjEX6g7OPNuZ6LqRkzCeYdEArYJxDyf/+OR+TM+K8ydKNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 00:13:09 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 00:13:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 14/24] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Thread-Topic: [PATCH v6 14/24] drm/xe: Remove unused arguments from
 xe_migrate_pt_update_ops
Thread-Index: AQHdPLKxVDmtIM9Et0G6xlDHgrRaMLbVDzfA
Date: Sat, 19 Sep 2026 00:13:08 +0000
Message-ID: <DM4PR11MB5456A1D9DEE33C62F727F471EA862@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-15-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-15-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB4855:EE_
x-ms-office365-filtering-correlation-id: c4d3cfc5-44bf-471f-b8b1-08df15e2c8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|10070799003|376014|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: CM6q0t6Y+10aiXUkhcf9BSk4q73x+qndanfL3bEy3xdys94/8WuJi8rW01mZFRFDqssFE610XCqUzL1M1h+FeOGQ6zScJwyCyugC+XMoRvr6szRpPEDIGNaIi5j0f6pgK4EoKTJVqJGsinUi3AhiW47TSvPbIjJbbSN9OgBxD8MyAeb9ueB2gboCGWWLXK3w12JQYHfSN55PvOxLCfIappKxp4e30LjLqEz1bURKzNbIN+PtNwUZ4queY7PjzRJQlmGdsHOxr0vqHWLx38+6r/HDlo7ap1WKCtwXFs+n9R+AZqclgVhnaS661fMrLG4RL4XEUsPlsCLY4KWmZCVkeRq2eLV7ewMt/Fav+JtQIrQLSNGQHdQsKM1qH2cT1cxxvSuT1L4JYpqOoAwUL1jnumsRMT/jXIHkEKc7sDushhvkZtxJlpCKbT8cCR9xoGzyOWajZ6miqFQ5pGHAaDiufy/mS8+rXzc6pHpqJRDdVvalqffuo6XzKe1qj09Pe0aQy2s5PUry+fEbezBtlUMgXCS3vSVZbal5T3AnZjE43BocqnIa8IF+5Gup+rj8c5FFC3czpebYlLSpFANkweSJwMl6YIk1RM4HiuXgp98yBPoUZcQjqPey5rwEFhHSoOeyWteS+VUNzxGJU7mLoEli9gp9SyxaRhV5PD0vo/Oz5zY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ryiMEpx/he0QafUkyawxzlG1VPaKGENFP7+81tM9U0E8l7WufbxnGRRniKR4?=
 =?us-ascii?Q?Ai9UJ+0YSXGTTjGg3zhr96nvbpcEJJ81x4mO2t/pD8eKEmI51U/kJPVSB9IW?=
 =?us-ascii?Q?HlnLJIJaCMn9xS4ej8xg/o6Un24HLz7Ldd5s2CvRDqacczDLKqZKfFGbH2PV?=
 =?us-ascii?Q?2qhBb0EjyF19i1hOxSkq0NPAh+cjx8WPzPau5Pafb9UNt0TyyIYCaOYdCXEe?=
 =?us-ascii?Q?LscuFdJjPEw6bn/TUFKTOlvIlooYhFpU0SYhJ7ga5dbCnaeV5X3v8JtXt2xS?=
 =?us-ascii?Q?CM4SoHCYpaukkTRzVx9rOqOqeifqPJHAtOeJCWYHGImPkfvd5dnt+mSmEmHA?=
 =?us-ascii?Q?MCJhYy8NLobOZamZBZeCYOeFQd7gj7peIqL3xQ3no7+K30e+BJLBa1+wNWYj?=
 =?us-ascii?Q?oklPaHZJF7pn0T1HLYjAbkIp7WY7697vlfCgktlBWZbOOq5ojlBoAbeNbwiT?=
 =?us-ascii?Q?a1B+2UHJf9Ws/KDZqd/nL12ImL4XhytvL53XfbftIpo7Kgr85jpY2IqH5OOH?=
 =?us-ascii?Q?LF98APsfPqV/2VphRcgVDnb0DLN6/GxbWpSsJIzGE6knmPQSPLnBJypmKBQr?=
 =?us-ascii?Q?0X5QM4BgCdVkar8xY9h7EB5ggMQoNbFc8TXMlGMr0S+IfvdNo1P0x/Da7xyB?=
 =?us-ascii?Q?lis3KoRrNE9yYErrEl7X/tNKmZM2HiMZiw7bPKjM7AShG5KqIpRE/nkaSbSq?=
 =?us-ascii?Q?nY1X4ZV+loIZI1+gg6RNtNyQdpL6M+SGPoC1WzGnMfDekbiroSZgtOiRjrNX?=
 =?us-ascii?Q?CKDJZ1/eWSVc70S/fRhbG62pwvBjNQVBx+nLfPambftSP8HVD3jwjXf0IU30?=
 =?us-ascii?Q?0qmRo0BIa61UmOroaU5BTBHe45IJTCqSd8gLPjGqRWNDmWLL0X77zovXIv0k?=
 =?us-ascii?Q?Uv+1Da8O2FHBG0EUM6nO7WJizr/Fqow7rSejiW/x77YW4WySU27I8agg8xn8?=
 =?us-ascii?Q?4S3tKga89f1J+D9kAAGbBOp7PUzMMewoBRvYtYhMA5CN8a2YTWwFxi8nCM/g?=
 =?us-ascii?Q?A9ub/i7EpmeUAYREc94nLpRRmbogSPC974YE/GaLyE81lNeleZBHvh4aC2EO?=
 =?us-ascii?Q?QbwpkWGgljC7g7IyhtU/J/GfLDBeisLGi+KijIbQy6ExsaVg1eZluKdh73vs?=
 =?us-ascii?Q?Q3CX84kioxSEdyNmg0qh4KgGe9acqqcxvtSx2+ZQfoq3zkf8IinZ+tZjQMgI?=
 =?us-ascii?Q?D18S78fCaJ1nVmT46iIyAxtDgRuh7kY5Qj4e9SKviu/VP2BTLs19Az0gOYzF?=
 =?us-ascii?Q?VqIfS3mbKvC+YSnNLy9WVwqeMxm6A0S8Yl3oYw6CMrTPfY3sAUXE3gdtMkWp?=
 =?us-ascii?Q?mvNtEglnt7pHnhgx04QppJUuVUVi+ODwegryzZdtZcapppcjyRkELOw2WKv6?=
 =?us-ascii?Q?+sFFzYGmVc8X6w1CNJHHZ9Z9aFHY0H0vjlzlK5gxLzef749sJ2DiYttamJBs?=
 =?us-ascii?Q?mggwTvLdVR4w9r15PLW37fjvXeXCQVwFhHPMxN1M6bSMbx/APt47+9BJu7uy?=
 =?us-ascii?Q?TwmNYp2/N0/CHb8UJXRNk5SUw2zFNgKV0i8LjPTrrNL8xkdKIcEAemrNwc/s?=
 =?us-ascii?Q?YN/+lYrtuPNU/qmysrxEgso/6Zyw3Ga0u2MFGZw2KA0YVcNuO1/3ACJ4UEOL?=
 =?us-ascii?Q?2DPHNlAMXwxFaAguny4hEIjlE2vQev1Ckwoyc5TIP4w87wpRqdUAZVuNcr+K?=
 =?us-ascii?Q?wIjSrvf/5Fo93SIFv7Zf/J+3sHzurXsxLnbAhX0AdO2emFbx6EibO0i8LWhK?=
 =?us-ascii?Q?P1bGXg561U/5uQ93FeKY9ysNx1fMXY3vyddNmxZdalRmcP5MwurHLgoVQa0f?=
x-ms-exchange-antispam-messagedata-1: +aLjWgZv8RG17g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lAy4Ak2H68oj7awpNkHtkpnEc/AJMJJ+8QqLqd5KroBA9oKoXYbBz2uo1r3ea5Z9hs8WdUCTg0wRiS19xWXKIOPvNDhKN1Hn0JGGT+VtJDPx4FsOuYzbcesCUzM4axtpCiB9dhBMeJzsYPDHEkEQvYJY/oHf4NMjUekIGUKvFJMxRnU1IXlA86SR68DTrwuZgj24rEA+IFigm7W6YGRgcenrstk4kEssW4HT6DZXoAK+KPOZsWQ5GrHcssXJBxABS5CImJlWiVqFdRne5AwbBm3k71aBjnRJTglSGpw/tKhb3urGK1Nsjl8NuB3XQx7o3PRp3SB3v9Qsg3ENyvmp8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d3cfc5-44bf-471f-b8b1-08df15e2c8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 00:13:08.5997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OizM5NXb4aCRSzfKVpIA1qWgTl/D1src8V9EhyTJX3y9AQq1KgvuZDs/Gj0fgRv+e0QSTLz78r3SvPoS3G5Wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> Both populate and clear have unused void* ptr arguments, remove these.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-15-
> matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c |  4 ++--  drivers/gpu/drm/xe/xe_migrate=
.h
> |  7 ++-----
>  drivers/gpu/drm/xe/xe_pt.c      | 37 ++++++++++++---------------------
>  3 files changed, 17 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c index e5c46e0fa960..22a442d13477
> 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1812,11 +1812,11 @@
> xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile
> *tile,
>=20
>  			if (pt_op->bind)
>  				ops->populate(tile, &update->pt_bo->vmap,
> -					      NULL, update->ofs, update-
> >qwords,
> +					      update->ofs, update->qwords,
>  					      update);
>  			else
>  				ops->clear(vm, tile, &update->pt_bo->vmap,
> -					   NULL, update->ofs, update-
> >qwords,
> +					   update->ofs, update->qwords,
>  					   update);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h index 7a824654cb72..74ff6446309c
> 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -43,7 +43,6 @@ struct xe_migrate_pt_update_ops {
>  	 * @populate: Populate a command buffer or page-table with ptes.
>  	 * @tile: The tile for the current operation.
>  	 * @map: struct iosys_map into the memory to be populated.
> -	 * @pos: If @map is NULL, map into the memory to be populated.
>  	 * @ofs: qword offset into @map, unused if @map is NULL.

map can no longer be NULL. Maybe we could correct it in the patch 16 instea=
d of here. The same apply to clear().

>  	 * @num_qwords: Number of qwords to write.

BTW, since both @ofs and @num_qwords are derived from @update, we could dro=
p both and just keep @update.
I am OK with either.

Rest of the patch LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  	 * @update: Information about the PTEs to be inserted.
> @@ -53,14 +52,13 @@ struct xe_migrate_pt_update_ops {
>  	 * page-tables with PTEs.
>  	 */
>  	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
> -			 void *pos, u32 ofs, u32 num_qwords,
> +			 u32 ofs, u32 num_qwords,
>  			 const struct xe_vm_pgtable_update *update);
>  	/**
>  	 * @clear: Clear a command buffer or page-table with ptes.
>  	 * @vm: VM being updated
>  	 * @tile: The tile for the current operation.
>  	 * @map: struct iosys_map into the memory to be populated.
> -	 * @pos: If @map is NULL, map into the memory to be populated.
>  	 * @ofs: qword offset into @map, unused if @map is NULL.

The same as upper.

>  	 * @num_qwords: Number of qwords to write.
>  	 * @update: Information about the PTEs to be inserted.
> @@ -70,8 +68,7 @@ struct xe_migrate_pt_update_ops {
>  	 * page-tables with PTEs.
>  	 */
>  	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct iosys_map *map, void *pos, u32 ofs,
> -		      u32 num_qwords,
> +		      struct iosys_map *map, u32 ofs, u32 num_qwords,
>  		      const struct xe_vm_pgtable_update *update);
>=20
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x
> 24190ba4f533..c17d5f96f00a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1106,30 +1106,18 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile,
> struct xe_vm *vm,
>=20
>  static void
>  xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
> -		       void *data, u32 qword_ofs, u32 num_qwords,
> +		       u32 qword_ofs, u32 num_qwords,
>  		       const struct xe_vm_pgtable_update *update)  {
>  	struct xe_pt_entry *ptes =3D update->pt_entries;
> -	u64 *ptr =3D data;
>  	u32 i;
>=20
> -	/*
> -	 * @qword_ofs is the absolute entry offset within the page table, while
> -	 * @ptes is indexed relative to @update->ofs (its first entry). The GPU
> -	 * path (write_pgtable) splits a single update into MAX_PTE_PER_SDI-
> sized
> -	 * chunks, calling this with an advancing @qword_ofs but a fresh
> @data
> -	 * pointer per chunk, so translate back into a @ptes index rather than
> -	 * assuming the chunk starts at ptes[0].
> -	 */
> -	for (i =3D 0; i < num_qwords; i++) {
> -		u32 idx =3D qword_ofs - update->ofs + i;
> +	xe_assert(tile_to_xe(tile), map);
> +	xe_assert(tile_to_xe(tile), !iosys_map_is_null(map));
>=20
> -		if (map)
> -			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
> -				  sizeof(u64), u64, ptes[idx].pte);
> -		else
> -			ptr[i] =3D ptes[idx].pte;
> -	}
> +	for (i =3D 0; i < num_qwords; i++)
> +		xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
> +			  sizeof(u64), u64, ptes[i].pte);
>  }
>=20
>  static void xe_pt_cancel_bind(struct xe_vma *vma, @@ -2021,22 +2009,23
> @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>=20
>  static void
>  xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile=
,
> -				  struct iosys_map *map, void *ptr,
> -				  u32 qword_ofs, u32 num_qwords,
> +				  struct iosys_map *map, u32 qword_ofs,
> +				  u32 num_qwords,
>  				  const struct xe_vm_pgtable_update
> *update)  {
>  	u64 empty =3D __xe_pt_empty_pte(tile, vm, update->level);
>  	int i;
>=20
> -	if (map && map->is_iomem)
> +	xe_assert(vm->xe, map);
> +	xe_assert(vm->xe, !iosys_map_is_null(map));
> +
> +	if (map->is_iomem)
>  		for (i =3D 0; i < num_qwords; ++i)
>  			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
>  				  sizeof(u64), u64, empty);
> -	else if (map)
> +	else
>  		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
>  			 num_qwords);
> -	else
> -		memset64(ptr, empty, num_qwords);
>  }
>=20
>  static void xe_pt_abort_unbind(struct xe_vma *vma,
> --
> 2.34.1

