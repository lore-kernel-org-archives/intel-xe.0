Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C3C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 12:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7CF10EA93;
	Fri, 16 May 2025 12:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep8dlmPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4092810E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747397993; x=1778933993;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=REflDOtmY6FvtY8gC1ztnOVNlAIWMfn/w9VT+VX24n8=;
 b=ep8dlmPiTuhwdrAHguzligGM/45CDph/WKlsUuQO09h0Zbps0iIGclYf
 KYN9xV+lyfA1cbeyorGMqKFP5gCExB1nf57EuSXkab17osRYTW2liPOEP
 xSuFs8g5lEVUmcKsGSTx48GQa3kjVRrHtqpR0kXsOPREujE7fwyfB2FrH
 Gwb/1w/f309dLwCqXKA3hg501VlT1WrQIoZ7hy0SZpzUDuON16gUOtjwd
 aTzh3nnN4quNFb5q/wT7F2ec3CRcwjc3J6/Gs/EgYzsnFEw1T7HlkYXnj
 BiLKZvcBpZ7qvEizUMgqEj8CiaKcKuyLp4XFDFuAlXkGS64fi8rkzdZ0s Q==;
X-CSE-ConnectionGUID: dmqiEeTITYmSvwnuLA5HBw==
X-CSE-MsgGUID: VZC9AUh3QnyXiZmt9dnHzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59599234"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="59599234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:19:52 -0700
X-CSE-ConnectionGUID: QelF1GsRQ0m426uTPb16uQ==
X-CSE-MsgGUID: 2+/KoSLBTEeXrAANVAjhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169612175"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:19:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/display: drop duplicate
 display->fb_tracking.lock init
In-Reply-To: <f005f4ce-1371-48c6-98ff-1668dc264b1f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250516095514.398320-1-jani.nikula@intel.com>
 <f005f4ce-1371-48c6-98ff-1668dc264b1f@intel.com>
Date: Fri, 16 May 2025 15:19:47 +0300
Message-ID: <87frh4wxwc.fsf@intel.com>
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

On Fri, 16 May 2025, Matthew Auld <matthew.auld@intel.com> wrote:
> On 16/05/2025 10:55, Jani Nikula wrote:
>> The spinlock is initialized in intel_display_driver_early_probe(). Drop
>> the extra init.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks for the review. I've included this as part of a bigger series
[1].

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1747397638.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel
