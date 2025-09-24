Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14255CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565F710EA73;
	Fri, 26 Sep 2025 14:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="lOButaWq";
	dkim-atps=neutral
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 24 Sep 2025 20:38:31 UTC
Received: from bout4.ijzerbout.nl (bout4.ijzerbout.nl [91.99.166.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49AC10E7E1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1758745902; bh=Wrh6dsspcvC6+6O+0vWQ5ywniXknu8Y8mDFA1nPkS0o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lOButaWq+69/LyxDa7gl1zZCJHvYGfMWkxdnmzuSyPe4VY/bOSF/1DyZQR9asMYr2
 Uu4NJah43L31Pb9rxDAKYqOOO7Qa49H944YX3Jhc8vS0V82VHLjG9TtwE42OEZKg1w
 D+pib5rB7FDiALep9W90iuoUoF8QoFCmUA5d/I3OhqiFPGF5PKtM6mKuQ6ohWT5T33
 eQ5geFxJw9h77rZLKdLnjvJuuXAGH98CP3bgAmKPD2Gg26HuRJvbySXrTua3Kc+R6d
 N8bIAl8K+N6HBuqr8WYc683gdalQ/iRTKnUN7FDf+FO8i0hN3nUUwL+UC0IB7aNMhm
 pcQUJDHhVfYwLluczf2tLwc40P5rjBcSo6d3Vlo8VPKvTDfvfRLrcYoRV5OEjc/L6J
 Ti8RLzl/d328W53ckALxdw0SZpv3TyEazy5GT1MFBi8GpN/PrIYF7sdqrSJDEwD6PB
 xEhxelKFmD8ViSG+5FZyKpsLNZlwWNNXqkjlnS2Pzynt6tUEt9gdqGK3dcJr/XGHSE
 jnF1GNlcW1347D2RwY4kVipfz1/eFDmHhFG2jp8mQMgJCntS0sKxWlJPuweCSAGpHn
 JIcvh5XGFR7inMGBDYS0AoD+xv4WAPEsAvWKrPmU9497N1R4XVjwtkCSKIbKuKv7J6
 OKbHhkvQPKFNRKukUOe/i5N8=
Received: from [192.168.178.251] (ijzerbout.connected.by.freedominter.net
 [185.238.128.139])
 by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 6B38941332;
 Wed, 24 Sep 2025 22:31:42 +0200 (CEST)
Message-ID: <32120086-a674-422a-a434-b8bafbc3b6d9@ijzerbout.nl>
Date: Wed, 24 Sep 2025 22:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/xe/configfs: Add post context restore bb
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-4-306bddbc15da@intel.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250916-wa-bb-cmds-v5-4-306bddbc15da@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 26 Sep 2025 14:40:46 +0000
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

Op 16-09-2025 om 23:15 schreef Lucas De Marchi:
> Allow the user to specify commands to execute during a context restore.
> Currently it's possible to parse 2 types of actions:
>
> 	- cmd: the instructions are added as is to the bb
> 	- reg: just use the address and value, without worrying about
> 	  encoding the right LRI instruction. This is possibly the most
> 	  useful use case, so added a dedicated action for that.
>
> This also prepares for future BBs: mid context restore and rc6 context
> restore that can re-use the same parsing functions.
>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
> - use bin attribute to be allow multiline
> v3:
> - revert attribute back to a simple attribute rather than binary:
>    otherwise configfs only calls the callback on the file release and
>    ignores the result. With that the user can't rely on the return
>    code to know if the setting was accepted.
>
>    To still allow multiline, a method that uses just one syscall should
>    be used. In bash, echo will end up using more syscalls. This can be
>    workarounded by using heredoc, or simply writing it in C
>    (rewrote that listening to
>     https://www.youtube.com/watch?v=1S1fISh-pag, you're welcome to review
>     listening to that beauty too)
> v4: taint with TAINT_TEST (Matt Roper)
> v5: move taint to previous patch (Raag)
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 280 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 278 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> ...
> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords = 0, ret;
> +	const char *p;
> +
> +	for (p = lines; *p; p++) {
> +		const struct engine_info *info = NULL;
> +		u32 val, val2;
> +
> +		/* Also allow empty lines */
> +		p += strspn(p, " \t\n");
> +		if (!*p)
> +			break;
> +
> +		ret = parse_engine(p, " \t\n", NULL, &info);
Notice that parse_engine is calling lookup_engine_info with mask being NULL
That function is writing to *mask without checking for NULL.
-- 
Kees
