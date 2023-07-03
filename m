Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4170FC001B3
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 18:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D910E230;
	Mon,  3 Jul 2023 18:52:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE2510E230
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688410327; x=1719946327;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Wpm7NWMhobzoCCWGJ388CGLeNBH7gK9hmXT6T6HTrts=;
 b=czQuEbAv6VpedixDZeXhrvV3zfz0+X+yB4cCS41rT8zbkEkZdprQ9+6D
 OVrw8rgO6EUwGViyhCg1AM1FwB3XnbVMHlifrBWObmdcZ4RD7JS/uxySt
 owpJQ5XnVDziaxQWVSHOknRvuKPGoxVTtuqwrQA9h3TjDpI+nF/nYeKqC
 Y/NIc63FPTFkiXecGd8M9p7swcmxrHbE0Fp7meHwDf7pyiYPJML8QEOSA
 eTeSbrPwh29sKkaBJF2MuW9u03+eNd5BWLnTptxjHyLkMmMUCAe9abF0U
 mHsAgYRPaBkms3rBOlsnd30nYM37iVidb97DALwIdIMXz7knVK3LHfaBg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360427884"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="360427884"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 11:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788606337"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="788606337"
Received: from eduplens-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.248])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 11:52:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <20230630115019.123675-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230630115019.123675-1-jani.nikula@intel.com>
Date: Mon, 03 Jul 2023 21:52:02 +0300
Message-ID: <87sfa425gt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] xe & i915 display integration, display irqs
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

On Fri, 30 Jun 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Resend to hopefully get full CI results.

Finally pushed, thanks for the review.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
