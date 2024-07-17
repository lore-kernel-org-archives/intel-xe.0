Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926F5C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4547410E40E;
	Wed, 17 Jul 2024 20:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moU6JEnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474C10E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247474; x=1752783474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e5ybl+wJm0j+yo96rJIz0tXOWCh0TpN48S7INvQYNPw=;
 b=moU6JEncshUr+SsCjlIM6nHC7DdOeZYwbICKU/YXD4AqZjF5cXxxXuuo
 L2hfvA8Ofz9Lq+iYp4U3Sy0Q5CuAQJhqjEljI8bvRkOxCCWvG9/69oth1
 D2nfjt48nym7EbSrt5vXg0PsknqfqZlbHMIwEVsOb+KwflgNO1llD6oD2
 J2REBLx/P0wNDFzNxjIslXAAvax2dCJS8tYAnyLPqrycScCaGjGwpXS23
 fHlfrnUnuZ7l+dg4LS/J+2KzJ9K0OZLB4ylZZ/8dCOKQ8NlXqimcoqael
 02RskNiQOF2RgA5hkMJuPdp8zISfKeUZJaA6Iqq9nJjprirfXs0/mj1Ds g==;
X-CSE-ConnectionGUID: pnf5q2xQR/CWvJl32Jh5Cw==
X-CSE-MsgGUID: eSVyk9ZyR1qO0qGTQuJhOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18629853"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18629853"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:17:54 -0700
X-CSE-ConnectionGUID: DfWqGp9kT76uJRGPht7GVw==
X-CSE-MsgGUID: HuALzP7zSyqbQ5b1tD/taw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50275880"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:17:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:17:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:17:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxnqzUfMUdLgUMJcRDZEzA4K8l6/zF+XRd4RqPCHS42DDzZmKn6RkEfD92ynw4coyPdGJcNuRNvQAQUNbvx08b85X/6Q28a8iWwV8dh+V2kayYUtIWHTV2OeyhpP+y7F1LfAFzY/O7y4FNuf4LpfNEOMXMBq8eKQ7jYQII77PaTKa4h9OK6lvmymr9q9KdUzguSn1G6W+zRJB0DYgZAhB2Z1+q2Y9dsgKJxag+iGrrvS8jhgVXhaSqODp8XfjQXeHx/c9Upm+lxMwe2QFhxV9kZ61dAI9qvBUpFeSkX+6eBBV+JW/G4ovVEfZlR8TGRXapYYBRAYmR9uswukPhxnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzVFk3IRa9v/IRc54z4BJB5VqRQzKMmRPS3XJkl6mAU=;
 b=bH+L/dZjiWF66VvMfCV9hAIBjEDedeLF379RZu1otscvQUfyZvHkvcvvdAUyKF/SDoS2IkTMngHuBGrDWoETjyo/1cmgzymlQKOWsofI8fluvXz+ced1HeY0Vxc5g94Uz3ai2MmJnzl2m7KSW3GIFLg3jtMgRx/308iYPF3jcyHpvhSNLPCs/I6DdifKXkmZ1nWW3O8rUoguLgLEU6jCmf/TSo7EDkrj57fDGes8ZNfiV5RYS+F/H7o2B6vMTAW1EcneuFsqkv4nEfIIBQfYSVIOza36wjX2Ghw5seachv5nOm7BMPdlopfYQpo8y3COWJPnTaA1FxdeGNJUBMKwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:17:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:17:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 5/7] drm/xe/tests: Convert xe_migrate live tests
Thread-Topic: [PATCH v2 5/7] drm/xe/tests: Convert xe_migrate live tests
Thread-Index: AQHa2ILfrdoBOthwfkK4bxh6xyf+37H7W6hA
Date: Wed, 17 Jul 2024 20:17:49 +0000
Message-ID: <CH0PR11MB54446F5EE9EBD1691FC6D130E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-6-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-6-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: eef4d2d6-b7b1-4e26-12fc-08dca69d87a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9hS5fNK5H3vAuGzqDJ806ZSYHCC49zauVC2VMdIwJQf0CdbupzdlqAv8QJ3X?=
 =?us-ascii?Q?gPJfqPqg9F8i/UwwaD5yE2ZryoEW/wBDFmc1l/B1k+D13h878FyVoyMxF9dQ?=
 =?us-ascii?Q?TTkMyIosxmsY3K0iC0iWNYqWxZ0henkrYuXiYmZMhjpARRpEPgE8jQdRvz12?=
 =?us-ascii?Q?cicdQf2BkRZqyvcl3zECnpPkD/MzoqbJDJpO+pB+QqCv9rAponPdJSirNxHy?=
 =?us-ascii?Q?iPngBhvnFpVW8wWuUE/mHDKYRD0dO5TCdijTQocroHQwXUk2s1Oz1MNH/qzC?=
 =?us-ascii?Q?OdVSvIu4MQMuEL6SD8eyN3f4h4qgL51IH6se2F/zLUShKk6wKG2jQ8EIbC7y?=
 =?us-ascii?Q?5bp+E47l0tBzM9B0/0dLOmVqb1llylieIVhJr727Gj7YF3qMo3S5s304WQnF?=
 =?us-ascii?Q?p54OixGY8oZTEfiAAZqjd4Lj6S+efUfc5En1bpifnjnANnFEYFHC/bRoVxRA?=
 =?us-ascii?Q?r2og8V5s8Cd9ohoVSg8+XN3Fyd4UXdUJ618vXv4aDBVcxk+jRApre7ohrj4q?=
 =?us-ascii?Q?iZO8LbDGbk8p0tus18yxsgiPcYhG6FZ7HJHXlu58H2sGO6jO6gig4viAhRRg?=
 =?us-ascii?Q?Iq3IuFvZG9ybnAMCpc0txEsqAQ47Xea5jjx9CDEK4TYu4OcQpix9uxYNuBZe?=
 =?us-ascii?Q?pgGNuOBOT9eziLw53703nb1uPioCf5oIuG01cGvavue/syIKK76k9OWj5HTl?=
 =?us-ascii?Q?KhIOcuYPO/40riUUTfWHh0lRNHdPP8puBMESFwzcileV2p8DZP5MnQuH03mp?=
 =?us-ascii?Q?lEg0GukvgHSFRshj5PJYV0btA6sOaVCUkYxt5omf4KjnnBxx6l7Z7d9pWbOH?=
 =?us-ascii?Q?5gUeskaeDcuj5LLslurZ12CprqvUMdqb+4T9AWMdGm1zJSV1E63/N7vVAkNn?=
 =?us-ascii?Q?QUi06el7dAZ0XusWaSAp/teqes5UyOt3dIQaDqSHfmXofI0TZngCCvIf/zcT?=
 =?us-ascii?Q?AEXqYjDAwBEPVJQcUfk3X3gu3f7Fwxryi5kXWryzaRtTkRDFR275uMv+4u4Z?=
 =?us-ascii?Q?YFtc0lzAxQfm1GvEvdsO+iVdjSUhzmUZwhuhCTsHA/NVF4OGkAKu/cKx69HK?=
 =?us-ascii?Q?z5KzlC+iKSjN9a7nEPDcIea2g+VFsn9MDfP4apO1H66HIrVDubaSixx2DWhW?=
 =?us-ascii?Q?50r8zJit7Dd7SMqXg1FbXzbkI2vKUa6DhldYbY8HYB2MsmcJX73A0d1hQWpI?=
 =?us-ascii?Q?Ns59m7jzE+Hq+hvBH9aZ2GzzlEPjDIoB2PFR9AZ/eK0zljc76cl+BKI1Vtj8?=
 =?us-ascii?Q?a0eQUTQ2VIeMX1pKEcX6EpZF87l0gNtsuv2UKHiNNv+VX5Cj/gyLNU3lA1G0?=
 =?us-ascii?Q?CbvjkgVBEhszm9BxxV1VVDSt2DzLW0fkqg1O55QeCgZJ0ncSz8w4NPQuqGro?=
 =?us-ascii?Q?WKFWw9DfW8u7wjshKIEt0wUbICcdDLT+F0wvDl4L8pjGZmxsNA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vJPgGaJ2hjgkDAf2QHVGTAnY9ogdtG7qVIAFBlnsbwYptFqUjkYjHu53eNg0?=
 =?us-ascii?Q?sDlqO1xJyR1wePKE86DTK5/yRrY+S/E0PRfK1YmY888J6xJyXc64vB0wxMfs?=
 =?us-ascii?Q?tHI478Kk5VdTvGMlYDgeF+U3ahtMkAk/T0kKd9yhL4H8AXnVi2rZ3Ja74eDr?=
 =?us-ascii?Q?2gqZq7lXcb9pIdFk6gVACLW3iHoSFEDoO6nWdFyJ6k+cOva5qgVW+zi1BdZK?=
 =?us-ascii?Q?psCutnuKKdgWJww4kIDEggVwiKz3ueJWcrBhKxcj5BFeBecqs1IYieAWxmUq?=
 =?us-ascii?Q?het4VixHhT19tTahAWlasNDAv3mxHKiWQ7tRHJUx8WVBJsFHSo8+zaL+hx1y?=
 =?us-ascii?Q?PAudulqnb0W+8SlpgUZR3+B+xfCLuTSu2U35VRovLSH42TwLF4iA/WuNRdvy?=
 =?us-ascii?Q?KqKxg5PwMjNLk2YFXVjVMD/Aq707LtGAm1k13I2yv5a1REdAr4tf3+kh2HLx?=
 =?us-ascii?Q?WZp96HzMsTXBElPPgM71uAiVs7SJX+bOUD79drtw+nboxK7NGOM4MaKhhtAd?=
 =?us-ascii?Q?3tLmdLDJiB6M5G5a+QQ0uFLdXTO7JWIJU+XiL/Jlxmh1f3UtqdyqkR4i2Ntr?=
 =?us-ascii?Q?Xn7pevLePFmUR3LylrgB9KCOqVn5csKGf0dqkUoUXHYoH4Gvh6LMjNBPVJu3?=
 =?us-ascii?Q?L3tB6lWpTDbkdETTUiexo1omAp5Hl815VMwcRnbK5z9OW/MVvNmvV3+MVbLG?=
 =?us-ascii?Q?Kc13jGkzN8AAPmcc5y3VEywQohEVMzzxlurRGKpiyQLI0xQ8ELV+HbVAb5mg?=
 =?us-ascii?Q?P/pVXtXrLgEBvN4+Na+eB+UoaWvWRoDl3HnvvJFed4YCKqOYgJlFrkUfmuFz?=
 =?us-ascii?Q?fAlEpvOgPPTmu1lznMP7Ntt4dHmGpWI8dk/nJvxjwrtVR6SToxfYiQQkYEiw?=
 =?us-ascii?Q?ES0sq68w/bN7bupJZikhPL7i5cVzulvtTTrKh+6IuuMRUCoNEKLtl2uU9iFS?=
 =?us-ascii?Q?1a0ihX+/zg8G6NVdMVziRCOi1jR9/BA66kXbO4tVaDaobVDkeZuWl91rxkeV?=
 =?us-ascii?Q?t5vEoIww5O62VupFrV1B5PbSVMYB8QzMevSLuE7QAdFzCY6YDqHOtd77nR8f?=
 =?us-ascii?Q?2kkrNfKes/IYI6mwLhqN11Kitem9dkeDsw7bhejL9gQHa9WHb5hjSyYLGb4p?=
 =?us-ascii?Q?FrD+3r1VUtHT1sl2OIH2PVsxkOwqCMy/oQcHuKzOEvvQtkGsr5678rvdm8dY?=
 =?us-ascii?Q?kazhcFsuTnnwPE5OrxISocZxibwsgNxc1EtAf46WfTode3R3jNdtQgQC29Ub?=
 =?us-ascii?Q?NH6kawM1ISDy+29f/BcRYaZiIabC4Ny18Lwrg3lQqgEboqDDklMR5PiUC+ib?=
 =?us-ascii?Q?7NQY5Jdn2KuyPVahtNqvYXyoNZ/Qf+DjCpjG/Eun59LJm/EWp8vbGBbqKc+t?=
 =?us-ascii?Q?QITsFAYQXNV0kYWqtX6+gk/K911fXSe1ibstYPjFTF0qRNKtj1rHotL0+8Lm?=
 =?us-ascii?Q?v/Hhr1jrppSVwaJV5GatnmLifRh67rmeo8ztT8FwjIWTo2Wx/+eMM6+4LW2w?=
 =?us-ascii?Q?pkxotwnalyVCfo0udaOMyNYEUABuBv1V1xqrBDWc3FoswkXSpwWtShlZpELZ?=
 =?us-ascii?Q?+g1aZb99LKd8Zm623ChJgsjaP4b0pPzwWCRlMJZv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef4d2d6-b7b1-4e26-12fc-08dca69d87a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:17:49.5442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ac6i2MsHINpjnZ47Gbfw+tDoVE7g2r+g04jo1b0jEuhVg+sGUCGzRhS/4jvn4NUFT4FCEqfqUp1Cb8hwUhikTdhSc8AhdPgnvtW7uP+G1f0=
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
Subject: [PATCH v2 5/7] drm/xe/tests: Convert xe_migrate live tests
>=20
> Convert xe_migrate live tests to parameterized style.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Notes from patch 4 apply here as well.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index 0de0e0c66623..5b4f7db004f4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -6,6 +6,7 @@
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
> =20
> +#include "tests/xe_kunit_helpers.h"
>  #include "tests/xe_pci_test.h"
> =20
>  #include "xe_pci.h"
> @@ -355,11 +356,13 @@ static int migrate_test_run_device(struct xe_device=
 *xe)
> =20
>  static void xe_migrate_sanity_kunit(struct kunit *test)
>  {
> -	xe_call_for_each_device(migrate_test_run_device);
> +	struct xe_device *xe =3D test->priv;
> +
> +	migrate_test_run_device(xe);
>  }
> =20
>  static struct kunit_case xe_migrate_tests[] =3D {
> -	KUNIT_CASE(xe_migrate_sanity_kunit),
> +	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param)=
,
>  	{}
>  };
> =20
> @@ -367,5 +370,6 @@ VISIBLE_IF_KUNIT
>  struct kunit_suite xe_migrate_test_suite =3D {
>  	.name =3D "xe_migrate",
>  	.test_cases =3D xe_migrate_tests,
> +	.init =3D xe_kunit_helper_xe_device_live_test_init,
>  };
>  EXPORT_SYMBOL_IF_KUNIT(xe_migrate_test_suite);
> --=20
> 2.43.0
>=20
>=20
