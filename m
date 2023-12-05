Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD4C10DC1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDB910E37C;
	Tue,  5 Dec 2023 01:33:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC0110E37C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740015; x=1733276015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=glk68Yeug7X2RgLnRVhxjV4hkPk1hy/p1Oc3ntF9D5U=;
 b=l9jY+dPsIBwyJ/P2QT1zLAnyQHKEepfoboBeGFKaeHMEqm5JYh/xKnvu
 z3tR7VJbSGsA462lzwMjo0I/IKYNEZy5CpeiGJ36m66I/0k8FC3AUwI8Y
 +h85Lx2clhxxaJZKvocFPN6MfltIEw7SGSGgUGflNLq0azaA/57uRR0PQ
 Rn3ZUTOCg1KNc7eDQtLr0qbSaQTzpegPMKvtTD1NJ54c2sKnEVIdCar6g
 3YCayUjB0B7xcWSxOsnoZHcSt/U5quWb1qOUdSuUV7YNjplBvdn5FRWup
 BO0ljXHVGw7k0wts5/0d+KYxFB7h2JoAw2WMWdZzFiuVow1IA09mNI9g8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723569"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723569"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035876"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAaoiyd8Bjp4gAFYWQrlhCk3mxazadAIpTBaqUdDfVdyRZ3TUTNPftZJvIRMBroYl7Lc8uy522kx6RhYPpmK4wCuofc9FUtEAB7sixSJ/tNSvY7L7v2WtnpjWbX//aoMv1G9uaddiXFjazVZFJm3B3Aas42OtnYRDoz2jlf8QuMayeo6NkCs7DUOiRGZZh3VigWTXZLlZsh4mL8Rc7pdS+0ErsPvPjvc93b3sJat1DR2+VMXLU5OCFzBNoPCAoHv4vSm5wSzjUMKdWonPmk9YfmSYDOUg3KvR3AbBvL20UThts6CDIKFS3x/hXr1oTWDvNj/x8Xxn9zgG0QY7hHehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nb0454OGHROzO55+vZ1Q2kbVoTfCc7nYNDok/v8qQLw=;
 b=GNvtsnhi4qYFJMsA8LSfs7FMhmRGtsqYmNatpLe8tA8RREnJqmoZGSgmwsY/S0IOM8M7kjaURSANVWq2kYCKR/z1b3jWe7rjpsRATU+aRRd5dmA/EkcjB7MyBhwGgjiYYdI559v/BPfpyKa0FuOqSfuZESIdN0nC4I/FyzgLbtOhfduPkndjvdAfYiBIUGjgHPdpvKsvxX4JfYgOc0MG+8wi474PuROTbaBBVqxGhToVGTiHmggCrR00LSJW3p6rYmUmDOuRWGmOX6xCVWM+FbrOPYJuwsL8l1rDf9CuUpvkPRQN4mk44N09OqAwbrBT9c7GzhUcaJzitUaUZqkzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:00 +0100
Message-ID: <20231205013309.1497006-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e8d2b7-0fa3-453f-eeeb-08dbf5323015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2vEzlCqwIic6X6nM1x3Y4O48xsHwypI2crz3ceBowhStSYEe2a/h9kYCvgP4B6e53UJHDoO7l/bRHB686G/TP0Vd/khRlQPO4Uk4ZZIFL2Jgd7O3I8jGHJWFC7vlOPwJv9uLZF7IL7TgHb69P8hlM4YvZLFJSmp1vb5CIrUjCebGBhnaoOAOvGx+fEDdOh7j10pXM6NEuqTEWzm5herWDwc06EMReTMhqUnPqfDNrgYPJDogK/hY8XYkdcgFr3jGfQWO5dJFXOYnxetKJow2/NBNOlyzNSgZyuXgOfxpAYYsTu7mgLqi962t3V9E7tU6ceVVaRJozziLvpytIH60/efB3+5iTzI3XgFflFAmARjr4ZMet6t+KjQEoMFPFusX+T2WfPwHOjwSpOUFGOGAmsQilwVFKKLKg7iEae+BaS7MvipoFFek1kl0kU9bC2cbtzSeodZxNp/pyenlOh/e0r6JcTJV3ZEezF4qkVGy7sviwUfK9EI2g49QQPbjNK03SicT3vD/2bbm+kOEhiaovTYB4jflAjJ+NZjuKPjXVx65wxyjgNKBIWWmmOE3KUb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RUUDR3aWFxNjBaY3ZwcTdVZDRMdGVxdVh5M1FpbjBOYU9Jdkwwb2dTZ0lU?=
 =?utf-8?B?VHBuTzQvMDZ0T0ZjU0VndDltelJqUGx0ejRJZTlWYmR5T2FSQkljcEt4TlJL?=
 =?utf-8?B?VmMzK1pXMHZXQityTmcrV2hkclZOdzNUU1FDd0tnRXpUUFdIUWVQc2tVb3lO?=
 =?utf-8?B?M2M2ME1DVHA5OHpIL05SLzZnMStoblZjMEJNL3UzcGdXMDl2TFplWHJXMkxP?=
 =?utf-8?B?UHdXaGZQbGY4a041SHI2MzZNSEFFdG91cDUzd3crejVOZFRXTmhCd1Q2Wk9P?=
 =?utf-8?B?MFBUSGpoNTFuc0V1V3FjcVViSStNSDZ5cHZwQUc0NzlCay9kL3RES3VUYmhV?=
 =?utf-8?B?T1ZoaUZPWE1ieTFYdDBYYlZTTklWRmswS3k3NmEyYmNwd2J1T0VZVENaQmYy?=
 =?utf-8?B?SkFjYlVNV0c0OE5Zanc2R085MGw0RjFBZk9mdURIWGFyWTN2VnIxNG5PK3Z3?=
 =?utf-8?B?THNxd0w0aXZZUEdUeUFrOHI3WVhJSEdiekpkZmpJZC95MnBRZkpPTkh0SXl2?=
 =?utf-8?B?YkJQeFczanBrOTJMSmFTTm9ZMUNGNUhNRnJKcDdQcGsvZTFBM1ZMNkZKQlY1?=
 =?utf-8?B?SnVQSnBnVnowdnZaeHdxRnZiaUNoWlFaVjNMTWJMbUVOZ1Fjc0dNbi96VC9y?=
 =?utf-8?B?R0FaZHdjbkd6TGNMUXN0VEFTWWNFZVBkV0pYcHlHU2h6WUVScWdteC9HdjZp?=
 =?utf-8?B?SXlMV0E1RG1LTHRSV2dyUTZBejhyR2ZOdUx2R1BuOGNFaXdQT3kzbTZmMEk2?=
 =?utf-8?B?SXR6dnAyUVJOMXJDT1MyQXVsWEVPUVEyejBMNUpFREVDUU5rYjIvczJjd1d1?=
 =?utf-8?B?OVlJWlUyK1d5WWh3cGtKMVlBOW1HTTlrOFpwcElTSHRyemRhdUh6Sm95cVhS?=
 =?utf-8?B?WkQ1RHFReGdHSmd4RHcyRm1Ba2d6b1hkOUhoOHFnY1hRbXBla01nQ0xFMmJi?=
 =?utf-8?B?QkNrajVZdzBJS1k3eEUzMnA2UEtCYy91bzFhYS9IZ1dpMWt2Y2dveFE1VkR0?=
 =?utf-8?B?eG9hL2xmeSs4SS9JNTg5TmpWTnJmRis5WlgwUzA1MW9YaGJqM1J4U05mSHVx?=
 =?utf-8?B?SzNwQjBzOG94cmFGUUtsMi9ZbjRxM3NIdlBOaGI2b2RNR2lHbkxlMmVESDRJ?=
 =?utf-8?B?TVFyREtISjFTVnA0YWRjekNNMzQvNTFrNDYxamo0eHJhVGRYRWlTTFhQaExW?=
 =?utf-8?B?MjBmZVJob0xuK2xhOVBIVFVObU10VUwxQ1VxaGIwc2xzdXAvYkVXTmhQL0Ew?=
 =?utf-8?B?aW9HeG9jNERZckVVM3J2alJYa2k2NUxLcWRPemNaSlVNYldvN3BJTXNKam1k?=
 =?utf-8?B?VFNtOVp0dFB5MUdQd1NDb0IrMGdtOUxJeG9PS045YTlQWE9ML1dab2FKSWdl?=
 =?utf-8?B?MHRXek53Yi9HRHR6bzhkTmp2dUVDWlZiNTl3ZnR3d1BxUHZ4TFRYWS9BdWJi?=
 =?utf-8?B?eEk2N21CaXpxd0JZcUJwNC9oeFh6VlJlM0hyMU1hTUtRMXpuWFU0VnlVbERh?=
 =?utf-8?B?M2YrdUVjRU5rSWZBSUxjOHB5N0QzYlJlbEZCeWJ5KzUva1BRa0gxcDIzdjQx?=
 =?utf-8?B?T2ZxRkVVVXNNQlA2cE41bFQ0VjkrYkM3UHRuMnR5WVVVWlRxeXhSVjJNMzVY?=
 =?utf-8?B?RjE2dFl3MG5EKzl4YThHdUx1Z0twZXdycjAreGx3VmhiOFpDNDRxTHJlYXZ2?=
 =?utf-8?B?OU5lUHhMWndVek1EK0hmTUpXaUJ0Wjluanl0ZkYrOWJiYW5CWmZPVzk0M0VB?=
 =?utf-8?B?a1hlRk1yTEZlcWdqa3VoTG1Ld3MxMGxteGtsd0dLdEJyM2ZBR0VpYWdYMmcw?=
 =?utf-8?B?WGwwNFB0QldHQVBTZUJiSjhaLzVySElNQWZha2hlTnhOMkduNDlUNGNIN3I2?=
 =?utf-8?B?UzVLZVdrU1NPdTl2cWJnRklMTGxHOTIwQWhCck9BS3kybTBRSWFzNmFTR2dV?=
 =?utf-8?B?bDRQNjhrMXJPYzdZaU5oL0lWR2x0UW5CTHRCdjZSRXBYTDBHazNDYjd4YVZN?=
 =?utf-8?B?RDNmQVlQZzVCTU14NlFRZ1krQ3ZFczQ1dW5ESVM5aS84emlNcThQUnpPSDhP?=
 =?utf-8?B?R1FIUGdjSDRMYlBwYWdCeHdxU3pVOTVlQzhGVVNnSjBmMUZyQTVBeUFzR0Iy?=
 =?utf-8?B?KytwNjJUSWJhdFg4R2ExZjAxa3Z2SGhRUEJYbkhhWGd3RVFrdTd5MUlKcVdG?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e8d2b7-0fa3-453f-eeeb-08dbf5323015
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:30.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9dk2pJyacIIt9qi7OjnkY+4fbBimKp6PhnvevuXkCIBpk1o5i0q6keACLW8HsahNO0c9guwHISzuuMoxvAY43FIgvE0wPzHWcO7HScw210=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 05/13] drm/xe: Don't "peek" into GMD_ID
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that MMIO init got moved to device early, we can use regular
xe_mmio_read helpers to get to GMD_ID register.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ef4ac5412e22e..11fd2b8158cdb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -445,26 +446,22 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
+enum xe_gmdid_type {
+	GMDID_GRAPHICS,
+	GMDID_MEDIA
+};
+
+static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
-	if (!map) {
-		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
-			gmdid_offset);
-		*ver = 0;
-		*revid = 0;
+	if (type == GMDID_MEDIA)
+		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
-		return;
-	}
-
-	val = ioread32(map);
-	pci_iounmap(pdev, map);
-
-	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	val = xe_mmio_read32(gt, gmdid_reg);
+	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
 
@@ -497,7 +494,8 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -512,7 +510,7 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.43.0

