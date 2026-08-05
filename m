Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8F2C55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 09:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3210E1D2;
	Wed,  5 Aug 2026 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTAhxTqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032B310E1D2;
 Wed,  5 Aug 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785923912; x=1817459912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vVDhpOqLfo9dCIsLV4vPcNixbsevMEDSjWiA026QkA0=;
 b=FTAhxTqQoPVcGxWryzmpL7/aEvyW2D7IxF9DQpgD1ktAyJGxzv7Yjayg
 tvKYi4Nqvc64YCTOloHmeMnZXR6JjrGUkaWEPZyhKO9CdXgIep7WpEeEn
 0hpd4FrahEv9hTOs/fzQ0CS2nHXPNRveMcqu1G9EKA2dZpmEtFIFCSkqw
 FXZxiadK9P8HsGW3FPSZQECpRMDKzp+BYoypVhdnQ0JJ9pozqspjdse2a
 A7GGSw6Ljel0sYentXPakqeYkFBp1PAcCFcmwQoefLzOn+EJ99lHCAUiE
 bnCnCa5K2qefcBJeIlIsoxXcKOn5oA1QqIepadwIgmrLShJL+5lkRi+Ef w==;
X-CSE-ConnectionGUID: hrnsCOzxRTa06I1SSU24Sg==
X-CSE-MsgGUID: uOa35iJMSIqHP97+IJBItA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86265445"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="86265445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 02:58:31 -0700
X-CSE-ConnectionGUID: lwdC7z3USQa8fiSUhxPXwg==
X-CSE-MsgGUID: koCwmAx/RdCY7SphMfykfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="260003337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 02:58:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 02:58:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 02:58:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 02:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ8jlMS/H1vom6zezHvkZ7+ipclcZ4chKi9Bz7+LHN49Q/cFjaxRJ7k0rlMlm8iHtIIu+q+Gzy7IrK6B6D/SDIsIy/yb9UgJ7OvNJeWU8Kr7A0dtsUMUlPcukYlPdYzuHq+cS2eMyed/QMV/YLuppSzOCwkpniHO5v0PTJBDVhCX6zikVJkHp0MdKF8oN7VcRw2gFKgPPLxjj7arWl4Lc/XdIoDuuDmpHbMw6KAq4WFjloSKcr34E6HzoU5jggEP/y0832daNobo81za7o4h8c+LTKmHk60tjMImi/GgAJVWg92k3mojR6DhbWSoGoOeY4qROzgNPB5xn8jobTq7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ryEak7rwgbeYK7QVVWG5+HYisRfo0hgzRuRHXA6uRY=;
 b=HZiwN8j7RV3FfRHHqrNycnuudG1wixS3GBuNiwAmYEoRDKt9mj9QpI0L9/tw6TaMuXL+SIh6q3L7ix7GfyZ2UIYv1sa+XtfuKwtITGhVMiFetWcQNiLbe7fceTm2/s92dA5tSj5ErDO1ifk+eLENTxj/uNM8xXRsuf44YuTcZNf9B8qxYXXcFLoWtug/RgtN5GrUhFKmBLp0OsLx2i+rtbjbIybifmQ828GA1tV+HOdGFu++esa7iaanJLTLq/IDI3euujQXti4evUsFWT5t926Wl2s0pJkrQoWijxIUeOsJbrqklYf61Jrw/rmBVow2Lwqx7VHi2yhptWXS0lXPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 09:58:22 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 09:58:22 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHcph3FsqS1/K+rvUKHMUB9V0aQBbaQNTGg
Date: Wed, 5 Aug 2026 09:58:22 +0000
Message-ID: <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260225061110.385441-1-arun.r.murthy@intel.com>
In-Reply-To: <20260225061110.385441-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB7923:EE_
x-ms-office365-filtering-correlation-id: b8362835-48b3-4ae1-7058-08def2d815e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|3023799007|4143699003|10067099003|18002099003|22082099003|56012099006|11063799006;
x-microsoft-antispam-message-info: HOTFhf3ocoVV3jeg/USOTJvbgy62+ZuExJuuK+CeUwq894ZgZnMc2Nv3v2q19575upBm6qV06LXAo6bMRpSm4H8eSXD29mAd3mJ6frShVJ+6yKR7ZQRsxHdHt/L5ykFH0+N0iwyCflI8W+H0fKZb/ykyit7aRO6UnGMT+2p9guJwSIhi559JrzqBLNzCqlqCCgIDaCxh3dsAZBapTMBwD/uOj2QpzjvtdManFpg7TowG2l5Xp8D5WOLrNo6c0oWztiSHR9hGPsvobB7jYF/xkv004017sUH/sxFdOF/b/6HhcUGdLR2a8Chuw7bXZiBmBrGmWmWsY3GL6nqc4tRER0O5aShQWCXnktiX7EplvAAMC5dvEygE/hZozl6VmnM54W5UV+R53SSKyG0g6+CWIg/mkyIk44vHxpHI0ohEG+ODMdFhJq+4y/E0ADyGzwysrjxSraULKuiPvgTugxwMTYD9H3KJr5BiAQ29q7Y+cHw6XmVpciFGd9GwBEElErvmwVOY40S2Vf82+a9Jd+ed7E+bGWr4JdTjUBvilNZCoZ9nQfvk4Yr8VeuSCRPkzNaDis7lHDXTVHDriwO82iB228faVeFB7MyDV0wBy55jUmZ8HHjJSOvES3oCmRpJ88i/dY5zhDPjjsP79ikurKOFqkX3mg31HNpHoIJ+gF5y5SE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(3023799007)(4143699003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gk63G+9WJygN9KsVWd+qPnoQNfYVnkADLtntDvvKUjiQiheHGaWUfFmf8K2W?=
 =?us-ascii?Q?6Xt+70yqLUTycRyJEraBw4zpOpNHzFf8Xi1moYU/KDoTJ0r0RvohJ0+p1MXJ?=
 =?us-ascii?Q?o0xDTA6KE0iw/Q+1GPIOniWZD+9Z81ACzfhUtsv/0iO+MivRdr/qcTmgS4ft?=
 =?us-ascii?Q?v3eLNr2V6JVnav52pi5SFyRu2LHCfnkxI1T3GLBqvRr2gShHeugMduMKwbXw?=
 =?us-ascii?Q?sWaaLRW8QD/a6V+y45ztg8z+Cdhv3H5hRHxFesuFITGOr7WP5cBnMJYISgdV?=
 =?us-ascii?Q?vFwvdfuNjxtDnGXq+VnzZcn2KM2AFwB46rDsOwx87jKUHJzqls4ZmsbwcdfX?=
 =?us-ascii?Q?NaoxP3pPRHpsMhI8R4ohjYu3unBzwiBztJuu+eaGYGXIX/yUu6LBnw39B9ko?=
 =?us-ascii?Q?Re+foHqe3WfkKmq+0a0wcEBb2U26X14E8IF/2VzNtkz3JmOE7AG81TI1mzpn?=
 =?us-ascii?Q?702ABh5Cpqaov9TIhqM2A+2EwwHv//y5Rb4j0NdKUAWPO60xw3tpgpd8V/wl?=
 =?us-ascii?Q?nIvFkc1QyPhxGl9qvapfLMfodM6QFgu3euyUxWYFQnTe0uCFNC7IjyWpsAjH?=
 =?us-ascii?Q?/DMbBiktfdL71p4lPvRDMWR6BZmEiCnlaHUOy40eMeYcLkRnsBYB1lMNiZa4?=
 =?us-ascii?Q?4/QggxVXuUTUsUv7CaB9nU2qgU6r5k9WVOPyuPBUOvIzyC6beCif5mOEickW?=
 =?us-ascii?Q?W0xFzC/yDDpHuBx0oSnsZo50ptWWbUjKR7ixTw1xOH77pGXo839E3Q5WEw0V?=
 =?us-ascii?Q?glFjgUcGU9QjmNqXZ/FbkdHv+kTXrdBgOhjPo61bVJ987CjUAXCvcbH6Fluq?=
 =?us-ascii?Q?J0Ocset8ARk/MZGP3o+ggqRt/pQX1dmAqUxsGCBcvUtLpx70nshD2FXYD8Xk?=
 =?us-ascii?Q?AMEw3QstjSQm1KFqr7JqABposGXA8V5xBMW95hE8lSH08UvQXrXPezIdROPN?=
 =?us-ascii?Q?wlgWY0ZOCiUjukS2kIj61x4iUHpIa8VoeX/KwRHMGkAELfGXJnbfPLUZXOBz?=
 =?us-ascii?Q?RGJE1JY7fOk/to9sNRi+iD+UlWjadLwEMz3kmk5Jyd4IkrNtN5PHbJhuMj2F?=
 =?us-ascii?Q?yFCffjOjq8miX0tsifMKNDdLgrtiZ5E/sO03TD6BJ4EbKg3hDUWi1b4IYm08?=
 =?us-ascii?Q?c1JonLGW7X8YdQ0EnLYA1dzW5/gsL2dEF9v4qCyindofE3ursq9mPyZrBacO?=
 =?us-ascii?Q?pJiMbYtjdZa61CFAe3h31Dkku4picZpam+FKt8DDQtv7YcKgzZzKhB/U6ZGv?=
 =?us-ascii?Q?hDiCB5E3iNXCYli77dOe0GSxTY2AGOxnsAEhTQNMuRhjR8umYc7thMY8XSbf?=
 =?us-ascii?Q?6vaxVczR4NIv8Wu0359fP5zSx1B0n0d07q+EOoSro/GtWmSWCexXOwsQotNA?=
 =?us-ascii?Q?kjg+D1p4oURu2G5T0ypySVbsZzJgxufFdkeUZEqJ4+swrMezj9NDXE06eAW3?=
 =?us-ascii?Q?tNRlprP1gN6kOp4eDlRVtkh365Wr/Ii5eTrO1v1/iRFgLzdFZNpSlXaplRaC?=
 =?us-ascii?Q?kzLwp18f+K7uhigjF7rLlF+YkFXYYEBslcP7DjLjdCvwE10KDEGgOq/Ialm8?=
 =?us-ascii?Q?eswLrjOOWa7ZrIS5qjsotg947Z7I+h9U/BypQb2Hzo/Q35EgBhzC87bz8Bxc?=
 =?us-ascii?Q?smvOZT/TpXERITqmrzobCY6GQxFMhWuE/gXsvQkCEnjpajEn5uUv5Yg+5dyz?=
 =?us-ascii?Q?Qm3jFusaveDD3NmWPCZNftH4CELGSKYpDZKgTX8gViSCusZc8sz0vhiYfsZp?=
 =?us-ascii?Q?G0oqQnxxIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kqq340R/WEh6NCjpzSgUX+eoEbpdfqPVJln5vdcmKLgNq2s1CPalR53Lbw1xUsX//LN6FqsQjd+vbZkCphZZTi5czgaLPZnZqRYQut2bOGXz/K03BdYYPxBP5DV+mpFu5tcS41aflG2Cu7hH9T8VWn10ChKx64BpgprwiHAwJVgSE7wDZkV56xnLuh6k+J98gqR70JHPGAQc/P4fMMFCL7u/Nn/EilIRSaGcMnbh38E8OSGZEnVdrs3ez8dC3/ExsM+G8L34zBon0dM/R5f1m+jkKWKZ1kjYy8dPD4qjETsoJunhN8yTM7uq18HGds13JjBIFvK0qVqY3WZJnGEW8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8362835-48b3-4ae1-7058-08def2d815e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 09:58:22.7182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13ZgPIpDQQBXC1VXkFdh87eMKrm9X22qnRR7d+vXBd56SjSOYHVeRh5PglNlz45xm8BuqfHwRKOBUXxA/WwuLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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
From: Murthy, Arun R <arun.r.murthy@intel.com>=20
Sent: 25 February 2026 11:41
To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
Cc: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.c=
om>; Nikula, Jani <jani.nikula@intel.com>; ville.syrjala@linux.intel.com; M=
urthy, Arun R <arun.r.murthy@intel.com>
Subject: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP

Its observed that on AUX_CH failure, even if the retry is increased to 1000=
, it does not succeed. Either the command might be wrong or sink in an unkn=
own/sleep state can cause this. So try waking the sink device.
Before reading the DPCD caps wake the sink for eDP.

v2: Use poll_timeout_us (Jani N)
    Add the reason, why this change is required (Ville)
v3: Wake sink only for eDP
    Remove the dpcd probe set to true/false in wake_sink (Imre)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++++++++++  dr=
ivers/gpu/drm/i915/display/intel_dp.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c
index 025e906b63a9..38ea4aad74de 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4705,6 +4705,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 	intel_edp_set_data_override_rates(intel_dp);
 }
=20
+/* Spec says to try for 3 times, its doubled to add the software overhead =
*/
+#define AUX_CH_WAKE_RETRY	6
+
+void intel_dp_wake_sink(struct intel_dp *intel_dp) {
+	u8 value =3D 0;
+	int ret =3D 0;
+
+	/*
+	 * Wake the sink device
+	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
+	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_SET_=
POWER, &value),
+			      ret > 0,
+			      1000, AUX_CH_WAKE_RETRY * 1000, true);
+
+	/*
+	 * If sink is in D3 then it may not respond to the AUX tx so
+	 * wake it up to D3_AUX_ON state
+	 * If the above poll_timeout_us fails, try waking the sink.
+	 */
+	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
+		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1 sec 2.3.1.2)=
 */
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
+				   DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
+				   DP_SET_POWER_D3_AUX_ON);
+	}
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *con=
nector)  { @@ -4713,6 +4745,8 @@ intel_edp_init_dpcd(struct intel_dp *intel=
_dp, struct intel_connector *connector
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
=20
+	intel_dp_wake_sink(intel_dp);
+
 	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
 		return false;
=20
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915=
/display/intel_dp.h
index b0bbd5981f57..3f16077c0cc7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct intel_display *displa=
y,  bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 				     int hdisplay,
 				     int num_joined_pipes);
+void intel_dp_wake_sink(struct intel_dp *intel_dp);
=20
 #define for_each_joiner_candidate(__connector, __mode, __num_joined_pipes)=
 \
 	for ((__num_joined_pipes) =3D 1; (__num_joined_pipes) <=3D (I915_MAX_PIPE=
S); (__num_joined_pipes)++) \
--
2.25.1

