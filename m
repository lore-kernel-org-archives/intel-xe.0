Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655FAE7C4E3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6710E38D;
	Wed,  4 Oct 2023 16:35:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39F610E38D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696437334; x=1727973334;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qFkSK5mcGlRXMy5OTsPPZ64BLlpbsfPzqmZAJfoIJ3s=;
 b=let7Gw5enT1zXhF3TVjoxnJ4Gj1xGTgxCWl/u0m54wbm5pj4zpx6dEl3
 ifHkGpRZ8kF0ojhoSocstbwaUT/2W7LY6N/7YS5QXuWqbaW1QfRFoDCwv
 +Nmg6C81lN06BeJKXOUWWe/T/Bawd0l3OpRIP6ugLUc765Le2i7vgQ3sD
 zgSW6ocevM/6v1XS5648ZW/eOYkKx0lH46zFCvVyNWRGDzunosAxLVnaA
 FPAkf5j5Lye8ORedrs6kKPuikJirAezaI54Gow/ijkdDv9ZRVLChTZElb
 ENL1O6wvmbGf9LA8jUOczKR6CBKs1sRPQjDBFHqcFwaPihcpAkg3jYMWL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373565249"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="373565249"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082579269"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082579269"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:31:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <cw5rvehjdbs4ppttxjqpvggc2c2to42wg53i3ymstelavni4hk@jdhra625vd3b>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696343521.git.jani.nikula@intel.com>
 <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
 <cw5rvehjdbs4ppttxjqpvggc2c2to42wg53i3ymstelavni4hk@jdhra625vd3b>
Date: Wed, 04 Oct 2023 19:31:53 +0300
Message-ID: <87cyxue4cm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 06/10] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 04 Oct 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Oct 03, 2023 at 05:34:53PM +0300, Jani Nikula wrote:
>>The diag push/pop stuff is unnecessary leftovers.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_display.c | 5 -----
>> 1 file changed, 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>>index 82d2c42629ce..391f08c1caca 100644
>>--- a/drivers/gpu/drm/xe/xe_display.c
>>+++ b/drivers/gpu/drm/xe/xe_display.c
>>@@ -417,10 +417,6 @@ void xe_display_pm_resume(struct xe_device *xe)
>> 	intel_power_domains_enable(xe);
>> }
>>
>>-/* Display info initialization */
>>-__diag_push();
>>-__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>-
>
> is it?

There are no struct initializers within the scope of the above diag
push/pop.

> drivers/gpu/drm/xe/Makefile:CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> drivers/gpu/drm/xe/Makefile:CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
> drivers/gpu/drm/xe/xe_display.c:__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>
> there's no disable-warning for xe_display.c
>
> Btw, doing it by file is much worse as it ignores the warnings in places
> we shouldn't. Old compilers that don't support it also don't warn about
> override-init, so we could have a better helper for that.

That's not exactly correct, though. We had to revert __diag_ignore_all
for -Woverride-init from upstream i915, and I'm pretty sure xe will have
the same fate.

All the gory details in commit 2c27770a7bc8 ("Revert "drm/i915: use
localized __diag_ignore_all() instead of per file"").

BR,
Jani.


>
> Lucas De Marchi
>
>> void xe_display_probe(struct xe_device *xe)
>> {
>> 	if (!xe->info.enable_display)
>>@@ -435,4 +431,3 @@ void xe_display_probe(struct xe_device *xe)
>> 	xe->info.enable_display = false;
>> 	unset_display_features(xe);
>> }
>>-__diag_pop();
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel
