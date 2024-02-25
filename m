Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E62DC47DD9
	for <intel-xe@archiver.kernel.org>; Sun, 25 Feb 2024 11:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694110E2EA;
	Sun, 25 Feb 2024 11:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="vwEkFP0q";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E5310E2EA
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Feb 2024 11:07:30 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1708859234; bh=5NJ+DQldD6BpaWVhxHAhejYgXDbVm8MtCFFvrItfUOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vwEkFP0qSpl1H1PZPYm4TXgknLMAwlASwMUOsbTiUjdifIl0vSlaD6kfVnB7TPl4T
 OvFzLhdlpoyF96IPjLuHH34y0aSJ5g5KPN5ROGQasH+8jxI5uHql4lp3rXehjk9wEZ
 Gqw9qko1H2LqvFk0Rvw8FN2YELJT+0DpupVw9f/mcb//iPBktMjC3RJEMHJD1mjl0l
 qS9owFgBLwMCkm3hGIl/zaJg3TL79Ui65YEkV6Uit+Rg7dGKcavaWRKsmjlwQv18EO
 nJR0lokaCwVwTa4N2IETq2SCQea+LQI6JKaFK06vNykn/5qbj1LlmyAum9648HUyPq
 4otn2RLzcZmEA==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 41PB78Ba2077543; Sun, 25 Feb 2024 13:07:08 +0200
Date: Sun, 25 Feb 2024 13:07:08 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, ogabbay@kernel.org, obitton@habana.ai
Subject: Re: [PATCH v2] drm/xe: replace 'grouped target' in Makefile with
 pattern rule
Message-ID: <5h4x7ssbrvxklvpqm5cedhtl44so4inctmytly4ttlv5m5wjys@c2zki3kp4jbv>
References: <20240221095556.1635644-1-dhirschfeld@habana.ai>
 <oq6jinj6fobwbqtoe5mhq3uebcqim7rc6u37tvj27j4oaqjmfk@5wzgbsobqtiz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <oq6jinj6fobwbqtoe5mhq3uebcqim7rc6u37tvj27j4oaqjmfk@5wzgbsobqtiz>
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

On 21.02.2024 23:49, Lucas De Marchi wrote:
>On Wed, Feb 21, 2024 at 11:55:56AM +0200, Dafna Hirschfeld wrote:
>>Since 'grouped target' is used only in 'make' 4.3, it should
>>be avoided. Replace it with 'multi-target pattern rule' which
>>has the same behavior.
>>
>>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>---
>>v2 changes: instead of removing 'grouped target' we replace it with pattern-rule
>>here is v1: https://lore.kernel.org/intel-xe/20240219135845.1463992-1-dhirschfeld@habana.ai/
>>
>>drivers/gpu/drm/xe/Makefile | 2 +-
>>1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index c531210695db..64903841fbd4 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>>quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>      cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
>>
>>-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>>+$(obj)/generated/%.c $(obj)/generated/%.h:  $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>
>that means we can only ever have generated files for xe_wa_oob and
>nothing else (or we would have to change this line too.
>
>did you see any issue with the line I suggested?

I checked your suggestion:
"
%/generated/xe_wa_oob.c %/generated/xe_wa_oob.h: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
"
which works as well. But the doc says "Always use $(obj) when referring to generated files."

https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#custom-rules

So I think we rather keep it.

thanks,
Dafna


>
>Lucas De Marchi
>
>>	$(call cmd,wa_oob)
>>
>>uses_generated_oob := \
>>-- 
>>2.34.1
>>
