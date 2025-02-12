Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4067C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65D510E970;
	Wed, 12 Feb 2025 19:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDRM4pPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572D610E970
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388319; x=1770924319;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5t+fKJZ/QoA1ilF6r5NrGbNwbgvdLhBXJjqU92FiCqM=;
 b=lDRM4pPTDl7vjYfiFK6/s9g/BABCy8vOU9FNpcfXmqkqXxm3Qfv1Mhxf
 cERAU40HPwOe+oqAUfsY7mZruSXtI3V+XjgP4w2fELilyRSE9xMiyjgJd
 37FTKDO1XGWWuqvBDyYAJUnMOt8rJl22DvtyQgzrdU0rzcSkzcPeUZfmR
 CFxRtSpAnp8WLxPpMomoa72ynybIlpM6h0v672D5kKUFf1fTR4lKT4K84
 6lX61FpgXkIbhN8ER29aF1EItcJe4Xclyy+GTkQgTWQfGYLv/fd6SsDp+
 Us2D/mt9h4A4dHvSQS848c0v9MaSggfF9xcaslCMdCGkOx0sj0k2gOeSy w==;
X-CSE-ConnectionGUID: uWTn7KHMQACE8W0JElexoA==
X-CSE-MsgGUID: 8VmDktZnRXGH7qt+g68eWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65423812"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="65423812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:25:19 -0800
X-CSE-ConnectionGUID: Fk/ANmPbSzGRMfuRvEW1dg==
X-CSE-MsgGUID: exwU436JSCSwYPAzUHUesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136179096"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 11:25:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 11:25:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 11:25:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 11:25:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY/8NBs4TLPLgniG9khLu0V0FHlta3T3pAGqcEzhOL0umL6B5GEsKc1nZxUN959BSgGpfeVsFXApnBdPJGwlzVZ8+8ifiluvSUhU3C4C0ZDXwARoyB5LqqxJ6lVi9d16GA5PAQ3K03PMVPChxRUk7+4aT3zTIjXpX3kBl0PkTSuBE38HieWyTDaRoqOzpF5Nhx48LmVJhvnH8jwCMuVA6rigjS8v803k0E/vPzE8gAoLGWPhJaaP8YB//l7/BQQSRzwv81vJIsfeW1KRJU3lOIAa3geOrbN9p+Ug3XO9oGFWHRrK1chICIKqIFiDqM3W8VLjBr7qfxSxX/0nVJ4E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L4qk0KmIOgtRqEXAKYEmJOeLi03CPmxhhB3I7AiUUo=;
 b=BeDA0MjhjpjsseC9q1/pXf45//6Yse1f9CCU8U0uakhnK5vXTIeki4/joctv3l0MQo+M7heeL7zzWiKyS9MdaJO7BKVfiI4h36oW/CxPLoR7uGqgF8lkc0X/hYFGugXTmAP27btcOej+ko11lFGt3nt02PMuvNhoQUG9/dlwFR8HZyr8oaZZaKJfSNLyvHZsPvoxMg3Ei7v4E8kHd61r5Z/F4HoESfURGpfWZ4kU0HQpTCj67s49mwjqaPNDtxsfgMk12E89/K+fQcd+4XAkwi+RrJ+s7OcLx3RxLap+pHkU8BdeOrFwVwMqJfr9k4PyZ77VueOBT471OtLGI9Afiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 19:25:00 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:24:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime pm
 path
Date: Wed, 12 Feb 2025 14:24:47 -0500
Message-ID: <20250212192447.402715-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 826919ec-366b-48ab-36fd-08dd4b9af0c8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AqGdTXWP8KB8TiGRQrD+9ACRW62DJ4gdN9v9FFDc3rAYKv+VqhJf8TWzPAZF?=
 =?us-ascii?Q?czrBrj/1tVyjVrPK6umHfxhOPDmFixLIX842zPpkR3tdL3g9t/0V31saB1/8?=
 =?us-ascii?Q?mOwBFyElW/FRL37o5kfh/e59EK67GO9s8PzwdviJdOvwR90xXFATiTkvhzME?=
 =?us-ascii?Q?wk0l0tmwRZrdU5xEJo0GpU+tn97aPlEgnDTOj8fXHr2eAHcSnfXwWHMRL1AC?=
 =?us-ascii?Q?Dw9PHhJEju4Rvzdr9uu7QMIHufblv/t0O9NT28VsaeZoL7UDLeVjaja0VAYE?=
 =?us-ascii?Q?uGmzEq5StlhbICdoYO7c/TujE1ybZrNtgJolq0KghwqpjSBJ41CZBsMUalRC?=
 =?us-ascii?Q?4rmnDG/xOMHCE02IvwizanWp3I682RS1WJbkhL02Siz+DUgeMyshb4RAWmUT?=
 =?us-ascii?Q?64vwQo4h5S2KgmzHnx+M1ISNn7g7k6gff6wPn7XqPp48Wc2XBWS57ITgBWUj?=
 =?us-ascii?Q?55EomReSqfIPO31xbKV3pxfQ5paf7jxCLG652e5v+M24RSpQSTHv+Sjwjy0t?=
 =?us-ascii?Q?m1JjS7qFxOhzu0m3h1OLF9fLC8UuP0ViLHXSyNCqncKUeOLj81r3lf2zBPIb?=
 =?us-ascii?Q?u7ErKE/ZqUX7Bg3voIY6irEEEqHVZmVmzWz1sJQ9HcELL+BZv8Pv9XGDUKj9?=
 =?us-ascii?Q?yor85sACDefrdQ4UFtwS+wc4DBV6L/2xwPWdxpRD2YCUBWqHtbqZF0qok3E2?=
 =?us-ascii?Q?1bIcChCACEUpbrqBGfIx1+U0hgSx8uw6Yesa1SYXXNdDeErVWxuoohm1mMSr?=
 =?us-ascii?Q?VN1eNA2hRqHJqIRcJQKsGpm74lqj3aqcECdMZv+q8khysIqwk2fLEBCp1AtF?=
 =?us-ascii?Q?81m23tHcOL3y7ZBd2okNAdRL66h428gdsly9t5GoUmMy5t8qdO6fHjfpxjAd?=
 =?us-ascii?Q?2l6juBITl99kIG/FOoW+5L/cuVtlwALq+hukkjcPJARaKS7eOhpP2haLSo05?=
 =?us-ascii?Q?AgFloqGdZmEObcLRddK9nd5h/aUexS43B3DrgKJkDC5V7bLUwhHXhNwvNkW1?=
 =?us-ascii?Q?50Wocned2XRg3hxnJ6W9CEbxASVXDfih1EL+82JvLbC78iM1/Nq5sFX9foH0?=
 =?us-ascii?Q?/f3umutz4lXzzTtbly1WICI9iaZtD0y6VW+Ij0nPgB4pbOQO8r+Xt2+RzQf7?=
 =?us-ascii?Q?L04QISO1ToMEjNQd7UQsFCgNuhYNFZcZGkbykA1w4Sh/vmbLPoQNPBIRbqfm?=
 =?us-ascii?Q?g4TLm5bQ3T1j4leSumqaKtorzPPPXA8wYUysPOeqknpi3u47jo0T0VfhZr6r?=
 =?us-ascii?Q?RSv2GSEXKyf4KkwXrFMpJWR213hhVDQqQsbFfEibby3jDvT5p8jyKVELLd93?=
 =?us-ascii?Q?//EDkIpgxoU1uoWntsG0NJez+kv2BYQYLz+RxBYZjbFxo0orlRDoaFGnRhLc?=
 =?us-ascii?Q?VS15AyQfoUkep0ogpV5YrXjYWNSR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2MAMwc+mHDaqDx4rebTxPiLouwqAPxc2vzBZezubYA1lTxK0+uUJEWP+I8Gl?=
 =?us-ascii?Q?U7C65ALi0OQfcP1p4a9Zbv5SDC9D7Q9kGgjBjcy+dJq6tuEjfuVMVeS2CWdf?=
 =?us-ascii?Q?2mfZEG9I41m97V0TvaeMoSOUg5pPNoRxplaWEgIvaEsPPjdFi7gYCBiydwo4?=
 =?us-ascii?Q?bbF1eFqQG9h5r4bOz8aC1I3TuT+SbDXosWTx80T1Y7IacxZN8PuGJtJQ6ij4?=
 =?us-ascii?Q?7TkjMGedXoY6kdg7Y/ZoEhWvtQ4HXUBZFyzYyhx3T0MyRVIvEC+Cnc1sUZV5?=
 =?us-ascii?Q?l6BZjGTo+9tmbU91I+XcJrRyXZc5aNd9vFmF05EpDvpPpJR1Rt4q0R5o+jdA?=
 =?us-ascii?Q?4amjZ5fT+TIFBXjvHcinMC1RpHeeez0LMlksW9cTKzkGRPXlnAkaYsG59Y9u?=
 =?us-ascii?Q?pDKgIzPmWMMCv6BzSmfxH+YRm5R2y8/DFhq8XDfC8EpwncIAwseXCWOlgXko?=
 =?us-ascii?Q?Efqt0L+uNNhrtF6oIF2coVgFI7gQ7i52hvVIitfBbmD6LwCX2G7IDYuN/RVG?=
 =?us-ascii?Q?EL7HGupoT6t0V/AqO7uKHrp+mshSWnlm4hCA9p01vPOjwyb3tu0INJYK9G48?=
 =?us-ascii?Q?pQZPHtsUYLTxJ1ph79nrBqVNxsg/xA2juoj3Wg09BWl8qp73tmlwy3ORP4Uf?=
 =?us-ascii?Q?7w+EshpyjApoxZGTgvpa129VV+vbGLyHYNyrl0RA0PNguHryy7uUraeYcyvi?=
 =?us-ascii?Q?+amMFeSbn88dk3AFtsfmqQDoF2IqhqTNPNOAwR6ZXltavNz7I7+t0Pkctl64?=
 =?us-ascii?Q?0NIOYN4WcTnDh2iKWtEazuCchC+57c5DessOF9o1PPTBe4a+MdpOH5f3nCYc?=
 =?us-ascii?Q?J5dVB4PbfYGxxZy+TTv6lMzDQDP3TBdlfheoDKZuICg2dnTxhys5EI/N5Gzj?=
 =?us-ascii?Q?n52KiYcvEeggHF5F4YVnA+22DoHPtYekLuIa5j+2+vnIVCwCsDed1dL42o19?=
 =?us-ascii?Q?eJdJWZozbrY551p4NQFFPfhR4maIftvhONWPmDER6UIIlTcJ9kzu+oDQTYq0?=
 =?us-ascii?Q?WPvUqO4KdHh9gt8nZ2kvocgs9Azz/hpn5AlFgNfiq/S5pA70V8DRrAsMmqFM?=
 =?us-ascii?Q?M+gjBOllfMEptuJ9l7KXqbHCiCPIAg0THG1GAdv6rFb4BuklXZPpv/2a08KY?=
 =?us-ascii?Q?CTaHDp53nUc7yQ4G9nHANNVbBUFnXV9FD262SLipGvh8wy9f+0M2kfePlVJG?=
 =?us-ascii?Q?fuocYFAWacSRuKSn7NJFkRq9EstNYrRJ6faTHBOEyEMYIk0tnfZBvNhN3uT0?=
 =?us-ascii?Q?JlUdAUd8fGNHv/YlwAupLdsNez6zvpFG/FBvfCtpKfZhxwjSg+oB5ykLlu1W?=
 =?us-ascii?Q?wEVGylyPabGsV5kaDzYEsKjkLRDmdEj85N/cZcwyrnw/WWk/7oJ3aYdH4s+6?=
 =?us-ascii?Q?zAgYFJQqsw+29JATBrZeq1YXCSibgxeBRRx8Zbp69JRwRSp5kdJQXjRYrOAO?=
 =?us-ascii?Q?qmp97YzI+xnZ1gjJX0vWZihD49gmaLpz79vIYFoBuIc2VGS5+1cAmuP3xPkk?=
 =?us-ascii?Q?CATvM3FD+iDNlje4WkC7v42yBpIj9MFzs2gqPrpUa5V4haBKpEoYQYrOX04W?=
 =?us-ascii?Q?BG0gduww5g+SIP90eRMdr4NSI9swTkcpcAstINklPV6ZqzBuwDI7cnPG//+O?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 826919ec-366b-48ab-36fd-08dd4b9af0c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:24:59.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43ALonoadrqCZXHKc6wuGnBl2WtHDXF4axwlAUE4yh67e3H+1RPBw8kgzwnlI1vTPaata5qFgkJpBYKldfrmTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

This function will synchronously cancel and wait for many display
work queue items, which might try to take the runtime pm reference
causing a bad deadlock. So, remove it from the runtime_pm suspend patch.

Reported-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 651799c946ac..f0f427689a56 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -311,7 +311,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	intel_hpd_cancel_work(xe);
+	if (!runtime)
+		intel_hpd_cancel_work(xe);
 
 	if (!runtime && has_display(xe)) {
 		intel_display_driver_suspend_access(display);
-- 
2.48.1

