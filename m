Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56676D6C2B4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 22:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD2610E371;
	Tue, 19 Nov 2024 22:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCVCnRNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72F10E37A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732053797; x=1763589797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m4lVrYIg9e1SpQHuw7yT5QQMnCmkHcE8Oos5wlGUN7o=;
 b=oCVCnRNh/4rGb8NiFy8JGhz7XRjSABAkFrvtVQ7//Uh3SrN/gCJO9I8x
 WLNNw4Y4z43voYeIqmgOcMddiS12hq0n3aNP1Ru9biVfTeoRp5ytfNVca
 X4ILTHDsfs8YymnhTMj2y62WBZODQl70aAw9Mty6ByaP442jVgj8opoYO
 MJ59Ffj07BxPV+/P5A7sV54veJw8sd7BdjyfaC+AMtzjdAcLnna1m5LCW
 rbdmFDN4M8KMd2QbqFJ0YcMmCi9M//P9FbU1bmXOwxP0m1r0GTrrZkNf8
 BXubeTEErgpf96mR8cHWfF6kEzzMN7/uC5qDZ3rrPwAPzv1hi5FK35vlp w==;
X-CSE-ConnectionGUID: KwXNT5DwTvGsUrA1etKdJw==
X-CSE-MsgGUID: OdxVW15ASQa4N0XYAdw0CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43152669"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43152669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 14:03:16 -0800
X-CSE-ConnectionGUID: yRiyoxRBQkKvvQ2RG9OviQ==
X-CSE-MsgGUID: R7DgQ3SGRGaFeb9GzqNlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120649646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 14:03:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 14:03:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 14:03:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 14:03:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmF4PUnyK8hQ/3ogYJ2rp02xShtMm20irwMZ9+KPWZj0q4hv45ec+7a1CJeX/7Q9PKBsGSN9Bf9vuGiF9RhUtWXf3JuCgFXHSRf2cNe0ePAZDHvTitOKvNmpNW4RVC/sBqasEudJ4LsvGn+Exn6xeySDzS9yCxFNNmlsNcvhMlffNTuP4NVMBIlOGqURRDgEjzAbtAOak+G/C3CuKOo5NiuwREMCgwjaDIU3/aOKiliR4JPvcc6ilstUmUr98xnQyYaUm+u+5qnMUmDH1yo6Pc4u7prPSfo+b6Yn18nBX594rfleuKXeX2nmSNl2flgouhLH0lvaLe+NJ3+O7uvrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KN016gt1aAc4UMZ71XHlfRla+igCSXG+infQYyKVRs=;
 b=CITeq2TajYYFtkucalnmG7k9ytv6M6NQBV7ywRiqPeNrC9P9OASZv9CWuVJogY5Q7VIB3XdT+fYd4OFy5QkG7TYXD15tWLKuYrwdlxAFiUjnJ9gkjLv2HTgqc9pSAmAzDEKScDLG0uZSGAyrHrfW1Cv1lm0CzepmykM4I/vUkd6xkFagrdr2kOLzhdhh/tUVTGRe+SbxOvh2PkVHa2y8GFui00lvXgCxj/lCZTvLmRmJRHb9SFZketwMRLVOYKA6Cg92F2T3PzEW7ohAEMYaKAY3OkWSYWCFplcechT0PX/LwkLvFND9AAsG5aTVQ0qFxMWKPzb0TpiMbe30kip3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM6PR11MB4610.namprd11.prod.outlook.com (2603:10b6:5:2ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 22:03:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 22:02:59 +0000
Date: Tue, 19 Nov 2024 14:03:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <Zz0LNv3K3fEm/o8R@lstrano-desk.jf.intel.com>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
 <ZzfCwCZr0byTqGj1@intel.com>
 <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
 <Zzzd7FO-z9Q66Ugi@intel.com>
 <o2qvrowghi5shepavwjzb6utpioyj2neqfbr45eny54fqrga3m@trovhcv4hoof>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <o2qvrowghi5shepavwjzb6utpioyj2neqfbr45eny54fqrga3m@trovhcv4hoof>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM6PR11MB4610:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a303e8a-2ad8-4e5e-eda1-08dd08e5ee40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U4x95cQ6agQWU24rdxhdCIFD7OXzd5XINVJJA8EK9DPQe3sey9edZQwZ8lQ7?=
 =?us-ascii?Q?X2cQpXW9il7bNvgTBdx/CB9rdxAUfvOaJXiqCqrYC5ffbjYHASfaVql5qHJl?=
 =?us-ascii?Q?nq2hQKSGFpgsLNsB1i6uryJZXdh37YqGClPaEudYiMQojK2nLf5UQvYTuMzs?=
 =?us-ascii?Q?wEMgvP99EpzF7Uv3CHHOYkfKzbpjaqGDGkeNBx+j0NPgFL+Luw07D+TF7OHJ?=
 =?us-ascii?Q?KKX9grqFB+xrj16y+7leLrL4VZx5IyczkkHE2TWVDd445zs5IE5RLARMsupG?=
 =?us-ascii?Q?jxoyaRY0cI84cLVmL2XSbuh9rkCgbWtc17a/ykoUyoYo2QNtZp0wUCEYUu0F?=
 =?us-ascii?Q?2q6HC9Ton4TR17OytA/9Lc9jLK4oK17xi++/IaD0p/44yHQ7eIdDEO7JcJ8Q?=
 =?us-ascii?Q?HvrwCvT2aLIXt5Zv3mEFwUmQTIShTo8qBNRqPfdMPFpdvYFmFibF3jWQ/NpX?=
 =?us-ascii?Q?u/gRqJN1vPeetdEwrcXhdwJoFYLZyTGwp45PT1ulFNE7gZPdQdAw7MsxaCx0?=
 =?us-ascii?Q?po22kNKNreM7XeZEfSw3z7n6V7nPzOmKPBcaeEtYBm7REVUbADb2xIjQFYsP?=
 =?us-ascii?Q?1zdkBC/O0igXSQ0H+gglj+ECPrj37belJyFN0AGJM1Otg7d93TN03Us9OpLA?=
 =?us-ascii?Q?cDc6RGEafJkTPDpeB1FkG0id2WX+mB3LsCVwbQYHt9sAcbB2COuhAZT6yysY?=
 =?us-ascii?Q?EXffsvSrl/AJrREMUFZtKYeXMVs0M1ybIzI/hL4T6gEcI0sIL+t558XhINss?=
 =?us-ascii?Q?t9btsU3y5P6xZRzud5WOEmCvh+MHqpgiLn+0XnPvcX8QcSk/rJh0WansDU24?=
 =?us-ascii?Q?lF76c1hqDv532icbpsziAvYj1RLoF3j1q55OUzjc+BV857Tv6o6g1Q9UfNGO?=
 =?us-ascii?Q?I+76a9E9ykpLrJvFgijsYxoPg41KmqFWAIN97nYIPqOvpUyNR3GylFAjdkYf?=
 =?us-ascii?Q?dGU9z8E/NmyColEcvMebC8ZKCkVVTrftXCHJxglyZjHI/zmR/l5z3+DPxiHw?=
 =?us-ascii?Q?y8vO6GHHD/deszwpwA7xuQyLToooTJGf2I+MjJA/5u7R7WJse2BJA9gHW0vp?=
 =?us-ascii?Q?WQ08INMoUbuH0HFWq6F1sBaqjpD9+kq215bYaRxjzFijRbvUx+6HUk9jI46V?=
 =?us-ascii?Q?f2YD9ctbSbNGdwNvlxfRvro8FbjwFB7EQhEIv33TnbATMgffRthq39MHj6jV?=
 =?us-ascii?Q?rGmUOAEb2x8WuDZxko9zukxpMk98EnDa6sD1p6xmFuykEVHRSGZR8yPGT4Jw?=
 =?us-ascii?Q?R0jdbE2mEbIDjnBhrnpA/Zs0yKLJNIbdLAnEE3Ye1yn99CjdbAodMcDtgdij?=
 =?us-ascii?Q?9pu0UUPYIqDMXq9VvXNWsshj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VyOpskELtdRHXYpsrkA+PzqYe6OZwq5x/tOJ09FBzHzPuGle4C8ucFV9+Soe?=
 =?us-ascii?Q?Cj9gOduZ5Vj+xNG44PjFjRZehi/f1G0LydkmeqGBDMpBI1QXmXlIaJP+8lCx?=
 =?us-ascii?Q?PpChY/Xbx4XgCuFf/c/4sAaKbNxUBInpE4LQ6V9dOhUkKe2XATNTcVCY+5gQ?=
 =?us-ascii?Q?Lju85SY2Y/PTWp8PG4S0glRayX4p8ghOt4j69yg2zGnj4HDkYEzjYi5Fv7Hp?=
 =?us-ascii?Q?SHgk8kdE4L5MTZdingjR2ocCk3qu9LgkHS0jDfY1NwkaACC+34odzisgEu7N?=
 =?us-ascii?Q?Mjc1z6erWEn5FEZI2JwPPhhn3h6rhfIjBbd8V0HFZagSd/ooyQzoIj9sds/V?=
 =?us-ascii?Q?44pqPSZ8ncsiRNbf6OmvbZ9XbMYHsVHEFq6raKs/s0kSPGjuLOM/CGX8uTPh?=
 =?us-ascii?Q?zhyK4U+nKUWa57zlpdkdf5SqmQX78hewHtyjq+zir4DfQ4FtuUDubUr9/wZy?=
 =?us-ascii?Q?JVyN0mTynmNQpi6lWbZIABDWzg5SEqHL3hQeZo+uVGOB9207PKMhMw3FtouD?=
 =?us-ascii?Q?KonfQqUTzq26+b76mEoszlIlRnVdyqAGga50qGNQ64InKG1zka057XatV60i?=
 =?us-ascii?Q?WyylZvEZNWEUbC4miklk5m9oenXusC/YCPitYUNiI+DW53SJ8am3XwwRaYxG?=
 =?us-ascii?Q?f55km9FZRTXfgsM8oEggFZ5KfGmX8u747BzRHKx93eTwfNuR1d2PxLy3inIu?=
 =?us-ascii?Q?1Ur+Kz2kt/YbYjtSysrgKJS0p5JV431maTKSd664b8K8feh2B7Qihh0zA7q2?=
 =?us-ascii?Q?fozKd96uCxjSOe1gDU60ZmkxndohFtI1aDahMAy7hMdmW3tqaXwC8p6kOVmn?=
 =?us-ascii?Q?OfgWnZDk0Z5pRmm5gu4KA68cW7Dt/HTxEJdhSLUM1rXmduhYlUxgqdrU07ve?=
 =?us-ascii?Q?98B6t/ERTPU6Cy5IhMv6Y5gKC43fmCccPC78uxyOqRZCqfay/5uJEVRmpKuB?=
 =?us-ascii?Q?YQRTw+GVWeyIzLjs4lilmx0phuqiJh8e7tiE4t/27seW3YaGpMTTu7soTBGi?=
 =?us-ascii?Q?e5ZIr6kFECfk2pb6JCLDB9Qf6xi9/sAbA1/xZYww2GwRPtr19gLrS8Ji9a3L?=
 =?us-ascii?Q?HCUuppmjxLplYZ4eF9QMm4OPUb/p3ztg4yTkxGirMzgjfD0CH+ebUeF12kno?=
 =?us-ascii?Q?eIBtfobYHnuxxHjPbe+EizjIiFIWwJQGQX7BVJzbWxrBp+5ViGax51y02tBe?=
 =?us-ascii?Q?EWLqbrkKUq6opxIaKErylBFhTaJotnYPbbdHr9k9swb53s1Msw/geTo9FM6L?=
 =?us-ascii?Q?drNmN7UW5t9djaV/7VMqaBTn0y5mcC80XPNUD5oncVMXUz43qN7ZkI1rATWq?=
 =?us-ascii?Q?gMtYF8IbR1X91D4q7vNjdxF/0Pqmyk1kyWw9D8yZ+wUA9MvRM0TyZpu4q/on?=
 =?us-ascii?Q?F96jqBw2HJCs3hJ+jpGFBc7FA911YIQcQqG8XT6WcELob1iRhgyeqkXLaINs?=
 =?us-ascii?Q?pyiL44GLyzk7xECqr5cjPwCTCcTu0B3gUQOC7ULJ9jGBM+dE7kCQltktrkj9?=
 =?us-ascii?Q?LdaC6ppM2LQfZvse6RPNolY1TPU4YAPMstbv9qJgi2F7KekV6v/l+8ICnYqP?=
 =?us-ascii?Q?ZCTdg6hh0bb6wKSJRrWQ0JlloHwfbXpP710ZMDsU64uaVpU4lzEx804dkhA8?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a303e8a-2ad8-4e5e-eda1-08dd08e5ee40
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 22:02:59.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G4a1HyWqitUNWYLBMTaY74MTADFOKsESuq/h4f956gtAvvAMimlT9qp0mSuDbewntk8Bc5KQAKZXe3uY7vEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4610
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

On Tue, Nov 19, 2024 at 03:01:48PM -0600, Lucas De Marchi wrote:
> On Tue, Nov 19, 2024 at 01:50:20PM -0500, Rodrigo Vivi wrote:
> > On Fri, Nov 15, 2024 at 03:24:27PM -0800, Matthew Brost wrote:
> > > On Fri, Nov 15, 2024 at 04:53:04PM -0500, Rodrigo Vivi wrote:
> > > > On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
> > > > > This message just spams dmesg providing little benefit. Remove it.
> > > >
> > > > I don't believe it is useless, but I also hate the spammers...
> > > >
> > > > perhaps we could bring the status of it in some debugfs form
> > > > as a replacement?
> > > >
> > > 
> > > ftrace could an option so if you really care about this enable it there?
> > 
> > hmmm it looks like a good idea... but no strong preference from my side...
> 
> as long as we are talking about adding a tracepoint rather than a plain
> trace_printk() unconditionally.
> 

Yes, trace point rather than trace_printk as that would just spam the
trace buffer.

> with dynamic debug we could use a verbose level that is only enabled per
> file when needed. Then we can keep messages like this rather than
> misusing the trace buffer.
> 

'with dynamic debug' - Can you explain what you mean here?

Matt

> Lucas De Marchi
