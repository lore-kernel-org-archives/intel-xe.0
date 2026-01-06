Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CE2CD0421
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 05:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C610E37D;
	Tue,  6 Jan 2026 05:34:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816010E37D;
 Tue,  6 Jan 2026 05:34:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2411972519546165018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_User_readable_error_codes_o?=
 =?utf-8?q?n_atomic=5Fioctl_failure_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 05:34:44 -0000
Message-ID: <176767768442.128044.1859654615154956810@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-0-d51d9a351684@intel.com>
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

--===============2411972519546165018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: User readable error codes on atomic_ioctl failure (rev6)
URL   : https://patchwork.freedesktop.org/series/152277/
State : success

== Summary ==

CI Bug Log - changes from xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04_BAT -> xe-pw-152277v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-ptl-1 

Known issues
------------

  Here are the changes found in xe-pw-152277v6_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#6922] / [Intel XE#6930]) -> [ABORT][2] ([Intel XE#6922])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04/bat-bmg-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v6/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#6922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922
  [Intel XE#6930]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930


Build changes
-------------

  * IGT: IGT_8684 -> IGT_8685
  * Linux: xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04 -> xe-pw-152277v6

  IGT_8684: 8684
  IGT_8685: 8685
  xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04: 9081abc2c80b75a0c38ba2880f867904acd13a04
  xe-pw-152277v6: 152277v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v6/index.html

--===============2411972519546165018==
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
<tr><td><b>Series:</b></td><td>User readable error codes on atomic_ioctl failure (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152277/">https://patchwork.freedesktop.org/series/152277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04_BAT -&gt; xe-pw-152277v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-ptl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152277v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930">Intel XE#6930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v6/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8684 -&gt; IGT_8685</li>
<li>Linux: xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04 -&gt; xe-pw-152277v6</li>
</ul>
<p>IGT_8684: 8684<br />
  IGT_8685: 8685<br />
  xe-4332-9081abc2c80b75a0c38ba2880f867904acd13a04: 9081abc2c80b75a0c38ba2880f867904acd13a04<br />
  xe-pw-152277v6: 152277v6</p>

</body>
</html>

--===============2411972519546165018==--
