Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C9606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZY/0v2+X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BF810EE4E;
	Mon, 23 Nov 2026 14:18:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8B510EE4E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 14:18:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7798561DBD;
 Mon, 23 Nov 2026 14:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024891F000E0;
 Mon, 23 Nov 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795443485;
 bh=hShN94Xvwuq2mvCbeTGEWBxptOw+k4ofZ2vwzxFByeA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZY/0v2+XxscPsE7+mB0duUP85pHLny0nZ1Stc8kvmScXtXsyJywVu0yHFSNRnRYSA
 1a6LhhNoZ652znLo6WjYUgl1nlbNQmrLvl3J+GF71d1+z0GY8SFDNFdzMgN5s/6rvs
 pFtaX0fIgcCB+qokJMMsUfj1gIkQWlnfHe/6I4TQF0jUk3GueaCsrPmkMzawuzNZWo
 ZRwyVm3AvOZtvtHMeVK9xK7/yytxosmtrHeKAZqFc4E1dhEv3yw++9gx1/2PUw1NjD
 PTFojczg6IS/7IGyb93LeONJmGcSGWEpfi1eo4pAdP+8ETCBDwy3ydE8awGCSrhEwU
 rgT+BnAsgx64g==
Message-ID: <sashiko-outbox-229384@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/hwmon: Improve mailbox power limit init
 and visibility
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261123140847.338842-3-karthik.poosa@intel.com>
References: <20261123140847.338842-1-karthik.poosa@intel.com>
 <20261123140847.338842-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:18:04 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/hwmon: inconsistent boot-limit visibility for power
  interval and label
--

commit f47de5c9c860a6b4f7079857684d0af6687419b7
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Improve mailbox power limit init and visibility

This commit initializes fixed mailbox power, energy, and time shifts
before reading boot power limits, and bases hwmon_power_max and
hwmon_power_cap visibility on the cached boot limits instead of a
separate pcode read.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8e0d295aabc88..a616b9eb62ca1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1429,7 +1429,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u=
32 attr, int channel)
>  	case hwmon_power_max:
>  	case hwmon_power_cap:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			uval =3D attr =3D=3D hwmon_power_max ? hwmon->pl1_on_boot[channel] :
> +						   hwmon->pl2_on_boot[channel];
>  		} else if (attr !=3D PL2_HWMON_ATTR) {
>  			reg =3D xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>  			if (xe_reg_is_valid(reg))

[Severity: Medium]
Should the hwmon_power_label case below in xe_hwmon_power_is_visible()
and the interval visibility check in xe_hwmon_attributes_visible() also
use pl1_on_boot[channel] and pl2_on_boot[channel] instead of calling
xe_hwmon_pcode_read_power_limit()?

Both still perform separate pcode reads:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_attributes_visible() {
	...
	if (hwmon->xe->info.has_mbx_power_limits) {
		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
	} else if (power_attr !=3D PL2_HWMON_ATTR) {
	...
}

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_power_is_visible() {
	...
	case hwmon_power_label:
		if (hwmon->xe->info.has_mbx_power_limits) {
			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
		} else {
	...
}

When a boot-time pcode read fails transiently in
xe_hwmon_get_preregistration_info(), powerN_max or powerN_cap is hidden
and xe_hwmon_pcode_set_default_power_limits() is skipped, but if the
separate pcode read in xe_hwmon_attributes_visible() or
xe_hwmon_power_is_visible() succeeds, the corresponding
powerN_max_interval, powerN_cap_interval, or powerN_label attribute is
still exposed. Conversely, if the boot read succeeds and the later pcode
read fails, the visible power limit loses its companion interval or label
attribute.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123140847.3388=
42-1-karthik.poosa@intel.com?part=3D2
