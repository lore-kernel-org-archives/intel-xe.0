Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EDFC982E0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 15:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142410F1E3;
	Fri, 18 Sep 2026 15:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3n8vnGk";
	dkim-atps=neutral
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com
 [74.125.228.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CC910F066
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 18:51:09 +0000 (UTC)
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c294af0caa8so197740766b.1
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 11:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789671067; cv=none;
 d=google.com; s=arc-20260327;
 b=CAUgvPWCfoyXbQNPmBMBhX37gVaJtU6mOLosuWug1n51Mcnw0qk4mukwmIOBzjWgsU
 dX2toQ6BMKabRRePSVuwbdO7yW6kPGDWZGYTxXHEW6yawlZawYshQDa54pPF2IyeG0Il
 +1kxcdkJ2KQp56aGypBZDCCuWseOZCazlP1YhQeepFNIeJPjVjARgT5nfVJatg/CQYM3
 F2T3fBGGxygEMrbrSTVc1bgKX5HYXzlWVz+LgZ2EU5ANDY3OMtEJJBW6HkC9TECEgqrY
 FtP3gcva1lR8ZXTkwbN+I76JzXAFx9wo6mZBLTR2KMNNeAuGrkT6wMVM/pPaU2E85NcU
 Jhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
 fh=DYFHwHuYVJxQ2SbT/gaYXBOlnK5C40gb4KOUIl/PAlQ=;
 b=ULGcGftCtu59B7sS62/eVw0vHzxywQS+mVz2ZjLnvLa8dXdMCQ461CRla/tUhGUB2l
 6lXN69IYTbU0l/PMD8hReexqLhSwgE1oPK84cR8TvmEXNK23iUAO5husq4q3NbMSkGaO
 R0HSWtjuy4OABoCR8X8sAoOqlnazl/920dfeew99+8wCPlnH3sfvjgI6HTToOpGb46tv
 /cFc/um8dBHNYQFKrUhdvgXLEaF49QIxwAo7VY8UQSWZywrc6QEcbFYeomCGblZuXX8A
 qlEHl1cQ9aBvFxeIf1QimhtrYcxOrZPBCmz7nkW3pH0N6/xHrqL0rrGcYEhatN18Wf5C
 hhBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789671067; x=1790275867; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
 b=T3n8vnGkciLzjDfHJITqjQfo7Few/yb7PqqlQ40h6DjOBNhJlKSrClL9YwRSzmR6Qt
 AjuPbmtl28QET5+6EM2A7/VYeqdrZmAbEDwtfAxeoZfBzrnjo9bRM4ifYR6uz2iPPGVF
 7lOfHdESiWP88+EXgD7tUvWFsepSjH5lIKCDeWQq6bFtkt00+UkjXUlTbH7WNNXZaV6x
 AIk0Q4STZi4KIbuqQ9y2ER2NTnGqYyTs6x+Lnx4Z3BrR+yWhvlV1+3VMOHBn5cOJ6Wnu
 oQDHce+aYoAS37iZ7dld7YKyNQN3tzD43/TozcjCWn4Q/THbki7CqdeL2lBeGsDZqfmI
 J7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789671067; x=1790275867;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
 b=GIk6udoPYh2NSWEEFFElOzpLpJKyuo8CsfDvV8KPAwvrRz/glrE3kRUa21VyOQkVDY
 Cm6072Crcs2OBO7Y56I2RZOAaYleAbpUqkOF/6QgSiU/kc78yPzv7vwuDkVvp0AGJ1eK
 DAVN4Tb2WXb7Si5HO/T6TrKhlZJZKwFVlezYC9oDx+wf3eozNW7XCkm36voyHrEmWrsG
 asQRATsoBXaQjf4zsW6bvhwu49CSYIVHgHLQzes8zzwQRVwmiqRnmJujyhCLaGpD+Uhj
 aumWFRB+D158T2t3leNTV7fUH7j5MQpaL738hHVRRabkyyVj9OyeOGopPU8bPMoqnXEs
 gs6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdO2X+lzFNsHC4GA6Wtrptp2iLY4jFvE8j8P1juy6pqLAY4RXYBZVjJI3X3wGunWwHuFMHEer0pg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nErpt3elABOdiY401QqfvZQFCXsKKAovp7yze6dYnJsFtt6y3J
 dwnPWYiMss6ywzgEHOvGaNtzyJ+2OkYT5VTK5S/UFh6LezRhBUgDJRgnjAT/o8IMGaGWkGRcOFQ
 tawL1xRrLY5PzmUT7YhkxTJUtYCrZhEQRyqD01dEN+A==
X-Gm-Gg: AYBFou2r5DIvcJg63GU2qEIjNlpb7/xYBk3zc9QJLKHEzrAAJcwLUgyeM5J3aPKS0YF
 bp6FZRupEC12NQj7JztiU0hXouAkGF0CUZCSSOwsWgT8KThjjI0j8iohVF/3X0lrnb/YYSTlmwL
 fNv7BwlGHSSX1xnNnVhs+Omm1ZXFREGTQcJYl472Mu0+4OT2syykIzUi9WLmT9WuSadWzfgfGVj
 Yl3/KRT/Qk81BacLnRPmxyqT+lk3n2sffef078qI486ZWafNIBna2+ghszWfs8jKw5pxftRaPjW
 /iGmKq8gc0l7d1mFnNR5AtpPz+Oj25KVSy94IerW6RGmV2DlNMsk0g==
X-Received: by 2002:a17:907:6d06:b0:c29:3a1b:ec8e with SMTP id
 a640c23a62f3a-c2a1569b034mr13494966b.3.1789671067393; Thu, 17 Sep 2026
 11:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260912091805.531666-1-andersen.theo@gmail.com>
 <c7215b173c533cd697d8eb37b56c2a1890ea7c41@intel.com>
In-Reply-To: <c7215b173c533cd697d8eb37b56c2a1890ea7c41@intel.com>
From: Theo Andersen Carton <andersen.theo@gmail.com>
Date: Thu, 17 Sep 2026 20:50:56 +0200
X-Gm-Features: AcwNN1WHuc8o-nFGlfzO4INLAjuamK1x7axEj4QEzHLMTpq90hpTZl6XJiyGKjA
Message-ID: <CANFnrsrR-benwg2i=mGs1RywuwcxkFE9Pzw8O7kGRQnNyit-tw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/ddi: add DDI A force 4 lanes quirk for Apple
 MacBookPro11, 5
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, 
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 18 Sep 2026 15:27:49 +0000
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

> I'm guessing this is v2 of [1], but I shouldn't have to guess.

You're right, it is effectively v2 of [1] -- same patch, no functional
change. Sorry for not labelling it.

[1] was pasted into a mail client by hand, which hard-wrapped the
"diff --git" lines and turned the leading tabs into spaces. It did reach
the lists, but not as an applicable patch, so I resent it with
git send-email and didn't think of it as a revision. I'll use proper vN
and changelogs from here on.

> Is there a bug report about this? Would be nice to see the logs in the
> failing case. See [2].

There wasn't one -- I went straight to the list. Filed now:

  https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17087

It has the full failing-case log with drm debug enabled, on an unpatched
i915 with the panel muxed to the iGPU. AUX and EDID are fine, and then the
panel's only mode is pruned:

  [drm:intel_dp_print_rates] sink rates: 162000, 270000
  [drm:update_display_info] [CONNECTOR:93:eDP-1] Assigning EDID-1.4
digital sink color depth as 8 bpc.
  [drm:drm_mode_prune_invalid] Rejected mode: "2880x1800": 60 337750
2880 2928 2960 3040 1800 1803 1809 1852 0x48 0x9 (CLOCK_HIGH)

because intel_ddi_max_lanes() reports a source maximum of 2 for port A.
The matching log with the quirk applied is attached too, where the same
link trains at lane count 4.

> i915_vbt from debugfs would also be interesting.

Attached to the bug as i915_vbt.bin, 6144 bytes -- a $VBT HASWELL block,
BIOS build 1215 dated 12/13/2012, on Apple firmware 427.140.8.0.0. Say the
word if you'd rather have a specific block dumped inline.

> The patch itself looks sane.

Thanks. One thing I got wrong in the commit message, which v3 fixes: I
wrote Broadwell, but the machine is Haswell Crystal Well -- i7-4980HQ,
8086:0d26, $VBT HASWELL, and i915 logs "Found haswell". Apple's ACPI DMAR
OEM string says BDW, which is what misled me. No code change; the quirk
matches on DMI model either way.

I'll send it as v3 rather than v2, to match the numbering you used
above -- neither earlier posting was labelled, and renumbering them now
would just recreate the ambiguity. It has that fix, a Closes: tag for the
bug, and a changelog spelling out what v1 and v2 were.

BR,
Theo
