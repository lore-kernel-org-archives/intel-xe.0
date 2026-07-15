Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CC5C44523
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 21:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A38A10F62D;
	Fri, 17 Jul 2026 21:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9mjGOjl";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABB810EEA1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:47 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ceae1ed204so31109165ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784139407; x=1784744207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=+q3csfDWWlHf03esSbv28913HL95J8hCqGqZ6tTf+OA=;
 b=I9mjGOjl9vYkBWbyALx0O0Pf6UCaB727hvbwkRo6EABA2FEdzcjmVtlIX0e9lmUZrs
 5p5W1vbitBZpOBPol0HtLycOwlYDfS2RyisXR9nqX36lyPrbnA2XZqA2mMIZvfmTJai3
 K8cLP+ZiGyY+DBvEfDXLV3dz+CMe9lDY/W0P1xuVyRcCzMSyNxpgiwNSjpY80agmDMIX
 Nlxl8P2pVv5Gs3OEgzordQ3W5rrzjKapc925AYhW+oaviVtJDBUvgSfWXbIpq+Nl5nhd
 QKJTreAmWCmBxjRh06CZJrAechmpIqVdYldXQS6QNjnx2uMTeNqqUQ0TRO4AhpAITJTA
 T4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784139407; x=1784744207;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+q3csfDWWlHf03esSbv28913HL95J8hCqGqZ6tTf+OA=;
 b=OPzedLCTlaJiIJleFKpjki57+pthKB7i3Fra79GRhWbkpb29VCSYazXS0/Bw1gAOPK
 Kio+K8i6K5araOiCpQvUFXLQ6DWqENLmhVdhrtUF9BGskRKwK0HRbJ+1tjdd5SgbBkCT
 WJCsCP7hsmU4TnLzjgouW5tUR3tOPH9GQCIw/EGxww676is1YkDBXMNYN6oxZjn5x83J
 sUhqYhIDJ0/BCgURpdpl4Tng4X5OXi/kAVSekMpYtgEULw8yx+jXryjtWegDXLCquc7P
 4O0UyfJSYcR8S4uzKo6IFYFx8qJT/S1XC/kPoVkvQ9Ym9Vx1CjVx1bSAIbDS5gmIO9LL
 pwVA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqIdD9758PyLJbeb81Ej5TxiaLN1kItueSLJ+iyzG/Bznyc8nb+zeYPTssLeGdymJLD0MILBYwtDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRorGP/Q7vXMFRj3o56KBB94xCMDC1FRtCLzBjpM15N4h9BT5u
 BcZwDmjhJrcA28B6sXXihypS94iTDmqkQ1+++99EmEblFwFr14GC6ddX
X-Gm-Gg: AfdE7ckN8K40Z/+/Tj1kABd2KWbaQeTjY+8ZpLNoC+0FnZYfQdzdsq4r1fGnDkecgSv
 JON4Hxe65FaQ3CA5pTdXBsnz3wQVoZz5qVNSFW8ZN3fn2Gkb49g4v9f0R2eVj/0HwUuLrAYv6ne
 4KJHJjn2aq49Rv4fHVUm2KUBzODkpEeQVkNxmoiuUhZlZk9M794Tpw6g7r8BwhgluNohOG4yopk
 +bVCZKvDe9JiFYiLeZMUG/Obk2YJwAThA2j882ctPdhJhz92jsljt1+JXF/TNkjbGEH3LiZtsRy
 6WzqHgG1BmUibCnjkb3SxyxGtA4Jnw1N+1waMUdLwQzf5n/0ok1kq0xlZj9sYnrNUBMFKGfJcRH
 N6l85yTT6brlZO1/k0W9njjOMkiOGmZX1QRaBvcohzv+H4PsQCjaBesSnpnCrNfD0zQPZf8etzM
 r6h6nWk/IXJ/+spv/kldfE63+wo0SXq99A0Y/KlKLyb5ODQ0f633OIwHfp1UA=
X-Received: by 2002:a17:902:c94a:b0:2ca:b8fd:f31 with SMTP id
 d9443c01a7336-2ce9e9a175bmr176469515ad.15.1784139406969; 
 Wed, 15 Jul 2026 11:16:46 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf1055d661sm6778695ad.42.2026.07.15.11.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 11:16:46 -0700 (PDT)
Subject: [PATCH v9 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
 for range population
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Wed, 15 Jul 2026 11:16:44 -0700
Message-ID: <178413940486.1155966.10368807598827608499.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Jul 2026 21:05:30 +0000
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

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It also open-codes the mmu interval sequence setup before each HMM walk and
retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries, so the driver only needs to call the helper and then validate the
sequence before marking the mapping populated.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
population attempt. This scopes the timeout to repeated HMM notifier
retries while preserving the existing outer loop that moves between invalid
mappings and restarts when the interval is invalidated before the driver
updates its mapping state.

Keep returning -ETIME when the HMM retry budget expires, matching the
driver's existing timeout error convention.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..b5b4ca263002 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1034,7 +1034,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1061,24 +1061,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
-	if (ret) {
-		if (time_after(jiffies, timeout)) {
-			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1096,7 +1081,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)


