Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FC606A337
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPn9TgdS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333C1125D8;
	Fri, 13 Nov 2026 14:28:00 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E6010E103
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 04:42:45 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-54d9ac78f2eso6906171cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794544964; x=1795149764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Tk5rSAMyMBpK/2/Y0715hQ2D01LoATP9Sswc4ObGJoY=;
 b=nPn9TgdS63Iblu/WgiRHUNX+v18QHudMuImF4k7iqOjB+zysIh5VYaRPSq7VfkcJRn
 etyvw1KcDPR2ynOMRVwXEzscz+/hJ88sgatFaErrZ3pCm604VLuiKq2+YTUqWJrvB2lv
 m6hO4JbNNSsNONZTMvhj7HI6gNHofL0NDdbqS+0O01wnJ1/ao/w92Kr8sqfy+MPDXFcd
 im9CyI1SoTjyvL1YeEajvWQdd7cPpBBI3eDgnjimbYuhkCpSu49rxcqhFAeoY1HoXeki
 OpcC7P6dFzpa0Ksri0iEFR9sCsR31nGqs5gKDXr/glplulJxYJLHIA6JzdTtnsQYYVAR
 pbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794544964; x=1795149764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Tk5rSAMyMBpK/2/Y0715hQ2D01LoATP9Sswc4ObGJoY=;
 b=ZVMYlCCjiSitrO81Kaox/Xaoq7vaVjtamUe4G7TIyhGIHRamwCE8d+3geCRwe2ZeuD
 SgGuwlL43GnurHaka/Fs1/8xd7xALo7ue4x8gvWq0AkSG0FkxTRVnfnrlqqTvgADdBef
 L+sng7H2OVpEC25c6dm6Vp9lWpHPvEYjI7Rmbs+x7IvflMtk0zzfBm1m1JsT1lxj1a6X
 vpXu/PjZfpHpib6zUkkvMdiNP4K3kWeObe6LGgCxkhF0XCIolyU/OwX/1ulbv6CeQt1c
 XywUjLACNqZtf+/u0mrqllkO8gEdgsY3s5f/rmEzITK1iiYSKri6qJ+pcyCKgvzjcTY5
 2sdg==
X-Forwarded-Encrypted: i=1;
 AL+hErHjkCMvM5HTNpp1542pLhFiIGOTxinoFw+aOb77/Ggej2R6+b0yvdnC1PkL4cERqH/mAvloFmXr6A==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/Nv+j7FSZyoU8qY5m7McQPielK4bTLN6UtsLHSK41QGAVLt/n0
 8vyrfQ/EjvtTOnD96cAoKY0Y+ibHMKPMXUxARsYXtmu+57y8h6TmUtiG
X-Gm-Gg: AYBFou3I/Inq36TQ0Lzjp4tuPOKyFa3KStVFwy6WSwPDEFbWBmu5ZxiGzKhaAhLuTY9
 lXSyKQFYvhwygEq7PmLZj+m2GUXaoRH1WrfAv9qb13WfMJEchTAXeWiMiT66XMHIJSLcrA2dR/h
 q0zTlsfYkfcOe84oRwgHrRBApL9MlgqKLnOzd5L8jNCJupRt3UkPzGup91nSt11HsZBDN7b0+NW
 48Vj/i0Mp2fiEdiCtkzTYNFkQHKUFwZuLZf7HPqWjKJF+s9nGPC8fkaWgJUnQnylxzLMsDNkmAl
 iJdSbgRF/FWpMDrHN+m3QZJ/sw4TS40IDhS5l6QQAdbr+i8O3zSjnFnFU1LJpVkwTES2COqQUi+
 kuiFNLK6ubYzqMbnNO0KHMzYn8CZBukdDVQQiDJslDSdRd4I6Uv7Z6r5LpNg0wX6T2Opx+A6/D3
 MMK2F4xCVry6xXqF/KeSWsHpMntLGaEp3eDPnqkAxK46UeHjWfdHQvl/0AOuWhpP/PR/aUO1K+D
 Lh0WlU35DLb6sn6WYaWP+zpbI9MQ7L7liyI2W1U7f/9lC220sPd0mjHwpATxYXjpMdD7+bZgTTp
 VKMzSrHBMcNTLkgU+PKSH4ch1HWsucqr1KZLD1jJexf0HqyJZpKtQCt3IPa+ZMf7KKxLVNc2N5M
 =
X-Received: by 2002:a05:622a:590b:b0:532:c181:8fe9 with SMTP id
 d75a77b69052e-55ac448c6e7mr23800341cf.9.1794544964243; 
 Thu, 12 Nov 2026 20:42:44 -0800 (PST)
Received: from linux.. ([8.34.174.240]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55ad14f1ebbsm10605221cf.23.2026.11.12.20.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 20:42:43 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/xe: Release the SVM prefetch ranges of unparsed ops
Date: Thu, 12 Nov 2026 23:42:39 -0500
Message-ID: <20261113044239.2185984-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Nov 2026 14:27:48 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vm_bind_ioctl_ops_create() stores SVM ranges, each with a reference, in
op->prefetch_range.range for every PREFETCH op on a CPU address mirror
VMA. xe_vma_ops_fini() releases them only for the ops on vops->list.
When vm_bind_ioctl_ops_parse() fails, the ops after the failing one are
never added to that list, and xe_vm_bind_ioctl() frees them with
drm_gpuva_ops_free(), leaking their XArray nodes and range references.
A PREFETCH that covers a userptr VMA and a CPU address mirror VMA after
it does this when pinning the userptr pages fails.

Release the prefetch ranges of all ops before freeing them. Ranges
already released through vops->list leave an empty XArray, which
xe_vma_svm_prefetch_ranges_fini() skips.

Fixes: 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM ranges")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus DRM_XE, DRM_XE_GPUSVM
and W=1.

 drivers/gpu/drm/xe/xe_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d25de5652767..ee35ead79371 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4208,8 +4208,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
-		if (ops[i])
+		if (ops[i]) {
+			xe_svm_prefetch_gpuva_ops_fini(ops[i]);
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
+		}
 free_syncs:
 	if (err == -ENODATA)
 		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

