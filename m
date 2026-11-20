Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E9606A339
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 00:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPanwss6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA6C112811;
	Fri, 20 Nov 2026 00:15:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE8112811
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 00:15:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 16F3A416CA;
 Fri, 20 Nov 2026 00:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D072C1F000C4;
 Fri, 20 Nov 2026 00:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795133727;
 bh=NfjYNSal55eO57UM6JiZVsSETiNjrBcx+yL94392ZRM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IPanwss6sjoB7e2/8zqGKxbKzVR6J4ayWGkQF+OFZajUG+Tx75T6skVHC1okQLpHv
 vp3D3VYmW8iDAU6duFqyUUaq9J4nKIz8WUODiAiVyQZUh7qWKSmRX6tbwEb1pqd672
 uu4iiCrIprLCF8GGpmJw+FzmxSmq+RjQUyvxx8m9K3kdUrPvzhWaU80R4pb204ItEm
 M5GMmw73+xY23fVudhI0gnIepeJiO6TmteY0FOeYbhpNPLHE/YeTlZ6J/o7S0rpR5u
 LsalwkUPFUU1Xf6LlMLPRFzLSuQIaFHml1zDiz8mAeeOSjPdO8UP0arBtuEFMHJqpf
 1UFEpjYQrDpDQ==
Message-ID: <sashiko-outbox-224261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Serialize migrate ULLS enter against a pending
 exit
To: fei.yang@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120001054.3901642-1-fei.yang@intel.com>
References: <20261120001054.3901642-1-fei.yang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:15:26 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe: missing Fixes trailer for xe_migrate_ulls_exit() race
  fix
--

commit ec3c80079d880e245d587b5f95313394facd8925
Author: Fei Yang <fei.yang@intel.com>

> drm/xe: Serialize migrate ULLS enter against a pending exit
>
> xe_migrate_ulls_exit() clears ulls.enabled as soon as the ULLS_EXIT job is
> pushed, and drops job_mutex without waiting for it. A page fault arriving
> in that window finds ULLS disabled and pushes a ULLS_ENTER job while the
> previous ULLS chain is still executing.
>
> ULLS_ENTER is not chained, so submit_exec_queue() publishes its ring tail
> with xe_lrc_set_ring_tail(). That only updates the saved tail in the
> context image, which is what a context restore loads RING_TAIL from. It is
> therefore correct for a context that is off the hardware - but the context
> only leaves the hardware once the exit job has retired.
>
> Submitted before then, that write races the postamble of the job preceding
> the exit job. The postamble publishes the same saved tail, and RING_TAIL,
> at the end of the exit job. If it lands after the CPU's write the tail is
> rewound behind the enter job, which the command streamer never executes.
> Its fence never signals, so job_cnt never drops, xe_exec_queue_is_idle()
> stays false and the exit worker re-arms itself forever while the context
> sits parked on the engine.
>
> Wait for the exit job's fence in the exit worker before dropping
> job_mutex. xe_migrate_ulls_enter() takes job_mutex to submit, so it is
> serialized behind the exit job retiring. The exit job carries no batch
> and is only pushed once the queue is idle, so the wait is short and
> depends on nothing else on the queue.
>
> Assisted-by: LLM
> Signed-off-by: Fei Yang <fei.yang@intel.com>

[Severity: Low]
This fixes a race in xe_migrate_ulls_exit() that can hang the migration
queue.  Should this include:

  Fixes: 8ab0d5ca31ca ("drm/xe: Add ULLS migration job support to migration=
 layer")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120001054.3901=
642-1-fei.yang@intel.com?part=3D1
