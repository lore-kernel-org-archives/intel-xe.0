Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B5D462A1
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 13:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C8F10E703;
	Wed, 13 Nov 2024 13:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUE/RWQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0324710E701
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731505928; x=1763041928;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5gnjo0Mo/hyJj/FBons/6588lTC0Rh3tyKk9cmUlhTQ=;
 b=lUE/RWQUl2dYthYeLmi+D/g2Y5QYxlUcNgPGRpKCilSQB3EG2D+SYEAK
 18ytRWLczuWRFBx35EOEGMjQHSvTI3BEV0yy3thGhZchTRAesJD1ss/PZ
 COKSMGuxfkY5wumbXap8IDTT9sXbL+eRxZWUc2+/QfnQ60LBwiqF6w/SO
 Uo2aoDwcM+tQeKuFsuHytCB7iNZDvR6zBM4b0NvUydN0G7WFKRTwSWmfl
 pKYT7fz0PjvE5n89rWdxIxS8xQoE6kGkIIBa4a//jO2TfEEcdD/4dTADL
 Fg/fQH6VGUNNVCwjtmDutrLV9RfZWB1bbU0/7fzGaxwabjpQa47yjL8ji Q==;
X-CSE-ConnectionGUID: k4/WBxwtTzG5jtplX29gdw==
X-CSE-MsgGUID: 7Hkc0hX3TFaG3uukt1XAFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35107426"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35107426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 05:52:07 -0800
X-CSE-ConnectionGUID: mL4eRuMiTVisyybXyWJnfA==
X-CSE-MsgGUID: n/x28AX8SimxwAcqF1N4UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92957373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 05:52:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 13 Nov 2024 15:52:01 +0200 (EET)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 david.e.box@linux.intel.com, Hans de Goede <hdegoede@redhat.com>, 
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
In-Reply-To: <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
Message-ID: <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 13 Nov 2024, Andy Shevchenko wrote:

> On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > Updates for PMT to support user offsets from the sysfs API.
> > 
> > Addressed review comments for the Xe driver udpates.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> If you have wish and time, there are problems with the drivers of different
> severities (from "fine as is" to "good to be fixed, but okay as is") I have
> noticed so far:
> - it uses s*printf() instead of sysfs_emit*()
> - it most likely never tested the corner cases. e.g.,
> 
> 	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
> 	    (disc_res->start <= pci_resource_end(pci_dev, i))) {
> 
>   what is this supposed to mean? Probably someone wanted resource_contains() or
>   alike to be called here.
> - slightly above the above piece the for-loop
> 
> 	for (i = 0; i < 6; i++)
> 
>   which probably want to use PCI_STD_RESOURCE_END)

While both work, in practice PCI_STD_NUM_BARS is way more common than 
PCI_STD_RESOURCE_END.

-- 
 i.

