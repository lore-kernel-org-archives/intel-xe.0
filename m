Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F949C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 11:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31E610EC84;
	Tue, 22 Sep 2026 11:42:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC37710EC77;
 Tue, 22 Sep 2026 11:42:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0166557106425494159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/dp/mst=3A_fix_MST_paylo?=
 =?utf-8?q?ad_PBN_accounting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 11:42:23 -0000
Message-ID: <179007734389.192682.6606009893599977771@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922092647.2263962-1-xiaolu.xie@intel.com>
In-Reply-To: <20260922092647.2263962-1-xiaolu.xie@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0166557106425494159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp/mst: fix MST payload PBN accounting
URL   : https://patchwork.freedesktop.org/series/174698/
State : success

== Summary ==

CI Bug Log - changes from xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d_BAT -> xe-pw-174698v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174698v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#9331])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#9331])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - bat-bmg-1:          [DMESG-WARN][5] ([Intel XE#9331]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][7] ([Intel XE#9331]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d -> xe-pw-174698v1

  IGT_9107: bba540a799a5f1a3c7ddc3a2b864678241377773 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d: 0433becdcbca8f779a8d32040a26718f2442e62d
  xe-pw-174698v1: 174698v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/index.html

--===============0166557106425494159==
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
<tr><td><b>Series:</b></td><td>drm/dp/mst: fix MST payload PBN accounting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174698/">https://patchwork.freedesktop.org/series/174698/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d_BAT -&gt; xe-pw-174698v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174698v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174698v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d -&gt; xe-pw-174698v1</li>
</ul>
<p>IGT_9107: bba540a799a5f1a3c7ddc3a2b864678241377773 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5802-0433becdcbca8f779a8d32040a26718f2442e62d: 0433becdcbca8f779a8d32040a26718f2442e62d<br />
  xe-pw-174698v1: 174698v1</p>

</body>
</html>

--===============0166557106425494159==--
