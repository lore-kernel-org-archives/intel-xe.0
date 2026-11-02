Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3E606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81410E5F2;
	Mon,  2 Nov 2026 10:06:05 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1710E5D3;
 Mon,  2 Nov 2026 10:06:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0622082315931836261=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/ras=3A_Distinguish_b?=
 =?utf-8?q?etween_detailed_and_aggregate_counters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 10:06:05 -0000
Message-ID: <179361396569.101614.3331296144615523641@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102090424.987843-1-raag.jadav@intel.com>
In-Reply-To: <20261102090424.987843-1-raag.jadav@intel.com>
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

--===============0622082315931836261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ras: Distinguish between detailed and aggregate counters
URL   : https://patchwork.freedesktop.org/series/177428/
State : failure

== Summary ==

CI Bug Log - changes from xe-6040-abc364961b361ab626fa5a09568b22744f1e0393_BAT -> xe-pw-177428v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-177428v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177428v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177428v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - bat-ptl-1:          [FAIL][1] ([Intel XE#9694]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6040-abc364961b361ab626fa5a09568b22744f1e0393/bat-ptl-1/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/bat-ptl-1/igt@runner@aborted.html
    - bat-ptl-2:          [FAIL][3] ([Intel XE#9694]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6040-abc364961b361ab626fa5a09568b22744f1e0393/bat-ptl-2/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/bat-ptl-2/igt@runner@aborted.html

  
  [Intel XE#9694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694


Build changes
-------------

  * Linux: xe-6040-abc364961b361ab626fa5a09568b22744f1e0393 -> xe-pw-177428v1

  IGT_9173: 9173
  xe-6040-abc364961b361ab626fa5a09568b22744f1e0393: abc364961b361ab626fa5a09568b22744f1e0393
  xe-pw-177428v1: 177428v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/index.html

--===============0622082315931836261==
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
<tr><td><b>Series:</b></td><td>drm/xe/ras: Distinguish between detailed and aggregate counters</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177428/">https://patchwork.freedesktop.org/series/177428/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6040-abc364961b361ab626fa5a09568b22744f1e0393_BAT -&gt; xe-pw-177428v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-177428v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177428v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177428v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6040-abc364961b361ab626fa5a09568b22744f1e0393/bat-ptl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694">Intel XE#9694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/bat-ptl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6040-abc364961b361ab626fa5a09568b22744f1e0393/bat-ptl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694">Intel XE#9694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177428v1/bat-ptl-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6040-abc364961b361ab626fa5a09568b22744f1e0393 -&gt; xe-pw-177428v1</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6040-abc364961b361ab626fa5a09568b22744f1e0393: abc364961b361ab626fa5a09568b22744f1e0393<br />
  xe-pw-177428v1: 177428v1</p>

</body>
</html>

--===============0622082315931836261==--
