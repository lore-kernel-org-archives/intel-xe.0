Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D298C10F16
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 09:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314110FA58;
	Fri,  3 May 2024 09:22:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9395F10FA58;
 Fri,  3 May 2024 09:22:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3889696221680698303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/debugfs=3A_Get_a_runtime?=
 =?utf-8?q?=5Fpm_reference_when_setting_wedged_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 09:22:08 -0000
Message-ID: <171472812860.1870577.1209053235480848306@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503082450.268335-1-francois.dugast@intel.com>
In-Reply-To: <20240503082450.268335-1-francois.dugast@intel.com>
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

--===============3889696221680698303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Get a runtime_pm reference when setting wedged mode
URL   : https://patchwork.freedesktop.org/series/133164/
State : success

== Summary ==

CI Bug Log - changes from xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475_BAT -> xe-pw-133164v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-133164v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#616])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133164v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1772
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * Linux: xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475 -> xe-pw-133164v1

  IGT_7830: 7830
  xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475: 16c6479c823bb80c83fc7f21ca7e5a1518b29475
  xe-pw-133164v1: 133164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133164v1/index.html

--===============3889696221680698303==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Get a runtime_pm reference when setting wedged mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133164/">https://patchwork.freedesktop.org/series/133164/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475_BAT -&gt; xe-pw-133164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133164v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133164v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475 -&gt; xe-pw-133164v1</li>
</ul>
<p>IGT_7830: 7830<br />
  xe-1230-16c6479c823bb80c83fc7f21ca7e5a1518b29475: 16c6479c823bb80c83fc7f21ca7e5a1518b29475<br />
  xe-pw-133164v1: 133164v1</p>

</body>
</html>

--===============3889696221680698303==--
