Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A0606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1910E135;
	Sat, 21 Nov 2026 02:48:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F49210E135;
 Sat, 21 Nov 2026 02:48:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7762188071195723437=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Cleanup_OA_stream_on_PCI_un?=
 =?utf-8?q?bind/remove_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Nov 2026 02:48:05 -0000
Message-ID: <179522928544.62965.8196943013656192521@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

--===============7762188071195723437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup OA stream on PCI unbind/remove (rev9)
URL   : https://patchwork.freedesktop.org/series/177300/
State : failure

== Summary ==

CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_BAT -> xe-pw-177300v9_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177300v9_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177300v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177300v9_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - bat-bmg-3:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/bat-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/bat-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  


Build changes
-------------

  * Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -> xe-pw-177300v9

  IGT_9201: 9201
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0
  xe-pw-177300v9: 177300v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html

--===============7762188071195723437==
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
<tr><td><b>Series:</b></td><td>Cleanup OA stream on PCI unbind/remove (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177300/">https://patchwork.freedesktop.org/series/177300/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_BAT -&gt; xe-pw-177300v9_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177300v9_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177300v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177300v9_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_multigpu_svm@mgpu-coherency-basic:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/bat-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/bat-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -&gt; xe-pw-177300v9</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0<br />
  xe-pw-177300v9: 177300v9</p>

</body>
</html>

--===============7762188071195723437==--
