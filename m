Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6AC77B60
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 05:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419FF891B8;
	Fri, 28 Apr 2023 05:40:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1A891B8
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660450; x=1714196450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uMlFwnnzabwqUyhivO3YZuXa4hX/8Zjr7+Cirz0WAjI=;
 b=EZ68CmV4YjFYbO2wQhqnZms/4BCQsv63h6fw5rt4+D3mBiDK7xeNxb2o
 OFJWVqcUQWXo6dG7CR4OCRZZNUtgoJPKQYcnj4CZTt9dCi5tNfofUmlnl
 S97ijqb3TiUNdw8pqueqYA1FwTlBFGRIU7VJGNlYtF48QAieogLuR/HZ1
 Cp60AaKgHoEqKfGC5wanfqo1IABTTpf/Tgja7xtGu14Y255r8uCiEF9tD
 uzOVRANftz5eMICYpSvRRWjHbr2a+99Ry+Ya/b7E+gln8xKmqft3+YMRE
 uoYbotTaMiKwNuR4U/M07ulmTycOYuXiAezXGisTzAjQsqI53Jscur3S4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375651448"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="375651448"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694690500"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="694690500"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:40:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 27 Apr 2023 22:40:28 -0700
Message-Id: <168266030098.1439630.2760168480196611688.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427223256.1432787-1-lucas.demarchi@intel.com>
References: <20230427223256.1432787-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 00/10] Cleanup registers and introduce
 xe_reg_*
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On Thu, 27 Apr 2023 15:32:46 -0700, Lucas De Marchi wrote:
> Continuation of https://patchwork.freedesktop.org/series/116411/
> 
> v1: https://patchwork.freedesktop.org/series/116845/#rev1
> v2: https://patchwork.freedesktop.org/series/116845/#rev3
> 
> This v3 has some minor changes after verifying the REG_FIELD/REG_BIT
> conversions were correct. Also recorded the missing r-b and removed the
> patches that were already applied.
> 
> [...]

All patches applied. Thanks for the reviews.

[01/10] drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
        commit: 4fe61c7354b4ba6b3caa2b60d2954a2069d7cc90
[02/10] drm/xe: Drop gen afixes from registers
        commit: fc229526d27c8c5520c26d1a803ebc7500fe079c
[03/10] drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
        commit: 6c2c497aa029715c2303e42329cb7049253ca826
[04/10] drm/xe: Clarify register types on PAT programming
        commit: 80d7df4496738d41afc4a8fd56e5b38b7d3a90fb
[05/10] drm/xe/rtp: Improve magic macros for RTP tables
        commit: 932be0891c2316645f80e86064781916cddd3303
[06/10] drm/xe: Introduce xe_reg/xe_reg_mcr
        commit: 6ee02788b9a5f2d96097861aee4917e1d4d6e40a
[07/10] drm/xe: Use XE_REG/XE_REG_MCR
        commit: 5134fb96905e54c1327469db86a61866046554c6
[08/10] drm/xe: Annotate masked registers used by RTP
        commit: 39cba5662582d4a6b8ffd3cac7bd182034adde94
[09/10] drm/xe: Plumb xe_reg into WAs, rtp, etc
        commit: 7c205e4cfdd272365289a52b2075373de262acee
[10/10] drm/xe: Move helper macros to separate header
        commit: 03294143eb8f228d6a177188bd38bfce539db14d

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
