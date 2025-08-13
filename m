Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D923C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 11:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BDF10E6F8;
	Wed, 13 Aug 2025 11:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUtCSGfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFE110E6F6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755084224; x=1786620224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oVe9FIVx2jJ7K9kU0XUTTKjThocXElEbQyRrmKQMyi8=;
 b=XUtCSGfpKbdE3UlCqYdsz6RRUGJGDrPEmjIV7aTO53GxZPzztYBekiWt
 INckqaa4ytskyl+vXp8rICJ5rZ0dXp/l4f6S71iTK7mL3GzxrqgM83NjF
 t7erho2swUGFn5lMBSyTUMr65dwzPWm7NhNRp+Ji7jfJ53yVf6m4+A/cm
 c1HOwYEUNZY3l/oVRY8dpLBSo6eOPHAWN7vIQFaQhhQNRpaKqtebRLWeU
 ix7r4DyzdSV3IPm6hAOJtRTiwbxd34Coy90OQW9ctknmaeP66E0pcFaN3
 XjbjZt7/KddqP+4lkiLeZ1SihdNaJeY0G/qms/VRyyri78eiSQUDb5vdI g==;
X-CSE-ConnectionGUID: U0RIXJo2TPujzsET1llyXA==
X-CSE-MsgGUID: i7AMxkeGRNyg37taFVF91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="59996546"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="59996546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:23:44 -0700
X-CSE-ConnectionGUID: g4AhMLdaRtO25Wi2zsqfoQ==
X-CSE-MsgGUID: TqdwsTjsQLe0gK3k0rfNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166434126"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:23:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 04:23:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 04:23:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 04:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak/eRw3C33fg9dT1VMXBH+7WRcbc0ImrZO1gOjlCzUXwUMyGIF6DuuifYI1MIK2Yzxh6/IcJ2KolFVMc5TctXk6sW2Zcakk8eONtjWzj3KlYun3UroG9QtYaNYWlEXFmogBTmVcuJGGzAKjlklYcXRe3a/wNyikFaB2ZAifFAG8P0RbnBqZ7XzqsVESpJ7w9R/esQAo0c58shiI0JPc9ED3/dfYHeB81Ahw3QxiG9baVF0Cq0yWNwYHtw1PimJfoixSYE9SeL5sw7dFXVNjjNYXUurFioMeEFx1CkRH3/kCIsw6fmyATwQAhSfMUm5pXIea6RwnviQbDpQPp3Zlp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d3d2CfJfvI8Dc9lh9Pwj4XmJg0SO+5nrChqHUpzzak=;
 b=eF/cm8Ehv0TSOg6+vV3yfcv4Gm/I28StxoHubqAviMURs3scfvy/+shIYwVeUhPmGt7TqfXYT2eUY3LVDS58SpxHlf/iuI3389vTBDVivhRQA6HjbW2r+Gy1SFGnFrXS2DvGTpkVFDJ3OL6UQzz5L5QSYAAbeR6uM20jnvgFlwWntNUAcuTDr+QI9icOtih74DEFgtDRXnaLdo2NUvp+DDBt8UVXVTDgYq+Sic2yBJgjB4s3YDWHNiWJ+wM2N2JGYayYe0ZMgET1fpNyW5Gw0kKz53cjpB8iEzncFa2SVs6YyoykEdWfZQbHV99tBMj64j84ztD++wZhSXsXjcUpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 11:23:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9009.021; Wed, 13 Aug 2025
 11:23:38 +0000
Date: Wed, 13 Aug 2025 08:23:21 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <John.C.Harrison@intel.com>
Subject: Re: [PATCH v3 07/13] drm/xe/configfs: Allow to enable PSMI
Message-ID: <3qcwjxyskygb2dofcy2p7vozyar7v5coou2me7jmpehutif6kj@vrqx7s35274m>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-7-a111e9f1e4b7@intel.com>
 <531d08f5-7a3f-4f47-9c60-e55eed1088bc@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <531d08f5-7a3f-4f47-9c60-e55eed1088bc@intel.com>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc0221a-3349-40ff-c11e-08ddda5bd989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bo7gP613LwjEezYuo2KRZPEcGIDryWvTktnw0NPaK7tarl9WV5KxFOaBkVX+?=
 =?us-ascii?Q?fdDdvKdnYDA+4O9MuyTlL+RQRWzxyC4PbLrioW4PzKYGsseWNLFn204uwWxY?=
 =?us-ascii?Q?OmCBlqV+IXX2W+NH9zoUY66ghQtP5AMm8kN5tSvk+EEK5lZJ/jHQGrFPj4kP?=
 =?us-ascii?Q?9va66wDA3PD4Z44jUTq0dO+xquRVIjJbkk4MyUrKhsk2Nx1nZG2DfeRggS0r?=
 =?us-ascii?Q?WNSenMdespTrqrRQM/4EcGphl9d0wNxsJ4Ejg2quKIX4HotWfyvlwjIuYax5?=
 =?us-ascii?Q?RbO+CNnOl0Cl4+KTtWZz089ZAAz/ga9poO51Rm/H2GQe1P0U2VvKFkxbFrhF?=
 =?us-ascii?Q?UtJJdRKC9xulSIaCmCNPQRTBpOiBBVEgg+Gw9oOORHPDdngSl8wr6ImCtboi?=
 =?us-ascii?Q?LRBokJaOGLYMfu+RiOybzZF9KkHUg1+D58tPsyNPSmkJwVyJoaBWBC2EUgIT?=
 =?us-ascii?Q?fPyUVK6Zv1t/8gAHWiF9n+KZP163RNJ1O/U4t+gQK5X0IhIXYeKDrrmMSyEp?=
 =?us-ascii?Q?bbMuzYnDB0K1HxbEasq+9Cosx8vVKfrDDLDvPKZ6veEhkOS8h9fre9yPMR8j?=
 =?us-ascii?Q?p1sObgYxlfKgzYnK/792Mj+AjSGR0TDOMK2ffCJ2fPBOCD42Py+mRLLgfHtH?=
 =?us-ascii?Q?YbystwsN5VfRY2eWB48OP1Ler8n8OSAsefugkR+CK4uwCnY8vu1X4R8VH7lh?=
 =?us-ascii?Q?VITqiH/GCYLkdUK+BIjwcVsRNgdhfKjj5IPIBmzF5wPvgAuRfug5cfL7prgI?=
 =?us-ascii?Q?wIYX5cErqqMWSMpanopKX68eqC4CveierJfodNqcxdqGwsW4h9Cp8pFu5XoE?=
 =?us-ascii?Q?zdu2tH8JV4mtNqAuDO5u9V5Rx9QIUoUTKYuqMDKpSnL6nNnqYrEbbjq+j/b8?=
 =?us-ascii?Q?MjexeOt+4shCU8Sy4XlVAF8vpbRZ6TugNJ2PnM6XmS6CS1as9bXtkjH3Q0K3?=
 =?us-ascii?Q?3C6dtIpolbA0sUF8F2ddYC83iZNb4eh+UonfsOc8/eSYK24zZnTr3DnGTs0m?=
 =?us-ascii?Q?Tpl5e4W3t4oOxFD3gq8cf1gp754Y8zAqqm1H0osYYdYFvq2Qkd558XUJJRaA?=
 =?us-ascii?Q?ZdWnVUgFiM7R0nxUK2ISoLaCrJu2Pk5nMGNw/HPAeJHvOycTLbUqPMO8T979?=
 =?us-ascii?Q?cpReOxXnbqj3LvjyWUD6mz03qRXCvbNlp5K8TQJoasFrOzoYeqkEUFWgbxpG?=
 =?us-ascii?Q?MmDVkvCzLsGx58vab4Fb50N1D3eJw7bIiznH3YClkFE9bsI4ODEldWsj5a2X?=
 =?us-ascii?Q?J/FvvMelYgz523XcuKcvqG8LW7jnbR5363DXynTXbYUZlRegzr2itTENYWNT?=
 =?us-ascii?Q?IglQ0sLEhpbOljLHFnO1EQx/ZHSVqYJLGpotN78PSHiKrlbA8JAHLctEKpTg?=
 =?us-ascii?Q?Ld8W3GCT6ynno1G/292FZAvwrRpWl7w+NbjAusCc8F/brGX4qYbREUuF7IsB?=
 =?us-ascii?Q?CcfjBbY1No8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JP+N4csi12Vt9KZJQryvcJcJmM7damHnydeiAyOfI0DX7CDFF1wbnRpK3TBe?=
 =?us-ascii?Q?6fOS7DLOeYDxuBXGv8XjNxrdQF37xTUjvBtGQrQQt+3b5XUSjbgOU6Y/22JC?=
 =?us-ascii?Q?w7aYcq43KVgBHb8KT1EhR4XpBRBIL4yyXJPg1qPTfKTswxILwiLq3y21OL1P?=
 =?us-ascii?Q?CyycTmensxqqxwogvYczZPd7iAykeEBZ3t4WZHGp7AttJN3MWNRcygibfPm6?=
 =?us-ascii?Q?AA7/HYMFdB5KtUn9/ZDrqsXbuqK9tbQTPRGzLPhzylVUQLXg/bQGDDilL528?=
 =?us-ascii?Q?7wr4mKjXgzgcltdKp2tefXo8myvr9P9LB/UayCUgtJBCaW7OCbI01oKdxAQq?=
 =?us-ascii?Q?HFOxnQtgHyX3nkwMeqnASzzjR3DOEHTzqYkn6jT98Y+wd8UR98n+HZIzBJpW?=
 =?us-ascii?Q?mAXd62c3jw1sC5kHELY2EJRbTK6dxqG7UiE0d0Us3vFHtIaM1nqPJtR5aCjF?=
 =?us-ascii?Q?NrcM4UzslTVh3WtJgBqVHeR4IPGxQpjftGf8J3+ishXFGJ1rUTXpFpT/FiPU?=
 =?us-ascii?Q?lrcGnBOeNF+qcwm9hukjCJTbFTANbKdYm9Whp9s2GxHFEpGwFFw4RxmoBqS+?=
 =?us-ascii?Q?M3BjlkgmGJ0JW86SSeWtnFqUn43r1rx7sk1p+OASx7LqnWh5dQChRwXnyDnU?=
 =?us-ascii?Q?dKlH6ZtE8MJc5eBpFXffY43bPozhzoGF+nBgdIZSbdfuBu+EfYAsmE2Izk2Q?=
 =?us-ascii?Q?Ev6mcRZv802pezZIHNH5NLdhKO49JyQvv8hnER5Ucg/R4DzBQobPWcFInlwb?=
 =?us-ascii?Q?gVOTznT4I5xB+GOgaPtl7pbj8MMlFqJLqiI8sWJnO2+6b4Jq8uPiAr1vRQ0S?=
 =?us-ascii?Q?TGxqPXc8r/9YyGpBXN0HyCvRr+UWTaYsdKSsBXhhx+6rm/OerzWLzuDin3Yc?=
 =?us-ascii?Q?qW7GbCWHUKeWA/ItG1J1nocdgOJokdGPZ5rNRn7SMdHtda0a64QV3syj8WRr?=
 =?us-ascii?Q?0Zo2y67lckQ1Gcl/r6V04WQapHpJXKaWmKmI6EsKcODGIQ/SBmnE+nsmHd8R?=
 =?us-ascii?Q?Es+mefCk40Yc93LLVITQehpNcE17U5XXc1fsnPDAsJNnQBL/JnwCVwegLoga?=
 =?us-ascii?Q?oYCsrQmPDQMYRuxyNi85CxVNtrvNCVCPflVvLvL4hO0kzr7oZZgDGehX1HCY?=
 =?us-ascii?Q?CwilykxXBjl2rOXYzze8SXBpMxv7PfQ5SgZ2KqZsZJ35YA6n0aSve3dhyDoS?=
 =?us-ascii?Q?cpKh3UuZYfQNucBzmO2H/ITlGMy6272x7CwhGcmoEAI1J+/QGOPMG5o2ZwIx?=
 =?us-ascii?Q?6DbDgyQk5WwJkAHC0m3E8cDsk7tMDeBfd7baJRuHaG30kZV4OOSOrCd6iMtm?=
 =?us-ascii?Q?XxkrCvSeafV/62fAroj8eTNtoYxIOtZMQpwromnB7UWHElGafEk00eZ+RCEj?=
 =?us-ascii?Q?Sut2iWI0u4ssaBwzDB35rfJd6Nj8Fd4sfVqAYuaDx+QRrlCBff0N+7VmBqDQ?=
 =?us-ascii?Q?QCkP1vji88/xV3BofSz2xewgM/KwjiyOW4yim8V3XnEoN5V3NCIWKGFPONbL?=
 =?us-ascii?Q?JaKy0pOc72ela+/GyXxEq+uHgzzTXBeelKKXN5DuUJo8+nv+dgqcfnpOGAFV?=
 =?us-ascii?Q?Rn/PqlQ3g06I9PVnAZUlyUWXUfinmwsL7Zjt2gDqjU/ekJAslMIvNxBh6gUS?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc0221a-3349-40ff-c11e-08ddda5bd989
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:23:38.8571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39uW/nctSihPt2ymWgeAICReyvi84KipUSnDfHHm+D8rjeh4JEe+2fkElMs1E8/6X9c1qbM3zMfZUTHmEJa50nwhKY8XwzIHVn0nenpX7Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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

On Wed, Aug 13, 2025 at 12:28:07PM +0530, Riana Tauro wrote:
>
>
>On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
>>Now that additional WAs are in place and it's possible to allocate
>>buffers through debugfs, add the configfs attribute to turn PSMI on.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_configfs.c | 66 +++++++++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/xe/xe_configfs.h |  2 +-
>>  2 files changed, 63 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>index 17b1d6ae1ff6a..8cf6b1375b7d4 100644
>>--- a/drivers/gpu/drm/xe/xe_configfs.c
>>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>>@@ -77,6 +77,16 @@
>>   * available for migrations, but it's disabled. This is intended for debugging
>>   * purposes only.
>>   *
>>+ * PSMI
>>+ * ----
>>+ *
>>+ * Enable extra debugging capabilities to trace engine execution. Only useful
>>+ * during early platform enabling and requiring additional hardware connected.
>
>%s/requiring/requires
>
>>+ * Once it's enabled, additionals WAs are added and runtime configuration is
>>+ * done via debugfs. Example to enable it::
>>+ *
>>+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
>>+ *
>>   * Remove devices
>>   * ==============
>>   *
>>@@ -89,8 +99,9 @@ struct xe_config_group_device {
>>  	struct config_group group;
>>  	struct xe_config_device {
>>-		bool survivability_mode;
>>  		u64 engines_allowed;
>>+		bool survivability_mode;
>>+		bool enable_psmi;
>>  	} config;
>>  	/* protects attributes */
>>@@ -98,8 +109,9 @@ struct xe_config_group_device {
>>  };
>>  static const struct xe_config_device device_defaults = {
>>-	.survivability_mode = false,
>>  	.engines_allowed = U64_MAX,
>>+	.survivability_mode = false,
>>+	.enable_psmi = false,
>>  };
>>  static void set_device_defaults(struct xe_config_device *config)
>>@@ -243,12 +255,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>>  	return len;
>>  }
>>-CONFIGFS_ATTR(, survivability_mode);
>>+static ssize_t enable_psmi_show(struct config_item *item, char *page)
>>+{
>>+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>
>To have consistency with other functions, we can use
>
>struct xe_config_device *dev = to_xe_config_device(item);

The struct and function got renamed a week or so ago. I think you don't
have this commit in the codebase you are looking at:

88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device")

thanks
Lucas De Marchi

>
>>+
>>+	return sprintf(page, "%d\n", dev->config.enable_psmi);
>>+}
>>+
>>+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
>>+{
>>+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>>+	bool val;
>>+	int ret;
>>+
>>+	ret = kstrtobool(page, &val);
>>+	if (ret)
>>+		return ret;
>>+
>>+	mutex_lock(&dev->lock);
>>+	dev->config.enable_psmi = val;
>>+	mutex_unlock(&dev->lock);
>>+
>>+	return len;
>>+}
>>+
>>  CONFIGFS_ATTR(, engines_allowed);
>>+CONFIGFS_ATTR(, survivability_mode);
>>+CONFIGFS_ATTR(, enable_psmi);
>
>alphabetical?
>
>Thanks
>Riana
>
>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>-	&attr_survivability_mode,
>>  	&attr_engines_allowed,
>>+	&attr_survivability_mode,
>>+	&attr_enable_psmi,
>>  	NULL,
>>  };
>>@@ -443,6 +481,26 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>>  	return engines_allowed;
>>  }
>>+/**
>>+ * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
>>+ * @pdev: pci device
>>+ *
>>+ * Return: enable_psmi setting in configfs
>>+ */
>>+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>>+{
>>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>>+	bool ret;
>>+
>>+	if (!dev)
>>+		return false;
>>+
>>+	ret = dev->config.enable_psmi;
>>+	config_item_put(&dev->group.cg_item);
>>+
>>+	return ret;
>>+}
>>+
>>  int __init xe_configfs_init(void)
>>  {
>>  	int ret;
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>>index c14588b86e833..603dd7796c8b2 100644
>>--- a/drivers/gpu/drm/xe/xe_configfs.h
>>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>>@@ -16,7 +16,7 @@ void xe_configfs_exit(void);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>>+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>>  static inline void xe_configfs_exit(void) { }
>>
>
