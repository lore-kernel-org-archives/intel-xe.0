Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AE606A32D
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5JH48Yb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98E10E591;
	Sat, 14 Nov 2026 08:50:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23710E591
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 08:50:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 182C043C2D;
 Sat, 14 Nov 2026 08:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6EF1F000C4;
 Sat, 14 Nov 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794646225;
 bh=IzLbvbaMk4zP8Zb5CDPx92xrqsuNdMqdtStXsTnCSnM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=T5JH48Ybx3crqs6odURHG7lQ6HWsfMb6QkwLCGxhx1X7S0COQx+Z7Gki/f9h6YlYI
 APMYj3vY2xlkePAfz0GTeNfjWEiOUQCbHoOZ2DvuBYqQ8PhLSbrOdkaVqW88eP/laR
 H3fk/UXOeikghMaqvEyey09jSY9HGvuv3xNvYxdcoibDz2C0Pi9QQeJ6cHuUL4abK6
 6h0CGsK1QYlem5OiJ5fjrGbla9YpVn4XVf5H/Gp5qUYa9j/LH9TgMsutd/gTS0DJd3
 fjFZxFlryNEi4VViBJf3r4Pstu1sCxjGX9aBeWi5od9Sp2SpVn8kSiBU3XyxXtgW0e
 yaNalR6ebJ1zA==
Message-ID: <sashiko-outbox-214301@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] CI_ONLY: Hold a device reference across deferred VM
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261114083859.1007095-2-arvind.yadav@intel.com>
References: <20261114083859.1007095-1-arvind.yadav@intel.com>
 <20261114083859.1007095-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 08:50:24 +0000
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
- [Low] drm/xe: missing Fixes trailer and truncated CI_ONLY commit
  subject
--

commit 29cb5a3668140777f3ea7ef378bd05d3188c28ae
Author: Arvind Yadav <arvind.yadav@intel.com>

> CI_ONLY: Hold a device reference across deferred VM
>
> xe_vm_free() queues vm_destroy_work_func() and returns.
> drm_gpuvm_free() then drops its device reference, but the worker
> still accesses device state while finishing VM destruction.
>
> Take a device reference before queueing the work and release it
> after the worker has finished using the device.
>
> Run the worker on the module-lifetime destroy workqueue. Releasing
> the last device reference can call xe_device_destroy(), which drains
> xe->destroy_wq. Running on that per-device workqueue would make the
> worker wait for itself.
>
> v2:
> - Move final VM destruction to the module-lifetime destroy workqueue
>   in this patch to avoid self-deadlock on the last device put. (Sashiko)
>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

[Severity: Low]
Since this fixes the device lifetime across deferred VM teardown, should
it include a Fixes: tag?

  Fixes: 61e18525023a ("drm/xe: Route deferred xe_vma/xe_vm teardown off sy=
stem_dfl_wq")

The subject line also appears truncated ("... across deferred VM") and
still carries a test prefix instead of the "drm/xe:" subsystem prefix.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114083859.1007=
095-1-arvind.yadav@intel.com?part=3D1
