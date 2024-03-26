Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF81ACD11DD
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 16:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A95110ECB2;
	Tue, 26 Mar 2024 16:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrSP9Q0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09110EC1C
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711470031; x=1743006031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9bMeBN4syNOgKTohdlpni3B17vtVBfVQrweVRHb3CY=;
 b=VrSP9Q0cHp6Fs6rZDljNFCuyn+yGE62i6FwYi+GhEoHxUcO3aXKqs1bv
 eG4p/Z6hZc8usduZQCUwjUVWKBIlGsBmcx4h5tBlSMVM8LVRCMmNvQvlv
 SGLI+4oyaYF/IyRHHnoDNp5821SiWpxSihCR3DBG32AU3OJjeqTK8Q5DD
 5bof8Tr3O9a3WChFQ0g94Z0WzL7nnYT1dhzEffIXovGKe8GZLs3NKDYze
 qmULxmciAnLTii53wHd0MXP+YBc5sSA7zB2v2M+zkM5hnUHDq/tnunCsr
 HUck18Rsh+uzcM2NJumJ17XDxNjoQGwFj1uVAGzKkQtBvc8jK+KSRNqPg Q==;
X-CSE-ConnectionGUID: nw1WivEXSsKyxZgK0A2Tdw==
X-CSE-MsgGUID: AiGwOS42TSau0AfA6cNEfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6471189"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6471189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16401347"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:20:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use FIELD_PREP for lrc descriptor
Date: Tue, 26 Mar 2024 09:20:54 -0700
Message-ID: <171147004253.713364.7651388067462327669.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322191455.7613-1-niranjana.vishwanathapura@intel.com>
References: <20240322191455.7613-1-niranjana.vishwanathapura@intel.com>
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


On Fri, 22 Mar 2024 12:14:55 -0700, Niranjana Vishwanathapura wrote:
> Use FIELD_PREP for setting lrc descriptor fields instead
> of shifting values to fields.
> 
> v2: Use ULL macro variants
> v3: Do not use FIELD_PREP for 1-bit values
> 
> 
> [...]

Applied, thanks!

[1/1] drm/xe: Use FIELD_PREP for lrc descriptor
      commit: cf03825bdd190b7ab323f797278a00fbf163d889

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
