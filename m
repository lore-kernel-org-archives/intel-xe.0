Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACECC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 05:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FFD10E9E6;
	Thu, 15 Oct 2026 05:57:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1A10E9D0;
 Thu, 15 Oct 2026 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792043819; x=1823579819;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=H0yGTdjJ3j8ZW4Un8Y3pRDeqFWIg3Espzw1E9R1TXXE=;
 b=i/VAIXv2zTE7T/tu8J171Yg2dTf5ar3tgsjSNRnpOmjcXvMcZW5/cDJx
 mTOww4+C4iVaB+9BH+y51SVAhYAGj1QmMz8Eg62q3TaGcrfbOzrDXFr9g
 f5AElg/SIDRJN8sp3IgHUarLN0dIDxiF3zwGj1eWZ5qQ09r/tXPIMhbIH
 G17DUu8vAK67AlHpSLIoIvvKTq6YcTfCHntX37xBxVt7S/ss4TNfazeV1
 vKcaSFZeI0daxGlGB2MF3s/OjziWNzXRvahWnbgbDngFNf998JSFGv7wS
 USDLLIdtEtWxxaNjJEI3lcKiOeIm3JQQQxl4iiEHFIlfql8O94RMzqWae Q==;
X-CSE-ConnectionGUID: ieJpV6uLSb+KuiZig1jj2g==
X-CSE-MsgGUID: MHGSeiXTTuenaL/cY1xnEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="700567"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="700567"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 22:56:58 -0700
X-CSE-ConnectionGUID: 8s2xpkr1TSGhJINCjBG16w==
X-CSE-MsgGUID: cK9b6afTQLOiLVoNuUIxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3444097"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 22:56:57 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <as-mReJ7rAGinlgY@intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-5-ville.syrjala@linux.intel.com>
 <179199289730.125250.2949692993509316966@jlahtine-mobl>
 <as-mReJ7rAGinlgY@intel.com>
Subject: Re: [PATCH 4/5] drm/i915/gmbus: Fix i2c bit banging for PTL+
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Thu, 15 Oct 2026 08:56:54 +0300
Message-ID: <179204381410.12289.4840592736864360@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Quoting Ville Syrj=C3=A4l=C3=A4 (2026-10-14 18:56:53)
> On Wed, Oct 14, 2026 at 06:48:17PM +0300, Joonas Lahtinen wrote:
> > Hi,
> >=20
> > This didn't cherry pick cleanly into drm-intel-fixes.
> >=20
> > Do we still want to send this into v7.3 given how fresh and
> > relatively non-trivial it is and we're past -rc7 already?
>=20
> Should be fine to let this sit in -next for a while. The code
> tries the gmbus path first (which should usually work), and bit
> banging is just a fallback.

Thanks for a quick reply. I won't pick it for -fixes or -next-fixes,
so we can then pick it up for -fixes for v7.4.

Regards, Joonas
