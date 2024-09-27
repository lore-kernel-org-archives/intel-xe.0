Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A3DCDD1CD
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D7C10E21B;
	Fri, 27 Sep 2024 16:26:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07F510E215;
 Fri, 27 Sep 2024 16:26:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm=3A_Introduce_DRM_client_li?=
 =?utf-8?q?brary?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 16:26:40 -0000
Message-ID: <172745440097.1111818.16684616399924807243@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927144252.31813-1-tzimmermann@suse.de>
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
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

Series: drm: Introduce DRM client library
URL   : https://patchwork.freedesktop.org/series/139220/
State : failure

== Summary ==

INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/soundwire/soundwire-amd.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/soundwire/soundwire-cadence.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/soundwire/soundwire-intel.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/accel/hid-sensor-accel-3d.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/buffer/industrialio-triggered-buffer.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/buffer/kfifo_buf.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/common/hid-sensors/hid-sensor-iio-common.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/common/hid-sensors/hid-sensor-trigger.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/gyro/hid-sensor-gyro-3d.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/light/hid-sensor-als.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/light/hid-sensor-prox.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/magnetometer/hid-sensor-magn-3d.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/orientation/hid-sensor-incl-3d.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/orientation/hid-sensor-rotation.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/position/hid-sensor-custom-intel-hinge.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/iio/industrialio.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/drivers/thunderbolt/thunderbolt.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soundcore.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd-hwdep.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd-timer.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd-pcm.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd-seq-device.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/seq/snd-seq.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/core/snd-compress.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/pci/hda/snd-hda-codec.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/pci/hda/snd-hda-intel.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/snd-soc-acpi.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/snd-soc-core.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/codecs/snd-soc-hdac-hda.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/amd/snd-acp-config.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/intel/common/snd-soc-acpi-intel-match.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/intel/atom/sst/snd-intel-sst-core.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/intel/atom/sst/snd-intel-sst-acpi.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda-common.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda-generic.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda-mlink.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-intel-hda.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-cnl.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-tgl.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-mtl.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/intel/snd-sof-pci-intel-lnl.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/snd-sof.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/snd-sof-utils.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/snd-sof-pci.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/snd-sof-probes.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/amd/snd-sof-amd-acp.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/amd/snd-sof-amd-renoir.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/soc/sof/xtensa/snd-sof-xtensa-dsp.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/hda/snd-hda-core.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/hda/ext/snd-hda-ext-core.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/hda/snd-intel-dspcfg.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/sound/hda/snd-intel-sdw-acpi.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/802/p8022.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/802/psnap.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/802/stp.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/sched/sch_fq_codel.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nfnetlink.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nf_conntrack.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nf_conntrack_netlink.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nf_nat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nf_tables.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nft_compat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nft_nat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/nft_chain_nat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/x_tables.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/xt_tcpudp.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/xt_nat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/xt_MASQUERADE.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/xt_addrtype.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/netfilter/xt_conntrack.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/ipv4/netfilter/ip_tables.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/ipv4/netfilter/iptable_filter.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/ipv4/netfilter/iptable_nat.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/xfrm/xfrm_algo.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/xfrm/xfrm_user.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/llc/llc.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/bridge/bridge.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/bridge/br_netfilter.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/sunrpc/sunrpc.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/9p/9pnet.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/9p/9pnet_fd.ko
  INSTALL ../archive/lib/modules/6.11.0-xe/kernel/net/9p/9pnet_virtio.ko
  DEPMOD  ../archive/lib/modules/6.11.0-xe
depmod: ERROR: Cycle detected: drm_kms_helper -> drm_client_lib -> drm_kms_helper
depmod: ERROR: Found 2 modules in dependency cycles!
make[3]: *** [../scripts/Makefile.modinst:128: depmod] Error 1
make[2]: *** [/kernel/Makefile:1834: modules_install] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-default'
make: *** [Makefile:224: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


