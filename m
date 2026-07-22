Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F4C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 18:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444310EE6C;
	Wed, 22 Jul 2026 18:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6trJqzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5D710E24D;
 Wed, 22 Jul 2026 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784744313; x=1816280313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3uUMYQQ6P0Qfl1uGvm26fyweUPsKFFwsrLBTzKiAeDQ=;
 b=X6trJqzRAQ4o4/zvr+y0GIgiaLl/WKJM6D0PazixmzqqEgxjepyglEIm
 m8Xf2pHipF0JcZaGKB7rMCetOTJFMzoDee8CFJKf3NAtMwzxHJUdE06yY
 AJalNNeQuhJUXDrd+rCXQHeSaq/GOUiaznh6hek39bYo7SFHTAaTxC3eV
 FdXFRXlicQdue4hzIETrVYqkZ+RxAXt5KarmX1qODy57Nqb/HARDOPLLK
 hNEJYUF8QYS15PhGZWGehWXV34xv67xvqvIsfUtiLpAwbX+DH7gQ1+rpz
 DQTUoQ3kCLvXbVxYxu/8hWfuUHzkzhRJq5fZMw0zXGguWCDL3UBqW7hGM w==;
X-CSE-ConnectionGUID: qjbEdfXZRymCgjUdyx4vTw==
X-CSE-MsgGUID: AXCAereDQP+CrUnH1dhzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96764264"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96764264"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:18:33 -0700
X-CSE-ConnectionGUID: lty/YGcbRw+PAyGQUtOOww==
X-CSE-MsgGUID: BUC4fe87TqW+UZ2kU6N/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="258232082"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:18:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 11:18:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 11:18:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 11:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWnrTo3kKSOtPQl8do6x9sJUhreKPBguvS2B501D5uhKG+Q1/m6RZFm18WF0xWPqxrxiqRWG2wQp180wqb9bkSZhkA1r+tTMWTSBlPBNy5XLB7mfvIZcOqD7jFwGhfd1X514ZyYGOB57JU7XUG9Awl9PjJrkhMu/2G94zOHlAp7iq0GVNJ9IkDika6snLI+USNe+vuX2JSjHguBTKQ2dbYvUeJ2jR2mpwqEg2GcXX0kKpTTm5QytnFP/YLqG/rpy4CAo3odEVvfNX4PiB8Ofe1sOEQZpFW2bu6vtL4LdyVHBhjdQ11+086pqY+ooSYKnFdcjBK4xYtzsRlicQTZCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y2dtB9EngagJSNtxuUSRAZAgCZ/6WIfhy7HsElLq0Y=;
 b=FX7w6pLf5AcNCY6/zJVFiyplZNJYtpbDanDMsvXBSIt3644rYx8n4i1Tv0CcDyyBadgGnNOGczLr56u+Vqybh7y2rfxIntoG4F5VGneiRAxaKMNantGzmtFRdEE1IWEgFGgnFPY6RoRNBrX8HVCKHqIkgm8qY3Hjl8HPRyUUw3WCsUk98Goa+9HbY86Otl0IW26rRcgXdsWZgLF46E6XBKsN3gtBorRlXcvTofhhVZjzckP3UGkjFSkgZ+D5ODYI24NX/AiJQ9yDh1JeutENlQmpBu9NrMQ4zFFUNEVpQt7wlAtJOS8ZpjuewgeE6AWkzDqEeDBPgYN7Vpb71Dprgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:18:29 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 18:18:29 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
Thread-Topic: [PATCH v2 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
Thread-Index: AQHdGRzUppt+RSoPmUu4tcO6z1nBz7Z52OwA
Date: Wed, 22 Jul 2026 18:18:29 +0000
Message-ID: <DM4PR11MB63606EB39110561DF0BD37EAF4C12@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260721142610.93804-7-dev@lankhorst.se>
 <20260721142610.93804-8-dev@lankhorst.se>
In-Reply-To: <20260721142610.93804-8-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB4943:EE_
x-ms-office365-filtering-correlation-id: ab2294d0-2800-40d2-6aeb-08dee81da178
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: i0RYCwz+tUHYXZIM9NA1UGYSYAdPMIhrMOnyoFzfDw+WyukmPCl4B/HPjxwxf+XOP/6B0ULh3BQrayMrAHIKDSlBnH2VZlg9yHTNzTbuleMxon5q4nLgTDy0Nj937vJvRYgUmIliU7E0SeV+F6/rvxBJ9vY5Z56MRaV1PXvq45KsgcBxrOIiFUpThmYNiTJpGXNpX/ucv/6slYY1diKF7TO89zw4phLGyEjcSKxoag5TZmBh9PFYOg6bU8KOOk5XhY1gOlxo93xGWj8rwSuy8tDoQElBuP7hzwN7SGeyrPXIIvrgdBJmxA76s/z0zxt5KY3mYvioN4aENpeRjN+qpRaEXYxMjHL2k3trO5CmbCuaak6mxhzS60mjJxdRwsuWSSpnlwZPi4CvEigNzpc0UBng5CqK8pSSxNfntoJqhNY7RZ4G/Cx5foSjt2c3YPMhz4rlkR6JSnvZAY2JTsnran8oKMgZExJZslZRSEAo9rLUpgf3HId0mJJAAwVJhKEWaINbSrvmyqz6lLKlFddxsl89qhsYzUoaYfy1Ikj1CIk7jFtz2kff+tBVqBl2nyVJ5QNz1Q7cdFJuwIrlC8dmqk+y9ZviuO1Bc13t6AI5DyMbV++EJF/m6ewmO9/jh8v3NpIo6sfRMSQJ3cX/wnPTUMigzL722XP+A84cZepAJi0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9gHYYJvXeW+jKbjRw8k8BtQL4jpap6LOMBV2SwrnbuP9fQD8vbHD0VkzXO3X?=
 =?us-ascii?Q?JnGq8RVw+73/OBszlJd6WCldyuRkPlL7G57jSUMJPg8Lk42bbHUoJCmsWSaj?=
 =?us-ascii?Q?wFSct1lAEMXao3DcECt2EzsPPg3Itx3K4huU6XUFXEbX226y18Ld5Nl737Wk?=
 =?us-ascii?Q?zlBFha9GefTw5nYIZG3Wa7Cd59l+R+hgCNNORsOn5EgatKf3pdVzHUGqERna?=
 =?us-ascii?Q?CCFrCy39YN9v/MNjJ+0Ih/BQcRXo3Ok1DRpW4bK/QVWZIvm7lrXb3cI+SYzD?=
 =?us-ascii?Q?GeZk1kE1z9tCsAE9DZMU7D9VvQFeC5aFtUULMylnGntquRBnKqqwa82bvJ5w?=
 =?us-ascii?Q?7V7qaCZa8hVrMV6aROcB54uCtVQVkgR6+M8MWlZYMBCZkzRhzMSeoczo4xnY?=
 =?us-ascii?Q?W6ZZkrwer9id2cqDPAZFbBQf5he+Klt3r1rEzbqL2bsyhlPQJi87yAhxWw10?=
 =?us-ascii?Q?tNKYhqedGCWyB3YCGByy3AbHtVvj+6pU1wt8KU+44sEKAV2u/VUcitOkWu9K?=
 =?us-ascii?Q?AuuCk9e9l5oaP/Zk8aaNZ7TCdjAZ8hxHQMGOAprrASI5dWshHu8LjdRanQWm?=
 =?us-ascii?Q?MGaJ3/O4lGvySrz0bvFawHYISk6IfTyE9Dvjil4Z5K5i7hFHlTnGiVqZfU0e?=
 =?us-ascii?Q?nVXwUn2hwpNt5EOplHBiFHSfX+Y9vPqH2KPYmMt5vGW5ZtnQ4NfsWAQoSYSV?=
 =?us-ascii?Q?ewav4Areo/kWjhOpOlZGDFTrDsNiU+Q11GVbL4ckdwlz0PbhiG7mCjORSutl?=
 =?us-ascii?Q?6r6GduRzGcfcBdOZydd9Zngdk9nBPKoED/+safrRM+q6qVOs+SwbY6UMlKm+?=
 =?us-ascii?Q?Co/KNFbqRaEsR0to04YbVlppFbqGB1xFuNKLSI2TLvOP/kAI26vzD7ZM1OXY?=
 =?us-ascii?Q?RODMrCsF/6tkUestCN5z9Az0KgCsbp7HJEebHQgwN8eXuLf1cID1/Vi13xv+?=
 =?us-ascii?Q?L+WYp6LBww4l18BlRqMvVlAcdOayXZV4EkoJSJJHwA31RqGTQH34ibZHJYKC?=
 =?us-ascii?Q?S+B9gyD94TvxdB51WTm0s+zqGmKQOiOaLJwbHGEIxulzRiISHYP8Pje+VYJv?=
 =?us-ascii?Q?immQ5Vo6BMzoyREeiFceSNdt617DVMpkAuXYRuLaAVu/nFRa6Cz2Ja4WRxE6?=
 =?us-ascii?Q?eSC9Q0Ecdi2109aOB+zBpiVbJO1ApcYaR8uMGGUMinMz508gKaqQlcuzo1Mn?=
 =?us-ascii?Q?/BTXy+m+vqlukULqfIL4pgcMDJ4WzdwHXa+N17ct/D0628KdgLZL7bM8B0it?=
 =?us-ascii?Q?rZRtPkMGrb53S8s6hIi+hu3uCOYZ25ql7chgCzObdu5Pr7fuXs6OkF3HfGt7?=
 =?us-ascii?Q?S5nm+YJDWSCYc2G0HxLPcJjxeQDwGcRop4BZVOkdAVEpp2F3lgPzWJYLLiCv?=
 =?us-ascii?Q?w0Uf7YpJFEeQLURK7lSYdA+oEeO3/yMsuBQcjWRCPZJoGm6mp6dKmQJzX63E?=
 =?us-ascii?Q?/QGM6M4IL/X040GyXMiFD/0ld9vCCOX6N5CWvtsxc9LV9tICoKU52lgQabkH?=
 =?us-ascii?Q?J7Hw3mPgTJNh2lrElpcdhPSE5Bm4I8DZT1NmUgTF7+gHKN5JgiRecADpSjuh?=
 =?us-ascii?Q?2ihSsQVQA8mtLUynUjofUfRUVjxC9qNzZQA2tRroY14Ut7lre/u0jMDE7XZw?=
 =?us-ascii?Q?qJ/aZnlWc9bRZDlRKQHXBRPM0bq2eq5WhRQfo5IzZ3VSW1ZrPLFR2z3VjXOb?=
 =?us-ascii?Q?BMzZRJPLZLp6wC2hKGO4SN6CMobzh49Gr7kW6JSHbtnu2wSTSGtam0RrvyQg?=
 =?us-ascii?Q?CmIgURfswA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LvNAmZthjPhFvpMrXkehYb4kuijoJHfyC/Rk003K7eVSDU0cpEEX9KBS+FxfG19BOYRefv6P76J0bdVMzBaoo4hi7GHQ+IR/GZXHAdHN+ONa8HlmtWVTjX2DWosP8Ms29KuWtEeuWbmOEeIUuxx6y5XZ6dQeSHjGLB6WIc29pjnulDgwhImGM0CCWdWFxC0QGVLwyyBSwsfqm6//BOKHWb0g1tfDU6FADI4sorVvBg4K6ua1s0gxOVVriV65iIMJIEehyfDorCPokeVDrFTwZpq3dHKvTLutpq+ZP1l+3uLbq7X9ky4o3URXP5witcjxj9vF1KbrP8hAv5bJ2PIXkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2294d0-2800-40d2-6aeb-08dee81da178
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 18:18:29.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5twQwBDqHyyERvSTV9NGMtWyFI6QQB4mGiowprQeeU9RzxpFI5bSzbduKnICUkZU4BVuL44fbC7hGd2wwfplQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma=
arten
> Lankhorst
> Sent: Tuesday, July 21, 2026 7:56 PM
> To: intel-xe@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Maarten Lankhorst <dev@lankhorst.se>=
;
> Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH v2 1/5] drm/xe/display: Avoid using stolen memory for
> framebuffer when media gt exists.
>=20
> On systems with media GT, extra latency is added when accessing stolen
> memory when the GT is in MC6.
>=20
> Simply disable allocating stolen memory for framebuffers when media gt is=
 found.
>=20
> Thanks to the previous patch, it will be possible to preserve the content=
s.

This line seems a left over comment from earlier version, can be dropped.

> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7513
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Link: https://patch.msgid.link/20260630135523.1775379-3-dev@lankhorst.se
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_display_bo.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c
> b/drivers/gpu/drm/xe/display/xe_display_bo.c
> index f5102cd0e95d6..9385026a80b97 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -131,6 +131,14 @@ bool xe_display_bo_fbdev_prefer_stolen(struct
> xe_device *xe, unsigned int size)
>  	if (IS_DGFX(xe))
>  		return false;
>=20
> +	/*
> +	 * Avoid stolen memory when the media_gt exists,
> +	 * because a lot of latency is added when media gt is in MC6
> +	 */
> +	if (xe_device_get_root_tile(xe)->media_gt)
> +		return false;
> +
> +	/* machine hang when doing lots of LMEMBAR accesses */


This comment seems unrelated to the patch.

With above minor nits fixed, looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

>  	if (XE_DEVICE_WA(xe, 22019338487_display))
>  		return false;
>=20
> --
> 2.53.0

