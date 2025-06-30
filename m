Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA6C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C46210E23D;
	Mon, 30 Jun 2025 18:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MvEnm43Y";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8410E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 18:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 498B1A5359B;
 Mon, 30 Jun 2025 18:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45454C4CEE3;
 Mon, 30 Jun 2025 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751309953;
 bh=apVsCLGXuvk8MiW3/veGMsk3v3m01GoVUsdwZYIYpd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvEnm43Y2QyAq9MMcwuHyQRaHojJAwpOjjB2DoTepb/JsZfXp/2sipjrzsHxbdQC+
 BmJdFiyRMXC6NF3oH7GoLOmm1BdXOoXtjF4RfJC6SG7XiduBhkLPdVxI6hCfJe1Csq
 5+YBNdpZU3KvqniKeWatQFmhTX4GU+d55uM300sdJjHd+EUKapyuOOCudsOyeWZhQy
 MRep2XYOpDfEs1Pa7mRtG+V1/Bumv4wS55/nhvr28vzEQlPFvL7iGH+IA/duG6hSlm
 +E6A/sQ1F/xSe+1XfYfG72C5jtBvPVUi+tk+9FG7jqmhKPjkHr8+CMt80kZe5awJqk
 nuAsedv9USXWQ==
Date: Mon, 30 Jun 2025 20:59:08 +0200
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
 linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <ey7uujbwrgp2qxt4mnz75uf3kldcgr7nbctbz56j7ni2huchte@2xisn3m4bbvm>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-4-heikki.krogerus@linux.intel.com>
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

Hi Heikki and Raag,

On Fri, Jun 27, 2025 at 04:53:13PM +0300, Heikki Krogerus wrote:
> From: Raag Jadav <raag.jadav@intel.com>
> 
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
