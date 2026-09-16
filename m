Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF1C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 22:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EEF10E218;
	Wed, 16 Sep 2026 22:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E/2Kr8tQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8CC10E218
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 22:04:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D87E543B7D;
 Wed, 16 Sep 2026 22:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81F71F000FF;
 Wed, 16 Sep 2026 22:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789596297;
 bh=1jrYSv6t0ubk2rmL+BhRs+QZci39kt83Kc/O6Tss1ws=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E/2Kr8tQ/umftnbD3bFjaCTxCyy44a01hUMD3VMXtv9UZMymNZ7N7iVd83bKiruj9
 NBQlhEy5Ag2bZBAMqkmeNZpoIAUGdn2GzRTMskRk6dH32xZjf3RuZm74y1LDQRa90U
 W0yrkmEpnAzZoxl56x+nOt/fLICywCog7yYRWArY7cpsO1baPBqxAnefP++7fVpzG9
 u/HcKaMWwyQcBHtLNVXpWHpNMPZ5iaTF+dKo7ekbZh1Xm+HK5Urpsn6DS9x70IMWVe
 rXtIGzXgQHuWz4mI05a3Pu+9XzT6rZIdYCuwMFuHhi3l5ns8bc9tc6qJ4xh//nxyQV
 b/qQZexRkCm/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe/guc: Add simple KLV decoder helpers
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916215827.13488-2-michal.wajdeczko@intel.com>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
 <20260916215827.13488-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 22:04:57 +0000
Message-Id: <20260916220457.A81F71F000FF@smtp.kernel.org>
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
- [Low] doc: mismatched kernel-doc parameters for xe_guc_klv_decode_string()
--

commit 00a2cb03138e3f97464e63d20cf077884ec27126
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/guc: Add simple KLV decoder helpers

This commit adds simple helpers to decode data from KLV dwords instead of
retrieving them manually, along with sanity checks.

> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe=
/xe_guc_klv_helpers.c
> index dc8612d761e3c..5c40ee44d9a56 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
[ ... ]
> @@ -372,6 +372,85 @@ int xe_guc_klv_parser(const u32 *klvs, u32 num_dword=
s, void *obj,
[ ... ]
> +/**
> + * xe_guc_klv_decode_string() - Decode string data from KLV.
> + * @key: the key
> + * @len: number of dwords in @value
> + * @value: array of dwords
> + * @data: pointer where to store the data
> + *
> + * Note: caller must use kfree() to release decoded string.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_klv_decode_string(const u32 *value, u16 len, char **data)

[Severity: Low]
This isn't a bug, but there is a mismatch in the kernel-doc for
xe_guc_klv_decode_string().

The @key parameter is documented but does not exist in the function
signature. Additionally, the order of @len and @value in the comment differs
from the signature.

Could this be updated to match the signature and avoid W=3D1 build warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916215827.1348=
8-1-michal.wajdeczko@intel.com?part=3D1
