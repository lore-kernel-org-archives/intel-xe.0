Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E8E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE5A10E3D7;
	Wed, 11 Dec 2024 06:10:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B767910E3D7;
 Wed, 11 Dec 2024 06:10:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3703872790195656646=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv3=2C1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Use_non-interruptible_wait_when_moving_BO_to_system?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 06:10:16 -0000
Message-ID: <173389741674.1103366.5069739453720323597@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210161552.998242-1-nirmoy.das@intel.com>
In-Reply-To: <20241210161552.998242-1-nirmoy.das@intel.com>
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

--===============3703872790195656646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] drm/xe: Use non-interruptible wait when moving BO to system
URL   : https://patchwork.freedesktop.org/series/142360/
State : success

== Summary ==

CI Bug Log - changes from xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa_BAT -> xe-pw-142360v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

New tests
---------

  New tests have been introduced between xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa_BAT and xe-pw-142360v1_BAT:

### New IGT tests (3) ###

  * igt@xe_pat@pat-index-xehpc@blt:
    - Statuses : 1 pass(s)
    - Exec time: [4.77] s

  * igt@xe_pat@pat-index-xehpc@dw:
    - Statuses : 1 pass(s)
    - Exec time: [4.79] s

  * igt@xe_pat@pat-index-xehpc@render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-142360v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [DMESG-WARN][1] ([Intel XE#3729]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142360v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * Linux: xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa -> xe-pw-142360v1

  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa: 6966a52cb5531bf6cc785fadba160a71cd31e7aa
  xe-pw-142360v1: 142360v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142360v1/index.html

--===============3703872790195656646==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] drm/xe: Use non-interruptible wait when moving BO to system</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142360/">https://patchwork.freedesktop.org/series/142360/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142360v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142360v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa_BAT -&gt; xe-pw-142360v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa_BAT and xe-pw-142360v1_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc@blt:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@dw:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142360v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142360v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa -&gt; xe-pw-142360v1</li>
</ul>
<p>IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa: 6966a52cb5531bf6cc785fadba160a71cd31e7aa<br />
  xe-pw-142360v1: 142360v1</p>

</body>
</html>

--===============3703872790195656646==--
