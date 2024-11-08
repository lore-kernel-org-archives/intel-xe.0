Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C8D5C0CF
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 14:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64F410E9C3;
	Fri,  8 Nov 2024 14:16:07 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F1D10E9C2;
 Fri,  8 Nov 2024 14:16:06 +0000 (UTC)
Received: from 91-155-254-241.elisa-laajakaista.fi ([91.155.254.241]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t9PmO-00000001bND-1NEh; Fri, 08 Nov 2024 16:16:05 +0200
Message-ID: <076db523d9e533bc39028ba066133b190d9e4754.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Fri, 08 Nov 2024 16:16:03 +0200
In-Reply-To: <20241108130218.24125-1-gustavo.sousa@intel.com>
References: <20241108130218.24125-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/15] drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD
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

On Fri, 2024-11-08 at 09:57 -0300, Gustavo Sousa wrote:
> Using the DMC wakelock is the official recommendation for Xe3_LPD. This
> series apply fixes to the current DMC wakelock implementation and
> enables it by default for Xe3_LPD. The series has been tested with a PTL
> machine.
>=20
> This is the v4 of the series. The only difference from v3 is that I decid=
ed to
> drop patches related to the usage of HAS_DMC() in HAS_DMC_WAKELOCK(), as =
they
> might need more polishing and will be send as a separate series. I believ=
e we
> don't need to be blocked on those to get this series landed.

Good call!

It seems that the test results with this series is looking good, so
from my point of view, v4 can be merged.

Waiting for the next patchset with the HAS_DMC*() stuff. ;)

And thanks for fixing all this!

--
Cheers,
Luca.
