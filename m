Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D418C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 06:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D822510E418;
	Wed, 26 Jul 2023 06:23:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FC610E418
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 06:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690352626; x=1721888626;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s+4BtpRZ+ANMF29aq4nzmjVNWQN+gGm6BLtJHMDIJZs=;
 b=b3jk5hhU7vOD4fZNnnezWPkUnxb0iGhbcf/+BVeoXSMoY4/iBgkDjlSD
 S8a5mAPpmTPiSvm8y592rc/dr2RjuRfJsyHRuMWMqNolu2SqsF/p28D2d
 0ECC1yKGZGvbK8kU0JKR1Lz3MrUZaOWVvOlGMVsIcW6enAhbzB0kpzLdZ
 P/m/e2BmJUDXC4PsDD3ggp33I96M3y7N4PYIN07T3VuoS2u5kbi42WS+k
 vcZ2wzZdGYjBIAAQC0QtynhlBU3fx+CFTmtXnjkYCQf2bsAe0/4wZ5Bl9
 MnAGCCksJkvBLZgjQUOQRF6SjdeAnHXi6OPFy+VE8YOeO1ZunyLCudVcJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366815185"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="366815185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720332142"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720332142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 23:23:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:23:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:23:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:23:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4eVNepauWef+CNX/ccx91m/xWvnbbITHN6VI2SaQcdBSRNzUphuHchz0PW68nVbVAIAm2mzIgIlqFfkoYVwoogt52zrZMg0syLbg7dgkunsrCvgTDppxqC4y8Ue+/0/VFjRSY2U73rGSaFvwOTsTnpATRie9XGLEHFp9xsEJBLS+3vai60Lc2m68lDu/Ehu3+C4Vz0ZXeA08p9APvy3zx/RdS1tmbMjlU00prbJnZBnlrB65hr/0jufxZGRHK94FwEPvOm+DXfKRWnq2B8+YcGQTWd4a3QGaz1PfHBZJfwA3bxwHbcjc9w07CW8dDO6QleV0JYn5deRLCNwFQ88qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53fMf8tGKmfsDh6pO0b8JqiZoULebEguVrj4RjfR94k=;
 b=c6JqQ/ErmztRLlI6dWdirPdqXPyoG/+ubWRXzDlmEQ+LqHTpDp4ZsMHD5Y5rMlWS7OIQY1wCMF/un0+sYXAQz1a/8MTkCJc8EEPWyvWbSPOCWVhQbpjUpjYd41Q28dVVVFMHhOkpCSt5l6V1qDzI1fKsICOtI9LheFahZxNTB7yxL2i3SNl0bxOFEeLhZPauAJ2vcSsqJRpXKw6RFDefEzrJmrw5anuJSiI2zW0aI3CqHMGas4GM8wQaHeYhiBGEeHF8vVGQ5TknKVN7Tm7ni5aqLqSE38J9kLK5YExGY2TDtHzu5S1b0kSDMRcqrvH4HJMC6/ER+1VjtJiMFLXh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:23:39 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:23:38 +0000
Date: Tue, 25 Jul 2023 23:23:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMC76FK6rMOGnn38@nvishwa1-DESK>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
 <20230725115003.785982-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725115003.785982-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f1bd97-761e-400e-9fd1-08db8da0d984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNcbj8iGESGZDU8A8UK8Z+eK3zITHZ+WUNPKeFClySOBkREHlRgoYSWjA5BhdOs6KwK2QCW6C0l0ESlvhiXpd5ytR8avXv2bJNhmd2/SGOSW2ngs2JsvmH4nN3eqhNBUJ1LXbpsZsJe6p+IXNz7JqGCOXAPKda1uKRth9dLwx0hPS4YDyAeONXGP4QCbxq8ACdUSQVUO6TsIWflC8JQL9HGcvQboRjMG9Pze5OWqpIA6ERUoNrCbiOE8vFHjUDmMLCVGSCQouRnWfBWb59I6UCSCZ4M3RQGHjeIjJoJzU5IsyXgIuZqjTiHZ59X+N6TALtxXZlnBulW4oaby6DdDHm3T7hkFoIZ1FtV94il8p9WDtKqiQ+5ZgKZdGci6KOd9mzmCwR+mzTgqM2SBICg4NLvUltCpAZ7aihWsTomDkdukLlXNBvppGiDYaitLebmfn4ThpYLFLYFKdH1vsq/XcubRk8eqB3aZ6/44CkKHyD95oBMhKiXQhISpW+woWIKuiIWSxpYiMBYeOXHh3V1peh5duXfVD0014NATsKjnToWlSiM8v1K/LESfoI7QoOH4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(6486002)(9686003)(6512007)(478600001)(6506007)(186003)(26005)(107886003)(44832011)(33716001)(8936002)(6862004)(41300700001)(6636002)(66946007)(66476007)(8676002)(38100700002)(5660300002)(66556008)(4326008)(316002)(2906002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PpnAvtw+RIv04uKOaien3u6U84O+o/uduL/Mt2DDtnTgw3wYtG3GOcgHUL?=
 =?iso-8859-1?Q?zA3OLL6ov7i/ujEIaYlvSq48SlhiVnlgifKSjrY7hf0PxhpOFu09xNhCzl?=
 =?iso-8859-1?Q?YFp8R6a7WVL6uXWvXUnJ/ueTpcwl5DLPZh/Fw5ylA/zRclv1pdFp6EZP8o?=
 =?iso-8859-1?Q?IGGPjRZSwBswg6+yGItb8CBN5Qf82KOP3A/XgDrNyQMitjhQ+isXuJz6cy?=
 =?iso-8859-1?Q?2Cd2QmhZ35cxAf5LQZgniNQe+xhKMUgGcW238Qar9rl44Uxx61QoJUI6NL?=
 =?iso-8859-1?Q?n/iFVtrwDXrCzOy58fwyELqU8jLhsOjm44vr7ARJJJ//R30DFq+5olyc8X?=
 =?iso-8859-1?Q?fneVBuYK7OSvzsxmAdtm8L9xSDmvIzX4TsGNWMFDV1G5frPhyfLkrdG9VV?=
 =?iso-8859-1?Q?akuWKT9T3BDyG9QFUwBHPRZMMBm+UgVuax5lDTDf+S+yW/cS+ynZApLsoj?=
 =?iso-8859-1?Q?n8rgR+1pJ4+baNo06SKO8xpBEwf2Q+77Q3N0E6J12KmYBHTlfctM44VoOQ?=
 =?iso-8859-1?Q?rYBXBwksQDHs3lAhLoAAO798Um7ihE+1os6vZET2fus0hG34OnEOrlyCyD?=
 =?iso-8859-1?Q?CGfYtfPEdjOs2POhDxDSFdEZlV1kY0JjowNuExjX9smqQ/ap7kguoShuaG?=
 =?iso-8859-1?Q?GDC/QooWmFXKrgtRnG1nW34I7rycUgfv7PSeMoCPaPxRY43utbf3TewMJw?=
 =?iso-8859-1?Q?bb819yYc/bsePhqo+9lD1qb/3iSWozIrg50dl8sVlw+uFS30W1VQDaPEc2?=
 =?iso-8859-1?Q?HMckRYj8yhW6TggxFdK1RlokZp73duvjrc/Z/kcswvqM0wubi+pp85CYIJ?=
 =?iso-8859-1?Q?wGYN4MsOXwqbVQm8kk0DcaMJZ54tluVJ4T36qFuPReW7oQIkyu8NQAsYKb?=
 =?iso-8859-1?Q?jiEg2OizEShmSVyQo1CVF3QdrPBl9dBsbQwX6qx8ZSk5+I33Zgh0AfTCeF?=
 =?iso-8859-1?Q?y9U10sposqKLuyY6RwY6X5BwbtsIcYdlwMAq8gXLggGxGv3X2W+fHrl2d1?=
 =?iso-8859-1?Q?CGgrDIjJENo6p71/jS6tAmQhIcJZ4+5Lohw6kklsHQL31517ChuqB7CFED?=
 =?iso-8859-1?Q?pDODmBFhCYsJTL+LQS/52ZdL7lZZNQ5H7OP6D8n/iGGHNiiHpNBQYlwfAE?=
 =?iso-8859-1?Q?R0i7zGB5MWJce1TJRdqYKLCNFDGcJVxE5dJ85ttBcC/Zj7hSFSJZ6g9EQR?=
 =?iso-8859-1?Q?M1PeU865xVaafNmRLT9bWwZqZ8WzpoG0MxZ+c/CTXd2etBFhpsiKWeNEHA?=
 =?iso-8859-1?Q?74+W3+fVFJfiXTbf0FZxbYcX4Ah3S46FSgMNFJE9Zu959eNRsDvtEYU8ma?=
 =?iso-8859-1?Q?f2ftZXLAm2rygVzt0hlluVO+wYn3IOgwIquLKRxFu8mnFbYkRBiIy2hNsU?=
 =?iso-8859-1?Q?WXIS/F0anwP2JAd3gHjx6r2kUsIEZ30hjNuBcfRN8+LAj9A9AT1r17w2Hw?=
 =?iso-8859-1?Q?xvsz5kqoLMb9DBoCfEd2w3S7qPSSke94DYYpYVMy95HBTkmu5Fso8bFI9K?=
 =?iso-8859-1?Q?GaMwYXYcYEapn8uGkB93ca+aubfySaKsKF16GZur/6BZYxO4IxO0yzkYQh?=
 =?iso-8859-1?Q?Qhe7JkaIUzUxv5Hp7jU6MM+ByF3vHkM65+MpAocPn1XvAdTyebZmRV2sJ7?=
 =?iso-8859-1?Q?UTMaHjqEYRRowJPLqZ/3vhbKllXqsHZCVqFqeyGxQsEIVazRTgDo1tRdII?=
 =?iso-8859-1?Q?TXKVFJ1fjDEMaVFR3VM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f1bd97-761e-400e-9fd1-08db8da0d984
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:23:38.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSceHxWB/68WwxPCqPxaHsg3RTtkwK2zMjUAEhjbDkBukuDtb+ysdGWE5K93Z87szPwt6rFGWymAP3iwuaVdYf7b+th3IbIzEKn6rdFvHxSUk7GyuvPfOT7FxjZbm8Tf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V7 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 05:19:58PM +0530, Tejas Upadhyay wrote:
>Add engines sysfs directory under its GT and
>create sub directory for all engine class
>(note its not per instance) present on GT.
>
>For example,
>DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
>bcs/ ccs/
>
>V4 :
>   - Rebase to resolve conflicts - CI
>V3 :
>   - Move code in its own file
>   - Rename API name
>V2 :
>   - Correct class mask logic - Himal
>   - Remove extra parenthesis
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                |   1 +
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 111 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  13 +++
> drivers/gpu/drm/xe/xe_gt.c                 |   7 ++
> 4 files changed, 132 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 4ea9e3150c20..7ced39ee52f8 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -52,6 +52,7 @@ xe-y += xe_bb.o \
> 	xe_device_sysfs.o \
> 	xe_dma_buf.o \
> 	xe_engine.o \
>+	xe_engine_class_sysfs.o \
> 	xe_exec.o \
> 	xe_execlist.o \
> 	xe_force_wake.o \
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>new file mode 100644
>index 000000000000..9959b0362d71
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>@@ -0,0 +1,111 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+#include <linux/kobject.h>
>+#include <linux/sysfs.h>
>+
>+#include "xe_engine_class_sysfs.h"
>+
>+static void kobj_xe_engine_release(struct kobject *kobj)
>+{
>+	kfree(kobj);
>+}
>+
>+static const struct kobj_type kobj_xe_engine_type = {
>+	.release = kobj_xe_engine_release,
>+	.sysfs_ops = &kobj_sysfs_ops
>+};
>+
>+static struct kobject *
>+kobj_xe_engine(struct kobject *parent, char *name)
>+{
>+	struct kobject *kobj;
>+
>+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>+	if (!kobj)
>+		return NULL;
>+
>+	kobject_init(kobj, &kobj_xe_engine_type);
>+	if (kobject_add(kobj, parent, "%s", name)) {
>+		kobject_put(kobj);
>+		return NULL;
>+	}
>+
>+	return kobj;
>+}
>+
>+static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
>+{
>+	kfree(kobj);
>+}
>+
>+static const struct kobj_type xe_engine_sysfs_kobj_type = {
>+	.release = xe_engine_sysfs_kobj_release,
>+	.sysfs_ops = &kobj_sysfs_ops,
>+};
>+
>+int xe_engine_class_sysfs_init(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	struct kobject *kobj;
>+	u16 class_mask = 0;
>+	int err = 0;
>+
>+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>+	if (!kobj)
>+		return -ENOMEM;
>+
>+	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
>+
>+	err = kobject_add(kobj, gt->sysfs, "engines");
>+	if (err) {
>+		kobject_put(kobj);
>+		return err;
>+	}
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		char name[MAX_ENGINE_CLASS_NAME_LEN];
>+		struct kobject *khwe;
>+
>+		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
>+		    hwe->class == XE_ENGINE_CLASS_MAX)
>+			continue;
>+
>+		if ((class_mask >> hwe->class) & 1)
>+			continue;
>+
>+		class_mask |= 1 << hwe->class;
>+
>+		switch (hwe->class) {
>+		case XE_ENGINE_CLASS_RENDER:
>+			strcpy(name, "rcs");
>+			break;
>+		case XE_ENGINE_CLASS_VIDEO_DECODE:
>+			strcpy(name, "vcs");
>+			break;
>+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+			strcpy(name, "vecs");
>+			break;
>+		case XE_ENGINE_CLASS_COPY:
>+			strcpy(name, "bcs");
>+			break;
>+		case XE_ENGINE_CLASS_COMPUTE:
>+			strcpy(name, "ccs");
>+			break;
>+		default:
>+			kobject_put(kobj);
>+			return -EINVAL;
>+		}
>+
>+		khwe = kobj_xe_engine(kobj, name);
>+		if (!khwe) {
>+			kobject_put(kobj);
>+			return -EINVAL;
>+		}

NIT...having khwe here and replace it keclass in next patch
seems like patches are not self contained. May be it is better
to start with keclass in this patch itself?

Niranjana

>+	}
>+	return err;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>new file mode 100644
>index 000000000000..f195dacc1ec6
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_ENGINE_CLASS_SYSFS_H_
>+#define _XE_ENGINE_CLASS_SYSFS_H__
>+
>+#include "xe_gt.h"
>+
>+#define MAX_ENGINE_CLASS_NAME_LEN    16
>+int xe_engine_class_sysfs_init(struct xe_gt *gt);
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 3e32d38aeeea..a8176de9f536 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -14,6 +14,7 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_engine.h"
>+#include "xe_engine_class_sysfs.h"
> #include "xe_execlist.h"
> #include "xe_force_wake.h"
> #include "xe_ggtt.h"
>@@ -322,6 +323,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>+	err = xe_engine_class_sysfs_init(gt);
>+	if (err)
>+		drm_warn(&gt_to_xe(gt)->drm,
>+			 "failed to register engines sysfs directory, err: %d\n",
>+			 err);
>+
> 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 	XE_WARN_ON(err);
> 	xe_device_mem_access_put(gt_to_xe(gt));
>-- 
>2.25.1
>
