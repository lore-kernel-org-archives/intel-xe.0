Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA8606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gtz4zsbt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B402D10E504;
	Fri, 23 Oct 2026 02:33:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F910E504
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792722774; x=1824258774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pLA9qaYP2n3TGpNgGJ8w7uikSg1d0odQW6rnpFGCSpc=;
 b=gtz4zsbttJAOl8CyJ16OET7JIdW+XY3Db9/1BfDtJjmyK4BA08OLLSFh
 wVubm+agwAubFuLAOZyuFRA/AsOftPcg0MHWmHivY3djVQDIoQ9SmX9WA
 NuqlktdoH90qhO6m93r4A110iRrffBE8b+HJJrjRzl6/TZX0T+MXklobp
 aEWl3FgYHUWGZfY8r6yTGrYyd5wC1aM7POfQVQhkJ+R+q4w6Sjvw9XMeW
 JapphtpjCJscBB35VJ2oWsd78CMoO63E1ztpBBuUDTHm8Ei4RzgRkjjS/
 ZD/V0wG4oJvgQJhzA6zqeu0PMKb33AEp5r/CDD3/kvzDK5Z4vatu4SI0C Q==;
X-CSE-ConnectionGUID: Zu6D++N6SX2ihrlP1SzZrw==
X-CSE-MsgGUID: FoE90YF/SeON0XcQqfiwxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1369111"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1369111"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 19:32:54 -0700
X-CSE-ConnectionGUID: nAsuAxxbTTmCMBVjBRDQbg==
X-CSE-MsgGUID: 710a6nr4Qxe7MI0vsVKwIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="5364487"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 19:32:51 -0700
Date: Fri, 23 Oct 2026 04:32:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, riana.tauro@intel.com,
 mallesh.koujalagi@intel.com, aravind.iddamsetty@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com,
 pravalika.gurram@intel.com
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
Message-ID: <atrHUMcymdVC9T-l@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
 <03767785-851a-4b84-8271-388d33d7669c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03767785-851a-4b84-8271-388d33d7669c@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
> 
> On 22-10-2026 19:10, Nilawar, Badal wrote:
> > 
> > 
> > On 14-10-2026 16:00, Raag Jadav wrote:
> > > > +static const struct xe_platform_id_entry xe_platform_ids[] = {
> > > > +	/* 0x674C  platform/8086:674c */
> > > > +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> > > > +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
> > > > +	/* 0x674D  platform/8086:674d */
> > > > +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
> > > > +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
> > > > +	/* 0x674E  platform/8086:674e */
> > > > +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
> > > > +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
> > > > +	/* 0x674F  platform/8086:674f */
> > > > +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
> > > > +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
> > > > +	/* 0x6750  platform/8086:6750 */
> > > > +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
> > > > +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
> > > > +	/* 0x6751  platform/8086:6751 */
> > > > +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
> > > > +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
> > > > +};
> > > This is unrelated to cper and shouldn't be here. I'll rely on Matt's
> > > input on how to deal with these.
> > 
> > Agreed, I don't think this is the ideal place either. For now, I'll keep
> > it here and, based on Matt's input, consider moving it to xe_pci.c,
> > which maintains the PCI ID list for the platforms supported by Xe.
> > 
> One reason I placed the table here is that these aren’t general-purpose
> platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
> platform_id field, using platform/8086:<device-id> as the name.
> 
> Since CPER is their only consumer, keeping the mapping with the CPER code
> seems reasonable to me.  I’m happy to follow Matt’s input if there’s a
> preferred place for this kind of mapping.

My only concern is that we usually don't have device ids lying around in
random components, but that I think is upto the maintainers.

Raag
