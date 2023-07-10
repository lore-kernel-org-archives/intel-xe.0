Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FD0EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 16:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9024810E26E;
	Mon, 10 Jul 2023 16:39:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D8810E26E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689007151; x=1720543151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=24zsoDrwoU5f/EKrdXIZDJ1JRImeVyUBoA5T7HGgNPM=;
 b=XYjY1XE1YMntUUpko7KpaCgSa/LzMGJEr6+CsRfZr1xpMNS05RGqSwue
 Uiw4mEtAeezUjU8jB3GdPoWwqv0ymJ/mhFUsfl+s9pM8KC9XkSIAQZ4Q6
 zUjrrdHKEimzwhmppwnTpY3Qb/M3DJwBLTV39oafdd5eiSPq3/bPiVFxB
 q7ykJwN3rSOhWEZkMNhi4mcJxdV48pocPprDzgJE7Bock/lJmgjccppFJ
 e49oUOUbe7wzEVg48UE9szqv4w07XbR21f7fawT3wGW6MHK6/Jl2nLvik
 Yokgw0Jqmr5pLY8GMTlLt1HTJEQLUwy+UOT1VunKVAc09VnmUMdAKWFMO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430472452"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="430472452"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 09:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894855395"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="894855395"
Received: from ccernalx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.34.64])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 09:39:08 -0700
Date: Mon, 10 Jul 2023 18:38:59 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZKw0I6s8yM48JGYI@ashyti-mobl2.lan>
References: <20230630115019.123675-1-jani.nikula@intel.com>
 <20230630115019.123675-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630115019.123675-2-jani.nikula@intel.com>
Subject: Re: [Intel-xe] [RESEND 1/5] drm/i915/uncore: add
 intel_uncore_regs() helper
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Jani,

On Fri, Jun 30, 2023 at 02:50:15PM +0300, Jani Nikula wrote:
> Add a helper for accessing uncore->regs instead of doing it
> directly. This will help display code reuse with the xe driver.

I asked you in a previous mail if you had tried
intel_uncore_{read,write}_fw() helpers instead of the simple
intel_uncore_{read,write}.

Thanks,
Andi
