Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE8EC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 11:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2787510E4B3;
	Wed, 31 May 2023 11:27:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBC110E0BE
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685532461; x=1717068461;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tIqKGTiC/zsrPVaWIWhRmR/Pn/KX/b0QuiFu4qZw0Wg=;
 b=hyTDtkgZKt6LT1ZAuBAI+FGCZAT3+uRPLenGTor+2epaDyFG8O6OQxYM
 QnU9LAggUTbSKKZr6oeC60uP1X5ZUKBHLp0Lunbrpagt1S7DrUkDJuHLT
 +QS1KLDvc1rrgKIhG7ssYXaCakh2BreOYjvtPD5VWGWYnOXkNri1tfECv
 PcTxxH/dnq6dWIAMKfLyVU5F4sZjHMcs/x9MXaqFm47aVpqIAZISTS4QO
 0wl7GFM95qIm9Vhclxz32QNGk97iR4hMhrGl/IgFma8iY+YDK0ybrwtHf
 08uNMU2zNqi0EMGiO0jWo3seA3mLGPa4dO2MjiEUL4aiPI+9rFiU7zYYq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="420974112"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="420974112"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 04:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="831181849"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="831181849"
Received: from eladcoh1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 04:27:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <69a8caf99beb496d15f791e0f8f3fb98a32719b8.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
 <87fs7egex2.fsf@intel.com>
 <69a8caf99beb496d15f791e0f8f3fb98a32719b8.camel@intel.com>
Date: Wed, 31 May 2023 14:27:20 +0300
Message-ID: <87zg5kg2qv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 0/9] Clean-up Xe FBC additions
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 30 May 2023, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Tue, 2023-05-30 at 15:52 +0300, Jani Nikula wrote:
>> On Tue, 30 May 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrot=
e:
>> > This patch set cleans up Xe FBC additions. All stolen memory
>> > details are
>> > moved to i915_gem_stolen header and source files. Also some fence
>> > handling
>> > details are move away from FBC code. This allows removing all
>> > ifdefs added
>> > into fbc code.
>>
>> I think all the #ifdef removals should be fixups to
>> "drm/i915/display:
>> Remaining changes to make xe compile".
>
> Ok, but how do I present patches tackling those ifdefs are supposed to
> be applied before "drm/i915/display: Remaining changes to make xe
> compile"? Otherwise my fixup patch removing those ifdefs is breaking
> the build until patch taking care of that ifdef is in the branch.

Yeah, remove the ifdef first as a fixup, even if that breaks the build,
then redo stuff properly. After rebase and reorder, it should be all
good.

BR,
Jani.


>
>>
>> Basically my idea is that the above commit should be reduced to
>> minimal
>> or non-existent; the remaining or required ifdefs should be added per
>> feature on a commit by commit basis, not in one big lump.
>>
>> BR,
>> Jani.
>>
>> >
>> > v2: add missing intel_gt_types.h header
>> >
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >
>> > Jouni H=C3=B6gander (9):
>> >   fixup! drm/i915/display: Implement FBC support
>> >   drivers/xe: Add new type for compressed fb
>> >   drm/i915/fbc: Add common type for compressed fb to avoid ifdefs
>> >   drm/xe: Add i915_gem.h compatibility header
>> >   drivers/xe: Move Xe stolen memory handling away form fbc code
>> >   drm/i915: Move stolen memory handling into i915_gem_stolen
>> >   drm/i915/fbc: Stolen initialize can be checked in plane check for
>> > i915
>> >     as well
>> >   drm/i915/fbc: Add function to get number of fences for gt
>> >   Add new fence_id and fence count functions
>> >
>> >  drivers/gpu/drm/i915/display/intel_fbc.c      | 134 ++++----------
>> > ----
>> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  37 +++++
>> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  13 ++
>> >  drivers/gpu/drm/i915/gt/intel_gt_types.h      |   2 +
>> >  drivers/gpu/drm/i915/i915_vma.h               |   5 +
>> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   5 +
>> >  .../gpu/drm/xe/compat-i915-headers/i915_gem.h |   9 ++
>> >  .../xe/compat-i915-headers/i915_gem_stolen.h  |  76 ++++++++++
>> >  .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   2 +
>> >  .../xe/compat-i915-headers/intel_gt_types.h   |  11 ++
>> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   8 ++
>> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |   1 +
>> >  12 files changed, 194 insertions(+), 109 deletions(-)
>> >  create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> > headers/i915_gem.h
>> >  create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> > headers/i915_gem_stolen.h
>> >  create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> > headers/intel_gt_types.h
>>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
