Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70220C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276DF10E81A;
	Tue, 14 Mar 2023 15:51:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0B110EA90
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678809117; x=1710345117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1Qn2OKP/4XkdgEwNgDnHDybdVxllKnprdt0eD5KWriY=;
 b=LRumxfrJZqeVRL/bDl18WlO+og1TMrnuFa2lEfuAXcsEPK/CtfY2WlyR
 GC+P1YaWGuaXYemJ71Tvvo3IkKl+g1SzAxz5hf3T9hWlMlNXL7Xr83oZS
 a6wQgJiBKgpYtRvKCbAchu9qspMGH/bhZ8YR+DMm95WNswXWBnDvyrpkf
 udn0S15Y+dE15xNODIXpbsRcq+CytauxLr0JI9T1Vi0miT/TJfG0R6SIr
 WErs1Z07LdxEv8o379uKIdL21Cw7AtVueoBCeKRIzub3KV4agEwncwM9t
 2w5//TYbr5FnOcoYFpAXcR1Ydgg/KxR2I7w+DqkmY/SHV/xfCmMz+mhT5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339007850"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339007850"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 08:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709332795"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="709332795"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 08:51:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 08:51:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+k14uvauyzX4Ve/iCxbpd0hqdSTHFXwUU+BM4edO8Q4+xMGPuZiogHoPsexP0pV5oVoeHc1Musl5tQO4uEoV/EIDG2shiwopEKeaZG3sqxwjFd5VLlsYW7sGsVcdqTMxbYbO+6hGEiz1V7iPbrBgkxSseYwotL7O9oj3j9WjSreC7jEFCpXtEi0BWGlI6hHdJxI4dK6DFihhliLFnDKVVfLnEvoXKN14hq7I8mzAfSAj3b7Oo1CTiwd5ac0fuyZGxMm83NGNOjG615kewiQJHahwy5vT6JARdQPiDIhDQpjQwMBj5SsHk4/ulkktIA9lmrNzmmIIHa+RVLqYSPV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnU7mCqyVT2vbkV+tEgkWQ4w3avTLvWq1tEWQ2jxQDA=;
 b=V23l6zXQxSow38ubSLu27BZTFC20dmPeqsbFwyOs+p03J+FXl0U/SUQ92VAW0TXkwyj9im9IeTL6REui9iMlPU4bEANRljjp7g2Hm0SpCMNGabhpi0/LM6jk+zr4bpuTcq7lVfybg8wE+wps4UdNc3Re4ikEH1CQHF8XOYZR8q1Z5pihYUnBdp2EDOy33X+CwgB8GuqQny3iggFNsqD7V/fp2n6zzhQPcsEL6MOmF2O5YMx2Fd22dizcd+i0+HJNDdv+pdm/n+elRa+sE7Gc5OHNgk1FmygXDFTOdfpmOl2AYIOEBrLJ0rZt1L/kUDSNqiXmoMsthp6RaTE9qvOJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 15:51:54 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:51:54 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Mar 2023 16:51:11 +0100
Message-ID: <20230314155111.1546283-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314155111.1546283-1-francois.dugast@intel.com>
References: <20230314155111.1546283-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2e823f-5658-41e6-1ec5-08db24a408d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+oPda0KyzJkuW6ED5wn3qvoUst+yY3Nzu4R+oqh8KTIDaj14D2VHMJu6erIUviTzBlZAyW+2Ho7v5jyy0sik4T2YIYYTk/nzHGrMNZhp2ux44GA+mENlnBT+3Osb6D4kVTAgU2DVX0+Gbt7VTvkPqaf+nOFhuAI0ySfB/qgLVk5TJ/VUS+9AfYHkDxJMp+Nd+ZAyzD7c730zTvgZbpKJFy56JB4CI38CgVgFYByiQZx5PbNXjY0gJaJlfHICMhvBpr2XUai2ujK8ABqDS0uOUDVBNLUp/CKoQ0h7vrXAesODgBi1Bd/PfI0UwGWCLNFzF09OpQFwQa3YZU8ghfBoELfEx0tjOnlU0u7fM9vW0vilgsMdzsQ1EkzczfjXsiEloxpaldCeme5ZwXSLoZq+SnIir/2hkLB+KPCc6TrU4Va1wlDW8LbdNrHUG2FdKAwGaPr83L/CahN0WBtGq9AccZtV0sHA/010Ram0Z23A+8du8mFWCyS2ZnJgddakQxN//dsz7Ds0xAqbJFnyDXxyqduMHRhIWRlKdeF0tXJfB6xU3jXIxrHKCXGzb9wT1G0y4fvk1RwlR0m4UOHG9wV3oOw9RdHuJm3+7Zjzjf37n0nY6BBv0gmqqh23V9eXhHHOU8z7RE29L5vvboMnMybOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199018)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(66476007)(8676002)(66556008)(6916009)(66946007)(4326008)(8936002)(478600001)(316002)(44832011)(2906002)(2616005)(5660300002)(83380400001)(6666004)(6486002)(186003)(107886003)(6512007)(1076003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9zR2FWT0UvczNQUVZBNWxHOTlneFpKNmVpZC8rOTZWUXhvajNPVUVzOUNo?=
 =?utf-8?B?UGNGejF3akFxbk9LVUtFOWFZak5aQTcxQkVzQnlZejVLL3RaUTVBTzJyYkhz?=
 =?utf-8?B?U3RuVGdtc3hYNmlrNFNKaGFyb2tobVdnbnB6UzIzZzV1Tm1taFpXVEtGZ2Vp?=
 =?utf-8?B?OVlMQ2xwUWN4ZE9ld3VPTkl3ZHBmdTVCbzBJWEN6c2JmVUhialJSMEVuMmZw?=
 =?utf-8?B?Q09iNjhMVGRjZ3puYUNxZkVBTVZIVnpwM2Z4UDgxV3JsQ1pveGE0OTI5U3Vu?=
 =?utf-8?B?cGtQQmozandHYmZtWTNzc2o4ZkRaQnhjRFQrT09DeFB6Y2ZJYldlYXUxMWlx?=
 =?utf-8?B?RDJ6VFNBMDVuekNBN0xTZ0R6V3lsWCsrQ1kreTR5QjREM2pSeDdZNWV0c244?=
 =?utf-8?B?eGRManhDcHlVbUFPN3ZkRk50OFZlYkxZdkxDSUc3YUM3ZWJTZTRhT1JRdlQ1?=
 =?utf-8?B?V2UxOHFTa2RBWUtlZE9hdnhMR2NMUHd6RFlkQUZVNzlTd1NSL3FTTkc5S1dn?=
 =?utf-8?B?MzRrK0JtaTlaVjBQcllyZXQvOXZPVjYrdmtYSEl5UVMwYmVaVmN1Z1dLbUR2?=
 =?utf-8?B?NWN0QnNVbFhrNnpBZnFiN2szYjFCUy8weGpLVDZuUDlWRGdoTXZMd3lpaVN2?=
 =?utf-8?B?aHJjSkUzTXNGWmpKRUJWSCsrMmpTUk9KWllTK0xEZjJHZnJqc2xQNlBTdU9k?=
 =?utf-8?B?bi9hOFkxei9VTDRSWWlTa2I1cTBUemlPcy8ySmorOVoyZ1lFa1ZwNER3WnJl?=
 =?utf-8?B?WnpnZE90T20vWTE3K0ZXR2ZIZC9KLzg2NkZ3WUdMcnhSV1VKMTJVUjdUSEZK?=
 =?utf-8?B?YzNsUFRJVUV5ZmwrMGRkamtpYVJlSWRabmZPazFCV1lIazVwUTkrR0NtR212?=
 =?utf-8?B?Qit0d3hsOTZrcDgrcUJvMHVqWTY5ZUpvWE0xTG1xVDhWakVRNVlxRE9jcWRT?=
 =?utf-8?B?bUJSQm9CQm02NDFzQ0ZoWlZYZVd0blRqZUg3TnJFWVJWRUErbTM1QmtaYjRu?=
 =?utf-8?B?a21VNDlEZlZINjBZMHIyNldleFE2SFpNUTJrUjErK2NJQjN4MHhrSnVHWEdS?=
 =?utf-8?B?TUhPVTNWTnZIcUcwcjNMRkt5eHEwajB6Uk11M0xoNHBGZ2VaTnVwRzBjSERD?=
 =?utf-8?B?VlErdTYxMGl6MEJHcHVKK1FIbWFCUnh6QjVqc1UrMGJyeGlQZ1F2ckpoN1Bv?=
 =?utf-8?B?QWdSYnJqR2c3TFJRM0ZtQmVpdmRXQklJU0ZHeksyL1huYUNUZmJNQTNKZll3?=
 =?utf-8?B?TXYrcHpIRDhNbUxJWUpwYXhlVnRsWWx5VTBIUDRveWV1SG5vaUduYXFkend4?=
 =?utf-8?B?ZkltNmtXTTl1L21tN1hzOFMvcVNPNmxwMzc4UTFCd3BiSWJuV0lhZERJVmt1?=
 =?utf-8?B?ZzFnWXBtZjBOZWpDNGlvRXpTbjIwdDdocXFkTS9yYXl3VTU1N1hJOExPWGlR?=
 =?utf-8?B?OWxvTHo5ZG5rMTBwSEJiTTdrYlpTaXNaS2R5TkR3dXlPanprbnlaMFNONXdN?=
 =?utf-8?B?Z0RGUTBRRnhKSU41UDNxQ2trNTJXWXkrZE9YaWllZDV4MXhRbjRXK0xGbUNR?=
 =?utf-8?B?Zk4zVEtiNEJSM0YzVnJyK3hweFBmcTlNSi92Szl3V0xkaXB1UzVMQ21qYW9y?=
 =?utf-8?B?L1FZZGduUWprWS9xUVBPWUVLTlptS1R2NFU1SVZTbk9iTGZCZ3BvM05xSHVj?=
 =?utf-8?B?elVFRVFsZHVKTEJkcmNHaHl5QjM4b0QzNHI3OVZka2lDL1lNYWlhVlVtVG9X?=
 =?utf-8?B?VnFBM2hzVC82L2hsSVQ3UDdIT0JsWVJwelpwLzQrVml6emZGQy9XakpvYmI1?=
 =?utf-8?B?bmlFUkZLK2NnWmZ6RzJVSWszRzNlZ0VpcXB2a0RQa08xUzhLYnhjZlRSd3pq?=
 =?utf-8?B?eURWVFlENy9aZlVrQXoyV2d3ck5sRGg4STF4cldjOVNWa1JuR2ZIYi9NeWtQ?=
 =?utf-8?B?dmd6VDAwT2lsUHIzL3FYZWQvNXRsNElGNWlxRE1od2MwRyt1cTJTTVBtR3NC?=
 =?utf-8?B?a3NZdDlWVUUwOUU2RUVQSGQ1bS9PS0pmOVVjYnFmMG1rYVRCbjhOTHkzMU80?=
 =?utf-8?B?NW5DWDRkZkJMNTdNZEdhbm9aMU16Qm1JQ1ZSVHJIR2VhS1hxOTVsTHRXMi90?=
 =?utf-8?B?MEJGaXFSdU5yalJlSkYxQW9BM3FkNjl2OWFsM0l2eVhKbW5acUg5S29EZHow?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2e823f-5658-41e6-1ec5-08db24a408d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:51:54.6156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0vqRNI/jliuum5BFBXSv3xMO3dCZ+68lvz/88BDM/aWWywK2/zUYEOCe942Qj+gSb8sJKdEoT2/q3Wz8ewEkAmuWyG5FNwR88JDx5SH6tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v2 3/3] drm/xe: Add platform specific
 functions for a new platform
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

This shows how platform specific code for a new platform can be
separated and maintained in its own file. With the use of function
pointers the modifications to the common code are minimal.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_gt.c             |  4 ++++
 drivers/gpu/drm/xe/xe_guc_pc.c         |  5 +++++
 drivers/gpu/drm/xe/xe_newplatform.c    | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 6 files changed, 47 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b94e65c91101..f5344f028c6e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -67,6 +67,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_newplatform.o \
 	xe_pci.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3b092f951378..92362900825c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -30,6 +30,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_mocs.h"
+#include "xe_newplatform.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
 #include "xe_sa.h"
@@ -390,6 +391,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 	case XE_TIGERLAKE:
 		xe->gt_funcs->setup_private_ppat = tgl_setup_private_ppat;
 		break;
+	case XE_NEWPLATFORM:
+		xe->gt_funcs->setup_private_ppat = newplatform_setup_private_ppat;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 71d48148061c..be21524b334f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_newplatform.h"
 #include "xe_pcode.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
@@ -913,6 +914,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		xe->guc_pc_funcs->init_fused_rp_values = tgl_init_fused_rp_values;
 		xe->guc_pc_funcs->update_rpe_value = tgl_update_rpe_value;
 		break;
+	case XE_NEWPLATFORM:
+		xe->guc_pc_funcs->init_fused_rp_values = newplatform_init_fused_rp_values;
+		xe->guc_pc_funcs->update_rpe_value = newplatform_update_rpe_value;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_newplatform.c b/drivers/gpu/drm/xe/xe_newplatform.c
new file mode 100644
index 000000000000..d69901addcbb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_newplatform.h"
+
+void newplatform_setup_private_ppat(struct xe_gt *gt)
+{
+	/* platform specific implementation */
+}
+
+void newplatform_init_fused_rp_values(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
+
+void newplatform_update_rpe_value(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
diff --git a/drivers/gpu/drm/xe/xe_newplatform.h b/drivers/gpu/drm/xe/xe_newplatform.h
new file mode 100644
index 000000000000..7c7a7f53c930
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_NEW_PLATFORM_H_
+#define _XE_NEW_PLATFORM_H_
+
+#include "xe_gt.h"
+
+void newplatform_setup_private_ppat(struct xe_gt *gt);
+void newplatform_init_fused_rp_values(struct xe_guc_pc *pc);
+void newplatform_update_rpe_value(struct xe_guc_pc *pc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 9239c1329941..1866055fcb52 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -18,6 +18,7 @@ enum xe_platform {
 	XE_ALDERLAKE_S,
 	XE_ALDERLAKE_P,
 	XE_METEORLAKE,
+	XE_NEWPLATFORM,
 };
 
 enum xe_subplatform {
-- 
2.25.1

