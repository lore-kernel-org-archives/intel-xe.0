Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9FAC43602
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D110E750;
	Wed,  1 Jul 2026 12:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rcpassos.me header.i=@rcpassos.me header.b="VJkqHKv6";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purelymail.com header.i=@purelymail.com header.b="SB2Bld69";
	dkim-atps=neutral
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6D10E2E3
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jun 2026 03:01:22 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=VJkqHKv6NTNxhw5O2PJ50MOqTaJn60FjLQMKMBpuYgcIN6GDk3IFXCDEc1QeOhkfnDQVT9g9Aezdg0bIyylnlYmDMdBd6M+c9iGxXDbILKYbuY72Mej8ovORFm3ZlAmsryE1KcSXuJ+/P6Q9bk5SEWwPuvMOwBn/TThdLuwYqeZdz9nYLkvKTV+tw4pKWyXbp/tRWEx8lhz7CSZxiBQy5/LbSWK+Qa2p9vKZt/sU7Gu3cZ3rgjUwVhYglel5RQEIQgzBz9Tw2Gn7vHIBVq7ldFWySqxKLT3B9xkboV551k+rTeXOTppZbUdOTnOW8FqQNhtrpkZpluHxdIX0hZIJew==;
 s=purelymail1; d=rcpassos.me; v=1;
 bh=/+xYg6jX1ozm5WfnL4XEE4N+y3jAKId7pgtNcgp8lNQ=;
 h=Received:From:To:Subject:Date; 
DKIM-Signature: a=rsa-sha256;
 b=SB2Bld69AqLyhvJ9wWnJN6kF6iYLq2hweum0LmU0tyitxMQ8D7fBPXHEsciOMIFaVMQ6rtPu7YWnIUNDQpre9098uNPLYXXfMUyfDjCb6wUPHX3F/MhcmS54HZqqHqI5NJS6qPvijpK7LrZitMjCe7iZvONCOlrnWMGkTzPruUp7qSvj8Qs68deW9mc7GEeYStaIWWkM9lkRZ5Gl5xgH1vDPYRPA3ihjw/LUqAuIVWqwNh7IGVU2OetcN5QPibSBPdvJIHbMAFTipgfIE48w/MB4vGUXUDqZNWIrglD1/x5fqVV4WrWnbjHuX5W/u+xz7CEVcvtokSunJL/CUlQc6g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=/+xYg6jX1ozm5WfnL4XEE4N+y3jAKId7pgtNcgp8lNQ=;
 h=Feedback-ID:Received:From:To:Subject:Date; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: intel-xe@lists.freedesktop.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -75715480; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 21 Jun 2026 03:01:12 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, skhan@linuxfoundation.org,
 Rafael Passos <rafael@rcpassos.me>
Subject: [PATCH v2] Documentation: xe_drm: fix chars used for subsection
Date: Sun, 21 Jun 2026 00:01:14 -0300
Message-ID: <20260621030114.963405-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

Fixes "ERROR: A level 2 section cannot be used here".
Equal signs are reserved for document titles.
This file docs gets imported by driver-uapi.rst,
and the page title is defined the.


Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---
Hi, I send the v1 for this patch only for the linux-doc list.
The v2 fixes this, and has improvements to the commit message.
Thanks,

Rafael

 include/uapi/drm/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..4dfb30e6c8a8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2537,21 +2537,21 @@ struct drm_xe_exec_queue_set_property {
  * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interfac=
e specification.
  *
  * Node Registration
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * -----------------
  *
  * The driver registers DRM RAS nodes for each error severity level.
  * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ER=
ROR_SEVERITY_NAMES maps
  * node-id to node-name.
  *
  * Error Classification
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------------
  *
  * Each node contains a list of error counters. Each error is identified b=
y a error-id and
  * an error-name. enum drm_xe_ras_error_component defines the error-id, wh=
ile
  * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
  *
  * User Interface
- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * --------------
  *
  * To retrieve error values of a error counter, userspace applications sho=
uld
  * follow the below steps:
--=20
2.53.0

