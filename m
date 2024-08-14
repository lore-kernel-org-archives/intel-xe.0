Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C0BC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 13:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018310E471;
	Wed, 14 Aug 2024 13:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvTL3Izf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B097510E471
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641216; x=1755177216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNCLABH7/IrBnj9+8Ysj5sjQGOLHld0spQYVByl8bpY=;
 b=TvTL3IzfQI5K6qHVezr/6ZgtaP0mFQ8hSaPNMgLT5J6M3R155/Zz6kaj
 SjJf9iZf9fE+WunUAbDkon2140/yT2D3K7ZF5cwO9K+3YyReTwsIY/GOu
 3r00VpQbDaWwuvStUhY+MQ71Dnwo+KS0FfeK53+2/b+d5yUHwGnxCBSsB
 NcnWcoxCGDOHxMBZeIqLq0/q7doXMPsEhJhqm446ILe+Xr1dyDrd8idyL
 yKT1rGqSYSQ78+ebXZ2GoTfMwaRDMUNpmxePHrWptQt4e5imGKV1X85aA
 5U8YvTJ2JiXwDgbycGHCfyxefa03UrTCpjGMwYIXNq5jemlWHT+fLu7hO w==;
X-CSE-ConnectionGUID: o/EASvSsQw6Ewiy2QpT1Lw==
X-CSE-MsgGUID: V8LVWCBLS2Oooo3DpMWaKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33262146"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="33262146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:13:25 -0700
X-CSE-ConnectionGUID: haj0EMRBSS+52eFzjDw71g==
X-CSE-MsgGUID: 9uRAzZMqTri35X03G4+ZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="96514122"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:13:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused xe parameter
Date: Wed, 14 Aug 2024 06:13:17 -0700
Message-ID: <172364117517.3655140.13116373375115233365.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813104419.2958046-1-himal.prasad.ghimiray@intel.com>
References: <20240813104419.2958046-1-himal.prasad.ghimiray@intel.com>
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


On Tue, 13 Aug 2024 16:14:19 +0530, Himal Prasad Ghimiray wrote:
> Remove the xe parameter from the pde_encode_pat_index and
> pte_encode_pat_index functions, as it is no longer used.
> 
> 

Applied, thanks!

[1/1] drm/xe: Remove unused xe parameter
      commit: 4b498d19610c6acd36a8ddf622afdefe4ab093fe

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
