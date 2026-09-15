Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C34FC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBA10F912;
	Tue, 15 Sep 2026 04:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSb2jHsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A7D10F90D;
 Tue, 15 Sep 2026 04:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789445182; x=1820981182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWsgRoGK2OETYJnDCTepZ8CGe2kS48zmZyRMPdFWrCo=;
 b=HSb2jHsQR2z4f1tD0a/LO1nVSgIeuvcwUkRQ4/MLsrVqopPdIoznYqeb
 ChCgiVhWggvg2ndJcTc2lh+Zi6uPrAjZLgv0sGNqCvAWl1riAwGsUXrsY
 CzdMMrU7bWJEoWIsU1HWer5hmo5rrsZc3yu+NiNMVWYGjJ+dhC4KYWoFt
 2LCv0CM3EP10bHNMRKbWFTCFda7q+Rhzbdl+AaPnEcWr1+HaZRt7h/IpY
 POITiKMBlUqKiEzeC2zuvdwSRQUH0rs/VAeuWzARDBCClNIIGXAAr66oe
 TYPqjRUeJNKWOqC6FMIjRdnWFVIXANOxaPQKWm7JI/FjGVuR2y0qOioiP w==;
X-CSE-ConnectionGUID: insOqHuvSm+978+R7Q8dHQ==
X-CSE-MsgGUID: 78DL/aWJRGCTTL+FMv+DKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89741109"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89741109"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:06:22 -0700
X-CSE-ConnectionGUID: /5ENcfPAQ7iwQCgkIzXWqw==
X-CSE-MsgGUID: yuurIcfsTuS6Ge7TPzpGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1038106"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:06:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:06:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 21:06:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOUI6avSJBmUQx0A8xEvQxtUJ3yv8adInq9Q8Uggnf5XHoRhZzE1V0jpa6S97uz1OV1ERv8VM3Fncrj0GoR3FJWLCIpHcUe5FITXUd8R4fXiS+fsh/06H/C4RbfkGixW2oV866dt/0COKLvyBE/HPSNOStX7PSHsZ7pP9URDaY+rMVs+ljg5zA/vK96Yk+Ea+iAKuRyMoXZlcrJ0vL5Y8T4BM7L7WQ5X8SBod3Zzg+kJejfSanqVISEHXOdtslUrMRWvqS3yz+6G/Lef2264B/alYrX9obFu8B82KB1zwsNOLxgZKo6VNn0uWk0kHc5eENMwvaTG94DdB0Nr5iYL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YnR420A6mo1D1EqDsffRqUL3JlDcRybKEM6UQm4jos=;
 b=wKGmpOEUbafLxs1ZUQDT0ClWQ96d8yDmelcr3tYYoH0mjKws+lQ1p5/fR2ik6QOXeoIbQBvREapxgn3YXgCY3LbXWPbu5Db/DBu/+baG1+oXHzDQzCFstizurNQs406gzhpb8U4CisDf1W1tJx3AuaJzEpvc8MCJq8bnts0kpI5V+UBCQCdp4gSDxNw8HZnNt0S+1SXIR3CAjRXlexPNw1FA1vYsBjSYOaPQhNE9Fa6wlAYzwjKk8N7aqTph4vQIDljPDaVeoNnOrxlqhHNhysfyDfJYoPH3wRX/B5N9U/nQyzWgNYRi1uf+tsnNPVW62CwGs2xJ4zmZLdeDOX1S8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB7725.namprd11.prod.outlook.com
 (2603:10b6:208:3fd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 04:06:12 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 04:06:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 12/13] drm/i915/dp: Adjust SDP guardband requirement
 for CMN_SDP_TL
Thread-Topic: [PATCH v6 12/13] drm/i915/dp: Adjust SDP guardband requirement
 for CMN_SDP_TL
Thread-Index: AQHdQ5J6YFQniGSO4EqhtMp5gsmJcLbPB7Tg
Date: Tue, 15 Sep 2026 04:06:12 +0000
Message-ID: <DS4PPFE901A304F8E5B6E1CAF206387B67EE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-13-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-13-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB7725:EE_
x-ms-office365-filtering-correlation-id: 71a91bc7-116f-489a-ab72-08df12deae2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 4pBX7iIocBrTvSisQZK2gU9CztTzlWrFUHFDam1vxmI8hK86k2kGT00Toz0VTApu9cdidJQ5KqcJ/PtiOsoxuwR7R0vt/jyLOutbxIyVpQ8sjI3tJITeYgm9yc94896SJ7DfMpDZV9mL8BzjAX8znBOfb4s+gWMMPfnjCIS7QmQBSOneoqFOWF/jdhCHsNRxnyiRg2h0pCL7SFtLkRCAB6htXLAFOVhS5i3mbSwGtMLw/nybrbZsUu6E05p7RAGFeA2MyaHu5zsKnAOJis8lEGsvzsFk+P952HHnp7sLnGXOB4N9ZBblwNOn5g8EmyK0g77ya3ZsMI/n5LwxHEbN2St4V5qu/VQX0zTaDqoyTaOpmMHoZmQ//ECIiFhbgDUCfLMshsrtFUuG24nEN01AO2AjkCWxSHGFrVl7sdbSEErnAsmszGHhBfzRMp9RSOCvgjUwyY/3B5RNP8AVlUFGCEK2n/pRuFzMeqQYK4eH03/NbF5oZAQkKp4+b/y5Kn+WFTnNb13b7/batZIkJPYk173WBAdJ4fUZ1KvpqRUKrPWM7LYWpifHYeG49TI+7rmpLw3MeZIscll3W7Io+u2wOgHz7PI3CKTrehENl1Vd69vZLZFLe/D27/OzegmG1OCfHIuWU8Lq/BkEIpDelNXeB/kL2n9Om26YwjxnOrewj/WI1NS1rm0Y5Af1Xnmlm10f8+B0hODUCh/+si/yWp5yYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M+wu7p/4GK3t2W+LjLYlxdozuSurLcQRPMM3LlNgJCfWLFO7nC/uiYwICZq9?=
 =?us-ascii?Q?Mo2df6gUF9W05vWWtB9oWUe2geGcLL8bhhnwpIeLFyx8mjjbQwoo2oSGhfT6?=
 =?us-ascii?Q?xh2zXxbmcjupKaaoVdEMx8JJnWnuKyxfXYrGNnhDXsgT0w1AqUyxEiddfjRZ?=
 =?us-ascii?Q?qgVHFfpN0TJvlrg1A8+f8ICSWvxWq2nIqnwovn1B0CefG/O6B7aMwrOSooGR?=
 =?us-ascii?Q?XPnDz91OAqmKMF5xOPfLg5mL2hxQwah0fVIshsty4MgSsy34F49tHPpsgr9o?=
 =?us-ascii?Q?y4Gs2lQb5AFa7EyaNH1CGP0ZCFVL8yG7ZoVVvJ+zS1oABqNcqfJ2jYLFy3B3?=
 =?us-ascii?Q?GowR14xA7C0LAiShtLLq5MD3N3+wNUp8jCZ5yqH9zvCLUvXmaUvzQO+We04Q?=
 =?us-ascii?Q?Kmbac8kzK1cUKYXoyuJ7aTUcU4RqdW3O7GJU/vKZGcyhEW+2if4TP3XPTaEO?=
 =?us-ascii?Q?PWIle1u6MCLLuShbOnVS3lZr56LCix0s17dz2IbiaQ5bQCi7FoPHBRttMcxs?=
 =?us-ascii?Q?ZYORQzKttqayTkGvCc8ih3Hjk8evfSrVdrnDkDuaUl/PpMBDyVRq+onDQCls?=
 =?us-ascii?Q?OLdc/LxKRddu5XUyiUycvCpbpwrhlAApZLqsjtipznkXWUKH8ruxTQsh2lNx?=
 =?us-ascii?Q?+uoMNDH+PuNvA3cewigL8HHJrhooQZscnDkxnbjEjONGd+qehvi//Mh46R93?=
 =?us-ascii?Q?vpfg9ZiNFBXYx9o9fx/dnyQv54M0vyY1E4PIjkb01IV/tk2lGFnmL9zgtb2N?=
 =?us-ascii?Q?L1owHuZxFvqan/ugcP+ofQeWwxr7zU21GzmDq8Wf0Fe/YtfxAXquxnK9yWUK?=
 =?us-ascii?Q?+qKPaTWdex8Y9sTRJwIUDs8IyXy2rBR/8jaMR2Tp9tdVE2bPJCFpcRVAiRrY?=
 =?us-ascii?Q?nDe5i+FkPD98NXDORbsyAdLvfKzKZbcPpwSelQphy2A9rHXEv700/bUz33wN?=
 =?us-ascii?Q?TpwtsdYgzuuR4iXUnbdLtQu65M4HTCyfVYB/vWR4ak9ZydcXg1R1RM4SlXq4?=
 =?us-ascii?Q?23Oi+FyZ+DqAg/2CG3qMVCgStoqB7uI034wBEJQx6NLDNI6t36FvyHu+OA5F?=
 =?us-ascii?Q?dTQQ8dso3gybjw5YipdtWvYY2Dl8SOyrmqJDoZnNL0bOuA6aePLh/u1DjcOU?=
 =?us-ascii?Q?KfQNrFq+vYrJBhWr2ru51SNI3nKKymovJBbx7eCqC1k9weehvSdLtAtoy4Pd?=
 =?us-ascii?Q?aeEIktJ1zoMDo0Rt3L3M5Hoep88D2Snj8vft7Phlq7uRTYc3NaSYXZwBM/jz?=
 =?us-ascii?Q?Vt3RSYKyRC5pEtJzs5bhYr+YkQCSG0LWXAg1LuFqACL/VRGvp1+caeZxziVn?=
 =?us-ascii?Q?XLDgOpMVdidY1nkH+fAC9UhHT9sVbbZFd2FKwF8m+npqeqivuiGX4SxveYa4?=
 =?us-ascii?Q?ja0i13atEAFAoYNwjFc2ZhSugEnW2Ry+gC5tWEC4Ozp6Sl5nui+eBDGoSoXo?=
 =?us-ascii?Q?S0dbdw2Y0fZyQJJWYBX+CFe/lxOPQSQpUQb8IFp/eBqi+I68ZIYHqURzA7ii?=
 =?us-ascii?Q?zdpw9xJbi0UvQIzMoNh2HWCTeoTCrzFV1GwgIXKYQkUZ1ZJHtA4kujponAvR?=
 =?us-ascii?Q?zqhp717ru2llsdsABoueI16BUiaBXTwc7iw0ETyU5/HmHGsOD8lgzuKjBcnA?=
 =?us-ascii?Q?XwpJKlwCwN35fqk3PErrPHm0b5rNnbh5VaZgLtaMYNjrJd2PrZOJhO47cNt0?=
 =?us-ascii?Q?g3OZEnj/Ss+9Kq3JU2yAtdoXFwVI6jOVlEBvOBbag2m9jj0HAUQidIx3+f5a?=
 =?us-ascii?Q?bKBrbDAlFQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AX81iKnad+aWMB9+pmxwl5qNdjh7VFrFMXopf404y/OtJN24a3IUqITqzAxvaVzQNNbxul06oI5ptrvY27LyPyOK1CUarslHSiFwyz0GuLNHueTDEIInk6AiDFHAsHBogTmn1QAThrmt3uQk7V26hBW9Txn0jcnIJSS7Kg/GhWMieXNJQtg5gicE42eWK0/iGwJfvZqTiR0PCFtmF/RgtEnOEUkWS8dLWGpGpZhW3OaaVj0cJJPcQXAKzAiFwTk0ERdasO9XIyahQy0Jcpa/Ur2R9R5NrXDy4HbN0EZ/Knv95ar8l32i1EtFYk7donvQ3F7sB+MgedsVeaKpZ5+a1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a91bc7-116f-489a-ab72-08df12deae2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 04:06:12.3883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQk1X+sNN0lbojoP+dc4x8/sKNP8Y+lhp0MIyxcOSx60satfWogwSG52G2wFLeKdx+G/BR/bJJnBpznryhD2yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
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

> Subject: [PATCH v6 12/13] drm/i915/dp: Adjust SDP guardband requirement f=
or
> CMN_SDP_TL
>=20
> Once CMN_SDP_TL is enabled, GMP/PPS/VSC/VSC_EXT/AS SDPs are no longer
> positioned relative to the guardband: they are anchored via
> CMN_SDP_TL/CMN_SDP_TL_STGR_CTL instead. As per Bspec 68921, SDP Setup
> is
> 0 in this mode, so the old per-packet guardband sizing (based on GMP/PPS/=
AS-
> SDP being enabled) no longer applies for GMP/PPS/VSC/VSC_EXT.
>=20
> Since we are using the default stagger values for now, size the guardband=
 such
> that the max default transmission line can be supported, similar to when =
CMN
> SDP TL is not set:
>=20
> base   : 2nd line of delayed vblank
> GMP    : 2 + GMP_STAGGER
> VSC_EXT: 2 + VSC_EXT_STAGGER
> VSC    : 2
> PPS    : 2 + PPS_STAGGER
>=20
> SDP Setup =3D 1 + MAX(GMP, VSC_EXT, VSC, PPS setup lines)
>=20
> Add intel_dp_get_lines_for_cmn_sdp_tl() and route it via the existing
> intel_dp_get_lines_for_sdp().
>=20
> The AS SDP check in intel_dp_sdp_min_guardband() still adds vrr.vsync_sta=
rt +
> 1 to the guardband, since AS SDP positioning is unaffected by CMN_SDP_TL.
>=20
> Bspec: 68921
> Assisted-by: Copilot:claude-sonnet-4.5
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8c3a324e164e..02e73ae9e34a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -62,6 +62,7 @@
>  #include "intel_ddi.h"
>  #include "intel_de.h"
>  #include "intel_dip.h"
> +#include "intel_dip_regs.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_jiffies.h"
>  #include "intel_display_utils.h"
> @@ -7348,9 +7349,55 @@ int intel_dp_compute_config_late(struct
> intel_encoder *encoder,
>  	return 0;
>  }
>=20
> +static
> +int intel_dp_get_lines_for_cmn_sdp_tl(u32 type) {
> +	u32 stagger_val;
> +
> +	/*
> +	 * Since we are using default stagger values similar to the case
> +	 * where CMN SDP TL is not set, the different SDP transmission
> +	 * lines are:
> +	 * base : 2nd line of delayed vblank:
> +	 * GMP : 2 + GMP_STAGGER
> +	 * VSC_EXT: 2 + VSC_EXT_STAGGER
> +	 * VSC : 2
> +	 * PPS : 2 + PPS_STAGGER
> +	 *
> +	 * SDP Setup =3D 1 + MAX(GMP, VSC_EXT, VSC, PPS setup lines)
> +	 *
> +	 * For EMP_AS_SDP_TL guardband should be more than
> vrr.vsync_start.
> +	 */
> +
> +	switch (type) {
> +	case DP_SDP_VSC_EXT_VESA:
> +	case DP_SDP_VSC_EXT_CEA:
> +		stagger_val =3D VSC_EXT_STAGGER_DEFAULT;
> +		break;
> +	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> +		stagger_val =3D GMP_STAGGER_DEFAULT;
> +		break;
> +	case DP_SDP_PPS:
> +		stagger_val =3D PPS_STAGGER_DEFAULT;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 1 + 2 + stagger_val;
> +}
> +
>  static
>  int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state=
, u32
> type)  {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	if (type =3D=3D DP_SDP_ADAPTIVE_SYNC)
> +		return crtc_state->vrr.vsync_start + 1;
> +
> +	if (HAS_COMMON_SDP_TL(display))
> +		return intel_dp_get_lines_for_cmn_sdp_tl(type);
> +
>  	switch (type) {
>  	case DP_SDP_VSC_EXT_VESA:
>  	case DP_SDP_VSC_EXT_CEA:
> @@ -7359,8 +7406,6 @@ int intel_dp_get_lines_for_sdp(const struct
> intel_crtc_state *crtc_state, u32 ty
>  		return 8;
>  	case DP_SDP_PPS:
>  		return 7;
> -	case DP_SDP_ADAPTIVE_SYNC:
> -		return crtc_state->vrr.vsync_start + 1;
>  	default:
>  		break;
>  	}
> --
> 2.50.1

