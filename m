Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0637C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 07:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BBC10E6B6;
	Tue, 25 Apr 2023 07:47:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CFC10E6B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682408827; x=1713944827;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Lykfw6YJwc996ulmDlHJtSyOKoZyzJ3/8Sh+ykv34DM=;
 b=ihyi3nsW67nvppGUuXgPL5dUkQ45D7F7j6Yjsp0YasMY1pN512IRZbBx
 Wi02pfgorOYfmInvS8Ow61F6gzAPdkLAAe8QtIOaAZVlGgWIe6Z/UjyHr
 94C6eEFrSq1vk27kQPvY428LjMsgrfMtFFBkh+bFxKZH24PXNnKQeymLu
 26y+/3ySe1vrPlp564MRCezv4T1k+lVbOLkFTJ0np3lVgPznE4Ilu0M+/
 lEreuu7Qe3DfljR9doakjR3u1BypVGRkydINvpmFBrVanYKUXWCc/xLDQ
 eiqhZ1leC91SkVUF2NSPbG6NDcrS6n6lC3t1PcyOQGFeiCi/yvc4F9XSK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335587309"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="335587309"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 00:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="804973667"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="804973667"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.18])
 ([10.249.254.18])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 00:46:57 -0700
Message-ID: <d413ac6e-f1b8-7e47-418e-639864626bfa@linux.intel.com>
Date: Tue, 25 Apr 2023 09:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Christopher Snowhill <kode54@gmail.com>, intel-xe@lists.freedesktop.org
References: <20230425021921.1695760-1-kode54@gmail.com>
 <20230425021921.1695760-2-kode54@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230425021921.1695760-2-kode54@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Enable the compat ioctl
 functionality
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


On 4/25/23 04:19, Christopher Snowhill wrote:
> This is required at the minimum for the DRM UAPI to function from
> 32-bit userspace with a 64-bit kernel.
>
> Signed-off-by: Christopher Snowhill <kode54@gmail.com>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45d6e5ff47fd..00f1d9e386f1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -113,7 +113,7 @@ static const struct file_operations xe_driver_fops = {
>   	.mmap = drm_gem_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
> -//	.compat_ioctl = i915_ioc32_compat_ioctl,
> +	.compat_ioctl = drm_compat_ioctl,
>   	.llseek = noop_llseek,
>   };
>   
