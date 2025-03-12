Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C99C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 06:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87A910E0A8;
	Wed, 12 Mar 2025 06:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mN5tyiI2";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193EB10E0A8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 06:59:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43d0a5cfd7dso1856435e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 23:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741762778; x=1742367578; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qGToCFjFkpY7BGq8gYP63400rIYeQuZzF6p/TIJbfxM=;
 b=mN5tyiI2WS0YahdWBU/OAqjm47Losn9b3jJu9zmoVsVxZ5Sy91HQVDYkJ1LcQhxPOu
 NO5RUezTdRe4n5ndKUlfXMwNcCCTno7xL6CY0sqxfjbUWlXuFoR+jhOObZ/jRaiMdgHa
 rEEh+OAYXqGXlJVZxsWMc/5lKeEnRKA6KOGf2AKsxTJJ1BcZEBJLKZJUUZytfdVnYqSk
 onrMUUmSz9psLFtUmnBN9rnKd9JBDbzIAb4x+Cy4f0zlHcvgjRCdnPghQL78jZUwjoeI
 fCHrJk+JLj7Y7PQat3aa/pymyjJE8+d9u2RmT4UNNB5FCXBGJO4vEEiDT+y3+5nuq7iH
 /q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741762778; x=1742367578;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGToCFjFkpY7BGq8gYP63400rIYeQuZzF6p/TIJbfxM=;
 b=ahUmNr7TpIt7WqC73Avs33YuDvlV71FS7WfgHueEMhSTdwAhfqNKgpEgq6xO1f9ago
 tIF6u7yYIVS6cm/9jSINZo7raJSbUqeWkJQQdJjnbfAaj1zxgE20jre0QvpdnuastJUU
 Lh9UfiaU8/gRJJrfeKS1EIm/zMXC61Ck4gDlv0DHb1NAD7H5NQ0IYpxHf+rtrNAidL5S
 T7uOgzVOExhDhZqz4U+yvs+l1YcvU82DlXhdiCgCkctzSWHj7GNvywzATbnEe2Am3WP6
 mnhgyI/26VxM+jftplnYYAsAw8BghDkAgLzx3sYhNMOdbPhsxcGdNQxoz6y6RISoSiRB
 ckpg==
X-Gm-Message-State: AOJu0YzhOzzHKVVQ09NyMXvTlPtKcWEqxYomCtW9BbM1JI73xlXNuNp5
 0o182nsKNBtVscD4gbr6xqY1YNEqq3ITHQzvZWLanP6DoVgySJ79NkHnp7wcDXU=
X-Gm-Gg: ASbGncvhMc3w3SNg4O4L9MbBhtLI/iYHM+poQswuRTPXreIt4HROmlHLEdGRIMFPm7f
 qRwF6HIiy2v5EB91KcEy19PDvnWt7J9URGCw19qLwn8OiI1BPr5RSd1ieiLq9V+vAy5iep87V0D
 RDL40Ahx6F8KbtqmE96CzqnzOPNtQnVNQxjxEWGM/2Z1x4+XPEgxQ/P7Ncbu3yE2SX8ezIFKWQs
 cuTMb6OcjPBxa2xzCJtJveakfWuDyUk2FOMf8om9CMPpBR2fXiqmzRsiUbHlgNW4prhaQPxn354
 hZWygi5Z11fwHXZ/ZQABJZl6iqbYk1GKEMiw3U3NXMU0oMjDnA==
X-Google-Smtp-Source: AGHT+IG+u4zvsZHtLyc86FEvQW8MByJCd7fiHHkD3/EGVAid6oFO15VaWN4WDdpYXdwHcueIgX6TnA==
X-Received: by 2002:a5d:588f:0:b0:391:1806:e23d with SMTP id
 ffacd0b85a97d-39132d7a3b6mr13974775f8f.6.1741762778532; 
 Tue, 11 Mar 2025 23:59:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912bfba686sm20586539f8f.19.2025.03.11.23.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 23:59:37 -0700 (PDT)
Date: Wed, 12 Mar 2025 09:59:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Message-ID: <1454a5f1-ee18-4df1-a6b2-a4a3dddcd1cb@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Rodrigo Vivi,

Commit b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC
start") from Mar 7, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_guc_pc.c:1073 xe_guc_pc_start()
	warn: missing error code here? '_dev_err()' failed. 'ret' = '0'

drivers/gpu/drm/xe/xe_guc_pc.c
    1028 int xe_guc_pc_start(struct xe_guc_pc *pc)
    1029 {
    1030         struct xe_device *xe = pc_to_xe(pc);
    1031         struct xe_gt *gt = pc_to_gt(pc);
    1032         u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
    1033         unsigned int fw_ref;
    1034         ktime_t earlier;
    1035         int ret;
    1036 
    1037         xe_gt_assert(gt, xe_device_uc_enabled(xe));
    1038 
    1039         fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
    1040         if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
    1041                 xe_force_wake_put(gt_to_fw(gt), fw_ref);
    1042                 return -ETIMEDOUT;
    1043         }
    1044 
    1045         if (xe->info.skip_guc_pc) {
    1046                 if (xe->info.platform != XE_PVC)
    1047                         xe_gt_idle_enable_c6(gt);
    1048 
    1049                 /* Request max possible since dynamic freq mgmt is not enabled */
    1050                 pc_set_cur_freq(pc, UINT_MAX);
    1051 
    1052                 ret = 0;
    1053                 goto out;
    1054         }
    1055 
    1056         memset(pc->bo->vmap.vaddr, 0, size);
    1057         slpc_shared_data_write(pc, header.size, size);
    1058 
    1059         earlier = ktime_get();
    1060         ret = pc_action_reset(pc);
    1061         if (ret)
    1062                 goto out;
    1063 
    1064         if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
    1065                               SLPC_RESET_TIMEOUT_MS)) {
    1066                 xe_gt_warn(gt, "GuC PC start taking longer than normal [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
    1067                            xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
    1068                            xe_gt_throttle_get_limit_reasons(gt));
    1069 
    1070                 if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
    1071                                       SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
    1072                         xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
--> 1073                         goto out;

Before this goto returned -EIO, but now it returns success.

    1074                 }
    1075 
    1076                 xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
    1077                            ktime_ms_delta(ktime_get(), earlier));
    1078         }
    1079 
    1080         ret = pc_init_freqs(pc);
    1081         if (ret)
    1082                 goto out;
    1083 
    1084         ret = pc_set_mert_freq_cap(pc);
    1085         if (ret)
    1086                 goto out;
    1087 
    1088         if (xe->info.platform == XE_PVC) {
    1089                 xe_guc_pc_gucrc_disable(pc);
    1090                 ret = 0;
    1091                 goto out;
    1092         }
    1093 
    1094         ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
    1095         if (ret)
    1096                 goto out;
    1097 
    1098         /* Enable SLPC Optimized Strategy for compute */
    1099         ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
    1100 
    1101 out:
    1102         xe_force_wake_put(gt_to_fw(gt), fw_ref);
    1103         return ret;
    1104 }

regards,
dan carpenter
