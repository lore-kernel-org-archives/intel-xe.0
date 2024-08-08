Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC035C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 11:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8FC10E6D5;
	Thu,  8 Aug 2024 11:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7Rrgiig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705D510E6D5
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723115303; x=1754651303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d/99xhZ+a9/lEO17Mff3pYrpO/qqKDZpxkoXBUp/Htw=;
 b=L7RrgiigkEH9mx3lpo6zr2vOA3j5Q6l2XC5j1ypHKoFuEdRyUJkDk0Jq
 baNKu7xQzDdTy6S/360FWHEuSkhTbGyQ0X/4n75C0PC9Qo7SvSBCEZRyn
 s/3bMlDEoGFS1WxEX/Sa9/fvuGQM9+SSc+r9E42+t0MFv48bqpQOJBN8d
 RxPn5523emplgeZcQV+YRO3zzn+m/dFuNH4XIG+z8pGUUI1E3KsUrikaw
 KXPQNSKcr7HbdGOX4T5MZyd9zMu5FypePeZGWPOB+y8LG7jGlCqjDp3XI
 3TqC49vaFKHT0F5qcwWYkRFpb7ifGZcqe1iu2ffoH1ggkw7AtOQ+M2TAn Q==;
X-CSE-ConnectionGUID: JidvSJ9uQYeTKDY0aVWbAw==
X-CSE-MsgGUID: 5oW7/E/2Rh2yR6PUdWoaqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25025765"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25025765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:08:22 -0700
X-CSE-ConnectionGUID: n5L5EcC7QbGSuQXpRizc4Q==
X-CSE-MsgGUID: 08XS7iMBR22ljpXJv37oKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="57104703"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:08:20 -0700
Date: Thu, 8 Aug 2024 12:08:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 02/21] drm/xe: Move and export xe_hw_engine lookup.
Message-ID: <ZrSnFyYI6U28hWsF@ashyti-mobl2.lan>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-3-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-3-mika.kuoppala@linux.intel.com>
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

On Fri, Jul 26, 2024 at 05:07:59PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Move and export xe_hw_engine lookup. This is in preparation
> to use this in eudebug code where we want to find active
> engine.
> 
> v2: s/tile/gt due to uapi changes (Mika)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

I see this is already appled, so that I'm too late to add my rb
here.

Thanks,
Andi
