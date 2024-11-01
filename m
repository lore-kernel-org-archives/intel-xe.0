Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB5E6B243
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 11:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEFD10E9AE;
	Fri,  1 Nov 2024 11:48:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB2010E9A9;
 Fri,  1 Nov 2024 11:48:07 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t6q8L-00000001EUA-0mNV; Fri, 01 Nov 2024 13:48:05 +0200
Message-ID: <1e8bd9159c588c6481edbb7e1b173dc0d60c8d00.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Fri, 01 Nov 2024 13:48:03 +0200
In-Reply-To: <20241021222744.294371-4-gustavo.sousa@intel.com>
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
 <20241021222744.294371-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] drm/i915/dmc_wl: Check for non-zero refcount in
 release work
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

On Mon, 2024-10-21 at 19:27 -0300, Gustavo Sousa wrote:
> When the DMC wakelock refcount reaches zero, we know that there are no
> users and that we can do the actual release operation on the hardware,
> which is queued with a delayed work. The idea of the delayed work is to
> avoid performing the release if a new lock user appears (i.e. refcount
> gets incremented) in a very short period of time.
>=20
> Based on the above, the release work should bail out if refcount is
> non-zero (meaning new lock users appeared in the meantime), but our
> current code actually does the opposite: it bails when refcount is zero.
> That means that the wakelock is not released when it should be; and
> that, when the work is not canceled in time, it ends up being releasing
> when it should not.
>=20
> Fix that by inverting the condition.
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/dr=
m/i915/display/intel_dmc_wl.c
> index 8056a3c8666c..c298aef89449 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> @@ -72,8 +72,11 @@ static void intel_dmc_wl_work(struct work_struct *work=
)
> =20
>  	spin_lock_irqsave(&wl->lock, flags);
> =20
> -	/* Bail out if refcount reached zero while waiting for the spinlock */
> -	if (!refcount_read(&wl->refcount))
> +	/*
> +	 * Bail out if refcount became non-zero while waiting for the spinlock,
> +	 * meaning that the lock is now taken again.
> +	 */
> +	if (refcount_read(&wl->refcount))
>  		goto out_unlock;
> =20
>  	__intel_de_rmw_nowl(display, DMC_WAKELOCK1_CTL, DMC_WAKELOCK_CTL_REQ, 0=
);

Oh, this was probably hard to catch.  I think this is a buggy leftover
from my earlier implementations where I was decreasing the refcount
only here.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
