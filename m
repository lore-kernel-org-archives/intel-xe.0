Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E2C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 16:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB3610E5C1;
	Tue,  1 Jul 2025 16:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a9XIuGEp";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5C110E5C1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 16:31:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 457DC43C9C;
 Tue,  1 Jul 2025 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB134C4CEEB;
 Tue,  1 Jul 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751387509;
 bh=xyBmcnhbzF75bFtyZHhh19c+VqGZGqbSTS7OxTVcXrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9XIuGEpA8WarzU2BPZ0jcruYfynWh8aYTN+UYKBg5ZCzAxFvq/ee4ec3V4XKVTCt
 +MqShV4DqE/7Tuwsy2pjATFse4dARBGUjjOVipE7pe47K9HwY4JdH6cRT6BjD6rrzQ
 +2vTK4jhDJbJaX1rjoxwY8OqnkBMUCpZFDNmb2FeNQSkEKFAcMXKtzTB4PTSZq19C6
 cvlUUq1W/Ik4rIxQzRkFRDXvWbVYN0SYFGyeIP1m2QWoHfnujs92UnzXePYdzLvhnT
 2DKIbZLYHQUH48cf0Uil2IYIHP+j8fLHObZNzcRFnURIojwelBiyo20hFoaiVfJrYv
 xk3Upnaz+MyDA==
Date: Tue, 1 Jul 2025 18:31:43 +0200
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
Subject: Re: [PATCH v6 1/5] i2c: designware: Use polling by default when
 there is no irq resource
Message-ID: <c77xrjlv5cc6mfjqeu5jhusqwzd6ga5w5ipijohmncaxuvd4bf@bgty5kororry>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
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

On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:
> The irq resource itself can be used as a generic way to
> determine when polling is needed.
> 
> This not only removes the need for special additional device
> properties that would soon be needed when the platform may
> or may not have the irq, but it also removes the need to
> check the platform in the first place in order to determine
> is polling needed or not.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
