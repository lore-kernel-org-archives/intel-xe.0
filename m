Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998B3C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 17:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1A310E0CC;
	Fri,  7 Mar 2025 17:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oE/oBBWm";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B31C10E0CC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=waq04n/sP19TadGMc9ORUFhREO1Rk+TbY/ipV51W5Ew=; b=oE/oBBWmEd5Nhl1f9U+ciS7/f6
 nGI//StqL9HAr9+H8+JynLW00mBoC1caa+SfIoDp5JsfCSfMghVrdaZmfBA6/kkNmx5M+YVGdMAkW
 JAhtn4K1UJrP0cjHZBUfgNNMR9RK/oiuBvJ1nQwpYhtLxILyXMDGTaB9/fLjbgeLzAPhvbxim/OmI
 ft3zGRmy+tZfBsqH2uTdH7yA/BU42oyJYPEJZEtYFOax1EzoQ75WpCjs77LjBmb88lomjRNnXI1rp
 hPMLZsK8vvUEt1vfyI9A399D1G9wJUfdamuLeHLur1UdMqmsPMPsRiwHr7tgN03wEa/LO3irFuqdG
 eI6P8I6g==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tqb3T-005RTL-8w; Fri, 07 Mar 2025 18:00:17 +0100
Message-ID: <7c720d6e-c177-4c31-822d-7e9acfe81da9@igalia.com>
Date: Fri, 7 Mar 2025 17:00:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/rtp: Drop sentinels from arg to
 xe_rtp_process_to_sr()
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
 <20250306-fix-print-warning-v1-1-979c3dc03c0d@intel.com>
 <6111972f-8b3d-4b3b-b27f-83241af9b5e7@igalia.com>
 <377u65lxwxlzdxr5anzpn3ykk3bud3vyikpy3l6qnxboltoxyn@xeaiizgnyl3q>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <377u65lxwxlzdxr5anzpn3ykk3bud3vyikpy3l6qnxboltoxyn@xeaiizgnyl3q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 07/03/2025 15:57, Lucas De Marchi wrote:
> On Fri, Mar 07, 2025 at 12:00:14PM +0000, Tvrtko Ursulin wrote:
>>
>> On 07/03/2025 04:00, Lucas De Marchi wrote:
>>> There's a mismatch on API: while xe_rtp_process_to_sr() processes
>>> entries until an entry without name, the active tracking with
>>> xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
>>> elements. The number of elements is taken everywhere using ARRAY_SIZE(),
>>> but that will have one entry too many. This leads to the following
>>> warning, as reported by lkp:
>>>
>>>    drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>>>>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is 
>>>>> null [-Wformat-overflow=]
>>>      228 |         drm_printf((printer), "%.*s" fmt, (indent), 
>>> "\t\t\t\t\tX", ##__VA_ARGS__)
>>>          |                               ^~~~~~
>>>    drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 
>>> 'drm_printf_indent'
>>>      226 |                 drm_printf_indent(p, 1, "%s\n", 
>>> engine_tunings[idx].name);
>>>          |                 ^~~~~~~~~~~~~~~~~
>>>
>>> That's because it will still process the last entry when tracking the
>>> active tunings. The same issue exists in the WAs. Change
>>> xe_rtp_process_to_sr() to also take the number of elements so the empty
>>> entry can be removed and the warning should go away. Fixing on the
>>> active-tracking side would more fragile as the it would need a `- 1`
>>> everywhere and continue to use a different approach for number of
>>> elements.
>>
>> Patch looks fine, and dropping the terminators is good. But I can't 
>> say I understand the warning. How it will process the last entry if 
>> entry->name is NULL? Hence bitmap will not have the bit set, hence the 
>> dump cannot iterate over it. I must be missing something, I wanted to 
>> say obvious, but I hope it really isn't. :))
> 
> yeah... I could reproduce it only with the compiler provided by 0day,
> for microblaze arch. Even the same gcc version for x86 didn't reproduce
> it.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Aside from the warning, it's a non-issue as there would always be enough
>>> bits allocated and the last entry would never be active since
>>> xe_rtp_process_to_sr() stops on the sentinel.
> 
> ^ this paragraph tries to explain why it's harmless, which made me not
> even add a Fixes trailer. Indeed xe_rtp_process_to_sr() will never
> process it, hence the bit will never be set. The I can see is that later
> when we are dumping, we are using for_each_bit_set(), passing as max the
> bit related to the empty entry. So maybe there's a diff in bitops for
> that arch that makes the compiler **think** the last element could be
> accessed. The alternative fix I started was to pass `ARRAY_SIZE(...) - 1`
> in the for_each_bit_set(). But that looked ugly.
> 
> Note that it's a build time warning - if that really happens in runtime
> there's probably something terribly broken with that arch.

Hah.. go figure.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> 
> Lucas De Marchi
> 
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK- 
>>> lkp@intel.com/
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>>>  drivers/gpu/drm/xe/xe_hw_engine.c      |  6 ++----
>>>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
>>>  drivers/gpu/drm/xe/xe_rtp.c            |  6 +++++-
>>>  drivers/gpu/drm/xe/xe_rtp.h            |  2 +-
>>>  drivers/gpu/drm/xe/xe_tuning.c         | 12 ++++--------
>>>  drivers/gpu/drm/xe/xe_wa.c             | 12 +++---------
>>>  7 files changed, 18 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/ 
>>> drm/xe/tests/xe_rtp_test.c
>>> index 
>>> 36a3b5420fef6a1977a04d169d4946f75ee523c4..b0254b014fe45013aa0c5b3fbbe7a58fe8584a31 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> @@ -320,7 +320,7 @@ static void xe_rtp_process_to_sr_tests(struct 
>>> kunit *test)
>>>          count_rtp_entries++;
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, 
>>> count_rtp_entries);
>>> -    xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries, 
>>> reg_sr);
>>>      xa_for_each(&reg_sr->xa, idx, sre) {
>>>          if (idx == param->expected_reg.addr)
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/ 
>>> xe_hw_engine.c
>>> index 
>>> fc447751fe786c0035d888047a856780a572e526..223b95de388cb8919a7d1ab52e1305be990672ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -400,10 +400,9 @@ xe_hw_engine_setup_default_lrc_state(struct 
>>> xe_hw_engine *hwe)
>>>                         PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>>>            XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>>>          },
>>> -        {}
>>>      };
>>> -    xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
>>> +    xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), 
>>> &hwe->reg_lrc);
>>>  }
>>>  static void
>>> @@ -459,10 +458,9 @@ hw_engine_setup_default_state(struct 
>>> xe_hw_engine *hwe)
>>>            XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>>>                       XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>>          },
>>> -        {}
>>>      };
>>> -    xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, engine_entries, 
>>> ARRAY_SIZE(engine_entries), &hwe->reg_sr);
>>>  }
>>>  static const struct engine_info *find_engine_info(enum 
>>> xe_engine_class class, int instance)
>>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/ 
>>> xe/xe_reg_whitelist.c
>>> index 
>>> edab5d4e3ba5e7708565f8bc51df50c0b4a46f39..23f6c81d99946f97413e411289116aaa10365f3f 100644
>>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>> @@ -88,7 +88,6 @@ static const struct xe_rtp_entry_sr 
>>> register_whitelist[] = {
>>>                     RING_FORCE_TO_NONPRIV_ACCESS_RD |
>>>                     RING_FORCE_TO_NONPRIV_RANGE_4))
>>>      },
>>> -    {}
>>>  };
>>>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>> @@ -137,7 +136,8 @@ void xe_reg_whitelist_process_engine(struct 
>>> xe_hw_engine *hwe)
>>>  {
>>>      struct xe_rtp_process_ctx ctx = 
>>> XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>> -    xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe- 
>>> >reg_whitelist);
>>> +    xe_rtp_process_to_sr(&ctx, register_whitelist, 
>>> ARRAY_SIZE(register_whitelist),
>>> +                 &hwe->reg_whitelist);
>>>      whitelist_apply_to_hwe(hwe);
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>> index 
>>> 7a1c78fdfc92ee9a7e8862c2a65ce99b1f2a5ff1..13bb62d3e615e89d1e996692732b1859561ac55e 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>>> @@ -237,6 +237,7 @@ static void rtp_mark_active(struct xe_device *xe,
>>>   *                        the save-restore argument.
>>>   * @ctx: The context for processing the table, with one of device, 
>>> gt or hwe
>>>   * @entries: Table with RTP definitions
>>> + * @n_entries: Number of entries to process, usually 
>>> ARRAY_SIZE(entries)
>>>   * @sr: Save-restore struct where matching rules execute the action. 
>>> This can be
>>>   *      viewed as the "coalesced view" of multiple the tables. The 
>>> bits for each
>>>   *      register set are expected not to collide with previously 
>>> added entries
>>> @@ -247,6 +248,7 @@ static void rtp_mark_active(struct xe_device *xe,
>>>   */
>>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>>                const struct xe_rtp_entry_sr *entries,
>>> +              size_t n_entries,
>>>                struct xe_reg_sr *sr)
>>>  {
>>>      const struct xe_rtp_entry_sr *entry;
>>> @@ -259,7 +261,9 @@ void xe_rtp_process_to_sr(struct 
>>> xe_rtp_process_ctx *ctx,
>>>      if (IS_SRIOV_VF(xe))
>>>          return;
>>> -    for (entry = entries; entry && entry->name; entry++) {
>>> +    xe_assert(xe, entries);
>>> +
>>> +    for (entry = entries; entry - entries < n_entries; entry++) {
>>>          bool match = false;
>>>          if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>> index 
>>> 38b9f13bba5e54f9c6e863bb578c00fce7a8c452..4fe736a11c42b954c2256fa21a49b0c2e39901e2 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>>> @@ -430,7 +430,7 @@ void 
>>> xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx 
>>> *ctx,
>>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>>                const struct xe_rtp_entry_sr *entries,
>>> -              struct xe_reg_sr *sr);
>>> +              size_t n_entries, struct xe_reg_sr *sr);
>>>  void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>>>              const struct xe_rtp_entry *entries);
>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/ 
>>> xe_tuning.c
>>> index 
>>> 77bc958f5a42cd017d3c363825dfd05cd73f872e..49ddbda7cdef66da49469b687b2296cc2d00b283 100644
>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>> @@ -85,8 +85,6 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>        XE_RTP_RULES(MEDIA_VERSION(2000)),
>>>        XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
>>>      },
>>> -
>>> -    {}
>>>  };
>>>  static const struct xe_rtp_entry_sr engine_tunings[] = {
>>> @@ -100,7 +98,6 @@ static const struct xe_rtp_entry_sr 
>>> engine_tunings[] = {
>>>                 ENGINE_CLASS(RENDER)),
>>>        XE_RTP_ACTIONS(SET(SAMPLER_MODE, 
>>> INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>>>      },
>>> -    {}
>>>  };
>>>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
>>> @@ -138,8 +135,6 @@ static const struct xe_rtp_entry_sr lrc_tunings[] 
>>> = {
>>>        XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>>>                     REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
>>>      },
>>> -
>>> -    {}
>>>  };
>>>  /**
>>> @@ -180,7 +175,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>>                            gt->tuning_active.gt,
>>>                            ARRAY_SIZE(gt_tunings));
>>> -    xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings), 
>>> &gt->reg_sr);
>>>  }
>>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>>> @@ -191,7 +186,8 @@ void xe_tuning_process_engine(struct xe_hw_engine 
>>> *hwe)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>>                            hwe->gt->tuning_active.engine,
>>>                            ARRAY_SIZE(engine_tunings));
>>> -    xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, engine_tunings, 
>>> ARRAY_SIZE(engine_tunings),
>>> +                 &hwe->reg_sr);
>>>  }
>>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
>>> @@ -210,7 +206,7 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>>                            hwe->gt->tuning_active.lrc,
>>>                            ARRAY_SIZE(lrc_tunings));
>>> -    xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
>>> +    xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), 
>>> &hwe->reg_lrc);
>>>  }
>>>  void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>> index 
>>> 55eb453f4b1fb39d4127609a28e4a5ebe9b5a051..a25afb757f7088c7f831867717b42982e9ea754c 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> @@ -279,8 +279,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>>>        XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
>>>        XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>>>      },
>>> -
>>> -    {}
>>>  };
>>>  static const struct xe_rtp_entry_sr engine_was[] = {
>>> @@ -624,8 +622,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>>                 FUNC(xe_rtp_match_first_render_or_compute)),
>>>        XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>>>      },
>>> -
>>> -    {}
>>>  };
>>>  static const struct xe_rtp_entry_sr lrc_was[] = {
>>> @@ -825,8 +821,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>>                   DIS_PARTIAL_AUTOSTRIP |
>>>                   DIS_AUTOSTRIP))
>>>      },
>>> -
>>> -    {}
>>>  };
>>>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>>> @@ -868,7 +862,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
>>>                            ARRAY_SIZE(gt_was));
>>> -    xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt- 
>>> >reg_sr);
>>>  }
>>>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>>> @@ -886,7 +880,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt- 
>>> >wa_active.engine,
>>>                            ARRAY_SIZE(engine_was));
>>> -    xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>>> +    xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), 
>>> &hwe->reg_sr);
>>>  }
>>>  /**
>>> @@ -903,7 +897,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>>      xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt- 
>>> >wa_active.lrc,
>>>                            ARRAY_SIZE(lrc_was));
>>> -    xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>>> +    xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe- 
>>> >reg_lrc);
>>>  }
>>>  /**
>>>
>>> ---
>>> base-commit: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
>>> change-id: 20250306-fix-print-warning-43d20fc31309
>>>
>>> Best regards,
>>

