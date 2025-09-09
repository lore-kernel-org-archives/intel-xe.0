Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12826CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 23:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFC610E280;
	Tue,  9 Sep 2025 23:54:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6D10E280;
 Tue,  9 Sep 2025 23:54:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7591308292779796634=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Return_an_err?=
 =?utf-8?q?or_code_if_the_GuC_load_fails_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 23:54:50 -0000
Message-ID: <175746209041.319567.4420862005578785196@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250909224132.536320-1-John.C.Harrison@Intel.com>
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

--===============7591308292779796634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Return an error code if the GuC load fails (rev2)
URL   : https://patchwork.freedesktop.org/series/154056/
State : success

== Summary ==

CI Bug Log - changes from xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671_BAT -> xe-pw-154056v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-154056v2_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8527 -> IGT_8528
  * Linux: xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671 -> xe-pw-154056v2

  IGT_8527: 941218ae3c7cb414b098190a8bc010954150dd1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8528: 9252073bde221857c96656b6c96749c444aa1890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671: b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671
  xe-pw-154056v2: 154056v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154056v2/index.html

--===============7591308292779796634==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Return an error code if the GuC load fails (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154056/">https://patchwork.freedesktop.org/series/154056/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154056v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154056v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671_BAT -&gt; xe-pw-154056v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154056v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8527 -&gt; IGT_8528</li>
<li>Linux: xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671 -&gt; xe-pw-154056v2</li>
</ul>
<p>IGT_8527: 941218ae3c7cb414b098190a8bc010954150dd1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8528: 9252073bde221857c96656b6c96749c444aa1890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3715-b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671: b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671<br />
  xe-pw-154056v2: 154056v2</p>

</body>
</html>

--===============7591308292779796634==--
