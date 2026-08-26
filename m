Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0CEC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3510E62A;
	Wed, 26 Aug 2026 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqL9OBXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD3610E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787774496; x=1819310496;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rLZJ0aJQ5sk8HZgfkk5k4aKLFN1mbShXy88+f01JSuY=;
 b=mqL9OBXUTASFPaU/i6B8OWwHDavUwf24KAI4jdKYqBv94PW+DWpw7w00
 4DakrdFj+3SAy2cCi5rZa9O6T6qt9qlXk1hbstfThx6YaRwxJ6CSS5ntO
 f4trBmZX8PzNPwgL5l7yKlYfENs9DEC5ZkEb9kNoUPzpvzksm4y+sWVzB
 C1acwbXYLUK1QtML9Cx2uijBYlqMHJ4v2ubRRDgVLzTxh93dQjOOyDmZR
 9GmIX5LkRJcFDPJlMIKN1rp+zwFDQPdHXfFYTLvKBZ0ElXr8LslGpNmzJ
 mfAX2KtIyXzJW6Th67CxjwbxdfAeGkmLi6uy71pXg73hw2FZQ64tb/VE+ Q==;
X-CSE-ConnectionGUID: cJVnzxBgQU+GJxw9PYTaOw==
X-CSE-MsgGUID: O0VkgUcxTFiz2yLyiZsAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98859233"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98859233"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:01:33 -0700
X-CSE-ConnectionGUID: oaoaWZl+QE+pRXGZ7gTJIw==
X-CSE-MsgGUID: s/MelTZISA+sxJ323v5bmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271866991"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:01:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:01:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:01:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC+R/AQ2KNmRdIDI2MsOHJNM0wQ5UWWVhujzSpMfyj8uwzY4d5NtOLc2CTImZmXEXm0b2cfkCtIusdbD+lG1BuWdYPHZAcv3Hm93Yky3WwuhPd8kaWjwkzRksrR0+MBzCQJpswpzjtm9PGvuB0wFsEQ2IyJTCDZe3c/NFuucNkWDR0Z04wr+wNhN9dB4jcE4onHTr/GK7KK9Frfy1qEmpyQLiXQNYIhW7QTxfXSYALAQ9X3KV0m8ifdC/yrfmAWeMEfJKldJIA5wlgj4TjZ3+AFg42X0gSLOjY07x21dvoV34guuI1GWkb15YTDLUvA18Fh5UNxwy3PIX2AOyug73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwAT1eNLuKAqxwFrCjO6JV2Qb06lrTYhaPiXkTn30nQ=;
 b=FRyDoTr7cv6A8pUEoRyVDwDhSgJvNj6+aYxQF+op4QsYZkd6UgAONGMDMKVUPyv9LsfJHJtSwZlvO9VPDh/4Wps1ljBvoIxPvcLWo1cyCT+mEIWYmzQoC0/5X49eUWRSKaGWPzfCP+JCQxKDPD2z1IgeDxccdqBVkBoBJ90nqOc0WNE+gi/Nm5l1p9SV0lNIWu1ZcEYr1BehDm44PKHqR9bsySHb050sNKM5bBw/btr6DxyvQR7qYvXvwJlspKckwQspW2ZtkFET5cR4JXlcnZl81mldXqPmv6BWGUl9Nc8NgxCQ08ZbTWwUVGYOIZymawVeyh6FVQytkpj55QTYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 20:01:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:01:27 +0000
Date: Wed, 26 Aug 2026 13:01:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized
 surface state
Message-ID: <20260826200126.GK681121@mdroper-desk1.amr.corp.intel.com>
References: <20260824220458.520358-1-jose.souza@intel.com>
 <20260826193807.GI681121@mdroper-desk1.amr.corp.intel.com>
 <01f98eeb0492e16dbe8b20695028b0494390f600.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01f98eeb0492e16dbe8b20695028b0494390f600.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fff790a-c410-439c-ae20-08df03acd053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: HMo5jZ9SGp6YJlqFMbweDomd9CgZzblKmYYtUwcvt5WeA+nH/uVNxNitv9822Ua62Jnt+VsG7F0OcF6/DOWpSg/o+2KykwWOrpN4eNtkeWGx5eflk8Ph8Yt3/Jmp2Yx2zWUIS9FdVuxwP9X5m2ibSLnyF6iTDwO4IaenN9jrItl2qDBmxpmocBxra4VZmnl4EcqT1gD7g1fUX1+p2Zn6rItYHwwADl2fVy2K9tV7uBv3M1TTrkLR2W07EIP9ehuq/o07eKGX0/pLThhAqw30dLJTNWVsUgpQ7w1zx88iqLpqij0sGVWOeZlUO+6PnMsuZJlm6O/BoPHdq0n/aGPIisr70AK5qOWci8pzy/t4eQoKVGZCFKENKewFBa8UGT/JD7xRdHfEXsL77rY93/SVqAakv8YXdH39f/aYNiy98jkrNVWw7zPfWbcjCCDwt15dbMJIwXe04/YqhVpIoAvZ1SfiAiObLMnAKLacvk7Vew91CxrF/RPL9la6zG7JgZ451JlWAc1nqC0r09j0yTd6KfhruaPbrNEK+2WNrIJyB6p6uO+6fe1PCHoCg9+eoXLnt/f6J4Mp+5pWzMl7MiUdgLKrjZV7/silroHlXL7iWpVDPHow9u4kvwXLSZd8Uwizd7H+7lXCpw37ThFJuWScBp14Q9Dl3wa3qkvz3Nbm6b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nhGyuP+eindX9nSNA1nkzPNf5C2jUNlfqqeBjJagLTYNKIzekKKeRiF7PC?=
 =?iso-8859-1?Q?1Kh1ENqKamje542cthxnW1KNgjgI0z8p/Q1uySNx7jhMyrexqpLKb2tZSd?=
 =?iso-8859-1?Q?hIj+Yt/h4mlZTySjRR0z+clzOheerPnxQitAZnij3yzrOpgBCFElbS1ooY?=
 =?iso-8859-1?Q?heSMjbwATIdXK633CFFAXvGO1PgOWke6N7Iw5q8EtzeN0fLcweH6Z6NQqp?=
 =?iso-8859-1?Q?Xqj9iEtt5yBt2C8K88pgOn5BYKx47u1V9arDCGMblt8d2RfyQ8BH92umZW?=
 =?iso-8859-1?Q?xNixcWIyLlhx4s2LXYxgBB+/bp8YHPCah4mzqyHTY+UWPMDvR4gTbA/xD1?=
 =?iso-8859-1?Q?ZU7qthkTswaclQ8qpMyDiZ8RiYl5WpRzHNTVdjcjqyPiDhCgNSTRDqKF1i?=
 =?iso-8859-1?Q?u30NnRcWutQN36fz3XoN97PaNRuRrjdeiNVC8ewI/ez6z/aZ/xzok3uOdm?=
 =?iso-8859-1?Q?onAvIa+8MGiZyw5o6rgO8b3h0ZdopWv/NX+wa/ZPNd/SdWPzQQFHIADOfo?=
 =?iso-8859-1?Q?qu7tixiA/6BgIQXfduqYjSvdpBY4Rpv/OqAqc7GnEBYIBJvjLLMW+s7sIo?=
 =?iso-8859-1?Q?+Iu7xI2iiyaf3kewAcEBs3NBuFMQHmt6GhXp62f1p5bl5bXd5ponzwvTDf?=
 =?iso-8859-1?Q?rOl9u9OvTXqYin5+Uuz9NLqWh/MuFo6hW9UhoNzSjuNX4sOgj1i4+v/8SE?=
 =?iso-8859-1?Q?Tte3DRVNOZzfxYX14JFOZ9pkY206jkqDjjBJIfkTOMU1Q2Exnv7Wn8MVUf?=
 =?iso-8859-1?Q?h334Rj9/4UV1uA8XonPUbyRk8cJZ2zXovzJGzbYI+Axe91Estgig28uL4l?=
 =?iso-8859-1?Q?0Cl6ajrVbrW2D65o1vrVA+yeXiyv2RvTlTECGvHchBVFLdZ9Eu5YZ1FT/M?=
 =?iso-8859-1?Q?upyi9y2eIqVSajl+j8KCpGXEKEhYirZXkuhFXW0wg02FaGH8fEK0Y2XzzF?=
 =?iso-8859-1?Q?CMpprDUTGOu+Mndz6OLuDYcz25046pdvly7QfYu9D2cSbgbeTWkwCOd+pl?=
 =?iso-8859-1?Q?RpKMzUfv7DAhIS9ZMgBCcxEECnfpdE94susHeWFltENMCsxxO5wA/FzK4f?=
 =?iso-8859-1?Q?12qNpmUTsbGfuoSeNfuY/LBDXweYH1SD2u8AOkvAc38XSb1vC9+ApIsXR2?=
 =?iso-8859-1?Q?Bc70b8dQv1+yh8tyD+xS5LfZcBC7MEmLlANluFHScvkt/bIVJRUX/RufFP?=
 =?iso-8859-1?Q?yjQB2TWXlrd0VgM3A6Uxn8kAJa1zB9KisbK7akncggykYTjUgV8VQoCS5U?=
 =?iso-8859-1?Q?A01iR8ucs3Kr8D0SPWV+/9kSjNyyGK1yAURaLTYUgTMCEKjlOsB8mID+MK?=
 =?iso-8859-1?Q?bJbOAUVDOfaKIaQ5MQZ1MQLmeSpf3+/4W1iTKPEAiXlqjiEKlk00KzJlAj?=
 =?iso-8859-1?Q?N+Bmmo3idLJXvemQqrZn++6sFxDddiI1ot6QbcKXWePIU581rBdkywgFpS?=
 =?iso-8859-1?Q?mx78Bm3tcWB1KFCaqPWE+EhRSK8vO4U2hYJUmt3qhMjHmC1DfbOEAFQIL4?=
 =?iso-8859-1?Q?hQaqOrOoMaOL1H2JJlzwklTBa6uY4fcYmvWNetYsO143Y+/1jarbITSki4?=
 =?iso-8859-1?Q?Wrs5PpJUuOot5Mh+5P9Gnzmq/ZaJblnDBW1+gSdOPxQt+tzwkEwJZ8q8/P?=
 =?iso-8859-1?Q?3mGpDi3yHXUwgGAhTAe9m8DDkAj/6iOHfp4IXWgy3JfubKpFaO7kuMjXKl?=
 =?iso-8859-1?Q?sZ3TUpm+v4IcudUyZRdlwOtK6cqnga6HWF1UOFQPYc/X3ZUHEy3lu41nEG?=
 =?iso-8859-1?Q?Qq71QjzOOzHsPKloxM1klfwpt3aFkH6HHNdguo7fMezBZHc8IAcCXT5hIG?=
 =?iso-8859-1?Q?XWE/YjnMYvlqB9YPaLRzg3j/9Y/sdZc=3D?=
X-Exchange-RoutingPolicyChecked: EpC4ljgvZyJpRp26dfLZvGZnOI5DcugX+YBxbkSkHcar1sLpBxxlbMGPQUj616hw/sPV26fgiRWLjJFP1LMozfLsXPJXxWgYhYugFRt30yF50A+2evPEqg0q9ck1X6/RHB4nR1/SBsqn3ZLOYQbNPgPNgpquoAZ5ofE19gFvKlZitzsEp5Y4TeV1b2woVFHhC6hjdsujy8pSv1vxTl/+wBNxknHNnU7k87ewQam/EoLaiQ+VlWoCmWPUnoB8cICn3tXId3mXMgJl/Hqw3N86Dvmga1GM1jpZVa/93oK6fPoOwZdYEc/JY8TEKjibMZrjwvO7/WAdwTCAEJjRdXkYZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fff790a-c410-439c-ae20-08df03acd053
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:01:27.6216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bitYP45wQ0pbeKRScKVgjAonU5amUqdXqOCX2LaBP/kz94z64yAnUCm/3Gs1pFx+7hGFMjLGfFzL131z0RTprUmMwWNhYirbodJC1IKUKu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On Wed, Aug 26, 2026 at 07:54:19PM +0000, Souza, Jose wrote:
> On Wed, 2026-08-26 at 12:38 -0700, Matt Roper wrote:
> > On Mon, Aug 24, 2026 at 03:04:58PM -0700, José Roberto de Souza
> > wrote:
> > > Xe3p changed the default behavior of a fault in sampler when
> > > surface state
> > > address is 0x0.
> > > With the default behavior some default values are used instead of
> > > trigger the
> > > fault, what would make pretty hard to debug bugs.
> > > 
> > > So here programing SAMPLER_MODE to change back to the default and
> > > expected
> > > behavior.
> > 
> > Reading through the tickets associated with the original hardware
> > change, it sounds like the change of behavior here (not faulting) was
> > deliberate.  In the illegal (but apparently quite common) case where
> > applications write shaders that reference uninitialized descriptors,
> > this allows Intel hardware to gracefully handle the mistake in the
> > same
> > way that other vendors' hardware does rather than failing.  So it
> > sounds
> > like making the change below has the potential to regress some
> > real-world applications (even though those applications are
> > technically
> > behaving outside the spec).
> > 
> > There are also notes indicating that the chicken bit here is
> > intentionally placed in a privileged location so that it can only
> > ever
> > get set by privileged software in specific debug situations.
> > 
> > So maybe the best solution to avoid causing regressions would be to
> > just
> > leave the default setting be, but create a debugfs interface that a
> > privileged user can use to toggle this behavior at runtime for
> > dedicated
> > debug situations?
> 
> Not sure what other Intel drivers does but in ANV and Iris even when
> application don't provide a surface we set a valid surface state
> address that points to a null surface.
> 
> So if for any reason a bug is introduced and we set the address as 0x0
> would be better to catch that with a fault right away than spend hours
> debugging it.
> 
> Lionel what do you think?

I guess another question here is whether this is safe to do in SR-IOV
cases.  Maybe ANV/Iris don't have issues with this new setting, but if
someone is running a Windows virtual machine on a VF, then is this
change going to break the Windows 3D drivers operating in the virtual
machine since now they're getting behavior that they do not expect and
cannot cope with?


Matt

> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 15 ++++++++-------
> > >  drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
> > >  2 files changed, 13 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 48c515d91882..e6e51d04ca57 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -503,13 +503,14 @@
> > >  #define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> > >  #define ROW_INSTDONE				XE_REG_MCR(0xe164)
> > >  
> > > -#define SAMPLER_MODE				XE_REG_MCR(0xe18c,
> > > XE_REG_OPTION_MASKED)
> > > -#define   ENABLE_SMALLPL			REG_BIT(15)
> > > -#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11,
> > > 10)
> > > -#define  
> > > SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER,1)
> > > -#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> > > -#define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
> > > -#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
> > > +#define
> > > SAMPLER_MODE					XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> > > +#define  
> > > ENABLE_SMALLPL				REG_BIT(15)
> > > +#define  
> > > SMP_WAIT_FETCH_MERGING_COUNTER		REG_GENMASK(11, 10)
> > > +#define  
> > > SMP_FORCE_128B_OVERFETCH			REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER,1)
> > > +#define   SC_DISABLE_POWER_OPTIMIZATION_EBB		REG_BIT(9)
> > > +#define   SAMPLER_ENABLE_HEADLESS_MSG			REG_BIT(5)
> > > +#define   FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE	REG_BIT(4)
> > > +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE		REG_BIT(0)
> > >  
> > >  #define
> > > HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
> > >  #define  
> > > DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c
> > > b/drivers/gpu/drm/xe/xe_wa.c
> > > index 139434946f8f..5273dea83df6 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -602,6 +602,11 @@ static const struct xe_rtp_table_sr engine_was
> > > = XE_RTP_TABLE_SR(
> > >  		      
> > > FUNC(xe_rtp_match_first_render_or_compute)),
> > >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
> > >  	},
> > > +	{ XE_RTP_NAME("Force fault for uninitialized surface
> > > state"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500,
> > > XE_RTP_END_VERSION_UNDEFINED),
> > > +				             
> > > FUNC(xe_rtp_match_first_render_or_compute)),
> > > +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE,
> > > FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE))
> > > +	},
> > >  
> > >  	/* Xe3p_XPC */
> > >  
> > > -- 
> > > 2.55.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
