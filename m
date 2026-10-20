Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10346606A323
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kcore.it header.i=@kcore.it header.a=rsa-sha256 header.s=spark header.b=K4a/NyMU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B8F10EA8B;
	Tue, 20 Oct 2026 12:53:17 +0000 (UTC)
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5710E9EE;
 Tue, 20 Oct 2026 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
 s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date;
 bh=bMeL+bbnqNrhN+aBbvERNEM1rNn+fhz5UTanwzBbzPI=; b=K4a/NyMUegSQzvOUz2flMpNTdV
 0laN2DmMWcVW0PNiz6jDv8H7RPqVv018R+JUDp/DLtr1bO1Nnr7tizY6svZlni1AipnSA+Rd89d8V
 2PNWZUySu2oU+d6DEh7Kn7guMvENpCvdA5c1ir8HCHHNOWRn+nFsDM4RLFegSHno9cbM=;
Received: from mnencia by spark.kcore.it with local (Exim 4.100.1)
 (envelope-from <mnencia@kcore.it>) id 1xJ46r-00000000Zjo-2Kwl;
 Tue, 20 Oct 2026 09:18:09 +0200
Date: Tue, 20 Oct 2026 09:18:09 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, xiaolu.xie@intel.com
Subject: Re: [PATCH v2] drm/i915/dp: clear and restore MSTM_CTRL around MST
 DPMS off/on
Message-ID: <atcVsd7nkeyk-xoo@spark.kcore.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020021714.62573-1-xiaolu.xie@intel.com>
References: <20261020021714.62573-1-xiaolu.xie@intel.com>
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:16 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Marco Nenciarini <mnencia@kcore.it>

Tested v2 on a Dell Pro Max 16 (Arrow Lake-P) with a Dell WD19DC dock
(Synaptics VMM5331 MST hub) and two monitors behind it, i915 driving
the dock over TBT-alt, drm.debug=0x10e. Kernel is Debian 7.2.9 with v2
applied on top.

On 7.2.9 drm_dp_dpcd_readb() returns 1 on success, so I used "ret >= 0"
instead of "ret == 0" in the new check in
intel_dp_mst_verify_dpcd_state(). Trees that use
drm_dp_dpcd_read_byte() are not affected.

Results for the three points you asked about, 120 s DPMS off with a
connector probe forced 30 s into the off period (writing "detect" to
the trunk connector status, which runs intel_dp_detect()):

1. DPMS off wrote MSTM_CTRL as 0x04 (0x00111 AUX <- 04), then D3.
2. The probe read 0x111 back as 04. There was no "MST mode got reset"
   message, no connector was unregistered and the topology was kept.
3. On wake, D0 was sent and MSTM_CTRL was written as 0x07 before
   POWER_UP_PHY. Link training passed at 810000 x4 on the sink and
   both LTTPRs, payloads were allocated and both monitors came back.

A 60 s run with the probe forced at 20 s gave the same result. A 120 s
run without a probe was also clean.

Without the patch, a DPMS off of more than about 6 s leaves both
monitors black on wake (drm/i915/kernel#16901). With v1, a runtime
resume probe during a 120 s DPMS off removed the whole MST topology,
as I reported earlier. With v2 it does not. The hub keeps
UPSTREAM_IS_SRC while MST_EN is 0, as you hoped.

The logs are available if you want them.
