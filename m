Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72D606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IpXx2n9+;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XBHTkLel
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4910FC20;
	Wed, 18 Nov 2026 13:04:00 +0000 (UTC)
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B651B10E475
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 20:49:16 +0000 (UTC)
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJXJEk2978967
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=pps01; bh=x1GSlTdxCDOcwaCkl039quhS7j
 O/y0dxq7PSFe5uI1Y=; b=IpXx2n9+RamcocPRGOPd8XPboIKjiztrAkZU6DcuMR
 owrO1L9jYZPfd7Bix1u2o6xBqkvtiLeQSkquPaLF4IvEnS52FWTuHflsrx6FB9/p
 /B9pEuUxFFNQmGfo8VUZUjGlIsXMKi7dBRHWAdp+W2JfP1C5b+6ic5mq0PCMhvqr
 4E+5fohvAFveb7oCnY0baP2Zj2hHvARpdMapPW47/6QRXbCKyU17S9hVOf1jPaKE
 Eb+KHBWE58OnqIkTxmTlfbP/A9yuNf0uG0wB1tQUjv5iZi7SlNyV3zJ6lB6lyAJB
 NDxqTJoECbwU0nuSRrbFAXkldL6eVYJIxY8e7Knd+nDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sa2hp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:24 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f37c94ceeso35915085a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1794859464; x=1795464264;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
 b=XBHTkLelJ1sfyO4qmJMLWfW1uwXZac/Yf9hSH9S4C/ZlUd6GJMbAQVM3TutGVZUw03
 ASGVq7juM8ueh+yBEncOwVjniYY5TXQ40wNKSQ+jzMlNY/qt2VLfg+wZGc7YkEXQCazf
 kX7Ab8txMPsV//uCNgfgZjnIV38YkvlOko/PQrDMAoG9n6FM3sSf3Tv1WCFy4DInNdXv
 kP/PTnR45ebHkQUGHvMLgcR0l3/xbTsYzgyBu+eMJFLEHl/odA7mBPBP6QPQEXMWzeMr
 re49LqkE2cYQzN3uiRZa8S6bz73YSXIAvIE0rSnrCTQlcTzhYkR3ASJlcB72iPyoR9EH
 XvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794859464; x=1795464264;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
 b=aed1TjwZy8EH7UoUiTKi/dKvnUuGEueXbYMPiXeS3H2USd1uYrQOgXRv9N1EQ/IfG9
 ooSYXypAxw3EJ+zFGXXdRpX++PqYn5Q2BObcMkSD5DBpdqE4ryd2zfjOls7P+Ghs5PZ0
 7hoWMLttll9Z9nY4KgVxeeIKF1rvY9SG2oMfLTkyYzEXDxL+idpskZq6OBVIVJjnUPmI
 c//CabLDQRTv2v1a30zOBJLXMV5PPFXnRNEUbmpRc7qPIC5avK4dI+tx5k9F+JbgLjzA
 /NL5V3X+J5dvL9lRjFTVqvSq9v4b/HfXM92sigNE3R30iPFOrgX59NHGijg7q/qB7F6M
 D/1A==
X-Forwarded-Encrypted: i=1;
 AL+hErEz9mw/dPevXUbWsRcrGULzBPfpGuooicwYuaqhYRYDXYl9+vFYUGuNa0Py+hQYeFKsNX0YesHV1A==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z83QvQKJpZnXHX8SuIM2SkdZP57+H8Cyh95KPeEXA/bEXQYaOG7
 gd7jpRS8lVTQQyeaZtiRXa5UQisTevjz4Wrmk0H8IGJuYer3EjR75ycb9xVVBdoX0XRjLdnDzSo
 w+SsM4Bflts8tc+o7UmXPjvL0z368bEQ9ggbqLw0zoQ4/lWm/grL55ZLDzB+iVij2
X-Gm-Gg: AYBFou3Blim1m+7e9jhzYXQmjm9AfP9W0ireBTmki8TSGM1Cx7g2VEKj3H//mTyVu9r
 Bi8rrshwwhwPtewZRxF7PKE7vKZjbmVSABJrUbAse1JnQAaOk8Ef5GxfwXE8glbn6GLuoxIbm49
 UYS2D2M2Rpx1MQseI8JUWDTLlo/HvxdT/nwy26CtdfKlRqh36wrCakFQE1+vYbzoqHioaCMTC4e
 NOXfF0s8C0tEU5m59bNUuyDBh18c/yGevfKc2Fs6534y9YkktQdVkDT0Gtjca28YsCwmIG7AjIh
 KEd1aYtwrgzJmn8TbvPzUFkH40NwJT7jk27FPUv9BvdNPMkT/0a9LriVVroP3X2GrDBdpzo3RhW
 unBFxugXxZnBx2+6i1+17zkJjOMhoF2Ihz1fit9a4GoXGRzyDWl9hCNjkdA8vB+4mnTKLioiW3L
 c0ljTvXoFTwx41znMr0Giy
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id
 d75a77b69052e-55d49300e66mr9489321cf.4.1794859463687; 
 Mon, 16 Nov 2026 12:04:23 -0800 (PST)
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id
 d75a77b69052e-55d49300e66mr9488661cf.4.1794859463022; 
 Mon, 16 Nov 2026 12:04:23 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 12:04:22 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/9] userfaultfd: assorted fixes (part 1)
Date: Mon, 16 Nov 2026 15:02:42 -0500
Message-Id: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJh+2oC/2WNzQ6CMBCEX4X07JpuMQU9+R6GQ6GLrFFq+kM0h
 He3oDePX2bmm1kE8kxBnIpZeJo4sBszqF0husGMVwK2mYWSSiNKDanvLYRoIkHPLwpgFSKSMq0
 91CLPnp62IK8uzZdDam/UxdWzNgYO0fn39jnh2vvpEf/1E4IEKSssbanrY6XPnbunR8tmTzaJZ
 lmWD8zFP/bFAAAA
X-Change-ID: 20261106-uffd-state-fixes-d2111e2abd48
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
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Tal Zussman <tz2294@columbia.edu>, Breno Leitao <leitao@debian.org>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=4488;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Q9vtBat7EPzKier5uhGvIcHrOmBQit4JDniJ4SvUP3U=;
 b=PuIj7+LRsMk4tLVOsesIjArbol6E2+mE6zXf9UwUvZaWh2Se6zEfg4r4N9uXEER+0YOQl25l8
 ZbFg9uq1kztBgkEFbRdYqBvvGW1Tl6vFNKqc30ZQz4B5pydamoG5nJC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX4dbeniE/9H+U
 cp7OyNtHP9DqREcIfQAdnpvgfAQgxI7lZP5nWozQqfYsMrj4FcpyHC/Of7U76R1057+23FhAfIv
 zCJ5eu2GyNaW02HyLWLb1OVjprNiYODdNLEmHbw3vU5xlJ6cDei2utwQWOFMdt4mpuclNdpCo0u
 EfPUJkIAv0nfvAn++t8cTza0dI9Dah4HYSu3HAFJbgAyjy2ZuXHbGtMs1IHqtA2FGrHva3oMg3i
 UdRH8CBO0zAR2z1QbXkBm2EDytU11zehVkJ1ItsCiXxz4xJBEIa5CIZstcI81cvL9df8WRPtkVn
 6j0tQKi7U457JOaRd6qR5QBeUq3vaeed0Vyb+mxbbbDjsk/thN6dCefbALfk3RVICvV5BFzWB/2
 LDdjJaSskEWeefukdcCplAW9KLUVtiKlLrTwGtq4oIBY3SMr6jz4HIEuA9P45gLXqlIV69rvLDV
 qJarCg1be7xxsWT6S6Q==
X-Proofpoint-ORIG-GUID: Kh2lz7Vb0QHimfY6fCCgG7ptxMXUJBBo
X-Proofpoint-GUID: Kh2lz7Vb0QHimfY6fCCgG7ptxMXUJBBo
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6afb61c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=bC-a23v3AAAA:8 a=zAoRp05x23iGVPMylqYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX58gE8PBxi2pQ
 EAa7bkncF9cuWOCPpgXZQ4ZF8LM262lyON1MglPyl3y668XCMHQudxdEd2m60E3pGjzICo5dqcS
 A2fLeCEy4Z75u08rl+tKpd3CIoE04+fNIuNcfOGvzCUwDrDYhXkK
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1011 lowpriorityscore=10
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a first batch of userfaultfd fixes, with more to come.

These were found by a mix of regular old LLM review and by having an LLM
write a TLA+ model of uffd interactions with PTE bits and other state
and seeing what issues fell out.

Most of these fix places where mm code loses uffd-wp or RWP protection
while moving or migrating an entry. Userspace then either misses writes
and accesses, or gets pages reported that nobody touched.
There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
file through a private mapping.

Patches 1-2:   UFFDIO_ZEROPAGE and UFFDIO_MOVE fixes, cc stable
Patches 3-5:   PAGEMAP_SCAN write-protect vs. migration and
               device-private entries, patch 3 cc stable
Patch 6:       UFFDIO_MOVE of the huge zero page from an RWP source
Patch 7:       mremap() losing uffd state when a move fails halfway
Patch 8:       migrate_vma losing uffd state of a zero page
Patch 9:       UFFDIO_UNREGISTER with a misaligned hugetlb end

A few of the fixes change what userspace sees:

 - UFFDIO_ZEROPAGE on a private file mapping no longer fails with
   -EEXIST where the file already has a page, on an mm that cannot use
   the zero page (patch 1)
 - UFFDIO_MOVE returns -EEXIST for any huge destination PMD, not only
   for a present THP (patch 2)
 - UFFDIO_UNREGISTER with a misaligned hugetlb end fails before
   unregistering anything (patch 9)

Patch 6 has little user impact on its own. It is included because,
together with patch 7, it allows removing clear_uffd_wp_pmd().

Patch 7 adds spurious write faults on shmem and hugetlb after mremap():
when dropping uffd protection there, change_protection() makes writable
pages that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way and lead to the same
spurious faults. This will be fixed in change_protection() in a separate
series.

Based on mm-new.

---
Changes in v2:
- Collect tags (Thanks Kiryl, Lorenzo, Gregory, Alistair!)
- Patch 2: say "softleaf entry" in the commit message, per Lorenzo
- Patch 3: add softleaf_is_writable() and softleaf_mkreadable() to
  leafops.h and rename the helpers to say softleaf, per Lorenzo
- Patch 3: add Reported-by and Closes for Breno's report, and cc stable
- Patch 4: explain in the commit message how PAGEMAP_SCAN set the uffd
  bit on writable migration entries, per Lorenzo
- Patch 5: use pmd_is_valid_softleaf() rather than open-coding it, per
  Lorenzo
- Patch 7: say "write faults" rather than "minor faults" in the commit
  message, per Kiryl
- Patch 7: trim the commit message, per Lorenzo and Gregory
- Patch 8: trim the commit message, per Gregory
- Patch 8: Cc the GPU driver maintainers and lists, per Gregory and
  Alistair
- Patch 9: use IS_ALIGNED() and a local variable for the VMA's ctx, and
  shorten the comment, per Lorenzo
- Drop the three guard region patches, per Lorenzo
- Link to v1: https://patch.msgid.link/20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu

---
Tal Zussman (9):
      userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
      userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
      fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
      mm/migrate: keep the uffd bit when restoring a writable migration entry
      fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
      mm/huge_memory: build the moved huge zero PMD from the destination VMA
      mm/mremap: resolve uffd state when the context is dropped, not during the move
      mm/migrate_device: do not migrate a uffd-protected zero page
      mm/userfaultfd: check hugetlb end alignment in UFFDIO_UNREGISTER pre-scan

 fs/proc/task_mmu.c      | 42 +++++++++++++++++++++++++++---
 include/linux/leafops.h | 51 ++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 31 +++-------------------
 mm/hugetlb.c            | 27 +------------------
 mm/migrate.c            |  2 +-
 mm/migrate_device.c     | 23 +++++++++++++++--
 mm/mremap.c             | 46 +--------------------------------
 mm/userfaultfd.c        | 69 ++++++++++++++++++++++++-------------------------
 8 files changed, 150 insertions(+), 141 deletions(-)
---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261106-uffd-state-fixes-d2111e2abd48

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

