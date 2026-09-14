Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F85C88E70
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 11:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D3110E16B;
	Mon, 14 Sep 2026 11:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3PDcS23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F2010E16B
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789386017; x=1820922017;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QGJGAvJiIV6U8+17DUjDvpqfYkebUBMV8UowkP8wtZA=;
 b=Q3PDcS23MA0uPHKuWCbohBJXSkEopQf9YnWnpZZGCmqAayDin/b6C6y2
 1Rt+bbD9h4o/UueCkMQVLpKOZaB9K8480FPEt+EY0/Yv0xtMY3uAFQ9sE
 081HZX9TRoAcncplhJfkaPmzDj4LdCj5UZjWwAKprzIvfuOkYGLqqNcfu
 IOpgxBkhy2sLjQmvoZh6a3KUm3VhJz5naktsGRCyPpizBWhaxXHwscXLH
 3VfngssGBrepEX6XEYzPXaZ4igvoEnLN24JOuhKSTJOPxAjutluH7pwqp
 zVQ7VU/zYhH5N4tJ69n341MEH86UKSep/slu0lNd09U93sXwf22pl+s2M w==;
X-CSE-ConnectionGUID: Q89+XtJsTxuhBFjf5QuG1w==
X-CSE-MsgGUID: 2jba2SByQWmFZQg1Lj9Fow==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89865246"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="89865246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 04:40:17 -0700
X-CSE-ConnectionGUID: +fnUAwpNTOecpWk2rm7DYw==
X-CSE-MsgGUID: 7fHWdJP2Tk2+4z80SZAD1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="269985175"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.65])
 ([10.245.245.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 04:40:15 -0700
Message-ID: <086554d9370ee0e9ea24589454300eb394acb52c.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Make p2pdma distance check verbose via dynamic
 debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Mon, 14 Sep 2026 13:39:56 +0200
In-Reply-To: <eff47fd6-7108-4561-927b-d01749937d48@intel.com>
References: <20260914094641.8779-1-thomas.hellstrom@linux.intel.com>
 <eff47fd6-7108-4561-927b-d01749937d48@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Mon, 2026-09-14 at 12:34 +0100, Matthew Auld wrote:
> On 14/09/2026 10:46, Thomas Hellstr=C3=B6m wrote:
> > pci_p2pdma_distance() can optionally print details about how it
> > computed the ACS/PCIe topology distance between the two devices,
> > but
> > xe_dma_buf_attach() always called it with verbose set to false,
> > silently hiding useful diagnostics whenever a dma-buf attach unset
> > attach->peer2peer.
> >=20
> > Tie the verbose argument to a dedicated dynamic-debug callsite
> > tagged
> > "xe dma-buf p2p debug" (in addition to keeping the existing
> > DRM_UT_DRIVER category as a default), so the extra p2pdma distance
> > logging can be switched on without a recompile in any of the
> > following
> > ways:
> >=20
> > =C2=A0 - Enable the whole DRIVER category for xe via drm.debug, which i=
s
> > =C2=A0=C2=A0=C2=A0 already used elsewhere in the driver:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # echo 0x10 > /sys/module/drm/parameters=
/debug
> >=20
> > =C2=A0 - Enable dynamic debug for the whole file:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # echo 'file xe_dma_buf.c +p' > \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /sys/kernel/debug/dynamic_debug/control
> >=20
> > =C2=A0 - Enable dynamic debug for just this callsite by function name:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # echo 'func xe_dma_buf_attach +p' > \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /sys/kernel/debug/dynamic_debug/control
> >=20
> > =C2=A0 - Enable dynamic debug by matching the format string used to
> > =C2=A0=C2=A0=C2=A0 register the callsite:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # echo 'format "xe dma-buf p2p debug" +p=
' > \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /sys/kernel/debug/dynamic_debug/control
> >=20
> > =C2=A0 - Enable it at boot via the dyndbg=3D kernel command line
> > parameter:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dyndbg=3D"func xe_dma_buf_attach +p"
> >=20
> > Any of the above flips verbose_p2p_dist to true for that attach
> > call,
> > causing pci_p2pdma_distance() to log its distance calculation
> > without
> > requiring the whole DRM_UT_DRIVER category to be enabled.
>=20
> Is drm.debug not enough here for typical usescases?=C2=A0 If you are=20
> interested in this you would maybe toggle that anyway, in case there
> is=20
> other interesting stuff? Or do you think the dynamic debug will be
> useful?

There are cases where we just want to check just if p2p is enabled. And
normally IIRC you can do this by targeting a separate pr_debug or
drm_debug using dynamic debug. But since this one triggers printouts in
the p2pdma code, it seems like this construct is neecessary.

>=20
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Assisted-by: LLM
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Either way,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,
Thomas

>=20
> (With the ifdef guard or so)
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c | 10 +++++++++-
> > =C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 5d9f1cd24b7f..b63fd70fb4de 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -22,13 +22,21 @@
> > =C2=A0=20
> > =C2=A0 MODULE_IMPORT_NS("DMA_BUF");
> > =C2=A0=20
> > +static void xe_ddebug_flip_bool(const struct _ddebug *desc, bool
> > *flag)
> > +{
> > +	*flag =3D true;
> > +}
> > +
> > =C2=A0 static int xe_dma_buf_attach(struct dma_buf *dmabuf,
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *atta=
ch)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> > +	bool verbose_p2p_dist =3D drm_debug_enabled(DRM_UT_DRIVER);
> > +
> > +	_dynamic_func_call("xe dma-buf p2p debug",
> > xe_ddebug_flip_bool, &verbose_p2p_dist);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (attach->peer2peer &&
> > -	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(to_pci_dev(obj->dev->dev), att=
ach-
> > >dev, false) < 0)
> > +	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(to_pci_dev(obj->dev->dev), att=
ach-
> > >dev, verbose_p2p_dist) < 0)
> > =C2=A0=C2=A0		attach->peer2peer =3D false;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!attach->peer2peer &&
> > !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
