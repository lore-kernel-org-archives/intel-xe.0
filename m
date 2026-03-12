Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8947FED2F2
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 09:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698BE10E9D4;
	Thu, 12 Mar 2026 09:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sm8cjlgb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06BA10E9D4;
 Thu, 12 Mar 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ssD/aexp1TPZVxZYeIQ8/tAxE6E0FX14OtVZZgzqR0M=; b=Sm8cjlgbjqKLfJO+NYIMCk1EVQ
 CzobYawbs9hMQX7wnRNOkeeLEIwaWK8MWsnzA0G8+ftC9ruq5eY6yjTAIN6lLl2eDm73evMpD1Y6Q
 IITOl67vMwGNzpFR8lMOAlZRBW6GQW1MmGU5I9NfXTT2oPgOqvSJoVBLrl2gdf5VlHlLmO0bdiggj
 guFZ1i5SmFhM26ZjW8aulYGYnqfdkOOsKSQkcLc1LR7aDiHYC2GVfrTPEdP1Ywy2o92fagKWSDxlp
 ZElXGclnUAo2qyNQInLmxVnlRalgf1kwXuQfYJzxFUE1XXekbwJuIb/0428eg6b1JpG26eyNcKoz+
 t8Y8qc5A==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w0bvx-00EPaT-3j; Thu, 12 Mar 2026 10:02:21 +0100
Date: Thu, 12 Mar 2026 09:02:20 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <abKBHNFsBQCv2h3e@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hi Dave, Sima,

Here is the first drm-intel-gt-next pull request for 7.1.

Only notable change is a fix for sg table overflow with sg segments over
4GB due large folio allocations, but that one is already in
drm-intel-fixes as well. The rest are just minor cleanups.

drm-intel-gt-next-2026-03-12:
Driver Changes:

Fixes/improvements/new stuff:

- Fix potential overflow of shmem scatterlist length (Janusz Krzysztofik)

Miscellaneous:

- Keep mock file open during unfaultable migrate with fill [selftests] (Krzysztof Karas)
- Test for imported buffers with drm_gem_is_imported() (Thomas Zimmermann)
- Fix corrupted copyright symbols in selftest files [guc] (Konstantin Khorenko)
The following changes since commit 9512d9fc2a7a4fee14854fbb3af89a8bf599f361:

  drm/i915/guc: Recommend GuC v70.53.0 for DG2, MTL (2026-01-12 14:21:10 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2026-03-12

for you to fetch changes up to 06249b4e691a75694c014a61708c007fb5755f60:

  drm/i915: Fix potential overflow of shmem scatterlist length (2026-03-06 12:52:13 +0100)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Fix potential overflow of shmem scatterlist length (Janusz Krzysztofik)

Miscellaneous:

- Keep mock file open during unfaultable migrate with fill [selftests] (Krzysztof Karas)
- Test for imported buffers with drm_gem_is_imported() (Thomas Zimmermann)
- Fix corrupted copyright symbols in selftest files [guc] (Konstantin Khorenko)

----------------------------------------------------------------
Janusz Krzysztofik (1):
      drm/i915: Fix potential overflow of shmem scatterlist length

Konstantin Khorenko (1):
      drm/i915/guc: Fix corrupted copyright symbols in selftest files

Krzysztof Karas (1):
      drm/i915/selftests: Keep mock file open during unfaultable migrate with fill

Thomas Zimmermann (1):
      drm/i915: Test for imported buffers with drm_gem_is_imported()

 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  6 +--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 12 ++++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 27 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  2 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |  2 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c          | 43 ++++++++++++++--------
 drivers/gpu/drm/i915/selftests/igt_mmap.h          |  8 ++++
 7 files changed, 70 insertions(+), 30 deletions(-)
