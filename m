Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3329CE8B37E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 23:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD710E1EA;
	Tue,  3 Feb 2026 23:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gcxi6Zx/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CC910E26B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770161770; x=1801697770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WlMATPm5c7CoJ66Oy8CuWaufzQOnAxvYdGZznV20/PY=;
 b=Gcxi6Zx/zWgrhNwYBek3Fkt3zllSajEI54gveW7KpX6GyG3aolgSn/AX
 oqMIzoWL2JEMamADmAVu8lb5KfWGBV4i+QpK3Og7BFsZCoO1Ov+1xu7C3
 0eVSdTGKhr9ypY/4UDM/sgNc6Be1DBHRplC5JusSiqjAu0zoEsdPNw2n1
 Y7h+gRWqxEXwjD996GzEhYi9RCsbBzEkEdN5bSz316dCtJbKPM+BniTAM
 0+3hhhwIxngdBVchkLqy4XM+E/oFPC4NdwkH4GMAAhDNY1v8GCPfmJRjb
 b3hOZZoCsCqLX5man467dWt4Pliz8oHh9mhp737gXKSQAWbufW4V//R/L w==;
X-CSE-ConnectionGUID: i1yyNr6vQnCg09dOrJf75A==
X-CSE-MsgGUID: 8g7zytwqSo+LB76Ku37Egw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75202270"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="75202270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:36:10 -0800
X-CSE-ConnectionGUID: TWzKK8YXSOGqBrzfe74zzg==
X-CSE-MsgGUID: iPJuo6vIRAaIasxihUgtyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209378263"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:36:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:36:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 15:36:08 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:36:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6OQfGt1C07z8O0LPIDkqL7fF48TUIDKkfRj5lvlup5dKvMxdyCRbXhgsaViC0wfnkGjpvNYQIzyktpnAH9cQ2O83USdye04zvANYc3A5Gx3XnroAhIG71yaXLVKBF1ihWARykyi8XNMBVrTYM3AO81gy0ziNO/uAm7oCL++cpYiGZ6nxRpM46vqXAIGVrDm3mY7gIZYebDReSPD+JFz7vWJaKiZTaZqskEWtCrE6Nq5w6bkHtlumJtimcwI8zrH+o1NPqrLmdebWEhujBosH+2CID8YgfcE0ur88+jCJ5tqfaJyEjCxiIbMbxv7XFuOpsELqRP2VdneBGcOBp+Hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyipxzKvadbyWWFfaLQTwgL9o/jPT60vJsAAdGtcQHQ=;
 b=v/h3eAZtBf2xdgXSO5NIbB3eKvtLs4aQw3DuB83A5ts87itcZkxIfqCEK82PRFoYKoHiDdDmLsf+4DFCvkCqgyPMkQj5UlzfK41TFcj/c0FkeyHuQ2bjC/FrTHjrP+cZPJFZl6NNLkYybbs3lcAti4QmLeJmbPlQHKF1ROvfUzS9dggTOy46vJnB0TG3pp0fn0dWR5nenDhgvRV1CQOcz+8KFgNaSIM94mRu3CGKNXX/dFG5oHrbidbUC1fTpjPwlyD99mSfmf/WSCvMwfgoVJAST4oekR0S11Psd5a9IilLYdlLSA5K9seWYwyxw7nQcC1NIID3+p2jz1ygGpZ8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 23:36:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 23:36:04 +0000
Date: Tue, 3 Feb 2026 15:36:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe/guc: Add Wa_14025883347 for GuC DMA
 failure on reset
Message-ID: <20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com>
References: <20260202105313.3338094-3-sk.anirban@intel.com>
 <20260202105313.3338094-4-sk.anirban@intel.com>
 <1d343871-4872-4ad8-860c-6f75312eb9f0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1d343871-4872-4ad8-860c-6f75312eb9f0@intel.com>
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad1abd6-8c66-4cd4-ef1d-08de637cff36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9oIN8OU62SacdVBLMNlTfDKURPH9cP5Woa1fIojIZs8YhxasGMnpag5sM8ve?=
 =?us-ascii?Q?RSaIC61hrvOCuVIk+EvJXxoeQ1n9R3ffWiJGeT4NffQvj9WSiMeX/jfOqm2A?=
 =?us-ascii?Q?Gw4BdTzaDDm3S+EGWWPLlAgQGeLlCpoRvfttj6I4dQJ3Ap1aaoVC2fAKzfrj?=
 =?us-ascii?Q?/fCFsn4A992ti5MJUGLLSFJdZx01X7oADu9RxYG74fMon79iaJMoPtaq9hCX?=
 =?us-ascii?Q?Kvtg1r2e4JSoF0bqokuNEjs4xaFxXvBMK/RQUDub57NS6EWTqDpMAXVuL4kK?=
 =?us-ascii?Q?Ic2qLSPu0gM84MYA/Y0oohgBN+jYYiXMTInd7k4gw2CQR7/QttMFaY31tLv/?=
 =?us-ascii?Q?l3N34KDPxiEFfvb9PV4CYhp2bYXh9u/EB6CHpw5JOmiRUHy1S4iZWPX7Be56?=
 =?us-ascii?Q?Efeg7ntfhVkl7jqNbS1Tj3wD9w1jUcqFk4/y8Ww8sBZH8ycJ+ezOCTaLmKp6?=
 =?us-ascii?Q?7vnZI2FoveugFdQPqYYr8bgIZUQUlwKj/OBQ/zG+1D5A2DJmXQc4zgeb0f2I?=
 =?us-ascii?Q?l9R6NNtffiDgbYwejMXoZs3yRin7iDa4FiYqVYH54UN/MjXzFKz+bB3LolXt?=
 =?us-ascii?Q?puTH19n5QtMCZ03dUspNere/ahqqc/Nch7R4nVr5uN4wado9m7Uw5hOx3X9+?=
 =?us-ascii?Q?UzsWtTxaNB4BocH6rQlWTpJRaZ1LEpDGgc9Ooduo77dQblb/pUG7eWUqek9t?=
 =?us-ascii?Q?bmgt1A8qXsyy/wl8uFIv6MIVAxK9h/riZJa+oOA+yKy/8mWz6TaYU2lYnCe8?=
 =?us-ascii?Q?tGSPcrQEYkYDvKIgJJsy8mTgbDTwlIg3r6AU4U9zhoRMGFNEhASH3GkH/mER?=
 =?us-ascii?Q?ZeKXUXwHW5BnHgjf9cnqhfPholM+1Glw6FY3QoseDL6g27OnwiU8a/HGyuMo?=
 =?us-ascii?Q?jJGo/kIdr49KsxkCl0mFhlw6UZOAiRg7fz9ZhBWMvdabbk0gXQ2u3PYEeuc/?=
 =?us-ascii?Q?AUtFlynwcLOgxPLqXJVTHM5Qu2Dv9SJm0BAv0utnJ3vJ/564zVbcmkHBsMVo?=
 =?us-ascii?Q?z5ZsqgC63S9aLLIBMulLfPIXGOFKXtmKvzzwGURHSYxpIlF9ia4Wo3/u4uNo?=
 =?us-ascii?Q?I+UO4ZQ8XwgEMHKp0nTSoeJ6CDqsSoDXGq4GwcvTWwipPhzvKR4RSMpZQYkC?=
 =?us-ascii?Q?EvarEqicbjXjHX6F3d1uO+zPVaAb+OCJDdSgTwgDhvSATcDTej9O8QRHXMvQ?=
 =?us-ascii?Q?SjNcncsCbf2z13uLfbBM5NruKFRuPCLZUsO9MbDC0F07n+6tMlxbRkWF/WgU?=
 =?us-ascii?Q?dOsRxY7IoSWah/b6XufGQpV3jLLJa89kIpAxiDG6MGC6RsiW4f9oTMjbiO0k?=
 =?us-ascii?Q?mQ0Gfo6UDLdyqT3GDH5sThqrtY/ssXTtyJA8ACiB+NRHGbaTnBsos7AdJ/Pb?=
 =?us-ascii?Q?JAxrA2c7RlmBQu1pl58223lAbdn+I7utDw2EWpGrs6/ATnKLu88lUaf7hQsG?=
 =?us-ascii?Q?UqanGpo5VGMP2TmT3LF9I4c8QvLneNZfOVDBtk86W4NZHrGVPHbvFHDT/pgu?=
 =?us-ascii?Q?MXwPNV34+w4KC63BHVyc0nt0YrKlwJZyqodn6t/bFap2ncsSNGrRaET4RDvF?=
 =?us-ascii?Q?6BmcZDofIJumn/OnPQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NmHhhHAmEr0BznGy1BhkEJF3qfWRFRWNFSBqT4R2RnIX5iwQ+M1V5g41zohZ?=
 =?us-ascii?Q?smLS7LHxMxNrvA8NmoLbhuiG7embmH2ayMWFBEHw9dqcuFjyJ+P1h/BoUPV1?=
 =?us-ascii?Q?6OK4plGMLuFt8pEPvkoAEa1sfFXmEK9sPUlb7ibClCsJ9xBoTjHiYQl39iYq?=
 =?us-ascii?Q?7p6skfAO/7Cofoppu9zCozjYjEV9RmR76dBZtIHShDwfJsCqqil/7MzIBxJ9?=
 =?us-ascii?Q?1UdYCoLf6MHLIhrRUdlHcAQwOMOmKg7O1YFgUFo9FBycXj3F8rC6Pt9BtP42?=
 =?us-ascii?Q?tQpCkDuuoTYtM19Nv2BlrqcJ8TG0NriyHASJCSCw8mI8wV9bPr6JCz0YiKiS?=
 =?us-ascii?Q?LeBKZC6LmXyamCuD4luj8IQSBTkbX9g/0Wi8lVDADMmX0NRoaS7UjevZgyoJ?=
 =?us-ascii?Q?RqKDcir69HJSZvHEveBk7kUjIzWxCjKPROXC5xfLXmKiyhdoU3APfAnlXb9N?=
 =?us-ascii?Q?n8TXBozdhRMoCM0J4/pa/UcQqfsvSrtN7mV5I9DCEyA5lSc+eruJkvcCGfmi?=
 =?us-ascii?Q?o38hMcKZxI9IVZsquZtsG1J/5UgUIX8Ak2LmFV5Ez6e2bUPTqjx6rAjIJlW5?=
 =?us-ascii?Q?0zvc5pLf8NVY5K3mfU5cYiA7NKDC5JFmdY40xXSRMdnBeVjkH7mBjE5Okbnh?=
 =?us-ascii?Q?VKoXUqjydqySt6LOl9VJQ7bpa73T1KPWLfc23otccpNHy/Un/44K9Ljzweub?=
 =?us-ascii?Q?xdKY2xx3mY3hdLjwaYp3dG1IXbgydVz70N4nXisSpY2Yj2HdRLA0OQT0BDKX?=
 =?us-ascii?Q?sSXtyPVlWUS03w+3eUV/04sZSY6zpJey8UJiZ5c0f4dzkJo/aEB49yTgFvek?=
 =?us-ascii?Q?cBhA8Phtg9Qja8/hiiFF3ubX9Z7LeKvtR0KVa0JzRbVMgQSnX004RFdbDZE0?=
 =?us-ascii?Q?QBR7kZvNtxwyHT0RTq9JkOMR0SQTgyJYuqEKihPcXM9n83ngn2jXTBVbuEIG?=
 =?us-ascii?Q?wQ1HL+ndjT2iYs5VYNTmUlaL1u785RIYu4gLgrZACa/xk78GYI91eBiGxa6t?=
 =?us-ascii?Q?N/XXNc6Y3x9BlZSdyrBndWEpYQS4FQJELV9pCnex4IJyUOyxX8EQ7DPmjx3d?=
 =?us-ascii?Q?g9ymyqHy1oxoy6v1Qhw6JJzvHIOdaKChaLibL4m50gIwuZKKpi7AU0nsNZI3?=
 =?us-ascii?Q?F25b9A049AQA/8ad2xY2xglUZXxZzhu19vWe7MgIwsd2t41VUCdbE0qv0Bp/?=
 =?us-ascii?Q?fKUAFLXkCFuo+ghWyvNetI6xBb9e7WHCmSzUjIOhkmkbM6PukIBDXhdAbTZD?=
 =?us-ascii?Q?OQbtoj7ZcpgaWygd5cWP/Vp0l9Tbp6BS6hPF9RFUJcg7mLAKsQgdAaQUsUr3?=
 =?us-ascii?Q?syvcYLSoPGiaDxkfF5bPwyK0O+qovY/wVRu02m60JztYcVI67IGbmhrikt3g?=
 =?us-ascii?Q?Ejv80B0uu0o5s5cItsWxakidL5YPOfo2cvGmu9Kl66MKwzjV9IhQmzm1X8T7?=
 =?us-ascii?Q?FdxScUmQ/Wdd1OPYQtWSm8Q+KYwgUH0RP1LP6Mi6VKX5Z3JAfb/J02hlI8DH?=
 =?us-ascii?Q?Tu93K7XkxfvVYbWEiZ8pcBMlnSoScgkOCIPOCbeZs/ZHi4blKzEJiviUziYq?=
 =?us-ascii?Q?QK9P7yyN5e1DAv99jgf/Xzzr3DptyaFfL7nL6Jb2a7cl3MvWTN2m6vE6C0qT?=
 =?us-ascii?Q?dP2JAN+xVB9mAh1b/v6E6JwQegq4Q71p5NtQimPBpKkzpoIRV5nD2rEuA2cH?=
 =?us-ascii?Q?NVM8W1orcknw6xNBCtni5LjrenKbp0wziZ7AkvAPAb1T6YQZMcm89lrumT71?=
 =?us-ascii?Q?7Kyslwq4eWhE8QzhyIup0N3BB0LNlQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad1abd6-8c66-4cd4-ef1d-08de637cff36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:36:04.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hP3JPxQaRsvds8XhTcyuSxUW5B0C58Q192Pwi+jPouHiiutjNurS/VytUFrUf6wVa2F802hk5xCQWC5t8ddJocEBgIUgafr3I2HpZf1mMgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
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

On Mon, Feb 02, 2026 at 11:47:18AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/2/2026 2:53 AM, Sk Anirban wrote:
> > Prevent GuC firmware DMA failures during GuC-only reset by disabling
> > idle flow and verifying SRAM handling completion. Without this, reset
> > can be issued while SRAM handler is copying WOPCM to SRAM,
> > causing GuC HW to get stuck.
> > 
> > v2: Modify error message (Badal)
> >      Rename reg bit name (Daniele)
> >      Update WA skip condition (Daniele)
> >      Update SRAM handling logic (Daniele)
> > v3: Reorder WA call (Badal)
> >      Wait for GuC ready status (Daniele)
> > v4: Update reg name (Badal)
> >      Add comment (Daniele)
> >      Add extended graphics version (Daniele)
> >      Modify rules
> > 
> > Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
> >   drivers/gpu/drm/xe/xe_guc.c           | 38 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_wa_oob.rules    |  3 +++
> >   3 files changed, 49 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > index 87984713dd12..5faac8316b66 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > @@ -40,6 +40,9 @@
> >   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> >   #define   GS_MIA_IN_RESET			REG_BIT(0)
> > +#define BOOT_HASH_CHK				XE_REG(0xc010)
> > +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
> > +
> >   #define GUC_HEADER_INFO				XE_REG(0xc014)
> >   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> > @@ -83,7 +86,12 @@
> >   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
> >   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
> >   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> > +
> > +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> > +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> > +
> >   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> > +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
> >   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
> >   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 2efc4678fa73..369b5a8f129a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -911,6 +911,41 @@ int xe_guc_post_load_init(struct xe_guc *guc)
> >   	return xe_guc_submit_enable(guc);
> >   }
> > +/*
> > + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> > + * SRAM save/restore operations are complete before reset.
> > + */
> > +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u32 boot_hash_chk, guc_status, sram_status;
> > +	int ret;
> > +
> > +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> > +	if (guc_status & GS_MIA_IN_RESET)
> > +		return;
> > +
> > +	boot_hash_chk = xe_mmio_read32(&gt->mmio, BOOT_HASH_CHK);
> > +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> > +		return;
> > +
> > +	/* Disable idle flow during reset (GuC reset re-enables it automatically) */
> > +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> > +
> > +	ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
> > +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> > +			     100000, &guc_status, false);
> > +	if (ret)
> > +		xe_gt_warn(gt, "GuC not ready after disabling idle flow (GUC_STATUS: 0x%x)\n",
> > +			   guc_status);
> > +
> > +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
> > +			     0, 5000, &sram_status, false);
> > +	if (ret)
> > +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> > +			   sram_status);
> > +}
> > +
> >   int xe_guc_reset(struct xe_guc *guc)
> >   {
> >   	struct xe_gt *gt = guc_to_gt(guc);
> > @@ -923,6 +958,9 @@ int xe_guc_reset(struct xe_guc *guc)
> >   	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >   		return xe_gt_sriov_vf_bootstrap(gt);
> > +	if (XE_GT_WA(gt, 14025883347))
> > +		guc_prevent_fw_dma_failure_on_reset(guc);
> > +
> >   	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
> >   	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 5cd7fa6d2a5c..ac08f94f90a1 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -73,3 +73,6 @@
> >   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> >   16026007364    MEDIA_VERSION(3000)
> >   14020316580    MEDIA_VERSION(1301)
> > +
> > +14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> > +		GRAPHICS_VERSION_RANGE(2004, 3005)
> 
> We usually avoid having these big ranges in the WA table, in case a new
> derivative gets introduced that doesn't require the WA. If you think it is
> justified in this case, please get an ack from the platform enabling side.
> Apart from this the patch LGTM, so I'll give my r-b if you get the ack.

Yeah, in the past we've tried to avoid big ranges for this reason, but
I've heard suggestions from a few people lately that they'd like us to
revisit that policy.

Early in Xe development the driver didn't really support that many
different platforms / IP versions, so even when we had a rare workaround
that needed to hit them all, listing each separately wasn't much of a
hassle.  But now that we're a couple years down the road, the number of
platforms and IP versions has grown a lot, so it's a lot more painful on
workarounds like this to list them all out.  If we switch to ranges,
then we'll need to do more work when first enabling a new IP with an
"intermediate" number (like the Xe3p_LPG that just landed on the mailing
list) to make sure none of the existing workarounds need to be dropped
out for it.  But I think I'm okay with that now.

tl;dr: let's go ahead with the ranges

Acked-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Daniele
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
