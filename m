Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E19CCD187
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 10:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480410E209;
	Thu,  9 Oct 2025 10:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S32R48j+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7193C10E209
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760006909; x=1791542909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f6sNSi5SpYSFyRXncp9lO8+JKs0bcWN3ybbLhUE+Onk=;
 b=S32R48j+Yk9dgb4iCTm4jCZSycrwWO8ZEVhR47bkhkKaeemhRc5ufGES
 7CUoH4B1x4WZst4AH/xm108spGbPpP3hbAQyK8Oux+li9ZRAFp7ykEHdx
 cB/r9jPSv2pidNpy/CWpdweGbijGFX7hMj3AjPoWAmCU5j2YCUpNUZ8/B
 oPpd1ws8C4lUSQ0WM2Mw2txB4JDuufxi3GSEcSs86TW1wGXiZ7X/q9I5l
 5yNkbkpEAtmCej3dKzkX1IrhjEkbG/aR8h7AEMsXqcHJ3LEETpVec5D1g
 qvdk7EeYZR839u3P94CefxaLIqq32RPXQhSew7zYYOr/xDD3NtOmqN+xH w==;
X-CSE-ConnectionGUID: ICjNGGqKSTu7Lj90kEnb9w==
X-CSE-MsgGUID: rGfMJWwtSbasu3H13ztPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79858521"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="79858521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:48:01 -0700
X-CSE-ConnectionGUID: 2zAGg9M+RBWof93naGx+ug==
X-CSE-MsgGUID: IrnB0B32Th6e5n6eLARbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181110028"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:48:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:48:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 03:48:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGKOR0Fd6A5dBRna3VZOc+eTcT+J4DrKxw8vpSIT/yrgCbBsrv5g6nZRkNkvsbdAb9LDrmJ16apmZjlsc3yFQoRY+7blRI6n4knl+WhVayoNBuLeKo+izm44QSFk6hg1oDbeaBqSS3Q2y3RCWpFI5MUD7uBB3CX+fWDUE5GFl1udw8A9Sr0HV8FLLqpui+dqpm7q+bisaK+neaxmxEKwwdYqTXdV8V2g4EEBrH22m87XwiXa3X6RVG5Xht51cQ0MsCBv3tog31DvtlEbALkUxkvudoK3DLsTqMMncii8Jurltt1YduI+DllSQVvu829JGSDMgKTIxlnMqFFzJc0goA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WouzRuNtOFEpA2xg0wJmT+CCGoMHdOsecYXyLUP3zYQ=;
 b=s8nTCb7rgcNklUWEphCF7FDuRac77zbOSO6B6oh7hwO68iE545/mV7+6oLV0IBRh96aXhvtbMfUIHtBSU+vxE183/qm+LOfPzriNAraEd6hFnIwJkPjNHj4FL1mLEiMzpwWir4iO3XKhvmHAebLsOpGhKjsac7ktkYzjsVfdmQlRAmfF+J/0V8x2v222GkpS7977MPIe53ULuHhn8P+5LjgiUh1l3j030XMgEM3xrZhTLtwFDKgc+wV00NIF8nMEPZmihgGBcQsrIBMu2SKHNP3Ls/71sDVtIakZFhKPRqLPEUYzKKr4IF81UKvLNZmv6HBQMOOu7pvSH5/lnYb+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:47:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 10:47:54 +0000
Date: Thu, 9 Oct 2025 03:47:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Don't allow evicting of BOs in same VM in array
 of VM binds
Message-ID: <aOeS2J8pDof0Pzeb@lstrano-desk.jf.intel.com>
References: <20251008200051.3423684-1-matthew.brost@intel.com>
 <5f3936a32079971fa490b1dccfd69d2558df7aaf.camel@intel.com>
 <68a5d384d2c1bfca3cd6fb11a31cd0e19b62cb19.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a5d384d2c1bfca3cd6fb11a31cd0e19b62cb19.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 395530bb-5dca-4bb8-523b-08de07214d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QRnZsE5FPJY6O+E1GuQddsR0OXycRK69EnDca52adtDEtur1SBnFp3OT7E?=
 =?iso-8859-1?Q?/0K7oWYUaD7q+qKiuh6jV8M8F48Fs08NPVPtxdXkxXy45A6ZToT22d9HKV?=
 =?iso-8859-1?Q?nLGf0F7h1IXYA/RsLcGXugc44aSGoB6cnVeNIx0/Oc/MB56bvdkeB7rg98?=
 =?iso-8859-1?Q?bX6pfWHEYsBeVPyQ5LfEtQ3qr8HRhLjEH9CrFChoA508jiG2Y2yWc+LmzX?=
 =?iso-8859-1?Q?WHOltuYPDiA5JJR3/arEIhc5sTloEtcQS2mDhzfMsx4CaF5sugoI7QCuNb?=
 =?iso-8859-1?Q?bLnUtqORjl1lpCVZFoE50MG3ktoU/3mkogVqESKal9388/MFvyfRjSHUQ7?=
 =?iso-8859-1?Q?l/PSwbDdJ+sJZi13zS7zRdQgsPeKIIqCVTqr0WfJkevxDOWcyvKCBJGwGQ?=
 =?iso-8859-1?Q?VzKBizb+rXDsX8agGFP+4PwufW6apyisPU/v5I0nppk1D5TyfeoTjCu/HH?=
 =?iso-8859-1?Q?3Yv7R/sM1G/FBVnbYaH96Dr7S+dJEyj4aCSdm6kV67nZzoV4Db2ihOt5Le?=
 =?iso-8859-1?Q?8vg7LsViqlQVdgBiKFcZtOH+f4sRFzXDkBMQmQ72d5h78lExS0IYgEFrCe?=
 =?iso-8859-1?Q?0T+H3bEiRgXMXcX5OPMggkEmw6dv6m+tAZO3xqoqw+qLfvCXk3nQPZITuO?=
 =?iso-8859-1?Q?Ofr0nbPUP1WS1TAmwEYv8mkiQXtW2OPBPpOaqBHqGsEvhMnfCQiRLr9MyF?=
 =?iso-8859-1?Q?GBmvnrDILZVnJ2+jdVBLfK8Nq50JaqSrEE4XqUBM399m7RMM4eAUa6f05l?=
 =?iso-8859-1?Q?tqEa+yQB4JFWipbPhb3BxvgfO13TLZ2MV0M1YRg7RHqz7XCJbUHgyycHNX?=
 =?iso-8859-1?Q?b/+ajMzT7KHFon3F6i4jvkuy34HvIr4Mjo24PH/3y+sdKNcGlyJR/OIL5B?=
 =?iso-8859-1?Q?+O+8xy1emaDiRCSj7HaveNxZ2OHXs62WvYLq99bo1Lwbao0PNZ/43LdyRk?=
 =?iso-8859-1?Q?eE/u5Hb4WRqzTEseMxIRF5mw0SFMlm2opQIvF9XjAnOXbDanH1xAFrLfmd?=
 =?iso-8859-1?Q?lYln4yzDqNBD6mXA/7CGCZBCn5GNbL/WCbvF+I6aAO9NW+Zx8ko45LRg+T?=
 =?iso-8859-1?Q?hMuHJrQbNX3Md0uUbqD7IGwWW6FL2apBre1AVzyWHYkOzj/kEczkBN2UkT?=
 =?iso-8859-1?Q?cUcZHXtIFvUHJwpiDu7bMPX98tXU4BYJLCxL0JonynOxD5sqduplyxWAeC?=
 =?iso-8859-1?Q?pNYFefNWW9y41ra35P76NQwdjaJiZVoybLCXUMImtMs5u4UikK7oT5T2At?=
 =?iso-8859-1?Q?yGfh2PPm5gPANRmloGtfCEcpu7UW5HNrdu/vPSZ3ym7F6Jlhvmg9gUnZaw?=
 =?iso-8859-1?Q?Phl2bS0czFsmSrn4utPlg4m3mV38TO02HuW59CldD0BuiF6EVFoIbpR+LT?=
 =?iso-8859-1?Q?IQtPx7tcGboXulr8rQlVdzLyx3sNRQT1GZifn0lpMVAK6eChX4bLMRgAoF?=
 =?iso-8859-1?Q?SOC4hSFz3dPICWh5DL2stOlQQL5EEMK9hpAF1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MHhYJsBJU3r6gJfZyA97Wdkk3EP50jsPYWbRFYi+C+mjcf8Pl19ndoTVes?=
 =?iso-8859-1?Q?PiZP3Y56w3h7AXgllKDMjWxJQyXqJUbsq9MJ0Fy/zJdJJrJqgEp6PGnJ5Z?=
 =?iso-8859-1?Q?FvA4j6yjrbsg2gA//Jmv9l+ykcPPN7pGkgVbVmmRjeC7IAw9IF+KIGpGKO?=
 =?iso-8859-1?Q?3YpFWRcuIsfYRwO3pQyZLcteeco1AXiYLfY/jzya12bbixk7pHJ/sUc3ev?=
 =?iso-8859-1?Q?mIsF20s6SHjizvAkhfT/Mz3uRZI+pxqnVbtgr7rT/Y+BfZT7kJG4s1yRTl?=
 =?iso-8859-1?Q?selbXo2+G1klP9jXQ9PdeRIjWfKmaBq5+9KeZeS7B2WDyTWFBpO8Y1pe5u?=
 =?iso-8859-1?Q?iJn8LXT+4P9Xyz8XPYiCF3IoooulhZBUaMikucvvqGFLejj7aLN+/YDKrI?=
 =?iso-8859-1?Q?YHrELmGv11YLcrFv4FhIbXYOPuVFmpqC2Nu6eMhsXwU8wpUL4mW+DyOVJI?=
 =?iso-8859-1?Q?XtEFtQYrXOWluCN5ljV6kuEysEBDYXdqJUsZaHuuf1oYeTMAEC6+hVBOgY?=
 =?iso-8859-1?Q?7aVJMXoq4hHJr4Dup/1kAi68mDJLGYKwrNK8sOctEM9BQcTXQsjdz+0Qkc?=
 =?iso-8859-1?Q?cDUpVlJnov/Mf63npy6eN9KRX2lRylFGDhrX0v07Mt1gYDMpUemzAZ/CVO?=
 =?iso-8859-1?Q?vcYJlThtHai3IKGYRc94LtS51/9SoPdANK+W12ukc4n1CohXdQj22Z/ru/?=
 =?iso-8859-1?Q?CceQ2IsxQQ353q28uqbJFlgcQWndXTeJXci37MyNyv2j2+v4i0nFa3bFWr?=
 =?iso-8859-1?Q?qciE95mXHITEqnzblZYDl4jJCEX6tXQ7h1oBgarn1ziRIxkudMDVNHLb39?=
 =?iso-8859-1?Q?h8wzywN4rfxW72GD2vgO17IM3rV1kQhryPaXHN5aNDGkZJFTpzElS2B8OP?=
 =?iso-8859-1?Q?jFIKNKtLpea5Uh72WFlZzuE9lf9ve6AQcL2m/lQ/Vqmw7neXPJaQHCemAn?=
 =?iso-8859-1?Q?SVGmizU70zWaBwVyC1KgdgIxYpgeLh69icd4xX10h2JgkrspTPIV7UrYxT?=
 =?iso-8859-1?Q?u2Z/b1VUg/hLyvxksIe4Rp7jDqQ8wvql/eR3zH3g4eR1oSxVxTDQB67zm7?=
 =?iso-8859-1?Q?Gfz6nX/4aaZiGER4yMvbXua1xK9xECRuVUPGMRFB8oaOZF/cAnNICr3W9q?=
 =?iso-8859-1?Q?sIf90nlpFwyfAmiUKRbLsHynUsd3KVduvuioEyLx+eoIZ9XMxjaw+3bZpp?=
 =?iso-8859-1?Q?2ptdjzxsB5xMlcmqHmh3WEQm0z66gIvcn8KbTjFjgopxPLXkZJk6VDbAyi?=
 =?iso-8859-1?Q?ExKSwiF1C7w6vQlTPSivBR2/rOTokQ6rbuoL4VRbf182WUbBu9WffxPD1Z?=
 =?iso-8859-1?Q?Fz132PExxCk/NC8Fm7aNoDb/10vuspM3mKGoCOmBxndSnv2Z29cbAUyOEY?=
 =?iso-8859-1?Q?0rB6+QFlS9jRguQ3WbHgCbRf+os7iCQ0eOXygTVmWWhbJGxMhHbpUb8K5Q?=
 =?iso-8859-1?Q?qo1BSrEsp6MmaQ/Cp66fdIKoE53MEgDAQRI+5tFYIzD+9r7HjI78RmZ2U1?=
 =?iso-8859-1?Q?7ZwCvEfx14oI46+YT+ZxlhDV5LLoy0c8DeTvx8zDfK+NeGlEiuCsEKhy9V?=
 =?iso-8859-1?Q?mj5iImUy6bpTfbXMIywVmPD13B1dfGCOpXBLSirQm5W3oXidHOdG4yYE2t?=
 =?iso-8859-1?Q?Oz3s+lzhY1a4yV2c3VtbgfbZKcTo5r0/aU9TK6we+GrbZk8DEERL/HKg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 395530bb-5dca-4bb8-523b-08de07214d0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:47:54.2912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/9qM89GChz+PLrdBW5sfNoPT2o+HrWiaMazUEG88WUD1Cwva3Y/JOiHpbEKiXMQmN6nfDLlnA9SEaZ4ICDNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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

On Thu, Oct 09, 2025 at 11:49:10AM +0200, Thomas Hellström wrote:
> On Wed, 2025-10-08 at 22:52 +0000, Zanoni, Paulo R wrote:
> > On Wed, 2025-10-08 at 13:00 -0700, Matthew Brost wrote:
> > > An array of VM binds can potentially evict other buffer objects
> > > (BOs)
> > > within the same VM under certain conditions, which may lead to NULL
> > > pointer dereferences later in the bind pipeline. To prevent this,
> > > clear
> > > the allow_res_evict flag in the xe_bo_validate call.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
> > 
> > I can confirm it fixes the issue for me. Thanks!!
> > 
> > I did some quick testing, but everything still seems to work, so feel
> > free to add:
> > Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > 
> > 
> > > Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm
> > > in none fault mode")
> > > Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind
> > > IOCTL")
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > > GPUs")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c       | 25 ++++++++++++++++---------
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  1 +
> > >  2 files changed, 17 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 4e914928e0a9..468176cf901e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2834,7 +2834,7 @@ static void vm_bind_ioctl_ops_unwind(struct
> > > xe_vm *vm,
> > >  }
> > >  
> > >  static int vma_lock_and_validate(struct drm_exec *exec, struct
> > > xe_vma *vma,
> > > -				 bool validate)
> > > +				 bool no_res_evict, bool validate)
> 
> Perhaps call this allow_res_evict to avoid negating later.
> 

Sure.

> > >  {
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > > @@ -2845,7 +2845,8 @@ static int vma_lock_and_validate(struct
> > > drm_exec *exec, struct xe_vma *vma,
> > >  			err = drm_exec_lock_obj(exec, &bo-
> > > >ttm.base);
> > >  		if (!err && validate)
> > >  			err = xe_bo_validate(bo, vm,
> > > -					    
> > > !xe_vm_in_preempt_fence_mode(vm), exec);
> > > +					    
> > > !xe_vm_in_preempt_fence_mode(vm) &&
> > > +					     !no_res_evict, exec);
> > >  	}
> > >  
> > >  	return err;
> > > @@ -2915,14 +2916,16 @@ static int prefetch_ranges(struct xe_vm
> > > *vm, struct xe_vma_op *op)
> > >  }
> > >  
> > >  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm
> > > *vm,
> > > -			    struct xe_vma_op *op)
> > > +			    struct xe_vma_ops *vops, struct
> > > xe_vma_op *op)
> > >  {
> > >  	int err = 0;
> > > +	bool no_res_evict = vops->flags &
> > > XE_VMA_OPS_ARRAY_OF_BINDS;
> 
> For a future reader it may not be clear why this restriction is done.
> Can you add a short description for future reference?
> 

Will do.

> Otherwise LGTM.
> 
> Moving forward, we should find time to change the blocking of same-vm
> evictions to take place in eviction_valuable(). Because at least in
> exec we'd want to be able to evict local bos that are not bound to the
> VM, but in that case still need to figure out how to handle bos about
> to be bound.
> 

Yes, I think see the current problem with execs.

- An exec IOCTL evicts a BO that doesn't share the VM lock
- Subsequently while validating the VM, the BO evicted is found to
  mapped in VM and it has to moved back a valid placement 

Is this what are suggesting to fix? eviction_valuable() would seem to be
logical place to fix this.

Matt

> /Thomas
> 
> 
> > >  
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > >  		if (!op->map.invalidate_on_bind)
> > >  			err = vma_lock_and_validate(exec, op-
> > > >map.vma,
> > > +						    no_res_evict,
> > >  						   
> > > !xe_vm_in_fault_mode(vm) ||
> > >  						    op-
> > > >map.immediate);
> > >  		break;
> > > @@ -2933,11 +2936,13 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > >  
> > >  		err = vma_lock_and_validate(exec,
> > >  					    gpuva_to_vma(op-
> > > >base.remap.unmap->va),
> > > -					    false);
> > > +					    no_res_evict, false);
> > >  		if (!err && op->remap.prev)
> > > -			err = vma_lock_and_validate(exec, op-
> > > >remap.prev, true);
> > > +			err = vma_lock_and_validate(exec, op-
> > > >remap.prev,
> > > +						    no_res_evict,
> > > true);
> > >  		if (!err && op->remap.next)
> > > -			err = vma_lock_and_validate(exec, op-
> > > >remap.next, true);
> > > +			err = vma_lock_and_validate(exec, op-
> > > >remap.next,
> > > +						    no_res_evict,
> > > true);
> > >  		break;
> > >  	case DRM_GPUVA_OP_UNMAP:
> > >  		err = check_ufence(gpuva_to_vma(op-
> > > >base.unmap.va));
> > > @@ -2946,7 +2951,7 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > >  
> > >  		err = vma_lock_and_validate(exec,
> > >  					    gpuva_to_vma(op-
> > > >base.unmap.va),
> > > -					    false);
> > > +					    no_res_evict, false);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > >  	{
> > > @@ -2961,7 +2966,7 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > >  
> > >  		err = vma_lock_and_validate(exec,
> > >  					    gpuva_to_vma(op-
> > > >base.prefetch.va),
> > > -					    false);
> > > +					    no_res_evict, false);
> > >  		if (!err && !xe_vma_has_no_bo(vma))
> > >  			err = xe_bo_migrate(xe_vma_bo(vma),
> > >  					   
> > > region_to_mem_type[region],
> > > @@ -3007,7 +3012,7 @@ static int
> > > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > >  		return err;
> > >  
> > >  	list_for_each_entry(op, &vops->list, link) {
> > > -		err = op_lock_and_prep(exec, vm, op);
> > > +		err = op_lock_and_prep(exec, vm, vops, op);
> > >  		if (err)
> > >  			return err;
> > >  	}
> > > @@ -3640,6 +3645,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > > void *data, struct drm_file *file)
> > >  	}
> > >  
> > >  	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
> > > +	if (args->num_binds > 1)
> > > +		vops.flags |= XE_VMA_OPS_ARRAY_OF_BINDS;
> > >  	for (i = 0; i < args->num_binds; ++i) {
> > >  		u64 range = bind_ops[i].range;
> > >  		u64 addr = bind_ops[i].addr;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index da39940501d8..413353e1c225 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -476,6 +476,7 @@ struct xe_vma_ops {
> > >  	/** @flag: signify the properties within xe_vma_ops*/
> > >  #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > >  #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> > > +#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > >  	u32 flags;
> > >  #ifdef TEST_VM_OPS_ERROR
> > >  	/** @inject_error: inject error to test error handling */
> 
