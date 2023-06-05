Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A91C7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 12:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCB910E29A;
	Mon,  5 Jun 2023 12:42:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CEA10E29D
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685968971; x=1717504971;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Hy0UFzERnHbssA42P0taixe13O+88q9E55HYvOhfgDQ=;
 b=PsaojABqyYCt85RqTk0lrmsPQV+lCFx3xhiHcywmthIGK3/WuNAg4NtX
 Zc5Q1esGrleVnE4aQovY7bwTbBywABH4BxCteTsY63CCsiLojXGO6u5pZ
 mXmDHNWFZVPHlbkBuYifeK4pjVPCMS1PKobMdHbMwL0gCh8sFrTnPASDs
 nPXsGpmph/pWkBPJdDtIeqrytnBhYUPa3WlfTbSNw5rID1drlBvuwN9JJ
 fnJnOCclhO9sdpC7ME9gpaRQ/qEOhcDExiW9LCQloKbN+5YAU807moun4
 5aczf6scNkrx/H5NgHFAtjpp9ANcTHQp7njKMXmYqsfdCK7iuWNgx++JH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="419902389"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="419902389"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 05:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="711793857"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="711793857"
Received: from imurugax-mobl2.gar.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 05:42:48 -0700
Message-ID: <85b3ec38-d921-6432-41a1-5a823e115990@linux.intel.com>
Date: Mon, 5 Jun 2023 14:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230602172732.1001057-1-mika.kuoppala@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230602172732.1001057-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix unreffed ptr leak on engine
 lookup
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


On 6/2/23 19:27, Mika Kuoppala wrote:
> The engine xarray holds a ref to engine, guarded by the lock.
> While we do lookup for engine, we need to take the ref inside
> the lock to prevent unreffed pointer escaping and
> causing potential use-after-free after.
>
> v2: remove branch prediction hint (Thomas)
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_engine.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index b3036c4a8ec3..0e147bcefa68 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
>   
>   	mutex_lock(&xef->engine.lock);
>   	e = xa_load(&xef->engine.xa, id);
> -	mutex_unlock(&xef->engine.lock);
> -
>   	if (e)
>   		xe_engine_get(e);
> +	mutex_unlock(&xef->engine.lock);
>   
>   	return e;
>   }
> @@ -641,26 +640,27 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_engine_get_property *args = data;
>   	struct xe_engine *e;
> +	int ret;
>   
>   	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> -	mutex_lock(&xef->engine.lock);
> -	e = xa_load(&xef->engine.xa, args->engine_id);
> -	mutex_unlock(&xef->engine.lock);
> -
> +	e = xe_engine_lookup(xef, args->engine_id);
>   	if (XE_IOCTL_ERR(xe, !e))
>   		return -ENOENT;
>   
>   	switch (args->property) {
>   	case XE_ENGINE_GET_PROPERTY_BAN:
>   		args->value = !!(e->flags & ENGINE_FLAG_BANNED);
> +		ret = 0;
>   		break;
>   	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>   	}
>   
> -	return 0;
> +	xe_engine_put(e);
> +
> +	return ret;
>   }
>   
>   static void engine_kill_compute(struct xe_engine *e)
