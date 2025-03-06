Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B928C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E49F10EA56;
	Thu,  6 Mar 2025 22:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8nl6S1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87D10EA56
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741298813; x=1772834813;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+AdOpREkzjt0cuNxCCnDzA/r6ufzmcrE4XNUz2Fu+cQ=;
 b=T8nl6S1q46EQhnS09i8PsVaaUeh/kRs1i5JjLG6ALk5Bs8hjoZjtWDqW
 EH1LNZH6Bw0RfEvxrRpc+p7Lx/gO+9gXbW7fPOEQye+RgHIOySl7c5gNO
 DxMPtMDEfPcBLI3tLofW8H4goo7tLoa3LHqSXrSgpEaQvEP4xWQa4Skd/
 CK1de+7kHq+hvaF9SvAezm7X/qc5cZlnSFyfKvlg8cV+Tklnei898DD+W
 UlzGN5luw039C2YzcfKdEHdr00VTc7oHtjQf1a44BX5fEck+cCpMzrsf0
 UHY3Hw3ff1NN3IzrIZvaCD3eLIfjM9fMFDbf9C40RibEVVHNVAhogzSmc Q==;
X-CSE-ConnectionGUID: XoO1hDomR6uDVbJ6MsJzTA==
X-CSE-MsgGUID: vwzV1vsMRyW6mQM5wyNPLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53734982"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53734982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:06:51 -0800
X-CSE-ConnectionGUID: 4FP/pDh9QjGKFgHOzA2B0w==
X-CSE-MsgGUID: Wh1xElMOTLW7vw6x0XIODQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119659232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 14:06:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 14:06:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 14:06:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 14:06:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xICU8kobMAXEKl4GWoTYufiv2WFpTBXelhXl4IIEAOoT1AlBmlyCRdSFweyZPyfAZ625aYzcsnahx15fPZIuQLLSyV6Vmp9WNCrOWRHAiyslbyaYTHiSuexDZPKg3nqrSH2r0eBs1tWbBOcNVsJCt4R+7vljuNn1hmtfBh98y53vl/ih9Geara97L5dEUJ43OozrUdx0KDeXuC2TuGZAjyqFJfDEG/jSus8ZIHMqrUUgDK+G+HSoXn+0EKLkWkvAmQWRt3WvSsU0ZadowxBFxq5QdJTdtN90tao+TGK6yWYKKX3JF+oIKf55JXtk6xu8Y/bNnwMt8RZvlRlfHkwabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh30YZ13qkUK2oRkv7yK2/TEltPseOeJI3syU5Koq1Y=;
 b=FlVieGTUKXqDV1v4LvqVqTuN52aMC6d0qjenOOWTCoL3W7Tn56+WamKQ67H5Qdi0zGFv5ykNAT4M4hNDgGReXZK1L2aAqBAiJleg/8ZnVYnStAKemJu44j/3XAk3tQNo0E8j4nRBYCNdX3GFZnu7B3oC6SONvrXqkYapUUiy3FSceaHVkjkrhHGgl+OtxUdnzqsPTaMXGgiExjHUrHw7OT5COT6RNT9Gs8p2OdJGI1H0XuQIxJ55uZDp8XdEsrpus7tRdbV8Gz1703btkMwOozebEXlt7pM7RL4W8I3i3b9L2/7oZZp2ZvB3kaX8752Tv5MyfGvtZSJJNRn5w9H3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:06:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 22:06:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe/guc_pc: Remove duplicated pc_start call
Date: Thu, 6 Mar 2025 17:06:43 -0500
Message-ID: <20250306220643.1014049-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b40132f-7682-4c68-adb3-08dd5cfb3001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2/9FU5YaDtsHjqQZUaZbhoUJ/1ltmbV8Ed1zzQq7msCprsKJ1aZV3IcLQiKk?=
 =?us-ascii?Q?I7VN4N3tp77IX/M0NF/+Y9Okzopuqw4GdbOooNOS6neeNYLUNtCL13/1AfeT?=
 =?us-ascii?Q?v+3m2zPmNBjmKvxn0/dMgnZ3tTxxmPr6on224kkX8nlOK1xmjYLRyr9LpcwY?=
 =?us-ascii?Q?MSd4HS4ksC+tfEn+FZyFKoGpwsaWtSuws/rzkrOD67itHuFv+j/sKF/OcPMj?=
 =?us-ascii?Q?9GdEIq5tymvVYSRBJ54HX0TXoS+2CSnzDFJMlTT/vgt0kBzTKPJ3l0JRitpu?=
 =?us-ascii?Q?1Y0jFXLrgYy5udpZG8rTulQutIzv5Oi1UdwpuEQpowKaG/rODTVxnCZdjpl+?=
 =?us-ascii?Q?3YVkE2aQVndWkcV+iynIOWbZy8WLlz/A5nPv+XVKtZPqvCXziO54FquWCrqJ?=
 =?us-ascii?Q?eDflWJ4K7o+AFoydL32SNwAvix4/MZjNQ4hspXuoknziMgUmZdsfsGw+gfWK?=
 =?us-ascii?Q?NS35LM4yZJ9j6FDLrBevLj0XvKIfTt/w619t9rGfMM5HCLKqNFWZUDJKZ4WE?=
 =?us-ascii?Q?MNCGymTGrJrrmO5bn8KCU/XE0tPH6+zyP5Cva9LNsVOSG6Dp9iD5f+Ow+8mH?=
 =?us-ascii?Q?qlmvbmc2Ni9cNK7WvdpLZYWDm9xnWgsCLUTMDCJGxnGc2iYggmvnLzdWHaQN?=
 =?us-ascii?Q?YyeT3fJdywAEdywOHk49MV4DJu2POiZoGDdkZpv5XzxHo90CzrGhJ1CgHinM?=
 =?us-ascii?Q?vfB1ZcInkLQjJ39lSA29HgBha4g6WmWzzmB4Xi/CVqDFdgmgiVnQk9ylU1wX?=
 =?us-ascii?Q?j+kxw/2/YMjQju3/xYEh+nC7AX37873nGR6NAiymOPJEX7fnuyr+PqQ2UOSt?=
 =?us-ascii?Q?dUXL8+ZuyXYg9HgO7sfAdWYFmE/8GEgRqdIiwzWdPayfe5JE5fdz0tYvaat4?=
 =?us-ascii?Q?Ui2VkWYJ1qJnOU0ehhSGlMfQiq8+AuT+v1R+6U/PY5SeNscFfhzeaktjYgBW?=
 =?us-ascii?Q?WcxixPP1bBNYA9DPzBw20hrahm8jLPO13n0yI6E86vYQAOcDrkG5JOTwv06C?=
 =?us-ascii?Q?shBRGivHiBMvEZVH61soAxmGmWoN50mxGBePvlgpYln4ukbjwmGwck74Wzaq?=
 =?us-ascii?Q?YFlyXSCGIhyTGUyoVQG4qQbb3pLZrFNbMxVlGeBf5dhoDPRGEP4ebuQZ+tAC?=
 =?us-ascii?Q?wenLNfAaz/2/CSfKWZSFkzBGuY5D5qiVkg0femXEIDYh7YE+32pck6+PkseR?=
 =?us-ascii?Q?9PlyUa3fesXbY5Wr7JrgQDikzJI4rmv5vaZFQ8Q/ioa6XG2z9LLpZBkMmDC9?=
 =?us-ascii?Q?A8l80M/98qHkAKGz6KsjtgU2y3E9yTBeutkorViNsyLCrQzR86A25H8NOSRp?=
 =?us-ascii?Q?xd9+d8JRI7Toj3KFMzwUSxlB5icD10+TOFNIQtQ7MBf5Qe+UUq7peXvCp9e6?=
 =?us-ascii?Q?PBSi1feh7Lo9u2Hdp7fUxVkKtujO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQh2yf90SGegQKA8J1B9ZRZ9+zleWBPbVzSz88p3Pg0mv5swzMW+BboqEDrq?=
 =?us-ascii?Q?mPAKaMxCrkDr9dRqoxnIueLz1AKveK0MwLiJVS2spaMTTTKaoEkKykf7fgeq?=
 =?us-ascii?Q?iJV+fZzYiZaEWbUZ9M9iehx/Orpfs2TsVzfIYaBFCCNQNWXijmUOYRgCI5/D?=
 =?us-ascii?Q?rBbmr0OcJ408uz8Nqloeg+0tNX6QIhZ2UL8+O2KaVSB3TjcR2Zg6Pw6U6Y2m?=
 =?us-ascii?Q?8a8LgO4j+nkf8wm8Aam2rRFiOJyqhZJUbTU7yQTZUW8W5F7joSJeM3s79KAm?=
 =?us-ascii?Q?lFKOJL0JLdh8Ma0Jonns5YqLlPIq2sUi4+uItSoxs9LT06faLYmgAc6Zu2/x?=
 =?us-ascii?Q?CP8lwOeYiXMZHr2jA89Y+Ltm/brHPay9VgGkAK8fITFl7RzMFCBuAUSToSNh?=
 =?us-ascii?Q?O68p+2mNeefKhMPKzDFHMOaAQqFFDjZfoF4PfagBHl0Mc4iMmgdGOayMBfcp?=
 =?us-ascii?Q?ouvpWEwVepf0vT31gko7OPYMbR9oSXDySaTS41PQdC/tDF9WCsAAPZfZPado?=
 =?us-ascii?Q?PMZeQSCKI/o/qJLee8b9Bk5CF74ekyuvKjKuEDcQPRATlGL0KwlBwKYI6rhh?=
 =?us-ascii?Q?VwBh/rA88RDIih2fbdkP/OIaaDmT/nbeh+P+OJX12WKtEZ1c0YOBGfLQyUt5?=
 =?us-ascii?Q?4pZXZ/CM8X/dHrlyyZBrRo/RRirxG22rFTiL7ArNYdlQAZPKd7Tlo3uijECT?=
 =?us-ascii?Q?wPF7lJscbOoy89N6mqZxlaqs/wYiheqdo/Utd//hwKZD+jlw7mMQ10vYZv6e?=
 =?us-ascii?Q?Ra4cOALUt2O9c4HUw1QdA+UlVl9oC0oZp6vaYIVgVjzTVpNdoThLeXs0Qk/N?=
 =?us-ascii?Q?eQvLyHZazNQpbt5ukF1sa6LWTFxmmn4PhVV3KUgjmt8oaZqZA4NuHpcjFoF8?=
 =?us-ascii?Q?iCLcAHb8zhCaA9rgKW+m/rh+937aLhcx/YCGvVnfQYfxyPUR4tbYDwl3IUMC?=
 =?us-ascii?Q?UI+mFVOY0Clkm7fUzLyGxYQdxewosEC0gAyflz7nQ6LY9glNHsMgKMfrXxfn?=
 =?us-ascii?Q?gKSvzfaLst3r/FHuyZNPloRaAbOGUK1qc7On8UHoB50jj7+GGz1tAWvRnPDH?=
 =?us-ascii?Q?742EYowJ+ZBMWkWLCvmC3qIXWM+N9Q57zHnURUKQbHB/iHMPr0bc0GRWoFhm?=
 =?us-ascii?Q?vz+d1X5JBMxc1ZjRM1aeC5mrAahquLhhb7SJmU2PUm16ob+vdo3rDjxU/4Om?=
 =?us-ascii?Q?7aN4pnbnPHF0IgpXWxABHIYMle5HdnnYixq6YnYfTt7xT7XM0rMl6HhZdHx3?=
 =?us-ascii?Q?DwiGD0RFnGFP/Tyu9K+D5i8RNOpXaViuRRzU3OWWb+6KoTKPBgFfxk+oVdyZ?=
 =?us-ascii?Q?xI2AJCJS7KVbvkBeCZdvqsaVZ7GEPzx/D/gDl7YcD9NTYoNQOu6wkQ7wKUAX?=
 =?us-ascii?Q?STAr0oQmoi2taFU6cBbz7H4hOlW/X/4wkPxvQ/u1Zosbc5qn0Q/Dul9ElCla?=
 =?us-ascii?Q?rjCGomxoangUQgQogHvYrGaWV9fW++zTVgWz1x/eRQ2nfNyC4z2vfYxH7n4S?=
 =?us-ascii?Q?AvGANWxrQdnd4H/zFhuJgL37cZ43SSaQ0V2saHeeS2LJKvyk3LbBohNPtZTH?=
 =?us-ascii?Q?xD14gWtDl59Tkq14IZCJ41LLfU/X8bswlvK6pe6WWJgLFkBUfwS2ONAkwAby?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b40132f-7682-4c68-adb3-08dd5cfb3001
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:06:47.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVgF6au3ABLtuDwtE+tWXdEm9oiTfYOI6E++eLOkhXLhChJXqc0yZDHfbPx4BJKE7VkzB87wI5YuRvujFcNqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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

xe_guc_pc_start() was getting called from both
xe_uc_init_hw() and from xe_guc_start().

But both are called from do_gt_restart() and only
xe_uc_init_hw() is called at initialization.

So, let's remove the duplication in the regular gt_restart
path.

The only place where xe_guc_pc_start() won't get called now
is on the gt_reset failure path. However, if gt_reset has
failed, it is really unlikely that the PC start will work
or is desired.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc1ff0a4e1e7..bc5714a5b36b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1496,14 +1496,6 @@ void xe_guc_stop(struct xe_guc *guc)
 
 int xe_guc_start(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_start(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
-
 	return xe_guc_submit_start(guc);
 }
 
-- 
2.48.1

