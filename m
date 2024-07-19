Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AABDC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 00:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4E110E914;
	Fri, 19 Jul 2024 00:00:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CD110E914;
 Fri, 19 Jul 2024 00:00:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5176852185804208778=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Have_xe=5Fvm_and_xe=5Fexec=5Fque?=
 =?utf-8?q?ue_take_references_to_xef_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 00:00:41 -0000
Message-ID: <172134724129.287893.10431182341535703596@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
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

--===============5176852185804208778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Have xe_vm and xe_exec_queue take references to xef (rev4)
URL   : https://patchwork.freedesktop.org/series/135865/
State : failure

== Summary ==

CI Bug Log - changes from xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077_BAT -> xe-pw-135865v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135865v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135865v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135865v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-135865v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2055])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055


Build changes
-------------

  * Linux: xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077 -> xe-pw-135865v4

  IGT_7930: 7930
  xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077: 61dd3d24657f028349a46c2f60bf2d67c90e4077
  xe-pw-135865v4: 135865v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html

--===============5176852185804208778==
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
<tr><td><b>Series:</b></td><td>Have xe_vm and xe_exec_queue take references to xef (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135865/">https://patchwork.freedesktop.org/series/135865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077_BAT -&gt; xe-pw-135865v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135865v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135865v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135865v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135865v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v4/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077 -&gt; xe-pw-135865v4</li>
</ul>
<p>IGT_7930: 7930<br />
  xe-1629-61dd3d24657f028349a46c2f60bf2d67c90e4077: 61dd3d24657f028349a46c2f60bf2d67c90e4077<br />
  xe-pw-135865v4: 135865v4</p>

</body>
</html>

--===============5176852185804208778==--
