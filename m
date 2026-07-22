Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA1BC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 17:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9D010EE6C;
	Wed, 22 Jul 2026 17:50:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CA510EE6C;
 Wed, 22 Jul 2026 17:50:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6614930003186211112=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/i2c=3A_alerts_and_co?=
 =?utf-8?q?ntroller_enabling_modifications_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 17:50:49 -0000
Message-ID: <178474264933.217735.10573988603951952586@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
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

--===============6614930003186211112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/i2c: alerts and controller enabling modifications (rev6)
URL   : https://patchwork.freedesktop.org/series/168930/
State : success

== Summary ==

CI Bug Log - changes from xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7_BAT -> xe-pw-168930v6_BAT
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

  Here are the changes found in xe-pw-168930v6_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_debugfs@read-all-entries:
    - bat-wcl-1:          [TIMEOUT][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7/bat-wcl-1/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/bat-wcl-1/igt@core_debugfs@read-all-entries.html

  * igt@xe_module_load@load:
    - bat-wcl-1:          [DMESG-WARN][3] ([Intel XE#8551]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#8551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551


Build changes
-------------

  * IGT: IGT_9018 -> IGT_9019
  * Linux: xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7 -> xe-pw-168930v6

  IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9019: 9019
  xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7: 766692482abf46aeeca6881abdf0d4dfb32466a7
  xe-pw-168930v6: 168930v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/index.html

--===============6614930003186211112==
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
<tr><td><b>Series:</b></td><td>drm/xe/i2c: alerts and controller enabling modifications (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168930/">https://patchwork.freedesktop.org/series/168930/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7_BAT -&gt; xe-pw-168930v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168930v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7/bat-wcl-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/bat-wcl-1/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551">Intel XE#8551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168930v6/bat-wcl-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9018 -&gt; IGT_9019</li>
<li>Linux: xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7 -&gt; xe-pw-168930v6</li>
</ul>
<p>IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9019: 9019<br />
  xe-5459-766692482abf46aeeca6881abdf0d4dfb32466a7: 766692482abf46aeeca6881abdf0d4dfb32466a7<br />
  xe-pw-168930v6: 168930v6</p>

</body>
</html>

--===============6614930003186211112==--
