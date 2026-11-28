Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CF606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IVvKOomj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0ED10E155;
	Sat, 28 Nov 2026 05:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002F210E155
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795843357; x=1827379357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iEBz46EuV3qBeEP+cS5uzq8Wt/h7Dy/yMY8cdDCMPOo=;
 b=IVvKOomjmUE8vKdQDyJAZAzH6SUFnwDMQASCEW9i8u1tJH9S6Slyp8YS
 sEMOemF1bCFxdWHcC2NV9NQG0m5yS3COZHQ43+7JbFLI++dmXJNfakAUD
 B3AUkRQ7d4dUKLiOyJstR3UlH9nnofCeejrhJ6DNTpq3f7iS98RwZ/0GJ
 Fc7BpO5Qjn9fbcyMRzXo2YHXkrPhy4EII2a/POUKDiUlqNq+6xN2NvsFC
 utrbb2lnYNVJiQO9q02RGJkJAbGkhWFoJMoCHLmj7HcZHEdJO0BCgi1Oy
 irzht3axdp45QKBK4RT2BBSIySp9K8TXKghrBrXFT+g+kJPyOwOuT39es A==;
X-CSE-ConnectionGUID: FkVa3Sv9TRyAVbMLLsvvDw==
X-CSE-MsgGUID: XL/I++5HSf2iYunxXfYuRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4747452"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4747452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:22:36 -0800
X-CSE-ConnectionGUID: DCd5CojyTBaIQZ1XbjeJlQ==
X-CSE-MsgGUID: FgxBdgF2Q7e5WwQtWFvdwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12400986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:22:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 21:22:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 21:22:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 21:22:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeAN9AigT4qL2W0y854om2JH+bDoYf1Ah42jOcdyuLPo0/QS4N8vt+QE7AHsb99dyEUdETTPPLhgcLOVvcOeOteTJeMU6xZuxgnI/HiIUIg5hgOqU0YaI0mXl4fk0qwgZYkYbcSgB8apt3VPT4F4cpTy/RpQ/XBeRzY9aBkNvX/ujTAojwyCVYjw443f0oRYDCdtTPP7ehDUQqYVu23I4fDyyFAJ9vaDy9P28Q5fQB1TvNTlVB10lVDwXg3meGHv18ITr+fnYYsXWThFvDkEx47TlporuC67lhcLHx5SB4HPhCgkYaMlvXC0Kfwu3NsZPcyo2k9St2dgRTTs6AYX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VKhwriFrq+NuvMUiSjtb1QECmOWKnNAFZX9KQ8rf94=;
 b=kw+icWbn8JoCsbqQpSDqUPG+s3gxOxq2YrtwlcBIPJ9RctbAngimg/XBjU6efNasp6gIZgyvfOGtN8JEEnIXjNFhVAGexk6Ya7fjZBWKFcvtfN+sLjXNFQbGzgie7B7mtj19yyptYmPYTXDIl+HlbYiUD12Re5uXPcjGKL8mqPAdY6Mcmk6C3qNRvmqEIbEevsOsIw/nDSkQf/rDwdmAGf+XfJ6UVax4bj9q/3UQOJJAQVdTQI1Oy26l8bmg580Fptw/bbtQotz6XWkSo42wjrEeBETLQCi0r05Ta7n8AdSLfW4xaSVno3QdX295dzhmXqCzhmkXfBb9z4AOlJd6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by DSVPR11MB9767.namprd11.prod.outlook.com (2603:10b6:8:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 05:22:33 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 05:22:32 +0000
Date: Fri, 27 Nov 2026 21:22:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Set CGP info only for multi queue primary
Message-ID: <awplFSKELXQvi26I@nvishwa1-desk>
References: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
 <20261127130818.1382215-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261127130818.1382215-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|DSVPR11MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: 258923df-6634-44bb-f752-08df4d0f9a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Ui2QWeNikBwZQqov0FBXTpQKqpbZUI+LM51jdA0Z9pFrr9fzLgGwAjo2EscX8gkvkl3DMIj0AVOaQ3xsdw3EvKRaRsjnIU4T2g2bt3kow99R2KiYteXuatMkuZ8kfOOS36bmzdPzwhwZVV6BJ798FIQ6CgmOkQEwU3PJseHDKn5bGon0P1iaEmTXcoEo5sgNfuinepEMtb+sUoKEB8TCI/+D5fi25kgCcMQXX+pz9fzIdiRaqeFC6hwsJcZWfYTPiX7wtDvu69uANLxELEAhSMNBvdHDqZbMyL8+2iJogUNiqx20zowAp4eh2AmNNEHjr4gqcCKe1EhYOwajreV/odEob1+2WURapgHj5yyVrLS/mDaeSqk3lV3UnRGzbv7jTAsF0KPpkGlH9waDGdJB/Y92Smhv3vrLC+wCoDa9tk7jBvOmQfD1QKb7Q6uFNJ+c4lTt6q48T4++53SaHWrY0LI8/xTssZMEmt/gm7zklfxnPhgyrc3Omr1ChQy67Ywz6Mo56CJ5NwHLBfkRxzggP+oyW3NuUBEDN9TaPWGfbBG0oo0cCaMHakxrjQ6W8FxXdcGLHmjJndhGM/gFbbwaPUIQ0sX4QHvACM34IPbp7XYveGOc3hDL2UKhXGLOSFOpcLYixI6Wh4IwtyKalw9PlUs/nZ+Bgr/KgR4KehpdLGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l8dvqse9Be+JOx2wPwgDIdxTWUOpaQ0Fq1zF4miRZNAlTEhwTRILPK0ioslQ?=
 =?us-ascii?Q?1OkGMbcbZs/h2ic6xJFYXkVteFyWvoZY3CvA1zXsp9YrnJhFMmCmIgXVOt4U?=
 =?us-ascii?Q?c0AU4G8e/M2+wHAA3MS6vYnOHUXyRCX9B3M8EOmU70GIJPyYNwdFEyFu3XTH?=
 =?us-ascii?Q?y5hmWTYpwplX54IXvS6EOXElXUwdhpzpvxFnxKjrfsIdDnxYVnZOk8O1zMRc?=
 =?us-ascii?Q?V4jWWRFBrQsWcu8p9qpiTSLv6cjSyFWIbbnIxroZZUcQVk96HltVZkmRWCvQ?=
 =?us-ascii?Q?wwT4reVOgADxMRBxW/HoqTWZHBILEG/YWWUsQGladicfN+aGRxRYL6dnyN6C?=
 =?us-ascii?Q?3wM2YcLdDYmBGb7sn8FAkmx8jImtQK4HIG0w6Ex88iyWdZVAtAN4YO/1SxMH?=
 =?us-ascii?Q?ZGb5mmccEBeWhNqBI45UnuU/bMRKBg70nBhXuUoWauSZvFdXVoMZ8kL5LaFp?=
 =?us-ascii?Q?zvCWhzOBXh3PwtvNlSn8j0aJRhOZxV+2hmCfNIlHPT9Jgb2nvRiUwjh05dt3?=
 =?us-ascii?Q?O76mXwPBl+q9cGtf05yKa51saJ7WGD2tJbO5iqV9ciXGnVkqs8EY5Lgws+j+?=
 =?us-ascii?Q?tYOLhXLwVAG11eQzR9QhBMfkGdtlejxZ5eWCCi/J9I/NZ9+VoB0ePcU5QjOp?=
 =?us-ascii?Q?jUsllu88fnBmEko0t16TZO0WQdboeJ499jaFeVgKNFIL245ktVt/A5TJSr9P?=
 =?us-ascii?Q?AO+O8aGafQHn7JgvuRkIFN/r5BUpbW1td7gU6k+2i2iKFbTt7aLV6TetTyDg?=
 =?us-ascii?Q?/bce1fM1r4rcod+a0DEwSUNGrqLuk+XdUPH9SIu5hYZuC8RIkA4RLJHKejAD?=
 =?us-ascii?Q?xoD79XHsdHw8IuQfdsCnXb9bSt9A0ZdSUXofprvFENLCMpetMQ5QeSr+8T21?=
 =?us-ascii?Q?ZwqD0Fdhaqo911HCrOiFEPs6umPnP8BQ9PWl08zb9xYpS4aCPFouTBXa4wvW?=
 =?us-ascii?Q?7/56o3igNBvOB1nVGTBvR/k5eUyWOMpMtgvjZt73NJLzwFWRs4KScPtg9zLw?=
 =?us-ascii?Q?N1pGITUKlUgzSl6yKY/zkfpS0RXjkxAmLKlr6JY4iE0TBy46Dhh4vUs8hFjf?=
 =?us-ascii?Q?k1eVwbKa3f7ywX6EUxa/KFbg0JM7E8kVhWzKSFiy7DIlHHP+i3pvbYoH6K0U?=
 =?us-ascii?Q?/ibHBgTKLQo8V/EzwFR9PEUSq+Jv1l2oWIlCsLb31VLJQ5Sw9rdHRjYD1n0C?=
 =?us-ascii?Q?nRmLRVYvg0QpQGpcbUGceSj0EIKH/SOlHHvv/YV0GE900ILWQ04uM2img7EB?=
 =?us-ascii?Q?aLIrbhYxMXxgfwrrmTzRGvwalapKtFhRj8LXvlsHkW9DWIr+hiyGFuB/p10/?=
 =?us-ascii?Q?vqlwvkEvbU23e9ceqJM0T6sOx9hKzPJHYkWrEW4ywg9xt8yXeAZcaULIeWwb?=
 =?us-ascii?Q?IY82QU0osuMiI5Q4d5yvbHCx9G+9yvqp84kiX5ksD+BdIE4acpvRSkpdjmHI?=
 =?us-ascii?Q?earhQhcwVZLI86NcKapmus9HWziz8518bIbq3x/GuScbcAlnuCca+FWyska1?=
 =?us-ascii?Q?Rqnl90vimmvJdnWOgpzCe5llaJwRnvwJjAEOMowr80d7fOaX+ReovZKTZOOl?=
 =?us-ascii?Q?EVttzvPW5JuUrazo0tq9iTNkWTRPg8B2Fh7IjtkZJ6j903XkYhOgypI8JT37?=
 =?us-ascii?Q?1SIoCF0yAGqILze7kqD0IHDY2KF4FK3KjTWCtdr8vMIZAxzXFs6/UtDOnOL9?=
 =?us-ascii?Q?bKYnOoJb11b+eGYilwqg9v8fFvW9w+pzfAdDipTg2hi+DkRGVX2tHWxGr+ck?=
 =?us-ascii?Q?/IZUJTRVz0AkuwMISdB/SLw1qss5udV3We0aL8eSeZypDT8otn75?=
X-Exchange-RoutingPolicyChecked: PunszRRrJ0ktAaH8S2yg1rbNE8PlWzrnjBSexrLZHAp6uzqefy90d5EACx4fQEL7GnORzTciadxst32KBoMNLU3XIDNM4U7AgQ+NxskjjyvYihRLTCAg5YfjYA6RUSbMs/4vrx4mqUTwe4phlXzdLG+OtXM6jkCP862GIczdwwzXj3VykdBKQOCndiLRxrnH8sT4kHdH7tp5Okr+4+SA/wvhsb1pORPAtJw0HEj/55dwbfF6O+3XF2cYiO/ROnl64ONGyF8ASpPAhVOO0vNVSXWnRKlJxe+Lr9Qa8zHJXZpXLZXEWh9t85wHpjpsNNqyxuKzpcVhBglsf2xi32ErWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 258923df-6634-44bb-f752-08df4d0f9a39
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 05:22:31.9479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThdQ1/CmeXPgu/sf6CPHNqWq8+ricKwiMJCRZu3MhrhUxW9864nGH7GwX9/8Gk021dQpPLxXCVcrcm7/0zTNuOX3N4Y1EpIb13/PhkJlOY1/ks9Sbg79pn+rku3qsZvt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9767
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 06:38:17PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>The CGP address in the context registration info is only used when
>registering the multi queue group primary. Set it only for the primary
>queue instead of for every queue in the group.
>
>v2:
>- Split out from the CGP address patch (Niranjana)
>
>Assisted-by: LLM
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index da641f803e85..f84848e00eaf 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1046,7 +1046,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
> 		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>
>-	if (xe_exec_queue_is_multi_queue(q)) {
>+	if (xe_exec_queue_is_multi_queue_primary(q)) {
> 		struct xe_exec_queue_group *group = q->multi_queue.group;
>
> 		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
>-- 
>2.46.0
>
