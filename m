Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B5C77B6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 07:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F4810EA44;
	Thu, 13 Apr 2023 07:35:21 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897D910EA44
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681371319; x=1712907319;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XUbSrH12X3n2zssuipt+I3mBCdh0txrevldinyVS9HI=;
 b=O0+2qpLzaVLrdQbR5ISY8T7GebyPceJNu8pZYYBjcyvsyQtmROWnra/R
 PgckgjC6IxexGcjDQN7NXSwJs28EboK4UqqM4zDaiI+rT8MzPt3c5c+rm
 PWBav6ZnbYURA6M6oKXVNFzcHo3A7OXr9ZPnhhRZWRR5sn499p79Q/nJF
 jYPVnO6j2B+fKHjWDNSX1C/6ocLqbZRqp17MT90mtrVBLow71JDB+CxFs
 kx41qv1ImiUT3WXPH7OsLslhkQoxHd88TJ6qmceZAPCn0C3R7nxhU9LxW
 MQum6XxmVgLwlKDSLY4wlss09lKWMDsnNhhLOPm8Z1qesncTR3/1JRQUn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328225953"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328225953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="778660616"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="778660616"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:35:16 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230412162116.xldqatabrmbezakx@ldmartin-desk2.lan>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
 <20230412082054.3314568-3-lucas.demarchi@intel.com>
 <87mt3dqqux.fsf@mkuoppal-desk>
 <20230412162116.xldqatabrmbezakx@ldmartin-desk2.lan>
Date: Thu, 13 Apr 2023 10:33:15 +0300
Message-ID: <87h6tkqls4.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [RFC 2/2] drm/xe: Register OOB workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lucas De Marchi <lucas.demarchi@intel.com> writes:

> On Wed, Apr 12, 2023 at 02:31:18PM +0300, Mika Kuoppala wrote:
>>Lucas De Marchi <lucas.demarchi@intel.com> writes:
>>
>>> Some workarounds can't be implemented in the xe_wa.c as entries
>>> on a table since they need to be spread throughout the driver.
>>> Provide a mechanism to allow "registering" these workarounds so they can
>>> later be dumped together with the others.
>>>
>>> This uses a trick to define the static const entry when checking if the
>>> workarounds is "enabled". That entry is put in a specific section so
>>> later we can access all the entries in that section. Normally the linker
>>> provides the __start_<section>/__stop_<section> symbols. However since
>>> the kernel itself uses a linker script, this doesn't work, hence provide
>>> our own custom linker script to do what is missing.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/Makefile       |  2 ++
>>>  drivers/gpu/drm/xe/xe.lds         |  8 ++++++++
>>>  drivers/gpu/drm/xe/xe_guc.c       |  6 +++---
>>>  drivers/gpu/drm/xe/xe_rtp_types.h |  8 ++++++++
>>>  drivers/gpu/drm/xe/xe_wa.c        | 14 ++++++++++++--
>>>  drivers/gpu/drm/xe/xe_wa.h        | 10 ++++++++++
>>>  6 files changed, 43 insertions(+), 5 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/xe/xe.lds
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index aceca651de57..9cbcc0ed06b2 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -216,6 +216,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>>  endif
>>>
>>> +LDFLAGS_xe.o := -T $(srctree)/$(src)/xe.lds
>>> +
>>>  obj-$(CONFIG_DRM_XE) += xe.o
>>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe.lds b/drivers/gpu/drm/xe/xe.lds
>>> new file mode 100644
>>> index 000000000000..a2187eab2c8b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe.lds
>>> @@ -0,0 +1,8 @@
>>> +SECTIONS
>>> +{
>>> +    .rodata.__xe_wa_oob	ALIGN(8) : {
>>> +        __start___xe_wa_oob = .;
>>> +        *(__xe_wa_oob)
>>> +        __stop___xe_wa_oob = .;
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index ee71b969bcbf..608ac2a022e8 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -20,6 +20,7 @@
>>>  #include "xe_mmio.h"
>>>  #include "xe_platform_types.h"
>>>  #include "xe_uc_fw.h"
>>> +#include "xe_wa.h"
>>>  #include "xe_wopcm.h"
>>>
>>>  static struct xe_gt *
>>> @@ -134,9 +135,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>  	struct xe_gt *gt = guc_to_gt(guc);
>>>  	u32 flags = 0;
>>>
>>> -	/* Wa_22012773006:gen11,gen12 < XeHP */
>>> -	if (GRAPHICS_VER(xe) >= 11 &&
>>> -	    GRAPHICS_VERx100(xe) < 1250)
>>> +	if (XE_WA("22012773006",
>>> +		  GRAPHICS_VER(xe) >= 11 && GRAPHICS_VERx100(xe) < 1250))
>>>  		flags |= GUC_WA_POLLCS;
>>
>>Now the entry will appear regardless if it was activated.
>
> you mean "appear in the debugfs"? Listing all of them was intentional
> and marking some as "active" would be a future patch on top.
>
> I didn't implement that since I'm really on the fence regard the 2 or 3
> possible approaches and I think it'd be easier
>
> My idea here is basically like was described in the coverletter. During
> init we'd do:
>
> 	idx = 0;
> 	for each wa in oob section {
> 		wa->idx = idx++;
> 	}
>
> Then on the WA side, instead of having XE_WA() just returning the
> condition, it would evaluate the condition and write to
> xe->oob_workarounds.active[wa->idx]. Downside is that WAs would change
> state and only be "active" when executed, which depends on the code
> paths.

I guess it boils down if you want external or internal consistency
checking of what workarounds are implemented and what are active.
So it is not necessary a downside if you have a list of implemented
vs list of active workarounds. it depends on do we want validation
inside or outside a driver?

If there would separate declarations so that the applicability would
be on wa definition (hw_id, rev ranges) and then activation on related
code path on call site, we could verify that particular workaround is at
play. It would then need also to accompany test to trigger the code path
apriori to validity check.

Regardless, for keeping a a definite list of of implemented and accessible
from outside tool (for comparing whats missing) having them in
linker sections looks a neat way to do it.

-Mika

>
> But the alternatives detailed in the cover letter make it a little bit
> different: I think most of the conditions could be executed on init
> rather than where it's called.  For that we'd need to either
>
> a) convert the checks to "normal RTP rules", but without actions
>     since the actions are to be done on the caller side
>
> it may not be to horrible to drop the `if` in th `if (XE_WA(...))` and
> just write it like:
>
> 	XE_WA(xe, name, rtp-rules, action);
>
> and allow "action" to be any statement
>
> b) migrate to the table approach I mentioned, so the callers would
> have:
>
> 	if (XE_WA(xe, name) {
> 		<actions>
> 	}
>
> Lucas De Marchi
>
>>Would it add value to have it only listed if it was activated, or even
>>both: implemented  and activated as separate entries.
>>
>>-Mika
>>
>>>
>>>  	/* Wa_16011759253 */
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>>> index e87f1b280d96..4f7832d074bd 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>>> @@ -101,4 +101,12 @@ struct xe_rtp_entry {
>>>  	u8 flags;
>>>  };
>>>
>>> +/**
>>> + * struct xe_rtp_entry - Entry in a special section, used for "out-of-band"
>>> + *			 definitions
>>> + */
>>> +struct xe_rtp_oob_entry {
>>> +	const char *name;
>>> +};
>>> +
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>> index 100315c03014..26fb91aae014 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> @@ -72,8 +72,8 @@
>>>   *      engine registers are restored in a context restore sequence. This is
>>>   *      currently not used in the driver.
>>>   *
>>> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
>>> - *   central place. Those are peppered around the rest of the code, as needed.
>>> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
>>> + *   a central place. Those are peppered around the rest of the code, as needed.
>>>   *   Workarounds related to the display IP are the main example.
>>>   *
>>>   * .. [1] Technically, some registers are powercontext saved & restored, so they
>>> @@ -92,6 +92,9 @@
>>>  #define _MMIO(x)	_XE_RTP_REG(x)
>>>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>>>
>>> +extern const struct xe_rtp_oob_entry __start___xe_wa_oob[];
>>> +extern const struct xe_rtp_oob_entry __stop___xe_wa_oob[];
>>> +
>>>  __diag_push();
>>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>>
>>> @@ -665,6 +668,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>>  void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>>>  {
>>>  	const struct xe_rtp_entry *entry;
>>> +	const struct xe_rtp_oob_entry *oob_entry;
>>>
>>>  	drm_printf(p, "Workarounds\n");
>>>
>>> @@ -679,4 +683,10 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>>>  	drm_printf(p, "\tLRC\n");
>>>  	for (entry = lrc_was; entry && entry->name; entry++)
>>>  		drm_printf(p, "\t\t%s\n", entry->name);
>>> +
>>> +	drm_printf(p, "\tOOB\n");
>>> +	for (oob_entry = __start___xe_wa_oob;
>>> +	     oob_entry < __stop___xe_wa_oob;
>>> +	     oob_entry++)
>>> +		drm_printf(p, "\t\t%s\n", oob_entry->name);
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>>> index 97d104b7e566..212fc9b4efe6 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.h
>>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>>> @@ -6,6 +6,8 @@
>>>  #ifndef _XE_WA_
>>>  #define _XE_WA_
>>>
>>> +#include "xe_rtp_types.h"
>>> +
>>>  struct drm_printer;
>>>  struct xe_device;
>>>  struct xe_gt;
>>> @@ -19,4 +21,12 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
>>>
>>>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>>>
>>> +#define XE_WA(name__, cond__) ({					\
>>> +	static const struct xe_rtp_oob_entry entry__			\
>>> +	__used __aligned(8) __section("__xe_wa_oob") = {		\
>>> +		.name = name__,						\
>>> +	};								\
>>> +	cond__;								\
>>> +})
>>> +
>>>  #endif
>>> --
>>> 2.39.0
