Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72F606A324
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 03:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A510E563;
	Fri, 23 Oct 2026 03:44:42 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB510E1DE;
 Fri, 23 Oct 2026 03:44:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7042470967140655443=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Register_drm_devi?=
 =?utf-8?q?ce_at_the_end_of_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 03:44:41 -0000
Message-ID: <179272708164.59583.13888847910736947063@221881a7231d>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7042470967140655443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Register drm device at the end of probe
URL   : https://patchwork.freedesktop.org/series/176684/
State : failure

== Summary ==

CI Bug Log - changes from xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f_BAT -> xe-pw-176684v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176684v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176684v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176684v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-nvls-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-nvls-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-nvls-2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-wcl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-ptl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-wcl-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-lnl-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-3/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-adlp-7/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-adlp-7/igt@xe_module_load@load.html
    - bat-ptl-2:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-ptl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-nvls-1:         [PASS][25] -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-nvls-1/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-nvls-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][27] -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-lnl-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-lnl-2/igt@xe_module_load@load.html

  * igt@xe_sysfs_scheduler@job_timeout_ms-min-max:
    - bat-atsm-2:         [PASS][29] -> [SKIP][30] +164 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-atsm-2:         [SKIP][31] ([i915#6077]) -> [SKIP][32] +30 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-atsm-2:         [SKIP][33] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) -> [SKIP][34] +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][35] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][37] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][39] ([Intel XE#540]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][41] ([Intel XE#829] / [i915#1836]) -> [SKIP][42] +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][43] ([Intel XE#780]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_prop_blob@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][45] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][46] +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-atsm-2:         [SKIP][47] ([Intel XE#8380]) -> [SKIP][48] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-atsm-2:         [SKIP][49] ([Intel XE#8381]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - bat-atsm-2:         [SKIP][51] ([Intel XE#288]) -> [SKIP][52] +32 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - bat-atsm-2:         [SKIP][53] ([Intel XE#8376]) -> [SKIP][54] +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - bat-atsm-2:         [SKIP][55] ([Intel XE#8364]) -> [SKIP][56] +13 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-atsm-2:         [SKIP][57] ([Intel XE#8379]) -> [SKIP][58] +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         [SKIP][59] ([Intel XE#255]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         [SKIP][61] ([Intel XE#2229]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-auto:
    - bat-atsm-2:         [SKIP][63] ([Intel XE#8434]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-auto.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][65] ([Intel XE#977]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-atsm-2:         [SKIP][67] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-atsm-2:         [SKIP][69] ([Intel XE#979]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376
  [Intel XE#8379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379
  [Intel XE#8380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380
  [Intel XE#8381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381
  [Intel XE#8434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


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

--===============7042470967140655443==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Register drm device at the end of probe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176684/">https://patchwork.freedesktop.org/series/176684/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f_BAT -&gt; xe-pw-176684v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176684v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176684v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176684v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-nvls-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-nvls-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-wcl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-nvls-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-nvls-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-min-max:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html">SKIP</a> +164 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380">Intel XE#8380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381">Intel XE#8381</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379">Intel XE#8379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176684v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9159 -&gt; IGT_9160</li>
<li>Linux: xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f -&gt; xe-pw-176684v1</li>
</ul>
<p>IGT_9159: 9159<br />
  IGT_9160: 9160<br />
  xe-6001-55c6bb0b4d006ee415abe9f048014f7bcc90ae6f: 55c6bb0b4d006ee415abe9f048014f7bcc90ae6f<br />
  xe-pw-176684v1: 176684v1</p>

</body>
</html>

--===============7042470967140655443==--
