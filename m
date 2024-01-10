Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CBBC4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761B610E631;
	Wed, 10 Jan 2024 15:18:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EA910E571
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704899899; x=1736435899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dJ5jpQk1QiaoPMF49QRCarI6rfbPtIjbuYVnb9lfisc=;
 b=kYjCyrI2FcA9+83egXPc/aqFxyv8Y7mWjEuwQy9ZlatibNlc2BCWOgDO
 QzQBGXnI+fYRlOuy84DkOBVymp/IqgCjsKhUtndXUXrK6KGT4xfsrsPdp
 Y4/Q6xczkvR6eqpxpYeYVSyLrRp4O5deAnTBVyYeptqZF9wm9ALiOEzbd
 D2y95a81GjuiYY+Nz4+zGwcbszc6sThkbAdx0eItneYMXkRWyj3INZRZb
 XlGNvzshSNPKid3TDbHJ7/INY37oMu/sNSisIlYBYkEKoMIQYreoYZmib
 i5DMONw0fxE3NzvJ0divvlzLjucu1Y6p1Wq+c2AQ86VoyKuFaC8JSbC4Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="484732064"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="484732064"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731883180"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731883180"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:18:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Subject: Re: [BUG] allmodconfig build error in next-20240108
In-Reply-To: <6r2zjqbs2g3hkt3uhnglwpboalwck5ye34b6gxzmhe4gae77g7@3bzqt4s7i2qb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
 <20240109095757.1313b2d9@canb.auug.org.au>
 <341a4955-0cdd-48d0-bfbd-cc6f6f09df37@paulmck-laptop>
 <atbx7mspjbymkzgstk4l64qz3uky3wpmx4isrfg3ixgtvebdd2@cktpe4ejfk7k>
 <20240110081155.48bb0cbd@oak>
 <d61dfe52-9567-4f62-98f5-5c1e00cb4708@paulmck-laptop>
 <20240110095822.3ba3d979@canb.auug.org.au>
 <3d14049c-d44c-4b33-9933-0f96055b8a70@paulmck-laptop>
 <20240110160335.2bad7d54@oak>
 <3a10ef2b-acbe-4d80-805a-e947e15e5db3@paulmck-laptop>
 <6r2zjqbs2g3hkt3uhnglwpboalwck5ye34b6gxzmhe4gae77g7@3bzqt4s7i2qb>
Date: Wed, 10 Jan 2024 17:18:11 +0200
Message-ID: <87o7dtusi4.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> [ This particular warning is broken on GCC11. In future changes it will
>    be moved to the normal C flags in the top level Makefile (out of
>    Makefile.extrawarn), but accounting for the compiler support. Just
>    remove it out of xe's forced extra warnings for now ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> would you mind if I extend it to drivers/gpu/drm/i915/Makefile
> in the same commit or would you prefer a separate one?

I think I'd prefer separate patches for i915 and xe. And just remove the
line instead of subdir-ccflags-$(call gcc-min-version, 120000) as
linux-next handles it properly in the top level Makefile.

BR,
Jani.



-- 
Jani Nikula, Intel
