Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724CDC282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 07:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BB710E215;
	Mon,  3 Mar 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU1YYQb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10B10E215
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740986816; x=1772522816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2ghoIxX9csA80dKo3tVDYhK1MiCdK4WNyXaw+vn8SVE=;
 b=eU1YYQb3kIQEiYpNF55Hz9tnvULvaxRyUsPUi5YVQQCq6ct5vcPsD6p8
 xVrWgC719GRUzkBlTGRgq/jy2lSl6F0IFVyyrPHO560da251VCS+lkyF+
 /WFKoaG2TZfc76ximQ5DrrUxI8i1XUJgGrWkhIo3ar/lxJIxQj5qKsT01
 LkBHGZCzYSJoYodfb65icAY6Xz4kTmxKfVypzJ31DWQdQtQp9snHmSwUQ
 D9uIPTwT3E46yl3naQwWK3+u4JthpQC33MaSecIr8q+kMHW/tnpH3nvEP
 CZfk9sFVB5R7MZm4Izo/ZRmO1K5ymHNeG6/oo3vpJq/FDSeO1644D7W3B A==;
X-CSE-ConnectionGUID: ZZg2LXiqQr+Z/iLm6KznXg==
X-CSE-MsgGUID: 1NW+FDBrSuiqJtFcKi/KKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64304507"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="64304507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:26:55 -0800
X-CSE-ConnectionGUID: 6mQNmyAGTiuc13MjtTCwSw==
X-CSE-MsgGUID: 657zjpwtR16rIew/2N36Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155104288"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:26:53 -0800
Date: Mon, 3 Mar 2025 09:26:49 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Message-ID: <Z8VZud-t0j1bMSpv@black.fi.intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210100515.2205584-1-raag.jadav@intel.com>
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

On Mon, Feb 10, 2025 at 03:35:15PM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> which will expose fan speed of respective channels in RPM when supported
> by hardware. With this in place we can monitor fan speed using lm-sensors
> tool.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Bump, perhaps we can apply this if no further comments?

Raag
