Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56FAD0EE00
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 17:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2B10E56D;
	Tue, 25 Nov 2025 17:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYvVAyBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF90210E56D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764092529; x=1795628529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p6PfIrf6EWe3A94sB0HkwsN302r1t35m438TONvpRd8=;
 b=WYvVAyBMxJX6EKkdtmLI/aOwkGF/uQOfmrWE6C2vWNrhTQ+4LbtMOeXj
 yGobfsMqDSFoM0aq6gxq26LpHb7rSYlHfWpJGS+V+oDuEcvsUpkkCMEeo
 SQihrSxNG//W2pDxtmCujFnNtrtXjBAk0VRwSd8ZuqsDW7HaegCnBM/g4
 fFXkhzzdLezFJZFGT1wMHZJ8NIlu1j0mI0prECMeq5Up1dyzcH3oa3WPC
 nJ1QB5zP9M5jKqnY41suaFpK3e/jIF511nFRX6fYH4eAsptmcUmYSyE4Q
 L9IwSjZr/PFY7FDMZkN6VYtm+2t8+QYwi6jO9xOJ+clh4275thDST7L9A w==;
X-CSE-ConnectionGUID: cvxpy3gfTq+Ur7+YZPNZuw==
X-CSE-MsgGUID: V4TdkMCrRo2pdZKGD3sBAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76443539"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="76443539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:42:09 -0800
X-CSE-ConnectionGUID: JYnuhMnrRjyN67Onhe/lHw==
X-CSE-MsgGUID: rLjmGf3DRtqB3Nq/RuUXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="197811743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:42:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 09:42:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 09:42:07 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 09:42:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWJDWC/Wrjimb9ScEHNVy6KaQp8ZU6ddkOXi/zQOl1+Y0HTrEnNy27ci6G0q/gVLf9MP7JRipyZGclv9ebRl3QiGWFU2/DiE800FVIKQr1lC84oNWfykTNI41ZqLHMbWcG6zwxnFVYuofOduyriYE7izLOmo8Uv7VjcZKK06FM+RAijoDzQZlSeDjTmt3ca4h9zWuQ8ktCcjxqBTHxs93+77vQxEjTF4TRy3F6EM3YmGEDTr/QKkN5CDWur9oj35gibwrh6ZPS34x81Et7VMi0AHw/lCVFg+Evo6A13zfdbi7upJPL7N1WxMjsM7iSrLlNO0X0Opd7rglHrYkvoObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsHXHhZyeETRapxjxugDONPkVibK6l/fNNbvnD/f2kU=;
 b=iCduKbky59r8rJn1WiryFqAiQAfnQMnv9GW3Vj4O9Lj8UKb9Ma5o+ptDQqNteBUy9Xpj82KWuXqNeVViMYaM2PMv4Ht4maIyDHTzqFITwPYBz7zcRrliR7lVfZJ5GXyvELCpnGvN+ZU9AODqte0KtncIN1F4e4a9tgPZWsEEZGidHf1I58bb89Jbep1t+GKmgYQrTbRoGhijS0yR3M4Zv8DzvIC/mPU1EKrdcJitUIJ7vkPw985Qve0h27MS159355jSHzucKMTzfRyLKoK3jRLNwhj5q9Zc+jj4jLcEeDiETkvJ9yTbKIku0W8fiWsZ2RaNl0j56uHadY/wByYrQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Tue, 25 Nov
 2025 17:42:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 17:42:02 +0000
Date: Tue, 25 Nov 2025 12:41:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, <jani.nikula@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <ville.syrjala@linux.intel.com>,
 <karthik.poosa@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aSXqY7Yhz3qlMYtN@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com> <aRyTBkBgFK3OO_wT@black.igk.intel.com>
 <wcfsfjjncwfb5mwjkdixeqvmjvtfnr6vzx7bpwwu6jrbhoal24@orkpmm6x6nbh>
 <aSAj4aAKMH_isOvJ@black.igk.intel.com>
 <aSU4-yEwEMlJEhjA@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSU4-yEwEMlJEhjA@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: f275f73a-0cca-4429-1de5-08de2c49f148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ERkE9Q5Q1IUWWCh2LRgavzfjeMQgohQeoqjsew+emgLAbWklfPVuCZPf/Vli?=
 =?us-ascii?Q?WyUTLgv1c5MBcI1KSvjCKUO3pS/zaQTLLqL/U28WxjnqEqOdLs2YTbR6dr2M?=
 =?us-ascii?Q?vcoYtA/CdiBUXjhAe1dz6LFgM2OtpuVkuyBV5OFNl0A4c0PPVydxFJK9tyNs?=
 =?us-ascii?Q?WkvRwD97VoR3T8d2CENt5wi3gguG59igTO1IC65Uu+uFLmzh0tW96jZ23XKb?=
 =?us-ascii?Q?K2Zd+DIPYT4zZZfKq81nSAIXX+JTMAh+bDkjE4t1smV5R7EvbU9PD/g3roA4?=
 =?us-ascii?Q?RjwDCWM92r0Af5VTQD+zNYDIDdLjL3FfJhlfhu8lyG+F7hmDVZJm82NQtdoE?=
 =?us-ascii?Q?wEwOBoNyeJ/wTYgUZjG5f+2mo3fr3TFZZVoKiqOOa5xzVrsn9+BIFURZJUMY?=
 =?us-ascii?Q?X/jfsb42JXIr96/FBFRvOYaUzetBRgQK27843PkpD9p/qjQCGYTwzY795q4W?=
 =?us-ascii?Q?mnOVlScOGXM89YPkYM2EjHb5Xq+GLAzq8JqGWiKOa4CMG6KXJIH6SylS1tVF?=
 =?us-ascii?Q?bsO8rViFtlc6aMwP0X3pvR5p1/PA8Umk4HTwpnuJsT+FwSyQK4sl9XHjJY3C?=
 =?us-ascii?Q?zCnMuqKL+yUn23Zl036Z8f5VYtpPqPppROd7Hh+4F1VHKrY5/AkOW4UCnPBc?=
 =?us-ascii?Q?SNvuFCP+vRbfr6jxpLmnIZbYnyGCkfVMTe9opgvAggcWGddKXFmbXkzr78cU?=
 =?us-ascii?Q?hL58UKfpQBekTXfqZxA9GUdQIn6VzzNlHWjFzL0YuBdjMuoavkkwqw5qask1?=
 =?us-ascii?Q?R+Bk5C4s/n2Xe9kYUadvYccpKeHDWaY+sJ2U7JJEzWDuQxKWYHGEP7I2JBzU?=
 =?us-ascii?Q?5j6/KU/9HphrW6pLMzVJoKVcncEppR07YcMOdM1rRN6x9bk1igox8gsUthf2?=
 =?us-ascii?Q?+ctfhIrMovy2P9XXSpQpgYtMCzz1gsgmhurLZUDBwt2NBtjjcGAegZxuMUC8?=
 =?us-ascii?Q?R8azuNpIxV0FD2cVsBRCDkpZBYFZahjNJRupza0rbYRsuA5R+I5FtoN0TREL?=
 =?us-ascii?Q?FpY8dogAdIAR4esDKpUelLsnzW9gtWAEfusc3srVGtIYaSerquvSP/J5wgn8?=
 =?us-ascii?Q?8/OoMquMRe9d/N6CgfwKPLKXfUKiehWD6qkskzJgitBhQ8EuS/LK1a1H6hhN?=
 =?us-ascii?Q?dHeAcINtBNpaev1PffzODd7Kmzy6KywSDmVsYm88vA7GiBXl51x83xj/j5ng?=
 =?us-ascii?Q?9zTRkmdS3El26n7XqhwXttUqNsZUn5A2cDSbFVCQBJkPFhakgEwiSmNPY8KB?=
 =?us-ascii?Q?accC8RrSSACL3nFQfpb8kMUc5qXzSHw1BBp3usS3jJnfCKs48EI6sZXdOkKA?=
 =?us-ascii?Q?wZQTTev8W6f7oHKFPbNOlmjLF9mQLbHVkGyHInRo2tuRg6ESjfZqe9N6w7cj?=
 =?us-ascii?Q?uzKLETcmCO4SK8E+H34yR2GLQctY/bL29JCiShRCudXePFneyQDMycRi/4qz?=
 =?us-ascii?Q?aQs5wzeVCqawwOIuZdpI87HC6CuDD5Nf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XwihwvJMprWohMlA6q9MCRpLfTqsHNZSFcTV1wm4INiQZsNhvdVMIkpgjqwG?=
 =?us-ascii?Q?AWusnmAlpSFCMht+c2iOXx4QQ7klJ2PE8FI17zenRIRV6Ei86MLyH6hzQSAY?=
 =?us-ascii?Q?DUfI5V98LbJwegeU6jvvJT044jtwq5KZLdZC4GR2WuWNFLyH2VE/YJxE7pek?=
 =?us-ascii?Q?+d7QCJl8gsssQh/RWQJUyUZd1PJCGVTG9nPYhazXlGIRj/vm0SorZpmyY7Gp?=
 =?us-ascii?Q?5CnxT1vyhwTGWyPEEcXjD86mqaiOoZOetfETc6ILrocz+XncnOXhomnVqWRf?=
 =?us-ascii?Q?VRfWoj2Ru4pprwdu0xLq1FueqRMIsAdQKQg1xx9qBJV4d20fDSTe7se5Hf12?=
 =?us-ascii?Q?367l+PxKiegoCWJm53GsYOoRYB0nHq1+7buBMV7a8FBoH9giTkWkebmnoLp6?=
 =?us-ascii?Q?Uvj9dHZ+sIUq+l3Pd2KsQ/FQzy2dauoxy4zN28Oer/fl3oPvgaGVjjnjduNT?=
 =?us-ascii?Q?NHEW9q9JvGK78mulnmnDDK29a46nmGYXa/K2CVxh2HQfC+dLjdTL5DpGge5A?=
 =?us-ascii?Q?iO/F098M3RYM5U1e1TKVO7dIbtk9HuM48WU7WL1VJEXOcqJlUSapeQlL4lGX?=
 =?us-ascii?Q?j2HqugJ5Zek1U9qxFoVvvn/no2AfCTrzNNvpM0CPOkuFowkbWoaHiZwbwoRt?=
 =?us-ascii?Q?uou9lcZu5MhSr/iBep5rpIg9tPd5Cg+lhBJvnpRX1vQudX2mXfx2YP899TMJ?=
 =?us-ascii?Q?OjkZn4i0Nvyv/5tHC4jab9Me4HTFqcb0EmNJ6MwHC5oTjf7x74BWdCByf33s?=
 =?us-ascii?Q?nQVZIYGxaP2nXqTlpfcdafTifBeBdFnuiq1QmjCSSk/00Bej6DZ7CAKWgVfQ?=
 =?us-ascii?Q?QI0sdtXW/BwZGDAOJKU2gRmPGBpoedzT13AfBUpcy1cG08s5zzJJh0h0MfEF?=
 =?us-ascii?Q?n4u4QMdp3K3P607n5i8yE+sxcYl5c6B11iUlwJnpncSc3qvFdX9xOmlncwX7?=
 =?us-ascii?Q?8BStaDL/rBobQoTCRu0420Hm5eRdBC4wz4ShN58JA5ta60o1deav4W8Lk6nl?=
 =?us-ascii?Q?xIYZFpossFYHftLgA5nmVwNGd1G2uGE7lhILlI9HrdYcMRjhJbtbivGtMDsd?=
 =?us-ascii?Q?hESdDS0AXucKYAXlvyxKu2iPEN7S7aPPcCTzjwExqQFgvNZmBQ2D+Ai03cTw?=
 =?us-ascii?Q?Q7xA9K1ypCCpXGWHMguiJsrRCkn+yFI+xsg3y9PQ28VHpKlGRAKZeaZZI6ZR?=
 =?us-ascii?Q?WdbKlnPBZVWJuf+JE7Sf4x2L36+l2oARmISgKu7vawxjvBp5Wz+C/fYo61bi?=
 =?us-ascii?Q?V4oXMZNGDqdZD1FkWC0/qPyuQLADkaOlclv6E8QiTUUa+i+CA4gv4jWlBHs3?=
 =?us-ascii?Q?yTOJ3lH3e87nCy5NMg/ywXEVqTLSkwhgQZvnVBwqj0JCYbfkuQ0jlSfHHdK3?=
 =?us-ascii?Q?FKQ6BgVHOWkTRQ6F9gkwNTpywUy4iuW/glGIQSboEMFP0t5skbGm1arN4f/y?=
 =?us-ascii?Q?VOfkUU//oo2kMd03V68vNqc1Mw171rM87xTCzCg/W0mog5G4yucvrDczHGnq?=
 =?us-ascii?Q?lIEK6+4hcnJRPkAazPQtXUffhxJ8YCAwtBxeY1V6TQbPXGi9hJ9mlgJCKLFr?=
 =?us-ascii?Q?lDh4e48jcZ4FwwCbEtOe5J/35Bp/fT5/9GBaUqe6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f275f73a-0cca-4429-1de5-08de2c49f148
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:42:02.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qESCcjsVyC59751pdAVf+I+nt8hxq6W7GeATd96fpzK2B/ut/FIkq2yn3me+phjfcVXMhP31gkN+M+T78Glc2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

On Tue, Nov 25, 2025 at 06:04:59AM +0100, Raag Jadav wrote:
> On Fri, Nov 21, 2025 at 09:33:42AM +0100, Raag Jadav wrote:
> > On Thu, Nov 20, 2025 at 09:02:29AM -0600, Lucas De Marchi wrote:
> > > On Tue, Nov 18, 2025 at 04:38:46PM +0100, Raag Jadav wrote:
> 
> ...
> 
> > > > > xe_pcode_read_if_supported
> > > > > (Explicit about conditional support.)
> > > > 
> > > > I don't even begin to qualify here so it's upto you all.
> > > 
> > > xe_pcode_read_if_supported() would be ok IMO, documenting it to mask
> > > not-supported errors.
> > > 
> > > But the the way this is implemented with the extra flag seems weird.
> > > By "having the caller check" I think it's about handling
> > > the return code from this function and treating it as a fatal or normal
> > > case depending on the command being sent, if there's a fallback etc.
> > > This patch seems to add a function and not used it, but I may be missing
> > > something.
> > 
> > Forgot to doc. I had an impression that -ENXIO could be used for the
> > fallback since we already have it here but ...
> > 
> > > I'd rather have this:
> > > 
> > > 1) Caller should handle errors and treat it as fatal or normal,
> > >    depending on having a fallback or not. Emit an err there if
> > >    appropriate rather than here. It seems we are already emitting
> > >    additional dbgs in the caller for when pcode_read fails
> > > 
> > > 2) What is the command/subcommand triggering this error? We could have a
> > >    helper like xe_pcode_strerr() that users could call if needed (but
> > >    then we'd need to return the undecoded error), or we could change
> > >    this specific return code to -ENOTSUPP.
> > 
> > ... converting to -ENOTSUPP makes much more sense, considering the undecoded
> > return will be inconsistent with other pcode helpers.
> 
> On second thought, looking at it from caller standpoint, I'm wondering why
> this shouldn't be the expectation with xe_pcode_read() itself?
> 
> I'm okay with the new helper but if we're claiming that something happens
> *only* if supported, I'd expect it to be the default behaviour instead of
> having extra bells and whistles. The only difference here is how the caller
> chooses to treat it (-ENOTSUPP) anyway.
> 
> Thoughts?

It makes sense to me. I'd just peak into the history to see if there was any
documented reason for the current code or just some bad decision/judgement
from my side when adding that... if so, I'm sorry in advance...

> 
> Raag
