Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08DDC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 23:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9810EB45;
	Fri, 21 Feb 2025 23:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dU47UyQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D47B10EB45
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 23:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740179587; x=1771715587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+qDZPTzO1aF8VC0LlsayQFl9n+hs0++bCvl740VwiHY=;
 b=dU47UyQz80naawW+ypnFNwrhvPo3ius6Vx2XT6SVRyoK0NTYVTo9LAJ+
 FvDFon67mhdGIKkz0yTIHkZEyvrs+EovHErlz17M+an7CLgG+y0XVSynr
 P/00OAZaec7qDwYCAKyuUiS7lsVyZKRAnvIgfaU1PPrtaP63SuSC8zndA
 0S2xX3P1HjCjAc3Q8gqBHwdfDoMVCb/vRLMu8/4B0+cF+gXas7ArGvzGd
 lmZ5us+MA1+wqMv38J+ygicffRKIL0B9wIJ/Klm3lAuYDlHAg8FCakSSa
 6bfUkobnhHZMvh3QGuuH9DFjmM4dRjLLpZhzgjIrkbqVEBYkGGXnZF+68 w==;
X-CSE-ConnectionGUID: 4BTA6uwdQ0CD3G8P0YC4ig==
X-CSE-MsgGUID: PF4e5rwKSIaPSd4TYTG3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41134961"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="41134961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 15:13:07 -0800
X-CSE-ConnectionGUID: wHkuecB7R3yctXWuUFWzFg==
X-CSE-MsgGUID: 0jkTctv3RFu9zg1+XKWp5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115336830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 15:13:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 15:13:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 15:13:05 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 15:13:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sG/IeE0e/yyY+fes6lWFJwSUXnx9Ya/q5460J37ukfQYgQvQB3aRAQeWSyFFZoHBVarljg5pHx5JqYMRd22AkoH41vSUqw036Klsgsrpc92Jz9RWLIo1oNL7akRK3T9rSduPkjgHgFDp27ydmylCwOf2vow5SYsNI3SzT06TbznXToyBPN/7b7U4503uKJI/Djp6SGGdc2w1LoaYLuUsBj4RNP30zq/4o/sKVZPErGPFwuqDIp2GypcZI4zehpRkZLKH+5G6WDUTT4/EQxX585oT+EjCEBwy8ploT9musxqZQZ1skIDjhn7RhjIMu4+lIVSzzbHn5HSeSJ54nTO8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlDlRlWR0KrfQEHSyb7wacTIEBPSXekYGFMsXDtyARE=;
 b=cdeVsv2WosN01chtG+FXc/Io6XjOOzycAS7YAnIomY1aq7Wds+v/iQCPphwRcC4pGzn+zJYzTar/38zVlVvfxPvbyC45CO5u118/ZMipJVWujNfVK3baOzglCzyEv6PJvwfSXhVjfncNnLLGBEbZMymNCR/XJKoDPa4gKDhzu71nijJs8XhobF7UlUpOiJRHAceKzhImqguKSV8GJnkGkgMspzTSrwn1rFRiIKwEgxZtDVTPCZCKFX6+vWGZ7JltjD2HRSaXDMCcje/rXc/zBxQ3bbHttgR/t0SvdZw4goUzW92UYhequLJQyXYfLqP8ZolQvvnUSLLREap9W3B28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 23:12:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 23:12:21 +0000
Date: Fri, 21 Feb 2025 17:12:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Message-ID: <d4l67nlleh4addqamjacrexcaoovl75v7skama327nmbvprxgw@ueyvbghb7s5z>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
 <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
 <dgd4urucgypp7u6nqgjwacm3exeijvlsvuroq5iyxhk4hguxyc@xiu3pogry77w>
 <e8538806-06ce-47cf-8fe0-160a364bd43d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e8538806-06ce-47cf-8fe0-160a364bd43d@intel.com>
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: cc020fa8-895e-4007-f60b-08dd52cd31b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DwC8/70PPCtKhW/0E/2I2oBAQiIbUKTgXG8CTF/EZTIVkZyG19994zJLHAs2?=
 =?us-ascii?Q?/YciMVlMMGM7FRervesGseToJucbhqLaGeAlevSFlwoZNFK/ID1jlStA/OwR?=
 =?us-ascii?Q?KYbkAIPg4OpxOgraZBbyGKWkUqZgWkmPt+WD+hlVNGZo/9Za33FezRUQ4wOx?=
 =?us-ascii?Q?/U5+yTGvnx6OSSQzkQxYG5hGfwJMKxi2+CwJ7HFqbY5U48RB1dzevpD7TinS?=
 =?us-ascii?Q?sBv9kWF2ytEOhNlNp+HyYhFhlM2F8F5yRhPdvWrhz7DsdewHtuCer6wm8uPq?=
 =?us-ascii?Q?/CrnYzUix64x732AHlgPhgRzs2vTrV6i4RC2KiIVoO91l4hskDAoDY0jCDJB?=
 =?us-ascii?Q?c0sahorqYepYVjfk/HWDZ10e3z1yugoRwc8m4Bsyj7IS7DhmqVpg7PUs5cnT?=
 =?us-ascii?Q?JoKNPsK77y5sDNxk7VhOCeI8zj6XhBe0usa0n1sanDeQC1AfnyuMQQD38IAC?=
 =?us-ascii?Q?hwpsio77mIyodAzlgDOKF37VeQdLnQcYjF7bkJryVGad4Jv+SLsOKAuznV1h?=
 =?us-ascii?Q?uzxEwdeHYLt0/70drRWg7er+tfcwOm6rosqZ3BMhgQNM3AFta7dm8A1PxqYx?=
 =?us-ascii?Q?3HqPn0Cu1cJT/NR3JP79KT/hrAGByhj2P9/KaJrvkMvA17d2dWUb/LqFFDPd?=
 =?us-ascii?Q?YFtSlEPwl3/MknsAMUsOOJBnlM7eWEhfQ1QPwYbd+3EyYK28JzHqkjxsRhBr?=
 =?us-ascii?Q?Fl4RrtUViOQocQR/QLD17rm3vSXgi71U1eNn2e/wzRtuR59i+BFEjuOYMMLV?=
 =?us-ascii?Q?hqZ3m2Xca0Vd1llBl2ybe9XL0m+ZweaV21UdDLusOKGF8bed71HJvw8JNg+l?=
 =?us-ascii?Q?G2i/de1QWl6Ro495MjLz7b74er+LoGlfzfHv8hILC/PKUnycs9ddb4pO6oXs?=
 =?us-ascii?Q?wZQBr2QMMVL8gYVZdY1FoiqofShSb58qzZ0d0lGnGvpmhIil9PphWIASLtFC?=
 =?us-ascii?Q?sdqGzJY6yMpXfrSCORyfWv8/s1jQl0pF3nByag7pQTTgtgTGykPjeENBfN39?=
 =?us-ascii?Q?ax4W3htsuhWr/xqf0Xwk0cb9xBQmsLNnhZiFyXjFteKxKLqPrwqTZO/D+RkQ?=
 =?us-ascii?Q?X5L53NXG6/RH2GCxi1uJpChHnvbwoUSggoZaEpIpqmiZxZtugbNkUUnwEwLh?=
 =?us-ascii?Q?HuzKf3Or2rg7VlY3hDEOO2XfMLc48JBcERSC0t52glkEubt5NPbAoS5A6l79?=
 =?us-ascii?Q?tQp+W1yLK6iTi1UjPN51Ej1Ccj/3t3Cj/WMlg8qXZ2rBgETpt0PMHDkjiaQR?=
 =?us-ascii?Q?/OJ6nZWmBcbaK/AvQGTsfowJFMZxGkZl/S9cLzvPp0e37S4Kvn0oIyxT8+e1?=
 =?us-ascii?Q?sHqklF23FGRQz+AbPaT7fKdbaRMeEai/neh8AeDEoRH7HCJv0l7kG91C7yv1?=
 =?us-ascii?Q?KMBTckXl46BZpvjMLbvTehdsaaGQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNTRTD8VbD/ZSAGBbHfvQaib1PmGLjB5a0EzfrY9KrvGXl3LPl4ucBl0vipo?=
 =?us-ascii?Q?HnTEeJ4NqpEOA87dIvovNQ11RyJFOTC7zYMXcnwLDIokjol6/IZ+EE7TueeL?=
 =?us-ascii?Q?UnBpVenwfqsbpQ+awRJD83hs2Jyry852Po7SA+fnWvmUoUp1FTosfSSxGtpY?=
 =?us-ascii?Q?gInSuXxUzQMugGHd8TRIK93Yjex1FASq2j9ZKKZem+IW27XK843zyvH7RNRC?=
 =?us-ascii?Q?MBgZ0e/DwYww6ukEaFq4mcYnRjBBOAJkqzUFPzyG0ZmHsfuYKhgl7Vr6++M5?=
 =?us-ascii?Q?qTGlfIQ2NhUi4zV2Koxf3JoeOJ4S5BOge1KSMXOC5RA3izGdIv/xQY/LNj2W?=
 =?us-ascii?Q?toXdW7lMXAoJnFzoDnBO18lxlH9K+HKGzh1o8JG5YRIdd+PPE8K9dqugGIfA?=
 =?us-ascii?Q?uhAlOFgrFv6c+pAlxsDXmUH7hT/5P/uU4bg951wLtZ1FgWVdmfTFgrpN+2Cx?=
 =?us-ascii?Q?IKV2C0Gi1G+k+NRVlxOTDZfgcLmaRLZyJ9KxIlXX0OqJPUy6jZywMzNavvaF?=
 =?us-ascii?Q?G64SCTSO+t9ikxWvSs72mP/uOnL+Ame/lsVbWlZ3YQQJql4oL498bpt+pEGl?=
 =?us-ascii?Q?QsQzjG/t4amesnqvliYbCl8M8k8/lEa+5kBS3u+h9nx2zxtD09wxjW8zlAMj?=
 =?us-ascii?Q?A4t5J8oBAtQ63ZioylntD4eRVbq32HPnXTxoaLydX5Tt7r4+QK5beVt3aS5X?=
 =?us-ascii?Q?zxlIANcieCU7WTpJJvg4FLm1tNoTXMTE9Kj+s030EWUhxsfiYEUd9FJUW3Sq?=
 =?us-ascii?Q?F7yQ2wj7xHjJYFZ6gC/5/2CKfIyxg33IttaPcUcpsrNWwAHHd8cYwEbcuOOp?=
 =?us-ascii?Q?JFycYIPiEo+t4rziyAlMRLixUBRYnf3ygaOArOIlDTll3Gk2mQdSMDi82SaI?=
 =?us-ascii?Q?qO75qzd2XNZmztBLBRKyDuUkRA5KERmsRaV/HBIGBXIglSqsQA+VaGZwT8K0?=
 =?us-ascii?Q?zhf+nPW+J5ClDkmAYykrQM+LyKBJtf1e9LoapK6P8j02B0iZl0/OjOdhdQWV?=
 =?us-ascii?Q?7BLqWc/IQl5BgBZXtO6Ujd32cdYIZlsTc59+m5LDM/eXWSD2DWrn4nQiutHg?=
 =?us-ascii?Q?brgsDAZbOqaYQTe5dvh49L3q+l6H+MlXVLUbwSjOUYFXPKtpPA23pLaVw8HA?=
 =?us-ascii?Q?pDz2X3qGCjHnIVH1IRzKrG/Xv4hzyrOqMA/j4xVAoetUBoEcCe7cxdGCVISf?=
 =?us-ascii?Q?6vLnqot+FUWwFw2v2kQBxVEoUpZeDnVfV3Y//kr8WgcBu9PZKy8sQXOQqSLE?=
 =?us-ascii?Q?NRHpWKKw5MZLwW5E198Ol/DF72MGoKUMbcy1UwRATrJ6P1R2fZkM5R7WYalw?=
 =?us-ascii?Q?HlO4XCl+se9RWF4kN3taLPjkdnLjHSi5gSljzfDBgToOeHCQl8PhKjY8HQAK?=
 =?us-ascii?Q?TGDxsfknnOIPdvw8MJuzMBZuo/f1tVnfSig8PUBs//g9G/QRueTGVVwRehnf?=
 =?us-ascii?Q?G34iOSdw0ULcIDn6m7jXwSBPrulhigOCx7JjzoMTCpWfB4JtVXBM8IBdX99f?=
 =?us-ascii?Q?OWrommUFUSM152Uy31cG9mxc/KeWUJmX5FctnmiOWGbr67VWsh/x1LUyiFHF?=
 =?us-ascii?Q?3I5HVqFqn7/RxGxYg1pcr9kZ3yB/P4tgo+YiADOge7KsdNuxwvGK6nYGsTMa?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc020fa8-895e-4007-f60b-08dd52cd31b7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 23:12:21.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEVf1ubZE2saAVwbgKUeuzpmwITq0QobUVkzMEJVxvey49jUt4VXokffGoFG/cff34XDl2j23UXJzTPUn1Lo22E/nL2csDWScF+FmV/C4f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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

On Thu, Feb 20, 2025 at 11:11:30AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 2/17/2025 10:58 PM, Lucas De Marchi wrote:
>>On Mon, Feb 17, 2025 at 10:56:22AM +0530, Riana Tauro wrote:
>>>
>>>
>>>On 2/15/2025 2:53 AM, Lucas De Marchi wrote:
>>>>There's an odd split between xe_pci.c and xe_device.c wrt
>>>>xe_survivability: it's initialized by xe_device, but then finalized by
>>>>xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
>>>>the flow entirely.
>>>Hi Lucas
>>>
>>>device_probe_early has other init calls that return error. And 
>>>since this occurs only when pcode probe fails, added it there.
>>
>>right, but it's very confusing to have this flow with both xe_pci and
>>xe_device playing a different role on init and fini.
>>
>>>
>>>I hadn't added the fini in the devm_action because of the 
>>>pci_set_drvdata.
>>
>>which is now fixed as a prep patch in this series.
>>
>>>
>>>As, the remove function is moved to devm_action. IMO it would be better
>>>if survivability_init stays in the err condition of pcode probe 
>>>because if someone decides to move pcode_probe to some other 
>>>function, it would be intuitive to move this too
>>
>>but from entering survivability mode, it would still be after
>>xe_device_probe_**early**().
>>
>>An **early** error in xe_device probe, by means of having a call
>>xe_device_probe_early() means a very fundamental issue with firmware and
>>we'd better enter a mode that allows us to recover from that. If the
>>call to pcode was moved somewhere else after that, it's mistake that we
>>should fail in CI (btw we need a way to do that in CI).
>
>Currently there is no CI for this as it needs a firmware failure. Even 
>if module param was added in the future it would still not fail if 
>pcode probe was moved.
>
>Maybe can add a comment on top of the survivability_mode_enable in pci layer

ok. I'm rewording the comment that is already there to try to capture
this change that is about failing on early probe.

thanks
Lucas De Marchi
