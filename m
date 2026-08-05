Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AEDC55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 07:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BAF10ED4E;
	Wed,  5 Aug 2026 07:40:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C5F10ED4B;
 Wed,  5 Aug 2026 07:40:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4519541007852567248=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/tests/gpu=5Fbuddy=3A_fi?=
 =?utf-8?q?x_interleaving_in_buffer_clearance_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 07:40:24 -0000
Message-ID: <178591562400.20166.16968107209481900768@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============4519541007852567248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/tests/gpu_buddy: fix interleaving in buffer clearance test (rev3)
URL   : https://patchwork.freedesktop.org/series/170880/
State : failure

== Summary ==

CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_BAT -> xe-pw-170880v3_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-170880v3_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170880v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170880v3_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-nvls-1:         [SKIP][1] ([Intel XE#8740]) -> [SKIP][2] +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         [SKIP][3] ([Intel XE#8740]) -> [SKIP][4] +30 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  [Intel XE#8740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740


Build changes
-------------

  * Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -> xe-pw-170880v3

  IGT_9038: 9038
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23
  xe-pw-170880v3: 170880v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/index.html

--===============4519541007852567248==
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
<tr><td><b>Series:</b></td><td>drm/tests/gpu_buddy: fix interleaving in buffer clearance test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170880/">https://patchwork.freedesktop.org/series/170880/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_BAT -&gt; xe-pw-170880v3_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-170880v3_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170880v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170880v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170880v3/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -&gt; xe-pw-170880v3</li>
</ul>
<p>IGT_9038: 9038<br />
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23<br />
  xe-pw-170880v3: 170880v3</p>

</body>
</html>

--===============4519541007852567248==--
