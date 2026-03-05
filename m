Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B8AF513E7
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 23:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84D10E112;
	Thu,  5 Mar 2026 23:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iklctIjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F110EC83
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772751636; x=1804287636;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uN+//1MCaqxKJm+bRMMGzs2J8jpcHLupFIAoAmxxhtQ=;
 b=iklctIjWjvf+aF/m3QdjVrs1vLzSC55cPB3ISH6pMTpkhWstt1p5mhK7
 OvP8xIPo0Jw6u39QJr/7OIDRk7WLc7fmhDWvA97GpO84EQmom0XovRBlD
 UpUNrG4IDcci/wOe3vzIUPdP/SQug13IbFXzx0v7EP1jOB5Cxc7H5/Kgq
 Uk6AywKwGTJSCVr7DugT+lkt1Qyd9QcC/hDWYQenkOX9VRaAMOCgWq+Yi
 gOWYi22PMXeVP/yGrJtA6WfDFn4Lmk+KdPM+xfbz7oooTjUB8zwEUEaT1
 TpkZDG7ZhWuGXzZYpi2oh2urGCPGZSlQzQgkM6CsWGAIyYM5EPnRg8pqo A==;
X-CSE-ConnectionGUID: cKc8T/7JRGS0/TWSofGzuQ==
X-CSE-MsgGUID: ZQBtBeP5TQihZ377cCt+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84940885"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84940885"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
X-CSE-ConnectionGUID: 9bRKw+tGQVG1t2f/ttE2HA==
X-CSE-MsgGUID: 8TL9fZZjScqUc0ZwR1zkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="216004879"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 05 Mar 2026 14:59:27 -0800
Subject: [PATCH 1/2] drm/xe: Add for_each_gt_with_type() iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gt-type-loops-v1-1-aa42e9fc3f06@intel.com>
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
In-Reply-To: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Farah Kassabri <farah.kassabri@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=uN+//1MCaqxKJm+bRMMGzs2J8jpcHLupFIAoAmxxhtQ=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpqgsT1r+K/q1yhyM/Q+hEZHUHhOmFHw0bXHUDL
 OK3GHQLmEKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaaoLEwAKCRBNeSQFyHKQ
 BIYiEACejZnSZ1MRGnM0KRbLnEhyG5Gn7jBvEUJeXUuNFg24VkgQ37MBR7rk4nis9rknHXXK4bW
 M1ktkAUAYwMa8IzMwwNqpI2KH3dZLXyHoubbNbZ24jr5mlmjY7MHj4O1g3ykVm35JCSkJ/npAE/
 //Q22QObvIkCsozayOsA8o20o0TYlt+zYJx/nmLtBrZnjTgYxjsw1e0m2ej+5xVsDRrjLhTMa+s
 Ske39WMpS+4BPGR7DxQ/m7RBW1N637K692gs2pQUbPd7sVW/WQLW2GGpXIwK8yrJ+kSVwDhpqkk
 tOTZrIdwMKi8TP+mzBRCy1VU2fOh5EjzeHnR5Yz67YI9k3H/MHnTVQmSvaIyvZKavwbjBlKHgpU
 25gZAIWGlQ2k6ZFPJgf4O5sagXA/wdxHPxK3+YyrgFCuA6OEyduFrAhiayaOTtMHPm26rEq92Qn
 F+4CRLYcZ0Qt/fwMvIgB/krdnrTUFkgqwnqw/7riGy6Uq4TD25DB1TC3QsRv3GgIE6p85SyBgwz
 WhCfj3Q9n6R2i2kXjRklHQFY7mrTU0UeUUiqNMdNeIzAoO3n7CF7ozTCHn/RD9n7sIYFm/ZTZgY
 fvlUlPgeWPznQZESYrsODW/cCWLhiuap/3946cRp6wvK0V0knj4cRZAXYy6Pgk3hXwbnOSad4qS
 DsyW6MBvjogz28A==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

There are a couple places in the driver today that have GT loops that
only need to operate on a specific type of GT.  E.g.,

        for_each_gt(...) {
                if (xe_gt_is_media_type(gt))
                        continue;
                ...
        }

Some upcoming development is expected to utilize this pattern a bit more
widely, so add a dedicated iterator that allows looping over specific GT
type(s).

Note that this iterator uses a mask for the "type" parameter rather than
a direct value match.  That's probably a bit overkill for now given that
there are only two possible types of GTs, but if additional types of GTs
ever show up in the future, this approach will fit more naturally and
allow cases where we might want to loop over a subset of the possible
types, or specifically mask off one single type.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 39464650533b5fd9aa7d9fc3dd432710303311b5..c4d26700266115f91330cff0a115a716e6899c50 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -131,6 +131,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
 		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 
+#define for_each_gt_with_type(gt__, xe__, id__, typemask__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if((typemask__) & BIT((gt__)->info.type))
+
 #define for_each_gt_on_tile(gt__, tile__, id__) \
 	for_each_gt((gt__), (tile__)->xe, (id__)) \
 		for_each_if((gt__)->tile == (tile__))

-- 
2.53.0

