Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA5FC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2B410E877;
	Thu, 25 Jul 2024 15:03:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425D10E877;
 Thu, 25 Jul 2024 15:02:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_spi=3A_add_driver_for_Int?=
 =?utf-8?q?el_discrete_graphics_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 15:02:58 -0000
Message-ID: <172191977873.382191.674403242885662003@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725135657.1061836-1-alexander.usyskin@intel.com>
In-Reply-To: <20240725135657.1061836-1-alexander.usyskin@intel.com>
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

Series: spi: add driver for Intel discrete graphics (rev2)
URL   : https://patchwork.freedesktop.org/series/136430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d15ef6659b2f10205e554fdf7885ed52543e8757
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Thu Jul 25 16:56:57 2024 +0300

    drm/xe/spi: add support for access mode
    
    Check SPI access mode from GSC FW status registers
    and overwrite access status read from SPI descriptor, if needed.
    
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d drm-intel
8112488b445c spi: add driver for intel graphics on-die spi device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
new file mode 100644

-:111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#111: FILE: drivers/spi/spi-intel-dg.c:40:
+static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
+			  const struct auxiliary_device_id *aux_dev_id)

total: 0 errors, 1 warnings, 1 checks, 206 lines checked
a0b7a5d31a92 spi: intel-dg: implement region enumeration
1eec70b3720c spi: intel-dg: implement spi access functions
-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/spi/spi-intel-dg.c:189:
+static ssize_t spi_rewrite_partial(struct intel_dg_spi *spi, loff_t to,
+			       loff_t offset, size_t len, const u32 *newdata)

total: 0 errors, 0 warnings, 1 checks, 224 lines checked
813e70e7916c spi: intel-dg: spi register with mtd
-:103: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#103: FILE: drivers/spi/spi-intel-dg.c:478:
+static int intel_dg_spi_init_mtd(struct intel_dg_spi *spi, struct device *device,
+			     unsigned int nparts, bool writeable_override)

total: 0 errors, 0 warnings, 1 checks, 156 lines checked
c65c098fac1f spi: intel-dg: implement mtd access handlers
b8e447202650 spi: intel-dg: align 64bit read and write
afa986c50574 spi: intel-dg: wake card on operations
226717355407 drm/i915/spi: add spi device for discrete graphics
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
e49728dbd966 drm/i915/spi: add intel_spi_region map
d6828367028f drm/i915/spi: add support for access mode
d62472669a20 drm/xe/spi: add on-die spi device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:137: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#137: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 183 lines checked
d15ef6659b2f drm/xe/spi: add support for access mode
-:23: CHECK:LINE_SPACING: Please don't use multiple blank lines
#23: FILE: drivers/gpu/drm/xe/regs/xe_gsc_regs.h:23:
+
+

total: 0 errors, 0 warnings, 1 checks, 78 lines checked


