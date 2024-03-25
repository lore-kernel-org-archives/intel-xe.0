Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE7CC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 22:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6E10EB38;
	Mon, 25 Mar 2024 22:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4fcT61X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59DB10EB38
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711405937; x=1742941937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/rZj7WcZivpdwgLcytXhAwUqAr3uBkNGPladxeBSVBI=;
 b=h4fcT61XlS4oUR5mLSOkAFPswGcN3rvq1ClyXfejUrodopEq30JKiWnk
 NMdM8xpR3JC64/n0hc6LGF7CWyJ7jEwqCW4gqtWR3d+A2ezylt45pyz8y
 9a5Kkir4Port/Crn9fSKMLdJCvtELgKerNoH4PF/xsZHj0Ro7P+sECVUS
 gRBx/FIAFJQIM4mx56+mSqq95LaxoS/v5mioGbw6q6KNtAzmB5x/k147o
 xaMF9K1dV4prxDO3PA29LfvKy9ShfbArMfib9tWxZh2lVubAAZFjdHVZP
 Pst/VaDTLK+NL2hroXCtTidxW9JaRRWS/cJ+ruKGiOTABrOXrTnqflPM2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17830377"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="17830377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20483528"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 15:32:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 15:32:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 15:32:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 15:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjkLLkjk1RLiO2M1OfomCOCYfWZcRDOhZeoQJ/TeRXB68vv7ANgluTGo14UWS/4D+osl//goeL2bPk7244wcN3rGVvJqKe/vprms9KXhZyvrl80HP0QZ0Bf1iNsL5XxoG67uDIvMqqJySikTA3Nn3bGt/FJhxvOA9AyoQrUj6wzW4QOXkBERsxysKVG9W81veG6+9m4nopFlHZzFwHNVRukqhiFBUJ0LD7BBiVnKtajLpjkOqkyuu5PVy6UbNGAuQxC22mFEPyqyabFOxaQO+mP5qmDOc6ozjh8ZUXZ3U9b/mpPE26MWmhvkVc8UuRzRoeiNDMZhWLgr8L0IcDvDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQtmyE7P9Czoa7m563jSBSbNFvXUNGh09JhCVXRhuz0=;
 b=iNlRQsdYznx63NUpIHWsqygtM85adAXjS94IS8H3Y/6hbTf+5+WErguCPUaWPkdK91O1lMYAfRzVHifrmvUaIvbPVu2q72zVMxqhSrIfhyxTvsJPrCavo1cu3hTFvcfr53GME1osu1iTghGs2nFirAhKHsJKz/leizDYPIdlSYo7ZO0pn+9jSzVsJMcG7gwgx4k01L9VsM28bOi+h5uJtXUQLhJyAQPZRE2P52Z2uUWosBPB+UvyVucXlpG/AODO6HoUs2Hla0vc+Gp5f6j0e/PZs8tTkwhpzECureKN9HmKTmko5D+8jvHv4LaGjK3iNAmQ9rOdka0C/mEF9sf2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 22:31:59 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 22:31:58 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 17/30] drm/xe: Delete PT update selftest
Thread-Topic: [PATCH v4 17/30] drm/xe: Delete PT update selftest
Thread-Index: AQHacRai4HJ+ApQnMkuwt69sAkOSJbFJJjfg
Date: Mon, 25 Mar 2024 22:31:58 +0000
Message-ID: <SA1PR11MB6991FAB76ABB24CF4B0276A992362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-18-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-18-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7252:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twM9YaYsyGRP+KToIZn4UzMMDjz7do0QhCTXLL+Pnc7AqPJJ8cLmDQNfMgfd/G0ztTwao05jqfM6V0NUlwYbX7Me4R2Xsg1AcNbBohxgw6hSGPuRyMfKh3Y6eNFjfB9ehHdAO0RIPbQxCD1nHPD6yICvwlWepor7aeaLYUcONPhgeI3f50ESvlbqNgC6rfSSk2oQ/BaXn/WG6siYxb0dCZ+1DqDlh2e0nixibKzug7Uv2PEjP0RffScSBzYFzoD0mZNr8Gir+SjP+E1HNp71nfwrUX+Ju35hiaAF7N410tLmOc2EyyycCWfbP4uwJt6bERIWXi5uHCIbj+0BsrFQcQZKtyw++exuMERrzoSD21fy1RnIx4HTJHAe8bQXm1cfLxkpOhIIsm/LskxmMbczQTm1mJhEvFv4M2PQuhc0wk9LHTSJpFWmogqMJhnk7ma2leVVkD3MvoLbcTp3ocTod6EW63370g9LLRq7VRa44G2YBPcVxu562QQ2ckjkBRH62fAKGTIAWUmrHNhdSJJtTF+5arUPNTyKcyL2T7Zus7eMwnZn0esdIuoOfgqD5Uwej5pUReKX+2SrRuQIcBFj7jB13h6vgTGsi6k8lyspUjcwTWY3vtTanjg8HYmqAHb9hvOXckVusr0L+q3MKP+7WbKwpvYhtqo2vF6weWcZWxk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MsaE+GY2OqRz2lbnQesowM4tLgHP0lspFUUquldWFG7cCEw99OWEyNXYaS1Z?=
 =?us-ascii?Q?oGu7A9czkPI+oaeA+iBvvXX7V9TjTaWqtyX1+A78JWNI5Scr9LzL2j/pd/5x?=
 =?us-ascii?Q?Bfl9IH36O05AxbU+F561hzq3qG1o8qKY1Dh+KazYM44ap4/GUdsXiJE/s4/x?=
 =?us-ascii?Q?mWJ8DOSDeOr1VQBc5qvc+YtqUtfimRHfY+zpKlE2CMDeNjfWvCqRtl8N2KrT?=
 =?us-ascii?Q?JUk1nVJ8DZlqw69p315XtGyPx1MeP9lO2tSfypE7H/qfjMaZ1rWqbPnE2O7k?=
 =?us-ascii?Q?9mkjQPfd3ZueinxU0tEGjlC5zdWj48YBWHS45OtBv5qp5ZunB4XoJKH8HPNh?=
 =?us-ascii?Q?/pA6ZqH5CYfMdznAIN3BTfEE0u/pHwUiiwXa7l3kMzqB7q6eGxyBN0N885EM?=
 =?us-ascii?Q?FEW2mTHgXusj5ppyEYHXtxQ0fQF3zk/KMFNJs9dVQ01eEaYE9cr0wCfZvTUx?=
 =?us-ascii?Q?rAbqJPsrztj48hbPnk9YGPLt77rcbttMF1TZjmfoZfnCqR1m+39BbxwsIt9s?=
 =?us-ascii?Q?dRMzlOMg3USAPV7aboIxa7aa27liP8kRJskpIJE00Nc0PCSuwq7hw/jUUE7/?=
 =?us-ascii?Q?Wh2brbBza+yQAK0TFi6OpfTmT9jnmBbRG3ucHwhIhM4zRrjr/kqgz+/gqAEa?=
 =?us-ascii?Q?Oz1tuF8j/PdYaCtYTxaLeqkvaaHmg0tyrzB9ARi9xDt1TbLNWkQFhaA+gJx5?=
 =?us-ascii?Q?yxwk6v7spSpHW28AXuveAcwj+hePbh6FyzEhoxeDAfQXtMlbzBPKw40BCOCy?=
 =?us-ascii?Q?EafhSI5j89qMlN3v4jRtdCYyXg13HuMk25A3huvWmI2HzuXQRJGBoxPHx0I4?=
 =?us-ascii?Q?JQLl7m8L0/9ebhFNw7EyOSallr7Rf0UuHuqgVYkAH+lAADmG8vaEXLsUCs8Y?=
 =?us-ascii?Q?hhSaUGZ6tJCoPlmguN5lK4Y4U091BIFdIM/ExKAsqJ1AslpZu53Jw6Dpbsj5?=
 =?us-ascii?Q?v9k1uM9nGePzkDJC+6Sk0zIV2/KlRN4MvAToExDRfIPRpdII+3MIIcrAl9tC?=
 =?us-ascii?Q?5v01Jg2VDu2p2CpdnPcPNixOh6y56ZgDsYqz82a3307dzLGyIT7FG2384jkY?=
 =?us-ascii?Q?RfUpj/AdL3pfztTJWo2voYh4elb1HFe1c7P5WHuyolfDU3VibqRsPPMufZBl?=
 =?us-ascii?Q?BJ4d1013o0+Q/2x16etVY2F6gyKGrsJhs1L/fQURBnYxogV6DiEpzeUmGmMT?=
 =?us-ascii?Q?K7gNBtiivS3W4JbLpS9MgoRnMGdEIDoYvMB0BGNIf6wTHrZ4dtWrHCq02Wgo?=
 =?us-ascii?Q?UD0sdIa6/FF9H2gGc2fuQknMjq+Zm87YqjZn1tyHvhkxdG5+c4GPQ8jPcpUb?=
 =?us-ascii?Q?v+bGEAHLOv5/RuqPf1Q/nMywAcZVLJLR54W7phCBqOA54dkinooQRnINAYe6?=
 =?us-ascii?Q?LJ3PuzDQpFO42bi/v9zGcD0Kgqt37SUYZ6NpJOKlRQHg+l19Hu1gW/RFV00d?=
 =?us-ascii?Q?8BzOuA4YcEXNlvp8vc0gHsyudE4aZOxTPy9Dhb5Qih5/o1RoHt3bMdSGkh6Z?=
 =?us-ascii?Q?dQ3fcoZ4+CyJfULe88gknxqPyhJ3v0Ufiuk/7G8YMaxAwYa+89YbfSQ38s2E?=
 =?us-ascii?Q?syblO5JbMv5zZJASLvFHcWglJmLl9pdh7Sg0tD4d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498f8a41-ffe2-4bbc-f605-08dc4d1b6259
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 22:31:58.8812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n77yptxT5pkRuiBNNeDxIBvfftsC5/fBMNifY1L+fuQCmgM3aBsOQURpKf2ktqtUJPNdJnQEvk3+hl0Q3/Rnug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

Agree. Patch is reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 17/30] drm/xe: Delete PT update selftest
>=20
> IGTs (e.g. xe_vm) can provide the exact same coverage as the PT update
> selftest. The PT update selftest is dependent on internal functions
> which can change thus maintaining this test is costly and provide no
> extra coverage. Delete this test.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 86 ---------------------------
>  1 file changed, 86 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index ce531498f57f..de2c1b7ec371 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -62,36 +62,6 @@ static int run_sanity_job(struct xe_migrate *m, struct
> xe_device *xe,
>  	return 0;
>  }
>=20
> -static void
> -sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
> -		   struct xe_tile *tile, struct iosys_map *map, void *dst,
> -		   u32 qword_ofs, u32 num_qwords,
> -		   const struct xe_vm_pgtable_update *update)
> -{
> -	struct migrate_test_params *p =3D
> -
> 	to_migrate_test_params(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));
> -	int i;
> -	u64 *ptr =3D dst;
> -	u64 value;
> -
> -	for (i =3D 0; i < num_qwords; i++) {
> -		value =3D (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
> -		if (map)
> -			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
> -				  sizeof(u64), u64, value);
> -		else
> -			ptr[i] =3D value;
> -	}
> -
> -	kunit_info(xe_cur_kunit(), "Used %s.\n", map ? "CPU" : "GPU");
> -	if (p->force_gpu && map)
> -		KUNIT_FAIL(xe_cur_kunit(), "GPU pagetable update used
> CPU.\n");
> -}
> -
> -static const struct xe_migrate_pt_update_ops sanity_ops =3D {
> -	.populate =3D sanity_populate_cb,
> -};
> -
>  #define check(_retval, _expected, str, _test)				\
>  	do { if ((_retval) !=3D (_expected)) {				\
>  			KUNIT_FAIL(_test, "Sanity check failed: " str	\
> @@ -209,57 +179,6 @@ static void test_copy_vram(struct xe_migrate *m, str=
uct
> xe_bo *bo,
>  	test_copy(m, bo, test, region);
>  }
>=20
> -static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
> -			   struct kunit *test, bool force_gpu)
> -{
> -	struct xe_device *xe =3D tile_to_xe(m->tile);
> -	struct dma_fence *fence;
> -	u64 retval, expected;
> -	ktime_t then, now;
> -	int i;
> -
> -	struct xe_vm_pgtable_update update =3D {
> -		.ofs =3D 1,
> -		.qwords =3D 0x10,
> -		.pt_bo =3D pt,
> -	};
> -	struct xe_migrate_pt_update pt_update =3D {
> -		.ops =3D &sanity_ops,
> -	};
> -	struct migrate_test_params p =3D {
> -		.base.id =3D XE_TEST_LIVE_MIGRATE,
> -		.force_gpu =3D force_gpu,
> -	};
> -
> -	test->priv =3D &p;
> -	/* Test xe_migrate_update_pgtables() updates the pagetable as
> expected */
> -	expected =3D 0xf0f0f0f0f0f0f0f0ULL;
> -	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
> -
> -	then =3D ktime_get();
> -	fence =3D xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q,
> &update, 1,
> -					   NULL, 0, &pt_update);
> -	now =3D ktime_get();
> -	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
> -		return;
> -
> -	kunit_info(test, "Updating without syncing took %llu us,\n",
> -		   (unsigned long long)ktime_to_us(ktime_sub(now, then)));
> -
> -	dma_fence_put(fence);
> -	retval =3D xe_map_rd(xe, &pt->vmap, 0, u64);
> -	check(retval, expected, "PTE[0] must stay untouched", test);
> -
> -	for (i =3D 0; i < update.qwords; i++) {
> -		retval =3D xe_map_rd(xe, &pt->vmap, (update.ofs + i) * 8, u64);
> -		check(retval, i * 0x1111111111111111ULL, "PTE update", test);
> -	}
> -
> -	retval =3D xe_map_rd(xe, &pt->vmap, 8 * (update.ofs + update.qwords),
> -			   u64);
> -	check(retval, expected, "PTE[0x11] must stay untouched", test);
> -}
> -
>  static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *t=
est)
>  {
>  	struct xe_tile *tile =3D m->tile;
> @@ -398,11 +317,6 @@ static void xe_migrate_sanity_test(struct xe_migrate=
 *m,
> struct kunit *test)
>  		test_copy_vram(m, big, test);
>  	}
>=20
> -	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
> -	test_pt_update(m, pt, test, false);
> -	kunit_info(test, "Testing page table update using GPU\n");
> -	test_pt_update(m, pt, test, true);
> -
>  out:
>  	xe_bb_free(bb, NULL);
>  free_tiny:
> --
> 2.34.1

