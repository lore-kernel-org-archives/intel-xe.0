Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD513CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C0810E746;
	Tue,  9 Sep 2025 13:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mi0KRVkR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7810E748
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425306; x=1788961306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qhKBynk49iadJesNsnlBRm8ZbjeKK0GeOodUViXdM7I=;
 b=mi0KRVkR9PdjpP/gN2sLePK6aFrIo+VnWlNvEmQec1ZTSGYryn0q+EBm
 zUvX/ygYNIZkWZlTsvT7oZpGboWRFN6rcH0EFWRQ3Wz1wbNIa38VykkKU
 u16I6ZTFbUNCZ3s6Za7fHRY53xhSitgeAuwrgW0VWdaCihGqEx9PB4gOh
 GNkDUmkgY9dUfFCx99J7tMk86qbBej6wO4pfATxC0HOgUkuvfLI5pN0MS
 DL8UuMza+FF5o9G3EMxHDxN0j5TeQqfQRIU7yPHDyYMcS5ovhmEwhIgM5
 hK36adHuI3OxA3X3BRpOSftitYmt7UfL6P26cxapZVZslzqA5/SFlIWEq w==;
X-CSE-ConnectionGUID: 4zYvQIzWQpidT+qCwf4ZGw==
X-CSE-MsgGUID: 0ga7DSqaRRayUcfN4vbXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71083578"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71083578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:41:45 -0700
X-CSE-ConnectionGUID: Pw+bedv6S2S6XwvnMaFlRw==
X-CSE-MsgGUID: yBN0gZeVTXWeEjAazOqFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177384384"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:41:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: rodrigo.vivi@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Enable bus mastering
Date: Tue,  9 Sep 2025 06:41:29 -0700
Message-ID: <175742527256.1519302.6465778863281074825.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908055320.2549722-1-raag.jadav@intel.com>
References: <20250908055320.2549722-1-raag.jadav@intel.com>
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


On Mon, 08 Sep 2025 11:23:20 +0530, Raag Jadav wrote:
> Enable bus mastering for I2C controller to support device initiated
> in-band transactions.
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe/i2c: Enable bus mastering
      commit: fce99326c9cf5a0e57c4283a61c6b622ef5b0de8

Best regards,
-- 
Lucas De Marchi

