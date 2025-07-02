Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C7C83038
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 17:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C0810E0B7;
	Wed,  2 Jul 2025 17:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLRU0rsy";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6BB10E0B7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 17:18:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42CEF5C6C93;
 Wed,  2 Jul 2025 17:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE86C4CEE7;
 Wed,  2 Jul 2025 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751476734;
 bh=8h5GbKdkae9i6ZkZEjnm4Lxi6OfPqqiK/ol2Xrklaag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLRU0rsywuoBmH8y6P1v4kfDw9ZRazFWEd2K6Q5H7u4pKgYfjhhQNDmcNsiTIFK9J
 /Go0ys/I3yvuOGyJcuYHv1nwslY+mU+XPio/+aW4PZ9o4/E50wpdweRPjVfWz8zKvC
 edm78aK1NERBhoFqeOyl/rO5frW81GPht01XKibzF49due1PXzyLF4Z8Mhu9GYlrnJ
 lh9DXFwACxuTmbU7XFLC1cVQ/ZcAg/tfbWIunm6pZXiwRZwUJ6J9ek5uNyzXjRqif2
 T+IvUFvRaoDQ1Nw59ucfA/jN8fFTy/f5Ehq8JSEv9CQ3Xloucc2cW97oT99o1w4iWG
 ELYaAHlkJdbAg==
Date: Wed, 2 Jul 2025 19:18:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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

Hi Heikki,

> Heikki Krogerus (3):
>   i2c: designware: Use polling by default when there is no irq resource
>   i2c: designware: Add quirk for Intel Xe

I think you could have kept Jarkko's ack here. Up to you.

Anyone against me taking the two above already?

Andi

>   drm/xe: Support for I2C attached MCUs
> 
> Raag Jadav (1):
>   drm/xe/pm: Wire up suspend/resume for I2C controller
> 
> Riana Tauro (1):
>   drm/xe/xe_i2c: Add support for i2c in survivability mode
