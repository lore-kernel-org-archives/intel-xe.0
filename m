Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E0606A337
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYb6VczE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF55510E524;
	Thu, 19 Nov 2026 20:39:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A110E524
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 20:39:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D10A41803;
 Thu, 19 Nov 2026 20:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B3E1F000C6;
 Thu, 19 Nov 2026 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795120784;
 bh=3xMIAtTAiqDShTolrkNuG6S2p5W4BlRXDgmAQGUpfwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CYb6VczE9/plH+t9XNBuQjQvhldom9q/wuK5QEhro4oVRpvooq+MHhFrdQlnLciPU
 P7JLsJ0cLQbxgTxM0QVNvHJOFkTWHlPd1Z4Gbs29lY1Dbk1MZsfC6/aC0epqj1Op94
 gFnGBxSgRYPav0BiA88kxirgARa7CrVRyCvdWRPUK8IamijK11um9XlU6VYlLrroge
 nqVeYM+T00riQZ2N3K77dOy9PQeNnA9KAYDEqhamiMlqOS/wNw7PkFDvhShFhoGNhk
 phskGzLUJ4kAiFhvEEBoOPny+E5YbsjHATmQuYnA240p6/qSRvdw5cGqHYI864sVIf
 +HAXFK7pSpAYQ==
Date: Thu, 19 Nov 2026 21:39:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add a per-client debugfs file reporting bo
 NUMA node distribution
Message-ID: <av9eZhLsRaYPHeis@zenone.zhora.eu>
References: <20261118134203.646500-1-thomas.hellstrom@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118134203.646500-1-thomas.hellstrom@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On Wed, Nov 18, 2026 at 02:42:03PM +0100, Thomas Hellström wrote:
> When debugging NUMA placement of bo system memory, there is currently
> no way to tell on which nodes the pages backing a bo reside. The
> /proc/<pid>/numa_maps interface doesn't help since bo CPU mappings are
> VM_PFNMAP, and clients may have thousands of bos, so a dump of all bos
> is undesirable.
> 
> Add a "bo_numa" file to the drm core per-client debugfs directory,
> client-<id>/. The file implements a request-response protocol per open
> file: Writing a GEM handle valid for the client takes a snapshot, under
> the bo's dma_resv lock, of the bo size, placement, and the number of
> pages on each NUMA node. A bo whose pages are swapped out, backed up
> or purged is reported as swapped/purged, and one whose pages are not
> populated as not populated. Subsequent reads return that snapshot. Once the
> snapshot has been completely read it is discarded, and a new handle
> may be written. Until then writes fail with -EBUSY, so that a pending
> snapshot can't be replaced before it is consumed. This allows querying
> many bos using a single open file.
> 
> The write-request / read-response protocol per open file follows the
> simple_transaction helpers in fs/libfs.c, used by e.g. nfsd and
> selinuxfs, and amdgpu already populates the per-client debugfs
> directory with its vm_pagetable_info file.
> 
> For sg bos, typically imported dma-bufs, the backing pages are owned
> by the exporter and can't be inspected, so only size and placement are
> reported.
> 
> Example:
>   exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
>   echo <handle1> >&3
>   cat <&3
>   echo <handle2> >&3
>   cat <&3
>   exec 3>&-
> 
> The client id can be obtained from the drm-client-id fdinfo key.
> 
> v2:
> - Use drm_coredump_printer_is_full() (Andi Shyti)
> - Drop the Assisted-by tag and add a Signed-off-by (Andi Shyti)
> 
> v3:
> - Report swapped or purged bos as swapped/purged (Sashiko)
> 
> v4:
> - Also report bos purged via xe_ttm_bo_purge() as swapped/purged (Sashiko)
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> # v3

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
