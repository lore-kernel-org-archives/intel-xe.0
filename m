Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F2606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF57010FB18;
	Wed, 28 Oct 2026 10:43:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3E110FB18;
 Wed, 28 Oct 2026 10:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_a_per-clien?=
 =?utf-8?q?t_debugfs_file_reporting_bo_NUMA_node_distribution?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 10:43:27 -0000
Message-ID: <179318420705.81013.15658816434701910306@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution
URL   : https://patchwork.freedesktop.org/series/177016/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c7babfaaa6793cef63a42e5fe3311739adf0825
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 28 11:32:37 2026 +0100

    drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution
    
    When debugging NUMA placement of bo system memory, there is currently
    no way to tell on which nodes the pages backing a bo reside. The
    /proc/<pid>/numa_maps interface doesn't help since bo CPU mappings are
    VM_PFNMAP, and clients may have thousands of bos, so a dump of all bos
    is undesirable.
    
    Add a "bo_numa" file to the drm core per-client debugfs directory,
    client-<id>/. The file implements a request-response protocol per open
    file: Writing a GEM handle valid for the client takes a snapshot, under
    the bo's dma_resv lock, of the bo size, placement, and the number of
    pages on each NUMA node. A bo whose pages are swapped out or backed
    up is reported as swapped, and one whose pages are not populated as
    not populated. Subsequent reads return that snapshot. Once the
    snapshot has been completely read it is discarded, and a new handle
    may be written. Until then writes fail with -EBUSY, so that a pending
    snapshot can't be replaced before it is consumed. This allows querying
    many bos using a single open file.
    
    The write-request / read-response protocol per open file follows the
    simple_transaction helpers in fs/libfs.c, used by e.g. nfsd and
    selinuxfs, and amdgpu already populates the per-client debugfs
    directory with its vm_pagetable_info file.
    
    For sg bos, typically imported dma-bufs, the backing pages are owned
    by the exporter and can't be inspected, so only size and placement are
    reported.
    
    Example:
      exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
      echo <handle1> >&3
      cat <&3
      echo <handle2> >&3
      cat <&3
      exec 3>&-
    
    The client id can be obtained from the drm-client-id fdinfo key.
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Assisted-by: LLM
+ /mt/dim checkpatch 6a182ac542350dbca9147134654c35e463aa1382 drm-intel
6c7babfaaa67 drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution
-:414: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 336 lines checked


