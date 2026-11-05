Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37576606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 07:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03DD112201;
	Thu,  5 Nov 2026 07:47:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C402112201;
 Thu,  5 Nov 2026 07:47:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3317375655594240786=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/de=3A_Work_towards?=
 =?utf-8?q?_uncore_elimination_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 07:47:34 -0000
Message-ID: <179386485417.123134.6901474693879095670@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3317375655594240786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/de: Work towards uncore elimination (rev2)
URL   : https://patchwork.freedesktop.org/series/177794/
State : success

== Summary ==

CI Bug Log - changes from xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3_BAT -> xe-pw-177794v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 15)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-177794v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][3] ([Intel XE#6566]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3 -> xe-pw-177794v2

  IGT_9177: 9177
  xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3: 39c3efaee12b7c3e5e66247abea832c1986f15e3
  xe-pw-177794v2: 177794v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/index.html

--===============3317375655594240786==
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
<tr><td><b>Series:</b></td><td>drm/i915/de: Work towards uncore elimination (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177794/">https://patchwork.freedesktop.org/series/177794/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3_BAT -&gt; xe-pw-177794v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 15)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177794v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177794v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3 -&gt; xe-pw-177794v2</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6065-39c3efaee12b7c3e5e66247abea832c1986f15e3: 39c3efaee12b7c3e5e66247abea832c1986f15e3<br />
  xe-pw-177794v2: 177794v2</p>

</body>
</html>

--===============3317375655594240786==--
