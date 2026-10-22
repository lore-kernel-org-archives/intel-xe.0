Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D5606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y+Xfmch3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AF112834;
	Thu, 22 Oct 2026 17:06:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44C112833;
 Thu, 22 Oct 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792688755; x=1824224755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VOEOQ6DBm5LmZM0KzI+Ra6yY/lNCoCTKoPThvh/u6hM=;
 b=Y+Xfmch3nsPJF8c7hCOrjVtW96TuEThpguyFEAr+5mj6AqkGXLXTaryI
 rQjqjfHzYAe/X2rDgd4bBcni0COb9XlV9Mw9QLp5xHDYNxAUJVuic8bEI
 6avOAdM3yhRPaefJjjG/acf0GZW7do9XrY6LjGWBFA+lzkwJRBTnam7Hj
 WqR1HsuS0rDh+tAyZOyZw2xILQYZc8vo0L9K+VQwDW4ZD6Ej7UoSY3s2W
 AzV2jJnZ9xp2kiZg4y63tDQHA+CtEcWFzxNnT1W1IEvhG8LlIVrI8Abby
 7In9UQka/+QXiFrhUDJmvb+O6a6HtiUwn2ZsutHpYpdn6O+XXVuBcvE3F Q==;
X-CSE-ConnectionGUID: /qDbggYnTW6BL7WlQpt7Bg==
X-CSE-MsgGUID: m48w3wiAQg6BY0ESp+C/Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1430551"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1430551"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:05:53 -0700
X-CSE-ConnectionGUID: LyYoDAdwTtONcDCjaHKCZg==
X-CSE-MsgGUID: N9bhtAPdRTae56ZF7o/W+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3536478"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:05:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:05:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 10:05:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:05:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVYt13gvlTaJVliHgI6N7YduKGUF+4LhUhHeMSmtkBPE2luPHKfvKfYeG28Lk38eeUweYXXQWj/RnSaI4vkFaKjf1dtX0yTnJpa8Ww5c8cCtkD22K/OKtjx0NpRXsHrV/LyDPfSZ2FwLEUxjdU//WNWSGXcyT/qESR0DVxoHpAZqpu6j33uTVY+AHgefho7vDdn07oNxDVcVkGD/7X5XmtZmZHbIm1nvFn7zSwjOxddf5G2ZASBdZcV7CSjfalDRBLC/JBWs97/uRD6ZnehVpBL4O1hlnCSSa7nmb4a8qsdQruQlYL4KOWuHrTHk91HnS1C7j3V0F9YxtQWL0w8yNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rboQ32AtXL2/x6AxdptQoBYIuezgo7uO7f9wMlxM8rQ=;
 b=h5nAncmzl2oNKNCv916QbpKA/IYi90lrrVK8G3LscXcp55D8n0HMJcrfihY73rqXt9kCb2FbsMOmglJ23O/uj2qg4jn7dk2PUkAux17HK8IiVoFfHaZQJ552uHi5In0p7KdTWS5mlXuF57iGz0j13Y9sJPfEzKgzS0R36NgBAbuytdIXpbSBCtOxx6ZA3P7n8sbZUMDYhsBURqaUL3mpNrfLLJB4Bx8dTZlkAzk0KfcUPb5PI5IcUmUNhaWPnQAWW7IMMMqPFkvW2uFin0acbF//KeMpO0oVhD2ureWiL+35Q8OEla4cpN/R97FStT7uCm5F08Azmq2zkMzY500vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB8097.namprd11.prod.outlook.com
 (2603:10b6:208:457::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 17:05:47 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Thu, 22 Oct 2026
 17:05:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Topic: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Index: AQHdYdS1AXzj745BdUm5SFLUBwCT37cJvN0AgAANW+A=
Date: Thu, 22 Oct 2026 17:05:44 +0000
Message-ID: <DS4PPFE901A304F1341629058F835D2AFA1E3652@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-13-suraj.kandpal@intel.com>
 <BYAPR11MB37835D03743FC55851DCE427B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37835D03743FC55851DCE427B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB8097:EE_
x-ms-office365-filtering-correlation-id: 127ba691-c0ad-4bd7-986c-08df305eb5a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|376014|366016|6133799003|22082099003|10067099003|18002099003|261021121427099003|261021123027099003|5023799004|260925021311599003|260925022911599003|11063799006|4143699003|260925021911599003|261009223027099003|56012099006|38070700021;
x-microsoft-antispam-message-info: K7IAA3EKsaq1iWBZxe8D3hoV6caWk5OUnSuHZslFheWbCI7zR/iL5qgUUMbv4qLNa0MH5tMozZaOLOAUHWpgQBOFYjqa5FBvArDvgwUhvrXYXiCW6B61N4cA2emGh7O8TRptguqkR+Q37g0w7hVSSGZPcL/wyxAySRyo240rbQ4BY65ZLSnfrMPMNMaHAH94XbLczGEUkvrMEd2yeCGJc5sdbOZOmKruxDC1HhqeKQ48WV3IMEj80GtitZIfU0NBZFx9OklWZolCFxCpY0b4xn1eJWzS6wD6X2ZshL4cjpL7753mxTZ5h9V7FkYRsvE3nhsDrF956dmbH5b7M8AGwS/k8FZh0LIdO0zdhEkiMkYxeVN/azhmvA4h2tYlrP5KhHdawFyOoRAhHU7jCveI/Qg8pxEL2KXNsjTPYthO7Ilz/renQJGdc+wia6SvH3ir89rnTqGs6pLklrpL5am8Op5Ne+pOZ/meXRCpvA1iGYf3wS4D9mnXRFZaAeTdPbobAlXu0qGx1eK94VOAfZ6QKKwwyj9JxmfG0ZpD9RSnMNTkUBYsYZgDNxYReHU72ZTASDJZphRU4IZoaA2f7bojLQ0IQSbjmge9+X1JDyffvp+QcSj2MbtvFt/HJXqkS1kRDpLWolGeYta1OowNy4dTcexZkSRmlJLvSse2Pd/RjBLxfJxHwjpVeogOBzCVDaigHDcITsU94prRbonZ/ePkZ7n3fX+JgsLqwTw6A+Z31TM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(261021121427099003)(261021123027099003)(5023799004)(260925021311599003)(260925022911599003)(11063799006)(4143699003)(260925021911599003)(261009223027099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C3JX79U845xywlr/yqRXT6YJZrVseirVfg0yMS1DhN6Fpad4KDo9bM81x8d8?=
 =?us-ascii?Q?LAQ8UFaHV818+lS//4tHgp2dLn9/mIEkJtdbPHSFkKmY5yMw70DAmM3rtXiD?=
 =?us-ascii?Q?yQYQP4VMH+w/Lb6ByhWoV25fwK4whTunVWblXZwvHOxXCR2N99+Ntf5niukr?=
 =?us-ascii?Q?RYJThfH79vpUNOd6OadAjwYajpcRG0J+rxlFX68pnf5hnpfjRi/+Fn5BmeBI?=
 =?us-ascii?Q?rxxUsDsbL0sRSlc581M2Guk0UbbskOps+rrmCNX8+zFNWGpwtxiPEI5M+W0R?=
 =?us-ascii?Q?vFQwhzXIhMvbHQ1gcAPbp2HDZc8+twNceVzGI3puwaQP09z7Yc72CLr4SCAa?=
 =?us-ascii?Q?ZZ+zNsnKKYseVXalprskTBf4lTQSL14yf7VjP17SFAdfW3tmALWJMVkwPy+w?=
 =?us-ascii?Q?Tsi7fl+vbJByoRPg1IhW8Q158CEQv9I7EF4GRolg83/fFbLWvTtOEforS5FB?=
 =?us-ascii?Q?D62IX7p/9HASy9mSaQTD1ETj1WLv8/F7mz9XDr9AFSl6yhl0V5mBLjYqSyRr?=
 =?us-ascii?Q?3sAN/3YaX7VCbRHLPZuDP7hLTMFIoXIYxuwTZWT5HQp8ZRbgQqV/r9yFrDEh?=
 =?us-ascii?Q?NVGEhUWy3lwtN2wBcKBGW35ZNX/j32WDG2GwPUGQmRcxsUV9RcNp7w2F1VTs?=
 =?us-ascii?Q?opB5vHtddOSf3OIcMU0HyAgyZEMezY2Km2yJX06o/cYYIEhlEIR0W9fklFoe?=
 =?us-ascii?Q?NitoWsDrh7JFUz77tjyd2uNPcwtMruRMb/cxzf8zLVkRXgyEHaeJ+kC12fks?=
 =?us-ascii?Q?Gamj+e8cvlM6DOnrj2OvB4M7e158lP5zk+/9uZ4I1Yu2cU/2UOTw1T7229u0?=
 =?us-ascii?Q?RscvsKqlV6s72QzBJAxyOmQhFVws/cbnoPZM3COThZQ7hhH1uTyeUx9uUB+j?=
 =?us-ascii?Q?H0YACB4hyAbRPmWtD5IXqASQYPmxY4sC+LExfjBs8Y9WZYY4oEye1X5eU+hA?=
 =?us-ascii?Q?gWQLZCI4052akyfzkw07mlms0waDGWtj4d1SnH5R75etk3arN4psBq8p6BhP?=
 =?us-ascii?Q?U/DOZ4qQGoRodQL1rWifdf4BxadIETpd9db0qRAXVn8OwKWyYmTk1IrG0f//?=
 =?us-ascii?Q?t6eirJ7BKLBzk3wernkV8T7ajUSMHUfL5q7Kwa9kWNjVTyK9OOorsytCWcMH?=
 =?us-ascii?Q?0Vjui/rlEVvV1CpjGTGsj2+ZotSLVslnR/vIpAGvcFXukHWLcazy2uFCn8p1?=
 =?us-ascii?Q?VrwFwwyjHQBvm0+LuZZx9hptP8gzfdEWjL18t00BCMGuUDSrGNhoTHu9eiPQ?=
 =?us-ascii?Q?eQUT3iD1EME8KNTID5sGpak9nBq5mLC9X3+U6i9XBPTeA6BgH/Mvzf3yi4bl?=
 =?us-ascii?Q?K7MB0Jpoe9JFbWXU5m1k1hu6SLstxd2oc8I+2gSEOlAEA6bF2hUUoL1oP8E7?=
 =?us-ascii?Q?vEw/keXGVNoY+h+8VCqOwfiuVxFnwY0C3+A9jJZRt9RQBc+P42q3i8l1zBu3?=
 =?us-ascii?Q?F7NV93abGQojflrSx5F/JcWhGOTuxjwQGg9g5SBt+tc3AEk3+jwZj0xAv8Hh?=
 =?us-ascii?Q?MkmtOQCnva8/2YaAt99WQ8VDcrqw2DwGRDu8NOMv8pyeHKsXalk8oCUT4Qcy?=
 =?us-ascii?Q?RQwLxqZ8tm+aNHrYZivpJEn/U+KGYUZXFekwyGG03Bk4JTPMsjhmNum0AINN?=
 =?us-ascii?Q?wlWh4AyGOSatKpmJfG7ap74uf7s9MCO+INK2tUVMMYBnvH5HxKr9U4WN1jG1?=
 =?us-ascii?Q?Bm/06qOpai0zHEGlTT24HsguSUXhM6AfYt/eEEYRBexMb5jE+DzVRWHjXWey?=
 =?us-ascii?Q?YyiEIRe2ZRQL15Dt/bkMm4zUoNkhxkjhLTH1lhkciaWyv8z0P8rA30i+sTHH?=
x-ms-exchange-antispam-messagedata-1: cGa7UefWLhOzig==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UBWp0DbEG5QWaDVVxtrx8GI2JjZkORoil9WTMOxxWf6XYWmMDbEVlDr6mwZEPCJbFAk5GPxaYmIdSgXk+WJjfcDR1ECIM3EOQXU5Ts0EsbecVMcRJgKK6JrTxD5b5u8xzDJmxTfBMbDfiLbNHbPt/Jiag2GM1R2yNOxp7Q4EdfDNxK8dDhIuHhO51T5bOU4XuYkGAuHB8NJEnlee0BVEDOJg04kHITl1Om+fEkG0UlHw4jmeDMdVFwdvfi1G+Ax9Gl7POq4Uyh1NYo55gHKfy4byJ0EDlmsOKELTClJoiNGMO4Y04B/K4Vxou2B7yHTdChvGgPnVWytmwwrNIA8WQg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127ba691-c0ad-4bd7-986c-08df305eb5a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 17:05:44.2283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJk7LKjxAWjvXQ2QD99Oki8APb2Nqq0BldMhCkMW2NjFPD/eLy8VjOJ1TnJlJmGN2bzDwmpHlTmOOIzx+jbXhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > Subject: [PATCH v7 12/13] drm/i915/dp: Extend
> > intel_dp_can_support_m_n() for BMG M/N bypass
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > On BMG platforms, the standard M/N ratio limit of 10 can be bypassed
> > under specific conditions, as permitted by hardware capabilities.
> >
> > Modify the helper intel_dp_can_support_m_n() to account for this by
> > checking whether the platform supports bypassing the limit. The
> > workaround is only intended for 128b/132b links, so restrict it to thos=
e.
> >
> > During the mode_valid phase, the check assumes that TRANSCODER_A will
> > be used, to allow the mode where the M/N ratio is within the limits
> > for the workaround.
> >
> > v2:
> > -Keep the helper static: the MST mode_valid now goes through the
> > shared
> > intel_dp_mode_valid_m_n() rather than calling it directly, so it no
> > longer needs to be exported.
> > v3:
> > -Use the cpu transcoder instead of the pipe, following the change to
> > intel_display_can_bypass_m_n_limit(). (Mitul)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 8e6ba5b9fde6..045524994d85 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1285,9 +1285,11 @@ static int intel_dp_link_m_n_ratio(u32 link_m,
> > u32 link_n)
> >
> >  static bool
> >  intel_dp_can_support_m_n(struct intel_display *display,
> > +			 const struct intel_crtc_state *crtc_state,
> >  			 int pixel_clock, int link_rate)
> >  {
> >  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> > +	enum transcoder cpu_transcoder =3D TRANSCODER_A;
> >  	u32 link_m, link_n;
> >  	int m_n_ratio;
> >
> > @@ -1296,7 +1298,16 @@ intel_dp_can_support_m_n(struct intel_display
> > *display,
> >
> >  	m_n_ratio =3D intel_dp_link_m_n_ratio(link_m, link_n);
> >
> > -	return m_n_ratio <=3D max_m_n_ratio;
> > +	if (m_n_ratio <=3D max_m_n_ratio)
> > +		return true;
> > +
> > +	if (!drm_dp_is_uhbr_rate(link_rate))
> > +		return false;
> > +
> > +	if (crtc_state)
> > +		cpu_transcoder =3D crtc_state->cpu_transcoder;
> > +
> > +	return intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> > +cpu_transcoder);
>=20
> The same bypass conditions (UHBR + intel_display_can_bypass_m_n_limit)
> are duplicated in intel_dp_check_m_n_ratio. Please move them into one
> helper so the prediction and the decision can't drift apart.

Sure will do.

>=20
> >  }
> >
> >  void intel_dp_check_m_n_ratio(const struct intel_crtc_state
> > *crtc_state, @@ -1386,7 +1397,7 @@ bool
> intel_dp_mode_valid_m_n(struct
> > intel_dp *intel_dp, int pixel_clock)
> >  	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> >  				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> >  	for_each_dp_link_config(&iter, &link_config) {
> > -		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> > +		if (intel_dp_can_support_m_n(display, NULL,
> > m_n_pixel_clock,
> >  					     link_config.rate)) {
> >  			found =3D true;
> >
> > @@ -2775,7 +2786,8 @@ intel_dp_compute_m_n_ratio_limits(struct
> > intel_dp *intel_dp,
> >
> >  	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> > >link_config_filter);
> >  	for_each_dp_link_config(&iter, &link_config) {
> > -		if (!intel_dp_can_support_m_n(display, pixel_clock,
> > link_config.rate))
> > +		if (!intel_dp_can_support_m_n(display, crtc_state,
> > pixel_clock,
> > +					      link_config.rate))
>=20
> Bypass-capable configs now land in the same filter as native ones.
> SST walks rates in ascending order, so UHBR10 with the WA (ratio 10-15) g=
ets
> picked before UHBR13.5, which may satisfy the ratio natively.
> Could we keep the WA as a last resort: build the native filter first, and=
 add the
> bypass-capable configs only if none qualify?
=20
On using the WA as a last resort: native first breaks the WA in practice.
Whenever UHBR10 needs the WA (ratio 10-15, ~3.1-4.7 GHz), HBR2/HBR3 pass th=
e
ratio natively thanks to their higher symbol clock, so the native set is
never empty and the WA configs never get added. Since the filter is built
before the BW check, a mode that only fits at UHBR10 would then fail comput=
e.
Doing it right would need a second compute pass, and I don't think it buys
anything: a ratio above 10 needs ultrajoiner, which already disables seamle=
ss
M/N, there's no DRRS on BMG, and preferring the lower link rate is the
existing SST policy. Bspec only requires the WA to be used when the ratio
exceeds the limit, which is the case for the config we pick


>=20
> >  			continue;
> >
> >  		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> > &link_config);
>=20
> One suggestion, not mandatory,
>=20
> If possible,
>=20
> This makes the bypass branch added in "Implement Wa_14021768792 for
> BMG DP..." reachable.
> Please put this patch first or squash the two, so the WA arrives as one
> working change.

With this patch first, ratios above 10 get
through the filter before anything sets the flag, so a bisect could land on=
 a
config programmed without the WA. The bypass branch is also reachable befor=
e
this patch with forced link params. And I'd rather keep the two separate
than squash them.

Regards,
Suraj Kandpal

>=20
> > --
> > 2.34.1

