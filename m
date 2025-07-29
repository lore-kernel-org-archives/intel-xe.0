Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C4DC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 14:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930C610E285;
	Tue, 29 Jul 2025 14:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="afn96V7A";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CCD10E285
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 14:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28B6DA543F4;
 Tue, 29 Jul 2025 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCBAC4CEEF;
 Tue, 29 Jul 2025 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753800664;
 bh=GqM4igQz/uC68HfPXSecgeMtUMC4mBIEFFLq2+WOY6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afn96V7A8ikwZqL3ADzYggNvIEMIaPM8VfAacWZ5fIflFLKQ9/KgQeTWv1aVb+D7d
 FwsYSc079CUJjy9J1kkK4u5gM6GgmcE3eIJOU8VpDE44EO8Ca3Gg1pYTMyMr9aS749
 VtkCwhZxEheEodnLEZFi/xkUz5CuN4jmMrXlQ/js=
Date: Tue, 29 Jul 2025 16:51:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomita Moeko <tomitamoeko@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 6.12 4/4] Revert "drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()"
Message-ID: <2025072932-unjustly-thirty-b125@gregkh>
References: <20250729110525.49838-1-tomitamoeko@gmail.com>
 <20250729110525.49838-5-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729110525.49838-5-tomitamoeko@gmail.com>
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

On Tue, Jul 29, 2025 at 07:05:25PM +0800, Tomita Moeko wrote:
> This reverts commit deb05f8431f31e08fd6ab99a56069fc98014dbec.
> 
> The helper function introduced in the reverted commit is for handling
> the "refcounted domain mask" introduced in commit a7ddcea1f5ac
> ("drm/xe: Error handling in xe_force_wake_get()"). Since that API change
> only exists in 6.13 and later, this helper is unnecessary in 6.12 stable
> kernel.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 16 ----------------
>  1 file changed, 16 deletions(-)

We need acks from the maintainers/developers for all of these before we
can take the series.  Please work on getting that.

thanks,

greg k-h
