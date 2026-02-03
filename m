Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A9E87830
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F85110E65E;
	Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwTttRae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C45B10E65E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770126761; x=1801662761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fQbHXoCdyaekadoYPcnDwDfrsxClnS69uXg6sAUXDKs=;
 b=MwTttRaeBafFWpkjvmbRD3l5yaWh88NMfv4wX4ynUDKlJpu5pqI5437j
 h2e+4EzVa0FFo9yW86NF9+v2SawtdbK4jQZDEFJP9FUWIETxsVlr0O446
 yldSrBqPdYk7bbP/Yh4xFvCz+9auZt0QyAZNPstJzMDosnB0URy60dIVu
 zq8p3frYZzKqSHSQ9CkoZFdiARO8kVK/9QkCptY+kjcI7cfLiaFI/svPv
 hPG7v+dUAs4kELfY9GjbCA4SqrQ8/+7VSXo+DqYRLDldeI4LBaV2dXF8f
 yPpZ4+wWS6xHOZozJBsxdDlCM4PTOdDSzb7NcHsGtY8KiBC1WnoIhiM+k A==;
X-CSE-ConnectionGUID: twIbOzv0Qrq8kJsX8FRkMg==
X-CSE-MsgGUID: BdrXMcsyQT6d7T2Adu6qqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71352320"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71352320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:52:39 -0800
X-CSE-ConnectionGUID: hw6Jj0WRTpSx/Sy4f9m4Sw==
X-CSE-MsgGUID: ozN9QPd2QDK1WI4o4n5xiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209874969"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:52:37 -0800
Date: Tue, 3 Feb 2026 14:52:34 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Soham Purkait <soham.purkait@intel.com>
Subject: Re: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Message-ID: <aYH9op_pHZE7YcV-@black.igk.intel.com>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
 <debe7ede-51ac-490d-8e3d-ac10a69a591f@intel.com>
 <aYH8IOX_kv2_7xxz@bvivekan-mob1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYH8IOX_kv2_7xxz@bvivekan-mob1>
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

On Tue, Feb 03, 2026 at 07:16:08PM +0530, Vivekanandan, Balasubramani wrote:
> On 02.02.2026 23:37, Michal Wajdeczko wrote:
> > On 2/2/2026 5:53 PM, Balasubramani Vivekanandan wrote:
> > > From: Soham Purkait <soham.purkait@intel.com>
> > > 
> > > Add check to verify if CSC is a PCIe endpoint via pcode mailbox
> > > during xe modprobe. If this mode is not supported, an auxiliary
> > > child device for the MEI driver is created as a fallback flow.

...

> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index 85cc7478b787..391a98c8b5fb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -35,6 +35,7 @@
> > >  #define     DGFX_GET_INIT_STATUS	0x0
> > >  #define     DGFX_INIT_STATUS_COMPLETE	0x1
> > >  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> > > +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
> > 
> > shouldn't this defined using REG_GENMASK ?
> 
> No, it is a value of 3 not a bitmask.

Then perhaps it should be in ascending order after DGFX_INIT_STATUS_COMPLETE?

Raag
