Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD301CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 11:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1310E2AD;
	Tue, 30 Sep 2025 11:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GoQEvDzL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34810E2AD
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 11:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C5E8604D4;
 Tue, 30 Sep 2025 11:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E2EC4CEF0;
 Tue, 30 Sep 2025 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230841;
 bh=f4NJxolqQyQF0wMBDZoCkX2ZrGNJB3kexqnmrucrNWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GoQEvDzLFooAX5HsBfxKttOjTOfS2uFOeq4SebFYwa/x3RyfGKO5bMMzf7BGyv7Nx
 Esya4Afgun9MkbbeAY6CB/aoy+Zx75PkRvD/l6ePekeQV9T52fBENK4EyTRTWydF8G
 8Z235LPdnHLCCQ7fYOokI9yFJfFboMpLC2auRvWV7AYW2SrISdFK8KrhH/BWGRtqc/
 vOkzKovDYHQIRMU8EPr32CzphFYDem6/ZzogwK/J6XtvpZXYryV8uJgTLU8spXBsWX
 vXR5ohu3P+eZmbOemiAFd3T34W15ofZ3ii20CnPdCTJsUB9idfzprDB8xktivFJgu6
 654ZaTKcrqI2w==
Date: Tue, 30 Sep 2025 13:13:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924200835.3143173-3-raag.jadav@intel.com>
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

Hi Raag,

On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
