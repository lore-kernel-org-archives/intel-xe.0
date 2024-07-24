Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4BDC3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8810E738;
	Wed, 24 Jul 2024 15:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5aWyjE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550A610E738
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721835897; x=1753371897;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wzQRn5VWbAQ587cdMEXgjTcv9PPMCM0eoNIp31gIykE=;
 b=d5aWyjE7m8zV2mgNRqPwQ52RY4Cki6tit/JRb7QMuhURxsW8er///LiF
 76SDvgRGhpg4VGi8sGEH24t7HEHWzP1XoXyNkIa47FMH6fh9Z9QzOG7B8
 zAavtoeQkJIDtJvdfgo/6JKo0hzkus7TbES45JUE2BgkAyNAtSQcYwsYP
 ODB9TIzdzcnWKfKdkwdx/JElSP6VoBx0iq8j5IDermTvLPj0kVWF7+wTK
 xKLymEN2lQiYQ+3bBtcywZmnW8M4kwIs6pMVujI/pajgMIFwdspkNdnFt
 oRIh3t7wW/I8kUZKJt/DunZz/BWFuoASFFRgXLX+mKE2hbTRvGviB0g0M g==;
X-CSE-ConnectionGUID: lXRMeg1FQPmRF4hfs0anqA==
X-CSE-MsgGUID: YhFh8WGESZa3b6zTB2YOAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30126833"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30126833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:44:57 -0700
X-CSE-ConnectionGUID: k1ZepS9wRvSGGMzebSUbnA==
X-CSE-MsgGUID: dyVgABBwRY+z3t4YV/0cAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83231635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 08:44:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:44:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:44:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 08:44:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 08:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8xCVNBfVa0AvfAej49xcEKYfCH9ASUZDev1EviPghPAe+snej7SWmr9pS6lx+yEFNp67ccs9YmJGzzKAMcbfk+AGiKFmQxPxOZPw1y8J3uTPV88l6HH8x4LRQeuWu9WXRuhZz2Oq1gF7ih58xfAZM6oudSDbZ+uWMUy0bq0UZsscgaEonZgW6SEelMWUyZLv8PDeMq4ReoGYEA3bOe2KtyBb9WmDyZo8cMvETJAyeYW8Kl8JW64qYQNUHuAJ1ljFswSWZtEWyPkhSgZ1UjgUhOTNazL/i923sx7+Rd2qT1oB4B+uq2vJrgBnddcrNiwBtVcY8rpMSexV3+3JLlBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hccgb5g0x+jItCOh0t58f7QeZbUIcZ2Ye6fSwGPvpy4=;
 b=Rr+mNwENysfoUNf841V8q+M1oligPxbd5/VG64BHv7kzBgBRfVIL9MfcsgYY3X/CFDkfq5V1qe0Ec5vUbGqN53uxXyFr//hzmmHqFSfhXHMbVGPD5ujw/dt5ZraXXSI/jto9QVSMv4HGHqAG0BJJQps4aSRIRhdc98277EVAjRAZjvS6oB/jU6MsubJFpBBbZ4bWBNNri5pRuj4RAVlrg+22Jgv0bNxM66/GQW8210GwYZ0n6+IByPsVdHxJFaxmbGnBb9eQleVD/M0pvcVTDhWwb73GwzyW/THD8cCaydg4O3YmHsLoiP33p+OSF4Lq1PG5jLtzScvq9oqOyOuazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 15:44:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 24 Jul 2024
 15:44:53 +0000
Date: Wed, 24 Jul 2024 15:44:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Message-ID: <ZqEhRPvmgg2VgEaB@DUT025-TGLU.fm.intel.com>
References: <20240723191903.1753729-1-matthew.brost@intel.com>
 <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: bed8ae06-0e2f-43b9-e14e-08dcabf78f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N+5bzG01Yg4U4/YLFkF9YQPnIbd+VROH5fcKSyIZ41/pQxGQJMw3U80DhDHp?=
 =?us-ascii?Q?9ZdcUvLaVPykziGXSDNdmi9GdxDrGQQ3SFtq4eb15yQrj06RVrPEeIOh00Xt?=
 =?us-ascii?Q?9wlgka29F5po38yMwiqKjJ+5FpfAOJd0SIJt05R4g9Kv/xNHZLly08JbwoMv?=
 =?us-ascii?Q?Vn6qPx+mUy8gVP70vIdSiPH9C/xZsPjBcoP8GC++Zkxj7sG8xKgR9hhxBaRZ?=
 =?us-ascii?Q?lU9CtlIcsA/cttk1aU6/MPVUAH0Ny883zpj+9sIEXdG1soE/59GKhFeMcvSI?=
 =?us-ascii?Q?5dC3P3OYv11zaaW2nzpCrUAl3oUQY5gSdwTxO9GoyOsmpW+6FtxutfxZshkE?=
 =?us-ascii?Q?me34ulVFpU+mZEAFxI0GcePUaE6+K1G2JdyVebZzs0+s8XMUxsOrUw7NslDY?=
 =?us-ascii?Q?iTLlpnGyvsBwzuVsIceP15FC+z/sZ7EFkks0jgcMFXq9ViU7CLkjRwk/i7Xx?=
 =?us-ascii?Q?DVUldctFA9/DeDNnPqkkYpOqJCG1dvOvAsGNyUGqVe7op6nPMiFSWeLgNth7?=
 =?us-ascii?Q?7PxUOguYmHFYhMTxTZSjOVVk1ZGrZJhnJbqMeQFrthbVxndEKADGluPv0/jP?=
 =?us-ascii?Q?cfCZAZrD8gCMETvDjPt3295ZNqo0ehC2mW9K06umD6EU/cp8dlVAKoownGXY?=
 =?us-ascii?Q?Z3M8mVG9lD6BDx17Jhw0miYHk+FBTrIJvu+6AWCtvnqLjZMwHtH5OFK1Bp3v?=
 =?us-ascii?Q?pG9LtxOshF8gOb2x8cSgCV4/ob7Frf/qb7wXeSrX72ui5wEtegpKhX103Soo?=
 =?us-ascii?Q?DlfRvyiYvtz4KRPUle05+yKudPHjW9A3LO73f5vMeiwiJuIDSiPJPYhe4/kA?=
 =?us-ascii?Q?H0sN30UnJgWH2oQLcvrXRUsdKG5lk6+6K9RAiicalNbRfCozemSS7LWU53gE?=
 =?us-ascii?Q?oiaAxCO3SfcA+vmg9CPxQbuWbPblEhlgKLyHRhnlo5jGKseQyhS0ciPsJjb+?=
 =?us-ascii?Q?B8hbYtLeT5TNfdZQNvQyyRaNFfoKNQhQ3ZUdIKRLo86RTv6Fv/JSGIXNjWMj?=
 =?us-ascii?Q?MJ1ARzvYTsAuVFH2wxCT1Vzl4VwnnGc6ZdLujooEztnMkOoEWyZ+U4I69AAK?=
 =?us-ascii?Q?kKq/0HbYhxuj6CjQFYjZ3vmmOivDvkjur25yPglMCNuvvP9TaYhMDFY/cvhf?=
 =?us-ascii?Q?dDnFoQ+vMBVWBuK8MFh0bbeYgMjTtAU6Kl69gSNrosE/Fb8y3bZCJ3VuD28c?=
 =?us-ascii?Q?r8XR4pEIhJ2rHJsC45SjQFLAIGj3sNJa55+DmlTqhQvp3EtqUl/6clKDYLs/?=
 =?us-ascii?Q?O7SB3fjyHBPfUwHZ/BMZkvta1uu987GM1mQGhoHm4m81yPduwQ/JlEceS97B?=
 =?us-ascii?Q?12A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jR/xu0ws2e2/0z8sxxwcagdB8mF0BGvrZQYxzNH7XXYM/cjVc1g6C2MnEclw?=
 =?us-ascii?Q?dAdK01/WMqq1vUJEA8u6id2KT4ErI7DIymUECayvW+h77PDOnG5ErJDsQ33n?=
 =?us-ascii?Q?Sb9HetknFcXFbi7tiNo24N4JVIg1ytLba2vrsxZ6QuIp+K8uf2IIvpuyv3hy?=
 =?us-ascii?Q?dEbacYn6UfTvuKFJqdyNcoHTofPCyFHmh9O42SrqoLcak7j47DGnF4jOcGuG?=
 =?us-ascii?Q?xc8uj4gusPmoTpjSIg+B5InHuN/hTfi9WvFDFhxdOpBenXoEoqft9XWkoKkF?=
 =?us-ascii?Q?W26ZII0f+tLAe5stNmENOZIrODOJRbQ4UdYQnxBiK7KnvOvaomvjdyxSl9qC?=
 =?us-ascii?Q?3LamBtOKGjq4cYIJNjJupwUiYMaiZhxvIUnXmyZD96ErRf4XAZrpiRFav5Fs?=
 =?us-ascii?Q?svmLup1zI+fvWWVTTkbSDg15UIuzo7Tf8eavuc9W+/75cQLjPDSv9DbTXQ/m?=
 =?us-ascii?Q?pM4p83KF8fKfjsZAhPYtO2Ey9SS39/gNKbVBAyTp1pIXqbqQIiqdebkgIIMh?=
 =?us-ascii?Q?lEtmn3OqEifmBafqsbiG/bu3zDDUbsrgtQMTjfPyEOP+9ESkRpJOAwpjKmeB?=
 =?us-ascii?Q?lGiuzCOWxwlEMylUP/6wa3PmhhMoPEw3TB4zNF/1x3YzF3xDeWgDiQd9aq16?=
 =?us-ascii?Q?uINJ+HombV8+RIOfP6ABzupgBV78dnxK5aSxPtomvJz1c5xkISlVxjufOIp0?=
 =?us-ascii?Q?JAVuFZ4ePZ9OLb5IpFR25GUqpMCCce3sR7NvCjawbNPHVv6sgMjl+RNRc36k?=
 =?us-ascii?Q?kGyTK0YyI+ypGJ/bf3WSitqi4ImYeb1P8MHo0dqjlJcyg68clVGZKoJGevQl?=
 =?us-ascii?Q?L7LNgtAj5LdcUcxVD5EOyTebycWnAHY5ZeKA73WttIY8RVa+yLwDCO0pSRK8?=
 =?us-ascii?Q?JUBx9R7z+9Agb+/1aRK+QO6gkg3BXzVWNss2I/Rs79V2lO6drjzEzo9QJv9F?=
 =?us-ascii?Q?Qf64t2zpEZZSC4s6V7yYRr8VIw6k87k9uAjmk5lmHH9BfXWcLxr+smgTaP/g?=
 =?us-ascii?Q?IWEcZ9HFT18Ygdz3DJqwAInXLZ13W1Cv3mY9WBvcPuFyN+eNNIQiVoMdo3M9?=
 =?us-ascii?Q?OFvU6PWQWbYCFCOY9XKJeOedZuwaCJ1BIRfDlLRoCfz3jnaZYf0AzfCsKiAx?=
 =?us-ascii?Q?d95DCg0zgTPDvoTxyL03JxrbNDLKJjn5aHZvLMu9sjrvY9aqB44T0xNzXK+b?=
 =?us-ascii?Q?zRkZMb0fr3AY6oHufFkOEwwVIScdJXzODs+XcsWsKtSPVu+U9UH5NAD54L+e?=
 =?us-ascii?Q?z8+dYRlpOmcGhQBDVDGlXAy48xfkbF8lrc0lzGhD/rXDc5W8iIGs7XOnLOjd?=
 =?us-ascii?Q?enbqCnGzrWVNg7bpp2CpcQ25OcDEVrQ2BYijjrOmeus2vPJxSLcqvTpJPdiZ?=
 =?us-ascii?Q?gNrRDM/2QbKewF94idp3KCtLMrzmag2wdxHxHPfBt4JERho9sg0aGwD/nCCu?=
 =?us-ascii?Q?fju8P2/zKQpzirLQeGZ2JvLmJmUOrJwIAJjYbwUhf+j4wXftYCeE6mS7ejuN?=
 =?us-ascii?Q?ZgLf1/jHA3OkGRLCJMHpdOonoyjTV7OcWSwZOYWUzcuZ31cATroiJcdzpfgQ?=
 =?us-ascii?Q?19HgAusBNlvwaRJSwo9V9isk2Og/CNNfu7wWYKHM65pIzL/oHIm8/z6Z7kTg?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bed8ae06-0e2f-43b9-e14e-08dcabf78f8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:44:53.4336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtXq5IaDHKhNMOfk3fYyKYBiV2rfKSfJRgOigkyFX6mt9DMxmk2YPRtCjSJbpbZuYk9eHltcysWqpXDC8UokQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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

On Wed, Jul 24, 2024 at 09:42:11AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, July 24, 2024 12:49 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: dan.carpenter@linaro.org
> > Subject: [PATCH v2] drm/xe: Fix possible UAF in
> > guc_exec_queue_process_msg
> > 
> > Store xe_device ahead of processing message as message can be free'd in
> > some cases.
> > 
> > v2:
> >  - Including missing local changes
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
> > Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index da2ead86b9ae..b8f938539a90 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1395,6 +1395,8 @@ static void
> > __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> > 
> >  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
> > +	struct xe_device *xe =
> > +guc_to_xe(exec_queue_to_guc(msg->private_data));
> 
> If msg freed at this point, don't you need to protect against NULL, just in case?
> 

The msg is valid here, it can be freed in the below swicth statement
hence the bug in referencing it after the switch statement.

Matt

> Thanks,
> Tejas
> > +
> >  	trace_xe_sched_msg_recv(msg);
> > 
> >  	switch (msg->opcode) {
> > @@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct
> > xe_sched_msg *msg)
> >  		XE_WARN_ON("Unknown message type");
> >  	}
> > 
> > -	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg-
> > >private_data)));
> > +	xe_pm_runtime_put(xe);
> >  }
> > 
> >  static const struct drm_sched_backend_ops drm_sched_ops = {
> > --
> > 2.34.1
> 
