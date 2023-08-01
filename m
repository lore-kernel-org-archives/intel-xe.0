Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BEEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECBC10E327;
	Tue,  1 Aug 2023 08:27:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739310E327
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690878435; x=1722414435;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iIESlN35yeKiwsJfNFWxxbhG1aW8Tuyq370syUpUcI4=;
 b=mHb8f+aWi1bkGBX7we+jPsWibOJZ4LdKwErhOWBKp6z9qKRCL4SZimNw
 B+Z8OfKEaB4/i7SWUwLvRJoGDkg5UC0CdvqgCiVHy3zIC9HocAWQ7vusQ
 mlA1IicWnGLNQp9Iyj3NBpeaOlNKZRoQscxV2e1QvpnWu4/Xr4gnlNkIq
 zAMRZmtqEqOMOvq+BR2hQ5hlyZlOwtP3kQlYu4zF0xukaQVNfNf/7LjGz
 KrbgVqbhs1Cpn/bHF6/XIaU6uxmHtsvFWTValzNoQPEIipNFUdM5WG5Jm
 dcW4IrNzuEDsFeLmJ38HBjtsb9jWgMaKA3Bo1XOKFME2WS5sWA4ZLcuLA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371948222"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371948222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975201019"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="975201019"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 01:27:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:27:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:27:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:27:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx4BrwlP8xZ+IeQoO6f6nBRp7qZuYAxU+A0xQA62dzq/qkhhX24QWVMQ0iNYazgho0cD9bXv31+jxl6EWO5Y3m5cYKYmXMMFEJP716IFbZSEItKT3RFakwUpQrp+uLYbA7uKSIC8NDxsEd14DElnschWyZS2FHE5Cn7tKmwpN+FzQtjJzNrzer2kWvY5t0jubpYVJ5m5Iv0KTtG6dovtlv7yQkDoPw1IiJ41zEascb3cR63CbHeUYpoPq19QdyzjJPs/7760EEvIR2piWrEdTzBUteCSoCZDyRaVDAt6zCxKql/aZEvkye+rMNG3fM1geVzgAk/FPulo7Zvqe9omQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/t1totbBD6oDLjVj8Ymm/cSEKUcXcVoYvjaY+dKqQU=;
 b=Qxx8f3TbHPlynTWuLn8hiq5ZG1JL2l4QJUBWhrJ6nfT6CKOTeLV3V7iu0yNtzrtk7mSucg6/TpxC4hemjCFluV3MgzxLloe3Oa6Ks6JYcifZxBhsOD9aRk20uIXMdnsCfb8LuRWyI/su7EOfDBgQU6JLZ/lx1oTO5/xlHJudttEZ2xyRSSE6NDbIHGYmbBw04fYib2ZEvzrvfG90jlAzNOUeD4VRaSe3T2u/Jyn7jKcXJWfG4ZR4NGACloOFQsFvKQFp1awzfhU+B6CgXw9LpbIuTSWdV6M9hcMhIhQZ+9tivwHXm9Zxi2ySmHzxeg+ya98TOPMXdNJ6zuw0DBT5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:27:09 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:27:08 +0000
Date: Tue, 1 Aug 2023 01:27:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMjB2cSXm2Ck2xMA@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731191742.1130309-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: e2248b8c-d36f-4c9a-4200-08db9269185d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sh1SI2FVGhzS7f/CKeeMhrdTkyAjg/jgQOWv2pSai9bzncxES7yIFGBMgrqKKTIqxUIJDBx5YcexqFVlcGf+CzOjf76qvjchoDwvuGF8B5Dr6BFQ4bm6KDjrSiXzp9HrgTRXAwZKa1l9n37jS/NsBuRjjiEIJTT74dax9P62f0q8IWOpS9H96DJcxqWRZPBziMSLdJBpplipAUMaCZ6pnOPYSilsMxQjkNe+Fx7NsKFrr/3hV60zgOXuHbfiZmebgedxsKmYrHCWcl7r0J87rT8ulXoU1CoBKCPClTXOnStDDOhY1W5xZWkdgUsczxc1iypHA3QXZn0qKxDV5wZjFV68YJ/zleRL1DB6J5whkscYbMZs+o1E4DTyaNmqCIz2odytxulXHrHr6bwgoGf/UjI2ArhvHNm1DJp1LLKhB6UaaUoweXTadCCd8wubi8V5hu+kz46upNDrjTg0/70nJqMbXRq8cx0AU1VLNr6C5pPRnuZ+dc3mBXXVbekvHQtCPlb3TsGI9jj03+xvGTTaVz1GRPzVLd9L7GwTMULlArlA3JVLkkJ4g2wtvoWZiYbv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(6486002)(6666004)(44832011)(186003)(107886003)(26005)(6506007)(8936002)(8676002)(6862004)(5660300002)(6636002)(4326008)(66556008)(66476007)(66946007)(2906002)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0VzlNd+xLthodrjttjYte5BkdIcOCjsK4ECFkE7UbqoE3gslZPjvcfWWez?=
 =?iso-8859-1?Q?khtiZMPuI8eGaAEDhPO15CUqxNOvTuW8VwQo2VnXnAPwG5GStmh605vcI+?=
 =?iso-8859-1?Q?R1TGdhZuXRQzLyTAp2X+dWh+9pmPmJEFvOLzbvHEmQLM5G3qbIDggtQBCW?=
 =?iso-8859-1?Q?uSfTtGxhPgkbQIEHOtdnyoMwQMo6rMqi1S0z7/7O17L6h75+YqxhejPE/D?=
 =?iso-8859-1?Q?wp8deb07RaBPXy2bjafGXdoxEuh22/QmZrNofiflG8KgjksbHYbCH4xQX+?=
 =?iso-8859-1?Q?9frAOB+Nj/k76fmR6Hddgenq8AtaugDmUH/zU4RAw0RmgJn0YEkhbaw4LQ?=
 =?iso-8859-1?Q?oxFoGIacdb9Pj/yuYSIzNPI/lzijb20txd5NqcVmSnp6r1CLYEu6xmCXxL?=
 =?iso-8859-1?Q?YUqKA/IIuFfNf2Rcv7t122eQOpXfdvt5yiY9rPf7Nv6X/svqn7lFZrJRuf?=
 =?iso-8859-1?Q?OQ+Hl25ILrdn+pJQmoC5Zn7DE3C8VnmCgCqbI5VZZ+ses9w/+4hZRW0YrN?=
 =?iso-8859-1?Q?u/sl7hMCcfTPiwImzFCt2pEL2Qj2AX7mkTIDOn7VBqRm5Pi1FEdq/D+74Y?=
 =?iso-8859-1?Q?M4Jk6xQN6tYgKnzOGbkBLcpHTGrmTrW/2xV/F4ZC3o2UhqWs/5R819Md+b?=
 =?iso-8859-1?Q?XsTh/xNSRbnXP/lNkwDKnnJMbizi+/U7cMRYTM+V70V20mw77HaBrhbafe?=
 =?iso-8859-1?Q?9Lv/Fi3q2ZFmy1odmk0PhcnuviYxBZ6+W40Yo1gDzDGC+8QSWhiCQq248Y?=
 =?iso-8859-1?Q?8+JaejW8AG5QkiQYmhB51xRKVj8kpsSHO0K+H3cfV5FUAW7dWLRldsFog8?=
 =?iso-8859-1?Q?2O9W7D18gCdgnmRAXlkqza2Jg35mQuQMP7kZLNnpEjQEq1V5LIU0zTmvDY?=
 =?iso-8859-1?Q?xOFi2w6sFns6ssQCfKZwKagvc1rLE5OSVhG78ziKWDri0XEYlX1nrY5rMP?=
 =?iso-8859-1?Q?lC3/lEoEptpCkDUNapzViuIaurvMqccco9WdRXPBgoZjNLaKbnJYgjyrho?=
 =?iso-8859-1?Q?PJigEjujHDEKcpn2ChUphP6C1nxrWDYYV0QxiTilK4xx/0/nTB4oNtPA+A?=
 =?iso-8859-1?Q?Yr2JBoPqQaKslFeT6Sz7xbJHLImo4SuV9R9sTtDfJ9wFBpjNTMeQ/tn+Pp?=
 =?iso-8859-1?Q?eCwhVyx+tKzHLRLL4n1wp00NBQq88JPzu6uUJFP8Spl0zXg/RmtLr51HVE?=
 =?iso-8859-1?Q?DJNBrL6qTmIw+ZQfMOeSgnREZg1/dTaiEwONW/eVFAzduOIt40IZXm9tJl?=
 =?iso-8859-1?Q?BwbMMoYNlUiGHuW3xFlY2brCf9k0de79iQ7kjM1keS/1a7uhFSmneSqUkS?=
 =?iso-8859-1?Q?f8Tej/Nv3EN9NHuth6RMqbr3DzDyQfeuk8nxzKlKQUGt4j735cQg2Nb+kY?=
 =?iso-8859-1?Q?jHIbYFZJabNI+DO5s0/YJaTgWGzEt41nYTQlRe7dXfUieHyfVQPcd+40wL?=
 =?iso-8859-1?Q?nKR7t985JiAN1mYFiiaPpzKN47b+/wIgItahDQNkwdlpNCt70hgDJkkQxH?=
 =?iso-8859-1?Q?kdkSSVYRQXrUfWJelalTpwfYSqq3cG+t0caBdMpzkAt7hL64zXpAagipik?=
 =?iso-8859-1?Q?K8Ui3V+ENgARlbYU3UvjW9WQTXBtTHOVUeQ1H/7rN05bLcqf1oST2Jv9nW?=
 =?iso-8859-1?Q?yGmzm56AWmsevJdJ3k10gkn77isDTt2uyJh8POcoLt7JoD3NFtlAObFII8?=
 =?iso-8859-1?Q?MXLaNg9Djr3MkbT/c0k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2248b8c-d36f-4c9a-4200-08db9269185d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:27:08.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brecjXX3AwedZpIhcxDPQtpBnATAuZ/d6rm1AtO9yk72g6LqluwQ2mkKqR3SNqwe8eEZOeeZrAg1UD3eKpw95/4Lw9WHqs4uwVhc4Bm5NIvE9a2Lk/X5n7pudAyEPAP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 1/6] drm/xe: Add sysfs entries for
 engines under its GT
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

On Tue, Aug 01, 2023 at 12:47:37AM +0530, Tejas Upadhyay wrote:
>Add engines sysfs directory under its GT and
>create sub directory for all engine class
>(note its not per instance) present on GT.
>
>For example,
>DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
>bcs/ ccs/
>
>V7 :
>   - Remove xe_gt.h from .h and include in .c - Matt
>V6 :
>   - Add kernel doc and arrange file in make file by alphabet - Matt
>V5 :
>   - replace xe_engine with xe_hw_engine - Matt
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

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/xe_gt.c                    |   7 +
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 122 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
> 4 files changed, 143 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 4ea9e3150c20..2ddae8e312b2 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -74,6 +74,7 @@ xe-y += xe_bb.o \
> 	xe_guc_pc.o \
> 	xe_guc_submit.o \
> 	xe_hw_engine.o \
>+	xe_hw_engine_class_sysfs.o \
> 	xe_hw_fence.o \
> 	xe_huc.o \
> 	xe_huc_debugfs.o \
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 28bf577c7bf2..5436ce651076 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -28,6 +28,7 @@
> #include "xe_gt_topology.h"
> #include "xe_guc_engine_types.h"
> #include "xe_hw_fence.h"
>+#include "xe_hw_engine_class_sysfs.h"
> #include "xe_irq.h"
> #include "xe_lrc.h"
> #include "xe_map.h"
>@@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>+	err = xe_hw_engine_class_sysfs_init(gt);
>+	if (err)
>+		drm_warn(&gt_to_xe(gt)->drm,
>+			 "failed to register engines sysfs directory, err: %d\n",
>+			 err);
>+
> 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 	XE_WARN_ON(err);
> 	xe_device_mem_access_put(gt_to_xe(gt));
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>new file mode 100644
>index 000000000000..7dc97fb13095
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -0,0 +1,122 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+#include <linux/kobject.h>
>+#include <linux/sysfs.h>
>+
>+#include "xe_gt.h"
>+#include "xe_hw_engine_class_sysfs.h"
>+
>+#define MAX_ENGINE_CLASS_NAME_LEN    16
>+static void kobj_xe_hw_engine_release(struct kobject *kobj)
>+{
>+	kfree(kobj);
>+}
>+
>+static const struct kobj_type kobj_xe_hw_engine_type = {
>+	.release = kobj_xe_hw_engine_release,
>+	.sysfs_ops = &kobj_sysfs_ops
>+};
>+
>+static struct kobject *
>+kobj_xe_hw_engine(struct kobject *parent, char *name)
>+{
>+	struct kobject *kobj;
>+
>+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>+	if (!kobj)
>+		return NULL;
>+
>+	kobject_init(kobj, &kobj_xe_hw_engine_type);
>+	if (kobject_add(kobj, parent, "%s", name)) {
>+		kobject_put(kobj);
>+		return NULL;
>+	}
>+
>+	return kobj;
>+}
>+
>+static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
>+{
>+	kfree(kobj);
>+}
>+
>+static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>+	.release = xe_hw_engine_sysfs_kobj_release,
>+	.sysfs_ops = &kobj_sysfs_ops,
>+};
>+
>+/**
>+ * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
>+ * @gt: Xe GT.
>+ *
>+ * This routine creates sysfs for HW engine classes and adds methods
>+ * to get/set different scheduling properties for HW engines class.
>+ *
>+ * Returns: Returns error value for failure and 0 for success.
>+ */
>+int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
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
>+	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
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
>+		khwe = kobj_xe_hw_engine(kobj, name);
>+		if (!khwe) {
>+			kobject_put(kobj);
>+			return -EINVAL;
>+		}
>+	}
>+	return err;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>new file mode 100644
>index 000000000000..b3916c3cf5b3
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_ENGINE_CLASS_SYSFS_H_
>+#define _XE_ENGINE_CLASS_SYSFS_H__
>+
>+struct xe_gt;
>+
>+int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>+
>+#endif
>-- 
>2.25.1
>
