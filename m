Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478CAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 01:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39C10F75A;
	Mon, 29 Apr 2024 01:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVmGJet1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E993310F75A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 01:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714354205; x=1745890205;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7CXLto504cG3hFP0jZ7JGopfAfOe7Mg15gm0ZkNIL74=;
 b=JVmGJet1PksTDDSJe4fx+w9mQUgmqEppkPYQYuE5YdCnzSfAqOggSoOp
 exy6ESL4mqy3BwbNIX5VO9A9uivIfpCvD2pdUO4vppr7MkAEL/rPL2goX
 qoiiYB6od8ah2MZtRaogTHNRa2sa6+TXY5JewoXCdV5EapAYbk8vqpfcf
 an4df0ujIPQXRnCDNBcIOPbg5e3K/5QiasksBDcIi1TfZr4RQ1xuwftdZ
 O30iPy4EwvE2dk78EC/XpcfeF7NIxOC/QADQtK/eAzPeBTIQjqFQT7HNK
 +wquyDSLaCEEOOgxDkzI2R/fbtpJ6G6Bd0MLTLsN671fg/YGNA9FOOglQ Q==;
X-CSE-ConnectionGUID: F4jrIUTsTXypWWvePRR1MQ==
X-CSE-MsgGUID: qfmkeFvUQ1K6fAAPr3JgBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27522715"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="27522715"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 18:30:03 -0700
X-CSE-ConnectionGUID: wqWK99e7SQmMIzv7iVx4gg==
X-CSE-MsgGUID: J8XH/oq6Rnup+TvxwGoAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="26367268"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 18:30:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 18:30:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 18:30:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 18:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYDc2tNEAqIFum8oyMO1/SXnPmOWREa4/KfXB5hUhp3rdfGyB8wN7EPYfx+342rrUDvdqCq2cmKhdAqgSDZFDCZWUHz43Re31T4ViaAL8ht7trAlagVx9DWBGHlRn0w5SvnG6+bm+9Z2dr3MUi3JNy0bdPIXRjksOq8Z60uev9d7bfJPG0DiY67QoyBRzhUtNumC39RsC4JTQXVH1P6j3hBbYJ6vTixnwc97DgJh5U+g9WvgAc3wCenm1MDKZOu3P2ZUh0heNMptT3Z5Fmemtt2HJQFepZzNZyFkICfDwnKQdtuI4CAwBerOZ30yjNfYeEWntXFD0QwwGKko5iT4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8jzzwZzNhksofzfGl3GwR8oe6JEL6YClQbFvK+EdW8=;
 b=ZJuTTmpmKYItQsobDGs9pi5V/3oF4kF7kLqcXYLyHPOcQCeeX5WBUAvw6e5ZC08cIKKpNn6bfMyRyg8ttt2jcuxyVu2ZE1vWgDuwDuA9CB4lBLohrbvVAMPUAA1/2l0eCj0M0jRtMs6MRWZZi4gBNLP3qCUErH0daxUowoxDVbt//rfWszrH8iGUOFomujHx+O7/YdCbLLCnZXRFtS+o+GGs9geTBdQEW7HW21wsEEQ+9uRfrl9lPMEipNdS1clnEKQ+iMr514jjvgVZG5fXxXAZ5D3fJaCNG76uLgjYCuBw+JUk7xCG7d7Xduml9a0qxjBMdTgfVrXBqy0VfSfSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 01:30:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 01:30:00 +0000
Date: Mon, 29 Apr 2024 01:29:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Farah Kassabri <fkassabri@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ofir1.bitton@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: rename gt invalidation functions
Message-ID: <Zi74Dfz06eI75qpM@DUT025-TGLU.fm.intel.com>
References: <20240424094244.231035-1-fkassabri@habana.ai>
 <20240424094244.231035-2-fkassabri@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424094244.231035-2-fkassabri@habana.ai>
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7c3956-2bca-489f-7f16-08dc67ebe2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PzunnIRkM7+zPaKitDdHy5d5svExWbjhI0q0sMTLu11mDzVb0qqhjZJFlo?=
 =?iso-8859-1?Q?NQdQNbBPHS887oDF6IkDukWPsVGGoOZdZRlg6U+vlsJ3fqN01K59rnWGon?=
 =?iso-8859-1?Q?z3b9dio3d5GzBJ/VSBXUBp1I6zU9JMsiPFamttMUx0Bkt4cetYKejNqL60?=
 =?iso-8859-1?Q?nZtg7suJuiG2ly+v2s3gQpz/ffIX9gKEaBJTQVhY40b/RwcQb3AejEG3tA?=
 =?iso-8859-1?Q?JGaTq476Q7GZIRkHe8Wiy9sbLvrbDedDiXTe5e+Vy9IMZqA7v2/jU9zfHQ?=
 =?iso-8859-1?Q?UsxdNO/VblOfDy0y65NzeelNsvT1KR+ENUZfHNLJwApvQhy4Fbt8nNVSCQ?=
 =?iso-8859-1?Q?sqrIupExKEfsyQlbAb/UytOeSPqKnsMz72UV8SQVQ8/Ku8lVJW19UFBtss?=
 =?iso-8859-1?Q?JmV+ONDvst0NSbS6CR6YbUy3bVoa7a2CCAOUwVqn+UP8W00pAZQx9L9DTf?=
 =?iso-8859-1?Q?AwDYALtX+7Lt13VrW5uRafYKcLMAILGRuf0E0pALrap3810Cx0MK6f1AWZ?=
 =?iso-8859-1?Q?UykxBNHSpx5EHlf7xJi//46QGm8XVVUEKL3CKy7lmA1PFuJT/9FUWv6rfw?=
 =?iso-8859-1?Q?tig/sGy+HPktGJozIndKg31SpveCIcN7nnhxKBCY1++AZkWIFY4/fer6zg?=
 =?iso-8859-1?Q?UTfUvwbQ1oD/esdAyjaOWkcefrQbMzI23x6n6PaUe6HM6jEeqX4pEmE1Gq?=
 =?iso-8859-1?Q?+orBSYdwoyqM3TlCfHhhjnFHwcztGfXLSNvmNY4aa3KedJUT5+RKxLI1kn?=
 =?iso-8859-1?Q?PPTtzhndGkr4gsA7KsqJbxKzjP0p0V8O28v35GQIfyl7HCxF29Rjfs555j?=
 =?iso-8859-1?Q?zrxuiGkdr+sLYInUxMZqcFp/3YsVKhCU795t1caTmI46Jt9DWOezNozkdR?=
 =?iso-8859-1?Q?5Ibqb1rRkoljS8bwEShN7dUMVD+Oz+WYatAyC1ltHh3+DOioZicoSsP462?=
 =?iso-8859-1?Q?mnynCun5l3O+jqgdr6x9KKV/Vu0JImE5Xwc99IJU+sepZVrNiGQookhPDj?=
 =?iso-8859-1?Q?AU9eqZLtlRJKy0niAgINdYnJP7X4GFgXZA/OoiyGc+mGrapIFhhAJ5NWAE?=
 =?iso-8859-1?Q?T4UaHJeoxt/Z/tam7uFVHzIVBXjNIhV17/CrxjfJUKF9IQDVtojNQiPS7L?=
 =?iso-8859-1?Q?wdYIUHzQTVbhv+jmF6CHCx0I6z72+bW9Aiu+nH1QlS73yX4t6ScytKxWcN?=
 =?iso-8859-1?Q?cSFXJfOSWAYPLGK28jJeoq5hNPQIbvIIMvVL9OtlT+tTYjVqvHBXBIKo/7?=
 =?iso-8859-1?Q?aUCqYWMSMWHbiu8WFoiysPymHbxmdqoOgndppWwI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2ggQq6TPRQd9EeL+xS9PPi3Zu52DQ8lotnHBh44QVYKJiNmdzgHyE/+pCM?=
 =?iso-8859-1?Q?0OoTOBXDap7h8UjQfnxd+lEQ/gjyKRfxyb1LTg4tS9KpYz48MKXoG9zlb4?=
 =?iso-8859-1?Q?jHhxhYfTGC5aOuvRhso6n/tQGP7niTI21locPw9bDAmF9cwrqmP8kA75Qc?=
 =?iso-8859-1?Q?RmFNiTpzh+g7fI8r6iZNohuJ3npdr0CnXtipMyR/3xrDEUY6C2HBcZ8kwY?=
 =?iso-8859-1?Q?HlbTEElMlemAaHd5g/TUSRIzPIYKJQdgejc9YFHf5GziE05zWlojn9w8PX?=
 =?iso-8859-1?Q?+W9UW1fIxWjcC+wphMJul/Seuxxr4gi/YV8J0TWoDAKDS958J5uGf1w42d?=
 =?iso-8859-1?Q?tvXbHBTM/7UFQGNzftp7GLXDBPQQ1snxqnAJdTmfFcrfYxFJ28CK5FcDgz?=
 =?iso-8859-1?Q?wt7w8rGrNp6OkmlNOOwelCptvp+XFZgcu5RogWSIdWrtxO/FKC4wnbfzb+?=
 =?iso-8859-1?Q?k0XjUEclsXsmZ1/4Kv+hsCRL2yPkz95wXZVCZqlVDCGxqFrmcxFtGRWYuQ?=
 =?iso-8859-1?Q?kHyX1VDRgEhYt8kLhxWQBIMPebURNlmVjWzHnnjMOZQZuxvM8LB1645uSK?=
 =?iso-8859-1?Q?ui5nbJGxSqUobiKbDaLiCsFPaSiWPws7yu7DS0SURh8ITtf7rnwmVPw5Ev?=
 =?iso-8859-1?Q?YUiFcXW/7Vq58Bo1mNMhzs+laHk30bnVomkebVdl3jlNjEOhipOkD0BwyK?=
 =?iso-8859-1?Q?N8um8Ee73Y5oteiAKbzbka/n2ukvjr4SjKmZZ597psBW+JvPqOFRFUIwLq?=
 =?iso-8859-1?Q?/Yc3zvQR85AUGk6c3tq+YBSGWWcAetYnMUZe44ZoGXJvCRvAM5IotatM/6?=
 =?iso-8859-1?Q?lNeInFWw+RYJlNvqRQjkLC2B60fGlEUq+SyBzo7ByC9ZHlji9An4tjVZFi?=
 =?iso-8859-1?Q?kRHR5MMejshp/t7xZZSF6dALB9j3QycIF+/Rf42dk9RE6c+9Cg08bvLazT?=
 =?iso-8859-1?Q?pe86pmGv8/zFNhfU6QAgr9UxOYbw2V8gpZ6qN2p+nhHyhv6pVkM+WKJBUJ?=
 =?iso-8859-1?Q?xTymXUAkcx0OEyKzm8/GxfSwlXp124iWCdCjhQULDgoB3NfnTeMMXjPq3y?=
 =?iso-8859-1?Q?o8wqxZ9XqDto5LyGaUDTtvSzMLDEReBBmiR9Uhjc+OEqf2ZFND70O7/I7F?=
 =?iso-8859-1?Q?ogl8OTSGFQE+sBeWfMHFBhlHuQ7ONhPQRw9QSdCMqji+j2c0g7Q/RK5TY8?=
 =?iso-8859-1?Q?TEMTwm/Ing6BAKBXf3dmQzMrW90p1ScbuJ2XumLkmQaUNwZ/MJJk0TffRG?=
 =?iso-8859-1?Q?KLTfFbdC9NjDDAenDFtict1i4/az4J8ifgPsw6CRHp5mLdK00ocll4MFYq?=
 =?iso-8859-1?Q?qhYhouHlLrGrh8Q1eQUAr/XznHkJx3ddEow7Zusnbar1uZ/y10Fwwh/WRw?=
 =?iso-8859-1?Q?AP26TzeefmqM48ZGH/Ig/AYfLJDROH70sWkCVh8zkYB61Kyo240WDqRcgg?=
 =?iso-8859-1?Q?AMy8lNjXCOEDlDeWVja3TMsXKxfIj2mN0Vmrg+abzrcoWR98vqADr9uI6f?=
 =?iso-8859-1?Q?YBfo6WD5TqP6eW1xE/hzWc4qst1NuXgPQo5wM8sBVnpP8r4a8eWVSGmrFV?=
 =?iso-8859-1?Q?ErTzSswYxL1tOtc1rAmx11j9zv5/8kbhMxR5RdenhdbsZwIjRTGJI1JfEp?=
 =?iso-8859-1?Q?A403n7JBIFu+qARWpCbXQdUPO0nqEXG+dCm+JRBtME6kJlZjPRcN3BfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7c3956-2bca-489f-7f16-08dc67ebe2de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 01:30:00.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFff94bfXMi+GhUXNVhvJ/lbBhvrdEzOcOAFs3X/j5xxUs+SWL3H01sbTxW+mEzYaAD70/Xc9Fy3CN5uUzDfFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
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

On Wed, Apr 24, 2024 at 12:42:43PM +0300, Farah Kassabri wrote:
> Future products will have multi instance TLBs,
> Current Xe driver handles only the compute TLBs invalidaiton
> through the Guc.
> In preparation for Multi instance TLB support,
> we need to rename current invalidation as Guc specific
> invalidation functions, and not general gt functions.
> This patch just renames the current functions, files and variables.
> follow up patches will start adding the multi instance TLB
> support for future XE products, where each will have
> its own invalidation flow.
> 

I've been meaning to fix this layering violation for a while (GT file
directly calling into GuC). Thanks for doing this. Comments below.

BTW - I think you will have to rebase this series I merged a change to
this code late last week [1].

[1] https://patchwork.freedesktop.org/patch/591281/?series=132246&rev=3

> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
>  drivers/gpu/drm/xe/Makefile                   |  2 +-
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                  |  6 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |  6 +-
>  ...idation.c => xe_gt_guc_tlb_invalidation.c} | 72 +++++++++----------
>  .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.h   | 26 +++++++

s/xe_gt_guc_tlb_invalidation/xe_guc_tlb_invalidation

>  ...s.h => xe_gt_guc_tlb_invalidation_types.h} | 15 ++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  4 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                |  6 +-
>  drivers/gpu/drm/xe/xe_pt.c                    | 12 ++--
>  drivers/gpu/drm/xe/xe_trace.h                 | 38 +++++-----
>  drivers/gpu/drm/xe/xe_vm.c                    |  6 +-
>  14 files changed, 115 insertions(+), 86 deletions(-)
>  rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation.c => xe_gt_guc_tlb_invalidation.c} (83%)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
>  rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation_types.h => xe_gt_guc_tlb_invalidation_types.h} (54%)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8321ec4f9b46..63e757406595 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -90,7 +90,7 @@ xe-y += xe_bb.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
>  	xe_gt_throttle_sysfs.o \
> -	xe_gt_tlb_invalidation.o \
> +	xe_gt_guc_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 79ba98a169f9..ad4cdd5af80e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -187,7 +187,7 @@ enum xe_guc_sleep_state_status {
>  /* Flush PPC or SMRO caches along with TLB invalidation request */
>  #define XE_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
>  
> -enum xe_guc_tlb_invalidation_type {
> +enum xe_gt_guc_tlb_invalidation_type {
>  	XE_GUC_TLB_INVAL_FULL = 0x0,
>  	XE_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
>  	XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0d541f55b4fc..e0c1bfa92730 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -19,7 +19,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -252,9 +252,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	if (!gt)
>  		return;
>  
> -	err = xe_gt_tlb_invalidation_ggtt(gt);
> +	err = xe_gt_guc_tlb_invalidation_ggtt(gt);
>  	if (err)
> -		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> +		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_guc_tlb_invalidation_ggtt error=%d", err);
>  }
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 491d0413de15..b162f10902ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -31,7 +31,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sysfs.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_pc.h"
> @@ -536,7 +536,7 @@ int xe_gt_init(struct xe_gt *gt)
>  		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>  	}
>  
> -	err = xe_gt_tlb_invalidation_init(gt);
> +	err = xe_gt_guc_tlb_invalidation_init(gt);
>  	if (err)
>  		return err;
>  
> @@ -659,7 +659,7 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_out;
>  
> -	xe_gt_tlb_invalidation_reset(gt);
> +	xe_gt_guc_tlb_invalidation_reset(gt);
>  
>  	err = do_gt_reset(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> similarity index 83%
> rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> rename to drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> index 93df2d7969b3..f994c64c95f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> @@ -3,7 +3,7 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
> @@ -17,11 +17,11 @@
>  
>  #define TLB_TIMEOUT	(HZ / 4)
>  
> -static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> +static void xe_gt_guc_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
>  					tlb_invalidation.fence_tdr.work);
> -	struct xe_gt_tlb_invalidation_fence *fence, *next;
> +	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
>  
>  	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	list_for_each_entry_safe(fence, next,
> @@ -32,7 +32,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
>  			break;
>  
> -		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> +		trace_xe_gt_guc_tlb_invalidation_fence_timeout(fence);
>  		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
>  			  fence->seqno, gt->tlb_invalidation.seqno_recv);
>  
> @@ -49,7 +49,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
> + * xe_gt_guc_tlb_invalidation_init - Initialize GT TLB invalidation state
>   * @gt: graphics tile
>   *
>   * Initialize GT TLB invalidation state, purely software initialization, should
> @@ -57,42 +57,42 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> +int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt)
>  {
>  	gt->tlb_invalidation.seqno = 1;
>  	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
>  	spin_lock_init(&gt->tlb_invalidation.pending_lock);
>  	spin_lock_init(&gt->tlb_invalidation.lock);
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> -			  xe_gt_tlb_fence_timeout);
> +			  xe_gt_guc_tlb_fence_timeout);
>  
>  	return 0;
>  }
>  
>  static void
> -__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> +__invalidation_fence_signal(struct xe_gt_guc_tlb_invalidation_fence *fence)
>  {
> -	trace_xe_gt_tlb_invalidation_fence_signal(fence);
> +	trace_xe_gt_guc_tlb_invalidation_fence_signal(fence);
>  	dma_fence_signal(&fence->base);
>  	dma_fence_put(&fence->base);
>  }
>  
>  static void
> -invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> +invalidation_fence_signal(struct xe_gt_guc_tlb_invalidation_fence *fence)
>  {
>  	list_del(&fence->link);
>  	__invalidation_fence_signal(fence);
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
> + * xe_gt_guc_tlb_invalidation_reset - Initialize GT TLB invalidation reset
>   * @gt: graphics tile
>   *
>   * Signal any pending invalidation fences, should be called during a GT reset
>   */
> -void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> +void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt)
>  {
> -	struct xe_gt_tlb_invalidation_fence *fence, *next;
> +	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int pending_seqno;
>  
> @@ -139,7 +139,7 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  }
>  
>  static int send_tlb_invalidation(struct xe_guc *guc,
> -				 struct xe_gt_tlb_invalidation_fence *fence,
> +				 struct xe_gt_guc_tlb_invalidation_fence *fence,
>  				 u32 *action, int len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> @@ -156,7 +156,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	seqno = gt->tlb_invalidation.seqno;
>  	if (fence) {
>  		fence->seqno = seqno;
> -		trace_xe_gt_tlb_invalidation_fence_send(fence);
> +		trace_xe_gt_guc_tlb_invalidation_fence_send(fence);
>  	}
>  	action[1] = seqno;
>  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> @@ -202,16 +202,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		XE_GUC_TLB_INVAL_FLUSH_CACHE)
>  
>  /**
> - * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
> + * xe_gt_guc_tlb_invalidation - Issue a TLB invalidation on this GT for the GuC
>   * @gt: graphics tile
>   *
>   * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
> - * caller can use seqno + xe_gt_tlb_invalidation_wait to wait for completion.
> + * caller can use seqno + xe_gt_guc_tlb_invalidation_wait to wait for completion.
>   *
>   * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
>   * negative error code on error.
>   */
> -static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
> +static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
>  {
>  	u32 action[] = {
>  		XE_GUC_ACTION_TLB_INVALIDATION,
> @@ -224,7 +224,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
> + * xe_gt_guc_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
>   * @gt: graphics tile
>   *
>   * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
> @@ -232,7 +232,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
>   *
>   * Return: 0 on success, negative error code on error
>   */
> -int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> +int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -240,11 +240,11 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  	    gt->uc.guc.submission_state.enabled) {
>  		int seqno;
>  
> -		seqno = xe_gt_tlb_invalidation_guc(gt);
> +		seqno = xe_gt_guc_tlb_invalidation(gt);
>  		if (seqno <= 0)
>  			return seqno;
>  
> -		xe_gt_tlb_invalidation_wait(gt, seqno);
> +		xe_gt_guc_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> @@ -263,23 +263,23 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> - * @gt: graphics tile
> + * xe_gt_guc_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> + * @gt: graphics technology
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion, can be NULL
>   * @vma: VMA to invalidate
>   *
>   * Issue a range based TLB invalidation if supported, if not fallback to a full
>   * TLB invalidation. Completion of TLB is asynchronous and caller can either use
> - * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
> + * the invalidation fence or seqno + xe_gt_guc_tlb_invalidation_wait to wait for
>   * completion.
>   *
> - * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> + * Return: Seqno which can be passed to xe_gt_guc_tlb_invalidation_wait on success,
>   * negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma)
> +int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
> +				struct xe_gt_guc_tlb_invalidation_fence *fence,
> +				struct xe_vma *vma)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  #define MAX_TLB_INVALIDATION_LEN	7
> @@ -350,16 +350,16 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
> + * xe_gt_guc_tlb_invalidation_wait - Wait for the gt guc TLB invalidation to complete
>   * @gt: graphics tile
> - * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
> + * @seqno: seqno to wait which was returned from xe_gt_guc_tlb_invalidation
>   *
>   * Wait for 200ms for a TLB invalidation to complete, in practice we always
>   * should receive the TLB invalidation within 200ms.
>   *
>   * Return: 0 on success, -ETIME on TLB invalidation timeout
>   */
> -int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> +int xe_gt_guc_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int ret;
> @@ -388,7 +388,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  }
>  
>  /**
> - * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
> + * xe_gt_guc_tlb_invalidation_done_handler - Guc TLB invalidation done handler
>   * @guc: guc
>   * @msg: message indicating TLB invalidation done
>   * @len: length of message
> @@ -399,10 +399,10 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>   *
>   * Return: 0 on success, -EPROTO for malformed messages.
>   */
> -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_gt_tlb_invalidation_fence *fence, *next;
> +	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
>  	unsigned long flags;
>  
>  	if (unlikely(len != 1))
> @@ -438,7 +438,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link) {
> -		trace_xe_gt_tlb_invalidation_fence_recv(fence);
> +		trace_xe_gt_guc_tlb_invalidation_fence_recv(fence);
>  
>  		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
> new file mode 100644
> index 000000000000..f7402dd0bec3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_GUC_TLB_INVALIDATION_H_
> +#define _XE_GT_GUC_TLB_INVALIDATION_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_gt_guc_tlb_invalidation_types.h"
> +
> +struct xe_gt;
> +struct xe_guc;
> +struct xe_vma;
> +
> +int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt);
> +void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt);
> +int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt);
> +int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
> +				   struct xe_gt_guc_tlb_invalidation_fence *fence,
> +				   struct xe_vma *vma);
> +int xe_gt_guc_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
> +int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +
> +#endif	/* _XE_GT_GUC_TLB_INVALIDATION_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
> similarity index 54%
> rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> rename to drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
> index 934c828efe31..9e3d1daa51ba 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
> @@ -3,18 +3,21 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_GT_TLB_INVALIDATION_TYPES_H_
> -#define _XE_GT_TLB_INVALIDATION_TYPES_H_
> +#ifndef _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_
> +#define _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_
>  
>  #include <linux/dma-fence.h>
>  
> +struct xe_vma;
> +struct xe_gt;
> +
>  /**
> - * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
> + * struct xe_gt_guc_tlb_invalidation_fence - XE GUC TLB invalidation fence
>   *
> - * Optionally passed to xe_gt_tlb_invalidation and will be signaled upon TLB
> + * Optionally passed to xe_gt_guc_tlb_invalidation and will be signaled upon TLB
>   * invalidation completion.
>   */
> -struct xe_gt_tlb_invalidation_fence {
> +struct xe_gt_guc_tlb_invalidation_fence {

This is still probably a GT layer concept. e.g. We invalidate all
invalidation backends with all global seqno, when all backends complete,
we signal this fence.

With that, this patch by itself doesn't really work. I think you need to
combine this patch the following patch in the series.

A few more tips to get the layering right.

- All of the code external to this file shouldn't change (e.g. public
  functions rename the same)
- xe_gt_tlb_invalidation calls into vfuncs to issue invalidations
- xe_gt_tlb_invalidation layer managers seqno, fences, and resets
- Invalidation backends export 1 function which returns the vops for the
  backend (something kinda like we do in xe_ring_ops.h)

Make sense?

Matt

>  	/** @base: dma fence base */
>  	struct dma_fence base;
>  	/** @link: link into list of pending tlb fences */
> @@ -25,4 +28,4 @@ struct xe_gt_tlb_invalidation_fence {
>  	ktime_t invalidation_time;
>  };
>  
> -#endif
> +#endif /* _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index fa9e9853c53b..8c47c60f3cd3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -15,7 +15,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
> @@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto retry_userptr;
>  
>  	if (!ret) {
> -		ret = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
> +		ret = xe_gt_guc_tlb_invalidation_vma(gt, NULL, vma);
>  		if (ret >= 0)
>  			ret = 0;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index fbb743d80d2c..fab65b53cb24 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -8,7 +8,7 @@
>  
>  #include <linux/types.h>
>  
> -#include "xe_gt_tlb_invalidation_types.h"
> +#include "xe_gt_guc_tlb_invalidation_types.h"
>  
>  struct xe_gt;
>  struct xe_guc;
> @@ -18,7 +18,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> +			       struct xe_gt_guc_tlb_invalidation_fence *fence,
>  			       struct xe_vma *vma);
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
>  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index cfdc761ff7f4..c38e48c039e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -185,7 +185,7 @@ struct xe_gt {
>  		spinlock_t pending_lock;
>  		/**
>  		 * @tlb_invalidation.fence_tdr: schedules a delayed call to
> -		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
> +		 * xe_gt_guc_tlb_fence_timeout after the timeut interval is over.
>  		 */
>  		struct delayed_work fence_tdr;
>  		/** @tlb_invalidation.lock: protects TLB invalidation fences */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8ac819a7061e..73cbb7a8d12f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -22,7 +22,7 @@
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> @@ -1050,7 +1050,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> -		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
> +		ret = xe_gt_guc_tlb_invalidation_done_handler(guc, payload,
>  							   adj_len);
>  		break;
>  	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> @@ -1184,7 +1184,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>  		__g2h_release_space(ct, len);
> -		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
> +		ret = xe_gt_guc_tlb_invalidation_done_handler(guc, payload,
>  							   adj_len);
>  		break;
>  	default:
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..a0f63f457342 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -10,7 +10,7 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_gt.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
> @@ -1073,7 +1073,7 @@ static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
>  };
>  
>  struct invalidation_fence {
> -	struct xe_gt_tlb_invalidation_fence base;
> +	struct xe_gt_guc_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
>  	struct xe_vma *vma;
>  	struct dma_fence *fence;
> @@ -1104,7 +1104,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
>  	struct invalidation_fence *ifence =
>  		container_of(cb, struct invalidation_fence, cb);
>  
> -	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
> +	trace_xe_gt_guc_tlb_invalidation_fence_cb(&ifence->base);
>  	if (!ifence->fence->error) {
>  		queue_work(system_wq, &ifence->work);
>  	} else {
> @@ -1120,8 +1120,8 @@ static void invalidation_fence_work_func(struct work_struct *w)
>  	struct invalidation_fence *ifence =
>  		container_of(w, struct invalidation_fence, work);
>  
> -	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
> -	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
> +	trace_xe_gt_guc_tlb_invalidation_fence_work_func(&ifence->base);
> +	xe_gt_guc_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
>  }
>  
>  static int invalidation_fence_init(struct xe_gt *gt,
> @@ -1131,7 +1131,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
>  {
>  	int ret;
>  
> -	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
> +	trace_xe_gt_guc_tlb_invalidation_fence_create(&ifence->base);
>  
>  	spin_lock_irq(&gt->tlb_invalidation.lock);
>  	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2d56cfc09e42..f3adde117811 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -16,18 +16,18 @@
>  #include "xe_bo_types.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gpu_scheduler_types.h"
> -#include "xe_gt_tlb_invalidation_types.h"
> +#include "xe_gt_guc_tlb_invalidation_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
>  
> -DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> -		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DECLARE_EVENT_CLASS(xe_gt_guc_tlb_invalidation_fence,
> +		    TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  		    TP_ARGS(fence),
>  
>  		    TP_STRUCT__entry(
> -			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
> +			     __field(struct xe_gt_guc_tlb_invalidation_fence *, fence)
>  			     __field(int, seqno)
>  			     ),
>  
> @@ -40,39 +40,39 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>  			      __entry->fence, __entry->seqno)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_create,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
> -	     xe_gt_tlb_invalidation_fence_work_func,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence,
> +	     xe_gt_guc_tlb_invalidation_fence_work_func,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_cb,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_send,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_recv,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_signal,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
> -	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> +DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_timeout,
> +	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
>  	     TP_ARGS(fence)
>  );
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7ae2b0300db6..965e17c640c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -28,7 +28,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt_pagefault.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -3179,7 +3179,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  			 * FIXME: We potentially need to invalidate multiple
>  			 * GTs within the tile
>  			 */
> -			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
> +			seqno[id] = xe_gt_guc_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
>  			if (seqno[id] < 0)
>  				return seqno[id];
>  		}
> @@ -3187,7 +3187,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	for_each_tile(tile, xe, id) {
>  		if (tile_needs_invalidate & BIT(id)) {
> -			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
> +			ret = xe_gt_guc_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
>  			if (ret < 0)
>  				return ret;
>  		}
> -- 
> 2.34.1
> 
