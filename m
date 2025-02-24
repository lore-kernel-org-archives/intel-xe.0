Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9CC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 14:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0810E3C1;
	Mon, 24 Feb 2025 14:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqblTzl4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE910E3C1
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408018; x=1771944018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gnKWhwwfHpqcqVdq3eb9KJJVBVhi91G5i3bftza+CBM=;
 b=dqblTzl4q0KkDoPjCIDrTX6k38WUuQPbq+SaekIIcgRATz5LuDdMW8eb
 i0pfYuiVRQMvcjuA8m5HL+qUpU0MlpfjCSrpXzUNFci2gsfhUiXq6xZOm
 MVk6T3qBTJ4hfJuwRwssz0oO+jzmtzZMg+pvzdTB6uV0oFOnT1u0gjYe8
 SSzZ5dWbvaaFQ8B39xqRrluT9gPzIv/ctyarMFroq26Z+VcpUSgeCsLoI
 jTaio36rTZMPyLhUn3eFttAiTRHTy+bosxUAT61jpnyIfXjkRy0sib8Ge
 K7piBS5klEGAqse6y3LnZc9lHSBMorDciXou26SOELxK8S8GAMooO6ZHx w==;
X-CSE-ConnectionGUID: bgGhrlM4TLmpcOr0KAPbQw==
X-CSE-MsgGUID: SxwchsJaQRKfkxCdNKJLuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41042173"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41042173"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:40:17 -0800
X-CSE-ConnectionGUID: 8ZUvrt0YQ4GvlawP3vAGFw==
X-CSE-MsgGUID: K/9Ge+s+RUeEsAqbxsTrJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="116056777"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:40:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 06:40:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 06:40:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 06:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvPu97HjMVbz7oyiREYLktUmxHNfwDtbW4bHhqL8jd7iYBjqUSqbyvBcEJOHYjQrzo2oxb+WrZFG/K0WpHCxXUsP8ICiKK/W4rarHmh7YQ6G0pYo0csi7iMquNyUsgTyiHjx47jyoyMrxmYFSHAO8NGzXRRYOR2bxwIdx7rRZ4QQAMw8XlH2qi/Rym0UKtojSl7YL1av400TTOb9ZrQgk3gvHLgSY6o3Mut8TjvJ55lldsXcL0AYXoRBr3TG7fWYMn2e0hlyfKeKrPOUwGpB13NCDXBsekWdpXny6YqyZOAXBL98dJL40xRdCai0HRzefwP00wrjdPK5NyZ1IczDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25Z4lX5MvN0LHsrkuL966LrGJmmYcskjPaeMhTqwwfU=;
 b=RPREY7S6PvEFj0qKH3ZOSHahpu41vleXmw60VMmEDg+ThHQ1eLFFdHVz7izweZZ+hfdDzBNOmlz7gV5rXtSJt/oTYaPJAi4ALC4tXo/5LAN64xzYJDQDt+sv/gVfxjbP9sz5nwS5mYi+sGrPh6SGlkE9eabgQzW9AHUjvo4A+lnc6iQx7sMfWMY5y5PcrOAYhEPaihQHMu0fqcCoomDhZXT1jCg/E+pr5oBFZlxZGyN2YhX430MpnCTDNcageCpI9b5Plv3sOU6E0bzA0+csz2GsxEkg+fi3WG9cJ99CjCj4tPz+Xblc0u185/wliMOS9+rvUOY9oGB1arMeluaj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 14:40:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 14:40:13 +0000
Date: Mon, 24 Feb 2025 06:41:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Add staging tree for VM binds
Message-ID: <Z7yFDHTCeOvYr913@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-4-matthew.brost@intel.com>
 <d481a85557a539fe694ce85d7e4d31edc50b132a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d481a85557a539fe694ce85d7e4d31edc50b132a.camel@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae66a3d-23d0-459c-d6eb-08dd54e1255c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FVerf0WO8v6nnLdizsSW2Iz4ncBKxx18ZPgrBe6umAJtLs93mSAxJXGA07?=
 =?iso-8859-1?Q?Z8ZcQGkT5Ctp/bBnZnZM87M7AHI9Bjn87Z0ru0/06huCp61LMwYHfadzqC?=
 =?iso-8859-1?Q?k2Q2OdhSA9sciytnSyvCu57ISlv0qDrxVtjrEnEZqYRAHfCLWrsD1uYTMj?=
 =?iso-8859-1?Q?2xwC04ZZa2xcTGWs6CdcYE3tfgSmYmkXBaXd4JMII2+QPhjxtewqBKEQzy?=
 =?iso-8859-1?Q?KPCVQdYMOhCo/I4UAr30cVv5I96E8B4OD5be101XYLGKPF2L03SqbsBVnM?=
 =?iso-8859-1?Q?OtOfD1Oto3t2ZxC79iRBw6on+P+yWvuktC391tT3KkCHigZYp9PKy/oaPp?=
 =?iso-8859-1?Q?1u//uQYW3c3Y0Sb7Mg3Zfp2TY+zzectPNSqhqYiWYe03EqzfyG2CzBg2XA?=
 =?iso-8859-1?Q?YYF7UTRVVQm+eH9kYh8EHGJQRwB0CBotlcqSei6cif0Gx4KPRJBbOWvjpi?=
 =?iso-8859-1?Q?eBGDAF+NAogMkCW/w+wytDkPSlmdGAO4nyrLjGDaeibPGivasSZ0mlqryl?=
 =?iso-8859-1?Q?RKps0T75AaC0F5Lp77/NB+LbJo3dQVaUSI6kx/cPQJoEnv8vG4Ovn8vx15?=
 =?iso-8859-1?Q?PLbVZw3KcP4nQ3spvBcMUQw/Krs0+c1grcD+8Lb0nPFLN70j+Meza7iGYv?=
 =?iso-8859-1?Q?sYu/3dIO4wqTedqjo7AANjO1OFVJ9XW7wRsNXmpS5SSOiI9AwGOMsO0btf?=
 =?iso-8859-1?Q?hrMxVNYP2C7v4yJ58zKrJ6z9ERrgIktg9e/byO/Oa2yKcSZ7joSempNjFj?=
 =?iso-8859-1?Q?7ZUqXKHbULIb3vy+Ta1J5+cPORlmQZHhVg48oE8VIYTb3T8YBlFgNXG6v7?=
 =?iso-8859-1?Q?9xUVmdBcUqiujB5GtnJ0QsgsqUOSYhp+I2OaBPs58hddyZRfHcUJt09DAH?=
 =?iso-8859-1?Q?ZNCuHAtSipcnSTlwssMbTroAkaBDl6pZqslMAGl14VbkWEuj6fa+ol0ZM9?=
 =?iso-8859-1?Q?Pu8VDd+2RZzZHilYIZkJZ51GF4E68DidGoVBqJQKNGM21V3qYtDq/1WpXM?=
 =?iso-8859-1?Q?7XczFFSfpHySBixkRv8O2CYAJEF0qN4hkHfaReXadAqABnjOSoOy8SZrID?=
 =?iso-8859-1?Q?A6LTz5Ih5sInYljv9QKhnj9ofKUj05CSPrS6ZpHZGVhGNyNasokOfIeepD?=
 =?iso-8859-1?Q?++w9dM0uEg3x2Aqb+lXk9v+u4f16+6usIZhHZ+4Ega4aGw/w7t/ho8lYru?=
 =?iso-8859-1?Q?RmDMG1wuCnRce7+LN1O2uu+Zp9k0v29/rPn2E3p4jcM1eKK3IccySKryJ6?=
 =?iso-8859-1?Q?IoirAmPNetjx0vPbSvVFRxleQZPD81GI0zezBWg0DnoJJs88IEsKJTps1Y?=
 =?iso-8859-1?Q?R7Sv1bvPDcGP4TsguWGLct3RfKU9NhUXI9trdE4nH9oO+Yo/0xT9nnnS1Q?=
 =?iso-8859-1?Q?gS2+jFkgmdG9dB802/OTjY1EmKedVgl3gaOYcZx1p3Cdg53RMnHU0aeyNW?=
 =?iso-8859-1?Q?c0zZHW91ZKBHszk6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o1C4MVK2A+qM283HNykOTAg/tzYLZt7CUaCuYat/0u4rbm/X07/ZWxk+gs?=
 =?iso-8859-1?Q?ibrshbk9fEy/xuDz5d0lmKcnDKOGXG9FRrvqfcClTqVTWmp/eFCZeCEfXg?=
 =?iso-8859-1?Q?U/+nMrLjEV2qf0A2oh4xtAJoJdj5XYexNNODQC6H7bBau+n1vWVjLyo6dH?=
 =?iso-8859-1?Q?y/4AZlW9uOaIwMOEcCNVK+n3vUkLU7Mx2mgTuyAGf8fOXaYzMVHEJutl8O?=
 =?iso-8859-1?Q?64KmFvcBsVyyu16d2iLkpls8I3iP51LdwFFUSVnn0JuTK1wdJov5xBLa8V?=
 =?iso-8859-1?Q?7JyYo8jCyTPcM3hMcT7b9mIXKzMkLZn9WOmV3riN/Ziaot3vVX+M1OPn+w?=
 =?iso-8859-1?Q?1hk8L7tNQskPzLeMZYRrBCiYORpOkQ2Jk2k2cbpTjPMDdByOGsnju9wx+1?=
 =?iso-8859-1?Q?aJGZEQ0iParQGUb9UqvWD5zbFf4qARv6RGVXaaACSpc4J3xOlH7yGppahv?=
 =?iso-8859-1?Q?H+KHgtLWn326VO3uTc2DWD1V/mndoCz+ZhTDlHQw3L10HSOlKO0ESFQcjr?=
 =?iso-8859-1?Q?8E7r1tAhTxCUaxtecm7TZlSigpIqgzw1L5lPZeHIU3Z9Lb48Wn6Awqhekt?=
 =?iso-8859-1?Q?VJQRetpdhfI1+DXB3ActGWYnj7iVC3SAOLemifWQ6ImykxufPqrXSxzk9k?=
 =?iso-8859-1?Q?RQ6vc+n9pAGCVnHRfpl96q9elCitBeh3EJTqeZiysiPvtqnXCJFLSYJ7ff?=
 =?iso-8859-1?Q?0O41hojShktojU0X/dl2pVkL3LYuMz0vjwwmIzQPGyvPfnXqWn/HDUEzL5?=
 =?iso-8859-1?Q?totmiZfU0uc7jEcHQQvfL38YyvGkS5Q224Huc1ZV0qW4WIKTyBQfqjD6ux?=
 =?iso-8859-1?Q?9VemuwiQWcq+d0OArS3C7TzMmd6hPeRik1K5aMJWLSq7MLawUi5bbMWZsm?=
 =?iso-8859-1?Q?+6pJGGz+0PVLrl4m5TIHfrsiIIMINtdXaNVsyfHAZ/ZXFCHMPOyu2/ZlBb?=
 =?iso-8859-1?Q?hYIfyM23JpEsy0kQCMPQZQvOGueotvJMtuOv6jzgjsBI94HADXCn+/zXal?=
 =?iso-8859-1?Q?kJu2PucVH+IiTBgEqZ8hJp3lL0xcqb5CDU9sbxYv46sKLT2UZZTdwy1qyU?=
 =?iso-8859-1?Q?iOaIpf7lyx8pO2Vv5Ayi7hFjQAwtqVihlMHM0D7p8vuwBQLQiCz68Ah9KW?=
 =?iso-8859-1?Q?8er92RtwVxeMOkp3EwChfcnthrjPRcImzAMAsa346oxrofa9DN7ZlQS8PL?=
 =?iso-8859-1?Q?RK5WqF9s4r1T4UIAtuMZxh349K8qr9zZy5uiwimBVpBJzmxQLR0qkb4SLE?=
 =?iso-8859-1?Q?TaTvKdK37g2+dgWLGZz8szFdTBOdlIYXH6uSvxCLjJ1kedH+dnu8Z1Mffk?=
 =?iso-8859-1?Q?vigG7RGStdrMvm9brO+OgvbOB7Q+dNzCBqUX7h76x92/KtsPoikDm1QWeZ?=
 =?iso-8859-1?Q?CV0s3XjRj8/LH155giYsN1ipbOnFzrRiacxOgvDyUy7n7dgF/mhnbnuu1w?=
 =?iso-8859-1?Q?Jui9H/uj3CQYKmCiB+DTc5XRlBdPn/xPmZdVorrHGTKv1Lft0WVrx4ClGF?=
 =?iso-8859-1?Q?ld48Zp0X2FJbkVXYRmFfmEdPceNTObfWYW62DmfB/zDpOjfIQucPatlRog?=
 =?iso-8859-1?Q?bWGsASpMkwM7Mqyy2z0BidYmelXtyqX6ur2kMHgJ0/Y9q1pAb2lmlpNDC3?=
 =?iso-8859-1?Q?JFN+PNXPt4JMePSikAL7X5eVuJk/Kq+GunkwsPfmPVCnLOWlw3G0uLJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae66a3d-23d0-459c-d6eb-08dd54e1255c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 14:40:12.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsRlHtQtjIzmQ673//n1ByWVDpWwKQk1+vTcMD1WVWQiZY07H0cROPo+W756vTxiLfolKaQfZ/W+8imOb0+95A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
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

On Mon, Feb 24, 2025 at 10:22:37AM +0100, Thomas Hellström wrote:
> Hi,
> 
> On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > Concurrent VM bind staging and zapping of PTEs from a userptr
> > notifier
> > do not work because the view of PTEs is not stable. VM binds cannot
> > acquire the notifier lock during staging, as memory allocations are
> > required. To resolve this race condition, use a staging tree for VM
> > binds that is committed only under the userptr notifier lock during
> > the
> > final step of the bind. This ensures a consistent view of the PTEs in
> > the userptr notifier.
> > 
> > A follow up may only use staging for VM in fault mode as this is the
> > only mode in which the above race exists.
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: <stable@vger.kernel.org>
> > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single
> > job")
> > Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error
> > handling")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> This looks even simpler than what I initially thought. Ideally I think

Was pleasantly by how simple this was.

> the staging tree would exist only under the vm lock during the multi
> bind-unbind operation, but that adds code complication and execution
> time compared to this solution which is more memory-hungry.
>

It does take a bit more memory but I doubt that is a concern. We only
allocate an extra page of memory for each PDE which is pretty minor
considering the smallest PDE is still mapping 1G of memory. As I mention
in the commit message we could even drop the staging for non faulting
VMs too.
 
> Minor comment below.
> 
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c      | 50 +++++++++++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
> >  drivers/gpu/drm/xe/xe_pt_walk.h |  4 +++
> >  3 files changed, 44 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index add521b5c6ae..118b81cd7205 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -28,6 +28,8 @@ struct xe_pt_dir {
> >  	struct xe_pt pt;
> >  	/** @children: Array of page-table child nodes */
> >  	struct xe_ptw *children[XE_PDES];
> > +	/** @staging: Array of page-table staging nodes */
> > +	struct xe_ptw *staging[XE_PDES];
> >  };
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> > @@ -50,7 +52,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt
> > *pt)
> >  
> >  static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned
> > int index)
> >  {
> > -	return container_of(pt_dir->children[index], struct xe_pt,
> > base);
> > +	return container_of(pt_dir->staging[index], struct xe_pt,
> > base);
> 
> It looks like the only user here is with staging == true, but I'm a
> little worried about future users. Perhaps include a staging bool in
> the interface and assert that it is true? Or rename to
> xe_pt_entry_staging()?
> 

I had a bool originally but found that xe_pt_entry is only called during
the staging steps so dropped it. Can rename to xe_pt_entry_staging for
clarity. 

> 
> >  }
> >  
> >  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> > @@ -125,6 +127,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  	}
> >  	pt->bo = bo;
> >  	pt->base.children = level ? as_xe_pt_dir(pt)->children :
> > NULL;
> > +	pt->base.staging = level ? as_xe_pt_dir(pt)->staging : NULL;
> >  
> >  	if (vm->xef)
> >  		xe_drm_client_add_bo(vm->xef->client, pt->bo);
> > @@ -377,8 +380,10 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk
> > *xe_walk, struct xe_pt *parent,
> >  		/* Continue building a non-connected subtree. */
> >  		struct iosys_map *map = &parent->bo->vmap;
> >  
> > -		if (unlikely(xe_child))
> > +		if (unlikely(xe_child)) {
> >  			parent->base.children[offset] = &xe_child-
> > >base;
> > +			parent->base.staging[offset] = &xe_child-
> > >base;
> > +		}
> >  
> >  		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
> >  		parent->num_live++;
> > @@ -619,6 +624,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> >  			.ops = &xe_pt_stage_bind_ops,
> >  			.shifts = xe_normal_pt_shifts,
> >  			.max_level = XE_PT_HIGHEST_LEVEL,
> > +			.staging = true,
> >  		},
> >  		.vm = xe_vma_vm(vma),
> >  		.tile = tile,
> > @@ -812,6 +818,7 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops = {
> >  
> >  struct xe_pt_zap_ptes_flags {
> >  	bool scratch:1;
> > +	bool staging:1;
> >  };
> 
> As mentioned in the comments to the previous commit. I don't think
> zapping is needed when aborting a bind.
> 

Let me reply there as I think there is a bit of confusion still.

Matt

> Otherwise LGTM
> /Thomas
> 
> >  
> >  static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > *vma,
> > @@ -822,6 +829,7 @@ static bool __xe_pt_zap_ptes(struct xe_tile
> > *tile, struct xe_vma *vma,
> >  			.ops = &xe_pt_zap_ptes_ops,
> >  			.shifts = xe_normal_pt_shifts,
> >  			.max_level = XE_PT_HIGHEST_LEVEL,
> > +			.staging = flags.staging,
> >  		},
> >  		.tile = tile,
> >  		.vm = xe_vma_vm(vma),
> > @@ -905,7 +913,7 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
> >  	}
> >  }
> >  
> > -static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> > +static void xe_pt_commit_prepare_locks_assert(struct xe_vma *vma)
> >  {
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> >  
> > @@ -917,6 +925,16 @@ static void xe_pt_commit_locks_assert(struct
> > xe_vma *vma)
> >  	xe_vm_assert_held(vm);
> >  }
> >  
> > +static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +
> > +	xe_pt_commit_prepare_locks_assert(vma);
> > +
> > +	if (xe_vma_is_userptr(vma))
> > +		lockdep_assert_held_read(&vm-
> > >userptr.notifier_lock);
> > +}
> > +
> >  static void xe_pt_commit(struct xe_vma *vma,
> >  			 struct xe_vm_pgtable_update *entries,
> >  			 u32 num_entries, struct llist_head
> > *deferred)
> > @@ -927,13 +945,17 @@ static void xe_pt_commit(struct xe_vma *vma,
> >  
> >  	for (i = 0; i < num_entries; i++) {
> >  		struct xe_pt *pt = entries[i].pt;
> > +		struct xe_pt_dir *pt_dir;
> >  
> >  		if (!pt->level)
> >  			continue;
> >  
> > +		pt_dir = as_xe_pt_dir(pt);
> >  		for (j = 0; j < entries[i].qwords; j++) {
> >  			struct xe_pt *oldpte =
> > entries[i].pt_entries[j].pt;
> > +			int j_ = j + entries[i].ofs;
> >  
> > +			pt_dir->children[j_] = pt_dir->staging[j_];
> >  			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags,
> > deferred);
> >  		}
> >  	}
> > @@ -945,7 +967,7 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
> >  {
> >  	int i, j;
> >  
> > -	xe_pt_commit_locks_assert(vma);
> > +	xe_pt_commit_prepare_locks_assert(vma);
> >  
> >  	for (i = num_entries - 1; i >= 0; --i) {
> >  		struct xe_pt *pt = entries[i].pt;
> > @@ -963,7 +985,7 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
> >  			struct xe_pt *newpte = xe_pt_entry(pt_dir,
> > j_);
> >  			struct xe_pt *oldpte =
> > entries[i].pt_entries[j].pt;
> >  
> > -			pt_dir->children[j_] = oldpte ? &oldpte-
> > >base : 0;
> > +			pt_dir->staging[j_] = oldpte ? &oldpte->base
> > : 0;
> >  			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags,
> > NULL);
> >  		}
> >  	}
> > @@ -975,7 +997,7 @@ static void xe_pt_commit_prepare_bind(struct
> > xe_vma *vma,
> >  {
> >  	u32 i, j;
> >  
> > -	xe_pt_commit_locks_assert(vma);
> > +	xe_pt_commit_prepare_locks_assert(vma);
> >  
> >  	for (i = 0; i < num_entries; i++) {
> >  		struct xe_pt *pt = entries[i].pt;
> > @@ -996,7 +1018,7 @@ static void xe_pt_commit_prepare_bind(struct
> > xe_vma *vma,
> >  			if (xe_pt_entry(pt_dir, j_))
> >  				oldpte = xe_pt_entry(pt_dir, j_);
> >  
> > -			pt_dir->children[j_] = &newpte->base;
> > +			pt_dir->staging[j_] = &newpte->base;
> >  			entries[i].pt_entries[j].pt = oldpte;
> >  		}
> >  	}
> > @@ -1237,7 +1259,10 @@ static void
> >  vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > *vma,
> >  			    struct xe_vm_pgtable_update_ops
> > *pt_update)
> >  {
> > -	struct xe_pt_zap_ptes_flags flags = { .scratch = true, };
> > +	struct xe_pt_zap_ptes_flags flags = {
> > +		.scratch = true,
> > +		.staging = true,
> > +	};
> >  	int i, j, k;
> >  
> >  	/*
> > @@ -1590,6 +1615,7 @@ static unsigned int xe_pt_stage_unbind(struct
> > xe_tile *tile, struct xe_vma *vma,
> >  			.ops = &xe_pt_stage_unbind_ops,
> >  			.shifts = xe_normal_pt_shifts,
> >  			.max_level = XE_PT_HIGHEST_LEVEL,
> > +			.staging = true,
> >  		},
> >  		.tile = tile,
> >  		.modified_start = xe_vma_start(vma),
> > @@ -1631,7 +1657,7 @@ static void xe_pt_abort_unbind(struct xe_vma
> > *vma,
> >  {
> >  	int i, j;
> >  
> > -	xe_pt_commit_locks_assert(vma);
> > +	xe_pt_commit_prepare_locks_assert(vma);
> >  
> >  	for (i = num_entries - 1; i >= 0; --i) {
> >  		struct xe_vm_pgtable_update *entry = &entries[i];
> > @@ -1644,7 +1670,7 @@ static void xe_pt_abort_unbind(struct xe_vma
> > *vma,
> >  			continue;
> >  
> >  		for (j = entry->ofs; j < entry->ofs + entry->qwords;
> > j++)
> > -			pt_dir->children[j] =
> > +			pt_dir->staging[j] =
> >  				entries[i].pt_entries[j - entry-
> > >ofs].pt ?
> >  				&entries[i].pt_entries[j - entry-
> > >ofs].pt->base : NULL;
> >  	}
> > @@ -1657,7 +1683,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
> >  {
> >  	int i, j;
> >  
> > -	xe_pt_commit_locks_assert(vma);
> > +	xe_pt_commit_prepare_locks_assert(vma);
> >  
> >  	for (i = 0; i < num_entries; ++i) {
> >  		struct xe_vm_pgtable_update *entry = &entries[i];
> > @@ -1672,7 +1698,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
> >  		for (j = entry->ofs; j < entry->ofs + entry->qwords;
> > j++) {
> >  			entry->pt_entries[j - entry->ofs].pt =
> >  				xe_pt_entry(pt_dir, j);
> > -			pt_dir->children[j] = NULL;
> > +			pt_dir->staging[j] = NULL;
> >  		}
> >  	}
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c
> > b/drivers/gpu/drm/xe/xe_pt_walk.c
> > index b8b3d2aea492..be602a763ff3 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_walk.c
> > +++ b/drivers/gpu/drm/xe/xe_pt_walk.c
> > @@ -74,7 +74,8 @@ int xe_pt_walk_range(struct xe_ptw *parent,
> > unsigned int level,
> >  		     u64 addr, u64 end, struct xe_pt_walk *walk)
> >  {
> >  	pgoff_t offset = xe_pt_offset(addr, level, walk);
> > -	struct xe_ptw **entries = parent->children ? parent-
> > >children : NULL;
> > +	struct xe_ptw **entries = walk->staging ? (parent->staging
> > ?: NULL) :
> > +		(parent->children ?: NULL);
> >  	const struct xe_pt_walk_ops *ops = walk->ops;
> >  	enum page_walk_action action;
> >  	struct xe_ptw *child;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h
> > b/drivers/gpu/drm/xe/xe_pt_walk.h
> > index 5ecc4d2f0f65..5c02c244f7de 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_walk.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_walk.h
> > @@ -11,12 +11,14 @@
> >  /**
> >   * struct xe_ptw - base class for driver pagetable subclassing.
> >   * @children: Pointer to an array of children if any.
> > + * @staging: Pointer to an array of staging if any.
> >   *
> >   * Drivers could subclass this, and if it's a page-directory,
> > typically
> >   * embed an array of xe_ptw pointers.
> >   */
> >  struct xe_ptw {
> >  	struct xe_ptw **children;
> > +	struct xe_ptw **staging;
> >  };
> >  
> >  /**
> > @@ -41,6 +43,8 @@ struct xe_pt_walk {
> >  	 * as shared pagetables.
> >  	 */
> >  	bool shared_pt_mode;
> > +	/** @staging: Walk staging PT structure */
> > +	bool staging;
> >  };
> >  
> >  /**
> 
