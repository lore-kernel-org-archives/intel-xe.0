Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B118F9D0CD
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4053F10E0D2;
	Tue, 14 Apr 2026 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWpvMUQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4570110E0D2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776175885; x=1807711885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yTnzHcUbQ9jw1L45/9OXCwhHy752kT1o9CHkmmF+Dy4=;
 b=kWpvMUQNa7wOW0CNachV9BDhGFj5L6mXkZ3kG2LACxL6T7MxPatZi0LT
 UN3O9tM97T/BYXdR9bZFghFQbURIWFt3z5eNwPANZi4CiDzXJoQEHIBZn
 rcE4kqKGyljCBfZK25WhqxeTydZqh81UduDbq+HKtuGvTCspCKC20zumD
 qJ0LXIKOomF1a8We/Iab0gxDUjmPJM//BGEqSg/7xWC6gLLlr5wxWBJi2
 ImXLS3kkw3gyWZO+Mhwq83zJKh0ZqjxptotWWwj26xv2cKZcYn+BJHh/V
 eTL4+XemS9ac/5c97E8wH6+Dgkd75OJBdv2MISEOhYqa0yAYtLNYbNaXr g==;
X-CSE-ConnectionGUID: r/y10JE0SImz0xr8mfITzA==
X-CSE-MsgGUID: Uf84Pc6kTmeSv6+aKtxfPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76165426"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76165426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:11:25 -0700
X-CSE-ConnectionGUID: k+ranNcqTOeI/tW55oqqIA==
X-CSE-MsgGUID: BKHwj5hhTJuaDDuCBtjqqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="226925993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:11:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 07:11:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 07:11:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 07:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBZwCe6qEhCaCPxdS4LLZgTRWZ8Wx0EtuVu4uIrwgpLvAEAQGYyni+Lk77FvSbDKM8R0ajM/Y6uFNFRNvtDVX52t/ijHdU1aGwDjpy+lIA+M/W5W3vu/a9ZgOUJOmftnYYmUB9RW1+1gBH7VIihOMdyW3C5gh/+ilM6H3SPvln7GmO7li4GeumG+QFfVJg3hljHo3m6FT0l2O2aby/4cTkgvQH7nAdzcDrp8BvwzWAhwFJiSGAtg4tkZgmM3bAXt0sMojOrsus1bXmzJ8Bm3DR3RoNpUQxMrhx3dlq+tWVT+WJPiKUnleorV055iUWBo7UQHLlwmF+Dg6mBe8oygCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJnGBy0MdV3MYcnayprDa6ot4Wj+y7rt8vk8rYVni50=;
 b=WaKd591zCBcKMB9rcLDLjK01qMCOUrhIIX4FAoo6hBGsTOS3RMJ8rQ2q1Z5cTKDPHoxJcfr+gomeVaqqTNVwN8xao2pkaRlIyOtlg7pnmZ1uD4Lxos3yNG2Xq8hfIYbAqgLLyfYqdU0+tH1F+g9f4Occu3ouFl57Wns7Rlyaq8q/s62YNay/YYOis+GWAaAhOsOS3DdpAjmwfXvL3QZSzUE9X+rSPnKDApXk8EEX3XAsEzSUyxMt2bZlU+wJgk/4bVZFQJdBYip9IJcNua3SPDMlvmPt6keuF33MFeuyXR7LdRB0yFraBvprzG+55ZfyAHCkFz/7OWzvsw+qDpDWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 14:11:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 14:11:19 +0000
Date: Tue, 14 Apr 2026 07:11:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 00/10] Start fixing OA whitelist mistakes
Message-ID: <20260414141116.GA7476@mdroper-desk1.amr.corp.intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
 <87340y88xw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87340y88xw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: b70bbaf1-756d-4207-6c4c-08de9a2fb354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: P84DBPyvNTlufk+HqGRI3IuP39kBvNPZ4ZCcj9jhz/nM3YgMHABlmiF4dKKwmIG9MpyTsEOPSy0oDNN06CtGytI0A34jS9Xugx+K1VUCgAVQ18yqZx5OfG+rXq5XKCuNu0EGa2IDI9sYzr1LIcDax/88ssQH5N59+akmX7tPUCMHAoyMfiUpUe3qqei/uBewZoQ+FxhTUbXWtp3G/rI2DLNewZiPQ5AZXOfEarnjykiQdSq6WGeddN/P1b/bEdFHqKmIs/aN+jAKC3VJ2VGY8TcQ076SXMqZVUsLuPpjF+fyBIc8nwWSMb+IUgh8NIqrTijcpLXJiqYenR2BClkULg6a6tK7U4WFRJSwbx7hnZwCgkuhgWSao9o7jQaOXkGm9CCH36114SwoIFLuP9Q7y5TDX+kkcpp/Vive4hH3LVCqIK0JH1iXfC3/YIeO/FbnYfrXaTXSoURZGxDdOniJU476tutkL/SKW6/2mhUp182NyVr/6j+az/Dvk0/9yykaOwSCXQ//B4IMZdalJGvfyyDvKbhtvpck/yvxb0qzJgHwTXBDfK1cCgvhUI6gaY87btvvXHC8MzePwj3nBEqWU5S5QwGjkl1OoUFG+hvIw92RtZNtzf7XSF/JJnumoBkwhGsf04yQrVVJi1s7l/UEx3FcHMadIif+zVx+DUjgyfUlinY1B1HRMZPwKincAG4F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FPgCoJ0W703YOL7cOR5FJOH1jXHTl1OazTlyLbNfvxmyS01WQfzlVLmlJQae?=
 =?us-ascii?Q?mFq7Dkby2uCe2O5MWFy3BXHa30B/N9z/xvXrv7VdmjnxxYeEnH5BiDOgq/L0?=
 =?us-ascii?Q?YalfWNKRQctVvamP63EAzoLr3BsLBDSpr2otMH8H5FmcCQdAonBFXG1MVWRJ?=
 =?us-ascii?Q?wbYENqDKVIWeycRUEgM/Dk9OG7U3yM8VumMfdc369aw+JWzoENhXH7qevOqb?=
 =?us-ascii?Q?rv0E0QnKvOSqyISHY1GEfI1Qq1GJiPFiJbxCsc3ffuGPMWm5D6ITKEdpIZ6Q?=
 =?us-ascii?Q?gxEDmSz8xLHiUHPFx2cDuarIjg+zL7ZmzWQ6edsqumgN8yBdYEdAte6cNWut?=
 =?us-ascii?Q?5Yxb6dhfNzsTnKkyOqYJGqnNEaVVunc6AnaptO2p6/Yvahp3n+XGg7cKWH6i?=
 =?us-ascii?Q?AjHJHp93XE5Bdx0D9jPz3W9wHIY4zUbLUA7frnQlqDLCY2G2NyNM4+lvoZsL?=
 =?us-ascii?Q?LY12XVNTcdIxwkC7P5SBjufS+TiP2c5/BmJNwPlO49RjA7MLfu6GxQ/B2yxE?=
 =?us-ascii?Q?RAvC781KChA1I9KOzGS6iv7QXauawbqiYR3T49RdSoE9ebfL4BPy2YuLvqAT?=
 =?us-ascii?Q?2Mr8sHqP9ntaUjf8Gt0RwP1HrZdVT1mAg+BGM9fo782zm3s8Q1I7VzeD6QCV?=
 =?us-ascii?Q?JRaKJL5CJX2jF/cadpU4vW5yHBKqYibe938gRTW7HN0hSHTXm4sDYmRaK9Px?=
 =?us-ascii?Q?ByeScLAtdkH02uruX7/KIfHy3zK3xOXanb4rDNp7NOegFW8HR1mgGcBSnwDI?=
 =?us-ascii?Q?PQ0RvF/bw6qF+Qc0uuE0W7iyYkaPCqi8rYIt+OnbyoVP//a7gFiYvbN7DfK5?=
 =?us-ascii?Q?gDCy5eOabeFk/LU3wBB5r44FtEV2cPMtDN0g4AgIoIa1nJYpkGsff+0HRh/U?=
 =?us-ascii?Q?PaNlsgq063Yw9KSbSBL+kNT//gHyBzKuGqwEpU9KOm+FhTO5TdEWN5bTfyGH?=
 =?us-ascii?Q?EMx9VemnRhS7rj+imHpQybGNkzfEuUETl7AC4sC9uZ8kq+aoME8YRNXQBCOd?=
 =?us-ascii?Q?jJ1AEqIgocNqJGt2reDieHmyXv43iQYww21mZaN+V2xY4N39Cb95u4a3p2fK?=
 =?us-ascii?Q?H0tWuMW+m1JLcAA4M3P2s9wcN0mm3iSIgU16NNSVgAoYADNswncybkFd2/Vw?=
 =?us-ascii?Q?4hiSCJ17dczqEaEx0MkLfbeTXjP9Q/4EGvThVeVLTPCIUTcaKA1/ZHmH1/SV?=
 =?us-ascii?Q?cVg/i5eMC1nFm3eGQxVxEmOUtQ3rrDccbwkhK7qHIS3skWdxJ4ntrYrvigGt?=
 =?us-ascii?Q?CaOA0OEzKy0/wrIvDrfMeVZVR/mwNu2Z75B+qH7JIXOQozG0L4Ud7nrSdS6n?=
 =?us-ascii?Q?nAGzLBPdNaHwsK3ZlrC1lOAHOiZli8X7++QckeXjHucu1KPLOY3IwRNf3mzU?=
 =?us-ascii?Q?fEKt11OSzA0kIBq3VgKiwYutd36T1MYzz7hCrYPmMWp7+02YucptXSQRt98Q?=
 =?us-ascii?Q?EwyKZkkfdryewrpDcymcO10/hvJoOVeTrYFAjosfy+bwfuX9NEnFl+gHX606?=
 =?us-ascii?Q?uckZZiYJyUhOvVm1vdbx8NVUNZe4oWnXoG1nAc9eDq9fqvDIqfIlfac/SBfS?=
 =?us-ascii?Q?qvZWbc7XwtRnbnkmXJh3xYshn2SP/W73djTXDB6UQnXMbzHZe1vZFwkBvSz1?=
 =?us-ascii?Q?BgQr+NEHwP5x60jLvnk394a6lrxn2n7JL50tyIuPT8eoZzHbWQXi2wiseJnk?=
 =?us-ascii?Q?6XG1IlayxN2roCJXaPBUui9oG+t2o33BR1aquWCYyFcROlKTSuuRfMz5nl0B?=
 =?us-ascii?Q?rfiVxWbDmh2/w+9u/AWY832S0RYiaek=3D?=
X-Exchange-RoutingPolicyChecked: D+TJn0zkS20sl1FQBnrA+ceBPGNihpMgqaC3qV8yuG7DllCQEgpn5+D8z6r96qxNo1ZKEZyJJc2ZFrOaby2tY5uePE9Qk2Dn9a+rBkthGx4Ar2etR0xZmLa7axOsdaYGI+k8A5uUqaAAMp+ODdH7fVLsjEaHWaFLYEdOzZRnj2nKHnKGmGK+YCoHzW+t6tGsdFj6Jvy5cLoCOH6ZkZEwdPVNfkLQZ5OXQjnjp69ouMdCvgMTOth4YVkoV1mqPLAF9H6wPXAnS9ENOxFr/Ls5EF1RJPbJQnaPs2ZnfKG2VNEppk8k1LCPEmf/Pe2ulUoqSgVFiOxbcZNJ4fp5Ioodgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b70bbaf1-756d-4207-6c4c-08de9a2fb354
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 14:11:19.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p4MPecvbqIPno/tEAxJtdWCzC8I3XDYJnY/uAbdhZHuEsxIpBUOwST0+EY0fuDaIRWwHkN9Lj4ZBTrf1A0cCHpNFPYGCPMvxq2QV70WUkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

On Mon, Apr 13, 2026 at 09:25:31PM -0700, Dixit, Ashutosh wrote:
> On Wed, 08 Apr 2026 16:42:59 -0700, Matt Roper wrote:
> >
> 
> Hi Matt,
> 
> > There are a number of mistakes in the OA register whitelists:
> >  - Unlimited upper bounds (never allowed for whitelists entries!)
> >  - Whitelisting registers that userspace already has access to
> >  - Whitelisting registers that userspace is not intended to ever need
> >    access to
> >
> > This series addresses the first two bullets and partially addresses the
> > third.  For registers that weren't supposed to be exposed in the first
> > place, there are still some cases where we're exposing registers that we
> > really shouldn't be, or exposing them on engines that we shouldn't be,
> > but we need to confirm that no legitimate userspace has started
> > (mis)using them before making further changes so that we won't cause a
> > regression.
> >
> > This series also partially unmacro-izes some of the OA entries since the
> > several layers of C macros were obfuscating exactly what was/wasn't
> > being whitelisted and making it harder to audit for mistakes.
> 
> Thanks for these patches, but at a high level, this series does *not* align
> with how we are planning to solve this problem (according to how we have
> been asked to do it by our architects). So changes in this series are
> simulatenously excessive, and also don't do the job.
> 
> So our plan here is as follows:
> 
> 1. No (or zero) OA registers will be whitlisted by default (after module
>    probe).
> 
> 2. OA registers will be whitelisted only when
>    /proc/sys/dev/xe/observation_paranoid is 0. This file is 1 by default
>    and sudo is needed to set it to 0. This means that OA registers will be
>    whitelisted only with an explicit permission from root (or system admin,
>    who is the final arbiter of system security).

We can explore this as an option to somewhat lessen the damage that's
already been done on released platforms, but this isn't a viable
solution for new platforms going forward (i.e., Xe3p and beyond).  This
plan does not do an adequate job of securing these registers because as
soon as observation_paranoid gets set and you add the whitelist to allow
a specific, dedicated process access to OA, you've also opened the gates
to all unauthorized observers at the same time.

As has been previously mentioned, whitelists are not something that
driver developers get to just use for convenience.  They are exclusively
reserved for a very special class of problem and have to be approved on
a case-by-case basis.  Going forward we need to NAK all unauthorized
misuse of whitelist registers.


Matt

> 
> So that is the plan. We have just started this work and will send these
> patches when they are ready. We will also send patches for previous stable
> kernels if needed. Any help/patches for this work are also welcome :-)
> 
> Regarding *this* series, my plan is to include patches from this series as
> needed, but after we have sent out the paranoid whitlisting series (or
> include them in the same series).
> 
> But I don't want to take this series as is. If we implement the plan
> mentioned above, we don't have to finely control which registers are
> exposed, the precise product versions they are exposes for etc. All this
> will just increase maintenance overhead, whereas system admin control of
> whitelisting makes such fine tuning unnecessary. My current thinking is
> also to retain the current macros.
> 
> Having cursorily looked at this series, the following patches are making
> sense to me:
> 
> >       drm/xe/oa: Stop whitelisting OAG_OASTATUS
> >       drm/xe: Add WHITELIST_RO macro
> >       drm/xe: Enable all FORCE_TO_NONPRIV registers
> 
> But we'll have more clarity after the paranoid whitelisting work shapes up
> a little bit more (also I haven't looked at all the patches closely yet).
> 
> I also had some similar patches lying around (waiting for us to make
> progress on paranoid whitelisting) and I just sent them out here:
> 
> 	https://patchwork.freedesktop.org/series/164832/
> 
> Thanks.
> --
> Ashutosh
> 
> >
> > v2:
> >  - Continue to whitelist OAGSAG's trigger since we've been allowing
> >    userspace to access it on the "wrong" engine.  Hardware only expects
> >    the GSC engine to access this instance, so it doesn't automatically
> >    grant VCS/VECS access.
> >  - Eliminate whitelisting of OASTARTTRIG_COUNTER; this has never been a
> >    valid register for userspace to have access to and was only
> >    accidentally included due to improper use of a RANGE_4 flag.
> >  - Consolidate oam_mmio_trg_vcs and oam_mmio_trg_vecs into a single
> >    entry with a custom match function.
> >  - Eliminate some layers of C macros to make it clear which registers
> >    we're actually referencing.
> >
> > --
> > 2.52.0
> >
> > ---
> > Matt Roper (10):
> >       drm/xe/oa: Stop whitelisting non-SAG MMIO_TRG registers on non-DG2
> >       drm/xe/oa: Stop whitelisting OAG_OASTATUS
> >       drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
> >       drm/xe/oa: Stop whitelisting OAG registers after Xe3
> >       drm/xe: Add WHITELIST_RO macro
> >       drm/xe/oa: Consolidate RTP entries for OAM whitelist
> >       drm/xe/oa: Consolidate RTP entries for OAG whitelist
> >       drm/xe/oa: Consolidate RTP entries for OA MERT
> >       drm/xe: Enable all FORCE_TO_NONPRIV registers
> >       drm/xe/oa: Stop whitelisting OASTARTTRIG_COUNTER
> >
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   7 +-
> >  drivers/gpu/drm/xe/xe_reg_whitelist.c    | 115 ++++++++++++++++++-------------
> >  2 files changed, 74 insertions(+), 48 deletions(-)
> > ---
> > base-commit: 9e217a8df7b2f298a2fd850e29f970b7360dc77b
> > change-id: 20260407-oa-whitelist-cleanup-21baae7fbb78
> >
> > Best regards,
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
