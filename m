Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD52ED6552F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 17:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90A10E96B;
	Tue, 26 Nov 2024 17:30:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59710E96B;
 Tue, 26 Nov 2024 17:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Make_OA_buffer_size_?=
 =?utf-8?q?configurable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 17:30:35 -0000
Message-ID: <173264223551.3414272.11033093133666433554@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

Series: Make OA buffer size configurable (rev2)
URL   : https://patchwork.freedesktop.org/series/141795/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 739a2506c44a drm-tip: 2024y-11m-26d-13h-49m-46s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/oa: Increase default OA buffer size to 128 M
Applying: drm/xe/oa: Make OA buffer size configurable
Applying: drm/xe/oa: Remove all the instances of hardcoded OA buffer size


