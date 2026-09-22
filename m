Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21F8C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 16:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A69E10ED9E;
	Tue, 22 Sep 2026 16:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvTfrNsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3B10ED9E
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790095166; x=1821631166;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FSUfWsqX6eclndQk6UNCQosP4CZW2rdNfgWOJMRSFsQ=;
 b=FvTfrNsUdynA32m3fZPypaSd0fx6KLDrjkx6VHJV0NU7UfSHUnCoFjNh
 iw8ii1F7NbIAsgfKygynYBuxo0nfP6oxaKBXLak9B9wtheX8pVlKDU7C2
 gveRZzvi/m/gnzyBxJR/GTi8e6NIVLg7rZVIxzsxybcn0er8yyCOhyluj
 5awPURZqeWRrduMjr3SVgnr9hHRv0B6LUA4w8AmO4hRyCG8QC+q/jD+mx
 QozXHJWNWD47jJ6L63Ty707zbCdsYb07PwUwZdEs+yYBlTkSKvPkdU5qB
 S0unGs8I4wx2BvXLx5/HeTENyU9tPVAzlK+8pQSNvGeYFY4tW3SX8kdzn g==;
X-CSE-ConnectionGUID: GY7y6m1RRo6WvLcOoUDOgg==
X-CSE-MsgGUID: 6DbMOjN1TJiRPDZHaAn8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78268347"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78268347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:39:25 -0700
X-CSE-ConnectionGUID: YuXF4thkSByO5Bc/FDOK8g==
X-CSE-MsgGUID: CgWozN2ZSHqs8uMyroOqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="301105578"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:39:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 09:39:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 09:39:25 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 09:39:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp3kGTS6//XPbKXBqqyJ46eW7/KEhnw7MUHgIs0khtpciqfve6mI4bu9Ft7teHp4fynTM+N0sKADhvInLWJ3zlJ82mgPfrM4Gak4r2ABVr1sfI00uMx2+1Kwrz1d/mxtSA9vyqDwNmo+hiWxreoPgWApZUOa1cI2oC+gUzHmFG4SSnusgGL2kLn62RRyVvEpZR1zOT6XuwLuLzyri6Kt6NUOBlUbgNrHmExto1s4kWPIHl+qJdme24vyNa3MV4+C5Yk1hKljvSnBrywMmosQRYkhJUFtNH8oOEGf7r3h84EkBBRzJA+ItpksAFUoWscZf69X1aUjUJKjx52a2+gWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMNbsxE//cFTN93Dzc3QS2vWuPrj14FYGP02trsGEcs=;
 b=eOlo2Qla98CwarsLabLHLJfzmfnEKEYv/95vzyfbWP0U/VP7TXN8cTUZyXpwcADTqH919xsPR1PlCvK11Mcmei6GsqzBgHXfUWHTbqVNluoneUej8bJSOBM6NnT7M2xTBpuOI6S5a18E7V2LujpHOFPdkkCe3IC1wy5ex4tq5nmmdOD+dUN8deNLc9D5RZqqQ/KZM0cVpY8GmomrciXopklH8OWat88E3GoS/PHMXoBHuKG3+JAiVjjttdA4pBnfaoPTm4PLOQOm1NW5UYKDi0qQSn9oMwVxsZlefR0rzmzdRHdbwBber2UitrGBrDUmO5NY4QpPy2syIhFcM75Nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by LVUPR11MB9592.namprd11.prod.outlook.com (2603:10b6:408:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:39:15 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 16:39:15 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Thread-Topic: [PATCH v6 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Thread-Index: AQHdPLK8ywXKHrfDpUWssxIoqw56brbaAjug
Date: Tue, 22 Sep 2026 16:39:15 +0000
Message-ID: <BL1PR11MB5447F91FB8472AE1E41466EEEA832@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-23-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-23-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|LVUPR11MB9592:EE_
x-ms-office365-filtering-correlation-id: 17896a84-9eb4-4ef5-3738-08df18c80a61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|11063799006|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: qcAbUMu9lXrbvHkRVB5nlt/PAI7/CXvt/R+IJvLeErmK0eZK8K4m7DGQREF9CnXIw51Xt8TzFr0pu26BOtdEctsmDB+xwu8/PS2AdjmGUZuDxV5CzGgPdbgr5oN/Ssem5XIlRNgMqaiHPCNQzIcMx8KFaLZwW0qIMln9Pn5+6y47aozHbbvLVUpdhKPmE230xMT8oYZ6fy6yuhka9jVYRwQaEh2fZoJ61zw734MOFlmu3zAb5UPLpj9zuO55FcijRSCGEVYaudMvXl/5diTDb4vbmi/peitJKRMso4AldN0FbSzGlX68JRiwiUbidwcTsqLaMjjJGZPuibhJsiRd3Ums8N3KXkPYMI+qOa8qFTaG5pIEE41HuHsbD/nB/3xfB1riy9DvB9rRIUdTN4eyU2/Khkw154seKvlmjkcYEthb4jfcUuk55R72LhMmeUt2K7lz7NcR+DpTuzpkRmaGlk+4UZ8Bq05K4U66iljjHAw0uqbVwIpx16d3SS7c0VKAty/LwtnuUfJIT9nbPL3GpWfj6YkE4N8eM7mrfrE7Ofm44PuvcrISM9RPQQAeMIbig6LpiAHO1r2WiLmXYxCM1eHgPBjxGSxyXIsECQuukiMvDWGWWFanhUOhBWkwDauPD37buW5T1ENKTKxMXEa6Bso4bPX37q9S6t7roX7ssOg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uDa/Kzrtot8l/+OAT6SSunQXyEjjxpwM/WfcJQRQ12U62wiLtDnp1fPg0wY5?=
 =?us-ascii?Q?X75gJWW5LQ1KKT9IXJGvvFKbr529CWMCOUMYwhCwOZJc4uRj1ViNT+2ahiyz?=
 =?us-ascii?Q?PhlzVjhkgf/xc7M3Db3iL7lHFtKLJRtXZL7pb7Ti/e60mNP8osr+YmoYoPWP?=
 =?us-ascii?Q?ziCs/iiPPSDEWM7ZhGS8TRMh1JTkoTvB3YY7OOT7/LhAQ4oGeZN6x9gZXVtQ?=
 =?us-ascii?Q?QJ37SxSezClvrI6a65fG2CBBk3GGTz35zgEe/o3fbJEheW+mxw3LFzbPX7bv?=
 =?us-ascii?Q?VE+C7wqO/0J9lNXNnBeSuFhnxiXUnUP0AwJmewTjHUB1Iqz3JGLqeh/PKIsK?=
 =?us-ascii?Q?QIFouEbaF0gufbzHzRaNy9wVCWHPbZDo20s9bBQ7vonS28sPlgzAGFNSMbJT?=
 =?us-ascii?Q?7TBj6QDdDitLBM84bVxT66XM26EomOJvKKih9/yNzveUHYNYNCwb4hFDYaGz?=
 =?us-ascii?Q?MnHSNxqsY2ZBivqc+ugw83LahAfsrKRLfJnPvnB++EACEIZLmk8B3ROoImLD?=
 =?us-ascii?Q?1U9NfUIqo1WUZGj6CnHUa7sVQ1weA8KYeaq9iHfdmhR1oYFeilZUSW1RHzM3?=
 =?us-ascii?Q?gKIQLW6l/HKizjsSEtll2PEybIg3xBDvd0ugjtWWngqxys0CO904+ZxYV42p?=
 =?us-ascii?Q?1MfbXghvYjOO6YCZNiYIdFRjpou3hcrMBX6SegadH1HHq5rCfdOvncx1p90u?=
 =?us-ascii?Q?avf53+xPJed4eeT0e97UEy7R8qcWQvXicx4aoUyBiweVjmnoPvHHQOmDlSKE?=
 =?us-ascii?Q?NFJxskd0up+XBGqUS1oxkKXhDfkR+mwnmpClcqV6RC3IMXbxd8FgriuBi0A9?=
 =?us-ascii?Q?n0yY/5+NPMkXt8Mz9nT9rMkHUGM85iR2pmDrCsOEJ9Sekqqcy0scrDQbU9Fp?=
 =?us-ascii?Q?10BwRUERB10AX9cOyATaH5cO1qJ8nnC+JCsFuHLDmMU8nhmTjPFPL7Vs3KcW?=
 =?us-ascii?Q?7D/hxFdl3SqW/AbSqOO0Ss0zCVcMrbvlmyJu5G+gBLn3MitaAkmNX4hQpp0n?=
 =?us-ascii?Q?RIb7RNhpSmEWPKnUd/ibtb4gK+bsh3vllHiWUmxoMEG8nu0oZrN/KYHlY5vH?=
 =?us-ascii?Q?Sl+UFAj8WYLiT0Rm/QR9Fd+zcVqxm8yrq32Jsk+TMsVlVaPgKZKHODyszEzW?=
 =?us-ascii?Q?EV1izNrj0FU3GkTwNAjDgFDeIZ0ShvsGLLwP1yk0FZqXrkhozwWNPVb9OfYJ?=
 =?us-ascii?Q?IQIIHMTdelexR3+r07s29moNW0AVrOoj7ncMtOsmEuvU6PlNMxw03VQ88nXM?=
 =?us-ascii?Q?o7l7Cb/Il1rgjXe7H0afHoCez0Nebw1mC6S5gCbmgYi2q0Fdl5eqFRN5vtw3?=
 =?us-ascii?Q?7rtZZJEW/Lt0XY8og+wi5drQ7DpMeoLly17BRN99UGLhzzqy76KAVD6WCTzs?=
 =?us-ascii?Q?3EySuSYVpv9n65bmfdkIG9mk5EfejzU/S/z3xD6GEr3m42ej+nkZkbs3rSFj?=
 =?us-ascii?Q?G3JngeD5a/D2A7Qsq1MFILWOcZuHCmP2D4ypo3tf1/jqMasKyl4t7mb/Ay8M?=
 =?us-ascii?Q?swgaj3DFtuWVO3UUZuJ6dm7XfZB48eRthc4oi1i6k1axKTgio0sCgbrz8Zhg?=
 =?us-ascii?Q?CuHdnMdI683UZSRPWAysO0g5uEMGWDwIIgqkytQuk4eYbPhKF8gmgJV9CSP5?=
 =?us-ascii?Q?FKEA2vbpcwg29miYjV6m1laPh0/lh6qR3g92VtvJROM/6DqJaKlLLzzWNA9P?=
 =?us-ascii?Q?qy38TP0r9rs75KZayAvwFROpnedA6ISdSfomalIlxIdA3DN2E7FmqEfvfS7H?=
 =?us-ascii?Q?hE1UWM+0RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XFwzpwY8X75THLbozAPGnaroMRtP3a54BOan+UFL8fKHZSQg7ulmq0njKVGYQVb6YfaR/fWO4zZDGQkeAKRCOda37YhPypPRL8R6jLfuR6uXBiiYfaLoeeEoISNx+vDm1bmdrj2AGg3yqYzn6Kwc1IWPXomYSJFjTGGHMTj8bwBDmVCC9bSGJthMQMFipuyeCg+GYOWg82hRmm8qwNiVM7+JqneTPqgzC0Jlqdn4l1TUpQaKKqjNKzSdaMrlEfY6IvW1LA6zgZMRuOHZjQEnGP9yrUXLI1hdrgffE567yhIGeB2RISt9WzbqQPrG7LMxD8QGaJI0V4P4wo62mrlTxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17896a84-9eb4-4ef5-3738-08df18c80a61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 16:39:15.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsEV9KASj+//YaVSGi4+oo47ypAYTLhjh/g60521m4CwnIctwLZLuUNz4BZ7cFiA0k5VYKkHEatSpqUdKsQrcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9592
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

On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> Call xe_migration_ulls_enter upon page fault or SVM prefetch in an effort=
 speed

s/migration/migrate

With it fixed:
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> up these critical paths.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-25-
> matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
>  drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index e81ca24df37f..ecf2530f0284 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -15,6 +15,7 @@
>  #include "xe_gt_stats.h"
>  #include "xe_hw_engine.h"
>  #include "xe_log.h"
> +#include "xe_migrate.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  #include "xe_svm.h"
> @@ -262,6 +263,8 @@ static int xe_pagefault_service(struct xe_pagefault *=
pf)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>=20
> +	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
> +
>  	down_read(&vm->lock);
>=20
>  	if (xe_vm_is_closed(vm)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> ee4d149b7453..c68d3baf1988 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2526,8 +2526,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct
> xe_vma_ops *vops,
>  			ctx.devmem_possible =3D IS_DGFX(vm->xe) &&
>=20
> IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>=20
> -			for_each_tile(tile, vm->xe, id)
> +			for_each_tile(tile, vm->xe, id) {
> +				xe_migrate_ulls_enter(tile->migrate);
>  				tile_mask |=3D 0x1 << id;
> +			}
>=20
>  			if (prefetch_region =3D=3D
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>  				dpagemap =3D xe_vma_resolve_pagemap(vma,
> --
> 2.34.1

