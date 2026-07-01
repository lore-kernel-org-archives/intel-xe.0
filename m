Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C014C44501
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 15:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3E10EDFC;
	Wed,  1 Jul 2026 15:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XjZ/skZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322D10EFA1;
 Wed,  1 Jul 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782919982; x=1814455982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=mzSFTGfbnzZoLGT8uxxfn7iJIihu96e1+Ywq+qxCgwM=;
 b=XjZ/skZK55+1topwK51QvoBDJNgs/nP+VbV1IEVXkG9F5ujY7thowfmX
 Yj0ubfVyT6XcBVru+ZmQh+EC8KccG1aNqGo6HQgDbjXgjQM8Y208ImN8G
 cumaQG4qzeBktX+rZ9uVJOjYLZhUGDCwdCUbJnglyX0xv0KUAEoYW9APF
 +19i9QHNppZz0hTAl2TLuw7+XQi5tD5tKlo9fGYTFY6707/ye2O7RS9nk
 ejPTEqv3KD+19fSqu0rAl7Rq8mk+Ti0SSUk0oFJMEssjMj89Hi2hsisxw
 24Z7s7VWFj8oU1T2tIzzjadRJ3ZLQ5omdFC/zturG2CXVPSvgYlRBHLeF w==;
X-CSE-ConnectionGUID: 8a97Q1EUQWK1louom/D0Cw==
X-CSE-MsgGUID: bZximigYQ/a1bvq2FfFmOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95159206"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="95159206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 08:33:02 -0700
X-CSE-ConnectionGUID: cuGlomPASFGzE4aOs1gSfw==
X-CSE-MsgGUID: dpPqjv1DS4m89sG/Lt9CoQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 08:33:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 08:33:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 08:33:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 08:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XC657KG0SN7ey2CpTSBaibaks6/vULxFGvU18nXtS7IoK2olgv1CuUCtSgTCUDmPh/XfMJB5la8QC8IvKMBuk2XLUu2jhi2OTV47YSogVFRfGs6VqVjUz1cpLxDvSm/sGLZy5Rjzp2WI7i6qVZEGuncMFR1NE13owogACeWyALY8aOmFybI9W8WusjyMTT5WuSQAZIMnLXYGemmfUMTEImfy/0MBwJ409U3MQUr5JMfquyzKHGDNuCHs1yDQfOZZd5FlIBEyPQCesMyOzap0n2Al+bHbqAlQHZmnzprPGq3JLdNN8Ei94MQHpEh8i5s46LN4iLEAWKmeIOWGLR2ntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I2ryzkgrm5MB3KMwmFmnrav3w+EpGXQ6peqqNQSYxs=;
 b=lMQ/EjGi9zbPYtNa+bXCbtxaaf333nuQkTKoPkKiGfNJO7vR3fWlOTJzgy3wlEH7WDgNO70OvCNWRrjQvj0MWSygdu7keAJwT5Wx9o8kFKyLcY/rSzIkjNZSPZoQAuqTUX8jc5JoDqXnXvzUvwwLVr+jfx1NMerAY68RB46BwR+QqF48sxy5w5wVXr6opXQmae/4DZzX34A7weDlHnk3FQQeTf4e+p3BaoLMFhQGECyKSdLpodBRQp9m6qHQop0DG8PxB97+/j8LEWNYo3IrRy0ixtuoNTj4GUdQXxBC1vByQgQLI16pESsPw7uF+rIPsx7RDeAEfoqE89K7cqOA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:32:58 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 15:32:57 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 16/34] drm/i915/dp_test: Use link caps for compliance link
 configs
Date: Wed, 1 Jul 2026 18:31:45 +0300
Message-ID: <20260701153204.4124150-17-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260701153204.4124150-1-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0097.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::11) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 440f3ec5-42e1-4645-4f35-08ded78606b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|18002099003|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: CP4uPbrereZkHpxHXGPuEaPVsdI+5vpurHRAyLEWbzKUoaxv8DzovHtm0yUq8PVE9b9/LMLt+WPABTGibSu3NZvl3zygG6tpSl4XsUZX0Cg59mmokakY3+pvqnGBXtN9naJW7ytmGbpYl3jLenuNxsuWvvxDo8+gihvpT9UpwkaBd4XSC+B6ekKFbnXjPtBpV9atnbmubUyB5CjxS8+8iyFcAMzSBGmX3E7fJoM1c81HzBtP3qarWBNksyO2QwTrDub8gMdorg3nHfuKIIQbKMeQDJlKI0zbtNM+GYrrXQKR20+EWXrzyKt1PcZTLMRMrGRZx5lmM07ngjOkA3/u+Gv0poRS4kbKT46B6UFCBwHtnE6TYWlOQ4EN+WG+B8coqaWDpPNz2u8w7vVpBL1Z5EmxtdkTqG53x6lnEHkRlAuLwGC3kCBjE+uYJeHPNuaxChPCIi5WMKyWirkLiWo6fPspypqvZXIIogaNAjubDgRVkqN32M4HLFeH5RPro57BpUS/zIq/hZFvbzMeCDx0xcUjvJp9jWKfbhnFZiwwdNXPZc44knzDVfFVrojV8QsJ1l3ONiaaEZ/gNYniG1xVPiAQ6sCJW5MUe4tu3BCUkXfDmnMaLqXiF6heS2pUeNCbrUQTREQWCqEb5qGvtnbvu1rsdYtqxW7zIWehCDU4TUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(18002099003)(3023799007)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSZNpVhWsHQMW8sJpFX9o0ppJd7e3hvnN9/Vzb5UpkuX0jY2wA/FjTekVnbN?=
 =?us-ascii?Q?3+uQeNYypssWoSmOcAnAi5Vq0/lWDtJ7CkKRjEIh1GUMoWC5txOtmlGVCw48?=
 =?us-ascii?Q?/fpUvTKz6hUeo4S6GMV4rBBlv9oyfFTy/ZozN8XQFBF8k0eRQvF2KmKE9Z5k?=
 =?us-ascii?Q?AJtN6PYrovlzxxW6T3Ii+qLBlHGP0rZQgkwsgLxmy+xjUknVQ/Z7KX5rjAVS?=
 =?us-ascii?Q?qUWdprnB77e6HMRFvYMouq1yISwFarHGWTVygkviIwje0tlWcL76f66NPKKK?=
 =?us-ascii?Q?4I0pmUGVs3vmTPPWicAyLVWWm8Fx5h3R/pH37IKLNWGHd17S2+/G36Dv4INu?=
 =?us-ascii?Q?Gjo5HQ/7GbUJT1fA97Z6wO06oOBNAETGHc5KGHfzYfRp4usiuGXaCZR3zJ5r?=
 =?us-ascii?Q?8bFpIY0OzhCDPrA+RgIogXPhFedzlEzesr74MRgHKI2Am9C3Izn2NN8BvCjS?=
 =?us-ascii?Q?eH3wbRuuLlT+2z/2nVfQk07PU/Eeu+1mYQyaKwO9I2mm1vBsZWlD8yofZKoQ?=
 =?us-ascii?Q?PzdpM2tDeQKGedTA3L68ZQYBfgtnlovcVDFX+REpfQy87OBVxKVE61PC87k/?=
 =?us-ascii?Q?FODWhDQfI57X3K7Ow5/okitbe9/yibKvxKT/+GHcEQ3qFhaahJP4+yIuAbBl?=
 =?us-ascii?Q?crZ1nvJq4MMfbXUPNNrOtMREbWD6RN/s4+g61accJhmnaVEYQWUGj3lXOkTz?=
 =?us-ascii?Q?qD7ozUJqzSyT0VWz8pQs0V68QcprwFXym4lw1ixsz0E3Ft/zpqN0Oi+ZUuiz?=
 =?us-ascii?Q?Nk9FOJ+d+d7QujX7aLuG8OwhxSIdRsZKT4fGXzKGTz7sKZJAd3/9g0peUynh?=
 =?us-ascii?Q?aHO42FUMMg0aAcc0cbG9HQWpMh7xZFKPvSrM38+4UcOvtS0jqXRYiDxJ7our?=
 =?us-ascii?Q?5OBtf6LOUrlG+7Kx5wY9m4WuWFui3/j31+xDCAoL2kAfp3xo5PMB5uyVZGzh?=
 =?us-ascii?Q?jWcxEVU50OG53u5RsCwr/O+9xBElVz80htmts3nSMFBCNBszptaxs6cMWLQk?=
 =?us-ascii?Q?a5PAOGvefYWYKI8auU+0aifAWbtZXWoXHo4cqOJi8sVvh7CiAqnh+MNVrzw7?=
 =?us-ascii?Q?0gAlzriQ+SdCcEZkmZBYmpljPq7d9gZifsJro1tfo/S0vpelUdgS8jFm4nZz?=
 =?us-ascii?Q?ODTtwWIBqy24cfbgs9+oN/V94juXPVwhE6C8p3dNaCh3lgPT5UBS7aYv9WtU?=
 =?us-ascii?Q?JC7G9Q9S3monIzOdcj3Y6vtvocy7hmnAy6ab2x6EOgzMKBDlxA3NZg03Dd7X?=
 =?us-ascii?Q?e4CiVK7LPDe0B91vrK84Dwr0GtQqgVKjNtlY0aYAyOuzuaEOj1l5DI4P9LwB?=
 =?us-ascii?Q?rkuztYjIAaN9z4B9AFQhCtyK1hWFvUuxFzgz9EKVY4J/34LchOKiqJ+pl+Ci?=
 =?us-ascii?Q?Hs6Vgn+hZLUtemOn9GHlEMnJcsjPIzEVtH/7RjpfbRig2YfnBiKy2Iyla9OA?=
 =?us-ascii?Q?IWso0mGrx04Nml7ztPEN1uf+gjCrDpjjx5VH9Fji7HDNw8yscEa+6LcbQcMo?=
 =?us-ascii?Q?TksrdUmGgBcer2anYBtY+khaT93VqDSTLBT0w9XpLuL/yp4GJegHAtsg9XOJ?=
 =?us-ascii?Q?OxrDNJJXYe/QdYjEZjtdlEP30KU/AL1uuHFSrR2ADmm6pAZlQbTAUpSGlyUb?=
 =?us-ascii?Q?//8z5bnccLKl0L6IT0Or3YMJ6e1G54KR1SunpnxSJd1h/6pg8IK75JIg3jUp?=
 =?us-ascii?Q?er/ws3aaYYNBPUaCGFg7mA5GyeE+Hoi4JtyhUkYfoPGcA2LFjeJYt7cDoCkS?=
 =?us-ascii?Q?c7cC0hy9fA=3D=3D?=
X-Exchange-RoutingPolicyChecked: pnWyzFn5QV/84+wNP+P9ljZ5IesvZmbo5MAdZkS7Mz2/zKZ0Qeh9nB836vw5aS0Wns1VYBmegyLFnA7XioHzJat9V5abn+nvwqdJVB5CpcTbDcHO81eVZKg+6GAXvRIGDY7SFauJ7nWxiCB9nrSPKlxzamS9lbxAIMrZKC0OVPPVHJUBnTDvjmeMdxDDygfoSBdsvB7nnQ4sFETn/rjNJT7zKQOP+z5p2IuTTVfqSIqSwBlzviDSnLKSgULsXnaCbBxUCwNgYHcznRvBGxE3VwZiA+Ep48OEocC0YkHfF1MFa2UqXdSmDFfuR4Dhmkfqt/kPh8ogB39Oj4EakApm1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 440f3ec5-42e1-4645-4f35-08ded78606b8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:32:57.3166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrZ5gTGYX3ztaROM6DjkQag0xTCDzXQ407vbGGV5ezkMLEGOa/XY5KuCwBE3uhRtXyC1WWZhe+GNpEkkqNaShg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

Use the link caps configuration mask when applying DP compliance test
link parameters during state computation.

Preserve the legacy behavior of falling back to all configurations with
the requested lane count if the requested rate and lane count pair is
not allowed.

In case no valid configuration is found fail the modeset.

v2:
- Rebase on changes using a filter object instead of a mask of
  configuration indices.
- Rebase on changes using an iteration object.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c      |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c | 96 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_test.h |  3 +-
 3 files changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b10bbbf0f49bf..42bb1c7622525 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2808,7 +2808,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->link_config_filter = new_filter;
 	}
 
-	intel_dp_test_compute_config(intel_dp, crtc_state, limits);
+	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
+		return false;
 
 	return intel_dp_compute_config_link_bpp_limits(connector,
 						       crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c b/drivers/gpu/drm/i915/display/intel_dp_test.c
index da7632536dace..ec7fa690910bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_test.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
@@ -28,11 +28,92 @@ void intel_dp_test_reset(struct intel_dp *intel_dp)
 	memset(&intel_dp->compliance, 0, sizeof(intel_dp->compliance));
 }
 
+static bool set_filter_for_lane_count(struct intel_connector *connector,
+				      struct intel_dp_link_caps *link_caps,
+				      int lane_count,
+				      struct link_config_limits *limits)
+{
+	struct intel_dp_link_config link_config;
+	struct intel_dp_link_caps_order order =
+		intel_dp_link_caps_connector_compute_order(connector);
+	struct intel_dp_link_caps_filter new_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
+	struct intel_dp_link_caps_iter iter;
+	bool found = false;
+
+	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
+	for_each_dp_link_config(&iter, &link_config) {
+		if (link_config.lane_count != lane_count)
+			continue;
+
+		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
+		found = true;
+	}
+	intel_dp_link_caps_iter_end(&iter);
+
+	if (!found)
+		return false;
+
+	limits->link_config_filter = new_filter;
+
+	return true;
+}
+
+static bool set_filter_for_link_config(struct intel_connector *connector,
+				       struct intel_dp_link_caps *link_caps,
+				       const struct intel_dp_link_config *link_params,
+				       struct link_config_limits *limits)
+{
+	struct intel_dp_link_caps_filter new_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
+
+	if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, link_params))
+		return false;
+
+	limits->link_config_filter = new_filter;
+
+	return true;
+}
+
+static bool set_filter_for_link_params(struct intel_connector *connector,
+				       int link_rate, int lane_count,
+				       struct link_config_limits *limits)
+{
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
+	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_dp_link_config requested_config;
+
+	requested_config.rate = link_rate;
+	requested_config.lane_count = lane_count;
+
+	if (set_filter_for_link_config(connector, link_caps, &requested_config, limits))
+		return true;
+
+	/*
+	 * Preserve the legacy behavior: if the requested (rate, lane_count)
+	 * combination is not an allowed config, fall back to all configs
+	 * matching the requested lane count.
+	 *
+	 * TODO: Recheck whether this behavior is actually correct.
+	 */
+	if (set_filter_for_lane_count(connector, link_caps, lane_count, limits))
+		return true;
+
+	drm_dbg_kms(display->drm,
+		    "[ENCODER:%d:%s] Invalid autotest link config parameters: %dx%d\n",
+		    encoder->base.base.id, encoder->base.name,
+		    requested_config.lane_count,
+		    requested_config.rate);
+
+	return false;
+}
+
 /* Adjust link config limits based on compliance test requests. */
-void intel_dp_test_compute_config(struct intel_dp *intel_dp,
+bool intel_dp_test_compute_config(struct intel_connector *connector,
 				  struct intel_crtc_state *pipe_config,
 				  struct link_config_limits *limits)
 {
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
 	struct intel_display *display = to_intel_display(intel_dp);
 
@@ -51,6 +132,11 @@ void intel_dp_test_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp->compliance.test_type == DP_TEST_LINK_TRAINING) {
 		int index;
 
+		/*
+		 * TODO: Remove the following min/max link limit setup
+		 * after converting to use the link configuration filter
+		 * instead in limits.
+		 */
 		/* Validate the compliance test data since max values
 		 * might have changed due to link train fallback.
 		 */
@@ -65,7 +151,15 @@ void intel_dp_test_compute_config(struct intel_dp *intel_dp,
 			limits->min_lane_count = intel_dp->compliance.test_lane_count;
 			limits->max_lane_count = intel_dp->compliance.test_lane_count;
 		}
+
+		if (!set_filter_for_link_params(connector,
+						intel_dp->compliance.test_link_rate,
+						intel_dp->compliance.test_lane_count,
+						limits))
+			return false;
 	}
+
+	return true;
 }
 
 /* Compliance test status bits  */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.h b/drivers/gpu/drm/i915/display/intel_dp_test.h
index dcc167e4c7f65..a08f37a63dc9a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_test.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_test.h
@@ -6,6 +6,7 @@
 
 #include <linux/types.h>
 
+struct intel_connector;
 struct intel_crtc_state;
 struct intel_display;
 struct intel_dp;
@@ -13,7 +14,7 @@ struct link_config_limits;
 
 void intel_dp_test_reset(struct intel_dp *intel_dp);
 void intel_dp_test_request(struct intel_dp *intel_dp);
-void intel_dp_test_compute_config(struct intel_dp *intel_dp,
+bool intel_dp_test_compute_config(struct intel_connector *connector,
 				  struct intel_crtc_state *pipe_config,
 				  struct link_config_limits *limits);
 bool intel_dp_test_phy(struct intel_dp *intel_dp);
-- 
2.49.1

