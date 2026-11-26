Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOWaaV5Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749D4112445;
	Thu, 26 Nov 2026 14:10:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F3D112447
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:10:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9253E4062D;
 Thu, 26 Nov 2026 14:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECE1F000C6;
 Thu, 26 Nov 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795702252;
 bh=kNQZD2na+rj9dosS7uNeydnIgpdTw90bDaqhf05rnw8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NOWaaV5YvPlbwKxV8aX5gZ6hzX4WXDvgM+FXRxIA0/IWuHBl4Fq68FnqV+U7bHXYX
 bq1iwg5INNvXME1Q11lDPgmHzif6uWqzGuxbNuy6ikM27TNQhe2Id6WEinzYqVC0UR
 s91b0bOLZVg7hgukXHbuxQiThOcujuBCM1fHpGWvw8vUwOCOW8te/kT60YcprrqiiI
 vQ3wnDutBGmbPQm7Hne8V4BJZBfFbeGy1J0N5XJKafVq6cdPet5ugBwv0F4f27wR5q
 VQDFwymbuai83Tj1lPNDZotDc/WrA4qurW1qgZaqzN6vJpyDuH9Q6BzbHoXfNpL0nY
 YIivAJrJx2r9g==
Message-ID: <sashiko-outbox-235675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 6/6] drm/xe/guc_ct: Use atomic logging under
 ct->fast_lock
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126135732.2169939-14-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
 <20261126135732.2169939-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:10:51 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe/guc_ct: GFP_KERNEL CPER allocation under reclaim-primed
  ct->lock
--

commit e4560e278fef133632b212ef80f6300ccc75e51d
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/guc_ct: Use atomic logging under ct->fast_lock

This commit replaces xe_log_err() with xe_log_err_atomic() in several GuC
CT error paths so CPER records are allocated with GFP_ATOMIC instead of
GFP_KERNEL.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 121955ac4abf9..9c96e94b99d03 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -889,9 +889,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cm=
d_len)
> =20
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> =20
> -			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
> -				   "CT: invalid head offset %u >=3D %u)\n",
> -				   h2g->info.head, h2g->info.size);
> +			xe_log_err_atomic(ct_to_gt(ct), GUC, -EPIPE,
> +					  "CT: invalid head offset %u >=3D %u)\n",
> +					  h2g->info.head, h2g->info.size);
>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>  			return false;
>  		}

[Severity: High]
Should the remaining xe_log_err() calls in xe_guc_ct.c that run under
ct->lock also use xe_log_err_atomic()?

primelockdep() primes ct->lock under fs_reclaim_acquire(GFP_KERNEL):

drivers/gpu/drm/xe/xe_guc_ct.c:primelockdep() {
	...
	fs_reclaim_acquire(GFP_KERNEL);
	might_lock(&ct->lock);
	fs_reclaim_release(GFP_KERNEL);
}

While h2g_has_room() is converted here, guc_ct_send_locked(),
guc_handle_crash_dump_msg(), guc_handle_exception_msg(),
parse_g2h_response(), parse_g2h_msg(), and process_g2h_msg() all execute
with ct->lock held and still call xe_log_err().  When has_driver_cper is
enabled, xe_log_err() allocates the CPER record with GFP_KERNEL, which
inverts the fs_reclaim -> ct->lock lock order and can trigger a lockdep
splat or reclaim deadlock under memory pressure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126135732.2169=
939-8-mallesh.koujalagi@intel.com?part=3D6
