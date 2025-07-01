Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1245CC8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 02:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA78510E257;
	Tue,  1 Jul 2025 02:28:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA5810E24B;
 Tue,  1 Jul 2025 02:28:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1827146422962093897=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_More_missing_XeLP_workaroun?=
 =?utf-8?q?ds_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 02:28:18 -0000
Message-ID: <175133689857.122443.14384220194329011121@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
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

--===============1827146422962093897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: More missing XeLP workarounds (rev8)
URL   : https://patchwork.freedesktop.org/series/149097/
State : success

== Summary ==

CI Bug Log - changes from xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT -> xe-pw-149097v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT and xe-pw-149097v8_BAT:

### New IGT tests (13) ###

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8431 -> IGT_8432
  * Linux: xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86 -> xe-pw-149097v8

  IGT_8431: 8431
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86: d9007d535ea106181346f9988c97aa73a9cdfb86
  xe-pw-149097v8: 149097v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v8/index.html

--===============1827146422962093897==
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
<tr><td><b>Series:</b></td><td>More missing XeLP workarounds (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149097/">https://patchwork.freedesktop.org/series/149097/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT -&gt; xe-pw-149097v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT and xe-pw-149097v8_BAT:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8431 -&gt; IGT_8432</li>
<li>Linux: xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86 -&gt; xe-pw-149097v8</li>
</ul>
<p>IGT_8431: 8431<br />
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86: d9007d535ea106181346f9988c97aa73a9cdfb86<br />
  xe-pw-149097v8: 149097v8</p>

</body>
</html>

--===============1827146422962093897==--
