Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5D9C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 23:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49FC10F76A;
	Fri, 14 Aug 2026 23:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7nCRAQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BCC10E5BD
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786750505; x=1818286505;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=90JkEA0hBuv8PdYbcqmxtVtjunVH0NFQAnUYB6P3Eho=;
 b=V7nCRAQPO9mmnR5m4ms1y3+wP3tQZJVMkFPKF+Wb5nGf2Jq1LfJ9EQbC
 hqQOEVi7bXR1LAOOdyp7tre1oBB+rR1373xd/+w/J4lwM9ElVsxvBSe3J
 tzgrGB0Am9GCXCYny8Uk0dUZlfrOfottDDPh+LAEWkTGzZ53W1dJJa/2J
 FdF9fnwVO8jb8AWbS4B752fLZ1G5vYtr4xrcUyUIaK5WZdbmOmvqSDh42
 qlVgvzsx7zctlifUYoekCJ3S8wY7UjGlSugQilE66ceZiOvExZsHUSi9u
 evTKLhJsuTocI+UMBAT/wQXJYiiatuHDASVaEqY2iyIdrU1UoewC+BYKL w==;
X-CSE-ConnectionGUID: Hx2QExk0R+2Hz8sHo6WBpg==
X-CSE-MsgGUID: kVlTz99RQsyenh20zhh/BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87353281"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="87353281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 16:35:05 -0700
X-CSE-ConnectionGUID: DBSOz//aQi6mujb9lWkDIw==
X-CSE-MsgGUID: MyEc5A/QQCmUpC1/zBJtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="262583583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 16:35:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 16:35:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 16:35:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 16:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e379SdAq4cl44y+okWSgmMunCty5DiEFSM3ZnggzuGAs17oOM42GWad13KKzZfAgaAFAmKrhsuPQuEthziY7vzUnOrfsj/bKuy7ps52lNWVEUX7CtQiFrweZLWvg8twt7Nk5JcH/nr1H/3AEDcRiZoDYllALUgoiwPlltNpDk7PDnsPumW9JFzUiEToK0/nfTzRPQji16jgcyK60oTatwKXNYTJ/G2VkSkAI254VCVWPj3NzhuK9Uk8/wMKqtJc3ihUVnpjEbv6eHTSWya3/UuLZdGnwY2R/XgPbx8wTPZX1n8FY+jpfERFfOjtwWZ+mitY2BwePQGqZ3+7WtCHUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/ZYttOTEpGZx5+1ctpf2W5TrE/cdaFSwmkbEsG1jn8=;
 b=EQhpOXTDgAXeEib1+8fjgyjn6v9m4zh4tezcyNXFPGOOytiPr7Y/ywRum88+MOg02rWCt2Or/gclvJ6zRyu8skYwidW0D+EY+br3lVokUD0hD4SHQ53C3fZx8Qpsp8IEXLojjsyn+X/fMaSVT/Q2oz/o9Wr4HZR9QNGINAgjrCAChBDZXgHJFiHW+ErWUoTKHIIMICqa8utti6qgBZZzuQSaXdQeIt/+D7d9kG2iPr5GMwwS6ymumY+vblgaY+spYKJTvH85QZUPOW9oygkwsY9ki3fVqHI93a0ucomk6gLM846lL8/d1lZgKG0JTL5tS7wtrNH5WXktBTC2IdUu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB347531.namprd11.prod.outlook.com (2603:10b6:806:52d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 23:35:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 23:35:02 +0000
Date: Fri, 14 Aug 2026 16:35:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
Message-ID: <an+mJHNqm57WZEwH@gsse-cloud1.jf.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
 <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB347531:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b3be1f-08a0-482c-e03b-08defa5ca9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SgP2L6+v7sNoGMY6IJ4rZCyoYWljnH9Y/rY1Zo6LFqENhUWQKWTcaVclDZDx29GDVmz20pLjeYp5S/NLo4woYj8lJPh3iX2E+sLDmZbf5vTdPvhVIRzHNsTEHFhf7OqvKMSUW2+7yteyG/HH4OPsMSzedRiu1rW/FmKbNW7SvpVJOh6+8UMZDZvdbcdgAKI68comTAlqR1afBjZjNsB2XqcgOQV5UGHPlWHJJeZvdZ1NZH/46yF+x/eLyQQHLR8PGrK0t2bSmQSNSvU2sq4s513Vs3AD+96O9+eRInue9H00ZZGIl+28//s9Ay4aO/EaS2SM/CGHMXBhDXyzbD947eD/lTWha18mKU+Jwg5p4fcdZyvTchF0zbhvxDNM8NR+9S3FR0PcvE3810Nzd0/Q0LWQn6mxoruU+d2xhgSvriZv0VGLRQpDthr6tOkOkQuXh9ci97q9MdhQGLib1G3JqkNsGPKUw4I+3s/GTCdGt7UrqlsNNL4lmeQchZFQcsxTFzxQnc9ciTRHaTE3oPPMQdlXsOackyJPZWamieaMTrc9wNuk0E6WjiU0gS5BUVdSCJ7JNIPelAOiNfXshn1DpxLcq5QL+6FIPyaIWBwZ8ni6MVzhySpjdzj2JtvvgFWmQL7NEs7Pi68njFuRPKrUf5dgEG5j8+Q0zVoktMn74MU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q8P739uWwbH4Pl9DcQT2ae/63Ve9KAbzUMSy3dAAiIMkTBdn0e/FaWG9CG?=
 =?iso-8859-1?Q?MB5QCkWtKqrokji8jpbKD2EunF1F9OHRko0Ba3y5Ld0HY35o7ePJcdnvjn?=
 =?iso-8859-1?Q?EIemKBi/i87aBIhVmySsMc0L8wb0T/aNo5O06RoYXcKfroleumY8ICezlb?=
 =?iso-8859-1?Q?cP3LzgKuNz40mSMsQT9PH7Pi2kj1ccGbWY1mKIGaCa/ZvEyLz0G+JdqfbA?=
 =?iso-8859-1?Q?o+xdisi68m9M4v1TqkuhEAYLmvvpmlRwvJ1CkpNYiHZj3pwqy5wSnm8idt?=
 =?iso-8859-1?Q?DLRirz2CTSAmmW/zKoCH3ALS0dYnX8fTaNvAZX3vIrSvgOfwEh4eFSHqMz?=
 =?iso-8859-1?Q?RHlSluOxr+zTRbYF6xKjz2yv4hk3+nEcXaqPfY9vB5cGJdaggqb+zlCtZy?=
 =?iso-8859-1?Q?ZrZ0aK2UMXfUG/WZtzifnB9ex+372IXiZNWc1T7PqIJxU5q+5Us9skifWB?=
 =?iso-8859-1?Q?PIA8fW1M3yVpNp5WwXgg/3o33q488JBNI2PrmzoI3iHusDTyp9PvIgp3Dl?=
 =?iso-8859-1?Q?ISqsDghRkH1caqOV8Wq+bS8cm+sbrDp76bmzS3l85Q4oKF5n6YoNWwnIIm?=
 =?iso-8859-1?Q?iSksecrTbI/ADX0XIy2sstruSmGZAW2+RpSV2kHSM8cZetlEgalCkBA847?=
 =?iso-8859-1?Q?pIJxTC+teVgrDlgzaPbikAsFdFkocAT3Cnml0MXgi9xCdYapc9/DtidZXx?=
 =?iso-8859-1?Q?rZk3LWOAQUtp8v4VN00mfCKAQhUjwDw2GXi+3gKkzsyhk7haCsqs16hh8Z?=
 =?iso-8859-1?Q?6LanUhHKpdScbzUShRchkwyJnb9OBzmLat1MSpu5qbgEZXsKnMlpfVBYDV?=
 =?iso-8859-1?Q?H9Hn5HD/1UhKAGq3qnNkfTVDvGb9aeHeAZCBRRS3IhkINnZEdd6Ipm/wbH?=
 =?iso-8859-1?Q?XjHz6fuPWLxTo7vS9Zv0q0X8Rh1H/BI9y0UWNDi7PIF9aElWW7IrbY0B1f?=
 =?iso-8859-1?Q?L1fZjbU6QiKSa49wfgtD0Ja4P4/gLRQkbY3zucXUL7dg6T2Y76tqUZrQiC?=
 =?iso-8859-1?Q?U154cpHn28vs3rdIUyTmEJQzfa4pH6BqbFDE8rA1DjAyoDWr/neBdQVNda?=
 =?iso-8859-1?Q?wRJhjXhHxMqo23D+isipLiWu1hVClNRZQxHOnaUrJjt5OyV2CmjZ48EkSD?=
 =?iso-8859-1?Q?Pp6gTuWwzyRz99UuyNF7bIVAhCVLjoR5OqbKcV27orEphUj4/rFxCDLmVE?=
 =?iso-8859-1?Q?bKfawsimuj5NUeWvVlvf35ElbtDh0OJueWbLFPc7HtcVyGx5Ov6lOHikYA?=
 =?iso-8859-1?Q?MxTzR76NSUIqm5FIg3kAPIX6sTEVhTIi/ZwQMs/nYLzWdT93TAGdquPv5A?=
 =?iso-8859-1?Q?X524lzxJx8gvKACU0EBEt4y1JQvUE9SsBasFM5+d9UA9oN/Y6qGXK2tObG?=
 =?iso-8859-1?Q?MG8OjbkIHJqHMR8HwjyFvsIOEzjrx+XM/nU0JooxJuFcU2Tir7UNtaxRle?=
 =?iso-8859-1?Q?3Ca7Iv5bfmyjhbWvRVThLmr1F5OMWQpAEVUPEwHoBG9wukna9XbeWgytVu?=
 =?iso-8859-1?Q?ntvss8juJGA9e8eaoSO2CQcvTyfRuunk20EYy37dLIDRRzkE7nMJdj4DiR?=
 =?iso-8859-1?Q?8zrEJxWBE4M5w/X7yjtTQFjNFWq4ENebiOjxVrQ/J0uV7QoFm7hBymq8RN?=
 =?iso-8859-1?Q?jP2b5RSpeaLDkZB+d5zn3lOzhRny6UNmnZk2WfLKylOjnpxej7aHOGgbj1?=
 =?iso-8859-1?Q?9VV//LZn5hobO4aL5t97nS8OGxrw7K3RSMQxKPJB74VTwVBYprlDpv4TM/?=
 =?iso-8859-1?Q?sc9htUlrzSQ+h0w/ANu7TxiKawupnDcVbPDK4o98gdRiDAeaXNrHP5dwpU?=
 =?iso-8859-1?Q?AHhf9M3JSw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cCHS/90HL1zmhAmesqwznH1scQfJqnu2NRMf5LVlHXUqWYvHX+l+ml08AqU6wtSbHRf/9q1Hua5d+Jm2iZSpnYMziuQRrCH+9sIB85wk/G+9Udr1h/NckEMFFw+f2VwSwHg74uSFXp1SF1UqCXcaejztuYFvi2pUXxB6THv3ebyUtt3D6T72WvHq7LvuCEybJLJZ1KOE8lSvxSrp6faRznnQvJXmegXEnW3104PHloSTK/eQiPK58D4xeKv87/2uZwxsz4op6piAGN8Sn3iHt9C01kdspLUHwMKjzRfO2U+vrx1eM9v1MsxQFLUUx7BOzhYPOeT7AdHn3qrC0G0elA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b3be1f-08a0-482c-e03b-08defa5ca9a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 23:35:02.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqo99GP7E6YxhdPUY53Asdw8owL4f9YHs21T7JFXyFZDG8U+KRv2/ekYOPBEQtl2pURKINupY6Zp5DAZqs/+FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB347531
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

On Fri, Aug 14, 2026 at 04:24:05PM -0700, Matthew Brost wrote:
> On Fri, Aug 14, 2026 at 04:37:37PM +0200, Thomas Hellström wrote:
> > Update our preferred vmscan batch size on each count pass to avoid
> > invoking scan_objects for requests too small to free even a single
> > average-sized GEM object. Our rough estimate for an effective batch
> > is twice the average number of pages per populated ttm_tt across all
> > shrinkable and purgeable objects. The factor of two provides headroom
> > so that most scan invocations can free at least one GEM object despite
> > variability in object sizes.
> > 
> > The batch value is updated as an exponential moving average,
> > (old_batch + avg) / 2, to smooth out sudden changes in the
> > object population. It is floored at 128 pages, the kernel default
> > SHRINK_BATCH, to ensure the shrinker remains responsive when there
> > are very few objects.
> > 
> > The populated_tts counter introduced in the previous commit provides
> > the object count needed for the average. We inherit the same
> > justification as the analogous mechanism in i915: shrinking a GEM
> > object has non-trivial locking overhead, so firing the shrinker for
> > requests smaller than a single object is wasteful.
> > 
> > v2:
> > - Fix the average object size estimate to account for the full
> >   shrinkable and purgeable population.
> > 
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > Assisted-by: GitHub_Copilot:claude-sonnet-5
> 
> This is probably the right direction given what we currently have in
> terms of shrinker control, but the core heuristic is still a pretty poor
> one. My understanding is that it combines batch and seek values using
> some odd math to determine whether a scan is worthwhile at a given
> priority level. We probably want to avoid shrinking at the initial scan
> priorities, and I believe this change accomplishes that.
> 
> That said, I think we really want two shrinkers instead: one with the
> default settings (or perhaps even a reduced seek value) for purgeable
> BOs, and another for BOs that we legitimately need to back up. The
> purgeable one should be favored to run eariler, likewise the TTM pool
> shrinker should be favored run before our shrinker too.
> 
> Also we really should look at getting priority based shrinking in too, I
> have follow up there too which disconnects purgable / not in working set
> from shared VM dma-resv also, further prioritizing though shrinks.
> 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_shrinker.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> > index cded230f5459..284fce207705 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -146,6 +146,8 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> >  {
> >  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> >  	unsigned long num_pages;
> > +	unsigned long total_pages;
> > +	unsigned long populated_tts;
> >  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> >  
> >  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > @@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> >  		num_pages = 0;
> >  
> >  	num_pages += shrinker->purgeable_pages;
> > +	total_pages = shrinker->shrinkable_pages + shrinker->purgeable_pages;
> > +	populated_tts = shrinker->populated_tts;
> >  	read_unlock(&shrinker->lock);
> >  
> > +	/*
> > +	 * Update our preferred vmscan batch size for the next pass.
> > +	 * Our rough guess for an effective batch size is twice the average
> > +	 * number of pages per GEM object. That is, we don't want the
> > +	 * shrinker to fire until the request is large enough to justify
> > +	 * the overhead of freeing at least one GEM object.
> > +	 *
> > +	 * Base the average on the full shrinkable + purgeable population
> > +	 * (total_pages), not on num_pages, which is reduced to just the
> > +	 * purgeable pages whenever the gfp mask disallows backup (can_backup
> > +	 * false). Otherwise the estimate would systematically undershoot in
> > +	 * exactly the GFP_NOFS / GFP_NOIO reclaim paths where avoiding
> > +	 * excessive scan_objects() calls matters most.
> > +	 */
> > +	if (populated_tts) {
> > +		unsigned long avg = 2 * total_pages / populated_tts;
> > +
> > +		shrinker->shrink->batch =
> > +			max((shrinker->shrink->batch + avg) >> 1,
> > +			    128UL /* default SHRINK_BATCH */);
> 
> I think 128UL should be at least whatever TTM pool batch is?
> 

If my math is correct the TTM pook shrinker sets this to 320 when
MAX_PAGE_ORDER == 10.

Matt

> Matt
> 
> > +	}
> > +
> >  	return num_pages ? num_pages : SHRINK_EMPTY;
> >  }
> >  
> > -- 
> > 2.55.0
> > 
