Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB9ECCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 17:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95310E07E;
	Mon, 10 Nov 2025 17:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvBr7ZHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94D810E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762796647; x=1794332647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oyw8MGSFsr5dcgB/znyAsgObuOh3ovh0s503xlj4MA=;
 b=SvBr7ZHGTTJV9VFZoehgwBphgeLP1oZQ13WEuc6D9ExMjIPmUpot2YFo
 ioFHn/PBXPxg2NDskVRyfnrY+Z02ZoTRoX/o137CVoHzGLp+DLssuoRvd
 0eBzXN/VsE4a+ixS6O6U0GQEkIOrwKkAFvkvoLaaM5tYJYJvvC8B6w0tw
 qmMYUIIHZZumF3q7FC23cZeS0hJnj6S94ZR2UA8CwYZ4+vwA0mTj+JkLy
 eXIs2jz12bObPhejNAo02IHb3zGKQhS7K1gTAyKE88MhY+fzJrctQJPy0
 Je8pd7RBriiUq7vJgypyjT+jgdSGb0k8bz0wOw5Bv3Kk9R5KYnHJb3gc5 A==;
X-CSE-ConnectionGUID: 0Fm9VEEOTX60tY4XqmkPdQ==
X-CSE-MsgGUID: kqjzNSWnQY2UFFTxVv5jhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="52409354"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="52409354"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:44:06 -0800
X-CSE-ConnectionGUID: 5l2Z3qITSuOt0BIqGJyciA==
X-CSE-MsgGUID: SCtsP9hGQq2BfTOK08GdXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188684303"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:44:06 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: fei.yang@intel.com,
	Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: Tile address change
Date: Mon, 10 Nov 2025 09:43:28 -0800
Message-ID: <176279658636.3012175.1348967697026411602.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
References: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
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

On Fri, 07 Nov 2025 10:23:43 -0800, Lucas De Marchi wrote:
> Same patch as https://lore.kernel.org/all/20250930232645.600251-1-fei.yang@intel.com/
> but with the additional suggestions taken care of, one of them as
> a separate patch.
> 
> 

Merged to drm-xe-next, thanks!

[1/2] drm/xe: Use SG_TILE_ADDR_RANGE instead of TILE_ADDR_RANGE
      commit: 84a6fc4c9fb95c7abdc2c749e7d9d8947061b259
[2/2] drm/xe/vram: Move forcewake down to get_flat_ccs_offset()
      commit: 3389c2be7fa0733b225c5676b1eaa87927745409

--
Lucas De Marchi

