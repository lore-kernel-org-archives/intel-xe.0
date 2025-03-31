Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D199AC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D0010E054;
	Mon, 31 Mar 2025 14:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmIH40MO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EC910E401
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743430946; x=1774966946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+dxMNAmGlFhKI+S3DRxhlFiWRNo0FXr6eelvUM59zs=;
 b=CmIH40MOwM/x0/VAFHU/wDzsmA59jHpfkeGTvSEKipUpIhGh1nTK7rC+
 Yo6X9HmCf8dmFO4+3Vagj6S6D5R7oaGJPsMfoH570PNe3Wp61rHffelnp
 PBgJJL0E0W8nPsPhFV0LNElyJ8g39icaceKPMcYNvKyqW7WEcFpaOcNR+
 KCFIBAWvvUesGp72G6IShlvghLuUluQ3UH4s35Ii9f9QYLrqjvq/trpdH
 huCrZyNuZ+H1kk6Qkc4cci2X5Z6z8zvZJG9Axe4xf3aIhLfAFyQ/ed+JK
 oDYXGrXhDlWaDAH3woZUVEqh5quxx5GK2kmVQrfgG7ZQvlFdAvnc9Ttcu Q==;
X-CSE-ConnectionGUID: AxZKyZVuTBuMjgbruAATkA==
X-CSE-MsgGUID: IICbuORYT1SlREZTUQRYCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48590249"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48590249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:22:25 -0700
X-CSE-ConnectionGUID: cfkOWSIQRn+NBp2GLPgfRQ==
X-CSE-MsgGUID: S/upEht0RO+K7aEW5JmvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126609082"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:22:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: jagmeet.randhawa@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 john.c.harrison@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Don't print error about hwconfig when using
 execlists
Date: Mon, 31 Mar 2025 07:22:11 -0700
Message-ID: <174343084156.2072291.17379551811561190764.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328154236.9216-1-stuart.summers@intel.com>
References: <20250328154236.9216-1-stuart.summers@intel.com>
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


On Fri, 28 Mar 2025 15:42:36 +0000, Stuart Summers wrote:
> This error message is only applicable for platforms using
> GuC submission - to warn the user if the GuC they are using
> or the platform they are running doesn't have this information
> to provide to userspace about the platform. When forcing
> execlist submission, which is something only used for debug,
> the user is running at their own risk and should understand
> the limitations of running without GuC.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Don't print error about hwconfig when using execlists
      commit: c4eac403519512aef12250cb93ebfdd0966d76f9

Best regards,
-- 
Lucas De Marchi

