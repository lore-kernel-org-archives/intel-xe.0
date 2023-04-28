Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A912C77B60
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 05:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AD10E058;
	Fri, 28 Apr 2023 05:44:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0610E058
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 05:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660668; x=1714196668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcasuYNxCixSQksqcS2Drj+nT8IHRYIxkV/kSZowRVA=;
 b=DpZuHeyyHps5NdLcjgYBT4iCIr1ELcY9c44uYtkAeYeZvfjBiD3Eee8p
 qsmrV6sjePrVF8lcaOlsM+RNnt9516rFeVIp6xabUNPnvf0t0bPvVcNBy
 VXBFJRJ8bMT8ymt55Q0LRN8xlDtAD0Zmc472uBin5r+B8Y07daSPnhR8m
 Ah/mCie2ZP5FY+0shz+25rNNNPOM2hTuLWEzMK9xBHw80i7NLI/0AYc0k
 hCk9QRxhp1pcJ80tofFC5SaDnEQeo9BwFlDGklTV3rlQjnQtMyGWp4A5M
 toh8DCWyjIMBS30xLueaAHqo2GUvDnkZ2OhomPYjgCMYRYP4i3HOBNTem g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413040174"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="413040174"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806250888"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="806250888"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:44:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 27 Apr 2023 22:44:14 -0700
Message-Id: <168266060414.1441675.14447597516235585415.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427184408.1340988-1-lucas.demarchi@intel.com>
References: <20230427184408.1340988-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix media detection for pre-GMD_ID
 platforms
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On Thu, 27 Apr 2023 11:44:09 -0700, Lucas De Marchi wrote:
> Reading the GMD_ID register on platforms before that register
> became available is not reliable. The assumption was that since the
> register was not allocated, it would return 0. But on PVC for example it
> returns garbage (or a very specific number), triggering the following
> error:
> 
> 	xe 0000:8c:00.0: [drm] *ERROR* Hardware reports unknown media version 1025.55
> 
> [...]

Applied, thanks for the review.

[1/1] drm/xe: Fix media detection for pre-GMD_ID platforms
      commit: f7b51a4d56db8be7764e7df2362f3de007881e72

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
