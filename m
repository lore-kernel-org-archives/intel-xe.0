Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC7CD128A
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 00:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3941A10E56C;
	Fri, 29 Mar 2024 00:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXRGAdv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C3410E56C
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711670472; x=1743206472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p37sU4mu2zxb4VJFnx+M5npJdhpc0+jVRIFMeGRKJ2Y=;
 b=QXRGAdv9xWAHOWNBFuJLd01lslnCeO1BZr4cOzyeQRB/klJ7V2Y1dZJK
 1pij1t4fsy6QvZDLjudnwhTikA63XeyJ3cVDJ4omsMEclVP/CGN11Bdrj
 53qK1iLyIknGNQoalCY/q/+88xGSufp0GcYstIKEd9s/RAMuLmZC27M8N
 Ukr/QmII8pC9gbRfRAtXYXdK1C48Gec8NydD1I9NvurXwxEntTJqR9Kf2
 YBFDSVVxJCWTz0n4O2Ru1N/1Z9W2ut6XmsuibbaCXDIOl/RLhmWdqWUOO
 eX01Bv6E+yjpuX8PO5znhkFTZB4y5iiizF4KskXee4YFSBkpczhNMzSlr w==;
X-CSE-ConnectionGUID: su/ANbfQQtS8ilyzRhVxLg==
X-CSE-MsgGUID: WHR0+LXaQPuysvlYOdx7jQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18005450"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18005450"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 17:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17448828"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 17:01:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Define topology types as indexes rather than
 masks
Date: Thu, 28 Mar 2024 17:01:43 -0700
Message-ID: <171167047684.911880.10603313579090542664.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328140243.7-1-francois.dugast@intel.com>
References: <20240328140243.7-1-francois.dugast@intel.com>
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


On Thu, 28 Mar 2024 14:02:43 +0000, Francois Dugast wrote:
> The topology type is an index (not a mask) so define the values
> like other indexes instead of using powers of 2. This is also
> to make clear that the next type can use value 3. This commit
> does not change the existing values so it does not break
> compatibility.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/xe/uapi: Define topology types as indexes rather than masks
      commit: ca83f9d20171ce1ba5f82fb28b77eddabd636443

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
