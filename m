Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3820BC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 21:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E128410E165;
	Mon, 22 Jul 2024 21:26:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220E910E165;
 Mon, 22 Jul 2024 21:26:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3675499700240061048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Decalre_xe_variable_in?=
 =?utf-8?q?_xe=5Ffile=5Fclose?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 21:26:44 -0000
Message-ID: <172168360413.358367.8427955000463313240@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722203318.1608626-1-matthew.brost@intel.com>
In-Reply-To: <20240722203318.1608626-1-matthew.brost@intel.com>
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

--===============3675499700240061048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Decalre xe variable in xe_file_close
URL   : https://patchwork.freedesktop.org/series/136358/
State : success

== Summary ==

CI Bug Log - changes from xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0_BAT -> xe-pw-136358v1_BAT
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

  Here are the changes found in xe-pw-136358v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_compute@compute-square:
    - {bat-bmg-1}:        [SKIP][1] ([Intel XE#2240]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/bat-bmg-1/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/bat-bmg-1/igt@xe_compute@compute-square.html

  * igt@xe_query@query-gt-list:
    - {bat-bmg-1}:        [FAIL][3] ([Intel XE#2238]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/bat-bmg-1/igt@xe_query@query-gt-list.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/bat-bmg-1/igt@xe_query@query-gt-list.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2238
  [Intel XE#2240]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2240


Build changes
-------------

  * IGT: IGT_7933 -> IGT_7935
  * Linux: xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0 -> xe-pw-136358v1

  IGT_7933: 7933
  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0
  xe-pw-136358v1: 136358v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html

--===============3675499700240061048==
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
<tr><td><b>Series:</b></td><td>drm/xe: Decalre xe variable in xe_file_close</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136358/">https://patchwork.freedesktop.org/series/136358/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0_BAT -&gt; xe-pw-136358v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136358v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/bat-bmg-1/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2240">Intel XE#2240</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/bat-bmg-1/igt@xe_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/bat-bmg-1/igt@xe_query@query-gt-list.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2238">Intel XE#2238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/bat-bmg-1/igt@xe_query@query-gt-list.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7933 -&gt; IGT_7935</li>
<li>Linux: xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0 -&gt; xe-pw-136358v1</li>
</ul>
<p>IGT_7933: 7933<br />
  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0<br />
  xe-pw-136358v1: 136358v1</p>

</body>
</html>

--===============3675499700240061048==--
