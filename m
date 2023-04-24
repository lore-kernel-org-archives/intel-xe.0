Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8A7C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 20:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAFC10E613;
	Mon, 24 Apr 2023 20:29:24 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB910E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682368161; x=1713904161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JdRHM4T7G0qnfcuJkL/Ygx7hn4m3NHWKrlz3XLaPaLM=;
 b=FUymJyE748nDG4zxo4PUeSVYsRe4QieH0YevrvbSWWQxUfRnw+5IN0Lw
 RZsXfSQscyQoRnbdywin8URvV1ayD6lnUuQM6fjrALt+PhbOTsoHL55co
 gw2Ki/FZijybtgFRbru2X/reBQuUX3YIA8uNBZ1nH9YAmrCIg4ZoYSmL3
 6VtG7+JguP6eK3C61zd/HPFY/M/FNH8zjeKAxOSTQPLRW6XVuW0ce8E9H
 6mtBuss+fXtb+29S7347Jn+D3haea7/B67bSQ30GtgTaP0OxGyVT0dyjl
 1a+4O1cV809Z21BxbM8CgvoJfjKBiiW8Zyyfe2avdoTkdctShzvZEtu3g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330762024"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330762024"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="762578520"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="762578520"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2023 13:29:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:29:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 13:29:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 13:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXo5rpXsEDcCZIoAA9khOXcOrzjvVbeboVk4VbnPti0y7JvwDZ3ExmXcgs9P1MaswDE91OGMPES9F6dfZ5jKNRUb+aJLPEKa63YKSt1d1WNcKhNDAkJ9497mvI7vVYG8Iit96sKyoIXeyuO0eIcW1ybEg4YoPUkDFf7o6SUKfvl1JJZ2CXB+1h8Al+tugVUaEkLFosqEqGH2biiZ9bFDg0l2+yBewiABCp8cz7R0qOg/krgzgBj6SZ6Tkh2B5uXnZaoteUX1vWW+FjWmKd/Au/CMXKE+ZpQbsjfTQjlST19iIZImXGc927m/XksBB77DIjqgNWMdEhI7CI4O69CoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejbR2bqDvbEYtHjmROFCMuxZFcAG5isomkc+nZnCqV4=;
 b=N+uXb1bH6SHMExOrp/YvoflDJIIqS7A4rV8Y7/PF3tBU0Zs594F1/HMpFCVvnbd6pdIvIB3zVq4ujmAPnEm/lG+fliD2xAwkgLY0bvucnDVMaDv2UrAJa2zAlQI1BjSoVgxCR7pKjXSpLoMtJdgG8eqaE/t/jKJ7Mh2Juavx5R9lP+YHAcQWlmbwi95/jkxfPjIvzofxpW3ZHhWGcc4s6VJKyp3z5MNDWdKmjWSAdYmAK8QdazKhcOjGshpGkPuf0Fdf5ExKcOjM0/2lb2M6Ljqllm7VcOjLEghL7lmAiH3aPal3e4ALfSOuXSox8hkEpeCdGoF5SneV0Q+7X8YLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 20:29:16 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 20:29:15 +0000
Date: Mon, 24 Apr 2023 13:29:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424202912.GB10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcc8621-96d1-4b30-8d54-08db4502924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+G4ele/wecw+4jjUnOFL0rq8zIhfXF7+Sx/fAHSQknCRRYSDCIObBy6LBVWPik4ns6+Uu5L3dXLrwlHQa9OSxEN0T7TnzaN3HtbHoKfpnjy0ytD35EfuWbOlsimXYVGHLkmU+V0zNrV5213lJZdGOdbjWMIgnTO08WqQOVhiQ7JpeVliJX/nyP2mO75jtlDSr5cuovP/6v0KWK8Cq/MmRp29MyDh/AlwJFvOiyy30cgACF85008zv3lJdpw/P1Ai8aMXQNao+XDNW5NRiMXD5h5q5h0VXnx34rfhLwTSiBGtV9jytmlGh7brk8xCYhTxL5Wj1wcoRKwzEo08qpVxhmbYhE0uLaATdk/OdIK1zYX0ei5dCwTTSIFhrDxUrV60Yscq7xFvBRp7WgDykDtCy6pYqYkfkbFi3UNa+l2EgWUvbx2HiNdIHSigXDO3vfR/MiCcnSdO1ffFiimFc7s7dJu+W0PoAXQlvLVp2nPXqc59w5m3+Ahulw/cMRPK3y02QVlpoki83Kh8u7gokVfYiJE9ozbfqPwdJI3zw7w+d5Y5Du5D5UaAxtFKlUecO2Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(66556008)(66476007)(8676002)(54906003)(6636002)(6862004)(8936002)(478600001)(66946007)(38100700002)(86362001)(30864003)(2906002)(41300700001)(316002)(33656002)(4326008)(6666004)(5660300002)(66899021)(6486002)(26005)(6506007)(1076003)(6512007)(186003)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OO4XOD0Q41GIzlsqHwS97c3GfDqAQIdCK6VjJ0LAFVRZTr+MS/9NHGNT/uov?=
 =?us-ascii?Q?aEdoOWfnXKuR7NKnWwa+yqTfF6xk9QOEjrufa2RhSCSstLc56OZsxRYRKPdl?=
 =?us-ascii?Q?tXyBU8vKEeUj0qPRFcqVE2Smj4Iyv0uCH9ahFCDdyClETnnZUw9AKYwP65Ln?=
 =?us-ascii?Q?oQpA+/Ccjy7ihhU48Lce48XkMdoBrAZsn18URXk9F24thFoze3o5wQoy04hZ?=
 =?us-ascii?Q?Ze3RsQMkG+SociPpfY/wjan1lzZcsvP5MVqaal6lUZhXr+NI7RDsMWmSmHhb?=
 =?us-ascii?Q?P41FAljbgQtfYRa/Z4nNIbQk7Tv/q70FnddoXgY5tJdqLrBFvcOZU2REAe9w?=
 =?us-ascii?Q?t4LBABCUOfQ97GTDnkgE2Td1qcs9loz9HEWKqMsCra1cCB7hBvLpEr85XmNQ?=
 =?us-ascii?Q?SuJCc1yImTJawHYnn3mJ8xLEtoPA/KtxS5dYDPVdOOM8eZjMhv0Tw4fPgy47?=
 =?us-ascii?Q?aZcmyaGHbeRSi+6vIGnlM2N5qmhBLWn58Knnf6Qv6LeCNCt0pU08h9+UTXZp?=
 =?us-ascii?Q?taH4ntutSwnLLweeKXcGCH7GKQMX5AMQ7nvMeid/yneLPOrfaEXhy0U9qWHP?=
 =?us-ascii?Q?N/wsFjJPGTPyDwUgeeadKPcfGPYKVxQtLHT/FUIZg3pjRzvarZ2zHSk7E8WW?=
 =?us-ascii?Q?YehUyn/mYwe4AO99GPu68F2HL51VnotmJdBl2HF9ahZ98vjsPD94M6ILOJj+?=
 =?us-ascii?Q?FM/xVvxsN5OCtKCmTW7wKy4izKxIEcGAoBc2MhhO13hxGnnNsyf+27MOGMrg?=
 =?us-ascii?Q?yzigoz4F27YGGqHyiZ4t3rRmMDhP2KMnK31qjsdtBQ6aX1OGOW6p7pfvgFl0?=
 =?us-ascii?Q?1CRwd0XYN+dDe1E8Ve/8SisF4xuHxfFcmu/uEQqzxaMsskBg5Mx+9bviUx42?=
 =?us-ascii?Q?5X4w4EyYr0i84TvHomnsQGWq+ltU56cLhJ4eMGAr3llLp2xcRXt21mVQ759Y?=
 =?us-ascii?Q?gMG9BqFbCsp57NIyrsN4b/iQlM7cEqBz3QpOiiHWyphhC1sa6hzTj1Zf+euJ?=
 =?us-ascii?Q?DUIMuBDvmhZxiN7xqAJPlBbK2gaAWuaC8bmdAhq9mLA0T4eP7gxWXgXDthCj?=
 =?us-ascii?Q?+IQq2MZrkLrcPkl7AW3MIdtb5S5EY7bq3Q9M64qQLeVMFJbmRiNDLY4qQVJy?=
 =?us-ascii?Q?ms6WeMBQgSIzJobgqgWd+FVKI3dJ5PRJUKT5xtTbwdisKRll+mJ/GNh7sZ5V?=
 =?us-ascii?Q?8brWQk5UNEXkoVT9yFrSYGasUxbZzL61pLalswcXyvl1pl2vTE5omQ4pjNRI?=
 =?us-ascii?Q?doWjQnmMHkA+OpWz0cXbbAHm1dCU2pV8UADWj0oGM7D3xyQxPnhnDAou27+j?=
 =?us-ascii?Q?jR5+GgAM2xVt8nA/mdGJB6ZwxIjuCipTJNY0QoxmvvfIrZBIOykID34HM+bO?=
 =?us-ascii?Q?f2UQccKkhYsMMQgmLULEZZw0vv8TEY3WRh7DHxYgssfPxltRJmHfZsJiIo+E?=
 =?us-ascii?Q?RKgptqWBhZlyr5CjA+/gMxNO+wQ+YM0pt8ojkSIoQN5mlPp3NvlNFX1t6fEz?=
 =?us-ascii?Q?SuaU5li7Ic1Do7iILdBhTKCIsUQTGLKJv9nJ+yD7Xx4Pnl9I9jisZwL18XFr?=
 =?us-ascii?Q?uTLeUFC/8I4rzS5w8prDs0TLzRmqwn00C9JSnP/AQb3k64b2/fdxk5pbi/KS?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcc8621-96d1-4b30-8d54-08db4502924d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:29:15.2741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pneb9Y861DMJbKoMHJGbAaAlAFqW30qxC3hjoJBBwVWBozvk42WVOfXKpXvU2rDydBno/ZrOOuN7yLECNXmCZ9NbiPVQrAHjGIZ52Boe9pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/17] drm/xe: Introduce xe_reg/xe_reg_mcr
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:54PM -0700, Lucas De Marchi wrote:
> Stop using i915 types for registers. Use our own types. Differently from
> i915, this will keep under this will keep under the register definition
> the knowledge for the different types of registers. For now, the "flags"

This sentence got a bit garbled.

> are mcr and masked, although only the former is being used.
> 
> Additionally MCR registers have their own type. The only place that
> should really look inside a xe_mcr_reg_t is that code dealing with the
> steering and using other APIs when the register is MCR has been a source
> of problem in the past.
> 
> Most of the driver is agnostic to the register differences since they
> either use the definition from the header or already call the correct
> MCR_REG()/_MMIO() macros. By embeding the struct xe_reg inside the
> struct it's also possible to guarantee the compiler will break if
> using RANDOM_MCR_REG.reg is attempted, since now the u32 is inside the
> inner struct.
> 
> v2:
>   - Deep a dedicated type for MCR registers to avoid misuse
>     (Matt Roper, Jani)
>   - Drop the typedef and just use a struct since it's not an opaque type
>     (Jani)
>   - Add more kernel-doc
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 93 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 36 +++++++----
>  drivers/gpu/drm/xe/xe_gt_mcr.h        | 11 ++--
>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>  5 files changed, 125 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index b5c25e31b889..c0a091206f27 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -8,4 +8,97 @@
>  
>  #include "compat-i915-headers/i915_reg_defs.h"
>  
> +/**
> + * struct xe_reg - Register definition
> + *
> + * Register defintion to be used by the individual register. Although the same
> + * definition is used for xe_reg and xe_reg_mcr, they use different internal
> + * APIs for accesses.
> + */
> +struct xe_reg {
> +	union {
> +		struct {
> +			/** @reg: address */
> +			u32 reg:30;

I wonder if we should just make this reg:22 for now?  All platforms
supported today only have a 4MB MMIO area per tile, so 22 bits covers
all valid reg offsets.  If someone typos an extra digit into a register
definition, I think the compiler would help warn that they tried to
define something outside the possible range.  It would also make it more
clear exactly how many flag bits we have left here to work with for
future expansion, assuming we want to stay within 32-bits total.

If a future platform doubles the MMIO space for a tile, we can easily
bump the number of bits up.  But I don't see any downside to just making
it match the true register address space for now.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +			/**
> +			 * @masked: register is "masked", with upper 16bits used
> +			 * to identify the bits that are updated on the lower
> +			 * bits
> +			 */
> +			u32 masked:1;
> +			/**
> +			 * @__mcr: register is multicast/replicated in the
> +			 * hardware and needs special handling. Any register
> +			 * with this set should also use a type of xe_reg_mcr_t.
> +			 * It's only here so the few places that deal with MCR
> +			 * registers specially (xe_sr.c) and tests using the raw
> +			 * value can inspect it.
> +			 */
> +			u32 mcr:1;
> +		};
> +		/** @raw: Raw value with both address and options */
> +		u32 raw;
> +	};
> +};
> +
> +/**
> + * xe_reg_mcr_t - MCR register is the same as a regular register, but uses
> + * another type since the internal API used for accessing them is different:
> + * it's never correct to use regular MMIO access.
> + */
> +struct xe_reg_mcr {
> +	/** reg: The register */
> +	struct xe_reg __reg;
> +};
> +
> +
> +/**
> + * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
> + * read/written bits on the lower 16 bits.
> + *
> + * To be used with XE_REG(). XE_REG_MCR() and XE_REG_INITIALIZER()
> + */
> +#define XE_REG_OPTION_MASKED		.masked = 1
> +
> +/**
> + * XE_REG_INITIALIZER - Initializer for xe_reg_t.
> + * @r_: Register offset
> + * @...: Additional options like access mode. See struct xe_reg for available
> + *       options.
> + *
> + * Register field is mandatory, and additional options may be passed as
> + * arguments. Usually ``XE_REG()`` should be preferred since it creates an
> + * object of the right type. However when initializing static const storage,
> + * where a compound statement is not allowed, this can be used instead.
> + */
> +#define XE_REG_INITIALIZER(r_, ...)    { .reg = r_, __VA_ARGS__ }
> +
> +
> +/**
> + * XE_REG - Create a struct xe_reg from offset and additional flags
> + * @r: Register offset
> + * @...: Additional options like access mode. See struct xe_reg for available
> + *       options.
> + */
> +#define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
> +
> +/**
> + * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
> + * @r: Register offset
> + * @...: Additional options like access mode. See struct xe_reg for available
> + *       options.
> + */
> +#define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
> +				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
> +				 })
> +
> +/*
> + * TODO: remove these once the register declarations are not using them anymore
> + */
> +#undef _MMIO
> +#undef MCR_REG
> +#define _MMIO(r_)	((const struct xe_reg){ .reg = r_ })
> +#define MCR_REG(r_)	((const struct xe_reg_mcr){ .__reg.reg = r_,		\
> +						    .__reg.mcr = 1 })
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index aa04ba5a6dbe..f5bd453849f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -40,6 +40,11 @@
>   * non-terminated instance.
>   */
>  
> +static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
> +{
> +	return reg_mcr.__reg;
> +}
> +
>  enum {
>  	MCR_OP_READ,
>  	MCR_OP_WRITE
> @@ -360,9 +365,10 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>   * returned.  Returns false if the caller need not perform any steering
>   */
>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> -						 i915_mcr_reg_t reg,
> +						 struct xe_reg_mcr reg_mcr,
>  						 u8 *group, u8 *instance)
>  {
> +	const struct xe_reg reg = to_xe_reg(reg_mcr);
>  	const struct xe_mmio_range *implicit_ranges;
>  
>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
> @@ -436,9 +442,10 @@ static void mcr_unlock(struct xe_gt *gt) {
>   *
>   * Caller needs to make sure the relevant forcewake wells are up.
>   */
> -static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
> -				int group, int instance, u32 value)
> +static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> +				u8 rw_flag, int group, int instance, u32 value)
>  {
> +	const struct xe_reg reg = to_xe_reg(reg_mcr);
>  	u32 steer_reg, steer_val, val = 0;
>  
>  	lockdep_assert_held(&gt->mcr_lock);
> @@ -494,17 +501,19 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>   *
>   * Returns the value from a non-terminated instance of @reg.
>   */
> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
>  {
> +	const struct xe_reg reg = to_xe_reg(reg_mcr);
>  	u8 group, instance;
>  	u32 val;
>  	bool steer;
>  
> -	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
> +	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg_mcr,
> +						     &group, &instance);
>  
>  	if (steer) {
>  		mcr_lock(gt);
> -		val = rw_with_mcr_steering(gt, reg, MCR_OP_READ,
> +		val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ,
>  					   group, instance, 0);
>  		mcr_unlock(gt);
>  	} else {
> @@ -525,13 +534,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
>   * group/instance.
>   */
>  u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
> -			   i915_mcr_reg_t reg,
> +			   struct xe_reg_mcr reg_mcr,
>  			   int group, int instance)
>  {
>  	u32 val;
>  
>  	mcr_lock(gt);
> -	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
> +	val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ, group, instance, 0);
>  	mcr_unlock(gt);
>  
>  	return val;
> @@ -548,11 +557,11 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>   * Write an MCR register in unicast mode after steering toward a specific
>   * group/instance.
>   */
> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> -			     int group, int instance)
> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> +			     u32 value, int group, int instance)
>  {
>  	mcr_lock(gt);
> -	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
> +	rw_with_mcr_steering(gt, reg_mcr, MCR_OP_WRITE, group, instance, value);
>  	mcr_unlock(gt);
>  }
>  
> @@ -564,8 +573,11 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
>   *
>   * Write an MCR register in multicast mode to update all instances.
>   */
> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> +			       u32 value)
>  {
> +	struct xe_reg reg = to_xe_reg(reg_mcr);
> +
>  	/*
>  	 * Synchronize with any unicast operations.  Once we have exclusive
>  	 * access, the MULTICAST bit should already be set, so there's no need
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 2a6cd38c8cb7..27ca1bc880a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -15,13 +15,14 @@ void xe_gt_mcr_init(struct xe_gt *gt);
>  
>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
>  
> -u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
> +u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			   int group, int instance);
> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr mcr_reg);
>  
> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> -			     int group, int instance);
> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
> +			     u32 value, int group, int instance);
> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
> +			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 13f9f220bca0..4409490024a6 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,7 +27,7 @@
>  #define IIR(offset)				_MMIO(offset + 0x8)
>  #define IER(offset)				_MMIO(offset + 0xc)
>  
> -static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> +static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(gt, reg.reg);
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a93838e23b7b..0bb83ff18599 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -397,7 +397,7 @@ int xe_mmio_init(struct xe_device *xe)
>  	DRM_XE_MMIO_READ |\
>  	DRM_XE_MMIO_WRITE)
>  
> -static const i915_reg_t mmio_read_whitelist[] = {
> +static const struct xe_reg mmio_read_whitelist[] = {
>  	RING_TIMESTAMP(RENDER_RING_BASE),
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
