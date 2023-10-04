Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF557E7B5F5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 11:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945E10E002;
	Wed,  4 Oct 2023 11:31:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CED10E002
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696419116; x=1727955116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LZGRlL/ec8TT4xWnJcbPJdf3ukBkuPhRBB/ier3VlNU=;
 b=bLede2mR2/5kuzvoqIYMy25C6ol8uOKmXlUl23GfolA3b+EDKOlfABde
 YrB7CMkug4T6Iw2N7WhAv/fUwoWYtk23GQP+S2SCyGIfqakQuKUDrX+3g
 9+WHDBH7esijswRGvStHmVi87m1xrmoV+jBdqOYMupaaEimAEI8tyhKVx
 FXY9WgWkq182bphg6EY5t2gRCvRcb/FqFYbwuagNC0JkgQrJf6/2Ltx3n
 qPFbF3eHYyp6pn5MmukDrp2woX/WTgdxs+PINmBuh5feeUzqKtYgXS5dh
 L60Dn9Jcrd9+OzneUkxfGXAkQ/3ZdVCOPqhUY16H4T7wqCsqAoK+WFqdm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368195226"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368195226"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786483683"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="786483683"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 04:31:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 04:31:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 04:31:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 04:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVg41LovUcv0qPft3fGYopgvE1wzqrE8rouvkg7XAIFCfkylx6++qIMrde92nmxp3thjSZMfXlXhWD+XIPz1t3opwf9K7A6aCNV149Tov4zuPJkdJgExxmcMFcIlcwngsf3IkZcEiGBsSJnMd+u45md8xwVn1p+KySIzZz+p4vE2IUpJ5URDdOb7HW0q3I/NzrhxSO/4dUyednkLs6M2deJZpToj0FQfoqssWy2QNdC98d8nM7XrU36QvURtoucZr64PhGeHp3dCm3w/iVXkjFGE9bAacOWYWNcy3po5cwuvJMNSg9DXpErAJeqO8/AhX9kZP0G2G8oJ97fqWukzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ68XiUzhpCcZMdhqsIB0o9zqm/+98ynn/11yLM4ko8=;
 b=ISN2eDKoAiheKI4Dcv2H7uunLRSl5WqlCcVckUHfY/duPr4CfAuc/KhSDEmy+2OZDVULn2Wrl21nXKzO4s2XhYYi3Dnnd0ewyJ/I/Yd/3IlkZqeJ/I41THoe9YjEOXwbJP6U5hwGVSgeHSIdqZYebt+iXAYYT5pLVewhzhrXcDDI/tJDRzm+J/Lv/RF8OVqEj9wot7qK3amzLD2oYXPSiF7wxixH5D/QRxAD+nkJQThcw4GPctSbRiiSE0m4oVmOnXFzbHrqG/flA+vkIlHfPp0rrqAKir0nbpqcsxwTmLIzysPFu9BN7KwiAQQWEuJ0Ql+MacZXTK8QuDQaOyw5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 11:31:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6813.017; Wed, 4 Oct 2023
 11:31:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Kershner, David" <david.kershner@intel.com>
Thread-Topic: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
Thread-Index: AQHZ9kgNPDjbQ0EDEk2p/Mt3xSVmJLA4sYkAgADONMA=
Date: Wed, 4 Oct 2023 11:31:44 +0000
Message-ID: <IA1PR11MB6418FDDD2C32B80A3E3B1E2DC1CBA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-2-david.kershner@intel.com>
 <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
In-Reply-To: <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ1PR11MB6228:EE_
x-ms-office365-filtering-correlation-id: 47b5f1f0-e3c2-44fc-2484-08dbc4cd7d08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zto8matMG2ApVaJ5nEX1iRgLOOsuJuURoL84k+eHX0NkRkKAXuTmdoq9BBh38FrpqeueOi9vHJjAGwAyf6/Tva0nAkYxdypnllFLYyuM0lnHmOnc5IdX/vhRpueo9a+rZLQa732PL8H+N3E2b5rash6DjPZsteEKoRgqRl7fDsB+XpHHhIGJk1x70AYnILv38ILAo3p2Q0qQFwkZQrrauK5W/eDZbvctftdEQU0h6M94D3zB4ELH/vtrNR1pCQ+AozlrdHwDbLdA3KaASE/1eSqc5eBbLJ21hQi695HxIxdJYi8O2V1np6C108sk1+ojS7PVe8A672tieePvREuG7I19yOOuidxa+kuyoMry+I4MxBUFBA1p0agXsTDdxwKVYj6Trx/EyIrh9N3fyEnkjaNkB3GIx9sUSsQjkbvIG0LbwQAU30U4otRnooFOAF+3cR2MKeUkoQBL5hRZoIFuaNmiCGXlHnewnLEAwAOHTohepN5llF7Z4zTu3wPlzsMkHGAkZbHg947kVfLwUU3jOkxt5KL0EtU1t280cSUiT5w42XzE3prZ9UY+pGFCEA4GUS77as9h0potMjrDDrgNX3OCPJg8xvbnWZjoXMDu3CoLx80nczHjsLPqZr9B0das
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(52536014)(33656002)(5660300002)(4326008)(8676002)(8936002)(26005)(107886003)(82960400001)(6506007)(71200400001)(7696005)(9686003)(122000001)(55016003)(64756008)(38070700005)(2906002)(38100700002)(478600001)(110136005)(66556008)(66446008)(66476007)(76116006)(66946007)(316002)(6636002)(54906003)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tGu2+UPKI66v1749ycxuVdq1xo494kTmcZqG3RaES+68u+8zZDFnisr4D5dZ?=
 =?us-ascii?Q?fV0yrgToXmwv3ZmglqvKMHzu2D5rZrPhHMvibN7++BGb2/CNEDn714yJj8HH?=
 =?us-ascii?Q?M+dwyJTYPrHFuyQ6JS2LE4o3oS7zBeSgi0MIUjqXNdOX++kmQh37EvTluopx?=
 =?us-ascii?Q?twnaOF4C/21jfG9Brexg7CMbIxgrB5g3H9Hh6qUgS0qyIbHYpOYelLuEDDS+?=
 =?us-ascii?Q?9ddHD7y/Zo+2nhf9QV8jazEB4teJ7oE0lBM9N0UFptEa+VzE7Z0wmz0ceNQh?=
 =?us-ascii?Q?eTm2mI+ogWxm8mdD6NoMXlEKXpfpKbWWBzFTWA23mODkpNaym1165zSo0DG3?=
 =?us-ascii?Q?ZrwiDtLwyhmdLzMljNqq/nPfiJ5cKSdKD9/r2v/2ErpQXtDA4IQxiQcGYlFe?=
 =?us-ascii?Q?/cyUFZMgWeuVSAhkV1/IhFgd22fvtfTfXtzDioZ1RAyaSiKl7bDHZ9QNEsMU?=
 =?us-ascii?Q?OJmkgq59iSRKKBhZbKxnGJVXtVV4e4ovvjwF6Eqn1rs7Y1IInfKxGsFp25vo?=
 =?us-ascii?Q?KS/MLxOxf79aUCT8iCtl92l9cOinfes/ZJcVaDPPpdmftFcykiHqdv2dhXPA?=
 =?us-ascii?Q?lhsK7xdEdAP539jOgOiqDo9wm3XgR5C/u01XZtRQxoHzzYhRy7/CvudVMGVN?=
 =?us-ascii?Q?86P+M3TjAYqqZ4mDzj3AiEWZzFXms5/cAVg9RkXYFQuvMvyf+W9T5kOHOt4s?=
 =?us-ascii?Q?T+Ok6xpzDDfNRUN5VkinzPtWUsGO3yCrtU95utGJioUUD+VMikHZZm8+nwUf?=
 =?us-ascii?Q?ZH48QwDtcgz+/kHeilCuErUJexDPIOceI+DOcYd7PFdxMF8OTZ9oYQjrk38E?=
 =?us-ascii?Q?vyOjWWDHrUOZcuQtzjwNN2bBqAfjQQirRzldOXQP/AtFg4igZ7pmbRpsyTds?=
 =?us-ascii?Q?ZsBqKZAD5TOny9zIAoF4NFrA0pPWc5VyXTeWuDoNQIxWuRIeBMPevhZXrRfT?=
 =?us-ascii?Q?8KQpwxlSE3Jnvx+XOCoF+oXAI3l8pvI1DunY4uLTaPE/Y8IFKbQcFxuBk3A9?=
 =?us-ascii?Q?ozf0Cmcm9ux3PBzwejDAJ7wpwEwhMpsaVZ0X0YxqI2S/83yHkK/UcP9OWLIy?=
 =?us-ascii?Q?YOrt2wiy9pUU7czTgvAAvl581aoLGPP08yYih9wQrir9jcGJQToiJaBZF2Kp?=
 =?us-ascii?Q?K6H9/nFPBEylaPr229rlZyh3tAy58hpSDuC8A6fb3XZcNnzqPeRXCX5aIK7S?=
 =?us-ascii?Q?279iYh4fB3WLi64rG3ofbQNg0GLCoOsVj/k0TLHps6BNkudrl6Tce3LAzNhS?=
 =?us-ascii?Q?aBeUiHEvzp1umRYWBLeYM/nedDGV6jHPFHj+5OF//YUNm+CTl4D4PGGNfUYa?=
 =?us-ascii?Q?RhnSXDT0niwlN3vdcDEGNgMI/ewbrKupgHuF2hqqkBrRFOrHLiHKe1DCfGIy?=
 =?us-ascii?Q?DjyGzh7c96RZRFVaQt1okEivVigCxGqD2bnQvN4lB/3SOwRjx8pKMwzrn+pP?=
 =?us-ascii?Q?8utU0X6819JcX0ZOfJrxmAoVyJj5WbreO8r2NEGRnhqF4UBj3VRqy/dck8dU?=
 =?us-ascii?Q?xptBzsW4U+Joemn3DFbT6OAW90UKNL0YhzXif66KGUljpc71A8LqNG1r2cao?=
 =?us-ascii?Q?OeqVCsgGiD+H72ju5OrTwdAVLTGGm4ZUbH7/mRN8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b5f1f0-e3c2-44fc-2484-08dbc4cd7d08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 11:31:44.8034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUCJwKy95oqqNfr2RPqi0pU29N6gnHN4+XLVMAPwCbeCajPBtwrywR6UE/WKny+bAgmL77/sola26dH6BiIDXvQHQ/lOhggRsM2KckLPl6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset
 for page table entries.
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck, 
 John" <john.fleck@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>Sent: Tuesday, October 3, 2023 7:12 PM
>To: Kershner, David <david.kershner@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.=
com>;
>Fleck, John <john.fleck@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>Summers, Stuart <stuart.summers@intel.com>
>Subject: Re: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page t=
able
>entries.
>
>On Tue, Oct 03, 2023 at 06:21:44PM -0400, David Kershner wrote:
>>Device Physical Address (DPA) is the starting offset device memory.
>>
>>Update xe_migrate identity map base PTE entries to start at dpa_base
>>instead of 0.
>>
>>The VM offset value should be 0 relative instead of DPA relative.
>>
>
>Overall looks good to me. Some minor comments.
>
>>Signed-off-by: David Kershner <david.kershner@intel.com>
>>---
>> drivers/gpu/drm/xe/tests/xe_migrate.c | 37 ++++++++++++++++++++++++-
>--
>> drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
>> 2 files changed, 47 insertions(+), 12 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
>b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>index 6906ff9d9c31..75b06f0bd755 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops
>sanity_ops =3D {
>> 		} } while (0)
>>
>> static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>>-		      struct kunit *test)
>>+		      struct kunit *test, u32 region)
>> {
>> 	struct xe_device *xe =3D tile_to_xe(m->tile);
>> 	u64 retval, expected =3D 0;
>>@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct
>xe_bo *bo,
>> 	struct xe_bo *sysmem =3D xe_bo_create_locked(xe, m->tile, NULL,
>> 						   bo->size,
>> 						   ttm_bo_type_kernel,
>>-						   XE_BO_CREATE_SYSTEM_BIT
>|
>>+						   region |
>>
>XE_BO_NEEDS_CPU_ACCESS);
>
>In this function, we should now change the bo name from 'sysmem' to 'remot=
e'
>or something similar.
>
>> 	if (IS_ERR(sysmem)) {
>> 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>>@@ -187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct
>xe_bo *bo,
>> 	xe_bo_put(sysmem);
>> }
>>
>>+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
>>+			     struct kunit *test)
>>+{
>>+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
>>+}
>>+
>>+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
>>+			   struct kunit *test)
>>+{
>>+	u32 region;
>>+
>>+	if (bo->ttm.resource->mem_type =3D=3D XE_PL_SYSTEM)
>>+		return;
>>+
>>+	if (bo->ttm.resource->mem_type =3D=3D XE_PL_VRAM0)
>>+		region =3D XE_BO_CREATE_VRAM1_BIT;
>>+	else
>>+		region =3D XE_BO_CREATE_VRAM0_BIT;
>>+	test_copy(m, bo, test, region);
>>+}
>>+
>> static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>> 			   struct kunit *test, bool force_gpu)
>> {
>>@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate
>*m, struct kunit *test)
>> 	check(retval, expected, "Command clear small last value", test);
>>
>> 	kunit_info(test, "Copying small buffer object to system\n");
>>-	test_copy(m, tiny, test);
>>+	test_copy_sysmem(m, tiny, test);
>>+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
>>+		kunit_info(test, "Copying small buffer object to other vram\n");
>>+		test_copy_vram(m, tiny, test);
>>+	}
>
>Probably we don't need IS_DGFX() check. tile_count check should be good
>enough?
>
>>
>> 	/* Clear a big bo */
>> 	kunit_info(test, "Clearing big buffer object\n");
>>@@ -366,7 +391,11 @@ static void xe_migrate_sanity_test(struct xe_migrate
>*m, struct kunit *test)
>> 	check(retval, expected, "Command clear big last value", test);
>>
>> 	kunit_info(test, "Copying big buffer object to system\n");
>>-	test_copy(m, big, test);
>>+	test_copy_sysmem(m, big, test);
>>+	if (xe->info.tile_count > 1) {
>>+		kunit_info(test, "Copying big buffer object to opposite
>vram\n");
>
>s/opposite/other/
>
>>+		test_copy_vram(m, big, test);
>>+	}
>>
>> 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
>> 	test_pt_update(m, pt, test, false);
>
>This test update should be in a separate patch.
>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>b/drivers/gpu/drm/xe/xe_migrate.c
>>index 15f091a7bba3..42942aeef595 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
>> }
>>
>>-static u64 xe_migrate_vram_ofs(u64 addr)
>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
>> {
>
>The convention is to have 'xe' as first argument, so it is better to
>follow that.
>
>>+	/* Remove the DPA to get a correct offset into identity table for the
>>+	 * migrate offset
>>+	 */
>
>Comment format followed elsewhere is,
>/*
>  * comments line1
>  * comments line2
>  */
>
>Better to follow that.
>
>>+	addr -=3D xe->mem.vram.dpa_base;
>
>Should never happen, but probably a good idea to add an assert
>that addr > dpa_base? Otherwise, we will endup with hard to debug issues.

How about:

	addr &=3D ~xe->mem.vram.dpa_base;

?

M

>> 	return addr + (256ULL << xe_pt_shift(2));
>> }
>>
>>@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct
>xe_migrate *m, struct xe_vm *vm)
>>
>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> 	vram_addr =3D xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>>-	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr);
>>+	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr, xe);
>>
>> 	return 0;
>> }
>>@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>*tile, struct xe_migrate *m,
>> 	} else {
>> 		u64 batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>
>>-		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr);
>>+		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr, xe);
>>
>> 		if (xe->info.supports_usm) {
>> 			batch =3D tile->primary_gt->usm.bb_pool->bo;
>> 			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>-			m->usm_batch_base_ofs =3D
>xe_migrate_vram_ofs(batch_addr);
>>+			m->usm_batch_base_ofs =3D
>xe_migrate_vram_ofs(batch_addr, xe);
>> 		}
>> 	}
>>
>>@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile=
,
>struct xe_migrate *m,
>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
>> 		 * vram is less, when we don't access it.
>> 		 */
>>-		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos +=3D
>SZ_1G, ofs +=3D 8)
>>+		for (pos =3D xe->mem.vram.dpa_base;
>>+		     pos < xe->mem.vram.actual_physical_size + xe-
>>mem.vram.dpa_base;
>>+		     pos +=3D SZ_1G, ofs +=3D 8)
>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>> 	}
>>
>>@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
>> 		cmds +=3D cmd_size;
>> 	} else {
>> 		/* Offset into identity map. */
>>-		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
>>-					      vram_region_gpu_offset(res));
>>+		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
>vram_region_gpu_offset(res),
>>+					      tile_to_xe(m->tile));
>> 		cmds +=3D cmd_size;
>> 	}
>>
>>@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, str=
uct
>xe_bb *bb, u64 ppgtt_ofs,
>> 	xe_tile_assert(tile, update->qwords <=3D 0x1ff);
>> 	if (!ppgtt_ofs) {
>> 		ppgtt_ofs =3D xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo,
>0,
>>-							   XE_PAGE_SIZE));
>>+							   XE_PAGE_SIZE),
>tile_to_xe(tile));
>> 	}
>>
>> 	do {
>>--
>>2.35.1
>>
