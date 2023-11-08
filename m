Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D85C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D420B10E18C;
	Wed,  8 Nov 2023 17:19:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194BD10E18C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699463942; x=1730999942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NX3qO+w9SIwxgZ6MhJ34bUI2fGTMq/AbctopILhRjQo=;
 b=hL7LuhHpv6rqMyaRvLYGTpbM709L9ZOOWhEvIRl5n7S7vQ2H1JKCDp9x
 9sNY4ukmQ5e/RAQXsxoXpp5MHmLDC2vSIjDWJMfpsFa6Hryfyvti/Burt
 fAISczVehpGHUO1ePoUFWoIeDdsMMAqkhukNdQN5bWrfp2/5qnf3Kdeu3
 +Zv6FdT3ZsoiOE3Y76sIqgamix7acV9oZW/tQScsemBepvG0UOpknVRmb
 QFADml/wN/hTVk1tEunVlVNXbR0QwFdJN5//hCGzktx9ynTuTCJGnDOpr
 As53iSkwEBPuy39MiRc5ui2T9dfl+7EIriD2DM93fvftZIRN5HN5GLjOm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393725609"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="393725609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="906850038"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="906850038"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:19:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Koby Elbaz <kelbaz@habana.ai>
Date: Wed,  8 Nov 2023 09:19:22 -0800
Message-Id: <169946392629.2918456.5741327797898737438.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231029175326.626745-1-kelbaz@habana.ai>
References: <20231029175326.626745-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: move the lmem verification code
 into a separate function
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


On Sun, 29 Oct 2023 19:53:26 +0200, Koby Elbaz wrote:
> If lmem (VRAM) is not fully initialized, the punit will power down
> the GT, which will prevent register access from the driver side.
> That code moved into a corresponding function (xe_verify_lmem_ready)
> to make the code clearer.
> 
> 

Applied, thanks!

[1/1] drm/xe: move the lmem verification code into a separate function
      commit: f873cbf891845f0506be50fed7845cf818496604

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
