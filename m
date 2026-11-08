Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F72606A320
	for <intel-xe@archiver.kernel.org>; Sun,  8 Nov 2026 10:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B632310E4A3;
	Sun,  8 Nov 2026 10:07:54 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457B10E444;
 Sun,  8 Nov 2026 10:07:52 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xPzoK-000000055ix-0I3x; Sun, 08 Nov 2026 12:07:49 +0200
Message-ID: <4d7e8000b64d0fb40c5c7b72772acd484b3aff1d.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, imre.deak@intel.com
Date: Sun, 08 Nov 2026 12:07:52 +0200
In-Reply-To: <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
Subject: Re: [PATCH 2/2] drm/i915/dmc_wl: Avoid blocking on delayed wakelock
 release
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2026-10-13 at 21:41 +0530, Dibin Moolakadan Subrahmanian wrote:
> intel_dmc_wl_disable() flushes the pending wakelock release work,
> disables the wakelock mechanism and sets wl->enabled to false.
> It then clears DMC_WAKELOCK_CTL_REQ and sets wl->taken to false.
>=20
> Flushing the work forces it to run immediately and waits for completion.
> When the refcount is zero, the worker clears DMC_WAKELOCK_CTL_REQ and
> waits for ACK to clear. This adds workqueue scheduling and ACK polling
> to the DC-exit path, just before disable clears the request itself.
>=20
> Since intel_dmc_wl_put() queues the release DMC_WAKELOCK_HOLD_TIME later
> and the DC-exit path reaches disable well before that, the work remains
> pending and is forced to run. This delays the POWER_DOMAIN_DC_OFF get
> in intel_atomic_commit_tail() for the DC3CO case, where DC3CO is entered
> and exited on every flip. On a 3840x2400@120 eDP panel, dropping the
> forced run reduced that get by roughly 330 us.
>=20
> Cancel the pending work instead, so it is dropped rather than run. Once
> wl->enabled is false, subsequent puts do not queue release work.
>=20
> Use the sync variant so that an already-running worker is still waited
> for, as it was with the flush.
>=20
> Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmani=
an@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/dr=
m/i915/display/intel_dmc_wl.c
> index ab4e0e9573df..3eae11900978 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> @@ -400,7 +400,7 @@ void intel_dmc_wl_disable(struct intel_display *displ=
ay)
>  	if (!__intel_dmc_wl_supported(display))
>  		return;
> =20
> -	intel_dmc_wl_flush_release_work(display);
> +	cancel_delayed_work_sync(&wl->work);
> =20
>  	spin_lock_irqsave(&wl->lock, flags);
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
