Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FC3CD342F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 07:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF4410E19B;
	Tue,  3 Sep 2024 07:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2JNKvZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5110E19B;
 Tue,  3 Sep 2024 07:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725348767; x=1756884767;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9R0ikBbFfQPQXU4oIUL8zbAB0vcCG6CHLZ5sHMTJnrA=;
 b=f2JNKvZ8S25bs0oZ5thm6o5EwOZ55yBG3JZM+bTeySMf8cuQlhyOe030
 HXhdIVR9rEy83jz4VXq8CAG8NOhikVaorRJNrkY5TCqqv3Ola/vzHvO/a
 0+dJ9ow9He2eMZIuMrIlzyjFU8dH0MWvblljFo8iSHKvCGlqmrgQzLpAU
 Xtf5UIuZ47GtBw/o9AHLnuHH6qHmT2EZBCctFZ5As5U7zGQZqlVcUZZUA
 /Qzv4/jjrKdLZfcFci986XaEn5SbzWrpeY7ZW26j+rRSu6n2O/baFZTaa
 6uQWq5H1NMDbaZKAK05016PX1vPBC82ZgznuS/9RpxssYOqOyKCOWtVfn A==;
X-CSE-ConnectionGUID: Md7sLtP2RbCkEUFJypHf5g==
X-CSE-MsgGUID: AWKUcmZAQfSMZ3FPXqvKZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27684758"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27684758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:32:47 -0700
X-CSE-ConnectionGUID: ZLzVdLDkQlCJ7EnmZrKoYw==
X-CSE-MsgGUID: CSa2G3oZS7+jeMZH4WmpHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64827013"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:32:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 0/8] drm/i915 & drm/xe: shared PCI ID macros
In-Reply-To: <bslcjve463mplypyr7logylpnkq3asfbalg2a43h3kl5cckefp@wzjcpnaw26ah>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725297097.git.jani.nikula@intel.com>
 <bslcjve463mplypyr7logylpnkq3asfbalg2a43h3kl5cckefp@wzjcpnaw26ah>
Date: Tue, 03 Sep 2024 10:32:03 +0300
Message-ID: <87o755tcp8.fsf@intel.com>
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

On Mon, 02 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Sep 02, 2024 at 08:13:59PM GMT, Jani Nikula wrote:
>>There's considerable overlap in i915 and xe PCI ID macros, and (as can
>>be seen in this series) they get updated out of sync. With i915 display
>>continuing to use PCI IDs for platforms that i915 core does not support,
>
> humn.. but display is not using a separate device. It's rather the same
> that we bind to the xe driver. Why does i915 need to know the PCI ID?

Because display does its own device identification for display, for
display needs, without depending on either xe or i915 passing along some
data that has to be managed between all three.

>>but xe does, the duplication will just increase. Just use a single file
>>for all of them.
>
> I'd expect PCI IDs to stop being added in one header and start to be
> added in another.

Display could include xe_pciids.h too, and start using the XE_*_IDS()
macros for LNL+, but still the intersection of PCI IDs from both i915
and xe should match.


BR,
Jani.


-- 
Jani Nikula, Intel
