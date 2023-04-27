Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A66BC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 13:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1210E272;
	Thu, 27 Apr 2023 13:07:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C525710E272
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682600878; x=1714136878;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xVBIFNGhwg7oJ239ZRyIqcgKMR+sMC2b8L1/CKUyo8A=;
 b=DQoUJppWGJAYYt4HwTbElF9zxUHr7HirR50wALggUnDv6Q9uPJffm/ol
 921Yctb8eTgFcuJoYYjM9kLQuNdbSMSEzzxxLoxsIXaSDvHX0o22/cbAS
 RaMycYQOmeVYNLnWQxzQX/AaINmhPNJHqJX/3Y9I5/l8LKSEwx5bdaLEQ
 Szx2Pp6hFqY/piUzsYKWmefJeK0Ognn2VSIJ9kT5LIXqUEeG9uZWnsS2k
 c5JirFpYkeqkbPjl/MFnxq07EeNiGDu75H7a9ECtn1yIjqDf5rN7r+MZq
 pKNEioCz0UIY1rrcjzPxV35iJ7CHF6VmeMyFbPiHSc7HITOcZNRaigEVc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433714275"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="433714275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 06:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="727057731"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="727057731"
Received: from adrewek-mobl1.ger.corp.intel.com (HELO [10.213.10.29])
 ([10.213.10.29])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 06:07:26 -0700
Message-ID: <2c45eb70-c2d0-5c94-34fa-91ef82053321@intel.com>
Date: Thu, 27 Apr 2023 15:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: destroy clients engine and vm
 xarrays on close
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

Hi Mika,

On 12.04.2023 13:09, Mika Kuoppala wrote:
> xe_file_close cleanups the xarrays but forgets
> to destroy them causing a memleak in xarray internals.
> Found with kmemleak.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Christoph
> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45d6e5ff47fd..30415015db4a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -70,6 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   		xe_engine_put(e);
>   	}
>   	mutex_unlock(&xef->engine.lock);
> +	xa_destroy(&xef->engine.xa);
>   	mutex_destroy(&xef->engine.lock);
>   	device_kill_persistent_engines(xe, xef);
>   
> @@ -77,6 +78,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	xa_for_each(&xef->vm.xa, idx, vm)
>   		xe_vm_close_and_put(vm);
>   	mutex_unlock(&xef->vm.lock);
> +	xa_destroy(&xef->vm.xa);
>   	mutex_destroy(&xef->vm.lock);
>   
>   	kfree(xef);
