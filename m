Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8D606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrphNaVF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A298D10F066;
	Tue, 10 Nov 2026 18:46:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E0810F13E
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:46:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B052840AEA;
 Tue, 10 Nov 2026 18:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B991F0089F;
 Tue, 10 Nov 2026 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794336393;
 bh=4hjePX0f6OjHMyJkhHwTQmieEOaIAE0SvUc4HAEIaeQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NrphNaVFvI9ZYLmyCroPAzMwNNVj6tT1D/a6VAWDOoELvzbWeqhZAU8i+QFC1O2Hm
 y55H4fj2ALxMtgIFn5pVD52YnR8oZY/F1Z5lcl3aDk7TeRWCWwENg+OOLEpcGw8R7M
 n1zpT55iZ4W4PeejGiD76STltfNoLEY3KKIhQ3RaFMByBDar8HgeVTEZFc5ehG9wkE
 CznvJN9zUJy9CouSlwFM+p5RAAlYTx3lpWMzP339zWM7L7gAdTt1AQxvRCr7q5MsKj
 fFNbk6og5wMXWDK8AIxUFcM8bC44fdVWkvlMCMihMe8CaWADMbtBqesFP5yrEM7PTo
 2KiiCjBf15a/A==
Message-ID: <sashiko-outbox-207605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 01/17] drm/xe/vsec: VSEC requires soc-remapper
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110183505.694124-20-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
 <20261110183505.694124-20-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:46:32 +0000
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
- [Low] drm/xe/vsec: missing Fixes trailer for commit 32eab46a6160
--

commit faf5d6652027b4edb9810b0e860293174d8557a8
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

> drm/xe/vsec: VSEC requires soc-remapper
>
> Survivability mode includes xe_vsec_init().  VSEC requires
> the soc remapper to be initialized.
>
> Add the correct init to allow correct VSEC behavior.
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

[Severity: Low]
Since 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from
VSEC code") switched xe_pmt_telem_read() to require
xe->soc_remapper.set_telem_region without initializing the SoC remapper in
enable_boot_survivability_mode(), should this include:

  Fixes: 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from V=
SEC code")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110183505.6941=
24-19-michael.j.ruhl@intel.com?part=3D1
