Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925C606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1111299D;
	Fri, 23 Oct 2026 05:31:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FDA112991;
 Fri, 23 Oct 2026 05:31:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7714731086390390290=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Register_drm_dev?=
 =?utf-8?q?ice_at_the_end_of_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 05:31:02 -0000
Message-ID: <179273346213.60154.5108472381671226447@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023030446.337222-1-raag.jadav@intel.com>
In-Reply-To: <20261023030446.337222-1-raag.jadav@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7714731086390390290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Register drm device at the end of probe
URL   : https://patchwork.freedesktop.org/series/176684/
State : failure

== Summary ==

CI Bug Log - changes from xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f_FULL -> xe-pw-176684v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176684v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176684v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176684v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) -> ([DMESG-FAIL][26], [DMESG-FAIL][27], [DMESG-FAIL][28], [DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-8/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-1/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-8/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-4/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-1/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-8/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-4/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-1/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-2/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-2/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-5/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75]) -> ([ABORT][76], [ABORT][77], [ABORT][78], [ABORT][79], [ABORT][80], [ABORT][81], [ABORT][82])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-3/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-10/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-2/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-4/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-3/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-4/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-1/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-9/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-9/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-5/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-10/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-10/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-2/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-6/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-5/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-5/igt@xe_module_load@load.html
    - shard-ptl:          ([PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107]) -> ([DMESG-FAIL][108], [DMESG-FAIL][109], [DMESG-FAIL][110], [DMESG-FAIL][111], [DMESG-FAIL][112], [DMESG-FAIL][113], [DMESG-FAIL][114], [DMESG-FAIL][115], [DMESG-FAIL][116], [DMESG-FAIL][117], [DMESG-FAIL][118], [DMESG-FAIL][119], [DMESG-FAIL][120], [DMESG-FAIL][121], [DMESG-FAIL][122], [DMESG-FAIL][123], [DMESG-FAIL][124], [DMESG-FAIL][125], [DMESG-FAIL][126], [DMESG-FAIL][127], [DMESG-FAIL][128], [DMESG-FAIL][129], [DMESG-FAIL][130], [DMESG-FAIL][131])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-3/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-3/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-6/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-6/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-2/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-2/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-7/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_9159 -> IGT_9160
  * Linux: xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f -> xe-pw-176684v1

  IGT_9159: 9159
  IGT_9160: 9160
  xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f: 55c6bb0b4d006ee415abe9f048014f7bcc90ae6f
  xe-pw-176684v1: 176684v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/index.html

--===============7714731086390390290==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Register drm device at the end of pr=
obe</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176684/">https://patchwork.freedesktop.org/series/176684/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176684v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6001-55c6bb0b4d006ee415abe9f048014f7bc=
c90ae6f_FULL -&gt; xe-pw-176684v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176684v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-176684v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1766=
84v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90=
ae6f/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7b=
cc90ae6f/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f04801=
4f7bcc90ae6f/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f0=
48014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415ab=
e9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee4=
15abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d00=
6ee415abe9f048014f7bcc90ae6f/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b=
4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6=
bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-=
55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6=
001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-1/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-176684v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v=
1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1766=
84v1/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-8/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-176684v1/shard-lnl-4/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76684v1/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-4/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176684v1/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ln=
l-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-176684v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard=
-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-2/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-176684v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/sh=
ard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-lnl-5/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-176684v1/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1=
/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6=
f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc9=
0ae6f/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7=
bcc90ae6f/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f0480=
14f7bcc90ae6f/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe=
9f048014f7bcc90ae6f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee41=
5abe9f048014f7bcc90ae6f/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006=
ee415abe9f048014f7bcc90ae6f/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4=
d006ee415abe9f048014f7bcc90ae6f/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6b=
b0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-5=
5c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-60=
01-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6=
f/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-8/igt@xe_m=
odule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-176684v1/shard-bmg-10/igt@xe_module_load@load.html">ABORT<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/sh=
ard-bmg-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-2/igt@xe_module_load@=
load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-176684v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-bmg-5/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-176684v1/shard-bmg-5/igt@xe_module_load@load.html">A=
BORT</a>)</li>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-p=
tl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sha=
rd-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f=
/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90=
ae6f/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7b=
cc90ae6f/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f04801=
4f7bcc90ae6f/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f0=
48014f7bcc90ae6f/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415ab=
e9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee4=
15abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d00=
6ee415abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b=
4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6=
bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-=
55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6=
001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-ptl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/shard-=
ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/sh=
ard-ptl-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-3/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-176684v1/shard-ptl-3/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v=
1/shard-ptl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-6/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176684v1/shard-ptl-6/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1766=
84v1/shard-ptl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-8/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-176684v1/shard-ptl-8/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76684v1/shard-ptl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-1/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-1/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-176684v1/shard-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-5=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-5/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176684v1/shard-ptl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-pt=
l-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-4/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-176684v1/shard-ptl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard=
-ptl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-2/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-176684v1/shard-ptl-2/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/sh=
ard-ptl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/shard-ptl-7/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-176684v1/shard-ptl-7/igt@xe_module_load@load.html">DMESG-FA=
IL</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9159 -&gt; IGT_9160</li>
<li>Linux: xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f -&gt; xe-pw-176=
684v1</li>
</ul>
<p>IGT_9159: 9159<br />
  IGT_9160: 9160<br />
  xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f: 55c6bb0b4d006ee415abe9f=
048014f7bcc90ae6f<br />
  xe-pw-176684v1: 176684v1</p>

</body>
</html>

--===============7714731086390390290==--
