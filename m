Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB8CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 11:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8CD10E58E;
	Tue, 30 Sep 2025 11:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VL4m1Iqf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC6E10E58E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 11:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 633F8604D9;
 Tue, 30 Sep 2025 11:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB4C4CEF0;
 Tue, 30 Sep 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230513;
 bh=UEcfAPJ6i+2jcE7hH5IncpIH1vDG/dub63duXEbMKGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VL4m1IqfQUCUNGZt50a2QqjsXTp33ZaCyBAqc3y9jN6GWb85V/bvcKW+izo7dZnK0
 FQNSrnHHkqXvGXgWL8Cd5G9oPRkculEYEhPeIPH7L3toikgz3zF2iGAd8uh5VBBqz8
 /8MN3ax+KRqPMhwhFBueSqSD1B5n09mg6LBpUCgDMFjl/E6EncyifmXScKfaCd1LSf
 c984gJrcPKyR99+K2JeOIeIjSIPOIFTor1NzgvG/qD5NG3ZEgoKNjYr+LPKEDvX3SR
 4wDvzhGbE5w3CRNnt0ap3D7CDuoL03oOdzZwtIhGLt7tktuOMh29TlwQYREf9vJoz9
 yTeM8WV8k4CgQ==
Date: Tue, 30 Sep 2025 13:08:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v1 1/2] drm/xe/i2c: Introduce xe_i2c_irq_present()
Message-ID: <mdkjzj6fesxhb4rmwdhu22swklm4chlhlltgkpexc6mvmzpcgk@npllwb3ysihc>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924200835.3143173-2-raag.jadav@intel.com>
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

On Thu, Sep 25, 2025 at 01:38:34AM +0530, Raag Jadav wrote:
> In preparation of wider usecases which require checking for I2C IRQ
> presence, introduce xe_i2c_irq_present() helper.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
