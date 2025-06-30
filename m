Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4D3C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65510E4B3;
	Mon, 30 Jun 2025 18:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OrOZbBta";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46C10E4B3
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 18:28:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A40C61126;
 Mon, 30 Jun 2025 18:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EC0C4CEE3;
 Mon, 30 Jun 2025 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751308096;
 bh=GxFRzmBGBJNDKvWM2J16xINJw3wVBq57APedjAYERKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OrOZbBtaR5et9OF5MMll1PiXsSoC/iWUBWENE8TDF+RRDj8fWvByQsGR8BY43IBit
 t65TYX/GHdnAJJsWu5vSVlnPcUBy+wMiCDac3gnJGGbX9UKSHbETSh+F5kLyFF3tuR
 bb2ws+vm26QYpYAZ4P0meeaezswCL5NxOo3+/qy1kBIfuco4WVzDN7FsxgM7fXffEe
 kCZt3AqfovytODIL4ATDg1FxTOErXTgH/40D8/cpreMO+rpPtLRHeIIQfqvctPoaUt
 CePQxpSG7FkiTO1KEP44gJASGi5nJMO42sDhYgr/Q7amLEoDfuOe7vyHhoMj1TL1eI
 odbLtJzLnBsSw==
Date: Mon, 30 Jun 2025 20:28:12 +0200
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
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
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

On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.

What I don't like, though, is that there is no mention of the
change in the probe in the commit log.

Besides, are these changes related? Can we have them split in two
different patches? I guess this would also make Andy's point
about the extra churn.

Andi

> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
