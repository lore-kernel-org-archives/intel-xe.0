Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6807DCA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 06:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909510E138;
	Tue,  6 Oct 2026 06:29:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA9D10F1F5;
 Tue,  6 Oct 2026 06:29:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2679016940072460714=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Expose_HDR_status_in_debugf?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 06:29:17 -0000
Message-ID: <179126815729.242833.9818974341561035097@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006054004.285744-1-pranay.samala@intel.com>
In-Reply-To: <20261006054004.285744-1-pranay.samala@intel.com>
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

--===============2679016940072460714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose HDR status in debugfs
URL   : https://patchwork.freedesktop.org/series/175591/
State : success

== Summary ==

CI Bug Log - changes from xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5_BAT -> xe-pw-175591v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-ptl-1 

Known issues
------------

  Here are the changes found in xe-pw-175591v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175591v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5 -> xe-pw-175591v1

  IGT_9130: 9130
  xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5: 475230f9a51fc19f5097ddcbf94ebf3906d623d5
  xe-pw-175591v1: 175591v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175591v1/index.html

--===============2679016940072460714==
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
<tr><td><b>Series:</b></td><td>Expose HDR status in debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175591/">https://patchwork.freedesktop.org/series/175591/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175591v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175591v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5_BAT -&gt; xe-pw-175591v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-ptl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175591v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175591v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5 -&gt; xe-pw-175591v1</li>
</ul>
<p>IGT_9130: 9130<br />
  xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5: 475230f9a51fc19f5097ddcbf94ebf3906d623d5<br />
  xe-pw-175591v1: 175591v1</p>

</body>
</html>

--===============2679016940072460714==--
