Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2080ACAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 15:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EBF10E36B;
	Tue, 16 Sep 2025 15:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCGD5uMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420A510E36B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758035242; x=1789571242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtadM+jS1Nw0x0XFLMnCUUh6hBRBMGHelWExbdSwFXo=;
 b=WCGD5uMi2QqeSJzFzfdTX+UGBYkhihBr2OL+XTTS93JoxPIdV+MIExMc
 Rbd/RzKMr6i1AcbT3e8TLs061Onl6bhL2z2RfXVQQmDH6MM/0Ce/mZ8dJ
 wQmubH3THaQygXNKyvSSTwwLMGoPZ/lwkowJzzsds4K8LoXDkdQ0VRMt0
 8H27j1GIH8Tn2yfXPxFh05+LscfzKHR9TACikwAmLIP9ulsSqAhtzh6Lj
 fdZ52JPiJSxseNZIgSMP+B9MXIIrYJFnKNG/Wkb8bp9AujYby1k/JmNzD
 1+lOF6VRyWfrv9Gc+CQ2DeXLhPVv0p4djEKNeqw6GgSEharSJWQKuZHfP Q==;
X-CSE-ConnectionGUID: q05Iv7O/S56YchU/W3bY9Q==
X-CSE-MsgGUID: 1TNaebHGSDaBh8IlIKMZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77925347"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="77925347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:07:22 -0700
X-CSE-ConnectionGUID: IH66/yIsQxS6kFfFS9LzJA==
X-CSE-MsgGUID: 0uXrpTj1Ste9LvNJMwUBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="178973987"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:07:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Zongyao Bai <zongyao.bai@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: (subset) [PATCH v3 1/2] drm/xe/xe_device_sysfs: Add cleanup
 action in xe_device_sysfs_init
Date: Tue, 16 Sep 2025 08:06:59 -0700
Message-ID: <175803504775.2129413.15850155059742605395.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915214716.1327379-2-zongyao.bai@intel.com>
References: <20250915214716.1327379-2-zongyao.bai@intel.com>
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

On Tue, 16 Sep 2025 05:47:15 +0800, Zongyao Bai wrote:
> xe_device_sysfs_init(): on partial failure, any sysfs files created
> before the failure will be cleaned up via xe_device_sysfs_fini,
> ensuring no leaked sysfs entries.
> 
> v2: Using "goto cleanup" to reduced code duplication.(Stuart)
> 
> v3: Split patch & remove unnecessary notes (Lucas)
>     Adjust the comments accordingly.
> 
> [...]

I reworded the commit message as pointed by Michal, removed a spurious newline
at the end of the function and merged to drm-xe-next, thanks!

[1/2] drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init
      commit: 1a869168d91f1a1a2b0db22cea0295c67908e5d8

--
Lucas De Marchi

