Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA10C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 17:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15810E1BA;
	Thu,  3 Jul 2025 17:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bHA+UJ3f";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA41F10E1BA
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 17:41:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81C5D5C6351;
 Thu,  3 Jul 2025 17:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B6FC4CEE3;
 Thu,  3 Jul 2025 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751564470;
 bh=rWLfgENFeeWZLgKSTQfNHO434DpX7XUNq3Q+RnmpCMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHA+UJ3fT5Pu1QBjzja6bY0wbi5PsEgPwQ234eSyHKTfoK58nEz3vkLEqyb55ckwo
 y0sM5Tzf/wotSPvyH56bPle9OqI535joR3ftGgbC5sfoXzE6ji2Re4opQqLYqq7lKl
 khOxhWMsJFsOvjAD5BMxGTZwmbkZr5kbx/NumlwL5TK+dGpqqeZWRXEXgFpFYKxQ5+
 0WVPpXe0qvJESJYq5wNnKfVrpeBdweDUat2Owynq/4Rv496XMyaw9EG42Liu+CHSLC
 cKjdqd1JZ7l0zx+4EOaXFMLJC1mCjqseHNye+hks0ctROXf0K0/Kx4ccB/LF3uaL0j
 qGzoKDEes58Ew==
Date: Thu, 3 Jul 2025 19:41:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <2qhkmfveb7vrjuhmeeij2off6wiczfh4hetzayizsrbuc57ewe@kbu6th33p5pp>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
 <aGWqCfpcYUla6T2e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWqCfpcYUla6T2e@intel.com>
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

Hi Rodrigo,

On Wed, Jul 02, 2025 at 05:52:09PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 02, 2025 at 07:18:50PM +0200, Andi Shyti wrote:
> > > Heikki Krogerus (3):
> > >   i2c: designware: Use polling by default when there is no irq resource
> > >   i2c: designware: Add quirk for Intel Xe
> > 
> > I think you could have kept Jarkko's ack here. Up to you.
> > 
> > Anyone against me taking the two above already?
> 
> I was thinking about keeping Jarkko's ack and get all merged at
> once in drm-xe-next.

fine with me.

Andi
