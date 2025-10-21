Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB8CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 17:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51E10E62C;
	Tue, 21 Oct 2025 17:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OftvYfNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326610E62C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 17:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761066678; x=1792602678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ut9Rn7GRLZELxCgBsflSeHdb+H61pdZRdPWGh72p9qs=;
 b=OftvYfNeOMSPDgPXs43jkd4hwmqEQ/UxkHbZBhrfuBfLx35s+wCgcoyZ
 AdgQknCVE8cw6ffYvSWSCKqrM0mMaB87aCnK5THvRLxlgP9UENqHO2C/n
 JZJ1amt6qpdHHTSv6L39fmpjZneaFCkqX7j6qWpw5nKWB6KK+Hvbd7YZ9
 VFQKIYFnIAzGl+bqwhjMcHiJ9uaJum3kRAqFTexe3GcewVwZZdeAYdt6L
 s3AYh5EcIDKEPCEBs8kZj+9nyhqafubIdrrvTe/SJGG59SdzTW80ZwGdh
 B14dMeCqbP6/Wrk98YGtjigdXXqa17jBMzancN/Jf7kj4dBjZtooR4cIP w==;
X-CSE-ConnectionGUID: baXa9HTqQxecPdowARtUjQ==
X-CSE-MsgGUID: CjaiDtMOQ5ypUxPzyaWc8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73807254"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="73807254"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:11:18 -0700
X-CSE-ConnectionGUID: k6oViOC4RUuKu4x0HTtLYw==
X-CSE-MsgGUID: xyGXk5h7S32Ac6ZZEbEiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182805790"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:11:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:11:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 10:11:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSU9Gg47ZT3Zw+KzW1S+haAo01kuRpNrXKbe9iZICY+MgQcngccWst85NhZ9MLmX2GHd+d7HlNzD05qADNXE2f8qcooHuyBFZHEBAWjKQsj/E+iAf6yIvExLYzbKP6F79pnLSpusx9JKAn+HqCzZPBydCYBzghSdpDnXfe0nn1uB3BIAkI4wg77b2Jzy8YNX1AnHYZ9pXLq9c6qBi2z+sUFW3EaZ7D30OMOqP7YxY/DTePCt2UesTAntkusiFVVODjcLji+bnWLRojdzXU11WpMsEU41DccsjBLlrQcB1r7dTlsn/e0uu993AOOXqv7dWcaxaFm0vuhsKjp9ww63KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tp2Kkn+HAMKg9/rWjIRc2U52XGktMx8DpEJDi+PIpo=;
 b=APdBJ7TcDCA8kkd7qfcmnwK7KOA2T0RvsZgN83gl901ImwCUZrt0JnTYLhlxtPaVTzJP6UnlR8DKvqP5MkVC4Eo2ReCnqqt6/9ny+iVZ/HXXks/T90DFOnNa4lHbEhlPJvxMjNM8Re6g9yWO6Uaw8JcQP0qucq1jjjslkhcLduUZqSX1iKGVAJoT69NDDPtzSTzHBepheYT7SoS6r9S/qPz8BqYXgWRePPxO3KqYNkHSqUeWDO44ya6S/ENC3Et/xBtgXB93oWOVAGyJbTLAN3dK3Mw/a4U/0ineW8D4esIso+nVHg5vwrrfWQBXnHaJe0RrPvJqvhuWwHfKFXScJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 17:11:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 17:11:10 +0000
Date: Tue, 21 Oct 2025 13:11:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix stolen size check to allow equal WOPCM size
Message-ID: <aPe-q-JaxJAToN9q@intel.com>
References: <20251016225506.2256127-2-shuicheng.lin@intel.com>
 <466c6ba9-7bdc-44b0-bdcc-89fd51150f03@intel.com>
 <BL1PR11MB5447E7EA697902D7F6925F35EAF2A@BL1PR11MB5447.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5447E7EA697902D7F6925F35EAF2A@BL1PR11MB5447.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e353982-075e-4c75-cdc9-08de10c4d4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+UFlF0mRFEh5Mw02S6kKKsEY+u75x0BStxy+vpHJ6yLulBMy0LLZ90TECx1X?=
 =?us-ascii?Q?5vtCv/ahAYK3Iue7KN87qljxncKQDCruSlW0RKbqvsAr1tZbqrYA5PVX24cB?=
 =?us-ascii?Q?W34/oyBYVsGBJdhvPGy6MPQk+2f64bDqZ6M9nSmiZ3ugJEBeadICwyCGjE3B?=
 =?us-ascii?Q?E2y/igXc05df1yHXN/RbYoq1CE4PvwD69hGH/OrCq+OqwsRmir+mghwN98XT?=
 =?us-ascii?Q?Uaf9/MTQVCl95GG5YSDR6ZHFFTqBD4iGLcQvCBpQtCf9ddvYLKg8fM+676ea?=
 =?us-ascii?Q?5448MKDNFzVHcxrKeRBg8l4Cb2FVAkdoEpT/iHabEmWrhj/ou4URUcAoVzpj?=
 =?us-ascii?Q?j+sUkpZw+6gKFO2Vpvyb5dh0n0JQxZz/3RoikzTcQKiVy5wfIbAOv/GS4oJZ?=
 =?us-ascii?Q?YOtiAB1zW4uLWd1jMKVO3xhvgsqplCoi1R6sdm0wEfF14suQKWs94Q7oFQhL?=
 =?us-ascii?Q?0VIzVlDEXCjHjc1HmfeWQwq2sTczu6r8VF78TMq0c+ckfQaiCZiVwg5g8hqI?=
 =?us-ascii?Q?4MaiUTBsOm3jm1K8FNXTdztZu6Nd1wKnQ57IQhFjMpFOlgKT8dO39DmlSPTB?=
 =?us-ascii?Q?pHGH52pJDtYx/ZIUjUr6yQcieTv3eYwU8CPoD+WMqFycmi0bKG2im+VXh86Y?=
 =?us-ascii?Q?yxaiA/P28OXEPbogAMxjRWHgFBdqZCxG7ZqTmXpRyCQkZms8NqDQAtAlC/cx?=
 =?us-ascii?Q?w5jGi97naeIeYhsszY7XY7/OQe44A7OJ6xDrtl+aop2F/C4HU7lo4tsIyhxi?=
 =?us-ascii?Q?YeGrJtr9Ry17qrnMByTNG5g6B7jejwkh/En8HQpqo1Xf3mLDJ/0jxQGDHTCo?=
 =?us-ascii?Q?nPzhGkX8YDw3gX95r4xpAZytz9V7zpU8okG9LF4mepphRYIXwmusgaRa3er0?=
 =?us-ascii?Q?92z1DLRBPbcdKrIDj3kTUBSyaK2KTyn4rMpN5lxhNu3OVRpQ1ewnxhkbPlxl?=
 =?us-ascii?Q?7ZjYgQ5nJpJoq+FaKSM+4n8IWttwv20M4r91rPxMbxWdbjd3aN7v0i9rlCkM?=
 =?us-ascii?Q?/8p9Mphn9lNkHt2zuDssn6whZW6qSlcyiZcvrua7uoxW/euTy4zdMUxwGkT2?=
 =?us-ascii?Q?gTP+rHECTPLxuNHdtaMxplMbaHFjgiRIXxgIQGkeI+e6iEB0jvcQC6x2ilJ9?=
 =?us-ascii?Q?z0emTkY3p/gPX/nFXYFP5ZkLjwmLo+LGQPc0qWqYjqMdMQvnQytYRAXvo0mu?=
 =?us-ascii?Q?Hz19zRo1x5mr5VhFZ8DHmqu1/8hCS950kplNqXfHdPWeFSJsBxG6VY4/Bs80?=
 =?us-ascii?Q?oBe1bB+NMGI8gM7XWME8wfE0vjiTiIK/b0/np7VxbqyPPM5XXSkR4ozs9+q9?=
 =?us-ascii?Q?qMGeciBoyT6h73ah0CaFdfbb6emrazlw+ZRIvKd6yZwT3O5t2dbnKw+pizGo?=
 =?us-ascii?Q?f9UlnMA5B1reJb3Cy5YqjoK4HBwl0Z+jZ1MiO1p5Jq2KxqAK0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJqfDtTHMiGXF7weNqaeLEgMgr9mTvKmcxiqVjAQyIanGIJhIESii890t6+6?=
 =?us-ascii?Q?OXLZI6eLFuAzeOkgk+lnbIEqGEfEJjjvqWO7dr/BIaiEGZ+YQk0vsM2Mr7E7?=
 =?us-ascii?Q?Nzo2nqX8+Y+0j21oOp1KM/uYTgic+u7A8p/GmNG1PCLA7aFo7ge8dk3ywj4p?=
 =?us-ascii?Q?ErWZCoWfTAEdSTPTpTyfEw7jJtlgFlyPrPIu2Gt7kwNEbyNGxf3v7SY8P4Xz?=
 =?us-ascii?Q?oSHLgnRT0PXvKOIaYySvupcN/eA8jAzsxgzVSkfgf8PHwJK9tq5P/sWQC/ej?=
 =?us-ascii?Q?9Q98SVdMxRlwnO8sgtMO2qDY8ahOtS3Pa4re9qCZTQL9me8H69KyTWtBzNtB?=
 =?us-ascii?Q?r5o+WxaEdbgs9HvHRXfak7WeGd9aPdSyzHIg5SKkD0bHGWc9i4XPtpd4BkIk?=
 =?us-ascii?Q?P9rSGY6cxoZvaAeRQ+NWwmsmEZEaDeBnimIuAB81ZI5l0R6+xEAzMbE4u+fM?=
 =?us-ascii?Q?2fSjl4ghXzc+lR3Z7TAyGAKLPbCsUssvLHFThh3K+gle9NgpyqN4CeaxfllX?=
 =?us-ascii?Q?P27ckTER934N0vluZ57WD6kw5Gh9fxFkEPUP/O+UH5PQlB8QWNKtfz0Zl1Ri?=
 =?us-ascii?Q?yc6k3LUXCcVrpLzSGjoKhaJH12NsDvpN0Z0T00xDnA6N/J+rjltSCC8lzKBy?=
 =?us-ascii?Q?/NJYnPWnhhtSQiVnS+6mhYYxOE+PAVJ5jncWC/quH278coPzqKErX+6LPMr/?=
 =?us-ascii?Q?YIoeFkZiEajDYWJYQP7d/HuKmq8gxRaOpGsJarh3s2e4LB102JjWM5ATJlpU?=
 =?us-ascii?Q?6c86NFdyFdvPoG8nEWXegbNLxrXlifQRZUpEv3mL7KP95bVTko5E3jciAmLB?=
 =?us-ascii?Q?I9vNsLzgNRViWsF6jHpwEXavJOIw3ucsqFJJkWxGO0JsL4bkJGTpjt5324E6?=
 =?us-ascii?Q?yhtHNpSp69Y55HBjfzd8sFgS/jPWIBTAo/O5vDhfxgwggHP32rCOzkBvjihC?=
 =?us-ascii?Q?4ipOWUGnlxD+1jmhLsdGY+xT6jhaXzo05BXdW1irL9Z4S9VafJHigXWt1YD0?=
 =?us-ascii?Q?XOBJyL2tVapPvlQGab6ZkouWvJb0Q+ZYnJp7+DXOR/2j8XeI816fz1aO7GlQ?=
 =?us-ascii?Q?gNung1vGBuc42bh2eyaWXYPTDwr+qlY/9EZXkA13nH+uLeeYee4E3rf7da2Z?=
 =?us-ascii?Q?phIZuvrZ914xeBF61u/1m27dRr2aRQ908bLnoKHimRLt4Rc/N322Vv3rzzvw?=
 =?us-ascii?Q?jwUQkORpR+ql79/e/JDSgvjnF+tgIZq3Z/rDHQN02befg0c31AMLIMvowlk9?=
 =?us-ascii?Q?3BIGMk2PPkLBsX5HxrTo16R2fFifeLIx3+yJrTnQNW4vJpfSGzWsQpq94b1v?=
 =?us-ascii?Q?C7zlGLE5b1XBE8S/zEL/YavQvDR1He6gENGlfFPqAcGw6jjs5++7LuPTtcIa?=
 =?us-ascii?Q?2Tu8fmzkSFWnV3Hyidmdd99dn5+IEVt9MUjDKQCen88EdsAQKC1SEMLHvoB2?=
 =?us-ascii?Q?j1sM44xhO4bwQtKy8yztrhfzWqJB4XoBX5lcMszXYUeQdc31RnqaZSzwUEhE?=
 =?us-ascii?Q?P/2+VnTuTY9Qss41e6O8lzSp1hxWeWo6XI3JhsEo4wC7gcVLnW6KVyfHHzYd?=
 =?us-ascii?Q?4yI0aFNXq3ARJvjcsNNK+3Y6MaNAA+YWrKuIjhXN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e353982-075e-4c75-cdc9-08de10c4d4f3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:11:10.7999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLZlny1SRJCE/0CTGOffIv4X2Z1Mae+ktEfoYBsYzIRFc5O6qIfc86gOOzHf7/rqTSL6bNSyOE5cThH1oqMAGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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

On Tue, Oct 21, 2025 at 12:09:44PM -0400, Lin, Shuicheng wrote:
> Thanks Matthew for the review.
> 
> Hi xe maintainers,
> Could you please help me review and merge it?
> Thanks in advance for your support.

Double sorry here, for the delay and for missing this case where
the stolen is solely the wocpm.

pushed to drm-xe-next now.

Thanks,
Rodrigo.

> 
> Best Regards
> Shuicheng
> 
> On Fri, Oct 17, 2025 1:55 AM Matthew Auld wrote:
> > On 16/10/2025 23:55, Shuicheng Lin wrote:
> > > On some platforms without dedicated stolen memory, the calculated
> > > stolen size may be exactly equal to the WOPCM size. The current
> > > assertion incorrectly requires it to be strictly greater, causing a
> > > false failure. Relax the check to allow equality.
> > >
> > > Fixes: 65369b8e2961 ("drm/xe: Change return type of detect_bar2_dgfx()
> > > from s64 to u64")
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6359
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > 
> > Looking at the logs for PVC it has previously never been probed with an actual
> > usable stolen area it seems, so this looks correct to me.
> > 
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > index e368b2a36bac..1bddecfb723a 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > @@ -106,7 +106,7 @@ static u64 detect_bar2_dgfx(struct xe_device *xe,
> > > struct xe_ttm_stolen_mgr *mgr)
> > >
> > >   	stolen_size = tile_size - mgr->stolen_base;
> > >
> > > -	xe_assert(xe, stolen_size > wopcm_size);
> > > +	xe_assert(xe, stolen_size >= wopcm_size);
> > >   	stolen_size -= wopcm_size;
> > >
> > >   	/* Verify usage fits in the actual resource available */
> 
