Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A25CC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA3610E1C8;
	Fri, 26 May 2023 12:26:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552410E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685103982; x=1716639982;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xHDWchtnGdyhywenq890AzeBrx2sURKo8HYSJ40rov8=;
 b=OJ31nSC3oTnbvTaja48ykvIFzSUwvA8YI5tslFEvjovjhwOqEb0SMKjp
 q7+rme1PPRRTBU/muRPmCXqaAxFc2VWvwvbhfl38jrGYoaqGMo0knhbxb
 gc7rKTnHIdLo0SY2mIPDzsNM2fi6+a9gZEsiZPJ18sE+3XkvrjdcMPh1p
 TdSyrFXnZTRPdAJslbgmSVDdH3gl8RjYY4DLei291ZTaTZ5yvjorWz77v
 l9ApdBW6Fn1MrebskxwKZWdRsSsd69FHfk8FE07OA5dKM4PSoI4MHTF5L
 XdGB2EUf8OP3Y1fZF8vZ4zeIq6dfRGYRqRyswpGx+eUZbtAoK7tMSYrXY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="353032618"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353032618"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="849540679"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849540679"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:26:21 -0700
Message-ID: <08c45159-d3fb-ca44-89be-bcbd29ff74f7@linux.intel.com>
Date: Fri, 26 May 2023 14:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-2-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230526121101.1619278-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Kill small race with userptr
 invalidation
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

Hi, Maarten,

On 5/26/23 14:10, Maarten Lankhorst wrote:
> Theoretically, we can hit a small race where we hit an invalidation
> after taking the lock in read-mode. In this case, take it in write
> mode instead.
>
> I don't think this is really an issue, but more of a robustness thing.

Invalidation can happen at any time up until we lock the 
userptr.notifier_lock for the final check before submission, so any 
racing invalidation would eventually get caught there.

Ofc we can do advisory checks like this along the way but most work we 
do in execbuf isn't wasted anyway, so we'll end up with extra code and 
we really should think through where we want those advisory checks and 
why in that case + update the commit message accordingly.

/Thomas



>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index e44076ee2e11..187108c4be6d 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -256,6 +256,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		/* We don't allow execs while the VM is in error state */
>   		err = down_read_interruptible(&vm->lock);
>   		write_locked = false;
> +
> +		/* Userptr invalidation while we were still acquiring lock? */
> +		if (!err && !xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
> +			up_read(&vm->lock);
> +			err = down_write_killable(&vm->lock);
> +			write_locked = true;
> +		}
>   	}
>   	if (err)
>   		goto err_syncs;
