Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59DBC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 19:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760E10E476;
	Thu, 15 Aug 2024 19:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoiySrOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F07A10E476
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723749823; x=1755285823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PzlYzK1JoVcgvjerb10y+eCT6oEArqHM91Hld/QFuwk=;
 b=IoiySrOYKQqO3ZSspb4yRmFskYJytenD059lV4i+T+mok62dsyUExYsY
 zhS5+e5aYk/fq3AHXgyFnHDlXOIv34ugFg1rzUgvwYo99umtqsv9Q5nbX
 WhJk17DOEJAPTADrJSGcMEnR2D+LsHuSuTckEu/yQWBJ/ebZtZFh6rtI0
 4xZ585AiRLayz80+lpv7CIJDDTlQoOC1Q4lutx+pqtQT4/UL1+oGaGbqW
 9HXBqhAJv4btB8Ydrl9/7H5m3Vnd2msU+5BHe2ul0s0IEiZbRNgXagYv2
 w2IiXp+PDrmpUen55PZ6AIgIrFU9w+p4HVx3n6stq0dkDM622K6I28ohW w==;
X-CSE-ConnectionGUID: hnzgZR7rTqKI3T9+3VnrLA==
X-CSE-MsgGUID: SUbRW1+UQJO/xv85STYf/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44546887"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="44546887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:23:42 -0700
X-CSE-ConnectionGUID: a4Z5weXgQpSPMZrL0hGDBw==
X-CSE-MsgGUID: Df94cIWyRPW+LawjXho4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64127352"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:23:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: fix engine_class bounds check again
Date: Thu, 15 Aug 2024 12:23:33 -0700
Message-ID: <172374975170.3795871.6575769916980261597.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812141331.729843-2-matthew.auld@intel.com>
References: <20240812141331.729843-2-matthew.auld@intel.com>
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


On Mon, 12 Aug 2024 15:13:32 +0100, Matthew Auld wrote:
> This was fixed in commit b7dce525c4fc ("drm/xe/queue: fix engine_class
> bounds check"), but then re-introduced in commit 6f20fc09936e ("drm/xe:
> Move and export xe_hw_engine lookup.") which should only be simple code
> movement of the existing function.
> 
> 

Double checked again with git show --color-moved and confirmed it.
Applied to drm-xe-next, thanks!

[1/1] drm/xe: fix engine_class bounds check again
      commit: 23ab1cb6591dba7c97b65eb407cd71147bd878b8

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
