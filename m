Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79CC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A306410E476;
	Wed,  2 Sep 2026 07:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Baq9jGVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA2010E476
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788335144; x=1819871144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LXI/cTj277py9bR14D3hss/Ov6hGxfwTUxcS+SSjnL0=;
 b=Baq9jGVx5VHZt34gGO6McCdkDLFxPS9fnE9YLTvekHdc+4e0/0DYrvHc
 /T9fkk/YZvWxfmh8IBCBCI++w3lqjY3T6XepkA7VXfA8XtNUtEVtoT56P
 V1UtEAh6/TMLKeMFfkCCYEBDLE90DxRimSAtiWdyYCsdGoj5NY2UYWTz2
 Cz+CsIUqRm4Nqm0nA5vlCseQHxsGR5xphP0uml6aq87Ygqq98chpfK++0
 yfkf9XU5QGeN7FlriA5pdWL2oUJJia6bAYT2kSgSbwij/Ns2la8Nmxs86
 hAgROGgenlyjHaWYD6qhDA2u6kwUxGiWOmEpb7Z1i90yfGT/kIuXgf9eT A==;
X-CSE-ConnectionGUID: 2aTy6fLATJK607g0m5DaAA==
X-CSE-MsgGUID: Gjo6mcdHR2uNB5QZZBAXug==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91296340"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="91296340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:45:44 -0700
X-CSE-ConnectionGUID: +WGb6AyKTt+tJHJz27vsZA==
X-CSE-MsgGUID: x0VC2QbpRP2huBNfU631Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="307553459"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:45:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:45:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:45:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nssOUKRcfwihxJGzQJP+lEedD8MRjDMM4FSCBKhkUwjsNrmSDa17LnZ2eSmHMliG31vEpLBIS3HYNjUEv+Sjg+Ur5LoCriC4sPBSCYmuWKk5JeSBbQnWWTl1y0TSKwdUdu6Esr7weZSNY9R6btDMwA4n2TmcDeWBtA+6r51uOIp8CxGG4ZsqXpSp7VYmBhSTDZxdeU6FuRLNOPws9KjsA0LrmLaMFcvuifxvTk+Ln5UvWClJWiqCv5MMSx3eAYpDVBU2gCN5LknSwgmXxUG93fa+Ss4x+kWN6+4o0NsjTrhj9HH7oGeA/kn8vNpEDJnlnQMAwN73o+4Gqk0aUF4C6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AAOFMJ6CHY8WXmcWUNgiCxU3pf5QVpfL7g7E83H+XQ=;
 b=Efc947/m14GZj9WcaawXAmP6p0+gs7sFkYgs5/YDPes/Hrmh8nHQvKEVN0qs/iq143/VuzgPCdNrkcLOjXbvM4KoJvXJPzJeic0nvqNBh2VbSgTB6jFp+mBymY/zJMhtzsQzIEYdPqqbpoPG56F5p6QXJM/J5e8+DipF9jHzgdm0lomrabrMEVOFB8b5ouLNm6s1ghgeK2wPV8B8H1k6d+zIBHcW3gpC9LrA19fX0E0kWUfmlbtvy91Ai+ngDcfGD/9LSRNaShszsyc3QMW6jk30sycdv1EL9Hoeso8k73H43llsHthE8dmx1jN3tePWOjEMO6zW8K7R17YO/srEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DSVPR11MB9891.namprd11.prod.outlook.com (2603:10b6:8:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:45:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:45:41 +0000
Date: Wed, 2 Sep 2026 00:45:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/xe/vram: add early VRAM health check
Message-ID: <apfUI0/g1ZODGf1a@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-12-matthew.auld@intel.com>
 <1e9b3dd558f064b431f90bad76437b52d6d853b0.camel@intel.com>
 <962d9e46-0c9b-4964-9a82-765bfd7a8122@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <962d9e46-0c9b-4964-9a82-765bfd7a8122@intel.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DSVPR11MB9891:EE_
X-MS-Office365-Filtering-Correlation-Id: edb73fc3-a9be-4f56-54e8-08df08c6300c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|5023799004|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z+X7Wa3pvIB3+sqUB3bTKiOusmNyOSstl0xbwLpCiAk4cnrvhwrOqjHSg4D8oxmdDvxshVAC3us8Kytn9CmybEFNACxTy+5zdPPjLworV2y0LtCTZc+oyf++MFZ0XJ2erO13Mi8G6YhJjwbq+FKK3mWE+0jwOblRTyA4SESeFjx287k/S7klYywlW9kUhY32nhyDBI4Ytw5IeX/GxlNlZ6FhJxVyLRTfPe4/ujRFbBODHpeofFalghtPM7HaVkCGMJTnLgXPFLyM2UPj9BBsH4JkOEK5B+dslWD5IkXfgsFIbvsYlWn37mDyiSm5OK8DLvYLp8XOa1+BPDvOzsEw8n/wglmvowON6JmAtdgUk12cbRTD47JmAk6m5WCl1DbWzzSOTxceZOBMaCjo200d/d/nn2d74iiDxkFdA/bSXneuslioUE02U2cx702FBlLDuLKQu2ZdEzNEVPfN2SMp4VQvXVjLzayb1PENMSDsXsg5uxg/m8oHq0P2GxKMrKmpYU7myjkcYa2hApx9JCUrAvGlV/U4wPyi8Bo/3Gsg5di8A9LyEz/U72JPb8JiUCqLxHWThS70VuwWEgMkZdxOgX/6YsKFoBLAlVtzt6ld9t1O5eR2bqH3DqMnXjbFcT9m5K4noOax416k1sCGZt3i4E0PvzSPI1TzJotSOArDMIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YxMa2QfXTnSptxjshKGeR44t/gYY44v4Yid+rHPa+xCAAGma2G5dTGKXuN?=
 =?iso-8859-1?Q?rH0nHYgIcoJrIbQV5a/KwW/IvMFKO4YY59KoCOa6Bhxf1XdhIn+cPpl0TH?=
 =?iso-8859-1?Q?IyGU2MglPTRIIJKYYOlA9DXUBfsRa+Psu+EdWIRYSB2UNfeZlnULbH/LYZ?=
 =?iso-8859-1?Q?vQYBifmOwCGPJ3I+sOxDKgzK/KcyN4eFOOslge3VPMaRKHxssEtSxXLxmy?=
 =?iso-8859-1?Q?/Lb2q7cNXul9vtC0CRS03eQlUE8kF5jhfDBsYLnTlP5u+fTrDafvi6yf8F?=
 =?iso-8859-1?Q?ZWruiC1It5wtGQUlszsE+2Jcmu/89Y3x1/ICN+6arf+jCsODDKnQQpV3e4?=
 =?iso-8859-1?Q?c0i4qlSRkCLKj2aPScgJRatRw6Y6ASiDA20PfpEq8csqoTgTgqs/1Quyhj?=
 =?iso-8859-1?Q?afiRF9sEj+tPptJf44UyJSFqPDMRmnAr9lD50STh7q2dFHZResh+JvcM1y?=
 =?iso-8859-1?Q?MQ73xAQWlh00aAcsAoDwVrRtKhkDImUYlSJr8RRo9JPaPLlkfcOe1Zqbut?=
 =?iso-8859-1?Q?cIwvEy7c0d0GGOFCAj6VXuZtYrYV5xvAochj0VtaxCCJRwPlupWIx64AL5?=
 =?iso-8859-1?Q?Z7OFYsrp1MD/29omIpcgxy4Z90Zrry9qDlo8NWrKLavRuOjCg7KkP+94BI?=
 =?iso-8859-1?Q?PsngZUMeTzt4xXAEjPrJZ5ApOiZElbm6VLYvWeGSIqCjg8z6jhdxRDg2+3?=
 =?iso-8859-1?Q?ymxOSLyk4lECrSz2LqO3Bh5aCxKhq/ktphsnGo6+TTQIn0e9bqcr1AG1Qo?=
 =?iso-8859-1?Q?UfqrPF2Dk1hXUTQzZBGreEiXwXygZtUSbWic52G+yBJHYl1RRV1mRccF8S?=
 =?iso-8859-1?Q?QJnbOeLEudgyj1LmKFImPkmyAyyYdvd/Ku7VY9XX0Zzzf+SPRv+CEJazjD?=
 =?iso-8859-1?Q?Avs20mQQABNKJK84+i/b+itKBtJTurky2q2aUcHNVopCcbwfD5VHgMH0aV?=
 =?iso-8859-1?Q?CJlUJy82qfhyeAbGF8u/TJn2sxRSrgS5bNp0ISfiuJfip7iACYFilMOVFT?=
 =?iso-8859-1?Q?MNn5cDnqj/NE4JjBy4UA9Len22hGGkcEFD8yDqSDeQU6PDQVgtw+BAiKtb?=
 =?iso-8859-1?Q?sdmTgOVhjK36hnb52ukwjpwz/PpIt7jDH1sEPHjNJGL1zzOEjdTEs3ROD2?=
 =?iso-8859-1?Q?+sXdxtK1p94XMCmsQ9U+0CCeuge6RovuTTcw90GOEof3bCK3D71sD8tigO?=
 =?iso-8859-1?Q?dshX/mz5jSDp6aNGAiTtsebRttSwFRnRsel91lKlpRUL6HnCcmE+UF/x8M?=
 =?iso-8859-1?Q?zoQPJvRzaHa5MpC7jrmjOVXTUGJjwN01BChZyi5wVjpkLemQecBVRKcxk1?=
 =?iso-8859-1?Q?eFvP9tybZjnch49toX+L+ZVDe2gbt8CwPMjUN0NDXiJSC+nvNwaiGtu02m?=
 =?iso-8859-1?Q?IhHCKJBhmcUlPRy9Y93x1+IVCu/0tZjI2FMiItmog/ZnutvK2cVLyNGbzC?=
 =?iso-8859-1?Q?ox0aweZxUcS3BiqZz8xYwn5saDpjOL39szPUapRDsF/Eb2BE6v6aZjc9uG?=
 =?iso-8859-1?Q?Rbno2mS7I5pWSleVtAQcvm/+EpLKaBm0FXVFFlwvSV7shng3rPtcXtdTgv?=
 =?iso-8859-1?Q?aRhQ/9/DYUOR/pFFzwYSd4GtVNTVHelXpe58HX9DiTKxcauHUq15w69Lr2?=
 =?iso-8859-1?Q?fprUI3MXW2X1ouOA4OZJ0t2Db7GYnL40bCpqgCr6igR9f8VQg5P/4bp5Ae?=
 =?iso-8859-1?Q?R3SRLmP9lI8EIfpG50mzxopCYHEOCPZ+9XWLKE5+tZ/j7duZJBLU28wb+X?=
 =?iso-8859-1?Q?+fbeQ3Iau/3BASo8gMNNV1KVtTDVWrKWwezjhRPFlLVC2oHUYzrEfFbpZ2?=
 =?iso-8859-1?Q?Sr3q6HfPNcHXiwqTq6dHEatcrrdrPBQ=3D?=
X-Exchange-RoutingPolicyChecked: NesUqTHsnWwSaT1Rm7F+I0dqlhgNc+uTRIqlsGRqcgQIyAH9B7NhiF+GcA322y/PS+bC3/GYa2y5gZchcxZHmPmLGN1s4mDOAUc7Q+24nCGI+nSbyL4zbGC7j6Er8NHOytyWwu/TYmEqea3tsndDTmNJg0OQemhUBakfBJH4FfCwfC+Q2aaUj9uTvOoWtN1tqCuFKoOB/hFxB2t6D2BzZ1/3dbRuG9SBlVzGouVeRNNE+9qKNg4KQXhNqhuqUlPPUqtfn7tY2gKXU4CxA15TsYxto0Ycj7rOKzhfQR5zgjtw5dSGMY1xBGrwwEQjYgjrRv57duByD91rCCr4NGVusA==
X-MS-Exchange-CrossTenant-Network-Message-Id: edb73fc3-a9be-4f56-54e8-08df08c6300c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:45:41.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YggROVsUNGE3nrbDn3vpCQ+o0q6tVKq1m1MqKvhf4NvJg88w/e3Emd9ij9E3mmqT0hY0sv9FfOtb71f6XKE6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9891
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

On Tue, Sep 01, 2026 at 09:33:21AM +0100, Matthew Auld wrote:
> On 28/08/2026 17:37, Summers, Stuart wrote:
> > On Fri, 2026-08-28 at 16:14 +0100, Matthew Auld wrote:
> > > During early probe, use the last page as a canary for BAR sizing, CCS
> > > sizing, identity map setup etc. If something is wrong the last page
> > > is
> > > where we will likely find it. Hit it with everything we have. For now
> > 
> > Sorry coming in a little late here... but why only the last page and
> > not implementing a full per byte/bit memory test to trigger any
> > potential memory scanning on bit errors? Or is this not the intent
> > here?
> 
> Current scope was just to catch obvious sizing errors, which will likely
> show up in the last page (BAR, CCS, identity map). In particular this was
> meant as a regression test for the bug Linus hit, where we had incorrect
> VRAM/CCS sizing.
> 
> Also, this is hopefully non-destructive, since it gets triggered in CI on
> probe. Also means it needs to be fast. We could extend this in the future as
> needed.

+1 on the approach.

One nit with this patch: the commit message doesn't explain how the test
catches this bug, or even what the test is actually doing. I reverse
engineered the test and the code makes sense, but I'd suggest updating
the commit message to describe the test case and how it exercises the
bug.

Matt

> 
> > 
> > If this is a production scenario, the last page makes sense, but if
> > we're already wrapping this in a debug config...
> > 
> > Thanks,
> > Stuart
> > 
> > > this is gated behind a debug config option, so shouldn't trigger on
> > > production.
> > > 
> > > Main motivation is around CCS sizing where on some BMG cards the CCS
> > > offset is programmed misaligned, for whatever reason, and our
> > > handling
> > > of that was busted, as found by Linus, leading to some amount of CCS
> > > storage getting pulled into the allocator as normal VRAM.
> > > 
> > > Nothing in our CI farm has such a misaligned offset it would seem,
> > > however I did get this to pop on my b570, which does also have the
> > > misaligned CCS offset:
> > > 
> > >    Tile 0: Running VRAM memtest...
> > >    Tile 0: VRAM bounds overlap CCS region! VRAM sizing is incorrect.
> > > 
> > > With the fix from Linus, this goes away:
> > > 
> > >    Tile 0: Running VRAM memtest...
> > >    Tile 0: VRAM memtest completed.
> > > 
> > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c     |   8 +
> > >   drivers/gpu/drm/xe/xe_migrate.c    |  64 ++++++++
> > >   drivers/gpu/drm/xe/xe_migrate.h    |   6 +
> > >   drivers/gpu/drm/xe/xe_tile_types.h |   4 +
> > >   drivers/gpu/drm/xe/xe_vram.c       | 241
> > > +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_vram.h       |  10 ++
> > >   6 files changed, 333 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index 82e0a555fa69..80008bf5776c 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1051,6 +1051,10 @@ int xe_device_probe(struct xe_device *xe)
> > >          if (err)
> > >                  return err;
> > > +       err = xe_vram_reserve_memtest_bo(xe);
> > > +       if (err)
> > > +               return err;
> > > +
> > >          for_each_tile(tile, xe, id) {
> > >                  err = xe_tile_init(tile);
> > >                  if (err)
> > > @@ -1067,6 +1071,10 @@ int xe_device_probe(struct xe_device *xe)
> > >                          return err;
> > >          }
> > > +       err = xe_vram_memtest(xe);
> > > +       if (err)
> > > +               return err;
> > > +
> > >          err = xe_pagefault_init(xe);
> > >          if (err)
> > >                  return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 0bf000d7c901..ff45c24d8889 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -2650,3 +2650,67 @@ void xe_migrate_job_lock_assert(struct
> > > xe_exec_queue *q)
> > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >   #include "tests/xe_migrate.c"
> > >   #endif
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> > > +int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> > > +                                struct xe_bo *scratch_bo,
> > > +                                bool write_to_ccs)
> > > +{
> > > +       struct xe_device *xe = tile_to_xe(m->tile);
> > > +       struct xe_gt *gt = m->tile->primary_gt;
> > > +       struct dma_fence *fence;
> > > +       struct xe_bb *bb;
> > > +       struct xe_sched_job *job;
> > > +       u64 first_page_dpa, clear_L0_ofs, scratch_dpa,
> > > scratch_L0_ofs;
> > > +
> > > +       if (!xe_device_has_flat_ccs(xe))
> > > +               return -EINVAL;
> > > +
> > > +       first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
> > > +       clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
> > > +
> > > +       scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
> > > +       scratch_L0_ofs = xe_migrate_vram_ofs(xe, scratch_dpa, false);
> > > +
> > > +       bb = xe_bb_new(gt, EMIT_COPY_CCS_DW + 1, xe->info.has_usm);
> > > +       if (IS_ERR(bb)) {
> > > +               drm_warn(&xe->drm, "Failed to create bb for VRAM
> > > overlap check\n");
> > > +               return PTR_ERR(bb);
> > > +       }
> > > +
> > > +       /* 4MB payload = 8KB CCS metadata */
> > > +       if (write_to_ccs) {
> > > +               emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> > > +                             scratch_L0_ofs, false, SZ_4M);
> > > +       } else {
> > > +               emit_copy_ccs(gt, bb, scratch_L0_ofs, false,
> > > +                             clear_L0_ofs, true, SZ_4M);
> > > +       }
> > > +
> > > +       bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > +
> > > +       job = xe_bb_create_migration_job(m->q, bb,
> > > +                                        xe_migrate_batch_base(m, xe-
> > > > info.has_usm),
> > > +                                        0);
> > > +       if (!IS_ERR(job)) {
> > > +               xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
> > > +
> > > +               mutex_lock(&m->job_mutex);
> > > +               xe_sched_job_arm(job);
> > > +
> > > +               fence = dma_fence_get(&job->drm.s_fence->finished);
> > > +               xe_sched_job_push(job);
> > > +               mutex_unlock(&m->job_mutex);
> > > +
> > > +               dma_fence_wait(fence, false);
> > > +               dma_fence_put(fence);
> > > +       } else {
> > > +               drm_warn(&xe->drm, "Failed to create job for VRAM
> > > overlap check\n");
> > > +               xe_bb_free(bb, NULL);
> > > +               return PTR_ERR(job);
> > > +       }
> > > +
> > > +       xe_bb_free(bb, NULL);
> > > +       return 0;
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > index c3a268b01768..a9acc62f78f0 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -182,4 +182,10 @@ static inline void
> > > xe_migrate_job_lock_assert(struct xe_exec_queue *q)
> > >   void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue
> > > *q);
> > >   void xe_migrate_job_unlock(struct xe_migrate *m, struct
> > > xe_exec_queue *q);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> > > +int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> > > +                                struct xe_bo *scratch_bo,
> > > +                                bool write_to_ccs);
> > > +#endif
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_tile_types.h
> > > b/drivers/gpu/drm/xe/xe_tile_types.h
> > > index 0048100ccb72..e1368c04846a 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> > > @@ -97,6 +97,10 @@ struct xe_tile {
> > >                   * Only main GT has page reclaim list allocations.
> > >                   */
> > >                  struct xe_sa_manager *reclaim_pool;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> > > +               /** @mem.memtest_bo: VRAM overlap check BO */
> > > +               struct xe_bo *memtest_bo;
> > > +#endif
> > >          } mem;
> > >          /** @sriov: tile level virtualization data */
> > > diff --git a/drivers/gpu/drm/xe/xe_vram.c
> > > b/drivers/gpu/drm/xe/xe_vram.c
> > > index 0a2f1ab8416e..4a79580c5315 100644
> > > --- a/drivers/gpu/drm/xe/xe_vram.c
> > > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > > @@ -17,8 +17,11 @@
> > >   #include "xe_device.h"
> > >   #include "xe_force_wake.h"
> > >   #include "xe_gt_mcr.h"
> > > +#include "xe_map.h"
> > > +#include "xe_migrate.h"
> > >   #include "xe_mmio.h"
> > >   #include "xe_sriov.h"
> > > +#include "xe_tile.h"
> > >   #include "xe_tile_sriov_vf.h"
> > >   #include "xe_ttm_vram_mgr.h"
> > >   #include "xe_vram.h"
> > > @@ -403,3 +406,241 @@ resource_size_t
> > > xe_vram_region_actual_physical_size(const struct xe_vram_region
> > >          return vram ? vram->actual_physical_size : 0;
> > >   }
> > >   EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> > > +static void memtest_bo_cleanup(void *arg)
> > > +{
> > > +       struct xe_device *xe = arg;
> > > +
> > > +       xe_vram_free_memtest_bos(xe);
> > > +}
> > > +
> > > +int xe_vram_reserve_memtest_bo(struct xe_device *xe)
> > > +{
> > > +       struct xe_tile *tile;
> > > +       u8 id;
> > > +
> > > +       if (IS_SRIOV_VF(xe))
> > > +               return 0;
> > > +
> > > +       for_each_tile(tile, xe, id) {
> > > +               u64 vram_size;
> > > +
> > > +               if (!tile->mem.vram)
> > > +                       continue;
> > > +
> > > +               if (tile->mem.vram->io_size < tile->mem.vram-
> > > > usable_size) {
> > > +                       drm_info(&xe->drm,
> > > +                                "Tile %d: Small-BAR system detected,
> > > skipping VRAM memtest\n",
> > > +                                id);
> > > +                       continue;
> > > +               }
> > > +
> > > +               vram_size = tile->mem.vram->usable_size;
> > > +
> > > +               tile->mem.memtest_bo =
> > > xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
> > > +
> > > vram_size - SZ_64K,
> > > +
> > > ttm_bo_type_kernel,
> > > +
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +
> > > 0, false);
> > > +               if (IS_ERR(tile->mem.memtest_bo)) {
> > > +                       drm_warn(&xe->drm, "Tile %d: Failed to
> > > reserve memtest BO\n", id);
> > > +                       tile->mem.memtest_bo = NULL;
> > > +                       continue;
> > > +               }
> > > +
> > > +               drm_info(&xe->drm, "Tile %d: Reserved memtest BO at
> > > offset 0x%llx\n",
> > > +                        id, vram_size - SZ_64K);
> > > +       }
> > > +
> > > +       return devm_add_action_or_reset(xe->drm.dev,
> > > memtest_bo_cleanup, xe);
> > > +}
> > > +
> > > +void xe_vram_free_memtest_bos(struct xe_device *xe)
> > > +{
> > > +       struct xe_tile *tile;
> > > +       u8 id;
> > > +
> > > +       for_each_tile(tile, xe, id) {
> > > +               if (tile->mem.memtest_bo) {
> > > +                       xe_bo_unpin_map_no_vm(tile->mem.memtest_bo);
> > > +                       tile->mem.memtest_bo = NULL;
> > > +               }
> > > +       }
> > > +}
> > > +
> > > +int xe_vram_memtest(struct xe_device *xe)
> > > +{
> > > +       struct xe_tile *tile;
> > > +       u8 id;
> > > +       int err = 0;
> > > +
> > > +       if (IS_SRIOV_VF(xe))
> > > +               return 0;
> > > +
> > > +       for_each_tile(tile, xe, id) {
> > > +               struct xe_bo *last_page_bo = tile->mem.memtest_bo;
> > > +               struct dma_fence *fence;
> > > +               bool overlap = false;
> > > +               int i;
> > > +               u8 val;
> > > +
> > > +               if (!last_page_bo || !tile->migrate)
> > > +                       continue;
> > > +
> > > +               drm_info(&xe->drm, "Tile %d: Running VRAM
> > > memtest...\n", id);
> > > +
> > > +               /* CPU write and readback first and last byte of the
> > > last page */
> > > +               xe_map_wr(xe, &last_page_bo->vmap, 0, u8, 0xA5);
> > > +               xe_map_wr(xe, &last_page_bo->vmap, SZ_64K - 1, u8,
> > > 0x5A);
> > > +
> > > +               val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
> > > +               if (drm_WARN(&xe->drm, val != 0xA5,
> > > +                            "Tile %d: CPU memtest failed at offset 0
> > > (expected 0xA5, got 0x%02x)\n",
> > > +                            id, val)) {
> > > +                       err = -EIO;
> > > +                       goto unpin;
> > > +               }
> > > +
> > > +               val = xe_map_rd(xe, &last_page_bo->vmap, SZ_64K - 1,
> > > u8);
> > > +               if (drm_WARN(&xe->drm, val != 0x5A,
> > > +                            "Tile %d: CPU memtest failed at offset
> > > 65535 (expected 0x5A, got 0x%02x)\n",
> > > +                            id, val)) {
> > > +                       err = -EIO;
> > > +                       goto unpin;
> > > +               }
> > > +
> > > +               /* Non-CCS access via GPU on the last page */
> > > +               xe_bo_lock(last_page_bo, false);
> > > +               fence = xe_migrate_clear(tile->migrate, last_page_bo,
> > > +                                        last_page_bo->ttm.resource,
> > > +
> > > XE_MIGRATE_CLEAR_FLAG_BO_DATA);
> > > +               xe_bo_unlock(last_page_bo);
> > > +
> > > +               if (!IS_ERR(fence)) {
> > > +                       dma_fence_wait(fence, false);
> > > +                       dma_fence_put(fence);
> > > +               } else {
> > > +                       err = PTR_ERR(fence);
> > > +                       goto unpin;
> > > +               }
> > > +
> > > +               val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
> > > +               if (drm_WARN(&xe->drm, val != 0x00,
> > > +                            "Tile %d: GPU memtest clear failed at
> > > offset 0 (expected 0x00, got 0x%02x)\n",
> > > +                            id, val)) {
> > > +                       err = -EIO;
> > > +                       goto unpin;
> > > +               }
> > > +
> > > +               /*
> > > +                * Check for CCS overlap on the root tile.
> > > +                *
> > > +                * TODO: maybe extend if we ever get multi-tile +
> > > CCS. Pay
> > > +                * special attention to the l2 flush below. Currently
> > > that is
> > > +                * hard coded to the root tile.
> > > +                */
> > > +               if (!id && xe_device_has_flat_ccs(xe) &&
> > > +                   GRAPHICS_VERx100(xe) >= 2000) {
> > > +                       struct xe_bo *scratch_bo_before;
> > > +                       struct xe_bo *scratch_bo_after;
> > > +
> > > +                       scratch_bo_before =
> > > xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
> > > +
> > > ttm_bo_type_kernel,
> > > +
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +
> > > false);
> > > +                       if (IS_ERR(scratch_bo_before)) {
> > > +                               err = PTR_ERR(scratch_bo_before);
> > > +                               goto unpin;
> > > +                       }
> > > +
> > > +                       scratch_bo_after =
> > > xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
> > > +
> > > ttm_bo_type_kernel,
> > > +
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +
> > > false);
> > > +                       if (IS_ERR(scratch_bo_after)) {
> > > +                               xe_bo_unpin_map_no_vm(scratch_bo_befo
> > > re);
> > > +                               err = PTR_ERR(scratch_bo_after);
> > > +                               goto unpin;
> > > +                       }
> > > +
> > > +                       /* Save original CCS metadata for PA 0 + */
> > > +                       err = xe_migrate_debug_ccs_overlap(tile-
> > > > migrate, scratch_bo_before, false);
> > > +                       if (err) {
> > > +                               xe_bo_unpin_map_no_vm(scratch_bo_befo
> > > re);
> > > +                               xe_bo_unpin_map_no_vm(scratch_bo_afte
> > > r);
> > > +                               goto unpin;
> > > +                       }
> > > +
> > > +                       /*
> > > +                        * Fill last page. If there is CCS overlap in
> > > the last
> > > +                        * page this will snag the raw CCS storage.
> > > +                        */
> > > +                       xe_map_memset(xe, &last_page_bo->vmap, 0,
> > > 0x5A, SZ_64K);
> > > +                       xe_device_wmb(xe);
> > > +
> > > +                       /*
> > > +                        * Global invalidation. Some BMG SKUs will
> > > cache the BAR
> > > +                        * writes in the GPU side VRAM cache. Make
> > > sure above
> > > +                        * writes are fully flushed out to VRAM, so
> > > this is
> > > +                        * hopefully more well behaved with the CCS
> > > unit, if
> > > +                        * there is indeed CCS overlap with normal
> > > VRAM. Since
> > > +                        * there is a separate CCS cache, the CCS
> > > unit might not
> > > +                        * respect the GPU VRAM cache for CCS
> > > accesses, so opt
> > > +                        * for being super careful here.
> > > +                        */
> > > +                       xe_device_l2_flush(xe, true);
> > > +
> > > +                       /* Use GPU to clear CCS state for PA 0 */
> > > +                       xe_map_memset(xe, &scratch_bo_after->vmap, 0,
> > > 0x00, SZ_64K);
> > > +                       err = xe_migrate_debug_ccs_overlap(tile-
> > > > migrate, scratch_bo_after, true);
> > > +                       if (err) {
> > > +                               xe_bo_unpin_map_no_vm(scratch_bo_befo
> > > re);
> > > +                               xe_bo_unpin_map_no_vm(scratch_bo_afte
> > > r);
> > > +                               goto unpin;
> > > +                       }
> > > +                       /*
> > > +                        * Global invalidation. Ensure CCS caches
> > > really are
> > > +                        * nuked and the raw CCS data is visible in
> > > VRAM, for
> > > +                        * the below access.
> > > +                        */
> > > +                       xe_device_l2_flush(xe, true);
> > > +
> > > +                       /* Check if last_page_bo was corrupted by the
> > > GPU CCS clear */
> > > +                       for (i = 0; i < SZ_64K; i += 8) {
> > > +                               u64 payload = xe_map_rd(xe,
> > > &last_page_bo->vmap, i, u64);
> > > +
> > > +                               if (payload != 0x5A5A5A5A5A5A5A5AULL)
> > > {
> > > +                                       overlap = true;
> > > +                                       break;
> > > +                               }
> > > +                       }
> > > +
> > > +                       /* Restore original CCS metadata for PA 0 +
> > > */
> > > +                       err = xe_migrate_debug_ccs_overlap(tile-
> > > > migrate, scratch_bo_before, true);
> > > +                       if (err)
> > > +                               drm_warn(&xe->drm, "Failed to restore
> > > CCS metadata\n");
> > > +
> > > +                       xe_bo_unpin_map_no_vm(scratch_bo_before);
> > > +                       xe_bo_unpin_map_no_vm(scratch_bo_after);
> > > +               }
> > > +
> > > +               if (drm_WARN(&xe->drm, overlap,
> > > +                            "Tile %d: VRAM bounds overlap CCS
> > > region! VRAM sizing is incorrect.\n",
> > > +                            id)) {
> > > +                       err = -EINVAL;
> > > +                       goto unpin;
> > > +               }
> > > +
> > > +               drm_info(&xe->drm, "Tile %d: VRAM memtest
> > > completed.\n", id);
> > > +
> > > +unpin:
> > > +               if (err)
> > > +                       break;
> > > +       }
> > > +
> > > +       xe_vram_free_memtest_bos(xe);
> > > +
> > > +       return err;
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vram.h
> > > b/drivers/gpu/drm/xe/xe_vram.h
> > > index dd1c8bf17922..38425d81f777 100644
> > > --- a/drivers/gpu/drm/xe/xe_vram.h
> > > +++ b/drivers/gpu/drm/xe/xe_vram.h
> > > @@ -23,4 +23,14 @@ resource_size_t xe_vram_region_dpa_base(const
> > > struct xe_vram_region *vram);
> > >   resource_size_t xe_vram_region_usable_size(const struct
> > > xe_vram_region *vram);
> > >   resource_size_t xe_vram_region_actual_physical_size(const struct
> > > xe_vram_region *vram);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> > > +int xe_vram_reserve_memtest_bo(struct xe_device *xe);
> > > +void xe_vram_free_memtest_bos(struct xe_device *xe);
> > > +int xe_vram_memtest(struct xe_device *xe);
> > > +#else
> > > +static inline int xe_vram_reserve_memtest_bo(struct xe_device *xe) {
> > > return 0; }
> > > +static inline void xe_vram_free_memtest_bos(struct xe_device *xe) {}
> > > +static inline int xe_vram_memtest(struct xe_device *xe) { return 0;
> > > }
> > > +#endif
> > > +
> > >   #endif
> > 
> 
