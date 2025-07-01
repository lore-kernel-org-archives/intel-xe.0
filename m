Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC4EC83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 16:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9810E5C1;
	Tue,  1 Jul 2025 16:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uqFMmRMr";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F910E5C1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 16:32:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1B735C5D52;
 Tue,  1 Jul 2025 16:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2EC4CEEF;
 Tue,  1 Jul 2025 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751387552;
 bh=yY8157hjb4vrAMHnghGfwO7Y+f3XeiGwvIscnnt6e+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uqFMmRMrIizrNOGH2fB1eaIMDlUhGC7FiaC/70V4QaOdSD89FPdlLYXcxOPDIcAFd
 uCaBuWxE5JyHmDuAFTknPvT7nI5Fo/80xn0v95o7TRElwbEK4QLyWxsoYarzO6lqjr
 oCwH/cuqgeNip76TAfCqGKclrRJs524FMIyF4vD53+CPvj+CM/+9AUReVtpkIg7/+C
 7ppRv2HggSE8R68Dn57qQCc4LpdHhkImMTrzTpB9s5tu8A6UG7F/GznadlPLBcPKT0
 43E8iJf/S2oWSGY2ME6F55VzkCGGcmGAElUYNxx3PnWyUnCUSdKSlhrcrRJGslkwlo
 MkvyEy+bnq+oA==
Date: Tue, 1 Jul 2025 18:32:27 +0200
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
Subject: Re: [PATCH v6 2/5] i2c: designware: Add quirk for Intel Xe
Message-ID: <fv437o3j3j3durqvdtvd5fjgfdhbzsnfv4r34xptxahctbzhq6@kvy3zoiowrnp>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-3-heikki.krogerus@linux.intel.com>
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

On Tue, Jul 01, 2025 at 03:22:49PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
