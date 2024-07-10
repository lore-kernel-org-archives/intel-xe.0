Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98816C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 02:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5310E5CB;
	Wed, 10 Jul 2024 02:05:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B6910E5CB;
 Wed, 10 Jul 2024 02:05:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1117756925482203931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/oa/uapi=3A_Allow_OA_confi?=
 =?utf-8?q?g=27s_to_have_arbitrary_names/id=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jul 2024 02:05:06 -0000
Message-ID: <172057710600.88085.15992960510558410602@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
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

--===============1117756925482203931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa/uapi: Allow OA config's to have arbitrary names/id's
URL   : https://patchwork.freedesktop.org/series/135922/
State : success

== Summary ==

CI Bug Log - changes from xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a_BAT -> xe-pw-135922v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135922v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip:
    - {bat-lnl-1}:        [ABORT][1] ([Intel XE#1553]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - {bat-lnl-1}:        [ABORT][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - {bat-lnl-1}:        [DMESG-WARN][5] ([Intel XE#1553]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a -> xe-pw-135922v1

  IGT_7920: 7920
  xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a: 1c05c3d64de33058a86fa2c4ebb54d7c8bda573a
  xe-pw-135922v1: 135922v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/index.html

--===============1117756925482203931==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa/uapi: Allow OA config&#x27;s to have arbitrary names/id&#x27;s</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135922/">https://patchwork.freedesktop.org/series/135922/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a_BAT -&gt; xe-pw-135922v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135922v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip@a-edp1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/bat-lnl-1/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135922v1/bat-lnl-1/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a -&gt; xe-pw-135922v1</li>
</ul>
<p>IGT_7920: 7920<br />
  xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a: 1c05c3d64de33058a86fa2c4ebb54d7c8bda573a<br />
  xe-pw-135922v1: 135922v1</p>

</body>
</html>

--===============1117756925482203931==--
