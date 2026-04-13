Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19807F531CA
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 20:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3BA10E12C;
	Mon, 13 Apr 2026 20:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaV5+8+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B131E10E12C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776113459; x=1807649459;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9/rzSpoKQdTOXsDw6twPpv8ZL1cYGqUA+DGNlQ2kASc=;
 b=FaV5+8+Ve97/CgpRGyaJ0bx2FP+ZqSMp0tNxsMUNSswbihsFKsE/emDh
 ledY3uw5zkcz0/1KceMhz5b48PhPClWaRpB2S1NSf9atSORuWcu4nJwtb
 zRtdEdRbvPS0OUeWw2j7g/t036Us9Vhv4fXSYQdAHOSZt98JKOFPRISAm
 TgeKAA4U+7dA5aa29vRFPFiVpWGBX7qaGDij4nqm161Ex6LuEYUHzEQai
 9473f3ZfS1BD58RY46bIvSbTapss1MyEET0Ch+ZdCXAQVOEq1PKLDog/G
 EW258fAdyVSHBbedtMsuH/eTWhYRvyByX7uJAcNy5rw5Entoaxg38XxMS A==;
X-CSE-ConnectionGUID: RG3ZlYYmRueL85W/JqfFag==
X-CSE-MsgGUID: TUnnhfwQRHKpMfQRrvPBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76969238"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76969238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:50:59 -0700
X-CSE-ConnectionGUID: 8L/IBfNER1WarTOmqaDBxQ==
X-CSE-MsgGUID: kA9JxvhHQZepvpd38MIHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="225159533"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:50:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 13:50:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 13:50:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 13:50:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhpR2HPbo3GI246CIYIrC00IsaXOGsBBiG7nvu/COyOnCF0oczowQzlp1egCX+Z3QgJOvrHHA6k/bGK4V57fpw6qyqDDRvAPOv2YwzMjkwt5CF0BhheAFFGw42LgS4KBvjIghZ9yG+lJHpoM699DLNp1xp9Q7h2UCsiFmA0wuUurGvdIWKgeNWRsE7uUIi6SG9g5uNisJbxHoz48QMKGsKJ6RMfmnRbLAwwJR70XJuIGTbaCbRABX8bSMqBYXgdcq0qdbILUsIuUm3jJ855r72PSnaqvBVyECjGF6BKa+wJzzA5mHMFLbNUeRtFSGPD9XQXuzZ4Zp0NxlM+2Ixp3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpS+cB+c61SFkuyqSFdgtnoVKIAkWgQVye4/pBi9c+M=;
 b=daaBUxf6KAGzYJijIt3q/uDr6Q2jkwOFA8LAMiy9/YA/OJQrEkoVU4JqzgNiOSLNwfUSUQix7Oa9peAh73mG6bY/wVsB9qZ93t7WqCF1R/sQUBLN33P8YMG3yzCXJXWH/f5Nw5wi8kkaa9mM15Ejble+9LDOUA81L2l40EYmSyMC36Kh1kObo+EY60DcvRdBNFPVejgFypuV2OthTJy6XXHLwICiazpZ66lkjl1GDnIaLk5fPc/YhiEf6Ok1sRjhUaHcUNx+/jcu+VHcBKwgtBH5ULzDnkvwaZM4x5h+nRT1fVQxhEwgTnOOQoMAZZSyGb5c+YkuB6ofTlY5V0jm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 13 Apr
 2026 20:50:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 20:50:54 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tuning: Use proper register offset for
 GAMSTLB_CTRL
In-Reply-To: <20260413191755.GH6301@mdroper-desk1.amr.corp.intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <20260410-xe3p_tuning-v1-2-e206a62ee38f@intel.com>
 <87jyuaoos1.fsf@intel.com>
 <20260413191755.GH6301@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 13 Apr 2026 17:50:50 -0300
Message-ID: <87eckioa8l.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 1178c676-a6b8-4e72-9442-08de999e5b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: JbfrlXps2Ex5v7f3vpiTbAyXIiHiO5sgf7PAFE0yrXpcQGlyG8tgPuOncqyHbGX3ZMiVWgKxf8zcKuit/xdrds5RBiwwa5zlXCJkIgn73WpOAKXCRgHbZ8C1g3ZtU2EJXUJI0cAJawoSn3yYNu05/EeotxLsyIOiBHjWAP2e/eX0cM07OaoItRMS+hTfMmJwCskFR/v1qDMKz8rPELRnHNHtMCuPcudCGIFI4SaskwyWvJu1oT9us5om/kMAd+rz1BxEpCUNNyDg/zqDYlybbn2yvPjWzShxICbPUCKSvWl7ec4exCwqDkaj8CItHmNcbvozhkxTVLFnKFwLe9qDbl33tXlVdZR/9oZGrzIUDntzUygo8S5mJ0QurU5spYhabiRQd7b4Bd1+UN80RLmbMKjAKQwpb8uPxx8bjw3TyPl5RcNujkY5z/GSI3W63u6nZS7MmJOYEpZak4AiSH4jA3WLcetsDyZZUPF5Ihb6Qjt019PrPHO56mB90IThjgmvj5F/PAfLAKnTVItVo7LKmUGtX5mk5JN97V3s9DV7suX9AMULamPD4M1Gte3x0nBucmf/2CLTMBQ/jPuzRqmYpKboPr/JZAiF6dg1J2ReILQvuffCuEgvygsUjH1v86yW/tbZ2R5MrJuc6rCdc+47Nf63Rkmj7ZlAUFT2ge7UlzcPQZ/WvZLqUxEtQEE4nRZ1YXrj3/f6LQR6N0N4+m5sIXgLRbLpmRO8yagjmxrBfvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVCACuW2yPMrP6wDw+eazixe8vg9hEOS4IMRPtjxnUK/opnwFwZhwGkx+0Ds?=
 =?us-ascii?Q?KpzQYrtjo7g34A3EwbO38cAKnLsUvNZJkMyz8A0kD4iveNJBqGUAnAFiynpa?=
 =?us-ascii?Q?6Mca48pIW5nBB33d6vyEUhyNmEBRFndMvrA0UhDzbARKLWQ2B9UXczzj3heW?=
 =?us-ascii?Q?IrxkYjJTkn7EpDrWJZjuUjG8OFNOOXwKQg9fgl9nO1wVeNVQt3C+3+VvwrN7?=
 =?us-ascii?Q?8pKjhAcZ7SdyAFSEDpIicXeiDfNi01m4Fi7+tE4mhgHRvzJkC8yJHJ4qtrRC?=
 =?us-ascii?Q?FibRrcHz0ThPphLE2D3BFJDjXSYTsAL2Z16HbfecoCOt4Mqgxw+GlUk0xqqm?=
 =?us-ascii?Q?FahW8N7vYjIqthV/5MlRdy+g7R3eCt0TPfOcpOc11aRggFg11EFmtQnoDLYu?=
 =?us-ascii?Q?9F+CtVmZcEsa9rHNvJoHvnPOS3lpiiOcrZ6RMakP7+VsQ8xQkvvoYXr1FALw?=
 =?us-ascii?Q?R5fzT1s8y0d3YwfRF9S4fWqvicue66+zafTzvifemi1mhjFQp1f937YO9sY+?=
 =?us-ascii?Q?5SSOnEWUvYC1NAQhLa6pH+w5oE5WHDcWGQeEHAmvJAyrOttVJww2jSUvWS5e?=
 =?us-ascii?Q?PUBcJ5tPffLlcAcu8lcfXZDfPVpKe6H9LHe6lphOQSmLFRdLa2BeRnx0+q77?=
 =?us-ascii?Q?G7q2cwVaSQS7a1ctZxc6MfsY5z/blPuyuitVqEraq6xpyWrhNqPKgnGkMsO1?=
 =?us-ascii?Q?yn2hZyTtGPy2oU6TVWnZwxiRyCtAk5H32sGDHSzivQDGHa8EPlqUh5Ubs4pS?=
 =?us-ascii?Q?GQKr1ybpZZGLX9yJiSZl80rnvTyC0SkmyMLOri0H4JTJn7FnID7zw2dqEKYv?=
 =?us-ascii?Q?YkDrFnn9Qt4+MHro8RsawFdpHQY6OxSz80cA+nJ2ctEV2goVv32PLwwaeKJg?=
 =?us-ascii?Q?tt5hrmE9S3KoDWeR3QwuJgwKOqZECqTcTg166CihqPJk8BWpnKHLX2apinQu?=
 =?us-ascii?Q?SqVIN2qcWE0gu5LYFk61j1c5dDpdLQU/Gvxti92240FDmtws8w4q8yyfBtnV?=
 =?us-ascii?Q?/KY5+/E2mQx+tviECpkZYevdk+9fjYARmv2tn+q9fVMb1eTcS3BMkvevrNmp?=
 =?us-ascii?Q?VwYTWYWX1FkR9QmY8GLR6hBsn0Do+ksd7e9HMEHHvFwgz7dmhrLiU3Akz2q1?=
 =?us-ascii?Q?K2Ne00TxjYJjB8PwBWUqkrZppYHhRhVgSZkmhAv2xLH1/nqs41CgmPeu6rUH?=
 =?us-ascii?Q?Snf0r3MdDpkJiXhlZnb42BNT1UD2jvTSXEBVzs+fyC8/8EQTpU9YMKUZTU6Q?=
 =?us-ascii?Q?kxpzPhv11WF90Gpe3A0W7P6A2aaAnr83+twB+KgR5FgyAe2ZRug2azZy6/yR?=
 =?us-ascii?Q?HmHRn93C0SMk6Roj2Z6dRO6CHHp+wwwMBx8+YZhUkqnXdPz++YdrMMSd5Zkk?=
 =?us-ascii?Q?H1FErESDsYM4r2v3EqYctJhxy3ebB1JA+NDw5eJ2INJZ5GgJRrRuTXZwgtMC?=
 =?us-ascii?Q?raxsKN1fOhPk8ilIUr5ZHKrS6CcaDJOwrACMB4dTo0EnnQZYHwIG4aPqtNIK?=
 =?us-ascii?Q?OEwkPmYJJ5EQaoajftqPNYvBSM1ZQABhEgMdrwep9FvGHKFmwZ/cCVEzFee3?=
 =?us-ascii?Q?2LfOus3QofansEB/PEEtBZ5a750QNCec/eAVpKYOAsdHJ+tIt8hARO3DEjnF?=
 =?us-ascii?Q?635VwIlTyl/Def6fKSOzFIhp5bwurbEovTBe6zxTzt9IwuvuJZzfb3xp9oNr?=
 =?us-ascii?Q?A8NuQ6Vm3+q8/5kxNfp7uiWbYjmePeNbJyfBjI3t5xekaQrkP1k4eY04F1fw?=
 =?us-ascii?Q?0hjk/HZbKg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pZdsKZiSdSEqMRrDSWO7cJQcN0PO9j3dXY5zJ3MzNIlx/slKsBC7hYaSbYTzU1G9W2QG4bDcbOOzohFSpbsY7vkbEcuoG4el+6TjDgUMXvcA5dP6j9CY+JBW8FhRo9IpKJFQxVCETi/s6qSRppV1zDQxFMzI8+EBodpAPTOiUWc4jzLZruONc8dUqPeCIG6HQtHwXIUoLp6QZn7Yq4AU/hwtsUsgUQDbHndiCBy9wQZHIer7Wk+A82RekEhFIOLhHtHMgJZ7pfwKLeYzUM+11G6OxyKDjzbb3pH8PsvF0SrZo6EqvvcOAGUqGH5Iu8XQQfLTiwER+TqofBIBek6iDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1178c676-a6b8-4e72-9442-08de999e5b2c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 20:50:54.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz11GLWvCEIzzQQa0xkRNvHL5F70JYiZNIQ6PUWK+gZ/UibqcjrPyNOkmy39/1qLNSn6MJuOzc3/qLt1t3kEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Mon, Apr 13, 2026 at 12:36:46PM -0300, Gustavo Sousa wrote:
>> Matt Roper <matthew.d.roper@intel.com> writes:
>> 
>> > From Xe2 onward (i.e., all platforms officially supported by the Xe
>> > driver), the GAMSTLB_CTRL register is located at offset 0x477C and
>> > represented by the macro "GAMSTLB_CTRL" in code.  However the register
>> > formerly resided at offset 0xCF4C on Xe1-era platforms, and we also have
>> > macro XEHP_GAMSTLB_CTRL that represents this old offset in the
>> > unofficial/developer-only Xe1 code.  When tuning for the register was
>> > added for Xe3p_LPG, the old Xe1-era macro was accidentally used instead
>> > of the proper macro for Xe2 and beyond, causing the tuning to not be
>> > applied properly.  Use the proper definition so that the correct offset
>> > is written to.
>> >
>> > Bspec: 59298
>> > Fixes: 377c89bfaa5d ("drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB")
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> > index ea48e2a60fcd..6fb8887d1482 100644
>> > --- a/drivers/gpu/drm/xe/xe_tuning.c
>> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> > @@ -97,7 +97,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>> >  	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
>> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
>> >  		       IS_INTEGRATED),
>> > -	  XE_RTP_ACTIONS(FIELD_SET(XEHP_GAMSTLB_CTRL, BANK_HASH_MODE,
>> > +	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
>> >  				   BANK_HASH_4KB_MODE))
>> 
>> Should we also consolidate the definitions in xe_gt_regs.h into a single
>> section as well?
>
> We've intentionally avoided doing that in Xe; when a register exists at
> different locations on different IP versions, we still maintain each
> definition at a properly offset-sorted location.  Making exceptions to
> the sorting rules got too chaotic on i915 so we decided early on not to
> allow that with Xe.

Ah, okay.  Makes sense.  On the other hand, we end up with a
fragmentation of where the bits are defined?  For example, if SOME_REG
changes the offset in a new hardware release, has new fields, but also
shares some fields with the previous version, I guess we would have the
field definitions in different places.

By the way, should we write down the rules for register headers for Xe
somewhere? (Unless it is already written somewhere and I did a poor job
searching for it.)

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> In any case,
>> 
>> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>> >  	},
>> >  };
>> >
>> > -- 
>> > 2.53.0
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
