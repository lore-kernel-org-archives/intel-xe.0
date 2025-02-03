Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F8C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 16:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636B510E06F;
	Mon,  3 Feb 2025 16:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZwER/HO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A110E04E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738598900; x=1770134900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUa5kG90S95f5RTln5kYlbyQIhGzfMkoxgDxEddmmlA=;
 b=hZwER/HOp9Iu8YDnF21DVYfw17L6jkPK3HqKUFSUcz5jMzMdWg4Buqvy
 QK2PQ3YIOt8hg1AoNYpNlYjNDuPEVs+L53TTYn+XdumHU7jNPSAukxIcN
 nuRQl5Ih23KfN2FYfkKyw9y638aDudRE3Gfv7W488JH/wzCtI1xhY1eyp
 0/nuMq2p/1mPyj1sK+HXe3IqH+Le51zzLhkWeP3yIGKPGSKJbNd1o6BHT
 SH+N1uF+8AtPOQlnivbkbMhmdk0xaGf9XVUi6SRrhZgKG5MF0gVoRQqoT
 syGgADk2ninEThctJa+UKXt8S+BCWUzYcm3vSGepa9EbZI9JUJsUdTOUD w==;
X-CSE-ConnectionGUID: zavqbLwfSNKm0vPT+lCaZA==
X-CSE-MsgGUID: HLkFBat1QBqtr0P3exl+BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39128695"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="39128695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 08:08:20 -0800
X-CSE-ConnectionGUID: rX8/hd9bTW2D9Qe0JoJHbg==
X-CSE-MsgGUID: a9yttebBSNS8B/tU5CbyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147537953"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 08:08:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe: Remove xe_dummy_exit()
Date: Mon,  3 Feb 2025 08:08:05 -0800
Message-ID: <173859884294.359233.10717991704913292347.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131223908.4147195-1-lucas.demarchi@intel.com>
References: <20250131223908.4147195-1-lucas.demarchi@intel.com>
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


On Fri, 31 Jan 2025 14:39:08 -0800, Lucas De Marchi wrote:
> Since commit 014125c64d09 ("drm/xe: Support 'nomodeset' kernel
> command-line option") the dummy exit is not needed anymore since the
> caller check for a NULL pointer. Drop it.
> 
> 

Applied to drm-xe-next, thanks for the review!

[1/1] drm/xe: Remove xe_dummy_exit()
      commit: ae5d9cde9b762fd4b7259e1f93a94e0c7f04681c

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
