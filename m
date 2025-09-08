Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645ADCAC585
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 16:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F71F10E578;
	Mon,  8 Sep 2025 16:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgggkdiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1910E578
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757350767; x=1788886767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/e7463d8R0BLYuGM0cDvLAhrq82xxVPoAIFZ63xELoo=;
 b=CgggkdiWmBqdQjuqTpMmkIWr+WMGg8ct9VSlozofoEy6GBaxytBEuZyq
 mQ7ecGAOiv13LHL/yb8km/6h83OJl0faYZQ3jw8rgwDDcR2QAbOehCPBE
 7BQiTf+AfSH3LYXrWFinkJ5IUjSbNYIXSGN/69hODtr6xYYyXpxDWTBoj
 kuuV2NfsXMCQjuQBMrqDmVkmGfKpbv6wuVWVs9s47WiPnwM2u9EQ0Ww2x
 qC8vbMI03h/XQO58XL0FkT4cJ0k4AQFCTVZBMQoJhIBGlOit9zvJMA6qq
 5Hrcu8ny1icDvA7ZFq4PiXnw3zMrXwQwR+QKNKJeGnhxMLeG7o2txEQN0 Q==;
X-CSE-ConnectionGUID: +KzbeI5SRr+mzgxVMjvKQA==
X-CSE-MsgGUID: esw2YYu7R+6ACcn43Di1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59567468"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59567468"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:59:27 -0700
X-CSE-ConnectionGUID: r1gQeUGESxGc57yAVbHrLw==
X-CSE-MsgGUID: 8+OJxgQZTeCxXNpTQ8Tq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172422120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:59:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 09:59:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 09:59:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 09:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZTfY5mVb9lvjDEte9I2ZwcrEWpeTfE84Ds75MiegAoq7z30+ZnmdqXyhx7Q4Eq31VV6ITAJu9iZuDBCn3ICfkvczcs8ctVGDmN7dSStRhy3CGsiaXZCOebO3E1TjH0tQvb7JaKE0+rH6J/yTRLRn1jWetp+4vdxK/E4U+K+TpDKwUrqZiawBMG1OLxZwgeqT+wh8fwx236htegoyJtLDQML8sBNEqY8AFxLbS37InFJdPcLuAwu3NJJIgQJFHpwVdaFvi1aj/PhpR6r39fmHhK5c9R91XwW5B3Z18jMvXHmuIyrv+FzXtTKV4YNfYi3ocReqFikdmXuzNbxUXdo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+qg51WRScp8djhAfbguB54nurCJgiClNkiXhnNtqp8=;
 b=JfcEKQztmS0Xg8koZmb2beLFsK+orGKqQLJ/YnTU4tleh+dI8d+HkyMg36d7T8eDx8NrZ2hsTfL/PVkHB6sYQZw5H8jFUG/NotoLHs+W3nRLcvttE8VNzOx+YcQwpzhp8qdrlXoX57tWgS1GbwFNy8PNuNAcD5jpGTqdA7uT/9mdqzM5uIK4gidQsBEDhIOd2/5O21h41v+3fQsxcuChUtMkRcEtSD6cD2drw2rluAaCR46eRmMozJ/bJ/ph9r4OTkZqXpxHD2ustSNWjGvl/g5sqUi5XdvD1JfzPWgAPNgTz3pz8yhzJnVmIp50LArQWjgkEBxKamqW4r9oOKqykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 16:59:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 16:59:22 +0000
Date: Mon, 8 Sep 2025 11:59:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [v2] drm/xe/hwmon: Ensure endian-safe casting.
Message-ID: <afidrekh3oe5pfw4ehaplfwtx5s6kgsh3cfwqnuym72sauvpgx@33oevw5nbg3i>
References: <20250908160952.2554948-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250908160952.2554948-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: b2eebd82-98dd-413d-c43e-08ddeef90eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/VMTfrqwEN4H07n4+N0Giwy9FuAonIgIPhrW6jgIfLWi9V8otyl+y7y/H1IK?=
 =?us-ascii?Q?K2Fle+Wr1Aa74eipOI5sKS8xJNYmADJ+wW814yiMACepFEAtiPdHflTToYp2?=
 =?us-ascii?Q?yI68Ah8fjYQlYAP1inRxK+adA1wa4hc+1hggPU7CjfWgzPhmlnWG+9HCRrOs?=
 =?us-ascii?Q?qZp21khgw7SDqHCSHv+DYqaJEeHzBNW9i53oq+hTbT7KDnt6Ib1uKPe4P9yk?=
 =?us-ascii?Q?0mwnqqbWvSEuhFnM/YYvjC5xaC31eBspTyW5aXM/soC0m28VYd4O1VWCsvUI?=
 =?us-ascii?Q?tK0OkuvL2xLFQH/CnWBfbECd2dKO7JsO1sKEJYTuc8giZPu/vcliRTEYYNN+?=
 =?us-ascii?Q?iJfwOUJpTZdUuqge3sjpjpr9tZgFx12Dae/iSCATf6BSPga2WEagKh/ZB2Km?=
 =?us-ascii?Q?hj7GI3xYuwdbYNPZZSdWo1ECvRA/sUDn4gD0eg8BVl3Hoc6hMrsULLZkApic?=
 =?us-ascii?Q?4Z32UvqoEwIMI8nqMowx9HO035VMXmicvKlwF+yHm5WYbH6TSBfrQL3Z5Pd/?=
 =?us-ascii?Q?3JOAIJCjG9m55Qd38KfNJIDGKwBy6wGB4VUOERWe+NrKApvuhuWA0Lnmb5LU?=
 =?us-ascii?Q?cgVtUf/tDn/3ia2IFX7bVFg2ZyTEqnkwSqb40xjxeD1QKPGbM3fxDJTXKYVI?=
 =?us-ascii?Q?LhzW12Xm9tTPw5+YM05BXPWB91B488DQPNlZLeMEnD6l5m/dGFGn+ALkb573?=
 =?us-ascii?Q?3fRHWtTB4R94Fq40QvJ9Zjv3lLrlr+7G3+oo8MVcCxJi1NaLHIOIeucpd+AX?=
 =?us-ascii?Q?QG2gxk0TNzOsG3rqfbi5DwUjtf3Yv6krUmiRYYlyjJ7y+8NvVTiYKOwffWq9?=
 =?us-ascii?Q?81DetubgK/xWQ1OWxXb7cJlxvXszCF4BuPQUy1F+xBTsF2WUiqFE4hvXoDoV?=
 =?us-ascii?Q?dcQ6MZMoWE9ArbRbu0w3B+wKOJuuiC/jgD6jcDom0nQkn4N1B9eV7oweOQBc?=
 =?us-ascii?Q?vs2md54eQhBu6su/v3SsC9UpZWS7+wKGLpfRTwA/ipFDed+3r8SVMb1aNjre?=
 =?us-ascii?Q?7mplmuzluJh8GLI/2ImmoV2l7UzUVsVczFyDdCrAe6zRNC3jUwstBuUa+J1R?=
 =?us-ascii?Q?rWE2ELqRn+6jDQcD7LvbiApsIf58uAS7s8HYLi0j95WrSYVMMW0NLrgDuX7N?=
 =?us-ascii?Q?wC+k7q39LuyPVXUBhcux36R8yrKr9W8Phe+/woNqrP1VZDOPWlCyT3tFY2aA?=
 =?us-ascii?Q?rU927uOsLI5/4qRdM1LzbBMFo9D6+tiLnoZGOmXcUrj5gEXS/6G8eYbzwrym?=
 =?us-ascii?Q?I7yGza0ss1w8yDDP6ZScwxT2NyAzsAqR7w8UBaM21+g+pJ7+M5ofN7EF0tSm?=
 =?us-ascii?Q?UykAzfKhMvA0zEBPNIwPDkLmUUvqakZO5f+omIgL0ews5+hdUZrF6g2VY43Y?=
 =?us-ascii?Q?j0aIeMMBoBqtY+Wd+2nUhXoLDQSS0nxHff6vfBbcep7VNHPbwsw2X+gmGpGq?=
 =?us-ascii?Q?bEof5/rvaS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ry5GSQVGgRMPcp9fe6acx7t+lv0wCBPJ3u7dd8FV0z2YEl5BaAwuEpoEtz6R?=
 =?us-ascii?Q?xt6ut4R4+1ik6+qUwrsyGXjQ42yu88OSBmvyZ2nSIZ9I/xJe26FBPZNBEzp4?=
 =?us-ascii?Q?JeaXqTWHFBqG0ZSrb+M4sNeEWlpZAngu4UUfcYSdLg576ZyOm9Q/UK6D741d?=
 =?us-ascii?Q?Z2uqgSaLpCuqPs+2psBNd66reswX+BhLXwKaxxq+bFoSZJc6TfzRcAERdlSN?=
 =?us-ascii?Q?dygupDU60D2V6LVhsJoTeK2Ew1xxIqsRVhd3NFJ8+fkM9aYJvPPWrn2K15LL?=
 =?us-ascii?Q?LVQXFguh70zMdFt1QdypysCkJAvfDBw7DII8AQveeL8ZXAAWu5aQrMM12auk?=
 =?us-ascii?Q?T+dwSmAa/Q4vhOALNsWoLkbY1g0xq7ZLU9t5nWx4yPp/ZI2bTS9xdvq11xVS?=
 =?us-ascii?Q?t7SOSk0/hhVjGChDbFsShy4l/j4xpVovt/T7yJ6TS09XWrDrf9QP/R1eLzKU?=
 =?us-ascii?Q?7t7brmUDJOSESdveV5jpheAK+bOmyzlmk2dsUja4BkiiCCntj0ScKiuf6YI6?=
 =?us-ascii?Q?5Lmi/DmK2XSBZJNcaFwnMiFPurSKW2B2iWwJEN9lKgZTq72lx4ulVOMzHvYa?=
 =?us-ascii?Q?VJWD0mxakfem0GSNyipW0Lg0JmIm2Po38UZ4sxb7M+0hm2XFsMVi3IbR8dtn?=
 =?us-ascii?Q?7ZFq3ezZLR07NLi9AewEQrhFfTe0Ut7diyNQBnqu5liaIPkg0sL0ObK/cDVy?=
 =?us-ascii?Q?yDcJcEKxXKcyhYIUaHs5Ne5ZUTZKhUPETGpgpOILuvBBsJb3z2auMXfcxqEb?=
 =?us-ascii?Q?uT/qAXK78NxfOk8XRdk18DhrWGfaUQVvtIhAaJbqfQgqCcvXCT4V5bCC+CPO?=
 =?us-ascii?Q?/EBNOBbKXgfseJSzPzO8ELh1D4N5eHzgF0QcQ5JV9G0xvdmop9+8J9Uc+jlm?=
 =?us-ascii?Q?Di6seMGvbWhukGw51tS5woxDkHD3u3Sn9wHBw+3CbFfqOEbY3V+kerOwd9LK?=
 =?us-ascii?Q?G965YLDfLB2z1rmWM7rN8KNJ7Nv3oWL01cLxANFOxAcM+eZURHDV8+2AAJgX?=
 =?us-ascii?Q?fnf9nu2qcavYpNoQH+5rsBB9p63DJFrC3nmKz2cWUibst1FoAWPCsBSpbLOB?=
 =?us-ascii?Q?pFH57PNOmcPUcMGKUoE3bfa/X4GBRLDsdIQ6t7Q5yXWSsgAaj22eX8P1oo+Q?=
 =?us-ascii?Q?XrUrPX+RyZ617beJkyVCDz+AvNEIgZpROUXeMi4xDvIEGX61OMoIkcFCrU+w?=
 =?us-ascii?Q?MpkFhq7hA/10z0/G5iTGo81G2Ip+Pp9rrHigSFdcAJmQxjcYssESDBwd1avB?=
 =?us-ascii?Q?RKKp1oflzH0VY1hsju05lgYqrohlUXpu02hpjykWENoIr58/qHDODYqd8P8J?=
 =?us-ascii?Q?mbCG/F/ABk070aoKCH2qra3KXGr6TdM9NpEy8kOVR2AylFrN/sFqwK5vWUAQ?=
 =?us-ascii?Q?eW+xEeVKQGwmD+gBHBSZpLOGC0v+zkH9xmr8Epvde9gV/EWdN85eAhEF14/M?=
 =?us-ascii?Q?rgC1lgAIjiUidryof66q/F+QVDR55H3MtwF7cE/wxm1IFOaRW9PysyofofHN?=
 =?us-ascii?Q?0iv1Atpi7XjaMrg49wFqEtCF0QO6BGVroZjtwP/sLeYn73FEjMToe+K9LZc5?=
 =?us-ascii?Q?MZYx+fJeW0PQ8M8dY4+JsVNiZkAc++Iv6Jv2+KEErOXs8mmVskxDPMozB/XF?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2eebd82-98dd-413d-c43e-08ddeef90eeb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:59:22.3824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: si9iaaelzN9dn3LlURATdcV0Uf1xKuSGq6LSdaH+kNZGW2egDE7EU3GgGU/a0L7oyUkULy5rCkcExqjSM+1T+9wElgUVqldClBQfTBrlqXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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

On Mon, Sep 08, 2025 at 09:39:52PM +0530, mallesh.koujalagi@intel.com wrote:
>From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>Handle endianness when casting u64* to u32*.
>
>On little-endian systems, writes will go to the lower 32 bits; on
>big-endian systems, they affect the upper 32 bits.

Are you running this on a big endian system and fixing a bug?
This doesn't seem to be big vs little endian at all, it's just wrong use
of casts. If it was big/little endianness I'd expect us to be using
le/be types and converting to cpu endianness as needed.

>
>Avoid this by using u32* pointer instead of u64*.
>
>v2:
>- Address review comments. (Karthik)
>
>'Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power
>limits though mailbox")'
>
>Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 32a76ae6e9dc..7555bb499847 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -294,7 +294,11 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
> 	mutex_lock(&hwmon->hwmon_lock);
>
> 	if (hwmon->xe->info.has_mbx_power_limits) {
>-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>+		u32 reg_val_32 = 0;
>+
>+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val_32);
>+		/* Explicit, endian-safe conversion */
>+		reg_val = reg_val_32;
> 	} else {
> 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);

both in the if above and in the else the correct type is u32, not u64.
Use the proper u32 type for them and drop the cast. No need for
endianness related comment.

then use the type in the function for when you are actually using a 64b
value.

>@@ -505,7 +509,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
> 	mutex_lock(&hwmon->hwmon_lock);
>
> 	if (hwmon->xe->info.has_mbx_power_limits) {
>-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
>+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &x);
>+		/* Explicit, endian-safe conversion */
>+		r = x;

Please don't use a random variable just because it matches the type. r should
be renamed to reg_val and use u32 type.... also because REG_FIELD_GET
expects u32. No need for any comment neither.

thanks
Lucas De Marchi

> 		if (ret) {
> 			drm_err(&hwmon->xe->drm,
> 				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
>-- 
>2.34.1
>
