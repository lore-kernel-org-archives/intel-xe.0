Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9559C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 21:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6508110E310;
	Thu,  9 May 2024 21:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeFoCWTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77210E310
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715288650; x=1746824650;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Nf0E2eNEgRxieQV7xqepIa95PmLECYAj9AdvNP5H1MQ=;
 b=KeFoCWTOU8tNn3kVXN+ysciXjYFNmhoPjGM0sV6LMhhddi/dfYJznWfu
 FWMpTQYpNzgTlrJ6AHsgAVd3+o17XYR+ZFg84yMjuGiQ3IyrpIur0jQlq
 sdlpzalPaQwoU+nCKoN1RCesaQibqLmeTJ9xtaQwl1uO1MzkIqinP0Q1k
 QNY1xJUvgwQu9iJPNj1HsP8TskBYVJ5x80uX1XBmCV+S+0kMdhg/PWLFF
 2ylX00HH9xUIcRUtZE7tXCfH/Dm0ePozMIsnekcn4hJBF5YHBKWsE9BAF
 VPDTDJK2LqcR900noNkZucwNLHNevZwW7K/PI+q2oF5pj2aTvNxCtMErD Q==;
X-CSE-ConnectionGUID: pSoWkOsQRNmeXMNq6q32pA==
X-CSE-MsgGUID: dDLQ0KxCQymnnuWdskk5NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22647784"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="22647784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 14:04:09 -0700
X-CSE-ConnectionGUID: xqBdXVi3R1WcT7eNCeTS/g==
X-CSE-MsgGUID: /Rm2hGWXRlym4fLG0nOVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="29763427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 14:04:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 14:04:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 14:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMnJhCWfODhrL31zeXMd3ORySRr0EynmqCKzs1lTtW+YGzEWQCb8p8E6A3zS5NQbTkx62I8AH+WGDzACuB0ppmuPP61tq8ElEhLma69RdQvf2NEtE+YsrPdt02hShF6z6SwY6bqvhwYMVn8dFfLNkzWRbTNARXSNsNA6bg4zferZZz58ngRwJirOecqumx3bkPO2naFrsXxeBtKiU7ZkGiUJ3WEOTDSQiF+zlxkKHYdzpmRc1wWXo5LNreSAjEPSSFYiJTHbi/Dnb5Ho7mHnYdJD0gfPxLVU6hHv5GMUIptLmWXt497sb6YboF8ve4DCMaso1oDB6eTyOcFH3Kwl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02csHniVS/NtOlQeLaSaSQSiiB2ZSrR0YCjWh5ybe18=;
 b=kbzv5duh0A1VNm46enEhobyTvBGRjJnr9ZDYxfp/9w4GMhhmpEvMoM7l/Vn5Eg6V+A80jElGBa2JWGiGEsLR2JptDS1GNnzzk5VsxdpZxVCUByuyJD/HMTPDSZiUxlJSgsGvH+3dEDR/8HeRaml/wULQs5tZxMwbHmVJF0K1Ww6ATPAQzSTiXwSlVYdg9f3To9VzX4uGTarmfmeW7bIQqgdl4vlvedMvmigpTcSvbhIfs+PGcnxJyV9wd9Ib74VXkmMKuL0NYwfwiSmz/T5AFjYpFfsU0GXvcP67FSpw5NRnyvbA9Zclul3G6ked6tO1jobrvBDWhAVM6REjbvvmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 21:04:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 21:04:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_pm: Update runtime pm conditions
Date: Thu, 9 May 2024 17:03:58 -0400
Message-ID: <20240509210401.519062-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: d2338b70-b852-43e3-3d91-08dc706b8fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3XtvEeCYH292HPaf9e987iGJVZBv3UGSwJE9KVEFWWv3Ozk2ItX5pHSoPcXn?=
 =?us-ascii?Q?MsaJe90tKFXH0ISORKVjDxiliM+jkS63P1Ez4cdc9d5SpljQTAxAzSwBLDFS?=
 =?us-ascii?Q?Xlj35ajRKlbQoXYdMpAzcNDchR8pRfCpQq8Rq7njQkSHq1yC/TWoRvz135kL?=
 =?us-ascii?Q?0PU5z/1uUiESREi6lgzNVVkKHWM6SX1X6F1z3Qp/h5WImn2qq6N9LSTnbOJp?=
 =?us-ascii?Q?2Q1gPqHkc6fqtEBufycP1iKYi/Zi+ZpooXNPew+tZnGJ5yxaz3wRBcdv0Oej?=
 =?us-ascii?Q?CbKNFQQEIKwKftKulDuMkqjDYE4OEoTMIY+C6TnzLgvcO2UjHluH+y71T9xs?=
 =?us-ascii?Q?o9tqfmzqFkuxCA/TpXhvF+rJAp6XfwdBxrUg0dneArhQfhXbV83T8JAyeaw8?=
 =?us-ascii?Q?Z3mDuyKPfpZDcaHcf/3ugXWmDgsFcL4qIriPmrasjFqTwS3Xxkwai719nPcK?=
 =?us-ascii?Q?w0WzDlhijkCCYzYiScuzkBxqBvZbHtz+yyI2UJo1QIJ8b3XzSsm+5/jwJpIf?=
 =?us-ascii?Q?JSvKmENAC0tp3UktTaRGuUw9CkIH4ZsYqrDGq1jMtxRjwdKS92FYjEASCraO?=
 =?us-ascii?Q?NpCYi3oDidSb4U0e5NNJL0C3/HWr8mm4LfK1CKhbXfy37OUhoAC3zUFEU6Al?=
 =?us-ascii?Q?8Za8Aa51Wnk98HKBdMoPUa0EI5Q++FJBJ/Vckl3aARIiwy5YB2cJV9tHTTXI?=
 =?us-ascii?Q?4UwMj8zTTo0ZeP++TeSfGQDSC6v/T6f8vkxmd8sicwOm7AJ02kK+cJfugNvq?=
 =?us-ascii?Q?eVquD4tffB8phOscVW9gNz5xjI7YHh0rGUDfDN7rjyJexl/vplyDCzoN0cOY?=
 =?us-ascii?Q?aFqN0LMvitynZp7y7ZC3b5F7t4Uri3cAsiea7dEtzZd2WtUT3TOsucsodi37?=
 =?us-ascii?Q?Q4xSLIVwXfEDLNiWVFg92gq7/mIj0dftBMedtA1jxFU28kvB3/ne4xF9oQLU?=
 =?us-ascii?Q?j1eDdM4lWGrYzdnZgQ0Kvo+y4T/pA9/4d9r7mKPPJUrMhP/dXejOUWDa8/W8?=
 =?us-ascii?Q?4uOJ44supmZ5gm0h09j/jyBQEJxBPAwuU65eupfCqfe1CLU18iaS8EBIz5lw?=
 =?us-ascii?Q?5emsYIwXK5T8OCQLVWMoEUzgy3cWsfUKMAaEJ31Ylcmd/gchIy0cmojMBaj/?=
 =?us-ascii?Q?fejLHuf+QS/4M1ssd3HTT5ET3foyU54HVrTpOPmXtXUP6iDncnZL+Sxxep00?=
 =?us-ascii?Q?6jH4EProV3KTBmv0obPcpuU0uTLgHP+MYSCiaVaX/p1pY0Ba7mYUBODAPq9k?=
 =?us-ascii?Q?T+HsWu4Yd22Ve5i1GAgvOyBWoMjTLBkDLUkoh5OsjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ftl8Wv9gdu13gGr0oMD9or9BcjFDAPuWYU8jba9MvvCTth86OFdgh1zEZ8FR?=
 =?us-ascii?Q?s8EVNoGgAEyoVruSiDbac10VfarF1nNeW5qpINwQJeLv2DULh+JQaNQ43phC?=
 =?us-ascii?Q?iwykGPKAEsnZeaqt1Y2X5De9NwlTCdkG1TXWccs5G0G4wC888uwxzWy/gMhm?=
 =?us-ascii?Q?wWLnh6TCGQcr9xY7G97tlrykqr6SkUoD5NBTHMvlwK5Sb43uPhy6rA3G780n?=
 =?us-ascii?Q?HPPRyf6IszLUD+D5ZlmWPdUfB6lW5L/cK+Y9h8MRJvmA/3DHdRx9gF7FRfyR?=
 =?us-ascii?Q?mjIMtaOCkESjrnDCIeVt8vDmEu3w4pnijOf3fuPe2sGxT/010mFGsG8Yezqa?=
 =?us-ascii?Q?//Zf07+AB7l3ERe3f11dfTjvtAN4slxUzEaw/kMDbVUtKM6xsVyifA0isMjN?=
 =?us-ascii?Q?Fpc/sB+4oa/1mT/ebC41NOlX4CChUusO20MbXEAuwAKs1RSPo9UeQ8fYEe0m?=
 =?us-ascii?Q?/WE8/4qTb1XgAHzUwZmUL6ZgXXIra8hcOTrv7Zkjc2XRTe3VpvzSQ3LJeFJS?=
 =?us-ascii?Q?MD4rAswJ9Bl8N790n3HvkGTx2eZXduUiSqA9oAL3p/42sruxH7fl7zZkt8yg?=
 =?us-ascii?Q?bNmm+tm7M8cQP8XjJrukYViu036iQxtP7/IuMQrQ7agB/trKUg0F44I6FniT?=
 =?us-ascii?Q?rtxWkVL36TUOpFsdyqeATjoECP3vfpPMZEDqgAOqNCVEzZMPDgGDV0FywdIL?=
 =?us-ascii?Q?x5ydugS3CerY1jxFWZWXftvHPOFsAMqiEVv6PKwn6kmuQJArl0guWFOFhi7E?=
 =?us-ascii?Q?ACI7qsZ/CKnL9QX+Djtlm4omaGpUCcznINnGVvo/Cww3GVSiuX2gePyOa6z3?=
 =?us-ascii?Q?kybaQWeRNVPVHliIpNG6zV7DUit/BEawyRYwevl+VWfIlpu8JlTgUIZ9mwoe?=
 =?us-ascii?Q?jVadMmZ3OJr2YNMfQ3+HKJCz4RvbiOZ17GZP5BF8FEEHPf83MiZnCOBraF4r?=
 =?us-ascii?Q?ukJd0vM+9ZwPDQCIiiQ1OwdEvweOhGKWxzdYtgUFCaK2tyzplU9ERYrfdD9b?=
 =?us-ascii?Q?Gj/bNcOv404qL9fF14DjGm/vdosX6+jYtdReFnjuCuVPoEh1upHfD9YcuIYd?=
 =?us-ascii?Q?GG5/wQ6kOi8Xg3YpF7W1bkYS+EBfQeQHNMiIzMmn74J0OZd/f8UAMUUCBS49?=
 =?us-ascii?Q?oD5kDSAuLBBM4tUysV41U03CGY61XELHyi/YrxsEFE8qeqwUhEkkI8LMcaoH?=
 =?us-ascii?Q?He+2nx90usqiGEBWXY03FQKMWHsYNJbzpZY0NXuQ+sTWuuJ5pjaGDD22YmHP?=
 =?us-ascii?Q?zLqq1XXLIIbdaVbMNl07YKYXuTyF1VuyNiHxxNuTDDCUmAkHDANkj0JInfZ1?=
 =?us-ascii?Q?pIxySSB1Jpqdy6+K9Emgsr0ZLk61XvI+ehLRMNkxbHw6w1jMgZ/rSMSFztZ+?=
 =?us-ascii?Q?Rs5fsSWRcjUs4mDc3nyB3nTI/kX3MooRRKCB1mDmAQhOku2jPPfk4r4zaQIa?=
 =?us-ascii?Q?cgSZINQXWfxXxOaJifSRzsYj+ab//JA2Brp2P3Gl8/bPAyIFI/w2bmPjRSa9?=
 =?us-ascii?Q?KTO9qgidRRuhcuTReq2NbM4wE2Z3gl/GisIcLKHKS2GuWUv8VD8EoQtoKtKi?=
 =?us-ascii?Q?uNWoJsI01jMvj8ZTqcdSrL5Z3UlR3gfDg/yQ7ynYXnyTrJu/KAC5er9NicXr?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2338b70-b852-43e3-3d91-08dc706b8fbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:04:05.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrl/m2v4FBauTFR4P7qKrJbOK9miE0FqwpulKnyQWDf8GTDHV2ymWMnuulOtd35TCvmvFnpLC1EfOQqUAI+kng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 18 +++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..98cc8d969 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,24 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..b71f7c440 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e81a75d88..3f963bd9b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b, active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -459,15 +430,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
-	int i;
+	int i, active_time;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

