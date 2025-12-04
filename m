Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC9D20695
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 13:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B610E98E;
	Thu,  4 Dec 2025 13:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoHXdnPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049910E979;
 Thu,  4 Dec 2025 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764855876; x=1796391876;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eMrH/FYmxnqra+0NCj4j2ScidtQeCebWUFRfRdWKxto=;
 b=KoHXdnPZoWqGJH9Wj6AMrQcBWIlto7r1V2+clvlCiFi59l/nNWPO1wPM
 pTQB4hRVHMV2mR5pnO1lmmTDk3tuNAJvoTm9b4dCQxOY8flq7Kk7CHl7O
 W3rXfrLXXp/GsqDiYJsdHtflQA4VYTb+MVlaGiU1RCyddypNZU4KTY9sW
 nRFddMzmx+4XeszJRUMxGeCQSwXFjF4PYRtSp/5cKOm7LGOup3or2HXCX
 zn3C8QD0LVTPg7efDuIR2LOX5K6/p9N35mzkNKV8zjWk5s0WhaqZBohaU
 nyay5DoapqfTo7T3WvadoHVov9/+69a/DWfou/RAXJR4Wyq6+i8n4Xr0h g==;
X-CSE-ConnectionGUID: fTkeJwI4SfOiPdMB3TMp6g==
X-CSE-MsgGUID: umkqCLAeS7G0JPL29gn3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66763943"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66763943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:44:36 -0800
X-CSE-ConnectionGUID: Mg07xxpJTQyUMWNii57R0Q==
X-CSE-MsgGUID: NfUzOf/2Rmu3Dt1Mp2UQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="232320792"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:44:32 -0800
Message-ID: <bdec808511d0d592c940b7f86d8c6bc99de4c406.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: fix VFIO link error
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>, Simona
 Vetter	 <simona@ffwll.ch>, =?UTF-8?Q?Micha=C5=82?= Winiarski	
 <michal.winiarski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <demarchi@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 04 Dec 2025 14:44:30 +0100
In-Reply-To: <079b5829-1ebd-4df8-873c-b75625a52fac@app.fastmail.com>
References: <20251204094154.1029357-1-arnd@kernel.org>
 <c174c12d9748e2e9b2e497c1e479100c323e79c2.camel@linux.intel.com>
 <079b5829-1ebd-4df8-873c-b75625a52fac@app.fastmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-12-04 at 14:43 +0100, Arnd Bergmann wrote:
> On Thu, Dec 4, 2025, at 13:19, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2025-12-04 at 10:41 +0100, Arnd Bergmann wrote:
> > >=20
> > > Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to
> > > decide
> > > whether to
> > > include the the object instead.
> >=20
> > s/the the/the/ found by CI.
> > Same question here, Do you want to resent or should I fix up when
> > commiting?
> >=20
>=20
> I'd prefer if you can fix up both so I don't have to send it again.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd

OK, I will.
Thanks,
Thomas


