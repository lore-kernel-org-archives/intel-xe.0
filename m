Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EB6EB5948
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 00:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA8B10E07B;
	Wed, 11 Feb 2026 00:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLiqG6/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6C010E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 00:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770770898; x=1802306898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jGCFz/45XgElxE7HBA0qKjf7wFAD0ioUkdw7qH8jp5A=;
 b=DLiqG6/pg/J0Glt9lwRMk76/L5vDsPVTm/ARUZYlAnEto6Yq1hxLUYgx
 Q1Cs9DHgwraD3O479fAeVpspWmiz1WZzq/asEe5YlY5hcixNzCxibAl1y
 /DUERngrivMt2qRoYl0uBI8R9mzklrEaauxJSxy9fCNBK5nY0mccSMLcS
 mdbL068lYB5gfpKNfxfUFs2K5w3fgKOfDRr3a1QtWSm14xkf0AVJBpuj3
 s4M8Y3M+3+1WMa2FT43H3wvOl3evZXhQAGCbV8eYrRfz3177LG3iS7wOs
 OsCgroLck/51o4EoUYfkkfzpJVWcgPnzv1nN5KBRyOjXtRPIEbutkqYBb g==;
X-CSE-ConnectionGUID: Ct7Ro56FSru8q9rsZK9YuA==
X-CSE-MsgGUID: ZqMi4wjeSVGbOtPyeJcOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75757755"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75757755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:48:18 -0800
X-CSE-ConnectionGUID: TrBdSeM9RkeK9obOc5XJmQ==
X-CSE-MsgGUID: BQ7rxeMkTbK5lpe3WYjc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212120084"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:48:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:48:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 16:48:17 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+Y68/hdIz/zMWvRJAbxgAp7KKyRDIjB70FtyCbeOaV9ESM/9T79Qzmde0MdnbXWVMo0R2n6bzsSFTVJf+QDlX7IzkkNM0ymOem3aIhSVoRb+5cFniqvztifMhw8RGxUeC05eKPRk4kwWIEVe4PD3cPMD6AtCwVt993ofuI8p86+7rmjNexrfH2xZTrf9cxcaCsW4I4eaMAyx88UJwme1kHhfzPl+MqEjPywPtfYtMhvF0MUpmWIicBkz3TPqMxYlln3W7maQIbhFrJVLBdpnnDIq/VZ5tfAlNMgqjERr4hpIC7oqD0LO25/yOkAUTOJLL+cGkRm65fLbu5w1FAQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFakRSNRLzjBkwpC4KE+oZF5lzhszCLsMst6IgmSSbg=;
 b=iaUl1ZB95LrQsm/Z9tHGh3ioVM5brpG1yzx94gBeXMDPPtvBV5ANU7sTxYYMNfWSbPZdVlC0l44vsuaBoNNCaQ4pRkLaWHMRJQhLyqE0BV6rv42CL6BEwB5NaoBmsAnqaO3YQTYO2Ur/zGcib0kjpF2zn1tsPVLOYcjUn/lb+lnni3Oh2Njltht1dkiafQUP3YGet2VUjYqLqh6855dcX2m77P63m08vBXf6cabddF8pY+EY+IXaGG3AZHwwiNQuK+f0kv99sc+HB3D8lFS/sxQXz8WXuQ/Or3W7OIierXLyJUycZA+kk2UgpHZtjruox5U+FNrD151jFZhyudd30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 00:48:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 00:48:09 +0000
Date: Tue, 10 Feb 2026 16:48:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/reg_sr: Add debugfs to verify status of reg_sr
 programming
Message-ID: <20260211004807.GJ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260207002304.585103-2-matthew.d.roper@intel.com>
 <87wm0llbdw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wm0llbdw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: e648415a-7586-4bc2-1908-08de69073a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UMiJJxFgu/BhQryyv86jcfdQlNmX9IxCqopFrQxXDiGaZwR65au3hnQPPumi?=
 =?us-ascii?Q?KZwK/ZGQXxuPMEI/4GM3YHKFUegLxSxlz9K7b+C8R0NpawJdUcH+yIOUu95r?=
 =?us-ascii?Q?c3/RXBsg12CzVTkHYywIkCK1qKyJw5PlsEbVV7H51EeEtzk/GZ0PUbOQUu7V?=
 =?us-ascii?Q?N1jDFrzvEdoMWV7CNlOsqH9VqvfklVOnaHVWD/x1Y8kwEn66WYUvYOmN//3T?=
 =?us-ascii?Q?NZvebk32bixRCCk/Bas4U+rV8Z714SceMm1STzuXWgZ9qd0UI5zK3IKihC8J?=
 =?us-ascii?Q?+NLMZSOk+a/0cnQ/L3XLwjdN7JRfscMl+ssZLfC4aVBT/nRppmyYEizXaYr8?=
 =?us-ascii?Q?Xaqok8HMKrk8T8IpZaSTdi5EeLrEb7uoySy6GuhGDJ3yVYf62PRFKqSUO/ul?=
 =?us-ascii?Q?f5BbW5NF+LqLnwx6kp7DIqRf1NM/jI8L6eDoCHe6lkqYHqQYWvnCTCHR1o6w?=
 =?us-ascii?Q?Xc4Q+qQH9gZsMDhdYTSYHBVw9QGL55lZRBQX86MeYjsjkyW+d2L1Zg6FZp5X?=
 =?us-ascii?Q?EqY11iIbuz/FhfcjjLzA3VbfjGCqNZ9sf0WgRJRrMgOkk900LLjmzN0zJqOr?=
 =?us-ascii?Q?GUGIXu/wGy8RQa9/n0FLNJ16BcRMmn8/C0zol90B7+cBVDUnH+tFXRAi6lvC?=
 =?us-ascii?Q?dVSgro09vSnOt4MaoGroRZYEE/hx/WTlZBlXa7pSnnckQt3HMvQSZwBqpMdg?=
 =?us-ascii?Q?6KWOOsj5Lvzduyis8YXOZUYAbt73kpIpetHI3sOTcYkjtsqtsAftlfWJrpBd?=
 =?us-ascii?Q?hUTdbPdDJY0N2jWffEwgV+P+v7IGf3zHyI+OrWXY1n2WCR2gqAUec16J+I3U?=
 =?us-ascii?Q?Zchr5fSLoevMsP9ysvgVVB1+Y+E9ToCTM0R5dJUGKDIH6imAKbFYbrk5gF+o?=
 =?us-ascii?Q?2qr1Ujaz/YuXrDVLcpXtkIqNSUHR8421JSsIDi2QPhh1E5LsVwRq3ntWUYL9?=
 =?us-ascii?Q?l3psH5dNDNbu5Eed1HeGFQRj8v1di6V/wuhZ5oaxOazggXlhvPbIeF5aOBOr?=
 =?us-ascii?Q?sNpYaLanI/heIaAKlOKp85WI8Nnz3cTNdDG+uI2FxsHDsLnhq/S4h0ntdQH6?=
 =?us-ascii?Q?Vn5Ug2QxA86bykgHJ0ztjR+hYy649nM+TFTzQWGWSMRI3ZxDMaHGRJwANHd8?=
 =?us-ascii?Q?e1Sf52JZJh0MntAkVW4faVpx/L3Bvney/p0f23QPxlgFUgdqaS0ugMTZ1zB5?=
 =?us-ascii?Q?RdR4T+J212ioqzef+jQxocSeJHQFV3oX3MUpkJF0veoAs3dzzd2HrKSmFXxh?=
 =?us-ascii?Q?fqUO/toO1hkOtorZ0oETuJXDS8XZORwRLlN2Hl7keTK8M4EaJmIbqGIRhnyx?=
 =?us-ascii?Q?Wv35tvRd2+ppa221pPXgnViByHrLZqXlhxVxKSujipCwshgbZeQtp6jKz0NU?=
 =?us-ascii?Q?eLEWnvfAh71Op0nLZii/4AD/mo+AOeYU7OsDSpj3T9QwjybGC1xvpMRPme6Y?=
 =?us-ascii?Q?zd9d/tIzt4jN55Bj2IErA93BNh/LPQTqiRsxq+uP9k3iR22psa12TuejXvaW?=
 =?us-ascii?Q?FeNdclNc2hkhYlpioL5HDwNj0tYqUcvh9VwLfOKmb3ac/FJGVmJgHw/ozJkq?=
 =?us-ascii?Q?H8twOHT7B9SY7/7pfwE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epuNjBztjnfwdg8l2wdl8OSA8P5g71CiyTte+F1qJzpJtBCMLStOShW28jNl?=
 =?us-ascii?Q?lMHNwdcAUrlV8SiU4NOoEu+cGFAQbkE0vGvfFJJivXplCKWzDqRznUF+6Toz?=
 =?us-ascii?Q?f6T5+o7gZ8E5RACjo93bN1Tz73Qv19sDGozWBiWUbzr/U9iaac/o0KbMDtnq?=
 =?us-ascii?Q?Q7S3rdXFLPoTA2wBRw84/A+tkKa2GAQSX8AuexAAiboKBeA9GlCvOk0KNutJ?=
 =?us-ascii?Q?hd/5nHeMS0hThhvzHUb5RZx2S7qkL5WFLJ5P7JX5XZ3gMXqcHL3/z3+iCYX6?=
 =?us-ascii?Q?S7GiravvXO7Jx81o14gXbNop5ge9RsiqY2Wu+eF3K72BrNyNbGHsQBBHi0r9?=
 =?us-ascii?Q?TNRQHINQhqCTwq5MkBL9yJbBDi6PM9u3Mz2b5Jb2Z+ODWovi4VGCRffqcIjD?=
 =?us-ascii?Q?crkdcZzXdi1OTkpBCbLvvemDvxH57Yn6xB1wKflg6pp+mUS3is+ZD8XFYPuZ?=
 =?us-ascii?Q?l8pKWQhUk4r0whmt8o+CYb4kEJM5rUB2pH1sOSqDZEjriYHpzDKSZ35R24YG?=
 =?us-ascii?Q?CtZKJmRlPPOi89O1IZaoQ0aBDamT2RqOFs9elprbBcCqq+8jOUbvygTuhHnk?=
 =?us-ascii?Q?YPPpfFo9EST8nK9BbliDFDCvQo2IFTcVW4sg2TD7f5bBvPE15GMHH16dU8zb?=
 =?us-ascii?Q?EIID8es2agXQC97jzggWYxoiQhPluyJJBCOJcGKi6E30sZrHcyUX/MSJ5aZO?=
 =?us-ascii?Q?zgLXiD/GLk9Z8Q6KiTIE+N9jzxMRRSlfbnry2uka1C4RCJ1n2ePT1Lxq/vxM?=
 =?us-ascii?Q?gAXl13T9h9V2hS6ADIStd8ydseZ6mmL5LwfdXDrdELFUOdn+homOwkkuyfHm?=
 =?us-ascii?Q?by0QTyKernA006MO04IlrUc873ZZCE+VZhPlsQXJbYgt4fqffLNqMRsbDruh?=
 =?us-ascii?Q?AmOGsY58fRPNW/AfB6YwiU0RYEljQhfgALJMRpWWPtyVrMPhhW3yk8yNAec5?=
 =?us-ascii?Q?Ffzb/nGwpXFT4CVOJ7xHBZ2O52JxplhXy+7kYy+JNoU+T7sWYF3PmBRrNsWd?=
 =?us-ascii?Q?P/Pyrih73mJDmix4kIYb3G5L1jC3fpklt4c8SiERRdwBs8ZhYGVb4kp138ba?=
 =?us-ascii?Q?zIRP5cJ0npbiA8LLAaxss/rylTnXPm3+1eYSGeYM3MRiz4frMGr0C2nW8KCf?=
 =?us-ascii?Q?oTZvpN/YHBit2LlQApl/KSGLScnbd4hGlwpbAmZQGE9UPl8G0U0A1ouNcXPo?=
 =?us-ascii?Q?6Vt/ZiP8rIBvjyIXjcj8xE8PnH5tiUXJvfUPzcKaX2RZL5sHxmi1CVw4tPF9?=
 =?us-ascii?Q?2tfNVBYsi+/OJwwYbUlFSdRofdoXbG3TjezMZmYfqnHuN/nI2LlK+xemp97h?=
 =?us-ascii?Q?cUHYjJvQSFxIMmrmpRj1nNr4oCg+kXAX8OZtRXWWhIxja1dJkRdNKXoqPj/T?=
 =?us-ascii?Q?1ZbG6pGBZP9Djh0r05sHIayhEfmHHRNFj3e/BAhyg0sUDSex2Gs/IzyyHbsL?=
 =?us-ascii?Q?1FlDRXDIN/RhDjTDj9eFti/LCwkUDtjpSXX5MU4H/D58f/Jeuhzc8roSHOa4?=
 =?us-ascii?Q?ZgJnJ9c73K/mIaBc2HSYgj/t5/KZ74vVb0Wmx3w/OXlDtVhx+lPvqi/NQZpQ?=
 =?us-ascii?Q?y8jL1XDniGF/3Lr45x+H9DPqYcGmQh5e7IzRZFd8P59CjdrMV6vmEzBc5qxE?=
 =?us-ascii?Q?HGAzMi1SCBpqTL7kDvCoy68Xl7gHRXDyst95qQxERC5GW688y9rkNM09U5+f?=
 =?us-ascii?Q?AwMKYS8O47z8EqIUY4iLGiC30/MgpEnrjOcIcwN4Avd6tvfwRtTeIkWAeiEM?=
 =?us-ascii?Q?/V8f8uFD2j/FAirYFhyaisczwTJXWqY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e648415a-7586-4bc2-1908-08de69073a36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:48:09.7159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOV9TgBV3p+g7Q3Ghx/UvbE5kWwMf34KFwJJtQZ0E2n98bue2GsaHLf/9bOCPOI3fugM9VpD5qPdkDVFiQqfTV3aw/J24KiJy2wkhoYiluM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Mon, Feb 09, 2026 at 03:56:11PM -0800, Dixit, Ashutosh wrote:
> On Fri, 06 Feb 2026 16:23:05 -0800, Matt Roper wrote:
> >
> > When applying save-restore register programming for workarounds, tuning
> > settings, and general device configuration we assume the programming was
> > successful.  However there are a number of cases where the desired
> > reg_sr programming can become lost:
> >
> >  - workarounds implemented on the wrong RTP table might not get
> >    saved/restored at the right time leading to, for example, failure to
> >    re-apply the programming after engine resets
> 
> I guess this can be checked in the code, post reset, and we could print
> that reg s/r is wrong, rather than rely on debugfs. But anyway this is
> future patch, if at all.

That's sort of what we did with i915 but it caused a lot of headaches
there.  If any workaround/tuning didn't apply (or didn't read back
properly), the CI system would see the warning in dmesg and consider the
entire driver probe to have failed, blocking all other testing.  I'd
like to avoid that and just make it something that we can manually test
when we want to (and it should be easy to wrap an IGT around the debugfs
to let CI exercise this in a way that won't break all other platform
testing if something does go wrong).

> 
> >  - some hardware registers become "locked" and can no longer be updated
> >    after firmware or the driver finishes initializing them
> >  - sometimes the hardware teams just made a mistake when documenting the
> >    register and/or bits that needed to be programmed
> >
> > Add a debugfs entry that will read back the registers referenced on a
> > GT's save-restore lists and print any cases where the desired
> > programming is no longer in effect.  Such cases might indicate the
> > presence of a driver/firmware bug, might indicate that the documentation
> > we were following has a mistake, or might be benign (occasionally
> > registers have broken read-back capability preventing verification, but
> > previous writes were still successful and effective).
> >
> > For now we only verify the GT and engine reg_sr lists.  Verifying the
> > LRC list will require checking the expected programming against the
> > default_lrc contents, not the live registers (which may not reflect the
> > reg_sr programming if no context is actively running).
> >
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 26 +++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_reg_sr.c     | 34 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_reg_sr.h     |  3 +++
> >  3 files changed, 63 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 4363bc9c3606..aa43427a9f4b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -155,6 +155,30 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
> >	return 0;
> >  }
> >
> > +/*
> > + * Check the registers referenced on a save-restore list and report any
> > + * save-restore entries that did not get applied.
> > + */
> > +static int register_save_restore_check(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +
> > +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> > +		drm_printf(p, "ERROR: Could not acquire forcewake\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	xe_reg_sr_readback_check(&gt->reg_sr, gt, p);
> > +	for_each_hw_engine(hwe, gt, id)
> > +		xe_reg_sr_readback_check(&hwe->reg_sr, gt, p);
> > +
> > +	/* TODO: Check hwe->reg_lrc against contents of default_lrc. */
> > +
> > +	return 0;
> > +}
> > +
> >  static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> >	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
> > @@ -209,6 +233,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
> >	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
> >	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> >	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
> > +	{ "register-save-restore-check",
> > +		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore_check },
> 
> Not sure about this, so asking: can "register-save-restore-check" be added
> to vf_safe_debugfs_list[] or must it be added to pf_only_debugfs_list[]?

We definitely want it on the VF list for when we add the LRC
verification, which I'll post soon.

I have a local patch that ensures we don't parse rtp -> reg_sr for the
gt/hwe lists when in a VF (which also prevents confusion in other
debugfs entries since even in the existing "register-save-restore"
debugfs we shouldn't be printing a bunch of things that never actually
got applied).  I guess I should upstream that patch before this one, or
include it as part of v2 of this series.


> 
> >  };
> >
> >  /* everything else should be added here */
> > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> > index d3e13ea33123..37555d5211d8 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > @@ -204,3 +204,37 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
> >			   str_yes_no(entry->reg.masked),
> >			   str_yes_no(entry->reg.mcr));
> >  }
> > +
> > +static u32 readback_reg(struct xe_gt *gt, struct xe_reg reg)
> > +{
> > +	struct xe_reg_mcr mcr_reg = to_xe_reg_mcr(reg);
> > +
> > +	if (reg.mcr)
> > +		return xe_gt_mcr_unicast_read_any(gt, mcr_reg);
> > +	else
> > +		return xe_mmio_read32(&gt->mmio, reg);
> > +}
> > +
> > +/**
> > + * xe_reg_sr_readback_check() - Readback registers referenced in save/restore
> > + *     entries and check whether the programming is in place.
> > + * @sr: Save/restore entries
> > + * @gt: GT to read register from
> > + * @p: DRM printer to report discrepancies on
> > + */
> > +void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
> > +			      struct xe_gt *gt,
> > +			      struct drm_printer *p)
> > +{
> > +	struct xe_reg_sr_entry *entry;
> > +	unsigned long offset;
> > +
> 
> Not sure if it is desirable/possible to add a "xe_force_wake_assert_held"
> here...

We don't have a way to determine which forcewake domain(s) (if any) are
actually necessary for a specific register.  Today this readback check
function only gets called from a single callsite, and that callsite just
grabs 'ALL' so that it doesn't have to worry about it.  So we could add
an assert on FORCEWAKE_ALL here for the time being.  But adding an
assertion is presumably meant to protect us if we add another callsite
in the future that forgets the forcewake; if the new callsite uses more
precise forcewake acquisition (for some special reg_sr that has
registers within a specific domain), then asserting on FORCEWAKE_ALL
would actually cause problems.


Matt

> 
> Assuming the comments above are ok, LGTM:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > +	xa_for_each(&sr->xa, offset, entry) {
> > +		u32 val = readback_reg(gt, entry->reg);
> > +		u32 mask = entry->clr_bits | entry->set_bits;
> > +
> > +		if ((val & mask) != entry->set_bits)
> > +			drm_printf(p, "%#8lx & %#10x :: expected %#10x got %#10x\n",
> > +				   offset, mask, entry->set_bits, val & mask);
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> > index 51fbba423e27..cd133a09aa9b 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> > +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> > @@ -19,6 +19,9 @@ struct drm_printer;
> >
> >  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> >  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
> > +void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
> > +			      struct xe_gt *gt,
> > +			      struct drm_printer *p);
> >
> >  int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> >		  struct xe_gt *gt);
> > --
> > 2.52.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
