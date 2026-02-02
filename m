Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C777BE73165
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 19:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8342610E2D7;
	Mon,  2 Feb 2026 19:35:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8220310E27D;
 Mon,  2 Feb 2026 19:35:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6560644359211992187=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_replace_system=5Funbound=5F?=
 =?utf-8?q?wq=2C_add_WQ=5FPERCPU_to_alloc=5Fworkqueue_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marco Crivellari" <marco.crivellari@suse.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 19:35:00 -0000
Message-ID: <177006090051.217225.11642136401093231044@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202103756.62138-1-marco.crivellari@suse.com>
In-Reply-To: <20260202103756.62138-1-marco.crivellari@suse.com>
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

--===============6560644359211992187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: replace system_unbound_wq, add WQ_PERCPU to alloc_workqueue (rev3)
URL   : https://patchwork.freedesktop.org/series/156941/
State : success

== Summary ==

CI Bug Log - changes from xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742_BAT -> xe-pw-156941v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156941v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156941v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742 -> xe-pw-156941v3

  IGT_8729: 8729
  xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742: bd5e75d9516cb1e8dbab44ca246c9239f1e83742
  xe-pw-156941v3: 156941v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156941v3/index.html

--===============6560644359211992187==
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
<tr><td><b>Series:</b></td><td>replace system_unbound_wq, add WQ_PERCPU to alloc_workqueue (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156941/">https://patchwork.freedesktop.org/series/156941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156941v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156941v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742_BAT -&gt; xe-pw-156941v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156941v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156941v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742 -&gt; xe-pw-156941v3</li>
</ul>
<p>IGT_8729: 8729<br />
  xe-4482-bd5e75d9516cb1e8dbab44ca246c9239f1e83742: bd5e75d9516cb1e8dbab44ca246c9239f1e83742<br />
  xe-pw-156941v3: 156941v3</p>

</body>
</html>

--===============6560644359211992187==--
