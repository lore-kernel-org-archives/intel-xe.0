Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1482CC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 11:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C7310E0F5;
	Wed,  6 Dec 2023 11:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8C010E0F5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701863723; x=1733399723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E26rxrL3sHZsDPfl7rqwiA5V+/0uiwFkriT7kNjyNCc=;
 b=dZiThwltSJDiGeAk7lRkucS/DHG1fVo18jBRjvK5sBYxSOOxgvfXI0pg
 C5e2rogSTV6BgUzbmwpbMiD5QM+84w/jO8LxPl2mioi9mLIwpHv4T4Omm
 xdO7tao1iuilIDtSJgMrimbaiIDGCUbvJxCB/1nJSzz0P9LVoelnWNZzR
 QHSpq1/a3UZe+PbftkKcZKz4QdQJSymqXY5mZ1vTmKpdWMMiDONfQ+YBN
 imEavtDSyvZviEwj6Flk9pXpoVjXPIWKVVSV0duQUGlkQk3M7/VSKRgs+
 IIq3+gyTjpN4oWzSHcaIgAFygz7awRBkZzkVgcONOE3LcdsPvRe2k365y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392917513"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="392917513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="721057269"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="721057269"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 03:55:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:55:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:55:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 03:55:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 03:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIwxg8rU0AG1FX3wRfU7qXTzxvQ3A3LC+CcF/339LZpKWfQaisKPZfwzf3aPgVjkUay5ezzHgatoha8CPjrH0AJp5uszsvGQFRaX8MNVKBelfZZweaIfK5jiR17JJIl9csUqLmeW9eZQ2I2lqlZ53VFfk1CfUmITu2rqEJFcOnTyAiOHWLv0EbxfjDZJVdf84AGtIXhu2tOFAiO46YIeLnLuWCJ9w4VVNd9MawHyCqB5gR1zW6xN6TWVHUhP+m34imZkAgly71ZKi3Oni47iWk40pA5FlIwWn4Fske1V9OR5V+5YfwamRTbhUzQvVD78dAdT649uwwOn15kJbDhcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeBbamTaIIwVNCcRnB4zAAaooko3RhyWxUGB38lTWMA=;
 b=cXYP8gj8khc8S04y6MJZZESDu+gCsLnwVae+xNQl4ChbyOwMwI0NUeeiARGY8bdpdQ+owgnzC3ysKORTNzgRdmyhjUP+jH/V5KsdQYWGDHlkKBwipTFlqklveC4LGAg0zAG4jvNL/82z4+MObt/KvI+1dLi6Uh9ltikJFXb2yMguSyX8RvXWf2tlipuo8Ij0VTXPiS2gTtIsk3ZXG8iHujzreYwwzsck542cu9dju8Js/JbSV8HosXxn2upLRB4hTtv6z96VfLZ/iZuObU7zEo9IkaXR1lwsZiwJJevVJL3XlCcLkwrTFhTj2QkHuGBpiUMGQdY2XzGMvlsW91jdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:55:18 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 11:55:18 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
Thread-Index: AQHaJ/1jEG/cuKOKaEOqXW6EbtKGerCcJd9A
Date: Wed, 6 Dec 2023 11:55:18 +0000
Message-ID: <CY5PR11MB6211A0355A82DE0B8C9229119584A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM6PR11MB4532:EE_
x-ms-office365-filtering-correlation-id: cea8503f-eb49-4ed7-90cc-08dbf6523794
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jExIyq2ekNDz26B2HNR/708HXHkyQrpaVzPmAjB5NhM1Zvtsz1mbumKyZz+xSUTKjbfXroOikFHluUub6RhoAhlT7BpoDq8/hNSKRxVEX6NWDStHofCmanmDoQjLMOeOhIwwxUNPl4/CGhr0GkQXD6jLTBwk9jFhM+q9OYCT4CSkAqmv64f8Ju9Yltcl5OGtVmz7ZSLs9bc+g8okT+yZng9AN7itk1FOoEgq5gjnBV3ta38m9jKmZ3q3k91PASbGdIne9zLgRV1zV2DtPhI9VCdAY6Gy/Hw0S/y6ngsJZ0Lo3aLpWoBa9qDR4JRqgvB6/X3Jwv9X8ii12q8EFvpI4f0kK2qINADHl3qh413WaLoivphdwtmrcyygremicSayMMMf1TVprv/vwjrxoG5cBhca3F5wNZx7qgP+xRho8VQPUHy/+8chnDdF6RdribY/gWG2A1ZkzV+sm7yVrrDmAt/z+N7C8EPemmLQBGq0FySiC/Eox1WTnrG5qasHDRwUd7cHIgY9Hg3cAl95YKeL9JgmOE7cqQmo5vsrEbhiyg7qXYf8fX764SxRUmTUSH1fEQdqHXurpsV/J6jihJktalQbW0nisYyxiLIAHXoFJvgYitRH5Lt93CAk6wp1uooB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(33656002)(82960400001)(2906002)(86362001)(26005)(55016003)(83380400001)(122000001)(38100700002)(5660300002)(7696005)(9686003)(478600001)(6506007)(71200400001)(107886003)(8936002)(8676002)(52536014)(4326008)(41300700001)(53546011)(76116006)(54906003)(110136005)(64756008)(66476007)(316002)(66946007)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q9LZ+G8+R/7aJ7pDylLut8RtFtczWB5uOtqQir2Yza4s8pzVGj1aEXkzuShf?=
 =?us-ascii?Q?awcXd4QXiA6ROG7encaVmZRy1kieqg4bFFZ/jKi1sXpYIrkmSkC3Y4NBUwMK?=
 =?us-ascii?Q?zSd4hv+CaXK4Z+gG0vrXMrByt+ikRectbthfekFNv/eABfCNyE39ZOqlIpgs?=
 =?us-ascii?Q?QLSneLmnOw6tmhhUm+VU8yFDLTvh82rzJTAsQtei56F6Hz0L2ur+EVds+sxr?=
 =?us-ascii?Q?wbx/X8YZ9yXRahdfxtYyMV2xaDqtOWlh+fRK68QPzxYGLk8xNVpmBVW+CpDF?=
 =?us-ascii?Q?P5e0tyBATOAcvUBIcwz34xjQbxHjYAYSgOUnjyz6HwvMAimwgXL1ysBZ4X+P?=
 =?us-ascii?Q?r0jgYodIh6mGTbotZWdnrMaCiT2PJKX8+5eWREzJ0wc2iB4G+fbATk6i/mBL?=
 =?us-ascii?Q?7RnigOIuz1+M/jwv05eRawuky8pX0TnTycfCNrrzBnh7HAgH23bDPBJ/bvYQ?=
 =?us-ascii?Q?HCUNLJqFbuYiveKCKQNreb78/4I6CrfrUlZdSPWnaRsfBVRiOMEvRTX0C2UY?=
 =?us-ascii?Q?bHOu9GgLweHLtG0O80OH2z/k1W50BE2B9ixpI3JpMYGxVp92GPCsF1KzS+S5?=
 =?us-ascii?Q?JOzOVc2279G55Z9DkFmC6G2yaaF6mYjd1lgQOAEX+DhUcZyTkKy9OPKl5dFz?=
 =?us-ascii?Q?TewIhykOjdcOv8jU/72M7q89P0H+kOelnI6rFYrJ9OhmIhJdGe8kDEH0YhLs?=
 =?us-ascii?Q?285NH4vIwkYb3Pvxiua+YPbf1rnAVOG0XawAN3xHeNaB5xVGWcT0x7j0qxas?=
 =?us-ascii?Q?CvASnvUiwNDUsmB12QNb5ZdEmyurS9OpR43WYJyHuaagB4S5rpWWdiq2Yj+S?=
 =?us-ascii?Q?vQbAKgXi6Ry0QmUcq7h5rDcuKT48CbFnApbRJGI4G8Mc5SAHJMpxtZeYCmHt?=
 =?us-ascii?Q?KcsriIMqg6YGjlq4cfX2uEr1ATWAF2gXhsdh6S4Ei3BNxh4eQA9knlqz1tbF?=
 =?us-ascii?Q?kJNz+QnoyDSsYqNO3s6HNVlGRiAg+oVLdBciwVJFaM2CP5khL4dSZXQFiaBn?=
 =?us-ascii?Q?ht/BIvtA/lzRwUQCqsKHd/+ItOJR8qVR9j3e6KoJYdD0J7uClpAYTTLKhd1C?=
 =?us-ascii?Q?IZH/7/ZTeJDO4XRL9K611/s1t10PhTSXyt5sDQfse6Op37jl1Pk0FTilQFld?=
 =?us-ascii?Q?ZTNb2iJ9zhyI06fw33LlVtMUg+Ywa6hLRw1OXbHyeH7UVltcT0k5vH1p7vUj?=
 =?us-ascii?Q?kv5cMSjgu3YH6iYg8QXHDDMP9eH8ijwOpKvFbpCct3a5GZfaLSIsRSgu5fPc?=
 =?us-ascii?Q?pUbOLghQcj2c3bZKi/fC5R3838jZIf6mORD0sMGlxNMKY+dWmvrimL1tYYMG?=
 =?us-ascii?Q?zFlBLBXGCtiI+1BSyxes0W6eSqzBuuceZAB/I9j+9ijB2+qECUhRG1Z4KcXq?=
 =?us-ascii?Q?5l6hOWA8xA7VUJiAhxdZxBqg4MFQgv8EdjDnxJnyJl5eI7rCuJeNqBZqf4Pz?=
 =?us-ascii?Q?lty064I6hf6tVLWYHC3ZyjIFQHZ1of0YcCyefC1XE2gRAgg/i9v+cmhQpOma?=
 =?us-ascii?Q?cRiwjdJ6M7q7tTIPannAQMFEvA4vVelJQ/1ZyA8mwScHLOVIzqHPLTF4pajd?=
 =?us-ascii?Q?mk8nLR1qI2LmibpQhWnWlSyjoOQg7XwGkGfD4iDg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea8503f-eb49-4ed7-90cc-08dbf6523794
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 11:55:18.3120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLT71qSqT9fgrwcf1Dfq8J14wN0Ln8OAmcgx/1SULLwWRM/AFeYLow90996l5K1T2KFpgh9pO3ccctvuVAxoOzzzCFdDGgC3/0tYnyrPP3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Suja=
ritha
> Sundaresan
> Sent: Wednesday, December 6, 2023 10:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
>=20
> Add vram frequency sysfs attributes under the below hierarchy;
>=20
> /device/tile<n>/memory/freq
> 			|-rp0_freq
> 			|-rpn_freq
>=20
> v2: Drop "vram" from attribute names (Rodrigo)
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..edde5335bdb1 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
> point format */
>  #define	    POWER_SETUP_I1_DATA_MASK
> 	REG_GENMASK(15, 0)
>=20
> +#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /* xehp, =
pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index e8ce4d9270e6..38d334833594 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,14 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>=20
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>=20
> +#define GT_FREQUENCY_MULTIPLIER	50
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>  	kfree(kobj);
> @@ -35,6 +40,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>  static const struct attribute *physical_memsize_attr =3D
>  	&dev_attr_physical_vram_size_bytes.attr;
>=20
> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribut=
e *attr,
> +				  char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribut=
e *attr,
> +				  char *buf)
> +{
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt =3D tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> PCODE_MBOX_DOMAIN_HBM);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static struct attribute *freq_attrs[] =3D {
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs =3D {
> +	.name =3D "freq",
> +	.attrs =3D freq_attrs,
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_tile *tile =3D arg;
> @@ -78,6 +142,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>=20
> +	if (xe->info.platform =3D=3D XE_PVC) {
> +		err =3D sysfs_create_group(kobj, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs,
> err: %d\n", err);
> +			return;
> +		}
> +	}
> +
We are missing to remove these sysfs files.
Thanks,
Anshuman Gupta.
>  	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
> err: %d\n",
> --
> 2.25.1

