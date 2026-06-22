Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4660ECD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 18:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9AB10E7DB;
	Mon, 22 Jun 2026 18:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx7/wuBp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3B10E7DB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782152489; x=1813688489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cd/zsrI6S2ndGxyVTqCzxWvjy1CrmHuM6323NhAnmnY=;
 b=Fx7/wuBpcvbS+37bMYVDDqnRNnX+LDZFSjb251ggB03alhV5fgNUifuC
 YQKznmYrg4m02CcYK5DI9uLSxbukFRaP0EUKDeAP8AtQujVi8dLuP2bUs
 rxNuU0XRVy7Hbpnqj0g0lcq/x7EdLHzo/CZTzSC3/QMmmFgT9YwIieYMZ
 vcFoF5V8DfWZX9qxcy8NITtgfoBnb6+7QJmrhDlz35jkEVpGnOg+kNEbg
 OD5i8LF8lwtFZX8L73nO2t0WcVzd11cs+b3EmtOwZFtWkmfSexbTWf0jd
 rrVPW1a7/GOysHDypImYEt+HMn7gjLgvCTG88aj+31qDM4s06QYp6Fr7w Q==;
X-CSE-ConnectionGUID: 7CTjqrdLR8aXhptDIndQqw==
X-CSE-MsgGUID: D1rEe1RnRaCj9xuhaqFdqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82659256"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="82659256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 11:21:28 -0700
X-CSE-ConnectionGUID: lbiBytqAT3ypPBYkpMot8Q==
X-CSE-MsgGUID: 5r/ddmdVT9KaJuHDroui0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="248157576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 11:21:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:21:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 11:21:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPZJeO9HfEUWLd2ttN+pC+gD5CH7S2N3oj1h5PpxQOzrveA9FSD584cUBN9z8wfJMJ6X2GVWOKOTUzoGzRiNyPsrLo8bVUAWpd2lcNMjrPAgKgEI0HQGJ1OQsk6BWA3zTc8ydBxM/gPhL6a4CjGbSnIlg7/LPzOECiwyxkmTYvSs5WG6t4cYB4Wm1Bhyy57rsrY21pkR5EdhSJj5Hcv8zzjtXY6HTofK4tYKtft6COju6S8QUTMXaO6/9S/H61hjltJ3vI7aGiSseuXtH6uQXMe8uCvPxpXc4oOHi742NtcDREJyJUhtpmOMNdzG6/lV0ufMQExIYepvqsbaPrWS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njLz3pbLGB/vD4n506adna7YLuhLlEDORO0l4z7DBoc=;
 b=PjHB1t5hhpgI2yylVAj17hMPuOnqIr92zcmWBQkopRaqc47zK3rYm3OmIKQTqVJYOGG3B6MTKqW9ewnG6e7Pu00hplZmoRc8cIDyuqv+Jp98oeux0u1z8wlSFhMtF7QWOH24gbNewI81lxoJeYnqixKFwHv6oMzSFDWQvIrGn/hm0zwYEf50rReHP460svVClqBRNh8oJmZ1ZaL5/d44bpOSFFoJi3/Oa7Jgua8gM71sntMeoHjTMZadhx5uyCq4uZuLvhpEBwqdRzJ/Z7vVuZ1v5tVFY3CgC3O2ThpckizpEPvfNokSu/TCAwNJLiCF0Cydg2FXqaN3lQR15txtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 18:21:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 18:21:26 +0000
Date: Mon, 22 Jun 2026 11:21:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Message-ID: <ajl9I4brbMtlDE9C@gsse-cloud1.jf.intel.com>
References: <20260618112528.2354371-4-sk.anirban@intel.com>
 <20260618112528.2354371-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260618112528.2354371-5-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bc3d06-5737-4f6c-84bb-08ded08b122e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: p7UMfE+8PWyKYgUSHzdl32qCmuRAo/Bw00vouwkcxy9RjsAEtqPG6Ec3S1QzYExC7r1r39FQPFAVCezFQetAYGnTPUXx3/1e1B/VlEX1uztcCVpm/8Nai+fqWCnK7dFvpe/KPKQKcw8ZS8JO1dRk1C2Y5tS/6FqSitFW53kBbOTZbgdo7Z7f+Bbe8AUg2uGHqrkBH8MmRP7RlmMvH1DsAT+P/YkZG9kh3OMTmTjikcAjv0P71EHFE13sFXz+pR0NT/EKIGX2/9v+pWGgBpjy+SvGEIkFc3J0Osr8cRN7f4WIzqmEIsVrKXAMWg+P/IGt4L9G2FUW8IX/wDiE2Jt8SkWjLD0CagXqMgtxDK6Jgu7qgJJ/h5T0ORc1X9feLLxNOIPwzq2bNj2vVc+CGBVeBB6jxMcP97wmTy5syTbYHfmX+rgspIM5/+gbgBJ8RRbNC8yGd0I+9Nl/cNHQI9F1k0UpwES+m6eeqcnXYMXMpnIM3GOmikQia0cRXohvXpgnXRsIgQJYX65yng/T6PjFBnAEAhwTSlmIsqaWJjNkX+4ijUMyq1XPOcETn+ivLbJJ6Y6EVMbwK1ftUDUdsdLMC0q6QxjxfurK62B5XD/dmI3sycp47W6t+T73YoIgoSLsI5pifn8xagiYNEGOxHfkXW+WJ2SPOcD+85cbhGrB/10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ir1IcvbjQ+sjBxxg8fBh2A0MRxg/6TUtV3CdEU3W42lNvzQJCYa6LW4UbYtL?=
 =?us-ascii?Q?OA98XYhwTz467BPOccvpkaGwLVS7YuwWoFBtxIAv2+VePsAcm6v6gw2SQtOv?=
 =?us-ascii?Q?E6D18BgB9hxyHBJD6rUY6iM7e88c8Y+r1YngD7SryXzF6zgzZPM4jpCDkv4J?=
 =?us-ascii?Q?RWOEZZVnJ+FV2ujTKhgDZTYSGMYzENZEKjPlgLZsmflU/3F7MUbwbhgw03z9?=
 =?us-ascii?Q?Kr7JP+bALk1fZVT2lhe2n5mKbZl8juKmik7rQc4D1qYulrhp0kB6vb9UVAmA?=
 =?us-ascii?Q?36Bf0ikVwhQ2r8+sGLhj2AJzXeX7Yp/ayof6WQKO291FtEzpQF3rBQ/9B+Dz?=
 =?us-ascii?Q?VQngGHGwlv2T0ObVmIFxecR1RzA0mdbqSBkokNJf3m9QBD2yO2SzJH8mRLeT?=
 =?us-ascii?Q?/m53+BGI1Nzbi48hr8I3m1e+k4MALdOH7VxH/AO/mbrkQCLHz7SevaGKRuMf?=
 =?us-ascii?Q?3XVNxMOpriyqK7PVREJnUcchx5YDrYRuGkKMMllFsm/PWVdGdMguBhwl286g?=
 =?us-ascii?Q?OD3wf6BotZuSwDyWyYV9lV8motH5YOPwWyVLY2f41FgyBiju42zduJT8Cb3/?=
 =?us-ascii?Q?uplqOZE2Ni8XikYt8YRUarn9tcvwSq8X6UG/HFnjpKMKfYDxxw+S98di2A9Z?=
 =?us-ascii?Q?3oUwlRA2wqx8k44oDYPgVyWCvCBRjxH47qgl3vMypReGYIFcu++tobFspXtL?=
 =?us-ascii?Q?s5hqFZ31lqWVmJo20s2wYaPI6CIWJLAzsMEl4y0+sZf2YajIGnBB6z1+MJew?=
 =?us-ascii?Q?/5wqzGp2CIvxB7JtZMqs4kkitOrjcNYtDKEo9IGGrw59nzUT3MwpuJXmf2kk?=
 =?us-ascii?Q?D81JAh21Guy3NENiLn8S53wB1MNmgPelbKa1Mb68ue0dTKJtKsgosQFLUXWF?=
 =?us-ascii?Q?9IUDxO/Ltr48lfikqcc2xwzCORoK03jgRi/8rjH+o5IcVHmf8HSlxRYug2Ig?=
 =?us-ascii?Q?agUKrYWgWPm+UmsvuRMlUIsCMb5D1jgp31IbaMeD1BITf7J4d7r1bQh3vwCB?=
 =?us-ascii?Q?bN4J0S/gMS4nNqGR5KhUXtKhGIq5+M38WuqZTMJjbeeoWxnN1GFu5m8GY3xf?=
 =?us-ascii?Q?i9dKbHyOd4M5ds5jKKffWDgKgrzKIhwk7v435Ev9PFguyFSfUFHtog15rZko?=
 =?us-ascii?Q?600JkAs1UO12ggoNxi/TC0PzNWX/4qK26G/W9QKvNvoOD/WUkoXzYKiyWF4X?=
 =?us-ascii?Q?NW9jtNWpEv4OscaC9Ynp2qFBz3p+gktQ3vMmjr6IRwxmY1dHYK4WZpfZ7Spc?=
 =?us-ascii?Q?ewNRzPOu+ILc/uGvJoqPJKCJaD6Fv5ATYmBBHjhaBIy1czPZ3rEsLV29n0CS?=
 =?us-ascii?Q?WEwZ9x4VdYExzFfHXFWlP08mOwUEE8w1ldKnpbLiMrCdU87ceh6A8jKDTe4M?=
 =?us-ascii?Q?w19NKq3hG4AcwMaE1ZNaabtqgtRRClTNk/8/wR2KPTIgqAI/CFdWKabjdpFc?=
 =?us-ascii?Q?oEIPgsShs7NmyunuBRyi8oxHXvYtOKqgSDgBJ+qkFVXMXpGk6Ia7lDmBpsKa?=
 =?us-ascii?Q?aZk9GuZJ5KKtwFXBK5HmuemCTNcMDvGTnnaY8RBV//dcE0SAdK/DxJSJ9/7k?=
 =?us-ascii?Q?N8xpjVUlE0yB74ebRZ9JIVKmi4+JBMl6n6ZwdQL8c9di/hAxvzcu/mNeuAh3?=
 =?us-ascii?Q?1zASsKvCo3GiaqmCDbdb3IHlSGhJ+eblGqPTUTEfouhshlKAW2wolg7VD2l3?=
 =?us-ascii?Q?Gorm4xU0qMJpOO4zIoc8m2khxdcwALtL9t1KkbMxjfPCzqWY8ZN2ZCk2yQE2?=
 =?us-ascii?Q?ymib4GiVMg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pUH691Yj8Z9ab4lb1UOUoszVPryCa4Jl0D2CiGhVAzBS6GmJjNnip6YIAHbxPjY8dQt1MLWtdwQoZ65C2Lh3APp2zEJb/XbTbz2Gj+hwrKpuRgohdtPOpFTxPnd33Xld2snbhFXNcrpvu2Vs4N5KCKb8LgZ3I5luPz1rKEqFqUjgLxiv3S9uXDfmboLzNNuhjPVdPlZUS/u2DrNw4SSSRzQFg5NSuhFQkoy9jXHncYdVnwuHdBgVYx1UJ47KU922uWK3Z3k/9Q9me6oeI9Fdk7IqhZNzzoegBBpV1pWzr0SDMwSWwvhsoTQKHnmoNFhMkA9Gef/W6jW0EJTLK4yQcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bc3d06-5737-4f6c-84bb-08ded08b122e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:21:25.9691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNCtsfKQgyI2B4bV4wgSj+UCdVjMpeF4J4Qz7KDzOfqPyJXpPUZE7+6EOJAo/m8rAWhe5TNBANKwddHQtgv86g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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

On Thu, Jun 18, 2026 at 04:55:30PM +0530, Sk Anirban wrote:
> The CT layer returns -ECANCELED regardless of whether cancellation
> is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
> on wedge so callers don't need xe_device_wedged() checks
> to suppress spurious error logs.
> Also document the return codes of xe_guc_ct_send() in kernel-doc form.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 38 +++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 21e0dad9a481..d6d6f930c8e1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1065,6 +1065,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
> +	if (xe_device_wedged(ct_to_xe(ct))) {
> +		ret = -ENOTRECOVERABLE;
> +		goto out;
> +	}
> +
>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>  		ret = -EPIPE;
>  		goto out;
> @@ -1236,6 +1241,34 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send - Send an HXG message to the GuC over CT
> + * @ct: the &xe_guc_ct
> + * @action: dword array with the HXG message (can't be NULL)
> + * @len: length of the HXG message in dwords (can't be 0)
> + * @g2h_len: G2H response space to reserve in dwords, or 0
> + * @num_g2h: number of G2H messages expected, or 0
> + *
> + * Return codes from the non-blocking send helpers are:
> + *
> + * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC work; the
> + *   request cannot make progress until the device is recovered.
> + * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
> + *   CT is restarted, which clears the broken flag.
> + * * -ENODEV: the CT channel is disabled, messages not expected in this state.
> + *   Don't retry until it is enabled again.
> + * * -ECANCELED: the CT channel is stopped, or a GT recovery is
> + *   pending. Retry only after the CT is

-ECANCELED often also means drop silentlty drop the message it the
caller can cope with lost messages which are recovered by the stop /
start flows (e.g., TLB invalidations, GuC submission messages).

Otherwise LGTM.

Matt 

> + *   re-enabled or the reset/recovery completes.
> + * * -EDEADLK: no CTB room and the wait for space timed out. The send helpers
> + *   have already requested an async GT reset before returning this error.
> + *
> + * -ENOMEM may also be returned if an internal allocation fails; the blocking
> + * xe_guc_ct_send_recv() path retries that allocation. -EBUSY and
> + * -EAGAIN are internal flow-control results handled by the send helpers.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
>  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		   u32 g2h_len, u32 num_g2h)
>  {
> @@ -1388,7 +1421,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	if (g2h_fence.fail) {
>  		if (g2h_fence.cancel) {
>  			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = -ECANCELED;
> +			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>  			goto unlock;
>  		}
>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1724,6 +1757,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> +	if (xe_device_wedged(xe))
> +		return -ENOTRECOVERABLE;
> +
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>  		return -ENODEV;
>  
> -- 
> 2.43.0
> 
