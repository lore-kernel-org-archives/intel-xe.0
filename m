Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F0CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 19:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583DE10E1DE;
	Fri, 12 Sep 2025 19:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYzebcHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2346910E1DE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757704784; x=1789240784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/PB5jAOzbsFmRPJviYTNZLTDsePqmR00ZoWTVCQZAg=;
 b=jYzebcHniuxBGacv9M2vo7nodo15JQPPhoPuGiT/PZlywissamxG/2Qf
 thxnLIP6v6ncO/GU9LnguSbGIUJZqilPNQa5YApXKLLpQ+qQg/cskvV3a
 dq/XVp/nHdJEUdAS3T0VFC2mRhq8ejIxYl6e10Lb17QVU/kI3vFz/oRrF
 e8wsEa0v5aE1FQr+VdFVDQT4c9illFPOA7CyVqj9wOl8nRTIVFrszch6R
 xdIqCZElo8HyD+1mqf7E4CKXCC0eSYIMDr8qYBkNDw0GsbL4gj9i5/t6q
 Es3GlIe0unNme4qOF6jxeKBv4ur9Wp35KtM8gnXsNcB/CIr8wrhBSIX77 A==;
X-CSE-ConnectionGUID: pMTCDLMdTDiCvvR/x9WpWg==
X-CSE-MsgGUID: f8vJDHJ9QEmsmQdOZrBaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="85487542"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="85487542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 12:19:44 -0700
X-CSE-ConnectionGUID: ZtcosLkCRdWMHw19fSdOmg==
X-CSE-MsgGUID: a09Rl4r6TMmatQoAj68rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173627763"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 12:19:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Nitin Gote <nitin.r.gote@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Date: Fri, 12 Sep 2025 12:19:26 -0700
Message-ID: <175770473836.818136.15931957201643844358.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911052823.226696-1-nitin.r.gote@intel.com>
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
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

On Thu, 11 Sep 2025 10:58:23 +0530, Nitin Gote wrote:
> Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
> auxiliary_device_delete/uninit. The auxiliary_device embeds the
> device/kobject (and its name); freeing it too early can race
> with asynchronous device_del/udev processing and cause a use-after-free.
> 
> Set aux_dev->dev.release = xe_nvm_release_dev and free the nvm
> container in that release callback. xe_nvm_fini() should only
> unregister the auxiliary device and clear xe->nvm.
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe: defer free of NVM auxiliary container to device release callback
      commit: d4c3ed963e41d488695cf91068eabb8eb9f538ec

--
Lucas De Marchi

