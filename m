Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC0C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 16:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650A10EED5;
	Mon,  6 May 2024 16:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxVq7TAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AC610EED5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715013233; x=1746549233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84a9STStFUbzeCndz3/NzWzipZcJa8VAhiiZ8D6KTos=;
 b=MxVq7TAy+7RWCinS39V716gDNBgqwxE/yO5R1y7UMYF52sNmxLaS14Ap
 hcX0qlX1qU63qy1gNBaQRsiJIxM18jVYXTeEVZb9Jme1BJ2L7wD7Zw3lv
 Pk3ynDK8V2qy/h0XhyjjwDRfkwFUtru48UbSmEP/Y8bYDvDlT+v5SX0JX
 Db2k6brHY1XTQQKeexpnaU08YgEBC1/CtcD9pZB7GtmLBZLAz3jMf6+AZ
 2+IW4TUp+v0WyD07tj0SNpydg6JhpejQUyyVYbxacMKCEVqxPNHoX5ASW
 syjz6kbTeQ89w21+9nj8OqERpuxe+Qtpnivq7btJfN2YRamr00TZqld8S A==;
X-CSE-ConnectionGUID: 6Q5/yUoPS9SXIEiHbkwRMA==
X-CSE-MsgGUID: BOeOo5A2SxW1CZRX6QO2FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13717430"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="13717430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:33:52 -0700
X-CSE-ConnectionGUID: IWNb3Di8SjKDP5Rge/RhRQ==
X-CSE-MsgGUID: 2+yzd1EaSzy1ySQZA8rX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28610535"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:33:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	matthew.d.roper@intel.com
Subject: Re: [PATCH v5 0/2] drm/xe/mocs: Add debugfs node to dump mocs
Date: Mon,  6 May 2024 09:34:44 -0700
Message-ID: <171501325073.219249.15264562284999475028.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
References: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
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


On Sat, 04 May 2024 01:09:00 +0530, Janga Rahul Kumar wrote:
> This is useful to check mocs configuration. Tests/Tools can use
> this debugfs entry to get mocs info.
> 
> v2: Address review comments. Change debugfs output style similar
> to pat debugfs. (Lucas De Marchi)
> 
> v3: rebase.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/2] drm/xe: Relocate regs_are_mcr function
      commit: 72c7163f27483c333a1f27916505459efa1a373a
[2/2] drm/xe/mocs: Add debugfs node to dump mocs
      commit: 9fbd0adbcbe81e207eb030d9ad59953905625dd1

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
