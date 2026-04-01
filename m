Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE76D107638D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 17:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5841F10E292;
	Wed,  1 Apr 2026 17:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejHcKTGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2615F10E292
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775066203; x=1806602203;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=katqL+CI8bhwGK7hLUxfVElemmnq+pCSydLC8f3oNEQ=;
 b=ejHcKTGZ4DSUygm5/AvyOr6cAx2Ogl9NzJrKffLm9K01Yh/6N4eoRBFN
 qs06fWozgGw/Crq3F60WmYt8KgI7p3KoXF3JmmV/cVkZe7uKwD5YwyWqo
 kJy5WLxL9FRf1PsvK+K9SsfOaN6t/0riZsJ3H+j/1fPH3Io0xbWGUcgdo
 4wcazFAo9DcBuTTHUcEeMkdroH3c3ebZganpo8Nr5g0yuGnPjIsHH8wwW
 BxU9hGw6+Zg6/XHKQgJklU+y0XPapBY89IkDKwjhVcuD9O0ARR8gnlq1w
 ChJX00LoMcbSIA/tx04v3VwzZXXLRB10Ua8lTYa64KDmuFRL9dziRmblE w==;
X-CSE-ConnectionGUID: MlT0u1z5SLO/YJPNdKxC5g==
X-CSE-MsgGUID: F942n/M7S0eQqbN2rkhYmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75832341"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75832341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:56:42 -0700
X-CSE-ConnectionGUID: uJll86WTQUCqmjQnaZmgnQ==
X-CSE-MsgGUID: /Hx8NqH+QAe3jPjAyYb32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="257216433"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:56:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 10:56:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 10:56:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 10:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1lwszbyswPMW87wNmeOXUUm9xyNfblDsTOfgkrp074aaUuNs+AmBL7bH6ebFlEaWOceL17/8w78nPqb1VCDZ2vqZqHWgREnmJTJaGV1995nh8Ip4YH8vD0t74K05e+kd1MjAfhSCvJ1CFmR2i8HkC01lOvirz11B+i15Uga0q2oZpWV+orvUS6OSZCiKr9zxRLIEPYfkT+xPFdRVB7XUgZcgI+QLpfMmZIELAqsRIZRpYPj2zNNYF5O6TrFnAzS+yDcdwJWlqFOSMuHuW95rMAUrRIX4XLM3aAI4A5R3l3EzDOmxI8rzCNWosABw+w9U766KTYl9u324lVSsO/A+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOHkVi04HZb7kGyEDKr5XTX5LT9hNM25pp34e9zwMP4=;
 b=VFRUsjA4cApmcmLNltdP/Ri1GiwsG1U8hZfOZUBTHaPzTavbb/28D0YM665JxQyglPThTYrm0v5Sx8s3nGhtrsXFVRbaTB9TdTiwXSjHDOdFqrlcixgtICbY30A+1SXM0GyWXjUZjVftXq/jYl3ESANpOQ2ntaFEDSPnynYuezAXLiFHKydr+JqzIzyTxbItHGmxNrBoo/RbdZOXBMVNPemetk8101VtUhHgb3GnvhB+JXACz2Oe/OWfpp6aOY2R74JhtG0EJHuySbkcV/lVyk35ZThxq1O03OMa9p2csvM70KYP8WLn4kMN1DhuxqNU1awNz8aY83rV1NM+Qd6OgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Wed, 1 Apr
 2026 17:56:35 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%4]) with mapi id 15.20.9745.019; Wed, 1 Apr 2026
 17:56:35 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Fix bug in idledly unit conversion
Thread-Topic: [PATCH] drm/xe: Fix bug in idledly unit conversion
Thread-Index: AQHcwXdCJ7wb1LMdUESu/5xC2h2ZcLXKfb3g
Date: Wed, 1 Apr 2026 17:56:35 +0000
Message-ID: <SA3PR11MB7625B9B925DBD8A075D2BE64C850A@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260401012710.4165547-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260401012710.4165547-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|CH3PR11MB8211:EE_
x-ms-office365-filtering-correlation-id: 76bcc978-b2d2-47a1-063d-08de901803da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: Re76BqV859LRE6vzsRKE7HQADFSoImSHpfN0y74lSRhFCH/x+4Qdn5TFiX+8RmIK2GP79Z4scDljA3PHnuAZ3c5VpCh+SRmX4Gt+u7kxqW+zVlxZbic0fhg3eAtigGl83Y4Fe6talTH9sWbMnvlT4Zd7y+OIlINuq3LWkxqZjnC7S2HkS3qA111Cb1vJa2d5AxceYZyTzwicJGLR77A5j6xLPzPJCLRjhAzZLxXiN7ZSQw0YDBw3tdGdc7+IV9gnKHIxez8VH9b351FFrxFhe5LkkojVBpPVTi0YViQIvgoIvsG5KSFQoazx4shpMU2PIYfKpC053b90ylk7+xU4baQkOsWtNxRcDc7L2JoL+DLBeYQlgJdtSvtoxy0xg9jYNT0kJssRjt5jvgaUCSJUQ/I43Y4Fm2jKL7+isheo6XZE0RGFxmkOixCcRHlrhhqce27+Cmhlb5MqmDvKKO77H5lUGNPwxenZM7qbQ3dEH62pSXbKOdXfXhwtz6Fh+SHR+2Lv87/Td/NdsTGC0Fs+78MzafojYP61xD9lGQNMpD4mGykiE8rfrW22oLjqz5HeZqZybJnTv8OuqLxvvkoivfxM++v6xRFmvBSl5RYoqg9dP10WF70/A58JDr9QeW4QAPgByoK2nhrNljQboLkW7NfROgKdB58JrdkeqMpuhQkzFhl+SBoAGWSemf9bs/7f0jKo89ARNezaT31u6n2H/rJos5XSqOo208hq8brprV7hpDGELkfU59cT+2l/McRBn6Ai66//oa4ICKIg8VjEdIFgRudRXg1TYPyD18oIWOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lSHtaeBEDE8aaXywtUhnWbYBOJgCH7AJY/89MNrnFmKy+hx9KKYb8OWbhuQC?=
 =?us-ascii?Q?lvHTU9wgWRX/tOsJIbAQ9/g9LGO80BuVOUSfWkctHKpvd1caq7y8ki/gjPRF?=
 =?us-ascii?Q?wo3MlY5I+q0cfgfXm9pep6ujWXBU4V7/Axg3hmMQS+HhCl4ouCMNp2iHWdJc?=
 =?us-ascii?Q?fiYBnnpPkiaUjqRyZ6+8mMAzRpcnODJUrL0Jm8l1nH6WDdq0k19VGVU/ds7N?=
 =?us-ascii?Q?SFNHuSetDXyDMMezs71uWyed/V/RCE/JgoWFUGknAWGWkwSD4ymGdBvWoCa8?=
 =?us-ascii?Q?mojpX7LlxXVawqQRJ5/fcBxRM5oQFQ7GXMHVVQJRMbavcVpI2oAK/sJa95wt?=
 =?us-ascii?Q?m28X+JgrBbee4yNGe+nf4n4IO0eMM5AYPf8Y55swKVbIPH7ewa7oG1km4QHl?=
 =?us-ascii?Q?oBEXlzpMPHbVJxm0x7DTUrGPEg4UfUdb41HtKvDP/0Ssw0t6XAehLht9SLIF?=
 =?us-ascii?Q?q+7czUIhiy04PK0nlZdqngDr8XVajDs4hId+/wcgSYVfUBrXXpMQ8XCOwEpu?=
 =?us-ascii?Q?nl0ENw0INlkBz8MghuDp81bUeOx0wZK1HIaa5mANlH3xqXiuhRWc5iVoGTa8?=
 =?us-ascii?Q?ctcizzb1b0ipTlj21esPyIJwPR7cYapwAaHaMMPHq9Nx7F9fugFbmk4nXa4f?=
 =?us-ascii?Q?DbM+NdjzMQyWI8i9TBwDdr3AxvGQfMrcmCkS3Kjs4zO57etrDe+tbOrMfqyc?=
 =?us-ascii?Q?rl7f0CS/EqguTbLk8O+7J+F52Q9orzg5tdNMKfnGhWRaub5vbE9esgfDrKvW?=
 =?us-ascii?Q?NEA7Pu/Xmc5gzVF6EtCokDGJfBn71guj9C1+gQvnHEDDQotZxyljCvNReBYb?=
 =?us-ascii?Q?TyeHPTdT0tFeYbQAjensb5rO7Zg/lNF4iL391V1VjnRzpl5aGFgoj2IPdmv9?=
 =?us-ascii?Q?W0u1SY2eetn0s4YK5v+0eAaS2gnUqPTvvK64+5VlZarxe8YmtqkVCuUSYzRG?=
 =?us-ascii?Q?jfAGAfiVRVDQCPZ70JxsE86AOWPXHvE9et2emMkNgTUAdRuzqPtAsLXltSXR?=
 =?us-ascii?Q?wMofDP7SKB86wsC/Pw8FygWFwNwkVHUJ9+wlGBqRXYOw9ed0dTN+/vt7Lr/N?=
 =?us-ascii?Q?9WedKPkn0jf1MJmp/rSlCyX96LjXPEOLT1/HMZl2jhmb/HK1zjMWyEEOyEm9?=
 =?us-ascii?Q?6mB1ladC6cw3Du9BxAqYeeknfTBE6gLq78AdWW2u2Kepx7iMjzZD7TJtfZf0?=
 =?us-ascii?Q?t4IwkbiSk+VPG0wJbLce1+wbBeTyDS1uValN3Co9w5WO5Ct0TE2Q/mDWjDDF?=
 =?us-ascii?Q?tn089GBTZNEAU7//B0y+fcV6XKTDo4V4a5UN9kpvgX1fPwRfwgc2RSTyXptd?=
 =?us-ascii?Q?r2YZuopzbVhg3gcSq0fGEYwttuomwZ2qUK6u6sZ0PgLbqHy3DfFQ17f9xTmY?=
 =?us-ascii?Q?nDwSColzFmdnhMCSiQB/mSnJIhEcG4GzUgznEO+0yOEbjjM1Q9bxppHMOxF+?=
 =?us-ascii?Q?TH77i0mMYWukbT37v3XzciWZNMt9ir2G6hp70+6HpODT7YKQGw+JR3trNu+z?=
 =?us-ascii?Q?T3edLJ+siZ75QqUJiGaUKCxHh/m711CrId98UETciInIjJUw37QGt/vSbaur?=
 =?us-ascii?Q?hZIPwIyJ+KChy8Il+cRrEBB8DIzJ1xGAAMr7J/5ZVhppStqPgo7QBhAYjNa1?=
 =?us-ascii?Q?hDf50N0GeowWCIoe8pgNbN7n+lJ8dfcXlH/LkcH7XTu4k+pRg2C8DlIhvx9d?=
 =?us-ascii?Q?AtLCxCM8+ZaGMjexNnmeQx09fzU75sJM0jSmyzhheFRPoTiEfznXG9VRsbYY?=
 =?us-ascii?Q?SQGOewC4d/rDXvf6+zmDOjbllFJuWQU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q0b56vcyMiiZ5N+W+F3H3DuPrWW5BtUreVks5tper0ym3mXBnAa04IHwuAUV/kVs6o7DTQpFlBrGFoUYa65hc99lEaoXYLC3WszizaCtBD3Oi1eAmWFfP42iTWwMUzNsnVrQIxYOqxReP0z99KtTust445IIcPcSxQbYONSQSJdNT2ZYJxDLlHM+TvyvZVOosIlo9l3yn4rRaPWAdRKCRVVOi88NW9taGcKpF54AcxEoWqf0FlbYEorHxetRvu5Ws/1Lf8KP0sKEBASshyceyS8KBBXv6RW11I/tQC8+2riTvE1cOC33Od0X8zlS23RmO3VFE6Zvi3W2breU0ut6Cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bcc978-b2d2-47a1-063d-08de901803da
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 17:56:35.0888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lh8JyPV8Ix/17xSrtwIjxwB54V2QXOSI7ga9snsmkenKX+IA6kQwkJwqiDKN3JOaKmmQvPWf99sI+Q0r5O7ne1JX8RomuFvXjRSlDZw+wbMvSUABGkN2qfuGWY+7ec0R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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

LGTM now
Acked-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

-----Original Message-----
From: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>=20
Sent: 01 April 2026 06:57
To: intel-xe@lists.freedesktop.org
Cc: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Tangudu, Tilak Tirumale=
sh <tilak.tirumalesh.tangudu@intel.com>
Subject: [PATCH] drm/xe: Fix bug in idledly unit conversion

We only need to convert to picosecond units before writing to RING_IDLEDLY.

Fixes: 7c53ff050ba8 ("drm/xe: Apply Wa_16023105232")
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_e=
ngine.c
index 337baf0a6e87..6dd05fac6595 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -597,9 +597,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		maxcnt *=3D maxcnt_units_ns;
=20
 		if (xe_gt_WARN_ON(gt, idledly >=3D maxcnt || inhibit_switch)) {
-			idledly =3D DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
+			idledly =3D DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
 						    idledly_units_ps);
-			idledly =3D DIV_ROUND_CLOSEST(idledly, 1000);
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
 	}
--=20
2.38.1

