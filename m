Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06EECF9C5C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 00:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D1810E087;
	Sat, 21 Sep 2024 00:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jvoj0bpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311A10E087
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726878550; x=1758414550;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c5OXIK0nflQ5J7NUwcEA4a902X5cd3OsUA/dkBL4HEw=;
 b=Jvoj0bpQUczfFg2pjdB1YRQoeZB/7a1owMiv5493LqLfdikgx1PhRD5D
 cfZy56xs0J1prrEwaKKWLM1aUD/9TTrF7TT+9zOCHyK6JZUuQRe2IOax0
 lI1LrLiEOTE1+Z7BNjLNuCEScMs9IePMcEiIkscyrRxpdpCUr+/nPqgDj
 twUAxo0KhYPgGmIuFhvsHOU7sRPltOEmuq6/3fD7Dulb6D8WGCPmXztqF
 XuZ8srywiMTo3rQ8dVCe92wnFyrnjFKjOBq1r0EZcBA51OE276msriOAX
 FIIMAT4iz9BqRURBvL9HNRJdhVuwjtqW4V6HpMLi3jJRZQQdV7oqMLecK Q==;
X-CSE-ConnectionGUID: 5xuRqKiNQAqGklwEuIsmew==
X-CSE-MsgGUID: SVCDu/Z6Sam10AtZiBH6Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="51320726"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="51320726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 17:29:10 -0700
X-CSE-ConnectionGUID: NDu5t66pQfitvrLBqNj7qw==
X-CSE-MsgGUID: 0UqiEMPjSeGVMcYGdhLJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70751099"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 17:29:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 17:29:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 17:29:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 17:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqLFr/sOxzbZSNEE/Bsk0pNzuzxpIashsIQkUeIiwS4rEX40bkQ7KUzwceNwqKoCOWdcCJhp2FygQ1njqBFKL8qoUlzdvB3+U/Dr4lJhNp/PiNjatHyReGNoZliPLD1eTary2QvKUUkyEHFmCnhjC79Ynmmfh5uVa0NlvNCJ16o8AmcgA8T++MS5pGlKVjAOTyxDNBYIN74K/kcPRgtKJrOyTgGxkjCq+6THbwZyUH73TVseHisBtbJief77kdxi9+tdZeEyx+tFGkEfzSEdEk/Ur/ulN2veiXJEqjInejaQPL66u0P6HGIomusfdGxjE1mLdY7wNpHCWbvI9WBX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5bLmGvyxIcz/b8uk0QrMnktwxlli1Y2JmNY0yzy6T0=;
 b=RKpbIBav9fLBL8DKrmUJ3j6298EGe14es7KLRt6I9SpOhL6vCuVk3yz8zkGGzbvrcT9dfgrUZwfzfI5DxCO/QnEPOYdLg6ImURtMTYA1l6SjHkNyCHmlAiA/EfEH3H9bt6a8E3PzIp96AFqDccU1XsPMmTIhlJ4UIjaCmZSFwQ33VdJSmogB/ibAP8scD1lkFSqEJzMOHSfKDu3+zIR511rxtqSV0h3x+CgRQcgdF16TUIU/FoxaaXlyFQppPwfVSdaMAAFkk0OuZQHUUbGmOKaS9oY5VadeSUZ72riXmWqffodYrSecB8BtjpKtiJJNbhKinbojuvlLQonxBiPbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Sat, 21 Sep
 2024 00:29:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 00:29:05 +0000
Date: Sat, 21 Sep 2024 00:27:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>,
 <joonas.lahtinen@intel.com>
Subject: Re: [PATCH] [RFC]drm/xe: Introduce active ccs tracking
Message-ID: <Zu4S6LspFL2nsQkg@DUT025-TGLU.fm.intel.com>
References: <20240920133514.84426-1-tejas.upadhyay@intel.com>
 <wscurb6v4mzxoitxpb2mqr3olgpp5sahqssq3s6izccbl2mq43@eq2yo7txrv4m>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wscurb6v4mzxoitxpb2mqr3olgpp5sahqssq3s6izccbl2mq43@eq2yo7txrv4m>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b31e32a-a4e6-4329-8557-08dcd9d4666d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mop6TNq/+j3+g9cU76pQ4wWDwfCa3DT2crPaPRfc+eTx/Dhzd4EJRwn6hfGM?=
 =?us-ascii?Q?+Q+HotIkaYwymsMFxArEoa67GkyD2DfASPplEwlzLRDZBd8ruVKkJrzy5Sio?=
 =?us-ascii?Q?hWXwTY2bxey6T8mfih2iUowOgBLkbgBmI2QT4LzjYYvs7Pf7MK2682tBOH2h?=
 =?us-ascii?Q?gOECHVRKWrv+DOQ/7xLpmcCSGqxr5jtg46gWbeaaXB3mejAQmo8VKxQay64a?=
 =?us-ascii?Q?Xys8QEmL7SLJW+o1Peh+f5XTwuHyPyvet9oi2j1xqqvNNrkbW3YbYMhxkXd1?=
 =?us-ascii?Q?TOhF2wg3IbufxZIqZkI9Hf1SGmdVHX3DrH7TqEacMhhM6glJAsyzple7GISi?=
 =?us-ascii?Q?eSZDe8cw4OKgY81kgN/tYdDi890XiEtkuvvggSPNCG1MJxhfpdFu9bR3XjiP?=
 =?us-ascii?Q?RfgyTuaQdJEjx7fR1vMxCXQ3LpslhE8HbgUa79zMLv9t5CpadfAMBxnJbBnK?=
 =?us-ascii?Q?1XUSzkCP4Hcnf2h2kKWHhU9jfszE1PV6V9lYub0dfydFO/7jtRjJZ1pe0sPJ?=
 =?us-ascii?Q?osUunOD1zvwqLSMjQZ0B/8aJpQlAjdSO1TlJytCGj96XDubdB2sY66RLjn4x?=
 =?us-ascii?Q?a2hnxGcAmOE5OlqOEpPPaTOnXTM0Jd5iuE7vmrFCvlNpnA6sig5cPvFya4th?=
 =?us-ascii?Q?LBKVQV398rmgmLh9RENIdcHSV3+N9ACqm56IPmCE/UUaxTT5aaEAQkF+grWf?=
 =?us-ascii?Q?wH2hFZ/lpqaip8a63CEJflmqgCvENfAfckcDEWLXHna96tQ6pC4Nn7lrWyAZ?=
 =?us-ascii?Q?zwBIsctI+oAHoYudle8O/1DhvecDZwF4BsHCxiN2ft4dPIqVsZpqCCHIyHv4?=
 =?us-ascii?Q?ay791fT0LxY7UkXM6GraOzcEBgnEi0GwpuLFH6U/vDZAI1xCywy9Ghw9bCNf?=
 =?us-ascii?Q?ZI++IRye0OjH084aSPfELqfEhO5Ptau6rJq6CbcMUzlJyv9Xi34Y0CpDPd2D?=
 =?us-ascii?Q?89tDRPgE7r1+BBsnRW0tG5Ihay2sTNqtw9Jgq+irevRbtCoSG3Wp9l8R4KKy?=
 =?us-ascii?Q?63aGQC+iyom9kntooxqfFy66NDGj4gTxVlLwg2CArQTEKeU8NubfBx/8sRnt?=
 =?us-ascii?Q?SH40yg4RTJMuVsVJpWpG2euPJOrhpWq2AM/MB6BYFCuklh5Lr+5hmlNzUjJj?=
 =?us-ascii?Q?7rbql/iIFsfcSH/vknWyLJCVYR/pamulRqIFcqRCwLzmhOrUe3EUPWICDEk1?=
 =?us-ascii?Q?Yw2RD3WWEwrG72jXmonDSv6up8iubu9hhfJ/gqgmps2j6CgF0xlvYrcVy6Ec?=
 =?us-ascii?Q?F9zCQBt54M4KUMIVZ6QX6t0vXylgSzE8hM9UrJtnbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiO5LjH4pinrPbV3Q1guOFXWunqLPLAMn8m0IDUDq99fVcv+Tw0kgoSyLuHV?=
 =?us-ascii?Q?iumnByvwYUzM1oH6dOrZb26gW8h4HvYV2FNCo8LwDAJubz8JxJODO6zfXmze?=
 =?us-ascii?Q?vDa+pZbwetfouaJfagNwl5R3VTBbQf7KbK66Km/q/AgnQB7d2C0W23+OxW1n?=
 =?us-ascii?Q?vGwwoWom/ymM74uBnsR0ru54tgHwBipWRgvPN+TV4tcmOe+8/N3/uZOBGHVq?=
 =?us-ascii?Q?rBTq3DhSXs6CS0mMG1L9oGTYVbx6nok3dmyPb2h63xFYJsu+1a9GvzDcYPq8?=
 =?us-ascii?Q?xcZ/RBrMXp17x2eN6aokCDALJpmvT3HPFEQVbwRTQYbAteC0YagfXmebe/sN?=
 =?us-ascii?Q?rCfAwEk8eo46Pk29Vd8Jp5CGpJS9QnPMZrBesm/2LGdEfxC98o3mfWXocE2b?=
 =?us-ascii?Q?Y6mmmF+an4crXOfi1PG6h/OrSjA2k3KKcwkXkgCCYc0JRWnkRlafP+SvNZXt?=
 =?us-ascii?Q?HDYZdLDxWAXmrmTfXmbJ9H6BRFs/0HakX6aiiO2MUV/HPRNnOULYE79u1uew?=
 =?us-ascii?Q?gasobiJsDpjwkii7xFMHjgkmmyLaiakwH0FdlbdS+HS703qQVSSf4CoRrjhC?=
 =?us-ascii?Q?yKM7Ccn8pqh+0EEjSkQcIiFLcIcGAivWdYEkDPhuPk+RtahaOD7taWUwBWR4?=
 =?us-ascii?Q?54yUlNr16LCSP1kPEniiUtZSqd4myEvJ6LJd2yJ5qLIa9h04xROPsNy2PQP8?=
 =?us-ascii?Q?mg19SRydfmouy+AkNSEdN3Evodr6i30sp6Gs9svyCzyykoLSupQ9IT+sqXqe?=
 =?us-ascii?Q?NQTuOGvLOkKpL3Roe+CGZjsTUfzwb657HjorwsFlqxGVt/junSodgLylJRUc?=
 =?us-ascii?Q?KnXjBwJIk4ycZ70OUmnwNuYo0sOcwCRZh+WvTLBbMpLME/8f3vYpn1YTRQTb?=
 =?us-ascii?Q?bjH8bSH8bqUmWk/4jviwNOiaJkWJ4j+mB3Aj5yGbxuKsJzR5OHeOMqFGeJYm?=
 =?us-ascii?Q?4WE7Nx8vBcIJLlb/LZhfcoOhP0midW6elvymRUlVG/5/0znN3xJctpfADfZf?=
 =?us-ascii?Q?OMxOahr8sjKKZV6FiUPjFGVJsFNyuOkE29sSOpcwh4cSfa8aFQ9goVB8TmJQ?=
 =?us-ascii?Q?tsTNLY5LNs3WtKFhLYyARNIhC+JLXL9n6hKy1gjCVl9rTH2NlY+s2GKGDEzj?=
 =?us-ascii?Q?rAyak2zqnaeIRpwOQNv/oDu0vKaEyLEybasRQSIo28yupX1eMLJcMMfsmnDc?=
 =?us-ascii?Q?96hGyNRicE1oQdxJCN5GiNMfQsJq2c577pNz3U6OyXCbmu9/WIprqDrgvuJB?=
 =?us-ascii?Q?0mU0BBu35klwq/cu95i+n5+AQ+ezBzGsBmPc7mQ1memgyS+mqjgei5dtm2iK?=
 =?us-ascii?Q?aybj+C8kKA7q4UI/Zr3Kk46w+Mb/jqkB+vH8xW1WYCqMSm2UkneGpGwgAsBJ?=
 =?us-ascii?Q?aEVhQ9kKrreAXoUmvJz3AfqWgD6WHiFOt5IGY4Kov//YlD6bQNMfct5InAW4?=
 =?us-ascii?Q?07nA2wES9RIKd/h59HGSgT5RxcTehqdubRXXVLZPI0gTviozVIo+n1bTyj87?=
 =?us-ascii?Q?G4ZrtIkh3pVX03AB6wJioYW2T19DRbK4pR6Zt44B0Mra2/ojYuLrYg2zZH4L?=
 =?us-ascii?Q?vzC4G5UJ+2kOM2a4iZwGOIywRySfNLwZkE2dUpAlrqdh1FGlQ83lmUYUz1bL?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b31e32a-a4e6-4329-8557-08dcd9d4666d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 00:29:05.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QihNhTFRuDml962Ewz8GSTKRrjkHeesVohPUMvebmk3ot5z/YVnLdCR0ZDQsCNLZPVjYccjngowA3FJZKHq8qw==
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

On Fri, Sep 20, 2024 at 08:54:50AM -0500, Lucas De Marchi wrote:
> On Fri, Sep 20, 2024 at 07:05:14PM GMT, Tejas Upadhyay wrote:
> > Current ccs_mode setting is allowed when no client has
> > actively opened device. Instead it should be restricted
> > if there is any active ccs engine in use.
> > 
> > Closing device fd is always a async and may lead to show
> > client present even after fd is closed from user perspective.
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_force_wake.c  | 3 +++
> > drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
> > drivers/gpu/drm/xe/xe_gt_types.h    | 6 ++++++
> > 3 files changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > index a64c14757c84..51ab8e5dd583 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > @@ -195,6 +195,9 @@ int xe_force_wake_put(struct xe_force_wake *fw,
> > 		ret |= domain_sleep_wait(gt, domain);
> > 	}
> > 	fw->awake_domains &= ~sleep;
> > +	if (!(fw->awake_domains & XE_FW_GT))
> > +		if (gt->ccs_mode && !IS_SRIOV_VF(gt_to_xe(gt)))
> > +			gt->ccs_active = 0;
> > 	spin_unlock_irqrestore(&fw->lock, flags);
> > 
> > 	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > index 9360ac4de489..dbc49d595a6c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > @@ -69,6 +69,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> > 	}
> > 
> > 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
> > +	gt->ccs_active = mode;
> > 
> > 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> > 		  mode, config, num_engines, num_slices);
> > @@ -132,10 +133,9 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> > 		return -EINVAL;
> > 	}
> > 
> > -	/* CCS mode can only be updated when there are no drm clients */
> > -	spin_lock(&xe->clients.lock);
> > -	if (xe->clients.count) {
> > -		spin_unlock(&xe->clients.lock);
> > +	/* CCS mode can only be updated when there is no active ccs_mode */
> 
> same question as before:  what happens if userspace cached the available
> engines from a query (like it normally does) and then decide to submit
> later?  CCS being idle doesn't mean we can change it. I think what we
> really want is to track the userspace clients (i.e. ignore kernel
> clients since those don't do anything with CCS, but probably add an
> assert somewhere to guarantee it).
> 
> AFAIK it's not expected from umd point of view to have dynamic
> changes on available engines. +Joonas, +Matthew Brost
> 

Certainly we cannot be changing the engines we report as valid to the
user.

I think what Lucas is suggesting is correct unless user space queries
engine before every exec queue open, even then that could race.

Matt

> Lucas De Marchi
