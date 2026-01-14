Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F4D39000
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 18:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47BC10E63A;
	Wed, 14 Jan 2026 18:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JXrqNV7M";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4F210E667
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 18:00:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9176E6000A;
 Wed, 14 Jan 2026 18:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F5FC4CEF7;
 Wed, 14 Jan 2026 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768413605;
 bh=Euk489+L+tzF9bfrZrLQCpFbXfk68yttgw2jj78uX1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JXrqNV7M889KRN2lWP2/mAtHdJEfJ7qlUsXGZqUYIEgw1QVxK/pVdr0S++3ZDeBS+
 R90osSaJUfPbwU7OLbw5xvikDFAwWmdT1PJH441VI9Kptvbtz1pM37MZIfBFhELvj9
 WaTMCwRhSA1EcrxE2sCHjH/ijFH9+YDYb7knC8dmSNecO0ixXu+BJVbJ9ODoUrFcuX
 cLRAA9OSbfUrVs4eVXuJFn+lGIoCiintELnwxfarYjyd4fAeughwCfDKV2MSE88Gbv
 XmSXq218SEXSsljvu7ym4UYchUwPERB/1+dlIM/zesQQe71bWs9ruDWakm1FO4N2PL
 t4NR64Kho3N1A==
Date: Wed, 14 Jan 2026 12:00:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com,
 matthew.auld@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v6 09/12] drm/xe/pm: Refactor PM Sleep Ops
Message-ID: <20260114180003.GA827167@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113164200.1151788-23-badal.nilawar@intel.com>
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

On Tue, Jan 13, 2026 at 10:12:10PM +0530, Badal Nilawar wrote:
> Refactor PM Sleep OPS to indicate xe_pm_suspend/resume is called
> during hibernation (S4) or suspend (S3/S2idle).

> +	 * Enabling D3Cold is needed for S2Idle/S0ix.
> +	 * It is save to allow here since xe_pm_suspend has evicted
> +	 * the local memory and the direct complete optimization is disabled.

s/save/safe/ ?

> +	/* Give back the D3Cold decision to the runtime P M*/

s/P M/PM/
