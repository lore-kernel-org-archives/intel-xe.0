Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9EEC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BC210E599;
	Tue, 14 May 2024 10:54:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B02410E8E7;
 Tue, 14 May 2024 10:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_the_pat?=
 =?utf-8?q?=5Findex_field_from_xe=5Fvma=5Fop=5Fmap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 May 2024 10:54:43 -0000
Message-ID: <171568408350.2114579.17267651569183446292@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240514110341.3581829-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240514110341.3581829-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Remove the pat_index field from xe_vma_op_map
URL   : https://patchwork.freedesktop.org/series/133599/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ee519b850a59c530033100a801766c439469b8f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue May 14 16:33:41 2024 +0530

    drm/xe: Remove the pat_index field from xe_vma_op_map
    
    The pat_index field within xe_vma_op_map facilitates the creation of new
    VMAs for DRM_GPUVA_OP_MAP as a GPU baseva operation. Rather than
    initializing this field in vm_bind_ioctl_ops_create and subsequently
    utilizing it in vm_bind_ioctl_ops_parse, eliminate pat_index from
    xe_vma_op_map altogether. Instead, directly pass the user-provided
    pat_index to vm_bind_ioctl_ops_parse.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch b27285c06de4a6ca7b065e035f0bb06887de2f27 drm-intel
0ee519b850a5 drm/xe: Remove the pat_index field from xe_vma_op_map


