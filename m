Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B02CC624DA
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 19:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73810E177;
	Thu,  3 Sep 2026 19:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWjUpDmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28BE10E177
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788462985; x=1819998985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nDW2MpF9maaFt5inJU+LP1vnxN3NYH60S+uZ7CtdE24=;
 b=gWjUpDmGpUaysBp/xjq6efExrQqTG4TXXmhceE4Hn0kTcyTPnZEe4xlO
 OD5xH/TJd/ao/9YCEdQROo31/cWmKv0tqK5dLk1MUpQC1qeWUlqXtz7nH
 /KcRrqOjd95HEGIJV0wM5d86Oeq5+zVIWZGR0gfufxqcC2fszxfdTXSPi
 UmG+EKsy9BHjz0RSOLoKL4XTPNdgpWSWQDoXLsVJyhKc5kjIz7LCfL6bM
 TbtxWZqGg211TP5EshQM7hIdvzpkhDYbHVoQ4iJSOoO5zFAdS+CACu1Pk
 CaeaKYWHPFbIdVEHCs4eeELHDOm1cDwjHziv5wZBwIkCAdaN+s4phRhVW Q==;
X-CSE-ConnectionGUID: D7DhC73/S2S6qW6X+7Hb9g==
X-CSE-MsgGUID: qQp3dDKXTTejYK2yBLT0Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100117585"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100117585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:16:25 -0700
X-CSE-ConnectionGUID: 5SOmBajgQ5uckM9M/IPGVg==
X-CSE-MsgGUID: OP//42E/RA2n960LUMeY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="263623798"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:16:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:16:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 12:16:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wb2NDdUNqCaAondviNx6pzFFQTJQguc1GSJT+daj7Jn1pZRtrGjdlHeV74xVju7nCIFjAsnJYwlONR6wsVDR8QeVZyCIJ04AUcAgzvBwGqHsfbfHjnrMgKEgDDmyF0TuA2vLrd1gpPhHdJOEROsY1GWB2pVgaEjjfNC7B1B8VZLatmOKENKrS14UE0cHmjL1G989Uui/Gk3OatvoBWDOe9PdmHZcIpfnVimDOZ5++pXsRuVgzVBNutSJEzLZPuJWp9PC9OjKcvvtjHoXjW/1P1IPEQF647Ga6yHnKnashTcWQg6A6WxBZK0L9s6F/QD2JrpMjLtjC99KIqgFpGia0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D98FhXK15eNZMeM/7pybleEFkvfGj9uXF2MIQmBJ9YY=;
 b=j2pMSlkcOeJ31RDP32hnEtu+0C0lhZddzagg1w2BYPQp0IY/v36L9ni2jEWJEPwhklhUG1VMFL72fizLuwrQopSplPbNaCTfSLSKzP0LBQNev4UGcIsSzrZttXSaCBoE+mYzSAbEfcSCwNyq/Jmz9PFRbsw22fBD7c/uJqFkwasC0iXNNpEhjjtziGTgvXck4Q2JA+TBDmLj/L2pkLv/EDTywmMBWVBdwvzy5PUxA8/827Cd31J6FRHerLtCS5SZKTADPIzvkq5eAIyP++jWU/+UV/2VPi/RvxpXUVwMU3mOg9Qy/oZnJVT6Mv1/4ocYg7w8pgvP0/56g0U5JANbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:16:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:16:18 +0000
Date: Thu, 3 Sep 2026 12:16:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] drm/xe/vm: Handle purged BOs in VM snapshots
Message-ID: <apnHf2QWL+FOYiD7@gsse-cloud1.jf.intel.com>
References: <20260903090630.3857182-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903090630.3857182-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:303:b8::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a715b43-f109-4c0d-5b86-08df09efd4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: kEsBgYKcx3wcv/H7wyCsMCwNVlPwksFCXPcoInqFRo5psF9csaIaAYl+P/GGMWYrEm2kQh5FgkGCXftFw3Xk5XAJcGtEIG9y8MZ8j12yFMY014jw9HQGrMv/UhcWojDcC3xltLdA9qWgR7OerI6gc+7/sTP2PJGYn3HAUIbZlPO4LiECQUq5tec6L9BPH4fSwV2yahEQAmIYCOg5ob6IVUub5PHeKYwx5LFGj6288wVJD7DhPYPqGjlw1CR0URWh66WrUbSoEnJfk4C+vvAQQWl7PvHhXZDQJKMnMbNkVpjD3ofiY+1NRH4Z7NBV7EDXHxyG7wp5ZpPL3gUygYvjya0X5RmyFULBEqwGLK27vt/ySpnm2ip05hPdXWHtcC8zz2yhdJ0N8qoTdKQ6meZkL5RfczbskGuhBPOMEE7iyVc+JkLAGbcvPLlCPooiv3FfZUD4pUVxV6Cn8vXLf0UXX0tubdbZmVicchZtNHYumITU4ENBOsiDwHpj7Fg5l+UosW+gCSOoZG3k+dTcfIS39YclpEW5XseN9FBxVxlKsF/ZJeAFbONqRIwtOU8aL9elbWq0XEVSyyXSGvV72XoJzTU+7wPcwY8WbATAMLMln1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TSvYRsZBs1yJVu/UDdgVKVqiU2puoslMfdy9g4O1jm1MgSKWWQNSeXtBkS?=
 =?iso-8859-1?Q?zvMe2oDZwmkBUZtyVN2rkVGIdnr2wJzi8j2WYNycovvCgVVLQGNoTiiYI1?=
 =?iso-8859-1?Q?KsJCi/z/WIh8ch3LhDuEfZ7uO4ujqZ+K4rbtWf9eIJlgYrJFC5PyONib3A?=
 =?iso-8859-1?Q?vp6KX/HfmfihidBFwHdU+1/FzhWHAPF8JX79GTwlep/mn6GI8OAEXDvXVD?=
 =?iso-8859-1?Q?AREvMSppJyLf7lQxGGQXhUfLaYYuqPUpwpUP5lbxi4PbY1885DKV+jvXvI?=
 =?iso-8859-1?Q?fFI1764iiYMrY37lFJoVaxqdBnhwyBKzYm3FNuJrT3S3IGGjRQRpnQqpzu?=
 =?iso-8859-1?Q?iLlMM0gnLBrUOFznjYzobCBaZ0j7fcTsWhAp6MgYATcAic8e2syk0S9p61?=
 =?iso-8859-1?Q?iaP7QJUB19yAicrnWIEmsSA9ClvBN+9hSv8tx7mseAfcNiIgorXz5grxX7?=
 =?iso-8859-1?Q?uULv8+If2UsceYkO0M2DshASOSxQCvdpAViH0sTHPHxt/zyeQ2NDzP7XIL?=
 =?iso-8859-1?Q?tnoz97mhwY+V5SNPGDnjwkSuGs6fh9HP7CQwVtPTNe5aFgi+BXWSy3UdPJ?=
 =?iso-8859-1?Q?g7ppPgZec97vFgb5oGDxZW03h5/rzf0IHlBx64MOHRWjhkMaPBbF+rC6Ko?=
 =?iso-8859-1?Q?Zm4F5si0FelZl23WmkwPnJGtBPeef6Y3gt9ZHBeq4MA4hpSit07KqGg+jm?=
 =?iso-8859-1?Q?8ykrtVg0FQHojZLsB0xhIu6+W7GC8OKlRsVClWMmu7yhdeoOmTNbZ9Eu5b?=
 =?iso-8859-1?Q?FzBGVUzooLemB2DdlOPXg9X6U86m9QkmXg/mnQr1QPmkHTc5WQK7SPhMDB?=
 =?iso-8859-1?Q?YVJCDzIG3s30wxvxp+efPTmqw27Li6rAwBqB2mS6bZyW3g26VWlJYzXlOy?=
 =?iso-8859-1?Q?bFz5/h95XDQfSuxogiI7DoYbCqRy+mtaxPJCiSqEJONTsFXk9Y3n0uFzsK?=
 =?iso-8859-1?Q?y6VtCmYiPJmiqG+vLVRFIumnNry2fbwL7J6SlNYKgQ3vJpc6Ghi3ZcadRJ?=
 =?iso-8859-1?Q?mlpPHFQpJy9TvIRdUmcgAXwVM/vHVJlioICwtnpmvkDiLGwqdLY6pknM6K?=
 =?iso-8859-1?Q?aOCYlAFw142DLyVgvs6DQEBE4HxGwP6amPG1FToP8YQ8QOz1Yv6PXX3BZG?=
 =?iso-8859-1?Q?XJMPUSoyaZAcGzwyqxy19oUb+I9Inlfcu212iY6mzaHAkdDjEwpC+FITfa?=
 =?iso-8859-1?Q?Fzl6agKn27tKGnp8MXr0kWMW8dcDqh2/NhAH2I/kDe5Tq8ZYSfJWfBXjsR?=
 =?iso-8859-1?Q?32i/pJLKuGpJYsL9EzWGbC2EffZ0dDmEIdlMM+zwdic5dTNUf5fD6L9zdt?=
 =?iso-8859-1?Q?cBrUYcY8u/Mi9vf8oOFSJ0Y7vg6RTPh0pvFTv+Jp5V0jPandXtCV3pm1LD?=
 =?iso-8859-1?Q?D5ZbueR3RcKryttpa/QgeuPQneS9BvOIeIG9Y238m2sQf920bTbCfzsPBJ?=
 =?iso-8859-1?Q?dKsO+Wjts1ugKxr2AT+lTW6bAAf3j0/XZbKg+H0snXwxIo7GK9U1nhxara?=
 =?iso-8859-1?Q?iwHMXTFWk3wPI2FN6NXb0mMB+d9Dd0iFOpnCpz+ISUSNsS8B4dPVU7vRg6?=
 =?iso-8859-1?Q?kqS3M5rHnrZI2H56NTkiRmQPhIIIJOZwMudmzlb0wGXgUt7JNd7TwUVm5f?=
 =?iso-8859-1?Q?MDFjDUZIG/jFmDdE8qAnOH2yJNrVKco4UN2Nn0YYCpttgGXrZHSv5v3bFG?=
 =?iso-8859-1?Q?K9dEvC5KlZLrEc0Cth4nmeBxTM9C34AXi3eZlnSsDCjwHJ8xKc/aJXds5/?=
 =?iso-8859-1?Q?SHtv9f470UxO6wGyND5CXbTUWtmWFXO2XJ0y2cbiQjcXb/FHfLmpI4LA45?=
 =?iso-8859-1?Q?fvhW6zmrtnPxIp1HkXvIFNcTkCiwDzY=3D?=
X-Exchange-RoutingPolicyChecked: oCLNLOdp5agPeyaqFRyEgvOoDdRAum5tDZosFo8uRA9lMvlpPVZ1tWNH42YcCUH7B6UjFgNO6M6U3WekG8LdZrq2VF+O3RrQ/hkTmxxGDB4u49PLNxUVFVttZLph/j/JCILdn2Uyv2CHEtEPsorFJRi8HJVNfDSpd8654StLAbMwY6RUXrwbprii2nQ6uS8pE6bUgz/Re5Rnwkya8tPcUBwyU+3T4JAEpkWhm6PWeVUOnuwQch4nWye3uRVRMeYXZuDq8gCJCIgCmrOPs+96mZJiiZPlCrlv6lB+0yVnD57XGAa6+CkUFA8zz9IraDDeiPETd6wt4vxiExozGulM4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a715b43-f109-4c0d-5b86-08df09efd4c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:16:18.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKZyHClFIRjOXMj5fanaWPpSgJ0wfwy9ZO8tOiayQCIBRpfuOSTyLvQ4BoaCuF1o0RJXums90jMPOIO3KxcyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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

On Thu, Sep 03, 2026 at 02:36:30PM +0530, Arvind Yadav wrote:
> A purged BO can remain in a VM after its TTM resource has been freed.
> xe_vm_snapshot_capture() can then dereference a NULL resource while
> capturing a devcoredump.
> 
> Record -ENODATA for the affected VMA instead of dereferencing
> the resource.
> 
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadhyay%40intel.com?part=4
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 19b3d0be7928..77a851d9e373 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4666,17 +4666,23 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  			snap->snap[i].cpu_caching = bo->cpu_caching;
>  			snap->snap[i].bo = xe_bo_get(bo);
>  			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
> -			switch (bo->ttm.resource->mem_type) {
> -			case XE_PL_SYSTEM:
> -			case XE_PL_TT:
> -				snap->snap[i].uapi_mem_region = 0;
> -				break;
> -			case XE_PL_VRAM0:
> -				snap->snap[i].uapi_mem_region = 1;
> -				break;
> -			case XE_PL_VRAM1:
> -				snap->snap[i].uapi_mem_region = 2;
> -				break;
> +			snap->snap[i].uapi_mem_region = -1;
> +
> +			if (!bo->ttm.resource) {

I think technically this can change at any moment, so this is a TOCTOU
issue with the switch below.

The value is only stable while holding the dma-resv lock, which we can't
take here because we're in the signaling path.

To at least avoid a NULL pointer dereference, could we do something
like:

res = READ_ONCE(bo->ttm.resource);
 
if (!res)
	error;
else
	switch (res->mem_type)

KASAN could still complain if res is freed after the read, but the
kernel wouldn't explode, which is objectively better than both the
current situation and this patch.

Maybe someone has a better solution that fully closes this race? I'm
actually spotting a few other issues in xe_vm_snapshot_capture_delayed()
where eviction can race as well and those should be cleaned up too.

Perhaps we should open a broader Jira covering all devcoredump paths
that access BOs which may be moving, and clean up all of these issues in
a separate series.

Matt

> +				snap->snap[i].data = ERR_PTR(-ENODATA);
> +			} else {
> +				switch (bo->ttm.resource->mem_type) {
> +				case XE_PL_SYSTEM:
> +				case XE_PL_TT:
> +					snap->snap[i].uapi_mem_region = 0;
> +					break;
> +				case XE_PL_VRAM0:
> +					snap->snap[i].uapi_mem_region = 1;
> +					break;
> +				case XE_PL_VRAM1:
> +					snap->snap[i].uapi_mem_region = 2;
> +					break;
> +				}
>  			}
>  		} else if (xe_vma_is_userptr(vma)) {
>  			struct mm_struct *mm =
> -- 
> 2.43.0
> 
