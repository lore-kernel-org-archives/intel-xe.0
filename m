Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C61AC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 20:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1C10E80C;
	Wed, 13 Dec 2023 20:03:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376A610E80C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702497819; x=1734033819;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=e4zlKgyMOVnWLT/6uvMR0sq+8zRg+2FAegVEuVKyG5U=;
 b=H8q7uWAmILIlkB/m7P+NYgpIZBcVTMFrEKAxh5vZR6LxyT9FeH3jNimZ
 UezljtBcVqwhyr5HalisKNaUIq+TdoQWqJtx7fW5tl3HIG+3+Rk91UlDZ
 bUpwWtNLmZwF27G/YQ4uLACmZZXzPK8qg+LxqlCq7GMiyzhxDO71EE0wA
 VzGuYg2HO/6OdJqjBHQOb8KsjwW5V3vtwoCuSTTx12Mc3c6c2kMMnf5EL
 A6FRGSxZ5CJWJRqjxowWutCUbgcfs575cwCkGpk69tnMNPdDJiqO71GBX
 yx2S10//t8IVWluWb8vAJ5NPtSApcUBhoY4GeQFJXidZ3WT9iv0UWHXTl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2105058"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="2105058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 12:03:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="802994299"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="802994299"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 12:03:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 12:03:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 12:03:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 12:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM17d4jVDU4d1sCvcwNVkyTEBJCP/8D3cghiKx8uV1bsv7b4QHL6D/b+s+3A8YU3U3c/PD1ll4I4v/yW0v1X8hv2Yl9yAKmQqic7pE3Ro6ilOCE639ECg6JOXchizy+xN3z/be2n5AxWWUSfCa5dayH1ti50Tr6apXQyg7rRK3urkc4RljKiUg3KMUb1mhU3PidUZOpsrrzANGyX4hoogusfTS/8ryhoaLo/UPZSH1+3u5BEOiGMet9udONK2k9tIJDzE6hTnW1ulrWI7mTG26SWozUB50vfcMvQtjp3XWhhTIOD7tRB1WoxxQX7LCdZh0us6g9xgGhuHw5HJdr3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8HsMf0X3VBJe9zOi/wlE8QzfKupzI36Sru1DrlMXBc=;
 b=fegU0MlBKlJ6wy14e0dCxkKiW8kOoIxBJZEdzV1KGVdgoKZNH7bSCTIw0Y/GepBGuLNK699723sxoL6S+ZzbSLUCer46/FZxZnXj4NF6+b/S/gqqim/7B4teryuST1vNixPv21/WSDmaE5dfh730ECzNwRjsiAMuCWn+1vThuJonH26dwbHePztmQ5K5QtUB7Ha2kfbpiv8gJOPEkFU58TSPnzw8tWcVEuuGT5jyzpBxR4tq0jqFpAuvP8AEtA5wTD8thrHFM5IgBp2K1VFixrvo0iqLsMFTuJGQ5pa3/CJ2GDpYwl7SkBAgvhRXqrbe1VcXShMDYLn2IhikS7RyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 20:03:32 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::5064:87cb:f7c8:65c1]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::5064:87cb:f7c8:65c1%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 20:03:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
Date: Wed, 13 Dec 2023 15:03:27 -0500
Message-ID: <20231213200327.1425151-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 03aff4ef-2660-4eae-5548-08dbfc1694c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/lMRmGs6aRl47RuwjZlylHKAN/swdveYDDiQC4nNeh0SM6MIlROqdbwHSocEquHll5zQ+le/tCwY+AaEKovsEHOan0aohxAZ1GiN/liHAiYWVJH63qTzBU/GuZD3C/JlfcccJBVpDj3s6gWB+R2KLj/zxg+cHRxciLqkFFrFFwWBGtqXzAqKDTVUF3ExXuPe0ubuJeCX3ekVYKeJ8/XIOPlCBwOT9QFfupu0MlHNEe8z+h2Gg6bYIHdIhmMmGIIaxtt4RjCVLhQKNW5yL/saZJEvaPK+apyd97GO0PoVxki2dzap5nypU/jV3+XHWTYT5Q53z37RI5d4o3h9iMATZoLGWW5kjnv5/8QwvNkKnO8YjZLOAGuuGKFqxVU74Yj5Yb7uyE6IIJ32M9g9NlEyVktrrxG04pzqmCtZRjUOEufijK0/rRFkTCyNIVlDdTfYg7anz2+fs7XndRz5pyGl6IuWuDUltLtu9dZMaaHXheuRl/q8/dJ16UhpmWLA8LU9HpJWEhvqwc4tfeilxwVc5vJ8bqQL3RjDWamqv3jb55gXpSzIZ765m05R1nwD2lq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66946007)(54906003)(66476007)(6916009)(66556008)(82960400001)(36756003)(86362001)(38100700002)(4326008)(26005)(83380400001)(1076003)(107886003)(6512007)(2616005)(6506007)(6486002)(2906002)(316002)(6666004)(478600001)(5660300002)(44832011)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tzbo1qc5krdVBdB6rfKMa0+tsLLJbhaZy1nhZ0pe1oq4EmMEjrTg8DpCbRS8?=
 =?us-ascii?Q?ygmTVMxXAujIg8CxOFDUDAxVZ6AB1gnSguD2pTivvHAeel5vj12UIHKM/3tm?=
 =?us-ascii?Q?AsLAFflbbnUaL7a7BR/A7MFy/4l0O1fHCn+saqGWdE10buGEr3ufvANutQaF?=
 =?us-ascii?Q?MtBVa9RduM1/o3ChtUuWqFu36uaKsOjp7lGAM8gIALblKgbb1M6j6kLYR8oO?=
 =?us-ascii?Q?FgEN+5X8+ETmcanLxKrhrWyNXoQNAYCJyIYIZRg1dIwmcRPPyRm76hYI0wP3?=
 =?us-ascii?Q?pbDo63vasGGLJZcK5ORa8GfZoZzj5XcHGHY4bTnwPfARVpMfgjlxauYPi+Gj?=
 =?us-ascii?Q?3emF0+U+sW79tW7HkaADp0yhYI55TDTkY+tcetm71qoBuw8d6WUirtx9dJny?=
 =?us-ascii?Q?X5UfiurAgq7DbBKurSGVuwtE9L3HGpfwFh/T/Sd9nEEB0rEyM4n0UAEbSr7R?=
 =?us-ascii?Q?D6zaBCBnzz4iEF6qOBgZTUcbg60BrzIc/KXFABy0b58ZWoy5LnluSgh7vRfn?=
 =?us-ascii?Q?B/NVlcmAiaw4wZKkO4QgrgRdxhnPE55Q5ULk3QyG883hn7v8412Ayd/usxkD?=
 =?us-ascii?Q?7+LibRAlC6fssN9S8ukoGwjSxViYx/m+PtsXlX/IyBWBOX4QSNUzFa2uvpAj?=
 =?us-ascii?Q?nICSATwkvkKfD9Fx8EHG+dqxj0TnlAgzYeb2xlOFxk8djsfj7nnGcrkD7Vu8?=
 =?us-ascii?Q?AL/hG9cNuGsPxl0y9rBuajk/e2RDYOs52qSFNYf6u/35hFW6SuF+x+xnbnQ+?=
 =?us-ascii?Q?s3Ub+ivRfA5vZbqPJfEKPPBH4GNvcMfzdovKRl0xsn9zzA4B07qz6mFvJ/iS?=
 =?us-ascii?Q?r6cvTGv9IAe2yWzEMidp4ib8CKNUT9oWSWdckdtkhogaFGCrekDMTch7KmmH?=
 =?us-ascii?Q?XyouHGghyMa91rya3yilpYPhcevkh84YMmDKe59BvMH0yo6wZf5PxLWs3IiC?=
 =?us-ascii?Q?YPH80d3IZrhv+CN03ThFZwqy6ivn0uoASgCbRqXr0dOYOmktgLoH/K3DPR6m?=
 =?us-ascii?Q?+Ps8eJMsaAN3nfaSkUH2b8/4tetUN9jSCA3kpZPUh4OPP0leAcSiK2NhmBX7?=
 =?us-ascii?Q?N27WymIW54CDaJ0oJ9Gr4LE8ymtmQ2LXrlIeHAiv8UneJZ4yuRCR1Gz+Aln0?=
 =?us-ascii?Q?6YNlesVFn6Obz/8wHM375A8hI5jtoZ9xeWnY5uUGZUSyVAtu7w6Rf3zB5wXS?=
 =?us-ascii?Q?0S2z2HQNucMCKBtzNU4baqbAfN9nRSRgriUDnvVBPRRJ+uDtLEAMlFlEHmwg?=
 =?us-ascii?Q?AC5bIEHSMLInLtzK7t3vHjXC6WOEdEvcNVAyu5jzuu1VREb8KV03VbN1L1+X?=
 =?us-ascii?Q?WzaNIX+v02lOEGp8Xh8DtHH2jxn4WWM8g+xlqJZ87wMGRIwbvbIzJNA1IaVl?=
 =?us-ascii?Q?yq/bdsbXaI5cBeu5fPhnN9QwrvLDYsCKZJOz45IDRoImgDcQL/LYPEL/yeNq?=
 =?us-ascii?Q?J/R81/9bB4dQbW6M39GKmuS42lbnNe6Xd9TqWP8HQLpgU7JZByiL2B2X4DiJ?=
 =?us-ascii?Q?T9X4hYf2nHuQUQg+4UrJ932No9R9kZKV73eIUQLDd79OWp+PIya92xooc1o9?=
 =?us-ascii?Q?Fl+UKXegKG8F7VBZ0TvGNj1MdCHDl3wId4dAP16J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aff4ef-2660-4eae-5548-08dbfc1694c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 20:03:32.2480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AisHdLViJKOGfVDBM9WWjwz/jmHdWwxjau2Y5aHGbXNuMNMnnjkUmwPODSeSXJW/Hbrz1esTz0RAQAwW/OpqOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To ensure consistency and avoid possible later conflicts,
let's add drm_xe prefix to xe_user_extension struct.

Cc: Francois Dugast <francois.dugast@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 include/uapi/drm/xe_drm.h          | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 85bc25fe99ed..b67097ffe6fd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -453,7 +453,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 				      u64 extensions, int ext_number, bool create)
 {
 	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
+	struct drm_xe_user_extension ext;
 	int err;
 	u32 idx;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..8fc3f8caecde 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -27,7 +27,7 @@ extern "C" {
 #define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
 
 /**
- * struct xe_user_extension - Base class for defining a chain of extensions
+ * struct drm_xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -45,29 +45,29 @@ extern "C" {
  *
  * .. code-block:: C
  *
- *	struct xe_user_extension ext3 {
+ *	struct drm_xe_user_extension ext3 {
  *		.next_extension = 0, // end
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext2 {
+ *	struct drm_xe_user_extension ext2 {
  *		.next_extension = (uintptr_t)&ext3,
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext1 {
+ *	struct drm_xe_user_extension ext1 {
  *		.next_extension = (uintptr_t)&ext2,
  *		.name = ...,
  *	};
  *
- * Typically the struct xe_user_extension would be embedded in some uAPI
+ * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
  *
  */
-struct xe_user_extension {
+struct drm_xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct xe_user_extension, or zero if the end.
+	 * Pointer to the next struct drm_xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
 
@@ -78,7 +78,7 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct xe_user_extension.
+	 * of uAPI which has embedded the struct drm_xe_user_extension.
 	 */
 	__u32 name;
 
@@ -626,7 +626,7 @@ struct drm_xe_gem_mmap_offset {
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
-	struct xe_user_extension base;
+	struct drm_xe_user_extension base;
 
 	/** @property: property to set */
 	__u32 property;
-- 
2.43.0

