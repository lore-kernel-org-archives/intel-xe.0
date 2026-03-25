Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54884106B530
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CCC10E8D2;
	Wed, 25 Mar 2026 13:07:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566A010E8D2;
 Wed, 25 Mar 2026 13:07:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3769387317670301378=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Apply_WA=5F14026?=
 =?utf-8?q?999295_to_engine?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 13:07:40 -0000
Message-ID: <177444406032.396014.5871932732506276771@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325055116.509115-2-mallesh.koujalagi@intel.com>
In-Reply-To: <20260325055116.509115-2-mallesh.koujalagi@intel.com>
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

--===============3769387317670301378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply WA_14026999295 to engine
URL   : https://patchwork.freedesktop.org/series/163825/
State : success

== Summary ==

CI Bug Log - changes from xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe_FULL -> xe-pw-163825v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163825v1_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][1] ([Intel XE#301]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301


Build changes
-------------

  * Linux: xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe -> xe-pw-163825v1

  IGT_8824: 8824
  xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe: 14e4110238694e33cbb1e4fc54d034cd5b45f3fe
  xe-pw-163825v1: 163825v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v1/index.html

--===============3769387317670301378==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply WA_14026999295 to engine</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163825/">https://patchwork.freedesktop.org/series/163825/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe_FULL -&gt; xe-pw-163825v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163825v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank@a-edp1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe -&gt; xe-pw-163825v1</li>
</ul>
<p>IGT_8824: 8824<br />
  xe-4776-14e4110238694e33cbb1e4fc54d034cd5b45f3fe: 14e4110238694e33cbb1e4fc54d034cd5b45f3fe<br />
  xe-pw-163825v1: 163825v1</p>

</body>
</html>

--===============3769387317670301378==--
