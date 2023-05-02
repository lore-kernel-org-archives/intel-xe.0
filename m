Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DF9C77B7E
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 08:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24BF10E4B5;
	Tue,  2 May 2023 08:24:53 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4510E4B5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683015892; x=1714551892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F5/FE4gelRqTIam7scwdMfb/eiVjNlZsfxhDVgoQLF8=;
 b=OXNh9AH3vTM5lco4Jnl+8iS7QKQIDeQVbAKDHjVX7Jh48am/73HjznD6
 x+OjjeJCvF7leM4V/OGFjTmG/2amHzotsrOsAjCJbK+YUkJic2o7USAiT
 I/IO4EzA6WlB5OF9A5ZBZzx2g24etvK3eo4gv2/PYnxyRs+OYpD3HdhmD
 fFNnzCsdHWp7+vOchssgGzlbilGmAzMW0USY3MG/05Ob4nN8BGH3i9QAE
 7oMJamwmOecV7DqZXC3oPXeUa61M3v9PlAfezV4Lmi31LC2vPUbCrgumx
 olJ9IFXmm/yew9gY0F6g30mPjR018/pKSifphTHkd7ZN0HWVFssDmlxoR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="350417879"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="350417879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 01:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="646452176"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="646452176"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 02 May 2023 01:24:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 01:24:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 01:24:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 01:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqSEYOJ7Ixl+JYrn3wa9nB+uCjFDb1unqnYue7v6jduSJppdvo56mT7ClaTBrASOlmPZYtvDL7hmTTHtWdyD/FWAPHRLUmFBBRLIlDIzwPsASD2h14+FPtPyIrCxRbkCYYtZcsaCvYdo85SFEEpNzHifiFXqyMtbpFJ8VFxzJbEpwTBhehgetXOLiWAvuSyLCoaCfue+YO9lfBtzJ5ARJQI+HhZll0zXpALviJQOeh0NOtwsKJcKkOTdGkBb5DeW6pcii9b2x9PSkWDpj2/XNxnc0rXCbh9pRKLmRY3EVN8v/9Mzn6QBQ8V1JGFaQJK1boqNBadaChwOSfyOZt8O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D523hV6vAXSBy+M/MoeHEMecbWo9A2MrY644tsNvOKg=;
 b=XAcFfDZ/sdEqx4MphbFY3n6ylA6FlOigyZR2CoP9RfJt2LHhywKrZGq020ojyZzZD35UB5p9BgNotuEKrDudk/IyWpAco7q1RoiIAFVv1CGzqpRTgoIyYi9VhHIVNt8xjk9TgU0cqh6DJs7WMHdyFnnkrqJ9WFwb9sS3twjEPCofpasrp4p0E0z4Td1xF+yh6M9pNdDUnz/XMN0ogdVpBwY1HuKJo3NZTnCAu7dGsTmViRolYgoGO+YeUqBR4clFM8h5nff+RoHob7Z7fOSA65I4L/iThHIru5e6b197SU/bTl/fNwcPNL6FNJZK4bgwrg3wkM7/8alQNsgobXAs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 08:24:47 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 08:24:47 +0000
Date: Tue, 2 May 2023 10:24:38 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Message-ID: <20230502082438.GA3774192@kav-xto-001.ka.intel.com>
References: <77046462e38d71c3d0d87ddf84d2c412d0cdf8d6.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <77046462e38d71c3d0d87ddf84d2c412d0cdf8d6.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: da6815bd-da34-4ab2-aae1-08db4ae6b0cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rz9R3XRFxyTRzyfyBGiDi4me/saoCl/fPJES6scMp2OvkkkACpz1YjI50NJpeQ2mMIRouBRoDv/ptURZsC1DCZCUauF0jiJU8bSKOorQH2RBcSLMJY/3xAKcBVZ5zMSTUdvmZXbo+wRs45kqCDO/o62oQCTgNmhPEl4prO63jaM1GReMJZy19EHnLOMiYQtJYPPH6c+GsG34AXnHGninrk/sob+lP0hkcU5jRY4z70Ua0aRv3sqyTvF4AXmu8Wa8kjdzBeROR7olXoTpB3jyTUPFnilrVKydwXEbKHDnhwd8/aZji+akJJjGJjHFrEC7Fq5pEIlUTT0nX9my0VZek0lWvKGdkQZjd5O4Wqrdy7z9u7vgzZT/nPTuNrJIw3+9Dgg6xc3HT6YSRSaZyV/Gpi6MMWahm+irhiYYzlqh/nsO+jLz//rynWuEE90HIJtLepg4U9lL492Euk42amBwSunk9ccjbEcwZmiWZdps/czFkTGDZWAiQW+sByfPZ9nauIIs5bLmJp3hiv0UCL+bIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(6636002)(4326008)(66946007)(66556008)(316002)(66476007)(83380400001)(36916002)(6486002)(966005)(54906003)(478600001)(8676002)(6862004)(8936002)(38100700002)(41300700001)(6666004)(82960400001)(44832011)(5660300002)(2906002)(186003)(1076003)(6512007)(6506007)(26005)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlMBV37m1TR8+vrMLcLobOc44u/6HHZLCeRXi16wlKEudlJFvZYwzYpGeX1j?=
 =?us-ascii?Q?WJo5sHRGQ5GgGu7RuzeN45X4MadFH3Wl/DThPgNvvS9cxmv16N+CDqIC65oh?=
 =?us-ascii?Q?4Z/kDAxd+sis3XhY5XhpvbZFZlED0KM8qLpjogSLuxmM+ByXo8ieagOHyC+u?=
 =?us-ascii?Q?nA1Af8Oi3TwlU/Jltt+og5a8SxuvppD/pBXPwY8fPbqcbOrH9KeygVx8crTI?=
 =?us-ascii?Q?ijvfIQHa4KEHGqoa7uGl5wXO0cwu8GWEFFufEU8ucNrkEeOYwZ75M4lk10Ov?=
 =?us-ascii?Q?KVs+1vCYYsmYEHQgiQI6tRoJX8/+vftwb8yjeEgJhsLZYiQa7u/cI8r4CI2w?=
 =?us-ascii?Q?NIcowR2Y76fXC0dP6sD11m40Kgye3qTDvXbsW6fVgm0x7V3o8VZXNLINzbDz?=
 =?us-ascii?Q?cuxArT2UMFz2X6HSdEAHQrGyOGFUfyHxQ4XEuCZRs6gaFMEbl3RPN8blirxH?=
 =?us-ascii?Q?7OBdJKNSQmkpR0xzHiSUOqrlgY4Hwb4lkNuoPrnVU1bJrYZ/Jgr5zv27JGKX?=
 =?us-ascii?Q?dge27iGfamLv0GrnP8mqkTOU6/N15ut3+P5EpJ/wFwFBYmt40eKeWqjD9Nzw?=
 =?us-ascii?Q?mf4sNg1Z4qMywGupQ6wQ7MbXrlxtFgJsuFCieIaZZrCPWzgio0ulafJ1byn+?=
 =?us-ascii?Q?RVLJQ5u9KcnxTtM38jEnDUIR0EZ/V3BBa3i0FS6YiVvvvDWWRdTY2sPqiUNl?=
 =?us-ascii?Q?EafxyULYnlZ9g7WEhONdtDUzoQSorgpS8hbhGLTOOxBBPlYTwPjgUAPkfhJi?=
 =?us-ascii?Q?xqWJKRfQLxKEU7+hZyXp+QtZpAKBGERGNudCccs6jznkeTTp7fePb98Qlj2q?=
 =?us-ascii?Q?FI8DGJ0TEV1drl6rjCrlVepKa6i8wvafZJG8QZgt81d7jFgk3TMuwYBGEZVs?=
 =?us-ascii?Q?RvYCviJ0pXHWfnUT2vbPEwRoAS6whBoABpbtBx5rwzi01k7QWY8F+ADQQFTm?=
 =?us-ascii?Q?x5aBM7pGGfeQ75np9Ftun0K6uo0g+tCi4aP/2JUbo8qnuEESOwbZ/5ZeJl11?=
 =?us-ascii?Q?g6yWTqndQPyxvH6uGvtP+jQFT6GhKHMHqzmVVW+wzx5tA5KVWgQfhNDpK0Sw?=
 =?us-ascii?Q?RpypgJ99V9Q71fdjFaxyY0rnutWPFIynQi+21068qs5W9e3mJRiZFQ2E/knv?=
 =?us-ascii?Q?UTZT5Wns4CMqoJeA7Op4syS/UarXsUTZNO+H38YSKHFcqs053DhKiszLLFXj?=
 =?us-ascii?Q?uZdNUI3pg4XJGyy2yh3L+kjPIL5AhWUJrBTBJ/Z/1Gvu5sLptSiaPOBDNrvL?=
 =?us-ascii?Q?cK+W92KiDsh6cPuL14nAJbMgFRK0Dg4cgmH1D8lgpRACVt37QhHPF/krXN3c?=
 =?us-ascii?Q?UzlGqY17UJLIjoU/C8gqCPiJCtHsaxttIlBavFIlbgDlnWWrrZEbcIzh4lG0?=
 =?us-ascii?Q?b8vs6fBaHmOffTYCwgunDpTdeioCrxkk5HhmLfzpK+fKFul80h1HfS/4kA6o?=
 =?us-ascii?Q?Pq4S7b4XwlbrC1T3iom5bNrc7irghEH3X572NYp32+isW+W4wPeSl8WftdFt?=
 =?us-ascii?Q?rdACpUF8AZLcOieOvj1h8s3pVOgIz9pFDYlEECNsc3tQ//VCY8ibZa4otCWF?=
 =?us-ascii?Q?IpZQ1tu8UM/gQRhCpEO8yAMBvHKRKIOl8IvXI7vv7M+VWCb6u6lbVc1qwnEF?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da6815bd-da34-4ab2-aae1-08db4ae6b0cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 08:24:47.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/s111pk93JHccGoAJ1xct4GD+SHrepBRHFnxMmcAScMYnHi/9c3Eop+voEavVxc/mmM/GIsXXiwkdGbsFsNn5uxt+XoK7yuIxdrd85SIZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] xe-rev1 Branch for ease the intial review / ack.
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
Cc: "Gabbay, Oded" <oded.gabbay@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 10:28:03PM +0000, Vivi, Rodrigo wrote:
> Hi Oded,
> 
> I have created a xe-rev1 branch in our gitlab [1]
> to ease your review.
> 
> The patches there are a subset of current drm-xe-next,
> excluding any patch that is needed for display, but also
> any other non-display patch that is on top of the display patches.
> 
> Let's start with these for now, and iterate next.
> 
> The only (big?!) risk for changes on this patch is related
> to the drm/sched patches that we have underneath the initial
> mega squash. Depending on the acceptance of the drm/sched changes
> for the fw scheduling and the 1:1 relationship on the sched and entity.
> 
> Other than that, these patches shouldn't change any longer. Unless
> requested in any review in this round.
> 
> Anyway, I truly hope that the review requests can end up in
> gitlab/issues and addressed with follow-up patches on top.
> 
> Thanks a lot for jumping in to help on this upstreaming acceptance.
> 
> Cheers,
> Rodrigo.
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/xe-rev1

Adding Oded.

Francois
