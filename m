Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0373CC02199
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 19:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BB410E3BA;
	Wed,  5 Feb 2025 19:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+ofxzlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC9D10E16E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738783016; x=1770319016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8kXx/aZZXsPOv2dGSni1+qImYA3Q9YoerVF450xuVTA=;
 b=A+ofxzlLMieDHvs2CrmX1wFMmCGfZfuCGNuE4hFrR9h28xnKZMzQYFxA
 kZ4xW1YuLOEvts2CqT8uS2hbHf3ZcQZ34+JIfDegxbfkiY5JHAouLns1+
 BPwfpTvdlwFBDTv8hIvOl5bFhx23noZGqE87BL5nPkVFQ9BWRdMsSUu+U
 rMxiwoBG3gTAHFbMVnTxpyqtdUf7eocYHl4eSvPIldDfWgxVkorfJ+zQu
 SrJDtBaCWFKa/bZu41yEyXDpQEppOsipcGuF0L/v9Y0DN5YZ6nsk3fEJo
 c5OlAzdiToCSe08Z4uSKBRkto/4NGWzvregQEgWlRmX0311Wzlefi8G0B g==;
X-CSE-ConnectionGUID: E1fvsU87QgmOnQY9/GlmJA==
X-CSE-MsgGUID: DwceBURkRH+zxZGJbxrkOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61837884"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="61837884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:16:53 -0800
X-CSE-ConnectionGUID: 6ti8wArOQaSPoRmqnCpePw==
X-CSE-MsgGUID: wZ4jqjqfSXS3Ld5UtxoNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111519913"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:16:50 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/2] VF: Avoid reading inaccessible RING_TIMESTAMP
Date: Wed,  5 Feb 2025 20:16:42 +0100
Message-Id: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RING_TIMESTAMP registers are not available for VF (Virtual Function)
drivers. Return -EOPNOTSUPP when the DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
ioctl is invoked on a VF device.

RING_TIMESTAMP registers populate drm-total-cycles-* fdinfo keys.  
Without drm-total-cycles-*, other keys provide little value. Skip all  
optional "run_ticks" keys if unable to read the timestamp.

v2:
  - Drop "drm/xe/vf: Return error code from xe_hw_engine_read_timestamp()"
    patch. (Michal)
  - Skip "run_ticks" keys if unable to read timestamp. (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Marcin Bernatowicz (2):
  drm/xe/vf: Return EOPNOTSUPP for DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if
    VF
  drm/xe/client: Skip show_run_ticks if unable to read timestamp

 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_query.c      | 3 +++
 2 files changed, 11 insertions(+)

-- 
2.31.1

