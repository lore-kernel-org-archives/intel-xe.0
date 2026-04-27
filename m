Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56824FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211F10E0CA;
	Mon, 27 Apr 2026 19:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ3NgVzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A1410E0CA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777317579; x=1808853579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NMXfUzd2pcNqTZhOTwDal/ulGjaAawes2xHsN1NGVhI=;
 b=LQ3NgVzpzdtWwVwRNvrekacqpqxJ3uLM4SiK7E1Eq/cPEth8lBatXasV
 pOdm/fs2Inxq0qSTHYROsKYw5NrnocefZ2gGHsIqMaoQjU6egvkYCEfEj
 mxIEu6lkjDDN7Czs3YSjH6xXwcNAvmnXB6RhmbtXdH5oYC3h5piE8t101
 XdJTNf/+/Xwcn4cLf9HuZa3s1kGNyyxveaRSNxIR7vZEG0OTexrPtnYsq
 zHeRWS3sQxpoOPCuD1wH8QxuLiGyIbQUXfPkG8HBbDo3/YIPROBSkV65x
 1tmoq2CvZHF+XIS1L99dQAHsnlQdbEi9ClkLzoFL9iKhKrSCAxglwN0sq g==;
X-CSE-ConnectionGUID: pA7smT8cQ0ONHiBNv4YJ0A==
X-CSE-MsgGUID: v5ydPGfHQ7Sup6hrHWSnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78109988"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78109988"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:19:39 -0700
X-CSE-ConnectionGUID: KbMoOrVkS4m+0fTMkK/IDw==
X-CSE-MsgGUID: 6L2/l1zCTsOorF+IC6Wd3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232726665"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:19:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:19:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 12:19:38 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:19:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5hNazQuMxv/tdbjIJy6W4Q2VI/FvA+GfjTb3GNDn0c//CLOdSwV9Y9wTEVmdVKGt7fjSfOc0b+SHPlPYAcfKXDEc7Aq/CtRNPB2xN5AzbTkVp/zoXy9Q/bj71rg32Qd/XGHNV9zeeiTW49e0uWuu30yHV9h9LDBW4yKyEjShwPkdtOeLbq6m8mD1VSOZXZNlUGipin9SLYML5QAQzuxbukeYvGS3Cojjnv2Pxz6uToPt08rZ7YWuV/f8RULJOdVAn/6nJPwtY+Fma4TWRwfI5b1h2WvMlaCq9BPTvouMNN/7Bf11mmOxTKbKL3kbkbIiGeIW6dQn+mKmz/YrQL2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYPnN7mfIdbdtrWTdRlHYAiU5/LRHrxH8S/m6/r7z4w=;
 b=b1o+SWQIB67IsUI5KPIEiflodm7S4RXbuQDG/JQ3wZaS+/SXEHmFyNJlRnTHypqIaQvtC0NKUHwqcVt6Nhi5VFND0bwlZTkQK/ombO/zZS4iuIMd8P21cjdmabkT65NbOr8zmy8RvZlQfptJGvZjc4swYWNv8z3S3DqeCrkBma8vaoI7R1sFPRyzxw8/0VFcjGMEiQQQB9t0xHYT7iAWgLrurVN7xgAN//FO3SVQzrvh1aRmgERdJqVhKgxut6OksiMZbTmXxa5RrD7KAsebmvFl4ZG9JYJRtZF2O4ZMbNLkdvHZLg2732dF1MiJ5cRNZDiVSkesjomzh7Nfs9mzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH8PR11MB9459.namprd11.prod.outlook.com (2603:10b6:610:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 19:19:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 19:19:28 +0000
Date: Mon, 27 Apr 2026 12:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
Message-ID: <20260427191926.GN7476@mdroper-desk1.amr.corp.intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-8-59cc620a25f1@intel.com>
 <DM4PR11MB54564138FF5052CE5577471DEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54564138FF5052CE5577471DEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH8PR11MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 1966a206-8159-44c7-d718-08dea491e6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: B8z6bkaw/UQ1BHTy0bd/LhsFdllqTCelu1iRkCEjOmyuaWpdYdTES/tAl8lcHQb1rxaYPqsMLzL7cS5FFIBVjv5MmX9wFcLc7poorBNCoWKV/c35E1f/o4esyTISJCEj9SY97mIiem41RVmsWxyQ4j7OSK+K6rY1qPF/hlHU3g+mL7Y3toanYInzjcwRQQFl7Jxv+YyJjxDSNagJZ4Cmo34TpnRS2q1TWC1MaGw+jEf8q9KyxAjkhFNzoFfzWrHasJ1ms9Lfvb60oo0RqflER5ow2Chns7iUmUzDymOvMATXnvXiPQaiSVSGMYilSXW2EQTrf4keGmTn7GddqI0RgDVmz13cS2xw96TaAJlVYxkiH7MfHKkZxTJs5PE6YPu1mzUxLVb//znzk5LbVKwVwRomLb+OeFYYzxUpwSsbbaU1M6nv6hskv3TYnmK2u0IF33VP63G05SDIC8QllFeaXxwQwpsBjXst7GRPcOKfe8dB+CuuymwKE80UDdAfJ/I1ZK4z95RHCK60BI+gS2NGG1syQ6GEZ5t7v2XJst4Ifnkzfhc/ehqWveSJ/SPteu9m3exI6hQITJsVZ4uQU3lYVG8fzvUeIV/3fyg4EUwN+KjUA7KviJGvaJ2CnmpftDZ5AjfdOsp8vRcvWb8qw1peuQ9RZYLj9AWhEdDKXV0ITWbvQJmwSbVLqOrGxrNqAyGuHYBnhExt/9jswf1MSqLsZr9PLfpAEY9OUhQHFJv1V9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jZeigwui9eTGK+fY18mf41BovXyzLqURDUPqb4X4msovpMfEZPMMbEf/LiB?=
 =?us-ascii?Q?RI4o+JE2uex9HSibJ2SQwGpQlLm+9mok5eZa9NgluRGW6KFGuNKnZfUoN1JT?=
 =?us-ascii?Q?BqVrKW84j+yNEm7BGa/hwa+GnZO0SywPlGRCyLQ8KX70tmZST5QkpAZFEKqr?=
 =?us-ascii?Q?4GahiaIoVJyK1t1q/d0hf+rWR8kAtG8YW1N3oyBHe3ta1RUR7bvdlysBW/vM?=
 =?us-ascii?Q?+9nANu7eEDPAZUyc7s7gnl38TcVxgTHcVV+Q1S0T/Kp55OYa55rqa1o/bhG2?=
 =?us-ascii?Q?DMtyT9jDLo/SDjdOYGDXSKo+PumKzgOfArucwrB9fo+JImlk8FsPo6Cf+5Kz?=
 =?us-ascii?Q?rQlJDfgDv2vuLcv3G92/OUpqAZzULyY1k+JFePcV0h95IdayXPDSwuZFYQYO?=
 =?us-ascii?Q?4eZn3o4Va0bK12VRb1UeRZJFkUAjtOoqWstiggxhgNuap0tZ0E4xXaOzLC7X?=
 =?us-ascii?Q?Jth3iNxCczb38XYgaaPBoahIBBbGEL8iB1k3fzrggzDEUwU1OEsLCToRuZEm?=
 =?us-ascii?Q?hIHiPTd1f3hp/0FO8xa7gcQBTRd3i440V69ETJQy+5kCH0ngBoBsEcX4tWEw?=
 =?us-ascii?Q?NANGSJW410gf1YigCXEmuUPecWtbKCKHJYXuFYhVVyIrvCOATa+cKmQM7JW+?=
 =?us-ascii?Q?xoI8CXRNMmW7qLJ3/oXaPjFMAiy3qfa01FJqZuPscONTgO+P5QVcVJGsXUzm?=
 =?us-ascii?Q?ThHMz1XFpSIF20LfgApjFSFjRCOjmdpDHavVnyLMw5m0p/HU/ZFg3asDIBAp?=
 =?us-ascii?Q?FhiqhE3AIbIBfbTjHoZBiZAasPSgTT32HB+fDqW8hfwVgmb4TJnbOXsn/lkz?=
 =?us-ascii?Q?V5SNMPJdV2h8vWGXHXn54d8ixoIbvMtDKY5RNFsT+BtDv/OWjyMJ6rH0r41w?=
 =?us-ascii?Q?uZp1lbdwXtyZS9bLHmoA3jIKdi15ILnMqAJGK+sKItXGwTG8QXChvpCurRsC?=
 =?us-ascii?Q?+vvFogKsrt8l7R+x/AqiTA4DohRl0sPx52bZsNESNWnee4ttVKSqTs58kwN+?=
 =?us-ascii?Q?ftmzSkHPk+4kBLqyiEdyOPmUc4rOpvf63Q4/6CIIwe/EopbE4cs2pOvGfeFa?=
 =?us-ascii?Q?p4CDEEqGMN2G+bupWp+p1KI8pQdE4s//Tkw0r3LmoEB0JxDjixlJBMhV2vWk?=
 =?us-ascii?Q?j0g+0hl9tv5CyVZmxQIObbvaTaSUb5cpCl+xLxESGUDDXojWuH7mFAFMowgI?=
 =?us-ascii?Q?PtW38C0ewYKZziMYf4XI99eOOtbeOE3xEUrYLtjHAba/wmYS76n0yLu2z8ab?=
 =?us-ascii?Q?5no+OvZ05khumZJzcIxfO41VtB8LZnxV1ogRYNI5TvklP8HDTZCU2QIUcIhx?=
 =?us-ascii?Q?asdbb81uRBlRle709IjfWKe3k+sDAq+R1Ok9RDcRO/qV+uw6VX7Bc4g/xsmi?=
 =?us-ascii?Q?lVQrD+JPxntS5r9ze8FlKQ2mMnNnlS1Ptux3bVc6uREAzq+bDZ9cVTpZd1MA?=
 =?us-ascii?Q?/yKZ4bepCjsms29iJF8LB/2L2ffWLQI2O8CoHABcgrws3KfvhkFtbuAKbplU?=
 =?us-ascii?Q?jE867xcYtugYvKJnGEqFuCLL8YmyPKYjlroXM5uCIOb1yjLaVoCaAmJewWtg?=
 =?us-ascii?Q?kWLUcxEeUrgxbtJrxVh2tVcigirkIlIu4kmswKGgOqcAOJDQ3wys8SCsZWSG?=
 =?us-ascii?Q?dD42yeeggTV3+pwBs0mgV9eWghInk+QnRbznbx5wty+8ycI1oOq53ZEF7Lkz?=
 =?us-ascii?Q?GnZavB9Zp6iMfn8zM16pItXVq7RM83eLzc0SBwK+i6N2/1487GttTB0EIFLT?=
 =?us-ascii?Q?j034BfumHtIqMGxX8oq34cPsHjaOyL8=3D?=
X-Exchange-RoutingPolicyChecked: A2Y5ooItrIrHXqwxx2T5+YrvCdbugoT8ouRdgSEr77+f9kDTaUA8NodUsVlQPX8K7Sf1OyH9c8WUjodvV3M/d3zg30ldSgHEQZuBStP7y7kid7DwaY3mFevrwc0D0NphXWFSNZksZF7To/fKiu0HatpLUpVvfws/EDImKgSV7LE36PcOcZucHiQVfZrkJenrdjvNV3kCWYmbK+hlhgBp7K5mSoA3CxjqpVAs8kCccHpRlsb6/dxKETWosIJJ4EpMBv/5HGufh9016LCefFSdPZohopjfOiPVIWukeHnimc2dd+cVt3lQSHxCitvfUlSBcAhagJj/4NIfUc7dd/gnig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1966a206-8159-44c7-d718-08dea491e6f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 19:19:28.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0mTaHv5c4ZGpaoLEbprX+cTsvHuWHaQdjEtC3bG3RY/UacybEt34Xt1Ec6HY0ZO8GjF0ugKOL7EQWxLPXflptvIjcbCqoTct5SUHtmLekA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9459
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

On Mon, Apr 27, 2026 at 11:08:08AM -0700, Lin, Shuicheng wrote:
> On Fri, Apr 24, 2026 1:48 PM Matt Roper wrote:
> > The STOP_RING bit in MI_MODE is already clear by default out of hardware
> > reset and will only be '1' if the driver intentionally sets it after that.
> > Furthermore, MI_MODE is part of the CSFE context, so even if the hardware
> > bit did somehow get set, a fresh value with the bit clear would be re-loaded
> > from the LRC (which is initialized zeroed).
> 
> Just to confirm, it is a masked register, would it also be cleared?
> Thanks.

Usually masked registers are stored in the LRC as 0xFFFF???? so that the
exact value is loaded from memory->register on each context switch. But
based on your question I did just double check on hardware and this bit
seems to be a special case that doesn't get loaded on context switch
with the rest of the register.  I.e.,

   $ sudo cat /sys/kernel/debug/dri/0/gt0/default_lrc_rcs | grep 209c
   LRC[ 0x70]  =  - 0x209c = 0xfeff1000

   $ sudo cat /sys/kernel/debug/dri/0/gt0/default_lrc_ccs | grep 1a09c
   LRC[ 0x70]  =  - 0x1a09c = 0xfeff1000

Since the mask is 0xfeff rather than 0xffff, every bit *except* bit[8]
will get updated on context switch, but the setting for STOP_RING will
persist with its current value.  It's interesting that I don't find any
mention of this unusual behavior anywhere in the bspec...

I guess that means I should drop the sentence starting with
'Furthermore' from the commit message.  But functionally I think this
patch is still correct; even if context switch won't reset this bit,
clearing STOP_RING is only relevant if it somehow got set between the
hardware coming out of reset and the driver doing its initialization.
The KMD never sets it, and looking through the GuC firmware, it only
gets set during one specific workaround ICL-MTL workaround (and in that
case there's a paired unset when the workaround processing is finished).  


Matt

> 
> Shuicheng
> 
> > 
> > The logic of clearing this bit appears to originate from very early (pre-GuC, pre-
> > execlist) code in i915 where we needed to stop the ring before performing a
> > host-initiated engine reset; after the reset the STOP_RING bit needed to be
> > cleared to allow execution to resume.
> > 
> > None of that is relevant to Xe (or even modern i915) since STOP_RING isn't
> > necessary for execlist-based engine resets (and even if it were, Xe doesn't
> > initiate any engine resets; the GuC handles that now).
> > 
> > Bspec: 60356, 60184
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 -
> >  drivers/gpu/drm/xe/xe_hw_engine.c        |  3 ---
> >  drivers/gpu/drm/xe/xe_lrc.c              | 20 --------------------
> >  3 files changed, 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 4d5cd1b6f50d..c4c879a9e555 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -176,7 +176,6 @@
> >  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) +
> > 0x358 + 4)
> >  #define   RING_VALID_MASK			0x00000001
> >  #define   RING_VALID				0x00000001
> > -#define   STOP_RING				REG_BIT(8)
> > 
> >  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
> >  #define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) +
> > 0x3ac)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index b380d3cf6d3a..91e644067cc4 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -327,9 +327,6 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine
> > *hwe)  {
> >  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> >  				  xe_bo_ggtt_addr(hwe->hwsp));
> > -	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
> > -				  REG_MASKED_FIELD_DISABLE(STOP_RING));
> > -	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> >  }
> > 
> >  static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device
> > *xe, diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index c725cde4508d..9db914584347 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -682,25 +682,6 @@ static void set_memory_based_intr(u32 *regs,
> > struct xe_hw_engine *hwe)
> >  	}
> >  }
> > 
> > -static int lrc_ring_mi_mode(struct xe_hw_engine *hwe) -{
> > -	struct xe_device *xe = gt_to_xe(hwe->gt);
> > -
> > -	if (GRAPHICS_VERx100(xe) >= 1250)
> > -		return 0x70;
> > -	else
> > -		return 0x60;
> > -}
> > -
> > -static void reset_stop_ring(u32 *regs, struct xe_hw_engine *hwe) -{
> > -	int x;
> > -
> > -	x = lrc_ring_mi_mode(hwe);
> > -	regs[x + 1] &= ~STOP_RING;
> > -	regs[x + 1] |= STOP_RING << 16;
> > -}
> > -
> >  static inline bool xe_lrc_has_indirect_ring_state(struct xe_lrc *lrc)  {
> >  	return lrc->flags & XE_LRC_FLAG_INDIRECT_RING_STATE; @@ -980,7
> > +961,6 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
> >  	set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
> >  	set_context_control(regs, hwe);
> >  	set_memory_based_intr(regs, hwe);
> > -	reset_stop_ring(regs, hwe);
> >  	if (xe_gt_has_indirect_ring_state(gt)) {
> >  		regs = data + xe_gt_lrc_size(gt, hwe->class) -
> >  		       LRC_INDIRECT_RING_STATE_SIZE;
> > 
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
