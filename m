Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F3C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 07:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D28110E266;
	Mon, 31 Aug 2026 07:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrbakBRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028F10E266
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788162111; x=1819698111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5qsVsRED4LXgJkWgsVIre+Z7Iy3pOZWZ8j+uKBCIr0A=;
 b=jrbakBRmm3UsnMbbKuzBmDMYjrDisXWeXUpmoxz3NnBcuwL/skoKuNyU
 ODQjqjQBui5hVk9DsfvTbncHWkUFIr7ecS6ZgRNY/+TYy8Wof0L+fQPH6
 dQh3/KADQtniueOO1J2epOUd7v5Vlikn6Gns9TO96xypZ3xZvfJGudzet
 i123k3SyIpHr6RFjfX8UsP20YfdwaEtLoLsMArnv/XEBjNRIQ2no9SmuX
 zBP0y3kG6MSd8xtlau/barJ5+7TJxuXsjMmxFvztmZkyU5CoIduLGbiTU
 iTNj13wicFfRbHqWNJA9jNRWZhAZBDTmbugrePsvbO2zzmkZMCsqEfFIb w==;
X-CSE-ConnectionGUID: rgjk4BtuQOGTusJsx3hIPg==
X-CSE-MsgGUID: AUC5aXQNS4aY6bJQ77/hzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99161515"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99161515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:41:50 -0700
X-CSE-ConnectionGUID: oGYjlS8xRFKp24cUFD2yhA==
X-CSE-MsgGUID: JuxYL03DSK2UF5m7YV4zfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272517555"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:41:49 -0700
Date: Mon, 31 Aug 2026 09:41:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 sk.anirban@intel.com, mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
Message-ID: <apUwOZpuO1kOhyVs@black.igk.intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
 <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
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

On Mon, Aug 31, 2026 at 12:39:50PM +0530, Tauro, Riana wrote:
> On 31-08-2026 12:24, Poosa, Karthik wrote:
> > On 31-08-2026 10:59, Tauro, Riana wrote:
> > > On 29-07-2026 22:45, Karthik Poosa wrote:
> > > > Mailbox power limit operations can occasionally take longer than the
> > > > current 1 ms timeout, causing sporadic failures.

Why?

> > > > Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
> > > > PL_MBX_TIMEOUT_MS to better reflect its usage.
> > > 
> > > Why is the timeout applicable only for power and not the other
> > > attribute reads?
> > 
> > Because the timeout is seen only with mailbox power limit commands only,
> > default 1ms timeout wasn't enough here.
> 
> Any reason why this is not seen for the other reads?

+1, these things should be coming from a hard spec with valid technical
justification and not some random email asking us to do so.

Raag
