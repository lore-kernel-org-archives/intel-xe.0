Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D413CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 20:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A07A10E48D;
	Mon,  3 Nov 2025 20:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWFcaNhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1210E48D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 20:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762203497; x=1793739497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sAz8szmnmpIrzV8zOpF0BHmYp7dpqwl//36YHdc1unY=;
 b=kWFcaNhMbjwjmIgNvViNKM/OV+jS551OPgnZ0M5pYMxHDFwRb9l1Fppm
 5BBJZfhOZpEuEEm+hU3seatJL9si1C2vKIbsksMndzAjjF2+MBIDf9c0D
 d/qeZrklqtVnj/ccrGKYf5AVGsumxFsywZDz59BIub1jpZIWU+oR0LbtX
 zTPbAt771y8vOIKDw7EmnzJIj22lc/qXhap6mzJE7OnYhi8Xs7GA1efan
 3kdi+D0hWnEPZ/+shmNyNuFWm3Sd0hsuSFk8LYJb41EuBsMmUvEmH22ul
 0UStDWN9wEnXlWKP0EnkNCwGFjoiqv0HpWkwMVAIhZBOJ2QziDAcAb/25 w==;
X-CSE-ConnectionGUID: XAq1PJ81ScCcGBQLNIAx2g==
X-CSE-MsgGUID: K24J5amFQnG7qzNB0NeQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64327679"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="64327679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 12:58:17 -0800
X-CSE-ConnectionGUID: CIiOpvLoT8av7aUQL9mM7g==
X-CSE-MsgGUID: 2gP4wZGbR9Suq4xPnpNh1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="191290770"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 12:58:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 0/2] Fix user-after-free during driver unbind
Date: Mon,  3 Nov 2025 12:57:39 -0800
Message-ID: <176220340803.654553.1362337913715051690.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
References: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
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

On Mon, 03 Nov 2025 18:01:45 +0530, Balasubramani Vivekanandan wrote:
> There are a couple of worker threads in the driver which could be
> running while unbinding the driver. Ensure those threads are stopped
> before unbinding the driver to avoid any user-after-free from those
> workers.
> 
> Balasubramani Vivekanandan (2):
>   drm/xe/gt: Synchronize GT reset with device unbind
>   drm/xe/guc: Synchronize Dead CT worker with unbind
> 
> [...]

Merged to drm-xe-next, thanks!

[1/2] drm/xe/gt: Synchronize GT reset with device unbind
      commit: 09c452d1171fcb86c57e4996bdebc311e1217f8a
[2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
      commit: 492671339114e376aaa38626d637a2751cdef263

--
Lucas De Marchi

