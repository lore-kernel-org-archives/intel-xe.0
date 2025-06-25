Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B5CC7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 11:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEEB10E217;
	Wed, 25 Jun 2025 11:39:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5C10E216;
 Wed, 25 Jun 2025 11:39:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Consolidate_LRC?=
 =?utf-8?q?_offset_calculations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 11:39:38 -0000
Message-ID: <175085157890.107834.9874856474532026856@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625113241.19362-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250625113241.19362-1-tvrtko.ursulin@igalia.com>
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

Series: drm/xe: Consolidate LRC offset calculations
URL   : https://patchwork.freedesktop.org/series/150746/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 606cc6f9b514d5b816ccd6ff9ac9481b801d73c2
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Jun 25 12:32:41 2025 +0100

    drm/xe: Consolidate LRC offset calculations
    
    Attempt to consolidate the LRC offsets calculations by alignning the
    recently added wa_bb_offset with the naming scheme in the file and
    also change the size stored in struct xe_lrc to not include the ring
    buffer.
    
    The former makes it somewhat visually easier to follow the layout of the
    various logical blocks stored in the LRC bo, while the latter reduces the
    number of sprinkled around calculations.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Matthew Brost <matthew.brost@intel.com
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e4196e8184ee5a9c70c136f659dccef786c263b3 drm-intel
606cc6f9b514 drm/xe: Consolidate LRC offset calculations
-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost <matthew.brost@intel.com'
#16: 
Cc: Matthew Brost <matthew.brost@intel.com

total: 1 errors, 0 warnings, 0 checks, 119 lines checked


