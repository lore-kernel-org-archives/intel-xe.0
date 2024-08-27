Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB361C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 07:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBC810E17A;
	Tue, 27 Aug 2024 07:08:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4DC10E17A;
 Tue, 27 Aug 2024 07:08:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915/display=3A_BMG_suppor?=
 =?utf-8?q?ts_UHBR13=2E5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 07:08:39 -0000
Message-ID: <172474251963.786695.1260315042187997204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827064047.132278-1-arun.r.murthy@intel.com>
In-Reply-To: <20240827064047.132278-1-arun.r.murthy@intel.com>
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

Series: drm/i915/display: BMG supports UHBR13.5
URL   : https://patchwork.freedesktop.org/series/137827/
State : failure

== Summary ==

INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/drm_suballoc_helper.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/drm_ttm_helper.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/drm_kms_helper.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/ttm/ttm.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/amd/amdxcp/amdxcp.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/i915/i915.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/xe/xe.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/vgem/vgem.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/nouveau/nouveau.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/gpu/drm/ast/ast.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/block/nbd.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/enclosure.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/mei.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/mei-me.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/mei-gsc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/hdcp/mei_hdcp.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/pxp/mei_pxp.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/mfd/lpc_ich.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/dax/hmem/dax_hmem.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/dax/device_dax.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/dma-buf/dmabuf_selftests.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/cxl/core/cxl_core.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/cxl/cxl_acpi.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/cxl/cxl_port.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/macintosh/mac_hid.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/device_handler/scsi_dh_rdac.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/device_handler/scsi_dh_emc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/device_handler/scsi_dh_alua.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/raid_class.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/scsi_transport_sas.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/scsi/ses.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/ata/acard-ahci.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/ata/ahci_dwc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/spi/spi-intel.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/spi/spi-intel-pci.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/spi/spi-pxa2xx-core.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/spi/spi-pxa2xx-platform.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/spi/spi-pxa2xx-pci.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/phylink.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/aquantia/aquantia.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/ax88796b.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/bcm7xxx.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/bcm87xx.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/bcm-phy-lib.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/bcm-phy-ptp.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/broadcom.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/lxt.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/realtek.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/phy/smsc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/broadcom/tg3.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/libeth/libeth.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/libie/libie.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/e100.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/e1000/e1000.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/e1000e/e1000e.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/igb/igb.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/igc/igc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/igbvf/igbvf.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/ixgbe/ixgbe.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/ixgbevf/ixgbevf.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/intel/i40e/i40e.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/realtek/8139cp.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/realtek/8139too.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/ethernet/realtek/r8169.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/mii.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/mdio.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/veth.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/pegasus.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/rtl8150.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/r8152.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/asix.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/ax88179_178a.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/cdc_ether.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/cdc_eem.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/smsc75xx.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/smsc95xx.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/rndis_host.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/mcs7830.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/usbnet.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/cdc_ncm.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/net/usb/r8153_ecm.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/usb/class/usbtmc.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/usb/typec/typec.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/usb/typec/ucsi/typec_ucsi.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/usb/typec/ucsi/ucsi_acpi.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/input/sparse-keymap.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/input/input-leds.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/input/joydev.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/i2c/algos/i2c-algo-bit.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/i2c/busses/i2c-i801.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/i2c/i2c-smbus.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/i2c/i2c-mux.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/media/i2c/ov13858.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/media/i2c/ov13b10.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/media/tuners/mc44s803.ko
  INSTALL ../archive/lib/modules/6.11.0-rc5-xe/kernel/drivers/media/tuners/mt20xx.ko


