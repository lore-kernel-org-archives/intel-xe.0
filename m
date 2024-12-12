Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3165E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 10:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF210ED3C;
	Thu, 12 Dec 2024 10:13:50 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAC910ED3A;
 Thu, 12 Dec 2024 10:13:49 +0000 (UTC)
Received: from 91-155-254-135.elisa-laajakaista.fi ([91.155.254.135]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tLgCY-00000002rYN-0yRX; Thu, 12 Dec 2024 12:13:46 +0200
Message-ID: <b7fd8305c0fc331a6f9bcf488f79cc17b8e5e3f9.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 12:13:44 +0200
In-Reply-To: <2cda5bb8816d90150724955d3f09a4b1c2634e2d.1733827537.git.jani.nikula@intel.com>
References: <cover.1733827537.git.jani.nikula@intel.com>
 <2cda5bb8816d90150724955d3f09a4b1c2634e2d.1733827537.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] drm/i915/dp: s/intel_connector/connector/
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

On Tue, 2024-12-10 at 12:46 +0200, Jani Nikula wrote:
> Use the contemporary naming convention of struct intel_connector
> *connector. Avoid struct drm_connector use altogether. In a few cases
> add local struct drm_display_info and struct intel_display pointers to
> help move away from struct drm_connector usage.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Nice cleanups.  I assume you double-checked that no other occurrences
were missing after these changes?

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
