Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C462FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 02:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4646C10E045;
	Thu, 30 Apr 2026 02:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/EzAhCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9DD10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777515171; x=1809051171;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xAlFFUykQ0p08jVR6+t78Z/3/GGMSl7nALd31srxqYA=;
 b=c/EzAhCHqh4aU9xAWoxsrDh+YGZueTLAmzg6DYXvZQtWXkoLbB3DSR/U
 FBWH0IPjvL064bRSsom3Vmd25Ni7qIuG+2ww9UguLn4sEhryboffNbM7p
 4I0d76RvRJKD/UG+cpQiertkLzZQN+6wM0ENQ/Bb1D8S/ttL4BcGwHzpJ
 fyY+2thZqzzZIG3U6GkR8Zb+ovnenaM4OGCnyihFGfzjHEXUmxVZ/zOZJ
 3gYbyO941Lu2Pe494KOSm95ixs5FjK+Yq2oVXS5arzFIaI0OA2cQ/J6+Q
 Gpu9ECkC9QnRJNWCRMCAcRCqx72RLAcBNfmnAzqJ06wjpugfsusC2lGmg g==;
X-CSE-ConnectionGUID: PVupwZsgTwm58gWkdK6fTw==
X-CSE-MsgGUID: GC4To/UsSzSWBItl6J0zHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65988311"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="65988311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:12:50 -0700
X-CSE-ConnectionGUID: DYUVuXKfQPmwahlyh5B88Q==
X-CSE-MsgGUID: BXIjwf4eSRSFjmKUemo/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234470787"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:12:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:12:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 19:12:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQDeratIvb8fGzfIuXgp6wwtoxNNHxFODnA5aQN/SG50YY0Qr88klBFQrcZAhOjyqf/9b00+6102F2s40DYK6K02GDC/2USL+/F/s6IT39a5mpofsbcmNwRti3gYIBQupG6YBK3KqN8p6DNiZ/g02MYxt7dqS9JZEqCx0ehxWFqsgpTNg7PA1ltjEK1LFs0u5nGoZv07RQliJYw2+4Kg6tQHhKKWfompF/OviCv8zHAYaYX8pxPSOcTqB618A7gZm8si2nl2OxbWHIuYQUG0g30hbYe5GC7fdfewtv0X7ScugfR3EZGa6XR9sQfOMW4PaQHscUrim+bjHyyPBD7D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1juyv6l/6ZnLvPjKe42qpn4POWUuRuwamplSgjZ/i0o=;
 b=Fw9Unc0GtTBKKVxBM8gp+6bNMpKM/znp0xgYFiTLiaEZLFx6B3sng+z6lHJIOxydI6rJoSZD4mXpzN8zQyiBjYMZfbAoE9yrLtcDTRgwKGK1Wh87dUud4ZBZaHmGpeCArswMoGKWoDqDy/Zq1tQo5fZWQfcgkvRdlf+G01nDA8TXWN0yWMB8Xo14hAdD8NCU+/pXOb1kX6OGOMcWQTL8LgFZMGZN9ghVaANVKb2pkmB6e93qP4jyCGKDNr6z8K6ume+srf5wg3QL1GkDlU7Djj9vTg8bIgwroNSGoPK7xebc7C7344gCWbJjNKs8vEK53aYXtlK3T7+zxv4be2J5gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 02:12:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 02:12:44 +0000
Date: Wed, 29 Apr 2026 19:12:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/madvise: Track purgeability with BO-local counters
Message-ID: <afK6msQqV+IsgkF9@gsse-cloud1.jf.intel.com>
References: <20260429085214.1203334-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429085214.1203334-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2a429c-b2e9-43e2-8c38-08dea65df760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 45DZfkewRuPblQjMlc+ZNnsqDEsquCRLSdzW1CLX1ocykCyOrX2B9LETHqu46Tcxsf1G0ipK4lFu93Yook/9ly851bSivSGf3gV9fpMls8x2ue8t+Q6A61d51iXJwYPSNDrKRaDl0qZ/aRhf5Mem0ird2YKGm+Sm6RoEQ5x1qiN2qJdyJoSZ3X+LNXIDP/CWZaI54C+vN2q7vkxqk+bjuYKxTb+vZIhD1h298dUIpEJK0WsYegERU21QMAFaOhVv2g6SEEZEvEzwSym07n12cJkK6giqqxClceVMcrCZWy8Kojt5OmjBGqfCLvl/WmNPgZZZjGauRFvI4uPFGh5oA2U/SssdrnUo8//1GFW52DHfrLNdaecWHzfPHiKaAr+LWR13lI6BAtCurZrQ5USo2qUjhCEvncZnw7Jdmf39973Csau3R9RZp6/PvcHG1n7HbEjp3KdAsst9nWXLL7wVOe0aaX41PvaIsyeDygyIJBCMToUfTXwkaar/TZ9fYaWDawuIpGJsgF2EQH3Xp79/2lMJBOuim3ISoAVULJ5TQlCS3UhbjMEwV44Pi+Lw88CjjENxhdlfc2JayncrvAXq6vn2W037mX5wV9oX5l4xzmiXus21AMVkV7Lra7s3R9vjClgj1bQCYaGHswLa8f8kQuU6Uq5jka1RLWaO9jKFgw3FtDj517nXCx+LKNKoA+gBB0o30s4kALQVDtP25EcRcSu/P0tr2Ynfcf8sVxyRUIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Br0T1pKUfvYwt34mWpy803ti8l8wGuqrCtLveDv5tmOa0Hx2CkGNllGjQO?=
 =?iso-8859-1?Q?iU3P+7vSfq+fKknbG3VqsTuOjrgNZm0JWRG66tsHLg+7lzq4QWlm/JqJF0?=
 =?iso-8859-1?Q?xt7QNvLuB8e0wShKXXm26+vR7CkImqTUOMzKUijSKc3+Bnan8vVYFROD32?=
 =?iso-8859-1?Q?TM6c1e0ByVjJGZY35K8Iswlo0B1UXlI/tnr675acWMmtm3/CjPpisrY6zI?=
 =?iso-8859-1?Q?A5ANUQ7SKaYzD77F4ASoje/6DLk2JtuuSfG4F0yZlSz9jOnaIlPVSg/O1m?=
 =?iso-8859-1?Q?3C9GtkLH/uN/rvhrZqctb6K7vmfWYyAy7KIm/UHj/TpnEVJ1ebbdnFX1KT?=
 =?iso-8859-1?Q?dLhhVhEs/NfK6pSel0iXrGiSrm5s7H6sLSCTkmRKTIeli0krvUGtZx7YgS?=
 =?iso-8859-1?Q?WmSybO/lt7GLIqhdxxVps71SpzoP97kEQAk44QsRMZimrxBlXWHYW3pq5Z?=
 =?iso-8859-1?Q?62HtZiyz9TmvomrLDKHlSlfyL3R6extQD2fcIUmLLVDrO+ohiRBxWiXOyx?=
 =?iso-8859-1?Q?CSu4k07G4uOCuTh8to2pImdDepKgsHlCMwvuvMZ3ln33XssGNR1+YJG4vb?=
 =?iso-8859-1?Q?aSHB6UnW2IRh/rs+tWf3/2hyMAJ3DyCPGsKLVSPnFrM30m8xtKUEmzx3cv?=
 =?iso-8859-1?Q?gBPu5p+plLm9iDZjmxQ9HfBwwT8xOMwFBg726FWRYi9uF9I7OjWWUgn91A?=
 =?iso-8859-1?Q?8+y8OC7VMBdjmZeMbFZNlSw36FLlYEJZ+7lkFswRCCA9YyyKvXID7bj9DV?=
 =?iso-8859-1?Q?fVRFR9mdSlEaxdcevdJrYbeCyorbXMwirm/EiN+gQVPoW5Px+9PecB8Men?=
 =?iso-8859-1?Q?UXCAnJzzXfDA4CK3EkM+9fzbgDE1m1adP58POMflF99lb7DMfAI6Ot+LV6?=
 =?iso-8859-1?Q?ED3nt7oWtXeE2fwsP8SZxoi3v0ayZ2DxTQl90Lxe7nKCpT+NtCe/buM+jW?=
 =?iso-8859-1?Q?6T4lmetC+IddtcpKJHV5+thXOyV6tMyY+yDkTVT21ghwkDyvNqalKm+e4f?=
 =?iso-8859-1?Q?zcKsg5vx1BshgXd4ucqm8TPe05mqcArEFILQ9g1CJxUTDGdf2X8XNJu02F?=
 =?iso-8859-1?Q?JxzHJBwhc7XLe+BFAuqrUSN10Dp6f93/cWIm53a7Rm6h7EatHU/jpWE6Ve?=
 =?iso-8859-1?Q?V+MJFoVT6eYHJrRb0ctuDu4n1NvRETROYlNxURFse2k2if101zoLoKx6dA?=
 =?iso-8859-1?Q?V4H9Q9vWUP7CkKuGvJpVzdATV8GXmh8gRWTgaE1yGKZTIPrc4O5SZOL/cv?=
 =?iso-8859-1?Q?5OMuS9em5DA2BkfqXVRITt7F2ldgf7yUmt0gCcYJUH2JvvUOahggIbsDpV?=
 =?iso-8859-1?Q?WlQKQh9biMqtAciL/fDOiIoVvIgK+w0MmOxuJGagZ/htHg/LRckBlIGfdL?=
 =?iso-8859-1?Q?fsMvKS3SvIAkMuhiqQNabyoJLi1QcM4Vnq6JCyWFSQMDuyqt/FSQQBzSWW?=
 =?iso-8859-1?Q?R5Olk/nttcLXVLwoY87liZy/2iDwqga/uG6AdTCTxy8nWNISmiwBaIDaPd?=
 =?iso-8859-1?Q?5ORM8qfvRldEWm60nQAUuqQL3Ai9WHj01g5i4Vkr/LLKtD432C3gJqvVW6?=
 =?iso-8859-1?Q?ApnCUWnktPmlBBVCIs1DNLt17DDsuX4Y/UWazcBiYQtyn9jVL1haAStM+F?=
 =?iso-8859-1?Q?z+hOWxjoShbbi9EQFuTa0Jc+jQBLuyjj/WmvqxAFB8NQ/BN1I6z94fBNSQ?=
 =?iso-8859-1?Q?ZIUR5juR10m1a/eLSVZafRjkrrB5H1MX6xJJliPM48OTnyQza13M37UMIj?=
 =?iso-8859-1?Q?XxnEod/VdTvtqILesg60YWKzgkrC0ZEqll3DdoRoW6VjWrKrnHKHGUhSBi?=
 =?iso-8859-1?Q?wlKkWlWK8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: B6LPrk51JuTQrUzt0TBCgipfOdBMG3KbHBbGGo4tOnCNlAXRUm0rOmpWLCf/pbXJj0aIc870Z+SrtHr9siiBAz0HYXtSVCDkaezTLxVhXbSo08QoxFZDiVhcYUfga+6B732JzP6bBS7XuJc9FsUGgsl0T9uK9zQ8LCAoCfwsqN2+xOD/lfFC1742IA1HSXAH8PwmW8F34BIQkwyELiCI1xuDsG5naHP9jAc3DSfQYAeb0jgBsUsqYZ6QyoiuBYeNIAipsUZjQfMLGpEyBLvmFCPys7F4h4Y8xGuqtaF/mu8xmqbFlBJ8dpej3Y+5KFWvrDpgomMKt7MHAT/aGOUrmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2a429c-b2e9-43e2-8c38-08dea65df760
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:12:44.8643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dalu9mBDiChCoZdYM25az38t8ASeNrAKyDHWYr1+kSd46kdWj1PqjWcY4hjDyiQxLN6Bf+XBxzNSC1YvFbGOxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
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

On Wed, Apr 29, 2026 at 02:22:14PM +0530, Arvind Yadav wrote:

Nice cleanup. A few non-blocking suggestions below.

> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
> whether the BO can be made purgeable. This makes VMA create/destroy and
> madvise updates O(n) in the number of mappings.
> 
> Replace the walk with BO-local counters protected by the BO dma-resv
> lock:
> 
>   - vma_count tracks the number of VMAs mapping the BO.
>   - willneed_count tracks active WILLNEED holders, including WILLNEED
>     VMAs and active dma-buf exports for non-imported BOs.
> 
> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
> when it still has VMAs, preserving the previous behaviour where a BO
> with no mappings keeps its current madvise state.
> 
> PURGED remains terminal, preserving the existing "once purged, always
> purged" rule.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h         |  77 ++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h   |  17 +++
>  drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>  drivers/gpu/drm/xe/xe_vm.c         |   9 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>  drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>  6 files changed, 136 insertions(+), 159 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 68dea7d25a6b..6fec80cac683 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -273,6 +273,83 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>  
>  void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>  
> +/**
> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	/* Imported BOs are owned externally; do not track purgeability. */
> +	if (!drm_gem_is_imported(&bo->ttm.base)) {

Nit: how about...

if (drm_gem_is_imported(&bo->ttm.base))
	return;

/* rest of function */

Probably same in xe_bo_willneed_put_locked too avoid nesting.

> +		if (bo->willneed_count++ == 0 &&
> +		    xe_bo_madv_is_dontneed(bo))
> +			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
> +	}
> +}
> +
> +/**
> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
> + * DONTNEED only if it still has VMAs. If the last VMA is being removed,

'DONTNEED only if it still has VMAs, implying all active VMAs are
DONTNEED'

?

> + * preserve the current BO state to match the previous VMA-walk semantics.
> + *
> + * PURGED is terminal and the BO state is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	if (!drm_gem_is_imported(&bo->ttm.base)) {
> +		xe_assert(xe_bo_device(bo), bo->willneed_count > 0);
> +		if (--bo->willneed_count == 0 && bo->vma_count > 0 &&
> +		    !xe_bo_is_purged(bo))
> +			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	}
> +}
> +
> +/**
> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
> + * @bo: Buffer object
> + *
> + * Increments vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (!drm_gem_is_imported(&bo->ttm.base))
> +		bo->vma_count++;
> +}
> +
> +/**
> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
> + * @bo: Buffer object
> + *
> + * Decrements vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (!drm_gem_is_imported(&bo->ttm.base)) {
> +		xe_assert(xe_bo_device(bo), bo->vma_count > 0);
> +		bo->vma_count--;
> +	}
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 9c199badd9b2..5d389396f3aa 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -115,6 +115,23 @@ struct xe_bo {
>  	 * by BO's dma-resv lock.
>  	 */
>  	u32 madv_purgeable;
> +
> +	/**
> +	 * @vma_count: Number of VMAs currently mapping this BO.
> +	 *
> +	 * Protected by the BO dma-resv lock.
> +	 */
> +	u32 vma_count;
> +
> +	/**
> +	 * @willneed_count: Number of active WILLNEED holders.
> +	 *
> +	 * Protected by the BO dma-resv lock. Counts WILLNEED VMAs plus active
> +	 * dma-buf exports for non-imported BOs. The BO flips to DONTNEED on a
> +	 * 1->0 transition only when VMAs still exist; if the last VMA is
> +	 * removed, the previous BO state is preserved.
> +	 */
> +	u32 willneed_count;

Should we scope madv_purgeable, vma_count, and willneed_count into a
local struct name space? 

e.g...

struct {
	u32 state;
	u32 vma_count;
	u32 willneed_count;
} purgeable;

Matt

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index b9828da15897..855d32ba314d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return 0;
>  }
>  
> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct drm_gem_object *obj = dmabuf->priv;
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
> +	xe_bo_unlock(bo);
> +
> +	drm_gem_dmabuf_release(dmabuf);
> +}
> +
>  static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.attach = xe_dma_buf_attach,
>  	.detach = xe_dma_buf_detach,
> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.unpin = xe_dma_buf_unpin,
>  	.map_dma_buf = xe_dma_buf_map,
>  	.unmap_dma_buf = xe_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> +	.release = xe_dma_buf_release,
>  	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
>  	.vmap = drm_gem_dmabuf_vmap,
> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> +
> +	xe_bo_willneed_get_locked(bo);
>  	xe_bo_unlock(bo);
>  
>  	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		goto out_put;
>  
>  	buf = drm_gem_prime_export(obj, flags);
> -	if (!IS_ERR(buf))
> -		buf->ops = &xe_dmabuf_ops;
> +	if (IS_ERR(buf)) {
> +		ret = PTR_ERR(buf);
> +		goto out_put;
> +	}
>  
> +	buf->ops = &xe_dmabuf_ops;
>  	return buf;
>  
> +out_put:
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
>  out_unlock:
>  	xe_bo_unlock(bo);
>  	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c3836f6eab35..12457173ba85 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
>  		drm_gpuva_link(&vma->gpuva, vm_bo);
>  		drm_gpuvm_bo_put(vm_bo);
> +
> +		xe_bo_vma_count_inc_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_get_locked(bo);
>  	} else /* userptr or null */ {
>  		if (!is_null && !is_cpu_addr_mirror) {
>  			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> @@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		xe_bo_assert_held(bo);
>  
>  		drm_gpuva_unlink(&vma->gpuva);
> -		xe_bo_recompute_purgeable_state(bo);
> +
> +		xe_bo_vma_count_dec_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_put_locked(bo);
>  	}
>  
>  	xe_vm_assert_held(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c78906dea82b..c4fb29004195 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> -/**
> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
> - * @bo: Buffer object
> - *
> - * Prevent marking imported or exported dma-bufs as purgeable.
> - * For imported BOs, Xe doesn't own the backing store and cannot
> - * safely reclaim pages (exporter or other devices may still be
> - * using them). For exported BOs, external devices may have active
> - * mappings we cannot track.
> - *
> - * Return: true if BO is imported or exported, false otherwise
> - */
> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
> -{
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -
> -	/* Imported: exporter owns backing store */
> -	if (drm_gem_is_imported(obj))
> -		return true;
> -
> -	/* Exported: external devices may be accessing */
> -	if (obj->dma_buf)
> -		return true;
> -
> -	return false;
> -}
> -
> -/**
> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> - *
> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
> - * one WILLNEED, or have no VMAs at all.
> - *
> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
> - */
> -enum xe_bo_vmas_purge_state {
> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
> -	XE_BO_VMAS_STATE_WILLNEED = 0,
> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
> -	XE_BO_VMAS_STATE_DONTNEED = 1,
> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
> -};
> -
> -/*
> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
> - * both enums so the single-line cast is always valid.
> - */
> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
> -
> -/**
> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
> - * @bo: Buffer object
> - *
> - * Check all VMAs across all VMs to determine aggregate purgeable state.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - *
> - * Caller must hold BO dma-resv lock.
> - *
> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
> - */
> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> -{
> -	struct drm_gpuvm_bo *vm_bo;
> -	struct drm_gpuva *gpuva;
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -	bool has_vmas = false;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/* Shared dma-bufs cannot be purgeable */
> -	if (xe_bo_is_dmabuf_shared(bo))
> -		return XE_BO_VMAS_STATE_WILLNEED;
> -
> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
> -
> -			has_vmas = true;
> -
> -			/* Any non-DONTNEED VMA prevents purging */
> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
> -				return XE_BO_VMAS_STATE_WILLNEED;
> -		}
> -	}
> -
> -	/*
> -	 * No VMAs => preserve existing BO purgeable state.
> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
> -	 */
> -	if (!has_vmas)
> -		return XE_BO_VMAS_STATE_NO_VMAS;
> -
> -	return XE_BO_VMAS_STATE_DONTNEED;
> -}
> -
> -/**
> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
> - * @bo: Buffer object
> - *
> - * Walk all VMAs to determine if BO should be purgeable or not.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - * If the BO has no VMAs the existing state is preserved.
> - *
> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
> - * This is satisfied at both call sites:
> - * - xe_vma_destroy(): holds vm->lock write
> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
> - *
> - * Return: nothing
> - */
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> -{
> -	enum xe_bo_vmas_purge_state vma_state;
> -
> -	if (!bo)
> -		return;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/*
> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
> -	 * This matches i915 semantics where purged BOs are permanently invalid.
> -	 */
> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> -		return;
> -
> -	vma_state = xe_bo_all_vmas_dontneed(bo);
> -
> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
> -}
> -
>  /**
>   * madvise_purgeable - Handle purgeable buffer object advice
>   * @xe: XE device
> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  		/* BO must be locked before modifying madv state */
>  		xe_bo_assert_held(bo);
>  
> -		/* Skip shared dma-bufs - no PTEs to zap */
> -		if (xe_bo_is_dmabuf_shared(bo)) {
> -			vmas[i]->skip_invalidation = true;
> -			continue;
> -		}
> -
>  		/*
>  		 * Once purged, always purged. Cannot transition back to WILLNEED.
>  		 * This matches i915 semantics where purged BOs are permanently invalid.
> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  
>  		switch (op->purge_state_val.val) {
>  		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>  			vmas[i]->skip_invalidation = true;
> -
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> +				xe_bo_willneed_get_locked(bo);
> +			}
>  			break;
>  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>  			/*
>  			 * Don't zap PTEs at DONTNEED time -- pages are still
>  			 * alive. The zap happens in xe_bo_move_notify() right
> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->skip_invalidation = true;
>  
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> +				xe_bo_willneed_put_locked(bo);
> +			}
>  			break;
>  		default:
>  			/* Should never hit - values validated in madvise_args_are_sane() */
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index 39acd2689ca0..a3078f634c7e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -13,6 +13,4 @@ struct xe_bo;
>  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> -
>  #endif
> -- 
> 2.43.0
> 
