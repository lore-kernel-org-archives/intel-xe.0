Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6180FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41F10E929;
	Tue,  5 May 2026 05:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IQX00YCp";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628E710E929
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777958281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=IQX00YCp94mfnFnOkXjhOLagQFZ6fabFgNCg4o5GDjeaAGxdtHzdJEdN+mcDVXD21eBWz4
 yNmVJqUmwiSXXuX9BVXmxF5kFiLAheYfOfO2rguMO3cq+Y0P0WbpHffXu5zEKI5psCszfp
 LkdvSfGvcFySxL77dcyAMTEi4LL2X5Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-0o6wJQ19Me2lBrw4sKXcbA-1; Tue, 05 May 2026 01:18:00 -0400
X-MC-Unique: 0o6wJQ19Me2lBrw4sKXcbA-1
X-Mimecast-MFC-AGG-ID: 0o6wJQ19Me2lBrw4sKXcbA_1777958279
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-38e83c25d24so26392461fa.0
 for <intel-xe@lists.freedesktop.org>; Mon, 04 May 2026 22:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777958279; x=1778563079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=Stkfw02Ga3fZNCcaeZBS7r7yHW/60E0R03mya/5r50xMxrbt5kz3d4amvqAbarFeXW
 xouj+Q6dhiCJ7j0HVtiAZhCxUHC8su/SXZ6rogWf3PcZQ8JzBx292g3zi3cnxPAZNG7K
 MQ1Rz9ROy0oG3qlHdgj9O2zd1Wn+h23w+45N654AhI29ogN07vfwEVAavcwO2eTDRr8C
 31RN4Egw78omR2AKKweQCMR079q5RVMpN1w1loMd7wVvMIqHH77Gnom2Ui1Kel1TWjCV
 LRHPmbtg79bj19VENjxdoCXQd34X9Rdq6iny8LxBQnob+jkcA/22MRbxijBFyBmwSWj6
 fVBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Sdj/cGfTGlrzpQwXlelfMRkB3k4+a0wTNQxonL/r3wAh2Rp5VCq7/4LaV5UeRJ5GB7ewi8emVZA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJfpAdOIuIMgtXaIul+x7mSPc4jqd++xH87OQsdliDna91gCIY
 UT6UCCc3aYRTm/XLLkOhaLbY6N7ky6lcKhd/J3yFfBRGNsXKsW9CSxgDgRzGLZtxHoGcwE3rHah
 B+wJInkTs5XdLcbFJHZl9TyCBeL57e1XcSdic+y1G2vOh4OgdBWzY/uVA6EKsNw2/Hlc=
X-Gm-Gg: AeBDievATFhX0LrkB1O2heejNUYackl+dh4sFmKEGU0v/1FNOC/sdiwM9EW3v4oFUxi
 KCThrTTKXn3ephOTnYmLb/aldNzIXWdyiUTDc474iK1wS8szWMyGiU87IGAgRvqOoKv2bMLgfUO
 MVadvNVbpTESI22GP0Vxx9010lk9AhnxgAumRajSAApHeEfmuaAwEz1jyYd3uWICbExEuQiNS4x
 sWbxaXKuGLUdDKFCMtPAycaDJA5RTp4ilRD1oSyI1n+ZIMrtFr7Sewulp0C9Bydk8XFLCzHtYQZ
 aCw0aw/2Z6Py3b4t4yvC6D6KT2w9JkjZblzIFg+7drfddOr3lA1QoQOPs8BPOIhVoq1R0xL7Uw8
 O/RkYDUA8xcwbhNpvmCqpX/N8lZQ9flyD42Wde5AIr/eeSGI=
X-Received: by 2002:a05:651c:4199:b0:38e:186e:350e with SMTP id
 38308e7fff4ca-393b495a02cmr5464421fa.7.1777958278614; 
 Mon, 04 May 2026 22:17:58 -0700 (PDT)
X-Received: by 2002:a05:651c:4199:b0:38e:186e:350e with SMTP id
 38308e7fff4ca-393b495a02cmr5464161fa.7.1777958278137; 
 Mon, 04 May 2026 22:17:58 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3936138935fsm37206141fa.41.2026.05.04.22.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 22:17:57 -0700 (PDT)
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: [PATCH v9 1/5] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Tue,  5 May 2026 08:16:54 +0300
Message-ID: <20260505051658.2219537-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260505051658.2219537-1-mpenttil@redhat.com>
References: <20260505051658.2219537-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QOZjXYXH69tKBnqHFt_Ug4l0BFlsGsXUV9q18zjM8Cs_1777958279
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
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
index e8bf1e9e6ad9..0d8db75ffc23 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -646,6 +646,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
@@ -1221,6 +1222,7 @@ config ZONE_DEVICE
 config HMM_MIRROR
 	bool
 	depends on MMU
+	select MMU_NOTIFIER
 
 config GET_FREE_REGION
 	bool
-- 
2.50.0

