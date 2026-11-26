Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44505606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFn2FZA8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0A10E40E;
	Thu, 26 Nov 2026 13:14:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EEC10E40E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:14:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CD3740182;
 Thu, 26 Nov 2026 13:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09D31F000C6;
 Thu, 26 Nov 2026 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795698876;
 bh=ckm/xQ83JYZ2RVLB9JUM4Nm2J4KqB89HlArOX9IwlHE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KFn2FZA8S1cO3Np/ocuDakiccKkx9H07ehlcpsrqYIJaZrhTPNsflxwbYgGhgDA2s
 G2S31IFaOHGFYxdIz7grd2H9lP+Mhz4FDsRyyVEkYTeuUC2bT7tWaiF72+uIaBMjQq
 +u/LDpGhPcz6DrP+xGZFQj8fpL7PadmRPeaKBhVmQ9iYBNsGC6jEhv3dA9yoCu+61P
 QSV+oeZtRWvxZYFv+0WXSRnkXGiWfSEpvIO3q0KuG5Yry/YEBzgOfnLYMd4sQdvWxp
 oT/5JYXHiPtQAUA0lPmOvuUMUfch70uKFwfINoY1Rd646NsEOP4Ll7y3L3LVXkngHv
 wtxw1AX5/wmDg==
Message-ID: <sashiko-outbox-235584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Print has_sem64 in debugfs info
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126130802.1258172-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261126130802.1258172-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:14:36 +0000
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
- [High] drm/xe: build failure in info() due to missing
  gt->info.has_sem64 member
--

commit 82e9441472dcc5391dc8deae9fb47a98f3923523
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Print has_sem64 in debugfs info

This commit prints gt->info.has_sem64 for each GT in the debugfs info file.

> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index e59d4964d811d..59164d90a2afb 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -235,6 +235,7 @@ static int info(struct seq_file *m, void *data)
>  		print_engine_mask(&p, gt, gt->info.engine_mask);
>  		drm_printf(&p, "gt%d multi_queue_engine_classes", id);
>  		print_engine_class_mask(&p, gt->info.multi_queue_engine_class_mask);
> +		drm_printf(&p, "gt%d has_sem64 %s\n", id, str_yes_no(gt->info.has_sem6=
4));

[Severity: High]
Does this fail to build?  The info sub-structure in struct xe_gt (in
drivers/gpu/drm/xe/xe_gt_types.h) has no has_sem64 member.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126130802.1258=
172-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
