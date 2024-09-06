Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDCAE6FE46
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 19:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2093810EAEB;
	Fri,  6 Sep 2024 19:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2ISwrgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C920D10EACE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725651903; x=1757187903;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pLwcqToJB4nt+4g+zyRmajWNN7QO548bNlLede/oL4A=;
 b=e2ISwrgTlX8X22GwDEbXDXiflXR5RiIQ0ySW9nWJz58IuvtXadSVpZf8
 QZxxnAuLDyeKtCqVfcxNDYRJPpz2xmUqEIiCZ7BUCHIZDfMW3WiY3sPAD
 6WW7Qgt6Zi+xn2g42/ZWuDtKWHZlQYxaih4kU3OIOeNR2FbATqXJg4wYK
 5/TO+jwV/ZHbW8l0l4O7xbg6umYOAxVSR8+p0fW9TJpklVfthZmACXXEB
 gVZsSdJwNiW7LmfGUpBLdrFRqe3R+MkgH14gCnHYuAIWl+N9uLsd5SOXV
 WgwWKE1bKcWWhfwIxeg2SXg9DxNQNMQ82fnJOLb4WjmQqxYJVJs957FG7 A==;
X-CSE-ConnectionGUID: ZlAhr7a6Qzezldvv8bSBBA==
X-CSE-MsgGUID: ryx4vzrFTrC/d7Wy7fuYAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34997787"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="34997787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 12:45:03 -0700
X-CSE-ConnectionGUID: KyJagj5gSYG6MUV3cZpOrQ==
X-CSE-MsgGUID: gtKPzOMhRUC6Efx6CBQHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70631687"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 12:45:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 12:45:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 12:45:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 12:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imcpV4na12PfnKPD+epBWhHQuD9BEx59lLAzYh6OgF/aL7L29ZdTtpeVI5jzw9tS0lKd7aL0uYIA6YOHMMc/kEOpHZZohXIehYuFZPcHNPH95S7T6M/FrVToG+LjmuRmtHx6bINNqUVzjoLYlQYbjZ8TD635HfuLe2G30XPNhzAyfMr+1Ql6J+45uQTtBfD42HnMAxgp7WLie1LnS7Tdwk/v9pKRHXDjD67ihygGu8DQYSyIlgtg0HtD7Qo1KdMbwGVY5OCdKaFz9GW4mCZjwSGqEbZgy5It4729FkMcmkAuGjeuTB6HXzX/8nXXzCunwRE8KqRmn74uxz+WpqxJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZOQrv0dvEmzyACa3+x9TzCKY3BQ1Q+UW1gKIygTU6A=;
 b=aazy2l2FUZJ1eU165FGZTXXQoxCASv7OvHL3nAzIBszf2EnQLNLsiMKSkNhi63+mXoEYxzwFWUaiWPvcsoDgaurA0tI+XMyN+DFITatuwLzoh63FhNSzBjkMLmpJfqnWgrOl1FiDXuJkeavlrzSwyG9bOS8n6H6oGIPzu1aiKbh5hZPZNMr/SvXNx56b2Kx5/IGYAN8EKroyLxToQtz5NIOHDrz6LN83sM8GHjG5+LVluxEDIVODhHAJp6I4EIq1I2m2PI4njtszQsOaMreZvsvMaG1OTHEal4qkvXAw1hGv3kl6v7DDnEe5YvqHIaQ97TGvM98coIni1faB2W81nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Fri, 6 Sep 2024 19:45:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 19:45:00 +0000
Date: Fri, 6 Sep 2024 12:44:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/43] drm/xe: Adjust mmio code to pass VF substructure
 to SRIOV code
Message-ID: <20240906194457.GV5774@mdroper-desk1.amr.corp.intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-53-matthew.d.roper@intel.com>
 <b524f27f-f3f3-4c5b-960e-f7c98455ae82@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b524f27f-f3f3-4c5b-960e-f7c98455ae82@intel.com>
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb293b3-d82d-45b1-1e29-08dcceac64b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KEKpnyF2f+OB4ECD5FyCh05o2hmOKGGqzKO2TXBoqChS3c7okbk6EVb+/w3A?=
 =?us-ascii?Q?IuiU5Q+Nif02p7C1BJ23to3BV/gHx+KcWxWWTys7Ztl8MmO2KIqKLswQCrgQ?=
 =?us-ascii?Q?oe6sY4+JreZrDEo8Gn5ZXBYT/I9LYdyr2LaDOp7SdiV0Oela5w46+KYqDGYF?=
 =?us-ascii?Q?wLa46Qxc8s1MYqCkbSwawZVq8HtQmb/poUNwX98p64ApFAc3FbUWKr2Nb6SL?=
 =?us-ascii?Q?4TUZiBNC1edDqnh0qU8QgqcI+W155Rc27JjShsP1sItr/HRbP+j9RUZoQlZM?=
 =?us-ascii?Q?Hk3lKMI700fx/Rp5TB50WI13vmX4x1w9HPRPuOFlRYY8swxruObSzq8cwaud?=
 =?us-ascii?Q?bpo6mvELUDKcmDXYVTGYtjaOZqoVLicS1Fwvyx/F5Cf/Lc+RvGEedMAaUilG?=
 =?us-ascii?Q?lNLwPN218L2NmuFMDDAo/DOm58T3tvtlOjEsD2xqw4YpR8QsEMn/Iacmo5pv?=
 =?us-ascii?Q?FT4aLWWqNL6XV3Mhyq6G76l7vkK1QcsRExCJEi1ebSPZ/zbWSeNGrhxQUzYy?=
 =?us-ascii?Q?yav1CqsCsWhWjZ6270GCuh0M04wFauWEz+V48WmR5IUvHj/aa3SHOJbGxYwK?=
 =?us-ascii?Q?N5H17fDHPER0hiMfi3xI9TdxVNz7A9+EAfJ2y0fgJ6L3mfqbzSrr/BIu//oB?=
 =?us-ascii?Q?nE0avGKI/IAswJzxXeJuSeNqXsEb2BKQk6J1W+Khl02git041WqJ/sDojiy0?=
 =?us-ascii?Q?4grXJk4e3VToKX7CAX9Mfjk47oEpJPPynR0yX+jkZcbyPa09TV+uZ8cCKDho?=
 =?us-ascii?Q?IBBezNXTnSoiGVKAtj/Qd9MyVIYN5K6u1swI19DFKrP1ne/n0QUkLjE7JGcN?=
 =?us-ascii?Q?MCDoJpRc6czLa+vD/oI5141OzbQ7k6VXozHMHlio6AxEwjtu5UHHzdsskjYW?=
 =?us-ascii?Q?vk0uRUNsuslkQoBoAP+QVQVWSYArHxewQ27sBn2ZLtnE957XmzDQ7fdfx1ww?=
 =?us-ascii?Q?0pU25tqPYPIns+uWVSyaeQRT8kDbX/5121NTgLnWzRbfoahXMRcaUie1QqSA?=
 =?us-ascii?Q?CMiiBirLNI8MvXzL+ZAEwp4LDxefICA0fMIC5c0GgMbRXBqZumk7dyqPArKG?=
 =?us-ascii?Q?WMKrSde41OKoH+VapO0YXFWXidcPmD4W8N1tjjiuVlr8vWQ3GXNmq9sm2UCU?=
 =?us-ascii?Q?FNkTC57YHVQM/iWrAOLpXll0eTCO8QES+Vr2cJcZ10nRy/pfR12YEpXlvGsc?=
 =?us-ascii?Q?FXHRGa4XrquhDsi/+HfAEYbfqrvZQ30FEqoEMjdDCeWxk8dGN4D9gCzYusqk?=
 =?us-ascii?Q?SQiYQT1ANumgJBICiy5OyBi8VkRT7vH04dLomTF2WYD8UcJjLvH9g7bSBo0Z?=
 =?us-ascii?Q?9FNiwkutxd+GZ/g6xowz8c1/fc5ipzRpraUQ4D9R39XqVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+AIq/kYGCLzvRPvsr7NKQuT7a8MUTMUsVvNmzOFPMP880tHtp6jK6RjKWycz?=
 =?us-ascii?Q?yssbVFn454XvsUD0QPrPQ5eSm2UeH07s7SS4ZL+mdvOwbql2B/HW5kNBab5c?=
 =?us-ascii?Q?KkMkL/SdBaThsmqrRV37WnILZqUAlMYxW/v0fAaaJpr2CaYaSl6vwbw4T9hi?=
 =?us-ascii?Q?j6o41xaUIJjQCsGiXguU7CnyT0criCaqEyAfRgftSom/gmKi1W/3qhOU/C7j?=
 =?us-ascii?Q?BiE8+YkxMsXb2ENkCvVLlI3Cu9bzHOMGtP4VSJXVaQDhfKxiTLUn79i1pYPV?=
 =?us-ascii?Q?Q80Jku2Deg3sNr+6Ugy1GfmD8eC/oAJbnUh+8s7J5Cc8mGQ8oxQDKfQv9zDs?=
 =?us-ascii?Q?pcdMzhbdKunPFlSlraaLnFXXBhyWNGGGqQLGCBNPu9b2S6KZXcytnNecK86U?=
 =?us-ascii?Q?FmSOuaAeDDP+ruQek+eSaejz+xe/s+nV3O2Ch4w7tu64BdHz9YyiFFNNXzkh?=
 =?us-ascii?Q?2NB/+5Z8L2F911HivBf19nVYm2dQxKsH8OIxk0QvEJeAiKWuTc2bpo3JLzfZ?=
 =?us-ascii?Q?bpvNpZxXhWB4mC45JqmI836Nh9wBVuKAkR6XAdinBbBRO4PHpL466nlrK4Zp?=
 =?us-ascii?Q?X4V/eMC5NyuopoUIjOgusxkD9L7OcHSaDz4hLjZ+lJsYDqrNswYjfkB0gCDP?=
 =?us-ascii?Q?jU0BlGq1LvjNfu5GzYsUl7RQTHG7t8XsnKY3xKFJZRvNRUxWp/d7c9uaotSS?=
 =?us-ascii?Q?an31ye2xdlMCbnfGnm4BZGxk5MNh56Xmlg7MCJJ2x9ecnCGrKo/s+akoy6or?=
 =?us-ascii?Q?8jpxF5uZLS5oHYHuXW3doiQvvIKTzXvZvWiAHytlF7gNk9ViD7r1xME1dAIs?=
 =?us-ascii?Q?KeKqTRRcbWhM9ogZQvRaqpCJgNoiqJVcn2boc+BPLdkQsm9inoeSmkGAZPJ+?=
 =?us-ascii?Q?eGFWJK7NL6fvjGSaA6V8UlTNR/inWTXI/8vaxFmvcO/GgCSSHmkuCG3mqV0q?=
 =?us-ascii?Q?Qp26yjJ6NxZzlDNPwgG6RgYUGTpZOVj8NaZlg7/703M/6tDZuaSI/Gzc4Uqb?=
 =?us-ascii?Q?1vpA893JlgCeCwLSv2dnq01pAOa2jlfgsqQ6BxqICfWhRao7dM2ZLkN8kpQ2?=
 =?us-ascii?Q?7i/y1xwEYH+RTZBavegVXnSlNqtieRi4A00LITOINmgZfzkG0/IlSbahy13I?=
 =?us-ascii?Q?dCqP5JLfNtKrO18ckRNpOF8yjG8yy5E0132152aI6dEhN1eL2OBLZtW/5nE9?=
 =?us-ascii?Q?zi/9Htttpb1a2pjAtOX2D1zA1eHg4HQkN5IfsHPRxSWOd3QpM9z551nfsuA8?=
 =?us-ascii?Q?jrM8JJa+S+TxsDMCKpI86yDQ5G/pwDgIGlF2kn01L+YmqnPvM92dy9N9D5my?=
 =?us-ascii?Q?KZFX4vWZXcA8ZI0zsLJiWgYUUHvWIzn10il/+cUtkwcNqooDTymXTBHH7i/2?=
 =?us-ascii?Q?7QP8+dTlYjaQkG9wTJT1O2/Oeql5flqAX/k3zbfXQJnPDSfOgK7Ea6Fkae6+?=
 =?us-ascii?Q?jhp74iaZB/gzjT/ChG9ov8UGGUoPOvBEqWlIgYYif+Mn9l6Is9mn2ybWXWtJ?=
 =?us-ascii?Q?ItIiRk8bgO+7sKuqveCO4rLiwXkW0s0gJsfITgPh55sBcbOrofhqhKjhpOUh?=
 =?us-ascii?Q?Gxr7I5I7t2GlGQ5/eeQudgNVFnobp6X7wNTqU7B9shEk5ZNc4RxyeJB4KL8z?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb293b3-d82d-45b1-1e29-08dcceac64b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 19:44:59.9912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOjd+06Lr0luumackvJFuJYs/EbOjZJJGFWFY03OLUDyS6sOtzUGb9NG1EJtV3UcnMmnqQs5FaocxeP9YxuHeKjHSufXHE0Vc1rnEdREmq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

On Fri, Sep 06, 2024 at 05:28:37PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 04.09.2024 02:21, Matt Roper wrote:
> > Although we want to break the GT-centric nature of the MMIO code in the
> > general driver, the SRIOV handling still relies on data in a VF
> > substructure of the GT.  Pass this substructure, rather than the GT
> 
> hmm, I would prefer to keep GT as VF function param, this substructure
> is not used as explicit param in any other function by design
> 
> > itself, to the SRIOV code called from the MMIO operations.  Most of what
> > the SRIOV code needs is within this substructure, and container_of() can
> > be used to get back to the GT itself if necessary.
> > Also store a backpointer to this structure within the xe_mmio in
> > preparation for removal of xe_gt from the MMIO interface.
> 
> maybe in addition to backpointer to the xe_tile we can also keep more
> generic backpointer to the xe_gt?

My main worry was that if I added the GT itself, people might start
trying to use it for non-SRIOV things which defeats part of the purpose
here.  I guess I could name it something like 'sriov_vf_gt' to make it
clear that it can't be used (and likely isn't assigned) in other
settings.

> 
> but then the question would be whether the xe_mmio unification at GT
> level brings any value ...
> 
> maybe instead we should consider adding GT oriented MMIO functions that
> will do necessary address adjustments and then use the pure xe_mmio from
> the tile:

We sort of took this approach in i915 for a while (where we had
GT-specific read/write functions and they did some special stuff for MCR
registers implicitly), but I think the feedback at the time was that
most people preferred a unified MMIO interface and only wanted a
domain-specific MMIO interface in cases where the higher-level
operations (MCR in that case) were explicitly wanted/needed by the
caller.  So i915 went back to the (somewhat misnamed) "uncore" interface
for general GT register reads and only used a domain-specific MMIO
interface for the MCR cases where there were more options that needed to
be decided at the callsite.


Matt

> 
> u32 xe_gt_mmio_read32(gt, reg)
> {
> 	struct xe_reg adj = reg;
> 
> 	// maybe we should have XE_REG_OPTION_GT ?
> 	adj.addr += gt->mmio.adj_offset;
> 
> 	// we can place SRIOV VF hook here
> 	return xe_tile_mmio_read32(&gt_to_tile(gt), adj);
> }
> 
> and for the whole series introduce (or even keep):
> 
> #define xe_mmio_read32(p, reg) 					\
> 	_Generic(p,						\
> 		struct xe_mmio *: __xe_mmio_read32,		\
> 		struct xe_tile *: xe_tile mmio_read32,		\
> 		struct xe_gt *: xe_gt_mmio_read32)(p, reg)
> 
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 6 ++++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h  | 5 +++--
> >  drivers/gpu/drm/xe/xe_mmio.c         | 4 ++--
> >  drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
> >  5 files changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 19c21e55e153..15a371f81c60 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -121,6 +121,9 @@ struct xe_mmio {
> >  	/** @regs: Map used to access registers. */
> >  	void __iomem *regs;
> >  
> > +	/** @sriov_vf: For GT regions, backpointer to SRIOV VF structure */
> > +	struct xe_gt_sriov_vf *sriov_vf;
> > +
> >  	/**
> >  	 * @map_size: Length of the register region within the map.
> >  	 *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 4ebc82e607af..2c61882ea411 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -879,8 +879,9 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
> >   *
> >   * Return: register value obtained from the PF or 0 if not found.
> >   */
> > -u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
> > +u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
> >  {
> > +	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
> >  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> >  	struct vf_runtime_reg *rr;
> >  
> > @@ -915,8 +916,9 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
> >   * This function is for VF use only.
> >   * Currently it will trigger a WARN if running on debug build.
> >   */
> > -void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > +void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val)
> >  {
> > +	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
> >  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index e541ce57bec2..0437c937f5b0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -10,6 +10,7 @@
> >  
> >  struct drm_printer;
> >  struct xe_gt;
> > +struct xe_gt_sriov_vf;
> >  struct xe_reg;
> >  
> >  int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> > @@ -21,8 +22,8 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > -u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> > -void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > +u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg);
> > +void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val);
> >  
> >  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> >  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index dd2076b9003e..8068663e7d28 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -239,7 +239,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> >  	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> >  
> >  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> > -		xe_gt_sriov_vf_write32(gt, reg, val);
> > +		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
> >  	else
> >  		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> >  }
> > @@ -254,7 +254,7 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  	mmio_flush_pending_writes(gt);
> >  
> >  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> > -		val = xe_gt_sriov_vf_read32(gt, reg);
> > +		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
> >  	else
> >  		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index e222539022d5..04d34fd015ce 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -715,6 +715,9 @@ static int xe_info_init(struct xe_device *xe,
> >  		gt->mmio.regs = tile->mmio.regs;
> >  		gt->mmio.regs_length = tile->mmio.regs_length;
> >  		gt->mmio.xe = xe;
> > +		if (IS_SRIOV_VF(xe))
> > +			gt->mmio.sriov_vf = &gt->sriov.vf;
> > +
> >  		if (MEDIA_VER(xe) < 13 && media_desc)
> >  			gt->info.engine_mask |= media_desc->hw_engine_mask;
> >  
> > @@ -738,6 +741,8 @@ static int xe_info_init(struct xe_device *xe,
> >  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> >  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> >  		gt->mmio.xe = xe;
> > +		if (IS_SRIOV_VF(xe))
> > +			gt->mmio.sriov_vf = &gt->sriov.vf;
> >  
> >  		/*
> >  		 * FIXME: At the moment multi-tile and standalone media are

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
