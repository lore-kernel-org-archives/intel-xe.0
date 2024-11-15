Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD5FD6DDD7
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B753510E230;
	Fri, 15 Nov 2024 07:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOnzzEk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2095C10E230
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731654406; x=1763190406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1dYS6AKmR4JtRaGQbdB4l8IkY4hNpMkfuqhvEYW/5L8=;
 b=hOnzzEk0XwQdC916Uy2uMtFHoCkgih+n8HudyXh6GVqxH3O58XmbitaJ
 DT6y86RPUuuniLx3tqObd4A0+uYzGU3TkBuE5Fse29cDtt3NfWtBk9mU5
 1g4HoSqWPVJkUuXETzInlx1cawszLYAwECkgO9VfTWz486AwQXllmJg5q
 F/dIHk92MnVGQtIcTWw2xiPXkW0w7Pq61qI3sASCaky12HBzG7y2fxRKm
 0ZHSnvXKarDTICzJ5VHAj6BlvgNU45zU1r1nudwCvFYNZqZrdZc9hz9+x
 +ACuhM3WSkTujwpETef2qV9i0ZPWRpj6PH9QBUeOP88VpY4vWoOq9oQop g==;
X-CSE-ConnectionGUID: S0mMsRH1QAuhp9NIn+t/QA==
X-CSE-MsgGUID: 3mlbvtzdRWeajqF78yZ/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31782656"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31782656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:31:02 -0800
X-CSE-ConnectionGUID: IhyolzzaT9uGgfy58EWhDg==
X-CSE-MsgGUID: 6E/moq26S96GIK9r7JFkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="93195992"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.90])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:30:56 -0800
Date: Thu, 14 Nov 2024 18:30:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com, niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, john.c.harrison@intel.com
Subject: Re: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Message-ID: <la7edkqhnhjs2vuy7eihivskiqwbqtm3tpnu4alyreqgi5lwn4@chzwysy5jiri>
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241101222350.108367-1-jonathan.cavitt@intel.com>
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

On Fri, Nov 01, 2024 at 10:23:50PM +0000, Jonathan Cavitt wrote:
>When performing a guc_mmio_regset_write, we add all the registers in the
>reg_sr list to the save/restore list, but do not do the same for the
>nonpriv registers.  Add them in.
>
>v2:
>- Add all NONPRIV registers to avoid undefined behavior (Harrison)
>- s/whitelist/nonpriv
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>CC: Lucas de Marchi <lucas.demarchi@intel.com>
>CC: Matt Roper <matthew.d.roper@intel.com>
>CC: John Harrison <john.c.harrison@intel.com>
>CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 943146e5b460..b0afb89d9d90 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> 			count++;
>
>+	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
>+
> 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>
> 	if (XE_WA(gt, 1607983814))
>@@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
> 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>
>+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>+		guc_mmio_regset_write_one(ads, regset_map,
>+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>+					  count++);

I guess this fixes the issue. I'm still wondering why we are changing it
in the ads though.

Ideally we'd do:

a) switch the order in hw_engine_init() so it does:

	xe_reg_sr_apply_whitelist(hwe);
	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);

b) change xe_reg_sr_apply_whitelist() so instead of writting the
    mmio slots by itself, it writes them to hwe->reg_sr


I **think** it would also work and stop handling the nonpriv slots as
snow flakes. They would also show up in debugfs/.../register-save-restore
file.

Can you give it a try?  If it doesn't work, feel free to
add my

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and we can try to polish it later.

thanks
Lucas De Marchi

>+
> 	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
> 		if (e->skip)
> 			continue;
>-- 
>2.43.0
>
