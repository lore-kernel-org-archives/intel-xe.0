Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF47CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 17:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6296D10E789;
	Wed,  5 Nov 2025 17:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1+oRzpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426310E789
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762362389; x=1793898389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HjJc+fvCWPF7va4s0gdFfkSDpPCElPAxV+DevGSD6Ys=;
 b=i1+oRzpB/F64z7ADFL7aMxBZEbkgxFMZwzWd2nMV6615UHyl2pCIHLaF
 0b/maahtHki7JDFS0jDGHGZwXF0NOosVnm6ysznHOIufJZszU+uMSKb8y
 d9Lu6oqbzAR/kNdx4ZgAen0kGCpHggVjXrA2qXlC0OXEoVlzPNj3ymMI7
 TnvXIIjG5R+xd4XLgqjhdrm5VFusIVmaX6+ntS/iyJkADoxZAqHGphRMW
 0W+Y4hgKPHO81QbXjPwJy49cIL1J2N3/Kd98qLX2i7iLSaY3bF//obsK/
 U5la2k8TvZ17GjucroHUu7bvsP1bOpWAYaz0tfkapT4i2OG+4tVATL1H/ A==;
X-CSE-ConnectionGUID: nhbN68wGR3unvJI//vnkyQ==
X-CSE-MsgGUID: dIiFJ/97QoSTjVRu2wRUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75165717"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75165717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:06:29 -0800
X-CSE-ConnectionGUID: aysL8kfyQpebNZxDznFxDA==
X-CSE-MsgGUID: Oab7olHZT3iAdQVFcxF7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186761330"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:06:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Date: Wed,  5 Nov 2025 09:05:36 -0800
Message-ID: <176236231600.1194929.9159895503363178764.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
References: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 04 Nov 2025 14:20:51 -0800, Lucas De Marchi wrote:
> It's currently not possible to safely monitor if there's throttling
> happening and what are the reasons. The approach of reading the status
> and then reading the reasons is not reliable as by the time sysadmin
> reads the reason, the throttling could not be happening anymore.
> 
> Previous tentative to fix that[1] was breaking the ABI and potentially
> sysadmin's scripts. This takes a different approach of adding and
> documenting the additional attribute. It's still valuable, though
> redundant, to provide the simpler 0/1 interface.
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
      commit: 83ccde67a3f73326e89dde66c0c775c932a30570

--
Lucas De Marchi

