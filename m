Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA66C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB610EA56;
	Mon, 22 Jan 2024 17:40:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9238E10EA56
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705945202; x=1737481202;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gq1VDRWXNrdTPeCXvZ1YOgE0LbUJHnTdjTCiHBP/kqM=;
 b=Nl6UAPQ2/1/FU8lIDD89JoY4ZVH8jK0qjJkeMfuKHBrO5k9mCYpnrWLf
 VTYb1HdzQAFvwzUUBeo/5JNRK3bwY/IjGqq7CBrmCGs4nWVgvm9ELQ35G
 FaDkJXFV8YL847PhzQ5QW3b1gVRWyfHdiEpGHqlC3Aj1bIEELci0rbhIv
 g8mwUvQ8iYloEpT8IkOCM2KHfho9cuxnNjDKIqHa1KohLUvtYeW9DGiqg
 uhxu5aI2XAfcqqGAJP7+RrvqWq4KK2b9pQ8Ecd/HuLNRm738ZS0QMbEvO
 /qaaxs8FPKqdGM5faWlcWTxt3caZIzRwc0x7MwZtvUxYHwHvHGzWTPaOQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400137206"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400137206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="34103348"
Received: from mshelego-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.40.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:40:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include directories
In-Reply-To: <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
Date: Mon, 22 Jan 2024 19:39:56 +0200
Message-ID: <87le8hnu6r.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> the downside of patch 1 is now that core xe code can include any of the
> display/ headers, but only xe_display.h is acceptable to keep the
> interface sane.

I'd say xe_display.h remains the only interface towards xe core, I don't
think this patch changes that, and its location doesn't really give any
guarantees. It's been a matter of sticking display/ in the include
anyway, and enforcing that is a matter of maintainer vigilance.

> Or are you thinking about changing the interface?

I agree the interface should be in one file only, but changing the
interface is an orthogonal matter (I have no plans atm).

BR,
Jani.


-- 
Jani Nikula, Intel
