Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E4CCF2C4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 19:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB5C112993;
	Fri, 16 Oct 2026 19:44:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2C3112993
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792179855; x=1823715855;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ox+6WhpxgIbbJLLDg6dmIbi8fbsv57SFDOz2yUC7P9k=;
 b=WDpCjC7+npNIkxiByO5lRDoLs8tEhcpryJUf0a8XUQaAw7KD2IiyXD65
 zr4lemQxHOyfZPtqGR+x2Wgm13xjKFgwL3IggWJ/msCwF0xpQFnbTZroo
 1WWtQkOTeGTxi86zi7cBlnw/3++BYboTMELmLPbryIRUrcEqYKZgiFU5h
 WjnFzAYLjJCY6tcq1qHn/HZVlE8XCUqtlSgkbTuEUr1QzxLiWj081Ol5M
 lfIsmN34hJV2CQDiNlxacexg26aIpKcxt7CI+kmlq2lGJ5OS6ATz+J128
 tvLzttfPYzv1Wx81UGB39vvk4X+eyBb2xtYb0pJKYyaqU2R5eWzDUy2Ju A==;
X-CSE-ConnectionGUID: to0l0V3FSO29OpmtEUOApw==
X-CSE-MsgGUID: zpjPzPx7RIi0MX1Squ5McQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="986452"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="986452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:44:14 -0700
X-CSE-ConnectionGUID: UlNyOLmqRd+VX5TAUAmlfQ==
X-CSE-MsgGUID: fshpCjAJSROnmD+ZeDx6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1905027"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:44:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:44:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 12:44:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:44:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3yn3yOjqK7IWeki+PT62XalDYoVa7QXzbBih3wUjm3gZ0COYnhzGJuIGXBtZ7janxuTpiEdL1nAoQ0lEZuduQeEn7DsyDW5lCPt/jg9/LWT5+/1JBiJES5e2//LUh2DCZHQE1/QRr+N7bKrXBFz2Tv7LLbbqkIK/cYdtmlMPI3xkzx5uxtGQGcauSgGS6GcjMC6hpm2imjls1uDJN4y+8HADR9L5rh2wQwMdFfgh62mysOu2xV1J69JQ4Z1rteB8vUUNFreesOynOEkw5bnzxz2o3iAcXkrVMNk7ljtZaTKgiwn3B1+oL7qFl2AdckRmzKGwhbue16ymhpTmNab3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cpqar7VZ4i5nNrqAqQD8GZtKUAIMhoL6t5+DiF+4PLk=;
 b=XXkG1v4aYxVLAb8e/dh6uuTjPsD3fFfEw0jFkvoovYqaVqHH7298lphp2FaYJckqCseZejgntj0a5DFVYqr9UxjDgrsBWlbWhOMpdp7wHFnRsoGGcWeON5mZaHfl9jfO9xPyErS+pmG9YDhWnGkWDcfh5qV5218qp894bENp+U/FQK82wkCLtuZFnzy0p258nC3bUMi0RCFvDO4BR7lVBri/1zze17Pex0i9bxBilBKGu1A3jRM7vXzpcw6acVgTNdeds92q12utoHXGj7dzGL/fiVP/6EVp5GJd19dhTgIw7sQj0IjqqvI1EzI9fe8wqRSR1DIL2175foNwA3NeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by DSM1PF66CA93CEB.namprd11.prod.outlook.com (2603:10b6:f:fc02::148) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 19:44:11 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 19:44:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe: Don't ask for bug reports on force probed platforms
Date: Fri, 16 Oct 2026 15:44:07 -0400
Message-ID: <20261016194406.3053819-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|DSM1PF66CA93CEB:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf22fa8-4741-406f-7471-08df2bbdd9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|261009223027099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: U12qfc1k13+HommnTovPM/XkQGyfyMEsyl1gmPN1vOJLpDpA0I9f9gCxhrLL0BcfcnOL2Gl0tMERtalyDOPeY8FYZrk/nuHxP5lXLw08+bKml27MBV3uKymtjCoXd83J2dLQLdABvjJqb5Fv/XWKOsyHqFlDplox7gdMitqNmlrChIL9Fn9A4sBSuojkHoYul1VrYlhXxpmOdxVPkZ1ybXMqemA/Olu1+tdOjCiBErgOiR7zqE46NuTqLQgKg5gnNUbO0iYvDaIhJ6dddtu6Nk3IMC5gW8lzVNxKZPJJfpa6USvMvGu0haaxMJoKAKTx6ellsMgG93VdJv1UHuuqjZFtLL+W27b9hzXPGjZIjMp0PfUok5yr93BwckYve3DqoKqU9KU0CWqrnWsLTNRNkE8HEoejHLcXy8VrYAmp3gI6tTcM1P8fcDJoj+azPa8k05/W/s+q8z61NVrhmc//lz0al5ISD4gJOQ7KWSuNITLF9zultLbDqWejpTaqr9jsyblKCCINq5TnCRFtWVcHDd2DRbeWqZNPdfFRyhOCtCZCvyo+PHcsp50CSTpNVUM1PnIBg5CcLic4gRwrwrIagbjSzt1PufCwXTnjSic01AanhiRkVFSTotM7iu9YW46/yUzuhVEz/FBMEETAQ4IxHqYqZq4t9A0LQcd57jTlvdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fm0cwpRiOvQ/nu4xvh75VG0MzgI+Jszi4IadpFwBypo03GqZ8TG4G1iEhei?=
 =?us-ascii?Q?P6HE/jUoMPDJ3h45241nudOR4yhzIDgmTVWS7fOkjkyVZVcERHtwOGmpP8q/?=
 =?us-ascii?Q?V627VT+Wmu2rp3VY5YvHQr1yviW+FyhIqsj4G/Z7du7wXoeOAahELn8FhpC3?=
 =?us-ascii?Q?OE/9cDynAQ7BSQy4TSCCLSHiwEoRYj3Mv8+E/ewGYoLgx3W3kNgHcpltjDcH?=
 =?us-ascii?Q?93YBQO2Wm9Qk0UvLpTW58vsxE45JIc/+7OlSqvCGgmoT6i1lTENqqDJNd7dS?=
 =?us-ascii?Q?sM8ubS2X7yrx1dYnvWIugutIeaTz3EKO6ozUrRwRjhyHAcwxbjcuTD6F7gX9?=
 =?us-ascii?Q?tNe7DqIN1eveqECsFW7TOR8qazswN5cFhGjo9PrKdX/EcKUYg8gNbke4D/qG?=
 =?us-ascii?Q?ObT9rewbwCCJLkUHKwUp9eaJ0Ij2HpNiRiULrWpl2EAN0IRLHw3nvSxIyOOa?=
 =?us-ascii?Q?3ZfEcQW5QFxYuIs1Wk8fzwL3QCG1mBbmOR25vOIvO6Gfp6MzOZ0QcKDJ1dlI?=
 =?us-ascii?Q?CVMPI1vNouSCZVUj21dSmH0v2gvvGvIB8D+LjalC9+YstOob+ootfxZlTzu1?=
 =?us-ascii?Q?7yvk6Oen/pLmPyjAVpNV5i3qrXwp6mwRJlZvYY0X+bU5YbzJ84PO9XI32JKr?=
 =?us-ascii?Q?MGHOvAhikTsguw9u0pmKqBBmwC9xkVtu86vy4elFf8ZVZbGenMiZPovN2smM?=
 =?us-ascii?Q?uSyezZ0xH60DdtXUT5+lcRMxYA21dSvZsu6WBc4mwFQsOZe8AFojsAfdjhlV?=
 =?us-ascii?Q?XoAXEJVhxhMZoeza9xFzBJ9i4Q5zBLK0TNTag+S32Gu0OAeOa9ML4lEbGzne?=
 =?us-ascii?Q?wgZYlcTMZQl7i37dH28boXZqwy4BdyswdgvCqj2L/3wSE9aeYa9gMEo4GKoj?=
 =?us-ascii?Q?QbyKtCLyp8bfHXnWhk9u5IpBMuaByolVR56Dtv3zJwUThNPgkTQ/5noISf/o?=
 =?us-ascii?Q?LTJwvpLEj2WYzy422O3VIaOeSd7DoBL+TpOtBbRyIDLXxqWMOi80r256wWBG?=
 =?us-ascii?Q?TtTRxbhzhutyG7ri/sH9+JpFaSWXa26ecggVFyOdslohZHsq1XVRAGekFddv?=
 =?us-ascii?Q?167vdzfmhVdCPcLvJBLMtGO9vScjxUFG2QN9zJCzOWmwyxTL9eMghFWZ2Tsx?=
 =?us-ascii?Q?ZGvGN1VVkQFZvqPyGFmIiWhBCenKD+Y1IabwCRcnQxktRgyw83Gfx3OXyr8X?=
 =?us-ascii?Q?8EiJzfm04QfdewS1c/ECpBJc30B0XzmBAu2/k5MABGeA0k30IjnhJB6vjHJG?=
 =?us-ascii?Q?+4mo29KdHlEp1HaMfuRYdNe4XoF8KIkDnpbRP9/Al5zNpxH8YSTYz6apBz9D?=
 =?us-ascii?Q?5J1a2ac8fF8kDi+T6IghiovYWxeenQIljo6FYw896nq9cslShcqvWDsvIw8z?=
 =?us-ascii?Q?dLpWscIbLWZ6ZUSGf1oe4bAOwQkHGDAGwE3rIfgH3QBUxaWTaf5eJg2fhgOV?=
 =?us-ascii?Q?Pq1Ats1X9gZ5NuZVZRRczCDm7tHCs0f9rX2to5P61bfnauc1s1AHetHcD+7b?=
 =?us-ascii?Q?Pujmk3Q1DyZ9/+hq5zYDX/LfPxc2a7skim10+yFkkLDJMTaP4uo8NpWAWb5Y?=
 =?us-ascii?Q?baudXR2g2K1pFs1vAncK+AU2uQerkOrT7qZDmICKiFLzhDYKbVU8QYJ2gdxA?=
 =?us-ascii?Q?IlptxcWfbDpO4szae9woE1Dqzx8R0UUjA6JBWrZDy7ohLArUXRh3C2vvSMy2?=
 =?us-ascii?Q?Ewjb9sJu+cWF0jmWW9pk/hI7gYMtXXWNtWJ03ghB5xaW5iOhwOYVi9nKjfnW?=
 =?us-ascii?Q?lmQ/d9TQIw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 02QURS+7or9GooUQH8YL917kM8PojUM6n5ET1Jg4lw5SnBEiZZGq3m77lqsdr2bSX1b3XsQ23orU4p638MJxzYU3HkftNS2zcIFDjCD/eSmg9QaiToRIFrp4FTwB3JpaUlpm+5aOnotZy22pfAgHC5bIlb9ngz1Mq5zyJACbSZafdBSybJdkpNSv7L9eZ/pZlPdg9j8nzp+mrCpUCNd5E0yeRu3+agvhsRFU7wd2hhWn7PUrHSAHcZ/WBA7xA2eWvvdCrdIyyPHO+gszT1RPViRUuCTNVzcqtGGR6g7Jlfqd+DsWLtY/YuexR+ZKH7M5Kixbul9oKMbN+dLyjKlZVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf22fa8-4741-406f-7471-08df2bbdd9d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 19:44:11.5501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7EJncDSHNEqxJwv0Jv3D3gRfW1y20x6SMC/jpyd4nwDR5S4j2rS8PifrjnFmxrPQCkoYUOFtRFYNZqhVOJekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSM1PF66CA93CEB
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

Platforms that require force_probe are not yet officially supported,
and users enabling them do so at their own risk. Only point to the
issue tracker when a device gets wedged on supported platforms.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 8 +++++---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db0b883322ef..9ae9e5724be8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1431,9 +1431,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
 
 		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			    "For recovery procedure, refer to %s\n"
-			    "Please file a _new_ bug report at %s\n",
-			    WEDGED_URL, XE_BUG_URL);
+			    "For recovery procedure, refer to %s\n",
+			    WEDGED_URL);
+		if (!xe->info.require_force_probe)
+			xe_err_once(xe, "Please file a _new_ bug report at %s\n",
+				    XE_BUG_URL);
 	}
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index aa3a98ddb457..24cb90c1f3ad 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -251,6 +251,8 @@ struct xe_device {
 		 * state the firmware or bootloader left it in.
 		 */
 		u8 probe_display:1;
+		/** @info.require_force_probe: platform requires force_probe */
+		u8 require_force_probe:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c13eb901aa7..99f6c379f334 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -824,6 +824,7 @@ static int xe_info_init_early(struct xe_device *xe,
 		desc->has_sriov;
 	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.has_temp_sentinel = desc->has_temp_sentinel;
+	xe->info.require_force_probe = desc->require_force_probe;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
-- 
2.55.0

