Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE46C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 15:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70D10E9F6;
	Thu, 18 Jul 2024 15:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG9pfHM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056010E9F6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721318336; x=1752854336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ppBdo61LMpQItLoXmZiQjgnTQSx47Bx8dNmTOkI5ip4=;
 b=SG9pfHM+36W028ETRr94upSM4viqFRkdZgd22UeGKfxfZ9ZoUoLNW6Kj
 3Ub6f5dr7x85MXLjnmkKcAfbiegLykAO0J6cQs/7sRofz3OzWE/W/ivyN
 IDvc7A03cf5N3gpaWe5ISOH/DomwS+nwGfGxKM8SCvWsqC8nzg+bX0dUH
 o3OVT4Yb8pG+lbCNFS5trYI7Wto0U+k1t4dDlb1bgWnj2CgiMdt6q3/lE
 lqG5JlicFfJx3M69brAho2K+qfhEVJO+ZmY9t8Q6vfq0qwf+BRGfjaU35
 wj/5E5ItG9fpeO65+CxyxVvGsT/ez4IuThPTEpZA1CjCpX2uj8JOvFdCa A==;
X-CSE-ConnectionGUID: hxQkyx6QRNCrYzJ8lF24fQ==
X-CSE-MsgGUID: iKqUqZaATDuyKBvlZByVnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19022024"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19022024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:58:56 -0700
X-CSE-ConnectionGUID: NctoCJXhSjebeip3aOJo/Q==
X-CSE-MsgGUID: qTt22MdmQYKfb5S5ghvL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81842240"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 08:58:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 08:58:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 08:58:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4fdGMISUvMcv1EBlGRVXng2cghUWUSw7x9o6s/t+A6a9UHreLW15TlpXORTauiQjFPJXP7yQZieyn+WqZEgTZC/QYvPsUDSLa/Xy34Lp6hIKhjoSHo+Xp1KzwQaPF6Oiu/ffRL8gGHfbX2bVnf9/2XNpqOsw8plUHconb628IN5Iehv/XQTm8/AeH56qj8mKijkz0jtFBxk0wcoovH63+rA+oJVvuWFNBx8afOhb7qBZMU8/Hn/ugzBRHlfsXyR+qkXDD9YGsw1m8YtTa540q2O2BzwrzNakY2PKSyhSPnSON1KbRFZ2Fjmki2TPVOMF/S4bCeqW7F26WJxKxWyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRj2aFiDxJo1S/hsgsgkANyMkKoZ3NStTYU1N44H5qE=;
 b=phrVw5aYXJgppLY8VbAkY3pRWdnqlgKvGpF0Xat8IsVI9/Rl7Ayq3dBKL17D4HM6LolitAHC/DXZ41Johh1z9rskI32PYkA6SivWhCJa+tqaAVBhjG7VWS7LHLk4J790pb7poPS+WxZMMeROrtE0gANewNNxsEp+abtOlxTjHtb05SFVzXU855OqBeEypnuXSMPPEKD7tqoRAQXv3QX2mJv3drcGDwZ5HP6KN08tjNsXg8WoXiNpoeNiZnsMoWwYagHbD/FMPmXQGvH0BvdZ8xAHD3dXQPTiMf5GN1uBuVx6oHVwBGGgXi5SmTAq1KUjKrpoFLxF2049azbr9e3YPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Thu, 18 Jul 2024 15:58:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 15:58:52 +0000
Date: Thu, 18 Jul 2024 15:58:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Unlink client during vm close
Message-ID: <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e01074a-1b02-4bb5-1bf2-08dca74284d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hS5OC2oYK+FG08bmR6SSHwZmsTzczCNOReLpIF18UPoP8z/IV6P2eQ0nVI5D?=
 =?us-ascii?Q?hgx+qlG8to7+GvZpzMmgeiJqwFbAqjG6yQEDaGWXr7D5oqfe7vOMfZ83Ci4A?=
 =?us-ascii?Q?qzinEtbv1ruIsUofTnvAyDKQgK781ujz37a7Yq9nZuyiD6mX1NdC6PBRYONd?=
 =?us-ascii?Q?OVWzWiksiUKfu6d6oCK0jL8uIJhqo2cznsO1LsxItyqIcTLpAwovfgUjDblc?=
 =?us-ascii?Q?IdxK8YKwnI15b6A0nrqs9uSJI0Cp2JRC6g0anepFSCpZXpegrNrQeUy2Xk9n?=
 =?us-ascii?Q?Z6YtqpI4cBCyD0kLktzntgzbjASO0YNQar6+Wu4hAxlA2roNoZFSA97fLDTn?=
 =?us-ascii?Q?I4HgCgQEMw9SZFzEq0wiblGAs0JZVXTt7ss2k0IFD+pRFLI2D9x+iFc6ShRe?=
 =?us-ascii?Q?mmbi0wp9/I+OkuN2LfyW8Kg4Ysf4agOeytrqrlRqLo7mdmt4pyTHMRn7ZR10?=
 =?us-ascii?Q?Hy8jD5L3cU9W2F41FlLQaD2OeZxg5STCz34W3KBXWh1CqCpcGRfh7URK/3Cn?=
 =?us-ascii?Q?OmgU1ULM3e32ygmAWK7dpXRg2Tx7Yvx1HnPTnwtEgpi6IPKEr4U0zXrKl6jX?=
 =?us-ascii?Q?XXf4JQCj/wBHcPJw8/9+Z8X3PJGw52i6PeRd8G7DJ0LaqbpVL/yiaTNJMt4M?=
 =?us-ascii?Q?EeT7+v9y/X9wl85AGl+QZchyhvLU7FQ1ZnTDLZHYCynlyNa9RtzvFpEx4vKB?=
 =?us-ascii?Q?3Zmz46Q9QWoN8S5CFMbTHvvFDzw8P+tj7TPPX0sB3+G5weNrYFsrXaS5UnMY?=
 =?us-ascii?Q?LpoX27fLKZ0PkTshovuoaqHdJJ/l+ErRC+5jzj+EcLJ7Gy4nCGTzhmdOB85z?=
 =?us-ascii?Q?y96cD1ozD0AWE7lWXUJiF3dnYz+BTcWDmyKe16do1pbrqzwZ+wQ7be5XtyEe?=
 =?us-ascii?Q?DS+oihZKwS3Dnc2Tw+/GWvfEhRbx9Rf3Q2ljlrSZIyNgXh7zXbC+ppH3jsmq?=
 =?us-ascii?Q?ZVexiwVp5xxt9uExpccQeF/nbz1v5XBtCkHmXFrvkk/BvUor29p/SefCjpUQ?=
 =?us-ascii?Q?GHSLrhQ+ubLRdLG2ZJFJ4iquTPfqgi+aTel0aCYi9BdJjV5cECbpNc97IuNP?=
 =?us-ascii?Q?XSizS8XHJVbZv7R66d1kEhnJMOPQ4P8TuTcbW48Su1kLCYNc2YKND5MV6iAS?=
 =?us-ascii?Q?AZf4ewUsb69GR04WYfp/Q1iprtPTDFY+93vICFpMSTSC9fJXgaKW8qIPSDjm?=
 =?us-ascii?Q?HH2EUjUtL8+El8pu9gDr2991J5vPREIkCSMnfr3pukR32cao3FFlmf0MyRqM?=
 =?us-ascii?Q?2nxO8cQNbIPI0CDJ3P1+2HwJ7chAMntU+AAwZgp4A57EZXjJ37qNy8QaRDCP?=
 =?us-ascii?Q?OpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ogwsBF2hI0kG7rjOt5jL2Y33FsKJWzS3DbHguHlDgPJcl/fEEipsEAwynfG5?=
 =?us-ascii?Q?qNy0SPcmI/+Lcu2GHWNhcWUpw4h5llBuTFFTkIcEc3C78IWW4v/kzqxRVdgP?=
 =?us-ascii?Q?hmRhkZ3POTzCdwC11HkszKKdgEZ37N+xmQ1XX4JIuxTRT8QIBd6DXhFN3fZT?=
 =?us-ascii?Q?oe+UaawAgvghu9s2ROaOwUqQQsK6QD5WaOGXnngn0xslKuSqQFgxm28HL5u1?=
 =?us-ascii?Q?ThhgrHQFzDKcyqZyjZ1cPWo9dUl/nLYLE0XgZTkZh7oQ2/enRirz3lz/8cZm?=
 =?us-ascii?Q?QbsIyjpDP3TnlXCCeHLM3WCo5ZtRK99YksmABNOttSt356E0jIqbnznt6LJi?=
 =?us-ascii?Q?K/UOimlvse3BkqJ1aiTg1H7zPoR5XjNzM0WxKYLX1WhiHiY6foYCYHyDRu7G?=
 =?us-ascii?Q?CSbZxU/uzQxaeYt18cJbSh8jeoEVuPeJjS/uuUptr8GTtiPiSDNWuibLZx+C?=
 =?us-ascii?Q?VTMJsoVZzNM0Wxksw1XjpuIcyLVCk540tTMLy8NNGs7ylkcJuckn67Gh5Gt4?=
 =?us-ascii?Q?zjVvb08adMBH4LBuNOxJ4idPjYbnpjGq1NrwJpjUbSkKpgRj5ekAJEmVuUkP?=
 =?us-ascii?Q?LUo3C0g8wm8p2pSHXQIgKscMOgXjE+cFobFmXEnokmddJjwchQdnalntTYQE?=
 =?us-ascii?Q?3VFdzdYl07HDejZUxQc6aoiEEC0KCEHKLYIRYthPKbD4fnz3rxuY83aR380I?=
 =?us-ascii?Q?FdCeK4eAOxi7sKRhaOEeg9c9uL+naUbvppx4G1xskhlxrHvX6THUFtP8odwZ?=
 =?us-ascii?Q?aWtt/H4NAJm819L5igxgcbJVkHzYui2e0f0X47VwGomMSrZ/V8PGyDADwyaz?=
 =?us-ascii?Q?YL3QYnqTZYqs/5z1UOcG512GwTm9IY4/j61ofqAnSFwd0wZT2G2VY2guxbbF?=
 =?us-ascii?Q?rhdpbt2EbcsytVSMQYWJRxojgwIfN4rOQYKxSeVG/gHDX0Zw/vkDDUCa9egH?=
 =?us-ascii?Q?hw/iIgbEOh28SmnCGEPxoQfOD0Edm+gRPC2fCj/OfneNKmFRCQj5Ny6UUrMK?=
 =?us-ascii?Q?6SHjBewRSlWFYR5X/nMom8yyTYZUgEmK+hE8qievThz2CIEymc3Kd2ha/v7b?=
 =?us-ascii?Q?6qOGKfHSehNNAw1k7fC6pVLkR6yz5mONv+/f7wuWtkCpuUbPerYpQ8cPrb7Z?=
 =?us-ascii?Q?ym2OgFPSd8LDKdU6SefnFL4IqrDLS+fHiQuf5p3NiO0zRGVO32kqMUNOeT2G?=
 =?us-ascii?Q?OcvLfbPaG86xEpMCq+JIX8MxOqeldTQK+sUQAvzT2KY7W3pxNF/yyKxcHoqm?=
 =?us-ascii?Q?cai3KPmnSE2U5ybfR5IqyyF7IBDysvEwlT1gOv4vszOfPxojnce1rNNC7XtG?=
 =?us-ascii?Q?HuZYYPqRGfTQFSw+3Fx0PtZWWJuH6sXaM4D9rqMsePdydGzgliK9DKquQB2y?=
 =?us-ascii?Q?xYzroYUcIa0EL026RUd76R+J4The5ipJ0wcsBD8P86Qr+HhEPjVYNhQ3y+qW?=
 =?us-ascii?Q?DPi9ZWyMwc2s1BDbVkRQXgBDYdivyo1cTmpCvYGsonCSEMvRw3Of8zGMqz6L?=
 =?us-ascii?Q?17sjJ4rcUxm8oPyXiLvENLg50aRZF/EqaO4Bi6xbp8KSSUi7AMOTxlxjcVAu?=
 =?us-ascii?Q?BL59cw48IKFLjccLnNCfSWE6Hc2VWK1PW1V7FnuY8KqhSc2FCKoMfwc14oY/?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e01074a-1b02-4bb5-1bf2-08dca74284d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:58:52.0178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcKTFoHhlnBTeyS0nisLsnbp/9/WvT5gidlgbaXlkQiiQrEMF2znL8lfsAIM3cbzC3bKjF1q76vj37ygYKgBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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

On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
> We have async call which does not know if client
> unlinked from vm by the time it is accessed. Set
> client unlink early during xe_vm_close() so that
> async API do not touch closed client info.
> 
> Also, debugs related to job timeout is not useful
> when its "no process" or client already unlinked.
> 

It kernel exec queue timeout jobs, now the 'Timedout job' message will
not be displayed which is not ideal. 

> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273

Where is exactly is this access coming from?
BUG: kernel NULL pointer dereference, address: 0000000000000058

Also btw, the correct tag for gitlab link is 'Closes', "Fixes' is the
offending kernel patch so the fixe can be pulled into stable kernels.

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>  drivers/gpu/drm/xe/xe_vm.c         | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 860405527115..1de141cb84c6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			process_name = task->comm;
>  			pid = task->pid;
>  		}
> +		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> +			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +			     q->guc->id, q->flags, process_name, pid);
>  	}
> -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		     q->guc->id, q->flags, process_name, pid);
> +
>  	if (task)
>  		put_task_struct(task);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cf3aea5d8cdc..660b20e0e207 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)
>  {
>  	down_write(&vm->lock);
>  	vm->size = 0;
> +	vm->xef = NULL;

This doesn't appear to be thread safe.

Matt

>  	up_write(&vm->lock);
>  }
>  
> -- 
> 2.25.1
> 
