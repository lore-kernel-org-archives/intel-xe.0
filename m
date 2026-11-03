Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63227606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 13:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90588CFA;
	Tue,  3 Nov 2026 13:56:45 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BCB88CFA;
 Tue,  3 Nov 2026 13:56:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1184484972978334797=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgTUlfU0VNQVBI?=
 =?utf-8?b?T1JFX1dBSVRfNjQgKFdhXzE2MDI5MjgxOTEzKSAocmV2Mik=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 13:56:43 -0000
Message-ID: <179371420348.110810.15818841269516745033@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============1184484972978334797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev2)
URL   : https://patchwork.freedesktop.org/series/177436/
State : success

== Summary ==

CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_BAT -> xe-pw-177436v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-177436v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] ([Intel XE#3098]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3.html

  
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098


Build changes
-------------

  * Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -> xe-pw-177436v2

  IGT_9176: 9176
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17
  xe-pw-177436v2: 177436v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v2/index.html

--===============1184484972978334797==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177436/">https://patchwork.freedesktop.org/series/177436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_BAT -&gt; xe-pw-177436v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177436v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177436v2/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -&gt; xe-pw-177436v2</li>
</ul>
<p>IGT_9176: 9176<br />
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17<br />
  xe-pw-177436v2: 177436v2</p>

</body>
</html>

--===============1184484972978334797==--
