Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687FDC10F1A
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 03:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CF310E0BA;
	Wed,  8 May 2024 03:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STjBEj+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDC310E0BA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 03:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715138925; x=1746674925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NFWriZ+SLgYgp2ELZVV0DwbrUOFfXsjPu5HeYT2a+d0=;
 b=STjBEj+gCaN/fDlwpckLm9YThh8hOX9cjXSnY7CCZ2XSelggy7vLwj0Y
 Cs4340nkYLrYimYlMtAnuygnQUPycBxBvsw2NYgqZ96GBkcTyS+MaBOJu
 uBv/pCxXBoFXhx4dzmhwnaYXIjXV0KAVCXYYxxZKdHRMENntz2sBebqvx
 dL+eFCx1OeON4S6jqFzkSTTdzEl4iLCkho6XtzKm0VwFe/gnJE7AEkbeO
 07XytBMyTH0ogf4bso4sRcVm1V28r1ZuNLBmnafvQRGMRPZ8faOdeNY3u
 +ztc595ogHPpGt1kXay0ufWiTK7IAZaWlfss9RffiRLT9xx+Cke/zEeSr Q==;
X-CSE-ConnectionGUID: 4DEYqYuHRpO+7zVbYZdXfg==
X-CSE-MsgGUID: O+8t87BaSTS1u6C/DLCX3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11420891"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="11420891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 20:28:44 -0700
X-CSE-ConnectionGUID: vrfdrCp4RJqy7Hynddpv+Q==
X-CSE-MsgGUID: +3P0zMklQd6BPH/0Td3Ndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="28834678"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 20:28:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/ads: Use flexible-array
Date: Tue,  7 May 2024 20:29:40 -0700
Message-ID: <171513895356.452682.14661077801254942223.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506141917.205714-1-lucas.demarchi@intel.com>
References: <20240506141917.205714-1-lucas.demarchi@intel.com>
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


On Mon, 06 May 2024 07:19:17 -0700, Lucas De Marchi wrote:
> Zero-length arrays are deprecated and flexible arrays should be used
> instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays
> 
> 

Applied to drm-xe-next. Thanks for the review.

[1/1] drm/xe/ads: Use flexible-array
      commit: ee7284230644e21fef0e38fc5bf8f907b6bb7f7c

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
