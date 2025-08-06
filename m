Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D88C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 13:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6EA10E0DA;
	Wed,  6 Aug 2025 13:54:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F5910E0DA;
 Wed,  6 Aug 2025 13:54:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6998961388254930239=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Improve_VF_provis?=
 =?utf-8?q?ion_stability_with_fault_injection_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 13:54:10 -0000
Message-ID: <175448845079.216422.9788814131347653590@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806132748.6697-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250806132748.6697-1-satyanarayana.k.v.p@intel.com>
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

--===============6998961388254930239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve VF provision stability with fault injection (rev4)
URL   : https://patchwork.freedesktop.org/series/151499/
State : success

== Summary ==

CI Bug Log - changes from xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c_BAT -> xe-pw-151499v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 9)
------------------------------

  Additional (2): bat-ptl-1 bat-ptl-2 
  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151499v4_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-modeset:
    - {bat-ptl-1}:        NOTRUN -> [SKIP][1] +46 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - {bat-ptl-1}:        NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - {bat-ptl-2}:        NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_evict@evict-beng-small:
    - {bat-ptl-2}:        NOTRUN -> [SKIP][4] +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-151499v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][6] ([Intel XE#4543]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c -> xe-pw-151499v4

  IGT_8487: 8487
  xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c: 7b7457e249a1f7db97122bc6b9384e5e2f45475c
  xe-pw-151499v4: 151499v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/index.html

--===============6998961388254930239==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve VF provision stability with fault injection (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151499/">https://patchwork.freedesktop.org/series/151499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c_BAT -&gt; xe-pw-151499v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 9)</h2>
<p>Additional (2): bat-ptl-1 bat-ptl-2 <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151499v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>{bat-ptl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>{bat-ptl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>{bat-ptl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>{bat-ptl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151499v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v4/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c -&gt; xe-pw-151499v4</li>
</ul>
<p>IGT_8487: 8487<br />
  xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c: 7b7457e249a1f7db97122bc6b9384e5e2f45475c<br />
  xe-pw-151499v4: 151499v4</p>

</body>
</html>

--===============6998961388254930239==--
