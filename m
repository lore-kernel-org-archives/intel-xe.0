Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E4CC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE7D10EA16;
	Thu, 21 Mar 2024 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moEvULNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47310EA16
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711026985; x=1742562985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yjuEBopKL8oOhka6tm/UnqPcDi4G0srUrnE3tIIvNoM=;
 b=moEvULNSZR2KdXE2HF3t1goKjeYtJklNYMfIT/uBFzaEMkIapG+O1KkK
 AoJ7SQ4HdxSywQx6zS1/y39AfZDfBZZX6q1lbhpy5DLrmLRhzrQaPZIxe
 YXic+ss3FqjMeGbeSpN6WgAQpT0PAgvOQ2kN9pSrHeRQCeqVNcM+PSq2B
 3yn+4QTysLSeFbDUyvKjczNEkQ57ozDw2P+povKz9fcWYnlHKbRG0e0ut
 V/lZbWMLvM6e2xhVRLeB+POKwqnalJL4KOJPdi0mYyQhmwEdBzB6uOp8f
 o8RgKLY8AAtUsgiShAKBoljheWj/H8t0rVEhL6UHbZ+og24IKmCPMOf2P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5904649"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5904649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="18974901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 06:16:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 06:16:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 06:16:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 06:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKl6N0h8mnkb1/Psk5Ylby8Z2nWZETk0qn0nIWjq6WQ7usH99so01Kc2RrSJPvdoqnJweNRBBNNqPFNTn+ltwEZ394BVQY6JPP6uRT73vP8awxC/W+OSSLOmYDHU+lZFZR8X3DG8cduRWJOLSMbmIbELNX1M32z6Uq2O8TP6bUCIt2T+O6L0GUc1JjqAh2+jo8qVoKaPRG0mHfRfoBuR0Vkn+AfU3H0OAF8joV9Cz/zNSReIcpKmdL2LjAX0hreCc2ZPQRyh5+1c59ilkBj04cQUGUASEI7Hw9vXJW4FlarQU32wpbXqFMyP6IU34C9NGJJ1STuMIDuSTzKoz0WdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8c4IuMEHplgzoCrHJ8vsqqRQ4HQ9BJEWCV+kJByYm0=;
 b=Zjws+m1EWAEHTJfvE+3jlnDByuQ6DK18gX0MWETB5QJd5lYwwTDWBofpqyKLtWfCq+Ql2hpfV/T5EYOgggr4wSmHKORNcQgv8Ga8e9TbadY81hOek3fx+vASEZx/J+NOGDGlW/TXKNC874fPydtINUia9IshhTPvJc78NmvUqa+KUQMptIZ22DoN1MrnMfdzYe/A5mz3bfIsic9wzxMT1V8LSbUKXcvUPHm3takcAXEwynJZ6Zqs7+SPmrpohknLQ/BTeIkw9NtgfaFAhjaOdjdr/ZxsOrfSKjyi42ugfSoZxkhXus4lhP1sd4XOp7zTCvs3uQCIfRMABQ++V9Tb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 13:16:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 13:16:20 +0000
Date: Thu, 21 Mar 2024 08:16:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <4q3q7ljw4i7xhvfiwwmrw6txxme4p72k3ocbnl65ncgv757gjy@zcusdrjd4g7q>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-6-rodrigo.vivi@intel.com>
 <icleohhxyesfwfcfikzsubm3dqcpmujb7dal24lblfx7t62fzx@ella5j5r6ooh>
 <ZfigjKare0FDcHw8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZfigjKare0FDcHw8@intel.com>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fc8e9f-af5e-4c29-d6c1-08dc49a91966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4OT9zKfqU36XKGe+EQZPvdJlLWQKxA2j3035uPKUJyRFwKclgliROmSbYvapM6HuQmce6vTXm25RLA7YL4jhBNduvbYtffuIcuCEECCprlv1RNqgn6ZwRiu1WPqCRTdwcL09tBo6s60pVVA1BY1hDcHf35KYleniXmrOuzc885p0ZSSp52F+d3hOFusNLytj7HloNvZ8DTsxmu2jAYtuxH+XF1HPwsHQTtPy182EctGNSbJSTp2S5Em/lOQgZg7Ew5eHwwFnQSf3ccPy97MnWCQdnbM2ipQA5EPT8wfCq9/lP2SPjwHgB5qcCk8JNB6E/SmnVkxs89FySIzSXjEe9ghVaR83T41J7OTTSqahqniNC4FXR4MduEjRSlsI0rAvpnrdalJ96+djp5YmjDN5tMyVdMejmO1p+5j6Gn6+yaINJMNCl7oaFrWGjuiBoVjA1RwkbfTMxk4zf3GNOYwpBODgtsHH2dVF775yvsgKMTwnqNzIpzZZ7b1qsYmSxziYZ3sv8ifulBCjbj3l0WW/Xolw0jZuHdkrFWDJLu8FeQAwQDTKQnil3S3fBZcUfsN2g7LCC1zC49YH4p8oNd0pBZKdb/pOji5NNuCKhH7LgGT5JTcIVb1THmDCxVeO4kwJTKMP75CcXcVz78wF7QLqORGj924XpRMgHk7PLlEWZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TueP4K8q0sj/gYiv1VA2JwwWKEJF1ZaQcZsdbdd6BBiz0zLOjjVyVQz/cu68?=
 =?us-ascii?Q?f0BJvtF5qd9mEocIxP2NNQw5DTob5ZrCDnf1hObBhzW6w9zNNdZ1QnPWX9jB?=
 =?us-ascii?Q?82Qyp+tU5s2LjiBP6xCs2FWQrbJS8U/8Grr6Jyv5/gjflQxtgoBTKHd1e4Gb?=
 =?us-ascii?Q?dUQeD/xsgWGLw/IUTbuTpmvBhGS1YoXQ7FwQZwsdPuzEUobyBwXxWmVw31Qj?=
 =?us-ascii?Q?Nn0LGxqOju8rwYoyd6h3tH3HKsmM/iDplMRYKGbUhwJLgqt7PziJ0w9PY5ow?=
 =?us-ascii?Q?irzVEooCP0Pv17lBhWzDU0ftpsepgZRGgQnst1LFmglv/AOXQ4rW/IrhA6Fi?=
 =?us-ascii?Q?97FSTTxXC7v4aekMr8VI9b672h2O19YjNLc1xSDr4OxITCVWaFvEMC2B+E7J?=
 =?us-ascii?Q?0GTVYBTzxDW9CSzSbnLiu5Tn1fKheQ+n8fF1HW4jAtABb4peJJD81Et1IVqD?=
 =?us-ascii?Q?llVPODJlQ+AtyQxKolN9FlJ/dvCF2G8twK6Qb0ZwGwIMP3BY3fPcEafdXUI/?=
 =?us-ascii?Q?jnfqzom1hUjv9pyxp29iI3MgLDJBtymfiYmhAa8SXdZjaR48hBdYxL+KTL+t?=
 =?us-ascii?Q?HXJo1z1DCCjRAuDNvTWOkCH2LmT3TXbDaKAZj2lmz9p5hj+Ub2rnnzAzPvwa?=
 =?us-ascii?Q?65pLwBuif35ag027AT9zBboN08V4Y+Ld61seS/kFYYvU9WvHlTEX3U3EUyXW?=
 =?us-ascii?Q?h20XFffji5dPTrD2Ea9COo1K2CjcJebz3cZR6aamaf1EvQdi7HipYz9nGAgZ?=
 =?us-ascii?Q?FRVkTMxK4wx5r0zB+3n4FTRni9Y7MW8G1sfIbM8C28wOMb50Vtv1msqhA4Oz?=
 =?us-ascii?Q?CFHX25zrsHsXvaUxgN0aWkUB7xjPGPmzdaSSEnoNxIdqk1iQfITXQdtc2m/n?=
 =?us-ascii?Q?SyhVwhDuLT1Bh9TmOJ1BGbayr2hfHTdulb7Hfg0EJv2RKMQNCB7OLjjlOkEh?=
 =?us-ascii?Q?T8ViiL8DJNRz57okQvEXphL/mrboJK+KrDFLcl7idw0xH2ofkO8k7hWr9vU+?=
 =?us-ascii?Q?GsW3HO/SBG5O7j7oqa9sB2bQqN8zHGdHSuZFEZZPgupEcwp1VNJ817mxhh11?=
 =?us-ascii?Q?WGrircUeN7llUnx3bM5GNweP36z3H0ZZGfRWykrISokH/M+39j/LHjrTLe+l?=
 =?us-ascii?Q?wZdDBneCLeUMV6yQ3W4lL9/CkkALW0cNYP0Y2f/Uu5o8wSuaXgIrL9h/lhxO?=
 =?us-ascii?Q?oI+6OsfAQmxJwrWhHZFo82DmbTpuGvSZRpRuAqHfJYMA287owJkIbuLxNa6v?=
 =?us-ascii?Q?OqJnYyMbo1IprKxsBWGSPm3+qTKvcoNHIlkNeZ0Cxv5cIa1TrJaWq4b46QQf?=
 =?us-ascii?Q?5s0VAxPLa46aAG0AtzZp6+c9ZI+BZu8yXLcvkJq+juInbhEnC+vy9B88KUkW?=
 =?us-ascii?Q?+zyL3f2ABfhfW6LQDwnIdXbytl+OoTkVhn5DCw6UfQVcftTZWopj/+qOA+I7?=
 =?us-ascii?Q?1YlYi0YDqjfNH44eI3V9PTWJQCJsf2zDCxemTE/1sq5ti0JYHW7PYYzBRi3s?=
 =?us-ascii?Q?Op3odr/1hJwvkrtl9itMGXA6k7YPaYOGfn7MZOUB4X+GDzzpFFIkGOJEWpjh?=
 =?us-ascii?Q?1pX4ktIR4YQPr+rmG8BwEbDmbk2/8OhOqDUmXQtZ/+A6Iwp3Ht/IxfTYIRIh?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fc8e9f-af5e-4c29-d6c1-08dc49a91966
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 13:16:20.6175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQw5vMSQdUHREoZSiNxaOQsH/HKMC9TrU7GGdcfZlRkbiGmBneCi7rF3oqZlerw44LbbszV2/MX3fSn9ZXaia4lGaNNlgZPOp4MYmwJqPM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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

On Mon, Mar 18, 2024 at 04:14:04PM -0400, Rodrigo Vivi wrote:
>On Mon, Mar 18, 2024 at 02:31:31PM -0500, Lucas De Marchi wrote:
>> On Fri, Mar 15, 2024 at 10:01:08AM -0400, Rodrigo Vivi wrote:
>> > So, the busted mode can be selected at runtime with the device
>> > granularity, rather then a module policy.
>>
>> did you mean to squash this in the previous commit?
>
>doh! yes, that was the intention, but forgot to mark it as a fixup.
>
>>
>> for the entire series, it seems it's going the right direction. It would
>> be good to have some more testing with it before merging though. I asked
>> SV folks to give it a try. I also saw some typos I forgot to comment on
>> so I will have to go through the patches again.
>
>yeap, I also want their ack on that as well.
>
>>
>> Another question is about naming since some people didn't like "busted".
>> Options:
>>
>> 1) keep busted
>> 2) zombie
>> 3) back to wedged
>> 4) dead
>> 5) blocked
>> 6) disabled
>> 7) unusable
>> 8) unreliable
>> 9) misbehaving
>>
>> Did I miss any suggestion?  Well.... the order above is just _my_
>> preference, but I'm totally fine if other people disagree and we decide
>> something else.
>>
>> Cc'ing some people who may chime in with their preference.
>
>well, at this point anything works to me. Just let me know the most popular
>and I change the patches.

wedged it is. Can you go back to wedged? Sorry for the trouble caused by
my dislike of using that word. Multiple people expressed a sentiment
like "better the devil you know".

one thing that I had considered before was grepping for wedged 
in other drivers. Although every driver seems to have slightly different
semantic for a wedged state, we certainly have more "wedged state" than
busted, zombie, etc. So... let's just go back to what you had before.


Lucas De Marchi
