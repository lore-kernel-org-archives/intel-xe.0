Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB28C54E60
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2556410F3C1;
	Fri, 15 Mar 2024 01:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNr+AfMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36FB10F3C1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710464614; x=1742000614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KWI5i3sljxEl56D9dJZVItuFlU2SLE2g8rX4NkBgKyA=;
 b=JNr+AfMS5bO4wRcwciwVawXwhhKeWqQ1C0xbs3xXDx+eb4AURvSfoWGn
 FICqU+jqtiio7but4C99t8y9andVvCmQ4TGBVDxeLPlYg0664PQPeDMyi
 7bLJ6rGW9DEfRXQtRBJ1j/j84NirJK4J1wOzY9EgZlniWt2yC2vByxllF
 x5dIg/zirPr6nGzGEj8S9X3MeHjbUx35+9U31Qjf9GPM0kn/ORnQB2IcU
 c+YhCRHeXNbb5gLzPcHQkDo8abjMkDq4+R/RcAgsJPbfIYlMIkReQ2ZQz
 /V4WwoV+vBiV0cWo7EFHzWU+0qE4kfrxoTaEz3nC2uSGjejNZI9iY0pTx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5187662"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5187662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17194408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:03:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:03:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlGaYIWc0hPoCxQYtzOe4LcI+PUJDlZTPw7GUs+dO10OTxX7loz4/9SQm5OTN7MYVmMj1Z6xX4NUn9CMdDQ81QIM69A7dIgutExSwb5E4+Jn69u8t0QXgUBdGVVK+c7J48sY1yCc5Ouf4UM8Ay11V00LJWazJLWTu557h/6/ZD8Q7mxE/iK65fUnf7WvXzpDFGtEh9trELF8WetAUKAMWDWkY4pFiiBhKf+nlc1JqKLftVMfrQkDKz9QJUYdGRf+7RpOqirG2LWbEMDWxCox5Oto4dEf10tCn40yHgfpF2oOFFucrefNrudMWJQ8UfNAddNEl76oM5AxvnZ4+YKOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf0C4nbOznRdKPF2HBPFUUynrdLxCQxugVrr2mCh9gU=;
 b=mct/ReYagzvgTBzKGnRYLt57/HrF80Sh4CvsA3TRBHyWl2nZa9Ltf+wwbn3W5qMmZbErHU2tQLw1dqTlwWU+x3r/wotIhQ5AYXpwOonmz3ZgMtCwiH0zfBOXnCHn1k8qgj/OLXdykxVUyl35w4qphd5rV6o9kKFbkRxeCrfng1kmvHgZRX3KxnvF00iqWpgCI3pjNRcdEf3rBNa0AkE73aa9czjvkPG2tAYOLrWPbgCzbBXz2Vk8KAvU6efDeD25W7Up3uNRTGuj8t6BfQ9XBW7/NaT+mYYdAGgjiz+7azbFbWYNhkhSWsSApQkFC17+d3JHgZSSli7OHOQXxar7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 01:03:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:03:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe: declare busted upon GuC load failure
Date: Thu, 14 Mar 2024 21:03:16 -0400
Message-ID: <20240315010317.193756-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315010317.193756-1-rodrigo.vivi@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 865757fa-4a1b-4271-eecd-08dc448bb8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sHbFKzn/fpgZ6wATqjst+DhdFvlll80FRKFnfm0oNy2A4/cVwGahoSv1SE2NgSFfvDtIo23/GqDFtx2XqZdgBcGA2CA40rHsEF/SjQyGdgNAKf7rAhvnjHwbOUDvVfWXxLNDYbpCroQHnqcJQ5dfnRVsWYtKb9kE6AEDYlpLYKZnUjXCrZSCAwmh/id9vIaWvWr9YqjsoD+IsH4tWbNzfx3Hz8UOl0BpVe97svJQvHIgPVmk6oK7eGCFRO/QBMAi3e4Vf61771HcF3lqtCIt/jKqC+4/4p6Hd0eXPE+z0kzqc8xjDO+Fc7XNHmR++isNPFGAKeUIo9AWEe1+SaHsinJD/Zdt2/Tj+os74ATxM4WQk15NFWBaRtvmXe+uPzR49qSFPVW37GDG2CV3k1D2yK4jjnL5+MDJSwne2aR36nQl2tAjYm4QL2SuaCDwVFPS1xUSXdGCjRSYFh0NUm+7wksoZIRtyurkJIPLwenLrChm6cQAsLYozAgLeglnIz/CDNFd7LKpDzkCDwtqFi8AVwPEhoLNdxesUzMtWtFwxO7Zq0VgEHs73z5YcylHNUQsy/gVYyqm93YxOQgaoatKmnVYYTlPyPNJuyu/nRg8g4LGyiCYbuuYHLMue3QheeizQJbzUSbSmfJ7XsOOlV7jMF+8zfeKA0qeK2j9Xx3d3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpuqx9asnFSPDuwDfL6bDoLZ3s7NO7VTHsKC2PqqLPVjb+mdEB2Z8zJxxhIu?=
 =?us-ascii?Q?nsptfFY5sTE/5NvchAOmqpT7PW5XCt4Qer1x7fI36w+s1h7LM8dVdwA2SbKL?=
 =?us-ascii?Q?FGYY/yxJvmVqvL+MIGltZ/ANGG03Lx9ZSWoqA7sHcKkxQT8NaXUh30t9aEL/?=
 =?us-ascii?Q?EhyPEBSrNa+ezlo3OOvSAIhxnldRgiWANnGqYZJ9LgDVe6opN+yursPp8Ayk?=
 =?us-ascii?Q?1kAQnjZ+hxQ5Qx1pfZKklIXuO/pVfSXjfepqIjWO9mKu+FTBy19+wk5lkU0n?=
 =?us-ascii?Q?NWnr6LiT2+KJmsuhFSp1ICP3ZqtGJJg0nPAHWZ4Cu9UYH7NOee7AkG2b7xla?=
 =?us-ascii?Q?jfhQKDGCa/pkxqjUJnOPkShT5bxI4sC6HkmFzjSaDnXB68EPZu6FvtHQymXH?=
 =?us-ascii?Q?cx8nzAfZEfsdCqM7uf7c4tGwEo3JksyH5FPXPCu/w/P2Qi1zh7FG5nLwfEJq?=
 =?us-ascii?Q?4gq+6Wnbp0tUD4fcH4+ad+LrF8rmRIiZ1mZ/ambdEIpxEUk4ZcMN2nE6AR01?=
 =?us-ascii?Q?dL6GYl+ASuMjXbwRvGgs0vT1dj4pNcGh2QStMY3/RTXNe9tw46BS7/CR/90V?=
 =?us-ascii?Q?AzT+ED9a67FAgf/PMOA/aLHqcM+CwtCBHjEzEaOjih1t8GNqucaGA7yi4OGp?=
 =?us-ascii?Q?B27bQW5vhtMxukJRG8Fwugt9JQ1A2mPfsPQr5KaAVYR2AAlpdRdUIIexwCDj?=
 =?us-ascii?Q?yFH7Q3tosamEwgPSpkL4eIFKcqHIb37qqNHuQNaOXO0KlecwzwJ5/YOd8Oq+?=
 =?us-ascii?Q?KRR+O1iEGvf9ulrhMhe5JgDZW756E19skpG1tKRr88V5k+oYjkd/rG2W+EQt?=
 =?us-ascii?Q?HPVfsTpTjfS8gf0xv+/WDRUfnLFVv+S0nCPjRREjqb0JSVhXjKY2gwDla//D?=
 =?us-ascii?Q?D4p0I6ReNiSAuKR5WV/iZDKdsxEe/yd3BoPlcYnaBgg3JN6bmupont/e7KSK?=
 =?us-ascii?Q?h1ynD0pz4rzOdD3XDiKtSlgPKRoKY0U133BRpma6MKA1E6vcfS5NqBmhBNQc?=
 =?us-ascii?Q?uXzOgIOjlTc3wGbOvj4iWIUynz1CDUrvXVZkN9EOrH7hK6JVrxtGfAWxHiKF?=
 =?us-ascii?Q?H63nwU4cNC23uUut6akxTGPTJis1GfdSwVvjf3O00psI/LCDq4WFImtghFoy?=
 =?us-ascii?Q?FIHypKUPXRb/FpGAXgXo5i8WEDBF4FzElRTneM04XFAViaoryFnfytXPam/m?=
 =?us-ascii?Q?BNaTjOxLJxRljIUcUCWFOSX8XjoxJrPgDKV3ZmQETwwajlD4MUVfT1+knx8b?=
 =?us-ascii?Q?L9nCwv3PvoKCNvcY7JCkKlLdjOzTrbZRyKKQ/Q/3VD1+kOz1zHmgPZTBaouN?=
 =?us-ascii?Q?liRO31hzH6R5GB6Lg9Q5Hz0fisq+x7DDqIOuwROHnOJVQ+6IMyzm0MwzWpIV?=
 =?us-ascii?Q?EBVXxUFC4WgmU1iDfonFg4/oqsKqdEUCYwxW3CXESyzu2ow2CA+GtZB2ioNq?=
 =?us-ascii?Q?uWZCDFVoP/8agq99cRFzcvMOtAtjI7RQ/gP9OMauMZ/j/2I07q6A/69qbTde?=
 =?us-ascii?Q?D7Y9172sz+wMd/ycTqoOR8dOlZRXrqAvikdAv8n6pavmv2YIpQnSLC/goat8?=
 =?us-ascii?Q?GNPXTSg15svTvUfnwxmiVXSLtxAQk7dUw/tfqjEms9yjp7P/2OqgXcw83d9s?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865757fa-4a1b-4271-eecd-08dc448bb8d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:03:27.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FXMyDeZGmYdaF5/rSsyq+U1fx4103AsFnDN3zk4UvO6LSr9Ge8ZLxV0+ZDtsIuXG2RRSpq16+7An/lCMf6Ing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

Let's block the device upon any GuC load failure.
But let's continue with the probe so guc logs can be read
from the debugfs.

v2: - s/wedged/busted
    - do not block probe or we lose guc_logs in debugfs (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..85edaaa734a5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 status;
@@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
 
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
-			ret = -ENOEXEC;
-		}
+		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
+		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			REG_FIELD_GET(GS_MIA_MASK, status),
+			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			drm_err(drm, "GuC firmware signature verification failed\n");
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
-			ret = -ENXIO;
+			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
+				xe_mmio_read32(guc_to_gt(guc),
+					       SOFT_SCRATCH(13)));
 		}
+
+		xe_device_declare_busted(xe);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	ret = guc_wait_ucode(guc);
-	if (ret)
-		goto out;
+	guc_wait_ucode(guc);
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
 
 out:
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;
 }
 
 /**
-- 
2.44.0

