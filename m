Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDCE92FF9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 09:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9210E06B;
	Fri,  6 Oct 2023 09:20:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9570810E4D6;
 Fri,  6 Oct 2023 09:20:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 93D3AAADF1;
 Fri,  6 Oct 2023 09:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 06 Oct 2023 09:20:06 -0000
Message-ID: <169658400660.6467.9609103063139679349@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006083935.3924-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231006083935.3924-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Do?=
 =?utf-8?q?cumentation/gpu=3A_Add_a_VM=5FBIND_async_document_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Documentation/gpu: Add a VM_BIND async document (rev3)
URL   : https://patchwork.freedesktop.org/series/122457/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b3c5d3754176222ab83fddbfabdbeac7006f9502
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Oct 6 10:39:35 2023 +0200

    Documentation/gpu: Add a VM_BIND async document
    
    Add a motivation for and description of asynchronous VM_BIND operation
    
    v2:
    - Fix typos (Nirmoy Das)
    - Improve the description of a memory fence (Oak Zeng)
    - Add a reference to the document in the Xe RFC.
    - Add pointers to sample uAPI suggestions
    v3:
    - Address review comments (Danilo Krummrich)
    - Formatting fixes
    v4:
    - Address typos (Francois Dugast)
    - Explain why in-fences are not allowed for VM_BIND operations for long-
      running workloads (Matthew Brost)
    v5:
    - More typo- and style fixing
    - Further clarify the implications of disallowing in-fences for VM_BIND
      operations for long-running workloads (Matthew Brost)
    v6:
    - Point out that a gpu_vm is a virtual GPU Address space.
      (Danilo Krummrich)
    - For an explanation of dma-fences point to the dma-fence documentation.
      (Paolo Zanoni)
    - Clarify that VM_BIND errors are reported synchronously. (Paulo Zanoni)
    - Use an rst doc reference when pointing to the async vm_bind document
      from the xe merge plan.
    - Add the VM_BIND documentation to the drm documentation table-of-content,
      using an intermediate "Misc DRM driver uAPI- and feature implementation
      guidelines"
    v7:
    - Update the error handling documentation to remove the VM error state.
    
    Cc: Paulo R Zanoni <paulo.r.zanoni@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Danilo Krummrich <dakr@redhat.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b3daf7f07d6accbe43feafcadeb0b0498063761e drm-intel
b3c5d3754 Documentation/gpu: Add a VM_BIND async document
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 331 lines checked


