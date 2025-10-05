Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9B7CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 05:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B63910E03E;
	Sun,  5 Oct 2025 05:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zy6MgdJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C02310E03E
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 05:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759642998; x=1791178998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbQcv4O3wkXV50U3/7jTQ2KnIUUG89spVoncjeKb1Wo=;
 b=Zy6MgdJed6DQcNTQwNgYagMYSLKmrhzJNKM52tEi6aypPBI47iqeZgyo
 WOTExlTZ1zGHFf5lV5hxpKKR6A3/PVXFBe/2BQNslo/p/TuWQQ5XaD/rW
 yYIAoaC1rocYOSFLwFAk6+iAGGsWbFkzeQ0eO9svEc6dflXumg6BvUR6+
 KoHgc6oX+3eo/L5m2L82jBhZaVM7h0Np7bFftAzRwmG6Bcumc9uAd49ZD
 LiL7ki5na1HxDug4+zoXjNkEU6h3jhFRwmx39R0riRmdeAFtkz6NHArWz
 TtRIfVMnTylnDy1q4JOzjbJa+ENxONbnfbdg5zvyZ12lKsX0ZjjkDOLpM Q==;
X-CSE-ConnectionGUID: OgUVKUBWREqy2bC702QhTA==
X-CSE-MsgGUID: neQTgkdjR9GX5tbYq17uzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="79506992"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="79506992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:43:18 -0700
X-CSE-ConnectionGUID: zbPD9o9HRPmqLjs4QxQduw==
X-CSE-MsgGUID: TwW8pkFCRtCstx4qqzff5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="210580039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:43:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:43:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 22:43:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0Stcjmsb6PvFxNM36iEjvikP1eOM66PS/7eQNqKBOv0oPFGKbEeRCLqZm3Uu3BgByxyciB3MFpgFF2X44rBoGMYHUr2I9BKw9fdSSz6TyJCtiAQb8nQBIVrMT0Fgqu176OtvCGCsfK4lw2h3KdxAwokvxDOcp0yJtSP2koSDGKmW/LhuZ0pq6kqi2HCC8rPD5kRdYxgj0/7O1SJBSm8cn/pBPPtA+ZvuoRppQ7ABBzLhEenDey+0JwshwaeoSMRiu0ReXUYNfrS/5ARtmBmKsmbMw6AmJtl8YrWTUP+E2upPGZuhVQmsWNyGW8vkAy9AcKq5AQUtUY2FUlpgQNCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIuvX5VXsSKIAGWVm6Jmz0FS1yjUFyG6FLW+nwpq840=;
 b=GmDqSx8E2NBlubSP72BgYgIwYXCdpJuzq7XbiNZPpdy8LGafZl7NqVm2YzQf6XIbTVLfdmoWrGDbUZ0305MU9+xXsVfDJ6ZhR87jeP+KP+u3zM5ipk8Mf+HM0U9I7waY0qhhaM0TIQzTje9BxTFKhaHXQmNQjpiDVZAr1v9xuE1yidgrYmAXFoxKNCIkkYUr0ZGL8vda9DB07ntxIq4gcKXCyiosY//tCjB5/NYviIa6A2Duo5h6YO2/Qudy9PuSx18jSHecnn6btEltcOEBlq0JYIvfv3b+PaEfmnWDqmKcs5TUFDUWOIC1f1XqNcsHWc0WE0qR0kRuRKRlu96mvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 05:43:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 05:43:10 +0000
Date: Sat, 4 Oct 2025 22:43:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
Message-ID: <aOIFbDzuBWumEbVp@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-21-matthew.brost@intel.com>
 <ebf7e2db-b166-4a60-b80e-ae95f063142c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ebf7e2db-b166-4a60-b80e-ae95f063142c@intel.com>
X-ClientProxiedBy: MW2PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:907:1::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: fd31bb66-bdd9-41f9-545c-08de03d211a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hVpOZ59LRZaPBykiDD5vePq3pXeskfS2w/lwpCG0KGtVT6l+jhdlV2UqB/Kc?=
 =?us-ascii?Q?gsEv3j5yITH7JqwUgUTfVVlwa4Q8FnW9T4zxWWTXQSwpCd6X9BgNn3485N8Q?=
 =?us-ascii?Q?QdP5C4jBy1VJk3KHfMEjJqzIiL9fy5RhY/dtRDb8rDwOva9FNFiWp3PIZ4Bf?=
 =?us-ascii?Q?9qmO5GYCEFqlrCLUL48WckrZfcaib7/Fv7apRUs3U00+IbcJyQRW+WrEgPJo?=
 =?us-ascii?Q?CvIz5D2OSLSaSFmYcRrDD+gQNxKaOOP1YN2QVxBYm3fRRoH0h0H4KNdDgOn+?=
 =?us-ascii?Q?qcRimUBjPyUta8GOcVbbXFkaIialIscWfPXdiSl4mmghUDWe3vxjtin6/dFi?=
 =?us-ascii?Q?Qsa8b3zvGAkH/dTTATpgqb4Sg8QZkbSEGt/zHnmqPs56nqJBZ1FB6c5U1dCj?=
 =?us-ascii?Q?rxy7XriPDAPtda+Hpf300b8EoKzxbWVf+EX4WPHgo6I76h3fGgQnoXu+iLHf?=
 =?us-ascii?Q?ZxyYS6nEuKLhRrKc27TJzujMzE4mglBVnRfnvJqz+IGoX02HAGAnIeWDuEDk?=
 =?us-ascii?Q?8orp0BwJalUn+GZYD93xhMA3GvMtdrvflDzyaelxOFd/+cReKgDPE4L/ZuV2?=
 =?us-ascii?Q?L3sPqMKqZfuno317ESk5nsQDaClUhGdO3fjmNt6MrQpU7lle12wN1mk2V+Ha?=
 =?us-ascii?Q?NY54mIZhZlYPaNRrT2CXZKLfdfdF61o+fKdsUhyAaLSzyPJtZsDQQgpClOV2?=
 =?us-ascii?Q?YFFDhRV4uW7eV7Kl5dvuV5g0jpwsxkyaZhAQbLdngq08E+4sJhXzvyzMdxv6?=
 =?us-ascii?Q?aKBRfGXbSjPXAGst8OHzjM1NCv2BWn4I3omwUgO/IFFkCYYxEVpVLCZGjRXX?=
 =?us-ascii?Q?O25zXfcPyQECyVzrSqse4qyxzaZ2iwiLXarRM/7wO1Ms43qv2b2Gq9NEEJc6?=
 =?us-ascii?Q?7Dwkrowf/B6BXS6ZS/vVDoQQvquKh1+64mAElmFlNuV6TFxZOEfPBJFwNKay?=
 =?us-ascii?Q?SES8ANENAQjegUhr85C/Bzq5isT3j7qljle7SN135/pxFbRlw4k1dStXIMvy?=
 =?us-ascii?Q?BAocvzUfhmHnAQg8OY5H/HU5U+MoHuZEMrcKqXhDlUAvNVKlb8PT0d+ir/td?=
 =?us-ascii?Q?lakd6nvcvhwesUN/VF/iVog5MfzZWdHgQwYrEOFAcSzOr+TWODrjhgvpvKR5?=
 =?us-ascii?Q?nZS8vGEPL9bAcyMaxyM8YVN8j0HjKKNgu9RQWppAQ8Fxz2qlZoIGJQLbyawt?=
 =?us-ascii?Q?DsK0dfyKB/kp0g5vC2CdJD7mUri+evCbvrO3gmLq1r+R5DzZAkLoc+bCC599?=
 =?us-ascii?Q?TrPHL/zuaBCa2ftzM2wB7TQG0eV4eU+KTpW/ho/gjlF/pQiUurVHlCgyM6Tk?=
 =?us-ascii?Q?ueawO3MjbBh6zLldrWDaZKJkxwv+Sy+awU8XH1kCzTtkW49XR+NWXRNXe1lF?=
 =?us-ascii?Q?VmqwmXFGCXvwhpXxGztLoSUcmzc1VrGjTiJqQZ4PooPRABRi7fazaBJm6xtu?=
 =?us-ascii?Q?+8lAVoePeaTe8B26jVuVMQPMcs5KXU8+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VrMlzm1vM5k3149XanxrXx0YSr8SOoEWgUNV7Ktn33/5Fu/npTOClxbpAnV?=
 =?us-ascii?Q?fIiHVOEi6tVvW7qh2UNaF4Vx5yzdZ7Gk9vwQtT77WPk/0xKd8ENHPwqIekPW?=
 =?us-ascii?Q?qmeTLFaOOyQp3Bvnb1TWtrIY35fBcK2W6ttMp0x5ecZFNLJnEktJDv7LC34s?=
 =?us-ascii?Q?wR1x/thE/ZoveDlvKnl1EcyFPGUuzh7QwbTY4Ik01x8SPL0YA/09M4k/qUt0?=
 =?us-ascii?Q?0C91we2sE99CzREgkjl5hTw7STeHL8eB5a5VNxze2EvSgN7tcoZ/Y6b04u4c?=
 =?us-ascii?Q?kuYTapDik6XPwOWkYv7YcBwdb/b3D9C0k2HbOBc62ApDiEkCo3/OcTMgpbbC?=
 =?us-ascii?Q?VeJ9/gooGxUG+pmwpmjL8IfMb8wuFeSVhj+WhPvz+sMz8HqCAqW7A3QF2Ybz?=
 =?us-ascii?Q?yd/7H/SGGy0NalDjSCzXLxNz2ahUlIqWoYINxKggqRV/v31I+2W8HaDuwW9X?=
 =?us-ascii?Q?kt9yQj0+ydOXDKGc+tjigog1pScMFNTV9Qp98+q3aP7zewaIoY4rBx6NUsIm?=
 =?us-ascii?Q?Cgpme8Ov4ceK4pup+T/xqICUR/sy9BKb3qUJ0xynkOkVLUj3UIk4QFnuyC8s?=
 =?us-ascii?Q?V4IdXGZh8Bef8Ri32I/DXPFLgcXYupCwj5XsWXIBaX2lN2y0UAWCMb93SDS/?=
 =?us-ascii?Q?i9n1exKYFnktmrKplLKFSZ6RnBFqmlZFHf7fbmjS38ceTLLS26W8+cv+4kAE?=
 =?us-ascii?Q?3Yn74YcVf9bEtLOdJG8BcMz2EcMibC1gh4x4OisNcyj+D7dD9+Aplvy/e07N?=
 =?us-ascii?Q?7YeJ7w76uooVXTKu3c1LaajcbtRJklHk2I+YfS9JovE6Fsdml4kIBkwsNZnD?=
 =?us-ascii?Q?SoGIqttOJSHlQSMviFiBLxD8McEqPS2dCLvPeKJqGDnyRD21PnNMli3wWev2?=
 =?us-ascii?Q?YJR383nc3n2XmnMOhGMZ1SBX32xLc1QR0wgvvOWzDlaNH+DEIDTXdHgBIaQk?=
 =?us-ascii?Q?fSRzx3BsRRUqeUkup+gCXfDA735IpjdPF+zoP36PxOCAMD5WIjSLi7N2cUeR?=
 =?us-ascii?Q?zJYOoZYlsBNEn5w+1VBVbUuv2Jy7E3gvgs171VIdN7y6JMzgI+XTOE5Z4srA?=
 =?us-ascii?Q?cDPl5xxxBPzHSA0F0DXMBLwMWPaVZvEq+r4U8+tU83LbovAvAfJBJ98Uvqz2?=
 =?us-ascii?Q?YUdNtKiLIETa4kfQ1Z/CpOWlk7AhZHBqt1C+FF0Cy47mU8bxRxzaLO0CkOAY?=
 =?us-ascii?Q?zCnOPHna35ecuO2bSay26Lan20wJQz6WkB+QA7uXTqcWMhbtMWXxdyaIhegr?=
 =?us-ascii?Q?WQb4a6WXER+kDV6gaWYAO0cJ9msTZKc3OZ2/nB4FYUzwPZM9gAHHeJ0UPM8h?=
 =?us-ascii?Q?aPMRvrMSXZ9hz69GwYsRWgeWqETpfUwoECo4bwDxlBe+oaXxTI3XNvijlH7L?=
 =?us-ascii?Q?wmXazCZJPgCM6hGH/GtMIjNo6+i7JcwMJYhlZP6GGeNR0AAHtmWnAk0/x1qN?=
 =?us-ascii?Q?mgj25wWhu6rUoVSnh/UAHl5Elm78nubgH+3S76RnQHA6drP4rFgncMtwe4N9?=
 =?us-ascii?Q?Gdiq0QrlHb+Waoh6Vd1e7fTGu4iP0LRB8wn9hqh6zHhAPeZzPKld3bdf36m5?=
 =?us-ascii?Q?5oB/vFskOtVJ/e1oxxBsPEmRbn3bO5buiSieKOabMKEnVLMBPX2wdW4f+ka+?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd31bb66-bdd9-41f9-545c-08de03d211a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 05:43:10.9083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/NhNsiYrc8siBSbc1JDCLzcdJQHtP2sopEwPYhEqdYwzKI/gQzDHyIzFfA6kTjTCQ0Ks/AnTHy/PIiYA8U0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
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

On Fri, Oct 03, 2025 at 04:26:03PM +0200, Lis, Tomasz wrote:
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > The only case where the GuC submission backend cannot reason 100%
> > correctly is when a GuC context is registered during VF post-migration
> > recovery. In this scenario, it's possible that the GuC context register
> > H2G is processed, but the immediately following schedule-enable H2G gets
> > lost.
> Shouldn't the solution then be to treat the schedule-enable H2G as separate
> state, and be able to revert to it?
> > 
> > A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> > simply drops the duplicate H2G. To keep things simple, use
> > `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
> >   1 file changed, 24 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index d0fde371fae3..d84de8544532 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -736,6 +736,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> >   	return seqno;
> >   }
> > +#define MAKE_ACTION(type, __action)				\
> > +({								\
> > +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> > +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> > +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> > +})
> > +
> > +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> Something is very wrong with that name. Context registration can't "safely
> fail".

What? This name pefectly describes what this doing - these VF actions
can safely fail in the GuC. 

> > +{
> > +	/*
> > +	 * If we are VF resuming, we can't exactly track if a context
> > +	 * registration has been completed in the GuC state machine, it is
> > +	 * harmless to resend as it will just fail silently if
> > +	 * GUC_HXG_TYPE_EVENT is used.
> > +	 */
> > +	return IS_SRIOV_VF(xe) &&
> > +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> > +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> 
> Shouldn't we at the very least limit that to vf migration enabled?
> 

Sure.

> Looks to me like we're completely ripping out context registration errors
> propagation. From the kalloc() fixup patches, I was under impression that
> error support and propagation is important for Xe. And here, we're willingly
> damaging it?
> 

This is fundamentally different than omitting a bug check which crashes
the kernel.

> Can we really ignore them? If we really must, shouldn't we mimic GuC checks
> here on the KMD side, to at least decrease probability of problems?
> 
> This will cause possible error messages in GuC log, which do not indicate
> real errors. We're willingly sending a message which may result in an error.
> 
> Having error messages in GuC log which are considered normal flow on KMD
> side would have to be properly documented, to avoid people debugging
> non-existing issues. Best in several places.
> 
> 
> I don't know about this, we're creating a bad situation by choice.
> 

I've already explained this. Not ideal but I don't see any better
options. If we remove this a fast req can randomly fail with the right
race condition trashing the VF as that results in a GT reset.

This error check is protocol level check in Xe. If we had protocol
problem with H2G it would show up all platforms in our CI. We are not
losing any coverage as this check is enabled everywhere but a VF.

Matt

> -Tomasz
> 
> > +}
> > +
> >   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > @@ -807,18 +827,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
> >   		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
> >   	if (want_response) {
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> > +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
> >   	} else {
> >   		fast_req_track(ct, ct_fence_value,
> >   			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
> >   	}
> >   	/* H2G header in cmd[1] replaces action[0] so: */
