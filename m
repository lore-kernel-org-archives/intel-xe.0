Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86671F436B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 14:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2611A10E032;
	Fri, 17 Apr 2026 14:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKiOAPGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48C010E032
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776437469; x=1807973469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=19M3ojyonNyu+FA3oaoIe7Z9ZZcfct3DbWhKuTeNQCE=;
 b=bKiOAPGf0fzkX/XX4l/uZkEmAyOrFux0zTLHgIVbrb7A+IKrBeGFxt6i
 8VgFE73+PFUBAl++vTFC5y2zO9x9IK5ibVTGElfoHBAjXalturFOpeqc9
 nz3XNBZkJC3MYK5kfrYfdxAya1YpkGTfLtxyK481VnhUo2OwMXYuFix/Q
 P1iy9s75jwFbuDd+PA8mJDy1Sat6RYxr15wxk4NCpWM8xnKu6UVgGln8J
 G+T76ZaXgskQ54/QthQm4AMJzKA2MKBZ/ZZqLqHn3v/wfd8rrKwhP/IuI
 xHFoSo79ZL61MMAN7LPlJicTlvH99pgE2gPqaKzF2CurieR3sl8urffn3 A==;
X-CSE-ConnectionGUID: fms4prr2RPKy1BXMVp0vwQ==
X-CSE-MsgGUID: iTFWPW4fSCGdKA5z/0fAVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77462180"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77462180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 07:51:09 -0700
X-CSE-ConnectionGUID: Tw4tfKumSNmd8U7QHo/z9A==
X-CSE-MsgGUID: acAVB42uS5qtGizgGay4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230934665"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 07:51:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:51:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 07:51:07 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwlRGzCQGnerZhTNrrFT5+IsJFGM8LkM+Z+ewt5lweAyMtlNukw2F/adVWGBNb3m+Zpi5mS4x94yEox1HEIony6Vcl4wL7K0ZzmEQ58Wc77n3Wy1sbIvE9fyCtga6h+myDrmvcliBLpCgeJ4/wp7f7VbHlUxi1Nf91/zkICbsMQaVR4vihgsud4EQHczJjaWcaJt9tRZhzG0aNf5I6vbQo7ZkQ/Cvv1YMUNOU4f/uDcWkTLs+rmr4ugmp7AU7N1R/tTArvshQLyDq7FKinuT62jqTKkMFwNdJv4V22DQBJHiHpOuwWzs3WO/VKBsR3sjsDS/K+g6hxPO5IvhoHtN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhNqo6PftL/h1FK2Qlm75hS+mQFPWuFkCQaXaiotZC0=;
 b=eUN8nnjm9ZHI4mhEivVlH6XPMc3J4Pn2vZTOMbrwOFghbE4nCebSiFURA0TZwEHYBP0Qm7o1c88/30CtbCdQvYVzzz0tw+aETcBq6vzDssCOq5B4MytpIAEFKPBGfbzv0fm4QLNUkIFvkiC5U/eLWM3nSVq+N709IYbVAiieOz+W/Px3mXhgKEt7KclLwl1z0yVWuptCwv4YiXKglYKUbfeHz7T7MYmCP0xIQp0bdIeBSBDNE+DWDDDfsp1grxY13z4ongeI7Y1OlKpRhm0KoignZ125km8xGfSOIGRd8PanPZghNdB2SU4BjCWW9ZeDMjak0M+/5aJqIGXsKbQ13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:51:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:51:05 +0000
Date: Fri, 17 Apr 2026 10:51:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aeJI1WrAr33degB-@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 549a28bc-4eb7-4435-bb56-08de9c90c053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jDoSjxaUeMufsp7rKiKHJxficaQ9ngP1VxwaLZHAqio7kU/9g6FU30rdnImDD3pep9cIO9wZ/2+nHV0cCuaw6SaKornsa6AtKBJFnQsyX25lnLHwno7KmWnf21tenUvhWJccZ/+J0GNp3RgF84S1AeQkQ2V88rMFxdfpCaAEiMmoiCdqbqyDnQfhy57UqxJcus3NQTZuXJslei1wDlfKd6ixzR6XGJkWfB3TaZ/sdAOqSzFSp+Z17srOcYnSOmLC/8VgU066ByrAmwee+02bu3BF+4dfOzBm9ACFwNtgeWHF7wNBvNPgEUl0rWHBw8qCrIV35iXKPvOZgEw7LkEJXIvJZQF0ZEG2yRxbMQEFsneRysPgh8yyESJrjeJ9Vv0I/SuT0WdUruTaG383gm3/j9oTt6mm+e7LpY5ADeFxE55p0p6bzIrRSXIearwZFZbsgeg16BBx62ELz7BwDKm7u66CXBn3P62OScthGT6+Jptn3UksaWU/vdIAUwqtcTHYlBKcMjYW3uzLGoH9l76sPuGBMFtXRp6NwOWydwfsxt9vwYngpTSl4s7/1Lhq9vxGh8LuwpiqdyNUNez2L9ZKRl6AxrUq3y3j3QSD1aPM6uAdXRd+FI7HIAx8mnQgufKOm1aTnqNFDQHrRVFWU8Y4aEBmHv6tvQJZ+kOmP0n0W+MFnkmpvsQiDotyHoeB7nunJ7sGYJrJWT3KUH/9X2/kGDdcbh+a0iFNKo1SypwH5Ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18096099003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dn3Uv6k/XMvV6exKShmUeRdtrocG1RYjAniEUG/fWwSaNUAsjSL90PNeDyaS?=
 =?us-ascii?Q?d/eUkjMs+TRcjWKA0h+557ZrWPbQNc5dAKfxJX8yi4EscB23zcUDzXlYf8vt?=
 =?us-ascii?Q?GmO9glUjXhROLK8NRQu1Lauivz6HSoqWjnRjhB3eF4FuSgE+EYrv03W67ouE?=
 =?us-ascii?Q?j9hSQknor5RGqSvYlZJlpdK2ejlMUx1irxzY1FylGpUF3EYm+BMcCQLLmZfI?=
 =?us-ascii?Q?0fYiRVkImEL6Zy/pvPX6Noxb2geLqX/mtSy6zzej5e78MchHMFr3bvpnyjrb?=
 =?us-ascii?Q?W/sgQlbRykHDrmVzmgcZEIlASJNk43nladf+sUzmHiyn2ncsuphAijeNnTDA?=
 =?us-ascii?Q?gUjmetic0glUBjSbMT9g+XyH0bj8PIAj/YSdeOYUrWulphnSDlMLH+jm9ibV?=
 =?us-ascii?Q?mMnthIqINnyW5wqa+QdsL5CrlY08Emzzm0DNDzkY5dxgfVULZiySHEpC5Rnx?=
 =?us-ascii?Q?wP7ZLu//6ChohVcfiW3R+7QKygYmqmdPk5n2g00xmzBrJMCTSPdpjtBIMtW2?=
 =?us-ascii?Q?eUGo768lj5ZyNQoubwlZyJRsQ4mrPtx788vzeS6AMDF2v1HVJ9LqsuaSt6H9?=
 =?us-ascii?Q?Cs/pye98l4f6WczYKsHwv+pyMRnAqi/9H/kckit9N6gK9C0qXQ61C+9Q1LXO?=
 =?us-ascii?Q?gVQubyRrvLmvLJxWhXGxtK4NCdD5owyhwdqBnU7XA3/ZhAxroQTnLAk2Y86f?=
 =?us-ascii?Q?jYL3FQD78csCMyCU1vtJGL2pwl/SEsanhCatiP1ZE65MyZmZ9Pj0Iu4wYSha?=
 =?us-ascii?Q?lTHEIGukUAQIn1UijO5qjHjPm1z5fW9ltYnnS+RLY6/p9LkuoAa/LKIX4FyT?=
 =?us-ascii?Q?/N9V72s+w/nSXCs3YtYYfVEHtl/Yn+naY27y4udvLJ14CNb7i+gcUv+JMr1G?=
 =?us-ascii?Q?Xh2f+smxO58ka3lzSq4TE0nKgNNS19Eo8TLVdQWznL9TyKutsG8zb99YVKOM?=
 =?us-ascii?Q?Dn6Fu0ZCl6hpR8f7skGgHRvqr7UWDryw0u0t0IO8b6cHh3JOsbKfbacabOzv?=
 =?us-ascii?Q?L3At9epF5SbYgP6bCbJduWu4FClKyuAJQve8UB77k9Oa/W322RxudSLzdhIA?=
 =?us-ascii?Q?YYesBOqvLWb0mMeALP80qUQWoH/SFX4cP81/S/yGr0wzfSOTYNamyAMujMWO?=
 =?us-ascii?Q?hZvZG9YFj8U5dIKR7yS6bHaqB+/QYezoH+iMr5MGWHblGXGvMhK+MJjwkpzb?=
 =?us-ascii?Q?8OJL1hbmTKwwEJxptelH631qD2JBu0iswRjB53eb3xjOgQbHtBIRBsCbU99C?=
 =?us-ascii?Q?eL3X6LQ+lztmhmm7K6GbTBFy1RMA4ymWadfu1mlhGz7k2cEpEQ7O6WPFsLns?=
 =?us-ascii?Q?dFpS9cWQ0aWw3FRjPV1uMemrGDP3ljis87+wIZowFR+qg5i2U5GFSwTZv7uQ?=
 =?us-ascii?Q?Dgb28yCmx6sy8NfuLqzRV2xsqydXv3IrQkILv6XjfWLaxYR2K8KZbcAJbOq6?=
 =?us-ascii?Q?S2+FADAqx9EbM4InAibSCWYMYZ8c8svNzV//Nn5qVw7s1eGgUQqEYJAiESmS?=
 =?us-ascii?Q?/oPkatnf4HrzYs4gYMghUhJF99NyMLsBMfNN1YQ/2TIFO6xf605NHlyHCt+g?=
 =?us-ascii?Q?ytfIuU32LyAj4RhtL5Xmsuc+ticP1abTuslyHEQYEpBgDfTDMzM2dcCzCBbr?=
 =?us-ascii?Q?zv17W83p3VmlqXH5xP17l3PPDzlbYkMnWFb6hf/wnP2U+DFzrwYVUZaTL5h7?=
 =?us-ascii?Q?hw22TvKEf43Dqlwewn5GNWLpBicj2zFmY5SJ35z46/zpnCYMvahIb6UjhRLA?=
 =?us-ascii?Q?715mj/3vZg=3D=3D?=
X-Exchange-RoutingPolicyChecked: MzqL7UgWiLCW8VVYVkGf+edE+BLTnjUGqCAmoARypP6dVC52XUH2ZZzzfbFvC0kiAtT3chgAdgExlj/TKyM+KzNokFwVry09kC8kugWiAc7gGunUTbsfz1T4mpFxNWE6F5hTq5l1TilsUYXl2EJtQMMfe96QQUJrPK/8bD7eBXygDm0JHrngA25iK5gOB/FdMbvc7b/JI/WWL/eYYsGlSoo1hN076sDWKrN4vejN0zwy5iQnfckkHgcuWw6EdoTPxISgsNhxbClFi2Rkd1eCen3m8YjhEGJx71X4npGK62Vl9D/aDFUIqxR3boR5Ea/lpOYo/Gvr21Yalk9XKQpxvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 549a28bc-4eb7-4435-bb56-08de9c90c053
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:51:05.1605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +H3iFsxpp+d1yzXzCCmhAJ1cpndpQ4tlMVsPiH0GNZILbSZ2vAcglPttZ7O4QuETlIhojumxBTssgdRpbXennQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
X-OriginatorOrg: intel.com
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

On Thu, Apr 16, 2026 at 01:54:18PM +0200, Andi Shyti wrote:
> Hi Soham,
> 
> On Thu, Apr 16, 2026 at 03:06:10PM +0530, Soham Purkait wrote:
> > GPU health indicator exposes a single sysfs interface, gpu_health,
> > at the device level, allowing administrators and management tools to
> > query the GPU health status. The interface permits both read and write
> > operations on PF and native functions, while on VFs it is exposed as
> > read-only.
> 
> Can you describe better the interfaces? The input and output
> values?
> 
> > v1:
> >  - gpu_health is read-write on PFs and native functions. It is read-only
> >    on VFs. VF write attempts are rejected.
> 
> Are you adding a changelog for V1?
> 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> 
> ...
> 
> > +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
> > +static const char * const gpu_health_fmt[] = {
> > +	"[%s] %s %s\n",
> > +	"%s [%s] %s\n",
> > +	"%s %s [%s]\n",
> > +};
> 
> Please, don't use complex sentences in sysfs outputs. Use a
> single string/character/value

I like this one better. So we don't need to have an uAPI entry to define
the meaning of 0, 1, 2.

Regarding the sysfs rules, as long as it is one entry per sysfs we should
be compliant with the rule. So, we should be good here.

This style is consistent with the style used in /sys/power/ entries for instance:

$ cat /sys/power/mem_sleep
[s2idle] deep

$ cat /sys/power/state
freeze mem disk

on everything else I agree with Andi.

> 
> ...
> 
> > +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct xe_device *xe = kdev_to_xe_device(dev);
> > +	struct xe_sysctrl_mailbox_command command = {0};
> > +	struct xe_ras_health_get_response response = {0};
> > +	struct xe_ras_health_get_input request = {0};
> > +	u8 health;
> > +	int ret;
> > +	size_t rlen = 0;
> > +
> > +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, &request,
> > +				sizeof(request), &response, sizeof(response));
> > +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > +	if (ret) {
> > +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> > +		return -EIO;
> 
> why not return ret? (same goes for the rest of the function and
> the store() function).
> 
> > +	}
> > +	if (rlen != sizeof(response)) {
> > +		xe_err(xe,
> > +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> > +		       rlen, sizeof(response));
> > +		return -EIO;
> > +	}
> > +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> > +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> > +		       response.current_health);
> > +		return -EIO;
> > +	}
> 
> ...
> 
> > +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> > +				const char *buf, size_t count)
> > +{
> 
> ...
> 
> > +	if (IS_SRIOV_VF(xe)) {
> > +		xe_dbg(xe, "[RAS]: GPU health state update rejected on VF\n");
> > +		return -EPERM;
> > +	}
> 
> This is redundant as this function wouldn't be used for sriov.
> 
> > +	state = sysfs_match_string(gpu_health_states,
> > +				   buf);
> > +	if (state < 0)
> > +		return -EINVAL;
> > +
> > +	request.new_health = (xe_ras_health_status_t)state;
> > +
> > +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, &request,
> > +				sizeof(request), &response, sizeof(response));
> > +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > +	if (ret) {
> > +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> > +		return -EIO;
> > +	}
> > +	if (rlen != sizeof(response)) {
> > +		xe_err(xe,
> > +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> > +		       rlen, sizeof(response));
> > +		return -EIO;
> > +	}
> > +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> > +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> > +		       response.current_health);
> > +		return -EIO;
> > +	}
> > +
> > +	health = response.current_health;
> > +
> > +	xe_dbg(xe, "[RAS]: current GPU health state=%d (%s)\n",
> > +	       health, gpu_health_states[health]);
> > +
> 
> BTW, why do we need the field response.operation_status that is
> not used at all here?
> 
> > +	return count;
> > +}
> > +
> > +static struct device_attribute dev_attr_gpu_health_rw =
> > +	__ATTR_RW_MODE(gpu_health, 0600);
> > +
> > +static struct device_attribute dev_attr_gpu_health_ro =
> > +	__ATTR_RO_MODE(gpu_health, 0400);
> > +
> > +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
> > +{
> > +	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
> > +}
> 
> ...
> 
> > +static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
> > +{
> > +	struct device *dev = xe->drm.dev;
> > +	int err;
> > +
> > +	err = device_create_file(dev, gpu_health_attr(xe));
> > +	if (err)
> > +		goto err;
> 
> Please, don't use goto this way. If you need only one log out of
> the outcome of this function, print it in _init(): make this
> an int function, return err and check err in the calling
> function.
> 
> Andi
> 
> > +
> > +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> > +	if (err)
> > +		goto err;
> > +
> > +	return;
> > +
> > +err:
> > +	xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", err);
> > +}
> > +
> > +/**
> > + * xe_ras_init - Initialize Xe RAS
> > + * @xe: xe device instance
> > + *
> > + * Initialize Xe RAS
> > + */
> > +void xe_ras_init(struct xe_device *xe)
> > +{
> > +	if (!xe->info.has_sysctrl)
> > +		return;
> > +
> > +	gpu_health_indicator_sysfs_init(xe);
> > +}
