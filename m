Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24934CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 12:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF98E10E691;
	Mon, 18 May 2026 12:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="nGgYLcvu";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01510F53F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 14:02:15 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-90ea08cc5ceso562689085a.2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitbyteword.org; s=google; t=1778853734; x=1779458534;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uJOdi/TzljxZPI9yl1I4A/VL65oRSiUkNPLik5t/1gE=;
 b=nGgYLcvuy9S+ZMrZwqw91g86z+VKWIn7BrmBzIfPCTqTY6F/DJ6CiVGvlCKYw5eSO+
 Oky0WwVuZxO1VU6U7MhILcuSBJV/IQloe6nGX1hm0X3YSWfgJzK90BsB8b+Y9eGDH+Qy
 0vzUHr3d/+lcYfTHb4AJ6ihoJTkZygwzQQyrVp+RxRVPO7lyGKkPHtcwWj8V1gTS7hit
 TV4jwXMv2/Fa/Ps0ipfxB/l6ST3J0iAyB3UQcSYoNodZv2H7MmNu839LqNgOC+c8IPg4
 ci6IC/Mbs7v4wya+eOLm1MS+UHDWRboBhHG2k1Q1iXfYfaHg7MSjcdBoWI7dVKKsws11
 DEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778853734; x=1779458534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJOdi/TzljxZPI9yl1I4A/VL65oRSiUkNPLik5t/1gE=;
 b=b72GfYcrzvmAegBh4RR/uGrMnklWxqxbxfzT6DYaKG7dS2WtWTmhEp/Vpr2KFAk3C+
 6BRg2ijTPA7HwFOD67jg+U8ybhrE9pX7bJD5P++u9BIBD1U5BmrtzMZz80/5OZ0rmCpb
 h6Z9yKoTIacdlcBOvMenHmGUVMr6ziDqv3Bgj0y51ag6J0dn7hTulKVhr0E/wolK01IZ
 0QcjrM/MIweH38NeDRqv35UzShXzMrRs5A/KvF5KCDL6ctRLE4bZ7ToNEr38VL89Ehao
 4snHpY0ZioP40NA9uQ01/oaGPml4SK+B4UZgXE8lcYcCgWDo6T8masutAhjrSAE6YhOy
 nbxQ==
X-Gm-Message-State: AOJu0YxdkSZm5gC0FZ6+S6zU40FWITSYjHLN4ph68w21Giym3w5dOBAJ
 G1rZ2TBCzKeUyc9bZPoZ7+HaxPXTvyYeLt+tD0QeWlBOgKDNbJ1Iz0v075gF+ARfImA=
X-Gm-Gg: Acq92OGPWnkdxusyNvlpWE6XPoWO2uDIs0ou5q739Shrkw0p5XPHwxR3lPISdoOGWap
 zHlOT6zHrMg30a1jdlQ1gWQhoelUnXq2lUeUTW9wsC8IjUKz614Cy3J+gyWwPS27ZnaJ/pKRAjQ
 arC4XR2sus7o+bpKxI6SI/FR2Vk3kr1oXb14bgSSPArFV47szvXRQDvsMFNk2ZMU+v2/KB1njzF
 0fm8mmX6mDVBrZu9dSvHOpTkU3aO5uGCXGvWsLLajjnH89NhX9osNdXZLhaDFeqFPyrg6kNaubL
 b1GiZrOWE8PUsE4pjiXcvvi1yKkps6sDs5SfCg8233KjEi/nOT8ia7zYrBYrP0UUZw7jDQJIuxD
 ZLJKAIPc9gzbvGz2rSHs3nBbuj8t3G5TumhhpfgY/NjN/hoEKjkgx5N+6dsqYlb7nls2nQ8o/OR
 dhkgwFEEQPsRa4RwqNYGAI5QmEEJJg
X-Received: by 2002:a05:620a:454b:b0:8f0:7516:daaf with SMTP id
 af79cd13be357-911d087bf3cmr649143485a.48.1778853733580; 
 Fri, 15 May 2026 07:02:13 -0700 (PDT)
Received: from vinp2.lan ([2607:fb92:1900:6734:902:ab48:6190:9c1e])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-910bc83b85asm549789885a.25.2026.05.15.07.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:02:13 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org,
 Vineeth Pillai <vineeth@bitbyteword.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 2/3] drm/xe: Use trace_call__##name() at guarded tracepoint
 call site
Date: Fri, 15 May 2026 10:01:41 -0400
Message-ID: <20260515140141.2239437-1-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 May 2026 12:59:12 +0000
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

From: Vineeth Pillai <vineeth@bitbyteword.org>

Replace trace_foo() with the new trace_call__foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_call__foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Original v2 series:
https://lore.kernel.org/linux-trace-kernel/20260323160052.17528-1-vineeth@bitbyteword.org/

Parts of the original v2 series have already been merged in mainline.
This patch is being reposted as a follow-up cleanup for the remaining
unmerged pieces.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a11cff7a20be..8a10a1ede983 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1032,8 +1032,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	 * the fast H2G submission path when tracing is not active.
 	 */
 	if (trace_xe_guc_ctb_h2g_enabled())
-		trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
-				     desc_read(xe, h2g, head), h2g->info.tail);
+		trace_call__xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1),
+					   full_len, desc_read(xe, h2g, head),
+					   h2g->info.tail);
 
 	return 0;
 
-- 
2.54.0

