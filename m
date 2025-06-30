Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE7C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 19:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F35710E4B7;
	Mon, 30 Jun 2025 19:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="epguPmh8";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5282D10E4B7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 19:02:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 308914644A;
 Mon, 30 Jun 2025 19:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0ACC4CEEB;
 Mon, 30 Jun 2025 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751310136;
 bh=gXjaSN0k3lznU4sgAYnTXC6GtTqY7k9V3HXXfKRy4mA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=epguPmh8MyrJeCkgwxK7EQ7PGyTUFoqOJXXpmVyweNvm9Jpgrk2Hfx9Oi0G4Yl1Sc
 3c8Wptu4jQuKHzWaxr/n13E/2d5V+XEJtyh164XbWW5s/He76ZKuTLQ0RauOWr+HOv
 sjoF6cLGkZ50kLoGYXBOdae+hvzy7CS6EdrwkPkjMJ/NhPZ0LBS8RGE2L0a4tgwxdp
 +0lm9le49S7SqLr31Z4tEhr/VJiNfKiYJznTBJj/kKbmtgIpuL/7iGdH0mIkfgBQmC
 /JKV2mkjniib/q17TNwKCWBY8pfxn3gGEngzB+eSpMhXndUxH7dLMP4cm0tW5OR6+A
 mHFzPtXSJzZBg==
Date: Mon, 30 Jun 2025 21:02:11 +0200
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
Subject: Re: [PATCH v5 4/4] drm/xe/xe_i2c: Add support for i2c in
 survivability mode
Message-ID: <wtuwnljkbqqmzvjc6kvdrjmpdcfo5pq6hslirf42wt5ncizzdt@6ofeiipffkcf>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-5-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-5-heikki.krogerus@linux.intel.com>
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

Hi Heikki and Riana,

> +err:
> +	/*
> +	 * But if it fails, device can't enter survivability

nitpick: the "But" follows the "if". As we don't have the "if"
anymore, the "But" leaves the reader a bit flubbergasted :-)

If you are going to resend, please, remove it. Otherwise it can
be improved before submitting the patch.

In any case,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
