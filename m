Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9E0C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 20:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4B210EFAF;
	Tue, 16 Apr 2024 20:54:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672A10EFAF;
 Tue, 16 Apr 2024 20:54:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6406186858921635706=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/lnl=3A_Apply_GuC_Wa=5F130?=
 =?utf-8?q?11645652_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 20:54:33 -0000
Message-ID: <171330087315.1445679.8433129296784643815@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
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

--===============6406186858921635706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lnl: Apply GuC Wa_13011645652 (rev2)
URL   : https://patchwork.freedesktop.org/series/132334/
State : success

== Summary ==

CI Bug Log - changes from xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2_BAT -> xe-pw-132334v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132334v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - {bat-lnl-1}:        [DMESG-WARN][1] ([Intel XE#1557]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - {bat-lnl-1}:        [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1557


Build changes
-------------

  * Linux: xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2 -> xe-pw-132334v2

  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2: 9e1dee8819c751378aece2685d1846b0bc846ce2
  xe-pw-132334v2: 132334v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/index.html

--===============6406186858921635706==
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
<tr><td><b>Series:</b></td><td>drm/xe/lnl: Apply GuC Wa_13011645652 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132334/">https://patchwork.freedesktop.org/series/132334/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2_BAT -&gt; xe-pw-132334v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132334v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1557">Intel XE#1557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v2/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2 -&gt; xe-pw-132334v2</li>
</ul>
<p>IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1102-9e1dee8819c751378aece2685d1846b0bc846ce2: 9e1dee8819c751378aece2685d1846b0bc846ce2<br />
  xe-pw-132334v2: 132334v2</p>

</body>
</html>

--===============6406186858921635706==--
