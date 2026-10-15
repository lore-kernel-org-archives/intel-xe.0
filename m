Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57976CCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 22:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A241124F2;
	Thu, 15 Oct 2026 22:10:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57AA1124F2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792102224; x=1823638224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YXbUAmaLUMBg03ZQyUZHFxQ8WsMJMw2RVErEgdBlfVs=;
 b=X1CM6ckzMawswN4kbnRsSwXjGzQL9VDfxmct92D4Qylm2c0Hqi775tqI
 7nFsNENDkG8mXqmjz0q08Pfvw49WYlWHaiEHHpx5YY38r7L/c0spBPlpo
 YowFOcpeAaUjCssjlE3gYi3Xh5YJz0imoPE2vVK77f3YGkugdNRIuYwK3
 3YE+XFx99zxZf86vf28pH7tE6o6rzRIslyNKprGciXJqYCz4M1QBE0YWT
 X4Ndy13zoLcbB7p62YseuV/zdAwBv0Z7qw9R6gILcgpfz6LNGFxT3pb9D
 RqRJUxyrMQ168c12J6d/SH3QJ2aJxLt06SF/GBSSkovFi2W1eUmYW4bFt Q==;
X-CSE-ConnectionGUID: M9fLgbNBQK2ad11goWeqng==
X-CSE-MsgGUID: oXKoDkgeSnqbQIY5yrxysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770021"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:10:24 -0700
X-CSE-ConnectionGUID: kdLVl2ckT/uuSBTMwIAJFA==
X-CSE-MsgGUID: Rrx4A2IzTHqLghJEf8cr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1867236"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:10:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:10:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 15:10:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6e0dUT8ZhrlipFFz99gmX9KRO0NQD1p/7UGerHsw5JT2zFayxB7YcC09Z7BcCblz6AOHUlpgWPpVopuPwuQxgijnD3j7rJ+EhY2MeZmIW/merHhRg1l4zatHdBctItUyp3/xYfkdKc/rlXL4TL08/vTRWtb1UGEmrRmG3lIbV7Lg1Hz7hcexuBlL2/cbRBUbuJiXJe26yjhshkMh7FmRm+6GCjrxsS92GdEu/IBmMoaNe2qi4N/Zx4vXXUqBJUI7VE2rtQdjM3bbwtcNxr9AM1wiEfs4pDeJDsB13yxoQaQ3qvG2yUBqIL5Yxl0dajr7+yPdBQF4gShEspSGtw4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3McfiCP72B0jNK1McJqohRXNxk+Ikg2jGVbppCX4d0=;
 b=pznEmWx0Gb1ZlJcou/fZ1azXuDr9pOZ4QK7Av3DTr6oNEzH/GDuFm5fhfdXSAxuGEqkev5JBusPAwj4wON/IZK4JkZK7isQrUAY1DiJd6sLx/PYodoPDCSDQntkr8wI8MHbynm9QVXpPWsdMpMga78LIXgHrdbymCuBRfag1zofN3KBxou3vfnfp/EDTLf21i4YE8ppYrgFU3Gvuo5gmtcfJmoQvGGwQNH3GNQKQ+zG8OPaphor1GNgUihBthXVbYqAe76PrGFMezB12gC3wrT9cNmBTbP/b6RCAceLJd9zXslCQbgxvxrcib5x1chdo7XRVkConGYmOscsO41On1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 22:10:11 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 22:10:08 +0000
Date: Thu, 15 Oct 2026 15:10:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/xe/tuning: Restrict Anyhit NULL-query tuning
 to render engines
Message-ID: <20261015221005.GG578251@mdroper-desk1>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
 <20261012171901.19508-6-nitin.r.gote@intel.com>
 <20261015220537.GF578251@mdroper-desk1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015220537.GF578251@mdroper-desk1>
X-ClientProxiedBy: SJ0PR05CA0175.namprd05.prod.outlook.com
 (2603:10b6:a03:339::30) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: e72fbd34-8ba7-42ca-3bca-08df2b09129b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: n+LPH91PCtk1xln+aMQHI7fHuaoteJJF74/NivqjsG4SSr/5bXDnsnhOpU9GkPth3iWj9TqhYVhGBmnRqWwIBudlS9XwwNSIfeNNU5WeHts/7J7Sfx+ea7o1VKVNts82CzbaKWDhTGlCNu7ytUgSwNckUB98q4A+l80LIiTf4DvL5H/6uexXxhLr7UAHW5JhIZmd86Ki8RMmvFs+PAUhsJ9EfReg2jKxIFxZHOqhbB1ieinDSXOug/+JZj+ALI5AflQGSJKCId8Ykfw801pY6qjN4nTKnm5OUoWUiGztImqMfv2H2J68SaNAEfLKGpvQmLR3xeATIr0mtDrkG45I/1QrwNHPzWJxOt4Kk0oU0NaXEyC/Be6sA3EofOHU3VUXwPAbfszvVGGjxInbZNpk0pt62OuiJ6yDbUN8Yf5wIpgxdYy/K0Uc5tLqlwNhrRLQZ5AgNb4UTWaMG1IX4/LeRxozRCCEYFsr9FHeCDel4c8F9cq9g7PGXKDP3KcqblxTt48aASPAxklShSNhKsLj8UDeXjW8NcM/SVtlEUiVwFLtwT2Lx+WaDdLq5mpo9TO6taFtkFG3unf84rCnd+wdQ4Ktj02lrrP3wg456EucEphX0xTw1dVguHaGe41HSqP5jQdEnQi7OCLo2pHhfYjOKiy4LR790Md2cSSjRRM1sho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ZmYZTZVlwz/XvDhGx8BFeG0B8KwWWuXV5DuYASgKkZIOeLDQi+unSKl+dDk?=
 =?us-ascii?Q?Gryb5mXmP/5VRPJTXN+XdNtb09PKqMm+5oMFv9U0qYkDbwUuqRw7TVwxyskc?=
 =?us-ascii?Q?72wvktcdgEVKHBiAT5DUle/Pp6zaXJpM6kf4n1qTaT1d4HnnCqUqbFY+1PPg?=
 =?us-ascii?Q?mWgNxcrwF602Ygtb8ELM1ti44vdVGZUFOmKm35AQ5ojnmA7P8Y1w4gwYDWep?=
 =?us-ascii?Q?jbfn8cyJTcmDztQMmVUDutceduozeD40dutvZbjEyk6jGfX3r3DXGwTugTOA?=
 =?us-ascii?Q?XAUjiodoOfnxzCU63Ff50NGDA6TKy1xfQl+CMZBqBjQR9Mxm6rcG9QC8pEM6?=
 =?us-ascii?Q?Y4U/yORghq4wTR3Zzl4k+OafPMhDKEvUUVelWS61wc9BM9SNPwoII0y+8zXr?=
 =?us-ascii?Q?Rs/ssqwKqtWcaF4VxODZ0n4Ot0PI+yTXwWx+/YjEKhazMQ0wQgzhWFOwaLuX?=
 =?us-ascii?Q?obcz65YzD4DFubvWrvMv9m+0FIxL9JkZ9372bAQGfA3KSVDd7Rvs8WsPNfpz?=
 =?us-ascii?Q?HZIOwK6VluEXgzLISo9MiLpEDYW9E8RmelK533at9ZsefGgxuS4Icc2Udrr+?=
 =?us-ascii?Q?FG3czYZXVkzOx9GTQGi/bj/9SV4qeXBfWCzoD/l8lvQ9E2Ex8fZERVeiFLCw?=
 =?us-ascii?Q?rp9nIbgQgllisCO9uJDP2fUfVBNn4zEzdF6+TrxxeTkOTwITeaoWcUQKV6qX?=
 =?us-ascii?Q?0nzo7F68q7+cGr9kBSeUfu88QMyi/J6249KO/B7Ew/XwCVrzcXNFkUKGKVFj?=
 =?us-ascii?Q?8Y0Cg61BTY/xdXRrWj3AMTzEzmqLCwzzRjRJyaeXOWJGssfO/GlEkZMqvnsk?=
 =?us-ascii?Q?X9hg1DOhhNaNh+3ay2ZRgBAq+eFAsLey1N38rGmqSPGB5cxabC2gBDJtfgOb?=
 =?us-ascii?Q?1CqnTqSibLTQ85vjzF99iRnER1raRy14WnZfquI2J65mRWL2gpcV3D7h2Qux?=
 =?us-ascii?Q?E5nFpTzYJqb6PDLKPUBCt81qWN20lNq4wZEVSYFacehmxRBglGT+1/WEdJIi?=
 =?us-ascii?Q?GqMW+Y6Lm2QeGi6TybavCZiXyibpYTQAI3GWpdrbRn8MLtoKNGE/WtQpoVUa?=
 =?us-ascii?Q?SB9kyIm41yIHP7GgtKhEqDRm36j/DJ7VQUCOIUJo6xteMjuFDs60UTpABYEO?=
 =?us-ascii?Q?6hTBe40xOaOiusjNf+S+oQfwHAWwybrXM67GwlPKFG7I6LUA2SG70u6w+jMF?=
 =?us-ascii?Q?bwArBFFzoWCm5Pb60hQotnpKvNcNvkNG/zceNERVX5Z/sDoLNLY+3VkWrnRJ?=
 =?us-ascii?Q?9LdX8pTM2Z8eskE7hBw7tULr8jRtOzgOtbpqY3jEfNmTzo4ML2y8Ix/5WVM/?=
 =?us-ascii?Q?C6qc4o8Nv+CN5pG4Rqn/l6sYjyUHYL5aG1FwWonmjDKT/oeWnpR0MPTqyAYF?=
 =?us-ascii?Q?j/QJ1iDBltCQ/yhiijNB6aWmguw/oH9xIBgfuj+4NS07Q53qbjeZVejspZ1M?=
 =?us-ascii?Q?gFhfTk5wxtZk9o9kf4kaMW8b3P0f1eFzXlu3lW5p4Oy/vr5W5oAui79PCf5i?=
 =?us-ascii?Q?Zkx0FANw87vsHmXAN5QHj3BlLnI7qK9aOMB3PJng3nkZbZXVFe1TxqWl177H?=
 =?us-ascii?Q?yjNYfdkSG800aVfdKCrkbpjI9hHB9INMgEEee9Vs4eEyM/byRX5+uSC8yBWq?=
 =?us-ascii?Q?0e4ZcMl0QIBZ3PpRZ8efWjWDCJuLx+XR+6yvJF2W/A2BbtTtQ3wxoyC+fTxr?=
 =?us-ascii?Q?khUz6Bdszuts0W9lQl1ps1VnDqYMz4cZ2ltbebaUA1a7dqxt9/kNAu0WNIur?=
 =?us-ascii?Q?CqYFQmrhpF/Di1XRKLyFN5gsi8WH2xY=3D?=
X-Exchange-RoutingPolicyChecked: YGqEDDkB2vzNM+kjg3vGmHeluyjFZcwr+HmGoD3PB2+ksMAcg6/Pf3iDoDXX+Qi+GQUojg+yfrx3VtrYdfH8v41N1HBenWuIhusD9BbtixgDnmvCCaTM0Iju/MT97RM4nedzo3tMaqzUT3bWoju0g9F8BKVVxHmxf83Dy2z1OrsVf7MQ0nqgL5S8P7cHg3NfYN0Ot5xge2puVocuFOM5FIEXuyRf1cd42YTsxTJ2/wRecpfoP0sXzGoWoj+pNwlZ2Z4a/pCTNKbRpi97HX1O9zFjvSqQbkYCdvANCtO98JBd1FU3Q1+JS+flNcKykX9F2wt3OzqF3BQej6bPQY/8GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e72fbd34-8ba7-42ca-3bca-08df2b09129b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 22:10:08.1164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFfHk+xhZVmeizJ6qcgEJXZAowFfpqPm0v1jfGExvuYO+4nNg/AxRi8xwvdGC1nGHwBappSfvWDwzjBFVBdVnGrflM6nIF2PmlN/PaO0zlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Thu, Oct 15, 2026 at 03:05:40PM -0700, Matt Roper wrote:
> On Mon, Oct 12, 2026 at 10:49:04PM +0530, Nitin Gote wrote:
> > The "Disable NULL query for Anyhit Shader" tuning uses
> > xe_rtp_match_first_render_or_compute to program RT_CTRL once per GT.
> > On a GT with no render (RCS) engine, that match falls back to a
> > compute (CCS) engine instead, so the tuning is still written even
> > though RT_CTRL's ray-tracing logic has no hardware behind it there.
> > 
> > A CRI compute-only GT hits exactly this path, causing
> > igt@xe_debugfs@check-gt-reg-sr to report a save-restore mismatch:
> > 
> >   Mismatch on 0xe530, expected 0x400 got 0x0
> > 
> > Restrict the rule to ENGINE_CLASS(RENDER) so it only applies where
> > ray-tracing hardware is actually present. Every other in-tree platform
> > in this version range (BMG, LNL, PTL, NVL) always has a render engine,
> > which xe_rtp_match_first_render_or_compute already resolves ahead of
> > any compute engine, so this is a no-op for them.
> > 
> > Assisted-by: LLM
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> 
> Fixes: 8d8431298f69 ("drm/xe/xe3: Disable null query for anyhit shader")
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

...and applied patch #2 here to drm-xe-next since it's not dependent on
the first patch.


Matt

> 
> > ---
> >  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 514deded1163..de7f0f23620d 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -120,7 +120,7 @@ static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(
> >  	},
> >  	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> > -		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> >  	},
> >  	{ XE_RTP_NAME("Tuning: disable HW reporting of ctx switch to GHWSP"),
> > -- 
> > 2.50.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
