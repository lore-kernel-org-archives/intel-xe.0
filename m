Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CBCC4167D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 09:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B810E83E;
	Thu,  2 Nov 2023 09:37:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64F10E83E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917868; x=1730453868;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Hp1RhMim0Wrx94O0CyB8YpbjRESr/JqZFG9Sdb8CjY4=;
 b=F4yDJBfIUZfWLujAHO4REC5DlpjixXJEnaj2Nd4rzabHUSSKIdAsK292
 ltrWU1VTCTKKfEXnk8qotuVbUqBW+8RUbVQrQmzbDx4EhCeG/z22u3ezl
 djBz9LDDcDpXQdjqJTO2RjXNwsx1cwXp301svF7li9pFoE7nJV9L0ygHc
 wbvGSVowt+QL1Fc2Q25vykS3RSjPS80Qi9PzLrDW6GCJrFCXKOPZ2Ylmi
 C7dz2IbO3pI4MeyI5ls93bdWeE0KEJj4InJpmdC554Hbl0R0Ibn5htKNq
 Bqj1mgp4o5YutZjngXn6YCu5FYPTSC6l97qNX0ZreQDLklXv1cn7UHt1H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388493123"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="388493123"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="711087429"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711087429"
Received: from nofferma-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.121])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:37:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231101151528.1840900-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231101151528.1840900-1-lucas.demarchi@intel.com>
Date: Thu, 02 Nov 2023 11:37:40 +0200
Message-ID: <8734xo4hsr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/lnl: Extend C10/C20 phy
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 01 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> For Lunar Lake, DDI-A is connected to C10 PHY, while TC1-TC3 are connected
> to C20 phy, like in Meteor Lake. Update the check in intel_is_c10phy()
> accordingly.
>
> This reverts the change in commit e388ae97e225 ("drm/i915/display:
> Eliminate IS_METEORLAKE checks") that turned that into a display engine
> version check. The phy <-> port connection is very SoC-specific and not
> related to that version.
>
> IS_LUNARLAKE() is defined to 0 in i915 as it's expected that the
> (upcoming) xe driver is the one defining the platform, with i915 only
> driving the display side.

On the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
