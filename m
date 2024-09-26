Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33475CDE003
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 13:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13D010EB1E;
	Thu, 26 Sep 2024 13:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbkUfRRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0B010EB1E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727356007; x=1758892007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hyh14wgGPEOUL/l4rZwsMUuOua4VK8t1EDjqxS6WgII=;
 b=hbkUfRRHfiR0fXdTV+MJE0kw+VXdY9ycpASHVayzk//lgdSYaebN02Ke
 HfwrtZcHqH6gCUB5rujFqPxDlidpbJ2pJMjIW3UTQ+1GK7LZYlxtrUs7M
 prqnOG17CG0xPmu2y5P3Mh1Zn5IlbttcvrsRX2PCTIs4OGsjaHunYxTVv
 3CYIJYJ/mndAp4EbLh4Pm2KJGqJhII3EVhKZtRX29Cvg5eTyDdgWsFboF
 pbfPbWQGa89CH3uQFVV/mErSzJEEFUaZhd96sZZtWkR9sJuLFbwpIV90u
 oEbq9JvHMODntwjS9bcEnLRqUkFgU+i22NvMnoMgvL18WNEctSQLJzxqv Q==;
X-CSE-ConnectionGUID: MCE80D+QTnm2GpdNBfSmlw==
X-CSE-MsgGUID: CO8nx1I/SlKPhba9aFSCGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26602175"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26602175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:06:47 -0700
X-CSE-ConnectionGUID: 3sUSLShtQhOWGma6BCk42w==
X-CSE-MsgGUID: LZMMO17sR0uBlifO0hS6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72453415"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 06:06:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 06:06:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 06:06:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 06:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgX2EGuogN2D0CrwONMzFDihGYebCGUm44S4PUp5KwatdeInKBExMmuvOte3fXMHwApKRorAy2HxdIXZJ07Au43Jzdx4/5MponYsH47n7lZH9rVAgz6Pv6xyE0LSyV9FAcCgpeEcrJiK1h9GJ7Ld6uQA3Kv1LFoRAz5J6kRcYCJwc5PFcnFWQ7ftFq+27Hg9VYrzEwpoFE0QLdVosGwxbPLRkOpyIY4mgvw8RJwwPCtYwZEj7d3IjmxacRSwuslsKthN4vTU2dxVAh8hylm2JONsbl3EcroOQgM0zlTXrNEXRlNFEM0SmSiqksqui3tfCBZV40rr4hFx7fNNJAtz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olHfPrdLkiMuaVNIPD7QL9o9cwgTxXijEOGDHq7BMQg=;
 b=sONDnV8VE8j9lEDwanOXmneFNeAdscpyTtHJK0yig0wsv1fys15nH2bCea6CA3uoumXcqwrzVd+89zsEgJSuXkzDt45TjalQriVv0pWmW+LLXUM1YfOK/vE5Eb8R5RmVLTdFwEnAHu12PSE349ZHkU7Ffab/tiVJmwerQjUauSYwl2Zty1Pje8lRPlsI1wJuii5s6orOrPLdgnRPQ7EP8GzfvS+8uTkv1RXQymPVhkt98YcJasd8IEnBwGsbB6hccvSqeAuHOhH27e636xbxDay80dBra3OtefZaH2tiO93kd6Lu2jrNBxojtXKOD7IFO5x7KdgfoidH73JSjQs/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 13:06:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 13:06:43 +0000
Date: Thu, 26 Sep 2024 08:06:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <lopyt6t2hotskchmhit2dhu7oqgsw6tahogxnxvsvkmsrkgl3p@5rt6rp334qhm>
References: <20240925155546.76630-1-francois.dugast@intel.com>
 <87jzey21i8.fsf@intel.com> <ZvVJKGc_ltNgYDsl@fdugast-desk>
 <87ed561vci.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ed561vci.fsf@intel.com>
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4353e4-80ef-420f-cf1d-08dcde2c1140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?25MqHMzFg3TKR65juJEFctbnAY8m8XjJ53f9vIL0bPCFPsdvaPwCtUjKyKuN?=
 =?us-ascii?Q?z0SVwtbNdWgynYzBDXb4dpplMlx6Ct8zygEO7i5a2wKrNa8ITbHeh6rGdjzk?=
 =?us-ascii?Q?XIj5adoBYVQp82rWWtmLVGs5KBcrrtmO7K7ApUZcxq5gkmYG+QCFTXbJOApc?=
 =?us-ascii?Q?WjxccOLLLgx+xsm9FvYKPeJLNI86K/9x7jXOPmELt0/cpobI7eYOw+GDr3mH?=
 =?us-ascii?Q?kXhph7svlQxO0DqILYKdTUp7JeutQ5bJm7HtO0WX44wYdHKCEv5S96+KY5ke?=
 =?us-ascii?Q?m4v9/a8wf74n+OuPfNQ8aepp0Wg4+Ft6Z0JbawEn7mciPOJ6RRYLi9e+hzj0?=
 =?us-ascii?Q?NT7d4n+hd90CvmdfYtuBQa2KYHPYybfuvqX/972Yr1g83JVD244by1EtuP15?=
 =?us-ascii?Q?PuTns3gB+AgPJOEI6jBZiGItW1n6R0xRmr44zMkJg1L6Q9gYdXVj1KYMVuG+?=
 =?us-ascii?Q?kB409jP6ZkRW7WftuEyulwQYUUn7adMMpDahMek5b97Ki0DBUWulmL25aBmD?=
 =?us-ascii?Q?iIwvRR6sgMVtubLoJPKeh5TDUXBf2mTGJ+tc2vbGSB1xkMv0rPrcrrkc6kWF?=
 =?us-ascii?Q?UCCfzBol6pcqRyHMP2ktb3F8IrIpSejlHlq73Mppkl7bYCUw1hORHxaL1S1L?=
 =?us-ascii?Q?H4aAu575Dl+amDdD1XH3UQTJS0CDHhRG6o2g+aoSWddm6wVvYd8wp1/o2NJB?=
 =?us-ascii?Q?bnYicONQeKpUWy43yHEcHN88+dMz4i6VZdXtdfKUj82r8R60s+LnQrJIY+vC?=
 =?us-ascii?Q?uJ73PtT8YlgpQcm9CrnraL1S7pJdvvh+CRJHQrnSiEEMVwzgRqh0GRBo8fVT?=
 =?us-ascii?Q?cMx6kTB6WMVb2aW6cDWQlH4Alwh1KxppsnV5z/dymzRpve8BgVphsSR6f4TJ?=
 =?us-ascii?Q?eawtJqN94sp4Xm7STq70rR9bz8BenwQOW4aLCKjpH10g8A+uo2746y5vO4Mm?=
 =?us-ascii?Q?saHmuo6HsyBZdWga9e+YAbXC+3wPQzwDIuI5Banl6qFIw3+DoNHonvi4sKFU?=
 =?us-ascii?Q?a9FcvbpUvvvFIiDVQVZ5erYh5t7Drchq0obOeV5VGJx0Nig8UIeGw4vg9Ujl?=
 =?us-ascii?Q?CnK5mRdeB2sJniuH9qMIq7fJ5gs69EvoQodClZnMmllx/Hc5YGeJHzmjL1ri?=
 =?us-ascii?Q?poFR4wyaZmsNS+PxAwlsooLZnTWd+09Vq5IiLXAY649LGN+30NWKWcIC7aDG?=
 =?us-ascii?Q?4OYdx9jmfqsKhyBsNFdSubK9bXHz6nNNLmy1CFFRt8Mwohc60feh4aIcHpOI?=
 =?us-ascii?Q?rku46yrUz9BheeYvrRK4/8nWkUUqEf+qsrCAL2wX7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJZUvUU263HG9L0jHjt+KUrbQ8Qie8iKetJ9WTjSzmNFCLnQ/vcgcK2Lp1+W?=
 =?us-ascii?Q?adLXXPGJ/WEDY1bxcpbhGdchi+9Wgb+ArSGV7qpWA8v04S4pF48wdD/BW0RN?=
 =?us-ascii?Q?jU3AmKgpjli4qbYOdkL9JNZ8Y8NTGykt1Ug6Fs4oUfdUjDrkSCvhJuUGz1hz?=
 =?us-ascii?Q?L4LPXG845NcJOsRkVaDOcdQQmLegFd7PYAwcgfJAo23jiJJLbAXqBwY7fl9l?=
 =?us-ascii?Q?tvB08fYg282gGf8AdCsImQOcvbRPJPrACeF3+y3uyzCoiR4NVMT2NNAHqkTX?=
 =?us-ascii?Q?Y4Jb/XNunHNgk+ypWTKyUZb/+uYpdTktbuTlxxUSgA8AGCpYjlB56YQCKlSP?=
 =?us-ascii?Q?teVnH6lTnZbbpusCtyMkiPpt25nGdiandPsfqXVch6WZdVoEFFHtMDQIgGNJ?=
 =?us-ascii?Q?Rz+iDxTzN8e4OViQqJgafOem+v0uNsRQtwBDaj2EIq/soVXHefjXNQArndoR?=
 =?us-ascii?Q?/G+I4T+pfX54QsJOZ8nxrokGUEqEoQIYQC2xhD5GQz6DwoWAoDiFeTynhZyh?=
 =?us-ascii?Q?KbrGIWoaLeEynQDy9vkb3rqm9gD8xVwIRfO1D3oFyqE+d8kx4xQ+W9MECYRB?=
 =?us-ascii?Q?1dCVSQXBfb+cmJOfUTEEheDPD+xPvLmzdr/SDYK6kBIo+FlJiQ70gtc04ShR?=
 =?us-ascii?Q?R1nqDq8t0ScIOl1K8dEguYyVP5p68Z+dh7sv8KUyrkuD12SjY5Z2j7SXgMlz?=
 =?us-ascii?Q?Gnue3isbltBsM6bJGU0V4fxlP3xJc60sBXuIqSEz7uWEwiEeQVThDB241iNE?=
 =?us-ascii?Q?VbboPcfMTKczNoNMX3sNmiUXaHDAdutncRtDhXlWyb0iWXoufjLSphOdtKdI?=
 =?us-ascii?Q?KAspbJmHNj6Xs8hO8Mukwu+TA7LrjFXNIwoE2svQOt0rU+TubQ377uO0LhY8?=
 =?us-ascii?Q?HFXIXnxJhiFa0vHAZk5dIBYqDfvIXxpK73WXtZLLLBoSCf5Xu6LYk6JvuhWj?=
 =?us-ascii?Q?B1tRC2GgR5WniznHGNFIC64tRb1htREskhvUCu7GAyHe3CQnDVoDgJ5YLFkz?=
 =?us-ascii?Q?el3Ku5h/dVJxnZQnFsy5yghmcvYcHjP6ggM2/F0pkyRk05GQOS/94BvBqWN+?=
 =?us-ascii?Q?5C2ypXOdty+b19M+tI913+p7yw2YsJ/KS+dDSSh5KWOBYxvE8FnL07OitjX5?=
 =?us-ascii?Q?x2EpfgDQ/7PCNEs52tSsVqiebM6oqPWNRCa4Y76sZfoVdd3iXpVmtBjG1i6I?=
 =?us-ascii?Q?qHgdSOVk5oZNKLzAwrVzLdFQLTHYGkZLPJjLfJJI62Tqmg0utUK0+1wlWoq0?=
 =?us-ascii?Q?fizqtzXCIoC6ife+sYEir6hCkepiTKnapHsFJGSfmy8xXAyv4ciQ2yxRILnI?=
 =?us-ascii?Q?bZeaMIKzcrB9vpMq6bls6Y8i2z9fGz5OAeGK6JrJ2avS5cM2HI5YXTuwRDTQ?=
 =?us-ascii?Q?kDjvlotE/9eZgTxuq+xEaC8eL7VJgetNvpQ7H5Uv7txsEIzfR1oITTOCsgE1?=
 =?us-ascii?Q?5U+lZ4wHYYdddL25OUKflTVKLTEwxLT2cU+s+Rm0Y8hzKYadnJiBjT3HYO4N?=
 =?us-ascii?Q?UUrOjvhSur6pK85wygD7N8U1O5AjKzyOz9zpUL0JT65oojXpZ5TNqNvu5bOB?=
 =?us-ascii?Q?qqCFgq7ZcHILy7/pntcfLSIzSEFjbskVMEQQfn8NOIiH37hCBqC5kyGZ8OJG?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4353e4-80ef-420f-cf1d-08dcde2c1140
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 13:06:43.1137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZ+54Pag0THR9WtgHLHS/UCryaPPeLFLVG8oM49Tl5ynlPf7OiN/aplyWajWtZXvBEXRpBHix+OK4UA7zGOiYAzGimAXMytKRu94Ysg70qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Thu, Sep 26, 2024 at 02:57:01PM GMT, Jani Nikula wrote:
>On Thu, 26 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
>> On Thu, Sep 26, 2024 at 12:43:59PM +0300, Jani Nikula wrote:
>>> On Wed, 25 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
>>> > +/*
>>> > + * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
>>> > + * runtime and use a provided return value, in order to test errors paths in the
>>> > + * callers. The requirements for the error injectable functions are not strictly
>>> > + * fullfilled but this is acceptable because the caller only propagates the error
>>> > + * up the stack without cleanup of resources potentially allocated here.
>>> > + */
>>>
>>> I'm curious on the details of "The requirements for the error injectable
>>> functions are not strictly fullfilled". It's repeated many times, but
>>> not explained. Maybe I'd like the info spoon fed to me instead of having
>>> to figure it out for myself. ;)
>>
>> Understandable! I will make it more explicit in the next revision. Any
>> suggestion to avoid the duplication?
>
>All I can think of is adding a single, more thorough explanation comment
>about the approach to error injection somewhere suitable (*), and then
>have short comments referencing that.
>
>	/* See xxx for details on error injection. */

https://docs.kernel.org/fault-injection/fault-injection.html#requirements-for-the-error-injectable-functions

so... like this?

	/*
	 * See "Requirements for the Error Injectable Functions" in
	 * Documentation/fault-injection/fault-injection.rst
	 */

Lucas De Marchi
