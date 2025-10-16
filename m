Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8145DCCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 06:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406A910E2D3;
	Thu, 16 Oct 2025 06:01:06 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C355B10E2D0;
 Thu, 16 Oct 2025 06:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mei=3A_intel=5Flb=5Fmei?=
 =?utf-8?q?=5Finterface=2Eh=3A_mark_struct_member_with_kernel-doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 06:01:04 -0000
Message-ID: <176059446478.20573.4052788305145979960@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016035942.1148176-1-rdunlap@infradead.org>
In-Reply-To: <20251016035942.1148176-1-rdunlap@infradead.org>
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

Series: mei: intel_lb_mei_interface.h: mark struct member with kernel-doc
URL   : https://patchwork.freedesktop.org/series/156033/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e63ea74ceacf55eebecc3f84271ec498eb71804b
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Wed Oct 15 20:59:41 2025 -0700

    mei: intel_lb_mei_interface.h: mark struct member with kernel-doc
    
    Use correct kernel-doc notation to prevent 3 kernel-doc warnings.
    @push_payload is a struct member here, not a function, so use '@'
    and ':' in its description.
    
    Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:          * push_payload - Sends a payload to the authentication firmware
    Warning: intel_lb_mei_interface.h:67 Invalid param: * @dev: Device struct corresponding to the mei device * @type: Payload type (see &enum intel_lb_type) * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT) * @payload: Pointer to payload buffer * @payload_size: Payload buffer size in bytes * * Return: 0 success, negative errno value on transport failure, *         positive status returned by firmware */ int (*push_payload)(struct device *dev, u32 type, u32 flags, const void *payload, size_t payload_size)
    Warning: intel_lb_mei_interface.h:67 struct member '* @dev: Device struct corresponding to the mei device * @type: Payload type (see &enum intel_lb_type' not described in 'intel_lb_component_ops'
    
    Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
    Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
+ /mt/dim checkpatch aaaff197c9186f4959c2bcb18035725188b950ed drm-intel
e63ea74ceacf mei: intel_lb_mei_interface.h: mark struct member with kernel-doc
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:          * push_payload - Sends a payload to the authentication firmware

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


