Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DFFD7877D
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 15:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5374010E98D;
	Thu, 21 Nov 2024 15:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjoNh1st";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FBF10E990
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732202165; x=1763738165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TJ9JGmfcIGI8a8A82xSDYUYHapKBI7R2FtF2+Rww5P0=;
 b=RjoNh1stAAmCi8Sw3r/juApYuZAsV7jv2FSL9ap+jMsotwUuDUdKbzMU
 Rya3Q0VX0ujxfzeIfUD68Lln0Mu7pMJQWoYgKuPVyJl5rH0F/YoDHzm9b
 9dTN8wtzdIL14pEb+7ZwXm7zNIdlG6TtPCP80oNkc4QpRG73FfvNhUUR4
 5Dhd+Sb1o9Xbqoqe1N2BDxS6VSA8J8gx5cpq1gXRdtRrbxPy02JjXwdHp
 dTPF1z6t0rWFm/m4QNLfXcfDa15GQcX0fs1mPUL9XwzUwrR7VVgSyAtwN
 s5cf9vPkvkmkHfOmfq34LvRtheBbfXpi1WDaWcAIMBpkOmbnNCD9REpu7 w==;
X-CSE-ConnectionGUID: QESKY92hRP64X5XyA2QKeg==
X-CSE-MsgGUID: owSezeYPTVKZBrNDTyCERQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="19909265"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="19909265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:16:05 -0800
X-CSE-ConnectionGUID: pApZpqk7S6e1cKs+wyykLw==
X-CSE-MsgGUID: GB2dkDsXQE+HJwayD/NaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90097530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 07:16:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 07:16:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 07:16:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 07:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyLuvumH9KIKYsS5GNrdZEapw20szqO7kSDE26PoshnNHAWY6AaziJ21jW3l2bfwc+ondCR/cW+1bPtjN740VkLGVJ9jxwO7TRZga8JcPpUCLQmjWUeXEjO+SQCob5lv94UJoz/Rkmu5y2Nw3VhMFvo7jh9s6z7BaBf8yBiIyClTvMrBB6Hk/QRzvs9//n6Y5f0Awg9gl0qyr5FYuAPCsiXX8cCos9eDRK3oGjax2mQaIDGb7P6r3p8FF7RCOqHExliXPHe3i/dP47NAhzgdR2NFjh0b/1MzsOwbFSEAcO5LNMPjecm2PbEmbMIGOCHhuCAFH1TRNyBjyy9SrK2i0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juqFv5Iuyhk536mgTfCMX0bDgoZyLHsOLOLKAzTcdNI=;
 b=iy+Wk047ofRO9npJGwilOZK4sEK6A5LA5VQlFJJTHJF4E8TXqXv5LGMHTTE7+thfNob6A7hjamlf9lQWbewlCGyqTsrRGHcBjlUkDqeqVIoODhPUBdpr5yn9qr8MBOaTRyb4DNQcILIbANm9YHI4pR7HLvy0Emk7LKRHfYBON7EkqRRFrvu3VodhUKAAOfytae7lwxvHHINKwmXHl734FagfBwjxQQmJTWMsSIHsXFfeR1NOH1FTvM3FxOk0JN0iVtrvW+QnQ9wHyk48xbhyyN34hCLmqe+11YF8AgrvCUA4SGHa147JSsVcOJ/SnlSFW5XahV8hy9KLsPGWQ3pGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 15:15:47 +0000
Received: from DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3]) by DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3%5]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 15:15:47 +0000
Date: Thu, 21 Nov 2024 09:10:45 -0600
From: "Olson, Matthew" <matthew.olson@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 3/7] drm/xe/eustall: Implement EU stall sampling APIs
 for Xe_HPC
Message-ID: <Zz9NY-xzdzckG7Uk@bolson-desk>
References: <cover.1731919693.git.harish.chegondi@intel.com>
 <61d372440de6c620b0033aaea353d363e4218a53.1731919693.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61d372440de6c620b0033aaea353d363e4218a53.1731919693.git.harish.chegondi@intel.com>
X-ClientProxiedBy: MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46)
 To DS0PR11MB7444.namprd11.prod.outlook.com
 (2603:10b6:8:146::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7444:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: be6ed070-6cfc-4d07-72cf-08dd0a3f6058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YdI6p4x2/LJ7vu69YGgEdemGTPeJD6cXM7GkVDdj0aPjAZX4FMg8mun5eu?=
 =?iso-8859-1?Q?5yOUjdb3DlD7cU/9Vm+pOmkdevBbGZHQ5YvkxiWvzb/+1UDgjwhQN7jvA5?=
 =?iso-8859-1?Q?7Nol4z5bfuR4psopFwGpvFQaoyePC9sSAjZoHxUjwq2da6GKiNSnB4+gkH?=
 =?iso-8859-1?Q?7HIWLr6UC1qyI0RhpBNWyg9dat4Ss4OtBWyJCNdyJL1ICXh0X08Kquw2ce?=
 =?iso-8859-1?Q?5SMvkue7DDyk3kEuoxvchqvMGtTgmcTFuiTyPMKRQShC1EQTPlFNwdCGwC?=
 =?iso-8859-1?Q?iHMb3sfgBWG5EVvntEg0tLf6uaZ96LNCWrD98ERXxI1lauHN7+m6EMlBma?=
 =?iso-8859-1?Q?4lnq6PTa26Ocx1IaacJirFru+Eid1AxrPwtz1vdayV3V7tXkhRWJN8vYs2?=
 =?iso-8859-1?Q?ckcj1p3SY692wSGOur9Oyatv0jdwZwS74AdjNbsQmtGzOKFZKq7KQ0/Zlb?=
 =?iso-8859-1?Q?4vUb/t+ks8p5PCIrrHDFwgZPwIJGWr3uhekSof/8eynp/Rs4QRmgQ8/7HL?=
 =?iso-8859-1?Q?JUatYFKRJ+eJoKtyv2UiBKwuZgNSnshIBiaDXKcdlDCUU+h48tNTbLb2Y2?=
 =?iso-8859-1?Q?Ekl9rYFGeo/gDLk76aDo7pBUHS9qDA09gaNIHo7ann4Ljm1UtcaQSC+nco?=
 =?iso-8859-1?Q?u930oYZjloSrkSyo6QhAHEnd2WWEUMITRURcIeNQCYlUHEOeRv33AMuJbr?=
 =?iso-8859-1?Q?msKydFtTaSnzZ4g4XAOK3D7ZvaeghRuO0eEApuBfkgt/Qi4tqJfR5QY6K6?=
 =?iso-8859-1?Q?4Qs8LLMKnItkZKBcwqcgvFpa1kO7gHHkiY2lLV9qgko5hZMxSthluuV7Z8?=
 =?iso-8859-1?Q?uWwbV63E/u3uRj72Pmt6XKZQ9JaI7pXlgV9uZ0iGRAa+xmOoKVuedeB+dg?=
 =?iso-8859-1?Q?PJ8fdom4RamCfMRdMjNaelM/adjt6vy/W9P9WQyS+g9Oelb2Ox8Pehxpzg?=
 =?iso-8859-1?Q?P/sGeDuEZ9DDw37IO5nmwjDd+a2miS7P91W4odo2rgmcptuqLiEAQ7J3e+?=
 =?iso-8859-1?Q?jihSM3QRTVKhiIugkIWd0V+oWV83tcmC5UyuAhHbIO2yjKSwIsj7qLNsPF?=
 =?iso-8859-1?Q?yWxeBY4NuwkFtQXFLT3rSbHPD5Hqec006nT5QPV9wSjGU2dPFXZxgpJaLM?=
 =?iso-8859-1?Q?LZwj9FzyNv2KKpVw3xumtCHv/r/V6HbkfnskiW9sD4mLoDN4qt9gWMVsV8?=
 =?iso-8859-1?Q?GqGDgcXo5tPVI93u8sGwIdmmidL5cNjo/sqEN+HXCr6kqQUPurR7FkUUJd?=
 =?iso-8859-1?Q?l+3aOLHG/d1cLBGRdrrU9IRf1b53Ahl2JXQa3rC/KB3mXYWKiwN+4vUQwE?=
 =?iso-8859-1?Q?FRH8PEddLXsKtVQXYgXyTMPH+gbEESdVSXi82OimIUiCmq9V2aT8gOa2qH?=
 =?iso-8859-1?Q?Kn88YEbaXu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lCQCLo/Kl1M+7CaZiyhP0gwnBSyPNtZfd4YbrGNYURI3wbTi5OE+hBUEwB?=
 =?iso-8859-1?Q?/wId0N6ESxaFGsnmO4xrunSgR1uuNAS/oQcMm53JwqpjWIidQVFPyO+BVS?=
 =?iso-8859-1?Q?/h1T08ZsLtHskstxMHviK4oi79fljqj1W01INZqYX/akpp17BQpwrcSgNS?=
 =?iso-8859-1?Q?8ePU65X2G94G4O2hxZRIoi6i55V6TEnlzyeXYgaWW76oFtAqI3YF2rycSg?=
 =?iso-8859-1?Q?XY2wrQAvz45fnti4BQC3MqmciuPhgEBkTmMNRgmnsw7XJt1bbOlNGjKmGa?=
 =?iso-8859-1?Q?cbqDWBqWJ0bZAKHtgMqW2HTJp/6KvDnVafdQ0rTSfRL/N213JEU6/+BXts?=
 =?iso-8859-1?Q?csME0PcsEgwG7OeDt0KW0aSb8qlCi85bHgiYf/iKIPQR/811tNYq4PRKVk?=
 =?iso-8859-1?Q?CGsVTFWiIIW5GgyYU+pG8O0BSMhqoUSwaTe00U6qAIhpNPF6iJHhnuuts1?=
 =?iso-8859-1?Q?QILnvk64xM2IBxRCEO3twddU3+myl+u2GhRF+gvp3JLo6UImbMRXygKfVJ?=
 =?iso-8859-1?Q?4e0k/7GXRm0pGtFZGuW+TmC+W39dRNfV9bl5Evwp2WVUnujETLwNjhAWzl?=
 =?iso-8859-1?Q?tw2WATY+mptB2+WNkZlpI4s7o3ZyuB1tJCBseUW5+/ZUKpdIAOPzZV3JSD?=
 =?iso-8859-1?Q?poWJq2DgyUtJ5N6APoM6Up2FUsleT7WJsO+S/1kGIlf8i2wttEI17VonZB?=
 =?iso-8859-1?Q?b05FA9oZmMn0Pvnbz4lxi0Mk9h9VzJ0Qc+CXSiJlRks6GFv5StrupOiuna?=
 =?iso-8859-1?Q?8YnFxn9cz2hPMIeO2Fi9no9hZ/NZk7Uf5SLUAvAEeaZZYpURz9dBID5eJB?=
 =?iso-8859-1?Q?neCKUZ9Wtms4E2YKlJUYmp9VqwSFcs/HS57Bpnm57fw6CXxLwcm8D3XMgn?=
 =?iso-8859-1?Q?oH757ItLQEdkt5GfWJTKsypDn/YIE1wHtsf0MbJp9YoGDWS5t1Fk4o5cy4?=
 =?iso-8859-1?Q?sFs36A+r1XNll7Axm1mzRdLl1iDu4/ylA3q0ELthsKqzIq/zhXLOjAFsdb?=
 =?iso-8859-1?Q?rAExnccHxBRNh1W26gQYDoFdwhVb86/afic+RIGNrzBHggoizbVLlLbWVu?=
 =?iso-8859-1?Q?yo0TAhtn8MQe/Hgwqr8fIKyOKEi/vtWbeQ8l4/aUL+kYpLHAHRF3/QD4Gk?=
 =?iso-8859-1?Q?Gfq3oynZdGL9yTQJLksTY4eJfPfvGFyba5oYwTQR0+DlGQ2/JxV/yLvcTn?=
 =?iso-8859-1?Q?R2BPyg2bOB+UxJxZn5pFUt4aucwiJQGxHVFZMI88BzDq6RcB0UYNEdLfeH?=
 =?iso-8859-1?Q?/N0lrNLCrJuHAGx7eu8AygMxp53lMZRGoSILyMKXSHsVd3te8o9VTHGklA?=
 =?iso-8859-1?Q?17/2VHmPQwtGHomriBl299KpN/8xus86mfOTJ7d8c6bpvteiRkpbRf7L8a?=
 =?iso-8859-1?Q?5uTnEgUxmqFcopnpEGSBrmeJL+5rds6j1M4CP57ku52eXzKXLMTMUwMs3e?=
 =?iso-8859-1?Q?S8w7R5opH+Eh8KwyDBk+b9UYIx+1CZ5fmT6lRs0XEWSuwwxI54HIMxhymI?=
 =?iso-8859-1?Q?Yhd7vbr7tiEdshuuOlGq2sJA/X5FF4ySUlP054ztaZofNEGZjY1L76rB4s?=
 =?iso-8859-1?Q?0B5/nivl94M/1srZizdp6xqmNCi271cXG7Q1GtrjH7RyuYXGrjGA4fQ6hp?=
 =?iso-8859-1?Q?n6nB7UyXcBoQ5y1yl+mWSKhj22EicKezHNX5815Q0ZvlY5E0LzV/q1tA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be6ed070-6cfc-4d07-72cf-08dd0a3f6058
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 15:15:47.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny/GfO0m5VoSMoIecY4uHYTxDbvM7Scfl3wRZCqwyowhUrNOl2pOjJjnYmecIPT+LwiMFBV4hlbK+UBmzK2pdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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

Small suggestion down below:

On Mon, Nov 18, 2024 at 01:07:15AM -0800, Harish Chegondi wrote:
> Implement EU stall sampling APIs introduced in the previous patch for
> Xe_HPC (PVC). Add register definitions and the code that accesses these
> registers to the APIs.
> 
> Add initialization and clean up functions and their implementations,
> EU stall enable and disable functions, poll() and read() implementations.
> 
> A timer thread periodically polls the EU stall data buffer write pointer
> registers to look for any new data and caches the write pointer. The read
> function compares the cached read and write pointers and copies any new
> data to the user space.
> 
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |  29 +
>  drivers/gpu/drm/xe/xe_eu_stall.c           | 748 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_eu_stall.h           |  43 ++
>  drivers/gpu/drm/xe/xe_gt.c                 |   6 +
>  drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_trace.h              |  33 +
>  6 files changed, 837 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> new file mode 100644
> index 000000000000..2b742890b283
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_EU_STALL_REGS_H_
> +#define _XE_EU_STALL_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
> +#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
> +#define   XEHPC_EUSTALL_BASE_XECORE_BUF_SZ	REG_GENMASK(5, 3)
> +#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
> +
> +#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
> +
> +#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528, XE_REG_OPTION_MASKED)
> +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
> +#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
> +
> +#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c, XE_REG_OPTION_MASKED)
> +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
> +
> +#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c, XE_REG_OPTION_MASKED)
> +#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
> +#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index e9209fc0d917..5c69f68acb98 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -8,15 +8,27 @@
>  #include <linux/poll.h>
>  #include <linux/fs.h>
>  
> +#include <drm/drm_drv.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_bo.h"
> +#include "xe_pm.h"
> +#include "xe_trace.h"
>  #include "xe_macros.h"
>  #include "xe_device.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_eu_stall.h"
>  #include "xe_gt_printk.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt_topology.h"
>  #include "xe_observation.h"
>  
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_eu_stall_regs.h"
> +
> +#define POLL_FREQUENCY_HZ 100
> +#define POLL_PERIOD_NS (NSEC_PER_SEC / POLL_FREQUENCY_HZ)
> +
>  /**
>   * struct eu_stall_open_properties - EU stall sampling properties received
>   *				     from user space at open.
> @@ -31,6 +43,48 @@ struct eu_stall_open_properties {
>  	struct xe_gt *gt;
>  };
>  
> +/**
> + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
> + *
> + * Bits		Field
> + * 0  to 28	IP (addr)
> + * 29 to 36	active count
> + * 37 to 44	other count
> + * 45 to 52	control count
> + * 53 to 60	pipestall count
> + * 61 to 68	send count
> + * 69 to 76	dist_acc count
> + * 77 to 84	sbid count
> + * 85 to 92	sync count
> + * 93 to 100	inst_fetch count
> + */
> +struct drm_xe_eu_stall_data_pvc {
> +	__u64 ip_addr:29;
> +	__u64 active_count:8;
> +	__u64 other_count:8;
> +	__u64 control_count:8;
> +	__u64 pipestall_count:8;
> +	__u64 send_count:8;
> +	__u64 dist_acc_count:8;
> +	__u64 sbid_count:8;
> +	__u64 sync_count:8;
> +	__u64 inst_fetch_count:8;
> +	__u64 unused_bits:27;
> +	__u64 unused[6];
> +} __packed;
> +
> +static unsigned long
> +xe_eu_stall_data_record_size(struct xe_device *xe)
> +{
> +	enum xe_platform platform = xe->info.platform;
> +	unsigned long record_size = 0;
> +
> +	if (platform == XE_PVC)
> +		record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
> +
> +	return record_size;
> +}
> +
>  /**
>   * num_data_rows - Return the number of EU stall data rows of 64B each
>   *		   for a given data size.
> @@ -43,6 +97,36 @@ num_data_rows(u32 data_size)
>  	return (data_size >> 6);
>  }
>  
> +/**
> + * xe_eu_stall_init() - Allocate and initialize GT level EU stall data
> + *			structure xe_eu_stall_gt within struct xe_gt.
> + *
> + * @gt: GT being initialized.
> + *
> + * Returns: zero on success or a negative error code.
> + */
> +int xe_eu_stall_init(struct xe_gt *gt)
> +{
> +	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> +	if (!gt->eu_stall)
> +		return -ENOMEM;
> +
> +	mutex_init(&gt->eu_stall->lock);
> +	return 0;
> +}
> +
> +/**
> + * xe_eu_stall_fini() - Clean up the GT level EU stall data
> + *			structure xe_eu_stall_gt within struct xe_gt.
> + *
> + * @gt: GT being cleaned up.
> + */
> +void xe_eu_stall_fini(struct xe_gt *gt)
> +{
> +	mutex_destroy(&gt->eu_stall->lock);
> +	kfree(gt->eu_stall);
> +}
> +
>  static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
>  					   struct eu_stall_open_properties *props)
>  {
> @@ -143,6 +227,235 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
>  	return 0;
>  }
>  
> +/**
> + * buf_data_size - Calculate the number of bytes in a circular buffer
> + *		   given the read and write pointers and the size of
> + *		   the buffer.
> + *
> + * @buf_size: Size of the circular buffer
> + * @read_ptr: Read pointer with an additional overflow bit
> + * @write_ptr: Write pointer with an additional overflow bit
> + *
> + * Since the read and write pointers have an additional overflow bit,
> + * this function calculates the offsets from the pointers and use the
> + * offsets to calculate the data size in the buffer.
> + *
> + * Returns: number of bytes of data in the buffer
> + */
> +static u32
> +buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> +{
> +	u32 read_offset, write_offset, size = 0;
> +
> +	read_offset = read_ptr & (buf_size - 1);
> +	write_offset = write_ptr & (buf_size - 1);
> +
> +	if (write_offset > read_offset)
> +		size = write_offset - read_offset;
> +	else
> +		size = buf_size - read_offset + write_offset;
> +
> +	return size;
> +}
> +
> +/**
> + * eu_stall_data_buf_check - check for EU stall data in the buffer
> + *
> + * @stream: xe EU stall data stream instance
> + *
> + * Returns: true if the EU stall buffer contains minimum stall data as
> + *	    specified by the event report count, else false.
> + */
> +static bool
> +eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
> +{
> +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> +	u32 buf_size = stream->per_xecore_buf_size;
> +	struct xe_gt *gt = stream->gt;
> +	struct per_xecore_buf *xecore_buf;
> +	bool min_data_present;
> +	u16 group, instance;
> +	unsigned int xecore;
> +
> +	min_data_present = false;
> +	for_each_dss_steering(xecore, gt, group, instance) {
> +		xecore_buf = &stream->xecore_buf[xecore];
> +		mutex_lock(&xecore_buf->lock);
> +		read_ptr = xecore_buf->read;
> +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						       group, instance);
> +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> +		write_ptr <<= 6;
> +		write_ptr &= ((buf_size << 1) - 1);
> +		if (write_ptr != read_ptr && !min_data_present) {
> +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> +			/*
> +			 * Check if there are at least minimum number of stall data
> +			 * rows for poll() to indicate that the data is present.
> +			 * Each stall data row is 64B (cacheline size).
> +			 */
> +			if (num_data_rows(total_data) >= stream->event_report_count)
> +				min_data_present = true;
> +		}
> +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> +			set_bit(xecore, stream->data_drop.mask);
> +		xecore_buf->write = write_ptr;
> +		mutex_unlock(&xecore_buf->lock);
> +	}
> +	return min_data_present;
> +}
> +
> +static void
> +clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> +{
> +	u32 write_ptr_reg;
> +
> +	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> +	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> +
> +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> +}
> +
> +static int
> +xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> +			  char __user *buf, size_t count,
> +			  size_t *total_size, struct xe_gt *gt,
> +			  u16 group, u16 instance, unsigned int xecore)
> +{
> +	u32 read_ptr_reg, read_ptr, write_ptr;
> +	u8 *xecore_start_vaddr, *read_vaddr;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct per_xecore_buf *xecore_buf;
> +	size_t size, copy_size, buf_size;
> +	u32 read_offset, write_offset;
> +	unsigned long record_size;
> +
> +	/* Hardware increments the read and write pointers such that they can
> +	 * overflow into one additional bit. For example, a 256KB size buffer
> +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> +	 * write pointers. This technique avoids wasting a slot in the buffer.
> +	 * Read and write offsets are calculated from the pointers in order to
> +	 * check if the write pointer has wrapped around the array.
> +	 */
> +	xecore_buf = &stream->xecore_buf[xecore];
> +	mutex_lock(&xecore_buf->lock);
> +	xecore_start_vaddr = xecore_buf->vaddr;
> +	read_ptr = xecore_buf->read;
> +	write_ptr = xecore_buf->write;
> +	buf_size = stream->per_xecore_buf_size;
> +	read_offset = read_ptr & (buf_size - 1);
> +	write_offset = write_ptr & (buf_size - 1);
> +
> +	if (write_ptr == read_ptr) {
> +		mutex_unlock(&xecore_buf->lock);
> +		return 0;
> +	}
> +
> +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> +				    read_offset, write_offset, *total_size);
> +	/* If write pointer offset is less than the read pointer offset,
> +	 * it means, write pointer has wrapped around the array.
> +	 */
> +	if (write_offset > read_offset)
> +		size = write_offset - read_offset;
> +	else
> +		size = buf_size - read_offset + write_offset;
> +
> +	/* Read only the data that the user space buffer can accommodate */
> +	if ((*total_size + size) > count) {
> +		record_size = xe_eu_stall_data_record_size(xe);
> +		size = count - *total_size;
> +		size = (size / record_size) * record_size;
> +	}
> +
> +	if (size == 0) {
> +		mutex_unlock(&xecore_buf->lock);
> +		return 0;
> +	}
> +
> +	read_vaddr = xecore_start_vaddr + read_offset;
> +
> +	if (write_offset > read_offset) {
> +		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
> +			mutex_unlock(&xecore_buf->lock);
> +			return -EFAULT;
> +		}
> +	} else {
> +		if (size >= (buf_size - read_offset))
> +			copy_size = buf_size - read_offset;
> +		else
> +			copy_size = size;
> +		if (copy_to_user((buf + *total_size), read_vaddr, copy_size)) {
> +			mutex_unlock(&xecore_buf->lock);
> +			return -EFAULT;
> +		}
> +		if (copy_to_user((buf + *total_size), xecore_start_vaddr, size - copy_size)) {
  
I think this should be `copy_to_user(buf + *total_size + copy_size, ...)`.
As it currently stands, this line will overwrite some of the bits written by the first
call to `copy_to_user`, and will result in userspace reading `size` bytes, but
this function only having written `copy_size` bytes.

We noticed in our userspace profiler that many of our stalls weren't related to any 
particular GPU shader, and so debugged it down to this line; with this change, we no longer
get 0x0 addresses and random-looking data in the stall buffer.
  
> +			mutex_unlock(&xecore_buf->lock);
> +			return -EFAULT;
> +		}
> +	}
> +
> +	*total_size += size;
> +	read_ptr += size;
> +
> +	/* Read pointer can overflow into one additional bit */
> +	read_ptr &= ((buf_size << 1) - 1);
> +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> +	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> +	if (test_bit(xecore, stream->data_drop.mask)) {
> +		clear_dropped_eviction_line_bit(gt, group, instance);
> +		clear_bit(xecore, stream->data_drop.mask);
> +	}
> +	xecore_buf->read = read_ptr;
> +	mutex_unlock(&xecore_buf->lock);
> +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> +				    read_offset, write_offset, *total_size);
> +	return 0;
> +}
> +
> +/**
> + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> + *				    per xecore buffers to the userspace buffer
> + * @stream: A stream opened for EU stall count metrics
> + * @buf: destination buffer given by userspace
> + * @count: the number of bytes userspace wants to read
> + * @ppos: (inout) file seek position (unused)
> + *
> + * Returns: Number of bytes copied or a negative error code
> + * If we've successfully copied any data then reporting that takes
> + * precedence over any internal error status, so the data isn't lost.
> + */
> +static ssize_t
> +xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> +			       struct file *file, char __user *buf,
> +			       size_t count, loff_t *ppos)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	size_t total_size = 0;
> +	u16 group, instance;
> +	unsigned int xecore;
> +	int ret = 0;
> +
> +	if (count == 0)
> +		return -EINVAL;
> +
> +	for_each_dss_steering(xecore, gt, group, instance) {
> +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> +						gt, group, instance, xecore);
> +		if (ret || count == total_size)
> +			goto exit;
> +	}
> +exit:
> +	if (total_size)
> +		return total_size;
> +	else if (ret)
> +		return ret;
> +	else
> +		return -EAGAIN;
> +}
> +
>  /**
>   * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
>   *
> @@ -159,11 +472,259 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
>  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
>  				       size_t count, loff_t *ppos)
>  {
> -	ssize_t ret = 0;
> +	struct xe_eu_stall_data_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	ssize_t ret;
> +
> +	if (!stream->enabled) {
> +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!(file->f_flags & O_NONBLOCK)) {
> +		do {
> +			if (!stream->pollin) {
> +				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> +				if (ret)
> +					return -EINTR;
> +			}
> +
> +			mutex_lock(&gt->eu_stall->lock);
> +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> +			mutex_unlock(&gt->eu_stall->lock);
> +		} while (ret == -EAGAIN);
> +	} else {
> +		mutex_lock(&gt->eu_stall->lock);
> +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> +		mutex_unlock(&gt->eu_stall->lock);
> +	}
> +
> +	stream->pollin = false;
>  
>  	return ret;
>  }
>  
> +static void
> +free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
> +{
> +	if (stream->bo) {
> +		xe_bo_unpin_map_no_vm(stream->bo);
> +		stream->bo = NULL;
> +	}
> +	destroy_workqueue(stream->buf_check_wq);
> +}
> +
> +static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
> +				   u16 num_xecore)
> +{
> +	struct xe_tile *tile = stream->gt->tile;
> +	struct xe_bo *bo;
> +	u32 size;
> +
> +	size = stream->per_xecore_buf_size * num_xecore;
> +
> +	bo = xe_bo_create_pin_map(tile->xe, tile, NULL,
> +				  size, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM |
> +				  XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	stream->bo = bo;
> +
> +	return 0;
> +}
> +
> +static u32
> +gen_eustall_base(struct xe_eu_stall_data_stream *stream, bool enable)
> +{
> +	u32 val = xe_bo_ggtt_addr(stream->bo);
> +	u32 sz;
> +
> +	XE_WARN_ON(!IS_ALIGNED(val, 64));
> +
> +	switch (stream->per_xecore_buf_size) {
> +	case SZ_128K:
> +		sz = 0;
> +		break;
> +	case SZ_256K:
> +		sz = 1;
> +		break;
> +	case SZ_512K:
> +		sz = 2;
> +		break;
> +	default:
> +		xe_gt_warn(stream->gt, "Missing case per XeCore buffer size == %lu)\n",
> +			   (long)(stream->per_xecore_buf_size));
> +		sz = 2;
> +	}
> +
> +	val |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_XECORE_BUF_SZ, sz);
> +	if (enable)
> +		val |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> +
> +	return val;
> +}
> +
> +static void
> +xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	u32 reg_value;
> +
> +	/* Take runtime pm ref and forcewake to disable RC6 */
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER));
> +
> +	reg_value = gen_eustall_base(stream, true);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> +}
> +
> +static void
> +xe_eu_stall_stream_disable(struct xe_eu_stall_data_stream *stream)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	u16 group, instance;
> +	unsigned int xecore;
> +	u32 reg_value;
> +
> +	/*
> +	 * Before disabling EU stall sampling, check if any of the
> +	 * XEHPC_EUSTALL_REPORT registers have the drop bit set. If set,
> +	 * clear the bit. If the user space application reads all the
> +	 * stall data, the drop bit would be cleared during the read.
> +	 * But if there is any unread data and the drop bit is set for
> +	 * any subslice, the drop bit would continue to be set even
> +	 * after disabling EU stall sampling and may cause erroneous
> +	 * stall data in the subsequent stall data sampling run.
> +	 */
> +	for_each_dss_steering(xecore, gt, group, instance) {
> +		reg_value = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						   group, instance);
> +		if (reg_value & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> +			clear_dropped_eviction_line_bit(gt, group, instance);
> +	}
> +	reg_value = gen_eustall_base(stream, false);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +}
> +
> +static void eu_stall_buf_check_work_fn(struct work_struct *work)
> +{
> +	struct xe_eu_stall_data_stream *stream =
> +		container_of(work, typeof(*stream), buf_check_work);
> +
> +	if (eu_stall_data_buf_check(stream)) {
> +		stream->pollin = true;
> +		wake_up(&stream->poll_wq);
> +	}
> +}
> +
> +static enum
> +hrtimer_restart eu_stall_poll_check_timer_cb(struct hrtimer *hrtimer)
> +{
> +	struct xe_eu_stall_data_stream *stream =
> +		container_of(hrtimer, typeof(*stream), poll_check_timer);
> +
> +	queue_work(stream->buf_check_wq, &stream->buf_check_work);
> +	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> +				   struct eu_stall_open_properties *props)
> +{
> +	u32 write_ptr_reg, write_ptr, read_ptr_reg;
> +	u32 vaddr_offset, base_reg_value;
> +	struct xe_gt *gt = stream->gt;
> +	struct per_xecore_buf *xecore_buf;
> +	u16 group, instance, num_xecore;
> +	xe_dss_mask_t all_xecore;
> +	int ret, xecore;
> +
> +	init_waitqueue_head(&stream->poll_wq);
> +	INIT_WORK(&stream->buf_check_work, eu_stall_buf_check_work_fn);
> +	stream->buf_check_wq = alloc_ordered_workqueue("xe_eustall", 0);
> +	if (!stream->buf_check_wq)
> +		return -ENOMEM;
> +	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	stream->poll_check_timer.function = eu_stall_poll_check_timer_cb;
> +	stream->event_report_count = props->event_report_count;
> +	stream->per_xecore_buf_size = SZ_512K;
> +	stream->poll_period = POLL_PERIOD_NS;
> +
> +	bitmap_or(all_xecore, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +	/*
> +	 * Enabled subslices can be discontiguous. Find the maximum number of subslices
> +	 * that are enabled.
> +	 */
> +	num_xecore = xe_gt_topology_mask_last_dss(all_xecore) + 1;
> +
> +	ret = alloc_eu_stall_data_buf(stream, num_xecore);
> +	if (ret)
> +		return ret;
> +
> +	stream->xecore_buf = kcalloc(num_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
> +	if (!stream->xecore_buf)
> +		return -ENOMEM;
> +
> +	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	base_reg_value = gen_eustall_base(stream, false);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, base_reg_value);
> +	/* GGTT addresses can never be > 32 bits */
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
> +	base_reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> +				       REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> +				       REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> +						      props->eu_stall_sampling_rate));
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, base_reg_value);
> +
> +	for_each_dss_steering(xecore, gt, group, instance) {
> +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						       group, instance);
> +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> +		write_ptr <<= 6;
> +		write_ptr &= ((stream->per_xecore_buf_size << 1) - 1);
> +		read_ptr_reg = write_ptr >> 6;
> +		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
> +		read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> +		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> +		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1,
> +					read_ptr_reg, group, instance);
> +		xecore_buf = &stream->xecore_buf[xecore];
> +		vaddr_offset = xecore * stream->per_xecore_buf_size;
> +		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
> +		xecore_buf->write = write_ptr;
> +		xecore_buf->read = write_ptr;
> +		mutex_init(&xecore_buf->lock);
> +	}
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +	return 0;
> +}
> +
> +static __poll_t
> +xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
> +			       struct file *file, poll_table *wait)
> +{
> +	__poll_t events = 0;
> +
> +	poll_wait(file, &stream->poll_wq, wait);
> +
> +	if (stream->pollin)
> +		events |= EPOLLIN;
> +
> +	return events;
> +}
> +
>  /**
>   * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
>   *
> @@ -175,11 +736,60 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
>  static __poll_t
>  xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
>  {
> -	__poll_t ret = 0;
> +	struct xe_eu_stall_data_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	__poll_t ret;
> +
> +	mutex_lock(&gt->eu_stall->lock);
> +	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
> +	mutex_unlock(&gt->eu_stall->lock);
>  
>  	return ret;
>  }
>  
> +static void
> +xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> +{
> +	if (stream->enabled)
> +		return;
> +
> +	stream->enabled = true;
> +
> +	xe_eu_stall_stream_enable(stream);
> +	hrtimer_start(&stream->poll_check_timer,
> +		      ns_to_ktime(stream->poll_period),
> +		      HRTIMER_MODE_REL);
> +}
> +
> +static void
> +xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> +{
> +	if (!stream->enabled)
> +		return;
> +
> +	stream->enabled = false;
> +
> +	hrtimer_cancel(&stream->poll_check_timer);
> +	flush_workqueue(stream->buf_check_wq);
> +	xe_eu_stall_stream_disable(stream);
> +}
> +
> +static long
> +xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> +				unsigned int cmd, unsigned long arg)
> +{
> +	switch (cmd) {
> +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> +		xe_eu_stall_enable_locked(stream);
> +		return 0;
> +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> +		xe_eu_stall_disable_locked(stream);
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
>   *
> @@ -194,14 +804,22 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
>  				     unsigned int cmd,
>  				     unsigned long arg)
>  {
> -	switch (cmd) {
> -	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> -		return 0;
> -	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> -		return 0;
> -	}
> +	struct xe_eu_stall_data_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	long ret;
>  
> -	return -EINVAL;
> +	mutex_lock(&gt->eu_stall->lock);
> +	ret = xe_eu_stall_stream_ioctl_locked(stream, cmd, arg);
> +	mutex_unlock(&gt->eu_stall->lock);
> +
> +	return ret;
> +}
> +
> +static void
> +xe_eu_stall_stream_close_locked(struct xe_eu_stall_data_stream *stream)
> +{
> +	xe_eu_stall_disable_locked(stream);
> +	free_eu_stall_data_buf(stream);
>  }
>  
>  /**
> @@ -214,6 +832,19 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
>   */
>  static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
>  {
> +	struct xe_eu_stall_data_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +
> +	mutex_lock(&gt->eu_stall->lock);
> +	xe_eu_stall_stream_close_locked(stream);
> +	kfree(stream->xecore_buf);
> +	kfree(stream);
> +	gt->eu_stall->stream = NULL;
> +	mutex_unlock(&gt->eu_stall->lock);
> +
> +	/* Release the reference the EU stall stream kept on the driver */
> +	drm_dev_put(&gt->tile->xe->drm);
> +
>  	return 0;
>  }
>  
> @@ -229,7 +860,79 @@ static const struct file_operations fops_eu_stall = {
>  
>  static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
>  {
> -	return false;
> +	return ((xe->info.platform == XE_PVC) ? true : false);
> +}
> +
> +/**
> + * xe_eu_stall_stream_open_locked - Open a EU stall data stream FD.
> + * @dev: drm device instance
> + * @props: individually validated u64 property value pairs
> + * @file: drm file
> + *
> + * Returns: zero on success or a negative error code.
> + */
> +static int
> +xe_eu_stall_stream_open_locked(struct drm_device *dev,
> +			       struct eu_stall_open_properties *props,
> +			       struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_eu_stall_data_stream *stream;
> +	struct xe_gt *gt = props->gt;
> +	unsigned long f_flags = 0;
> +	int ret, stream_fd;
> +
> +	if (!has_eu_stall_sampling_support(xe)) {
> +		xe_gt_dbg(gt, "EU stall monitoring is not supported on this platform\n");
> +		return -EPERM;
> +	}
> +
> +	if (xe_observation_paranoid && !perfmon_capable()) {
> +		xe_gt_dbg(gt, "Insufficient privileges for EU stall monitoring\n");
> +		return -EACCES;
> +	}
> +
> +	/* Only one session can be active at any time */
> +	if (gt->eu_stall->stream) {
> +		xe_gt_dbg(gt, "EU stall sampling session already active\n");
> +		return -EBUSY;
> +	}
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream)
> +		return -ENOMEM;
> +
> +	gt->eu_stall->stream = stream;
> +	stream->gt = gt;
> +
> +	ret = xe_eu_stall_stream_init(stream, props);
> +	if (ret) {
> +		xe_gt_dbg(gt, "EU stall stream init failed : %d\n", ret);
> +		goto err_alloc;
> +	}
> +
> +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> +				     stream, f_flags);
> +	if (stream_fd < 0) {
> +		ret = stream_fd;
> +		xe_gt_dbg(gt, "EU stall inode get fd failed : %d\n", ret);
> +		goto err_open;
> +	}
> +
> +	/* Take a reference on the driver that will be kept with stream_fd
> +	 * until its release.
> +	 */
> +	drm_dev_get(&gt->tile->xe->drm);
> +
> +	return stream_fd;
> +
> +err_open:
> +	free_eu_stall_data_buf(stream);
> +err_alloc:
> +	gt->eu_stall->stream = NULL;
> +	kfree(stream->xecore_buf);
> +	kfree(stream);
> +	return ret;
>  }
>  
>  /**
> @@ -251,10 +954,15 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct eu_stall_open_properties props;
> -	int ret, stream_fd;
> +	int ret;
>  
>  	memset(&props, 0, sizeof(struct eu_stall_open_properties));
>  
> +	/* Set default values */
> +	props.gt = NULL;
> +	props.eu_stall_sampling_rate = 4;
> +	props.event_report_count = 1;
> +
>  	ret = xe_eu_stall_user_extensions(xe, data, &props);
>  	if (ret)
>  		return ret;
> @@ -264,19 +972,9 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	if (xe_observation_paranoid && !perfmon_capable()) {
> -		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> -		return -EACCES;
> -	}
> +	mutex_lock(&props.gt->eu_stall->lock);
> +	ret = xe_eu_stall_stream_open_locked(dev, &props, file);
> +	mutex_unlock(&props.gt->eu_stall->lock);
>  
> -	if (!has_eu_stall_sampling_support(xe)) {
> -		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> -		return -EPERM;
> -	}
> -	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> -				     NULL, 0);
> -	if (stream_fd < 0)
> -		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> -
> -	return stream_fd;
> +	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> index 70fc89480df2..00896812db41 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> @@ -6,6 +6,49 @@
>  #ifndef __XE_EU_STALL_H__
>  #define __XE_EU_STALL_H__
>  
> +#include "xe_gt_types.h"
> +
> +struct per_xecore_buf {
> +	u8 *vaddr;
> +	u32 write;
> +	u32 read;
> +	/* lock to protect read and write pointers */
> +	struct mutex lock;
> +};
> +
> +/**
> + * struct xe_eu_stall_data_stream - state of EU stall data stream FD
> + */
> +struct xe_eu_stall_data_stream {
> +	bool pollin;
> +	bool enabled;
> +	u64 poll_period;
> +	u32 event_report_count;
> +	size_t per_xecore_buf_size;
> +	wait_queue_head_t poll_wq;
> +
> +	struct xe_gt *gt;
> +	struct xe_bo *bo;
> +	struct per_xecore_buf *xecore_buf;
> +	struct {
> +		xe_dss_mask_t mask;
> +	} data_drop;
> +	struct hrtimer poll_check_timer;
> +	struct work_struct buf_check_work;
> +	struct workqueue_struct *buf_check_wq;
> +};
> +
> +struct xe_eu_stall_gt {
> +	/* Lock to protect stream */
> +	struct mutex lock;
> +
> +	/* Execution Unit (EU) stall data stream */
> +	struct xe_eu_stall_data_stream *stream;
> +};
> +
> +int xe_eu_stall_init(struct xe_gt *gt);
> +void xe_eu_stall_fini(struct xe_gt *gt);
> +
>  int xe_eu_stall_stream_open(struct drm_device *dev,
>  			    u64 data,
>  			    struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a68..6e9598ddabd7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -59,6 +59,7 @@
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> +#include "xe_eu_stall.h"
>  
>  static void gt_fini(struct drm_device *drm, void *arg)
>  {
> @@ -158,6 +159,7 @@ void xe_gt_remove(struct xe_gt *gt)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
>  	xe_gt_disable_host_l2_vram(gt);
> +	xe_eu_stall_fini(gt);
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> @@ -622,6 +624,10 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  	xe_gt_record_user_engines(gt);
>  
> +	err = xe_eu_stall_init(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6e66bf0e8b3f..833a1a67e9ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -430,6 +430,9 @@ struct xe_gt {
>  
>  	/** @oa: oa observation subsystem per gt info */
>  	struct xe_oa_gt oa;
> +
> +	/** @eu_stall: EU stall counters subsystem per gt info */
> +	struct xe_eu_stall_gt *eu_stall;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index de682978c4bf..bcc34e47808a 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -424,6 +424,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
>  	     TP_ARGS(xe, caller)
>  );
>  
> +TRACE_EVENT(xe_eu_stall_data_read,
> +	    TP_PROTO(u8 slice, u8 subslice,
> +		     u32 read_ptr, u32 write_ptr,
> +		     u32 read_offset, u32 write_offset,
> +		     size_t total_size),
> +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> +		    read_offset, write_offset, total_size),
> +
> +	    TP_STRUCT__entry(__field(u8, slice)
> +			     __field(u8, subslice)
> +			     __field(u32, read_ptr)
> +			     __field(u32, write_ptr)
> +			     __field(u32, read_offset)
> +			     __field(u32, write_offset)
> +			     __field(size_t, total_size)
> +			     ),
> +
> +	    TP_fast_assign(__entry->slice = slice;
> +			   __entry->subslice = subslice;
> +			   __entry->read_ptr = read_ptr;
> +			   __entry->write_ptr = write_ptr;
> +			   __entry->read_offset = read_offset;
> +			   __entry->write_offset = write_offset;
> +			   __entry->total_size = total_size;
> +			   ),
> +
> +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> +		      __entry->slice, __entry->subslice,
> +		      __entry->read_ptr, __entry->write_ptr,
> +		      __entry->read_offset, __entry->write_offset,
> +		      __entry->total_size)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.45.1
> 
