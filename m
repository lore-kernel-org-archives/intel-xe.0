Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE28C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 16:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F24610E237;
	Mon, 15 May 2023 16:42:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B52E10E237
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684168973; x=1715704973;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Qc+0ODp8MIT8NoKtjgvGc9siZIufpYXzCkmQU5FCPT0=;
 b=HB/CrVBph/MvvzSoofYtaJcHKthOYeU8XlBPmKEqesiukcFJ7tUOmDYT
 2lN7sZZqo+FF3TrlyqoowG+uBClFesEelCQYHVuT6KD0k2+6zxuXHNbtz
 1oPKr449IkdKT7GFF0+DyRy3pCQDBP3AD3JtWGs0MFw9dYI5QHlqagwCB
 u4wHcAolkS8v2TGke9tLgzxT0HnU0QkA8OQMgJIzBJxg6gp4934BSJRjH
 kgbB9Tg55LEcg3pKCE5r6iVxeh6FJjo5adlTWDmsWJOuuKXjfsT3s5mXx
 geNEZKEnmaxEFS+szGUFH/pV1kh8y+Lls/pB+rIhw83X5Jyb3bLjxjI2X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="351281390"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="351281390"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 09:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947478428"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="947478428"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 09:42:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
In-Reply-To: <ZGJEmhlyTFNcdUoR@rdvivi-mobl4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230512074335.1293293-1-jani.nikula@intel.com>
 <87jzx9itji.fsf@intel.com> <ZGJEmhlyTFNcdUoR@rdvivi-mobl4>
Date: Mon, 15 May 2023 19:42:48 +0300
Message-ID: <87h6sdim0n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 15 May 2023, Rodrigo Vivi <rodrigo.vivi@kernel.org> wrote:
> On Mon, May 15, 2023 at 05:00:17PM +0300, Jani Nikula wrote:
>> 
>> Lucas, Rodrigo, r-b on these two?
>
> I feel the order in the series is the opposite, but anyway,
> on the next clean up that will be fixed so, let's move with this

It's true, but would cause unnecessary conflicts every step of the
way. This doesn't.

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, pushed both to drm-xe-next.

BR,
Jani.

>
>> 
>> Thanks,
>> Jani.
>> 
>> 
>> On Fri, 12 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > The dependency on display/intel_display_reg_defs.h is removed by
>> > upstream commit 6e4e9fbd5ba0 ("drm/i915/gt: drop dependency on
>> > VLV_DISPLAY_BASE").
>> >
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 2 --
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > index 7ae5fa5a8ff7..af80d2fe739b 100644
>> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > @@ -7,9 +7,7 @@
>> >  #define __INTEL_GT_REGS__
>> >  
>> >  #include "i915_reg_defs.h"
>> > -#ifdef I915
>> >  #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
>> > -#endif
>> >  
>> >  /*
>> >   * The perf control registers are technically multicast registers, but the
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
