Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3C2CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 17:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD3211367D;
	Mon,  1 Jun 2026 17:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0vmJy5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA58A11367D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780336131; x=1811872131;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sZRYzkXetEduf6oXCJgcAC3twhgOOFA4XHYxa4groxY=;
 b=j0vmJy5WXal3gl+PcPnKMG9R8xLiRb/Bu4gESzYcjQjQZsU1To2Zm9Zo
 mwszM3VwYGk7Nl6+s2bgBT9/ZaLZq7f0ScmFCFEIBgdSJrPYnxlhX3Qlm
 Lc0dj/H+k3hWllDGDE6IEO5OGPs+mv3HU7SZ8KLuLe78ws3wBgl6wQ2Z5
 eXFP4/YjY7uB7fwn67PeXzoxyZ+iI2JOrWiQl8PPdaPHk3klLKbV1eNn2
 wVbnqaIxIr9kh/cF3CnSqccu7AfXPhUbrMpCaM4BCY8oupcP8J+WHHWxG
 VP20UEvwt1MKHskdVJLOuQ5w2YBNLUaMaIcwPUeywhhu9R4ZC3lrxbfK4 A==;
X-CSE-ConnectionGUID: haFRey+sQK2Td7aEAWzN+Q==
X-CSE-MsgGUID: tEnkNxZjQxGw2KFCwsZCCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92215394"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92215394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 10:48:51 -0700
X-CSE-ConnectionGUID: ZelmEFxTSsm2vwOTEH96cw==
X-CSE-MsgGUID: 2NMNrijkR2yLU6232bonIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242594941"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 10:48:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:48:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 10:48:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 10:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIyTy4I3cbgel6YAHfUGdocbFCN+bOPxXWdxU8LyslhIi38D+mPoGdHh4SVEjYvSY35JIbHNDd2sicTyQIKM088/INJM5k8t4AK6BCTpleVoLhIlZ5M7SvzDq+Pt7EZAadM1KljRa/j+zDadIG1KRyCntOX2sSnUDqfL2U19lGyvB9v68tQ5qTy8erBUFvQm2GFapBvRf93cQD0jasYNR52R7izluygJCeCqueLFwDoqxMST4z1zF6H+RCgvCQY4aalkKxPrCEimNZVCFSTyyW6Ls54dUqXZo4lPWI1P6b3IRyYcmjig8dM0e+Ez8Om0o96uqt15okgzzVGBqh1d8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hGlec5hpfgUx5eGDtxJXs8vqlXIPD213ncbowZzoTw=;
 b=BpD0D4167DnAgoiPhySsHcxV77SmUWC/xVcqyk8nAS8iz5eDMs/1olV2LGBIZO/cDZCOZzUifGAVAdzh7XGP/IXM0xwnt+gNbOS/TG3eLLrAWHf+dwl5gxpA/uTpbFALuIlme0WkHNXlQH02nLQTmIg4UZ81KeCxky8q80TFTlO/i9bD5y/1+vPX+LCOfJ7R8xuVrAOJewfhyQarT4dr8zE7ZfwHK0v2zbIoILJHwV/hEWpVtt5fkwBndWuwqA+0OWQsTUkNAJtEzj7CeRnrNg9dvbKZwmmSlNiOLVYj9JhgQ47qdr0dgdV4wrBM42D/GhKV6OfU11kkoqVbtP8RCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 17:48:46 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:48:43 +0000
Date: Mon, 1 Jun 2026 10:48:40 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.d.roper@intel.com>, <thomas.hellstrom@intel.com>,
 <daniele.ceraolospurio@intel.com>, <matthew.auld@intel.com>,
 <stuart.summers@intel.com>, <x.wang@intel.com>, <brian3.nguyen@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] Revert "drm/xe: Skip exec queue schedule toggle if
 queue is idle during suspend"
Message-ID: <ah3F-C1Iqw5V3t2Y@nvishwa1-desk>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526082700.1383831-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: dc589e26-b79c-4817-79e9-08dec00605fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799006|22082099003|4143699003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 4wdids56AtnsQ0j+Hr+Y5kVFyVyiDbgbtoyphREy/LsMrqNkqS2kudfOpTvq+cWkmzUntQ0i566kLYJ4UhWXMFAt/7CFVzj1vsYiuK5nEkPYAdE3Kp9Tip/b75ZvA34z7wQYZO/4s1jCg+bDSbMU8JTQdBHMT+NmpOehdr0wKeCZsqb3cbNVLCdvg8kVVZA95TCHNzGphZvSflRxhxlSJid81IAjtQJc/xGMT+xKSQuqqSdIbp6geg+jL3xxpU2fOzIoiYJZeaUVRKf4YooniZqW0htsr+o2HI1A8VtxaSYfWb0jfCFwwbVPi+tZ1TYCYnA1+A2QxMca++yjxmiRwfrXiMWRIhCdP4RyRSOqvmzt27TZz0nxoblCpYK6IGJ60zYtV0cFMsHx4FjAzhoVch3hECkNG1Nqph5CZnG7Oeft5dmi3I7DNm+sOif50Lcv8UK7MfVr4qNAoljoKBkfNKZ/n1VdBDjTT1oejS4JJoAKoFduMdQf6LFYj6ZK6BBKbgsAbyhOUUAZ76ltif8not4rqDyZxnZ2jjlPw0kc8hinUoDLmTisr3ihLKgXdAzL3bpHrHJLDtpZzah36BHiBE4+mVlFMyk2mrYh1v0Fyt3dZDtNcX5nPB/Aw72CBUGrygmx5wdYXme7ExK2NFJxyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(22082099003)(4143699003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?51zrmPQ21olN1r580J6BxLh5lhI6ve1jIcF/9vSGgYBs8d5TjnrjFFjILa?=
 =?iso-8859-1?Q?Z2iB3vKvlgD9Ro0ZrfiaXyVMw8d/hcrXBppRmK/uRT7d6acOX6Xr1t8dYB?=
 =?iso-8859-1?Q?yyJTz8+tTEshtQOWrrCg9gOyrFYKd2pxrCPO4YpNu/AorP6JwBUf0aMav4?=
 =?iso-8859-1?Q?+9s54PWUa5Kc2kaKKRow6qdhHbMTQRJdyv69A08nlgyTFzjgPdEQk5roUc?=
 =?iso-8859-1?Q?Mz5p7B73FD3wZiuoTkjpp4vnOfI/EJZ8jtNq2wuZORXRWasoId4ysF64w8?=
 =?iso-8859-1?Q?JoVEobAkDiPGXenKHySzgFgPdIv2spCAHb0I0wVuTmzmPZuIyfCGtkjkLZ?=
 =?iso-8859-1?Q?/wMG6iVGoe5UU95kkctk0mv4arON6nPctiLfGbA1Bq6ykebWbVcRqXSKFJ?=
 =?iso-8859-1?Q?uqSkC5q3DgLuOmasmDXDopHbUUsC7vOHlhranEKibIHN3i8RaGq1AqFDYD?=
 =?iso-8859-1?Q?uUwPQQgtadBHfUl0R09za7EBty5BHBzz4F8VxHtgdsIGZstFHuqh4/MjX6?=
 =?iso-8859-1?Q?H9Yq1ew4XwaB8HlocvlIpuHti2dq80gx0ubtN0WfamOxMic77ximAY2cbk?=
 =?iso-8859-1?Q?iIGLXXwolVGE4dBpbpQ8F1Rg0fkcnz7lxic6/U80+2U5/d4GHqc8yZs0sR?=
 =?iso-8859-1?Q?81la53qLZOnkGlBCl4wuwsHa7IDB6UKAD2NaHiTPSDg21csS8dAzNk4acN?=
 =?iso-8859-1?Q?ww1eS4EwDJ/ziSsWKdkuyp7DROnmR4JJnD8A+unO5AIcnKi6voFcyFEWNI?=
 =?iso-8859-1?Q?9ga9dJfO8qPAIubg0i0nMux5fmpDTVWe66QjES/5ar1M5JIwC0sMFTm4xX?=
 =?iso-8859-1?Q?MQFnKfYrUl3il6+Usqz34CXcxBMQIYyYmdjpP1vxWDEfsYd+t/ucKJ69QL?=
 =?iso-8859-1?Q?OmhGnX3L5puITKvX9eej5VCSUgPfhh9xVWi4Qxu9t1OPgU7oy+smQZlfQs?=
 =?iso-8859-1?Q?t+48Mwphf2vPgMmBDdMel4DGKTgU32yBZJxeBuzj98KXpqR5QzTbupnRKI?=
 =?iso-8859-1?Q?91BhFHNP7rz2tdhjMtqXY8bEO9/svyxF2dB5/1KfCAyCI3rIm1dc1Vx4YP?=
 =?iso-8859-1?Q?tQJ/b8p21DiKokBSLz76TEi2XZXyPj4iWwrtIF7TcxEnqymWkEpGCiBX3O?=
 =?iso-8859-1?Q?fXYwpVkupxi6bVquQrfEY5qCyKEtxsjQWJUH7n45LZ9M2NdJPhwR1jCTQC?=
 =?iso-8859-1?Q?9yzKp/ADtPiiv/cHZrPdvIjY64IXuDJtIosRs7a8UXrFTIYYlKs3+VyBWx?=
 =?iso-8859-1?Q?hhdodExhFYtysFC/2pYetlchkc7JLr4jCwEARUx+69rqBVXycVmKBDxOgw?=
 =?iso-8859-1?Q?AoB4cDsO38OGGbQEEIF4lLP7lyySKIBHQRJBZ//HqtdjWWZBP4VuewJx+6?=
 =?iso-8859-1?Q?FDj3V9U5iLLJDDYQmzRaMNZiQMZ8k6P3TUrvwdkdvTA+mpF/8AD5WKo5Wy?=
 =?iso-8859-1?Q?6y8v/cT2e2giy97AqTTrIdzScw7Ipe0npf0IXTSXJIsTqzuOVZjkkQbx4q?=
 =?iso-8859-1?Q?3NowtbOmbhn5KM97soA+Uma1QDWN9DlWtkey4Wq9vQgt9stH2Sxm2HB1gc?=
 =?iso-8859-1?Q?5pBR00QOERfcFT95BMBFD3PpnKofdyPh7qWHrbjzG7REvmFbjWKMFGZo6W?=
 =?iso-8859-1?Q?57qsPjUlSCZFZksW+pdygVTqAz4oqTMaye7w2sGEnuX/L73GEJDSFHWkOF?=
 =?iso-8859-1?Q?VFj2gz6NM17Nc+ovIQSSthQm6I45xWiBdPV6aSIpzqSU8+7KJ5L9HDBxZ6?=
 =?iso-8859-1?Q?mHubyqDTynCWIqEMsFfcGcxZg91p453H8zSmhKeHd3ReNEFge9niNiCniA?=
 =?iso-8859-1?Q?lvbUPBUZSZvCQ0O6uTItVTND6ko5GHIhz2llAeBU0RiAGrJ3BAlk?=
X-Exchange-RoutingPolicyChecked: CzMpIPA2XH/oOBuq9pu3lfFhcNFBk+0rAi4TPOVG6omPv0w+UP59r/gpba761wF6xlMxosQn0nvbp03weEVOsdmdEaKfwRsvTdutY/OlnGU4seMNwz9dslCDUoyT7f2EFnrBudv3DvBo/KRI6ZItFzR6dQBvCkP3IooWVqjw4tfocpwqDVIUADVXPrzpITUdwzbRYSAEqzhZNsimTgowDvCULsz1tZQwgJvkMtiZJ3H88IuD4P1tFpLTG3GGUgocCaGaV5663ngmyGWf+HkUc/PLGP+mIYAY3yZPcExeFYqOzVLy3lHcTqVYE7LwK3wyMRFCIm+cPYr3Qx4zGym3LA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc589e26-b79c-4817-79e9-08dec00605fe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:48:43.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYU0B/vguNxMuFpf36XKl/5zvoWQA7b3Z+Q0qVf6C5nKiIBQyP68dOKiBUVomgRYA6wG7E5lqRWqwy1f0R7UMskUn29Ai/ruif5s19Dg9Seds4g5LBWJVakQTIit9ady
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

On Tue, May 26, 2026 at 01:56:56PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>This reverts commit 8533051ce92015e9cc6f75e0d52119b9d91610b6.
>
>The idle-skip optimization bypasses GuC suspend, so the GPU may not
>perform the context switch that flushes TLB entries for invalidated
>userptr VMAs. In LR/preempt-fence VM mode, this can lead to missed TLB
>invalidation and page faults during userptr invalidation tests.
>
>Restore unconditional schedule toggling on suspend so the context-switch
>TLB flush is always performed.
>
>This optimization will be reintroduced with a fix that does not skip
>suspend in LR/preempt-fence VM mode.
>
>Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

The idle_skip_suspend is also causing an issue in multi-queue scenario.
I have posted a fix here.
https://patchwork.freedesktop.org/patch/729259/?series=167575&rev=1

But given, the idle_skip_suspend feature is being reverted, can we push
revert to all stable kernels starting from v7.0+ (where multi-queue was
introdued)?

Thanks,
Niranjana

>---
> drivers/gpu/drm/xe/xe_exec_queue.h      | 17 --------
> drivers/gpu/drm/xe/xe_guc_submit.c      | 55 ++-----------------------
> drivers/gpu/drm/xe/xe_hw_engine_group.c | 10 +----
> 3 files changed, 5 insertions(+), 77 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>index a82d99bd77bc..0225426c57b0 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>@@ -162,21 +162,4 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
>
>-/**
>- * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
>- * @q: The exec_queue
>- *
>- * If an exec queue is not parallel and is idle, the suspend steps can be
>- * skipped in the submission backend immediatley signaling the suspend fence.
>- * Parallel queues cannot skip this step due to limitations in the submission
>- * backend.
>- *
>- * Return: True if exec queue is idle and can skip suspend steps, False
>- * otherwise
>- */
>-static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
>-{
>-	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
>-}
>-
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index afd8cc7bd231..f7200d720b70 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -71,7 +71,6 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> #define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>-#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 11)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -218,21 +217,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> }
>
>-static bool exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND;
>-}
>-
>-static void set_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
>-}
>-
> static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> {
> 	return (atomic_read(&q->guc->state) &
>@@ -1147,7 +1131,7 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> 	if (!job->restore_replay || job->last_replay) {
> 		if (xe_exec_queue_is_parallel(q))
> 			wq_item_append(q);
>-		else if (!exec_queue_idle_skip_suspend(q))
>+		else
> 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> 		job->last_replay = false;
> 	}
>@@ -1802,10 +1786,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> {
> 	struct xe_exec_queue *q = msg->private_data;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>-	bool idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
>
>-	if (!idle_skip_suspend && guc_exec_queue_allowed_to_change_state(q) &&
>-	    !exec_queue_suspended(q) && exec_queue_enabled(q)) {
>+	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>+	    exec_queue_enabled(q)) {
> 		wait_event(guc->ct.wq, vf_recovery(guc) ||
> 			   ((q->guc->resume_time != RESUME_PENDING ||
> 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
>@@ -1824,33 +1807,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> 			disable_scheduling(q, false);
> 		}
> 	} else if (q->guc->suspend_pending) {
>-		if (idle_skip_suspend)
>-			set_exec_queue_idle_skip_suspend(q);
> 		set_exec_queue_suspended(q);
> 		suspend_fence_signal(q);
> 	}
> }
>
>-static void sched_context(struct xe_exec_queue *q)
>-{
>-	struct xe_guc *guc = exec_queue_to_guc(q);
>-	struct xe_lrc *lrc = q->lrc[0];
>-	u32 action[] = {
>-		XE_GUC_ACTION_SCHED_CONTEXT,
>-		q->guc->id,
>-	};
>-
>-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_parallel(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>-
>-	trace_xe_exec_queue_submit(q);
>-
>-	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>-}
>-
> static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> {
> 	struct xe_exec_queue *q = msg->private_data;
>@@ -1858,22 +1819,12 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> 	if (guc_exec_queue_allowed_to_change_state(q)) {
> 		clear_exec_queue_suspended(q);
> 		if (!exec_queue_enabled(q)) {
>-			if (exec_queue_idle_skip_suspend(q)) {
>-				struct xe_lrc *lrc = q->lrc[0];
>-
>-				clear_exec_queue_idle_skip_suspend(q);
>-				xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>-			}
> 			q->guc->resume_time = RESUME_PENDING;
> 			set_exec_queue_pending_resume(q);
> 			enable_scheduling(q);
>-		} else if (exec_queue_idle_skip_suspend(q)) {
>-			clear_exec_queue_idle_skip_suspend(q);
>-			sched_context(q);
> 		}
> 	} else {
> 		clear_exec_queue_suspended(q);
>-		clear_exec_queue_idle_skip_suspend(q);
> 	}
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>index 4c2b113364d3..02cf32ae5aa9 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>@@ -208,21 +208,15 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> 	lockdep_assert_held_write(&group->mode_sem);
>
> 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
>-		bool idle_skip_suspend;
>
> 		if (!xe_vm_in_fault_mode(q->vm))
> 			continue;
>
>-		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
>-		if (!idle_skip_suspend && has_deps)
>+		if (has_deps)
> 			return -EAGAIN;
>
> 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
>-		if (idle_skip_suspend)
>-			xe_gt_stats_incr(q->gt,
>-					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
>-
>-		need_resume |= !idle_skip_suspend;
>+		need_resume = true;
> 		q->ops->suspend(q);
> 		gt = q->gt;
> 	}
>-- 
>2.46.0
>
