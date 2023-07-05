Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1695EB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 10:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B3E10E34F;
	Wed,  5 Jul 2023 10:13:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243BC10E35B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688551997; x=1720087997;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U5Bd4jC5Ln5sG3aNt91SugToy/Z6vBu230U9FeWEAyw=;
 b=mO1vHz/crr/Gm63FopkVrG6wN2dvD07AHUBhiy63Dms822o8So2pHtfy
 Zs9Q6ndC58973l1Q7GGgBNoXWEhORMVcuIgAVEIRzsWsOpGLm4LXInbf5
 CH3YEmj3GS90KRS7h+wb+91KxCrZPFKulahmc7a3m+agC+Fl1BjwUHQhT
 /JzNUK2j8TliytwjYln33L6toNiRPsJZeIxK7icKkpWaSG7RSZP2LAZ4q
 kkj2wLP7kOUvoMCgRz8DtgWOt2/EiOAUoVyi2mQhNqOHtQHupaUv1/Y+c
 IueFQlSotz7G8dwX+aMm/FcdPXY9JvSujvHPHkaZNRSO3PcCmhK7IMSoB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429336886"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="429336886"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 03:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696403148"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="696403148"
Received: from unisar-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.23])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 03:13:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230704160907.2173428-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230704160907.2173428-1-lucas.demarchi@intel.com>
Date: Wed, 05 Jul 2023 13:13:11 +0300
Message-ID: <87ttuizmx4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/1] Synchronize ext/intel_dram.c with the
 i915 source
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

On Tue, 04 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> We can probably ifdef out most of intel_dram.c and stop copying it to
> ext/intel_dram.c, but there some abstractions that would be needed for
> e.g. the intel_uncore vs intel_de. Kick that can down the road and just
> do the needed change for MTL.

As it happens, I just did all that with [1].

Lucas already reviewed it (thanks!), this mail is for the benefit of
everyone else.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/120181/


-- 
Jani Nikula, Intel Open Source Graphics Center
