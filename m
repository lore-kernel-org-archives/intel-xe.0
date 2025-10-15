Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A164ACCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B9810E73B;
	Wed, 15 Oct 2025 08:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxiAAhcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAF810E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760517561; x=1792053561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4J3LNLN7r+YJT0cz094SwztV9zdCRdVmFZ6/oEC3bjE=;
 b=nxiAAhcycll3bIf3/UFJQyMEW7L1mrt35XCHzsvH6B9RnoIe0hCu0tu1
 RDokqEzWMJ3Fs29hvVoB/YOdrTaL0q5Lc/xdMrBJSey1LsblD4PHENsyn
 FN7JMw1Ei8XQ+F+z7/o0KNdjA2A9AtGNA7rde9uCz6/9CO02GKre/+bal
 u6wU4mMW56Y/W3CicaPTHpAH0qFWoM22E6EcHITYF78gM0qDSMRIdFdy8
 8JAR2u2jHoGXrji/N4jqrZAlub8MVwbDdeaWPLPD0/PVS0ZRkc9hrNVcv
 8uFrEK5eGX/qrC5DQA6toZuQDDnzZ7ox0oKr0fFOzQAC4ryTZWe2IEJus g==;
X-CSE-ConnectionGUID: +k/7iK6QRrivu1Z6pEZWdw==
X-CSE-MsgGUID: XsmfZUzpRBmLFcwnO7q5tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62597164"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62597164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:39:20 -0700
X-CSE-ConnectionGUID: 4WloK+3WTNClHtruns9I6w==
X-CSE-MsgGUID: N5/8nY5hR/aG4FPUZJKBiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182100449"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:39:17 -0700
Date: Wed, 15 Oct 2025 10:39:14 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: Re: [PATCH v5 08/12] drm/xe/vrsr: Refactor d3cold.allowed to a enum
Message-ID: <aO9dsvZ-SmGlEh4T@black.igk.intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
 <20251015080710.1468409-9-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015080710.1468409-9-badal.nilawar@intel.com>
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

On Wed, Oct 15, 2025 at 01:37:06PM +0530, Badal Nilawar wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Add xe_d3_state enum to add support for VRAM Self Refresh
> d3cold state.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

...

> @@ -787,7 +787,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  			goto out;
>  	}
>  
> -	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +	if (xe->d3cold.target_state != XE_D3HOT)
> +		xe_i2c_pm_resume(xe, true);

Does this require an if condition?

Raag
