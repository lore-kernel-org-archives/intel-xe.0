Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB7C25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 09:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3858310E60F;
	Wed, 25 Oct 2023 09:16:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD25E10E60F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698225368; x=1729761368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnlQcUr5/gwwr94H0H/PMcrWP3pR4AJyqVMH6rtyVvY=;
 b=BR+4t2/sIhZRg3Ugl1AUp+R/xqxp/lKo60RLwL0q7zmgD5rGmP7sIGmJ
 dlE/3LbvHralwa6VrNcx15wHSAKnmfnsA+iCgsKwicJyQM5sfmLixV8yi
 3mkZEdR4W94p3dNzLq0Ap0/GWfvJEVjMEoDPz5oS+Qi7LfRY+iVYPl9As
 T8MgF8qdH/8ypQZp8IzqrJu/LgLHj6d3423SE1VHAwgoV7SXrsuj5sAaS
 lMMncI7veUht4nLl1WnrZ+SU0TBbEmLLny11EvYDUrAualvZuNR1xT3tg
 HAeH24aOh9a4JhtuQc+muhF2SOOqEJ5cesD512L1MEjrJr+dRxHNbUb7m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="367484091"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="367484091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6776300"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 02:16:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 02:16:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 02:16:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 02:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF0Ru0XmSV7Bl2RHhwTdfD4DEgQCsmkytY4bJIpoFLnxXUm0SV1A9ugnaA/gBqxXpJIukmacTyc84D091vRYRU3mPD0GdPfJ/FkzpktSaM++pkLq7dHmKKTm/546yKq4n9oufp0+4K3uEzuK/Q7s87lQloeznNCNOow039Pxgl5W7y+EJWWEaKLGgc/laHuGEjoRLfwYNnBEyN2kVLWQ5C0QY+TCJqeVkKfjPWG9gDE0mejD1EUUVpB2M6OcYBpaLwxIMiQaUQ1NMuTf4AmOR6j6dJH9Wz3Dj20K73vAXR9C+05ULhuDvXqIhFvztia7xc8nn49PLNLH2Wnh/4oVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDE7alNTH7D6+0z4SPGktOjwjIgQ+mcoTtO6yjQE6k4=;
 b=EJ/bUFOBDULfT8XtXArA3m+LKG3yvB/VwClIywlCuHPNrjfPmKnCXM+LsgQGnp5GRGUmmcWk9rR13YIxMj7zEs8szVvaSyayqkpOnlHeaBGqmrt8rLGbhCaVYOCkC32P4laSOw0Wu4zD2XBsQu+OY30MbjCJ7eVUygI1yQxebsP2HsIRudyD9x+qEZz/JwL4phlTd+dHRzakYnGTsMNaxa6taT6bQg8oyu+nMGKIw/kpSgQwZMLpSElYEbmb1P+daxqLc9McsKVXBnkpczkF95pyv7QRAWOOFmIBTNHx/YDMGkBVuxuF4SlsE808HqKq+a+TucMXGTxq54jfJKcAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB5520.namprd11.prod.outlook.com (2603:10b6:5:39f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 09:16:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539%3]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 09:16:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
Thread-Index: AQHaBsaDlDxSbrxvZkOhvcxCB0VDI7BaOQog
Date: Wed, 25 Oct 2023 09:16:04 +0000
Message-ID: <SJ1PR11MB620448F42F1A59535943B42781DEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
 <20231024220739.224251-3-lucas.demarchi@intel.com>
In-Reply-To: <20231024220739.224251-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB5520:EE_
x-ms-office365-filtering-correlation-id: a6260265-e951-46c4-d9fe-08dbd53b03a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KZaFnP2qoaYHguwt/kS3BSTpV59sexYJnrOR/ccCNczbaQWYFQjj7Z3+HCXeOVa4BkwH0lEn31sRhaTD3wL4S4D7uCf3rN5QHlEhBkeVjLphqcZF99cqCe2fONuN/2TskWveBwaKQnEnc+NqunpTyiy3B2T6ygmrh/2/oQlXbLLjy9i+k4VeVejoKZGAnOeHBQAP/QNEdEHLpQrJ1vRvHalXaQPLbxf2JcprHe5XrYnjd1oUGojg/s+0Dq4CD5dCZOZ0LPQT0gCdDLNeeRoqAyBxQsNiQFBu4OjIBvil357/yfBGGjPxkwD3KaF5sGcBu1IjA7PMvjviNJcgtYUD31MFeBHQyjAh+5dkzMM+EfhXRfR4TIkUY6NdubZam+wLzSb1i9TaY3hdTyhYB/BAlhNC31xw/WuD0DKPzgHtAudv0Ons6weETV/3i7wDtLZuuXMkbqR6aHbgFOp5yDHZh1sHemrjzpS8dThsOX4jALJxSi2OCRj4afaH35E01uO8yLpBQ/RVck6xDoHNPkWfhfZWKJ3NA7xhQUTK2SmGCx/+0cI/KMOmt4qPxGXKO55DzOsLC8gwxMT2hklu0kYDwX8/nnukVSYbuE4Jmyt96v3lZgj+orqFmIs0lRmbxz/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(52536014)(41300700001)(55016003)(7696005)(6506007)(53546011)(71200400001)(478600001)(107886003)(9686003)(76116006)(66556008)(66476007)(66446008)(66946007)(110136005)(64756008)(54906003)(316002)(86362001)(33656002)(122000001)(26005)(82960400001)(83380400001)(38100700002)(8676002)(8936002)(4326008)(38070700009)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P6ZW704j21bABFMiyGI24gRBCrsxi3MJcqiVuMlKVsFvxw9AHF+Sa2XMp8RJ?=
 =?us-ascii?Q?tCfYYtkTOFYNSkeJnRAGmKISbu142rSmtuvHE6w5/J6ERnfnYmMzute/clEO?=
 =?us-ascii?Q?Cpl2RUfU9NNMXuZs3QU5IgQV88MpS7wdKjCezuXQv647kHhDcJjyjkJy2M97?=
 =?us-ascii?Q?nzau/werqICwJM6kVPL71XsdUjPlF4biQQn4LrdUbo27d0qvecKOHBQR/BoM?=
 =?us-ascii?Q?C3BHfgMjZaKk/kih4DymUrJP1/6/7hjhmmNAuYgkYmSzz8aH+mM6KX5Jcvoy?=
 =?us-ascii?Q?wXXgYcY0c29ivkUjaX8IHY5C42m3jZ5NwPaobUySEs5AkTlITs2/tSKDhH0q?=
 =?us-ascii?Q?mCpjEmAxghZ3mcWkG696aFZVlps3mwO7YIN3OmZLO/NBnkKfO9IBwxuH0AXI?=
 =?us-ascii?Q?sh4NdRj4zgdkeChWQ2OpVifR9ZXNtN245wfnCxmGIE9QTfQHqq9vg0hA9JWj?=
 =?us-ascii?Q?j3e3nDVs22eaUcQRxgrl/Y97QOY4+aydZX3mPnjLdUdHyhASrYKISvjc8XHD?=
 =?us-ascii?Q?cfrCNJ8Rie8FAlUXbW2hJ7hiZJoNxfX2ictpc3yKG1B4U7rC1KFcwJsBTfR7?=
 =?us-ascii?Q?3FWIBVAJOzbwhd2UcQZNp/EMUT39xzujsjzU4kHIsRLKHRYROP6siL3qZzP9?=
 =?us-ascii?Q?yUW8Pi5d9m6n9Q24kwo588YpVlKAt45IBSqR9dTZk6CHk9dP8J+KK/JQ810s?=
 =?us-ascii?Q?1Ff0GimNwovy7RylPRF/w8fq0f0WpHSfXsLLxjD5sXd1pNMFtUdOw9/hD4P2?=
 =?us-ascii?Q?1ghnopXgwzCgUrjvRTTWwizyOTuSpm2qedJNotwVWa+DKDUOEMqQj2L1XpJE?=
 =?us-ascii?Q?n4hY+4WEl9M92uXU32CzR8XScoiHTVwur50aqNirrV9yYwOelqHFIFeqy+vs?=
 =?us-ascii?Q?lVHijMDvy4cFG+wJy7xvK9UG8C9oykRlp4ESFKUlU/hoM64YgwTGc429xeyU?=
 =?us-ascii?Q?AlnYY/GkTdE4kOZjOFYl6WDJrQyNqN/I+uvmcXA7Jwx0sA4IUYLacLUbzv+r?=
 =?us-ascii?Q?fmJ3LYVqwWY0MWAKOKTFILlZ0rYSB1w/JCv0GUAs71Fv3JhvX8jJT4Z/lHq+?=
 =?us-ascii?Q?VbgBtTvoiwltXpSjnnJEsuq2BDIORKMgld/E4YvZLws0+/42kDToxQGtmrG7?=
 =?us-ascii?Q?BB2tYbupRyQzqyXewYmq6+MNkHRIE1rpptk9WjChCLwHoqg5yofNB88F147g?=
 =?us-ascii?Q?E//aspo9oKCQ2bUSC4D9wGvVt3dngLoruCCNOpVwzWN9zUW4RjvblhKCaiW+?=
 =?us-ascii?Q?Q9PeLBN3tu64aJ3ZOfTCApD8t5by2rUEa2/CG0cGFSQFTmwMD/dL5I+88EVP?=
 =?us-ascii?Q?aq29fu0IXfcF9AxPfoAw624RTgdidGGJ64RQ62EJLOwnpTofZ4nFBm/Y4Nj5?=
 =?us-ascii?Q?N+0u6rE11EJ493V74Mhv/T5P6cAyskpU8s5zZQ3uxtwRxJNK/4tmBT940IF+?=
 =?us-ascii?Q?Di+KpIESy24PBVSJayQEtl3rVlRdkbfbf8YTzYK3acrQb4bDl6u4bUS+VuNE?=
 =?us-ascii?Q?e0m6xteFVBHNiSCxoURAHidMkEtE5t1bEKvmN4ejUTrW1lSSQZq0KVOxapMS?=
 =?us-ascii?Q?xaVH+db3FEdyM/geKl8NXVHe5TPHNavcJQ1KoQMr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6260265-e951-46c4-d9fe-08dbd53b03a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:16:04.3965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Wga589/BA4v/Os0wK6YeY0WSBWbrCp+mvB6lDt8hEgpdFKEyC8V0JlBy8PEJvQe/rUJ66Tlssw+s58t2C5QQQcf6/X291/Oko4sWBFL8gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5520
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Wednesday, October 25, 2023 3:38 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
>=20
> From: Matt Roper <matthew.d.roper@intel.com>
>=20
> This workaround is primarily implemented by the BIOS.  However if the BIO=
S
> applies the workaround it will reserve a small piece of our DSM (which
> should be at the top, right below the WOPCM); we just need to keep that
> region reserved so that nothing else attempts to re-use it.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |  2 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile in=
dex
> cee57681732d..ef9d954f5a75 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob =3D GEN     $(notdir
> $(generated_oob))
>  $(generated_oob) &: $(obj)/xe_gen_wa_oob
> $(srctree)/$(src)/xe_wa_oob.rules
>  	$(call cmd,wa_oob)
>=20
> -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o
> $(obj)/xe_wa.o: $(generated_oob)
> +$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o
> +$(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
>=20
>  # Please keep these build lists sorted!
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 55ceadfc30b0..d542a4e2e6fa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -155,6 +155,8 @@
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>=20
> +#define GSCPSMI_BASE				XE_REG(0x880c)
> +
>  #define	MIRROR_FUSE3
> 	XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31,
> 16)
>  #define   L3BANK_PAIR_COUNT			4
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 79fbd74a3944..b23827534ab9 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -11,6 +11,8 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>=20
> +#include "generated/xe_wa_oob.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -19,6 +21,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>=20
>  struct xe_ttm_stolen_mgr {
>  	struct xe_ttm_vram_mgr base;
> @@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> static u32 detect_bar2_integrated(struct xe_device *xe, struct
> xe_ttm_stolen_mgr *mgr)  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +	struct xe_gt *media_gt =3D xe_device_get_root_tile(xe)->media_gt;
>  	u32 stolen_size, wopcm_size;
>  	u32 ggc, gms;
>=20
> @@ -154,6 +158,26 @@ static u32 detect_bar2_integrated(struct xe_device
> *xe, struct xe_ttm_stolen_mgr
>=20
>  	stolen_size -=3D wopcm_size;
>=20
> +	if (XE_WA(media_gt, 14019821291)) {
> +		u64 gscpsmi_base =3D xe_mmio_read64_2x32(media_gt,
> GSCPSMI_BASE);
> +
> +		/*
> +		 * This workaround is primarily implemented by the BIOS.
> We
> +		 * just need to figure out whether the BIOS has applied the
> +		 * workaround (meaning the programmed address falls within
> +		 * the DSM) and, if so, reserve that part of the DSM to
> +		 * prevent accidental reuse.  The DSM location should be just
> +		 * below the WOPCM.
> +		 */
> +		if (gscpsmi_base >=3D mgr->io_base &&
> +		    gscpsmi_base < mgr->io_base + stolen_size) {
> +			xe_gt_dbg(media_gt,
> +				  "Reserving %llu bytes of DSM for
> Wa_14019821291\n",
> +				  mgr->io_base + stolen_size - gscpsmi_base);
> +			stolen_size =3D gscpsmi_base - mgr->io_base;
> +		}
> +	}

Wont it be better if warning also posted here if workaround was not applied=
 by BIOS ?=20

Thanks,
Tejas
> +
>  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M >
> pci_resource_len(pdev, 2)))
>  		return 0;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f3ff774dc4aa..752842d734be 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>  		SUBPLATFORM(DG2, G12)
>  16017236439	PLATFORM(PVC)
>  22010954014	PLATFORM(DG2)
> +14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> --
> 2.40.1

