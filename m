Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA3C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85510E16B;
	Fri, 22 Mar 2024 16:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVIlVjG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BF10E16B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125520; x=1742661520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qHdyX4o3cHEVz25HZ0twd4QVXVaDZL++WmbBP1EpkW0=;
 b=hVIlVjG/b2iwDubV/NN9lZqE2bA+1dGX3c58OPZUvl3fK0xBK5Gi6pp4
 e3MO54gPDz9PaAdO6PLkC2Vf+07UKq0vfiKGhMHL8qM3oCMJcMRLVk2gf
 K8GUD3dn0WDYpjJ4MB8xVT2vsFCKz9N6qPuvuXRGJ5KWi6/I0BvnG9xia
 j1kbFkOww7ToYnPn7GK+6hZdHc9p0saPF3TcREak4TmZmJMLWfxiIb09k
 7Yaybizb8oAl9dl9dPKBYhz3AEZWAYKaZzpx9l1NfFPJHgmh0R47bBjo+
 DCkXs+Yp/sP72HoINNKkwAlpJZyaft0fzb5kCpdJPmG6vto15wcoubK8t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6372770"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6372770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15057536"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:38:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:38:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:38:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:38:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX2AK3SOYw+dhO254F/9LNbHboR/YY42atMskVPxHAn5TTVAvQwHI2I2Wpz55LJvyxSYd5T/QNfCuXtWa62NPvX4z0jNKM14mD1xjYqWbpcMGkTmXkxhGdkoNIp3VpzwWRhFDMkJAy4VZc2wZtT1zm9FrxzwjZrjehGdMrn2l6NVwuP7aCs/yPdpsL7PUw0wicFZdc4lxx3V31060rkHV7oE1/VPw+zRUK79FQz+RV2jFTC4oiD4ZB6Ohpz78UXY/5ULrIhFEyJxWVvet2NG3VVrU+Yd9RZL+ZVF2RcL1zUiGiOqS8JwS6D8rZJ/54/nP/RLysplPGDEplitxAL5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuadtTULsppJVyeQthWnOUj1D8XwzyXS/ChwKScnCtQ=;
 b=Z361wkILLHf5vTv7cJpvP6hDVHH9EtSBuf01tTozsUZg6miyPFW/XeSUC42RFcSxS0uQ1ZzwQwkVqZ/zvCpz1iCJxkV5C7hbpgOnNCdMPzwGhqyZcXkrO0f6fe+cuMSH3WP6SyLpB/a6NPfDuShbmGpli2XaqWjKU/ZMJTkXt37bbkLO71XCIXdUzJcfYTiQ5lghof/Ou0ZnOXRcQB3AAuUVSwhGGYD/F/V5BEObhd0Wf/UEgjIBaeLuIuutND4cp1V3Qr4fQIL4XaTmXwqAkl114Op5RMHA6me0L2TTbB/7y7UwCX4PIieYF0IdA4oiUOsLGLXQdNDBEnpmaNmYuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 16:38:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:38:36 +0000
Date: Fri, 22 Mar 2024 11:38:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/mocs: Add debugfs node to dump mocs
Message-ID: <6xi3r2emdsiibm5kuquvikpledccph6ii2e7oywhphrwze2bcr@i5pwpingrksv>
References: <20240321130739.3311199-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240321130739.3311199-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a433405-2f3c-4523-fdd8-08dc4a8e8559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsJQKSG6NEi0ZjqRB3PGohHmv1JzE7AD4V0AoLCx27zYc8/s33hiHXKmIeSp1hO9IY/JWEK9dzQIKiabDpZvgsaxr6DoGxbGsDf5g9cwN+CDejvMf85QsExA/BMqHgJ1/ML9xD//NB/ee43tHMxV//k1yDbTpG8MEr7rmUZneVfvVd6Qoa7Sm6y+sUSZsQueoZIHoyH1ByiAlHWXJzLgwCOjHvWfXmtX44sPc4xSc+4ofr4gcWhnveRtnIdEg+R1pNgYcWcgD4gS3Q5m4+nwEV6EqloSGT4gWDZvhb0zUKpxpWmkc39qR3tgmesJzvKVCH8cxg7csCnY/RX/qBlKG4/rBuXAhQpt8r/B75KH4s0z65gCbKXilCaVaufz5o3EGeknbeTzLK/prm+glR/78tlbVoImYRsugsXmi4iBTnnv4QAg6q2iMv1x5KtkVOnbwvnJoKzDQduyiR8nMf26LzUQTH5HGTb74qLm3TZPothCdvvbkdQ4qp6W7x5NhfWLzHlITEEm9YZeUG5G6+Ngk6YZ8bNNZO5y/R0i7IkkV4cEGqyhUYZjJENKeBHpxZ/zU7VrrcPW2HROu4RHR39ofc6HWlc49rkZRr8n+0G82XDHMsiXOOQMGTYAt/gzhpFNn3NDvJiK8eRa5qSa+bwmtCDEdvtXm6mf9/XZmzGoBfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FW+WnQXtznsqe7bl1wuCdC52cM73D3iLvvWSjCWhu0/R4fQthsKqLyMv/aWp?=
 =?us-ascii?Q?l2TcWw7HdR3m5+h6cXndNegh3AqXhKCGju0ehpmjAeA4LnfSGM5tE4xH1JFP?=
 =?us-ascii?Q?e6YX07UiEB+whtPmD/ObQnPhJbo2OSXVsFexomN89geP8pQ83j5Q9+fQkloj?=
 =?us-ascii?Q?phgvbRdLH75pZx8sfiFhjLl0V6ktwzibW6/5doCwz2pFc9WqqktOuUFes+WU?=
 =?us-ascii?Q?IvJMIZhi/2vReKhTbytcVWlo2eKzQHmBdM7GgT/V5e7LXQ2MISBUEeBm6LPf?=
 =?us-ascii?Q?S/B1x3qxS3f8MkEXY4kanhC72Y32U7d+5yfy8K0ggJ19P7nN15+C0n3RD5fh?=
 =?us-ascii?Q?a08iviDlgHVBiNUJCIz7S37DpvUng5cWI5wHywT2gFVjqFlUAaCpcqTtUzIC?=
 =?us-ascii?Q?dNHlJDGBsqXYn1fwQU9YStmmRjA5FhCrsZ+cmesW5MdhHUhQZT95AaZ9JJeq?=
 =?us-ascii?Q?dC2aZAARfST1Ad8IbcHHC7YJ49kiSFwk0o5DXFP/9gHnmqFTKkkvJZEIT20w?=
 =?us-ascii?Q?Zo/SU8qKpE2ATaAtP2Sh+K6aE2ItVNdOGvIU6baTFMsZPNgBx7fS9rumRM4H?=
 =?us-ascii?Q?P/jlKr7DG0R/WKu9vP+iIVRLfdAhpJn0wJpGkXg+dDh5PqqGJQ/NgPzvyAcP?=
 =?us-ascii?Q?oTkfFhnJWGRTWJqabnAB/zcN8QtxdNaognHmf6o3ZHdAl32VZhsHt/MasjLU?=
 =?us-ascii?Q?VW5IPdd/dkxJpQPoBJxPzZi9HbHVAUTdGVE8n7GKTKYIutV2pIVR4348t+ws?=
 =?us-ascii?Q?OIT4ZvUE0r01A8g7mtKjMAFT75EbDcvsE5E2B7x+6/Oigh0wibOXOX/E1O6O?=
 =?us-ascii?Q?wyq4/SPayKGtjD6JVtkL2bey75SsGRYHTxTsGWfOlFkyjC09vh6F451P1Dfz?=
 =?us-ascii?Q?ATJdopVaSVg4g9pT4fjRe06VMDKSXjr4E9UmHCF+EF6bLZrc70T+SNzx7lxx?=
 =?us-ascii?Q?GaHTh7YsxJnyJcJgHHhp3Tz9wt7qv1dUffW4m6+YAWTI5sCQECpui829mXcq?=
 =?us-ascii?Q?xsiONYJaBKADoC6FkVbJytO0dIrSlIzHXA6qtRW3mdjaiKBZtfayjogSw6GG?=
 =?us-ascii?Q?fRKEuZgMzaddRCWftE4n9YR58bE+KOHGJQ10vNYv1Al/OirTHN7HMU5VX6qV?=
 =?us-ascii?Q?3v1aVmQrzK7ZHkATWO1l55uJN3t1MORKOnmLnoBMKMYJoyMHlR3fIu6NrvxL?=
 =?us-ascii?Q?+7QhyMLPJ2Q9desdMYppeFL9oeUM13YJqgclzqJb1z8rFYwwGSewp4DS89WN?=
 =?us-ascii?Q?qc5zT6Ew9qlCxYdaU1PhsEiAPrfxHkR4CFkRb/Rj9bQ3H/oViCSP9rLJvjQ1?=
 =?us-ascii?Q?+0CMttd4AL+gK5nNm125lH1Z4LLyo7W7po39kQ1CM8Z+2FEZ64Q9ZeFVVGzs?=
 =?us-ascii?Q?uAuZCcYJ7EoiDwzzr7VKtq9+PaAW42prw7VP3f7d9/OKxJMo5oRf2QIrHned?=
 =?us-ascii?Q?8lKDiztqrAMTcnMbp/zH+rlqhXDElJ1qiRV8y0TUYyrXeb3v+CtQ9ARSPVMi?=
 =?us-ascii?Q?soNdfd5bmmmHI1vIMWqGmr91rm7gxnH7Rw/+GNxmu6HV8SSQ690ouqBob9QM?=
 =?us-ascii?Q?diorSq6R1a0GrN4sMHD1ZQTRdLRhzbILkvUM0amrLX+oDyHDgGyHUVjcTvwY?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a433405-2f3c-4523-fdd8-08dc4a8e8559
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:38:36.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvOawi1F8UVwo3MnbV37UQhtumW6h9H1PeQEBHvpdzxb2v2ZCFuixmAB1Ou/mtBD/9rdR3e8L5+3Z0irQsjZJw/EcFbkWu7knhvO3BcxqJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
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

On Thu, Mar 21, 2024 at 06:37:39PM +0530, Janga Rahul Kumar wrote:
>This is useful to check mocs configuration. Tests/Tools can use
>this debugfs entry to get mocs info.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 +++++++++
> drivers/gpu/drm/xe/xe_mocs.c       | 45 ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mocs.h       |  8 ++++++
> 3 files changed, 66 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 6b4dc2927727..918be3b90ba9 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -17,6 +17,7 @@
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
>+#include "xe_mocs.h"
> #include "xe_pat.h"
> #include "xe_pm.h"
> #include "xe_reg_sr.h"
>@@ -233,6 +234,17 @@ static int vecs_default_lrc(struct seq_file *m, void *data)
> 	return 0;
> }
>
>+static int mocs(struct seq_file *m, void *data)
>+{
>+	struct xe_gt *gt = node_to_gt(m->private);
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_pm_runtime_get(gt_to_xe(gt));
>+	xe_mocs_dump(gt, &p);
>+	xe_pm_runtime_put(gt_to_xe(gt));
>+
>+	return 0;
>+}
> static const struct drm_info_list debugfs_list[] = {
> 	{"hw_engines", hw_engines, 0},
> 	{"force_reset", force_reset, 0},
>@@ -248,6 +260,7 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"default_lrc_bcs", bcs_default_lrc},
> 	{"default_lrc_vcs", vcs_default_lrc},
> 	{"default_lrc_vecs", vecs_default_lrc},
>+	{"mocs", mocs, 0},

since it's very similar to PAT, please add it next to that one.

> };
>
> void xe_gt_debugfs_register(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index bff659d20062..a0416100912b 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -574,6 +574,51 @@ void xe_mocs_init(struct xe_gt *gt)
> 		init_l3cc_table(gt, &table);
> }
>
>+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	struct xe_mocs_info table;
>+	unsigned int flags;
>+	u32 ret, reg_val;
>+	unsigned int i;
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	flags = get_mocs_settings(xe, &table);
>+	xe_device_mem_access_get(xe);
>+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+
>+	if (ret)
>+		goto err_fw;
>+
>+	if (flags & HAS_GLOBAL_MOCS) {
>+		drm_printf(p, "Global mocs registers configuration:\n");
>+		for (i = 0; i < table.n_entries ; i++) {

watch out for coding style. here and in a few places below.

>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+			drm_printf(p, "GLOB_MOCS[%d] 0x%x 0x%x\n", i, XELP_GLOBAL_MOCS(i).addr, reg_val);

let's use the same output style as xe_pat_dump()

overall lgtm

Lucas De Marchi

>+		}
>+	}
>+
>+	if (flags & HAS_LNCF_MOCS) {
>+		for (i = 0; i < (table.n_entries + 1)/2 ; i++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+			drm_printf(p, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr, reg_val);
>+		}
>+	}
>+
>+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+
>+err_fw:
>+	xe_assert(xe, !ret);
>+	xe_device_mem_access_put(xe);
>+}
>+
> #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> #include "tests/xe_mocs.c"
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
>index 053754c5a94e..d6fa4485a6e9 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.h
>+++ b/drivers/gpu/drm/xe/xe_mocs.h
>@@ -10,8 +10,16 @@
>
> struct xe_exec_queue;
> struct xe_gt;
>+struct drm_printer;
>
> void xe_mocs_init_early(struct xe_gt *gt);
> void xe_mocs_init(struct xe_gt *gt);
>
>+/**
>+ * xe_mocs_dump - Dump mocs table
>+ * @gt: GT structure
>+ * @p: Printer to dump info to
>+ */
>+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
>+
> #endif
>-- 
>2.25.1
>
