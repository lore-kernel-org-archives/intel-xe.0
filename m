Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EEBCFD648
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 14:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8748E10E612;
	Wed,  7 Jan 2026 14:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0b0GmyA";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5AB10F0BE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 21:21:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so6320149a12.0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766611280; x=1767216080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fMPdGvIlNbNvNMSLf1GQSer9rjpaVmriiyM8Ev5jbvQ=;
 b=d0b0GmyAPs+AvCxgPosFqF1oxyj1HBFB78sstYK65Ych4Q0wUgCe3empGMPc8QIezx
 6U1l5y9un8n+s49kc9H6WF5tI8Zd3Z1zMYhZFhYpPZylJXo1cscge+Hh/SmjkJVrwh/6
 WzLVC2CK5TMZwsE0oBsSIFBCqekLdaW1lrdUju0bhLHCSIv1eFCcmAS56QrpOv6p/PEm
 5cOREoIqs7BcekZmFwtWpQcx8n5sjBOS3H3gqhBAiIirVJ5GnXFXU2vWCIIT5XkCztRZ
 LALiSR4ktLg4TvNAZ+c6O+UxxQQvGKP7wawCSymcHy/lsF/E3yofirXmL+572YoRASvQ
 nlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766611280; x=1767216080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fMPdGvIlNbNvNMSLf1GQSer9rjpaVmriiyM8Ev5jbvQ=;
 b=a5dwXd3O+BHXS+pNSbM8l5DVBB7ymYRk7eGfKSbBLD7IgkTuctxZgZ4inOBm7DCIcc
 dbW9yWtMMxCMkAzb0pUk0nU1p3OvJXhw5lyP5JF3tEeNS1YHeO4TWm4pALbIbYhqZwIE
 qLhHCQz5NMxdYQmRJSuq347wNxrU6dATmGrJp0lvKKbHacJhGBbC3hPpgqTE/9AtfFvP
 XifUuJ3xwE+XiLnNaQhzq2cWQXU0YsuIL5cWOiDxFnC+CRa+HYuUG76togmAbK6RYZMb
 tq/aLVMBYF65jIfV6bEbUnAhNSaQS67VkyNj6J3y4V4RDWlcobxs9AIHTN6WJ2bHh66b
 yXrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU80vdK4K9YSvz0QQaas8s5OYostYmsFSjrZfME8jhtOvtJdpki4+nKWY5UHAIqvT+tC8TLbTtHEg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBcaakfaqhfM1C8aJ7MYeUHTFoEGVvFohSama4dhl9tYCPqU07
 Er7w8nOZgqXjQs2M1gDbwsOXOBTIpEU67q0JLj7S+r/OXtCxoJfOZZt5
X-Gm-Gg: AY/fxX7cNbYD4kA68PnbMWT7CpiX+ibZIa3YdA2tWMykjT7R0YxLEK3QJKHQHVUSfAB
 RMVzwjUBH2fludVFDUT06Tl4nzL6CnkhmJGkkhfEI3G6I1Ht7ojmGIShLD7TRDuyoWaz2e7uoBR
 C+lShxdZb3HiRtJDFzcs+GNQ+h39nry2AekeSM7C3c86Pfe8D8bHFzACLEbPs8evHQnheb1pf/H
 d/fbJVSS3rDiosN6mqFv/Nh1Zgg27jKDCfihtz7QdFLZ+nZ4o+EGOxGPVzdMmdWOYfR7ZZ3uudP
 YMBGQOKam7TzScyVaGZ72wvoxRTmdulKnCtrFUXh6MpqSFQz4rKUR8X9i8vbPmoxPB09oPgAV88
 kbddpM6FtcMpWI+nv5+di1JzfBbKUq8zcGgu3K7zaO6aW4XdQmQT1j7e7x0T12VUtTvw9eKdAZz
 9mzQrryszmJ8JhtJg=
X-Google-Smtp-Source: AGHT+IGfkWtEmmnyO9BFQz+C5HCNcReD1s5iNrq6BNCWUfVYA0gfccxmRylORViONZyVJ5yDav7xnA==
X-Received: by 2002:a17:907:96a3:b0:b76:3472:52df with SMTP id
 a640c23a62f3a-b803564175emr2292921066b.10.1766611279466; 
 Wed, 24 Dec 2025 13:21:19 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:7e77:d48f:f25c:1b21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a60500sm1851913766b.13.2025.12.24.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 13:21:18 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/xe: Add missing newlines to drm_warn messages
Date: Wed, 24 Dec 2025 22:21:16 +0100
Message-ID: <20251224212116.59021-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 14:19:14 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The drm_warn() calls in the default cases of various switch statements
in xe_vm.c were missing trailing newlines, which can cause log messages
to be concatenated with subsequent output. Add '\n' to all affected
messages.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 79ab6c512d3e..1349dbc6f0ab 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2187,7 +2187,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
 	default:
-		drm_warn(&xe->drm, "NOT POSSIBLE");
+		drm_warn(&xe->drm, "NOT POSSIBLE\n");
 	}
 }
 #else
@@ -2283,7 +2283,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		xe_bo_unlock(bo);
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 		ops = ERR_PTR(-EINVAL);
 	}
 	if (IS_ERR(ops))
@@ -2552,7 +2552,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 
 	return err;
@@ -2750,7 +2750,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			break;
 		default:
-			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+			drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 		}
 
 		err = xe_vma_op_commit(vm, op);
@@ -2812,7 +2812,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		/* Nothing to do */
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 }
 
@@ -2989,7 +2989,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	}
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 
 	return err;
@@ -3228,7 +3228,7 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
 		break;
 	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
 	}
 }
 
-- 
2.43.0

