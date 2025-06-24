Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A6C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 17:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E53310E61E;
	Tue, 24 Jun 2025 17:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4wS4XdN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7B610E61F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750785828; x=1782321828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qalfQA+zErRIpWz5JmxuhFF+wKhTgxmiXQWdmEMcFXM=;
 b=K4wS4XdNg7JrwGDPy6kN292dMXUKlNmGfZhKAI80UDfu8tAizl+UKmVp
 XSdbY0O/LS9pEtwY+q/S/dEWzvuEDT4HmOx8+XBtZhO3PbtyBumLzpOk0
 Sq/gOPcRY/dVLiQSpC/HvcJXBVQUoLj0xsqGMhAq9/YVVa+oUodZ7eDFa
 4WR6ecJXR+xYOSqjRuD1Se7WKEB9WBiZW0On5LftsLTnrOk+3nzQQrCOt
 S2U7UO23vTGKbodpPBVMzBh/7OP9co7qSJ0D4MHBEq4Vy11F1si4JigMA
 svohBLJ4j2tNafIynOhlK+3q+9muYdH+6HPNummCFfHDXTkd9Vzk506rI g==;
X-CSE-ConnectionGUID: QwWpXvOYTsWxilHs7dOKzw==
X-CSE-MsgGUID: 2US5ZFgsTbWuGzOPaPLIcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53173415"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="53173415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:23:48 -0700
X-CSE-ConnectionGUID: hWqFU2ynQpiK22MoPZsfbQ==
X-CSE-MsgGUID: Knxe6jFpQA6TplAdkRfz/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="183016983"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v5 0/4] drm/xe: Update Wa_22019338487
Date: Tue, 24 Jun 2025 10:23:33 -0700
Message-ID: <175078574696.2428196.4602169278646074701.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
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


On Wed, 18 Jun 2025 11:49:57 -0700, Lucas De Marchi wrote:
> Extracted from https://lore.kernel.org/r/20250602234415.2015921-4-vinay.belgaumkar@intel.com.
> Now that the other workarounds were already update, also update this
> one that had more changes.
> 
> 

Thanks, applied to drm-xe-next.

[1/4] drm/xe/guc_pc: Add _locked variant for min/max freq
      commit: 1beae9aa2b88d3a02eb666e7b777eb2d7bc645f4
[2/4] drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      commit: d878c97daa603573e5af01fd8beec2fffdb42ad1
[3/4] drm/xe: Split xe_device_td_flush()
      commit: 5e300ed8a545bdffc26b579c526b5fef7b2d5365
[4/4] drm/xe/bmg: Update Wa_22019338487
      commit: deea6a7d6d803d6bb874a3e6f1b312e560e6c6df

Best regards,
-- 
Lucas De Marchi

