Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B68FC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 19:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531E510E00C;
	Mon, 24 Feb 2025 19:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ov+bMOl0";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3C10E045
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 19:45:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD1E65C6534;
 Mon, 24 Feb 2025 19:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E50C4CED6;
 Mon, 24 Feb 2025 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740426329;
 bh=JZFToUnXRujE/zLYVFFxQ0fhnbMm0Dkyva7rE6Afx2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Ov+bMOl0qigOWU42d6K3/BThBfIxk0gYUsJYtwCMK6qwLWik4ebMh15zhxzujBZtp
 sL7XnnRUFMKrz5sPDDrg89tZr5g7wRff4qM7s3fNFg7u/APDYjIueJObCIp73xSNCi
 mqN/R+2RYq5KPYc9YubmVdWC6Rt2aUye+R7+r23nR9dp1ehtLvg7dokCpGYE9NE3YV
 R+DYS+urEDd/vyNQ/cF5XYjfKNZVCqp4aHDJ8zmEIOvWOcxapKdMYZHmQWSj6uQBQV
 W6DdVyOs4a0cNHdWJB2krCZ5pQ4tbJoRiv5rJjrEUSk1cnAooMoU3q8Okb068DNHxI
 wInHsHMvV067g==
Date: Mon, 24 Feb 2025 13:45:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, kam.nasim@intel.com
Subject: Re: [RFC 5/6] drm/xe/pm: D3Cold target state
Message-ID: <20250224194528.GA473335@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-6-anshuman.gupta@intel.com>
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

Could the subject line say something about what this patch does?

On Mon, Feb 24, 2025 at 10:18:48PM +0530, Anshuman Gupta wrote:
> Trade-off D3Cold target state based upon current vram usages.
> if vram usages is greater then vram_d3cold_threshold and GPU
> has display connected then target D3Cold state is D3Cold-VRSR
> otherwise target state is D3COLD-Off.

s/if vram usages/If vram usage/ (capitalize sentence and fix "usages")

I dunno what "D3Cold-VRSR" means.  I suppose GPU folks do.
