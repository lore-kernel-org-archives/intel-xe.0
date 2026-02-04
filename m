Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93326E9D404
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713F10E02F;
	Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KySlF0Sx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4197E10E02F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770219849; x=1801755849;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B1nzcDnL0dfxhLJww/gr1N9WMxpuYTOLMjmiuEU+cHM=;
 b=KySlF0SxIBJupTZ7f6VAnb1fs8xzHu0DSfGOj1dFxiw+AHrkxTO/V0F5
 hl3h1mypU4NRggGJ0z8kCARpf7CAr9dDeDpdZRVXIUF0mN+omDLwt8eAy
 2nJjz0LoXdMvrmAX2JXgibsPxmymAiTDNYO991h/gFga6/TcTcmU508HQ
 HLtcM+9OsTJ3uqrP2OVHfTGTC4cN74Xufmq5l4wVWDmP21axVPhcwAwc9
 VMQPTJpNwyiKMvJcVxC3fwOphVHMN4mCDXFxpVbpvoeaSafeuj0BAVuXX
 cnjejIRJ30lsnC4QmJ6nvSxAfAUL/XIIDLBEdu7ND/b457ph7yptG0Y+Q A==;
X-CSE-ConnectionGUID: L8bkkfNwQ7GnU94mue5dMQ==
X-CSE-MsgGUID: gOAk8aM2TXCYlVLJjqqtGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75261523"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75261523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:44:08 -0800
X-CSE-ConnectionGUID: 8g88brcNT7G2EnygCAjp9A==
X-CSE-MsgGUID: 7wLQrE5ISGSUO4bR/+EBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214727538"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.232])
 ([10.245.245.232])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:44:06 -0800
Message-ID: <fb29d021-a0ed-4b33-b6e9-07918e966b8f@intel.com>
Date: Wed, 4 Feb 2026 15:44:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260203172045.1154546-1-jia.yao@intel.com>
 <20260203210659.1194480-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260203210659.1194480-1-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/02/2026 21:06, Jia Yao wrote:
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
> v2(Matthew Auld)
> - Using array_index_nospec() to mitigate spectre attacks when the value
> is used
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

I think you dropped the stable Cc.

> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..3564e1442694 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -291,7 +291,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   		break;
>   	case DRM_XE_MEM_RANGE_ATTR_PAT:
>   	{
> -		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
> +		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
> +			return false;
> +
> +		u16 pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
> +
> +		u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);

nit: I think the normal coding style is to put the declarations at the 
start of the block. The rest of this file seems to follow that.

Otherwise:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   		if (XE_IOCTL_DBG(xe, !coh_mode))
>   			return false;

