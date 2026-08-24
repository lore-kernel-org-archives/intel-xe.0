Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1533C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 17:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD3710E188;
	Mon, 24 Aug 2026 17:49:37 +0000 (UTC)
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Mon, 24 Aug 2026 17:49:35 UTC
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net
 [144.76.133.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C910E188
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 17:49:35 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by mailout3.hostsharing.net (Postfix) with ESMTPS id 6D7A1C13;
 Mon, 24 Aug 2026 19:43:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 23FAB602E77D; Mon, 24 Aug 2026 19:43:40 +0200 (CEST)
Date: Mon, 24 Aug 2026 19:43:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/ras: Enable SGUnit PCIe error reporting
Message-ID: <aoyCzBwTG8BfdxMb@wunner.de>
References: <20260824164850.607937-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824164850.607937-1-raag.jadav@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2026 at 10:18:50PM +0530, Raag Jadav wrote:
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

... except for:

> +MODULE_IMPORT_NS("CXL");

This is indeed quite hackish.  It would seem cleaner to rename the
namespace to "AER" in drivers/pci/pcie/aer.c as part of this patch
or in a preparatory patch.

Thanks,

Lukas
