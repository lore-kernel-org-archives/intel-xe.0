Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F5C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 17:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944B10E64C;
	Fri,  5 May 2023 17:59:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0110E53B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 22:25:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435388801"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="435388801"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 15:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647533308"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="647533308"
Received: from cello.jf.intel.com (HELO [172.16.0.108]) ([10.54.70.64])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 15:25:07 -0700
Message-ID: <d0255e51-3e9b-88dd-91a9-5ab780f56d4b@fastmail.fm>
Date: Thu, 4 May 2023 15:25:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-8-lucas.demarchi@intel.com>
 <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
 <dikz4xlzc6awvlu6rol2slga2nernci2zmhrnsz5qpksgi4br2@locnvrubd734>
 <ffbb8d71931f4aec77b4b148463272d3a6dd9be3.camel@intel.com>
 <jgnnfqsrrh3iqyc3dmdo44kpft4z6s46lyxjqifrivgsfv36bh@hxzqtxlea3ia>
From: Mark Janes <markjanes@fastmail.fm>
In-Reply-To: <jgnnfqsrrh3iqyc3dmdo44kpft4z6s46lyxjqifrivgsfv36bh@hxzqtxlea3ia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 May 2023 17:59:28 +0000
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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
Cc: Dylan Baker <dylan.c.baker@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Mark Janes <markjanes@swizzler.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 5/4/23 14:56, Lucas De Marchi wrote:
> On Thu, May 04, 2023 at 12:37:05PM -0700, Jose Souza wrote:
>> On Thu, 2023-05-04 at 12:30 -0700, Lucas De Marchi wrote:
>>> On Thu, May 04, 2023 at 03:30:48PM +0000, Jose Souza wrote:
>>> > On Thu, 2023-05-04 at 00:32 -0700, Lucas De Marchi wrote:
>>> > > Let xe_guc.c start using XE_WA() for workarounds. One workaround
>>> > > couldn't be converted due to no support for function hook checks.
>>> > >
>>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> > > ---
>>> > >  drivers/gpu/drm/xe/xe_guc.c | 40 
>>> +++++++++++++------------------------
>>> > >  1 file changed, 14 insertions(+), 26 deletions(-)
>>> > >
>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> > > index f7d32b744247..eea5ed015282 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_guc.c
>>> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> > > @@ -19,7 +19,9 @@
>>> > >  #include "xe_guc_submit.h"
>>> > >  #include "xe_mmio.h"
>>> > >  #include "xe_platform_types.h"
>>> > > +#include "xe_rtp.h"
>>> > >  #include "xe_uc_fw.h"
>>> > > +#include "xe_wa.h"
>>> > >  #include "xe_wopcm.h"
>>> > >
>>> > >  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
>>> > > @@ -136,29 +138,22 @@ static u32 guc_ctl_wa_flags(struct xe_guc 
>>> *guc)
>>> > >      struct xe_gt *gt = guc_to_gt(guc);
>>> > >      u32 flags = 0;
>>> > >
>>> > > -    /* Wa_22012773006:gen11,gen12 < XeHP */
>>> > > -    if (GRAPHICS_VER(xe) >= 11 &&
>>> > > -        GRAPHICS_VERx100(xe) < 1250)
>>> > > +    if (XE_WA(xe, "22012773006", GRAPHICS_VERSION_RANGE(1100, 
>>> 1250)))
>>> > >          flags |= GUC_WA_POLLCS;
>>> >
>>> > Just a suggestion but would be better to have the workaround rule 
>>> defined somewhere else and here only have 'if (XE_WA(xe, 
>>> "22012773006"))'.
>>> >
>>> >
>>> > Mesa now has something like that.
>>> > We have a Python script that generates a JSON file with workaround 
>>> data from the workaround database API.
>>> > During build time, another Python script generates the intel_wa.c 
>>> file using the information in JSON, setting a bit for each workaround 
>>> that applies
>>> > to each platform.
>>> > In runtime it get the bit field with the workarounds that applies 
>>> to running platform on given stepping.
>>>
>>> that is one of the alternatives I shared in the RFC. There are
>>> some issues with such approach though:
>>>
>>> 1) The condition is in a totally different place tha have to be checked
>>>     to follow the code flow.
>>>
>>>     The upside is that if the same condition needs to be checked 
>>> again in
>>>     multiple places for these OOB workarounds, the condition doesn't
>>>     need to be repeated
>>>
>>> 2) Not possible to encode conditions that are not platform-centric or
>>> that needs to be decided in runtime (e.g. if an engine is fused off or
>>> not)
>>>
>>> > In code Mesa we have 'if (intel_needs_workaround(devinfo, 
>>> 14015055625))', Xe kmd would probably need additional checks like 'if 
>>> (engine == BLIT &&
>>> > XE_WA(xe, "xxxxxx"))'.
>>>
>>> yeah... that maybe solves the issue (2) above. We'd need to leave the
>>> non-platform checks to each callers. And maybe follow the same pattern
>>> for the gt/engine/lrc workarounds.
>>>
>>> >
>>> > This solve the problem we have were workarounds are left enabled in 
>>> platforms that already have a HW fix for it.
>>>
>>> not sure how that solves this issue though. We mark the stepping in
>>> which the workaround are supposedly fixed.
>>
>> Mesa problems was with permanent workarounds, a example:
>>
>> Some workaround is required by all gen12.0 and dg2 and was implemented 
>> with: 'if (gt_ver >= 12)' but then it was fixed in MTL.
>> It is pretty easy to forget to update it.
> 
> 
> but then the solution is not about where the check is, i.e. in the
> caller vs a centralized place. The solution is to generate the
> version range or platform from the spec.  If we were to move to a
> centralized place without generating that automatically we'd still have
> the same issue.... which goes back to the issue of having code
> generation in the kernel.
> 
>  From a quick look at the mesa impl, what I don't quite understand after
> grepping for intel_needs_workaround() and looking a the .cpp/.h
> generation:  how do you check if the workaround is implemented/active?
> Because 1) you generated a .json from the database, 2) you generated
> the condition to enable the workaround for *all* platforms; 3) Now you
> can't rely anymore on having that definition to decide it's
> implemented/active.  Do you track callers of intel_needs_workaround?
> Something else? This seems a little short based on the size
> of mesa_defs.json. Or is it just because the past platforms weren't
> converted to this new infra?

HSD only provides details for gen11+ workarounds.  Workarounds up to 
gen9 will not use this mechanism.

> git grep -h intel_needs_workaround | sed -n 
> 's/.*intel_needs_workaround(.*,\s*\([0-9]*\)).*/\1/p' | sort -u
> 14010017096
> 14012437816
> 14012688258
> 14014063774
> 14015297576
> 14015360517
> 14015590813
> 14017341140
> 16013063087
> 22012575642
> 22012785325
> 22013689345

Currently, Mesa team is working on refactoring existing workarounds to 
use intel_needs_workaround() instead of checking for the device version. 
  As we do this, we often find that a workaround version check is too 
narrow or too broad, applying inaccurately to some platforms.

Our goal is to apply all workarounds through this mechanism, but the 
implementation is incremental.  That is why the list is short.

I would like to implement an audit of workarounds in mesa, which would 
be accomplished by looking at callers of intel_needs_workaround().  The 
audit is not actionable until all workarounds have been refactored.

> Also Cc'ing here some other  people involved with the mesa impl to check
> if we can improve kernel side.

At the start, I wasn't sure if HSD could be properly parsed to direct 
workarounds in Mesa.  As we refactor existing workarounds, my confidence 
grows that the approach is a significant step forward workaround 
handling.  There are cases where HSD has been wrong, and we have gotten 
clarification and correction from hardware architects in HSD.

One reason for hesitation is the time that it takes to update our 
workaround json file.  A change to the sw_impact table does not update 
the timestamp on the HSD defect.  To ensure that new analysis is 
reflected in the json file, we have to query all details, which takes a 
long time (20+ hrs).  Jose has been helping by adding threading to the 
mechanism.

https://github.com/intel-innersource/drivers.gpu.mesa.workarounds
	
> thanks
> Lucas De Marchi
> 
>>
>>>
>>> >
>>> > Not sure if such think would be acceptable in Linux, just sharing 
>>> what Mesa have done.
>>>
>>> Generating code to be built is done in a few places in the kernel
>>> I already suggested doing that for the register definitions, but
>>> there are always push back.  I will take a look at this again.
>>>
>>> Thanks
>>> Lucas De Marchi
>>>
>>> >
>>> > >
>>> > > -    /* Wa_16011759253 */
>>> > > -    /* Wa_22011383443 */
>>> > > -    if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, 
>>> STEP_A0, STEP_B0))
>>> > > +    if (XE_WA(xe, "16011759253, 22011383443",
>>> > > +          SUBPLATFORM(DG2, G10), STEP(A0, B0)))
>>> > >          flags |= GUC_WA_GAM_CREDITS;
>>> > >
>>> > > -    /* Wa_14014475959 */
>>> > > -    if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
>>> > > -        xe->info.platform == XE_DG2)
>>> > > +    if (XE_WA(xe, "14014475959[mtl]", PLATFORM(METEORLAKE), 
>>> STEP(A0, B0)) ||
>>> > > +        XE_WA(xe, "14014475959[dg2]", PLATFORM(DG2)))
>>> > >          flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>>> > >
>>> > >      /*
>>> > > -     * Wa_14012197797
>>> > > -     * Wa_22011391025
>>> > > -     *
>>> > >       * The same WA bit is used for both and 22011391025 is 
>>> applicable to
>>> > >       * all DG2.
>>> > >       */
>>> > > -    if (xe->info.platform == XE_DG2)
>>> > > +    if (XE_WA(xe, "14012197797, 22011391025", PLATFORM(DG2)))
>>> > >          flags |= GUC_WA_DUAL_QUEUE;
>>> > >
>>> > >      /*
>>> > > @@ -169,27 +164,20 @@ static u32 guc_ctl_wa_flags(struct xe_guc 
>>> *guc)
>>> > >      if (GRAPHICS_VERx100(xe) < 1270)
>>> > >          flags |= GUC_WA_PRE_PARSER;
>>> > >
>>> > > -    /* Wa_16011777198 */
>>> > > -    if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, 
>>> STEP_A0, STEP_C0) ||
>>> > > -        IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, 
>>> STEP_A0,
>>> > > -                STEP_B0))
>>> > > +    if (XE_WA(xe, "16011777198[dg2_g10]", SUBPLATFORM(DG2, G10), 
>>> STEP(A0, C0)) ||
>>> > > +        XE_WA(xe, "16011777198[dg2_g11]", SUBPLATFORM(DG2, G11), 
>>> STEP(A0, B0)))
>>> > >          flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>>> > >
>>> > > -    /*
>>> > > -     * Wa_22012727170
>>> > > -     * Wa_22012727685
>>> > > -     */
>>> > > -    if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, 
>>> STEP_A0, STEP_C0) ||
>>> > > -        IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, 
>>> STEP_A0,
>>> > > -                STEP_FOREVER))
>>> > > +    if (XE_WA(xe, "22012727170, 22012727685 [dg2_g10]", 
>>> SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
>>> > > +        XE_WA(xe, "22012727170, 22012727685 [dg2_g11]", 
>>> SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)))
>>> > >          flags |= GUC_WA_CONTEXT_ISOLATION;
>>> > >
>>> > >      /* Wa_16015675438, Wa_18020744125 */
>>> > > +    /* FIXME: currently there is no support for gt checks in 
>>> XE_WA() */
>>> > >      if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>>> > >          flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>>> > >
>>> > > -    /* Wa_1509372804 */
>>> > > -    if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
>>> > > +    if (XE_WA(xe, "1509372804", PLATFORM(PVC), STEP(B0, C0)))
>>> > >          flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>> > >
>>> > >      return flags;
>>> >
>>
