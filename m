Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E54C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 14:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE2110E61D;
	Fri,  5 May 2023 14:50:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0310E624
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 14:50:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8553061085;
 Fri,  5 May 2023 14:50:54 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 8D10BC43442;
 Fri,  5 May 2023 14:50:52 +0000 (UTC)
Date: Fri, 5 May 2023 10:50:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFUXyufEB1Rflvpl@rdvivi-mobl4>
References: <20230425021921.1695760-1-kode54@gmail.com>
 <20230425021921.1695760-2-kode54@gmail.com>
 <d413ac6e-f1b8-7e47-418e-639864626bfa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d413ac6e-f1b8-7e47-418e-639864626bfa@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Enable the compat ioctl
 functionality
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 09:46:54AM +0200, Thomas Hellström wrote:
> 
> On 4/25/23 04:19, Christopher Snowhill wrote:
> > This is required at the minimum for the DRM UAPI to function from
> > 32-bit userspace with a 64-bit kernel.
> > 
> > Signed-off-by: Christopher Snowhill <kode54@gmail.com>
> 
> LGTM.
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Pushed. thanks for the patch and review.

> 
> 
> > ---
> >   drivers/gpu/drm/xe/xe_device.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 45d6e5ff47fd..00f1d9e386f1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -113,7 +113,7 @@ static const struct file_operations xe_driver_fops = {
> >   	.mmap = drm_gem_mmap,
> >   	.poll = drm_poll,
> >   	.read = drm_read,
> > -//	.compat_ioctl = i915_ioc32_compat_ioctl,
> > +	.compat_ioctl = drm_compat_ioctl,
> >   	.llseek = noop_llseek,
> >   };
