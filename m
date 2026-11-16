Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5C606A337
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=VmPp7q7i;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=VoHxj1Ix
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA2210FC17;
	Wed, 18 Nov 2026 13:03:44 +0000 (UTC)
X-Greylist: delayed 2394 seconds by postgrey-1.36 at gabe;
 Mon, 16 Nov 2026 20:44:20 UTC
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598410E439
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 20:44:19 +0000 (UTC)
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJXQlX2058208
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=OoLT
 YMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=; b=VmPp7q7ixR/GQmSlNvEE
 kjmcyohLdB0C4sFEehPP88ZgwKMUFwGkFDkqrb2shv1Cy7FPgg0x0r+Z9sjlHc/U
 NuVTsGNgAkBRak1je4y8WwazCm93d9hmEu/dCxQbQ6BBI9tkC8MGMN0GJDzDzYAo
 HXE0iPoGzC2ycj9VXVdzPX8bPAyV8R+vEwZEIpKQksNa8VmYKjUSxaECMxx4RK5y
 MrHC1Dhn2b4sQDsej82n76kYp/RVPD1H3+7ugnCS/qVwCiaN6+h17CRFn6ZUWi6t
 zHDCuP5vvBjNK3/GrhKIuVowWPwAE7dn9kj1ax/2kXEjEk1RejzlGDP8vTHQCmbk
 yw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0583j3hu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:38 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso3338936d6.0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1794859478; x=1795464278;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OoLTYMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=;
 b=VoHxj1IxpV5kzXNDW4IRh52AdWUOlr+2E349JsxlV73W2I/0efxUwPJQHpzS6GPb8r
 Ih7jCC9c2+tENZHu/UMP3w3MOK8hSW7rPl2BlebyGmT59qUntjjqsbCW7vazSHBfV3Nz
 1bunvatscjfYXvKBLjuKpplW3rshm2Mb6SkLwErEfStxznglhyzYs7jSUCMPPrvS6bZO
 pR7JeswQWB9KLXZztT8mKaK5om3+Sqsfjkr/IPQw0xTHIy8YIR0X36jEbjLyWotkhJPY
 mqsQmea6JuaChL05spm3jwa9t0UEkp3mZFyaHkEH+MWKqhGv7Lbh9nJXGqQ6BgZGvsCL
 H5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794859478; x=1795464278;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OoLTYMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=;
 b=1j167mAEpQ2cODe+BjpaQQbJh0KyI7W9OR7+27xV1MAhyRmGVDe76jrCRZRCR8VUFD
 MYjZg/CXQmxjkMQqKtTm5pZVyhn8mIPBRSVrmA37DCBPqMvKXsLPbjZxm3H6zn1TflYj
 zzgylwj5FJd4yqshmW8wV/ePupUs/PWmgFnVIUoU9ph0BwCn8+UVBc8cIKq+iyFJdq6o
 D21LPA2Ar+d8hpGQ8keZl4R//Yuef7xKMYf+KFfBY5577pVh4H+7+qcIaUZAxPtme6F0
 zl8KECgiLhP8t+g1d50u0E08gFl9sF63WTUmXh30wv1vXzDIa6aui5R3xPq4QFpOxMGL
 IDXA==
X-Forwarded-Encrypted: i=1;
 AL+hErEmr/jhLq9gjYpU8XfW17RAyDfpJ6oui5MtkWsjTlk+fkA3mibMent2183ZIZvzW4SF+kWfnZ1i9Q==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+NTA2tZMU15dJVQ5PTjA8HkhiEZW8CBKraYOjuJ/rLLHz1qltp
 I5yG7qFHXtKhFM2ewrwWyXx0yYaDUYg0Wjbwr1+wMqXj+wH/wJ041QurVpoBMRhYUbXBY9m6zcV
 2+5Dvrl0k/9AZSQlDo86//u7G8qSuwYYL2zEyciWzErXTKLWuD/qtOinIwv5iMDv1
X-Gm-Gg: AZFdTZfSgNycpO8zV+4XfyW6OoFMiTVPNFvG2tukpa1LQBLpWox6fY1JOZPEdjVQz/Z
 ayMYfkCDC4oOnbzHDmHo3Gc9M1hBxfXMYKBKBt1EG22ngqJtCkU9xCYPIvWV0gz7IQ1ws6qlqLi
 iLm8etEKd19XppDZmQh8/ut1oJFwimaKKGoDlqt6bh5O2wAcXemQnkWuCrWySvh/1sPr8KzZl+j
 XeuNIcVttZIf/w1GmZ5sIfTbV5GQ/chEPc5IuU9X+uzMkKU52gkpw4NTOC/uECweVg5wppxQ4eq
 rbEUmMeIR4jEYlZA660D4mfMgJV5SYvCtEZ8dvQY+iwiQZYviz3r75kPegpcOdfW4qsBvjKPj0u
 UOlvsfgW3Sspk9++naYXXiPHiovgm9a+F8s5pIIJt45cooEGhBjrMxb+RKmT1okRLxWDJ8DzuoT
 svAjvIcV6TLBMHM5wHi87Q
X-Received: by 2002:a05:6214:404:b0:91f:3063:6b2f with SMTP id
 6a1803df08f44-920fd34f33cmr9007536d6.17.1794859477460; 
 Mon, 16 Nov 2026 12:04:37 -0800 (PST)
X-Received: by 2002:a05:6214:404:b0:91f:3063:6b2f with SMTP id
 6a1803df08f44-920fd34f33cmr9006626d6.17.1794859476833; 
 Mon, 16 Nov 2026 12:04:36 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 12:04:34 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:50 -0500
Subject: [PATCH v2 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-uffd-state-fixes-v2-8-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Andrei Vagin <avagin@gmail.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=3477;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rmChA7WgdOrC/88AxZpfJODdWq+Xphq5oh6yqVMIGRQ=;
 b=Aq8YehfZb6/OHRe5fm5im+wKKZvGIc/GWSlOLY0dwMWs4pJkhwuqJqx9nc8S+eDs6q4djpisX
 UCoLnNhweecC9FQQb7bS+LJGWbllO0Kys1HABgExaohJoPu9hSmT0f5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: FNIIgJSiTFoZLOWfzffI0PiL9RKWWbv-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXzX9MqfRwJmFL
 QQG1/2/IlC4E2lySgiieJ5yYFBnUN97VvpGs8hWwoh3FjyPBC9FwFv/7GD9N6PzraN4X8lg7V3k
 SuzgIWDztb1DewZpOEt+vSV01a/EryLaPO/4+1qU4bTWCCTusXp0
X-Authority-Analysis: v=2.4 cv=QfjzLcbv c=1 sm=1 tr=0 ts=6afb61d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=El0B2wc1DFe8a7cR29wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: FNIIgJSiTFoZLOWfzffI0PiL9RKWWbv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX23JvxWem5rqY
 t72+ymA1sIbg5dG3Qu4lbHCL+uWOmosDN4H9CJktO2r9a7kkuVQtYcW1U/Z4OxVJufNAoFwUwyR
 m1sq3WL9CIq1Q/+N4eV3uunnQ+aO/2Gqj/LsUexQRQfpPkZDowCev4Q/Jet1bsM0+5HhyWcuQWB
 t4wxC2OMBzdBn8K7J2TkznumAv9Lqewfh4YiZ8hZ56F4j4ENUwUv0bqkkwCYj1NCArH9dFzPT7P
 GmPL3bDQ72lO6pWTtqeihRWO8g4vq5jMbdGyp93xxJFB0S/LGHyw7gUgC5H00kCkiSgYOWDYRw2
 7RtUzUtFAvoTibbn/SNSZ9Mirw3KoNjidF337XSy+6PXlQjAu36MLBFCaPTbPQw9Jn/0a6phaQh
 kyZP+13vMxCGe7DJ0cMZrhnnZGfR18YdeC/8qxAgOCJm/QSjuUzgnksbM5I/PyK9hMwULVw+pM4
 Y6EvOj1nxfdwOz+Pzlw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=10 suspectscore=0
 impostorscore=10 adultscore=0 lowpriorityscore=10 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:03:43 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device migration replaces a PTE that maps the zero page with a new PTE
that is built only from the VMA flags, so its userfaultfd WP or RWP
protection is lost. The same applies to the huge zero PMD. Writes and
accesses to the page are then no longer reported to userfaultfd.

To fix it, do not migrate a uffd-protected zero page. Skip it during
collection, and check again under the page table lock before inserting,
as another thread can protect the page after it was collected.

The alternative would be to carry the uffd state over to the new entry,
but a uffd-protected zero page in a range that a driver migrates should
be rare.

Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/migrate_device.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9e19fadfa65c..140b99f72508 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -159,7 +159,16 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
+			/*
+			 * Nothing carries the uffd state of the zero page
+			 * over, so skip it if its uffd bit is set.
+			 */
+			bool protected = userfaultfd_protected(walk->vma) &&
+					 pmd_uffd(*pmdp);
+
 			spin_unlock(ptl);
+			if (protected)
+				return migrate_vma_collect_skip(start, end, walk);
 			return migrate_vma_collect_hole(start, end, -1, walk);
 		}
 		if (pmd_write(*pmdp))
@@ -337,6 +346,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn) &&
 			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
+				/* See migrate_vma_collect_huge_pmd(). */
+				if (userfaultfd_protected(vma) && pte_uffd(pte))
+					goto next;
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
@@ -871,10 +883,14 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	if (userfaultfd_missing(vma))
 		goto unlock_abort;
 
-	if (is_huge_zero_pmd(*pmdp))
+	if (is_huge_zero_pmd(*pmdp)) {
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pmd_uffd(*pmdp))
+			goto unlock_abort;
 		flush = true;
-	else if (!pmd_none(*pmdp))
+	} else if (!pmd_none(*pmdp)) {
 		goto unlock_abort;
+	}
 
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
@@ -1074,6 +1090,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (!is_zero_pfn(pfn))
 			goto unlock_abort;
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pte_uffd(orig_pte))
+			goto unlock_abort;
 		flush = true;
 	} else if (!pte_none(orig_pte))
 		goto unlock_abort;

-- 
2.39.5

