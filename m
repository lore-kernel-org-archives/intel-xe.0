Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF25C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 15:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9A10E1F2;
	Tue, 25 Aug 2026 15:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExH+e9pd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46F010E1F2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787670028; x=1819206028;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=djbm7y0+FkCYYm4NIgaW/JaD/0F91KLSwmaHyoh0/C4=;
 b=ExH+e9pdzwmzZdjoutfagYii2UIBfzmv4nChZKNkENQmvyynTSUmRbcN
 jABRYA7TPjsSINg7MoheCpvr97YGr4307g2vTu+mpt+/SSzE3xcOBvN5U
 Le7EmjIIJfV47kSkJGwlfpc/HW7pBhGSqWBzliIcVXyiTR3fLQUDVi9D+
 ZGbRJoetLn4LK1ZcQgrrEo9Ia51P3YESH/riAENE3iL/zVi3wK9GMSOfs
 kzl4mbehkbwi+VNxzXSNEysrKrhA3s3mSsgtxkk0Pxx2znjlLI6udxDDG
 Xn/swCZv/8ayIt1gDsV+uPsHRHii6JYA6wi8UFMt30BktAeAOj36ZBntB A==;
X-CSE-ConnectionGUID: 5aEajZHiSY+GKlZtSeBzHw==
X-CSE-MsgGUID: S+mrqaawTGmJ/XQgZC1ceg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98729124"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="98729124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:00:26 -0700
X-CSE-ConnectionGUID: enzCpgCXQvecHW8utHpUhg==
X-CSE-MsgGUID: 458F323BQBu2pmtIxZsyEA==
X-ExtLoop1: 1
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.109.2])
 ([10.125.109.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:00:24 -0700
Message-ID: <55f13d5d-c222-4e7d-8666-4f2b8d81d396@intel.com>
Date: Tue, 25 Aug 2026 08:00:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/AER: Export pcie_aer_is_native() to AER
 namespace
To: Raag Jadav <raag.jadav@intel.com>, dave@stgolabs.net, jic23@kernel.org,
 alison.schofield@intel.com, vishal.l.verma@intel.com, djbw@kernel.org,
 iweiny@kernel.org, ming.li@zohomail.com, bhelgaas@google.com,
 rodrigo.vivi@intel.com
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 lukas@wunner.de, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com
References: <20260825054312.1319951-1-raag.jadav@intel.com>
 <20260825054312.1319951-2-raag.jadav@intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260825054312.1319951-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/24/26 10:42 PM, Raag Jadav wrote:
> pcie_aer_is_native() was originally exported to CXL namespace in commit
> 49f776724e64 ("PCI/AER: Export pcie_aer_is_native()"). This is a bit
> misleading as the symbol or its underlying implementation does not reflect
> any distinguishable CXL functionality.
> 
> Change this and export pcie_aer_is_native() to AER namespace, which is
> cleaner and more suitable for its implementation.
> 
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

For the CXL part,
Acked-by: Dave Jiang <dave.jiang@intel.com>

You'll need Bjorn's ack for the PCI portion.

> ---
>  drivers/cxl/port.c     | 1 +
>  drivers/pci/pcie/aer.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
> index 99cf77b6b699..00f675163b3d 100644
> --- a/drivers/cxl/port.c
> +++ b/drivers/cxl/port.c
> @@ -340,5 +340,6 @@ module_exit(cxl_port_exit);
>  
>  MODULE_DESCRIPTION("CXL: Port enumeration and services");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("AER");
>  MODULE_IMPORT_NS("CXL");
>  MODULE_ALIAS_CXL(CXL_DEVICE_PORT);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index c4fd9c0b2a54..8660b18bac8b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -248,7 +248,7 @@ int pcie_aer_is_native(struct pci_dev *dev)
>  
>  	return pcie_ports_native || host->native_aer;
>  }
> -EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");
> +EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "AER");
>  
>  static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
>  {

