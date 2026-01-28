Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22842D3F081
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C6110E2CE;
	Wed, 28 Jan 2026 15:56:23 +0000 (UTC)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E1A10E72C;
 Wed, 28 Jan 2026 15:56:22 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 57D162009D01;
 Wed, 28 Jan 2026 16:56:21 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 43F1435135; Wed, 28 Jan 2026 16:56:21 +0100 (CET)
Date: Wed, 28 Jan 2026 16:56:21 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lenny Szubowicz <lszubowi@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Francesco Pompo <francescopompo2@gmail.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Message-ID: <aXoxpWFE0rByjS-y@wunner.de>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
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

On Wed, Jan 28, 2026 at 02:58:36PM +0000, Atharva Tiwari wrote:
> This series adds support for eGPUs on Apple products, by
> enabling apple-set-os on all apple devices.
> 
> A side effect of this patch is that the iGPU becomes enabled on iMacs.
> However, iMacs can’t use the iGPU to drive the display
> (They can't link-train the internal display),
> so displays must be disabled on iMacs.

Oh there's the explanation that should have been in the commit message
of patch [2/2].

It's possible that the iMac has a multiplexer built-in which can
switch between the iGPU and dGPU at runtime.  Please ensure that
you have set CONFIG_APPLE_GMUX=y in your .config, the gmux driver
should bind to the multiplexer if there is one.

If there is a multiplexer built-in, then disabling the iGPU is the
wrong approach.

Thanks,

Lukas
