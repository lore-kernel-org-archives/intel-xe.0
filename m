Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A1FC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 08:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD110E5E4;
	Thu, 16 May 2024 08:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMNBlqNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307B10E160
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715847245; x=1747383245;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i2B8F3Ht22szd30eKOTwmz5g/lLqjJONh+0DoXhMiB8=;
 b=ZMNBlqNjbvM0y+qgRx7t2JmRMbW+2fnYQvPkNz0RziYX0GWqoc6raYBU
 41QUe+89UJB54qTHQUwTJ3nfigiI5320VOiJ6jLkqKjbaIfoeqLmykKaA
 /Og3UKwMobETLHqfZXPOaH4Qe3iePwboKYc/luONyDy09UjNAQexc7Z5H
 kYsqVTNfjigMA7DELW4r3iPVn2oDYqTwLc+bX2oZDN+wh/iD4nKPA2Zbt
 apoUXP8dHtv1k6rkcT+gjO7p5fxJnMpeMGMZPiV9s3/bg/kjEcF8POLc8
 A6vjHNaHwx+FvuJ4J3jz82WZYBqzAzn2m2pYMzJAhX+XtlXf8Vxbx7LEz Q==;
X-CSE-ConnectionGUID: yII0Pb1YSZKQCvx5N4Nkcg==
X-CSE-MsgGUID: AftUTNjqRVemc9tHpH0kDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23346719"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23346719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:14:04 -0700
X-CSE-ConnectionGUID: lqt5vyv6T1KW+IPX5r8hHA==
X-CSE-MsgGUID: EhtbXRjpRGCdGfDE2d3r1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="54553777"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:14:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Koby Elbaz <kelbaz@habana.ai>
Cc: rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Ofir Bitton <obitton@habana.ai>, =?utf-8?Q?Jos=C3=A9?=
 Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v9] drm/xe: add mmio debugfs file & restore
 xe_mmio_ioctl as its ioctl handler
In-Reply-To: <75pog7eg7y5igqenv7gjgearkwyn66ba2cnxpwhfh5wgjtj27o@nqgpq2vew2vt>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240515165244.156194-1-kelbaz@habana.ai>
 <75pog7eg7y5igqenv7gjgearkwyn66ba2cnxpwhfh5wgjtj27o@nqgpq2vew2vt>
Date: Thu, 16 May 2024 11:13:57 +0300
Message-ID: <87seyib2d6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 15 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Currently intel_reg has a few backends like mapping the BAR, or
> submitting a batch and reading/writing from the GPU side. Adding another
> one to be "via driver's debugfs" would probably be ok. +Jani as
> intel_reg's original author.

Yeah, why not. It should be possible to cleanly add new "backends", and
there's already plenty.

BR,
Jani.


-- 
Jani Nikula, Intel
