Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB29E7FDF0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 22:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0E110E4D4;
	Mon,  2 Feb 2026 22:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIT7OAL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03C10E3DE
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 22:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770069704; x=1801605704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KjwmlLkEBEsD1ffihZVEzTHPYZCwXpK+hE/YFvxBdoU=;
 b=MIT7OAL8DVbFWYmWDIbcigNYZ/PW7JV/t2ku5A+4p+JvnbYp2M+nzv7V
 qeX92jgSqD3ahhPkXTAl0KPokiSGBr/Rx3FHrXn8Py8z/6tZlUt7+UiX9
 bvOlOU/Ioa8TqLiwjmiSRtwDQRdA7UeyIGQ0VwyMP+/x2gYmxb6Pbtukp
 LHX05KUUEcaUqZh5lNRkSN1cJKu4hh8OoiRkckiuvAt1nxHPmkQJFXv28
 UpTRrcRfG3BF1VMIJ5TJwXvNupH9hrdnp3jBVx6kFL26h4u2PUwXFqBWK
 jBkCA6DHtOmKIGfJ3nRndpDplpquEHZn+7GafOzz61Uxqzw1ArZC1nEAW w==;
X-CSE-ConnectionGUID: GQ341FIbQyCFMPZoAU+0ZQ==
X-CSE-MsgGUID: 1BiWJongSK2oD04WTVPHoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71318479"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71318479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:01:43 -0800
X-CSE-ConnectionGUID: 9i6MCedwRb+ql54gSUlsuA==
X-CSE-MsgGUID: tR4J4I0pTm2slS9zhr6juQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209865273"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:01:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:01:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 14:01:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f02lqBeP1MXSnr+PrgXJI82aL6FmREYPZZc8eU9b4ZhO4ous09LU9fASzkg6lWLnR9xI5rErav2Pb8QV+5yHGSXha5R/8g+teCvBN8fWcMs2gumdUkINo0ocYdu+R6E2hxi2Odzs4+1U6w/Ubc9zH/5gXhDJX/EG7C1P5NumwnPxXla4HnJlFwgcB6CPmeAFqHJ4rkr1BTfa5w6XwAW5Jn6YK2Ht3PIOeZVSq8zH4djXgFkguWz/UT8UpsVCH9Xp0f7vKhC6N7cWYHBusph3SbAS5Habbuv85r32cHR12rzdClkJ2MUdXR19qxscKcLDMIBRTMhWaczSnCUkMimSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M7oHq3/C/VIKSQImVFrLxkHa8A9vK+uz5YTys6QZlc=;
 b=gMXQO4j3zkPruNcIYS+w5onOSVZD2dSONPV9MU+Bp1C4TeSsdV7WSeInsbHBqABUWLlig4f7IIfgtWDsiUhGjMhnOiHvWGJ5DvWUiKRRxU3hr6QuD/pvC8yxk/CPF5sHEKS9xlCxa+s6T1VkMYG2BQ1MRkxYhhroSfWKRovBcB9ckB5e5ktNrjcR77ozrNfJeaMg1PVAEC9tc5ngve+mh2TqQqZLjqKSlsu5j0L4Hu+g/9VCsiU7ypSC8LfDAdIPwlliGj1mgDkUsuNdR0a5DazG7PvvzAJNsvJV62vplpXobk9BWxGEGNyG3g5Zh3pXoLoD5xq47EjD2s/gH7KPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 22:01:39 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 22:01:39 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: RE: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Topic: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Index: AQHclGQ6Y4NO09KQMkColm32Sj5xTbVvrpzQ
Date: Mon, 2 Feb 2026 22:01:39 +0000
Message-ID: <DM4PR11MB54562AD6BF2CFA749F9341DAEA9AA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB6859:EE_
x-ms-office365-filtering-correlation-id: 89e21291-9d11-4583-7618-08de62a6a45c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?t4TEYaE+l1m6hZ7TGTk3MBvz4C9pTBkNCik4QJ1TJpZg3Hn4yxrwYPq/Ctvt?=
 =?us-ascii?Q?ETK6j6Jhy7dcxUW8JI233v8UmayhZoczF/IGfU4SYnSxtRUazXJA0NcUHnky?=
 =?us-ascii?Q?ofN9v/fMtfTRvoD5Kvrbhl0Rbzkb0ovo6XES3H35LmKgOVOo3dcvte/X2aya?=
 =?us-ascii?Q?FLa/NnRn8HbqWPJl0YSq4oWHiDtsNJhS2Cfy/xmFYxpxTZxNo4df/vVqknyf?=
 =?us-ascii?Q?TW/R0BHGIfOcLnAJQxnr+YeZbQfB8IMEX1oIA5zC7RnYoWunMQTOqOmu1pJx?=
 =?us-ascii?Q?5rl8Lw17MpnlKzz+0QdNB01IiEIPjw/8baUeKX6ZSte1D+wwrWQLHHaJJ6t+?=
 =?us-ascii?Q?vcrjyO488u/ErGNdhKX5mqJLlDK2H4RRSHymeNXZkOnZsQSxnb4PtP/nW9Qz?=
 =?us-ascii?Q?PWs+9uJO5k8EUmgrUuLP7iOqGy5ue2W9n8LbLCVx35p6ilNpRWZrcJPEMdqg?=
 =?us-ascii?Q?lk3biIcANPEtLTKQ/Jou2+UQQ4h1BKXiRYUFdoNTOHYRo7Yv/g3/d5aidd7u?=
 =?us-ascii?Q?yKzvEXxLgv9KRpfqXB9hGrv4IHWH4LDRSn9d+wM65dKlILIsNubKCj9agF8a?=
 =?us-ascii?Q?9TT/XBJGkTP1Qyl2yHdssYtLs74B5zk434fTUe+m4o0+XCy90kbWwARgHalY?=
 =?us-ascii?Q?E/XhBiBvJxdiL8mvmr4DIWDN63AkJegzj+m5dUf5hZlL/+8nMvhhl9KIBlAk?=
 =?us-ascii?Q?mF0U8ckep7rMiN/loQH+4ts+5Xcy6qlwZbHbL1UPaXWhHqzSA4cEj0tPZIiF?=
 =?us-ascii?Q?B1yGksQppvRLHbruez7kklGXTluCwE5hKYUoKHg2WjuVDP2FWuZceII8gQiw?=
 =?us-ascii?Q?cd+bZrj4vgfIzj5RCG/0kp2YkLujvEd+bBqry4gqICmejs+iiz8lcb0b12+3?=
 =?us-ascii?Q?6chh5uGs6SpHTxc73mZVSwzm24jx9qNp1awYrZw2APa0KT11C/ZCRGrZq5bN?=
 =?us-ascii?Q?ODsXnGc/x+ZdoPQ+bQVM7L5pmwFvbHIoDpyBvYxN3JBz5abKcj0N6aboakJl?=
 =?us-ascii?Q?syzONiQ4LKmWUGD4D4LEemRmJiucDI692WwN+67PmfNPIG6QP/VQrbgWbS8e?=
 =?us-ascii?Q?hIAIR4UjdY9Mx8opSJE9Y91obnAOLcSlK4ZMebwGOAww4wUur7h/Wbten5Kw?=
 =?us-ascii?Q?crCIFXg+NlScripZ0jZD3Y009mz1m6p/EqrdEJINdLEha21YA/FJKBkYveuX?=
 =?us-ascii?Q?8yRk4EbGdfXFt7T6jWnbwG4Kjf8qKvmrHxQO7Cp9+SpLrncKmOw3E/8CRuKh?=
 =?us-ascii?Q?og6osWEvMkdHOLI7HG80v5xWJqXAMXR+MQVtL6WKN6VVlX7pSessEdgrRZdq?=
 =?us-ascii?Q?eymev3lB/59Yc6lMqLeDEk3l/PQlPqWUU05Y3UGt1QVsDds2M56Pq9eR9Qn8?=
 =?us-ascii?Q?OQWVLI9UAeJBPKd9qo/7oqPkxuy9XXWzj30H5nuAtgZVPove7c7K+8ayYHsI?=
 =?us-ascii?Q?2Nw3TZSZjzF+OxX2914GNF0QnAbJ6w8Zry7aIfY6yZyQlbxdR+3qePDGX4n4?=
 =?us-ascii?Q?Qn9e5WnnSha329xeUrvPBF49584/rZBJOZPtT3pO/74ws7KTDQ1ls/eu2wyA?=
 =?us-ascii?Q?/sWoglsMIweIysUhIJeNJXrr0K3fbY18tSByPVUousFG0tsDyyEPSMriGOaq?=
 =?us-ascii?Q?MdxubpMvGQdEb3CruptJ4/Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pni6KZvKJPFPJ2vr+q1Ft170Z6CJt9utQqP8djNak8f6hvtMuPagaJdfRHVs?=
 =?us-ascii?Q?bc+m3Adhzs+BrP0b0Hn06j7wgtNBjWEQ/a5b2p78MY1O2mDKjNZwqvzad+5g?=
 =?us-ascii?Q?FeS6zlV8rVTz716a4dlDhucjlN7+LAtq0+Zuu75J+svKnJegR6lDwLLlutWZ?=
 =?us-ascii?Q?gCIK7vxsiKu2PgGQtTIC1HmUa+BIVB6erG0HxrxZRqgkcBCR+AsvCS9ih2vL?=
 =?us-ascii?Q?K7B+830h/uupGsUsSvMp7hiqER63kypCBAALBVSzwei89g7o2oA3a5JMu3om?=
 =?us-ascii?Q?DsTfNJk5E5VgiPXUwVk7zYWsPa9QfEoxjbBPe3rnOCDNTyGDkvpSod6qqp7E?=
 =?us-ascii?Q?sXUO/CTbKpmOEdfERDp8lynZAcIIphGpBAGW4r7Nx4GaPuWrKb7H/gSvSC5A?=
 =?us-ascii?Q?lMK665/rGenb36HEZCm70DRcztTBrabbHZIb6KVml2ggB7/PFqn3gwqYsWAY?=
 =?us-ascii?Q?HHFUiQQ5RiSoWAN3e1dUoys3Gt1jRWvsBO7NKrFPm6pwn0YOJ+gcTXCcu/Mk?=
 =?us-ascii?Q?2Fi/Yd+aFAon4Fs2H7kVCefPCQiGaT/zHdCIUf9gDHshuMA1DGZyM3QgozEi?=
 =?us-ascii?Q?ghja415eD+2fhK0u6e+gKu4EnwP9Zc6v5mFku10lhtQScE+/N+dgiSp35dVc?=
 =?us-ascii?Q?KUDk5u57wwnNHS+hrSgT/dvLNGSE/5YLVjk/B98FopMqPivr5fltdyhah/DS?=
 =?us-ascii?Q?wjjxaYy91d8Jd+lTdvQZTUuKJD7xUnlh7s0q+MjCGfHVuchaciTjgljkx7mZ?=
 =?us-ascii?Q?yT7Gs64C7wymOb9j+gO6HcBPn3ezDO0KQti6caNgerhTobWJmnFMUqJ7KVr1?=
 =?us-ascii?Q?fFZN89KX4CaAsgUdsWkoQkQRsE+OlTm1J1G2H6JvcBW/cRau2mOe6QPqvqU1?=
 =?us-ascii?Q?WjdsTnjULAjJJXudFiEzMxMjQ8i886IC65Fok78IRrFwBXN93uk1fU75PyRV?=
 =?us-ascii?Q?xDxMqcY0oGxppj2tcOAjru5kmR4xw77MFgeKfmOGHUCo8hxSM9L1eDWca2mt?=
 =?us-ascii?Q?RlLHAfrCb6WntHVxH/Ki3YqkFYpjOTaWiFbMv0hLPsmPLBoVKSEtHaMrQ8uh?=
 =?us-ascii?Q?Ol75nPEO82c5qPx7kh3NAXFHzg3kseMFSXB8wHXQaoGLZm+/IZ8Yertb+lLt?=
 =?us-ascii?Q?nTcZkTeN/rntQEsbh6mLeBEsRejMdR8uuQjuo6sv2B0nPqFrVDGZoVeGvu8p?=
 =?us-ascii?Q?DWbSp8uTPAfvA0qMcAmcsVJkExvLaItYtWRMPd8NNrS/qi82v5hJPHWSoJS9?=
 =?us-ascii?Q?kCx74ko9GIcrzIRDoKM3+tBlN9j+UHrfTSKEvAMIho2v5UVii6uLEADEYmKT?=
 =?us-ascii?Q?sew9OG5YPBdIjsL2uObBQtsb2/PFXgKNQPQP1WNjzsfYO7Fpm7AihHAzNIcP?=
 =?us-ascii?Q?If4sNiuSB8+jV+V4ZUnUdUEApzcsowE0Srq7wJoTi+zJIQXu6WuWc0PInrjF?=
 =?us-ascii?Q?wKxL6mPvSjjbPpLRgILbxcXg5vr78IIT6sWreu0v6DKvnUOR8Jhn6LB/atT/?=
 =?us-ascii?Q?XE2THK1KZ1Mukr8/9UURUrS/VnBISplk7mbBnbp1BHf7aDAEezXEIByBQ5Lh?=
 =?us-ascii?Q?8S1PCjTzy0v9GZdWwJ+NlTGQmWFmOXYhDt4IhdrTQmVoxmjJX0lMrS33Vaf4?=
 =?us-ascii?Q?+5bmiC/lNr/Vmwf1KFRo1utLtJBd2yEQAI3POQzi2a0224pb68gxr/Gw6vVN?=
 =?us-ascii?Q?JovS8+SF2+o0O3bDFxaq6lOXUJANJO+3P/3gjUTVv+TyJGmgGoqMgfJWEYoF?=
 =?us-ascii?Q?5p8QTThXDQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e21291-9d11-4583-7618-08de62a6a45c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 22:01:39.4544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mj6mZ4sEORWYLmMlfaSge/23esWAz5WoTJpjE0eqIYex6m4a+GUaiZ6lVlCw2r7mW87GMkUkM9+tcmg91Cejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
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

On Mon, Feb 2, 2026 8:54 AM Balasubramani Vivekanandan wrote:
> From: Soham Purkait <soham.purkait@intel.com>
>=20
> Add check to verify if CSC is a PCIe endpoint via pcode mailbox during xe
> modprobe. If this mode is not supported, an auxiliary child device for th=
e MEI
> driver is created as a fallback flow.
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
>=20
> v2:
>   - Use scoped based resource management for runtime pm (Shuicheng)
>   - Initiliaze return value of xe_pcode_read (Shuicheng)
>   - Assert when CSC is not supported as a PCIe endpoint
>=20
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c  | 35
> ++++++++++++++++++++++++++++++-  drivers/gpu/drm/xe/xe_pcode_api.h
> |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c
> b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index c1f15313f92e..48b830c99997 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -10,10 +10,14 @@
>=20
>  #include <drm/drm_print.h>
>=20
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_heci_gsc.h"
>  #include "regs/xe_gsc_regs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_platform_types.h"
> +#include "xe_pm.h"
>  #include "xe_survivability_mode.h"
>=20
>  #define GSC_BAR_LENGTH  0x00000FFC
> @@ -42,6 +46,29 @@ static int heci_gsc_irq_init(int irq)
>  	return irq_set_chip_data(irq, NULL);
>  }
>=20
> +/**
> + * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint

Nit: funcname() is preferred. Add () following the func name.

> + * @xe:  xe device
> + *
> + * This function queries whether CSC is exposed as a PCIe endpoint,
> + * through pcode mailbox sub-command
> PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
> + *
> + * returns true upon CSC as pci endpoint, false otherwise  */ static
> +bool is_csc_pci_ep(struct xe_device *xe) {
> +	int ret =3D 0;
> +	u32 val =3D 0;
> +
> +	guard(xe_pm_runtime)(xe);
> +	ret =3D xe_pcode_read(xe_device_get_root_tile(xe),
> +			    PCODE_MBOX(DGFX_PCODE_STATUS,
> +				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
> +				       &val, NULL);
> +
> +	return (!ret && (val & 0x1U));

Nit: how about adding the definition of the 0x1U? It will help understand t=
he code.

> +}
> +
>  /**
>   * struct heci_gsc_def - graphics security controller heci interface def=
initions
>   *
> @@ -179,7 +206,13 @@ int xe_heci_gsc_init(struct xe_device *xe)
>=20
>  	heci_gsc->irq =3D -1;
>=20
> -	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +		if (is_csc_pci_ep(xe))
> +			return 0;

One more question here, at the beginning of xe_heci_gsc_init(), there is:=20
	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)=20
		return 0;=20
And for CRI, both has_heci_gscfi and has_heci_cscfi are 0. So it seems the=
=20
function will return 0 already, and this code will not be executed.=20
Is there anything I missed?=20
Thanks

Shuicheng

> +
> +		xe_assert_msg(xe, false, "CSC not supported as a PCIe
> endpoint\n");
> +		def =3D &heci_gsc_def_dg2;
> +	} else if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>  		def =3D &heci_gsc_def_dg2;
>  	} else if (xe->info.platform =3D=3D XE_PVC) {
>  		def =3D &heci_gsc_def_pvc;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 85cc7478b787..391a98c8b5fb 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,7 @@
>  #define     DGFX_GET_INIT_STATUS	0x0
>  #define     DGFX_INIT_STATUS_COMPLETE	0x1
>  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
>=20
>  #define   PCODE_POWER_SETUP			0x7C
>  #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> --
> 2.43.0

