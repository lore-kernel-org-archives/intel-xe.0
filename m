Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF914C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0110E011;
	Tue, 25 Aug 2026 05:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h6jhesz8";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDF510E011
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 05:49:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B295040115;
 Tue, 25 Aug 2026 05:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BA81F000E9;
 Tue, 25 Aug 2026 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787636980;
 bh=ChXVvPRNqiCPiIDDjeHPpYTYuw0wt0pt7DMfc3pcN2g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h6jhesz8muj7zvXjNpAVyS75juzRVuij42NRnRQcO+u5QH0O8kMjPYFPhvFqGchxt
 w4jvWE8ZQ1n/ulddLpFWICTq5US68hD8/joom7Y+EUT1oicghYUhLZmp86SYSv9pM0
 AzZgO0Jmdu0R30Zd6xlB8pAHQ2lVNJ/pEO3ALfr9F+4BHEF6CBAxhw7G+SB1su0Gpt
 9TjNrlYlqJExBaC/hcBXDtc5iiQQz/OvHwMFLEG4Qx7TleuaNG65yn+N38s4SmxBh/
 aDYgBm2Krqf92v0EuSlBFnBYpMjm5Zh0aswfCSFsbvAGhynApjRu4AFnwi+yFGz5Xh
 F4NJgC2VXIlwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] PCI/AER: Export pcie_aer_is_native() to AER
 namespace
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: linux-cxl@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-pci@vger.kernel.org
In-Reply-To: <20260825054312.1319951-2-raag.jadav@intel.com>
References: <20260825054312.1319951-1-raag.jadav@intel.com>
 <20260825054312.1319951-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 05:49:39 +0000
Message-Id: <20260825054940.55BA81F000E9@smtp.kernel.org>
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

> pcie_aer_is_native() was originally exported to CXL namespace in commit
> 49f776724e64 ("PCI/AER: Export pcie_aer_is_native()"). This is a bit
> misleading as the symbol or its underlying implementation does not reflect
> any distinguishable CXL functionality.
>=20
> Change this and export pcie_aer_is_native() to AER namespace, which is
> cleaner and more suitable for its implementation.
>=20
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054312.1319=
951-1-raag.jadav@intel.com?part=3D1

