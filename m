Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7CEC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 11:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C210E279;
	Wed,  6 Aug 2025 11:44:47 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684D10E279;
 Wed,  6 Aug 2025 11:44:45 +0000 (UTC)
Received: from 91-155-254-205.elisa-laajakaista.fi ([91.155.254.205]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1ujcZW-00000009VT8-1Gqt; Wed, 06 Aug 2025 14:44:43 +0300
Message-ID: <7920b8ed0ae141aecae8d40177f35e642cb1ca16.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Charlton Lin <charlton.lin@intel.com>, Khaled Almahallawy
 <khaled.almahallawy@intel.com>
Date: Wed, 06 Aug 2025 14:44:41 +0300
In-Reply-To: <20250805073700.642107-1-imre.deak@intel.com>
References: <20250805073700.642107-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 00/19] drm/i915/tc: Fix enabled/disconnected DP-alt sink
 handling
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

On Tue, 2025-08-05 at 10:36 +0300, Imre Deak wrote:
> This patchset fixes an issue on LNL+, where the TypeC PHY's mode/state
> is detected incorrectly during HW readout for a DP-alt sink that got
> enabled by BIOS/GOP, but later the sink got disconnected by the user
> before the driver got loaded.
>=20
> The issue in the driver is due to overlooking a change on LNL+ in the
> way the PHY ready flag and pin assignment is set/cleared in the PHY
> registers by the HW/FW wrt. how this works on all the earlier (ICL-MTL)
> TypeC platforms.
>=20
> The first 5 patches fix the issue, the rest refactor the PHY's max lane
> count and pin assignment query functions, sanitizing the code, removing
> duplications and validating the register values read out from the HW.

If you have 5 fix patches and the rest is refactoring, wouldn't it be
better to split the series in two?

--
Cheers,
Luca.
