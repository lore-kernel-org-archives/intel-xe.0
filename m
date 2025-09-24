Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C88CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 15:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6461E10E76A;
	Wed, 24 Sep 2025 15:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb6edJit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7910E768
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758728532; x=1790264532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WJjImwfvGmTexfee7O76WD10Zvb7a5HKuZlGZMDm99I=;
 b=Tb6edJitC2Z+hpQ936RILrjUSDTMbHVle88szuRBEYNy3VCHwP9jEyM8
 9LbV494vioNnENEGOgLZuq0XD4V4fvm0wT4uM8DtaMRcnDwJzSe5JpvkS
 MBXGxmXiyxkASNnea2D9BxWaNZLWYBe2uh8Zwu38PTv9VSxYB7wfvt6Bj
 FECuDATepQl4qs0stVJjpU6H99N7oyVsAiB8tDPyHOKjYeoxjTHUf/8Ew
 eCLziqLX2WxEDnceexzx+LlomCiGHbwMSgIgI5pFQYynTlw+1CphV7Y8N
 aHfN8yJSh3GExsfdNau9bYHUrllsDaPAUd320v6odwVeIAewLMO6tyVEe w==;
X-CSE-ConnectionGUID: I8rJFzyiRz+2ChgtOzUl0Q==
X-CSE-MsgGUID: G3TQfNFLSJWvwqS6fGeAvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60954313"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60954313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:42:12 -0700
X-CSE-ConnectionGUID: QxJG893USby94/08fwctxg==
X-CSE-MsgGUID: C++GdVJQQBiWHD0hnOQHFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176992567"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:42:11 -0700
Date: Wed, 24 Sep 2025 17:42:08 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/configfs: Improve doc for ctx_restore*
 attributes
Message-ID: <aNQRUAeC0oh_g2DA@black.igk.intel.com>
References: <20250924152709.659483-3-lucas.demarchi@intel.com>
 <20250924152709.659483-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924152709.659483-4-lucas.demarchi@intel.com>
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

On Wed, Sep 24, 2025 at 08:27:11AM -0700, Lucas De Marchi wrote:
> Spell out the syntax instead of only using examples. Particularly
> important the <engine-class> part since that's different than
> engines_allowed and may confuse users. The same batch buffer is used for
> all engines of a certain class.
> 
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Nothing beats a comprehensive doc.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
