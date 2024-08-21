Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF62C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 11:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322810E2C7;
	Wed, 21 Aug 2024 11:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xich3EYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29FB10E2C7
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724240890; x=1755776890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gDJQXJ8kxNks7nQRxidugb0ZOZC7yqWiFNjlFOf88Ag=;
 b=Xich3EYi2QeYZufYeuVezZKutph4LbyAe2+/OvXXflGI01F2uMWgIGpu
 Z6bgH2byJB1W9Xw4NsVv9k44QH3zHcYmzsQap+DE7pph9o22QSya1Ue1M
 eA3DIeyU7Ve4aXTCIgVI27jPR5Q7vBTnz/OMUzad9pvcOjYkEvXD3/J2/
 1CfFgi/+PiETgvfvL2DiRMgMt6/T6PSTuTWtJAUVh0qkvbSQN1uuvpem0
 PCcrLG8P9+HQc/HbSkifAEiSqwlwGBABI8CybUw95dPEIP8BMlPfEkhNu
 uoi8wo2RAw/80mQL1MsgQcFjyOdSMkxenMNJlrRTCADMDrhdF/qfVHmhK w==;
X-CSE-ConnectionGUID: jnx8by7FR1ep4MWxgivMQA==
X-CSE-MsgGUID: AKIX24OhRdy5O/MSC/hzGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22781030"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22781030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:48:09 -0700
X-CSE-ConnectionGUID: npt0AkYYQ6CulHg95WJP7w==
X-CSE-MsgGUID: nxU5/sFMRLakF1ctqBnTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61608353"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:48:07 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
In-Reply-To: <20240812120207.3ezb4rky5z364quy@zkempczy-mobl2>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
 <20240812120207.3ezb4rky5z364quy@zkempczy-mobl2>
Date: Wed, 21 Aug 2024 14:38:47 +0300
Message-ID: <875xru6r7c.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Fri, Jul 26, 2024 at 05:08:00PM +0300, Mika Kuoppala wrote:
>
> <cut>
>
>> +static long xe_eudebug_read_event(struct xe_eudebug *d,
>> +				  const u64 arg,
>> +				  const bool wait)
>> +{
>> +	struct xe_device *xe =3D d->xe;
>> +	struct drm_xe_eudebug_event __user * const user_orig =3D
>> +		u64_to_user_ptr(arg);
>> +	struct drm_xe_eudebug_event user_event;
>> +	struct xe_eudebug_event *event;
>> +	long ret =3D 0;
>> +
>> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(use=
r_event))))
>> +		return -EFAULT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !user_event.type))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.type !=3D DRM_XE_EUDEBUG_EVENT_READ))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.flags))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.reserved))
>> +		return -EINVAL;
>> +
>> +	/* XXX: define wait time in connect arguments ? */
>> +	if (wait) {
>> +		ret =3D wait_event_interruptible_timeout(d->events.write_done,
>> +						       event_fifo_has_events(d),
>> +						       msecs_to_jiffies(5 * 1000));
>> +
>> +		if (XE_IOCTL_DBG(xe, ret < 0))
>> +			return ret;
>> +	}
>> +
>> +	ret =3D 0;
>> +	spin_lock(&d->events.lock);
>> +	event =3D event_fifo_pending(d);
>> +	if (event) {
>> +		if (user_event.len < event->len) {
>> +			ret =3D -EMSGSIZE;
>
> Maybe it is worth to copy event->len to user_orig? I wonder how
> userspace guesses the size of the buffer to allocate for the event.

Makes sense. I will deliver event->len in v2. Thanks.
-Mika

>
> --
> Zbigniew
