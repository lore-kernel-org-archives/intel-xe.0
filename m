Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7E6C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3254410E301;
	Wed,  8 Nov 2023 00:35:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3761B10E301
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403740; x=1730939740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZoiMTdoet7WAfaDW3zLTz2tKICmDbK+rvvgkeBsxxbc=;
 b=kZbZRFWBd20BYJNFelBpBYwWtnp6rI7GWRxHHduVnaH7Nv6GzhaRtyEy
 JzzG41Nvv+zXgEQZBQ8ZVMee6KHFN8wdWSTjiK8xaGckRChOjDr8crldu
 Yn5dzROaRUUZfdqgyg0p8PDTE72jFj0S7gidGQduDpbwE8qzkBLIN87ix
 OwVOR1zbtiV2hgAnhtzet53L74oEteyjEZN7QIA9SN5Q+kWXlQnnJ11JE
 zm5SnN4tZFr27K/yM8l47Kk0WwF/y0HSCYYfdFkCIHzzyvNVTuQN1gNy/
 RrPRDY273S7SWP/82RzMqvJOKQZ1vgN3mNCy1+ioHRUZBQ7mzT1jTycSu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886224"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886224"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880019180"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880019180"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:35:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:35:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:35:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OntXMNc/MjLB+yV24Y5zE/x2ayc4jIQyYWlNpWRfEMvMsy2Q1l3TefkLwznIKUDoRgpQWvqK1gm/PB+yyx6kEo3nt1eeAlgSRdn3ePm+J4uYHgSzUW6C036uf4K/ap4e1t7YI9PUPakO8l/D3AlHLMfiCpyxb+96fPhMKyogVAhaxEUG6NcvbLEKMN3kCwn5L2pXIVKrqM8Hvbl5m6zYIvt+pZIdTeWRp9+Cm7T6iIUhWc9WnBuRyhus9a57c1e3pM2seWMJypF0idYJP/m60M5qbqOOlF+lLy471Z0VvP5iPNANUsnmV1UUPPHheRNoYzHVigQU+D+IbChr1/coGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTbrf4ViGe3Y+TfZ9i0xUM4hAeAohKBimiyJhjip5Yc=;
 b=aRUlr799Vxz/RD14ByQjiqKUzaSa+74g9fTHce5lVr6YdrUkiRg58k2OB/H7i9zSA1oDnp2CK5gS1qmnMZ+nySW+v+wGiYXR6jBWwx/cYS4/4z/ORv4fxX8rW4yu5jlqc6AojyVpt5oWn1y0DwTrS7MRC+bYaiqiKoMPD5jMbTS7gK6IGl3FHRUOQlJE/W4PGU62+YnAPtKv4nOUncvpsfZ4qU3cQgjUMfxZNdKvP7ldl7b0oyLG6R3au+lOnC2n71QuQBlbL4LeeIjh4jDm5ralAh1lGBwKzzJQfKPfZaVlZ+6MMQED60xb0KV5b6b93xCtaCJkmDXh6Ez8bPTDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Wed, 8 Nov 2023 00:35:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:35:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:44 +0100
Message-ID: <20231108003344.1169016-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 371884ad-4e42-4905-411d-08dbdff28cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/4iPIsq2s8wuIMHZeXewwBkXzzdZBxaniY/hHiMBKaYnFTRjit0PUm01Qm0gGnt7ndGCeqx7n6VkduCNRzuEnA+kp5r8bZgLPeGqUqnohKyznfO4Sd+YtjbHKTQ0hwWRQcmwQ5+MYd3X2Hhe6qsT8Xvthxm4IYOmTtQZCdzpQvwTl9oha46N+yBOiKIKB56PLge8YPf03mPncHM1jFsSBC402lutuz9+92XB4QcHPC1QEE2Jox5tzJDn9cNn7+XGx13cXxH1GQrtpnUW8D6mNyCz1ERneddgly2F37bHOp9Trf5AdiJCZSzZ9XFBKS/fHLmTVKRNwDrVn8RKTimEFPXKDbod8KhFU9MKkTJWIIEO4jo4h7A+mBDBpIW4dm61EQVyzt6IUY7NdIDrNFYWNdQydpvoM4KgPEE3Hjaji9fNqjZVF/yvTNtp9UEk6gZVtP6DJCFj1wR4StqfoejB1YRJJVPRUbwSSV6ovPeCJGIPtYWrScRDqqGy1zPewj3IpS8QUvKnrgEFlibuksj74kGbuHA9Hd4rt7G7cFC0n+upi+Kj+kqtATs5wdnfmwL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(41300700001)(478600001)(66556008)(6916009)(4326008)(316002)(66946007)(1076003)(66476007)(8936002)(36756003)(8676002)(38100700002)(6486002)(5660300002)(86362001)(83380400001)(107886003)(82960400001)(6666004)(6506007)(2616005)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2RiK2Zxa05PT28vK3VVaGJ3cFRSSlBFTXg1VlNiNXd0R2M0dy9rVE5OakVI?=
 =?utf-8?B?UGxpS2NtbE1Qem5McGYrdzBCYWlXemdFZ0VmSitoV3NHVmgvNjd6KytaRnNu?=
 =?utf-8?B?djRXSmNtdE1NZnhiNFVaMjZQNCtMNW9lakdxUmdDaFc1Ykl3SVR1ZUlFUERH?=
 =?utf-8?B?bTh1RlNzSWRsSTk1aFZxdFNXMnlLNVJoWmlwR3huaFJKVVkrS2p2aGpGMG5P?=
 =?utf-8?B?RDZCYndXU1B4ZE5IbENZS1hFNWFvdDRWSG5ZbUVIdEJ1c2ZsSWlLVjJqUjJv?=
 =?utf-8?B?eTFwK0ZJVzFmWWdWNTlmREVNRSsyRGl5OEZKZmVBa0owMWh2Z0hZZXBXMWpt?=
 =?utf-8?B?eGg1UElpNDlyTDQrSHFOTTNBRHFSM2N0Vk9JMlZuQlc2NWVHejZsZFBlcGY3?=
 =?utf-8?B?UVZTcVdKSE40RjlveU90N2ozL2hSeW9NbjJUMkc4VHNoQ1pOS0dwUVl0VGlx?=
 =?utf-8?B?WXZUNkd4QmdJSlMxNUREVnFqaFRwK2M5SG1DYTd5aEFjaXpoTFovak9iR2RK?=
 =?utf-8?B?Q2xXeGltYjdGSVZBRW5DaEVISUV2dUt3N3FaeFozSWZtendZUUl3MGxPU1RC?=
 =?utf-8?B?Tk9TQXZzVVZhUUtqa3VNTlA4ZU5penFqZmdJSVZvcGxLMHplTEx5WlRqY3Va?=
 =?utf-8?B?dHI2SFh4L1AxS2NKcU4rY3JFbS9yRG9kMmxKb2VqRmZJRFIvejFVOUk0M0pv?=
 =?utf-8?B?QTd6dlJGWVZxbXpVdWc1L2tVRVNGTWpnZ1pIWmU3QjBxTmRwZm5sWDN6OHRH?=
 =?utf-8?B?U3AvamlhcWYvMmxwdEFRQU9RNGNVaWNvVWt6V2pUQnlRMnRlVkNVQjNsQ3Fm?=
 =?utf-8?B?NnhsTjk3Nm1rNkxnU1VuZ1VzKzY5SE5sM0p0b0Y2c0FqOTEyU3A5d1NzazVw?=
 =?utf-8?B?OUdMK0hiNFNqODVIVEgxQUxkWHNBc3U1ZTdXTCsyalJTWURudU1XRWN5c1J2?=
 =?utf-8?B?VnJjVExtQ1ZVdlE3Mm1SWVVSY2hLTi9kdng1U0RvSXY2b2NFWHlESWk3L3VG?=
 =?utf-8?B?dHRUMmRrbUt3bzVBdEhYTUtYZ29wUGxBNTZYSktCUm1XWjRsYnpoVzJPdmdS?=
 =?utf-8?B?UUpTVnNURlFJZzkxbWU1UmFKS0V3QlhzY21CMFZvOCtMRTJXenRHQlVRVDRK?=
 =?utf-8?B?aGVURHp3clBuWTFzU05xMzhYL0JuNWtpYmNvT2M2ZnNpMjVJeDB3Qi9nQ085?=
 =?utf-8?B?akNNSFd3UzBtZ1R1dHE2ek1pV2ltYVdLcDNYMEg5VnBHK0M2YmtORDZ4dzVJ?=
 =?utf-8?B?OW1CRml1Sm4rYWp4MUxiT3E4NnNrWGJHbmRmSUkwdUpQRWxiRXBFTlg4RENn?=
 =?utf-8?B?bk0wR0dMMEYxY0EwYUFRajFPYzdPRTdnRWVveGkxcVpTZ0JrZTlaV0pnRS9s?=
 =?utf-8?B?OEYwbzRGOXFSU2V6UXpxaHlmTzV3L2hhYkluaWczdWNkV290MTlrUGNxaC96?=
 =?utf-8?B?K1VNSUhVaTV5dy9LQXo1aEVFYjdwcUVYQVl6bExRUUNTM3hMN24rb3JMeUJ1?=
 =?utf-8?B?WWJrYzFsdUp3WUpyV05sL1llQVF0dGRyV2FlN0tGY0U0ZFNUdk8xcjBBYTBk?=
 =?utf-8?B?VklVbEcvaHhmWDdseWRDbUZKdGdTdUF2cEZMdENtM1B3L0d0NEJuT2xkU3Bx?=
 =?utf-8?B?YW5JVzdsYlljZ2F1KzUxamgwU0RBMkxkU3NKL1I1SStTWitQNXRHaUM3YU1s?=
 =?utf-8?B?RTBaTUc3S0tnRnlxR1BCRGRRbk1Ya1YrTXphWXdEQ3Fqeit4OExEV2FZY0Zm?=
 =?utf-8?B?TGhONGtqejhsak9pbWtRWTR1TDJXVU5nTlc4MnZWVHVab3lGU2YyN1ZGVVVt?=
 =?utf-8?B?Qnkvb1NjVFRZQnVLbDZyaVhuQ0FuMFQ3VUVTd0FqelJCNzhrNHZLVnZFQnBr?=
 =?utf-8?B?Qm4wMUQyL1ZlSFdINjRVKzR6MDg3UjZIZTlWOXdPNmY3VmxrUnFJbi8zNU44?=
 =?utf-8?B?eWlMR1dLTGJPdGQzeWhnaVVJdlVTSm84V3JxQjFxZFJNeTc4UGxlU0pTak96?=
 =?utf-8?B?TVZDSnl1YVdibVgraUFENXNmMmlrU0VkaUMvNDhubG9PNSsxOGV1dGdLZGQw?=
 =?utf-8?B?NjBrNTF5V0h4aEdMMkY4dzhjUnFEMXlzN21QSjVXR2tIMk5KakVLQkk2NWtr?=
 =?utf-8?B?L3JjZTNuV2M2Q1V3NHVWL3ZlTGF1c2syelVoRmtEcCsrU0NzbUJyS3ozWWJR?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371884ad-4e42-4905-411d-08dbdff28cdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:35:04.2255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnZ3CPOEtMfDGZD5npIta0DXW0lqLK9UtHEfd/xXWLk2k0C5s+Ia0DvrGOow5Bd6Eb3gtpz0c2rTkifyiAV4u0SjzwvkzAdHEe/gr2tjt3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 12/12] drm/xe: Don't "peek" into GMD_ID
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that MMIO init got moved to device early, we can use regular
xe_mmio_read helpers to get to GMD_ID register.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 902c60543de07..aedfa139678d7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -38,6 +38,7 @@
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_REVID				REG_GENMASK(5, 0)
+#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
 
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2f04f07dc17a4..4356c8f4f7c23 100644
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
@@ -440,29 +441,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
-	u32 val;
-
-	if (!map) {
-		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
-			gmdid_offset);
-		*ver = 0;
-		*revid = 0;
-
-		return;
-	}
-
-	val = ioread32(map);
-	pci_iounmap(pdev, map);
-
-	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
-	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
-}
-
 /*
  * Pre-GMD_ID platform: device descriptor already points to the appropriate
  * graphics descriptor. Simply forward the description and calculate the version
@@ -494,9 +472,14 @@ static void handle_gmdid(struct xe_device *xe,
 			 u32 *graphics_revid,
 			 u32 *media_revid)
 {
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	u32 val;
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	val = xe_mmio_read32(gt, GMD_ID);
+	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -511,7 +494,9 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
+	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.42.0

