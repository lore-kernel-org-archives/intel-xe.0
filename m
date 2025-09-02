Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E78CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 05:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B1D10E58F;
	Tue,  2 Sep 2025 05:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qq6gwEk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892AF10E58F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756792659; x=1788328659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O0Cr6KvfRqnso0wE4RGiXocODnPS9y9CRa04cYUfozQ=;
 b=Qq6gwEk3Zo77msKPcGCcwrbNB8OCSYRQnzsONfpW6KrMWm9quD0WlOyJ
 iOy71BDokhK+Br18WYpP4HkIrCOVlE6dozGZKOWKsS9PC3vJTZJOPvl6V
 mSut6ukHaJK/xBR4G7r0XFOuW8pO4kvQRsGVcDsdX4qYscAXGgESNaN8O
 WO/wotPL1mrG2xP6YwJKIjZ5J5mU16M02Vkps4wCeu3v00Vf3lab5SoZV
 uX/ibF0YPUaeOcxmhTCBkVR9ihboKLiw/md8Nx3sMBY0bsBDiwLjKrGra
 q3orqjOC8PTVfl8LOeW/pRv7+Tt61a7h3bA/0Snr9a7nACMq8hiZl+SdO w==;
X-CSE-ConnectionGUID: p0uIPqjSQlKg2AC9TAuiug==
X-CSE-MsgGUID: h2BokSUWTgCgKbKnZ/IZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61688490"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="61688490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 22:57:12 -0700
X-CSE-ConnectionGUID: DktU7nGgSrKfp19R0nYpFw==
X-CSE-MsgGUID: fnfwRjWCSNeAl5djKMuttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175560828"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 22:57:10 -0700
Date: Tue, 2 Sep 2025 07:57:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 1/6] drm/xe/configfs: Extract function to parse engine
Message-ID: <aLaHMz2VRXGa2VvM@black.igk.intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-1-3cdf4d63c72a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-wa-bb-cmds-v2-1-3cdf4d63c72a@intel.com>
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

On Wed, Aug 27, 2025 at 03:35:26PM -0700, Lucas De Marchi wrote:
> Move the part that copies the engine to a local buffer so it can be
> shared in future for other configfs attributes parsing an engine.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
