Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BD3C6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 01:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5D010E14C;
	Wed,  8 Mar 2023 01:24:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41E910E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 01:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678238677; x=1709774677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=COyhhX/sysb065XGjTftKEkSIfNeSks/7BXShDOnOuY=;
 b=TK9iqjPU1hOqfwrZxV8qVLvbP1nf0ij9TQhjAQFTUWqpiJitl6EZSt0b
 Vd/7o0xefJZWTGRze3FTZtekXtMJX9llFIaC7rXnbakXlZ3dQSI1eSWPI
 hUBwkYG970IXyPXctXp6lfS0n9r0rl4TawPuf41uldh819UhUK/dDAHni
 u+GGGvuyhTJtHuEls9yoTGDWW95DFThFCkSpQwla7OhO5tj+/X5XXI3Sr
 ft3JWGkgyZ775wsA0JukyPd8rFr2J2X5bYxSuh3n5pG5xnSOGu0XdZxFE
 L7rGu1B0/lw5tRnFVc5hjCLpN2R4MPPiy2nz+cP6rEysb1DLbW42D34tg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315679038"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="315679038"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654167438"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="654167438"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:24:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com
Date: Tue,  7 Mar 2023 17:24:22 -0800
Message-Id: <167823854624.1367036.8213075220868814471.b4-ty@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 0/8] drm/xe: clean up i915 includes both
 sides
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 3 Mar 2023 12:52:14 +0200, Jani Nikula wrote:
> v2 of https://patchwork.freedesktop.org/series/114573/
> 
> Jani Nikula (8):
>   drm/i915/display: don't use relative ../i915 includes
>   drm/i915/display: drop redundant display/ from includes
>   drm/xe: drop unnecessary include
>   drm/xe: drop redundant display/ from includes
>   drm/xe: drop redundant ../ from includes
>   drm/xe: move all top level i915 compat headers to a separate
>     subdirectory
>   drm/xe: remove unnecessary include
>   drm/xe: drop top level i915 from include path
> 
> [...]

CI failures seem totally unrelated, with build failing in paths that don't
exist. Tested it locally on DG2 without (new) issues.

Applied, thanks!


[1/8] drm/i915/display: don't use relative ../i915 includes
      commit: 7427e6efafe5d27b61c874d601b9777d2c3d22be
[2/8] drm/i915/display: drop redundant display/ from includes
      commit: 8125838bb041c99c44c7a1a9c835f3e8b5ba0872
[3/8] drm/xe: drop unnecessary include
      commit: 4c49d3819590d7d4f47063060eb9c67b1a2413db
[4/8] drm/xe: drop redundant display/ from includes
      commit: cda2426139690947b709afe5328e2b566a27ccae
[5/8] drm/xe: drop redundant ../ from includes
      commit: ff19a0d7bade988ac8bb45d2b22b4e9777694a7a
[6/8] drm/xe: move all top level i915 compat headers to a separate subdirectory
      commit: d718a268655a51169764d7a9faf9fb34be53372c
[7/8] drm/xe: remove unnecessary include
      commit: e411806284d177358c9ba7f33346fa8a9641490c
[8/8] drm/xe: drop top level i915 from include path
      commit: c60ca5493bbb5dc134b93331a111445e945a1521

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
