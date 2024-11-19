Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6939D4922B
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 16:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE3910E68C;
	Tue, 19 Nov 2024 16:37:26 +0000 (UTC)
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2024 16:37:24 UTC
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAACA10E689;
 Tue, 19 Nov 2024 16:37:24 +0000 (UTC)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
 by smtp.dudau.co.uk (Postfix) with SMTP id B9E3A4172F4C;
 Tue, 19 Nov 2024 16:29:53 +0000 (GMT)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation);
 Tue, 19 Nov 2024 16:29:53 +0000
Date: Tue, 19 Nov 2024 16:29:53 +0000
From: Liviu Dudau <liviu@dudau.co.uk>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <Zzy9Afen1GhV/DHm@bart.dudau.co.uk>
References: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
 <20241118150816.GA3706736@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118150816.GA3706736@thelio-3990X>
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

On Mon, Nov 18, 2024 at 08:08:16AM -0700, Nathan Chancellor wrote:
> On Thu, Oct 31, 2024 at 02:41:38PM +0100, Maarten Lankhorst wrote:
> > Cristian Ciocaltea (3):
> >       drm/rockchip: Add basic RK3588 HDMI output support
> 
> Can someone please apply [1] to resolve a link time failure seen with
> 32-bit clang builds? I am still seeing it in -next and my ping on the
> patch does not appear to be seen...
> 
> [1]: https://lore.kernel.org/20241018151016.3496613-1-arnd@kernel.org/
> 
> Cheers,
> Nathan

Pushed to drm-misc-next.

Best regards,
Liviu


-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!
