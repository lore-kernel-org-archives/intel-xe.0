Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2760CD8CA8
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jun 2026 21:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AA610E127;
	Sun, 14 Jun 2026 21:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRfeP2nK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE1F10E127
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Jun 2026 21:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781472211; x=1813008211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/4+eY8ggXCgsBMHeIPfeTocgQo9CUQ/uyQUj2Ac6N3o=;
 b=HRfeP2nKrs4k03QySUtin5nSSDt4nLf/AUiF1aiiUmGCrHjSLuj6GCUJ
 aImfBCBH7bIgjiTLoyaajQF5yOhVdD/FVLevMt80LpO5nWRhof6OllPOi
 pHn3rmwaYAL9kpcSMlULUzBWYG7Mqj36ZBSJbluUJmebmoA4e3ystc9j0
 Kdqb20FR5A3U6yV+A6DK8ajDmOm9lw9v+gnJl19Wn+3uC39Qul28gcno2
 FeRUzgzHJLLlFMpN40kkhvy80yLyL1J1Z4qvTmxw4wsDCTL2oXm1vHyVk
 q211ka3sOP2hgPCfopaDuaPE+6exeforqRgwHfH95Q4aY6U7aeEI3Zp0i w==;
X-CSE-ConnectionGUID: wEXlwbU4TJeC/wpkPp7tvw==
X-CSE-MsgGUID: Dr1ihaJRRGuEntdZvRl8aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82064102"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82064102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:23:31 -0700
X-CSE-ConnectionGUID: 6RpUwZ3IR7m3ZRtuCzKyaQ==
X-CSE-MsgGUID: GKrl7e9cS72Sq1wZYth/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="240954497"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:23:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 14:23:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 14:23:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 14:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVx8OP3wF72WW6JCGHou7zb0loJi7kGbAcWvz/Uv2iE83WltMOIRLT48M4KL94kjaemEp6HeFGr4E/KPwPYOsiqzUZObMbNYKAXnFS0Y60n/NfllXe48BbhfQcCzFt930wwxtOk1WSp83HLKPy55G3vpvtHgEfLZGVmxjO5+3lvlSL4JTv3/CNl9p6uOiiY3zrov8C01hjOSTqUogMTmmArYmKbe0qlKPxZ7PxISXev04JTUBlEfTofsZTEFgQ2Uf64NI8Y0mcW2rV6loMbpJ7k2ZeF8esslY4R6cWyNEgx+OhVvWsLVduZD6ZzaDI9XMlGnjp9z1NpcKYJjkhHzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIShrhiWlQaFDKWhgFYsjoufXrdoLiW5vADAsjedv4U=;
 b=lu5KfAl6739LMM51DIC0cq2+Vh5HZrUOzE1Njogl32nzhrN+TDz1IVRdGNvWK2HJpEW5L/DOCktvK/YaCvumapry38ju2TJ+rDN9EIIt+bvaIYUfhTPEs5h0Zl2aKpncqwVJns6f8oOeEy4vEbfIMW9Q6qHEu+ioXgHj5LzzCRrAtkAVAz+Z2BA2YWKEMgw+huauOkDwKzIG5cr4Lg4EJ9YEQ3IQxJqyL2gCVcqgAUe+kMEpNm41eTqHQP6JYW3+sr78+G/Zmh2KnopMBwWGW37DscHiPPVFEJNlZeNZixER6CuJ7MQG2ev2IH9nfhw+TU+svLzCrl8egleJHQHHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SABPR11MB9964.namprd11.prod.outlook.com (2603:10b6:806:50c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sun, 14 Jun
 2026 21:23:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.013; Sun, 14 Jun 2026
 21:23:24 +0000
Date: Sun, 14 Jun 2026 14:23:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/multi_queue: preempt primary on queue group
 suspend
Message-ID: <ai8byU_saZeu95PM@nvishwa1-desk>
References: <20260614211944.1268917-4-niranjana.vishwanathapura@intel.com>
 <20260614211944.1268917-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260614211944.1268917-6-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SABPR11MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a141015-7a14-4f46-76d6-08deca5b2abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 271Z3RV1Jyn8nLNw1q331+7vJ8EZNMGrQSNn+JjKAzzK35D7D1fvwAo3BGS6o6/6oFqvX5lLRxA0M9mcxnQ1nJe8x4xQBPIEY6Xy2R2kXHmaTeOZoUQdBEm5O2LsFJe23LWEKO0NMK5IKHi8QqPuypOk3rb6OnfzfSfq/AeW3n3wj9zfeboUO5uNfANTGBzyDPNIzFtbJD8usAMHmnCEYRRBFoFf9Bxc/6XyO8Z07S+ABy+cfXcduzmRDSuhNigX5xv9SnlO3voRhITsOC+GQqeY6uqDRTqRs9uAS46+tynFqiVgOwoqI68/BnuBx/yBBhGZsZZ9p80+QlBzyQVRWiMWS7hlM411+vWhZGhX6t+ergNL8lI/oAwqs3KAumgetItVkiAUY5D8byEdiz0e4DqElESBx/b5847RHhORo/3t0XrLwT8ZgZp6Wo2s8xw8SOoPW2eggOSY/wr1VXjZL9X9XUZt7FP5bIR9DNkeHrgAHOCaDfZwtJWK85BNesHfUko94ielAzFXZX/4Yh4qR4epdIXD4u+iZKcpflh7qsIQbRx3zlN9/ZNJvoXVmiZoMBNru2ZjGr7xAvc9k2F3nLsnjOIaiyCkJiq0gluolGFF1YKZC4xt4aA2orkA+mvpwnbCAq3NKKs+Oc3iv9GCfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hOpnFXWotzqOr+CovW2XbNADuecx5kvUsYlUf0/54JBt6tjoS7aX3rsKqkMe?=
 =?us-ascii?Q?zHJHTa11Ox8GWHIw+Gr0BGzyqwUQic44IyxQ55BsnTS3IjxySWsNx6Jf/sm4?=
 =?us-ascii?Q?rmkZAwkHsCJ+kHMb/cBdWeBuP8DFZpyQKTc9zVqO+AmUw65OV9FjVGBwOhr2?=
 =?us-ascii?Q?i+270ruerWo7RsnGKt69Avvf0Y+CPldgN+LEU3nQha2hhyWK46M1aauakmPw?=
 =?us-ascii?Q?z/JgcDGPoD/2D0icWCK0QCc/XNPR5IeSmzU76goN/SEuGRZYZPno0bhqx5w0?=
 =?us-ascii?Q?VrUH1i6myqLToCWg0/OxSRJ1dXLxuSOfO/5kvvzNg6obMzMCmn0Un9Fohb6E?=
 =?us-ascii?Q?V6YZCFzhB7fZHT44VL8pGLBUT0I7LNU6T5QsH4QRGkbzuvxvgkkJCmWwuBas?=
 =?us-ascii?Q?0aXNUMoausStQN57UpH2D+VlwVvnCEm0fphCxc9w4h5f9/YuabtpOgybQXbI?=
 =?us-ascii?Q?lmusqGG7kP6Uriv3U+klBtth1lfHvoJgZTCw/XvfTs+hB4HT6hj6T5ieB5O3?=
 =?us-ascii?Q?VZGymqEu7ACMrN423jY77/ggAq1BLGsHQJ2TJLsJUH5vS173l/Ne6Jz/lmmi?=
 =?us-ascii?Q?Jp6+Hz+UK3pHM4bDPRfi0d+OtGKTZNdXTY1+c3fGEPG40GbqNDh7QKURVFy/?=
 =?us-ascii?Q?2GfwsBkTwcISlL1FLMXAiEDqst3gIjauU/SYpGKTs07KcLWwq+EDcus8rYLm?=
 =?us-ascii?Q?NONenkC7ZNJKK3IyYd2UnhfEda3ATCEwIm+tfjhy/iU13ckEKXAYlP8z/nLN?=
 =?us-ascii?Q?F/1SDXs7Bmuh5BFW8+uPx4c74sjf7JObGRGse6RlqjA/ptGaJ91+h8dw9Zv4?=
 =?us-ascii?Q?l7FqDVew0mPWK5DGPjPYadveUgBs1r6QESdMYR5d8rxanj4U/ANqmZBAhrh0?=
 =?us-ascii?Q?Jz+0NEAaQcax2oIPH112WxhbSorWX9qIBgvos6khfXGbj4ft8yKwK1ICefZ/?=
 =?us-ascii?Q?QTJmYmdmZJ6AmBFOpnQpo5G8TSPaZuOL2XCTb8Cp/zgAudt52p0geM2V9ZRh?=
 =?us-ascii?Q?A99zP7ZXXeVShbvLRvRnRfOrpw4dDwtQ9EaxwMRHzI746LdB3BLsn3+OK/JX?=
 =?us-ascii?Q?s2xX9iAj6QOpZDI67szsWXiAOsPdp/ROshv/LY4rKGlL6+HpzsGAhxFEpEpt?=
 =?us-ascii?Q?Y5j1TXBYeY/YNct4Zj1R/dN7oAvSk794m+bdaEbMa69vpaphAaczkgJdQMvL?=
 =?us-ascii?Q?5sm6xanaZgNJFWjdGBi6NCGTQxmAhtzoaGmQBBYeV6gxGUou+rIy4F4zzZ4y?=
 =?us-ascii?Q?pkCZ1In+9s54ppN8GnYxaYt+rEprv3B6jZfmUoM5IoUtIJotT6ShyA3iR6jb?=
 =?us-ascii?Q?Nrqmz27R0JHiCTqt8BvYv54h2YPSqaRIVUcQoNNmxpDIeLbUpfMrvQNgJc5N?=
 =?us-ascii?Q?CcxDrJLJUzoi+pJ0hR8/myrkIYMIcyEQBDiV7dMUjUR5TBjxy9VNrKTXcM4C?=
 =?us-ascii?Q?N9lfpIoPLaXi0pqq2zSWUpOUZ9fzfkPYT6F/joVOtTkYD3RF70logEWo+7k5?=
 =?us-ascii?Q?P0U4e3ETdVXZFbaTNm8AMJHeaaSl591cgQbJR64hS2rY/l+NEttbcPiPKWX1?=
 =?us-ascii?Q?H8zUX6x8wnDmo8L5oOdzGzAxgWwGPvtdF+V4+7MD3PG8+nG52xpvqXecyaep?=
 =?us-ascii?Q?OSimIujrrZprLO5LN4PyN4iXVBYrt8vCxBgtUgJgXf39rBNkCZfK9+dhXCej?=
 =?us-ascii?Q?uTDeWoXjS0ecF3lzu4tShIOtL3XWtuLJTu6ePR9lfNRrVVAWZ5NMWuJVe2MS?=
 =?us-ascii?Q?vk/rh/inA+7LEsviOv6/w7pRawvssbY3D3SPR89j9V0tBwwnvigt?=
X-Exchange-RoutingPolicyChecked: Xx014vRZH+enVPMRgeW7AClvIl5dDxfabRBviwECXLYe+ZWwJ7aVbV/GpKu1lOvbT/AWimqHYs1csDnyzVk00eMMUFl0KljXxnM058ID6+kwt81gvm3mU4zKqxlNSSbQTl0T4SbCD9ruhkOXENQbA2IBVZavavlsErvPFkSy1usKxw8jacSAkS1dXpCvml9epAoBMtodXOit/ljo9Yud/uxBUSj9hxsGF6IA8GIu6IcGJaJ5DhVEnhDJwttrVFOb7KWajt54dZjVgxcpKP03gw09ugzI2WjnhuUGCWGs2GUmnN6yW9xt1ie6RDZJGX0Pg4BycmUQClbRIJV1nLrpWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a141015-7a14-4f46-76d6-08deca5b2abf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 21:23:24.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dArWP5yvvfRf1HRlp6WPwjZ8djtRmBhdn08xeHny+8gJsK3hUcsQkBfgPUnRT/ilAtpN5ZVtKy1t5cm1ve/9ZciQEXs15fjR6f+JkraIX2teSShAIFR97sPCa8LAUxQb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9964
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

On Sun, Jun 14, 2026 at 02:19:41PM -0700, Niranjana Vishwanathapura wrote:
>In a multi-queue group only the group's primary queue interfaces with
>GuC for scheduling; suspend/resume of secondary queues is handled
>internally and is not forwarded to GuC. As a result, suspending a
>secondary queue alone (e.g. on its preempt fence signalling) does not
>disable the primary's GuC context, so in-flight GPU work of the group
>is not actually preempted.
>
>Make a secondary queue suspend/resume like any other queue, driven by
>its own xe_guc_exec_queue.suspend_count, and additionally forward the
>suspend/resume to the primary so the GPU is actually preempted. The
>forward is gated on the secondary's own 0->1 / 1->0 suspend_count
>transition, so each group member contributes exactly one suspend
>reference to the primary: the primary keeps its GuC context disabled
>until every member that suspended it has resumed, including across the
>resume-all-queues-each-rebind-cycle behavior. group->suspend_lock makes
>the secondary transition and the primary forward atomic, and a member
>leaving while still suspended (queue teardown) drops its reference on
>the primary.
>
>Assisted-by: Github-Copilot:Claude-opus-4.8
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

This is continuation of work posted earlier here,
https://patchwork.freedesktop.org/patch/731120/?series=168035&rev=1

Niranjana

>---
> drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
> drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
> drivers/gpu/drm/xe/xe_guc_submit.c       | 153 ++++++++++++++++++++---
> 3 files changed, 143 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 1b5ca3ce578a..df95855a3d61 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
> 	group->primary = q;
> 	group->cgp_bo = bo;
> 	INIT_LIST_HEAD(&group->list);
>+	spin_lock_init(&group->suspend_lock);
> 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> 	mutex_init(&group->list_lock);
> 	q->multi_queue.group = group;
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index d27ce24daae5..7723e98690fb 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -62,6 +62,12 @@ struct xe_exec_queue_group {
> 	struct list_head list;
> 	/** @list_lock: Secondary queue list lock */
> 	struct mutex list_lock;
>+	/**
>+	 * @suspend_lock: Makes a secondary's suspend/resume and its forwarding
>+	 * to the primary atomic. Nested outside of the queue's message lock
>+	 * (@xe_guc_exec_queue.sched.msg_lock).
>+	 */
>+	spinlock_t suspend_lock;
> 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> 	bool sync_pending;
> 	/** @banned: Group banned */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 8803e70ae4fc..bb78a05f5c24 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1681,11 +1681,24 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	return DRM_GPU_SCHED_STAT_NO_HANG;
> }
>
>+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
>+
> static void guc_exec_queue_fini(struct xe_exec_queue *q)
> {
> 	struct xe_guc_exec_queue *ge = q->guc;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>
>+	/*
>+	 * A secondary can leave the group while still preempt suspended (e.g.
>+	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
>+	 * which suspends it). It holds one forwarded suspend reference on the
>+	 * primary, so drop it and resume the primary if it was the last member
>+	 * that had it suspended. Primaries forward to nobody, so they don't need
>+	 * this.
>+	 */
>+	if (xe_exec_queue_is_multi_queue_secondary(q))
>+		guc_exec_queue_multi_queue_drop_suspend(q);
>+
> 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> 		struct xe_exec_queue_group *group = q->multi_queue.group;
>
>@@ -2163,17 +2176,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> 	return 0;
> }
>
>-static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>+/*
>+ * Core suspend: take a suspend reference on @q and, on the first reference,
>+ * disable its GuC context so the GPU is actually preempted. Caller must have
>+ * ensured @q is not killed/banned/wedged. Returns true if this was the first
>+ * suspend reference (the 0->1 transition).
>+ */
>+static bool __guc_exec_queue_suspend(struct xe_exec_queue *q)
> {
> 	struct xe_guc_exec_queue *ge = q->guc;
> 	struct xe_gpu_scheduler *sched = &ge->sched;
> 	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
>-
>-	if (exec_queue_killed_or_banned_or_wedged(q))
>-		return -EINVAL;
>+	bool first;
>
> 	xe_sched_msg_lock(sched);
>-	if (++ge->suspend_count == 1) {
>+	first = (++ge->suspend_count == 1);
>+	if (first) {
> 		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
>
> 		/* slot must be free at 0->1 */
>@@ -2182,6 +2200,68 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> 	}
> 	xe_sched_msg_unlock(sched);
>
>+	return first;
>+}
>+
>+/*
>+ * Core resume: drop a suspend reference on @q and, on the last reference,
>+ * re-enable its GuC context. Returns true if this dropped the last suspend
>+ * reference (the 1->0 transition).
>+ */
>+static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
>+{
>+	struct xe_guc_exec_queue *ge = q->guc;
>+	struct xe_gpu_scheduler *sched = &ge->sched;
>+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
>+	struct xe_guc *guc = exec_queue_to_guc(q);
>+	bool last;
>+
>+	xe_sched_msg_lock(sched);
>+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
>+	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
>+	last = (--ge->suspend_count == 0);
>+	if (last) {
>+		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
>+
>+		/* slot must be free at 1->0 */
>+		xe_gt_assert(guc_to_gt(guc), added);
>+	}
>+	xe_sched_msg_unlock(sched);
>+
>+	return last;
>+}
>+
>+static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>+{
>+	if (exec_queue_killed_or_banned_or_wedged(q))
>+		return -EINVAL;
>+
>+	/*
>+	 * Non-multi-queue queues and multi-queue primaries suspend themselves
>+	 * directly: their own msg_lock makes the suspend_count 0->1 transition
>+	 * and the suspend_pending update atomic, so no group level serialization
>+	 * is needed.
>+	 */
>+	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
>+		__guc_exec_queue_suspend(q);
>+		return 0;
>+	}
>+
>+	/*
>+	 * A secondary doesn't interface with GuC: suspend it like any other
>+	 * queue (its own suspend_count drives its internally handled scheduler
>+	 * state) and, only on its own 0->1 transition, forward the suspend to the
>+	 * primary so the GPU is actually preempted. Hold @suspend_lock so that
>+	 * observing the secondary's transition and forwarding it to the primary
>+	 * happen atomically; this keeps the primary's refcount paired with member
>+	 * transitions even if the same secondary is suspended and resumed
>+	 * concurrently across rebind cycles.
>+	 */
>+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>+		if (__guc_exec_queue_suspend(q))
>+			__guc_exec_queue_suspend(xe_exec_queue_multi_queue_primary(q));
>+	}
>+
> 	return 0;
> }
>
>@@ -2191,6 +2271,14 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> 	struct xe_device *xe = guc_to_xe(guc);
> 	int ret;
>
>+	/*
>+	 * In multi-queue mode the primary owns the GuC scheduling context for
>+	 * the whole group, so wait on the primary's suspend to complete. All
>+	 * group members share the same GuC/device, so guc, xe and timeout above
>+	 * are computed from @q directly.
>+	 */
>+	q = xe_exec_queue_multi_queue_primary(q);
>+
> 	/*
> 	 * Likely don't need to check exec_queue_killed() as we clear
> 	 * suspend_pending upon kill but to be paranoid but races in which
>@@ -2230,21 +2318,52 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>
> static void guc_exec_queue_resume(struct xe_exec_queue *q)
> {
>-	struct xe_guc_exec_queue *ge = q->guc;
>-	struct xe_gpu_scheduler *sched = &ge->sched;
>-	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
>-	struct xe_guc *guc = exec_queue_to_guc(q);
>+	/*
>+	 * Non-multi-queue queues and multi-queue primaries resume themselves
>+	 * directly; their own msg_lock is sufficient.
>+	 */
>+	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
>+		__guc_exec_queue_resume(q);
>+		return;
>+	}
>
>-	xe_sched_msg_lock(sched);
>-	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
>-	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
>-	if (--ge->suspend_count == 0) {
>-		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
>+	/*
>+	 * Mirror of guc_exec_queue_suspend(): resume the secondary like any
>+	 * other queue and, only on its own 1->0 transition, forward the resume
>+	 * to the primary so the primary's GuC context is re-enabled once the
>+	 * last member that suspended it resumes. @suspend_lock keeps the
>+	 * secondary transition and the primary forward atomic.
>+	 */
>+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>+		if (__guc_exec_queue_resume(q))
>+			__guc_exec_queue_resume(xe_exec_queue_multi_queue_primary(q));
>+	}
>+}
>
>-		/* slot must be free at 1->0 */
>-		xe_gt_assert(guc_to_gt(guc), added);
>+/*
>+ * Drop a leaving secondary's forwarded suspend reference on the primary and
>+ * resume the primary if this was the last member that had it suspended.
>+ * See guc_exec_queue_fini().
>+ */
>+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
>+{
>+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+
>+		/*
>+		 * A suspended secondary holds exactly one suspend reference on the
>+		 * primary (forwarded on its 0->1 transition). If it leaves while
>+		 * still suspended, release that reference so the primary is not
>+		 * kept disabled forever.
>+		 */
>+		if (!READ_ONCE(q->guc->suspend_count))
>+			break;
>+
>+		if (exec_queue_killed_or_banned_or_wedged(primary))
>+			break;
>+
>+		__guc_exec_queue_resume(primary);
> 	}
>-	xe_sched_msg_unlock(sched);
> }
>
> static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>-- 
>2.43.0
>
