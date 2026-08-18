Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5045DC5DF7E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 15:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FDD10E43A;
	Tue, 18 Aug 2026 15:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IuGfjE/n";
	dkim-atps=neutral
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC910E00D
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 15:25:55 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-836ce6cbe1eso62337657b3.1
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 08:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787066754; cv=none;
 d=google.com; s=arc-20260327;
 b=nhZZmjlZR/1BPvNT0aqaIKnHhnt8BD8HkAEpWLUxIzdlpC/ahBCoLN+z3pas7bmWyq
 BgMspbshwO/c4dn3oSoNMkPGg4+P5s0w8KIKsNlorw+8dao+im3d8PHV1dTA0htURT4G
 ty0AZX0HGX4YIXPnksNAIoo381oqmRWQVphpBD4RZqYFeMWGiAbWzJbrlXM9UjtAxKQR
 BU5JE89E6TanUSJnnHpC9cPrqK8mGK2QCRY56SQobKF0Z+svWca/ytCzt08kB/BvfFNW
 gltaJOYesH3uFSULt6eDp5bYaMesW/lE1Xl3z2V1AQbk7ZFHKQubUMBUG0rd0ru0Bzn0
 wisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=G1FlOSu7ivJtDLb2bWkv9DL482AXJicMlDmui4P/8KM=;
 fh=ovNJItbYPat4kgjJES+GQG/vsQdmGypnPrA/sf6SWeI=;
 b=WasxSfFPIlSfLN/RglPuaGCLATmSiVYaf20h23HAIzYPdRCH2we9Mn+cnIaaXv+WBY
 3NGchkElRcl4ntdA16FmrN87m+2DaLOUgV4hY1hzk99+0cenUYoVYW8g/tKxf9PSU8bW
 k2ne3Mb/6QpUKJTz//xMs4cPn23Q57EerXOpM/sPsxcTkoNPX4u0yMaWZ+4evMBtdMAX
 zhr0JZ2Orgrx8WOO+4uPT+crxB43dH0wJlFZCPMi7H6cSQTHL0XpUit5dmum9Kst5J3p
 2hGz85t5sJD5Tm8krvNHj9k2EO/mh3CYhk7aO3UmMnSsoCqju7F6kLaJ310izs1DwLCe
 Ky1A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787066754; x=1787671554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=G1FlOSu7ivJtDLb2bWkv9DL482AXJicMlDmui4P/8KM=;
 b=IuGfjE/nbxogQMfR5EsxH9TVwngMJ7CjzZ/OPm3WSVgo3bZD+q8x7g71mZpvmbRwka
 NgFSS5qoE093agZPCg1PmgY0G+cZjlXEpF6YiNk9+OPKvPTFnG1QaR+6tUSY8YuowssW
 57F1iCKBy7aD+4CeJeDdNFWh7NpZVeifFFDaQkj5P/7Dn+SpxvuGsPVJL4mEHGst/Q01
 YF57G/f56tOFPUMwx7WZAWa80NEy31D3FDi/hKqafRLfCukXXISnsvWGC0vi36dQ5rLT
 VlbvOMzielSxUWBX/kaN85nQFb1uRtMqEcq95E8r++z/r7GRUx5floD7sXFrG/JK7sNr
 yNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787066754; x=1787671554;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G1FlOSu7ivJtDLb2bWkv9DL482AXJicMlDmui4P/8KM=;
 b=pjzFBonsBJ/7vg8+ceXedBGmU4vXQy/bhMOPli4WXbUPfKRLnDFm/6MOCd1ZQ6IT8a
 G2Rqn1xdUFJ77u/cjpZcLEnUpQZcqzEJWcJysPpz5FElEXR3Wi4Tn9kznCJo/Hjz5C8n
 kKM6U4Dr4SGhR1PsqqZu/fmYwcUrRbQcC0fuqia2/uqe6LbSeJlMuTsF68J9fl7ePyup
 tx8tAP1i06HtgihjmoCO/4kuQHK0f9AyfEYE8w5Ha5GpZoOYelOAPzMp6ugqzhDxKr9X
 nX4AURXSWhJThPLSxR9VxbgwNmMroLWOWWbyNj8UQtO91SElJNRp0YhfyJn/BXVc4+WI
 uDXw==
X-Gm-Message-State: AOJu0YxLO7Fj8zcVNjrb5rYhZrv3tZfQWi8ntYVBI/VQj0tEPpT+EgWu
 kWpMWPXLQ+t8/MHDfkcA+4AC0OashJXvZjjf+OvAzMHG6J/BmPti+ECR0rTer7X6vZ4RQq7Mbrl
 XKlb+gqy5nS4uZRLjR0WjJS6eiClIAQVzTx0B
X-Gm-Gg: AR+sD12t9rWwUSZIYKvyLLF6qK9V7O0GyGfDNvQ7BgAlkq29hhZqd5BeMnBsSIt91cF
 sd1VPdHfwejC4BbgsODZtMFDuJyBWDfaaa9hW/4Gfl6TgQ4HKadqW4aoskTicpCSiIWWXx6N2wx
 g8b9xDOlEcyXmOP937lO48eUunvAN7GbUbl/x3TxdlAW1L89zH+6dbZxvJrd4+7fhHThB3acf15
 DO/dP7Few/xEqD7dr+GeMAHGoDe+uLrbpbg3S+QD/U9VTSVcp7yEyzS2x+R0pY8W7GnxtLCEk9c
 KCIBN2SY7TxQ5NvnjKXs/JH0gXSp+w8N2nP4YqQ3ORKF4T9CGaBicC1ya0fqjuIUTngns9Buhtt
 4HqgxEPLdx2ZspmpIMx5rIpkniPZ3NbQRTJvSdyYmqg==
X-Received: by 2002:a05:690c:c3a2:b0:816:b469:ccec with SMTP id
 00721157ae682-8412ed81021mr35451047b3.15.1787066749283; Tue, 18 Aug 2026
 08:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260813023016.805573-1-talesam@gmail.com>
In-Reply-To: <20260813023016.805573-1-talesam@gmail.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Tue, 18 Aug 2026 12:25:38 -0300
X-Gm-Features: AcwNN1Uq1vvVXXUSTEEyCTeL2d7Ad3PCBMgH9DazHLUva-cXSsmnQCADrzN4OXc
Message-ID: <CAHBRX4EwVmx2Nc6NWkt9Tu2Z0hPDKmqkFVoxYKDOh+bJKGUVuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/xe: fix GuC TLB invalidation ack stalls on ARL
 (Wa_22016122933)
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, daniele.ceraolospurio@intel.com, 
 stuart.summers@intel.com, julia.filipchuk@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Gentle ping - anything needed from my side on this series?

Patchwork status so far: CI.Patch_applied, CI.Build and CI.KUnit all
green; CI.checkpatch has only the known warning for a quoted log line
in patch 2's commit message. The full hardware run does not seem to
have been triggered - could someone with permissions kick off the BAT
run on the series (patchwork series 172110)?

Meanwhile the two ARL test machines keep validating the fix: 17+
machine-days combined and >8M TLB invalidations since Wa_22016122933
was applied, still zero stalls - and the 7dd1 machine has now spent a
full week of normal use on xe (including plenty of video transcoding)
with zero platform freezes.

Thanks,
Tales


Em qua., 12 de ago. de 2026 =C3=A0s 23:30, Tales A. Mendon=C3=A7a
<talesam@gmail.com> escreveu:
>
> Hi,
>
> v2 of the TLB invalidation ack stall series for ARL, tracked in:
>
>   https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> The investigation concluded since v1: the GuC always replied in time.
> The CPU was reading a stale cache line of the G2H CTB - the GT1 caching
> bug that i915 works around as Wa_22016122933 and xe never inherited.
> Thanks Daniele for spotting the GT1 pattern in the GuC logs and
> suggesting the test, and Matt for the review and the guidance to mirror
> the i915 workaround.
>
> Patch 3 is new and is the actual fix: Wa_22016122933 for xe, scoped
> like i915 (media GT on media version 13.00) and covering the GuC-shared
> allocations the CPU reads from.
>
> Validation of patch 3 on two ARL machines (7d51 and 7dd1): before,
> 20-60 ack stalls/day, every day, for weeks, on two GuC firmware
> versions; after, zero stalls across 6+ days combined and >5M TLB
> invalidations. The 7dd1 machine, which could not survive a day of media
> workloads on xe without a platform freeze, ran 34h+ continuously
> including video transcoding with zero incidents.
>
> Patches 1-2 are the diagnostics that made the investigation possible,
> updated per Matt's v1 review.
>
> v1 -> v2:
> - Dropped the "kick" workaround (RFC patch 3): obsolete now that the
>   root cause is fixed by Wa_22016122933.
> - Patch 1: unified with the existing devcoredump path -
>   __xe_devcoredump() taking a GT plus nullable q/job, with
>   xe_devcoredump()/xe_devcoredump_gt() wrapper macros (Matt).
> - Patch 2: record the first timed out seqno instead of the last one,
>   and use xe_warn() (Matt).
> - New patch 3: implement Wa_22016122933.
>
> Based on today's drm-tip.
>
> Thanks,
> Tales
>
> Tales A. Mendon=C3=A7a (3):
>   drm/xe: Capture devcoredump on TLB invalidation timeout
>   drm/xe: Log when a timed out TLB invalidation ack finally arrives
>   drm/xe: Implement Wa_22016122933
>
>  drivers/gpu/drm/xe/xe_devcoredump.c     | 46 ++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_devcoredump.h     | 15 +++++---
>  drivers/gpu/drm/xe/xe_guc.c             | 16 +++++++++
>  drivers/gpu/drm/xe/xe_guc.h             |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ads.c         |  3 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c          |  6 ++--
>  drivers/gpu/drm/xe/xe_guc_log.c         |  7 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.c          |  3 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 39 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 17 +++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules      |  1 +
>  11 files changed, 124 insertions(+), 31 deletions(-)
>
> --
> 2.55.0
>


--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
