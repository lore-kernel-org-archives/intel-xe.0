Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CFDC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 11:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E8210E110;
	Wed, 21 Aug 2024 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+MQEsel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56B310E110
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724240827; x=1755776827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jjSih0Dn18w2M2H4XIJPx7914iu+Rq2MOCxnA9iSusE=;
 b=f+MQEselc7dWMAzyIkiQXpNGowkRnjfkW1Jswj/u1WyYeTJ6xKzfY05Q
 Qt538YleqxWIQtO1CjwazW2o47aA+LnuyE+vpK/LFnygSHZQ53HCXuBN1
 tIbnWuvEYu1/JiMlVoEbNbnyS1nqNXpfYl5i/QUKlOtpr3aI4ASGfioWq
 CRpAEVOXFfTb9mHohIltpe0EBZFQ8Mzmp03GY+qmZdWulJPrluQ0CL2uT
 G6kLVhDB/vtozXV6z2G2kBRoYtagyj74WbmKulODpv/xGLgcaKPZtYSRN
 7Yhzu65i7XCVmFiSZN7kMR/wlUoH0JRtIqHs9o0WEYcR5Y1Csj3GUeQiM Q==;
X-CSE-ConnectionGUID: f/Ei+e8wTwiZ6csfOj4P5g==
X-CSE-MsgGUID: O5W6I3bvRvqWTzH4k/AhPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25492119"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="25492119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:47:06 -0700
X-CSE-ConnectionGUID: f1Wi5FiqQ4W9El1XkiKX/w==
X-CSE-MsgGUID: TBPK2pvNRZyzWBTdxbhHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61372146"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:47:04 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
In-Reply-To: <20240807093433.rlvwfsp57qczf4yh@zkempczy-mobl2>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
 <20240807093433.rlvwfsp57qczf4yh@zkempczy-mobl2>
Date: Wed, 21 Aug 2024 14:37:43 +0300
Message-ID: <878qwq6r94.fsf@mkuoppal-desk>
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
>> +
>> +static int
>> +xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
>> +		  const pid_t pid_nr)
>> +{
>> +	struct task_struct *target;
>> +	struct xe_eudebug *iter;
>> +	kuid_t uid =3D current_uid();
>> +	int ret =3D 0;
>> +
>> +	target =3D find_get_target(pid_nr);
>> +	if (!target)
>> +		return -ENOENT;
>
> This goes outside and is returned via ioctl() what reminds me some LKML
> thread this code is reserved for file operations only.

Yes, my excuse here is that I try to mimic what other xe code
does. And I can't think of other than EINVAL here.
-Mika

>
> --
> Zbigniew
