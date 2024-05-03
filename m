Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC6C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B705A10FB89;
	Fri,  3 May 2024 19:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUlZwkqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188F10FB89
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763605; x=1746299605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+zH26wHqpA+fAKA5k/chx4MU4q2IWbHl42sTO1uQGW0=;
 b=MUlZwkqugTGqjVX8x7qsrMBHwSy5wGES2BRbveyNOx9lD9hBzF9aDORR
 NsNG79efrsn34Umik0gXwuPKHsKFjVo0Oei/ZQ8DuRwogytpogFqUNAxB
 FxpwA/7tJgTeyXOwBD62wbSfnaA9xHm45K8qXbWeM7+WDUxKEqFgKcwIX
 eH/PYAZVrtb9Xzqzk1vsq22hSYMzjJlJdHrmtYoEFM54Fytt4QqqS6rn7
 MP/1HCu1RuWsBvAqXF04YK+3iCNNtur4boAXoqXbyEH/oaZzP50lmez7s
 36bvkbk26116zcpIor9WFK9pWbxZHx2RSsmJkHKHLVmic8uNNqwgkmz9j w==;
X-CSE-ConnectionGUID: JD9rAKbhRlSNOFwVizFrrg==
X-CSE-MsgGUID: Akc4tjv8TLCr0kPPhdcjOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10463028"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10463028"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:24 -0700
X-CSE-ConnectionGUID: OVs0bCp9TxaX2/p5by4ixw==
X-CSE-MsgGUID: BqxQ17PORhKZZuAp6/P92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27594936"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flviMs8Hf0qvz8TLobZzqmvsMKmXAmZMykv+UXnkv29MlmN6JCOVyJpsX6AzXTo872lB1vkd6y7I6KwBXvwQnOjISx10Uiy+CY4k3SBFqKb6Q5wNx+htcxno1A2q3B5bTZe5G1wG+WKuJ2yl2vhA+m7DDUr/eLa+upRW/+d5qGy/o+THs5Scm6h4OLfhITOALEtFdMcqLuJiamC/gMN3AJ0F6VvyFoHzr9LW3WKE69xjGMw/amNli6boZQuSRKAWi/gZLisfjGsFYm9g6iZn/xn797Z3Yek1n+GOdRB30JWz6/p7MJVUXx0UbYYWjT0zA02laAydrvAnq965XXsqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NG1LjoQ9aDsBnzdKiV73EKs70KkiLlBmiJYBbwF3r4=;
 b=i2XW/buQ7NMkgAgOHW1c+OH3GnlFV53Uo5sCiurozJzM8F7+YN0czwEvDnGaXiOXhD1OdgzmoMDj/kp4U8JRv0i0QTtB3elzzlbSTFQmiW6TIto563PDDF1eNSK7cCXva/CxYAEy/pFqTiJqp972qnBzA9AI7iVTXLhNFS2rV0eMvDWoqQGjFrWpZWow8ihIJHRDZ8D+8RwPgdTcfvNoiaUWzyc9nyTKaMmNnFMoMN9y98AHTMU4A3A4KxFXTDJtV/JMw4Pljd66QOn9vZuTXpSGRfxu+LiKAuuGAK7WGzZDKx7m4I91nyLMEDCvJZSkJn+42JmbLFymD6H9TQhwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
Date: Fri, 3 May 2024 15:13:03 -0400
Message-ID: <20240503191309.7022-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 97017558-13e2-4bda-32fb-08dc6ba517bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XWgd6NlOg2HOPv30nG8LClNPz0Moo9qOOWj4g5A10XOQwJoAC0WTru/Ufxih?=
 =?us-ascii?Q?daDg0+WvAcDzVNIxW8rGrADYEsQBKS8aqYnVIwLrxbKO/vIcgN+LmCzyITrG?=
 =?us-ascii?Q?ghUOFF8ujdfo7nTQBVjORDcsZgycT+JwmhUdFxsQEEGJDq/fCBL5AgMGEDeP?=
 =?us-ascii?Q?WgR80wD1Q3mTQBo0eud1X6JthUy+3rOXQZsXPIkd3aWQL2W+5pEdBsIG0tBU?=
 =?us-ascii?Q?ot6JCnzs9Yhr4MGQlnOcgP4Otzuzxfprbh/77Fy+8rWT3hO5KSe304IF0L0q?=
 =?us-ascii?Q?FNxYmmUqVAFLj4sST5NYDI5+z6yQf2GOp4z10g2loYVNmVcujlIhxRG65luX?=
 =?us-ascii?Q?4axLVosIha0K31Mo6dc15+vev0hx0Lun5Hh02qKR66oy4G4FbDRjPw+5AzuF?=
 =?us-ascii?Q?qqbZrLse8WE9vTsnGzQ6ug9u7F5B/3LLwzyAGadSk4+Xpx8pnda1hzn0vaxE?=
 =?us-ascii?Q?01Os3+JSgxvyN7FmQnKrq5XR2NPyI3yHypbMxBzT2HL3dpHu+xhJMnUQk+HU?=
 =?us-ascii?Q?1lQ9JCv/8aDsM+5/AUqaJKGqIWMvV7PTnHFOPIlcD9QDqQb1f75nzQnhkYf7?=
 =?us-ascii?Q?kwmDEgX/KRkcsbxo+YMZn8SiVuGKAkXAjmhuj8tPF9tTcn2Bgd/Nd9dap/sd?=
 =?us-ascii?Q?5KLzxUkoxl7CeiLa/hWAURDIaVV8YmqN/GEfvvrQAC0BhU+wi0aMEQ3QDtOz?=
 =?us-ascii?Q?4DbKN0JpjmfgGTIV4icr+mJhCxT/kiO8NQ/UdyPXlyvJUDGXyry+t0sKHxqN?=
 =?us-ascii?Q?UzDMC5NLWIFLj5nIBmWg6eilNslEeCk2aTcOwsL6GBxEhJsuBPr6pNErpo5l?=
 =?us-ascii?Q?R61oOwb9Ca8dAMrSa6SOMKO/GQpDtfozux615Gqyr8E0/s2qlBb5fv3c/tXY?=
 =?us-ascii?Q?evRK7oeiB90fREir+QKhqkURTvB74OwmuBk+7h96YNdu5PoVUcO+9YMloBVr?=
 =?us-ascii?Q?SOSCME/mX5iyVn/hDh1gO5qtazbPN9NczpLxsHM5TWgMWI7Qiz6grniHgzAf?=
 =?us-ascii?Q?9UNxdoxbZYCDSmagaNV94SPM/wttiec+a9teVtwj+kFwOdru8EJlOQ1T1pVU?=
 =?us-ascii?Q?aUCEaUqVLRaAsaaFVGjceOsyjnnG3AO65+HH7xYibuDWa3dJY5ioGXTDNUkI?=
 =?us-ascii?Q?gFZSwuSF67XJDPKpXkZUO2fiCu83mh5Zz6SZxyMQoztYXlj5QJqsgeIxpZIT?=
 =?us-ascii?Q?sI7klJ1U1uGDA46LoxxwsGGwXB6I3izQUP194pAoOZRrmBKEe1UOfd22ELZZ?=
 =?us-ascii?Q?kKlWpTwlrC3CIuGOTBFqsL+VSrRU6HiO7CZgKLTXxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?123FfKqmTfoLGCFZ6mRAl6vKbdWol7zUC8ih++LbUmyF/nBlwrBRMnqmzNsL?=
 =?us-ascii?Q?CVMTyfv/+MCADePiw3m+/bbYD+UHHdanhwFXXfGo5tsojIRtiCbEoaPv036s?=
 =?us-ascii?Q?B5oOazXW9rb9SeATguKzX+p6PUPhgJXA5iSHfqK3ALB2H/gOaC2aPPRdlZ5q?=
 =?us-ascii?Q?c1A8pDnhv2LVRKlJlJh4tjGZRh23nzULzUVxNFJ39BsjNgu2PUYLofsZlAZR?=
 =?us-ascii?Q?ayKssnJU1Y0gJso7flbPe5m5H8KScL9ZNXj3es0feH3Cx/UvUPO0JnlN+1Oe?=
 =?us-ascii?Q?IzKT1ew5sAOhM7E7vzPgp9eqSkH21YVESdqV3NeseZBTDQByXOUMpDGwnjpo?=
 =?us-ascii?Q?T307kIENIZ93ZDF/dTt3RGEQggBNTZUOu27TO/0kkVnP0WlxBrw0ygCFyowl?=
 =?us-ascii?Q?YePpQ+9PoMADlAlRDUaSEr2+kkbxwiZJ9lT19N+hZT/ls+nTniQvHSHCvQ5Q?=
 =?us-ascii?Q?CFhtC74Q8IQsseoLefeOY4dGYav7CAdYdOym0i9uoMEbdxwqY4/2aL6wMQLn?=
 =?us-ascii?Q?S+wyaKibAoq3k5LwAzq0IvTD4bKvw4m9J0qRRduEjHM7lwdiUJyOgtgfypU3?=
 =?us-ascii?Q?cJJqol87AD2sgb9l6Q938rvjfw1Oqs8ig6XHKHFm9KIT1ffwlf3xFadhCsRD?=
 =?us-ascii?Q?rPizL5veGugfJvMiQgOVBW+YXLAm4Ge+Nfby99ADNnBYa1lCA9gZ1wcxqsgw?=
 =?us-ascii?Q?efGoauk7RafnWHV+TG7R+rtUnVaQ9lLdygIWaOfXlVy2EjB6q6JmcngeR0DZ?=
 =?us-ascii?Q?2ssFxGLfQ2cWsRAv5Ugtr0CdwNW8/0tEeZedh/kNgtXcAe2VZa2CdeKNMd9x?=
 =?us-ascii?Q?/6k5UiTqIIhPvykTRKqWEsL16sQ5SIyzyDNsxkIlTcRc/F/DZIYttgdkAc2g?=
 =?us-ascii?Q?uX3BDKIsWIA7YfRVYKPcSg+NAitwxxGw/j3cNlA6w2YKmdultVr9neeDzmRL?=
 =?us-ascii?Q?mHcKU6udMN5tpqvP5qBmtGCDRrj6kvtMBITpQQvrnl++7IPlpwDeI9pL3GCD?=
 =?us-ascii?Q?cYPLhKJkGoq2gZZrxwzuwRNrBMIE6Fh+6AwW1tdABqAfjVtapwv9jJDfdzAj?=
 =?us-ascii?Q?krVwnwi73uNbwcX9DDh0qH+j+3X8fj9u5oTzHSbuiF7XpgqloXgUGuFWTH3x?=
 =?us-ascii?Q?Vr2lqnswvRbzM2ACOjqweOseQ5eGcSO5KWGz5eQkAd16Sc4rcSyHTK7qfBgA?=
 =?us-ascii?Q?1mHdfH3YinAdbFfHGuaj+BuVO/JIg0extPQVOhQSzoylfv2R5Frm390Cp9bE?=
 =?us-ascii?Q?Vc/WJzNBpII6W1X8LP4wFCbCIVBUnzvPV+jN1PG5GsdQSwn+dDrLdG4TneWR?=
 =?us-ascii?Q?lGytBtDH+WPenYiTBCL04oP6ZVbbFXMnpDmihQg/0TVXUwY44PPOU4ZW0Njc?=
 =?us-ascii?Q?iowflHH31G2moq+vSqdbKVU/PD/Wf7idpvXTsqHWfqm+mAN1z2ZCalEDhbQ6?=
 =?us-ascii?Q?2GE4je0IieLQv56mo6DYP4gWgNPdZrgN6dT4AtfW6hljc3GCLRD2gqlJiOa4?=
 =?us-ascii?Q?R96QLpBUPxNJ/qQKnHFpXWgfnK1HJF362uoWi2S75CAaYH7KXWSoOk27u4Rp?=
 =?us-ascii?Q?PIRYaycE5X/2J2N13K17FZG2GsOlaFuFi441zJ0v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97017558-13e2-4bda-32fb-08dc6ba517bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:19.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ3epOEliVNbulBIUEGu5nfWlfEhIBqwGHAqptCIxHtrprEJHKyMBVc3kc84xbf9gQ0Zfl+P+RMrqCHcQRLWOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

Current callers of this function are already taking the result
to a boolean and using in an if. It might be a problem because
current function might return negative error codes on failure,
without increasing the reference counter.

In this scenario we could end up with extra 'put' call ending
in unbalanced scenarios.

Let's fix it, while aligning with the current xe_pm_get_if_in_use
style.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_pm.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c1831106ea4b..eca977d1e1cb 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
  *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
+ * Returns: True if device is awake (regardless the previous number of references)
+ * and a new reference was taken, false otherwise.
  */
-int xe_pm_runtime_get_if_active(struct xe_device *xe)
+bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	return pm_runtime_get_if_active(xe->drm.dev);
+	return pm_runtime_get_if_active(xe->drm.dev) > 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 18b0613fe57b..f694005db278 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.44.0

