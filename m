Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B0C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 09:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F210E3F3;
	Wed, 29 Nov 2023 09:43:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AADF10E3F3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701251035; x=1732787035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jNK5mVltIMxCwxGsvkQ0QN/S1oDCA3Z6iW0mhMNIp0Y=;
 b=mDLrYJtDvtDZD1ICiRXqJnixQRoZrGUUlB3JiwH9TH3UHdkXR+AFYyQR
 lUSuEzgbdutbu9MjIYSAjEOpnV0oLsL3XpA/1Vra4+Jd/uYuB53r7Frjh
 23ZsU0ieTeU9i1ZbVZ2NflQTCLJOIXQsvRMMGTvJEM+fmRzqHw42llxu3
 MFT0XIHmk/1HqSt3wjyt5MjE8eoY66nmtGea8cgikVV4ZxDu4ii9kPZ5e
 3Mk7I2JPc/vWwboWEAuS6nDUwjWl/j/e06tuXNdp32VgGUj6j5GtjwMbo
 cJNni/UMolSoL0pjkS7W6cXYhsJhbFbQb+pELZ+7nJPdP4H+4eo5uVl6w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373321087"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="373321087"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 01:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859764003"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="859764003"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2023 01:43:25 -0800
Received: from [10.249.156.143] (unknown [10.249.156.143])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CD77A36344;
 Wed, 29 Nov 2023 09:43:24 +0000 (GMT)
Message-ID: <cefbc4f8-08c4-4c96-b042-a1e83d49d05c@intel.com>
Date: Wed, 29 Nov 2023 10:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-20-michal.winiarski@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231129011624.836843-20-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 19/22] drm/managed: Add drmm_release_action
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 29.11.2023 02:16, Michał Winiarski wrote:
> Similar to devres equivalent, it allows to call the "release" action
> directly and remove the resource from the managed resources list.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 28 ++++++++++++++++++++++++++++
>  include/drm/drm_managed.h     |  4 ++++
>  2 files changed, 32 insertions(+)

shouldn't this go to the dri-devel first ?

> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index bcd111404b128..f819940b8a959 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -176,6 +176,34 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action_or_reset);
>  
> +void drmm_release_action(struct drm_device *dev,
> +			 drmres_release_t action,
> +			 void *data)
> +{
> +	struct drmres *dr_match = NULL, *dr;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
> +		if (dr->node.release == action) {
> +			if (!data || (data && *(void **)dr->data == data)) {
> +				dr_match = dr;
> +				del_dr(dev, dr_match);
> +				break;
> +			}
> +		}
> +	}
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	if (WARN_ON(!dr_match))
> +		return;
> +
> +	action(dev, data);
> +
> +	free_dr(dr_match);
> +}
> +EXPORT_SYMBOL(drmm_release_action);
> +
>  /**
>   * drmm_kmalloc - &drm_device managed kmalloc()
>   * @dev: DRM device
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index ad08f834af408..f547b09ca0239 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
>  					    drmres_release_t action,
>  					    void *data, const char *name);
>  
> +void drmm_release_action(struct drm_device *dev,
> +			 drmres_release_t action,
> +			 void *data);
> +
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
>  
>  /**
