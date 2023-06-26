Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B50EEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 15:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5AC10E229;
	Mon, 26 Jun 2023 15:23:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2CE10E229
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687792988; x=1719328988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qPYywQ9wPY3W+YFiU/PLqbwejXmPzwzN/cxUkQgWzqU=;
 b=Xi4QmfZR/bNhSgQ0c2wBEu+9/4uPw7AJvzcjCZWJ5MWyawqOxNtQv8zb
 LqcN39I/ntyejpJ7ScuKK8TkLF3WqF81oGfmY+CIA0RFIJan/2kGNRUic
 xWcCf4vvb25ZOgDG641/xxMXHF+guzRINUUS6/xwjN8L2vwVf2JbJZ9Pu
 8wZMPjQSSZ1r5ae6V73jic0knpUszD7GHRziKbZ22Ug52qrSVpVEzlx7+
 LNjba7WxXZseoXl0eX5a5iWVtK+xklLvrHugejiFA9JqZbPIiuzLKI5D9
 gONz/1RHNBGZc2GG4YJ/kirvmOeGDdrHz2OIrBedA9hwAaBuRAmmRSYtG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346054323"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="346054323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 08:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890311771"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="890311771"
Received: from ashlykov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.0.92])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 08:22:37 -0700
Date: Mon, 26 Jun 2023 17:22:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230626152234.f5ud4klmqqm5lb72@zkempczy-mobl2>
References: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
 <06d040ea-c25b-9fdc-aa22-6e0f543a734f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06d040ea-c25b-9fdc-aa22-6e0f543a734f@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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

On Mon, Jun 26, 2023 at 04:55:29PM +0200, Thomas Hellström wrote:
> Hi, Zbigniew,
> 
> On 6/26/23 16:42, Zbigniew Kempczyński wrote:
> > Driver may alter bo size requested by the user. Return real object
> > size to make userspace aware how to arrange vm bindings.
> 
> I think for Xe VM_BIND, the space needed for a bo with given size must be
> 
> ALIGN_TO(bo->size, xe_get_default_alignment())
> 
> (xe_get_default_alignment() being an igt xe lib function).

You mean I can't glue 4K system object with 64K one after another,
for example:

* bo on system: offset = 0x1000, size 0x1000
* bo on vram:   offset = 0x2000, size 0x10000

This won't work as vram object should be aligned on vm to 0x10000?

--
Zbigniew

> 
> Even the padded bo->size returned with this patch is lower than the value
> above. If you use that value, will the value assigned below still be needed.
> 
> /Thomas
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 71a14e1f25be..55dbb374a787 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1744,6 +1744,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >   		return err;
> >   	args->handle = handle;
> > +	args->size = bo->size;
> >   	return 0;
> >   }
