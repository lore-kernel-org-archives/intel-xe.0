Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE5AC61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284ED10EED7;
	Tue,  1 Sep 2026 19:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PYNH0b+v";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0EB10EEDB
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:40:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D7F10416D6;
 Tue,  1 Sep 2026 19:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9561F000E9;
 Tue,  1 Sep 2026 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788291631;
 bh=BuEJfO8DzmJ3JO5bojHFWBvKk6Yo7uLTTYOM5Jxqe4s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PYNH0b+v/qBd32J+uRpoHH1NbscCmwvrwhPQxpOBSPdVa+P15/qI4Q8iBzzqKRg9f
 ub/5o+RXxF6H71dwu1MkGPWi1zFBvYUT46kXZsdlThrZoSj0yMPH/uukynghve2tnq
 rR/Fv4hoM2PxOdrrVkFruHBpThp79LpTGJb96O24Xx2mKBfDl33KHPmC3+UfyMoOpF
 4KQFBoyXuBE5LYF6SkwVeNWcuD/B2vuxwzwLfBW6ElOng4f38zxg0xDcD/uxqaL45e
 Gwolz5kRCVBqPJg6eyhw3CtxhZxTrF5T+ZITW0V0LLbGL44hoRM9XTW7uAIpV7/8Gq
 OJjteq1x93iLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/18] platform/x86/intel/pmt: Add helpers for
 callback info
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-25-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-25-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:40:31 +0000
Message-Id: <20260901194031.9A9561F000E9@smtp.kernel.org>
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
- [Low] Redundant ternary operators in boolean return statements.
--

commit 09f47b6dc79a278906ea09fc333daa7f323df46b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Add helpers for callback info

This commit refactors some open-coded callback checks into helper functions.

> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index 258cb460e61c2..d8291a5f08a71 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -71,6 +71,21 @@ struct intel_pmt_namespace {
>  				struct intel_pmt_entry *entry);
>  };
> =20
> +static inline bool is_cb_read_telem(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->read_telem ? true : false;

[Severity: Low]
This isn't a bug, but is the ternary operator necessary here? In C, evaluat=
ing
a pointer expression in a boolean context naturally resolves to true or fal=
se.
Returning `cb && cb->read_telem` directly is typically preferred to avoid
unnecessary complexity.

> +}
> +
> +static inline bool is_cb_read_reg(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->read_reg ? true : false;

[Severity: Low]
Does this code also need the explicit ternary operator, or would returning =
the
expression directly as a boolean be sufficient?

> +}
> +
> +static inline bool is_cb_write_reg(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->write_reg ? true : false;

[Severity: Low]
Could this similarly be simplified to avoid the `? true : false` construct?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D5
