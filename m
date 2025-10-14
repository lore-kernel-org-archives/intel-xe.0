Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB415CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 04:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708A910E050;
	Tue, 14 Oct 2025 04:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXIdwW3N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB610E050
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 04:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760417556; x=1791953556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=voAhILJ3UvppWMemhzqZrdgmbWL+N18hdxETW1PLQ+0=;
 b=jXIdwW3NvVGsGDXYHQBZTkqq0T48e8dzJRjM5a03zPAQdyA97FMbA8tL
 BpzoXTtnUU4xG4o0QV9B8Z8EpOh5FfUjOdDju/foVrQTBJvhwxSQvheoN
 BmU3ZaFgpjYisXQl88KABXA+a9VF3db5dnzk3PN61M4V8C28GPsdTpFIg
 vcbUYc5Vai50mcdmC0SzS92URH0Oci2j6RkDsIB25OcQO6wZ+0pBuyTie
 mXhj9nRteRmkd9spEc+Pqp2a0FBghFHIak2ngGCXJWYf04i1me7MteKXb
 mwCeOXxfXIvNHgicPqyJKCIHr54RvCMw99IBHjFh00Gl7+lWlLimLl0ie g==;
X-CSE-ConnectionGUID: 8BNVNE95RWGKKfM0pJzgTg==
X-CSE-MsgGUID: NmFRU2TdTYKbMQBZGxv4cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88031100"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88031100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 21:52:36 -0700
X-CSE-ConnectionGUID: PTpaK/RLQ5CdXX0EJtiwQA==
X-CSE-MsgGUID: V9FNEcURSXea0QnM97HUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="218915600"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 21:52:34 -0700
Date: Tue, 14 Oct 2025 06:52:31 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, riana.tauro@intel.com
Cc: rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com
Subject: Re: [PATCH v3 0/2] Wire up reset/postinstall for I2C IRQ
Message-ID: <aO3XD6iOuXfXTQRG@black.igk.intel.com>
References: <20251011123509.3233213-1-raag.jadav@intel.com>
 <176036737835.1701571.11729682859198230623.b4-ty@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176036737835.1701571.11729682859198230623.b4-ty@intel.com>
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

On Mon, Oct 13, 2025 at 07:57:06AM -0700, Lucas De Marchi wrote:
> On Sat, 11 Oct 2025 18:05:07 +0530, Raag Jadav wrote:
> > This series wires up reset/postinstall handles for I2C IRQ so that it
> > can be routed to SGunit or PUnit when needed.
> > 
> > v2: Integrate DISABLE_MSI_CAP changes (Heikki)
> > v3: Drop DISABLE_MSI_CAP changes as they are not required for the usecase
> > 
> > Raag Jadav (2):
> >   drm/xe/i2c: Introduce xe_i2c_irq_present()
> >   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
> > 
> > [...]
> 
> Merged to drm-xe-next, thanks!

Awesome.

Riana, I noticed we never actually xe_irq_install() in survivability mode
and I'm not sure if I2C controller will work without it.

Anything to worry about there?

Raag
