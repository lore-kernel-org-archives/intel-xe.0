Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A021C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 16:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190CE10E7A3;
	Wed,  6 Aug 2025 16:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2Rw9ieB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81010E7A3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754498329; x=1786034329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d9UiX+2JP5MV7NF3oPzjA+g4dPL29CQBdZtdbBWrbrc=;
 b=n2Rw9ieBGgFwMQgLMT7mGaZ5rHCh5ci1uDculrFUgf6oOU9N6M2l8r2e
 aY8ezWfF13VasCL+DbaWh+WjPDZcKrnfQrxsV8YeeC4NLvl6jvKBFd4g9
 hIXpc4tzJ3/YwpoG7pwGZO5zw0gKXKJjbUB8dGAAqKO3yw5NKlypjcX+G
 /kOmC8o64NFu1pBvj6mB5yvrVaDlz1rlee4Se9SSqoHrdRJLEfBdMBPVJ
 9F04y8mKTfsi+ZI01gsfqlIGO/FwlIDdweOfKzw47MpIm3JDZmlkBtMmA
 csqbQY1w4SkB7DW3V2xL7CMnZk5cvGjXB41TRHmjM1GYlCHtcBHnulQxt A==;
X-CSE-ConnectionGUID: gX6y2RGKQHGjrbeHvkvIbw==
X-CSE-MsgGUID: +AmnhxdHSricuB6J0v1LTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82268697"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="82268697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:38:49 -0700
X-CSE-ConnectionGUID: Y+xtuQz3SXicOnfhviHWEA==
X-CSE-MsgGUID: YQ3LG43+SK+/Fr5gi23mKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164024559"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:38:48 -0700
Date: Wed, 6 Aug 2025 18:38:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't expose mailbox attributes for
 skip_pcode cases
Message-ID: <aJOFFFXIx8ysMun2@black.igk.intel.com>
References: <20250806152256.748057-1-raag.jadav@intel.com>
 <157ffa826b02292dc383ab444e1cb11b5b77093f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <157ffa826b02292dc383ab444e1cb11b5b77093f.camel@intel.com>
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

On Wed, Aug 06, 2025 at 09:25:03PM +0530, Summers, Stuart wrote:
> On Wed, 2025-08-06 at 20:52 +0530, Raag Jadav wrote:
> > Commit a7f87deac229 ("drm/xe: Default auto_link_downgrade status to
> > false")
> > tried to fix the side effect of xe_pcode_read() returning
> > successfully
> > without valid data-out value. Since this is true for cases where
> > skip_pcode
> > flag is set, a much robust fix would be to not expose mailbox
> > attributes
> > at all for such cases.
> > 
> > v2: Check against skip_pcode (Stuart)
> > 
> > Fixes: a7f87deac229 ("drm/xe: Default auto_link_downgrade status to
> > false")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_sysfs.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index bd9015761aa0..75b6cd816fa8 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -264,8 +264,7 @@ auto_link_downgrade_status_show(struct device
> > *dev, struct device_attribute *att
> >  {
> >         struct pci_dev *pdev = to_pci_dev(dev);
> >         struct xe_device *xe = pdev_to_xe_device(pdev);
> > -       /* default the auto_link_downgrade status to 0 */
> > -       u32 val = 0;
> > +       u32 val;
> 
> Why are we making this change again? Looking at xe_pcode_read, which
> calls pcode_mailbox_rw with this value, the first thing we're doing
> with this is a write:
> xe_mmio_write32(mmio, PCODE_DATA0, *data0);
> 
> There's no NULL check here like we have for the second parameter in
> xe_pcode_read. So we need some initial value here so we don't write
> garbage.

Data-in value is only relevant for mailboxes that use it. So with
the introduction of skip_pcode fix here, not much use of redundant
initialization.

Raag

> >         int ret;
> >  
> >         xe_pm_runtime_get(xe);
> > @@ -291,7 +290,7 @@ static void xe_device_sysfs_fini(void *arg)
> >         if (xe->d3cold.capable)
> >                 sysfs_remove_file(&xe->drm.dev->kobj,
> > &dev_attr_vram_d3cold_threshold.attr);
> >  
> > -       if (xe->info.platform == XE_BATTLEMAGE) {
> > +       if (xe->info.platform == XE_BATTLEMAGE && !xe-
> > >info.skip_pcode) {
> >                 sysfs_remove_files(&xe->drm.dev->kobj,
> > auto_link_downgrade_attrs);
> >                 late_bind_remove_files(xe->drm.dev);
> >         }
> > @@ -308,7 +307,7 @@ int xe_device_sysfs_init(struct xe_device *xe)
> >                         return ret;
> >         }
> >  
> > -       if (xe->info.platform == XE_BATTLEMAGE) {
> > +       if (xe->info.platform == XE_BATTLEMAGE && !xe-
> > >info.skip_pcode) {
> 
> This part looks good. We have skip_pcode in the pcode_mailbox_rw
> routine, but these files are checking values here that don't make sense
> if we aren't reading them.
> 
> Thanks,
> Stuart
> 
> >                 ret = sysfs_create_files(&dev->kobj,
> > auto_link_downgrade_attrs);
> >                 if (ret)
> >                         return ret;
> 
