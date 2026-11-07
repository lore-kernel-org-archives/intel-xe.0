Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3446D606A32C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8folIMv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB9A10E0A6;
	Sat,  7 Nov 2026 17:37:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873FC10E0A6
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:36:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4843D40631;
 Sat,  7 Nov 2026 17:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA291F0089F;
 Sat,  7 Nov 2026 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794073018;
 bh=Spfe1+q4h79ZO297diyUEMgukBrPyqIaBeGdccWAy+I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=f8folIMvN7M8M7WRJDursrWXymMFIUQc03jUBnRGOXfTzKk5dvJCjm+BTN6fOdFDj
 q8HOnf6E9+2FsXall6Rx5460SemKxIXCHGZJW4VpGaAhGx+bXOuZSFLL5dQP+Qof+z
 Vm+pdFM1nG/3DIWzwU4a2ZDUh2d44lHc2DhRX2zxi7MPtpzwQBaAasFB09nErpsK/Q
 NGF2z1gEwImsqw9IPe1+U/IoNP3QOoAJd2aTI3h4Bs2iOmurZGauJ2BRV4ZnqSzGG6
 OLXy2UwlaxXqt17cN89wCWBbmoREFJ3G4I+mwu6/MokribSM6TfmZ/x/rTEXRrTID8
 adCJ+cgTSTv/Q==
Message-ID: <sashiko-outbox-203113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe: Exclude imported dma-buf BOs from the TT
 budget
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261107-oom-fun-v1-2-be9eb05b82ed@intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
 <20261107-oom-fun-v1-2-be9eb05b82ed@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:36:57 +0000
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe: commit message body describes outdated v1
  sys_mgr_sg_usage design
--

commit 2d9d97becda400684fed39733d2674585c59c2c5
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Exclude imported dma-buf BOs from the TT budget

This commit excludes imported dma-buf BOs (ttm_bo_type_sg) from being
charged against the system TTM resource manager budget by tracking
charged allocations in xe->mem.sys_mgr_charged.

> Track the bytes of ttm_bo_type_sg BOs in a new per-device counter,
> mem.sys_mgr_sg_usage, and subtract it from the usage compared against
> the budget. The counter is maintained in xe_ttm_sys_mgr_new() and
> xe_ttm_sys_mgr_del().

[Severity: Low]
This isn't a bug, but this paragraph still describes the v1 design
(tracking ttm_bo_type_sg BOs in mem.sys_mgr_sg_usage and subtracting
them from manager usage), whereas the patch tracks non-imported BOs
directly in mem.sys_mgr_charged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-oom-fun-v1=
-0-be9eb05b82ed@intel.com?part=3D2
