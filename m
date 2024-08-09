Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD5C49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181B310E089;
	Fri,  9 Aug 2024 03:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAB7vkhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71310E089
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723174695; x=1754710695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N16rGqLTLa4loEcTTUUOiMDd2T8/S8pHsmZkB3p0hJA=;
 b=EAB7vkhS8hGa0uWGg0mjLD2nzbPK0QMYfSvSYvP6RKEodJozBZmgv0j2
 a+MxWmppi/bwVKFmWrabDs4jmwncKV9P5LtJXRWk+UuXQtHflEoS2vhLp
 JTXzFlUu2KOEPRLyb4N+CIBVRa7jUo4639FRh02yQ5hSbfxNTI9N/AB23
 BQMwu95L2D6ahAoUkJtyzLRAcoFtK3cqwVLPrIpHvbcvlXQflWo3Togdm
 m8k1IDfwMZq8tkaBD/aGxapyNxUq3eJpKlGgS1jyF9W/MmIQsA/7h1e9a
 /g3ieaFigAiGWsvF2f1sU7xwo91zalIDlWwQaktV16skSRO4ts6COtEqa w==;
X-CSE-ConnectionGUID: WHll/CA7TfSDkfU8ll85pg==
X-CSE-MsgGUID: GlH/TjVJR8ucJjI1iwRX/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21507529"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21507529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:38:14 -0700
X-CSE-ConnectionGUID: U9IXFM4gToyCr7UosAbGdw==
X-CSE-MsgGUID: G9LUty72Si23ivBOttJiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57406251"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:38:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:38:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:38:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:38:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUhEtdMsLs8vky3kC69iSs+1YR3tNMTA8OYPa5G19hHkN/5hCc4C/iDS8BCehrTvOMjO+1VeVs2npdqpY3h9W1LWXVQEvW4MPzBXTNaFNmrKC4hP+u3kJvrM1k5u0S2Mq3BK7Q88/tYR8z/vwKbLdRI+Z1438+4659VSQYiTCjWZHoN6DqYzYmPkhbsXXry+n6SpDUCaUFaj44gK0Lo56zb1MwvOOoziIrXEQXdQjDj9x7DxGY0LZ0hL+Jzi9K+gITI1Qdy1kQhiHRvsJRQ4LeSwFGWkmLi2dAJ9OhWpdowvO64N9rnwwrQeN3lSgwFAfzzUoziabzZQJFF5ESHY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbOt8eDqc5ZoiQlQPEMyLo3PlH4qGzWmFzkUceLywvQ=;
 b=K/t5joOVKgDrUSHUKabWbC2cqfFV3flF6LAJIld0mj2+GfWcCgGnwdHZRXMRpNGDB+Pm4yUJNA0/bcFxiqG7KLo5gea1wKd7QUq/7RFVi/NQQvBpczl3TMYcNkNeqdWjMAF9gzbs6zfD0Q2iccIcVTKC3kQtDSc6p0FZnMyzgq05W2KjyZ68QKUTLC/P7PSLhaHeAa+pHw+6/7apsb2WT90V2kyyo+m/lQbEh0QSmugcfbrfiHJlTrtLyUeuZ3x7Xsc/z452eV3h149exrPeVELJ/gbRyw0tIKTvlmUNlHprI8QrblI3H+ITpgTm+fzBGDuCPHbivdxgOjnYp9QNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 03:38:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:38:10 +0000
Date: Fri, 9 Aug 2024 03:36:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 03/11] 'drm/xe/hw_engine_group: Register hw engine
 group's exec queues
Message-ID: <ZrWOzhqCBQwsJAtA@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: c250d3db-7258-4854-b1e7-08dcb824b0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V9dgUI4KJBYQ/TL1fEwB2unp/OtzS/LChqBsx1VOInYto1tBr4DCzdnpyUDa?=
 =?us-ascii?Q?QTw7+Ep1sS1IM9jX1JM5IKyaJPRzhB9RwL8pmI2O8QNFzBmhQWpAsl5Ydltv?=
 =?us-ascii?Q?xywS6WfXNJQH6D2JHYl7XpLIaWlwfF6k5jTpUOLybUzqgwiRBud7mwx0mHtv?=
 =?us-ascii?Q?vbKOwBEb4SgbwnLYvl+wrGF7GB/aIAi08Emms58gdigXZDZyC/HGk5lZyrC7?=
 =?us-ascii?Q?GQsVGXKSethCsjamvDUWy4vIub5XqhQ36ead6atMyAh+kb5Znp1iaitXqz2i?=
 =?us-ascii?Q?TgKZxgQ8rCi5H3iJRT5INbqdLQHTNDGuvNLCYeSIQZ27Y7f/8Z2itz0V7Kby?=
 =?us-ascii?Q?we7VCu0WIo8c/rfitnHUjMNJXsDPaWlDE+eiby+ft3VLf6rhUYoG6qKfrjHx?=
 =?us-ascii?Q?4g6PomvJAMqlAtd0BxfpdYbmVBucz95mz3zydTN7cScOozJtikrlVfeksPSG?=
 =?us-ascii?Q?0DhX1i2AGhIrt6Hx0IrVrPcP8o8rIsdWRej1AZXHrbMwkiOazEgz8HdDQJ5G?=
 =?us-ascii?Q?7xDoUqw/3HzzGivVGt9iVApYaYl/wcRIYpedyUb96ZRp/WHC/JnN7qiEsAFZ?=
 =?us-ascii?Q?WBlSOi8QQCMd/5CDfIdkXG7oyV4qMpCLrm2rdbLtc6gdnkgXSCSSikpyWotu?=
 =?us-ascii?Q?naOACyl7DDTCIvJ9bwA1pQtutrmsYkQvQVjO6ei0JSAq3owlC5u4oZH6+iXH?=
 =?us-ascii?Q?nEA26aaslVHS3PTyq26SAyp23XXPQR8f9aJoiiMZr9HurDvGm5snwCpMJLoQ?=
 =?us-ascii?Q?3bF0erJZgNGCe2AgNlxV4Zmtpn3AS00383JzvVo/nn9xZfWfWM2gLaLCxMes?=
 =?us-ascii?Q?peKJKAcdjfadU6xGDbRKkRcWaLo6tRqwrsxFHKaGjT3elrzck91MAJE/nqJy?=
 =?us-ascii?Q?YztCQvLMT+SipmNwqrb0SlQZvfOEpvMvjf4Q4u2rmcxJ9486mm8ShEkY3qx0?=
 =?us-ascii?Q?iF+T6z1333kX5TeaOEwMpyVtEg11/ANTHhh2dGf1i47283DKIpqiqUiimMF1?=
 =?us-ascii?Q?WXnjFergvV3mPny4X8qEiPuclEIzK4paCVuLoEhb4D8I/3f4bvavGssU3Imu?=
 =?us-ascii?Q?5Tgz8hKGISExd0hRwSG8zfoqNJxdtQ/9QXAkDivVwvQwC7WO2uwDSma+gPH6?=
 =?us-ascii?Q?8ABU4PQL7iml5mpooJzWfSbqSqeJU4cl3R37SHilSc/T1vI0wYXxe9NlQbRk?=
 =?us-ascii?Q?9zHFpTEeSVNPDDwCX9BKEbrJemuKSF/WMTqj30pSBdG2Vbh6FdcIZBgGNcSn?=
 =?us-ascii?Q?92t62OyFtAqWL2rFm2EUMYvx09sYJDbT77Ff9XAYeaDBs87mrlenRqCNJPm+?=
 =?us-ascii?Q?chmaJiONELDAu+KaWVA5D29Lmvmpb2QxyqAJYdsDhEZQdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4Po0qRp8qmthPbforlYVDafOl10y1JQFo+WjNX59A6NdgO2lgJr6x2ceRgB?=
 =?us-ascii?Q?6fig91wPYvD/Wrqhyt5T1xVupnNwaA8oY7F3OgdgwPPyQoXSUVvUBoWSemYR?=
 =?us-ascii?Q?3r+bR9/ubfdYxVpJ4V/7Ulb6RchzXk9hIxp3Ruy4IFSgsauKlrqe7xmd5+lk?=
 =?us-ascii?Q?DJCMg0BfY/EuDXJIuFrdjhN3mZOLa/WoHk7nSZGCU1160idH2jXSzyYg9e+p?=
 =?us-ascii?Q?Y/mIUUQ/zpaepgsUwF+a+6rs+l/LcSoFt7FSx8t4TJq66sIs6TMGWQjSHKeW?=
 =?us-ascii?Q?C2IA1bSJRcX5NYwKlo7DJWeh04lmvpOR0nxMwqT171K+//8XUiBTrdbn03xx?=
 =?us-ascii?Q?5EgIHJgd5xtLWPj54dalCD/xA6db3P0Dq8/bVeYTVQYMxU+qGs8S9vr3wnDT?=
 =?us-ascii?Q?I8l9MUnxcoUiTfrMJ/kCPSq1hi9cm4lKVTX+COKXEgHSueH2hG60gryp2DM5?=
 =?us-ascii?Q?iNo+keoibVFEHEkGK2OI23a/LYtEJUL8xMk61/8ZvAZvrWI8dzSwBklDaQpC?=
 =?us-ascii?Q?Ws6tAhDd6XgFfT6CPNulju2T6ITdXeu7vP1RKCy3zWHnGlzqgFmszl1lzLcO?=
 =?us-ascii?Q?N7hWsWF8JmOCxa5Aglg3XuEtu8YI4tn/Pa7vt07LmIin1AF7QkgZnIz96iS+?=
 =?us-ascii?Q?PCesQvw7DM29JHoj+Q+YmZXPclwrRpY3X6araxrURrfQv0Pq1gjk7wt2x0Zu?=
 =?us-ascii?Q?kCrZnnX5K+GZyFKXKzi5NQL/x/212XkokDZ6Y3m4xXu2Cadvyz5dDZxKGh7u?=
 =?us-ascii?Q?KXsQ07RFEOi8MBQ47xcPTZJ6HRtMNs4J9YJ/MxQUkQ1kG/VFgUT13Cmw/kb6?=
 =?us-ascii?Q?u8zLQ0opSNO2pcABlG19JEYKNBRnpHh4YuD7LTSm8YkwC4zCEfsHq5I9LZKB?=
 =?us-ascii?Q?OOQQk/pV6yhdNHuwLrwpNi8k5PKT147CqmS3sVPh0UnQKfU6YBR70BZUCmns?=
 =?us-ascii?Q?gIdP018LQ64z04NNys8FpJ2Xh5XXbUAhcgJ9iUC6jZOkcXEhqp0bZQv9ml5u?=
 =?us-ascii?Q?na8jc+njq+Et9Xd6koKTOjr3GhPnIJttt4VuDULGrHdvq0mfs0gWQ2PraM1r?=
 =?us-ascii?Q?QfwcsqLZoXYK0T+LsiH1ImDvQE3QcVTvkQZMCQPoCy1s2NrLNj+p4St+H7XJ?=
 =?us-ascii?Q?f0HuPSXNJlkNxq3mLoLhbdxQSSomZrwT8B3l9ECFMpOCjYuEMLdEVbrDkHDy?=
 =?us-ascii?Q?DY3NvCrziM775vfXOP+jDOECDwKeRt/1gF28aWvOWDFhuf/1M+Nn7VtTYxe5?=
 =?us-ascii?Q?KzVFDrVYbzjCQgohi9m998zjsfrALNLCoVEO3zdJw1utIxxlg59B6NZmNPcL?=
 =?us-ascii?Q?fuyiybkkNXvIR+OkpawPSYRIRurOj9kKokT0ICEVXrbZb3RNUqQa8dQQPccU?=
 =?us-ascii?Q?k5JlsStjiOvx7+CEpEBcFzaP4Sp1tav4qDvjkQM4KIiFOuHCNTfpiO/f4EsH?=
 =?us-ascii?Q?EJBBsFqxPuWWMU20QI7qndWzGYkx1P479q/BNSXhRySHlJ0mN9YJOkgWonSP?=
 =?us-ascii?Q?Kz9TkoWfJzrJLAhnE0u/cZUskN+DtigKY757NgPdQ2OalRKboLwoYvrHFmd2?=
 =?us-ascii?Q?v1vJSM5saZuUc4pyC4igHwTeFvibgNqtbLlduUCuuL53XUG46iaVU3l9+iYR?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c250d3db-7258-4854-b1e7-08dcb824b0e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:38:10.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdvrTEOmU8ft8pKL7IC7Lvbm08ToBRihJxLjtIesqLMBTO5CuWLKBLhLqsZf97FgySgsrX39LwK/9POr08riQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Thu, Aug 08, 2024 at 08:40:21PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction of
> the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 
> v2: Improve error handling and robustness, suspend exec queues created in
>     fault mode if group in dma-fence mode, init queue link (Matt Brost)
> 
> v3: Delete queue from hw engine group when it is destroyed by the user,
>     also clean up at the time of closing the file in case the user did
>     not destroy the queue
> 
> v4: Use correct list when checking if empty, do not add the queue if VM
>     is in xe_vm_in_preempt_fence_mode (Matt Brost)
> 
> v5: Remove unrelated newline, add checks and asserts for group, unwind on
>     suspend failure (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c           |  3 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c  | 66 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h  |  4 ++
>  5 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..447e9acbb570 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -37,6 +37,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
> @@ -165,6 +166,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	 * vm->lock taken during xe_exec_queue_kill().
>  	 */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		if (q->vm && q->hwe->hw_engine_group)
> +			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 956dc15b432a..0a0a15ee5e2b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -14,6 +14,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -73,6 +74,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->ops = gt->exec_queue_ops;
>  	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->multi_gt_link);
> +	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -615,6 +617,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		if (q->vm && q->hwe->hw_engine_group) {
> +			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> +			if (err)
> +				goto put_exec_queue;
> +		}
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> @@ -797,6 +805,9 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>  
> +	if (q->vm && q->hwe->hw_engine_group)
> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..315f874426bd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
> +	struct list_head hw_engine_group_link;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 1d109c08c7a6..b362af7ffab5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -5,9 +5,12 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_group.h"
> +#include "xe_vm.h"
>  
>  static void
>  hw_engine_group_free(struct drm_device *drm, void *arg)
> @@ -100,3 +103,66 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  
>  	return err;
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	xe_assert(xe, group);
> +	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
> +	xe_assert(xe, q->vm);
> +
> +	if (xe_vm_in_preempt_fence_mode(q->vm))
> +		return 0;
> +
> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> +		q->ops->suspend(q);
> +		err = q->ops->suspend_wait(q);
> +		if (err)
> +			goto err_suspend;
> +
> +		queue_work(group->resume_wq, &group->resume_work);
> +	}
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +
> +err_suspend:
> +	up_write(&group->mode_sem);
> +	return err;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + */
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	xe_assert(xe, group);
> +	xe_assert(xe, q->vm);
> +
> +	down_write(&group->mode_sem);
> +
> +	if (!list_empty(&q->hw_engine_group_link))
> +		list_del(&q->hw_engine_group_link);
> +
> +	up_write(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index c2648f87f7ef..857a83787504 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -9,8 +9,12 @@
>  #include "xe_hw_engine_group_types.h"
>  
>  struct drm_device;
> +struct xe_exec_queue;
>  struct xe_gt;
>  
>  int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
