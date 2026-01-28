Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D2FD3F083
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E490710E725;
	Wed, 28 Jan 2026 15:51:12 +0000 (UTC)
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 15:51:11 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5270B10E6EE;
 Wed, 28 Jan 2026 15:51:11 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id B820B20091A5;
 Wed, 28 Jan 2026 16:45:25 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id A8116351C5; Wed, 28 Jan 2026 16:45:25 +0100 (CET)
Date: Wed, 28 Jan 2026 16:45:25 +0100
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
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Message-ID: <aXovFQsk-w90wZi1@wunner.de>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
 <20260128145855.1071-2-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128145855.1071-2-atharvatiwarilinuxdev@gmail.com>
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

On Wed, Jan 28, 2026 at 02:58:37PM +0000, Atharva Tiwari wrote:
> Make apple-set-os run on all macs, as
> apple-set-os is needed to use eGPUs and iGPU.

As discussed previously, your patch will regress older MacBook Airs
which use SPI to access keyboard + trackpad if the set_os protocol
is invoked:

https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/

The last time this topic came up, I suggested counting the number of
GPUs instead of using the DMI quirk.  I even provided a patch but
nobody with an eGPU bothered to test it, so the thread fizzled out:

https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/

Maybe you could give it a spin and verify if it fixes the issue for you?

Thanks,

Lukas
