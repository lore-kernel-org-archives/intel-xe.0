Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E5CD98EC
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 18:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A50F10E903;
	Thu,  5 Sep 2024 18:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4d1db97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8310E903
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725559648; x=1757095648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QCbogzt4U5ckJgzN05nHrEfPuMqg9/vtKpT+GpEnr5w=;
 b=R4d1db97uujAymzzKVuYI0Xe4KDQOXRH4kJLpZic56F+j90tjkiHYo2Y
 IBSldKn4Xzo6Ph8NphYnkpTpSP93TmQb7yPvRQjPkQCBv3cwgfg4OnOlE
 UOBaCH08Ypa1kRS/hWfSJnzSy4WBK96XaxJ6h9VFx3y5x/HKh7Ykf5JjY
 vw+/Xxu7us8TIndB+7K87OhZdzOZ4gopORU27LtIom0STKrPFH+wFQJR0
 CJwCHbof2yb72Aa8ib4eEpQ906IL21T3p8cRiE8ewj03PgS7aCOdIjDdm
 zRo4Duaiic6/1UUORTETflUt8ekPLBMZ48uza4fumZxzNHrTYaPEkZOFQ g==;
X-CSE-ConnectionGUID: AKPVFlbcRzacCbV75klttA==
X-CSE-MsgGUID: Mg0whrH5RoO4jLMFVRAVog==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13393563"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="13393563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 11:07:28 -0700
X-CSE-ConnectionGUID: /KWPGwljSQiwsi57/MFUMA==
X-CSE-MsgGUID: Nzyhzj/mQZmvy8whyA04GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="69851459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 11:07:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 11:07:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 11:07:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 11:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcrdldMk1l45S/rcxA4O6VLUQjMKorsO+cb8opJGo0iCy1eSYEiHIClx7bNgLOiuVPJnJdQMbtg2MV05QPlp2vrS6M9j67Fiztqq5G7gcq7rYX8Ml68NZdIDt1OLmnlos1qEIEXwfD0NK6L+MD8pdsURgNixcP36Tz3K0+Gz2pz11WGMkjVq6pRTZgbadIwLx+5iEStNtEiQUQkj4aSdXtAJubTErPsIusgTt1kwb9rR7J0BU7wJQhkW51afoR/hUn9yxXW1X5d9ih+dKDPO4If6XskONJ1KeYuMxk3JeNJu1ghrtZhecfPffZ+TM+lythQCFENKgVdbz4H6Ueuk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooZmMXxV+tigGhCJkHIerqTkrzMwASyUhNp6fUiwMPU=;
 b=kQEn6Tl/zjsqCNTtVYn4vCzIpvS3ow6buSNcNYNAi7pfO2+kxKgQ7NCtSTOy60GYhDiHssF8BZILmir4hxtQ9IDdsN1WDsTkpxlcGQTz39aP0fKQpieoIrPLUHnaNeBVeosZWRO6Ma1YorFvk8G447Uxz/y6pTJXNFdwa7kV3/GxmB+kxaECWDNF4+KM4ydDwZ97m8VFELIP+lUTteFbSsoSfaB5Kbm4q2btaJ3bH1dh/s3iHfHXxm1ZR1hzCz7mQUpwKB+dO2zH0SR5Smbleh9xn/1/3UfrhTqoGBYo0qzeKzt9YymLE/saTUjSgdrVeHbz1NSb+Gl1MLTdFRSZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 18:07:19 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 18:07:19 +0000
Date: Thu, 5 Sep 2024 14:07:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
Message-ID: <ZtnzUzDWEBDpjt37@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-2-michal.wajdeczko@intel.com>
 <4simowxl6oki4wr6aefawflhy4giewp3lx2kzaqo7dagjr6ud4@v3svwun32twc>
 <a3651242-898d-48e8-913a-7a273744c0fb@intel.com>
 <uv43yog24v3ihozlp5hgrmjnyyu3vd7rykjssuv4yskws5nosb@5m3f7cgdkru7>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <uv43yog24v3ihozlp5hgrmjnyyu3vd7rykjssuv4yskws5nosb@5m3f7cgdkru7>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 6438d3e6-12e4-43e0-c68d-08dccdd594d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KQMhPCPCiOZN9cEJoBN3iY8fht+AKpkTLkSkq6flVeKD5Jmrc+x6kAi2uM7C?=
 =?us-ascii?Q?JRYsehMPmAsESbW5E2V0tRY2VIlvrRrEcHNPG0wexvznYrUX4w/Wd78pAXI/?=
 =?us-ascii?Q?fGaq1PRPQU4GbLRpkvo2yXtqL56LcmnjKFrcTjwM8rEmWV+tAGP4aW21za72?=
 =?us-ascii?Q?IPzmXEwsH1XSWkIeFpoRAobtwcJKMK/CYopowdlNXk1g4XamhoYVeSDWw6wE?=
 =?us-ascii?Q?wBt6892IAt2lrCCq8FUWd8qjA55psei8PMDPiKEVT+t+GBdda7El6CXw60zL?=
 =?us-ascii?Q?elF7zz1D9b6bu+LgH25zL8IMOejwJIbTLcOP7SIKzyo/rUh+pcWY7vCalYlw?=
 =?us-ascii?Q?703BtzAHyzcqZNG3HMxs9LU6YM8fUMNfE1r04z3Lm2FGSVJgfm4wDZxZxtli?=
 =?us-ascii?Q?hLRqW3i8fP0kay/5qfFldx3PqLldA3a8G7XegMhGbY09Sj3h0HzPaAgz+qg7?=
 =?us-ascii?Q?4CKNA9+++B2ODG9upSDagiFXrZQ7PfmfyO+PeZdI+nUZgUIB49QAZ8gEtzMN?=
 =?us-ascii?Q?8aPK9BPHceK/2nT57AmnBlZQiP7uVPdZolNpLu3/UmbggAjTlPDn4nIGoke5?=
 =?us-ascii?Q?Xjd3FlFiuVUPrHgzixQEphJabkYXfejCJWKDmZR4AMkL83XNOaL6aw9z2e9g?=
 =?us-ascii?Q?xbYdA9u9XyUFStY/XF17uyPlMIDsM4zKR9RgfAZ1IJZKi9nEn1uzdT4aSunV?=
 =?us-ascii?Q?fuCDh4+7+OiSZOj7MrquAmI460bbKjgKDfZzhoLYt3kaBRg46Bl1nzo3pLjs?=
 =?us-ascii?Q?O344ufmtIKS5pJTJ51jao27eLE3z/y7IXKH5+LCCHo1mVUPitaqWTOtmL9DA?=
 =?us-ascii?Q?z8jzb4lz1nkimWN0Uhy9Xex8AbgS7LUkoEpmD5wQ0Myf19xMVrrDBoXu02p2?=
 =?us-ascii?Q?9GOOXnm1/gqLc0bwETcIZXUrJ4OIvOi4HjPV3M+RPQHiUL/cXk+9zo6Ol9Fe?=
 =?us-ascii?Q?Xg3R619y5rkMwdzTBNEy822IGXaruhMTnivemV7X5B0dbwWfUuSaDo2RwfMC?=
 =?us-ascii?Q?7Ln9MUy3aLeBCZHOSb4gKP8YQiTo2d+Uxkqk2P9JKZlil9rayojhJnXE75hQ?=
 =?us-ascii?Q?pw+XSejpZZU84C9YbdxlgBbaxathXo5uocAwM8ICA2/XQYhn2h95+SKQdhZX?=
 =?us-ascii?Q?PDDPV50IIo+i9HnoXENWLDzSqMTmyXAuGm6Aidc6Tbab6sfnPl2PpKxE2Jq6?=
 =?us-ascii?Q?NgcF/76BVcO/n+4dqaR4jhgTMdfqhN+4j7ZrbuqvvkeE/9WXfvWHBa8H7yCV?=
 =?us-ascii?Q?XZBKGFItpCpLtoQQOLelQ7Revvq1dJ197fTrRkhoCqzyDxKOJFTPgyNdRAAN?=
 =?us-ascii?Q?41gL6Z6iS0Ep1Y8ReHCDDuCFrSxhCXSNi9eFCT8I1jbxhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aTUWK7KQHgNycnjKgJXUrP2IhbbzTtA9Q5lIntaX7rgkfCRwQy4ra5HU4vr?=
 =?us-ascii?Q?790N1+9LsIONLdxOJHR1qljZXxGnFavamLNRoEt+hQsAqNM332pIMnL2zDst?=
 =?us-ascii?Q?eSXV+/5oPr7gxD7ujyew7vvFh9SD+QZmFXIAIedN9a/tCF2w5kY7lWlz1yZm?=
 =?us-ascii?Q?8pnOCBj/tRGHdp17A1pGOzMqpir75YK2KOQnBwPwq4tDTwGgherxHbcC5/km?=
 =?us-ascii?Q?xUTeVxXRv1qtRlkDk/3m4+hVVLBuGvJ9p/BviOoFkYlAm3NpbN/bGDE4Ylc6?=
 =?us-ascii?Q?l36kxeWyT+bmd9uuJ65rNxqk6sCHtw0NKHY5IGwVOk0VWgK8uDPMn293A02P?=
 =?us-ascii?Q?i51B3TThsb4Vi1Y58pXEI8H4w0YReYevbtocNT5vYKf60prvJPu9+t5CvLhn?=
 =?us-ascii?Q?3TLfQR5dmJBqxa9SYjZdHHnjQFP0eq4USfMKXiZDtB20xavE12ARQVokWZPF?=
 =?us-ascii?Q?XN5SgAwtFT4eoPdtMmu0isKwXuYBgUyCNc65A1a5Vxftkg5ugviNAQuDCYs/?=
 =?us-ascii?Q?ITRCyx5YcaA9VonFQahYElUL2zS3jsW574fMQSPEtKWElSO8LXx6Z9LyMkIf?=
 =?us-ascii?Q?tOG/LVmzaqS0FOYf1jir0kKSVrsdX2jHCqty++4hSqhGIOG6qOv9SNxK7iDl?=
 =?us-ascii?Q?Lr1udLxCuo3AjoweaQ4epaaiS0+FKux8FU9/x/Qvhh193DzjjRyeqxpRJmdN?=
 =?us-ascii?Q?LnA/pUl2ZDFmLyFPZ+4FwyUDbilFxXeYsGbzlT/Frisve7gH7+YTrbmjQpMf?=
 =?us-ascii?Q?yeukrLMqVk0/JLgw9DLhrws6WbrcXlakRC1qdA4FkVICQ+JkYqXL1ddP4G5R?=
 =?us-ascii?Q?GRXivyDTQnu5O4B/X79dTw+qtK1/VE7ct+mlPVF4BjRoIKKX4Yk6//KqXpkr?=
 =?us-ascii?Q?kOMB8hCTkjrVhloFa7fxnCbfNNWPzoRVKEvVcHibpN1OMVJ8GW0W08/1W9gX?=
 =?us-ascii?Q?w0/SuhjN/C1BxTfuBAacsNXKVSXCT/lQDk0qvcQ94FeR5lohflxeJZFEJExa?=
 =?us-ascii?Q?FfTmDukxZDgFhMHdGfYLgC+CDoEaBVKez8p4mjNiiI9E2lxTOmk2GUKe30qW?=
 =?us-ascii?Q?NExs9fpXOCqp/2XXm6aEL7faudAaZBU9JZOOFURvCMGoya9Wfi9gaHHIeyXP?=
 =?us-ascii?Q?iYSHhcO40ig2N7l+4XVJCiA2vdVa68hixUW7nuA7sqq51zflA/wGaytZSPF/?=
 =?us-ascii?Q?7K6x4YmbSHgrElmYypO4l5BTCVjN/raBf98dMzRcndFEaMAmwr1c44YTx4sc?=
 =?us-ascii?Q?R0oBmG8EoUNalqWC+GuL5eTa61DHqaSwEZqp3DZZQ+KeNMaZx69mc73VDKq2?=
 =?us-ascii?Q?UYM0/qVF/rg9AHii+BtYfbDn2Nr/0GAZNFufFUtEN+csSjbpeQPDrgYUs4rD?=
 =?us-ascii?Q?j2ra/0YPAv+SlOMfm5K+88FhOw9nnA+GuoFEqy1RYHql+dT5b9eBmZUvMKtz?=
 =?us-ascii?Q?/ea17aGcvhI80fLL+YCXUbNDozci77FN2BZcsngXAwO0drkAENCkh9j4/R9+?=
 =?us-ascii?Q?K/PEn3FX6+IfMtc3dbRd6eGiUhWg0J8UgQdPfPJq8zbE8tmM29Hj7TYmnPTw?=
 =?us-ascii?Q?uwfbIqcRdXAqX8zQBYSSntymt5ZFcIEwOaTZG7CD0k/ytBGivdk1YQVIiK3z?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6438d3e6-12e4-43e0-c68d-08dccdd594d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 18:07:19.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MuPCpUl5YMqDP1WqEe5TvpowqTkpI27IxT45/fJcyXaycrtpC01REZCvAlRfo3Y2N3rZ+hCHk89fpc9q+U62w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
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

On Tue, Aug 20, 2024 at 08:16:19AM -0500, Lucas De Marchi wrote:
> On Tue, Aug 20, 2024 at 11:38:35AM GMT, Michal Wajdeczko wrote:
> > 
> > 
> > On 19.08.2024 22:47, Lucas De Marchi wrote:
> > > On Fri, Aug 09, 2024 at 06:51:48PM GMT, Michal Wajdeczko wrote:
> > > > +static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo,
> > > > long timeout)
> > > 
> > > it took a while to make xe use "vram"... now we are back with lmem in
> > > several places :(
> > > 
> > 
> > it's because GuC ABI is using LMEM terminology
> > 
> > if you really want then I can try to rename implementation side to use
> > 'vram' instead, but question is what to do with debugfs entries that
> > reflects GuC ABI almost 1:1, should it also be named with vram ?
> > 
> > gt0/pf/lmem_spare	-> gt0/pf/vram_spare
> > gt0/vf1/lmem_quota	-> gt0/vf1/vram_quota
> 
> +Rodrigo, +Thomas

Sorry for taking so long here.

I believe we should keep 'lmem' here. It matches guc, sriov, and gt design.

In the past, when i915 was introducing device-memory-ram support, instead
of calling it vram to align with everyone else, we decided to go with the
name 'local memory' that we were seeing a lot in internal docs.

It is good that in Xe we are now aligned with 'vram' to refer for these
device memory (ram). But by spec, 'local memory' is something else.

'Local memory' in general is the memory from VRAM which is not managed
by OS, but only managed by our device driver. However it could also be
carved out from the system ram. And then it can be used by SRIOV and
managed with LMTT (local memory translation table).

So, with this in mind and to avoid the sysfs breakage, I'm in favor
of keeping 'lmem' term where it applies. But maybe worth some
documentation page?


> 
> Lucas De Marchi
