Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E30CE7AA8
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 10:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852DA10EA3D;
	Fri, 14 Nov 2025 10:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XioTZk1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2610EA3B;
 Fri, 14 Nov 2025 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763116261; x=1794652261;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xToR6vpE4yLsP+Nodk8eV4ZDqVXqdsWNqUADjs32p8Y=;
 b=XioTZk1vJ8csOLovCQO0t54zIuf+Tw9wFBjbXCnK4aTu8EvpVlm4UlhJ
 wXJt1R+CC3CqJKMeHyx/vCHIEnpAs36ibKEhjEhrUMNi5tvvM+3iAh7oG
 dO5d/mIbTs4EMqozxuRwknFwjS442cpQXk9CGh/xU6vD2f95qqo7O/DeU
 mQ2YMDlcRgypsEi7gELWN22DIkReWyP4PeJ3SnuLUh4b5EBm8FxQ21TB4
 LGio/EzljiPEgQqNpVDnghoLypOYHQHJBHtnu35facU8igZCZCSy2cC/U
 6xIlXt2gzWryNYQQQhxFDeqOgOo294fckPQZpMRGC2xMmGKFAzEty3Pnk A==;
X-CSE-ConnectionGUID: 2tTNKkBOR0Ct2ebmI+Bg3Q==
X-CSE-MsgGUID: qjF4DY7oSay0Cc8zOcY2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75527842"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="75527842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:31:00 -0800
X-CSE-ConnectionGUID: CgPp3oTwRFmuus6rrLZAoQ==
X-CSE-MsgGUID: uD0ZF5X6QAiypDOJaGhGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189993745"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:30:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jakub Prussak <Jakub.Prussak@synaptics.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: PPD-Penguins <ppdpenguins@synaptics.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave
 Airlie <airlied@redhat.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: Cache coherency issues when reading from intel Xe buffer.
In-Reply-To: <PH0PR03MB6299A7D48D2DD771B06E8882E9CAA@PH0PR03MB6299.namprd03.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <PH0PR03MB6299572C46068849DBDD3A88E9C2A@PH0PR03MB6299.namprd03.prod.outlook.com>
 <ac533b9a7b0f8aa2bb3a0f037db1a65ac7fc5807@intel.com>
 <PH0PR03MB6299690EA881490196BF9A4FE9CDA@PH0PR03MB6299.namprd03.prod.outlook.com>
 <c4fe42a84823880c7d874e94097b8a4f0d2b08b0.camel@linux.intel.com>
 <PH0PR03MB6299A7D48D2DD771B06E8882E9CAA@PH0PR03MB6299.namprd03.prod.outlook.com>
Date: Fri, 14 Nov 2025 12:30:54 +0200
Message-ID: <8e0c8db54085ad6543f917be310ca557a3180680@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 14 Nov 2025, Jakub Prussak <Jakub.Prussak@synaptics.com> wrote:
> Once the xe driver was forced the laptop screen stopped working, but the corruptions on the EVDI display stopped appearing. In lspci output there is no driver in use for VGA device. I attached lspci and dmesg output, let me know if anything else is required.
>

Might want to get this fixed before any further debugging, i.e. update
to a newer linux-firmware package.

[    6.255871] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Unsupported GuC v70.20.0! v70.29.2 or newer is required

This is also getting a bit involved and noisy to debug on the mailing
list, with dmesg attachments and all. Lore is rejecting the messages and
they're not getting archived. I suggest filing a bug over at fdo gitlab
[1] and continuing there.

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
