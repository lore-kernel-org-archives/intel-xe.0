Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26EB10E829;
	Thu,  8 Aug 2024 23:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+yCEUhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431CD10E829
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723158903; x=1754694903;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bvpkdu7VAncqerHBBGm+SHjverCNaREGYyCo7S2kE0U=;
 b=T+yCEUhEh/IyQByydUyZ8YZ9uINFqYNKCtov1aL3qloWGvDxZezw1rLZ
 nwwQWFUFZNxni2rY3N4H/DgH8BlhgBg5udXef0E8P5pKvPrh4x/bQQWeq
 9fP1FudV2BKYINMCjsnLJ7/0X8W3VuzaPk9enNydXc2oCXgoFwmJnN5oE
 PTnn//zETPxCXCePcnZPT+ucWlPVwmeBxvb+mLSGYba4ncalWWFhXiqVN
 cGqP6WjKOgOxQ/1Bo6XER0b/yZuMwtRHf3JrMM/kxMIqaHxD3F21UsAgq
 GoxUdxrQ+sMpNprOKZqsmlykMn/O9ynmwaWuvyR1v+fMcFCCedcj7DRzc A==;
X-CSE-ConnectionGUID: 0XX+Jo1MR7KrC8kkIArZuQ==
X-CSE-MsgGUID: jVFKpl1SQv29U5phelXatw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31990380"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="31990380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:15:03 -0700
X-CSE-ConnectionGUID: y/pdt4JORiGnaQgb5fr0og==
X-CSE-MsgGUID: wZy9U3FVR06cXE+27s+1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57296726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:15:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:15:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:15:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4GSEcgo6M/+XuiKbKYOcMF/ZFAWOR6xY7c4CPvNBQnD+KMq79YrnPZa/OG8J5yKk5Lcsx3nOdZe5UmMjdqzxK8kztFHHSi8zafh1Zb3Ka6BqgBLO7/OibMT8erD9Wi0s8QMvJ2zC8uNYntKkxygviWNVNuaCXShBDKOEjmKkAYrlgJGIF/Wy9zTrOyzq1XEYn6AdcySPE+R3yT8nWQCj6RriOC4eIXFfZZjIJQepr2OlgP/UmVj37bKtNEfRkxjROG5XCvLri12bjixC3C8JDFfxkQtIk5hush29g9zWLKdHgqLm+dn71Jlwpmti7JVEVjAorkxrn00QoUW9lCSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2REXCcwqzkBA3cce/gs+UwHkWIwCMxpQAjBRTox7a64=;
 b=PA6LdPIaNQlrbulVsrQx+q0VloeFcK49UqPfuyGwa5PmMw+XQGk/+j+rpaxoEuQSfTotQwlJKbqxSvo6fD8T3cCip8BtkvNNMQl1dCFDpqclV2MnB5GFbMJxbU7dihEnTD+I4RiaZOVcn7MSNdN2UzADpqamet9DQZVWoD1YoC6/zPoKnM5bVIaVrn6HqpCG9Rajm+XErGVc9NIoVeE7xw+67cnZAwNjvWXa3PWCLnu2BTO2ivmfpd3M5BVz3vcMAVoHW51J8uWXWyOJIUq4lSDPp29mkkRub8Q5SfFpRNozaoTTGi4gKwdZn0S9DUh4yPXSr5h2n5MaUqnJms/jsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 8 Aug
 2024 23:15:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:15:00 +0000
Date: Thu, 8 Aug 2024 23:13:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 3/8] drm/xe/oa/uapi: Define and parse OA sync properties
Message-ID: <ZrVRIiNr/kyr6ZnZ@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808174139.4027534-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4808a7-48a2-4317-53a6-08dcb7ffed13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MLaBjrmC0UrB8cvjcpnuVSi5ELd0dqKw80bLqj0lwzWG+FxYk0izkAmkvW0h?=
 =?us-ascii?Q?6xv9aa54K/h7/9PRgLZgy5Z71CfUg7MR1heeySnrqhavZ9ToO38t1VM8hsNA?=
 =?us-ascii?Q?H4PLY6owDzfn0+WH08Hge1or8Rx/8ULEzNVCjjc0HWiRzUM4UTt9EZXQlM1V?=
 =?us-ascii?Q?PfPSU/o+IXCBXAZGdu1wDbtyrQiAJ74yz8yLtWeCkYlMfApHiQ+L4ul1qXzl?=
 =?us-ascii?Q?OBgP6vuRvu9LkL3tp970OTlqZd10tjM7cYPKsiruHk/P1AbQjPJa09gRlLlj?=
 =?us-ascii?Q?v/KoZSa3+okOLJmdTQpRvnLF8diO4G+bHza7SmTDYrZuNSPawLuUHn/F1Rsp?=
 =?us-ascii?Q?39rqcSOmLx0fH/h0k6to7C2Q28lhvyMWojRIWsAptZ1RXLneAnDM5DjLkgQ1?=
 =?us-ascii?Q?Bo1N9VscA5cFKFHx8pkS0cuDE7EsABBUL3PiEdLynE794WlVY6p3Z7s14sn+?=
 =?us-ascii?Q?9ZrAWBMNoDM7jzQa3KQsChpwrQ3Ms5fxb5Nb1NSs/J3GsQZlWFei1DLzSvtP?=
 =?us-ascii?Q?IW+naDEqr6hgwN/UNVgx2aesMDyZhdLyvHwWTvqeFmZt37dzvMEwlJyD3lMh?=
 =?us-ascii?Q?ibGsLEe3BP2ap6O0NLbideJJ2yvJYNkbd3tq7x0fygSRrybpRW12bGsuq2ed?=
 =?us-ascii?Q?8maf3Wu1S4NNDpphVegQxMuwxZNNoE8tNo0idxKHyaWLZvO7VaCf6c/bJSSk?=
 =?us-ascii?Q?CwcA3uzD3Fb1aEJ8BdhbQSudaSZQ+CmpDFuD3gX2+cP51DR60YCdTvUfyBAm?=
 =?us-ascii?Q?fs7HorhJwdY9dztjXup52uzGs2D3b+DsFHoDgwylTRXUmoJ2ko19jnun1s3+?=
 =?us-ascii?Q?K2lB1NS23bhoSF7fJd5O6KmQn46a+Iu5fizZNAi20rn62DEQ6/wenpkea++P?=
 =?us-ascii?Q?Rz9oHOIh8TbxhfHSFIaK+JPbYPQ3kfRthJ/xIk2/S8libAz+z0S10ouSxbH6?=
 =?us-ascii?Q?SN8M3QhijFDajI0kYr8l4mIE/sqx2W7rpW82AF5/LAAt82b4/+P0SQ4+MX5K?=
 =?us-ascii?Q?OapKuzx3Wna0Tua/Ygjmf1mEdlRDzxRnd81Hi7rVe44amOaP3agr0TmOhUds?=
 =?us-ascii?Q?ndBzRumB4HUjN1zLwv75s9bJxodPfq5q9ngIHRA/vXDEGFA2iZWQFOvtrTvj?=
 =?us-ascii?Q?+LZKyoRpERWIV/erTyF5FG6joKWUYS+XgI0R/VuK7dAM6ZbwdEJqYCJlWwwz?=
 =?us-ascii?Q?TDyjmzoLgWzTWxQMLwWLBO4yinx8ls9h16WljxRXw/Vx5LCbqQC5TAh03Q5C?=
 =?us-ascii?Q?ExdLg7uj3M3AVLGooOo5a7ffRK9Y+sf7K8+PeO0CH4cybS6pzjOFQaBake3J?=
 =?us-ascii?Q?PoDMHG6bIgj6E8PqNvHel4mz29H7C0hhzuvC/GIKmRE+kQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FJOrxJDwKddzo+rQETLNvPDOpDNZgS24z7OEla3Zr6TRs6zMoRYWfmXEKab?=
 =?us-ascii?Q?DJjsJ8HfR17QpZ4A8t29xAwW3oTJx8BMkKp3S0Nn77DtvfsMQ1Mv9t+l9s1x?=
 =?us-ascii?Q?chWCnbP/OXgKtUgIIs8MFSLjmdBGFRflc6UNPwL7hCiqsmyMNVuerAa/ow5N?=
 =?us-ascii?Q?7Ok/sNMtncg5lyNR328RJDbcnMsy11mf0zeTLQNY8yhpprGq8/zPSRsFtcrz?=
 =?us-ascii?Q?efcQjGL/9mr6DKWfQo0V6l2fzhOaOljtqnjTl2Cfz8lucaEvVWq5/FryGH9U?=
 =?us-ascii?Q?q2lHkH7sXpVg+sHeEMFFqYWQ0CyQmXBUQ0ve7PW/cGcHyCQA/IdWN84WK5e7?=
 =?us-ascii?Q?zr+EnYHGkCNAeR/RQuFOBrBP44JCn2Qzh2k9TI4vBps13peuxPygFNZn1VNY?=
 =?us-ascii?Q?w6btzr+ZxUHEVi9FZCKYsWaUT77yyZnjvXoNnAhBKqNgNR6TKPC/EZ0vbS6d?=
 =?us-ascii?Q?8d/2fJtAgLuNDKq4hadIYHSHxyqgefseWhLPkz6bI/nUDviGc+3oOi44MMUr?=
 =?us-ascii?Q?dduZqktHI7dVkIfcVc+cDsSb7EVtNlh+j9nrC13Z/YsqyhACeL3hD9KTR96Y?=
 =?us-ascii?Q?Qo6XTYX4dxp3ne//fhBbz91u2we/WJnC0oJu1jR55Eq31ERFznb8cXRB2ss1?=
 =?us-ascii?Q?l98SFGF2b4zsCYjzgyNFUEOgE75Xap5Ard1yTaXBDpqdzLZlk0C/FKjnXM1i?=
 =?us-ascii?Q?YQMSCUu10WXiPhclMWV7Zgv2Rh6CN0g+aSNpsqa4gGQq2aRdT/GvsuIZjJeR?=
 =?us-ascii?Q?NVWoZacQxuAoRQ26Xhl7eIhqMPqGEdCxOoO7AxTZbJS4NPS6eRpfU1CR4py5?=
 =?us-ascii?Q?GrjduoFRbnadeZdfhe+qzZ48GCUwDwKydJKqxxwgWh36Ii+N2OaPnyTEO5rw?=
 =?us-ascii?Q?FwjJHrr94CkTHPNofoRJoWC/m3eFBXBszCy3Wc3ZWb2GDb0wX/Xv222dKbJ1?=
 =?us-ascii?Q?uW1JCfrYPurnLcg2kDifxVrqrFDlWVqKGhEQQtGcQ5YSjg8q6DDylkLQYmvm?=
 =?us-ascii?Q?f12zk3TGu+yzOMwpIqGtDWKp01v8REpxN5D87uauLtRDQGFk09dzqa0K6xmz?=
 =?us-ascii?Q?X/8ZyRizfCh/t5jD+UHErcI1i/4oCBGFGqmLurqcmaAfdrj+DW3PK0I3n1wC?=
 =?us-ascii?Q?7LgYilF++XVjqFOOQfFMpOFub8hTUdiK1FHdSYvDKTJwMuTgno5RC6KHIZY2?=
 =?us-ascii?Q?cDMecb5imEc+OewG7nzlgvuwBp4v/tZSfsN5O/eYbiZBhnOpJFKnako29eaJ?=
 =?us-ascii?Q?kxWVcaHbaWbwLnL8cRAto/v+GxQZBB6Ru66kj3xfteJMZm/hKv1XSpaW/3jM?=
 =?us-ascii?Q?9iI1l10W1SSeKjh/ycY10KwGT3i3l7mLrrTYdfGHeqCoQnZTB1bqZofanLlX?=
 =?us-ascii?Q?8/NZW4GqJmYp/2S/kHOfOx7PIAUtBqfLty0asnIXAizdUisVuxc3FVP5HmxP?=
 =?us-ascii?Q?I/PQeA5Bl5Pp8evQFxCNuiilFxWEkeWg2qiCGdlDvoN4s/2GspNU0P3brydd?=
 =?us-ascii?Q?cSYlKtLrVZlohCaQ0hQS70YujBstTaPHe5brgrReazfBHw/nPdItP5HAbnBP?=
 =?us-ascii?Q?YZ87LNpKbG35gk0NamyWGRQArl1SU0yV+wTL2I+BDdkTF/J/u0lYJ8ecHhc2?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4808a7-48a2-4317-53a6-08dcb7ffed13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:15:00.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9n2fwPYKwXGMoQ7uqfDXxkV9/vlhXt77hwBi7TYVKjJImY/XS7Tp6Z15JVUqZguro0nwdKWiY7eyRGLbYyyDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
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

On Thu, Aug 08, 2024 at 10:41:34AM -0700, Ashutosh Dixit wrote:
> Now that we have laid the groundwork, introduce OA sync properties in the
> uapi. Also parse the input xe_sync array as is done elsewhere in the
> driver.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 83 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_oa_types.h |  6 +++
>  include/uapi/drm/xe_drm.h        | 14 ++++++
>  3 files changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f97d64ffb460f..ba8f2e9d95b7f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -36,6 +36,7 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_sriov.h"
> +#include "xe_sync.h"
>  
>  #define DEFAULT_POLL_FREQUENCY_HZ 200
>  #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> @@ -70,6 +71,7 @@ struct flex {
>  };
>  
>  struct xe_oa_open_param {
> +	struct xe_file *xef;
>  	u32 oa_unit_id;
>  	bool sample;
>  	u32 metric_set;
> @@ -81,6 +83,9 @@ struct xe_oa_open_param {
>  	struct xe_exec_queue *exec_q;
>  	struct xe_hw_engine *hwe;
>  	bool no_preempt;
> +	struct drm_xe_sync __user *syncs_user;
> +	int num_syncs;
> +	struct xe_sync_entry *syncs;
>  };
>  
>  struct xe_oa_config_bo {
> @@ -1417,6 +1422,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	stream->period_exponent = param->period_exponent;
>  	stream->no_preempt = param->no_preempt;
>  
> +	stream->num_syncs = param->num_syncs;
> +	stream->syncs = param->syncs;
> +
>  	/*
>  	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>  	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
> @@ -1767,6 +1775,20 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
>  	return 0;
>  }
>  
> +static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
> +			       struct xe_oa_open_param *param)
> +{
> +	param->num_syncs = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
> +				struct xe_oa_open_param *param)
> +{
> +	param->syncs_user = u64_to_user_ptr(value);
> +	return 0;
> +}
> +
>  typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>  				     struct xe_oa_open_param *param);
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> @@ -1779,6 +1801,8 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
>  	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
>  	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
>  	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
> +	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_num_syncs,
> +	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_syncs_user,
>  };
>  
>  static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> @@ -1838,6 +1862,49 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>  	return 0;
>  }
>  
> +static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
> +{
> +	int ret, num_syncs, num_ufence = 0;
> +
> +	if (param->num_syncs && !param->syncs_user) {
> +		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	if (param->num_syncs) {
> +		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
> +		if (!param->syncs) {
> +			ret = -ENOMEM;
> +			goto exit;
> +		}
> +	}
> +
> +	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
> +		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
> +					  &param->syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC);
> +		if (ret)
> +			goto err_syncs;
> +
> +		if (xe_sync_is_ufence(&param->syncs[num_syncs]))

Do you even want to allow ufences for OA? It doesn't seem like you do
based on this series.

Matt

> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
> +		ret = -EINVAL;
> +		goto err_syncs;
> +	}
> +
> +	return 0;
> +
> +err_syncs:
> +	while (num_syncs--)
> +		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
> +	kfree(param->syncs);
> +exit:
> +	return ret;
> +}
> +
>  /**
>   * xe_oa_stream_open_ioctl - Opens an OA stream
>   * @dev: @drm_device
> @@ -1863,6 +1930,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		return -ENODEV;
>  	}
>  
> +	param.xef = xef;
>  	ret = xe_oa_user_extensions(oa, data, 0, &param);
>  	if (ret)
>  		return ret;
> @@ -1931,11 +1999,24 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
>  	}
>  
> +	ret = xe_oa_parse_syncs(oa, &param);
> +	if (ret)
> +		goto err_exec_q;
> +
>  	mutex_lock(&param.hwe->gt->oa.gt_lock);
>  	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
>  	mutex_unlock(&param.hwe->gt->oa.gt_lock);
> +	if (ret < 0)
> +		goto err_sync_cleanup;
> +
> +	return ret;
> +
> +err_sync_cleanup:
> +	while (param.num_syncs--)
> +		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
> +	kfree(param.syncs);
>  err_exec_q:
> -	if (ret < 0 && param.exec_q)
> +	if (param.exec_q)
>  		xe_exec_queue_put(param.exec_q);
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 540c3ec53a6d7..c1ca960af9305 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -238,5 +238,11 @@ struct xe_oa_stream {
>  
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>  	u32 no_preempt;
> +
> +	/** @num_syncs: size of @syncs array */
> +	u32 num_syncs;
> +
> +	/** @syncs: syncs to wait on and to signal */
> +	struct xe_sync_entry *syncs;
>  };
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e9..0a3daaea4eb27 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1632,6 +1632,20 @@ enum drm_xe_oa_property_id {
>  	 * to be disabled for the stream exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> +	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 */
> +	DRM_XE_OA_PROPERTY_NUM_SYNCS,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> +	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
> +	 * configuration will wait till input fences signal. Output fences
> +	 * will signal after the new OA configuration takes effect.
> +	 */
> +	DRM_XE_OA_PROPERTY_SYNCS,
>  };
>  
>  /**
> -- 
> 2.41.0
> 
