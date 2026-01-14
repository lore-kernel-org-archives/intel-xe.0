Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBDAD39000
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 18:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351F710E661;
	Wed, 14 Jan 2026 18:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uwzPfrKH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F3710E661
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 18:02:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA98B42D83;
 Wed, 14 Jan 2026 18:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A47DC4CEF7;
 Wed, 14 Jan 2026 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768413729;
 bh=03qS3bEIZhBcsL33wysjp+9lW6mY7rBmKOOtBceuzRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uwzPfrKHNdlfFNVkF8Usm5tyQsllnoZS/9vyMwttur7NmY40ROvLW+2R9uYvfMeWO
 tZQ3jBEfKYPJO4uz+J6Prt0gIxfIKSdpmstR/D6bQiC9NA0ixIwz3ZHUFiHB2TondZ
 pcl6Wpua5S9DosnotknCB2jM1O+5GUPj4KR71ii56BDKrz+0GYi6G9iExEUlxcJIgc
 Kk4oBJi4S2GmtXZTAKf1yKokER7ZCIdPLbtRs8OGCYiQWTUdc+F3KTWZ7z6OzP4Yb9
 ZCXtPq3dhAcblnDMSrX+cGtZI8pOs5CQq1H32VeX66LJHCIgm4kOiPSBJibNmKLJEz
 gFdje8pAX5xrw==
Date: Wed, 14 Jan 2026 12:02:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com,
 matthew.auld@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v6 10/12] drm/xe/vrsr: Enable VRSR
Message-ID: <20260114180208.GA827276@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113164200.1151788-24-badal.nilawar@intel.com>
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

On Tue, Jan 13, 2026 at 10:12:11PM +0530, Badal Nilawar wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Enable VRSR in runtime suspend and also in System wide suspend.
> Also fix couple of typo in xe_pm.c.

>  	 * Enabling D3Cold is needed for S2Idle/S0ix.
> -	 * It is save to allow here since xe_pm_suspend has evicted
> +	 * It is safe to allow here since xe_pm_suspend has evicted
>  	 * the local memory and the direct complete optimization is disabled.
>  	 */
>  	d3cold_toggle(pdev, D3COLD_ENABLE);
> @@ -1158,7 +1158,7 @@ static int xe_pci_resume(struct device *dev)
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	int err;
>  
> -	/* Give back the D3Cold decision to the runtime P M*/
> +	/* Give back the D3Cold decision to the runtime PM */

Hahahaha, just change the previous patch so these typos are never
introduced :)
