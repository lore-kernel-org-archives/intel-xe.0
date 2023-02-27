Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1544CC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 14:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8410E410;
	Mon, 27 Feb 2023 14:19:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C879B10E410
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677507567; x=1709043567;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Kxxi7ZLkMhNeZvLO8EdwZIOS1m4omBcwntklpGzdpzg=;
 b=i/je6UXLtfkPBq0Fr/rQ102uo/wKI33m24fH39F0NwBl61MsTGNH3xco
 p5t9KqH2JSCUlxMFj/ODSBmIKviJOtgb6K6ddtm9ubXgfXtc1A2i/1yN4
 QZU/+IWf0RqKjGhGRaF4dmjbPfoy7Rh0Sn2X1CQ9nLty7VzywRXRIH6lP
 Re941JM3y0gzcEmVzVqlkHxNSmDulcY9tMN+1CwjbCPwbNAW/BI4CTBiN
 arWJSwzNvRpgCMt73odEQpXHcwo2Tyk4HXy+sBKuXzFNDuxI/v4tHQ8gA
 GaJ2fytRG07fI0uQfNe0oU1IGRciZ+Jp4lvMQV69Y5XAP42arbfM5aOd5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322111528"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="322111528"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:19:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="623597897"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="623597897"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:19:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
In-Reply-To: <20230217222230.l7ssyylivr2c75bx@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-9-lucas.demarchi@intel.com>
 <Y+/jICXsAkeW0Onw@intel.com>
 <20230217222230.l7ssyylivr2c75bx@ldmartin-desk2.lan>
Date: Mon, 27 Feb 2023 16:19:19 +0200
Message-ID: <87edqb1994.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 08/11] drm/xe: Remove dependency on
 i915_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Feb 17, 2023 at 03:27:12PM -0500, Rodrigo Vivi wrote:
>>On Thu, Feb 16, 2023 at 04:52:23PM -0800, Lucas De Marchi wrote:
>>> +#define GGC					_MMIO(0x108040)
>>> +#define   GMS_MASK				REG_GENMASK(15, 8)
>>> +#define   GGMS_MASK				REG_GENMASK(7, 6)
>>
>>one of the things that I'm always confused is with these REG_{BIT,GENMASK,FIELD_PREP}.
>>Why can't we simply use the regular "non-REG_" versions like every other driver
>>(aside of i915 of course).
>
> it was some time ago, I didn't remember exactly and was guessing it was
> because GENMASK returns a long, while our registers are 32bits.
> Indeed, commit 09b434d4f6d2 ("drm/i915: introduce REG_BIT() and
> REG_GENMASK() to define register contents"):
>
> 	We define the above as wrappers to BIT() and GENMASK() respectively to
> 	force u32 type to go with our register size, and to add compile time
> 	checks on the bit numbers.

This, plus FIELD_PREP() doesn't always generate an integer constant
expression making it hard to use in some cases. Which I believe we see
over and over again in i915 gem/gt code that uses FIELD_PREP(). It's
even compiler dependent I think.

> we may revisit that and maybe generalize GENMASK32/BIT32 that guarantees a
> u32 type is returned.

Obviously not a bad idea, but additionally forcing integer constant
expression might not be something everyone wants in generic code.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
