Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC6C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 06:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343710E270;
	Tue, 27 Aug 2024 06:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtSys2Iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293210E270
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724740009; x=1756276009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4x3RTa/lHM7AnIt27Uo3JYRXmW9emiIYcVsw+4EZk0E=;
 b=mtSys2IvqY6cIE/IL/mWhdbQsBL1mC/+kRTDy62gEzPGT/xLBqvXOtN4
 LRUTautvvgKW6o4JQe78eBG8NPWONMvwom3JrsLarBsvrttaRXn38huTW
 ibXtl+Pxp4+YgAN1KhsgPCkyaPyRs6YY1pRURSGXBlK9sfCc8Lg6pnrZh
 4qj31nzEKXsU5fFZJ51qyWzIS/+NPyuW97YwRHsmW5B5Sie+IGYPtWk2O
 /UpOPJuI2A2sJDMkzscBG0eLhCWMdEKziFjTtu7v7ElkePJ9mC2AbE1kx
 vrhUVxhPi+C6OfMBDBhYtYRMbYAII3tl/CI5X1MrQM4ZNRcch/qjxOKHH Q==;
X-CSE-ConnectionGUID: WqmVf8z6Tmai5TWT7LtFNA==
X-CSE-MsgGUID: qee43yazQq+Tp+kf0UIGVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26992118"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="26992118"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:26:49 -0700
X-CSE-ConnectionGUID: 02g7SFcBS/68/m+GLtT+BQ==
X-CSE-MsgGUID: nq3IzAjxS/6qjhxlmEb5fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="63268988"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:26:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/lnl: Drop force_probe requirement
Date: Mon, 26 Aug 2024 23:26:37 -0700
Message-ID: <172473996201.1677393.11744348549360173487.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822224615.793540-1-lucas.demarchi@intel.com>
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
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


On Thu, 22 Aug 2024 15:46:15 -0700, Lucas De Marchi wrote:
> Lunar Lake has been usable for a while in a desktop setup. Bugs are
> sporadically showing up in CI, but being promptly fixed. Nothing very
> concerning.
> 
> All the uapi changes related to fundamental platform usage have been
> finalized.
> 
> [...]

Applied, thanks for the reviews.

[1/1] drm/xe/lnl: Drop force_probe requirement
      commit: 9c57bc08652a7c8e0e355c52c023fddc090fe9bb

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
