Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B5CCF2C9
	for <intel-xe@archiver.kernel.org>; Sun, 18 Oct 2026 19:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6609891D9;
	Sun, 18 Oct 2026 19:26:51 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1DB10E2B9
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 19:26:45 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-35ef6b49813so2778980eec.0
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792351605; x=1792956405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=abSNPbr4DYdK0qk4yDwxN88lTWnE55zJDXdIxaDoNCE=;
 b=OKPukWGfW0+9rNBnUZw5OCQ36AEwjo+ssn9SoMAnHxxH42qvS1k4vrt+WkCT7svTRL
 IwvIAv41VsHViQN+xiMV8GZQlkfe/ieAdTfUVl1lORsSiOFySJn7EiNmtQwBRZwa2Qgx
 8u+L5CuRcT7JZLa/ma9E76uor9gtez1X4eawFqLBQGzHELrW/WSwO+xsqJtt4Uv00HaE
 1K7bslVZBD9jKetVPPLrwulSNQJVt/19t6gj0csc2V6GQCaz0s13bjhq3fzDuWo0IJE8
 W6uBRKKtZN0HSPDiK2lVHSEYbwzYcGVjvON8oTAFg7fO1/v1KUf7z7PF5rU8XxeyOpwf
 BKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792351605; x=1792956405;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=abSNPbr4DYdK0qk4yDwxN88lTWnE55zJDXdIxaDoNCE=;
 b=K65DYIM95LDRSQO5oytcAQSIXsf6Wb0AWsu6jucDEn/zl8Ec9PG/pA/WTuKMmdPxLy
 bEugHljGXFsszIGxIIV4OJHzkWJw52Rt42vhpp/iGw64NT2NbcFk/EGAKN97Fgto8Ldh
 gdVPJhUcnKluw3ooscearhgMnaUyXSPFP/kZyn9IyYaSCdbn8Zs1xTX6T4LZmGfjFd7z
 zib+y7eeU2SEy9BsyhmKg00GCRSdvzG2dqm8qDPEJagEfTi1GJVGCT30oZid9mBBnLTq
 9UOOYVVlBEugfJgHqYUv6VUBGjK6pRbbuxO00HEgMmJV3Axh6AE1w5I95R4ReA18P0k2
 CbXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsUKc5ClyXYmLBJkRCmDEHylqTzlBg7tXBJ+prDfxo1MHdDZANCGQHKec2rOfdsUk93JG0WRIQxg==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIooPGT8dZo3MwthUHWzm8qSfKDQefaUy4/ts1Wa8SwAE3T8Oq8
 DC4AKeBq8K7ziGzbtNSWamwvpJfuifRHRAzTaFHgUqGJSDUOvRBstv4q
X-Gm-Gg: AYBFou12sqEH1tQkNus5g0otOkfpocBlAoo9U2BZanZFRHF7ggc/42bHhB6qJuFYiuC
 QNHq6yVWGmZM/J3eF8NZ/6Zvj2DiKMiKSjD3SHdTaxGXIZx0nfDdh/UHpEMrFCck3GH8hITz+N8
 hVtESsAhTvUB5K8RUQStzhnDO8FQ4IZjfDpNftW1OPXtEEpyacF6D7yMQGZhH7UnR0M7rI+hnn5
 MrMzFt/YRagV2bJJ35sHyvh9Nez3t9G2hKNPG2As2ex3TdUBjrt1x0PczOWElvif0r3BiHZXlL8
 r7Slp36FOVf+V2VjQRcwnjg8iaMkie6OUHNOg4g3qBxQIBhLOOjialMvg8C5tbPNpVoBZpwmvqV
 Xv4JNhJd21OcdBxELk+lfX/nUmZxdmGuVbyuhFNeHbC4IValNGn82P2SdlrbdMboIs5MSLeFKuf
 SDJeo65NO+aMNyw2oy0M9XE4vIwlyR7eI47mgmsvv5pI+K2kPP1aie/uFb2vgU8CMZBhJgfNXNu
 o1WjRyHQJY5rCoXVA0RLqHxkkj4TIl9/S4ouoCDKwoZsppPmdtySYA6IrmHuqkK2A==
X-Received: by 2002:a05:701b:4211:10b0:143:50a0:56be with SMTP id
 a92af1059eb24-185119e3ac5mr9113455c88.14.1792351604945; 
 Sun, 18 Oct 2026 12:26:44 -0700 (PDT)
Received: from lord.bigscale.net ([170.246.211.117])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-18319d3b880sm21618945c88.10.2026.10.18.12.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 12:26:43 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Map Wa_22016122933 buffers WC on the CPU side
Date: Sun, 18 Oct 2026 16:16:16 -0300
Message-ID: <20261018192639.97118-1-talesam@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003222145.67240-1-navonjohnlukose@gmail.com>
References: <20261003222145.67240-1-navonjohnlukose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sun, Oct 04, 2026 at 03:51:45AM +0530, Navon John Lukose wrote:
> xe implements Wa_22016122933 by mapping the media GT's GuC-shared
> buffers uncached on the CPU side. i915 maps the same buffers WC on the
> CPU and UC on the GPU.

Thanks for catching this, and sorry for the regression.

I reviewed it against 7.2.11. The GGTT PTEs still key their cache mode
off XE_BO_FLAG_NEEDS_UC alone (both encode paths in xe_ggtt.c), so the
GPU side stays XE_CACHE_NONE as the workaround needs. Every user of
xe_guc_bo_wa_flags() picks up FORCE_WC: ADS, CTB, GuC log, SLPC and
engine activity. The only other internal NEEDS_UC user that touches the
GuC, the UM queue BO in xe_guc_ads.c, predates the workaround and is
left alone. CPU reads through WC still bypass the cache, so the stale
G2H reads the workaround is about cannot come back.

Tested on a second ARL-H 7d51 (GuC 70.53.0), on 7.2.11 carrying
63360b32, fc668a6e and d5b0bf3f, with only xe.ko rebuilt with this
patch.

Probe, dmesg "GT0: Using GuC firmware" to "Initialized xe":
  d5b0bf3f only:   3.56, 3.49, 3.52 s
  with this patch: 0.37 s

Resume from s2idle, wake ("ACPI: EC: interrupt unblocked") to
"PM: suspend exit":
  d5b0bf3f only:   2.43, 2.92, 2.97, 2.58, 2.93 s
                   (xe done after 2.28-2.83 s)
  with this patch: 0.39 s (37 s asleep), 0.40 s (386 s asleep)
                   (xe done after 0.11 s both times)

20 minutes of VA-API decode, two decoders in parallel on 4K 10-bit HEVC
clips (528 decodes): no TLB invalidation timeouts, no late acks, no job
timeouts, no GT resets. I did not disable C-states for that run.

Over the same session I got one media GT "not started" job timeout in a
browser, recovered by a GT reset. It is the same thing I already see
without this patch (four devcoredumps since October 7 on the UC
version, all with the LRC tail in memory still equal to the head), so
it looks unrelated to this patch. I have reported it separately in
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678.

Reviewed-by: Tales A. Mendonça <talesam@gmail.com>
Tested-by: Tales A. Mendonça <talesam@gmail.com>

Thanks,
Tales
