Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F9CCD187
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 02:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CF310E025;
	Mon, 13 Oct 2025 02:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WY1CvYg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C21110E025
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 02:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760321193; x=1791857193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SEUm29dTDrzmmQ7PtzxthmDjE88UXq8lg3FmH7OFVQo=;
 b=WY1CvYg3HRfyFDszifgn+vTN+cw97TjKErOUOoFVBpD8LFdV+29lFrHl
 exqoVCKHdV0PzSnVMr7fXWGt/A77VY41wfkJF2ZD4k4+e5dDWocB0E/mc
 edBcHxhIRUCb+GAwoIRa+QrLAP10maGw3M4txmIJoU5T87/tOf7JjW3A6
 PJi1UxqBDySC+MJiCebXj1aTA9O/ft4E/WUg311rp0Vsr7uEXj9vZEfQ5
 IaLoGRp/1pzcxbrK8QhDfR7KqSRNwph91NAb2WPA9pGEuRqszedXD0XLu
 ULlfHa8DdUoHcyDvoXA95dsHdBzg8iE9oi6y2C5SyeYHn2RE29aNo42fK w==;
X-CSE-ConnectionGUID: x0lXqLCOQLy00D46TYNbDw==
X-CSE-MsgGUID: 7pblHyeuSEeNVbyV1kmlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66311840"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="66311840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 19:06:33 -0700
X-CSE-ConnectionGUID: kJYn/HyTRTux+kyugHQyxQ==
X-CSE-MsgGUID: fXM8fyW/SOKHUqZbCvxiSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="186756421"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 19:06:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 19:06:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 19:06:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 19:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ty4KhhXAwqNH1epMlCZNdtkm0Xz3I/WacqEj6tfqIiirLnM89tSn5517mIM+SgyDgChDGj1tvDcFQi/+FEh+vyYs7NmemWoRV977Ewh291xiJOoxk7YNF+iiupI030U/OaQquOaWnEVw9BBVkKm4HayNFHFdxDMGxgl1KgBrHzeHgGgdVUannEH1EO1ROQpY73SxsjQGOs7LyOpzT+cdz5BHKZN/UfT6RCGyuI3WKFu2r27i/dScU4pN1MIrC9pdBwJA0/x1COUZPta+vHddp88uTF4P/3YrfljhomL+3+XjBai3jBbti6QVmcfRL2HK02Ob92bgTySYXl1SOnaW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4W4gOw+Lao0HzVSBZGGIcQMpFEl9Z7bPmJyDVldVWI=;
 b=jZbohxKtbRTJvSsQNiuP4DMi4GtK9eGI7HMULjfM4G2fp0JvXKpHHQMxqf6pvy6A0FXnw7qARoNFFVTcZLDLdMQ4L/dy0sitnzFtKRi4d+gMtP4SIOXqf/HxoTex6OUfn1gW0EbvU8BwkgXNDOfVypeEegydeseAjPP76//ncG1XUW+S932Jmo2Aq1mnTWakZ/73w9xp6iDunm0hXcNlSEeRPaAFmjrxEK3DdDAqHfvaknOU/UrZwGWHE2tlf/I2/S0ZX7CyRe3gDq5AgSkcziSSy0tARHA45FEkIRwIVZsZ0MVvCt2yOw5xSsDlsJc00oW2bPuzEgLt4WRT5SKqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 02:06:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 02:06:30 +0000
Date: Sun, 12 Oct 2025 19:06:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Message-ID: <aOxeoq+ZC5BDnFSd@lstrano-desk.jf.intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <20251010172529.2967639-2-shuicheng.lin@intel.com>
 <aOpz/xRmpC+zQsrI@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456FF896510A5EABEB9A365EAECA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456FF896510A5EABEB9A365EAECA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:303:8d::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 846a40a5-d56f-4c20-574b-08de09fd1fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X6AbY0HS1Hb1V1gSn2S/Rvf2zU74nn27LX3IhOkLcSkGcy4LZKNe9uzDzyyZ?=
 =?us-ascii?Q?LDJvp25ToSvWCHtDvDegIUtKXAxSYKmEk+gFFmzkMvSfx7lJO5fWX/hcYCCz?=
 =?us-ascii?Q?S2lQtJ3LZlz88V3FRyX+/vTtNvrB4EHqDvm71UYqp475Ckqv67Q3CK53sNgr?=
 =?us-ascii?Q?Xe3Ezu9HEk1jnyUuyowxN3qB6+98d5YtZbalpKYurOlY7sYkdfbluAeznbv6?=
 =?us-ascii?Q?QjT6DENzFhuRn9Ik1bnHn8j1rJbbYYrw7pkjKZk7bVuAHa9TlmeqC6WDIuRk?=
 =?us-ascii?Q?x+xmZrveUqbakDJP69vANMK9Etr8USbC2ST7TLaOUw74GI5QJwpFwkbAf/CH?=
 =?us-ascii?Q?6xOkOB+10cOYCuLgpyM4Le4Qf4UFHrgZ20Adr+C+YU09lLkdJeEv7CApxyG5?=
 =?us-ascii?Q?v/KUUuTnU9d/WYmIB00QGN0uJw1OoQDNMPM1R8p5Qbhdhqvr1DjXurcjoG+x?=
 =?us-ascii?Q?KGr7uYaaUmDGJU3zHozaOW35kIJZl1e3PYhpHCFTgDy4zskOk9w2BWTH++i4?=
 =?us-ascii?Q?+0ogu6MNZv/Pm920Up0zF6DHgdFUycNwUwFEPxGi8JGMAjyAYOJ37FXtMfMT?=
 =?us-ascii?Q?CLC8Xrntt5dnJ1qmPFI1BjT6QBMkcocgeG1l2KnQxFi/Cxg+xXGsTmMuAtrO?=
 =?us-ascii?Q?JXny7FI/3eOm0plvQ7MgkfEydNtpBW+QNW2YmmHh+iHFN4RctU9IACwaKTq2?=
 =?us-ascii?Q?6S/myjRRxo00BWddIhXz4F30RPOOZpRGGpwKIJcRYXKzMQKw4soDQGPF+8Zk?=
 =?us-ascii?Q?ErNsRuoOZNG+vax4uHhEtp694i86+KsTzdXi9xOYIcMW9VyEvw2yyEkso3Vv?=
 =?us-ascii?Q?SBvKtc2kVvs/LlqPNxHJogR30j9XvYSkLHEbwqfyr6Xm1SHiYSyseFW/soVH?=
 =?us-ascii?Q?Fab7v3FkB00fqZvaNy+d56WNPnmWsql4pLJ4vhWH4YDfoxl+835iKmEutUwn?=
 =?us-ascii?Q?FFplyAJbvXn98SBgJEW94ZMoGqPEbwa9VfZIBwW6JUUj8IP58PoxnVLZlJKq?=
 =?us-ascii?Q?lwkU927PXC6deNFVwAJlFPEOmFifAwZfWajIMRUfUjKhmuFLEWS56s8HEbVa?=
 =?us-ascii?Q?kpeTG3QojHzdJGYzPk6Q9fvgW8EI+j08NJqJwdXiRFRaa2E8INHFI5lrO5wb?=
 =?us-ascii?Q?lRhFU6/usnFUczI52hWTL4f3q6cj0RP7b5eyilCpMCi4DA2EXpHhXE02hgiM?=
 =?us-ascii?Q?UjY0js/1FLTUDhx245UhadYtdgj213qVsXmXDtVqqltcaUJdPcJdEMJJDke7?=
 =?us-ascii?Q?WhrIfGbQvYB/reJVD6l2owEkoKy0Og729kTZaE0IPRBD8vLVxiDU8fxsskbm?=
 =?us-ascii?Q?JALcLqaSwjMHrCeKu51v1DxwoS0EJYISlNNuTUi+oh2RuH5mBkEngKIOKc1z?=
 =?us-ascii?Q?lALhrP08Luz52MNKMPMvL/N+wDK9pP8vHXQnYuGKrK7aFMC2YT+nIqi5fp/h?=
 =?us-ascii?Q?wDmlDRbemsDB52Vq7NACtzbFddC7PcE9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnzcUcpC+OmjG5NF5lGjSbL+ZMtCpdNvgNhpRRc7E8yGbp4748lB+zQsI0Xo?=
 =?us-ascii?Q?uVbLFloQ/nfiNoaG7o7/kJ3NoRIZ2xsTYM1i2bPzY6BP9GSLGokMAFsQPEDf?=
 =?us-ascii?Q?scfzv1D+cY79fj/u5l7SYt+O3sVWcnMWJq2WSqMmwBCAAgiJqDRPVZD59hhu?=
 =?us-ascii?Q?BOh/hBVhdPlbJWlarmnYRpPxO66Z7WFH8mR1t2eiZJ5Kl3RFWQBD/olfbqIZ?=
 =?us-ascii?Q?Jg2X05U6mg/gyq+FFTMfJ0KLAXAF2fgEf6K+XHFfJF1xN2gKSAK3Qn9qn7km?=
 =?us-ascii?Q?HxsjwzXQgw6Fbp9OIw38mbUAmhBzZ2cOcbJfcVAxTa4UCv9AixFtnQTEr5Hb?=
 =?us-ascii?Q?OPJ7dEsHZzQ7gBX18icVb+qPRJMPHRvH6hzlaL6uxlAcPAochFiBMoHeeFUp?=
 =?us-ascii?Q?1db2w/vDeezZ0jB/rIJ6RV5tE87BM0ibEwtWefox87+vE1j0wXRM3o2DL+gT?=
 =?us-ascii?Q?lVRQ7/mYBhIUr5Ckq/7nizEq7vwCve6PHhrPWYsAxISDnaw5RUt0V06ZzmSS?=
 =?us-ascii?Q?EklIvaRkUfKDVP21NT4R3HndoXCeyRzNwXp/JXl7bbjNLZOrQBVI2h3zQTUz?=
 =?us-ascii?Q?kH2Mn7vh68YZ9cKDLDSOAwYb2/cpYFHlZ/oc0VQwsSBw1b3ZOtl1kwpUHa+J?=
 =?us-ascii?Q?ISt/kBlhvF35lkvsrN1iMcM5zkNjX038AyIVkBELL47WdTv2PaEWcVMYADPD?=
 =?us-ascii?Q?R5PTJi2LO6/YlEiAb8lNWLsAOhnnWUntjsbSF4++blJdqI4jRUwxS3HJ0jKA?=
 =?us-ascii?Q?YZomG+o8khpEGTIxbKGQYExO1U0PPJz3zCqUx8Mbqsn5jGMOJt4dUXQX/dPl?=
 =?us-ascii?Q?mstJTgiQGRg5q25q2HkjDaROcKifPyzLcwIthkAETimW+LeWHCEZ2oRKwbkR?=
 =?us-ascii?Q?PzaPJoj77Zq6p2vAKdgK/mXXT6tCr9EhQAYtI7u1sYwbfwEZ7ZLerr20FHnz?=
 =?us-ascii?Q?ja6iJIdAIoRvVG/3qlthHHxNYbtPrWi25A08A7+L+3vfAvL5jRAT0Xj7sd6a?=
 =?us-ascii?Q?tmI1RjdBfWTyDyWU7K18GC17ORap4a2+niKSrZz0SEiVG/d1f7u7g8Oet5yj?=
 =?us-ascii?Q?+Lz5SPgwp/IxFdf+BVJYYF/5N3Dpzi1cr18Isi0c/DrB6bgfmd3jVOvgNXgq?=
 =?us-ascii?Q?WP72WWRJE0Y1FTqnH193rmSBAijOFhzF/RD9HEKuaHaHsBIDJSt2e1DPB+yI?=
 =?us-ascii?Q?lXMReuvTyPMUoxxpuPbQO/hUfUPStXFmhtrQ1pNNLWjocBqFXAHIHQTCLPKG?=
 =?us-ascii?Q?PIBdhhbWi8/eIaD5C74zJKZfWTLLYFJbdTf3yyKLEOaF0MlOB/v9Svr6E7A4?=
 =?us-ascii?Q?DMGnBvOWllK3aDoSnGjrSMbnABuo7aS6kOpquCfVcW4PSr99mvwT54A66rOd?=
 =?us-ascii?Q?GM8tMIKZFYrArWsMwFHavqPCR7RQLcVXpGfEjiOz3MlTUVwBUVeZP+tdH8+f?=
 =?us-ascii?Q?LslmThvrG+szWPaNhlJXohPwwq87SKA9kXSLdkqCtOGqBvhXQfKzNXqrBKvm?=
 =?us-ascii?Q?hVnDKznsplpom7V/X4Q+kAIzBeQrnzhGP1zH3I1lieQK1CDfsTvdXLc4d3qV?=
 =?us-ascii?Q?N8IFLvljXgIUM/iPY15AZBcxKsVKXF/iNB50ksBAKQfKcwswTMaTLosZhiCe?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 846a40a5-d56f-4c20-574b-08de09fd1fbe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 02:06:29.9756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vfs8M3q3Iv9BdTBB2MLkCO3hmvWpbOchwHY2DbR7xvCo2xb1gFiPeQdiDuBQ6Uyw3e1i/fbESq8fr1Jy8MWJ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

On Sat, Oct 11, 2025 at 03:35:34PM -0600, Lin, Shuicheng wrote:
> On Sat, Oct 11, 2025 8:13 AM Matthew Brost wrote:
> > On Fri, Oct 10, 2025 at 05:25:29PM +0000, Shuicheng Lin wrote:
> > > In normal operation, a registered exec queue is disabled and
> > > deregistered through the GuC, and freed only after the GuC confirms
> > > completion. However, if the driver is forced to unbind while the exec
> > > queue is still running, the user may call exec_destroy() after the GuC
> > > has already been stopped and CT communication disabled.
> > >
> > > In this case, the driver cannot receive a response from the GuC,
> > > preventing proper cleanup of exec queue resources. Fix this by
> > > directly releasing the resources when GuC is not running.
> > >
> > > Here is the failure dmesg log:
> > > "
> > > [  468.089581] ---[ end trace 0000000000000000 ]--- [  468.089608] pci
> > > 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> > > [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> > > [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> > > [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> > > [  468.092716] ------------[ cut here ]------------ [  468.092719]
> > > WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298
> > > ttm_vram_mgr_fini+0xf8/0x130 [xe] "
> > 
> > Does public bug for this exist, if so we need a Close + link in the commit message.
> > 
> > Also I believe this warrents a fixes tag - I can add one when merging this for you.
> > 
> 
> No. It was found during internal validation. I will share the bug number with you offline.
> 
> For the fix tag, the logic is implemented in the initial version of xe, then the function is renamed later. 
> So this patch cannot be applied to the initial code directly and makes me not sure about the fix tag.
> I will leave it to you. Thanks in advance for it.

Just so you know - the flow is always apply a fixes tag even if it may
not cleanly backport. We hope the stable maintainers can figure it out,
if not it on us to provide patches to stable kernels which the
maintainers of kernels can the apply.

Matt 

> 
> Shuicheng
> 
> > I'll wait on answer to my first question before merging but this LGTM.
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > >
> > > v2: use xe_uc_fw_is_running() instead of xe_guc_ct_enabled().
> > >     As CT may go down and come back during VF migration.
> > >
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index e9aa0625ce60..0ef67d3523a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -44,6 +44,7 @@
> > >  #include "xe_ring_ops_types.h"
> > >  #include "xe_sched_job.h"
> > >  #include "xe_trace.h"
> > > +#include "xe_uc_fw.h"
> > >  #include "xe_vm.h"
> > >
> > >  static struct xe_guc *
> > > @@ -1501,7 +1502,17 @@ static void
> > __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> > >  	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> > EXEC_QUEUE_FLAG_PERMANENT));
> > >  	trace_xe_exec_queue_cleanup_entity(q);
> > >
> > > -	if (exec_queue_registered(q))
> > > +	/*
> > > +	 * Expected state transitions for cleanup:
> > > +	 * - If the exec queue is registered and GuC firmware is running, we must
> > first
> > > +	 *   disable scheduling and deregister the queue to ensure proper
> > teardown and
> > > +	 *   resource release in the GuC, then destroy the exec queue on driver
> > side.
> > > +	 * - If the GuC is already stopped (e.g., during driver unload or GPU reset),
> > > +	 *   we cannot expect a response for the deregister request. In this case,
> > > +	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
> > > +	 *   will not process further requests and all resources must be cleaned up
> > locally.
> > > +	 */
> > > +	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> > >  		disable_scheduling_deregister(guc, q);
> > >  	else
> > >  		__guc_exec_queue_destroy(guc, q);
> > > --
> > > 2.49.0
> > >
