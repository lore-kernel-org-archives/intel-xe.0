Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CE8E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 05:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89B910E2BA;
	Thu,  9 Jan 2025 05:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo+DwExi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106BC10E2BA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 05:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736399621; x=1767935621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ASTU4cGFlIkOAsyr1Xhn/PW7TxaeVW6w5mU32l8xrx8=;
 b=jo+DwExiTeO2tcTEEhtsgS/OBM63OvFIaYRaLoCFGCJxiIgc+AEW+MQI
 PLE8hZjeDP0TpZGWZ8KgueYvO919+Ss15Dc/DlDruQyrlhTBU8UNAQj/Q
 +HtQaX/1rUnf4MxltQXjAeTfoVlKwFmLzC38kIch0H25K+nPB/Fe03kwu
 q+10EFK6V1LgEzteXo3zLtqGnXHr65NMvYPlw0zQh3AmDjtT7G8lRv+O0
 b1V14qkuc0tN8sS3SZcVAAcSVC5GG/71mrnMZvMP5OL5kSjDPiF8vfRh2
 s4OVJU/9EZaN2pdOvATdl2UgiWObef+2BPAj5ZadX95qHM0y5X9ogVawJ g==;
X-CSE-ConnectionGUID: QvgF6DlOTtW89Y6pCS2fgw==
X-CSE-MsgGUID: nqyNfDqpQDSOgEqZDAxT7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40410768"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="40410768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:13:41 -0800
X-CSE-ConnectionGUID: 3WRc8GJVQqKc/+9BWImH+w==
X-CSE-MsgGUID: 89U0+wSeSs+5npn19IJnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="108284380"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:13:41 -0800
Date: Wed, 8 Jan 2025 23:13:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Introduce the RPa information
Message-ID: <xzp355lh6rjwx3jfscqtxymvbe5lra7drnpmtyhwgdydw2t3se@rhclhinukrhx>
References: <20241220152936.623627-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241220152936.623627-1-rodrigo.vivi@intel.com>
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

On Fri, Dec 20, 2024 at 10:29:36AM -0500, Rodrigo Vivi wrote:
>+static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u32 reg;
>+
>+	/*
>+	 * For PVC we still need to use fused RP1 as the approximation for RPe
>+	 * For other platforms than PVC we get the resolved RPe directly from

2 references to RPe that should probably had been RPA?

Lucas De Marchi
