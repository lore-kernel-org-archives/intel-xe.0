Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11337C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 13:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F3710E555;
	Thu,  1 Jun 2023 13:19:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6DD10E550
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685625549; x=1717161549;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L5C48gdFYqN5CfCNezf+w3ze1nkURV+B9rdoWtRm9jM=;
 b=XCszQ9AG0zjSriEuJs8h3eK3iOdOhat/e2/z4PCcqADqVkJArL+n/qgB
 jIjiics6Z1tyi5Ga2SLrjNHSP0GaC+SePUC96ykdaTD/4YFXzBxHi/7EV
 KYeiMok6Hs1ujdUj4B0uU4XAB7v0dootYPKh0zh2zaIbw9FMWTEsi+2Nu
 XDigs3Hi/qJVzxdOeob+fhvnA+rsXyyZlMQdE2FDfU7gwNbDaCTKyjCk8
 tZ7XRUOo6YC3KxEXz6dZOcdKAY93Flg+ro0NBJCxbweA9Vx3VTFg+B3Qy
 DZjJqBuvhN8whr4SsfnO80/kvbf04NQflGEAkBG0ZtnS3PUNqeZ9XQi0x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353051516"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353051516"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831572346"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="831572346"
Received: from chauvina-mobl.ger.corp.intel.com (HELO [10.249.41.195])
 ([10.249.41.195])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 06:19:07 -0700
Message-ID: <ac489553-cd65-a16c-b8fa-c77bf0fc49e5@linux.intel.com>
Date: Thu, 1 Jun 2023 15:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230601123505.646031-1-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230601123505.646031-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: fix double list add
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

I guess that should make the ignore argument pointless?

Cheers,

Maarten

On 2023-06-01 14:35, Matthew Auld wrote:
> It looks like the driver only wants to track one vma for each external
> object per vm. However it looks like bo_has_vm_references_locked() will
> ignore any vma that is marked as vma->destroyed (not actually destroyed
> yet). If we then mark our externally tracked vma as destroyed and then
> create a new vma for the same object and vm, we can have two externally
> tracked vma for the same object and vm. When the destroy actually
> happens it tries to move the external tracking to a different vma, but
> in this case it is already being tracked, leading to double list add
> errors. It should be safe to simply drop the destroyed check in
> bo_has_vm_references(), since the actual destroy will switch the
> external tracking to the next available vma.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/290
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd1335e12d4c..5aa2aeb14beb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -964,7 +964,7 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
>  	struct xe_vma *vma;
>  
>  	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		if (vma != ignore && vma->vm == vm && !vma->destroyed)
> +		if (vma != ignore && vma->vm == vm)
>  			return vma;
>  	}
>  
