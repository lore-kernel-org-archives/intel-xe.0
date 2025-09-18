Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F191CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 21:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F385810E90A;
	Thu, 18 Sep 2025 21:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSsaNbzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168210E90A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758232038; x=1789768038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ijPCyoG3fO4DQ36VPTcXLlhFeQ82T9X78g11opUOYec=;
 b=gSsaNbzHRYrhCvKgV5nISd02qzpdde6c/GguIwmhOfJUUbkkO+mzst2l
 R/UXsApToU2VWsrDwIhmeXGnJefAKZ95G7S+csOggY1Jn9kuKYm7q7640
 u86/YKyPYveWNYCkUEVWGc27QnUMD5xHVysIzjL3z+tCut5hMKXxbMePU
 4kQ+ZzqvzVKbEjNKzofLUMY3eUe+qHPPZCUkd6QwJ510T3kvsta1s4c3u
 uaGEX/qagnaccZqS31T9zCn0UCVAbjuDKNKnHSUDQtDVfpnSDNGncfUDM
 kfd/s2bHHUA6iP2PxhsNMfI2+MfaP9XsNIihXJbmsGkDK67KRiH4q3MDj g==;
X-CSE-ConnectionGUID: mBM6pDSEQt+Q7KuYnNca/w==
X-CSE-MsgGUID: WJ34PfdmQE6NTrduN07vIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78180095"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="78180095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:47:17 -0700
X-CSE-ConnectionGUID: zq1KEJccRny+NCJ0y2E1Wg==
X-CSE-MsgGUID: bSS69OIcS5GlmCW/c4cOxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="176472003"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:47:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 0/7] drm/xe: Add user commands to WA BB via configfs
Date: Thu, 18 Sep 2025 14:47:01 -0700
Message-ID: <175823197659.3058685.3341531372491878836.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
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

On Tue, 16 Sep 2025 14:15:37 -0700, Lucas De Marchi wrote:
> Integrate WA BB (aka post context restore bb) with configfs to allow
> validation to experiment with the GPU, executing commands on every
> context switch.
> 
> Setting some registers to experiment:
> 
> 	# echo 0 > /sys/bus/pci/drivers_autoprobe
> 	# modprobe xe
> 	# mkdir  /sys/kernel/config/xe/0000:03:00.0
> 	# cat > /sys/kernel/config/xe/0000\:03\:00.0/ctx_restore_post_bb  <<EOF
> 	bcs cmd 11000001 4F100 cafebabe
> 	vcs cmd 11000001 4F104 0FF1CE
> 	rcs cmd 11000001 4F108 BAADF00D
> 	EOF
> 	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> 	# intel_reg read mmio:4F100 mmio:4f104 mmio:4f108
>                                     (0x0004f100): 0xcafebabe
>                                     (0x0004f104): 0x000ff1ce
>                                     (0x0004f108): 0xbaadf00d
> 
> [...]

Thanks for the reviews. Merged to drm-xe-next.

[1/7] drm/xe/configfs: Extract function to parse engine
      commit: 7166cc3a6aae9aaa529f52e1468006e67e3e6846
[2/7] drm/xe/configfs: Allow to select by class only
      commit: e2a9854d806e1cb95861a0f3c7125caaefd7ef03
[3/7] drm/xe/lrc: Allow to add user commands on context switch
      commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56
[4/7] drm/xe/configfs: Add post context restore bb
      commit: 39ac06f70062b6867836ea631e196cf2f60c1513
[5/7] drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
      commit: c9dfd66cb91ef32f76e51f75e315c07907df2b85
[6/7] drm/xe/lrc: Allow to add user commands mid context switch
      commit: 7a4756b2fd0431f109b07b904a7442f00838abf9
[7/7] drm/xe/configfs: Add mid context restore bb
      commit: b30d5de3d40c3fa642079bac0d91f17091c5f877

--
Lucas De Marchi

