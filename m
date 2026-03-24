Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A60F54AC4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8912310E0B0;
	Tue, 24 Mar 2026 14:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIBCkGla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F50A10E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774362337; x=1805898337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pY6cCJf/Ot+48eGth1Sj4OvsfU6vGdOpRWoNe6iJAb8=;
 b=nIBCkGlajsEEEWUtz6rFnjny70PTB1duL86phS73OlvZjv+OHseBq8bX
 qtkEuSzldInqxZJ2ftlhoryxhm45hYdjRATnK7QfVtxPcVSN5hbbfSH2K
 YwADUJu5oQ9z2mnz82tNudiJVsy3j4FSbW84MHL4vCmFMrmn+O0JdNBAC
 X4spOwIbCOmqFdCTXv4N/liB6Fzr3G6Lz1vu0Da4XFaelNluuJ2Wl9A9X
 SpxJPL+Yq9geC/YWBpdoxGr5qPhDwPN0OmnJk3j58vPmtDKU8lvVtmErA
 Hnm3MhVUkWRBA5WlJz3SSUUiHJANHfN3cp+Ajjn2bbxfTmTzjL5SHvhaP A==;
X-CSE-ConnectionGUID: LjLrePgwTgqmhvxooFjHhQ==
X-CSE-MsgGUID: Z3kuB1a/QmGeSxPlZf+sAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100825118"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100825118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:25:31 -0700
X-CSE-ConnectionGUID: +GEbzZemS2KcnYUAqqT4/g==
X-CSE-MsgGUID: xN+nHhTAQ6+pL8d8XYEKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="221020774"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:25:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:25:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 07:25:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/lvZqdBzDQdDssWNEd9eSrDcIL37pac48GUe6tv4W7wU8q1bu1WAXzpqdvh71QnKEiktGLdMyQvahXtAYR4d1ANJgqo2Y+vmoHMUcN/mLu1LYetZgx1aooHmN854S+D7P6p6UnMdbCleY5IwP5s8ogrkvyu7kAqnZhTwK7MX/1C26B96FjvmEZpwEH8Sxszy9vYDum1kDa+X56QzK4+qlREa+4ATZy6uI6sDm6+GRRgvtE6KdtIc0AXKukYhxYDtsBhTKaYVyuqTQzgg39gJ6itsUGOEd51vIJfs8bVNZfbFreCSWCSzPS+jAF/lYelJZwtmcGp0Kum5YXXRmmXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur3D6lYYR5KJ3weXTbMrFw7vA7B60iADKS+QJ8Iktco=;
 b=Jwm+9Tr7DzBHA+g81sbLQoLqgEkpv0oDefbuFuv8zCkz5pqQvnpkbkEbVuJSaQG49qICxpNPezqHm8kAPHOfhd5A34N/OIuA1rnZyp8Pl+bPfdLO8rFH0Xmx7OZaBX3QKSY7kqBEjpY9zZ37FspQ6f4YDkq3oEtQldKkV73oKC/6PrFa71UPDcQcTj6RIcVcXHuijKgmar8Lw1LlrmE48bUpwhapuyF7gKSp9H3q2uNe7yWnliDazNWIxgPJs46fH1xUiaHPc/X/jqFasB8WJrZKIbx/KCx58EEX2tj7zBl22kxZ3GowkKCpHH8y059S3IkBP3r7Dn/T8X3P8c/alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:25:19 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:25:18 +0000
Date: Tue, 24 Mar 2026 15:25:09 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [RFC 12/15] drm/xe/uapi: Add access counter parameter extension
 for exec queue
Message-ID: <acKevKB0mEbwGLqH@fdugast-desk>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260318074456.2839499-13-himal.prasad.ghimiray@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0313.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e9cd8b3-6018-432f-7e06-08de89b12cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: MYt1fcGuEanpdsRk4IkFBS43FZyGGCAZPBUNqlMvymqK0TlsqDjRRBYcwwNo/B4rU3zFTao9EwDFTP02CIkjwOLZx4EiEZfstoMFp2CcGtR8UcShHuJtskc7aHyY9DGlX+puGrYz1Hc8oESsOIJLcrpJQ4nzzwl6hN6LQXROcfIi04/YOm4EPXQ6S075Mt26pLssv/RDjv15dYp5mfEOEZAHookJMnKVfJcUD2rg7cWCqa5AfX2zojDf/Vp8OPV9oNjslOcYKIz+2joy/BXs/SgvC4z/lSrbDD/ncjbe/gz0dQVZUV+8i2As5zSxQfd+Ou6Zi01gPfi16ww5Y9D+9rpZdcy7cjz2vxHTy4N+nkHbBt9p0Sle7yEU02Q7ImHqTx54ScaU4NOzVLH6qVEOrtxsQQpXbtEYL0eoXyQlcLmlFm18DAP1zX7SpP7HnSRSwmzAcJMOEK3emj1wMQ360O93TEPVwzZJqTxRX9UmR7Ohy2zsNiq1JrS/zhT5tKntS47/KYx31tnnQWQhw8Dn1fK38LugGXMqhXJKZAmUWKZishWhSOO4aMAMsHxVT4dgehbygW86wewY4Be2lJariVT6snkSECVIndPdZ1HRqijfx1BfDytrQUPEbLEPlcJMissCS2sqfg1O4CQhOXoQLDlAKK4EtGH+N19gYk52AQEY3l0BOiAHwtDQQUIlUpRZpbQZhOqPrQpSdFEOR7vL6lamEC+kjndBhHAY8H488Aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhE8C/VbSV1cj1wj3i3KrJYe0qyrF4+wUm93nFgUQboYpSLCb5kdG9rbUz3C?=
 =?us-ascii?Q?odZ2u/mGkvl6QkQq7IF7aiCtO/9tg4EePltCQtzMmCfxnTk1iOdfIb9ocVrm?=
 =?us-ascii?Q?XZ+S0zyQSsHFnVpvFwS5yliJhjBbBDx6+uf3fjsT++vweIyKvY2EGOtltrSd?=
 =?us-ascii?Q?qljoJDPLTouQock5IlHt+HiHciY5W+oomJEv3XXFZD9Iz0/M3Y9YKjORlVgd?=
 =?us-ascii?Q?fyJC8c1rKXzLj6X75St+JBkRCwG8+c8iYr8UVUSZIz5dFz94sHp1o/enQ3gj?=
 =?us-ascii?Q?cl9yD5t6GKX7mxmjdndCM82FXGJ1S8pDgNPXty7QcoDbTWanwqPMjaqORZSz?=
 =?us-ascii?Q?V0FKKbqw5L/NTK8IF3vcb6ut7L8pK9d7F0W1SuqpU7GWyZY9ZbNdblq/ReNN?=
 =?us-ascii?Q?3Wnr3mXUT0yFlXnkg/dQID/PFBLTKJWKihvoWLQCWwdx+UntIbNnBKyFHAr+?=
 =?us-ascii?Q?I/n1XQLWYrMdx9ccebiB+JkOgKVzDSHrW0dTXlw6+eC7DuD34iWmI5HFF3M5?=
 =?us-ascii?Q?f6Rxc9RtIfGJ1dfhcj61rS8ya97gb9Qwxn9EQNQ/MnSoNDDIu3pnJYYRJTQn?=
 =?us-ascii?Q?InFXcjtdPtYDlIdGI16b1KoDtpv1VUkxkyFl5L6MIbQhtIOkgJqQkeYVrp2U?=
 =?us-ascii?Q?r/n/7Cy2ektmZKyhSTZe18fjy3jQu4LSkGf2PeiQSPFhPe1kMfCqDJdzbCOs?=
 =?us-ascii?Q?ToRd82Ak/2/FJ3Vnwe5MW0/KIl6Xb1p7rbmr6wlLxQ0WcehZtaK4s5rXyKjt?=
 =?us-ascii?Q?LGnamx2kwNNFuZY6wi6au1cocJK73trVIfvsTyj/3YD26Ck6i7y66+9lBEHU?=
 =?us-ascii?Q?kG9Uq5TmLJmQ6+6OFRC39FjJfdRjpV/9ryvP9ucPU28PmbrEWVHRPk/1Jhnp?=
 =?us-ascii?Q?caH7YAJ+I+Ig7e5fVlA2gjKxoM9F829tvzFkaj7rJhimNgF4sXSw17NnA1Yf?=
 =?us-ascii?Q?PHIlah3TahZnwYe4tIvTttUInQCbB69K9j0Jr5e5fA3n9o2yqR/yvYG2m65g?=
 =?us-ascii?Q?dATFbhZcRwqau768ngWVslsXLEBRg6iE5NcAinCbjDPaUzTTSUP/xUbWn5iC?=
 =?us-ascii?Q?IJaYlqESGwe11982hWxs8vXhGzocY1y/eQIZxlQ0P5BXjm9mt+VVFSzRguZ7?=
 =?us-ascii?Q?0abFaR3wqwXQoSs1nke/m7GmjY4ypJ5dM4Z5zjE0VLN58P6jw7cANG5LiFfL?=
 =?us-ascii?Q?eqN69OS5yh13KS8kJPWO+g6kzl4u/XFR6n6QROu3LeSvmNu5ti3zXVCCf3l3?=
 =?us-ascii?Q?/GLV+fVPQxzupnypJO7tSxcOUALDIgdTQHGVdT4X2KlBMCEph8uklC44NnJs?=
 =?us-ascii?Q?xZ6ZIUuj+PMQr7dvv9wDwkid8ychd0g0roeubkbuv5iBKvYLCEVHRCummAaC?=
 =?us-ascii?Q?38s+Q1nw/p3uMnDez2r3CN+M8cwxyOm7XvBsK0mMKCMxAkKgUYpXK/lfaWVw?=
 =?us-ascii?Q?j/tga5m+sL5+VibRCqY2uTp9jvtwJeyeJm2nTIjDmj1jYjRB/qfKPV6rXnJr?=
 =?us-ascii?Q?NwtgpK1zu29XKk4APlXCqD604tQy8M/MZ21wlKkQcheGnVv/asckJ9L1eWXA?=
 =?us-ascii?Q?tDjyPaUOchyE9lIR/m32Of4vceF15uXP2+4IHjEInfsbpHYCcNVkMbVxxWf5?=
 =?us-ascii?Q?s82/k4I5SnL35SZLzXf6TOWgY2zEaBNyebWYOmiNxhBi3oSUfLqjJwTp4dZu?=
 =?us-ascii?Q?gzLETzjw2dbSSHuHyCgKWSMvHE+/QysqnaUaadFHarRFkF6UqG8mtzTOWHVI?=
 =?us-ascii?Q?oxzlIxAGsKDIbCH/wS7LPJKsMElTra8=3D?=
X-Exchange-RoutingPolicyChecked: A1ayQJo1BbR3Qll1o+u93iOqAL8GxLffbEgSQXtmKUsgQetJiEV6rngF2ULFywS5IsNQIoThz/USvepQtwNkvudBvBmEcnX7SKKqouBoUYPGM3VHZxaYf3GUoCTE+W1s4lRO0FlB5IgoeSMc14fRlvpLFSCFtNn35emXXa2/t76mhp+zXe0hmv7f9WWnuF8Uj7KOUr4J41ZRSARtnL/TPDHN7N1pmWl5dLMnbD01J3dHzcMvEvMbG965lO6068UGWuyqKrrP5i4PMTVFIma4VxnPTEeW6XYbBmbQGq6X0dC0ZQLMNxTqlnIJXUCkmRE+AMQ9uxhX5FmPLd8cqklhEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9cd8b3-6018-432f-7e06-08de89b12cbb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:25:18.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr7mLno3BfTDU6e+flH4Gybp6GWPIopRw5s2IY6BWia0mpiGKpvvbHG2nOBlFdbUQq8FXLSN6TLZORS8rmtF7ADG1ingumdevPycl9d1WkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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

Hi Himal,

On Wed, Mar 18, 2026 at 01:14:53PM +0530, Himal Prasad Ghimiray wrote:
> Introduce DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension to allow
> userspace to configure access counter notifications per exec queue.
> 
> The extension provides:
> - trigger: Access counter trigger threshold
> - notify: Access counter notify threshold
> - granularity: Access counter granularity level
> 
> These parameters control hardware access counter behavior for memory
> access pattern tracking and optimization hints. Userspace can configure
> different thresholds per exec queue based on workload characteristics.
> 
> UAPI changes:
> - Add drm_xe_exec_queue_set_acc_param structure
> - Add DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension ID
> 
> KMD changes:
> - Add exec_queue_user_ext_set_acc_param() handler
> - Store parameters in xe_exec_queue.acc structure
> - Register handler in extension function table
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 27 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
>  include/uapi/drm/xe_drm.h                | 39 ++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b287d0e0e60a..815e82011c6d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1080,6 +1080,32 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
>  	return 0;
>  }
>  
> +static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
> +					     struct xe_exec_queue *q,
> +					      u64 extension, u64 *properties)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_exec_queue_set_acc_param ext;
> +	int err;
> +
> +	if (!xe->info.has_access_counter)
> +		return -EINVAL;
> +
> +	err = copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
> +		return -EINVAL;
> +
> +	/* Store access counter parameters in exec queue */
> +	q->acc.trigger = ext.trigger;
> +	q->acc.notify = ext.notify;
> +	q->acc.granularity = ext.granularity;
> +
> +	return 0;
> +}
> +
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  					    struct xe_exec_queue *q,
>  					    u64 extension, u64 *properties)
> @@ -1123,6 +1149,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>  
>  static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
> +	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
>  };
>  
>  #define MAX_USER_EXTENSIONS	16
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 8ce78e0b1d50..3f10e3371e5a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -239,6 +239,15 @@ struct xe_exec_queue {
>  
>  	/** @replay_state: GPU hang replay state */
>  	void *replay_state;
> +	/** @acc: Access counter parameters */
> +	struct {
> +		/** @acc.trigger: Access counter trigger threshold */
> +		u16 trigger;
> +		/** @acc.notify: Access counter notify threshold */
> +		u16 notify;
> +		/** @acc.granularity: Access counter granularity */
> +		u8 granularity;
> +	} acc;
>  
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f8b2afb20540..19447ba10b1d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1337,6 +1337,7 @@ struct drm_xe_vm_bind {
>   */
>  struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> +#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> @@ -1377,6 +1378,44 @@ struct drm_xe_exec_queue_create {
>  	__u64 reserved[2];
>  };
>  
> +/** enum drm_xe_access_counter_granularity - Xe access counter granularity */
> +enum drm_xe_access_counter_granularity {
> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
> +};
> +
> +/**
> + * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
> + *
> + * Extension to configure access counter notifications for an exec queue.
> + * Used with DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.
> + */

Sorry if this is already documented elsewhere but I think we would need more
details about access counters from a user perspective:

- why using them?
- what is different when using an exec queue after setting access counters?
- what is the typical flow, maybe with pseudo code?
- how is @trigger used, what is triggered, on what condition?
- how is @notify used, what is notified, on what condition?
- are notifications going to user space or only to internal and trace?
- what happens if access counters are not supported?
- can access counters be reset? removed?

Thanks,
Francois

> +struct drm_xe_exec_queue_set_acc_param {
> +	/** @base: base user extension */
> +	struct drm_xe_user_extension base;
> +
> +	/** @trigger: Access counter trigger threshold */
> +	__u16 trigger;
> +
> +	/** @notify: Access counter notify threshold */
> +	__u16 notify;
> +
> +	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
> +	__u8 granularity;
> +
> +	/** @pad1: MBZ */
> +	__u8 pad1;
> +
> +	/** @pad2: MBZ */
> +	__u16 pad2;
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>   */
> -- 
> 2.34.1
> 
