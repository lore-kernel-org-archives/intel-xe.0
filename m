Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C96C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF410FE6C;
	Fri, 26 Jan 2024 20:35:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603610FE6B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301358; x=1737837358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Rafui4Ri3e0j95N+VEvZtRXToFSNN4b+2O99X5BbSjM=;
 b=mTMwpW8w6PmoVs7W4QpfNS0IkSX9kU5zlvK6xVJr4RnPjhlqMWJZq67u
 eZWEscD/Ny68KvUYgmQL4C9pGjJM92Ux+kDf5YBq/80RmMPhZSTONj2Ll
 U4QZCBnzQbF1tyuO/5/0tgiucEGqpqPErrymsJsesrJ+CnMrJhpr5XALQ
 kSpHwZYQPdoljjx0LUtysDCZ5seDwuaZF06+GAX2hTubCH5sEWfNlqP4R
 i5MXqIuhmKgYg2QdKuyRM1w3apzras2IAXpywXTExNI+nmlc7xxV3fPRA
 8w1YrrRd/DtjQoC2jzTZbNt4P2PQBlCmoOC1rWr3XI1rnH7pEPdeNzc5c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402220299"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="402220299"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906412246"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906412246"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:12 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njAxAtKc8i9LspQZoJmlIwY29o5zKcUgqhoToj8FXe8ZC/SRVNDA6JhPc3FCEn4i5TbrYKvA1ZG1S+uJ0QRAE5rqHCLz2ebUMWNZ++rITaIpFwUH4eHJEpAPgiuD3w0EsNVerisfogHUPUM0wf7MwiVH20472dwQOa32ho8iN6jrtG0pzbEDSFW/WDqG7kpZidfbIKPnGfNwiOMta/QiPBVPyaP4YQMDB10wiMPrB7z6s1FMjNrI9BVsnOmxJ8pAwdJbhyus1ngBUd3aP1DHC9csEEhPBNhfMhV/X5bezPNB4dYTs9yvf6W8LCXP7SOqM146BbRfpnZoGhAbXe43Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIgRVXdfH91Js4zzPC6JHRDmuPDdqc82ldfGdXPmMLE=;
 b=g5kUXxw34reTkH28mD7cy50caudx25mVUXGIqwurGgJ8+KzglHVbpFzftNcqu3PjjIkdt7Zp2Wz1YRa1+g/N7lcjgHqwck3FX9crSjvRvbxqJTprbjb4B0zG0RRpyxQhf/soe23wxkLR6PWJaoQOZqTISD6b6fNTzEkI5c5SREgRicFgBoTA9utTOpCh8135H0GTiFrGZy6dU+m1c6twFDiSCQv0kFHF7k53o5BD4HciCmKg6rKE8a6vgqfQoV3Pf12tPOXRdTsa6so39mcXtvpsT6jv8g7lZaOiBuDJw0l4+4Rr5uiSaTSlJy0a9WmdNmc1l2IHNlkUeoK6J4T9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 26/34] drm/xe: VMs don't need the mem_access protection anymore
Date: Fri, 26 Jan 2024 15:30:35 -0500
Message-ID: <20240126203044.1104705-27-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a8a059-785c-4f74-526a-08dc1eaddee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JosnHRiVa5lOh7ITboS74hNUKfU+lKJy2lTN5g7e0xp2WmSOokfOna7SnUmrAlYg7JyqOV/VVscghNv+nB8HIhxKl2EzkIHd+BYMvW0rQDiC5K+RiIIPVmPIZdad3aIT6BjHj1bYGTY+/TtV91A/crdD0NX+yFyv7w30k+lhlnqcbY63yfQtxmESZfkFsy+3GpmEX0GpfnxUjEyAZEeKk+pD4GXpvxWlI/pqLgSIekNldtuogzUK2mHQo6bMbAvbPQcLyrbfM0dTImXCdjj/YdbO5CuDCl8FzvjkGAitz5exr1iM0ybvqxJ2EGonI6OblW8CS0XoFi1AWD47P7S1VF+Xvv/Oaenn8taIk28esb5qY4hZX5zCRjB80fyh2EMtD68HWomIpSercrbKSxGkJ7iF2bqbnb7PcPDq7tgyEhjX1zO6On6H5U+FFCmzfZC46RZrBxMTw3ekGNulIGm4Q16/RFze9ygbMPLqdVQdecc6UMK2JO35IrwwchG6eGfAPenJcfMiklgtYYOoeUOkt1o9qamPNKH86/S2ThzbK0TZvJK8fuzMNLWGWL367esG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6S1GgB0WZzA1oK2pUwkIVs6P/D2hfZpN8H3tGgO2ru/2mh9C7BPkR6LokK0?=
 =?us-ascii?Q?djf6OxDi700Iq4YzNPP9Q9PlIBzuc62TGzUemzOXs/0MoNgJ0vu471HREe3q?=
 =?us-ascii?Q?DIgs1lbp2+0H7GyQY21/peIEYtIwaEUGnaj/OFaFQxKHlslWZ7RcLeb/rP7u?=
 =?us-ascii?Q?oELYNk8u0kqf7Hn15dxvDlTKajrNoNi9UP94gyYrnsEVHhftQfrjw5j2r76n?=
 =?us-ascii?Q?diC6ErFQu4em4cIiqHFxcWZyNUHS02lh1GYi5mv/Cr7wNVDojIQfGOkbH4xk?=
 =?us-ascii?Q?WRH65ATnETx7SFRQcQj0UfH1ybMFyXpUdirUvL3EWAiW4dlX895syd2ceyNr?=
 =?us-ascii?Q?RSNkoBt4WIymy7cTqkoj6f/aQbLtKtQkLTyeRLYcABeXD0Tr60IkFoAKwtys?=
 =?us-ascii?Q?OFMPwkh2J/5p+Ema5rwjkxGM7Ru4uPdDs+tYNS9qvwNglP7N/gl+OKKo/bTY?=
 =?us-ascii?Q?XMO5CpgAH/OESnx1SoNAowuT9QuxE4E6W0uzLNffsvTM01/De9o20T/U5hzV?=
 =?us-ascii?Q?A4JDXmH6DZiBxvM79cS0xqRWSlAVXueQwfAsN6Hf5gcwnVkJgoNfq+po2Jbt?=
 =?us-ascii?Q?IPU5tEaLWguk0grMX1vToFunupbMjpBuFaKGh6ZmxjG2lQrm/hzGTJkNC85o?=
 =?us-ascii?Q?WtbZ2maxTmjk/KUSpRNm0U03IrflcSoiJtkEQaDyOKmd9S/n/SXckolpzR7d?=
 =?us-ascii?Q?jN5rs2850BFQxk5hzJxNFABf3iyTj09R21DIunWGCZiPDYOO7M+uIkzpE8Er?=
 =?us-ascii?Q?H8m73xkw3ZB+6xI1a71LVUgZ0X8Dos7yRdKdKXoGEnVYOxhdyDw7MMP42JvV?=
 =?us-ascii?Q?zJBxv8Uidaay5UitIbazmvZ3ZLyWkZo29ytSZPM7TdaHIYupYRcDJ9EBpH+U?=
 =?us-ascii?Q?Sw/20K+aPN76jLjR3I9iRV5uVmhG14Dq7xDlVlhPleycXgiiUkaOOXaNAdqk?=
 =?us-ascii?Q?cbWh4ImbGEuFEe5o83uxYS2lJTVjce4wAa16+LkCMJZYH8YhClMBFn7u/ZcM?=
 =?us-ascii?Q?9BboJo6DUJnL6q5rsA930lVvmx1Sdzc6kasHUqPydSJMvjZZX/r0p/zYwshX?=
 =?us-ascii?Q?5TB+2atscBQ/3iB+cmsAte8m5zm6EijLF8ga0JiUtwEKTK7DjgDaF8M+gFmU?=
 =?us-ascii?Q?6xdLwFGLlTE/tIDFffKl9hhQIEj7f6/9NgSKWofuT6ENQktX6zlWEZhckUfH?=
 =?us-ascii?Q?//km8MZ94u11YNlHhbwKzD8QSWjQp9/H1NH2gnNqa8lbYj24Bm/7yv9MrNtV?=
 =?us-ascii?Q?DoGRpybrlwFDURku4jVHXVeT8qE7Jil/z+KBg1zXspNkO1DwtcW9uhBeWhfg?=
 =?us-ascii?Q?4Gbg39FC+5P8Z+D/apL4QH1ndP48RRJfbTOe833u1A9/0nPidgqK0usjrY1v?=
 =?us-ascii?Q?JUdQ3INxjiwj5jQP/L18ontT91XQvHq2vXgHlhzXwyceWxUhJ+ZAyqliGpAq?=
 =?us-ascii?Q?FzigVpX71fFpRs9FvE/h1QL51vH0S4jGihOLHgRqiJQQSvz4yYu7FgbUnl8E?=
 =?us-ascii?Q?EHwtS5Ezil5OXs5Dfgm6dcx1wxj1w6iDA5ihzCKEzhCGIZXTaaBh0gty7CER?=
 =?us-ascii?Q?3EFKIYBWAfAm2hIZJB6FV8OiKCNUkWwJe1HOnYHLqSUaEEzZYkEzxCtzYUK9?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a8a059-785c-4f74-526a-08dc1eaddee1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:09.9142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vj3XsbHzTD1M4VSykxB5O+QhLveVfXduSCWFSAxJX2Ou7O49YWkeJpWseLhrWLnuM5Z/5my5Q4yXDRQpBNJrcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All the VM operations are now protected or by the IOCTL
calls, or by sched/exec operations or by the specific
xe_pm_runtime_{get,put} around the duration of the LR VMs.

So, these inner mem_access protections can be removed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9ad154a01ad7..f314ff128028 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1280,9 +1280,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
-
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
 		err = -ENOMEM;
@@ -1391,8 +1388,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1515,8 +1510,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 	xe_assert(xe, !vm->size);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
-		xe_device_mem_access_put(xe);
-
 		if (xe->info.has_asid && vm->usm.asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-- 
2.43.0

