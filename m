Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37353C55173
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 20:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CD110E1DD;
	Fri, 31 Jul 2026 20:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GduKk0Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9E10E1DD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785529597; x=1817065597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jdvhtCbfH37MgyBWpjucwRBFcxJK3RbVSli29k68Na8=;
 b=GduKk0Tin7YJvXmx6s/fjOmRSrC6EW9RRV5kY8g0USwnaTtZUKKP2L6a
 QKrZGnxbGYatSukYPHdJzKvJJQ/oG8+hU1Kp6QDOPaDif8oZm0v/B1fmC
 x3XmKLnLHALxq2zNm82lV5SzrX70jlolDvUTHCWZfRvRi+q5zCezQJYrT
 nikdNbGzFxVs+rLTO0SvYqYihgesTqOsiT3H/9XiFNmTlEwp7e41OMgjY
 F4jHXpW2XdkEGF4kCHkWbx3nLIEaxCuJCCMWGS+Ku9m0wNPNHYnT2/sfg
 sEp05cl3u6xEd9E5hjndEle7IDj/3sGqdYSeda/FDxE+rA4aKL9rBA/yq w==;
X-CSE-ConnectionGUID: dDYP5IGzQVmm77omCl0LaQ==
X-CSE-MsgGUID: 8HvtYGmrTKm1c8dtQeIAzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86175491"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86175491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 13:26:36 -0700
X-CSE-ConnectionGUID: fmaA8/VoSc2OdVzkKrDksw==
X-CSE-MsgGUID: 74XHbFFTTUuQBm7T57y2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="284007656"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 13:26:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 13:26:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 13:26:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 13:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8vAI7l8wt5GFdLxlEnqst3hWPCqpJsRnNaghNnRlOGOkHPNifLguAhGQp2TFW8PkfoGB49blu4oWh8wy5ZYoM8MoASJT0M3gsvJCTYP9fTiKO52p5ypaycJX2pKfZG5LTXqLjAePdrXZIOFJvIhgSyh4aFEKjZ3p6ZNAfIMAtW0LncuSXBeLDubVPtdTMB8XFrOEba4PoNgfU06Db2isCOdX29OfKyc7CL0CZzL6ncpvMtbwLy9PzBbhC8oTcHkLQ90q0cxvyt1P9CA/7EryhFxKIccO7qz+ubryl0mmkzxy+HGW7wBkZ6AuSCtAR2nQZeAchfd/Rgqe9aa6E0tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vk+MZEQ5JslBbFsYQqpNUo5uuQYlzKl1t2KQczGWAA=;
 b=FCJyI1tjm5HOGslG4viQSahLYVk4ZIlV9JeaRvNadcICjc5ewT4F9rmY5NZpl+02eN+9JA38OeQId/rx5cDnyQxyZ7dAnaaowpHnzmnaTiAfFfPfNOMtXR2Bz7t2XiFPuLcYevh928wadFtquipNozWDkgwezcrqjr98fyi67MYkREwmG41gF1Qe72AW4CbG7zvt6Sh1DWnKMNbhWCUZEdXGknPtsAwBy8JfQvpJflolkBIeZ944MBYDZSgOrklDc30jz/bTYCy+uaqZNUnpBaea0eJ9cxfSWdrOJ2bDetJaOokViHBgSFbguSQXLnnRAFgf5L+hgsHzLXFvwlwKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by SJ5PPF8A8418B02.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::840) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 20:26:30 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%4]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 20:26:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Bai, Zongyao" <zongyao.bai@intel.com>, "Bai@freedesktop.org"
 <Bai@freedesktop.org>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
Thread-Topic: [PATCH] drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
Thread-Index: AQHdEx1kIGapErt06UWgnhhwAVPT/raIKIiQ
Date: Fri, 31 Jul 2026 20:26:30 +0000
Message-ID: <CH0PR11MB5395D957A67C52FFF1843A8BE5C82@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260713230830.2662760-1-zongyao.bai@intel.com>
In-Reply-To: <20260713230830.2662760-1-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|SJ5PPF8A8418B02:EE_
x-ms-office365-filtering-correlation-id: 57343571-ce0e-4646-dee7-08deef420196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|56012099006|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: n9whf95qJvrS0oCMgYw0EBCryLA7HP9N03tGGjk56W5WZW0ROyXvSyndIhCwr6Y/ElAbaYYYtH26z7Pt/eGfbMJyxio7aQI+4eSBMmMOP7OH7ycLVhFjmHh1Wqfe0PxgKE88Qjx/IiSvKcNuAGYA8OKPuOGPIwZI84gQVuI+5bt4dhVYsfOjw+/yX+9UXFjNUi0b1htf5sUFlZidtVwRsik8Nxg/dKBxNdPAgaWDDirMnNHkWAFwKxkXQbWg2k0ESf4d7URXpD8mi1AQ9nI/OShMovVUYNJisFAATmmaYBvI6tCKf+vgucSwPZiXClqzdihS0PAUvLleovF++mbQV77ylxK9ZOvotbl4sUcjbbHAX8ifepm6gvSdyWHc6yHMOj6yuV97hOQ3IbfHdoFhDnCZUHr+rC9GMClV7KOts6RvyoaPnHMB9hnOENdG58Ju6so4qaKC8hu/B/TX8QYFIvbw6kXFxhK8xMEwdlzrQgrfoPo3+/PTas25s44SIN6MqXTQmgNE8yZELBG2zsuzO0JuHyA6/9+xmgJjj/DDSNG0tmf1H9WEd1ar12MLNT+DKV3GMoWCfVpPwluaxqwfadHqYdOM9yYyjqhnu+06vUNm7KVk8Y7uQiOyKGMPx5ZGuAo5X91gHUWFsugxblTE0OqjRLJYAYfIdGJ7Cl6UsJdaf3k6WIYITaNV7T162ZHqDUfdUWqmIWX6n9NsdB5unQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YCPDxeyY+tRXkFyalMZg2F6T3cUwOAZCruTm9HrGtu4DlW7JPNsJaoIPtFRx?=
 =?us-ascii?Q?CGUWFcqMGHdnsPQUyHJzH5dvOa6q5pLnaOGOZRihO2jVxDWBcHDtL3l7mxO9?=
 =?us-ascii?Q?3o8T06nyXj9Ax+W56LXYHoqnRYIRAia1gaj/mKvU9uJdiXRMqVkzCCYHPuQn?=
 =?us-ascii?Q?VGdtR7i2kkhUXaKrTpXlpQp5lXusWlMd7a8XjRKK+SEbQG7CDNxBfJghHZ+1?=
 =?us-ascii?Q?ET9vdNvucsuZChnZWJ/CMzHaHHrsk4on2SUZIviMvS9fL+X6r8lm/vWcyfU8?=
 =?us-ascii?Q?N2qUTIYrZlGE1AyS3Vu3UgSwG5xxuYGz57EcgkJQ0QBMoYDwje9fi9wEmjE6?=
 =?us-ascii?Q?L9xDc84sSazkdbfIgG+7jvTJ4g8ghbDhYxur9Gr99BJUno1aT+jZ/ST2i3I3?=
 =?us-ascii?Q?IaNUh+QdI1YXW5j+wckSasFapiBjvWBvFfMHz4RrouSvoyHworRrBmv2ph5M?=
 =?us-ascii?Q?nEHsoCD+JyKefU6vTCVA3Dhe/aYSW6EwjYQR9BpEFwcqbJysqJuH79naCmoO?=
 =?us-ascii?Q?QJ9q6RDbmCghDkz12tRleQHsUIMBzetjgLvA9mz45wad6eP2jj9EEKpHw6LS?=
 =?us-ascii?Q?ek30bHz28mMv1v2bWIrOZ/IZYbmVYH8q6XT3sb6kYjSTL4qX/Kmr1z/1tyd4?=
 =?us-ascii?Q?/csK4YTAWEK2u11zDD3mTY9UiPCGagAbwMeThJg2qBd9M3Z6bZhu6AFe7vci?=
 =?us-ascii?Q?KN/cWqtqt7K2Gu+hwf6fhCWHph+yk2kYdMKFLCEf+Q3Wt6qnOGqaCmFNJqTG?=
 =?us-ascii?Q?d8K2IUT2DiKYFwEkgBwprSMTsBuKw4AuzvUYr5ZP3O38diRnFY5+MumW0WKt?=
 =?us-ascii?Q?d/M+Wy63M3fLEv/32xtLhnV+slaYopOP5JdduqFTPcNfI0sUF9iJb9VeNS9d?=
 =?us-ascii?Q?tW3iinTeNKUAdQSpsE+VqjAgE7xRoyq2Wye43YrJOW3x3tA9Fsq2TAZhM3wt?=
 =?us-ascii?Q?I3Svxlxs31WnQsBGRKf/+Ry5r8tB0oCEi66qFmlKmYH6Icw3jsaRERhjI4LL?=
 =?us-ascii?Q?1bdcwCYwR+u1k3MXNHFDF81+oyCZ6WkSjeuI4N/voJw9ndqZ1ayjItvK2Buy?=
 =?us-ascii?Q?HyZ7x9KphGnKvrRvt9UkLzVppbfzxUmgFV49kDHy/E4pg9bBepwvut9r7vFj?=
 =?us-ascii?Q?e+ee/VXUbXnKvwKQXDAUcWCrZCxXHaP4n0ZQ4DBCy31Ykt61o90/HWyU72XA?=
 =?us-ascii?Q?mLGm4Le/lPNE6bBYeY6FUa+ALuKo+PZwOEVRXQDaxTNrYBQSzyUNV/RBXj+i?=
 =?us-ascii?Q?3R6PnFe/7IETEw25GtRGDW4e5ld684zUJxnQwERjpi1CqafDZfBwd7PDD6AN?=
 =?us-ascii?Q?DdyZ6vMbyvvxWoigcavRv2JH73waZiy2cuP8hxqCj7M82S5Raei4J22JJVqU?=
 =?us-ascii?Q?wePrAMWhmbZhSi1vx3Fnfd5Vy7fdswnJ1GbKqubvavHDOytIfaI9Tg03eB0s?=
 =?us-ascii?Q?/1ud03xutiFgZuDDpIzJFcov9jDKyOSXj2CUn4i6GWXuYUoFHTFCwaK+kYFG?=
 =?us-ascii?Q?BJp5dVtiSFaiHFyfW5TW+ORa2RRobfN0ZpfUgw9mEK7353cTu+3ScBTUip2p?=
 =?us-ascii?Q?6n7KMzGXaE90lemH2CmFvTqwHNcF975KuLmMWvSD7arNcHciME9pAE8t30PJ?=
 =?us-ascii?Q?wYgSo0XOIkxLDfdMGhn6FDmJHM862FomhaZZS+e6vBReDEmuuACqbbpXz7fA?=
 =?us-ascii?Q?fS1FmNf2hBSlw4GThioCekIR48qPCk0M8+VhTu7mtWMk1SpqzXtcyvNyQCWW?=
 =?us-ascii?Q?weMOcDV3StxW5/fNnXMCUeQJNHSPbYXzzrR3qIzmnnvVi9L/eenhah4p9iFS?=
x-ms-exchange-antispam-messagedata-1: Yy8h5djAiWYvGA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DjOfEZ3KRtpz9TrT86o+8N3aS2kQCkLBtTZE7MPoVZWdd45RmyfIPP5pCgs4Gp7ewkUqwudQuxYG+O1I3uYeTAmpbKy3MaGL3QWTcuz18kA4LtfWbWBlJQZFAc62P3ZL8IKXc2dnCfu+u3CXE3TJWpmb9mXeptXTKow5GV2CFLro216D66Uj/GkD5AmHvBJFj2ureMByJBeebSOD8U1dJdSaascPQktHlSCPHbSYYn3kgLeyu1UPPr/mmKF+Xsp75jA1UiyBmcHxtuanxV8OlI9A1pEMIRXn3AcWpgNo/tfR4Y2YLT39BgZ0G2WCFkCylzszJ2Q0xrnnIOf6Rq0FcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57343571-ce0e-4646-dee7-08deef420196
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 20:26:30.6591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KcAbl91Cd0enFLkf3+6r50xLptkaEBqJHPdbcjzZS24py8exoA/Ue7B+gHTeSMPelHxFi0cqKE3o7idZAUb3rqiGOtqOdnRMSElBjHfB10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8A8418B02
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zongya=
o Bai
Sent: Monday, July 13, 2026 4:09 PM
To: intel-xe@lists.freedesktop.org
Cc: Bai, Zongyao <zongyao.bai@intel.com>; Bai@freedesktop.org
Subject: [PATCH] drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
>=20
> xe_pt_update_ops_init() resets the per-prepare address range and
> deferred state, but current_op was left unchanged. If the same
> xe_vm_pgtable_update_ops is prepared again, new operations are appended
> after the stale current_op value instead of starting from ops[0]. This
> can make current_op exceed the number of operations allocated by
> xe_vma_ops_alloc(), leading to out-of-bounds access to pt_update_ops->ops=
.
> So, reset current_op when initializing the PT update ops.
>=20
> Also reset needs_svm_lock and needs_invalidation. These flags are derived
> during the same prepare pass as current_op and are consumed by
> xe_pt_update_ops_run(); leaving them stale can select the SVM migrate ops
> or request TLB invalidation even when the current prepared operations do
> not require it.
>=20
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Bai, Zongyao <zongyao.bai@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e466f714bf86..598c6b2571e7 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2371,8 +2371,11 @@ static void
>  xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>  {
>  	init_llist_head(&pt_update_ops->deferred);
> +	pt_update_ops->current_op =3D 0;
>  	pt_update_ops->start =3D ~0x0ull;
>  	pt_update_ops->last =3D 0x0ull;
> +	pt_update_ops->needs_svm_lock =3D false;
> +	pt_update_ops->needs_invalidation =3D false;
>  	xe_page_reclaim_list_init(&pt_update_ops->prl);
>  }
> =20
> --=20
> 2.43.0
>=20
>=20
