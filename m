Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66506D358F5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 10:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45710E31D;
	Thu, 29 Jan 2026 10:33:03 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EFB10E24F;
 Thu, 29 Jan 2026 10:33:02 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6712B2C06849;
 Thu, 29 Jan 2026 11:33:00 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5E92C2639F; Thu, 29 Jan 2026 11:33:00 +0100 (CET)
Date: Thu, 29 Jan 2026 11:33:00 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, ardb@kernel.org, bp@alien8.de,
 dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Message-ID: <aXs3XOYucVna8eGH@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
 <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
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

On Thu, Jan 29, 2026 at 04:37:59AM +0000, Atharva Tiwari wrote:
> > As discussed previously, your patch will regress older MacBook Airs
> > which use SPI to access keyboard + trackpad if the set_os protocol
> > is invoked:
> > 
> > https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/
> > 
> > The last time this topic came up, I suggested counting the number of
> > GPUs instead of using the DMI quirk.  I even provided a patch but
> > nobody with an eGPU bothered to test it, so the thread fizzled out:
> > 
> > https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/
> > 
> > Maybe you could give it a spin and verify if it fixes the issue for you?
> 
> I tested your patch, and well it works (you still need the 2nd patch to 
> avoid a blank screen), but i can see how this will fail
> like for example, with the iMacPro (only has dGPU) you would need 2 eGPUs
> to turn on apple-set-os.

I don't quite follow.  The patch counts the number of GPUs and
uses the set_os protocol if there are at least 2 of them.
One dGPU + one eGPU = 2, so the protocol is used.

Am I missing something?

Thanks,

Lukas
