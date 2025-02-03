Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B7DC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 09:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E0810E2BE;
	Mon,  3 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nruKytkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08910E2BE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738574444; x=1770110444;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BtsqaDGVmFooPuRUcb6WPz0D2EW6S3VEZo9BiJHF8Ao=;
 b=nruKytkZ9sJwbzlFp4I2sz9Acao1FVuw/adbpsNprIr3QFPUV8Z+kW1F
 6dGaoZQgggkI+G95PayDGdiP1Cek2vnROBslOtsUrEI+2F0KXRNy4CQF9
 IN0yDeRQ2WMwMXM0orKNt3XpYC9G/XpM7cGeS3EBw84Ql1sAggs0iWpVZ
 C+JD1t98E3vjMS4Y5L5ua8QpGzhCGwTjEhv8PuA6rElQdQLdKP1XXx2Ds
 hFjW95hnpfORmGAmNswYP4kJgNX5yhQffxGYkCjyDtW4DIA6fhemy0ehO
 J5Jzgq8uz9Pzi0kOTZCV5sI20JiDMIBK1ySODLczHZQ+EkHSpGXt2e5WR Q==;
X-CSE-ConnectionGUID: OO6M6HBPRBOh0DUfT88ETQ==
X-CSE-MsgGUID: jwi8PUCdTkG55LmrNtVsZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38294209"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="38294209"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:20:43 -0800
X-CSE-ConnectionGUID: EYRnXCfHRsWcILICt8/F9Q==
X-CSE-MsgGUID: CAbxHhWhSUeZnJLRwlMpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115244387"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:20:42 -0800
Message-ID: <19409b7a-e2a8-4d6a-8b57-9bf83209be13@linux.intel.com>
Date: Mon, 3 Feb 2025 10:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/relay: Don't use GFP_KERNEL for new transactions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20250131153713.808-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250131153713.808-1-michal.wajdeczko@intel.com>
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



On 1/31/2025 4:37 PM, Michal Wajdeczko wrote:
> VFs use a relay transaction during the resume/reset flow and use
> of the GFP_KERNEL flag may conflict with the reclaim:
> 
>       -> #0 (fs_reclaim){+.+.}-{0:0}:
>   [ ]        __lock_acquire+0x1874/0x2bc0
>   [ ]        lock_acquire+0xd2/0x310
>   [ ]        fs_reclaim_acquire+0xc5/0x100
>   [ ]        mempool_alloc_noprof+0x5c/0x1b0
>   [ ]        __relay_get_transaction+0xdc/0xa10 [xe]
>   [ ]        relay_send_to+0x251/0xe50 [xe]
>   [ ]        xe_guc_relay_send_to_pf+0x79/0x3a0 [xe]
>   [ ]        xe_gt_sriov_vf_connect+0x90/0x4d0 [xe]
>   [ ]        xe_uc_init_hw+0x157/0x3b0 [xe]
>   [ ]        do_gt_restart+0x1ae/0x650 [xe]
>   [ ]        xe_gt_resume+0xb6/0x120 [xe]
>   [ ]        xe_pm_runtime_resume+0x15b/0x370 [xe]
>   [ ]        xe_pci_runtime_resume+0x73/0x90 [xe]
>   [ ]        pci_pm_runtime_resume+0xa0/0x100
>   [ ]        __rpm_callback+0x4d/0x170
>   [ ]        rpm_callback+0x64/0x70
>   [ ]        rpm_resume+0x594/0x790
>   [ ]        __pm_runtime_resume+0x4e/0x90
>   [ ]        xe_pm_runtime_get_ioctl+0x9c/0x160 [xe]
> 
> Since we have a preallocated pool of relay transactions, which
> should cover all our normal relay use cases, we may use the
> GFP_NOWAIT flag when allocating new outgoing transactions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index 8f62de026724..e5dc94f3e618 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -225,7 +225,7 @@ __relay_get_transaction(struct xe_guc_relay *relay, bool incoming, u32 remote, u
>   	 * with CTB lock held which is marked as used in the reclaim path.
>   	 * Btw, that's one of the reason why we use mempool here!
>   	 */
> -	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_KERNEL);
> +	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_NOWAIT);
>   	if (!txn)
>   		return ERR_PTR(-ENOMEM);
>   

LGTM. I tested this patch and no longer see the lockdep warning.

Tested-by: Marcin Bernatowicz marcin.bernatowicz@linux.intel.com
Reviewed-by: Marcin Bernatowicz marcin.bernatowicz@linux.intel.com
