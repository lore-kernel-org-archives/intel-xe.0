Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2614C2BA15
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 11:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B51F10E117;
	Tue, 18 Jun 2024 11:35:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BF310E117;
 Tue, 18 Jun 2024 11:35:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4872298405084254646=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Use_ttm=5Funcached_for?=
 =?utf-8?q?_BO_with_NEEDS=5FUC_flag_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 11:35:45 -0000
Message-ID: <171871054579.103379.9406133499403683961@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618104947.729-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240618104947.729-1-michal.wajdeczko@intel.com>
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

--===============4872298405084254646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use ttm_uncached for BO with NEEDS_UC flag (rev2)
URL   : https://patchwork.freedesktop.org/series/134580/
State : failure

== Summary ==

CI Bug Log - changes from xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165_BAT -> xe-pw-134580v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134580v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134580v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134580v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  
Known issues
------------

  Here are the changes found in xe-pw-134580v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] ([Intel XE#1553])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1553])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553


Build changes
-------------

  * Linux: xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165 -> xe-pw-134580v2

  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165
  xe-pw-134580v2: 134580v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/index.html

--===============4872298405084254646==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use ttm_uncached for BO with NEEDS_UC flag (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134580/">https://patchwork.freedesktop.org/series/134580/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165_BAT -&gt; xe-pw-134580v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134580v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134580v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134580v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134580v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165 -&gt; xe-pw-134580v2</li>
</ul>
<p>IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165<br />
  xe-pw-134580v2: 134580v2</p>

</body>
</html>

--===============4872298405084254646==--
