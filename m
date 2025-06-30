Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F0C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375C510E23D;
	Mon, 30 Jun 2025 18:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qMZJITWb";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48D10E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 18:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6B3843FF8;
 Mon, 30 Jun 2025 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB72C4CEE3;
 Mon, 30 Jun 2025 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751309909;
 bh=tKjiX/OsAFGvd34aQYUYPgAligk1SLjHAffiZYOW8tM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qMZJITWbUUXnpNZ5EoP8k7w0MKjK7fRPkyVG+KKbl/EQnf1GoYoLQPVzJW/rQwpcI
 ddZ3FV7bXaQhVwCh4N9vKHtgFGoeQE0RnrBCcTThnJ3K+01G9IMjCvvgZbcZq7+vE1
 CaNZI6UBSNWsS7ZxUAr7NiFuQ89uPcPZ7mrcx3RZJIxydnzABlvR/9M8Ww3hn8HTRd
 FCkEeV/hlPk/0Os761MbsIuREkMSuliaxkqRtbPVP6Z8CpU0JCThTrp37Fi85+9kf6
 LtGi+800bkDydPsiE88f5hT2qR0q5cl+wJZzix4ukuuDgMxDH/zIw5+xYNeYZVIaLp
 WWoPSilrvJzSQ==
Date: Mon, 30 Jun 2025 20:58:25 +0200
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
Subject: Re: [PATCH v5 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <ojw26xx2kibh4pheo4rlsgqrtlevbz3ojyxlv5byuetqavpgaf@vms7jyksajrl>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-3-heikki.krogerus@linux.intel.com>
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

Hi,

On Fri, Jun 27, 2025 at 04:53:12PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Looks very good.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

(sorry for coming this late, but I've been on and off in this
period. I would have definitely loved to help on this)

Thanks,
Andi
