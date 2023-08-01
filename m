Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759CAC0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 10:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C9A10E0CA;
	Tue,  1 Aug 2023 10:41:09 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C610E0CA
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690886467; x=1722422467;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ub13rKZFJoBIYuPBbBNrac4Rxs/gSu3smGosx7lidV8=;
 b=X4dzIzo0B4vKVL4HXttebnEAxfDGyYexOC33G+1w+pSmjY7YCPQiL881
 cDSmnM2HtcbmHUUnThh3VTV9tTPRh/2ClEikHrXIBA3UwtsuPksAdkVO6
 3jtC44FY7n2Fq+aHfOly5L2PaNJJgxPBiXIGOcE9Fr6gmC5ajQhlLYmQb
 kCUg3LisJgN4JPMnA/7elR41acQFXJ8P1edWjwxJmxshDkwAbYTAQu44q
 IEs+aHtDWp6NzwnCJx1Mb/mIqBj+HS3/X4cDCkU5EUDJCT3AUHZBBIKDQ
 pOFKYQ9tlHXLH3kPShhNB45UyJf219H1439bAj2zqTgx4ELxy5rVDlSB6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400214507"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="400214507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728644072"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="728644072"
Received: from igorban-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:41:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230727145530.7-4-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230727145530.7-1-francois.dugast@intel.com>
 <20230727145530.7-4-francois.dugast@intel.com>
Date: Tue, 01 Aug 2023 13:41:01 +0300
Message-ID: <87fs53vyde.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe: Use regular WARN_ON() instead
 of driver-specific XE_WARN_ON()
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> Remove XE_WARN_ON() alias to WARN_ON() and use WARN_ON() directly in
> order to align with other drivers and avoid using a Xe-specific version.

drm_WARN_ON() is preferred over plain WARN_ON() in drm code.

It'll debug log the device, which will be helpful in a multi-device
setting, as well as the condition.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
