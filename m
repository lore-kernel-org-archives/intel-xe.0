Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DB5C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037D210E83D;
	Tue,  4 Aug 2026 04:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NSh7peBC";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4F10E822
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785817614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwL36eymgoLnccdesFRfeMb71MKt5ljy6aFM5YklG3k=;
 b=NSh7peBCTp9IoqIxQOFe7tS+KtLq9BgslC69+cqGeUsmSmflR6GLssZo96S+1D1sm/TGQM
 v0lfCWjw9kUJJFy5S5AeBQTEYU7QpdHJkh6U4gRenEC5O1dj6bWBprI/gegyeSdmcJPZgx
 /6DNZY9nEKV2po+2+1PTT9k5cS63rbI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-2cD1kST8Na2q7D-0EkBvxw-1; Tue, 04 Aug 2026 00:26:52 -0400
X-MC-Unique: 2cD1kST8Na2q7D-0EkBvxw-1
X-Mimecast-MFC-AGG-ID: 2cD1kST8Na2q7D-0EkBvxw_1785817611
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5b2b9c6d6e9so1989645e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 21:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785817611; x=1786422411;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hwL36eymgoLnccdesFRfeMb71MKt5ljy6aFM5YklG3k=;
 b=Pcw4mvLTW3qSnDrWnkQ+NY4i1E+dpKFN6AmzRqtZ4ZoT9d9ZhXjoblVS3AG3rcLc96
 MOhQV4SXlfqWG8tNI318u4fPKAjagTRbcCr2XNPq+sUnh/PFL9DV0xd6Owy9Y/a1sLxk
 XMUnpVuUooQStWgUK/596Kj12MK4LEKmjBtSpRJXw/eEmuTYkxiXixwNsTet2tuIr2W9
 Ba9kXt8l16mGZ4D8KIIHOJRsoxJNL3zkzSCfdkowCpmgebi13Lwe32JWrGCdQPNHaZGF
 NDSg1AJ1+it33kjEfgPZNVqdW4XwW5iBKNEj6LyfalBmRvG2HmN67D2wQw9gW/H/g6Cu
 VMCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RojWyN7KqwTG+S+agGNWx+ivq8tCuneD8h0K33tWr7pHffe6/Xj+L9JAVAluLU1eiB+SM0rhyNGZg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxggpMxiaorBRrZ4uXAi5fBduY6qLsLAn+ueGPqhvn1zEn32XeZ
 2lcX6X8K5DKdSpOYytB2DgNJfFCDkf8sh+6jF1yYkplguOOcQsOrV9p2PWiuPnhcKFUrXpyvWE2
 Em840yNyHAEzPo6t8V74CAT51rawCajYclBFFEP7fJ7Ia7lwxJujzEQrRqPyXLQk0cNMxreupwa
 pSWg==
X-Gm-Gg: AR+sD11wAcHDC4OkrFA/GynCuUrQ4FraJDOenpuZy0jllAHmgTkskR4q2OidhmzjCXk
 jNLBHIZlkHMr1QMuKVUayYL/9wsA8ei5JTmSseBzyT6lJ19mTx6ainBX7vzeov6XP7P/U8WBeSO
 2QIgIOn9PB8nuMOs/gXo/gZIwZrE7yehmzmo4YmV8Tewribt6pyPwmcZ+3I71Mf5Fk/Srre6WE9
 bynP4FZppKaOBKfE+Nwt26w6Qb10yXSFY30KhR6cMhi0AJL3mxpR6wfNihgwgWaj75Los3+0svn
 TnKMi+nruG0pmLIptkAinYBrrzDYvc9gkkA2cSwKAmHTeYDTkC/6BaF73aJpTxp5EpsHzEbQK9B
 SRH1z/HsMOEIb7jtk
X-Received: by 2002:a05:6512:3c96:b0:5b2:991f:90d1 with SMTP id
 2adb3069b0e04-5b2e4f3cb5bmr2664337e87.26.1785817610749; 
 Mon, 03 Aug 2026 21:26:50 -0700 (PDT)
X-Received: by 2002:a05:6512:3c96:b0:5b2:991f:90d1 with SMTP id
 2adb3069b0e04-5b2e4f3cb5bmr2664315e87.26.1785817610290; 
 Mon, 03 Aug 2026 21:26:50 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b2e23c46c4sm2311351e87.17.2026.08.03.21.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 21:26:48 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: [PATCH v13 01/11] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Tue,  4 Aug 2026 07:26:21 +0300
Message-ID: <20260804042631.2175585-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804042631.2175585-1-mpenttil@redhat.com>
References: <20260804042631.2175585-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 894ozHRk65scV9Cna0VJHNtIX9RgvgtLULES4KnVqiY_1785817611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Mika Penttilä <mpenttil@redhat.com>

HMM depends on MMU notifiers. With the unified HMM/migrate_device
page table walk migrate_device needs HMM enabled.
Enable them explicitly to avoid breaking random configs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 9e0ca4824905..7647671f37f0 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -699,6 +699,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
@@ -1260,6 +1261,7 @@ config ZONE_DEVICE
 config HMM_MIRROR
 	bool
 	depends on MMU
+	select MMU_NOTIFIER
 
 config GET_FREE_REGION
 	bool
-- 
2.55.0

