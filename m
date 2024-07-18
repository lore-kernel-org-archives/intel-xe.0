Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C8DC3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 08:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9CC10E5F4;
	Thu, 18 Jul 2024 08:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUxEUx7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF710E5FA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721292638; x=1752828638;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=M3aw/FcKUvJ1nEShEJal8oD+uDOuRmMlEZIdZHEBSKE=;
 b=UUxEUx7ecqNplAbpHTbrjaJz6F9EdyQFjHtFuYAaiCudKKBg0OugS5wc
 UFjfxMYKJR5Kt1NSv2/cDuj6f3FeLsUiL+QexetB+r6iBowszuV0sAokU
 MWGPNspgaBsMKUAKDbZ/+kVKAAMKCu/AKclblJQIN44I806KgDXjZcsJR
 BGPOlSD+927X8VQLq4gVJMNOI5BKE01bJfwsXQo4wbQFopBtmMzy0ClGM
 7ZvfkoGlTsPc8KUBetNOW9U8vmrd+dDBpkDOVp96T87wrCk7nzZ8HFgPh
 hFGjZ++J4Ut+JF5hhO6VI6f3iROHOn5RvFAijcngxcBxrPBV8qlcwcVok Q==;
X-CSE-ConnectionGUID: NB87AAhTQ1qxnof/PjQqpQ==
X-CSE-MsgGUID: nMfNQ6GDTGmLvNdDpLeu3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30000637"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208,217";a="30000637"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:50:38 -0700
X-CSE-ConnectionGUID: F3goYoI8S0WcijfKkyZZMA==
X-CSE-MsgGUID: iTX1KRIGR36/RETMPalWyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208,217";a="73928540"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:50:36 -0700
Content-Type: multipart/alternative;
 boundary="------------WiZankdd0pvawm7CQQ558qN0"
Message-ID: <5e3a7614-45ff-4f39-9c3b-9773e3a7f456@linux.intel.com>
Date: Thu, 18 Jul 2024 10:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/pm=3A_Add_?=
 =?UTF-8?Q?trace_for_pm_functions_=28rev3=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240717125950.9952-1-nirmoy.das@intel.com>
 <172129225808.272449.5772173783517418061@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172129225808.272449.5772173783517418061@2413ebb6fbb6>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------WiZankdd0pvawm7CQQ558qN0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/18/2024 10:44 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/pm: Add trace for pm functions (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/136186/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/index.html
>
>
>   CI Bug Log - changes from
>   xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT ->
>   xe-pw-136186v3_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-136186v3_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-136186v3_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (7 -> 7)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-136186v3_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>       o bat-lnl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>

Unrelated failure. Merged to drm-xe-next


Regards,

Nirmoy

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-136186v3_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>   * igt@kms_frontbuffer_tracking@basic:
>       o bat-adlp-7: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>
>
>         Possible fixes
>
>   * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
>       o {bat-bmg-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html>
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f ->
>     xe-pw-136186v3
>
> IGT_7929: 7929
> xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f: 
> c2610cb0857b1e68f684691f6d3e7fb110f7149f
> xe-pw-136186v3: 136186v3
>
--------------WiZankdd0pvawm7CQQ558qN0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/18/2024 10:44 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172129225808.272449.5772173783517418061@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/pm: Add trace for pm functions (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/136186/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/136186/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT -&gt;
        xe-pw-136186v3_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-136186v3_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-136186v3_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (7 -&gt; 7)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-136186v3_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
          <ul>
            <li>bat-lnl-1: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Unrelated failure. Merged to drm-xe-next <br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:172129225808.272449.5772173783517418061@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-136186v3_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>igt@kms_frontbuffer_tracking@basic:
          <ul>
            <li>bat-adlp-7: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@xe_exec_balancer@twice-virtual-userptr-rebind:
          <ul>
            <li>{bat-bmg-1}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136186v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f
          -&gt; xe-pw-136186v3</li>
      </ul>
      <p>IGT_7929: 7929<br>
        xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f:
        c2610cb0857b1e68f684691f6d3e7fb110f7149f<br>
        xe-pw-136186v3: 136186v3</p>
    </blockquote>
  </body>
</html>

--------------WiZankdd0pvawm7CQQ558qN0--
