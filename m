Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D296C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 21:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE6610E949;
	Fri,  2 May 2025 21:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE0XLKuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB2410E2B7;
 Fri,  2 May 2025 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746222469; x=1777758469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vQ9BxApmDha13KY1/ynceP7O9VBx4i6fUw+k2r9GDYs=;
 b=ZE0XLKuvVNhRPzRv89edXqcxbpVicA//OlV3w1gBdDNl5Qauc9v3inS4
 ZQKmvFpa3iS1FgIeAZS0AEzDPB2QcdW1s9u8zceOKGjRIZG9ilH4fCA1h
 ossYieM70dV76dVB2QxIjK50e5Su1CbP/aVXlyFkJnSJ4BxMpixYpKzjT
 a8xIEh4cyz63+2MLJ8xc/TqQ6RGainONF5I5+Nmn24ZzMRQqBaEEp1dE/
 dK/hw1iPYZ7XG18yhWsX3ErIBPaVfve6fDC90WtSJGrg6T9WJ17K1R6Vi
 MzBKvewpUhFV5pCeOmmqxNdFiFKQDLtx6cmzHJmbwI653jmV6/jH4Gmm4 w==;
X-CSE-ConnectionGUID: Cao2ZO3ETCS3aOEtVie5lw==
X-CSE-MsgGUID: Yunrq0hKRQWbqRlHS2nF+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58575163"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="58575163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 14:47:47 -0700
X-CSE-ConnectionGUID: GlhwgtNmSial9UyoqLUjRA==
X-CSE-MsgGUID: MQSygGbmTV+T7HN8A0puSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="139518884"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 14:47:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/gpusvm: remove unused pages pointer
Date: Fri,  2 May 2025 14:47:31 -0700
Message-ID: <174622241408.2989776.15662139811190999859.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
References: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
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


On Tue, 22 Apr 2025 12:59:43 +0300, Dafna Hirschfeld wrote:
> the pages pointer is not used, remove it
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/gpusvm: remove unused pages pointer
      commit: a912b0c8b5eabd9b70dc24cc97a167eb7287a20a

Best regards,
-- 
Lucas De Marchi

