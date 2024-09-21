Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5D6CF9C5C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 00:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2110E087;
	Sat, 21 Sep 2024 00:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Maqnx14w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDE910E087
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726878357; x=1758414357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aHv3so5yl8lB6JYRooaDPD/OHmoWrzB4U3xgSvAiRU8=;
 b=Maqnx14w89kPu6H2qouU5aDYz4qocgTuPfKmXUgED4nZTwCbFHxYJV2n
 c3U99fNW4Etv65ZY1DXV3Q2IDy6G+bdOLUf087rCMPYq9kwyol6E79Xq8
 EsxTBZ7fp2IcsayrwixXK9Y8fzZ3cuJ+EXH1K1y9n7+btlT4e9vgRA71k
 3TbieFhH659HAM+pnzIxLTRIlut+L02em15ealBMEgecNiV79NF54zcFX
 1e2qwpv6lC1l+rgWpc9i3dGefwvT/kvzGmSr9uYVwJWRIPaAcBNN98cWh
 KNDqS9aJg6CUVhn1hoqxPt0Ar6634xiBL96LFhc7cZ0J3xye6kzmOGzH9 g==;
X-CSE-ConnectionGUID: tDPo69b4TK6fFHdJ5fOXRQ==
X-CSE-MsgGUID: q4Cz2cwWSPaLQOEcL1xMzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25773409"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="25773409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 17:25:56 -0700
X-CSE-ConnectionGUID: wxJ2g2UeSSiy3cfs3lcOfQ==
X-CSE-MsgGUID: tnKAad6qQ6uHz7PMbLFq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="75234834"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 17:25:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 17:25:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 17:25:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 17:25:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktm5ZouGZH3ZYXovzp0Mj7B5Vh5uoI/kFYvztREw6CE5L8j3wQ9XkGMzj/lTqSxgwQASZphT/vpP4RwWP8tXzNj0V3Vop5osYjm46I7d0PAdpo9vcaQaJiCPVl+g6nCEvIv5n08JKfwNIayIq3zuQFihAIYE+bQz2Hn+85X1f+XHstZjac0Mq7jZUkYYhlH//meOeenkuwMH31Ob+2MSYdfhvTtseQorqFQdNJQQmZjLX8UwGR/TrXNo5qZSqTG2WS81Dpj9ez82E0F5PYy4lbW5A8tBD+DlCkMTspmYQZDsqhFFJAmIeAuNfJfRpgHMW4i1IKy2J3IHyZDpCFsvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhlTALenI9MWl4eo4gtxKz/jD5LeDvyesRRKP/myzVM=;
 b=Bw5ElJgsThKGR5/uvTHqN+Q2gAvjG4S1U0Y3AukunZPTmyKdDMF3ZP8qrMVsGVja0VDY2q5Kdckbk/goY7YqECtFuSpYYp/3uHhz29s6ABhtdgHNmk+3Fq4AM9Ivl3Ccmf4DwVeOQbbSlQkeBUM1evgmgqE3T4cJs4HYpdTelrweDF2pp5jiuXT8ttLiTGIAggaRJzvDcrXj1YUeXwcd2C7bj3Vl3ZeNV3XeTmWOYrEoJhJ24Ysotf/kkfv/QYExrkD8AFb1hliMvRNWQkiPM4Ie4oAA4TnXpbVsgQDFrCAWSCg46Uo4pTgAiZeYY0VMhTw4gnLSs4RYl39KyRqI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Sat, 21 Sep
 2024 00:25:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 00:25:53 +0000
Date: Sat, 21 Sep 2024 00:24:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
Message-ID: <Zu4SJzsF5Tg6zLyo@DUT025-TGLU.fm.intel.com>
References: <20240919224220.1325739-1-zhanjun.dong@intel.com>
 <20240919224220.1325739-2-zhanjun.dong@intel.com>
 <f9269ec3-dc9b-4863-9e41-e7a9946d9e1c@intel.com>
 <20240920214456.GW5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920214456.GW5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f17d50-5750-43e5-3ddf-08dcd9d3f3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b//dPovqmbSVlq2fpMNCjfpltKf3eRXQ8azXzuGiSoIKygtEIX39dGUNGp64?=
 =?us-ascii?Q?VHaiwaZ/ve6eiReOwGSOb4dXMdQe8nbWamvYnlFvVE8ZK+uzdNFmQyqB+H/A?=
 =?us-ascii?Q?6hrBShp3NKHu+PmY0J8mtzlj8yu95XBSz6CgkLuhfr3UceNusEL1TxICZ29b?=
 =?us-ascii?Q?2bpctfsCTECYFejFSYP5QYV6t43Yg+JKutPP+WrKruq3A0XCJfFuQghdKq+m?=
 =?us-ascii?Q?wxgEs4RDnHsANxBuJsXiYMx96yXSnwWxZ1YFtu12Z/xOPrC9edh34TsFHOXq?=
 =?us-ascii?Q?O5SJiN3V/XbcjDiMz0SvXL5ibeb6+l5h/tauJ/bF7IIxCZkC3DBg3pCeOGMN?=
 =?us-ascii?Q?g9yopx7iRFt38rr8PBAzw2bWvLjNc/miQ0FYSygOdM+T1+j8LmIAN1lkETGg?=
 =?us-ascii?Q?v1JKEYvHbbNSvrP3AAuZWMr/r7L2hlNKtJvmSoyWbU/tqDkJ9iqfLzNIzMlB?=
 =?us-ascii?Q?AlhjQB4b9VwZ42rkh+3RpqZu70hn0NKW2CefcX250zHsbAVLJYTZ7j7R7Tpm?=
 =?us-ascii?Q?yh3CGcRkHQ5Bn0TiZYdHUR2EoQH6DdFdfQbtTQenUfJoBpINGZ9S924me6Wk?=
 =?us-ascii?Q?wAb2IDAJvmykZJ0fHVW1pGm1dCNW9u13oS98srLu77hi/TgW92eX80l0Ecra?=
 =?us-ascii?Q?/Km+ewVGrIh9L8WAOM96D0IRDJ4bnwtjNejL4Hemw/GbJ2xzdF44O/S587qs?=
 =?us-ascii?Q?/OUlhTGcOf+k/QBp9ZKcMzhom3n2VAv9b5UYViB4nf3/V58QmsR+p6puasww?=
 =?us-ascii?Q?1gIgYKpB81GWRwKCfpW1n4wlNSq4paXQSQ6FBbtaG44oIBHJ86SwUDw6xmtt?=
 =?us-ascii?Q?+Rkmgf9ujg8rlfwnLlkGYbbIWwh9pLVtsIie34nuQOEoR6QndDRHS9+pkR5N?=
 =?us-ascii?Q?Gp2aqWZZVIzpsG8hbGf3Qu8EeSWFirpTIeSuHBEKlAshBsx4cZ1FtJl9y2XJ?=
 =?us-ascii?Q?WwPkkYsRJ2dHbim/lRwJMAnIGXADXDwhxMGZbfWcBTuQteuIepVsK6NYGZWd?=
 =?us-ascii?Q?teK4p/4r8l+3Ytiz3nzyVPFpV1BfMuFVCD5v4CPCvHbt6skhfCQ3XYSm4zqf?=
 =?us-ascii?Q?KT91qE5ApOuWzMo4EL80++lVwe1LarKcDUttdT9DTFA8VmHq/asRb2+R09fn?=
 =?us-ascii?Q?TLyfndtFj3MvdnIq7jpy+TXOKeLSp3ayp6lJM1Q2neqHDGE3+KQS4a1Eqtpr?=
 =?us-ascii?Q?j/bp6RpXQzV/v2p7liiwOiPmxWjeLcgcZ4ZPQAT0Q6hR6MOIul6/UIMzqu26?=
 =?us-ascii?Q?hZi9h5sIK/9SAKRiofnH9nwKox1W9s3DsMFvrowx0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/olFHH61/H/B46C/vEHQE23mPpGl7/iyPSdpAvPAlAcW8tuuFPiX+m32J0Ax?=
 =?us-ascii?Q?WycC9QK+uaB2zS1v2jY4v8p65dSrG3xu+jo51D7qW7SFPwOE1HpIOvrMxVYN?=
 =?us-ascii?Q?mtMCsVPN7FpHSM1DOVBgBSb0+8yzNS1K+w+2oKC+OlBJrsO5/LzkaZQy5GyF?=
 =?us-ascii?Q?Qp2eY+85HMY71tJoJWzgDrW2RKjJmrz/ubdkt5kbtY4AQAX+RkT0y0ZC05DJ?=
 =?us-ascii?Q?NZDuKpZKktU+5eymmJwiTPchFlvfRrlpqA7lfaETQQEtcpTiCbpah1Ma0vtD?=
 =?us-ascii?Q?vkosGZBebuG8vm5o8VhYo0yxeMrkZ+NNG2xW/W4SfZVd3h9DNY9DD9walhJP?=
 =?us-ascii?Q?SMbQeBzJptqrTzpOcBUWJcupXrE4ZledvR/29xz8nC/5DCFQNpWELbnBpPn3?=
 =?us-ascii?Q?Yrz2PojwHDGLprQrNnSFwa8G0eGc4p/kCHUJN85VFfVx1VgdE20Y79DQm+an?=
 =?us-ascii?Q?iadC0vjFFqjr1xZ8TjP3c0iXef+25yuINt95XNu6ZyzRtGHszZvNdrE8wJAm?=
 =?us-ascii?Q?rgUQ8M/mFAiaJIxdWCrwSwIh+QYNqlPhDpfoVoOzWbMXXTmgoOxBcCW6gq5T?=
 =?us-ascii?Q?vnkjlwi1Aqdj7UfZMU+Izr+5QvGohPRmf8Ig1zKaLo2+E+bQMc6E+3EMlJS/?=
 =?us-ascii?Q?lqM8juLbTSyejWKNo3VmmYVYaiYCPGuxgWVYg11UqLg8kGR0QLSSgPw2Jwd7?=
 =?us-ascii?Q?lko8Il0VmaYVwtpI9XvFVz4Sk/EclI53fxR9tY8aN+4fjqqKkiPpPXbL/0Oi?=
 =?us-ascii?Q?GXvtnvUsx6/ITkYqkVTuxTKJChjH9OicMH6E8bkDrJg4Oo2LhBB05mRyw5tO?=
 =?us-ascii?Q?EmhMSWSRFPayrzuq6T7kda8UU2kLToJaW2Y5D9MWSAdM1C7myKmynXrrVceB?=
 =?us-ascii?Q?1yvmxRyPTHIH1Haf5/Zh4IdWlHcDPJ07PrMoIn8umyh0gwdpGFd4/lwZFfz+?=
 =?us-ascii?Q?gIAW3T6C+NefElnxyr6vDtCyUBrNtfQhu3LMEL0/6g/Rm/GYFcwLEUpgEp4p?=
 =?us-ascii?Q?o3eEBkI+tWpLGJLcP3FjgUIhiJ+0vKGpi5GLU64HKyrcLfS4gE1mt/pBIyz7?=
 =?us-ascii?Q?dzuA8SVWxh+NAi1jtMwGQvdNeV6kKmSwnJTmpuq4uOfogPiyO2fiCD8o/qla?=
 =?us-ascii?Q?3pFyIcHqjWASjEcYaIT5FzNHiV1p7O6Ujn26094HhKNsk53mO5z8gOVF6lDz?=
 =?us-ascii?Q?U+yjxje+Jzpk44fuwNueqa9f2xOebgs6fUZHMHPl8eMkosiR+dHCtaiyYg+9?=
 =?us-ascii?Q?QNFYlu4qO2uc28x5ZU0Oe9zkQy1t/0r1hASIWRUeVNAq6/HXAEW5dt7/yOGb?=
 =?us-ascii?Q?llyrQB+7cHjvDpm8fgyj3dNtmfg1TykFn29EIRQvLozA2FlyrXHyrSfDN6fm?=
 =?us-ascii?Q?oAcqpWhmXESkQWus/lIrQPDU4WZz5ZcEu92sKsN6nfRqiiXXWy2b2BzqMDpo?=
 =?us-ascii?Q?iSSKucM1H57aPg8rEbc/RbIDZWrI/2dahtEYTAIH3Nuc3mQAuxxdOuYihkPK?=
 =?us-ascii?Q?uIDKgBcO5+oZFCf4pXy3glYf3utC3oY7DGQFDwTvCbARiAj6BRgWrysnJZmN?=
 =?us-ascii?Q?9rCy5tvqOfRdgCWaoNevleiofBiUhhSQcWWdgQunloIjJ8kXza3DxRNuRZbX?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f17d50-5750-43e5-3ddf-08dcd9d3f3e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 00:25:53.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjMTLNOXaRU4ffaJ2zPHyw364CU52wd6qYozHND4BzXRWF2t0k2vjVFG9fbGjUPvS62d558EizsoPz7BBTW3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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

On Fri, Sep 20, 2024 at 02:44:56PM -0700, Matt Roper wrote:
> On Fri, Sep 20, 2024 at 09:58:14AM +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 20-09-2024 04:12, Zhanjun Dong wrote:
> > > Update lacks source flag to include resource is null case. This will
> > > prevent null pointer derefrence in xe_migrate_copy.
> > > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 5f2f1ec46b57..5e8f60a8d431 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > >   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> > >   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > > -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> > > -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > > +	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
> > > +					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> > 
> > 
> > Just for curiosity, isn't !old_mem implicitly taken care here ?
> > shouldn't ttm be NULL, if resource is NULL ? IIRC, this was what Thomas had
> > confirmed during handle_system_ccs implementation.

This was my original comment too. 

But I guess we do have a this:

 673         /* Bo creation path, moving to system or TT. */
 674         if ((!old_mem && ttm) && !handle_system_ccs) {

Which seems to indicates !old_mem && ttm can be possible. So I think the
patch is actually correct? 

> 
> Drive-by comment:  If this is an invariant, it might still be worth
> adding an xe_assert() so that CI can ensure the condition never gets
> violated by future code refactors and design changes.
> 
> 
> Matt
> 
> > 
> > Thomas/Matt,
> > Can you confirm here ?
> >

I'd have to dig into TTM a bit more to really understand what is going
on here. Thomas might just know how !old_mem && ttm can evalulate to
true.

Matt

> > BR
> > Himal
> > 
> > 
> > >   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> > >   		(!ttm && ttm_bo->type == ttm_bo_type_device);
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
