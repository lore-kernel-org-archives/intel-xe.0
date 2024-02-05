Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB748C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 09:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFAA10EC4D;
	Mon,  5 Feb 2024 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbhD30KQ";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 09:46:37 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E024010EC44
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707126398; x=1738662398;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=C7yp3nTSFWL2y0Ul7xaKkiuhKbHIbsGK5z3y69Z0Ti4=;
 b=BbhD30KQLUaYQhm9eiloHx03WCP2Kjnc7kXyGhS0y5UW7QWhFxtKm6EH
 N5+KHnB3OiWNPaUTNNo5cbhzHWSUFXkzJ9B+GitfV+4ezDxyMLFZrwPJI
 /e2dt8AF5kOKk5+h1koRjanbowo1NiqE55s+TNhKQXkkCq6yL1qi6e+pG
 Quo/D16tUzeS1IGGXk8+1qeVxAyQC0FPaFXoZeUQNh45ToweZ35lJSDWf
 GviASfHbf4Vcnllgzep5YJfzrv6Zkmglgec92bdcpkZvkYBoFat2hJIOj
 300SwHZ+oWKPh33Cm4MAvfOms1xP99o9Gwz3rUEZsVcmFqsK7Tcs5hzda Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="390454"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="390454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5291391"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:39:29 -0800
Message-ID: <4fe8ee16-2897-4b87-99e7-a5c067e5bdc1@intel.com>
Date: Mon, 5 Feb 2024 09:39:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/34] drm/xe: Runtime PM wake on every IOCTL
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-9-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-9-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Let's ensure our PCI device is awaken on every IOCTL entry.
> Let's increase the runtime_pm protection and start moving
> that to the outer bounds.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 32 ++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pm.c     | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h     |  1 +
>   3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 01db34f06a7d..ab41202ecaf8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -141,15 +141,43 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   			  DRM_RENDER_ALLOW),
>   };
>   
> +static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct drm_file *file_priv = file->private_data;
> +	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret = xe_pm_runtime_get_sync(xe);
> +	if (ret >= 0)
> +		ret = drm_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct drm_file *file_priv = file->private_data;
> +	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> +	long ret;
> +
> +	ret = xe_pm_runtime_get_sync(xe);
> +	if (ret >= 0)
> +		ret = drm_compat_ioctl(file, cmd, arg);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>   static const struct file_operations xe_driver_fops = {
>   	.owner = THIS_MODULE,
>   	.open = drm_open,
>   	.release = drm_release_noglobal,
> -	.unlocked_ioctl = drm_ioctl,
> +	.unlocked_ioctl = xe_drm_ioctl,
>   	.mmap = drm_gem_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
> -	.compat_ioctl = drm_compat_ioctl,
> +	.compat_ioctl = xe_drm_compat_ioctl,
>   	.llseek = noop_llseek,
>   #ifdef CONFIG_PROC_FS
>   	.show_fdinfo = drm_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 3ef14937d5d2..d98f4bb3ad02 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -429,6 +429,21 @@ void xe_pm_runtime_put(struct xe_device *xe)
>   	}
>   }
>   
> +/**
> + * xe_pm_runtime_get_sync - Get a runtime_pm reference and resume synchronously
> + * @xe: xe device instance
> + *
> + * Returns: Any number grater than or equal to 0 for success, negative error

s/grater/greater/

> + * code otherwise.
> + */
> +int xe_pm_runtime_get_sync(struct xe_device *xe)

AFAICT we now have the following API:

xe_pm_runtime_get()
xe_pm_runtime_get_sync()

Which one should users pick? The xe_pm_runtime_get() makes it sound like 
it's async(), if there is also a _sync() version? Is 
xe_pm_runtime_get_sync() just for the ioctl level? Maybe we should add 
_ioctl or something and make it clear?

Otherwise I think LGTM.

> +{
> +	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
> +		return -ELOOP;
> +
> +	return pm_runtime_get_sync(xe->drm.dev);
> +}
> +
>   /**
>    * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index a672adffd0e1..7d8cf87b95d2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -27,6 +27,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
>   void xe_pm_runtime_get(struct xe_device *xe);
> +int xe_pm_runtime_get_sync(struct xe_device *xe);
>   void xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
