Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6ECD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 00:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B44910E21A;
	Thu,  7 May 2026 00:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L30cSovR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4765610E21A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 00:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778113728; x=1809649728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VeRmWlVWeOwHTf1Xar6HK3p1VucsDIbZzM349cItJQo=;
 b=L30cSovRU9MM6l6FhXY2B8BRNFwGZ9tBmxC1YDqwZg8OiOwNEOtd5ZO2
 o3d/tQ6FP2IfVdGUCFkKbEXo9ndlC/jzgm/1rWujOMWQQzl2TdKaLup6J
 qsFCc1/lz3eDVfsYW2TxOt6mRHrlnu9uhOzOuEqIjeKPPmcot0vh7izh0
 yAS1oAr/eleb+KTjQ1uL+9jt51CefrnU7FKePziXeKBACLh9SiD50jqFi
 xJxx2hmKu7ecn0sIkdj9TrIQuuZLNWaHWjbSsPx1bGHLtMsUca0EQ7jNf
 X1tQLeWQptA44Z9dLLbxOACqri2KfARvRHMLS3c3FaTinWcmYFnvkODdJ w==;
X-CSE-ConnectionGUID: xoERftHxSnya+tVMI6fZjA==
X-CSE-MsgGUID: Tg7OaiG6S3mVqfcYvqQxiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79105779"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="79105779"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:28:48 -0700
X-CSE-ConnectionGUID: AUOzRe/xQCO75yKTzP4tjw==
X-CSE-MsgGUID: Y/mOOJ63Tjek1WiC5KQfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="233640317"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:28:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:28:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 17:28:47 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcPqylDZnYiX9EgNU9ykUczyxgUdjYkho+r0EufDpzq8dCc/9BhGbfa5s0ueHH/1UkS7he9Gju/9Z8L0K/IQmVRfIY56WFath6BefPPTFu6zOlCz62u9hmTJb2QneU0iMIXiVC1AjrpU7J5CO4xtzSbB+eFbvQcEMozFpd3p/ZaiLhD5JpVNpvdGkIPY8bEftGvso/6Wd492DroZ1EBZWhmN2HlIktTPa9b8AQyhnx3HB9x7tPOUjk25blsGirHff9aPURbyNi6DYshOFIm5WtEgar2gnjkBGjpZIj4S7VNx3X8ofnuhgzLURtA1aQvZbkSLk1RbD/JzNef1TJlSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DXE0ES6UG8KAIkqyPNRrcuwho0JhbebCRPcmPi22xg=;
 b=Lmg4gbKZcHbXH5vJ9k3N148XCxpOlL3pajSSfiRtVp3Lj4ju4VPolbrTpH0Qd+NbMe+9LhOACK/xEgN4GEBhvuXLtts1dfqTz4GK+OoulGsSyUf6171QQAV81xUmaVd9Oqcu+9xaRtL8f9x75e4AQBvhKFaSsUHOp3Pmt84N1RLMGSHaxcbIlBDDOvrq1kXUdobembGa/wfbLVXNOKDhWu6DR0R0n+p+r/asGyaFvIoUQdVjHRDGV3LeBJ9tf+kmOltV3LCySco50BlGf62ZOxNuZCPvRZ3sJCCAUMA/upIbjeSMhy6xRK1s3nT+xNq/qs3hdpvCVJyAx+qpzfUiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 00:28:36 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 00:28:35 +0000
Date: Wed, 6 May 2026 17:28:32 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 04/11] drm/xe/multi_queue: Refactor check for multi
 queue support for engine class
Message-ID: <afvcsCWeuyko0Iz9@nvishwa1-desk>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
 <20260506223500.3769614-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260506223500.3769614-17-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 637f3b17-2ae4-4eb4-5cd1-08deabcf93ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NPHiHxued2yBqRQZZWf1oFtJHKD80XfuNwbCHDfxfGCuwWFy6jvXXHMDM+SB+0cWLkPomK4g+AZ4hRu4tdZxjW+DpeBMKJ6DikiKeO5yKnu3qRiMw3W0qbvOXL2B9Yc1oC2YgCpi8y8dRK92O8m+eY6VLv0WYa/PN+jhA0Ab3KvCIXMjlx/8rqlL0+Smq4jET2aDxHqNH1StvP4b9UTjn/hbIyzfn2xdUhNJbgWgGxXmpGXihQdB7pgpZcMF5IJgnZMlg3sMWKGqWgGtXGa/xJARSYrmki+/+I+9bThUfju5CuwbboO54vmvnxCpQogrcx6O6LDRzbvBHLnzcbMUvj4znQfUU1cWmNLooUA46vlcU4E3khjt7nTdA09iNpYso5NgVGCGxBp11G6OBbFHY8HI91umDwVfU1Z0cPAeaKQg2bFOMJC48gqnQJ6PyKx8oY16gev2Ql0ZNllMQIuUQ2qSeTG8adw9fPtbedEMum+BCukViW97EreOUQoIP8ALeElyOH+7Ru6wrYXc512oIjrow956LmbhiHE4G8LTTD8qhYak4FgVB+eNIsvMoZPL2TvSWzkIs/cQExyAOhnqKlN+YMKLmMhlzWlgY9d8SXWAQ1OHxZbOmNjWUwRrCsKij6ZjckQ50w5dydgnH4OONrJG46hKRdCr3EcXDmv7c+qHVvaBloNWYbo3mtO6+YsW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3f6oSQGnhH4vD8OnB3I9IA56Snn0Amxk7iTwYQUSZI4tzOFjx/izRfYWeRwa?=
 =?us-ascii?Q?Gv+Z+jfZ4/PWSmn2Sf6N2UoL4rfxgt78ji6HJQ1MgqWI9bAuB61XMfi49cZ/?=
 =?us-ascii?Q?OztTKleKt939wOryPXGKJzfGQ20HEFBkBmH4xZviPVlHTzs3gYVGiFOi6NLy?=
 =?us-ascii?Q?sbfG1FqC+f082dHFDpMraMgIvXg7/9Q9hIRcHRiAemCqPGDjhZzb3dwBEEQh?=
 =?us-ascii?Q?l+X8EVqk9l6bmLBbXlJLrwsdyS4wrGekV94bZIqlAoE4j/peSM4FSR/n6WPP?=
 =?us-ascii?Q?kU3MSCMv3n38PJH26Ys3nLC7bLedt44t4jqqpQ+6zul0feMKW9gV53BTz67L?=
 =?us-ascii?Q?N4MctuHnLZDn/EjGoWyOTk/dfp8Vy9tWrJ2tJmaV4wbCIUesPR003wmx3VWm?=
 =?us-ascii?Q?tsyRolg39iP6rJB0wJcr6i6QoIY+GO1AmmXug5/U1MhljaO6AevwBOHiquAM?=
 =?us-ascii?Q?NRJ/cveX9ApSNRrOXqQSyNv+tge8njI7hrVnG1Z7DyymTcx9KGCgOoazP1mP?=
 =?us-ascii?Q?Iv+hCgwg/Qv91wZpsFVKpFw2FTgWf95PCYejox17HfVVbFZOHe+rJwLW5e2P?=
 =?us-ascii?Q?0+Q5M6vjUC85e4AUujt8O3xz+kn6D38HFhVbXT+Bd5HKKQUfIu9YMSq/Glhr?=
 =?us-ascii?Q?7vNeD9+346IG9BSf1+GNy/PNZgV5iv5V7RS9v6VskAerFiPjFkEL1h+5YtOU?=
 =?us-ascii?Q?aHK8vnEhYk43YYbEneakXGi7fOYwqRvXOB3axyDjFBZKWU1dU2wbUsUVe+4k?=
 =?us-ascii?Q?IucxuaogwvbUs11VRTZ00FSskOMf49ymBBAdh7EAGOTbI6c8iWOpzqqBHcMX?=
 =?us-ascii?Q?yTUnTb1PjW8LxInSHvg3SkMwN6GhLf1dSd/bq7MoAACMG2K5sTAOJ3DAXHud?=
 =?us-ascii?Q?3PYHubPn4hPHtF6qgaOOG5j8JAo2p7kIakG8AzGMO9VgM9yog7H6+cpdxAwr?=
 =?us-ascii?Q?+M013FWfMpzLTuiGQoUC/Dn90RMPczDD5+ahRhWXzdk0hP+HgyJA0KrmZK4u?=
 =?us-ascii?Q?nitVxUaJ+Sz2TTUopney73i40oqRy77I6o0U16zEGsiUwysLHZalJOg2YpPG?=
 =?us-ascii?Q?/9aWgjpWv5XCMWew+mwMSGFhxYNcNn4Fk0go3rka7QnrMYIQ4R8kK1Uocibi?=
 =?us-ascii?Q?FayLBbVMTed05QUgLGLoMXS1GrO6n8rmEOv1S7HjXC2CsuY4U4pucqJCJH8N?=
 =?us-ascii?Q?26pqeq78OCedXy6xUMCYGrnRbwdySQSiTfmMqWovA+FGCMswNvS31hTGkbOr?=
 =?us-ascii?Q?vCqcSjVX6Z4VwhCqAko9JQocq58vNwLrMZyqysz7nd0GQg6u96DyuhWJE/s8?=
 =?us-ascii?Q?9tGPz4kSpzuBRYeX54gjTXkMDeDCzv5mZLfFU/TNbxU0zyhl7s5/Mq5xKSW0?=
 =?us-ascii?Q?CsbIthkmxx2In/t2dmfnoB+BxjwolOKRCMdXCY9FzWb1kmTEhpzfKKNR/iwF?=
 =?us-ascii?Q?mrMElIBcmxUXtI+tC2X+iEIBT1X70Nwgq1AlZ27S/IR3EB4QkdnvlQT/eja4?=
 =?us-ascii?Q?malhnWZW3+RehiLP1bvlgDUnD/pBg4JbRYrHI0bTria50WsjLX2q8SwGw1Yr?=
 =?us-ascii?Q?ZwB0LcFaley8aUmFCuhNvIZexUVcMjMVfDFTy3S6ev+ld3aZp2kLwmsePKQP?=
 =?us-ascii?Q?qEg4odqQMvh80Tn4N5WU72qgrwgbEuTcd+aesEIeBMSZpbAiuPYXbF/al0+d?=
 =?us-ascii?Q?vPRqznv3XavhqGwIbfxHoBo/57Yzbmrq9xGX3dLLVMOQvgyUqPzd22xm/Ixy?=
 =?us-ascii?Q?hFcmAJlNCvgnBzEh+I4MAZZD6kAaVWC1VNCH/q1tkf7qWVtb2lff?=
X-Exchange-RoutingPolicyChecked: T5I6gppr1Zp1h3eoxz2yvbhzRsicJrL2qpIN+2Ja5Hq7wAmBMOqJBEKlJT4opmU27mqX+UkjkzI9JS9eQALO35lnPoSUfwER6uq8YR/1BPBmvdnSlf2NTl8WnwzciEPeAETsRvu2UKuOeJhORq7JXRIPkLXyDitzWYA1iT1OigrRg8bqjp0LV9BJwpEgY2mRUwLUlLBXt0FlkvtzVLqvHXTzZU4zETagHL3XCIZNQcoLqiglcJtawrncPMfrNIAITVCMtJPru8X5UiMLUvkUxxsDK4rJE2MvYKp+5qIl8mD7TZmMyd3qKx34+vRshrQZ771U0QoPS2T/UnG5wLAQkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 637f3b17-2ae4-4eb4-5cd1-08deabcf93ad
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 00:28:35.8329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LXpDmT5RqfPYWX6dOz40qjtB3pMgc2rr50Xol1ZREgbFuf2Qo7PJS1Jq86lwYmdM3DRA+a537bH3XajE/Cfu7usUGroi4zEj7OocwpvZianpHvKKOk73f86PROHGSMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Wed, May 06, 2026 at 03:35:05PM -0700, Umesh Nerlige Ramappa wrote:
>xe exec queue code is using a check to see if a class of engines support
>multi queue. This check is also needed by other code, so move it to
>xe_gt and export it for others.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Niranjana)
>- s/xe_gt_hwe_class_supports_multi_queue/xe_gt_supports_multi_queue/
>- Update comment for helper
>- Move helper to header and make it static inline

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  7 +------
> drivers/gpu/drm/xe/xe_gt.h         | 15 +++++++++++++++
> 2 files changed, 16 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 071b8c41df43..62a75c8fe72f 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -852,11 +852,6 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
> 	return 0;
> }
>
>-static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>-{
>-	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
>-}
>-
> static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> 					u32 primary_id)
> {
>@@ -931,7 +926,7 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
> static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 value)
> {
>-	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>+	if (XE_IOCTL_DBG(xe, !xe_gt_supports_multi_queue(q->gt, q->class)))
> 		return -ENODEV;
>
> 	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index de7e47763411..4150aa594f05 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -155,4 +155,19 @@ static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
> 		xe_gt_sriov_vf_recovery_pending(gt);
> }
>
>+/**
>+ * xe_gt_supports_multi_queue() - Check if gt supports multi queue for the
>+ * specified engine class.
>+ *
>+ * @gt: the GT object
>+ * @class: hwe class type
>+ *
>+ * Return: true if the hw engine class supports multi queue, else false
>+ */
>+static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
>+					      enum xe_engine_class class)
>+{
>+	return gt->info.multi_queue_engine_class_mask & BIT(class);
>+}
>+
> #endif
>-- 
>2.51.0
>
