Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DB2C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 15:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514010E358;
	Fri,  7 Mar 2025 15:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URDQlHuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC0410E2DB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741363050; x=1772899050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G0gRpl4KxXnYU/Ft+s1LWBlJJeiRChEazJ5h73/T+EU=;
 b=URDQlHuf9NAyCvZ8716C5COo3iShksu2m2xYi5r+42l9WoI7kzB9zifE
 HyRx3dqLj6GqUsJpfvPbENuMG8TMDhmxNH1DTHqzXKY2VP45NLLVK8uL3
 RAB939XYM4Wp9RJ+cNEW7j6Y8MwtocQxCLhW82xBMJ1mbOxN4YTY320VJ
 vupdCx97NSGfr9lT4yifqg+q0E6NicPSA3MIxMREBebleqw9uDjqHK+sS
 4EdL9CEDpcjCXYZFhiybFc41HoapzKQl2H6E0bYb0hP2v0HTurWBX+e4C
 wk0HgmONcX0WMq8PALodEGlWVm8klhLBTZkqiDbj4DwgoXhjuM8L9ZawF Q==;
X-CSE-ConnectionGUID: riLMNzXMTjCQxTbjceQ75g==
X-CSE-MsgGUID: 0nCO3WuXRjCiHwCWgfE8cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42326569"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42326569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:57:30 -0800
X-CSE-ConnectionGUID: o2QA1Cr4Tcys0HKzFog5KQ==
X-CSE-MsgGUID: JQkG8UioRnm4hE8HS+9vCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124389301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:57:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 7 Mar 2025 07:57:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 07:57:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 07:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVuWoNzcshmi5+E94RKXWYLChfR3DbckSSCCn3PAfmm6MJlBoz4NxnFQGc7t14/A0ZAcaMkAquLVWAOpaufbQdWgBFAegVWhcH4CcCogsV7O7yy2QwCMQUE6q8Mb03VYJpP0jYhqdxEUvoqXHKlUWD7wqWo8b2K4tuh8NpUsw4sTjazEoaIeEjXBiwDknL8WieHoOb+LxbNuNse8u7EHJf7UaCxXKK9BjfY6dVNYPYefEJkYO/+GikxDZlpR+Wy9soEt5eILUW+HtA7MdtbD4C0aogqx8o2On1Z15IIc9CqIYU5uDxFOoAY00nTfyHQ6/Z5PCNpKIWxuaJGoGcupIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRKt+X3aobbdP9FGgI4K7ws8vfiIzZ+NfTYbox+UD5A=;
 b=a++BuhEz3rgRylvp8z8YVpmah9qs+wSHhVQHnfX0OB9bUH+dEOF9zWXiN1s4zubgQrGfmVX5Q3oFpAM/5gbQTB9Te9xtEnt9QY6Ie+uMLCfUHd5+KyJL0SVmhOvUJqmMvF6xiHlorh61NUPDqKGYZ4Tb7s134MtiDYT98rTkEBDy1fDrwhzKs1jrYUQWc/VMjBMWnR8x61tPZjAX9au6Tm41/xTBhbodfxOXruuecQrMLTZi24zL8ttBOoazWB+dxKbeKbRg3KEopVwoIp8qsaZFvQ1Sy6P8/WJasxeGFRDk27C+SaBnDOmMdaxwwsHoSCWryoEfPVQeVfp9up8wFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Fri, 7 Mar
 2025 15:57:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:57:12 +0000
Date: Fri, 7 Mar 2025 09:57:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/rtp: Drop sentinels from arg to
 xe_rtp_process_to_sr()
Message-ID: <377u65lxwxlzdxr5anzpn3ykk3bud3vyikpy3l6qnxboltoxyn@xeaiizgnyl3q>
References: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
 <20250306-fix-print-warning-v1-1-979c3dc03c0d@intel.com>
 <6111972f-8b3d-4b3b-b27f-83241af9b5e7@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6111972f-8b3d-4b3b-b27f-83241af9b5e7@igalia.com>
X-ClientProxiedBy: MW4PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:303:b5::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 2470b0ee-dd28-46b8-f77e-08dd5d90b95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ByogadrGVspl4evxeV/0PfbL39YMYDpJtZTxbgCOdI18gTBqq5G0kOLHT86L?=
 =?us-ascii?Q?fuNIvQ5kF8fBdc0v+err9/LzJcOiuCnZaDnNBg/UMz/WPfKdZbaPoWEgpnCX?=
 =?us-ascii?Q?8+q196flogunPlFlGfy5wDNVL1AFNnCMQjlcVDL/cFwAV6ORVRL+q0do4qqa?=
 =?us-ascii?Q?0aMkoxouhE0JJFmrkCWE6r7vkJ2vfovRR5YNuxziXv/R29KBvxQHJmLr7FPg?=
 =?us-ascii?Q?gE3Gr93M1DWHm+q+XznWn5/9IOnf0YMYwosUlQABE6Snl5zY7wS283MV6ppH?=
 =?us-ascii?Q?UIfJ4yLpJagwNVCazw53VvjT/5iZBIH9R/SVW/oROyxMtzpTYqZ0g4sreilY?=
 =?us-ascii?Q?T3VmhdO3/vmsq90qrZJSsDZI2ACskSbUkhl/MJGPUgBikKAfBGhS1OhtJQWl?=
 =?us-ascii?Q?3JjxJgq+EgebauH8zjJDON0DriM8kRfWplRSQrLEwMA7EtWqBxYAtx8EOeTJ?=
 =?us-ascii?Q?Jxyr3bN7d3dWHWEvOu7ObxE3ykLs1xiWtWz/KIJQzcnEXpUuuCQJHz28bCHH?=
 =?us-ascii?Q?VbEHRdZnvefWAZ1xa0QY2cugpytf3cZ809pyv9M+yRG/Yz3ulxtKIJ3Qi/5O?=
 =?us-ascii?Q?EX9j9qIamxBas3fVJiihE2nycStlrKq4ISb9iQGKIOJ/Y40qrIJ6K1nLghUl?=
 =?us-ascii?Q?rVGkFwivyuplOa40YmD9yBa7YNj4iiXVbFmdNOcmMcp147tcqOzhKc424Hi3?=
 =?us-ascii?Q?pxc3bCSI1ZILcPHHbAZ7jVq1qGEyOgegLU5cM63jc/kFTRlDFD8e+KPpOkYi?=
 =?us-ascii?Q?OVK2opf44PruNOo1Xi0qad+ZPZSbq5lcrQR+rmrIF3+W4lRi1mKu6MCRQO62?=
 =?us-ascii?Q?IIBjI4LMFeepcgE7a/FPtxBoO5QxlNjbXWZtdL3sQ94nOj9G9GioX2LCc8Y3?=
 =?us-ascii?Q?D98IKBDEBLZlvIhx9lRqoz0yYn2uKXiJ056O4jyeBb5FKqqZcj6+oCoPBZ4k?=
 =?us-ascii?Q?doiCGspG/9faSxAXhNyxEmfouBXd5Sl231+yk/dhiGz1jlcOovyVb9CDAWrn?=
 =?us-ascii?Q?YdBqgfIY2YiX27OBKI/yqimzY12VZkXIU0LYs6PQbN0woMIx3eu9mNFYNXZ4?=
 =?us-ascii?Q?WpqFy5RQHLa70CzE39Zye5jBEHw+Jl494JRwkmABdejX+mMP2K4y5KiWbjXo?=
 =?us-ascii?Q?QX3k+Q2pivlVi6g12GqN+zqlfWuGXSLVPTeMDHz/CTlLvNVT5uMyeq20Q3V5?=
 =?us-ascii?Q?6aa62dfkmAcPq/ut8yVvv0exfYw97G5e215KBy6pqDIm72s3H1f9G6466t1T?=
 =?us-ascii?Q?p3DHRy8zooiFpIX8HMa1BOiI4S/cIw6cWNMcvQlqkFXYOKTIvgfeGZGfGBbG?=
 =?us-ascii?Q?Dm0QQpV6cUKFlcs/x5kYopeiZisFHmhUilfihcussl0d1szpa7CMqumOxscm?=
 =?us-ascii?Q?uSPZfk3/a6mbnYk/EE4BBM9SjY/n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2v+tWzxYIMvV83BydNL1JfcKGrDL12rM3mNFY3LUMJ2ND30d74W3MqtNtlU?=
 =?us-ascii?Q?gH2pknpVraflZbIEL/atYk5gs3NsjGqoUQI/+Q6mztgf5OPBIn+N+Faw5CO2?=
 =?us-ascii?Q?uzKjH+C/CWV3DfLhGoiWONpBXkWqH6z4vFdOZGbWpcWPTrWI+z2OXkk1FIrG?=
 =?us-ascii?Q?QOUcSsR1PLFpZARTzwkP/BmgNa7zwrNS4K1vYqsrpe0oOLgMI4JJLfZLyoCb?=
 =?us-ascii?Q?StBkaO1H1QbDpMRGCvw0zSEH5HqYEpDHxb+eSfppRpXDSV9WZCoPQJbYGP8C?=
 =?us-ascii?Q?3KrmANLTjR+MkMLE1/J2VAEVOp8cVQiRIfqDZVzE5mjE86JLB2z43Kn/w5nY?=
 =?us-ascii?Q?lm2spVgbI7JGB9opnMD3nH38hYs28AzK/V+q1CmLiRUmbb5d9cyv74/q7NpD?=
 =?us-ascii?Q?zkohALJ2Yssfcc8dVXkAUtQUgsvx1S4Lk2wFKAHRDX7csLki1vdLcJSv+dbb?=
 =?us-ascii?Q?Jr+tDTwjRogitHm+JDLtEnV6+sqkUb2qXczO64nRwB/6UE6VQOCsHXRy7PQS?=
 =?us-ascii?Q?+4u1maAm/6FdVjYyllDGDz5ch++wdehrMlPRbld1N0ASQm2j3Ss7irwxexVP?=
 =?us-ascii?Q?hEtMeBq44NfWsTdeEcUnhb9dgLKFDOb1/oOB9IVw4yFP/E7/4LjSohOfOdv5?=
 =?us-ascii?Q?vCc68Zj8DC6jaNITeamHmMO5KoJF9fhwm9T0/JgnjyNf5gKoUFvygDlsrEFF?=
 =?us-ascii?Q?gqLQnWUuDpj590C7aOfGzi7Braj5iRAQJPtR2pvOyWOLojJk6OiH6ro3zQaS?=
 =?us-ascii?Q?bYXBLXROiUNp5gw+lpPDhPYiRZi4beI1tGnGxn+RH1Y7v5PJdmGNQddcmZmR?=
 =?us-ascii?Q?U5oVVjz0KRgx8MfqHCcfeM97M9uFZtn1zLIzFYXneKvoZduVbOWj1hRgPhI+?=
 =?us-ascii?Q?+EWhXxd9XhOLQXzdmW25DfTiCmtAZ0ht8ynnIKF6KtKrcfi5JnD5BlWgULI0?=
 =?us-ascii?Q?ibF2/imoCi73X4TCwgCGy1w7GAKtzWWlfMHF7kSCCT2SLwGpCdyYf37LPHSC?=
 =?us-ascii?Q?jPssXvURZa9tMd+rpElYqdJ7gz4+sfBMzjB9bR4yK0NhqlwlyXdequVhyzph?=
 =?us-ascii?Q?a9VnG8JQzR7cXc/I26TikJvrRrHC9GakcysVNSGMxnQYmLuo/LV7sHnE63GF?=
 =?us-ascii?Q?fLl51LjorPYCrbylPqvhbjtJkVUl0FnLKN7Qd3mVQZbw7HtvsMdiiMs8xsR9?=
 =?us-ascii?Q?hZGh56AGbYTa0cwi/WlA6pZtt1Lyt9o0285TSSAC21nxgrVkEftaZUWFm9po?=
 =?us-ascii?Q?FXYF9XlabDsDxl7ATgVwiesXMFU8aPquu89IYXwS0vB28+dRMOE3rw34BpZj?=
 =?us-ascii?Q?TODL7mEaPmLxX1sWIYrJM3699z3QvAHnNwWn9bhH6P/XkKHi2BUADjx6+q6T?=
 =?us-ascii?Q?k9BvtNDx/PytC+5uN9ulcqc1IvFgnrhq58QFeHH5T8DYWFVKdi+Bsy4IS36Y?=
 =?us-ascii?Q?9eS85zVYmzEzv+RzRRf19tZtpgBYLe/xh1LpW8XVK0ou19Fq1GVANAkZ/vBg?=
 =?us-ascii?Q?ao2ECD4ADiyJt66Hje7uJCRg53dxFPoMpCjLKhRWZLrNT4ICzrp2RqaMv32c?=
 =?us-ascii?Q?Ti8R+nJin5HIW/A8h3lvwN9UCBci5zgIJMIxroDqS8n8PcvT88b/otKLsv5I?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2470b0ee-dd28-46b8-f77e-08dd5d90b95c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:57:12.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REpbCNkdtfJPHZuvTFF6Maf+JByqAcg2jDxZapG2x3sR9LwrmRDDC4fWYOs6vzLk7UflZLEhZ46YOcuAxmfRQn5MmDwgyrSrodTDVUtLfC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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

On Fri, Mar 07, 2025 at 12:00:14PM +0000, Tvrtko Ursulin wrote:
>
>On 07/03/2025 04:00, Lucas De Marchi wrote:
>>There's a mismatch on API: while xe_rtp_process_to_sr() processes
>>entries until an entry without name, the active tracking with
>>xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
>>elements. The number of elements is taken everywhere using ARRAY_SIZE(),
>>but that will have one entry too many. This leads to the following
>>warning, as reported by lkp:
>>
>>    drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>>>>include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
>>      228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
>>          |                               ^~~~~~
>>    drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
>>      226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
>>          |                 ^~~~~~~~~~~~~~~~~
>>
>>That's because it will still process the last entry when tracking the
>>active tunings. The same issue exists in the WAs. Change
>>xe_rtp_process_to_sr() to also take the number of elements so the empty
>>entry can be removed and the warning should go away. Fixing on the
>>active-tracking side would more fragile as the it would need a `- 1`
>>everywhere and continue to use a different approach for number of
>>elements.
>
>Patch looks fine, and dropping the terminators is good. But I can't 
>say I understand the warning. How it will process the last entry if 
>entry->name is NULL? Hence bitmap will not have the bit set, hence the 
>dump cannot iterate over it. I must be missing something, I wanted to 
>say obvious, but I hope it really isn't. :))

yeah... I could reproduce it only with the compiler provided by 0day,
for microblaze arch. Even the same gcc version for x86 didn't reproduce
it.

>
>Regards,
>
>Tvrtko
>
>>Aside from the warning, it's a non-issue as there would always be enough
>>bits allocated and the last entry would never be active since
>>xe_rtp_process_to_sr() stops on the sentinel.

^ this paragraph tries to explain why it's harmless, which made me not
even add a Fixes trailer. Indeed xe_rtp_process_to_sr() will never
process it, hence the bit will never be set. The I can see is that later
when we are dumping, we are using for_each_bit_set(), passing as max the
bit related to the empty entry. So maybe there's a diff in bitops for
that arch that makes the compiler **think** the last element could be
accessed. The alternative fix I started was to pass `ARRAY_SIZE(...) - 1`
in the for_each_bit_set(). But that looked ugly.

Note that it's a build time warning - if that really happens in runtime
there's probably something terribly broken with that arch.

Lucas De Marchi

>>
>>Reported-by: kernel test robot <lkp@intel.com>
>>Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/
>>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |  6 ++----
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
>>  drivers/gpu/drm/xe/xe_rtp.c            |  6 +++++-
>>  drivers/gpu/drm/xe/xe_rtp.h            |  2 +-
>>  drivers/gpu/drm/xe/xe_tuning.c         | 12 ++++--------
>>  drivers/gpu/drm/xe/xe_wa.c             | 12 +++---------
>>  7 files changed, 18 insertions(+), 26 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>index 36a3b5420fef6a1977a04d169d4946f75ee523c4..b0254b014fe45013aa0c5b3fbbe7a58fe8584a31 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>@@ -320,7 +320,7 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
>>  		count_rtp_entries++;
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>>-	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries, reg_sr);
>>  	xa_for_each(&reg_sr->xa, idx, sre) {
>>  		if (idx == param->expected_reg.addr)
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index fc447751fe786c0035d888047a856780a572e526..223b95de388cb8919a7d1ab52e1305be990672ad 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -400,10 +400,9 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>>  		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>>  		},
>>-		{}
>>  	};
>>-	xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
>>+	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
>>  }
>>  static void
>>@@ -459,10 +458,9 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>>  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>  		},
>>-		{}
>>  	};
>>-	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
>>  }
>>  static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index edab5d4e3ba5e7708565f8bc51df50c0b4a46f39..23f6c81d99946f97413e411289116aaa10365f3f 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -88,7 +88,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>>  				   RING_FORCE_TO_NONPRIV_RANGE_4))
>>  	},
>>-	{}
>>  };
>>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>@@ -137,7 +136,8 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>-	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
>>+	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
>>+			     &hwe->reg_whitelist);
>>  	whitelist_apply_to_hwe(hwe);
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>index 7a1c78fdfc92ee9a7e8862c2a65ce99b1f2a5ff1..13bb62d3e615e89d1e996692732b1859561ac55e 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>@@ -237,6 +237,7 @@ static void rtp_mark_active(struct xe_device *xe,
>>   *                        the save-restore argument.
>>   * @ctx: The context for processing the table, with one of device, gt or hwe
>>   * @entries: Table with RTP definitions
>>+ * @n_entries: Number of entries to process, usually ARRAY_SIZE(entries)
>>   * @sr: Save-restore struct where matching rules execute the action. This can be
>>   *      viewed as the "coalesced view" of multiple the tables. The bits for each
>>   *      register set are expected not to collide with previously added entries
>>@@ -247,6 +248,7 @@ static void rtp_mark_active(struct xe_device *xe,
>>   */
>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>  			  const struct xe_rtp_entry_sr *entries,
>>+			  size_t n_entries,
>>  			  struct xe_reg_sr *sr)
>>  {
>>  	const struct xe_rtp_entry_sr *entry;
>>@@ -259,7 +261,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>  	if (IS_SRIOV_VF(xe))
>>  		return;
>>-	for (entry = entries; entry && entry->name; entry++) {
>>+	xe_assert(xe, entries);
>>+
>>+	for (entry = entries; entry - entries < n_entries; entry++) {
>>  		bool match = false;
>>  		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>index 38b9f13bba5e54f9c6e863bb578c00fce7a8c452..4fe736a11c42b954c2256fa21a49b0c2e39901e2 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.h
>>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>>@@ -430,7 +430,7 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>  			  const struct xe_rtp_entry_sr *entries,
>>-			  struct xe_reg_sr *sr);
>>+			  size_t n_entries, struct xe_reg_sr *sr);
>>  void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>>  		    const struct xe_rtp_entry *entries);
>>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>>index 77bc958f5a42cd017d3c363825dfd05cd73f872e..49ddbda7cdef66da49469b687b2296cc2d00b283 100644
>>--- a/drivers/gpu/drm/xe/xe_tuning.c
>>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>>@@ -85,8 +85,6 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>  	  XE_RTP_RULES(MEDIA_VERSION(2000)),
>>  	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
>>  	},
>>-
>>-	{}
>>  };
>>  static const struct xe_rtp_entry_sr engine_tunings[] = {
>>@@ -100,7 +98,6 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>>  		       ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>>  	},
>>-	{}
>>  };
>>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
>>@@ -138,8 +135,6 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>>  	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>>  				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
>>  	},
>>-
>>-	{}
>>  };
>>  /**
>>@@ -180,7 +175,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  gt->tuning_active.gt,
>>  						  ARRAY_SIZE(gt_tunings));
>>-	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings), &gt->reg_sr);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>>@@ -191,7 +186,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  hwe->gt->tuning_active.engine,
>>  						  ARRAY_SIZE(engine_tunings));
>>-	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, engine_tunings, ARRAY_SIZE(engine_tunings),
>>+			     &hwe->reg_sr);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
>>@@ -210,7 +206,7 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  hwe->gt->tuning_active.lrc,
>>  						  ARRAY_SIZE(lrc_tunings));
>>-	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
>>+	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
>>  }
>>  void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index 55eb453f4b1fb39d4127609a28e4a5ebe9b5a051..a25afb757f7088c7f831867717b42982e9ea754c 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -279,8 +279,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
>>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>>  	},
>>-
>>-	{}
>>  };
>>  static const struct xe_rtp_entry_sr engine_was[] = {
>>@@ -624,8 +622,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>>  	},
>>-
>>-	{}
>>  };
>>  static const struct xe_rtp_entry_sr lrc_was[] = {
>>@@ -825,8 +821,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  			     DIS_PARTIAL_AUTOSTRIP |
>>  			     DIS_AUTOSTRIP))
>>  	},
>>-
>>-	{}
>>  };
>>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>>@@ -868,7 +862,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
>>  						  ARRAY_SIZE(gt_was));
>>-	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>>@@ -886,7 +880,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
>>  						  ARRAY_SIZE(engine_was));
>>-	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>>+	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg_sr);
>>  }
>>  /**
>>@@ -903,7 +897,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
>>  						  ARRAY_SIZE(lrc_was));
>>-	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>>+	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
>>  }
>>  /**
>>
>>---
>>base-commit: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
>>change-id: 20250306-fix-print-warning-43d20fc31309
>>
>>Best regards,
>
