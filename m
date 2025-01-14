Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F355CE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 08:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528F10E880;
	Tue, 14 Jan 2025 08:35:23 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80C10E880;
 Tue, 14 Jan 2025 08:35:23 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tXcON-00000003oL0-3lhl; Tue, 14 Jan 2025 10:35:21 +0200
Message-ID: <21eeb0c1131a13d1bde4132def108d9dcf964146.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Jouni =?ISO-8859-1?Q?H=F6gander?=
 <jouni.hogander@intel.com>
Date: Tue, 14 Jan 2025 10:35:18 +0200
In-Reply-To: <20250113204306.112266-3-gustavo.sousa@intel.com>
References: <20250113204306.112266-1-gustavo.sousa@intel.com>
 <20250113204306.112266-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] drm/i915/display: Wrap IRQ-specific uncore
 functions
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

On Mon, 2025-01-13 at 17:38 -0300, Gustavo Sousa wrote:
> The current display IRQ code calls some IRQ-specific helpers that use
> intel_uncore_*() MMIO functions instead of the display-specific ones.
> Wrap those helpers to ensure that the proper display-specific hooks
> (currently only DMC wakelock handling) are called.
>=20
> v2:
>  - Move functions to intel_display_irq.c instead of having them in
>    intel_de.h. (Jani)
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---

LGTM.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
