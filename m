Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD68CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33810EA03;
	Thu, 30 Oct 2025 18:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQBg5doP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E742810EA03
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761849810; x=1793385810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5I7pV70FgBwIg8M9GjDuFFtqHG1liOL3HRgTU5Worx8=;
 b=fQBg5doPd2rCwUiwOm8bX7jjzQ3tPNOAwtPjbZsA4XxLaAFamHWOuIYl
 Am5XO8ZRBtgJ34+1wwA8cnNSxvVM4IZl4yhcjqdkmJ2rMi3ENpbQwKA8Q
 QKsBLIzSNfrhUZzXK7hovjr6wIKbOkGu3aFymiDsqiabqRYcC06YEa95R
 C6TZ06UkKC3I5LGQQVhf5q2mNB08FUtyA2SRixnGT+Zv/WPr423s/Wd/K
 zbZ0uN3sHKF8yWR+L3tDyNjOgXd8ReRC4Eg4R73VZezRnx84TQDwUqTRo
 HH4Pz3GPWLVFitC7NoD0O4WDbVI77yNHG1W8IVSAr5b27zdwKgyw59kYA Q==;
X-CSE-ConnectionGUID: ZtV1twNlSvOycyG0OZxyVQ==
X-CSE-MsgGUID: Y4zibiRBRzeH0Rl8640EHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63701023"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63701023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:43:30 -0700
X-CSE-ConnectionGUID: OaWczB9wRA29NYFcQUN18A==
X-CSE-MsgGUID: TYCK/9OOQ2myydzkJmQuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185299386"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:43:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:43:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 11:43:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:43:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwLRnIXpP+lC0vLzE3XJCyXZUYP1+l4kiAIfoKVc+f0+WqwbMe7JFynogfPOmJuWCUN46WjUv9Gfz5Y5UnL0BsclgjLCyLuJUpzazjbVkpkWV4Z4TqP5edQQi4Q05T+oOhz7wOXm3tabVMwb++rumwHuaPovjNAZQqKicuDksA1wH8eN54/4UB2U00zi+Fh790qLd5bZvy/p5mWX2mwL46IS16kH55Iuq0neJmuUnwI6yfuyvygGowmmOh12mfJtB1Z7EPDrHgmw8rIuSV8mZW3qgh4iBoZWGq7JVSkvmg1oO5Hk/xV+fFHfPh+mN8BlhtaLkTcLQzH4T1WbaXd9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auUKjN+IrrbrI5U8lCw1nPHvghBvcCMjaxdmPP0hROo=;
 b=be8VPMfR/FT2pLxSdg92cxjrW7AyPn3urrUf6i81IP+U8kNkgmpAqp3T2hOv46zTN925TZwjniBkO01CjmNdQdJlC6KDcMY4HMIsAFYxfkGNnm19gpaRgSIw3HZalxYPoSNPs1TlA5JviKByTxk1jY4rky2EIvVKI0ei30aTU4eb2XXzxxEoeI/62KPDy1ZWEB6IBVHoNMnCXQ5i6HcescWMqaevH1ewQG1FMI3a+JLYUNYE9a6vuo5r8qR8FyFRTLQv/XlSu6mLSrkw4HlxMqaoY5SB9+73ffcvptIWBbIXB5iON7KDu0carwIVfzdJdsweck6NBVVGGK7DO4U53Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 18:43:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 18:43:23 +0000
Date: Thu, 30 Oct 2025 13:43:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <qcs3fp5unhjdbqwlayweo4c42igytx3n5xro7tbs7kkso2lnzz@zcelrecmbsfe>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
 <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
 <aQOIdza-zd3ES9xw@intel.com> <aQONFr2dRVU93R3T@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQONFr2dRVU93R3T@black.igk.intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf5be98-fc25-44cd-29ae-08de17e43489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKVosNtZCMg/NGwS2cHhrcI1YzvwMEUxmLSiXOGECr0mRAswkEKeDJydAPWW?=
 =?us-ascii?Q?uTiwQ7UnwfSYw4gYxLTUItH9CcdDIwBKyikMxG2DggRSME25sLnyMvZXyiuA?=
 =?us-ascii?Q?oqiXYwlEHt9bCPKtmMnq7d854cAT09MurXnEp4O9BP1gselBkXbPlIa2I5WX?=
 =?us-ascii?Q?PIn0Bvhjfuh72/k0RrmRGwFefY9TyT+Xl0YoIWbShFfn3wb4BtJEeGUG9hQ0?=
 =?us-ascii?Q?qUt1zIlC/xC6A6DRHDAl2EXM2c6lZjhWW9gj+2/TuVtWqviapwgJRHoaUzLv?=
 =?us-ascii?Q?eykUJL+r61xk9m9s2c2ofzWXqO8otvS3uGHoBKdEZSvZsIRvBLlA6WMTcPRd?=
 =?us-ascii?Q?iEZm4+86Dm3cyDt7dqFZvVVCjFIsgNnZTO2W4UX6frnaxK25iwLugktDHHpa?=
 =?us-ascii?Q?Pi9mFrGxtqxBn2UBJW3uUqT62D+DeFiMuAp9tVYxX8ybOd1EEPPoQrn9KzDO?=
 =?us-ascii?Q?lswx5KRuLCDLf/1hwEDRvHWSXCaIE1+nWZr8neeDYoa+Yt8SfaKL3L2IOUx8?=
 =?us-ascii?Q?dhdJZ1H4M7s0LmyBtY3JxbIOwpNo6RsGajxKx/xRtzLIMTyEhnMulrUqFnky?=
 =?us-ascii?Q?v6+C6CQp2Qufd1ZavAe5XOHNoIHlpevtstHwYNvPQBrMZ7DlYwSup80N/qC9?=
 =?us-ascii?Q?I0A9c8SCWlhUk8ynhcDR35aF/NdmQoZwyn1Bd98He+gs0gp+u5kW3yae1o0n?=
 =?us-ascii?Q?U7u5qi3HA5Vg8swQJwwHXp3UL6LIjOVRFdDupjb6Ubo3mZox2p21TrAhfq92?=
 =?us-ascii?Q?0iz3UhbLUpSpYXuRUKoc1f+W/Ao7zqayT5tubnnutfMaIW8G2QURQxAKUXXy?=
 =?us-ascii?Q?nJNr6UCEvlBT4hLP9wKkrS8O8xoNSik89qVwWpqWl96fG8bxbLEFsZG1XVZ9?=
 =?us-ascii?Q?tA18P95aqmCE2X8BKPjWm0lI4AMxL12t/HpNgdt3MoTOQn/altIAyd2p90nZ?=
 =?us-ascii?Q?E4LvEqPK6PQzERmV/DjwRoUZb41ShfDY/vzhKayHaYmoFVIdnFcpqDV+84+7?=
 =?us-ascii?Q?0hkewbPSG4arqMCLaQ4vZgGytl+0PCZhj3qF7NwcBitFWzJC6CrEHHCYCOgp?=
 =?us-ascii?Q?tS54gUCuXDB7vCQ7mpCFq70P6ATEepuolx9mCl0VJkPFgGss3agBTypNsNH7?=
 =?us-ascii?Q?wLOU+qPfNi1xqOFuDx9cdnYxGeAzNhkRHyh/aPScMDZWsb9FZg26gQcnpqE8?=
 =?us-ascii?Q?aDBWxJORKoNHydoOsVBEodK+2xXLJ+n47BGx/Z9kdTwjxHtvmZbfSN6/aqRM?=
 =?us-ascii?Q?SZCZq0M4u2NNzAWRIbDm3OdfpKNF/gpRtmBgDiPLiQ1rW9xYAo9AZX0pRr5g?=
 =?us-ascii?Q?ywZgBlrzC2CV5UZFDAEErzHvnLqE72pGAuzy9ASqftxDJW0FHB/H/a1SfYqu?=
 =?us-ascii?Q?iI2PUFUDsK39LSbCeemHhdSaWaDSQL9/FejGa/y5PDiqWRvu5sfovMLKlIwF?=
 =?us-ascii?Q?gR4iW3CXmhrI9AmXEB09jl5ZF1KrsjTnboMT3SU99NKxDcCgZBoYuFILEsvX?=
 =?us-ascii?Q?+tHBtf3NUqiyFHediFR7V27lLFHTRepyqKvw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPR/bwNw4AHRGsIDn/T4hm1kXFlu/aH3NBAJQofss1dKaA5o9aINiJTPyiWA?=
 =?us-ascii?Q?tl4ggqlTPTKXAP0cVdtw1L1M6blknf4LmF58+4fBO5z3l6b/sYSTU08rHuwu?=
 =?us-ascii?Q?5xsqsg2JFgj9k7hLeZrOFCkjAUJFhoflgLKGkGnYfuj5uStM4vXyYPsWKFDz?=
 =?us-ascii?Q?BA1iLqtx2wAAb5ZTiaM4/j7ctH5kZaT6v3TydWFRGPFQF8AwUsp2a+VA2mQg?=
 =?us-ascii?Q?QK8Izq1r/qok3tFGF6acbWj1BJ10nAlZROiulKPPG1iE/9wImSbW0nSK/2s0?=
 =?us-ascii?Q?dWBYrCbA/UvF2tONxnHBaVKYK6ay/YqJbZqj4koGXNzYJme3se7dXmG6Ijbx?=
 =?us-ascii?Q?QwZzYd/ADvBtd4hwGIUFkUgVGS36SiAIBAZbZMBt8qiOEXsitzqWS1J0Jkgb?=
 =?us-ascii?Q?+MmNYsnxnx+cZ7N2RYz5pI1zy1/YCltf/ZyCpC0zbC5hiKUs10y+suYk7IDT?=
 =?us-ascii?Q?BWqUIMcXf7GwOxqNzGIkZbX4x9Du2RZKxBD3CmtI7D3PCZnQcRWgEjWR659e?=
 =?us-ascii?Q?ko/PCBH/lShd8XL24dI9eeku/lTl5yZN9ImJMrjkmvBg5te9Xcn+X4y+V4ac?=
 =?us-ascii?Q?ar/USO9+1HpoKX5+Ok5CBswXWUecriEv+Jj85O9KngZlJeTbw/9kz3Ba52gC?=
 =?us-ascii?Q?fe2YoBMz9S6O7cHjOjn3pQ0egHkhQXRJ2cbpzAbr+k6tTlTayo/vlkHJ79qe?=
 =?us-ascii?Q?1vgVRTjMqKage8e+XNLtUPmWVP2EKrXOVsrSvHxrE7y7IHhJM2X4hEEkHUOV?=
 =?us-ascii?Q?hPazIdiWTfBSxtM7DEYCZkDPasqM9/p1eZZMDqLJYj4+Vr3/HDQiAoj1krKT?=
 =?us-ascii?Q?mLysmd+9Q/4OFTuvt+4wgImLTJsadYrqWwpOmGH1U3g5s0DS/iugcHnZlDoX?=
 =?us-ascii?Q?64Cw2obZPy93CbB5Bkw1I/k34k4DQpNJIp4JKncfogSZpmTEAPhNOVP9yL81?=
 =?us-ascii?Q?FfOKjtd1L+rFavYO7RKbKBGrXfN3vnqFAHgzzQjnIMffBVWxCtKb/7AKDZzu?=
 =?us-ascii?Q?nYaFHmmnXXkxK2YLGSdxn1x3YBSfeHGXNfwTuahNYf4lzKEUCK9CCCcR6k1N?=
 =?us-ascii?Q?j8v0ZwOCZXByu2ytHRBcTByWjHdxTwsIfK48c9Z1g+LkarSe/aaB814jv7Yu?=
 =?us-ascii?Q?cDUVg2UxPcOcdyjU6oWtGDfK7cawNtVlqJMcpDNXzhaF31tt9I/mex7lrxOF?=
 =?us-ascii?Q?PI62w+L5Xl6QDfHDT1qwc2S7Ca1P5bzSpOVNNcavkoZNzhKmas3YPR42xTXi?=
 =?us-ascii?Q?4ekh0ONbN4iO1Ami1yDDvG8lTtk8NvUEhvpOFfLsUmCyoOnKE4wpIowV4J31?=
 =?us-ascii?Q?52HRqZb3XZZFlj01oxLOw5/kzCpaohSQlFyacmY0SDwJr2Sh2lkVm7XDQ3Tk?=
 =?us-ascii?Q?QBCDnGKiS/PZGzjW0AspjNBxZV/LsEXOW2TGdC/5J9an6WjxipOgRWcCBNG9?=
 =?us-ascii?Q?HdVUgnXH+gknj/oX7Wwuk++/csB/XtV6wjxrOhIhHsrJellh4wzbNMcaRP7u?=
 =?us-ascii?Q?7DMVb6t5WlAhbNE2uSbHj7BWH8jN+zJMO+gZtrKIoVQDSY+175nbUQlzeIT5?=
 =?us-ascii?Q?UguL5NC6zHA4LRaRbh4xEvkaChpOYiqzM4wKFVGmnZjqVERNyfuOcct6LDT/?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf5be98-fc25-44cd-29ae-08de17e43489
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:43:23.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugd0mLl01FOCRR7dFv0bhn5l9Xju11W899iYO48PHTeY2nVQZyPm6tCiCvF9hfVIL7s0pmRDHOZdb+/5OWihp1g8Sf6/RuGlN+hhEAE7ctU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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

On Thu, Oct 30, 2025 at 05:06:46PM +0100, Raag Jadav wrote:
>On Thu, Oct 30, 2025 at 11:47:03AM -0400, Rodrigo Vivi wrote:
>> On Thu, Oct 30, 2025 at 09:55:30AM -0500, Lucas De Marchi wrote:
>> > On Thu, Oct 30, 2025 at 10:53:36AM +0100, Raag Jadav wrote:
>> > > On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
>> > > > It's currently not possible to safely monitor if there's throttling
>> > > > happening and what are the reasons. The approach of reading the status
>> > > > and then reading the reasons is not reliable as by the time sysadmin
>> > > > reads the reason, the throttling could not be happening anymore.
>> > > >
>> > > > Previous tentative to fix that[1] was breaking the ABI and potentially
>> > > > sysadmin's scripts. This takes a different approach of adding and
>> > > > documenting the additional attribute. It's still valuable, though
>> > > > redundant, to provide the simpler 0/1 interface.
>> > > >
>> > > > In order to avoid userspace knowledge on the bitmask meaning and to be
>> > > > able to maintain the kernel side in sync with possible changes in
>> > > > future, just walk the attribute group and check what are the masks that
>> > > > match the value read.
>> > > >
>> > > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
>> > >
>> > > ...
>> > >
>> > > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
>> > > > +
>> > > > +static ssize_t status_reasons_show(struct kobject *kobj,
>
>Semantically there's much of a 'status' here, so this could simply be
>'reasons' (and same for the attribute name).
>
>> > > > +				   struct kobj_attribute *attr, char *buff)
>> > > > +{
>> > > > +	struct xe_gt *gt = throttle_to_gt(kobj);
>> > > > +	struct xe_device *xe = gt_to_xe(gt);
>> > > > +	const struct attribute_group *group;
>> > > > +	struct attribute **pother;
>> > > > +	ssize_t ret = 0;
>> > > > +	u32 reasons;
>> > > > +
>> > > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
>> > > > +	group = get_platform_throttle_group(xe);
>> > > > +
>> > > > +	for (pother = group->attrs; *pother; pother++) {
>> > > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
>> > > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>> > > > +
>> > > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
>> > > > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
>> > >
>> > > Much better.
>> > >
>> > > > +	}
>> > > > +
>> > > > +	/* Drop extra space from last iteration above */
>> > > > +	if (ret)
>> > > > +		ret--;
>> > > > +
>> > > > +	ret += sysfs_emit_at(buff, ret, "\n");
>> > >
>> > > I went through the documentation again and I couldn't find any rules
>> > > related to empty files or whether it is allowed (just thinking out
>> > > loud about no throttling cases).
>> >
>> > do you mean if "empty" files are allowed in sysfs? I don't think there's
>> > any problem with that. It's also not empty, it has a newline there ;)
>>
>> alternatively we could print the entire reg in hex format?
>> But I prefer the text line in this patch.
>>
>> Nothing against the 'empty' file with or without the new-line,
>> but perhaps we could consider to track that in the loop
>> and if none is add we print
>>
>> if (ret)
>> 	ret--;
>> else
>> 	sysfs_emit_at(buff, ret, "none");
>>
>> and document that above...
>
>+1.

collecting all the review commends from you 2, that would be with this
diff squashed:

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index ca45aea8c17a6..f3476fda7f4f6 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -22,15 +22,15 @@
   * Their availability depend on the platform and some may not be visible if that
   * reason is not available.
   *
- * The ``status_reasons`` attribute can be used by sysadmin monitoring all
- * possible reasons for throttling and reporting them. It's preferred over
- * monitoring ``status`` and then reading the reason both for simplicity and to
- * avoid TOCTOU (time-of-check to time-of-use).
+ * The ``reasons`` attribute can be used by sysadmin to monitor all possible
+ * reasons for throttling and report them. It's preferred over monitoring
+ * ``status`` and then reading the reason from individual attributes since that
+ * is racy. If there's no throttling happening, "none" is returned.
   *
   * The following attributes are available on Crescent Island platform:
   *
   * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
- * - ``status_reasons``: All reasons causing throttling separated by newline.
+ * - ``reasons``: All reasons causing throttling separated by space
   * - ``reason_pl1``: package PL1
   * - ``reason_pl2``: package PL2
   * - ``reason_pl4``: package PL4
@@ -50,7 +50,7 @@
   * Other platforms support the following reasons:
   *
   * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
- * - ``status_reasons``: All reasons causing throttling separated by newline.
+ * - ``reasons``: All reasons causing throttling separated by space
   * - ``reason_pl1``: package PL1
   * - ``reason_pl2``: package PL2
   * - ``reason_pl4``: package PL4, Iccmax etc.
@@ -120,8 +120,8 @@ static ssize_t reason_show(struct kobject *kobj,
  
  static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
  
-static ssize_t status_reasons_show(struct kobject *kobj,
-				   struct kobj_attribute *attr, char *buff)
+static ssize_t reasons_show(struct kobject *kobj,
+			    struct kobj_attribute *attr, char *buff)
  {
  	struct xe_gt *gt = throttle_to_gt(kobj);
  	struct xe_device *xe = gt_to_xe(gt);
@@ -141,9 +141,11 @@ static ssize_t status_reasons_show(struct kobject *kobj,
  			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
  	}
  
-	/* Drop extra space from last iteration above */
  	if (ret)
+		/* Drop extra space from last iteration above */
  		ret--;
+	else
+		ret += sysfs_emit_at(buff, ret, "none");
  
  	ret += sysfs_emit_at(buff, ret, "\n");
  
@@ -162,7 +164,7 @@ static ssize_t status_reasons_show(struct kobject *kobj,
  		.mask = _mask,					\
  	}
  
-static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
+static THROTTLE_ATTR_RO_FUNC(reasons, 0, reasons_show);
  static THROTTLE_ATTR_RO(status, U32_MAX);
  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
@@ -174,7 +176,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
  
  static struct attribute *throttle_attrs[] = {
-	&attr_status_reasons.attr.attr,
+	&attr_reasons.attr.attr,
  	&attr_status.attr.attr,
  	&attr_reason_pl1.attr.attr,
  	&attr_reason_pl2.attr.attr,
@@ -200,7 +202,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
  
  static struct attribute *cri_throttle_attrs[] = {
  	/* Common */
-	&attr_status_reasons.attr.attr,
+	&attr_reasons.attr.attr,
  	&attr_status.attr.attr,
  	&attr_reason_pl1.attr.attr,
  	&attr_reason_pl2.attr.attr,

Lucas De Marchi

>
>PS: A good read[1] if anyone's interested.
>
>[1] https://lwn.net/Articles/378884/
>
>Raag
