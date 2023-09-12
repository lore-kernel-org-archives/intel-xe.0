Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B20CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 12:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057410E05A;
	Tue, 12 Sep 2023 12:07:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D0F710E05A;
 Tue, 12 Sep 2023 12:07:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 60452AADD7;
 Tue, 12 Sep 2023 12:07:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Tue, 12 Sep 2023 12:07:10 -0000
Message-ID: <169452043039.31796.8015814035474967785@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_fdinfo_memory_stats_=28rev2=29?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: fdinfo memory stats (rev2)
URL   : https://patchwork.freedesktop.org/series/123102/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70894d83e12c7def7e25d9efd1955ccbc27f5146
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Sep 12 17:22:39 2023 +0530

    drm/xe: Implement fdinfo memory stats printing
    
    Use the newly added drm_print_memory_stats helper to show memory
    utilisation of our objects in drm/driver specific fdinfo output.
    
    To collect the stats we walk the per memory regions object lists
    and accumulate object size into the respective drm_memory_stats
    categories.
    
    Objects with multiple possible placements are reported in multiple
    regions for total and shared sizes, while other categories are
    counted only for the currently active region.
    
    V2:
      - Use static initializer for mem_type - Himal/Jani
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch b4ddac861881e66a4af06531a7a72345c086bac1 drm-intel
7d7143e28 drm/xe: Add drm-client infrastructure
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

-:121: WARNING:TYPO_SPELLING: 'cant' may be misspelled - perhaps 'can't'?
#121: FILE: drivers/gpu/drm/xe/xe_drm_client.c:22:
+ * Return: pointer to client struct or NULL if cant allocate
                                                ^^^^

total: 0 errors, 2 warnings, 0 checks, 159 lines checked
16b034ae7 drm/xe: Interface xe drm client with fdinfo interface
23621e11f drm/xe: Add tracking support for bos per client
-:181: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#181: FILE: drivers/gpu/drm/xe/xe_drm_client.h:58:
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo);

-:185: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#185: FILE: drivers/gpu/drm/xe/xe_drm_client.h:62:
+static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo)

total: 0 errors, 0 warnings, 2 checks, 154 lines checked
6576b4c33 drm/xe: Record each drm client with its VM
b008bc7ec drm/xe: Track page table memory usage for client
0160e6ea7 drm/xe: Account ring buffer and context state storage
-:9: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com'
#9: 
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com

total: 1 errors, 0 warnings, 0 checks, 21 lines checked
70894d83e drm/xe: Implement fdinfo memory stats printing
-:142: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#142: FILE: drivers/gpu/drm/xe/xe_drm_client.c:179:
+	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
+

total: 0 errors, 0 warnings, 1 checks, 135 lines checked


