Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FC6C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 08:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D357C10E53E;
	Tue,  1 Jul 2025 08:56:09 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1E110E53E;
 Tue,  1 Jul 2025 08:56:09 +0000 (UTC)
Received: from 91-155-254-100.elisa-laajakaista.fi ([91.155.254.100]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uWWmc-00000008ZNU-14rO; Tue, 01 Jul 2025 11:56:06 +0300
Message-ID: <db38e689792d0eca0229f06c654506820d6187b2.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@gmail.com>
Date: Tue, 01 Jul 2025 11:56:05 +0300
In-Reply-To: <20250626082053.219514-8-imre.deak@intel.com>
References: <20250626082053.219514-1-imre.deak@intel.com>
 <20250626082053.219514-8-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 07/20] drm/i915/dp: Don't clobber the encoder state in
 the HPD IRQ handler
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

On Thu, 2025-06-26 at 11:20 +0300, Imre Deak wrote:
> From: Imre Deak <imre.deak@gmail.com>
>=20
> The intel_dp_get_dpcd() function called from an HPD IRQ handler reads
> out the DPRX capabilities from the sink and updates these in the
> intel_dp encoder state. Since the IRQ handler can run in parallel with
> the encoder/connector detection (intel_dp_detect()) which also calls
> intel_dp_get_dpcd(), the encoder state can get corrupted, since the two
> updates happen in a racy way.
>=20
> Fix the above by checking only for any change in the sink count value in
> the HPD IRQ handler, without updating the encoder state.
>=20
> Note that any state change in the sink requiring an update of the
> encoder state is handled via the sink's SINK_COUNT change,
> RX_CAPS_CHANGED, DOWNSTREAM_PORT_STATUS_CHANGED signaling, which all
> should result in a full connector detection.
>=20
> Signed-off-by: Imre Deak <imre.deak@gmail.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
