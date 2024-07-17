Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AB6C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6649F10E3FD;
	Wed, 17 Jul 2024 20:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu5Tuq/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D50310E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247284; x=1752783284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+nmX8PJaurVnGVPjsKWjSgmSvVEx5kFQ0jWN7UnDYA=;
 b=Uu5Tuq/CQsVK6nCWaxQqLz0cTLkggtU5dqvc9xQGwvfWHUoLbNvsoXuo
 z+ah0BcvdD49S5p20tdG1qb84l87nvxAbvpRKH6ybiBzV914coVpx1gyZ
 EpZbAvXIyfLEYbvDD5N4CHJUPyif65uY4t2nP/n6mNvl138KKhIeBGciS
 Szr4+hWI8O0dqPNq/V2uoVJWVdM0AMxHVHywN04yXTNE/av6HlKyKy+XH
 Qm4uiUyw3tVwRq7gj0QIHIdx0uICD0Mf2auLk/bd3xqxH8WVOZrMoNQYn
 ELmBG+xLJ2R9t6YqMwsgXul9BrpVjN+D9McsZ00uQROaHcqyaty2w1J83 g==;
X-CSE-ConnectionGUID: /i7Y29VPSpOpkw2LYz06EA==
X-CSE-MsgGUID: 1KOEazjRQsyS8h1UEnUG5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18915836"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18915836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:14:44 -0700
X-CSE-ConnectionGUID: 9W+KN2AIR5q0au5EyzvdYQ==
X-CSE-MsgGUID: 9NYWOyMTSjqMKqxvX7gT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50388454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:14:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:14:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:14:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egZVcD9CuLu/x35tXWqEU8EjPUJFnzcsIkADjOZKxZw3pBrtzo8LG2QdsNEDvYh/T1MMS3d0vajXub8M+bwr3U9XruxpxH26pb+87pyxcGxSCAimYQu4iX2o0rqrZvf+4nEVHl2pUlXsuuq++Gc+kiXgCb97S7sT0yNQrwdAhyog/XRoiJUhm5BkdrNor/8R+4XO4wWvc7tU5NWDLhLc86wZPxk2EsF+hoQEUJJd8k2X4xjT7BUy4fZogG96ZrvFUVo2RR/lakGW3cGh3dhiAqy6fTndBecBxVhnh6us61FWSykWuSBp0fEsk7sqsRrqMszw61CjJ8cOme4ociJK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0JNDCOZryaggw+3r7j2KZLxfmOzpXxOYhlvMcG3WGw=;
 b=FhdgdQAWWUeWSQcEmir0Bpx3GWf4JzKTMPtCraFaFukpbGFY5OSsKC8thP4VExzFJSf82O/4NF9o3m58rbAqdPMDGYLAITsCfSPQY50MUhcMpgfdymswTCvO1N4HTdmHpM94Bh9FbdPtBSUjzXIqqlhCy9AfrNjXNfm6haKm1lPQRFDUabRRt9a9v1mZ+h3gOOtpm3C53HqX28iQcehIuGqb5XXJWRJ3J6Ob++ntlhUpgJ3YGSBCBjF8IWYtZTc3boM5DTti3AakgXVh1GX1cscDrlBO+oFN9FHhXIN2DIjfxaMPvJo/aBbzOt7i8mBAjn9X7B6oMLxMGRxj1mVhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:14:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:14:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 2/7] drm/xe/tests: Add helpers for use in live tests
Thread-Topic: [PATCH v2 2/7] drm/xe/tests: Add helpers for use in live tests
Thread-Index: AQHa2ILhZrU1TdyLK0mb9ZPG6QFM/LH7WPLA
Date: Wed, 17 Jul 2024 20:14:34 +0000
Message-ID: <CH0PR11MB544423F22A2598E1DD10E51DE5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-3-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: 6c679dbf-2205-4840-ebc4-08dca69d133c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Rwrx0rPl8+nig8epNY45Gn+O1axMcdEMRa4o18M8LvdvWloYAO10LPEsdN2C?=
 =?us-ascii?Q?TvwkA3R+gIUkH3BremfYZLc0f41ugvT9Bh9sv0VH2li2RNUuZFW05w4Zjzgb?=
 =?us-ascii?Q?Y3pfkcM3KgLFd1rtfeFwsVTEkU9un42LXJoqf4cpIubD02FwYZU9HUxg/D6w?=
 =?us-ascii?Q?hO+bFntbDRpK//oJBKvOJYSsMLHYSX5kYjwEg3Vukn7EioL270TDwqrsFUFF?=
 =?us-ascii?Q?5Fo7GjiuaYdiwY6DyyCgV8MKxv5mxKWNRdGDJjFuGAUGlnlJeEzU5UVOivjz?=
 =?us-ascii?Q?+7TDYsa9dQdjfmw0HtmHBekBPpAWyD3w6QGfz8XPqRAbJqcsLbnbE7+e6R3x?=
 =?us-ascii?Q?zKIIkEsdAnAsKnUJ92x6WmAfCUOz7OQY1BvVPtwwsFdmD2UU7KxatLALqKGl?=
 =?us-ascii?Q?aqP7lfdJh+UuJQ+xMvY2SS/pLNtZYpfeJrgEjyF/WlnJaJRoSansu/5+Mo8X?=
 =?us-ascii?Q?iuAZeLnTs+zjketU32MoK/C3FouDqgpDQSWMKbdG68YODyH192qGNWf+7GXu?=
 =?us-ascii?Q?zy+9Ddvs1p3s9InZX9twfZ2NpqLlqQa44RvKLxJ1+q+IxsR7dhacja3V92RA?=
 =?us-ascii?Q?9LalFJchCrQkkvi2Wiyj6Lo+SCx2USj+3j99P9mg548b35u8RHkghHxrvUpP?=
 =?us-ascii?Q?iYvdidA/hRvWOadZCk/b0239IwsZ1iljld5jKA2r+yAv0CYVBdruefp7WfQC?=
 =?us-ascii?Q?iPT8vBr3F8CanqHxype5s3+YA4YKybpwa75xIuOcZM8rv2XL442St0a9TK5P?=
 =?us-ascii?Q?UaDL6c+K+6oTI+hFifTquin9iFBGnMWiBt18gQLD3aDy6EHDvRizEJ2DiYrm?=
 =?us-ascii?Q?DeHvxYOOhaBjsjCNQNgR2fVKUDVLOAFBp87GgoHMO4UYk6DZLLHUWBydto0F?=
 =?us-ascii?Q?KQR0EV/MRgKk63Znan/qCk5jT0Yja14Cxfay7RsKK1cEw2UEndJJcj1Rypiy?=
 =?us-ascii?Q?FLndP8hxCHsz1aQDYY9a/SbzoIjLlbfjDLSSPyDJWxxZpYrEwaJuspUPCzbF?=
 =?us-ascii?Q?i3B21uvCPeUF39Wro+Kc1duSlDvUrSUsZO3keSN6KDjNzKtGTKRtTm37C09L?=
 =?us-ascii?Q?qSPwNsYF6tYDT8xn+PT2204DRLbirkvloa8SScrScFsPYdcZoJOXp4CExo/8?=
 =?us-ascii?Q?gQtUG6pFffkSTbTP25lrfR/q9aUhqVqBWjTsELqnQHkbsTw9v+0Xwkb/wuWB?=
 =?us-ascii?Q?GBOwSMQeMJ+KXmhibn1e5zzvjUkisDrHlaQkp7d55eyeBvllZhYAxzCnMahr?=
 =?us-ascii?Q?1Ppp6LQyRG2eCVpU2qSfn+TLwv00mpYGjhzftL2pvNjSRVv2N4tEPuG7CruR?=
 =?us-ascii?Q?n9hP3AwfjSlFrpvVdNEReLIFwUG3aC0aXdnNeowYArT8MuwayTgzNr+PYl27?=
 =?us-ascii?Q?bE9ywzIvjHK8iJNGX0Dz5/65O27XB9ugSvai3X7ZeW42E2p7MQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WHJvElzmz2ZBYhN+WWYL+8GPpEgWUEZxIyjRymc21f8z8gtRlI5qPjUcFOfQ?=
 =?us-ascii?Q?K3mAJsllF8YBJ/zDoSL/60crG7WAsYlo/6ip4yqV61UcmwGAeZL1aB8zWa6w?=
 =?us-ascii?Q?XQwG0fWqT3I7QaJiQhPPFPhlrXSs1I++Qky/r7l7BVudXWJk7/0yEJ5Xxkbo?=
 =?us-ascii?Q?pAwAJOalOkv9f46XM6RiJAPyg68Y/nVsb715kJCEVPsN8forIJ3IxM9Nc4hE?=
 =?us-ascii?Q?4wnksdFOIVJBPnVMjYnPuXVM2fgesICzFd+Sm55vsba3GyQlwdf9uBdCXQwe?=
 =?us-ascii?Q?23M17ZKzcKdlTTAT3jW6Se9dp/7pSNLVG9AEXPh29sjP93hRzDbtGCsiMU5n?=
 =?us-ascii?Q?7feQHa+hMMYe2b9pIpHbmBaYPoHWE6uLoswm/qB+jO0kcQZ5loCl/4YP4kso?=
 =?us-ascii?Q?XOHlMWQXBl51Ndf+ZoFhemg5Z8JYOdeSUpPxeUr1a/eB8hE5UsYGiqrxX/fy?=
 =?us-ascii?Q?WNv01axjxHbBV9jxkr5R3RZo8ZqYCFi/6MxU9NdOCKlYSH12gpKRa4tESLd5?=
 =?us-ascii?Q?BZUApiuD3glSLlAI1PCasuwG6M4SufBcZ7M7Qac7njL2+j+LjSmITnM7q3cx?=
 =?us-ascii?Q?DmyjtRw5wSXrcyiGwymSrIZ1bkKi+RdaNGd+GWXXFJ02BnHzOcMoszKz0Jn7?=
 =?us-ascii?Q?h36EqszozhkFLmgcmq8jjk7OETcGX/oT/XfYlNZ5cqask9SQVR/ohlnW2TXF?=
 =?us-ascii?Q?JrmiRT4+GRjHAfG9Cd9EVRZIdSpNR0CQbpLk3s2oJ0o0Qpf+oBFs3VqtKEWG?=
 =?us-ascii?Q?lQIm2oMUNPFoSh5KNBB9lfTrPn4lLCbSlKwe0xtdl8ZlU4rsM23A99ekYEe/?=
 =?us-ascii?Q?y/tK/Jjm1tXQRHGmNeD1pfptWhNbJlDDEIQNC8nJ9X2c42df+JKPAAdv5M8q?=
 =?us-ascii?Q?uttVT3nNUf84/FIgG19rzS6c4smy8DyFtM9XbS0HOzFKOEHdEcZ0Aj8+K93h?=
 =?us-ascii?Q?F4xbdwXQvX3U5bzhL7V/4B5iB93odsCE/eH0XwJTRvr1kOW0c2lkLI1qOxGX?=
 =?us-ascii?Q?tHExXT+2xyfiQdRDTP0shNJy5Bks09fbuWI5llzI54B3xLmXh2LzGlOQ8Szf?=
 =?us-ascii?Q?XNgQumYbAbbg84ZvNsNmTzqe/d7Uc0tFUSiK6ppZJ7DHaRswfx07X+gNq2jR?=
 =?us-ascii?Q?+yk7YHZc4vbpp5MPVQc1aC1NOLkRgVTfJOkzjtnXyHrQ4tR+7V+lPbFJg9tC?=
 =?us-ascii?Q?awmGXy2bA4a6dMetaRvocof5BZPGnCGOIdw6TWk1/KOFaIR8JPJgsNpJ6iVE?=
 =?us-ascii?Q?TwzinxE6aZPzI8jOy4LljChaydT1b+KcqvtIvlEFNa2rzQNK4KI6RIUA76I0?=
 =?us-ascii?Q?mdIwlpjzZOOzbmqAquIMPQlGovxVcTo8NxugkomuCHTrMXtmTO+tfc+lOLVT?=
 =?us-ascii?Q?nma/5Ifqx0525DB/gciBwFxo3J1430SDVkSct0IvNGSH5oxqYnY+LYGKrSvR?=
 =?us-ascii?Q?int0rglk5KusnHTqGktcNQ8zm27k4hJH7+i8qf+JHEAyzh9oSLavhCReO8xv?=
 =?us-ascii?Q?oyLpYbDCQKTH54vkywqYzbQy5g32dn5cbyKoKU/vHodGiSMin7TjjlrTsiW6?=
 =?us-ascii?Q?dwijT6EyUayZ+eTfT8sz9I555IIkqYFxAN2XWP43?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c679dbf-2205-4840-ebc4-08dca69d133c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:14:34.2297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNOkwJH2zDUt1LZq1MEWTluz5s3F/rvM6n63xhWxHL2/5mbKlARSIwwS2GdQ2TVQzva26RG/HZ2HhQw/j2Zk6kf9Tkw0caKH6M0tKWKfsGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 17, 2024 12:52 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 2/7] drm/xe/tests: Add helpers for use in live tests
>=20
> Instead of iterating over available Xe devices within a testcase,
> without being able to distinguish potential failures from different
> devices on system with many Xe devices, introduce helpers that will
> allow to treat each Xe device as a parameter for the testcase like:
>=20
> static void bar(struct kunit *test)
> {
> 	struct xe_device *xe =3D test->priv;
> 	...
> }
>=20
> struct kunit_case foo_live_tests[] =3D {
> 	KUNIT_CASE_PARAM(bar, xe_pci_live_device_gen_param),
> 	{}
> };
>=20
> struct kunit_suite foo_suite =3D {
> 	.name =3D "foo_live",
> 	.test_cases =3D foo_live_tests,
> 	.init =3D xe_kunit_helper_xe_device_live_test_init,
> };
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: can't rely on test->priv in .exit helper (CI)
>     for cleanup use kunit_add_action_or_reset() instead
> ---
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  2 ++
>  drivers/gpu/drm/xe/tests/xe_pci.c           | 30 ++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
>  4 files changed, 73 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/dr=
m/xe/tests/xe_kunit_helpers.c
> index fefe79b3b75a..bc5156966ce9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -12,7 +12,9 @@
> =20
>  #include "tests/xe_kunit_helpers.h"
>  #include "tests/xe_pci_test.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_pm.h"
> =20
>  /**
>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit t=
est.
> @@ -88,3 +90,40 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *=
test)
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct=
 xe_device *);
> +
> +/**
> + * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
> + *                                            use in a live KUnit test.
> + * @test: the &kunit where live &xe_device will be used
> + *
> + * This function expects pointer to the &xe_device in the &test.param_va=
lue,
> + * like it is prepared by the &xe_pci_live_device_gen_param and stores t=
hat
> + * pointer as &kunit.priv to allow the test code to access it.
> + *
> + * This function makes sure that device is not wedged and then resumes i=
t
> + * to avoid waking up the device inside the test. It uses deferred clean=
up
> + * action to release a runtime_pm reference.
> + *
> + * This function can be used as custom implementation of &kunit_suite.in=
it.
> + *
> + * This function uses KUNIT_ASSERT to detect any failures.
> + *
> + * Return: Always 0.
> + */
> +int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
> +{
> +	struct xe_device *xe =3D xe_device_const_cast(test->param_value);
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> +	kunit_info(test, "running on %s device\n", xe->info.platform_name);
> +
> +	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
> +	xe_pm_runtime_get(xe);
> +	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, put_xe_pm_runt=
ime, xe));

These additional checks between tests might result in some new
error reports getting generated in the case of test case overrun,
though I think it would be better to have the early detection than
to discover "new" errors, so I'd say this is a positive change.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
> +	test->priv =3D xe;
> +	return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/dr=
m/xe/tests/xe_kunit_helpers.h
> index 067a1babf049..83665f7b1254 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> @@ -14,4 +14,6 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struc=
t kunit *test,
>  						  struct device *dev);
>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
> =20
> +int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests=
/xe_pci.c
> index f62809ca8b51..ab570dbb71ac 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -167,3 +167,33 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> +
> +/**
> + * xe_pci_live_device_gen_param - Helper to iterate Xe devices as a KUni=
t parameters
> + * @prev: the previously returned value, or NULL for the first iteration
> + * @desc: the buffer for a parameter name
> + *
> + * Iterates over the available Xe devices on the system. Uses the device=
 name
> + * as the parameter name.
> + *
> + * To be used only as a parameter generator function in &KUNIT_CASE_PARA=
M.
> + *
> + * Return: pointer to the next &struct xe_device ready to be used as a p=
arameter
> + *         or NULL if there are no more Xe devices on the system.
> + */
> +const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
> +{
> +	const struct xe_device *xe =3D prev;
> +	struct device *dev =3D xe ? xe->drm.dev : NULL;
> +	struct device *next;
> +
> +	next =3D driver_find_next_device(&xe_pci_driver.driver, dev);
> +	if (dev)
> +		put_device(dev);
> +	if (!next)
> +		return NULL;
> +
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", dev_name(next));
> +	return pdev_to_xe_device(to_pci_dev(next));
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_live_device_gen_param);
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/=
tests/xe_pci_test.h
> index f40dcec83992..3e2558bc3c90 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -35,4 +35,6 @@ struct xe_pci_fake_data {
> =20
>  int xe_pci_fake_device_init(struct xe_device *xe);
> =20
> +const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
> +
>  #endif
> --=20
> 2.43.0
>=20
>=20
