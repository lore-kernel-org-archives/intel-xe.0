Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C4E8784C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 17:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112E810E71C;
	Tue,  3 Feb 2026 17:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPj5mqvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A559610E71C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770139775; x=1801675775;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JgtqXM1wzxAkhKQqzogAtyeyrP+2Udi7feK6j4EN2ik=;
 b=IPj5mqvtROUDR1QGX/pJ3ABZN/3iYTlNKYMjgW5+/Er6FB8zIxJUMQxK
 FF++Zv8qn0R1iU9rtOmPy+3jEwaWRL5QEfv8XGl7JwjUofVglOjYTzuxB
 n5InTwr7g1wiNsvXVUEQ7ikzcIDvpnqfKP2nynNDynDrFpH3XFqaOAEtU
 8OFwS2KEFmAFIUthtxp76b/DO5oHuFGu9C4EYPcIbQ14x43y/fnkuZFNF
 zdIPPoNMw68AdGwRLOXJjVZhZ0QbUX/MC7jHzQyBgpYKHPHyTfVRlVxgf
 VH3sZrw/kG55UUiOJK5fZNZWATZ6Xayqzft2WFHvt/ZefHcNka50Ah5d7 A==;
X-CSE-ConnectionGUID: /kcVAbFFRIig3DNCHZc/lA==
X-CSE-MsgGUID: fNEDZBx1SOCYbgDwODf9FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96773190"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="96773190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:29:34 -0800
X-CSE-ConnectionGUID: i6H7iVgESNa8p2wt9LLSqQ==
X-CSE-MsgGUID: 9xt55fvPS06W0QuF8EGzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210043607"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.92])
 ([10.245.245.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:29:33 -0800
Message-ID: <e8ff4878-7720-4151-ab6a-8294145c8bff@intel.com>
Date: Tue, 3 Feb 2026 17:29:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
References: <20260203172045.1154546-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260203172045.1154546-1-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03/02/2026 17:20, Jia Yao wrote:
> When user provides a bogus pat_index value through the madvise IOCTL, the
> xe_pat_index_get_coh_mode() function performs an array access without
> validating bounds. This allows a malicious user to trigger an out-of-bounds
> kernel read from the xe->pat.table array.
> 
> The vulnerability exists because the validation in madvise_args_are_sane()
> directly calls xe_pat_index_get_coh_mode(xe, args->pat_index.val) without
> first checking if pat_index is within [0, xe->pat.n_entries).
> 
> Although xe_pat_index_get_coh_mode() has a WARN_ON to catch this in debug
> builds, it still performs the unsafe array access in production kernels.
> 
> Fix this by adding an explicit bounds check before calling the function,
> similar to other IOCTL parameter validations. This prevents malicious
> userspace from reading arbitrary kernel memory.
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Cc: <stable@vger.kernel.org> # v6.18+

You can use "dim fixes <commit-id>" to get the right tags.

> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..c109f9adf6fb 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -291,6 +291,9 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   		break;
>   	case DRM_XE_MEM_RANGE_ATTR_PAT:
>   	{
> +		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
> +			return false;
> +

I think we are meant to use array_index_nospec() also? We have the same 
check for vm_bind, so you can use that as an example.

>   		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
>   
>   		if (XE_IOCTL_DBG(xe, !coh_mode))

