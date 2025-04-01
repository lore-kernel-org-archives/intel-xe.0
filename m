Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F3C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34D310E25E;
	Tue,  1 Apr 2025 19:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gLJXM434";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BBA10E25E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96A2943439;
 Tue,  1 Apr 2025 19:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C7EC4CEE4;
 Tue,  1 Apr 2025 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743537396;
 bh=hMcdxVjaB2WYoME8Ntk0l/AL9MofZG8qTy2kZe5dA/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gLJXM434R87cWPuk0i2iI2qX1RqnALIe+oZ5MjqrQbnZGPoKy5czTu+578B3nnUVA
 jj9W9k5rZkhEzrFBDURTgm6h99xC+/UyUjqTg5cpgLNd9UfSliuPbs3O5JoCouSD2v
 HOAS2VGt4pkLKoJJCYQZnoR7Nau4oF52Vu9diJa1Iq8lZ6b4pfxSJJU6pTfkObwZKE
 R2fOt6scIi4VUrA7Nsw2cW3vXgPe8+O48sVOBWJ8mimAIKOC4O/BpM6khmj3fz710w
 7Ck9XjiXYyM1HfzFRlgzOkxqobRIRQQPQDs7O+CumPq6DrNwydXp8NsGktoXaakNbX
 Zo7MnQDVFHg+A==
Date: Tue, 1 Apr 2025 14:56:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 06/12] drm/xe/vrsr: Initialize VRSR feature
Message-ID: <20250401195635.GA1679245@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401153225.96379-7-anshuman.gupta@intel.com>
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

On Tue, Apr 01, 2025 at 09:02:19PM +0530, Anshuman Gupta wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Initialize VRSR feature by requesting Auxilary Power and PERST# assertion
> delay. Include an API to enable VRSR feature.

s/Auxilary/Auxiliary/

I would include the name of the API directly.

> +#define     PCODE_D3_VRSR_PERST_SHIFT	16

PCODE_D3_VRSR_PERST_SHIFT is not used by this series; maybe omit it?

> +#define	    POWER_D3_VRSR_PSERST_MASK	REG_GENMASK(31, 16)

s/PSERST/PERST/ (looks like a typo?)

> +static void xe_pm_vrsr_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	/* Check if platform support d3cold vrsr */

Nicer to consistently capitalize as "VRSR" in comments, commit
logs, and messages.

Similar with "D3cold" ("D3cold" is used ~100 times in the tree,
"D3Cold" ~20, mostly in xe).

> +	if (!xe->info.has_vrsr)
> +		return;
> +
> +	if (!xe_pm_vrsr_capable(xe))
> +		return;
> +
> +	/*
> +	 * If the VRSR initialization fails, the device will proceed with the regular
> +	 * D3 Cold flow
> +	 */
> +	ret = pci_acpi_aux_power_setup(xe);
> +	if (ret) {
> +		drm_info(&xe->drm, "VRSR capable %s\n", "No");

Kinda weird to use %s when the text is a known constant.

> +		return;
> +	}
> +
> +	xe->d3cold.vrsr_capable = true;
> +	drm_info(&xe->drm, "VRSR capable %s\n", "Yes");

Same.

> +}
