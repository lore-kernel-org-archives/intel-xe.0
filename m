Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE5E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 10:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C44910EF90;
	Fri, 13 Dec 2024 10:07:24 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001610EF8F;
 Fri, 13 Dec 2024 10:07:23 +0000 (UTC)
Received: from 91-155-254-135.elisa-laajakaista.fi ([91.155.254.135]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tM2Zs-00000002t6z-1yUW; Fri, 13 Dec 2024 12:07:21 +0200
Message-ID: <293518e1a55048800a372a5f66da0c628e2731c2.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 12:07:17 +0200
In-Reply-To: <377e2b400d126776224fc49874ed9cb03ac3123c.1732104170.git.jani.nikula@intel.com>
References: <cover.1732104170.git.jani.nikula@intel.com>
 <377e2b400d126776224fc49874ed9cb03ac3123c.1732104170.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [RESEND 4/6] drm/i915/uncore: add to_intel_uncore() and use it
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

On Wed, 2024-11-20 at 14:03 +0200, Jani Nikula wrote:
> Add to_intel_uncore() function to avoid the inclusion of i915_drv.h from
> intel_de.h. This reveals a number of implicit dependencies on i915_drv.h
> that need to be added.
>=20
> For now, to_intel_uncore() can be an inline function, with all the
> includes in compat intel_uncore.h, as long as i915_drv.h isn't
> included. The implicit dependencies on i915_drv.h is a problem in
> display code, but the same is not true for xe_device.h etc.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
