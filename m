Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E6C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 16:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26D10E52A;
	Tue, 14 May 2024 16:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUFwFX+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAA310E52A
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715702521; x=1747238521;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vxYzMCToy+vid4K+5zrGTfjUJtNt4LDuSKFysdc175g=;
 b=cUFwFX+swUJc6BQ7Sy9641VQ7r0uhwUDfdtc/RhLq+v2N78CHRJgsap/
 toNEM1VP17ETb8iPG1TzF7kG/THhZGAVnCM5NcfuC+US6D6lk2AJPsd9E
 qFXFU5cxCDw3d+A3oBukx9dFYdHhUyw1VuuXI5scO+phtdMhF6bn9jUQX
 TAJwC0I900Gq/kmm87EYvUtzxPj8FwgottOobSpplb59xJuBaPKTY9VeF
 o/svCwrTG68TLDAL2LidNvETBO2JUeSFai4QOPeBiwuK43+hAsjwe66Vk
 1POf4r186pGbKtv+1OO6VqUvdGARer4QECs5Nr+7Wc3IN12o1j9EXu049 Q==;
X-CSE-ConnectionGUID: bVZCnj2LTB2sa5tgorOZ5Q==
X-CSE-MsgGUID: shC9ko6MSM2mrHAB/X2Few==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15532199"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15532199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 09:02:00 -0700
X-CSE-ConnectionGUID: +DJjimuZQtiP6w+OkKZNfg==
X-CSE-MsgGUID: hySjxi3LQ4q1p4lNENUziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="53952524"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 14 May 2024 09:01:58 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C6ACF28778;
 Tue, 14 May 2024 17:01:56 +0100 (IST)
Message-ID: <b978eca4-d69f-4d67-b3f2-34ccfbd1b506@intel.com>
Date: Tue, 14 May 2024 18:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240508224927.11341-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 09.05.2024 00:49, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a debug mechanism for dumping the GuC log as an ASCII hex
> stream via dmesg. This is extremely useful for situations where it is
> not possibe to query the log from debugfs (self tests, bugs that cause
> the driver to fail to load, system hangs, etc.). However, dumping via
> dmesg is not the most reliable. The dmesg buffer is limited in size,
> can be rate limited and a simple hex stream is hard to parse by tools.
> 
> So add extra information to the dump to make it more robust and
> parsable. This includes adding start and end tags to delimit the dump,
> using longer lines to reduce the per line overhead, adding a rolling
> count to check for missing lines and interleaved concurrent dumps and
> adding other important information such as the GuC version number and
> timestamp offset.
> 
> v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
> v3: Add firmware filename and 'wanted' version number.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_log.c       | 85 ++++++++++++++++++++++-----
>  2 files changed, 71 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 11682e675e0f..45fb3707fabe 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -82,6 +82,7 @@
>  #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>  #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>  #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a37ee3419428..7e7e2fdc9a11 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -7,11 +7,19 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +static struct xe_guc *
> +log_to_guc(struct xe_guc_log *log)
> +{
> +	return container_of(log, struct xe_guc, log);
> +}
> +
>  static struct xe_gt *
>  log_to_gt(struct xe_guc_log *log)

as you have log_to_guc() then this log_to_gt() could be updated to:

	return guc_to_gt(log_to_guc(log));

>  {
> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>  		CAPTURE_BUFFER_SIZE;
>  }
>  
> +#define BYTES_PER_WORD		sizeof(u32)
> +#define WORDS_PER_DUMP		8
> +#define DUMPS_PER_LINE		4
> +#define LINES_PER_READ		4
> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
> +

as you are heavily updating this function, maybe it's good time to add
kernel-doc for it ?

>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
> +	static int g_count;


> +	struct xe_gt *gt = log_to_gt(log);
> +	struct xe_guc *guc = log_to_guc(log);
> +	struct xe_uc_fw_version *ver_f = &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>  	struct xe_device *xe = log_to_xe(log);
>  	size_t size;
> -	int i, j;
> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
> +	int l_count = g_count++;
> +	int line = 0;
> +	int i, j, k;
> +	u64 ktime;
> +	u32 stamp;
>  
>  	xe_assert(xe, log->bo);
>  
>  	size = log->bo->size;
>  
> -#define DW_PER_READ		128
> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
> -		u32 read[DW_PER_READ];
> -
> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
> -				   DW_PER_READ * sizeof(u32));
> -#define DW_PER_PRINT		4
> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
> -			u32 *print = read + j * DW_PER_PRINT;
> -
> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> -				   *(print + 0), *(print + 1),
> -				   *(print + 2), *(print + 3));
> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
> +		   l_count, line++, __builtin_return_address(0));

this function is also used in debugfs outputs and prefixing all lines
with "[Capture/n.m]" is pointless there (and will also make collecting
GuC log over debugfs even more inefficient)

and as you likely don't want to have separate print functions (one for
reliable dmesg, other for debugfs) then maybe consider use of cascaded
drm_printer as proposed in [1] - it will also make your code tidier

[1] https://patchwork.freedesktop.org/series/133613/

> +
> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted %u.%u.%u)\n",
> +		   l_count, line++,
> +		   ver_f->major, ver_f->minor, ver_f->patch,
> +		   ver_w->major, ver_w->minor, ver_w->patch);

hmm, what's the relation between "wanted version" and actual "guc log
buffer format" ? IMO it doesn't really matter what driver wanted to
load, this supposed to be "GuC-log-print" so then only actually running
version matters as it implies schema version needed for proper decoding.

> +	drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, line++, guc->fw.path);

again, why do we want include firmware filename here? it's not relevant
to the log buffer content/format (as we already have 'found version')

maybe more interesting thing would be status of the GuC firmware?
whether it is still running and writing logs or it is already dead

> +
> +	ktime = ktime_get_boottime_ns();
> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
> +		   l_count, line++, ktime, ktime);
> +
> +	stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
> +		   l_count, line++, stamp, stamp);
> +
> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
> +		   l_count, line++, gt->info.reference_clock);
> +
> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
> +		u32 read[WORDS_PER_READ];
> +
> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
> +				   WORDS_PER_READ * BYTES_PER_WORD);
> +
> +		for (j = 0; j < WORDS_PER_READ; ) {
> +			u32 done = 0;
> +
> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
> +				line_buff[done++] = ' ';
> +				done += hex_dump_to_buffer(read + j,
> +							   sizeof(*read) * (WORDS_PER_READ - j),
> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
> +							   BYTES_PER_WORD,
> +							   line_buff + done,
> +							   sizeof(line_buff) - done,
> +							   false);
> +				j += WORDS_PER_DUMP;
> +			}

as there could be many holes (zeros) in full GuC log, did you consider
to skip such lines and update custom parser to understand that?

> +
> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>  		}
>  	}
> +
> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>  }

per BKM shouldn't we #undef not used any more local macros ?

>  
>  int xe_guc_log_init(struct xe_guc_log *log)
