Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E9CC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 12:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF6A10E1BF;
	Mon, 12 Aug 2024 12:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKkIOTjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3110E1C0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723464156; x=1755000156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pa4ptmmAzh8mYfYdGF3vt8J5XYaf3uDryBf8WrBnjnQ=;
 b=jKkIOTjT07PGbc8ROXdsb9fsoLIFz/W9isxUbPIxGmrbS9fbzmqOOT7f
 KKdT28QhQqtN0tD5CcUhnudchO/FfpQG3U4QuFQCKkEPU+Jp/S5UgeYef
 gnHWqlEtvfLkI0cTTfTvFeh/00d5BJqvkV/Q9Dc9KYYaPvGXT1vbCiqSY
 nJtVu3cr25migfQ3k73Z/TFf0IzYD74yJJEXXSA80GoAvunBUZRK7erAS
 ITAkI5vwRVps8wuDOk3DjZ7bKLcNyREPOInGHWb0sDrRdFQV+EWwz7Qde
 Ls4e21BC1O0Fky23T9hbO8lGGxeyU0Y5ve7Fyl4vmO14oR70Q08uy1ZnQ w==;
X-CSE-ConnectionGUID: 69n3mGgzRcuTgzpOs4qY/Q==
X-CSE-MsgGUID: uWrydXBFRWmRC3sWIpxgpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24476095"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="24476095"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:02:36 -0700
X-CSE-ConnectionGUID: bcYo3+B0QnCw7AEPsxjy7Q==
X-CSE-MsgGUID: yoAwPdDwQ+i1X9XQKEmESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="88896694"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.97])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:02:34 -0700
Date: Mon, 12 Aug 2024 14:02:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
Message-ID: <20240812120207.3ezb4rky5z364quy@zkempczy-mobl2>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
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

On Fri, Jul 26, 2024 at 05:08:00PM +0300, Mika Kuoppala wrote:

<cut>

> +static long xe_eudebug_read_event(struct xe_eudebug *d,
> +				  const u64 arg,
> +				  const bool wait)
> +{
> +	struct xe_device *xe = d->xe;
> +	struct drm_xe_eudebug_event __user * const user_orig =
> +		u64_to_user_ptr(arg);
> +	struct drm_xe_eudebug_event user_event;
> +	struct xe_eudebug_event *event;
> +	long ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, !user_event.type))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.type != DRM_XE_EUDEBUG_EVENT_READ))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.flags))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.reserved))
> +		return -EINVAL;
> +
> +	/* XXX: define wait time in connect arguments ? */
> +	if (wait) {
> +		ret = wait_event_interruptible_timeout(d->events.write_done,
> +						       event_fifo_has_events(d),
> +						       msecs_to_jiffies(5 * 1000));
> +
> +		if (XE_IOCTL_DBG(xe, ret < 0))
> +			return ret;
> +	}
> +
> +	ret = 0;
> +	spin_lock(&d->events.lock);
> +	event = event_fifo_pending(d);
> +	if (event) {
> +		if (user_event.len < event->len) {
> +			ret = -EMSGSIZE;

Maybe it is worth to copy event->len to user_orig? I wonder how
userspace guesses the size of the buffer to allocate for the event.

--
Zbigniew

