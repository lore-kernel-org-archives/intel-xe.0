Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12617E75433
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 07:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91A10E067;
	Tue,  3 Oct 2023 07:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE6310E067
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696319901; x=1727855901;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=qFtG4kB5WEQc7PIvBFzp+VZzkaCOND/oUXU7GhaMg/Q=;
 b=Ism9r1jUTELfJ+S0//shC/jvRdPSElfzLaSg18ree52NPPoGBkhexquR
 3JqYiNNO9qdgWOOIC2+XfUKvl1uJHmR0erPK95m9m7FP3u5BJx0r8LM9/
 cOdv57wt80JDiaNkF6K0BzeYXxmod2yq9Jke0SZClGla4chNIxIt5uxvr
 eMvkVcayUVSdD186NUKh5fJOKWi06crJCNZz3yP2Lyv1Z7hrIIsmelMUL
 uDkP1sBC4tDFYbXSdICQ+TI9Iw49HYBzsU/LliQQ0vPgB9cyykeE/X9H3
 4dRTzy/lL5vVLNjbYnTSmYx0OBGXafWzWa2LawlSGdVKHbY5Axed5w9R6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367867211"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="367867211"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 00:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997915438"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="997915438"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 00:58:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20231002193847.7134-3-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-3-maarten.lankhorst@linux.intel.com>
Date: Tue, 03 Oct 2023 10:58:16 +0300
Message-ID: <87fs2sgmsn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 03/14] ASoC/SOF/core: Ensure sof_ops_free()
 is still called when probe never ran.
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

On Mon, 02 Oct 2023, maarten.lankhorst@linux.intel.com wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> In an effort to not call sof_ops_free twice, we stopped running it when
> probe was aborted.
>
> Check the result of cancel_work_sync to see if this was the case.
>
> Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>

IMO this and the subsequent patches need either

- cherry-pick -x annotation for patches that have already been merged to
  upstream trees

or

- Link: tag pointing at the patches on upstream mailing list for patches
  that haven't been merged yet


BR,
Jani.


> ---
>  sound/soc/sof/core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 2d1616b81485..0938b259f703 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -459,9 +459,10 @@ int snd_sof_device_remove(struct device *dev)
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
>  	struct snd_sof_pdata *pdata = sdev->pdata;
>  	int ret;
> +	bool aborted = false;
>  
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> -		cancel_work_sync(&sdev->probe_work);
> +		aborted = cancel_work_sync(&sdev->probe_work);
>  
>  	/*
>  	 * Unregister any registered client device first before IPC and debugfs
> @@ -487,6 +488,9 @@ int snd_sof_device_remove(struct device *dev)
>  		snd_sof_free_debug(sdev);
>  		snd_sof_remove(sdev);
>  		sof_ops_free(sdev);
> +	} else if (aborted) {
> +		/* probe_work never ran */
> +		sof_ops_free(sdev);
>  	}
>  
>  	/* release firmware */

-- 
Jani Nikula, Intel
