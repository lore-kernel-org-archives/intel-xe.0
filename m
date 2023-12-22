Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CC2C46CD3
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 01:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD610E03A;
	Fri, 22 Dec 2023 01:56:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8AC10E03A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 01:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703210193; x=1734746193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W7aLtSTvnGwnHqb8xQmgRqrRl5rquQARgQEz4tC50lQ=;
 b=G607JdS9pyjOJ60FEyrJVspqLSekw7VloE/pzIN4WB87TSU1tjCeMXVN
 CAx3Zwr0ACQV4Ev5RmoXxAp8k5qyGnZ50kjpah1hpfGKI74vU2/YAr3N/
 kuJSTnsIuqmiUDL0FRxyPiy9Rj1G2Fw/ciJgGGGEtP4x5YnCA8dnTH+L2
 bKpR7Hrpe5KsezU8uXhYPl8uwXJO0pmmx1UzoBNUE3TuDE9VBPRm+cXfV
 zSZfWVSnv0APQHwCyFKBVeMdyicrm5+BPAsXh6+OSh92C4BvoipU1i3aU
 lFq28cyArMXhRUvZ8MvFpeoYZQdGA7LkvVsuife4QyGArN2kmnYdKSc60 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="17623780"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="17623780"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 17:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="780403081"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="780403081"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 17:56:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 17:56:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 17:56:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 17:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTZYKxN7hVEMwmdrkiIwB0lhdGRMfAoQbl/99rX3uVdDe1LtB0knLL5/pBKmaDinxTwE7o0wqizM5Jml6J0Zz+zK9MFPDTyediKZKoU1Bb/5FwdPbHOFsWKUxscJ7Xe6aXIwTevLCaGf0Z+QKxMKOJr/I3uUBr6FfRVy5/CUCESKm4bTWoAjMjkkIoXCL3y4L+wE8oLruZK5Egw4n4KPpEq5JJIbvXCH0pquXutqIVtZQglrbMRSrSMlApnynLeafl6pFkNazPixzEgCGqM7y9n2RTX7+/X8ehc8ZOjn7lwOYjk3PnujIHkRZT9Os9nE/VzL+TCOeXeQ/foTelxjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZjiTOovF3OhdaLglhwevs+sRjMDMu6AX2++A4K2fyo=;
 b=NkGPlnu5dmhYWy1P4OMiyj3qg+BN7+dtGDiigVWROJtY2IWZ7SUv+2QvUjHb91uogVBtasslyXtgxJtEsBeckATebceDugF8FZj/SxNHP2V1HmVY+l2WjE8jdE00b7jP4R+xpBZh0S+bWtnkVS3ckFgpvjKiXtiPInWpAv9HJ1WKh9m2CKw9Etc7fBYAWK/zkb5Tq7YBvrjaQKXXHy3vfOvyBMKIfq1pXuCKX7EMB/H5FtllbxRuRknPIXdW7rVKtj3uTcTviv1vol3QvPLSLSRja76xVCjieUGQoYSQBu6UX9/a641+DEXpezTxSIO+fYGWyVOIpeAXgpCAGHX4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 01:56:29 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::d285:c1c1:9f25:ea47]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::d285:c1c1:9f25:ea47%5]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 01:56:29 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gandi, 
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] drm/xe: Add mocs reset kunit
Thread-Topic: [PATCH i-g-t] drm/xe: Add mocs reset kunit
Thread-Index: AQHaNHipho9wWFhhSEacZD499tndmLC0itqQ
Date: Fri, 22 Dec 2023 01:56:29 +0000
Message-ID: <MW3PR11MB474870AD3568B76FF5125370AE94A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231222015049.815061-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231222015049.815061-1-janga.rahul.kumar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW3PR11MB4745:EE_
x-ms-office365-filtering-correlation-id: e39c5809-48f7-46ff-9d01-08dc0291371a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWmZv6rabWExTp84Fay00AxDOypMFAbwL8CQF/UoTsZg8rVcTq7G/te6pZPTafsx6txAvOQRDApaMH4Kgs0s8pqmKTEfVMP9vFpCBSYCEs+4XK4q/9gx7fFLuOGkONhmidOcgWFKmyWnBg9OeJse/eifFrrebf08yvONSv+aefBpDFWvpA/ZAjhPrJA3/ujOpoEhKX9E4E3+1RBiXjpwwDdHE4xf5Kbb8iFWkCATYv+uUqfTVZ37Qbvh71TYS36TTQwhE9tNImmVx1yEpZEqD5BOSzrLTpfxOR0evx1PVoW2TMpVDfV0KUtIplpYNrCkNI/boI/eL1uCxkMiiq8wzvKr1SLl0OyZjKhueKKj97C3wczx68m9lYx1CP4Gsr9/TYnDFwO33m22JG8RVCYGcFk8S7yC8kvj1sdCmsmCFZb+X17pjD4OhK1zuYFD+GQf8t82FoUPxrQpojHIhiV/cAf0dbXJamWWx3mThmhibh7weCuO0R7UbfF71XYDst0Ywe45i0Jj18do8yPt7WBwR8A1M+KW6QWNvg3eP4wGwdz9ffBKsGM8x6TwIE5b/nWcMqK7G1zI4JYC9B93tVIdVf1qBZWG+o4xpkX/z2QiI5bA/5+EEkxhN8X9+bV+tmjE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(4326008)(8936002)(8676002)(52536014)(5660300002)(2906002)(478600001)(6506007)(7696005)(9686003)(53546011)(66946007)(76116006)(66556008)(64756008)(66446008)(66476007)(110136005)(6636002)(316002)(122000001)(41300700001)(38070700009)(83380400001)(38100700002)(82960400001)(26005)(71200400001)(55016003)(33656002)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ha7+Wyxubiom/0WITOhQKpx0OGfmLg337oORAVjWh0wLbWp/YVf4sk1NbpjJ?=
 =?us-ascii?Q?UjfOJ+qePhpNhusVKDFnuz2tqyp/Le7MOXJLL3FKdU0kUfIEzrW4lnil5x24?=
 =?us-ascii?Q?alUf1ViH80OUaF90H1XrUyi0Y775wJN2eQ6+k3pTjEmGktWMKY5NAzdR5zHK?=
 =?us-ascii?Q?3jUgJi7gy0dY9y5xmqbpMi2EMbxA+n4vimTgOeJEUt89SJy5UtB5fqzzXk7z?=
 =?us-ascii?Q?edu1/ZI391wopuaMMpyl3L57RfL+b+EGfMcAao2SVU2Z9MzZG3yX8KrCOjW6?=
 =?us-ascii?Q?i2R3A01/0GsxUUa4uDIzyUOn/udGabokCXBkbd6A36sz/bMJxrKOr1Tos3E1?=
 =?us-ascii?Q?2vltLUZ1m5zhnDuDbnCoG7CsezCnHh2aPt323QeNRz6164FVrHOKaCMzCERU?=
 =?us-ascii?Q?XZVl1NZh2UuOihmJ08QpGCd++U3DJ0fMmvg4s2b/yIOvdHrROeJObnkfcCeX?=
 =?us-ascii?Q?3Xe1wpDefRc5v3W158pkNA8Xn3EfHf2af6d1r/ks6kZcdRB/n9GMZ7JWUP6w?=
 =?us-ascii?Q?Q2922Oc6uIPFTKIyZ48jyamPK/jeiIKz7GB4tOUwA/M/qme27p5pG1o5U8tY?=
 =?us-ascii?Q?AVxPyWRa0y/xFVPv2RvfcqGndV1CbaDFRcuaMBmCA3CdalvorJXiMWTWuSXt?=
 =?us-ascii?Q?BbkiR0Buly6GZbqSB0c3bqMXoqEGzYpsFHj545CgzRTw5bUzu+2MER2uHXQV?=
 =?us-ascii?Q?r3y4IzIPo1dO1lpKIr2n5JeddluHMXHAZ+puUHqRg8vqAIphmXBknRcO3xlX?=
 =?us-ascii?Q?BGaEiSLuI0V69+xg+z4vCgBF+myxo/KcZFKvAxEyw8GNJE4LQRqvZWVxUnvf?=
 =?us-ascii?Q?Xn+oBQIHwkkF2XlYLMTLrrTla80cgyHIeVc4FtPkNiWVZLbwkH0NK3prrvtF?=
 =?us-ascii?Q?guTMaNxXpD2jiZocsAAbNcZcqFgla6qp6n97E75C+I5sKnULTN0+rfWAN632?=
 =?us-ascii?Q?9VCfSY4xuR+F4PD2FYV7KKgNm7kWr4srloel1qiaoBY9kcqpI+vQqKNKl4JX?=
 =?us-ascii?Q?Oe8EUyFaV4WiHXetl2hDwn/hZjIrkGrlO2srlPb0gUBl1NsrJdkB5O8XjCvT?=
 =?us-ascii?Q?RAhnRk5O2GqoG2ON7jUONbvE0rlwWgpWeCKv18wZ369YL3KHSXkPPCgza74r?=
 =?us-ascii?Q?rX9dvh0N/EzUE+rbGKktJAUwne9C69M+Ab+cV8qjG+6hkx/LNGERsiuYLwoF?=
 =?us-ascii?Q?9qoOEc0EZOyZ5s8Vw8X2XEZmi1nxqduf7Ce6f/fsVoXt7jBiFqjBsgeGTb4h?=
 =?us-ascii?Q?KusxKNMqRHfHCZeDQzSTKCjzo7skiZ01l+YLDbrMciZYE99CI4jIYRu1MSrM?=
 =?us-ascii?Q?KiVLbEXIMbBkCJNzaLbIyUNmuNycaC0fWU6aChSK0BNaWk+paC736XSioCz3?=
 =?us-ascii?Q?nJCYhhN1ytPYdEcDEdk0oRpQyzCs3WHr7JY3bnRvEckc7JplyQmQvrYU92+C?=
 =?us-ascii?Q?Ktm9usz/A/anTquvwlxefHGhg0XH7kbtJjH6muEEIHElCO7umjsJrG/RkcrQ?=
 =?us-ascii?Q?YmhUzjSuKt1CSrlI8GwRsOVqQrZTUYhTS/sYzKVYIAZ1jwsUdNlygLEDekJC?=
 =?us-ascii?Q?rvuIAV9SKkW1NmjkPKROzNgn9KwfcBo1JSdODDlOyMDEyT68rcpbpsJERDzz?=
 =?us-ascii?Q?kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39c5809-48f7-46ff-9d01-08dc0291371a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 01:56:29.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+UY4F7nvFB3ESoXEe1HuG8AKk02WwTB+WwmRP7RGjajPEwTnKt3DZcQrMNf0zvXoYXQ++D9p8WAfCECelayDP7N6R3zsTkmMUVeAkjVffM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DO NOT Review this patch. Invalid subject tag has been added. Pls ignore.


Thanks,
Rahul

> -----Original Message-----
> From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Sent: Friday, December 22, 2023 7:21 AM
> To: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH i-g-t] drm/xe: Add mocs reset kunit
>=20
> From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
>=20
> This kunit verifies the mocs registers content with the KMD programmed va=
lues
> before and after GT reset.
>=20
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 38 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
> drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
>  3 files changed, 40 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c
> b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 7dd34f94e809..98dd63031c5c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -128,3 +128,41 @@ void xe_live_mocs_kernel_kunit(struct kunit *test)
>  	xe_call_for_each_device(mocs_kernel_test_run_device);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> +
> +static int mocs_reset_test_run_device(struct xe_device *xe) {
> +	/* Check the mocs setup is retained over GT reset */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +
> +	unsigned int flags;
> +	int id;
> +
> +	struct kunit *test =3D xe_cur_kunit();
> +
> +	for_each_gt(gt, xe, id) {
> +		flags =3D live_mocs_init(&mocs, gt);
> +		kunit_info(test, "mocs_reset_test before reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +
> +		xe_gt_reset_async(gt);
> +		flush_work(&gt->reset.worker);
> +
> +		kunit_info(test, "mocs_reset_test after reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +	}
> +	return 0;
> +}
> +
> +void xe_live_mocs_reset_kunit(struct kunit *test) {
> +	xe_call_for_each_device(mocs_reset_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index ef56bd517b28..4f62e7a4270b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -9,6 +9,7 @@
>=20
>  static struct kunit_case xe_mocs_tests[] =3D {
>  	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> +	KUNIT_CASE(xe_live_mocs_reset_kunit),
>  	{}
>  };
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> index 7faa3575e6c3..e7699d495411 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -9,5 +9,6 @@
>  struct kunit;
>=20
>  void xe_live_mocs_kernel_kunit(struct kunit *test);
> +void xe_live_mocs_reset_kunit(struct kunit *test);
>=20
>  #endif
> --
> 2.25.1

