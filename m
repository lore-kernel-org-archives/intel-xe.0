Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C4606A33A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpJdilb0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39910EF59;
	Mon, 16 Nov 2026 11:04:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A4B10EF59;
 Mon, 16 Nov 2026 11:03:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F0807433AF;
 Mon, 16 Nov 2026 11:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96EE1F000C5;
 Mon, 16 Nov 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794827035;
 bh=pRzaQUmFPH9noHwEl5nvW/MzzXWdkQTH6auK9rW4dHc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dpJdilb0WmSiedFj1ijaYX9QSLWk0aY1gjoYzBbckah5CU3YAX6NXbiXZvRtFSWUN
 U/OZKFkrxd29FS4bU3MGcEGEXaz8dnfGV0N3oupfr9enEtdTSTJoTd95QocJxXcL20
 Wf79zIUpqTccET3wvhFhVCvTLqRojm31vpu5zBv7ddpN8/6bVqzLg5s0yMTJd3oFwH
 yl7zSlsJy3Qc8KFQKVWRCk2L+aOnsQ/8v7qsJMmtMtGlQ3eEIbJFJUomjXyA7Ru7SG
 zHfqM2FcDSmQoW4kpWchQplHIfZEpCkGYQEvdvNX4WjohTSmYuGXygLhj1Qf4+fhch
 F0WapmfgD6kuA==
Message-ID: <sashiko-outbox-216832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp_mst: Don't round up the PBN to whole TUs if
 not needed
To: "Eriksen Xie" <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116105305.1374985-1-xiaolu.xie@intel.com>
References: <20261116105305.1374985-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:03:55 +0000
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
- [Low] drm/i915/dp_mst: missing Fixes trailer for
  intel_dp_mtp_tu_compute_config()
--

commit 9569721c99c30b1c8df99a4e417744acb391988d
Author: Eriksen Xie <xiaolu.xie@intel.com>

> drm/i915/dp_mst: Don't round up the PBN to whole TUs if not needed
>
> intel_dp_mtp_tu_compute_config() rounds up the stream's PBN to a whole
> number of TUs (remote_tu * pbn_div) before passing it to
> drm_dp_atomic_find_time_slots(). The MST core uses this PBN both in the
> ALLOCATE_PAYLOAD messages and for checking the bandwidth limit of the
> path in drm_dp_mst_atomic_check_mstb_bw_limit(), against the
> Full_Payload_Bandwidth_Number reported by the branch device.
>
> Rounding up the PBN is needed only if the TU alignment required by the
> HW (4 / lane_count) increased the TU count, to make the TU count the MST
> core derives from the PBN match the TU count programmed to the HW.
> Otherwise the MST core derives the same TU count from the exact PBN as
> well.
>
> Rounding up needlessly can make a stream that would fit on the path
> exceed its limit. For instance 1920x1080@120 8 bpc needs 1022 PBN, which
> fits a port reporting 1024 PBN, but on a 4 lane HBR3 link (60 PBN per
> TU) it gets rounded up to 18 TUs =3D 1080 PBN. The stream then fails the
> check and the driver reduces it to 6 bpc (13 TUs).
>
> Round up the PBN to the aligned TU count only if the alignment changed
> the TU count, otherwise use the exact PBN.
>
> Tested with a PS8650 MST hub driving three 1920x1080@120 panels on Nova
> Lake: the streams now use 24 bpp (18 TUs, 1022 PBN out of the 1024 PBN
> limit) instead of 18 bpp.
>
> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>

[Severity: Low]
This fixes the unconditional PBN round-up to whole TUs when TU alignment
does not change remote_tu.  Should this include a Fixes tag?

  Fixes: 1bcbe192e0dc ("drm/i915/dp_mst: Align TUs to avoid splitting symbo=
ls across MTPs")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116105305.1374=
985-1-xiaolu.xie@intel.com?part=3D1
