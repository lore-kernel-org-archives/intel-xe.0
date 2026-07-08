Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA4BC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF60A10E5E1;
	Wed,  8 Jul 2026 13:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZRFdz97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3910E5E1
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783516129; x=1815052129;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uwrr9tedtMHrDUMUUQf5cEuALLlJ9u+pqh4dJldr8M4=;
 b=kZRFdz97nGqat80F69nyztmYfrVidTqvy8efvafjS5lHN0eAFt5G3Hfl
 QRuNMT1sc4Qsb/AjQQ1Uqu9pX1wodF5tc64aLN1vXTGMHwu1/nqKMU7kT
 Zh2OiB/Y3AEoQuDabBFfhWpjZNeE7trjDSUobK/YXaZHMjb36PCb83f+3
 uj9Lt3CrTaMsIn1nSji1JNDTsw3uy0UGq5IG6yrjlUc8gaW2wztxg7HNQ
 mRpLtto+VqDW7HikNip+4pjiXUSRgbGoxsSQVruga1g6TRr2uU9No7mO7
 kBdj0oKdYaZWSvwZkBNGjUJZqxBGCPR6Rw050Qr1Wmh9ROqBXbatagxk7 w==;
X-CSE-ConnectionGUID: kYj0850wQnWU6lP6pBANEw==
X-CSE-MsgGUID: zBKACpWfREGNYyjZ2EgT8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94822448"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94822448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:08:48 -0700
X-CSE-ConnectionGUID: DDN5sDFQSNCyB306A6qW3Q==
X-CSE-MsgGUID: Hc9yRRDkSHCmSENcb3e6zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="253197621"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:08:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 06:08:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 06:08:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 06:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4T34LjhR0V3ONhb5mr2jAdwluuZoGlxntEz+OGRwIZmwi29Bfd1t728SlEKAppUJo0Y2d8xwMnoBTiiHEPlSTkS0Kd4iUb544pCwnxW9eAgV8t64nXLNJrFrgRg0BrBYpOGrjQgTwI3tbBsDQV2JxRI6KIoR7h5eTOa+wZMfs/A5aJXDxssRM+9liHoE/zb3n9FxGcJkzTJTl1EBcxh10lmOOqAivlIKolZXNvj4kHDlsIMfRgypYDLgo4H3deglc72R0hc44bUsMh70RrjJWVpWHluEZOoogP52dKFleVy+KncKdb+vGs5coVvv+v4Kzg57fbVsb6AkdJxZvICeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGV+owhaRf06GobC6jeO3MgLXlEIyNn6NBr0/MPvFKY=;
 b=nGncEXY5e6KvmETqj0h187Cbpl2QmrcLcRRn8Dy79Yhsctkdl48cnaUH4c9V3OTHEUjikt/H9NzZE6vL/UOCGH0Vsp6ZrLbEyyHsPPUxESfoGavGZ5WUA70mtCrimS2eri6NL5NJuGxeXMQf2T87AM3ow9YSJs0Ov9z9c32dfqKGCq3VorSwYjwbfVXBWMWxI/wx7+bjn7KDN0irZ6YINQTj8yb6foRNI5X6V3HoS3LwIzBGSEHaAxMuEYYHe4eHrTzBfV51Bwx0Jmm1eWyrkxfot10VijjhlMPllMHgHe/TXW+vA0uztI1G00bgPqf32ZPh/2yp4aovUxGcTUCa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 8 Jul
 2026 13:08:44 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%3]) with mapi id 15.21.0159.018; Wed, 8 Jul 2026
 13:08:44 +0000
Date: Wed, 8 Jul 2026 15:08:16 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v7 05/10] drm/xe: refactor the paging engine setup
Message-ID: <ak5LtzLhErDuzXrY@fdugast-desk>
References: <20260626111520.487997-12-matthew.auld@intel.com>
 <20260626111520.487997-17-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626111520.487997-17-matthew.auld@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0125.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::17) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc9b9c5-7a1f-441f-64b1-08dedcf20a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|56012099006|6133799003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: jgcxxA1zO0tZ2lY4rIcqIRaPqBp7ZxU0aaq167CvZlBNW+RYDj5qvwhvLhBbwIu6TM+jzAIou1Q3acr7TWiEakI6u7OMmWvikh3KlrFnOpQ1igDUpSpasq92YkxUc6Cnaenps8kp2z2RZjdvJmCqox7u2Noc5vA8xMHHnaeULxtYgQ9mqCSN3S3a2sn+hEbimJodIpd4WrnBVp3CYr5tIQpuKysUhDG3E3kDM9DW0ukSa4JHNINmrQpgxjwCmeN84N6/fmlZwJeS+MgQ798MoGkxTZ+5FPManJRXj2pp604RsjvkEtqjYS+ZppoK6+DV6wnDm1G/4wRNbTUPiqfNgs/udA0K0VoAd+5E6y6FyQnUEroKK2coteXMgjcDRBRvMRIC/plEwfIan453k5+VLBDbT3iUS7xGQAlMo4VJy63PeTqMhx3kBr2ni8h6X49G0Z1Pmyb6m3wnb7k56rlutPUIxszO4C+41laDFkcIYgQkpymOwARvarbCZhxlzRJSt3nipTsfln+AdpHB9E28V8h8vqqm0kuD7n9r0vNOGFu5/WV1xTL7GU0mFNxzfsOW8IwmSJRUYDwMm2aislb5DqFZRD49bo6h2WvVtxaUReRY8iJE+hi91RXLq+NxFSzmillNQHFFbpNOdrxxIRDylUlizt01i8LpbiGy6mEwMd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tk8oHxN0kfIENLMClo/Cmy9ONNs6qg2aL+wlQLS4jpUvnLUyDTYxujTGTZ?=
 =?iso-8859-1?Q?pn0EOhJInAbzIVQfUiEIkgq8u1+pfh8R1EzHmI5OMsOB1fCpMWQqtvWVyr?=
 =?iso-8859-1?Q?E+C4Npk55lpXCj5RgaKt9b8ImcDLcMV4yJESc4qKHtoPmaw6crvoBEFDd5?=
 =?iso-8859-1?Q?sSy/PrzHQMegZ8hrjwfe3m9eFfqaU5aXwrktKy8J8DH6wnt7eJumkfox3b?=
 =?iso-8859-1?Q?g6N9hlTBzcJ81Jow7G6sLuIRJgVMraJQU/btirk3l63tLXwNBYjIJLbb9H?=
 =?iso-8859-1?Q?d9GSPezgf+qAbzfSOt5zyLnrhBDaJDEtdfWr9a56/sDM065S7H2jtt0RZ+?=
 =?iso-8859-1?Q?0CcH5fJLwwJMNtI7OuygCCk088sTUxgla82E6RLLWp/SMiMT5EuDthJLsJ?=
 =?iso-8859-1?Q?6/nz3yWIxMNkhuGQU7HMTz8BdWHx4pyT4OF0Uxk0RdkFHQBXLIrnwxSPXL?=
 =?iso-8859-1?Q?ubHYwOK6OywuQQdz9HjOYD+c9m1c0XFPYBKgTsAMLrv0Oj31LZlmr8XvHy?=
 =?iso-8859-1?Q?0hcvHf+rGJec4TQJM+ERzHVaKE0DWMffeS4PKhZPndirkTVoAKL7NnnASw?=
 =?iso-8859-1?Q?MfXaPfXLL9n0tWT2ByyiMpW3widFq0U2ndbAUZq0GJEcvTCmZlNnZeXRW3?=
 =?iso-8859-1?Q?vlBh0NRGs3cw2lxWe2snFuBwjXWOzKA6sKyt3Y4IfdFljOEdFfpkMcegzc?=
 =?iso-8859-1?Q?pzWfWja3I3NARwXREYax69q5sSLAcOPyqHBZ0c0TQRC+ScwCkg7TL2GzSP?=
 =?iso-8859-1?Q?6yUDICRU+cD/vPEdME/zLJlmqeTPacPDbtLjn+CXrin1ExxxQPphFy/lr7?=
 =?iso-8859-1?Q?8f2yseb1NPQ6ohv4jvAN0XPWEZfFfp+JfjaD2/jW00WiV8vZoaWHFqmjhZ?=
 =?iso-8859-1?Q?ATC+XiZBC3ye+P470G//FfBLGbRneiF0qdMRj1J2XCvXv9Q5bVwXzL1Q0U?=
 =?iso-8859-1?Q?QxvzNc9LHp9R82yvvOUFPloqwb8ijYhtLE3FBehF8v17qDrQQVKISYkZlH?=
 =?iso-8859-1?Q?jGOOa3BVSBg5EAM40FqLHHc9QMEkXgtb/+Pmx/vm0RDvGHEu1pABaT99M0?=
 =?iso-8859-1?Q?Fq/0feQ8scwjzDtKV6Y2zPHkB402pItLz+xfkAte/gpDm4NGzW24NSXXmz?=
 =?iso-8859-1?Q?/Q1fR9gfueF9xSGQNpMSx26Su4b7diqwLsIHqSVJhEoWwGWskWdjwAnsue?=
 =?iso-8859-1?Q?Bi5mGJ6HNFgkNpaeXHaIlkkrLTfmYy75Q19QXMx48jwAO1X9t5BlYD7wG+?=
 =?iso-8859-1?Q?xcHRfiI9eePhggHtx5a6zgCCwgkpKGVQBLE4/yiiVrmSQnBjmcZ+4vqWIs?=
 =?iso-8859-1?Q?4kybAGYIGtdCy61V7jZwb2yb8A3VxtoDFQjCTHXLCkUmVtCTfMxeV6XmhR?=
 =?iso-8859-1?Q?7ebG4/31xH32vzvxqc6LOGc/ZOd+oEg1WnW6+ZAls9PlPVQkTXz9raW5xe?=
 =?iso-8859-1?Q?nCthxPDqPDi7ugB6UDNQVtuJbsG53+JeuWhG9jzU9tWQmk22q0sGoJk2oe?=
 =?iso-8859-1?Q?lFpbUkC4jkztrDxoWbRiR3bquw5VTaNWRNHqvYSw7pgd0BSGKFiVpVPrUl?=
 =?iso-8859-1?Q?yE5f4sK7eQIdX0zKqHtX60nqbPkASHG4PFUwXGpIfh19nZLjDdxXB2Rbcj?=
 =?iso-8859-1?Q?SmE2ukQ8LxoHky14BG0BAAeg8oOVcc65SjpoESdMTryPcLaSkmpJv4r+RP?=
 =?iso-8859-1?Q?VFKLeO+JYC/RpQR7z/VSCW8GgYxdIvfgD5k5hxY/rpJBOlH44JGbauDRjt?=
 =?iso-8859-1?Q?0tWenedyRDlLo1qer2bwdBzyqxHvDUTmE/j0sQlgROO25eo0TiAtQ/0K0S?=
 =?iso-8859-1?Q?MOdBlTsbvybPZL/6+1hVtK0fYPPdjpo=3D?=
X-Exchange-RoutingPolicyChecked: Rv7p45pow+0GVxygsjZyw70dGAjl0yHwfRcHTfjySflhlu/0b0py3jV/noFJ/IzHGBDSUtaYs7ZVbKZSz6fD5Q14wfQ612pAQ9YreaWrSPdiQGWRV2/vzlS9JLkEhcefy3aRqCGDsLP7Wd9HXPorz26Fl9hlUhHh6rkkeIHT7m0UYsTuXlWT/pADVgewSJhScApGogH2bZGh1VFci5wZ514Z2f1Cf8rUv0dcKV7g04csN0SHhMJFzKy8xDu8I106qQiqnUnRyM/sIkYIFPjvxplTBwkBqhZYR9jRE0X5XI/5bd+G5H20sXBH/9SojLcHJyAZvdESfmrjOVx7JCl2DQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc9b9c5-7a1f-441f-64b1-08dedcf20a3b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:08:44.7295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd0xeAlCQgo4Wxd3mf0+q8G2BsHK7RibtgCQN4r/OiKWMAMAL0uDXtyWAsMe6+5LqBZASlSc32mikpyHGnWUEu2aIdk5yRdyjCnVkOUZnDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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

On Fri, Jun 26, 2026 at 12:15:26PM +0100, Matthew Auld wrote:
> On newer platforms, the paging configuration is now configured by the PF
> via the ADS object, where VF side should ensure that everything
> configured as GUC_PAGING_CLASS is correctly mirrored on VF side. For
> example PF could in theory reserve two BCS instances, and we expect VF
> to mirror that.
> 
> With that move towards having a logical mask of all the paging engines,
> and also generalise selecting those engines, based on the number of
> paging engines. Also cache the first designated paging engine, which
> will makes things a little cleaner here, and in later patches.
> 
> No functional changes for existing platforms.
> 
> v2 (Sashiko):
>   - Rework the loop slightly so that we don't needlessly check for the
>     paging engine, before we have correctly set the logical instance.
>   - Add a proper error return, if we encounter a bogus paging config.
>     Thinking ahead to VF where the config is defined by the PF, we
>     should just gracefully exit the probe sequence.
> v3:
>   - Move paging_engines > copy_engines engines check to VF patch.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  5 +---
>  drivers/gpu/drm/xe/xe_gt.h         |  6 ++---
>  drivers/gpu/drm/xe/xe_gt_types.h   | 12 ++++++---
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 40 ++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_migrate.c    | 32 +++---------------------
>  5 files changed, 46 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a..cfd2a4e6d4c7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -530,10 +530,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  
>  	migrate_vm = xe_migrate_get_vm(tile->migrate);
>  	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> -							   XE_ENGINE_CLASS_COPY,
> -							   gt->usm.reserved_bcs_instance,
> -							   false);
> +		struct xe_hw_engine *hwe = gt->usm.paging_hwe0;
>  
>  		if (!hwe) {
>  			xe_vm_put(migrate_vm);
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..a6cfaa1af23f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -137,10 +137,8 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
>  
>  static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> -		hwe->instance == gt->usm.reserved_bcs_instance;
> +	return hwe->class == XE_ENGINE_CLASS_COPY &&
> +	       (gt->usm.paging_logical_mask & BIT(hwe->logical_instance));
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..10c32ea3ccdf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -230,10 +230,16 @@ struct xe_gt {
>  		 */
>  		struct xe_sa_manager *bb_pool;
>  		/**
> -		 * @usm.reserved_bcs_instance: reserved BCS instance used for USM
> -		 * operations (e.g. migrations, fixing page tables)
> +		 * @usm.paging_hwe0: The first designated paging engine.
> +		 * This is some reserved BCS instance used for USM operations
> +		 * (e.g. migrations, fixing page tables)
>  		 */
> -		u16 reserved_bcs_instance;
> +		struct xe_hw_engine *paging_hwe0;
> +		/**
> +		 * @usm.paging_logical_mask: logical mask of paging engines.
> +		 * Should be densely populated.
> +		 */
> +		u32 paging_logical_mask;
>  	} usm;
>  
>  	/** @ordered_wq: used to serialize GT resets and TDRs */
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 68db0ce4aa1a..6ba548cc7949 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -647,10 +647,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			xe_hw_engine_enable_ring(hwe);
>  	}
>  
> -	/* We reserve the highest BCS instance for USM */
> -	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
> -		gt->usm.reserved_bcs_instance = hwe->instance;
> -
>  	/* Ensure IDLEDLY is lower than MAXCNT */
>  	adjust_idledly(hwe);
>  
> @@ -664,19 +660,43 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	return err;
>  }
>  
> -static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
> +static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int num_copy_engines = 0, num_paging_engines = 0;
> +	unsigned int reserved_logical_bcs_start;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
>  	int class;
>  
> +	for_each_hw_engine(hwe, gt, id)
> +		if (hwe->class == XE_ENGINE_CLASS_COPY)
> +			num_copy_engines++;
> +
> +	/* We just reserve the highest BCS instance for USM */
> +	if (num_copy_engines && xe->info.has_usm)
> +		num_paging_engines = 1;
> +
> +	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
> +
>  	/* FIXME: Doing a simple logical mapping that works for most hardware */
>  	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		struct xe_hw_engine *hwe;
> -		enum xe_hw_engine_id id;
>  		int logical_instance = 0;
>  
> -		for_each_hw_engine(hwe, gt, id)
> -			if (hwe->class == class)
> +		for_each_hw_engine(hwe, gt, id) {
> +			if (hwe->class == class) {
>  				hwe->logical_instance = logical_instance++;
> +
> +				if (class == XE_ENGINE_CLASS_COPY &&
> +				    hwe->logical_instance >=
> +					    reserved_logical_bcs_start) {
> +					if (!gt->usm.paging_hwe0)
> +						gt->usm.paging_hwe0 = hwe;
> +					gt->usm.paging_logical_mask |=
> +						BIT(hwe->logical_instance);
> +				}
> +			}
> +		}
>  	}
>  }
>  
> @@ -896,7 +916,7 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> -	hw_engine_setup_logical_mapping(gt);
> +	hw_engine_setup_logical_and_paging_mapping(gt);
>  	err = xe_hw_engine_setup_groups(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9428dd5e7760..92d5e81ceac2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -383,27 +383,6 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
>  				  NUM_VMUSA_UNIT_PER_PAGE, 0);
>  }
>  
> -/*
> - * Including the reserved copy engine is required to avoid deadlocks due to
> - * migrate jobs servicing the faults gets stuck behind the job that faulted.
> - */
> -static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
> -{
> -	u32 logical_mask = 0;
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -
> -	for_each_hw_engine(hwe, gt, id) {
> -		if (hwe->class != XE_ENGINE_CLASS_COPY)
> -			continue;
> -
> -		if (xe_gt_is_usm_hwe(gt, hwe))
> -			logical_mask |= BIT(hwe->logical_instance);
> -	}
> -
> -	return logical_mask;
> -}
> -
>  static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
>  {
>  	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
> @@ -479,13 +458,10 @@ int xe_migrate_init(struct xe_migrate *m)
>  		goto err_out;
>  
>  	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> -							   XE_ENGINE_CLASS_COPY,
> -							   primary_gt->usm.reserved_bcs_instance,
> -							   false);
> -		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> +		struct xe_hw_engine *hwe0 = primary_gt->usm.paging_hwe0;
> +		u32 logical_mask = primary_gt->usm.paging_logical_mask;
>  
> -		if (!hwe || !logical_mask) {
> +		if (!hwe0 || !logical_mask) {
>  			err = -EINVAL;
>  			goto err_out;
>  		}
> @@ -494,7 +470,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
>  		 * PVC, may want to revisit if performance is needed.
>  		 */
> -		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
> +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
>  					    EXEC_QUEUE_FLAG_KERNEL |
>  					    EXEC_QUEUE_FLAG_PERMANENT |
>  					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
> -- 
> 2.54.0
> 
