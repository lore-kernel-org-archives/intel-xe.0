Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36567606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 18:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF10010EC3F;
	Wed, 18 Nov 2026 18:33:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AD610EC3F;
 Wed, 18 Nov 2026 18:33:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3061867941198693013=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_a_per-client_?=
 =?utf-8?q?debugfs_file_reporting_bo_NUMA_node_distribution_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 18:33:28 -0000
Message-ID: <179502680832.46043.561995994803801529@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118134203.646500-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261118134203.646500-1-thomas.hellstrom@linux.intel.com>
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

--===============3061867941198693013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution (rev5)
URL   : https://patchwork.freedesktop.org/series/177016/
State : failure

== Summary ==

CI Bug Log - changes from xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c_BAT -> xe-pw-177016v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177016v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177016v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177016v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - bat-bmg-3:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  


Build changes
-------------

  * Linux: xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c -> xe-pw-177016v5

  IGT_9197: 9197
  xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c: e7c60d65b141a5bd0916a4aecf0423496da8455c
  xe-pw-177016v5: 177016v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/index.html

--===============3061867941198693013==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177016/">https://patchwork.freedesktop.org/series/177016/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c_BAT -&gt; xe-pw-177016v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177016v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177016v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177016v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_multigpu_svm@mgpu-migration-prefetch:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c -&gt; xe-pw-177016v5</li>
</ul>
<p>IGT_9197: 9197<br />
  xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c: e7c60d65b141a5bd0916a4aecf0423496da8455c<br />
  xe-pw-177016v5: 177016v5</p>

</body>
</html>

--===============3061867941198693013==--
