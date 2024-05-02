Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89976C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 21:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2FB1126CE;
	Thu,  2 May 2024 21:45:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70B21126CE;
 Thu,  2 May 2024 21:45:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_drm/xe/guc=3A_Add_GuC_based_re?=
 =?utf-8?q?gister_capture_for_error_capture_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 21:45:12 -0000
Message-ID: <171468631287.1848696.14860256450735671979@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev7)
URL   : https://patchwork.freedesktop.org/series/128077/
State : success

== Summary ==

lib/modules/6.9.0-rc6-xe/kernel/sound/pci/hda/snd-hda-intel.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/
lib/modules/6.9.0-rc6-xe/kernel/sound/core/seq/
lib/modules/6.9.0-rc6-xe/kernel/sound/core/seq/snd-seq.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd-seq-device.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd-hwdep.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd-pcm.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd-compress.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/core/snd-timer.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soundcore.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/atom/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/atom/sst/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/atom/sst/snd-intel-sst-acpi.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/atom/sst/snd-intel-sst-core.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/common/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/intel/common/snd-soc-acpi-intel-match.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/amd/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/amd/snd-acp-config.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-tgl.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda-mlink.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-lnl.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda-common.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-mtl.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/amd/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/amd/snd-sof-amd-renoir.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/amd/snd-sof-amd-acp.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/snd-sof-utils.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/snd-sof-pci.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/snd-sof.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/snd-sof-probes.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/xtensa/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/sof/xtensa/snd-sof-xtensa-dsp.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/snd-soc-core.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/snd-soc-acpi.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/codecs/
lib/modules/6.9.0-rc6-xe/kernel/sound/soc/codecs/snd-soc-hdac-hda.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/snd-intel-sdw-acpi.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/ext/
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/ext/snd-hda-ext-core.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/snd-intel-dspcfg.ko
lib/modules/6.9.0-rc6-xe/kernel/sound/hda/snd-hda-core.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kernel/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kernel/msr.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kernel/cpuid.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/sha512-ssse3.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/crct10dif-pclmul.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/ghash-clmulni-intel.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/sha1-ssse3.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/crc32-pclmul.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/sha256-ssse3.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/aesni-intel.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/crypto/polyval-clmulni.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/events/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/events/intel/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/events/intel/intel-cstate.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/events/rapl.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kvm/
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kvm/kvm.ko
lib/modules/6.9.0-rc6-xe/kernel/arch/x86/kvm/kvm-intel.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/
lib/modules/6.9.0-rc6-xe/kernel/crypto/crypto_simd.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/cmac.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/ccm.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/cryptd.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/polyval-generic.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/async_xor.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/async_tx.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/async_memcpy.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/async_pq.ko
lib/modules/6.9.0-rc6-xe/kernel/crypto/async_tx/async_raid6_recov.ko
lib/modules/6.9.0-rc6-xe/build
lib/modules/6.9.0-rc6-xe/modules.alias.bin
lib/modules/6.9.0-rc6-xe/modules.builtin
lib/modules/6.9.0-rc6-xe/modules.softdep
lib/modules/6.9.0-rc6-xe/modules.alias
lib/modules/6.9.0-rc6-xe/modules.order
lib/modules/6.9.0-rc6-xe/modules.symbols
lib/modules/6.9.0-rc6-xe/modules.dep.bin
+ mv kernel-nodebug.tar.gz ..
+ cd ..
+ rm -rf archive
++ date +%s
[0Ksection_end:1714686296:package_x86_64_nodebug
[0K
+ echo -e '\e[0Ksection_end:1714686296:package_x86_64_nodebug\r\e[0K'
+ sync
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


