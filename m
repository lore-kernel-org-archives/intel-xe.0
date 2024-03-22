Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2983C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 06:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563410F544;
	Fri, 22 Mar 2024 06:26:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187DC10F544;
 Fri, 22 Mar 2024 06:26:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_infra?=
 =?utf-8?q?_to_support_card_power_and_energy_attributes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 06:26:12 -0000
Message-ID: <171108877210.959897.7185984798881570314@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322042746.2357531-1-karthik.poosa@intel.com>
In-Reply-To: <20240322042746.2357531-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add infra to support card power and energy attributes (rev2)
URL   : https://patchwork.freedesktop.org/series/131059/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 728c547cb69f5d625a862d769854807c817da824
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Mar 22 09:57:46 2024 +0530

    drm/xe/hwmon: Add infra to support card power and energy attributes
    
    Add infra to support card power and energy attributes through channel 0.
    Package attributes will be now exposed through channel 1 rather than
    channel 0 as shown below.
    
    Channel 0 i.e power1/engery1_xxx used for card and
    channel 1 i.e power2/energy2_xxx used for package power,energy attributes.
    
    This would be needed for future platforms where they might be
    separate registers for package and card power and energy.
    
    Each discrete GPU supported by xe driver, would have a directory in
    /sys/class/hwmon/ with multiple channels under it.
    Each channel would have attributes for power, energy etc.
    
    Ex: /sys/class/hwmon/hwmon2/power1_max
                               /power1_label
                               /energy1_input
                               /energy1_label
    
    Attributes will have a label to get more description of it.
    Labelling is as below.
                    power1_label/energy1_label - "card",
                    power2_label/energy2_label - "pkg".
    
    power1/curr1_crit and in0_input moved to channel 1, i.e power2/curr2_crit
    and in1_input as there available for package only.
    
    v2: Updated intel-xe-hwmon documentation as per above changes.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 236ae2b6b695ecedc3cf4453a1679d53b2e06f32 drm-intel
728c547cb69f drm/xe/hwmon: Add infra to support card power and energy attributes


