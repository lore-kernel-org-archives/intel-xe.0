Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D8C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 12 Nov 2023 22:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF6110E037;
	Sun, 12 Nov 2023 22:18:34 +0000 (UTC)
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Sun, 12 Nov 2023 22:18:31 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00A10E027
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Nov 2023 22:18:31 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699826877; bh=Bn6KSJSPvmgoYCQuInMsppxbXNN4plnuMKCXqUgu6s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+BAfI4B9+rVAv2t+GmwcRZ2+dba7PxpYfRa6nR2KNGTLnMzWfDnYDSO5ltVs4ViV
 QgvmJt3lvX6lXg1XDMoaAYuZ/CGC7HoIsnDJbrc3cgTGSyx4GnRmJfnhQnqohcOM/S
 YrU3NKfWuLy+wqM1I5ngOBjfY7uUQm4TitYfP4b2D2D3T7kJGk2w7fPtmuBAeHuHuR
 20qGQ4FavcTV6xik+jmJtX2W+naz3nkX39JLjgeW6iYxISF2KOXUC3VMow9TmtvNy7
 +ha6wq/P/26bfV5qz4rwF/BFDlrTDLdlqdum0W0VNrsVGA+jLIQUTTjYgf0DBJjOep
 z32FVV856vEMQ==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 3ACM7pNU1472245; Mon, 13 Nov 2023 00:07:51 +0200
Date: Mon, 13 Nov 2023 00:07:51 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <kh4qtb33rozpnhizyi7jqalcywqadco7z5rnhtuqbwxurxvcjg@44ec5mq6jyes>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
 <20231103153234.30407-9-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103153234.30407-9-thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [CI v8 09/18] drm/xe: Adjust to commit "drm/gpuvm:
 add drm_gpuvm_flags to drm_gpuvm"
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03.11.2023 16:32, Thomas Hellström wrote:
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index dc7991eabb58..46a87a4e42d8 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1385,8 +1385,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 		goto err_no_resv;
> 	}
>
>-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
>-		       0, 0, &gpuvm_ops);
>+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
>+		       0, vm->size, 0, 0, &gpuvm_ops);

Maybe vm->flags can now move to vm->gpuvm->flags ?

Dafna,

>
> 	drm_gem_object_put(vm_resv_obj);
>
>-- 
>2.41.0
>
