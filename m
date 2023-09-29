Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D084E728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E7710E148;
	Fri, 29 Sep 2023 20:53:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDA610E143
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020810; x=1727556810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kaUM2d4WusWdc519P/ldjfYQVcx6+W31L4GmI9vCZrg=;
 b=kvUsW/rfAbi81DAuF+4LcdhViY9XtPZpYgkNVZjtnxJSwWYLM+dN1YpD
 X2ScE8hMX9vyuDVT6n3aljl2OefVDuSodjMe/NJ9iihfzqlvWKekJl59w
 ICMH6Kuhi7OjbE4pZDiqGihw0gTncXU2tdYHelx8N90SPmYwfsHiq6t04
 /HMZMHUPYVQx98siDb/fQirmweQ4RitlayneXPJz6viYA4qNlJhPNV9vJ
 IXsyjfjdnqTtK758+zrxSqjuwkGH1rhV6vqwR0vvsnWgmqzDlQK5b/7/o
 GyqEQtrnUb7SgvYqYigfgR1diuQappWTEwuY7xoRgsI4lMPSt4xA2GxYl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413278244"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413278244"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865825900"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865825900"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:47:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:47:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU2SxoBa4en/Y7NuITHdzH0mMCqiQr4ukhsxG9iBhtf3WOQ9WyiH6ZmKUEVuAgcP5UJul4u800LlC91SKESNvs3wY7x3lXsmBPGMhIhv8LeP+JZ5yllhonFSOpsh+pyxLiN7QECdn033cu5abD7Kt+P6MbSNz6BiBOS8Z/c1J8XEeSZTq0cQ/iR1dhcU+mo2x6mmyp4wZq5c9emUBva8Z7H8aemQZt7xNj5g0DIdezszaXnSuEo1fEWYIvMqizM/fAEBgFbLkb2DTO6663sDKOc6tT2Yg+vPaa8oSAWeIW5Ll97AGN5dCrQr4oqYYuXYhnl05igYmi+GW5M7RHC0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npSCcMOj5rNhBzmJ5/iNvX06KGFcwkP79QduWoI6Ptg=;
 b=B0BkJ57WO45XJLOP9oZKGu9Hh6ZBbrZ1NgvUT9MjhZgBLRp/EWoGyi/kMKBmoFIQR7ehbnO78cQxb2XZX+1dmOt0O+FZv37Yx6DQXPbP3PGdH1TUmhX2kNzulOpSsKU6XM4wWftj1wukT+2BZi3NdJ1BOjMHsPk7CdRS3p8cq9F45GpDQUnJShX8orPnEKWrFY96RBSO4Fl+MFsg9XWjBc6FsVUFOlwYHICxbEO6UP85K2WsoX8mPgS/Mf1y7an4RSiN6Ptu8rHYaNkmfv7xWmC3RySymEzppaE4naFE/QR6CkPt/71FLCGg9i7NMZhC37+uHxNnSENAD4VCkyLQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 20:47:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 20:47:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 16:44:10 -0400
Message-ID: <20230929204637.1202492-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: e47d5b2a-2960-4dfb-3be7-08dbc12d3e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IM9WBhC102iEN4k9k4ZYwxrCIkyvX/kDiBzaZVFWChsW/S7z+kOfWxPQykcXe6UfK0jDCXGGHHGkHZMcGjFgZuXSW91Z9mx2gcJ/85t/5jofsmXMLm4AuWqttq/goVcCoB3IFFdWgJkmZaBChAQPuqyEOAtmp6S/kh3zbvm4wrqZZzbDycxDYctL+w4mUG/JPvwKSedAWBkjsRjytcrb5xKfT04voitZzNHIbg4Uf5fSLN7mk03G2VKFKfzGtK5RsjsQJnz4nCPOw/EVJ1fxGLkuu0W68PsK/t5H46NhHPGKvtQGX04anMjTBHzKpTlfL1iU45eCbVNt44QYD3nuiEDvaHBkKVSko6p6lOzq48s3JbTS9kXdOWiFWmOKvrDQy8A7nb24rCe66eMPCQ9jyP5RqXutomupSvUwzexRwzQAay3GQKXKq6xcrkB6Mzr0b2tHywGhnvkCJ1TESlX+2kWH2vNxe7KLkl2ifzB8sAHO+olwa/sVWg7YS3THjkX/2rjFVtyU9fc2hJ7bIVFglNi60difhXAsjSWIXvbv2BTkHPA+l76NHj/OEwaXbBWv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(8936002)(478600001)(4744005)(26005)(44832011)(4326008)(2906002)(66946007)(5660300002)(66556008)(6916009)(41300700001)(316002)(66476007)(6506007)(6486002)(6666004)(6512007)(107886003)(2616005)(1076003)(83380400001)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0feBEbRmxIKQ35+AilV/nqAL4IhqkdT9saSLzxyuWbdpSPLUBWErsrGRr4Wf?=
 =?us-ascii?Q?+lfqI4CF7Ddd9GIz/p6Oe5lJ4x7c5Km1K/rnGY57kLr0jFLmCUA+7+Eo9VwW?=
 =?us-ascii?Q?fT5K3ANuY9skEWeXfgaBR/twLt1rW5z/CKz6sgE/7jDpvfEeIGrovviz6nVC?=
 =?us-ascii?Q?rzdZyRbbCMYfGCUtSTMaPYT6w5Ih/RCP9bo/jAYwabXbH1wa4G6t5ge+1EtM?=
 =?us-ascii?Q?P8gQ8SVid6n6BKA/uVuhqYrkGGcILaNhRfjVe44sgm3h1EOfqxZLN1FA7pRb?=
 =?us-ascii?Q?ujvn7UZLsqEoLv/x+Klwd+sTAcCKwEldKpEx+1tfIBG2QVgM5BfFZo4Ml2h6?=
 =?us-ascii?Q?PYh7wbjEiTJKr7H9Pn0sxfjhEKdctCaI7vUlamydjrkUotS1I9yXeWKDpOLc?=
 =?us-ascii?Q?6Bzw9ciXuplf9ql55J1sPIqhCl7HpioOv41QjNrpReDA0VW8X/m83lZq085Y?=
 =?us-ascii?Q?pMTH3cxw37iNa5pY2DEdQ3j8P1+rpclSGG9bjWqa5t1eDS0jIpT7kvwpqmX2?=
 =?us-ascii?Q?3fXOOwAx1XQsfpxF+MXohvhU+H2XWzAc3AweeT1t7TAs4UkZXg3plUBCq0hi?=
 =?us-ascii?Q?yllckGZEvH5gw7XeE5eQ3FIRSqlyymqJ7zZabUUOkq08ca1CppMqK4spcUEc?=
 =?us-ascii?Q?YYyhnfWEFqHetoQ3dijjP6sLYQ+jsTRzfMfiqdTs5qywnEslcF2v91QuI/CO?=
 =?us-ascii?Q?xGaxabYbEDiuG9EKp5mKW0ep5RDZ5+xtxhDmOB5r2mwMKh/Qebxyr0iyLufA?=
 =?us-ascii?Q?rywpzTqNIA3iS8fzS+Pz244LoGKEzny4rWOGFXpxXSmT0pcFdNTmMHSWZd+v?=
 =?us-ascii?Q?G/1vyI2sLTTAJ2yklThvdhgORRC62rAsTAJ/WSoDfHLKjyV4IUxzFWKtO6BL?=
 =?us-ascii?Q?wUvETzkrO25jTTLHfN2iM01TAmZ0zUocXsk1yW8IMk6ZvthXqSe45lWAoy3w?=
 =?us-ascii?Q?PPHMlXRLJdHqjYsSADHy4cypaiY60F0X9sIGOJAWLhnIaxsfiJjFF/8HKCbL?=
 =?us-ascii?Q?juhFl5vrgFcw1HqdDHM5+PP0S8O48dNwYmtgie+OssN7PkNoqe3izaXwBwQf?=
 =?us-ascii?Q?cutxqrsmwZkpqZSobiJGfFHIfob38JN2mQHLs66tm8riMBEVLVqxl3zFLJLx?=
 =?us-ascii?Q?MEi0eOdDi7jesT6CU3URCe3mcO9tG0+8F38cSc2PhHi00BARNl4OBTDOdlka?=
 =?us-ascii?Q?UFQo4bEpbAipyxf+tfaUoVxhyBeRiWOJmn1ceRmQinr+jEPXc6Zu9/MiE9EQ?=
 =?us-ascii?Q?BZbjIuYtlYuziViDenVN2OeTzKCHyVne61Crx0elRujGSgfskrp5xyIB5gU0?=
 =?us-ascii?Q?RfUSnau0p1kuYITqBqYdZRN+rt3UsyNYCWvMVjV5QmcyIQMTQluumQYqJ5Mn?=
 =?us-ascii?Q?DBnCLp/4g/nJbwe+jpvcUA17d4yn8KbNi/kWlXUXnbjkxmbpKvxsr9ewXFSa?=
 =?us-ascii?Q?p4tmPGDhvYn6nWWkRqfKqGZLt4E/82rUPZXgYDBqitBKLH5WQwjWIJdVGUR6?=
 =?us-ascii?Q?zpNvbfNXnZWuy57QFOgyYkdwgqpmuojNa0GviMoy+XeLy+8lto8FPhKdLWUY?=
 =?us-ascii?Q?ujDe69rlM51ZdhnCyCEbizAMh9MWISkXlroGaBH+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e47d5b2a-2960-4dfb-3be7-08dbc12d3e1d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:47:06.5419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TKRurhTb1XqsswAITmLBZcF2XJ4QNouPyiC4t1prxnKhTjEtCNF0GKYgvu5qqmz9E/q6INlizsxmxQ0tDgP9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Fix array of binds
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3a761608bb68..e90f59d6da55 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3179,7 +3179,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
 
-		drm_gpuva_ops_free(&vm->mgr, __ops);
+		drm_gpuva_ops_free(&vm->gpuvm, __ops);
 	}
 }
 
-- 
2.41.0

