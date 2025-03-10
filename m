Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8BAC282EC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 13:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD3B10E41D;
	Mon, 10 Mar 2025 13:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIFybSrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDC010E41D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741613921; x=1773149921;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SYIPI52HBsfB4tZMFhVTnTu/FPZJiQHAeFR6BAtpul0=;
 b=jIFybSrx3yp8XRLW7rnIQQ+oKhqU/Nb2RLi+fNCr8LbWwbJqBqGRdxCR
 SDTR7qT4evpD4rC0APtMLTyb0UwhZDPCj71oAGZlKIx22GI19W+TaWD+N
 gHUdNkS3y0+jWrcdb2cJJ80Gmax7yZ1Kxi55GH3vVMO53T0MkT1lFsj+M
 lEBteQ91OnqPZLyY/BVXWylEmnkxK0DBCp0/iAErYmWEXJoMuINmqYQ6w
 loL/ZNcpSc8OSWDpE9QJD0SiMkR50Td/gXdQXYuv/YPNNEw12NkPivI3v
 Kt4gjp8zsjXPPOfyMHYDZQ2VYcLwvgp+ZDJUk0VSZ4SdyNTHUN0zrIy+Y A==;
X-CSE-ConnectionGUID: AJSHbrivSNOF8opQWEqcxA==
X-CSE-MsgGUID: MDzVJgKESwG6mVnC4C2kTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42460884"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42460884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:38:41 -0700
X-CSE-ConnectionGUID: Rk08tegxR2iYmkzCACMrEQ==
X-CSE-MsgGUID: /ARJzxUrT+KC9dGXbI/fjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="119979120"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:38:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: Drop gen11 usage
Date: Mon, 10 Mar 2025 06:38:28 -0700
Message-ID: <174161387728.595854.13779915090123618307.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
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


On Thu, 06 Mar 2025 14:08:01 -0800, Lucas De Marchi wrote:
> A few places still had or got gen11 reintroduced. Drop them.
> 
> 

Thank you for the reviews. Patches applied to drm-xe-next.


[1/2] drm/xe: Remove pointless gen11 assertions
      commit: a30d96ea656c926f908391dcd67fb6b5e285b1a3
[2/2] drm/xe: Remove GEN11 prefixes from documentation
      commit: 89f8d10f981ed1236eeb9705510b877c82cff9a1

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
