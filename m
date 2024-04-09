Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B094FC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 19:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521910E0C7;
	Tue,  9 Apr 2024 19:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlPYJdvC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B85810F045
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712692355; x=1744228355;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FoHEufg1I5RFvmwtHJkSF6lfODJNoll/sPbw+Z2h+Go=;
 b=jlPYJdvCLl+k5uEVlSF+sjgMuWAzr5N0AFFPB8XlbVq5fcvRryL+C62f
 BxY3hs+3rbTfgiV01hjmRrIl0xWk/srPN5UlbYGZaJfRd+khSEd6PUKHR
 uvtZoSvz9cqxVheffjSLWhg0sbbOTY3bp7bJF/rVoKccCX2vjQEb9tp8k
 1rDp5+hy4xP3lFiqjDTUUU5eyGVKplhw4zBXWjVh6jk+Ro58vUed1OWje
 zk4MlrE4oO7gAtXgRG0EtE7nIYEGwfgjwoHHHYiZ68k7r4peep3RUqrh2
 iK1za4N9+RV1t0JGPdr5s8QqFq9NXTdTtTwuhWum8WxZnvCLb17gHoltB A==;
X-CSE-ConnectionGUID: LDYasukRRvKfe1z6t6xgUw==
X-CSE-MsgGUID: yaA2IFVOS9mIMEZH9ftN0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25529469"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25529469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 12:52:34 -0700
X-CSE-ConnectionGUID: bAwlh+2IQ066gHMtA3ULlg==
X-CSE-MsgGUID: 8KADTutGRze8oa5cfRXxlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24997273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 12:52:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 12:52:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 12:52:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 12:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9MTZPCogrkimY+f1aJzj2iZKebmBBOLTMfmisj9NZI2Pkvfhw6cvdDq59gSXURCeDMJp3znaSNVVDaVsjFHtkh7ZVqe9BclAm9T3/zD4ob7/OuFEKmqt6/rMJd4dUvZqj6WqWNwpBMkLOi7SPk6KtXU7uRUUnn5YIaer0EvootVruNSG5JklIheakFtAkThXIndOzlEn8qDScoC4KAE5/P4KDPiol+yozUwgpbaUhB+lk2rc6zHY7FdoHsoMCMLvjYEKD/U7AI0SwHrSqi3OzdCWEE1Bo/YWOnINqkjOfJ9Rx4tcHVpOpd71c92wz78TBwugRk4puJ26NThd1MVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoHEufg1I5RFvmwtHJkSF6lfODJNoll/sPbw+Z2h+Go=;
 b=h8cmuMC1ryfnPNEAh6qwDa+UF84a3jeSeB0UR+72Cse1oPsTtZZkl4y+oFPYeH6eKPlblCLe7dZONfwcKnvpgFbReKtb+nDsnEuIPo0seYDs6wUx6J9GCEAx5LBACj9idlQha3w+V0Vv7AM6jd5Tc+XohDHqgwd/JGir7V0deUB40n5aMw9e0VMRTSGOlP1yL/Z9ux8EvZwchbKkB3iJNxReZClcxMJPCZk0LfAg2nArn8mp8P6lblyg4r6Bf2NpPdYc11vpVyDK1aO4qn35U8LCLbUz5VgpKJVKif2fxyplb6EKx3VmvNFlSvQW4YTqU7veZ8oshtxP6kjgzN+Ynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 19:52:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 19:52:31 +0000
Date: Tue, 9 Apr 2024 14:52:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe: Incase of action add failure, remove
 sysfs only once.
Message-ID: <atf7fcy2ignoudayaogol7v3bk5qcxmpmjtseltdbcyykzm55n@x2mwopb74dns>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240408144944.604448-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlIRh+gwFnGzpyEGpDHwGVHAg/saEr7nWn58dFnSkokaniZauIf3O8XwdDOW+i4eyVTrgMHmXKyoYqNftChtpjUXSEgIyrwEUJ4hlw72hxZhhc0c4MmcudDcBjRRK7B8NnuTSYX/3hp0CD8SqZqPwcDPr/iuWxpVFGx6ZCcihQQ0769uu72Orh9+T4Ort6weCrxTBq4Lbd3587+F7pObga7J2yxAmbCiuw9SBzFARlQkRpDMYxW7fTXKB0EpXIl72KwXy2jCNpPUmgz/bRmIx9JdShMBFOdttVY4w+cdkSFLapTxB83Y6VUafuxl655ckCIC1pOPAGPdA68HHehsp45XlJ36k+hmVSOv+XxSokpotaUJJoli83ypt3VRBZUCc9RmqsJAM0SP7NTaijLWUgAvr8VHVHTidRRFx9JG2EdpOa8v8h4nqpuslcVVD9tPJJgWkSUYcyqGjhVKBbHxGJFFZQuulC1scD2kIeZnhHhmjyeX6hnPOGwNDcCB7RjOZ1SFvmj9YDYjuQYp7XNe0oXQHXIEKSCrfFVXDtcTpBrMHKh0XJA1+rXzvjqJCr/q31p8C8HFfO3859LvGnVyciU3tFfv6JjFGRrfaejy78qVfYX+G1Ybt+yziiJ5YtfZKspyfqHTQmwZPnmvmWTGnXkE/3tD6eosYuqrH/dOXIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BlaKmGhp9EqHD2fPxtA5rCQo023BVpJ90xEZ1eSoU00y4+/12Z9cw6Ow13i4?=
 =?us-ascii?Q?pnkHSzbjBR81GdUoV5bdTwUqgdGGCkgwO+/Q4hedZSfb1KUM+pu/JkT0tO0T?=
 =?us-ascii?Q?VDuv9I0w2e6cvxoeHiVTEkLm9zqqnNGTHjCxyPJ1XXW9qD+rPx+z4A6SdjK3?=
 =?us-ascii?Q?KOBHwbL6JCzn3McvSzg0FmPZT7UHFZnpjDsARsPel82ryjJnds8bP3LPXKk+?=
 =?us-ascii?Q?hYvXSCEHsJ/F/mM5xFNHIBnjR7PpTcOWk6vDF4gTCE0T3uXH5Pqe1VUpPEdd?=
 =?us-ascii?Q?m9jsua4I8W4b5TwR9LYpPy66w2Ssv73QvkBgeN88w7De6cZ/q/Q4VGj0Qzi7?=
 =?us-ascii?Q?sc0bBcAxWB7vmj/h+heBXUOU8WNSSd1YksHGVVYUX3EQZ5fNuKs7rrda1S/e?=
 =?us-ascii?Q?WlHO1jnFkAQEIduOsX6MMkGAeGAXr4BKGtGxRwotBY9i+f2n7FEqAaUKzqKp?=
 =?us-ascii?Q?gkg0fjRp0AqT/lCFAW0HaOOOesj8DhCxV0uBhpehunYuqybdVa/jz3JU1T6k?=
 =?us-ascii?Q?fjobvsSzaHeoXUwIRAJVexWDavfnsr2mbMCqSOvSQIcP3AWYUzLxRNwSj7kl?=
 =?us-ascii?Q?u1lyCtrNm89rC56upvtiYr7EnYdS/Sihrl5a4PLLuV9jZUv5B6kuKsJRLMQU?=
 =?us-ascii?Q?4as8FlK2TSkjIhpYwc6U7q+9EceiIGTSSOyo53dcmqqP6m/3iPWBOMM9Lt/1?=
 =?us-ascii?Q?bXR/6OFH+qer955FJFZ/KpMN3h/oHTzqAjykPU//xS5slWFNTFprZ6PAbnzK?=
 =?us-ascii?Q?JHmRUbun0CS7HJr1/MzkHaBZExGlUIqQZYAKlsVvYOX5tIE+b2ArpZFJaM3k?=
 =?us-ascii?Q?68q4GxwfSZwHWTsmOzmEPQFxU82o+cqFRxml0u1ZSt7gJpzKoQaiUbh5qZYq?=
 =?us-ascii?Q?IZErMLkGP4QbJAS7DK9hx9QvOiu3tPx45Ya43Jw2Y4mqZK5F6vknxAPTGzL6?=
 =?us-ascii?Q?YazqOKCmG8YEjuzeyly4k2D1J2g4nsS8QBihSgkdvuizAI6nt2gjp6cah08H?=
 =?us-ascii?Q?CnCQJQEgCo/pxNmcUz+jwh7IyZz/pDDue/4fv9eAY+E0y2oUgOyRwMiUg/dO?=
 =?us-ascii?Q?rXpPWaY6CRcCO/zN4tjslZ0pgQmJudVcx48Dze6yFlUE5GqZ0HnEoDMVYB3f?=
 =?us-ascii?Q?lcO3gfU8MFqWPdJKFq8gCqNf/ZNe353p8C4GzR3FyQ7QP43MvoJL5FHOxhG2?=
 =?us-ascii?Q?EjIPrcpiIuTLb9GCCQK44Vf5QwoHwKg2ggYY5jZ8Zix8z5KHiCW0gZedEWY1?=
 =?us-ascii?Q?9zvviiax0maTS+CoSMIocIVa+w00CPiAqu76+L+IEp/JHLs3RGRNbnGTlr7h?=
 =?us-ascii?Q?8rbZ/RMhP8lwUiW4dRLYAzy3sH+wIprtNUiGkl2SDNHdDS6E8g/34VexWmmb?=
 =?us-ascii?Q?v9Lqvcjd6VPobkzIFGArEvFzxLpVon7qkMdWouxoMvQahJoE2na16vfdiW22?=
 =?us-ascii?Q?1u76145B9HJrITjA2LVZLzyjT4e1g9Dt3Rc5r2d8sU9C9vpI2fZ9kP5PZvXG?=
 =?us-ascii?Q?rs0k4PJh6Kby4IulMI/JvhxE2eKcI5FPsxbgBbgAoCykP5YQAIyjQ+4Emcmx?=
 =?us-ascii?Q?3LmwhzeMv54TI9CpqBGM/tmLpl+OGVogQ8RKDjutVtTVZV1IvhoJlYK/DfIk?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba9ab17-8e7e-4ff9-abbd-08dc58ce97d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 19:52:31.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsAgwCNT9V7h7t0cpaaPRhxTeIMV4Z/A33n320J4e0exn6WXmRzkdM9yt92sDvy4jNwnjl2+y12rK2ZWzWG40wHean3Z2LuGE/lZ/zt3Tls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

On Mon, Apr 08, 2024 at 08:19:42PM +0530, Himal Prasad Ghimiray wrote:
>The drmm_add_action_or_reset function automatically invokes the action
>(sysfs removal) in the event of a failure; therefore, there's no
>necessity to call it within the return check. Additionally, it issues a
>warning regarding the failure to add the action. Consequently, there's
>no requirement to print a nearly identical warning within the xe driver.

there's actually no need to print a warning at all? If we already add a
warning in drmm_add_action_or_reset(), that should be sufficient.


Lucas De Marchi
