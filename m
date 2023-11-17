Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1BEC072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 10:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B1210E73D;
	Fri, 17 Nov 2023 10:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A01110E73D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700215746; x=1731751746;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QA5NMAeDNJtXGbFdokkOoE/qPIINeUEiWfLYNMYIX7w=;
 b=LWfEEkVQkUbyF/WfWpWTXpFY79fx8xdCHb7PJxv8AeikeKQRTeHRoPlR
 zTtnTwgsQtLP8ptjzMeriRBT16pN8B2JE+JytQRnZPF5oiTohF4S7aUDl
 uh2QdIze9jFjms1V5O+tAeLvo3WwH/TPf9mxjcTcvSiLfehjJEL7rda+4
 D9KfE8itrtlq3cezSPKldI8n+IlXG1iau+Iet8qu+IIFsej3BSG65qmzh
 iTvUik5jGoHMyIPwedF1vFvMCc4b9fXX3UkbXk/ApjxxIjDwbfiuB1fs1
 ZtqaRlBV+iV1hk+PJKINoadlWNWABtCMHKvMpAuMMzIoKVP3nwBcaFmEh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388426519"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="388426519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831572956"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="831572956"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:09:04 -0800
Message-ID: <c475654b-8863-70ed-aea8-ce4765ef9c26@linux.intel.com>
Date: Fri, 17 Nov 2023 15:41:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231117092252.2413647-1-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231117092252.2413647-1-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/pmu: fix config counters in pmu
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


On 17/11/23 14:52, Riana Tauro wrote:
> Interrupt pmu event was dropped in a previous patch
> and the configs for the rest of the events were changed
> in uapi header.
>
> Change the configs in pmu file too.
Hi Riana,

Thanks for catching the bug.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Regards,
Aravind.
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 318bbc9c1c9b..c63b7f2fd8a8 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -353,10 +353,10 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  		bool global;
>  	} events[] = {
> -		__event(1, "render-group-busy", "ns"),
> -		__event(2, "copy-group-busy", "ns"),
> -		__event(3, "media-group-busy", "ns"),
> -		__event(4, "any-engine-group-busy", "ns"),
> +		__event(0, "render-group-busy", "ns"),
> +		__event(1, "copy-group-busy", "ns"),
> +		__event(2, "media-group-busy", "ns"),
> +		__event(3, "any-engine-group-busy", "ns"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
