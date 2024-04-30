Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46B0C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 08:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BCB10E4CE;
	Tue, 30 Apr 2024 08:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AD0QI4QT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5CE10E4CE
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714466624; x=1746002624;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7rRZAcS7Lc6RqBf1VSqopPx/MBkh4r0nw59dhH8TVec=;
 b=AD0QI4QTMBRjwYmohtb/T81XwVlQ1Tr/DMZHY0OwPsNzOO0ThUDw/549
 BHCwfBSCcZ089/LK3PnrUFj0JgG0pTAEhBFSFKBhV9s36vAJjZ727MfN3
 4GUEKWRHaMZqQRA0gIi0eCKoTdR/cjL1YaZsVlPzGQYabt6SsKXOskBxO
 zifllJnHRaHKgeYGbmaT4+llHd6uVSUecdn8KahQwTtMgkJZcD5IsBLkx
 LY9or2wRn6lIbFLQymmW2GV2RpFQN3aMrN4XNo63uZp+46AxTC+lgT/uH
 Qa+i94LjcV4UIueCFdmd1MnG89UJLOQMq+a3jgygfLaHJEaB5ebY5nSXq Q==;
X-CSE-ConnectionGUID: h2OiGYVRR0Gd/Tm6nnGGiA==
X-CSE-MsgGUID: DJegCEKyREW6QGBrQcRF1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13941537"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="13941537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 01:43:43 -0700
X-CSE-ConnectionGUID: Hv+fexiGReiiPFvL4Acv7A==
X-CSE-MsgGUID: OQg/fWGfRhaVBjKXJJmCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26464610"
Received: from vkats-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 01:43:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 aravind.iddamsetty@linux.intel.com, michal.winiarski@intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
In-Reply-To: <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
 <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
 <Zi_qxhMrrlUc7hBz@intel.com>
 <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
Date: Tue, 30 Apr 2024 11:43:37 +0300
Message-ID: <87le4v2qbq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 29 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Apr 29, 2024 at 02:45:26PM GMT, Rodrigo Vivi wrote:
>>On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
>>> On 29/04/2024 14:52, Lucas De Marchi wrote:
>>> > On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>>> > > On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>>> > > > Hotunplugging the device seems to result in stuff like:
>>> > > >
>>> > > > kobject_add_internal failed for tile0 with -EEXIST, don't try to
>>> > > > register things with the same name in the same directory.
>>> > > >
>>> > > > We only remove the sysfs as part of drmm, however that is tied to=
 the
>>> > > > lifetime of the driver instance and not the device underneath. At=
tempt
>>> > > > to fix by using devm for all of the remaining sysfs stuff related=
 to the
>>> > > > device.
>>> > >
>>> > > hmmm... so basically we should use the drmm only for the global mod=
ule
>>> > > stuff and the devm for things that are per device?
>>> >
>>> > that doesn't make much sense. drmm is supposed to run when the driver
>>> > unbinds from the device... basically when all refcounts are gone with
>>> > drm_dev_put().=C2=A0 Are we keeping a ref we shouldn't?
>>>
>>> It's run when all refcounts are dropped for that particular drm_device,=
 but
>>> that is separate from the physical device underneath (struct device). F=
or
>>> example if something has an open driver fd the drmm release action is n=
ot
>>> going to be called until after that is also closed. But in the meantime=
 we
>>> might have already removed the pci device and re-attached it to a newly
>>> allocated drm_device/xe_driver instance, like with hotunplug.
>>>
>>> For example, currently we don't even call basic stuff like guc_fini() e=
tc.
>>> when removing the pci device, but rather when the drm_device is release=
d,
>>> which sounds quite broken.
>>>
>>> So roughly drmm is for drm_device software level stuff and devm is for =
stuff
>>> that needs to happen when removing the device. See also the doc for drm=
m:
>>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_ma=
naged.c#L23
>>>
>>> Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug
>
> yeah... I think you convinced me

You've all also convinced me this is a PITA to get right for every
contribution. If there's one thing I've learned, people will just cargo
cult this stuff, and pick one or the other depending on what they happen
to see. Needs vigilant review.

BR,
Jani.


>
>>
>>Cc: Aravind and Michal since this likely relates to the FLR discussion...
>>
>>but it looks to me that we should move more towards the devm_ and limit
>>the usage of drmm_ to some very specific cases...
>
> agreed,
>
> Lucas De Marchi
>
>>
>>>
>>> >
>>> > Lucas De Marchi

--=20
Jani Nikula, Intel
