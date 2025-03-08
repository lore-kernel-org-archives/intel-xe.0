Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E947C282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96AB10EC37;
	Sat,  8 Mar 2025 00:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iItveiTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C699810EC37
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741395436; x=1772931436;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cB7TUNQfdh5QwMtO0oXiiPBjjJOBfCvK/cNkwwEwtEk=;
 b=iItveiTbFcabcDTfra3ppO/cHXsrWIO4kt2NesQGzmpY6VYYWB0t8QLH
 LersFOAL706RkUHF4B3EGYNk2kczpW9hz/fcu5T/4vJFW8cdtDbh/SG+N
 93l67OLilyrgkmL6Uni35g9n8BQTq6Xgc8F09qAohzrlABMXLusAeCcOb
 ubFyxkMgHWtB1Do3Lb8lzqhcl6zaBAOAArsjvz03WCtc5QXLo+f/cUUTU
 XDTiDWsn7k1Q7WfcxLBE53pRQRnrs6pBp1mxa6WUk2C1VIhTakUhSdYnZ
 /TEpJ7cD8lBhPqZcFT/B95rrKIqOyGTAKX+cHLp3ZexyN7omREaMLMsAN w==;
X-CSE-ConnectionGUID: omNsLEqyShaScqOeHU3tvg==
X-CSE-MsgGUID: s4RLu7F7TsaGLCaOOwnIOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="64899041"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="64899041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:57:15 -0800
X-CSE-ConnectionGUID: qX5K0/MbT2esS+lyMgEQkg==
X-CSE-MsgGUID: nyJDf/bgQmWf2R6JNzFt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119404089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:57:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 16:57:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 16:57:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 16:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPHKbMPrHeZD89g+WEQ5TWWGQnGbjl1PpN1IB3sZ/C/omqbzCIfhFXWnSlnho3O2B2jRweqrbVRqYKnSXiv0+spV0hZH0otkJ8+y+0ahQu0/XGYyRW12h1bBcQqOhJZKYJ7E+0QJMfQKMLQhcLCJSfcopBatF5nHinYhpfOtedGGAvYyfoXyNb8AIp7onmBWffNQsBhHRaZB62m+ii5KlYoyGfoZrrBgUkZC2e3IJfIbQrfHVZw0hvab2Kav1iJ6h8ISlVZhgqKP96e27CLrTan6bJZSjiYvOnZJLhBbzYiGRoEoJ3nsvgt3ll98oXu1M2Nf6qH0AL6qyBawCAZgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V65PMX7FPPf0abNsJFgHsSdLeoYmTqZNTadohQAGGgc=;
 b=sye/Ciz2N7u+6MQg2ejOUAKY3Fjasx40qgrLmgli7cjW9Ig8aR2Mi+TCCbeRFYvRVYr4ZeYHmcPyJQYItGFSGajMUbU2yC2gYAFnlinF1aimb4SkSusH1xIaRnY7Z1Dr6zp90KJvMWxYGl5fb3z/lzQkuYj6f+sHF9F6SwHGXa0KE5x3OQk4etMrA37znWtJA0IVin2S7ZqZpeASIFoAxrlJESAVugKpGfEVh7Vuqw/U1JZaS+5DVpg8uPLj1g7o1bm9NLLRYIaLNIVAmjJiTsAsFGARikhG6VyDVst/Cmk3lUlYOZtFqQbc4BHnBMxVPtqQ8dtyqwXIoGbxhuCACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Sat, 8 Mar
 2025 00:56:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Sat, 8 Mar 2025
 00:56:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 1/2] drm/xe/pm: Temporarily disable D3Cold on BMG
Date: Fri, 7 Mar 2025 19:56:35 -0500
Message-ID: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f77851a-0a17-4525-4ad8-08dd5ddc166b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J51YzBh+ax27xkbOA/A1G0WxqELcdaQQKogpxQGNIBu7o0aWHNug1xVZhdDe?=
 =?us-ascii?Q?+evhRbM9r6f5VskWkQbPDyrKq0iLAAb+7adeP4OLxf18Bp6f9EBuK8YUjcUa?=
 =?us-ascii?Q?tqiKKQrnWqOcWqKW+lVRE7nyrk5oiFZrnKX08JAMXms+Du6K6xeA23oO3/ME?=
 =?us-ascii?Q?9J9fssXe3tfM0apUWRgqqYV5kSxsRHUwn9TQR7NxVZNlL9oRXT1Tw3Lb4YM1?=
 =?us-ascii?Q?T9I9sne2/Xz9fbx3qRKbUsUg7iPhVsJhAUX8IFG0o+g3TbcjPDx3/tUFoLNL?=
 =?us-ascii?Q?NIhm96yJYG7hO+rj+yc3VyLGe+GDUwt7PE2UeMOu4AVN/EDSv7E8JHUm2Y0x?=
 =?us-ascii?Q?A5JizRWTVfDInpMF/awmbmo3czpKlPcYrYexOsebd4i2Bflb7+fslifk+urQ?=
 =?us-ascii?Q?wDwQma6BtWtoOmZ3j7Jn9M0gTggI4SmlC3JRxmPtMt3mcESIazNO4aGZS2YD?=
 =?us-ascii?Q?HOJtB6ogRcx9zrO2Q6c4Mxy7FEwpAaBZBXPPT9pJNMvv/UemYdd7M0KbnJV+?=
 =?us-ascii?Q?B/zrI85GpgVBZN2ILXzVoI7D8APUP8Qz3hzdDWYos9eIJ1IabJQzpG0Dlz8F?=
 =?us-ascii?Q?HI42OOFKhJJJbPvK00ScUVa4EZpgyH/UrxhS4CfrmzI+Ak5u7Pfllr+MPuYc?=
 =?us-ascii?Q?Jj8oILPVYd5zM1Gf8c+s4VOiwsbkSVyXu0Vhjcxh0O8Om+wsil4Bbbyr8G8K?=
 =?us-ascii?Q?9iBm1QQYlDo08dJTvtCJvdhuttZ3Qso//UKRaaXupMAwa9Ej42XaP3zChKf+?=
 =?us-ascii?Q?spFyH4yt4oTZQYt8dRJXz1in4ODOPsKMumv8wEwKlYS6sKDvbEhtAzKqZ+52?=
 =?us-ascii?Q?bZ93OrkQjZBuyQ3iNATN2aqHoHn01yoRYgJfDbNVSF3rCrtuMHksxN9ov/zD?=
 =?us-ascii?Q?2S/HwoibzQ1BsvIcJCrvpX9sNMx2RgTIyRmQhZuELlTxVLUGgkLvPiYZxsN2?=
 =?us-ascii?Q?YzpBPsDEy8r7TeCdvoWck+QpTPw85LFh8HB+cPXpFvrZNAxPY+JlYBNrIaC0?=
 =?us-ascii?Q?KqlM7LwTgn0bWa1mdEVwUeP6lDxIJd6/WpZVtQwHqnw38hpDjkruFtiVLxFk?=
 =?us-ascii?Q?ReyY2ab9oPKMOJ2GSzIBO0bDpBoGo78ZcYM8A5Nh87iN8QWpekjE6ByXKaTY?=
 =?us-ascii?Q?MxwIA39XDHux5E4sfDdvrVJL5M+Vno53XhA5q+PBNCY7ZAsIPmG5GQWkf9k4?=
 =?us-ascii?Q?jAGMxcJllHXBXkcgM1BWTQv9adQ+TguvkfhyKRar0bRbrh073XOWvBczmY8z?=
 =?us-ascii?Q?ANe1ZH+gsjvr/edFoXBY82evIzm3PCLyYqY6nkFNnNKG/R4QjKWNBZtO8jRC?=
 =?us-ascii?Q?UXV/LwdwJTdKOoGvV2IwyNjK8vp9+wHXUbwNqVXHwfiQ4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fuq/3O5Ahp2RBJk0WAVHTT6SdTtybS8lRt3PFzVtYVR92z2tqxDy2fFFioJ8?=
 =?us-ascii?Q?xrbk0EVS5odM1ImDg1XspHFieAKA8RiRIJhC0TEChqMihdPJrdE7f+bATNeI?=
 =?us-ascii?Q?5m3SKlV4SV++wdSzGHllkNHynnw1ivkwFk4fO0+OCIkVKlMGbR2uGHT53Ku8?=
 =?us-ascii?Q?tBrJiPKMarbI9MCcixRAVALQHwU7AnFYJefcB+1bntNdXzkGdS7daQdb6fVR?=
 =?us-ascii?Q?EK7tq3ltmLV4FGn6PXk7et3ZAITQyVGDWNi0YRn4Ecsu6VmyJSkgZVZH/Tqy?=
 =?us-ascii?Q?yCg9jnq75JFPPn2290p3a1I42pzu9jjzRCOjopsAqqeoswhKuiFflpH+Lp6T?=
 =?us-ascii?Q?GA89Id1E+nC/Atxuj+T4hoOOCNCTLmo3VAamGIpd6rQU6BlSs8PLo+/aA9Bm?=
 =?us-ascii?Q?UYxVH85xyecggxxN5DoCulKimo4D2iXSe8Dvgt/fxTsKLNtgBhklTDajG+CU?=
 =?us-ascii?Q?f1zW8zeiI7BYfjlS2cAbxMrSxawLYI0kLmzQ35Mcm50uAFIN388nC0u345/M?=
 =?us-ascii?Q?AYMZ8/D6gqA9VSclm4vHWUy0+kl24FVaJWqXTXdB67NbW98dtlG+kjAmo61s?=
 =?us-ascii?Q?gAtWd1X4huvwDFMIvBfIoQHk43dnbUzP0IlR52j6johBlsfS9BlkxftBT30i?=
 =?us-ascii?Q?7lzcIU1M+rSD0JDlXPI2M6PpbnA+KgWr7sWCTCanFmHPQprRcoa7EUlFxZ/u?=
 =?us-ascii?Q?kAXzPU8yLV1STj3CLFDiWANnSUBV+NDLVc68Gsa94rgPQ9P/sV5XnRBSDJTs?=
 =?us-ascii?Q?eb/ISC/RFO/efjtuJMGR+Y3TeZ4ocgxHkRb8rhyAzMSdUPQmwnUv6GhvCDoO?=
 =?us-ascii?Q?TbtLm9Z/E/hVjSqXluG1BJHw8vOJkpzdptGOj3O9Zjiwh5piDTrGZsKD09ZE?=
 =?us-ascii?Q?T5cCVSsFla4dPBCk7wbcpF5sbeLKOC/bWZK6/Cpim9KkVDn0EAcbGfrEsctG?=
 =?us-ascii?Q?8poecUTU89z+HcL5qA6JBcaDKa1Yld/emRSr+7Zt/jqBnLWdKlW2N4BiRKKY?=
 =?us-ascii?Q?pMTNcmelCkhzzrPxGbfSMwQJF4ngop9MiFq09H/M9XeyyhrdSIRDXqw7PoSE?=
 =?us-ascii?Q?e/yQZw/QwC2ryhI2lIvfjdiBCJhmEUSexmhkemAuOOo0dPzflGnapCC7zEel?=
 =?us-ascii?Q?8zRSEIJve3ieN0QLeEZz2qBzjhzD+aZa+MlyMFo06Oo0or1/SyNoA2h6FvGe?=
 =?us-ascii?Q?f/LYlUe8+MpxomMf8jhtyxigcBplw+PPDgnkJQcY128yQ0Zodtu84N5tVB9P?=
 =?us-ascii?Q?PoqELhFr3n0kQE+U2mDoXRr4c8fuzq7LG6xkARaQzTxFMQij28dp61GfNqzv?=
 =?us-ascii?Q?b1G4CYKGUm890gXikwBAICzUylXLzk4CkrvRjnuEe5p6qBjZtcleQv1WVRky?=
 =?us-ascii?Q?AYxm1SFjgBVtvAYFq1zEiF2FkaYZpGJV0TG3dqOpIbPSRMiqH8gAmHWHr+jR?=
 =?us-ascii?Q?JdA63y14JzCQLTg2TMdzuiYzKW2X5Mz2bpRcyZqbz9/fkLjnu0cr61WPX3pB?=
 =?us-ascii?Q?2tbnAIJtKA44/EVIB0ENIJ3y0mfExCnpLbIeL34IzRmiAui7Aw+w9hY46hPo?=
 =?us-ascii?Q?ih8c/aARokvP94UE8ffNbcmf2Vuc5QMyOVe0C8lds8CFBkw91xgp7CvdJtNh?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f77851a-0a17-4525-4ad8-08dd5ddc166b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:56:41.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2f3apFry0n5Vts2dufPD+7UDcCV1+JllQm2opMfXcw+QevpWar1sQDGXCEDCOZ6kLYQyJ5mScV4RmxBURq7cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

Currently, many instability cases related to D3Cold -> D0 transition
on BMG are under investigation. Among them some bad cases where
the device is lost after 1 to 3 transitions from D3Cold to D0
on the runtime pm, with pcieport upstream bridge port link retrain
failure.

In other cases, it works fine, but with some sudden random memory
corruptions after D3cold, that could be 0xffff missed ack on GT
forcewake or GuC reload related failures.

In some other cases though, D3Cold -> D0 works pretty reliably.
It looks like it is a combination of GPU cards and Host boards at
this point. So, there is no possible/available quirk at this time.

This patch disables the D3Cold by default on BMG by reducing the
vram_d3cold_threshold to 0. Users and developers who wants to enable
it are still able to via
$ echo 300 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold

Fixes: 3adcf970dc7e ("drm/xe/bmg: Drop force_probe requirement")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4395
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4396
Cc: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 12200be7b43d..7b6b754ad6eb 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -277,6 +277,15 @@ int xe_pm_init_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
+static u32 vram_threshold_value(struct xe_device *xe)
+{
+	/* FIXME: D3Cold temporarily disabled by default on BMG */
+	if (xe->info.platform == XE_BATTLEMAGE)
+		return 0;
+
+	return DEFAULT_VRAM_THRESHOLD;
+}
+
 /**
  * xe_pm_init - Initialize Xe Power Management
  * @xe: xe device instance
@@ -287,6 +296,7 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
  */
 int xe_pm_init(struct xe_device *xe)
 {
+	u32 vram_threshold;
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
@@ -300,7 +310,8 @@ int xe_pm_init(struct xe_device *xe)
 		if (err)
 			return err;
 
-		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		vram_threshold = vram_threshold_value(xe);
+		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
 			return err;
 	}
-- 
2.48.1

