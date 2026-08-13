Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63975C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 23:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE7910F590;
	Thu, 13 Aug 2026 23:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="okES7dM+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C82510E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 23:28:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 142B0600AF;
 Thu, 13 Aug 2026 23:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4561F000E9;
 Thu, 13 Aug 2026 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786663713;
 bh=7P13W8EZe1BJSm9X5EpX3y48hfduP5vybhQbeNoQMw8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=okES7dM+ueGE5yobWoAlceWAOha0z3XEm259Zej5EAA3R7ZalkwNUbKnFRe7rQzcl
 P13RWjQTqLX3byzBNLd9rkk+NOHnVQ5jO/xD/dmxChrwhKDRUNKxx/2YopbqLOnPFN
 YjXkGuK719a4uQfOt39xV5tPwB3A3wUevvnvQnThFPc6AFjspo+OrkPZPZjrz9CdhG
 +6QxogF6SDTe7TWibKPlJr5IqWmMCbWd6QLqnhOqSIsLdEvR0E6lDhdbidxL5J4ThC
 2AYsAUks9AHQW2M++nL6HNLRkRbqL+3q5GtFS36WYtkxlSE5USHtPHLC4BCrnGxlrA
 8deivRwhH10sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] drm/xe/pf: Force new VFs prorities only once
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260402191726.4932-4-michal.wajdeczko@intel.com>
References: <20260402191726.4932-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:28:33 +0000
Message-Id: <20260813232833.9F4561F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect `num_vfs` argument passed to `pf_config_bulk_set_u32_done=
()` causes an out-of-bounds log message for VF bounds.
--

--- Patch [3]: [PATCH v2 03/13] drm/xe/pf: Force new VFs prorities only onc=
e ---
commit d9a195ee96c85a89ef1ab7a22febed668f958fe6
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: drm/xe/pf: Force new VFs prorities only once

This commit defers forcing VF scheduling priority changes until after the
initial change of the SCHED_IF_IDLE policy, preventing overwrites of
individual per-VF priorities. It also moves the priority change code to the
_config component for proper isolation.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 658e9b048751d..c74745642a925 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c

[ ... ]

> +void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt,=
 u32 priority)
> +{
> +	unsigned int total_vfs =3D 1 + xe_gt_sriov_pf_get_totalvfs(gt);
> +	struct xe_gt_sriov_config *config;
> +	unsigned int n;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n =3D 0; n < total_vfs; n++) {
> +		config =3D pf_pick_vf_config(gt, VFID(n));
> +		config->sched_priority =3D priority;
> +	}
> +
> +	pf_config_bulk_set_u32_done(gt, PFID, 1 + total_vfs, priority,

[Severity: Low]
Does this pass an incorrect bound for the log message?

The variable total_vfs is already initialized as
1 + xe_gt_sriov_pf_get_totalvfs(gt). Adding 1 again here makes the passed
value 2 + xe_gt_sriov_pf_get_totalvfs(gt), which results in an out-of-bounds
log message indicating settings were applied to an incorrect range of VFs.

> +				    pf_get_sched_priority, "scheduling priority",
> +				    sched_priority_unit, n, 0);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260402191726.4932=
-1-michal.wajdeczko@intel.com?part=3D3
