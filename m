Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98EDC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E010E1F9;
	Tue, 12 Dec 2023 14:00:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19510E1F9
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702389620; x=1733925620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YdkD1f4eBA0kbdZ/Cz17g/AMtryZtC4p6uppKbL4xek=;
 b=fUTAXq6GJfjhvjegl4zqkQ8cehNy/c4TqR5sV6wKw33dK10qcFIESpGm
 CxIrj/cLh2ytFbWOM+heTN4kjWY3CsYylyPgk2DT+42apBo5yT1F+Vi5B
 dlq13+h+PKJl9WpiQHQe4EHDaGophyF9CAlXzUK4C8QagYCzj+3l1DYhm
 jzVScoBWNPjWYZhTWch/tSOTsPdqzW0w/TIKhpFfM//RAgof/M1Ethyka
 dqTH5if0DNwJQY0uNxMLwlaGVkfkuEHb1rfsgkYuaZUjRKesRgF1q3hx4
 obAQyJiYn5UUzwnIQqFau87ea8XaGOjtWN4mn5fF10byw2+xHi8XVFu9B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="385219276"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="385219276"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864213314"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="864213314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 06:00:18 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:00:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:00:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 06:00:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 06:00:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTl6XS1sl4wJL1beA3wCChhKJl6R0clTSR/vaaDwUNxXxVIYx/uY0Pv7zh0hOFJvACjEXhoXTSTLVaxJs1as8azG9mHDF8tUA+maE4ZyhQZSQcR98dixtwfyxWkyJthhJqN3m6yWixCpjoXSXUDbnEjrrvbLNTb52ytXZ5ZxeKSPF0g42EnZEbx0/3Efhr5hAgsKfrJrtTJyvahBFbUqUUTcd/YLllTinWAJHFepdg8H1Qrt1ioCzupllz7jED0p5KNROb4MO5VVY/RCZd4pt6CRy3JxzDdisooE+dMcsNFwPm60wO3VPIniWjS1vVVpL9yowy/ZKgAQt/hRvyVwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnTY8m7Bw9HHHmtAMfHT3ywSrSzu6/ZKZH4El9iqkxA=;
 b=BREtqvtbBn6vgNuLKrbFrjtNHvsv7JNhiJ4/z8vlwiZWGs1vAY8g1fXkv4AAehb1xOC93mllnJ2Ri8nWBj1iybl4V4x4av/9FsNL+Aey+yQgemQNjDSGOgGA5+Rb7QFDxsJu+p5mTP3DLhxuiI1mWYWdjtNiG90SXbS4csy6lXIao14wAwvqgxmyMfpgsi/eIBjych8i9w3+Idm4tnzW8peC/++ICYXHJmo6hG+TIFsQoqfh7rLwpfi8a7e7LSjChB0v3w6F1Vzu64BDiLSkc1FCxHSzpxCqexPPQX7iQJqx2D1hpFa9CXNtEq9LET5Q63BDi+5hOGQKr+/n58r1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 14:00:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 14:00:14 +0000
Date: Tue, 12 Dec 2023 08:00:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Cleanup CCS mode related code
Message-ID: <ijrhmjdehox4awe2n4gndmhqmreed2mqqb4juk6cnq36fywixy@pdjfuzdkkpy3>
References: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: f21efded-aec0-46d6-c7e6-08dbfb1aa9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0H0EgKxPDO8BxXazHrD1ERJljx4m3rrmbWMGTdpolKY20jVfozSFJjSHtRmUPa/q/qEoKchnz7abl2mh9l/RWnTHyfXNoYNa5fwaRs9IJY349r740ci22yIP8y8fVg6+roKpQZp9kKwDaEtp6D74fdDUqw3KYAXC/NG1nSwA7GBI10G45GfZ6P3DV5YSZ/rk0h0LA+pqie6qXBJYZRC7QtqMEd07gGwtkXRMRp2dXu1qxMkPl2Ax84pHs1Afo1/sNceddj1hbo32/6+u5j9SGPBOpjLYOsvpllVvkKYcTVGXwLqyTCPy6zQSJ4YlO8f5GAkUaEAUzeWPKGkNpylP+SmIb/cvNSSv9enZcDZlzl1SAOCjZvSy4wUy6Qv2BqS64wGaaaEngO8Rd2PrxwdrmVnz5u/9umSLwL4w0AfrieDXmrw7po+7E2mUlctpFR8lnWgHXd/FKEOIQXD2+4VxvOgCCe0ttyPEYLjFH2rh3MkbihJdP0uYcWtgWxiCzE4yEzoZwRqPjH4hV4HvPm/KbFpu5oWj/lwZvP+zZ7wxXyNITfujS6aInzPA1sHUIuT4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(82960400001)(86362001)(38100700002)(83380400001)(4326008)(5660300002)(9686003)(6506007)(6666004)(6512007)(6486002)(316002)(8936002)(6636002)(66556008)(66476007)(66946007)(6862004)(8676002)(41300700001)(33716001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlUvQA9G0VLvIejVEkLLKa4ezsroqDwdRDFzqs79HiSjKuGY1JR5lEtTZ6Fx?=
 =?us-ascii?Q?InjsuMmDImjZz/h7zwU0OCvI1i4tC6B86bEyGOXlvhHdJwDOehuO6ems8Y3Z?=
 =?us-ascii?Q?aMtACHY37n6hG8Pfdun172NuzKdNY7O12n8VTN6wcvjYw2MmyN9TptSHXt7v?=
 =?us-ascii?Q?FSoUac+uw9RymOpS78caf1PnXiHBlKWypsFfWsejzt53dv5YyOnwuOU3MFcu?=
 =?us-ascii?Q?Cp1SRTFE2liLX9+qI7Edk71e2FvWjOPI2x9u78dQ9la8UbGzSDIe3tPfT75E?=
 =?us-ascii?Q?qwWHQS8uUKL5/KxB5CRKZUeQgv2TnrEz1734w4/EvE3IrFILZZJe3xjW9hAd?=
 =?us-ascii?Q?NNRhuYDjqD4JZlxNhAAfFCbtQwG3U9t2ZfUD/HylJ1g3S/gFWy5CSs9zShwi?=
 =?us-ascii?Q?V6CFK0nqoaudUN3zAmSWzvyJr13I+NH59/oYRsk2HqgJGv1086sqkNtesgH+?=
 =?us-ascii?Q?VCJAsOLN0QQqwKpv63Px++OnvirjkEhyDpv4GTfvKrQEFU6HXrqnCBMMCZ2x?=
 =?us-ascii?Q?rXxdPAcoO99F20EJC3OoEupgdMry782tLpoVcsMKRyiylV2SKLk9NY04uEKV?=
 =?us-ascii?Q?tExiSy8wr7h97ziPUzJdPVs1v+eAp5Cj25Hxwx3QAuoXQ59MCZTp6grAj9Sp?=
 =?us-ascii?Q?bHf9x4cWFZRdfL/znSOCiX1W+Nq7ZHE5XaqlrbXN1zuMR9tP5IYVY3Vakp1R?=
 =?us-ascii?Q?Olxf7UFOPeLwe/S+sN9ZT8c/jRkc4wOGq5lv9H2/eUZKLzxr8ikgsCr9+cuR?=
 =?us-ascii?Q?G7we+AA4jE/azLepzcrOkREATEmR7xvfObm3pdzvL9dh7qRQiuRftpBHJVSG?=
 =?us-ascii?Q?uPQi0PBA3qQeQVX+io/trF3ZnpUoW52jXeTj6pi15CzohYhvAl8dooLGkM3N?=
 =?us-ascii?Q?jW41on2DWoteF9YmwCQQJHfObT3gZLHZeizNPgsmfG6L0rK6DhYilkXDneaN?=
 =?us-ascii?Q?7vPy4G+1P8tjcny5ceY6i+JIs++0WOxqzIscghh5S2Elzc1L7t7G2OE8qyOc?=
 =?us-ascii?Q?HBTJ9yvScaEmBFlFF51MCkETy7UUcSS1cOradq/QPoMyJHEMycC5Hyl0zLjZ?=
 =?us-ascii?Q?5hxRCrrYBSIaS/VGv+fRptPV8xoDnhtlYVZhuM27Bfye3GoWQbJOWWMGu3ap?=
 =?us-ascii?Q?+7XZOmsL5PLMaOHcnWrq56QsW6Cr3cJGVHKKZcOMLzIGwGdAQNCB2um3kFWx?=
 =?us-ascii?Q?Ht4jo3vnpxVB9uhvYOmll9Bp1xXNO3PQIpVnWUEvQT1G11pQ75IDc1ATP2qs?=
 =?us-ascii?Q?kKYlziaYNbjxW7VxN27Sxf6PIr/nCgOWTJVUT8qYAFHeWyrh0sTKSh/iBPhS?=
 =?us-ascii?Q?gvM2oloZ3MAv9xHcDc0k5omz4f5AD0iNcwAR3ZNHzIzPPNjRdVmVZoh+g3dI?=
 =?us-ascii?Q?LT1mRPQO1ex6KKCsaumLuN4zzAUxIISExItwUqNYU2A6XVFQ31GVGozr0cYA?=
 =?us-ascii?Q?+1Kfh5sGj645gzpIHaLfndG75XT0XsGBWSTlSzNQQp3XHkI/eRXDuyRYZsvs?=
 =?us-ascii?Q?Chj7pE03E998KO2jc81VoY6yDvk79qDdh47Zst01G8A3DWpRYQc8O9zolMZN?=
 =?us-ascii?Q?0hpLV9MXUg0yOmX5CD7kRFJTCgFD3h7iqDYPQN6cDQor/syw2bBb3HxQ59Dx?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f21efded-aec0-46d6-c7e6-08dbfb1aa9d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 14:00:14.2140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj1ppZwEtgI32dNAzU1WR5RlY4UpLUsMqiO0I0tt67FMKGTo1lFOWsEmliWRZqub8FQjMclMsifpOJbaoyXwiVsCTw6EWcuADLJujFng5IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 12:54:24PM -0800, Niranjana Vishwanathapura wrote:
>Refactor some of the CCS mode related code to make it compliant
>with the coding guidelines.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 13 ++-----------
> drivers/gpu/drm/xe/xe_gt.c           |  4 ++--
> drivers/gpu/drm/xe/xe_gt.h           |  2 --
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 23 +++++++++++------------
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h  |  7 +++----
> 5 files changed, 18 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 5f5a72e9d0d8..cb9a1a34c2e5 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -405,18 +405,9 @@
> #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>
>-/*
>- * Total of 4 cslices, where each cslice is in the form:
>- *   [0-3]     CCS ID
>- *   [4-6]     RSVD
>- *   [7]       Disabled
>- */
> #define CCS_MODE				XE_REG(0x14804)
>-#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>-#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>-#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>-#define   CCS_MODE_CSLICE(cslice, ccs) \
>-	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0)


>+#define   CCS_MODE_CSLICE_0_MASK		REG_GENMASK(2, 0)

from the symbol name in bspec, this still looks odd, but definitely
better than before. From the symbol name, it would had been something
like

CCS_MODE_CSLICE_ASSIGNMENT

>
> #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> #define   FORCEWAKE_KERNEL			BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index dfd9cf01a5d5..523942cd1157 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	/* Configure default CCS mode of 1 engine with all resources */
> 	if (xe_gt_ccs_mode_enabled(gt)) {
> 		gt->ccs_mode = 1;
>-		xe_gt_apply_ccs_mode(gt);
>+		xe_gt_ccs_mode_apply(gt);
> 	}
>
> 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>@@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
> 	}
>
> 	/* Get CCS mode in sync between sw/hw */
>-	xe_gt_apply_ccs_mode(gt);
>+	xe_gt_ccs_mode_apply(gt);
>
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index f3c780bd266d..11265e851a81 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -17,8 +17,6 @@
> 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> 			  xe_hw_engine_is_valid((hwe__)))
>
>-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>-
> #ifdef CONFIG_FAULT_INJECTION
> extern struct fault_attr gt_reset_failure;
> static inline bool xe_fault_inject_gt_reset(void)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 529fc286cd06..7e847c8eab32 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -12,17 +12,24 @@
> #include "xe_gt_sysfs.h"
> #include "xe_mmio.h"
>
>-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_0_MASK + 1)
>+#define CCS_MODE_CSLICE(cslice, ccs)	\
>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>+
>+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
> {
> 	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> 	int num_slices = hweight32(CCS_MASK(gt));

we have cslice and we have gslice. This is cslice. Anyway, this CCS_MASK
seems to be leaking information from the more appropriate place.

> 	struct xe_device *xe = gt_to_xe(gt);
>+	u32 num_engines = gt->ccs_mode;
> 	int width, cslice = 0;
> 	u32 config = 0;
>
>-	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>+	if (!num_engines)
>+		return;
>
>-	xe_assert(xe, num_engines && num_engines <= num_slices);
>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>+	xe_assert(xe, num_engines <= num_slices);
> 	xe_assert(xe, !(num_slices % num_engines));
>
> 	/*
>@@ -60,7 +67,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> 				cslice++;
>
>-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_0_MASK);
> 			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
> 			cslice++;
> 		}
>@@ -72,14 +79,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 		   mode, config, num_engines, num_slices);
> }
>
>-void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>-{
>-	if (!gt->ccs_mode)
>-		return;
>-
>-	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>-}
>-
> static ssize_t
> num_cslices_show(struct device *kdev,
> 		 struct device_attribute *attr, char *buf)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>index f39975aaaab0..1d9d5f0bd222 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>@@ -6,12 +6,11 @@
> #ifndef _XE_GT_CCS_MODE_H_
> #define _XE_GT_CCS_MODE_H_
>
>-#include "xe_device_types.h"
>-#include "xe_gt.h"
> #include "xe_gt_types.h"
>-#include "xe_platform_types.h"
>
>-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)

I think the logic can be reworked slight so it doesn't need this.
If keeping it, please contain it to the only user. We don't want other
parts of the code to include xe_gt_ccs_mode.h to use this completely
unrelated macro.

Lucas De Marchi

>+
>+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
> void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>
> static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>-- 
>2.43.0
>
