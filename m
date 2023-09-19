Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92E0CD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B2410E28E;
	Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941810E3C8;
 Tue, 19 Sep 2023 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133591; x=1726669591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=srr4cJr5XRXHeKv3dUTNSVXLDH55MJn3ON/0CVyQc8o=;
 b=VOHQ+XJ6MrMrRd3AqjXj8h26Ffg+Pt2zFc3qnrcWRXpjwXGNSRY+2w+J
 F9uUEInuMFH4POtoxy03cMtk/L13IEi2MXJKkv9bTYaD4NN69WmCPorf4
 dpZk9IzCxAffM/ZenJ2fhx0qh2up98+iRfusykwrqnFNhA+SWQqhBxN1g
 4L0PZ0qnTmhu28VbLpSnqBHWUt/ETACXQgErSVrFz/PVunJbWKto2kNG2
 GFUtx4yZbw2yTtDAlwWO24zUui/reUWxqX0CSBBu/QXsA6MhkZ/0RaNym
 pEWAxWtQUr7WQ7Yj9p5GESDhCBhd3RyufWVi4Xj+YEVcI+X/96kPKRNcR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786131"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786131"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319691"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319691"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/RE7eIzpwa0way560ihKyUg9qMCl7ORO7DRmSMEmtJJqMWUsZbDYIIN546EJgXOVCy8OqzyVO1WbPuv1xhqUngDYqcE2K6AySG7CpE5YNuJvpGekCY7+zFM86Jt0aZCB8vcvrvPxG3KscOXXKtXr9MNBdWB62lskMmDCbSkGD6phRlHiQMYorE9BCONrgI721XXnUnJ1CUecbz2mu/tTlI5Gc+8sWcykuUZ+Vqn+FeeO5WcDGbKkvmknKUhY63ah2E2zEo3CRy+MRJenup+sGKw7aaZzL4JcogP3fiJDR1Mxn16SoxEHjO/+Ut/WacWOd6snID68MSXRbczT5orqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaNiVOnNlnhulxM///7SMJkMtnInlZE1sOPBii66udU=;
 b=O0fGSG/udDpiJq4PX/imM98hSjDqonyHqlGxhWArOMYBgxFMa1rv8HbhGhH/uiCo4b+9UgCadof3pXnNG7mFDTcZEZ94yX6z8nMYtXrGz+q3fh5052tOpFoxouXG7bSlmVKqjZ7+B9Gg98Xs6QkskQwES1l1SzK1c06GhadiNie5nud+1sMjSLf9dcJimHzEeAMbE2pQbJZvlExRgfkC20FJOfFXErE6WV/x9T2dGZwdS7BzIF7mn1xec20cPXHZqRu+J6+WrL8UMgQSud6qQfQEAfZlyIMVk+HM07eGUQviYOy+fkF9JnsNm7alv3oRlgPGy10elQXGxdCp3jZMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:56 -0400
Message-ID: <20230919142000.91363-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1c32ad-ecdd-4a1c-52ef-08dbb91c62a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ck4NOpb/iODc9+j/fXjkJ1QUeewNjmCCG7nXh3Toitz4XhiVLf2YDG9aZQh6cz1eeypQJb3ABGFcW7+ukunqnqKuNVmQSvAexIe6J9gC+yecUO4Z+KdXcarLTEmoM8TjN7651bqoPU0PAdUNaMzlAu1bOzYlBp8y8z4toXARIZtFjarKJHs1Da+kFxKnOSFUKeH+OPrPeiVtjBicCeMilSV0hSueIRGtTEG0CWtM+hyaZTnTWrbZN+oswmAr+zFMkHJSIqFXyN6S2HJQoV8VEcd44hY6d7Izf5km78HziGcecIOi+kl1RsD5n43rgPXU6mWiJ5Tb5RxPDrnkSJrjNt2tzaH6OsSAcglXi0uiMlnzAnRYQlEbld64/230tOZtVH+LxJ7o+nuYXpx0yoM8/60rgQ6IxuGcWPBeulSEQlxghR5E6UN76RioXATckHkKbW8JeKmKCG2cDGls3pqxEs+c9vYz0SZA6knY9cItwye/MB0xsv/7AfeowwM3z2U2A8x13m/Yr/hvjtkXG4QzedaN0HJLe+UUqUciT+9SmdHOR+VQm60R2gjYXFAKqOU+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IBqgPusIchCaQO5T+wLKfZR1fYwBm3hi1/dR3DQCPMvIwwsJ4TCZg71HgvNj?=
 =?us-ascii?Q?uGZFauLqorvCW2oURAAptpC+7X5O16K7eNBwe6ie6maPslF+hoDBtSRGbNJj?=
 =?us-ascii?Q?+koLbFLw7ljK6nknjYHC2jZfCDitTYMUdl2Wx0ztfoW6m2wWPXuQ232R5zrV?=
 =?us-ascii?Q?RmHMpn1ttKg9q5syPxREtDMNuj2d9me3GQke9sOHJUSKjG07eYG9jKHStZGQ?=
 =?us-ascii?Q?srd6ikUkCl/KRbJ3u+xaNwiWp1cFKH8XvkraR63Ru5V3+q2fwCZXAThE/AaO?=
 =?us-ascii?Q?O6o1yLRuBdHJwPEct7j0b0yRxgJ7MC/u/nKv4/HjEAb87/yYHAnSQchOB9lj?=
 =?us-ascii?Q?dIji5rsDK3xQ5k0AP5DUUtsyP844BfGdJ5vCxxNZQZEcU1SQI0GR9YUocfDn?=
 =?us-ascii?Q?JI+ojgW95u6lDzJgCCu1LVaOfqolEhQN3PX+yJ2fMtQmJpwCVdPbJONkmV7g?=
 =?us-ascii?Q?Mmf4BJfStgvhn4jTgyCiNoIPl6WPk3qOtSQTO16/NsYEuVjUKy8n9T8odm6a?=
 =?us-ascii?Q?mLEbSCv2Q17Ct6DD/xR5y99rmYx4aoQaFiyH8J++Ub5jVbv5yCamG2JqszlL?=
 =?us-ascii?Q?YIVSejXNb/diTyapH2s0UfjEBKgGnL5vBuVCkjiiRK1G96DnQTfDXQqo1RJ8?=
 =?us-ascii?Q?eMuKH2ILKrRacjjrXSrvJn2DPrKCCC7nXH3yG+GHFbY7uzzBWd7W5tUemJRm?=
 =?us-ascii?Q?Cwf1kY5HC/frX4UxUmX5+1no7cumo/GvRS/Aycp/wO3bfW8CUYe+oExAxsuP?=
 =?us-ascii?Q?Ucd8iSvgSt5vLCMVG5Ntq5WjnCHiqmwaH01GKjmH8htYskc/w/4F3WrnpjDm?=
 =?us-ascii?Q?XoR3VwdGnpYsvBLiMyKvoUK4RC0n7F2a2I3VCafZk3yjqyC0shJxH/Q1aigg?=
 =?us-ascii?Q?5/SkfhwEHcQU88lLJ3d0iaAVdGi7pWQyOsnV7xGkTPcXDq+Lmrm0CQ/llcgO?=
 =?us-ascii?Q?8j/1/YEgmbiAKDhCszxQCIbvr8+be5/27EfHYU5x2Su2YCWD7ffpcvSRzdab?=
 =?us-ascii?Q?hwHd6GPNSWSR32nwbBcRHkZ8o1CEK8OWiTOYUNG0RSw7wBj/DMI/3VhUjr7Z?=
 =?us-ascii?Q?bgHBjX6FDgPSD7l8MoPz8/FK6+afKZ+f/YEmnT4dVYPSE50TiObmeLlWIS96?=
 =?us-ascii?Q?svpA9ln/QrivKw0Q2TPpqNLahTTxpOPpyMP6tLNnWZsSHShKwzoF/oh01liJ?=
 =?us-ascii?Q?Ivl21lSqQ1wTrDv6UEbvCZLvcefis0B5ZuKmeYflk8qIRlcR+5Ta7tGjYf+X?=
 =?us-ascii?Q?hnS8V0Yb5asXQW3R2debp2VmLlWSFocEkpvOmvja0q7pRaVjLtbJPDq1Ma2A?=
 =?us-ascii?Q?v7DlkvKNr8WLsH2ll35N+SXDQZLKw/vJKY6jI31tO4Rl6XUS1LK3ddMdb3sH?=
 =?us-ascii?Q?zBHRz5vz1dEJkThAptsIu7AqfRW9FNdy7UH1OYgM6bsN0ijtPvIXIuzVBT33?=
 =?us-ascii?Q?3PWB2DvgTariQzCM58vOy/+1MP0dwjCmxWDKDhCeaJE9jtFJR7l8UyhFnfmQ?=
 =?us-ascii?Q?Pbno4jcyURVyRRUy7kOMfReuIsRraF1QOm8uYI+QySFjbZmfUloGKVC8dwMc?=
 =?us-ascii?Q?9PEH8vrnI/JJmRyZ4daByQ2cFvpHgf2h064sgHBZOXlPkLV1O6uK9Q4s4lZf?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1c32ad-ecdd-4a1c-52ef-08dbb91c62a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:17.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA+Zj24+VZN/gYwO/9/l5eTUO//hYnlxUBPfeSYJk4Y3Fw+K2RvRu+qkGBki9Obm7eaP3QzBxSajvUGL8EQ+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 13/16] drm-uapi/xe: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with kernel commit
("drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 4 ++--
 tests/intel/xe_query.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 69b62e84f..9bef90b1f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -330,8 +330,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index e0d14966b..17215fd72 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -380,8 +380,8 @@ test_query_config(int fd)
 		config->info[XE_QUERY_CONFIG_GT_COUNT]);
 	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
 		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
-	igt_info("XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY\t%llu\n",
-		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY]);
+	igt_info("XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
+		config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
 	dump_hex_debug(config, query.size);
 
 	free(config);
-- 
2.41.0

