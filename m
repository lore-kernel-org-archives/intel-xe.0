Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF73FC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 16:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5C210E808;
	Fri, 16 Aug 2024 16:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mw0u2cb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DEF10E808
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723826057; x=1755362057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sB4Sq60GEb2xrXMimXiJkqd0sGu/m3pLzCP3AVowLfU=;
 b=mw0u2cb5VG8sMWAVVYWMisQGCJboqLBYs5xp+S4fPN29hUXtH1w28XVa
 0dlGAeBuU0AdeD0Yy9ClUPgbkuRzpik7MOV/Tl8lDiaB6cncvLbrvO7ta
 sXcshJhBC+VhBqgM1WladhHHasWI6ihKvouhllrolMERNm7T7X6sPqyl7
 7zSiLFDj4UQIBsoLrXRDe0w2Jjm5lfTVxUKbZKM1HiU8mZrIA5Vp0RqaX
 1YfhMY6MjlaZpLNOHtQ/Zm00h6g+8roggqoA+2BfYqvw/K3cm/m7dnw1W
 jtMKx7N0tuQdXe8XgjZrYDTt39zeg0h5HAk0KhLujBAXe4M5mKJMHQYiw Q==;
X-CSE-ConnectionGUID: LY4AOHYPQn2G5v8lhM/tVQ==
X-CSE-MsgGUID: eJFAX299RjKyQ0YJFx1Yeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33536448"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33536448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:34:17 -0700
X-CSE-ConnectionGUID: 5NzfjsO0QRqUl/oxwZY1Bg==
X-CSE-MsgGUID: u01lQ3CPS0aKguBOB10u7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="60503310"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:34:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: (subset) [CI 1/3] drm/xe/uc: Use managed bo for HuC and GSC
 objects
Date: Fri, 16 Aug 2024 09:34:11 -0700
Message-ID: <172382602453.3919715.8741621900536945248.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815230541.3828206-1-lucas.demarchi@intel.com>
References: <20240815230541.3828206-1-lucas.demarchi@intel.com>
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


On Thu, 15 Aug 2024 16:05:39 -0700, Lucas De Marchi wrote:
> Drmm actions are not the right ones to clean up BOs and we should use
> devm instead. However, we can also instead just allocate the objects
> using the managed_bo function, which will internally register the
> correct cleanup call and therefore allows us to simplify the code.
> 
> While at it, switch to drmm_kzalloc for the GSC proxy allocation to
> further simplify the cleanup.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/3] drm/xe/uc: Use managed bo for HuC and GSC objects
      commit: 2e5d47fe7839298fa096970e184aac9bf82c3bd3
[2/3] drm/xe/uc: Use devm to register cleanup that includes exec_queues
      commit: 5a891a0e69f134f53cc91b409f38e5ea1cafaf0a

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
