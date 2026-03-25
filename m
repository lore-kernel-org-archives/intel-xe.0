Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C9109C05D
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 20:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986C610E7D3;
	Wed, 25 Mar 2026 20:20:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1971310E8D8;
 Wed, 25 Mar 2026 20:20:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6920306664843759256=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Panel_Replay_BW_optimizati?=
 =?utf-8?q?on_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 20:20:47 -0000
Message-ID: <177447004707.398754.3536540258305610724@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325114154.3688550-1-animesh.manna@intel.com>
In-Reply-To: <20260325114154.3688550-1-animesh.manna@intel.com>
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

--===============6920306664843759256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Panel Replay BW optimization (rev3)
URL   : https://patchwork.freedesktop.org/series/163080/
State : success

== Summary ==

CI Bug Log - changes from xe-4779-1fda996928180768f2704b8f8c816f10da433131_FULL -> xe-pw-163080v3_FULL
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

  Here are the changes found in xe-pw-163080v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2625]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4779-1fda996928180768f2704b8f8c816f10da433131/shard-lnl-8/igt@kms_psr@psr2-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v3/shard-lnl-6/igt@kms_psr@psr2-suspend.html

  
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625


Build changes
-------------

  * Linux: xe-4779-1fda996928180768f2704b8f8c816f10da433131 -> xe-pw-163080v3

  IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4779-1fda996928180768f2704b8f8c816f10da433131: 1fda996928180768f2704b8f8c816f10da433131
  xe-pw-163080v3: 163080v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v3/index.html

--===============6920306664843759256==
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
<tr><td><b>Series:</b></td><td>Panel Replay BW optimization (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163080/">https://patchwork.freedesktop.org/series/163080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4779-1fda996928180768f2704b8f8c816f10da433131_FULL -&gt; xe-pw-163080v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163080v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr2-suspend:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4779-1fda996928180768f2704b8f8c816f10da433131/shard-lnl-8/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v3/shard-lnl-6/igt@kms_psr@psr2-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4779-1fda996928180768f2704b8f8c816f10da433131 -&gt; xe-pw-163080v3</li>
</ul>
<p>IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4779-1fda996928180768f2704b8f8c816f10da433131: 1fda996928180768f2704b8f8c816f10da433131<br />
  xe-pw-163080v3: 163080v3</p>

</body>
</html>

--===============6920306664843759256==--
