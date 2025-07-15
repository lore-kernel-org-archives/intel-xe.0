Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E0C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 03:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ACF10E500;
	Tue, 15 Jul 2025 03:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0nP5r4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4010E500
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752551855; x=1784087855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=escPyHmMoJm66TTlhJfQf9HOCUsflDNeFPa0PDNHNOk=;
 b=G0nP5r4w5iHvbuUcp3YFXhGiJUJFR6v4Ril4fnNfOvJDvXNh7KnlbT9b
 Gl54InMicLY3B28cdOLddvZt8uGLUsb0SWk4iuO0Utlwe5DHMtAe01y3M
 tj58IbvZOOhXBqR0HGiL43f3ZGK5l11bWusRS2miT9U2OY1ot8VnkAuuf
 T6cKSDkeAaKLeRBN+AnnTWGOYE7tOFOUiHYyNfpVxgQg4SPpS1djoE0yF
 aqakCnBYmLtnAFfVYj51qvexWdyTDlwn+Sm4xmJn22Gb/ytsY2ripes/3
 k08Y4zW55q6CWMJvkYcL8CRdLARWTfy5/OISmZI1a49jXl9VCIRhoO5yy w==;
X-CSE-ConnectionGUID: 81LCcB1VShWKjVZbeWufyg==
X-CSE-MsgGUID: Zx3ci+KfRe+h9JjXFpgS9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53871160"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="53871160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 20:55:52 -0700
X-CSE-ConnectionGUID: cuPjtOkbSH2bFG75EWq8xA==
X-CSE-MsgGUID: QVcNmF8XR3qcS/+ND2fSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157655479"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 20:55:50 -0700
Date: Tue, 15 Jul 2025 06:55:44 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Message-ID: <aHXRQKfgVo4rDYBX@black.fi.intel.com>
References: <20250711190808.2743402-1-raag.jadav@intel.com>
 <f81ace5191cc4e7ca1023d69ff88253afaeb6638.camel@intel.com>
 <aHHHTOdaSAUdNGkq@black.fi.intel.com>
 <555ca90e14209445dd5ced8f95ce729fe9b2fda4.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <555ca90e14209445dd5ced8f95ce729fe9b2fda4.camel@intel.com>
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

On Mon, Jul 14, 2025 at 09:00:54PM +0530, Summers, Stuart wrote:
> On Sat, 2025-07-12 at 05:24 +0300, Raag Jadav wrote:
> > On Sat, Jul 12, 2025 at 02:19:50AM +0530, Summers, Stuart wrote:
> > > On Sat, 2025-07-12 at 00:38 +0530, Raag Jadav wrote:
> > > > Commit a7f87deac229 ("drm/xe: Default auto_link_downgrade status
> > > > to
> > > > false")
> > > > tried to fix the side effect of xe_pcode_read() returning
> > > > successfully
> > > > without valid data-out value when xe->info.skip_pcode is set.
> > > > Since
> > > > this
> > > > is true for IS_SRIOV_VF() cases, a much robust fix would be to
> > > > not
> > > > expose
> > > > device attributes for VFs, which covers wider pcode mailbox
> > > > users.
> > > 
> > > I'm not fully understanding your reasoning here. Why can't we just
> > > use
> > > a check against skip_pcode in that case? VF might be the main user
> > > there, but it isn't inconceivable that we will use that in other
> > > scenarios too and then hit a similar problem of accessing an
> > > uninitialized variable.
> > 
> > This also covers non-mailbox attributes which would be unusable for
> > VFs.
> > So we can either fix the commit message or use skip_pcode check
> > against
> > mailbox attributes, whichever makes more sense.
> 
> Can you add both skip_pcode and IS_SRIOV_VF to the check because these
> really are independent cases.

So perhaps they should be independent patches?

Considering non-mailbox attributes aren't necessarily related to the
problem here, I'm in favor of using skip_pcode for now.

Raag

> > > > Fixes: a7f87deac229 ("drm/xe: Default auto_link_downgrade status
> > > > to
> > > > false")
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > index e5fd0cd537bc..8250aa4620ee 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > @@ -259,8 +259,7 @@ auto_link_downgrade_status_show(struct device
> > > > *dev, struct device_attribute *att
> > > >  {
> > > >         struct pci_dev *pdev = to_pci_dev(dev);
> > > >         struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > -       /* default the auto_link_downgrade status to 0 */
> > > > -       u32 val = 0;
> > > > +       u32 val;
> > > >         int ret;
> > > >  
> > > >         xe_pm_runtime_get(xe);
> > > > @@ -297,6 +296,9 @@ int xe_device_sysfs_init(struct xe_device
> > > > *xe)
> > > >         struct device *dev = xe->drm.dev;
> > > >         int ret;
> > > >  
> > > > +       if (IS_SRIOV_VF(xe))
> > > > +               return 0;
> > > > +
> > > >         if (xe->d3cold.capable) {
> > > >                 ret = sysfs_create_file(&dev->kobj,
> > > > &dev_attr_vram_d3cold_threshold.attr);
> > > >                 if (ret)
> > > 
> 
