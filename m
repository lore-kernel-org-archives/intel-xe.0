Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E3CC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 14:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251A910EAB1;
	Thu, 11 Jul 2024 14:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv08HiZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7171D10EAAC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720709877; x=1752245877;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XCe3mQr70BWcZ/c60GS5iLWSycKEoa9pQGVYV3Ryzb0=;
 b=Iv08HiZui0FA3+Zt0LyW3ZH4zdGTYJ84GMF7FozWjxNimaYU9hiX9KGF
 8wY3InijGoRRE8HuAPxg09TyWCvnWRuKed9B5yxla1gBsE2a+qOqry8Eq
 pXRwVhqf1MTuUIrpCbvnUR9xuIqVF8VxL0C9jLEHkAwiwiUUxpHXAPE4p
 DvVl0/4zbLoOH8O2sfpu+2VE6VFanWv6bJjr/k8QyGU+4uR4MGxCFF7cP
 cp8kex+nn23X7km2xww/o+qKMKY8nmx7Yy/7kOpzdYGwaOR20ffH2PINT
 vUk2Fw0zZuQOYj/Od0t1wwBkN6ZPvb203WAZ4iaa1+EOTL5xAODvJYoVV A==;
X-CSE-ConnectionGUID: 9lRYtItCSlOpr5ZpTl9OgA==
X-CSE-MsgGUID: UXJ9sULOS1eP8P8jaqHAdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12500748"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="12500748"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 07:57:56 -0700
X-CSE-ConnectionGUID: 0gxU1+POS8yApM/vttqdMQ==
X-CSE-MsgGUID: yVoSKdvRTVeRhgmEN2ZplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48563280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 07:57:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 07:57:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 07:57:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 07:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1kLkiAKnike+8ikF4A2B/j+2+3gqBeWXTjn3h+rt9MLhjZ83enMf7Cg33X+3qnM2hPL1HRenle3aU0IJ09/2ZfNx+Pv7hHhngFsrHsefXn0EIMPn4Go7Jk2PzccLy7JjNwJ1ccb4Xm9XcotwPvgaVqzAvcA8HTfdyEkBlwtr2QFTeTo+c/+EQHvPtCFY2iGo1CX/IlAlutL/8lEEiq8A/ooBF3ejw4uXn54abFhs97CbgigJ872KYuf3Y+4WxondBx9QD74bFKfZZlEhwz57eC4oG5U7zfNXkiHbPazeLZKgwS594pKtQyaah53gxTE0eoBEBailT5uK9lyfe9xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKsNLaFipDHt1oJABXCnOOgh/YdhDyH3qalhgLQjRkQ=;
 b=iR8CG9CDk3cYQJwmRPME/+fbRsYASCqmwCCMI5aWbcqfHIWx1T3aAyLm3mHswkTIjr9mhNmz5l53/oLSGJU6N0tY8j+8/OsyXuVURaJhRJ3hUqU2wW4lpSywMP4BpUMagm7ioSxfFxCssCegE7nBqudmJz8M8tqRM9yQsOd2T+hGon/04N53XecxElnjtk3nU3jz80cAD0lAnVrw+XAGBzK/EL/K3qd3eda4BJLmX0UDUiAIoGeyO9r1zX0vSVzrx4qqGKkcXSu69gzvPKdt57HetMx6YDEXUBso9/2SyQCZJZfWoBTpRFUU0T6mRTdYTg4NncK6A+gjEPCcha79qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 14:57:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 14:57:53 +0000
Date: Thu, 11 Jul 2024 14:57:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Add process name and PID to job timedout message
Message-ID: <Zo/yvlpyIVRHusqj@DUT025-TGLU.fm.intel.com>
References: <20240710213149.57662-1-jose.souza@intel.com>
 <Zo8cMyjffKq3mYJo@DUT025-TGLU.fm.intel.com>
 <03e127ecd193ea405a15c144f3adcccc226fa0bc.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03e127ecd193ea405a15c144f3adcccc226fa0bc.camel@intel.com>
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 707402c5-01e6-40ac-e030-08dca1b9d704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Z7bLG2D0i2P51xsdW3iLxE+wFwYYYlQ16s7Kc3eECTz713OeHfUlaKqkwA?=
 =?iso-8859-1?Q?utn+hLuO3WkH3jjlqIKIRencWdCqN1UQJ4GZ8GVKS9qNTkBtFJW3Rxb00E?=
 =?iso-8859-1?Q?Nu/6Iq7N4Bf/bc8dLCs/e1M5EKIxuGbsFVOQtKILq6RUTKY3EN2QvSXBzb?=
 =?iso-8859-1?Q?o8rv8Ky64AklDfHL/aY7bP8DdrPyPv23szU4OuXcYNE3z3MWbtBGAfKBkV?=
 =?iso-8859-1?Q?E4N2n1tVP4OwWok/9dvX3WqCATQzoYY98vOn+UiffACUtF4u3shBLsU+ix?=
 =?iso-8859-1?Q?r8AmF0XfVmg949oUJPWhnTz3JIjNdyronZxtZmK+qS3YuGhOV3F19m7qxK?=
 =?iso-8859-1?Q?BfkkD+2UR0OgWEo0tD/cQiAVUYfO/81Awh7c0k9HlXy9DjQ9hZtg0XwHvH?=
 =?iso-8859-1?Q?R1NvLflx8G2OqqazwInAd3/mtHeSaUY9w+KHCy9NHREyJqTIAcsBN8+aqb?=
 =?iso-8859-1?Q?2RHm4NZnFGfsD10orAS84ObWjjtDNRIlLq5bubfnXSR11+5LpxE+qCpjOY?=
 =?iso-8859-1?Q?i3zhon3VemwsQLzVD0HH5PPm4laCynShVFFx+GEApety1mUEspHs7ILGiC?=
 =?iso-8859-1?Q?WwUU4MtNnIdw9FnuzrSMd+dDdRSW70dF9F8UPNhaHqwuN/1PICqtMqy41O?=
 =?iso-8859-1?Q?EFKHQV4o1ytXVX2N7v1GsP1+r5J4D93wOcuFgRxb1Uhdz4vrVslqElYcs8?=
 =?iso-8859-1?Q?SvxMc+snVWuGXyxxCm4VEZ+1ASgE7AoRfpRicKS03ZAXYJt3prqGlSHBWc?=
 =?iso-8859-1?Q?pndHFWlG33RF7uPM6g9rlEUCZEl/TGxm6pLWdUJpNTpiLfvUQQ5s6Lzq9j?=
 =?iso-8859-1?Q?TDdaA+w23xjjQ9oplZDStjbj1gR2OhLi+FdWGosD5i92yoeT2oUePCAydy?=
 =?iso-8859-1?Q?hzCLurosD2HsxxMR6nUFerT7yrVGXA2xrm++ul4GPmXEm3rvoB/arL5Ji3?=
 =?iso-8859-1?Q?R3TccNvdYiuspz/DrhH2t+UpPpiZ1EwPWGma+6747SNEMgCRc2Gp5isWXI?=
 =?iso-8859-1?Q?Ip3eQk/p5bDm2ueR7VscUPJOwwu1jeUHt8frrB9T1D5bnROl7ys5BeKHiM?=
 =?iso-8859-1?Q?9a3qbtgYv67tlVGp25OOHmNqR90IxdXhnd5virGg1rFHXmeIYW5Pzcd2vJ?=
 =?iso-8859-1?Q?tuRI2/CJoLvRhiqyTeAsdrjFrwOHDePFk4z86MTNGRYhmvFE7zMPvhyitU?=
 =?iso-8859-1?Q?HluoSXK0Em2ihEziHH1muakEZrn1TMlIGhxNqZ6iZ0SKIrylsBbnHlJVsp?=
 =?iso-8859-1?Q?JZQCUQrukehFStZiIDA3Y3xWiy0wmDmfJQyX5boZDRUI9nFZ94VQgCY1G1?=
 =?iso-8859-1?Q?aZe7DO35jXOYOC1FApNMirqj/Gm4XI7PNCnTkT4NfziLMD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rZkZlKVRSuruNVqkqhqqLrzbVJUaIGyCj5XTP6fDM3BKHyS3QhPOwB7C6u?=
 =?iso-8859-1?Q?6csPkMVLkk/abrZwstwt7sxkLE6O/xJaStHVmXYnKywY2hECz8WaDJX98k?=
 =?iso-8859-1?Q?9fFnQGGtqnvZwMehio1KK3ylxSNhsTcpvZtL1M49Mtm2NOORUGoiWvg7iM?=
 =?iso-8859-1?Q?J4xRrCJtWSYbmZ5CppcEU41Y9HxcKYtCxNMPJpMR2qUWuh6p1JGp/VHtKN?=
 =?iso-8859-1?Q?Eqr8BkgjTg4mUZGkeCGIcqJcVjZoHVICAzd+kqWgTc+gNOixd78P/XPuck?=
 =?iso-8859-1?Q?ZRymcADX85Y/KlnlhJnawDDfaphQQ1ZwhxliwXcE5gzCbYtXFx1A4Tq+l1?=
 =?iso-8859-1?Q?w5aKdFuxEqzAdnrt71FGNWM9pNgCbTUhyPxWLqXrP0uNUmHCHfhBCKl1Lh?=
 =?iso-8859-1?Q?uFucyFZqphdTgxUHFNNK3R4k3oSVQ54cL0OImqaNJGhNWn9hFBUM+Hk1dU?=
 =?iso-8859-1?Q?cnwRKKGCzk2LBjldkKi06lt2WzFXzG0JDW+4fNv+tzdb7dDKNLoyA6+plv?=
 =?iso-8859-1?Q?+TL7CIqtMY70ewgjuy1VbIJNw3PT/z4boA3jV/Cu8mlUUJw4GrXsBXoWdj?=
 =?iso-8859-1?Q?tIkj+0GkOOOpBR2wZz9hn1pDFIQlUpZGKtAgz+vE+ZE/y16w9HllcpR2wo?=
 =?iso-8859-1?Q?WTOABixPXHWFx0HiD4vydeqApBB5hZYvgq9RuS0DTNnHWJKn8OKZuaTciS?=
 =?iso-8859-1?Q?dqFKHf/XJXIM0xohlvvs6E5ju2Y+AP4Ot44Bih5NJ4726y/iby8IP044QO?=
 =?iso-8859-1?Q?gd8E7rV9mOU9Vd8t03iEQWr44WcIKR3ixsOP3jgVj4jZSEuZhnDwPF82Q/?=
 =?iso-8859-1?Q?0jhCidappw9t8+DyKjjLOo1HZEB1Ebq1E5B8hKSIT4eDDXG6LwKoJa0hs0?=
 =?iso-8859-1?Q?VQ1cFZz5fHTf42JK7wf7fJKaGGH2wuuEYqGcAty504JFFb/7GatOts38vu?=
 =?iso-8859-1?Q?Qj7YrLIT8nOHeD49M5Zm7k07tiA1drchQ8EGITtpR3xJNleIgkg3MRaWN4?=
 =?iso-8859-1?Q?N+tAUJ03ixpun8PURcuh+vRlScslzgW84WMuq0QYEr3mHThOgJkh7mUA5E?=
 =?iso-8859-1?Q?ijAGFi/mPw7GrY3WCQpqnhEUiBIQpkCkYzvlKQp+6E1rFxr4/Rrz41sH3F?=
 =?iso-8859-1?Q?V/uaRwjTheB70q8bw3qevV2u2eEpnfQMbqM4F1gsS5iKiinRQeuq/dKDMF?=
 =?iso-8859-1?Q?vGvhnlD+kefp+Z7MjeVznfxsXtYauay0z3uBlRcyab5ZBlv5GqyYZj42v7?=
 =?iso-8859-1?Q?EdDmcx5BbkFec8+fp8mu68bmx7B9EgCRHipKCO1cWPTJw0Q9HfdeZ4DrTu?=
 =?iso-8859-1?Q?L1U1JCuxNx1rdFQ/UjgaHnQrlj+xdrz9vH89dAwDfH3lvxEo3zHxh4LqBS?=
 =?iso-8859-1?Q?RMzF6kaMIAvCf3sdTBso8J+QIvilxyhPulydgJ9QrdwJ/6qr4CztTOG5EZ?=
 =?iso-8859-1?Q?U9Frz4aO+aYsq3g0h+jKRoJ6/tJ+35fK2N+6XYVeEb2s/GRxtuiIKKUmaC?=
 =?iso-8859-1?Q?Y+curSQfC7qO1mJQG1qfBURxz/zPofdRMM4Givy+QACpANVRoaJCcMPuxB?=
 =?iso-8859-1?Q?wTC9A36GVD/12kVtSeCyN3EugBx89nv/b2x8mZz7VI1vdUCshtAp3o7aVw?=
 =?iso-8859-1?Q?46ED8/HxB8cFB23Q2UxidoZUW9SOlL7W0diMM2HRsHaCnvAJNLKF8y8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707402c5-01e6-40ac-e030-08dca1b9d704
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 14:57:53.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR/MAa03IJ1BkPPc+4fwd6F2/IJ2LZev3fwyM31Xc64DvuObGc1x4yIp3UOR8rmWLkwMw1us95ChgM9XOrIhkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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

On Thu, Jul 11, 2024 at 07:35:43AM -0600, Souza, Jose wrote:
> On Wed, 2024-07-10 at 23:41 +0000, Matthew Brost wrote:
> > On Wed, Jul 10, 2024 at 02:31:49PM -0700, José Roberto de Souza wrote:
> > > This will be very helpful for Mesa CI, where it uses PID to match
> > > the exacly test that cause timedout/GPU hang and mark that test as
> > > failing.
> > > 
> > > Also printing the process name as it might be relavant for human
> > > readers.
> > > 
> > 
> > Always for adding useful debug info...
> > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 6392381e8e697..8604055271156 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1060,7 +1060,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  	struct xe_exec_queue *q = job->q;
> > >  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	const char *process_name = "no process";
> > > +	struct task_struct *task = NULL;
> > >  	int err = -ETIME;
> > > +	pid_t pid = -1;
> > >  	int i = 0;
> > >  	bool wedged, skip_timeout_check;
> > >  
> > > @@ -1157,9 +1160,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  		goto sched_enable;
> > >  	}
> > >  
> > > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > > +	if (q->vm && q->vm->xef) {
> > > +		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
> > 
> > We do something simliar in devcoredump_snapshot.
> > 
> > Would it be worth while to have a helper like this?
> > 
> > struct task_struct *task xe_exec_queue_get_pid_task(struct xe_exec_queue *q)
> > {
> > 	if (q->vm && q->vm->xef)
> > 		return get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);;
> > 
> > 	return NULL;
> > }
> 
> I don't think it is worthy add a function for just 2 lines of code.
> 

Typcially I agree but my counter here is we did have a bug for this [1]
so one point for this logic might be better.

Anyways I'm not going to block this patch on a bikeshed.

As is or with helper:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/596388/?series=134265&rev=1

> > 
> > Matt
> > 
> > > +		if (task) {
> > > +			process_name = task->comm;
> > > +			pid = task->pid;
> > > +		}
> > > +	}
> > > +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > >  		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > -		     q->guc->id, q->flags);
> > > +		     q->guc->id, q->flags, process_name, pid);
> > > +	if (task)
> > > +		put_task_struct(task);
> > > +
> > >  	trace_xe_sched_job_timedout(job);
> > >  
> > >  	if (!exec_queue_killed(q))
> > > -- 
> > > 2.45.2
> > > 
> 
