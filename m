Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F60C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 00:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02210E8DE;
	Fri, 26 Jul 2024 00:03:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEDC10E8DE;
 Fri, 26 Jul 2024 00:03:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8051303764861415522=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Assert_G2H_outstanding?=
 =?utf-8?q?_when_releasing_G2H?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 00:03:04 -0000
Message-ID: <172195218432.384222.14036007502173516649@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725231801.1958038-1-matthew.brost@intel.com>
In-Reply-To: <20240725231801.1958038-1-matthew.brost@intel.com>
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

--===============8051303764861415522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Assert G2H outstanding when releasing G2H
URL   : https://patchwork.freedesktop.org/series/136540/
State : success

== Summary ==

CI Bug Log - changes from xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2_BAT -> xe-pw-136540v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136540v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-small-external:
    - {bat-bmg-1}:        [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-bmg-1/igt@xe_evict@evict-small-external.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/bat-bmg-1/igt@xe_evict@evict-small-external.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2200
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2 -> xe-pw-136540v1

  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2: 1c38b092d18ce973d9ec31a4ab097fbc344ab8f2
  xe-pw-136540v1: 136540v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/index.html

--===============8051303764861415522==
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
<tr><td><b>Series:</b></td><td>drm/xe: Assert G2H outstanding when releasing G2H</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136540/">https://patchwork.freedesktop.org/series/136540/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2_BAT -&gt; xe-pw-136540v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136540v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-small-external:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2/bat-bmg-1/igt@xe_evict@evict-small-external.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136540v1/bat-bmg-1/igt@xe_evict@evict-small-external.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2 -&gt; xe-pw-136540v1</li>
</ul>
<p>IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1668-1c38b092d18ce973d9ec31a4ab097fbc344ab8f2: 1c38b092d18ce973d9ec31a4ab097fbc344ab8f2<br />
  xe-pw-136540v1: 136540v1</p>

</body>
</html>

--===============8051303764861415522==--
