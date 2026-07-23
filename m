Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F2C531CA
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 13:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796810E586;
	Thu, 23 Jul 2026 13:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="AgIuombQ";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD4910E586
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784813936;
 bh=Goyh+zRQ5KuilQP0KeZj7hFSzr7dGWK/jUqPOWcQFJw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AgIuombQz2mWYk8w1JwK4dxioR0aDzxtKcJ9c4CWNIB0Ynge16ScYwfFJ4SMdwmUL
 RqpMVTgb/9eJrMyI5qv3weBrtr67+WOHm2I/7Olw6QqtAmm8kQa6STfkwBwKKW8h/B
 /41wF0HnxSR8siwy6Dy7j0DC+dqrkTr+6c8EH1gSCDCcZ4n93K3gvyg/x4GtcRPAHt
 iTgffb6if9FF45ONfQ1TJkCcTLkkEJ2SBljxc5NmF4byKwnCFIjpHj47HmCgSjnpFr
 9x4or1al7RsRVm/hc8AZUijq0i0tNObgNQA1Z45xs0gzMHbcLK0HRZAPofW22T0WGS
 p/ip38mw1SWCA==
Message-ID: <a741cb50-05d9-4dab-baf4-1b427e87bdee@lankhorst.se>
Date: Thu, 23 Jul 2026 15:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bo: optimise TT population for DONTNEED BOs
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260723133418.1201717-2-matthew.auld@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260723133418.1201717-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

On 7/23/26 15:34, Matthew Auld wrote:
> When a VRAM buffer object is marked as DONTNEED, like in Mesa, the
> driver skips migrating its contents to system memory and instead purges
> the backing store during eviction (via xe_ttm_bo_purge).
> 
> However, xe_evict_flags() still returns tt_placement (XE_PL_TT) for VRAM
> BOs even if they were marked DONTNEED.  This causes
> ttm_bo_handle_move_mem() to call always call ttm_bo_populate() to
> allocate destination system pages, only for those pages to be
> immediately freed right after when xe_bo_move() calls xe_ttm_bo_purge().
> 
> Fix this by changing xe_evict_flags() to return sys_placement
> (XE_PL_SYSTEM) for DONTNEED BOs.  This causes TTM to skip the population
> step while still ensuring that TTM calls xe_bo_move(), so
> xe_ttm_bo_purge() still triggers.
> 
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..1daa80079608 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -341,6 +341,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  		return;
>  	}
>  
> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		*placement = sys_placement;
> +		return;
> +	}
> +

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

