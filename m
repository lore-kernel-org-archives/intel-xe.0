Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wh5bYZ2D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15A6112687;
	Thu, 26 Nov 2026 18:04:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A5D10E903;
 Thu, 26 Nov 2026 18:04:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E0A060E32;
 Thu, 26 Nov 2026 18:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A056C1F000C6;
 Thu, 26 Nov 2026 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795716270;
 bh=fx+YOTtYTTwmMO8n6ahNZgUwos7BdkzKR4q6rV4vnO0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Wh5bYZ2De5YM3Fq4FbHq7SxBP/p3dWEQ+Clnd3+iVDKzyE3RqSNu9MpBAAI+17RSz
 LFyktu4Px4+P4q9SWYjyWm8pxpnY3nA1nUvo0HQ4Ne95yeedWeaxlZxoiIBSGEewi8
 742D5IiLS6dJJRmIgdd/bwiEZ8+ED1oSlNK8UIAKIlKjyskIReNaZL48OFq3j2goKx
 gKLBcCQZFf1jgFgHD0KS+chwWZTHSCYKiwbE8x+DEMMm9sViNHP9k51OZT16dsoYH6
 Om2+tVliwx/w0dbiwvNw9U+UlTGxLFdhQOoklXz0gGBn2C+ODwar8QQgWoMgsXWi4j
 /SJbdpcthnnug==
Message-ID: <sashiko-outbox-235989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] drm/i915/bios: check if VBT#57's tables are zeroed
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126175033.181407-3-michal.grzelak@linux.intel.com>
References: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
 <20261126175033.181407-3-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:04:30 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/i915/bios: whole-block zero check in
  parse_vswing_preemph_override()
- [Medium] drm/i915/bios: u32 underflow in
  parse_vswing_preemph_override() size check
--

commit 8d486a542cefe34b382644665b58bbe94c62cdf9
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

drm/i915/bios: check if VBT#57's tables are zeroed

This commit skips storing VBT block 57 metadata and allocating per-port
override buffers when the vswing/pre-emphasis override tables are zeroed.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 080a76a95136d..d27fee52bc447 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2227,6 +2227,12 @@ parse_vswing_preemph_override(struct intel_display=
 *display)
>  	if (!block)
>  		return;
> =20
> +	/* adjust size for num_tables and num_columns fields */
> +	if (mem_is_zero(block->tables, get_blocksize(block) - 2)) {
> +		drm_dbg_kms(display->drm, "VBT#57 tables are zeroed\n");
> +		return;
> +	}

[Severity: Medium]
Can checking the entire block->tables buffer at once still leave an
individual port with an all-zero override table when block 57 is only
partially populated?

block->tables contains multiple sub-tables indexed by PHY type and link
rate (such as tables 0..3 in intel_bios_get_c10_vspeo() and tables 4..5 in
intel_bios_get_c20_vspeo()).  If one sub-table in block 57 has non-zero
entries while the sub-table selected for another port or link rate is all
zeroes, mem_is_zero() across the whole block returns false, and
intel_bios_get_*_vspeo() still overrides the default PHY translation table
with zeroes and breaks link training.  Should the zero check be done on the
selected sub-table slice (num_rows * num_columns * sizeof(u32) bytes at
idx * num_rows * num_columns) in intel_bios_get_*_vspeo() instead?

[Severity: Medium]
Can get_blocksize(block) - 2 underflow if a malformed VBT header reports a
block size of 0 or 1?

init_bdb_block() allocates max(min_size, block_size) + 3 bytes for the BDB
entry, but copies the raw 3-byte BDB header without updating the 16-bit
size field when block_size < min_size:

drivers/gpu/drm/i915/display/intel_bios.c:init_bdb_block() {
	...
	entry =3D kzalloc_flex(*entry, data, max(min_size, block_size) + 3);
	...
	memcpy(entry->data, block - 3, block_size + 3);
	...
}

get_blocksize(block) returns that raw 16-bit size as a u32, so subtracting
2 without first checking get_blocksize(block) >=3D sizeof(*block) wraps to
0xfffffffe or 0xffffffff and passes that length to mem_is_zero(), causing
an out-of-bounds read past entry->data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126175033.1814=
07-1-michal.grzelak@linux.intel.com?part=3D2
