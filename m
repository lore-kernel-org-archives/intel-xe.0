Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F71606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 21:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mn54Oyw8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B390710E71B;
	Thu, 19 Nov 2026 21:27:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF7B10ED03
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 21:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795123629; x=1826659629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tm4LXaFP1PvtQRx5S7dIHYRpmzL98VjWi1sYr5fUSew=;
 b=mn54Oyw8WR0wjlHv7mLryiDyw0oMcbCJVg4Sr1040uAc64hibvcjbtbA
 b5Xm/h7DYu/nlZT2QjeLqIXSEDpUstvWvfL2tzhP8LHL7KM/oAtOEjTm5
 GcG13ACicA0+hAg0DaydT/6L397tEP7rjPS+O7FU+Z279ptG28HabPcp4
 4akJ2O/V3CqN2Tyujs0xd0C9tRlV2S1uLboO+Eiss9lASNikfdUaNRsyD
 5qZYuomHih79eqQzQRJJzBFPos2rfl6kUwRfnLdAkbOIxZLHPK2oFH9wq
 bm/UNeB7IcOJU7/gbOBTx4kDW2oTWojHtDLJC8nioOKmwR0lqw5xGGL9x g==;
X-CSE-ConnectionGUID: ZE9kcJHcTJK+yBsZNEm/xQ==
X-CSE-MsgGUID: eaR40g31TtCobH2bmvCStQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3892270"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3892270"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 13:27:09 -0800
X-CSE-ConnectionGUID: QV0NBaxcSEKTz/NhVwQvGQ==
X-CSE-MsgGUID: veGxtl9yRBSsjl1UNW5h9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="12516090"
Received: from fvishwan-4tb.jf.intel.com ([10.54.60.87])
 by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 13:27:08 -0800
From: FNU VISHWANATHA <fnu.vishwanatha@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, daniele.ceraolospurio@intel.com,
 tomasz.lis@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, fnu.vishwanatha@intel.com
Subject: Re: [PATCH] drm/xe/pf: Restore PF config before resuming submission
 after GT reset
Date: Thu, 19 Nov 2026 13:27:49 -0800
Message-Id: <20261119212749.1101297-1-fnu.vishwanatha@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119101541.353uulqe2w2j3zx5@intel.com>
References: <20261119101541.353uulqe2w2j3zx5@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Piotr, Daniele,

Thanks for the reviews, and to Sashiko for the analysis.

You are both right about the patch. Calling
xe_gt_sriov_pf_config_restart() from do_gt_restart() takes the PF
master mutex in the reset path, which is exactly what a4d1c5d0b99b moved
out of it, and it pushes the configs before the VGT policies are
restored. Please do not take it as is. I will not respin until the root
cause is clearer.

Answers to your questions:

- Platform: ADL-P, Xe in SR-IOV PF mode. The same GuC reset-failure
  signature was also reported by our validation team on ADL-N (46d1).
  This is an Android 6.18.33 tree, not upstream, and I have not tested
  on an upstream kernel.
- GuC: adlp_guc_70.bin, stock 70.49.4. linux-firmware 70.49.5 behaves
  the same (stalls after the first reset).
- VFs: none enabled (sriov_numvfs=0, totalvfs=7). I checked this on the
  current boot and will confirm it for the logged runs.
- Scheduler groups: not configured. We only run the default PF setup.
- GuC logs: I have GuC logs at log level 3, taken after the reset, from
  the isolation runs and can share them.

What we measured (HuC disabled, WebGL load, no video, so no CAT error):

- 10 min before any reset: 0 "not started" jobs, 0 timeouts.
- After ONE clean reset from debugfs gt0/force_reset: 110 "not started"
  and 37 timeouts in the next 10 minutes (about 11 per minute), mostly
  on the SystemUI render queue. The stalls last until reboot, and the
  queue is stuck again after each SystemUI restart.
- State of a stuck context, from the GuC info and devcoredump: sched
  state 0x3/0x401, seqno still at its initial value, job timestamp
  written, context timestamp shows it ran for only about 45-60 us, RCS
  idle. So the context was scheduled, started the job prologue, was
  switched out and was never resumed while the engine sat idle. That is
  why I think Daniele is right that the GuC may be at fault here. I
  agree it should at least report an error.
- With the PF config pushed synchronously before xe_uc_start(): 0 stalls
  over 6 back-to-back forced resets.

I have since run a second set of tests with a debug build that has
runtime knobs, on the same board (ADL-P, GuC 70.49.4, HuC disabled),
with a video-call workload whose decoder start triggers a GT reset each
time (so the resets are natural, not forced). Each variant starts from a
fresh boot:

- No push, stock behaviour (control): stalled after the first GT reset
  on both boots (6 and 8 "not started" jobs).
- Full PF config pushed before xe_uc_start(): 9 GT resets, 0 stalls.
- No push, but a 200 ms delay before xe_uc_start(): stalled after the
  first GT reset (6 "not started" jobs).
- No push, but a 2 s delay before xe_uc_start(): stalled after the
  second GT reset (2 "not started" jobs, both delays executed).

So a delay alone, even 2 s, does not avoid the stall, while the config
push does. A config push is an H2G round trip of about a millisecond or
less, so this makes a plain timing race unlikely. These are small
samples (one run per variant, nine resets for the push). They also do
not show which part of the config matters, and I have no evidence that
the default config differs from native mode, as Piotr points out. I am
now testing pushes of only parts of the PF self config (context and
doorbell ranges, scheduling parameters, GGTT range) and will send those
results here.

About the GuC log: it was decoded with the GuC decoder (--trackCtxt
--trackH2G --trackCSB). In the stuck state, each time xe enables the
context, the GuC acknowledges the enable, queues the context and logs a
render dispatch attempt with outcome 0x10. Nothing is dispatched while
the render engine is idle, and there is no retry. This repeats on every
TDR disable/re-enable, about every 5 s, for the whole capture (about 9
minutes after the reset). A new context created after SystemUI is killed
is stuck the same way, and the stalls last until reboot. So it does not
look like a single dropped submission right after the reload. The
failure persists for new contexts afterwards. I could not find what
outcome 0x10 means (it is not in the schema or headers, and I only read
0x1 as "dispatched" because it is the common one). Could the GuC team say
what 0x10 means, and why the GuC does not retry?

On our board the GT reset in the field scenario is triggered by a vcs
CAT error followed by "GuC engine reset request failed on 1:0 because
0x00000000" from xe_guc_exec_queue_reset_failure_handler(). We only see
that when HuC is not running. That is a separate issue and I will follow
up on it separately, but it may interest the GuC team.

Thanks,
Vishwanatha
