Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6002CFC28C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 16:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FB110E2BF;
	Fri, 21 Nov 2025 16:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InKSInzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D449210E2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763743704; x=1795279704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g3jJgr6T7VuGB5qMaJCK45IgSNM6P5E9vb+RGtJ55Co=;
 b=InKSInzkOd5rfz7Co3lwgG3gM9YYFEU3YXD12xuM2TUfiGbjoUamIKih
 d5Rh4RbWQaR1urjlmHGPo76jb03MiI2XZx8isYSFl3D79HEAD3plBg7Bi
 oRBF81qJExgjaV5OBUQf8voH9voOM2wVIbVgV5USKtec6bSYRRF5vKMrN
 3jND1x2EOSrynfAhcQASLj+7aBOBg1PDdThM2fsVv3vCLcuCzxR+cAVoG
 Si4SBZqqkJ8Uxe3FbLTP4vrEMm+R9Wi3iqyxbdesLbR54a+OemYxGgi+n
 Ngo3sGPsQgORXOfd1fMOysJnusgW3PPuW9pz9WeUGg0Uk6avTTfb2DIK3 w==;
X-CSE-ConnectionGUID: MmiCtwKwS2yK9OFPJ0c0lQ==
X-CSE-MsgGUID: cDrgJha/TM6If98/J7N3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64845777"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="64845777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:48:23 -0800
X-CSE-ConnectionGUID: aXkjjjvDRxm2SZ5p3Pao7g==
X-CSE-MsgGUID: 1njcFIeRRYK/wAbU5H4RFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="222365445"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:48:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, stuart.summers@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Fix resource leak in
 xe_guc_ct_init_noalloc()
Date: Fri, 21 Nov 2025 08:47:42 -0800
Message-ID: <176374364979.1791710.8232811615312348704.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110184522.1581001-2-shuicheng.lin@intel.com>
References: <20251110184522.1581001-2-shuicheng.lin@intel.com>
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

On Mon, 10 Nov 2025 18:45:23 +0000, Shuicheng Lin wrote:
> xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
> before it tries to initialize ct->lock. If drmm_mutex_init() fails
> we currently bail out without releasing those resources because the
> guc_ct_fini() hasn’t been registered yet.
> 
> Since destroy_workqueue() in guc_ct_fini() may flush the workqueue, which
> in turn can take the ct lock, the initialization sequence is restructured
> to first initialize the ct->lock, then set up all CT state, and finally
> register guc_ct_fini().
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()
      commit: 2e4ad5b0667244f496783c58de0995b9562d3344

--
Lucas De Marchi

