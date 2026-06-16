Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B938FCD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65310E8E3;
	Tue, 16 Jun 2026 08:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eI4vKgRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01A910E903;
 Tue, 16 Jun 2026 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598399; x=1813134399;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=eE2XlAy+35NEzBZmgfHatN59/QG/I7xWWZ/AM83L4UI=;
 b=eI4vKgRQST00m9sMEki6hSKQOHUpdXnLZ1lZWTmCU7woCy+Ctr4uRBNi
 +MIjKWV7Taf5iDr8h/dAh88ANnO3YmnmZyEhmoQoJjnIbAJFopnP4dhao
 uBgUlO52yUl6p3Fw/sqfcsa758RerO9PYatrOvAzhTDKDr4NCo1ZYhXGA
 X1pvPYdmLwmQZft+JkdMHrEGbW2zEo5bDvMc22eC6BkdWSrV9JjRKIYNo
 aasGxGrmTSgYQzcjhvbZuD7midcVlXDS3E7MB3YG0ab7NHMBCp3pWL36C
 1RgZiv5yNmvthNazpZCx7IDcUMFWqbOKC7veUbjEJE+Mm4ESYTiTdbXG0 g==;
X-CSE-ConnectionGUID: C32xZ+6gT461+E2VbAf6wg==
X-CSE-MsgGUID: IxdC1M4OSlqDxABXpxbb1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82461036"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82461036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:38 -0700
X-CSE-ConnectionGUID: kfsNGoe4Rt+lkRBMyz+lJg==
X-CSE-MsgGUID: HngW+o1cQQ2KiJqdzbvNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246816178"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:38 -0700
Date: Tue, 16 Jun 2026 10:26:35 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/i915/cdclk: Document CDCLK_CTL bits
In-Reply-To: <20260612173653.7830-5-ville.syrjala@linux.intel.com>
Message-ID: <940c1ac7-52a8-45dc-47a2-66fd257f3e5a@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-95153251-1781597027=:605841"
Content-ID: <06c09878-6c55-2072-531e-db2e4694ec52@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-95153251-1781597027=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <0377a5c3-a60e-0f20-25b7-c6294a279050@intel.com>

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Document which CDCLK_CTL bits are relevant for which platforms.
> Saves me from having to look this up in the spec every time.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-95153251-1781597027=:605841--
