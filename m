Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2658CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8A10E0DA;
	Wed, 15 Oct 2025 22:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKn38T4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1CD10E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760568123; x=1792104123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8NrmvFoLEiX3HyIZDdeu0gFkf4Vt4QvW3CXVxRTNN8U=;
 b=cKn38T4+JQ55AXBmSEx2ThFxXWcQ1AT1urnjeMV8sxaCpN1Op0pY7HYn
 tq36GXmSCTk5m4iVmmC9lZYSHoFHB7ki5Hrh314P+0qUgh2hQ9OBV1OME
 qZLfO1B/shxCSPdpyVET5oQnCP8eadFV/I3rsRJcF34L0s27w/2+UGG/0
 6nJ05UoBq3f03xBasS0h5XaGDR57bZJYuKmhnkTkD7Smuz47BAvGG6UeV
 ADd/oByaYO+G9aqcuaAozVSbHMiQlHuZC3vk5FfVzMrfXpiqxnw7evfsB
 wR2IxAn2SaNi0YgvI5tcDjovFqYID7SlQPPtVn2jTBswDe0CKkq988sGD w==;
X-CSE-ConnectionGUID: DkPGpSQmT4WsiLArCyKh7g==
X-CSE-MsgGUID: fLcHwoqoQfatj3Zq42HzVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62664084"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62664084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:42:03 -0700
X-CSE-ConnectionGUID: vbPOUEnZRAuPeyy3jssH3A==
X-CSE-MsgGUID: eoOk8lvpRYGo0rXB7cjMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182756683"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:42:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:42:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 15:42:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oao2XuyjBfuQ0gzDUXfQYKxKlXjq2ElUjXlyPUlx2KzxnKXYfGO2vvXHi4a7QE1M9Q95N9Y3Xyz7xDmcLlf53BOO61gXfn8SJdH8Ys2IPhNfWZgGnYv6UKleRcVM5GVF1mQloLL2TgD+jOabjeF8uYfbxD0fJanB1+8YtkHOYb0ui808sWamQJHrwIR1Tqs6B1yIMsYv6/6jYL+V0NH+T/q9D0YK9xsSSCEYgKSlDr3s2/444YG6YKITNnceW/N3g089kI0qLF0OBYGY8MkNzlvfC8Vnjahu6YwNR2IPvkXBL/NYn9G3KwIIqHMJZnhyZRID7hjLTuwH/O2fW/+yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhHcEtqFxvpwJ/1S7gmFOMnogY/TpLnXwdqzPtT97CE=;
 b=m+pbB+J/UegDPcPEiy5BlqjbzYPCUoEDzcX0dQZk9t4mjkGjERfV0mnlinQnDw6fhHjRk19bz4gE7zCFHCQbo0gGPiNCx+ZIJvWOvUkzDVZiOpBtps00hLYx+QoE8plk5NDCea+H6QFB2wBWpGe4bhzO5h676B0n0KQ8qfpUEGCGCwVUeV6epluhuR9uy/J1LiioAhAiyyIohg1k9bdpOy0I3SRIFbB36yM+2q6FLUDXOUwC0XlDDxGkDS00neUJvO8ACQ0tzbmVtmcMtpDkVK8+bYqgOXKChWRtBYScM3ayCKo9x79tQ1iM8Sm5ckjhm5chyD+dJv6rOdkNIJ/v9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 22:41:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 22:41:59 +0000
Date: Wed, 15 Oct 2025 15:41:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 12/12] drm/xe: Remove xe_ggtt_node_allocated
Message-ID: <aPAjNVFPWuzZd2R0@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-26-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-26-dev@lankhorst.se>
X-ClientProxiedBy: MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: ac590180-b2dc-48e6-8633-08de0c3c0d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vgIQjgM+1kDEwOU0DtJuqL3X4w+WSjU38qipV1jNF/Brwb/K4sqZPWBEiPIQ?=
 =?us-ascii?Q?B6fm06Fwp6wrj5u3CDI87cy5/3mH/omySAAspDbkNDVRnMfHD4DiqWcK7Cpr?=
 =?us-ascii?Q?PW3HgthlDzdh672gKcVuBD/CP7Y4VIifzETLplCjbTrBq1BFXPa7UoHnjonJ?=
 =?us-ascii?Q?Samioi3lT6LGxxms3UbW+X1TxsrX089i3EAmfRdBLv+GDtftAuT3+axh0KFV?=
 =?us-ascii?Q?PtSs+oK8+rO4MfEcCP6scr0L7oYMbYTc7oaIvio/7UN4sCAWr1LUaV2pXq0U?=
 =?us-ascii?Q?BzLUX5DPkMNGT/mxKDu40Kf2TCDnLS2OXXQyvqXkcPVMEkMQALdT763MslVv?=
 =?us-ascii?Q?grVeLKeqalfAJfxzgLZGyT5BIS5G58oDnqIzsNZLAoqLWp8iOzpQPDGNr2qG?=
 =?us-ascii?Q?LMbU1uUHLE0gTnAAe3kJMzlSUkl/wrr6gNShfET1Odh7HznzUw+8ABAE1xVJ?=
 =?us-ascii?Q?WGKU3cB7Wi9/Cxg8wlVS7B62LSi6D+ZSzVY1U3qkQwqBwzIOXN/1hqyRYFzr?=
 =?us-ascii?Q?GImA/QLUFL0m+UVPjzvqHsDNXSVIQ54tFC0R5OMjdsQA1XHthsORkv+A46u9?=
 =?us-ascii?Q?Dp4gzRuhacf8DJNGPwJJ9lKVE/e6WcSa3iV9BDiSKp+XnUqdc6K+tXMCFbYt?=
 =?us-ascii?Q?xA/azRufwk1Cx7nzqRpaiHF+/YtemwsHSM7Wr92ounafZAYWQYmp7mQciXr4?=
 =?us-ascii?Q?FBxK/5eTJXikYTwN4b5wbTAv8G2QHYdSujAqE/2c71yCF6XK+YQj4zvn//r8?=
 =?us-ascii?Q?C1i4TD57PjUWkdMNG2Dwqq3ve5uXg6M6T/Ds47u5n9GQMF5ok1eETEKWNnrC?=
 =?us-ascii?Q?ijzyucAsaU/80mSmGVLl+rmnBZ+nnEtPcS5dpFLS+KrsEPu2Qj6qn3EzUaJu?=
 =?us-ascii?Q?jq8tzdW9fUHBq7p62KSIIdC2OU9NKBYhNhImwNVqel7An/CLbE4w8NcRx9Pa?=
 =?us-ascii?Q?UVHK8/2ttCF+yrRDqVBIHt2XO7eRzstZ05b/3qpFz6MxiI//mgxWltl7WmO6?=
 =?us-ascii?Q?xSfRPmZ3uyrDBTkddnJYtScrkRknIvwGPG8UaFprvwGFbpVjwaBZiU9ZF2xn?=
 =?us-ascii?Q?z7koVGpAJWFmw8a8uqaljT8vNyTLoDVopUuQ+/LsuK65orPbQiq5gSLO1FZn?=
 =?us-ascii?Q?xA+9rxTA/qZ+O5H63BNiQos3SFkGSH+66PZClcqytGuwEHQus/iGoLVD1gwt?=
 =?us-ascii?Q?TVBpfk223PnaNW3VloOJdWozAeLaHvcMtNqxKbV2ZOZwHYc0I4tkFfRQxKLg?=
 =?us-ascii?Q?eD79vK4u2UyL1OKFcSQQX57falsHxTGoNj8UiErUMnr/ilfT32/nL7Mv0hrM?=
 =?us-ascii?Q?aVdMkzkQXB62WzPTlLCWzTUeIZvanxyNmwJsoGgF2GTiA2ocovfP2HHjhn5Q?=
 =?us-ascii?Q?HxaO+53SXrCTZji9nzd5Gv97HIR9t76k42OIVGrUUIrc+dyhoUIwyLr0Xj3S?=
 =?us-ascii?Q?7un5JRA9lalyC8sAcpkYrIscUTARMQJR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l9GUFpqdB6fzrBlUfYlhH1v9AHBzHbboKVXR/lNaY+BwtWWU4k4QHD8U+dQ6?=
 =?us-ascii?Q?vms0Itqu3V2UdSme/tYGGLH4twGXo7I+LdT3vY73uv9pOnTQ9pxzBqnCtNKe?=
 =?us-ascii?Q?FIkE3oAJoDQYxuocHQwiSLmrzGgCLbJ3/VoBh7TdN8ruPNh4ok2BbWnLwzxT?=
 =?us-ascii?Q?fCRrixDuL4JFnSGAj/gR6hWv8LYyKafhBBjqSW65fo1D7YtSPeRHgHvoLX4R?=
 =?us-ascii?Q?KvWAB/0/pBbPxDs3sWr3ws877CYeJ8xdHV/3ra/A3pOp1guv6NBn1QZygW2D?=
 =?us-ascii?Q?imXH5ls0ty/d2StxpH9dpcUYoZESlrK7O+20QcmE86lPzI9dwR+f1kTh68dd?=
 =?us-ascii?Q?Xqw6dQpSiHRRUNIh5OPC6JbXB+A4n1e5Ol63qhEtLecpYuCwnEmfIKLZVUoK?=
 =?us-ascii?Q?9R93z0ceVa+DgtwBMN9fmXoBsrZZe0Ve0AB6PCWLmv4DT+VOJ3DtItL7YyaS?=
 =?us-ascii?Q?jc0w0XvBuoTsdz/HFTS3S++fZgeD/0P3/QyBI2+JpHGk15B5tl4mGPczDvJx?=
 =?us-ascii?Q?9SMXeF9ofkR3b2weUPQ8P8o0ilyzgOfZ3DsuuenyaAldkzNYHyR7S1aF2Fyd?=
 =?us-ascii?Q?+0xQH6ysDOb6Cvgo50aLGK+Mw6pg5Jm+4DYvjl9loyoShxbZ9oXE81oMsiUg?=
 =?us-ascii?Q?Ac+xi/qA4NoycFOqAVLfye52JeQAuSJdCd6SNZEO0TkRIUzkXNJXyMFb3Re3?=
 =?us-ascii?Q?yPDUrl6nt03L11kAxALkauJsgEU+mSMyqsl96bgdOlCNlQ7erbZQ8qwiehW5?=
 =?us-ascii?Q?Iu+TLJnh2kP9Il69/amp9LVcVQ4/o64uBdmzr5n2Npfp7JtyKfRAZc+ECFuM?=
 =?us-ascii?Q?xD05AePA4jxceXyaDjzuL3Vo7N8QL5ssUTySoPkQd0g4QjfQJQCne23VtI5Q?=
 =?us-ascii?Q?wR9KdkolWeUFJek9U30E4XQUaPr8xz9iUzhpctUAlrN/kD9oNGOy0yqkrqvO?=
 =?us-ascii?Q?uVQ/Cf3IKChIREw8I4vtFv+MY6+r4EAm5//2k5Sc95iFeS2oa/oOR2fjjzdx?=
 =?us-ascii?Q?IWCacJDgL+tXHM9FNTgbG8ESiFmctPwV14dtH5ebb5TcBqpJTGCheJhFlih0?=
 =?us-ascii?Q?OHIyJ8lkmXWaUOyTIptUYXokZEiaDFGai04/mL4YvpOd8EuAUPDdYu7kGklg?=
 =?us-ascii?Q?YMhlYkwMtvgFKyValqLB/zU7HxDykdxAL3cvxYS5bmeU+AZtm1qJSNB3Spin?=
 =?us-ascii?Q?a4flDoIDp/XrBP4DMGGeN856WbWwSMD86DJgJGHHzh1QnedaEMApswqKvqRs?=
 =?us-ascii?Q?uPZPtiiJR+iKDZFWemQCuVe9dbBdHbPZjeBqOZJbe12VtCY08Dr94vNR25G+?=
 =?us-ascii?Q?DDJXyIIdQcncvGgFzzRTxvRI9PB9oq4nTAoaioCzY+Ncl77kBKpTcE1Ma2nB?=
 =?us-ascii?Q?7MYtrm4kwVw5HhKMNd3SSV+HXoW/MWiPFwZVra9KPIuYO+Qj2pnKy+xOBGRQ?=
 =?us-ascii?Q?ZgbRtmrAP/wCopwlcnEdP8ah4C/t1V+8FM4crRDzXXTk5709WECcaHxBD3Nt?=
 =?us-ascii?Q?McbAbOwC7Od7p3BFxiNPgxyrhLme+UcEfvP5ZsnLB5hWFnRGTJa2Ee9QnTOK?=
 =?us-ascii?Q?QamQJhjNR9gezw8hbZPTuMMf7PF77XtZSE0f0jhvRY6jOXx1tk7wWJynlEJ7?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac590180-b2dc-48e6-8633-08de0c3c0d4e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:41:59.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIfsewgtzo8cOgWeFoAlBL2yN4Dpow/45pULPQqvkQB2kQ1ObNdJXRqZJ4WVMstAjjs1eOBjvfjuFWERlUXcug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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

On Wed, Oct 15, 2025 at 09:47:21AM +0200, Maarten Lankhorst wrote:
> With the intermediate state gone, no longer useful. Just check against
> NULL.
> 

Ah, ok. I suggested earlier in the series to use xe_ggtt_node_allocated
but I see now this function is removed. Before I can give an RB I'd like
to apply the entire series to a branch to make sure I understand this
change. The mbox as is doesn't apply to drm-tip. Any chance you can
rebase this series?

Matt

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     |  3 +--
>  drivers/gpu/drm/xe/xe_ggtt.c               | 14 --------------
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
>  4 files changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 784d2db5fd0db..6592b000950ff 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -350,8 +350,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
> -		 vma->bo->ggtt_node[tile_id] != vma->node)
> +	else if (vma->bo->ggtt_node[tile_id] != vma->node)
>  		xe_ggtt_node_remove(vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e4e8be114786a..e9ab8d9415412 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -656,20 +656,6 @@ struct xe_ggtt_node *xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 ali
>  	return node;
>  }
>  
> -/**
> - * xe_ggtt_node_allocated - Check if node is allocated in GGTT
> - * @node: the &xe_ggtt_node to be inspected
> - *
> - * Return: True if allocated, False otherwise.
> - */
> -bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
> -{
> -	if (!node || !node->ggtt)
> -		return false;
> -
> -	return drm_mm_node_allocated(&node->base);
> -}
> -
>  /**
>   * xe_ggtt_map_bo - Map the BO into GGTT
>   * @ggtt: the &xe_ggtt where node will be mapped
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index d0ad541a40baf..e32a14ac63665 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -30,7 +30,6 @@ xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
>  			      u64 size, u32 align,
>  			      xe_ggtt_transform_cb transform, void *arg);
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
> -bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d71041a611d35..db47b49e5842c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -261,7 +261,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  {
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
> -	if (!xe_ggtt_node_allocated(node))
> +	if (!node)
>  		return 0;
>  
>  	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
> @@ -455,7 +455,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	size = round_up(size, alignment);
>  
> -	if (xe_ggtt_node_allocated(config->ggtt_region)) {
> +	if (config->ggtt_region) {
>  		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
>  		if (unlikely(err))
>  			return err;
> @@ -466,7 +466,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  		if (unlikely(err))
>  			return err;
>  	}
> -	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
> +	xe_gt_assert(gt, !config->ggtt_region);
>  
>  	if (!size)
>  		return 0;
> @@ -497,7 +497,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
> +	return node ? config->ggtt_size : 0;
>  }
>  
>  /**
> @@ -2049,7 +2049,7 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
>  
>  static void pf_sanitize_ggtt(struct xe_ggtt_node *ggtt_region, unsigned int vfid)
>  {
> -	if (xe_ggtt_node_allocated(ggtt_region))
> +	if (ggtt_region)
>  		xe_ggtt_assign(ggtt_region, vfid);
>  }
>  
> @@ -2496,7 +2496,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (n = 1; n <= total_vfs; n++) {
>  		config = &gt->sriov.pf.vfs[n].config;
> -		if (!xe_ggtt_node_allocated(config->ggtt_region))
> +		if (!config->ggtt_region)
>  			continue;
>  
>  		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
> -- 
> 2.51.0
> 
