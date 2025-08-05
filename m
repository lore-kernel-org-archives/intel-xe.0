Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3557FC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 19:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72910E29C;
	Tue,  5 Aug 2025 19:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWU+hclD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5164910E29C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 19:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754423097; x=1785959097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05RuZ3uxkZrmJQIRWQx8MKyK53skcESQtMigZKlvmnM=;
 b=PWU+hclDWxYav0qYn6iNI4W06zd7VEBsAJCJWLu5i665Yymc+kxpFvmF
 tXAGpWy3O5Gcw8oL3JP/8e9Lf84/Otjzr8xrglF0QkjGacYEGxXLePQaK
 G2jLhtZTRcAnBrSCCMR9Lq+HvT1ORAFl2lQEzvlAVU5Sypm4T8g6/ilcx
 uFZsH+0XlZXNdjDalpOjfUjM+eNwMYz5OwA1YTnt21Eoqj3WzxyGv8Hf2
 Vgegnfyz0yac2myMo1Hlz3QOhIl+rrB27qyQiwCHV4l5/olFKHnL2jISq
 5jyk26zZqeaP/3FMW0lDK5QJeF/jzoULXmRkrqJ3wdbV46q/YO9599BeF A==;
X-CSE-ConnectionGUID: 8jsdKU8iR2KMokem2mrK2Q==
X-CSE-MsgGUID: Q1Hqp8WrSgCqOSz2McZh/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67804587"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67804587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:44:56 -0700
X-CSE-ConnectionGUID: a0xsYhaKTeKOIf8C9JVYEQ==
X-CSE-MsgGUID: xCV8RV8CTEuuLhg3QYP0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195416303"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:44:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 00/11] Updates for drm/xe/configfs
Date: Tue,  5 Aug 2025 12:44:19 -0700
Message-ID: <175442279468.1539236.1626997478445848991.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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


On Thu, 31 Jul 2025 21:33:28 +0200, Michal Wajdeczko wrote:
> v5: https://patchwork.freedesktop.org/series/151773/#rev6
> v6: don't use -ECANCELED, print message instead (Rodrigo, John)
> 
> Michal Wajdeczko (11):
>   drm/xe: Simplify module initialization code
>   drm/xe: Print module init abort code
>   drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
>   drm/xe/configfs: Drop redundant init() error message
>   drm/xe/configfs: Rename struct xe_config_device
>   drm/xe/configfs: Rename configfs_find_group() helper
>   drm/xe/configfs: Reintroduce struct xe_config_device
>   drm/xe/configfs: Keep default device config settings together
>   drm/xe/configfs: Check if device was preconfigured
>   drm/xe/configfs: Only allow configurations for supported devices
>   drm/xe/configfs: Allow adding configurations for future VFs
> 
> [...]

I dropped patch 9, "drm/xe/configfs: Check if device was preconfigured",
and applied the rest with the typo fix + const addition I mentioned in
patch 8: we can drop the const later if we decide we need it non-const, but I
don't foresee us doing that.


[01/11] drm/xe: Simplify module initialization code
        commit: 90759cddaceab1a7cfd0128d9421abf2d9288d09
[02/11] drm/xe: Print module init abort code
        commit: 823301c847bd9c57dd8f7c684046778281744c77
[03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
        commit: b90613fb02179a01c6042d8a952e2c68e81d3cf7
[04/11] drm/xe/configfs: Drop redundant init() error message
        commit: c4b1dde0630e40fa773b1613495d4df4955f44b4
[05/11] drm/xe/configfs: Rename struct xe_config_device
        commit: 88df7939d728a90ddb722c8113a4529948b3d2ef
[06/11] drm/xe/configfs: Rename configfs_find_group() helper
        commit: ae3184d5f980d92377545ba58030e47ce48dd09f
[07/11] drm/xe/configfs: Reintroduce struct xe_config_device
        commit: 3c643f6216215c7e4e30f7a647024a20847b27af
[08/11] drm/xe/configfs: Keep default device config settings together
        commit: 737a72d7e0231123ae3f1578845d9a23b6d02a60
[09/11] drm/xe/configfs: Check if device was preconfigured
        (no commit info)
[10/11] drm/xe/configfs: Only allow configurations for supported devices
        commit: b4687422c322e5afc0f5d9425b29080c06dc17b9
[11/11] drm/xe/configfs: Allow adding configurations for future VFs
        commit: ca0ed3b10f5dba790808107896c568cc037a74f4

thanks
Lucas De Marchi

