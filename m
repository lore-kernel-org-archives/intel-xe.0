Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95C606A33C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqroTrqI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD54510E783;
	Tue,  3 Nov 2026 06:16:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E9D10E3E3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793686610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
 b=MqroTrqIgjt84lnqIMOy2MlT2wzyvIElh+QdbKrpwvbKvmBFgaJNkwMTF4FpPhXA+mBu2b
 /JuPDLE4AGNL227KXTMkehzRWNTEuz4UncL1yAh8j28yYtKTUR/19UxFGzqiwl9yqzksBZ
 m95yUcXLICDcZrkKFkRCblOmxduRPxM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-grivNt_vOaKHK0bfL4DVrA-1; Tue, 03 Nov 2026 01:16:49 -0500
X-MC-Unique: grivNt_vOaKHK0bfL4DVrA-1
X-Mimecast-MFC-AGG-ID: grivNt_vOaKHK0bfL4DVrA_1793686608
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5be3e5b8cbfso1946351e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Nov 2026 22:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793686608; x=1794291408;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
 b=R1xVpsx0me1AzA5u13dh+yt8TgcAZCfIT4R4lT1igaTwLFaS249ygeP71uqdle3ydg
 XLfYSY/Vrkrw24QzBFx/ml7Xg84kffW7k16nD89A1ZTaaWLeY/EKZgMtveduMsuMBxOs
 q3sb4hrEf85WEL7uO68tlViOksOX57K9PgqIu80qJmBP3W9l+V8ch3JbAKEcuJF22jY1
 +sXUl8qyoKysc06/T8FFevFTh2ujtwxUXj5HnSdxEamgnKXMrQiciE3Kjqtc3fPCPkNp
 ImtJQfqC13/oht8lNdd9EcZvPHUGcr0Udxn+X4fhrMv3FNwLiP2t5Q9IFdTtsextSns5
 O+7A==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8JHn6NhWS7vaBROMV3rcBEcqHRl5t1ffyLwq/QUZOAyHiUVlxZic6VFuSAjPjyQ844d8a0VOvKA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8G4n0DXUjpri7VQyd2iHHZX3/rVNorg5isYI7rreiXhkALltXP
 1FcNa/RmSOtP/OfRZ78mcy7roXQ1YvyVmS4ybW5Il/b4q9rHoouh3NQF9OZhgreAGSlUqJvKQSy
 iIu2Dta0wbscs9vuAkj0EGlBgKDfejt+qBUsol1IGeUcHLHQeMsftizO9uAzTQf225xc=
X-Gm-Gg: AYBFou1HQYf90e66BVniGhInxv3/RkSr/sfL/Z+BW50xgqz9lwyHq6MWsjx7fqVrqm+
 mBuzNAGETpts6liB+c+91cpGY2tmBvb9SXi2nfxnN8jRtlbgI9/9IneL636bzvj0f8VFONF8/fy
 +KFxMRxgWO2jkgVgy5873RQk7kQ1hYhADsxDFdRWUSTeWt4SE9zfk0zNOMLl3xJXKhVFAMW/moW
 j3zoqPZh7DWLoRGjtTo3HWhYGX2aynP4F7/hV0Dv+tMUpEuzX6OIXpTsxqjWTAlj8BeHL+LOO/f
 TOyAU5KCmDQoxn/s+wAqAArMbCaDNvOgqygotyNVM4VkWYIXHigdTBN30wgD2/rGREr7RFe12nu
 vYJ5MUSctVsM3yurH+hIlTuvTMh0HSG3M9SHZm4ALMKjFkmIL2BsQYIFy0BTgL3yv0cGnBA==
X-Received: by 2002:a05:6512:1393:b0:5bf:cfc6:edb2 with SMTP id
 2adb3069b0e04-5bfd951d540mr4443729e87.1.1793686607745; 
 Mon, 02 Nov 2026 22:16:47 -0800 (PST)
X-Received: by 2002:a05:6512:1393:b0:5bf:cfc6:edb2 with SMTP id
 2adb3069b0e04-5bfd951d540mr4443702e87.1.1793686607340; 
 Mon, 02 Nov 2026 22:16:47 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 22:16:46 -0800 (PST)
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
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 01/12] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Tue,  3 Nov 2026 08:16:18 +0200
Message-ID: <20261103061629.972669-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n9JIW9t4-Ds3FYMIdG7Bp4LwWUz5atKzfQzkzjgJbwA_1793686608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mika Penttilä <mpenttil@redhat.com>

HMM depends on MMU notifiers. With the unified HMM/migrate_device
page table walk migrate_device needs HMM enabled.
Enable them explicitly to avoid breaking random configs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..6fa03655b575 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -682,6 +682,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
-- 
2.55.0

