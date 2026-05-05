Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C23CCD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE1910E19F;
	Tue,  5 May 2026 18:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CJziw1ci";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4FD10E19F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778006693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=CJziw1ciPjfRtDVwWls0ATkXzN/iPFMJZywvnAyy0j34iqPfIJka8z+HJ4adj9gzDVQOdm
 4Wz0Fem2Rjy+iQoDPij6IZR4yV9TQfCxhXZo0m/NT1eMSVPNBIlw5xWq/G/Se3oXNicz9f
 3rNBLtHO5/MQurwzxObQSiex0beYI+I=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-2wVCPmNIP8GJce6S4rG06Q-1; Tue, 05 May 2026 14:44:52 -0400
X-MC-Unique: 2wVCPmNIP8GJce6S4rG06Q-1
X-Mimecast-MFC-AGG-ID: 2wVCPmNIP8GJce6S4rG06Q_1778006690
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5a880c25d05so887546e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 11:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778006690; x=1778611490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=RQLJVFHerpWnqpYYxaX5lrqsyCNUfiBqcIfWoGqw3+paBl/LS1P336JiG1CMU3rYqP
 l+XKUZXXt5mkpT67CXKWAFL+CRZQl+lGp00FbJiKMBpbiynbvrln5btdE21sxaQKyu5Z
 SiNrmqXr4LNKrNzxzKhOq3F8YHQzIf9sswIeTSCpR3MPWU+c6zT/VcSoaEa/DIIkQF+Z
 vfGFRwkvHFotfO/KAL1kL8t4+MbvbL6pEJhM2lQDMWpH7uMiPzSD8+nRFdFlAyyqWnGE
 byfFOvmGUYrEVVUBPUl5PabhQtCCeXlNZdRsMkX06f/gxSS+EGEguGuq/++GDvWQ5pva
 lR7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XJnZhC+J4n+ueI4qwwZ40ev8EFOzM7fdo+g8ZyM+sx3/wmyFXo+T7svXFHFThGt0OKPe4XlV48w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQxFY6kyfeBN0fpydJhA7YRktNztHAuWRsaZsJGPGuDxmbH3R
 t00jRFSM+13NJk0P99LOopgfBiBYodWdzv7nk6cl9AjKvGz1r6qYXRLJudrkm2SIuaEXutfNeTJ
 b92/CO0CQd2DF/eLuWRGWm7DiUhtx+Q2it7VBWfDmzjgL6bQjPec16XK/REXlggsCIIA=
X-Gm-Gg: AeBDietN6ncG9oobduU74ZhJMqZWz8pLsVgFwxfL17PG3245f4eO63IjlM+QhNycFpR
 RN5CcI/NpA7V3jPVCjZj7U87nD7BQgTZ3yuvlaqQCkllTpyVUNC4WZjn/cKGdvqrQpofpO/aJHn
 pIchUU5wEQNIafwSwMDALkNqI9NmTIFAz+ZbY5SrLhO9mVKvFq/bRfcdZvwQRRV3kH05H7PtWxz
 /T7ev5LaMkTe3PUQl53u17X7YbDcKNFUeU3Tz9/YAd2CcdB2PNDJizuB/OdswwcPp4fWtQ1f5FJ
 uydWNkNF75jFAGoqgL77dMnpMTRSdKNBAk4npTzDcQ0/hwy4lbu+xih8av52Mv411d4y2zbsi71
 OV5QT/WEZcCfaQDoZxivMk8LcX3bvf+7XerGxPhqi75jjl98=
X-Received: by 2002:a05:6512:1241:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a87f1a04f6mr1942767e87.6.1778006690416; 
 Tue, 05 May 2026 11:44:50 -0700 (PDT)
X-Received: by 2002:a05:6512:1241:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a87f1a04f6mr1942737e87.6.1778006689860; 
 Tue, 05 May 2026 11:44:49 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a86e65fdf6sm2504437e87.78.2026.05.05.11.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 11:44:49 -0700 (PDT)
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
Subject: [PATCH v10 1/5] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Tue,  5 May 2026 21:44:17 +0300
Message-ID: <20260505184421.2324798-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260505184421.2324798-1-mpenttil@redhat.com>
References: <20260505184421.2324798-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BqX_xXbnRg5dOhd7xwPnAPNoJuH--xWItXe-RK2xhag_1778006690
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

