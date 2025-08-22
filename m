Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD2CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 17:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19F410E0A0;
	Fri, 22 Aug 2025 17:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzDKirV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDB310E0A0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755882094; x=1787418094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9yUwFBnY7mQSGthodNrwiCLEeG+q6QS2v1JOEp9o3B4=;
 b=dzDKirV9cqtIttODeZ5RYnVDjoWaxn3F2jxtZcZKFQC0PVEZAryl1Hwt
 pWqmuNlXbhDOC2raarAL5Xj5/Q8DYzUxpEVEYjPJsXBpKjuNeh3gT5vGy
 e7hE0Q2HaJRZ+jInJ+3lZdXXw0b9szye+q+V0lM68axTsSwtayUL6ilNr
 JFUHgFWVf71lioIj/ocpT4Z3zq2gSMDgyx5Y/+5S6XT+65DZMmCd+rD7U
 gd0bqZC2Vrp3VEsvpUH7T2x62uAqb0A7l/9DQwKkNyBEhWoSgXBRcnJis
 4Nq5G2Q0ZUSTG3UgudI/42HaU9HkP3YsEk113ngqiUB69IJ1v8vunDbtj Q==;
X-CSE-ConnectionGUID: lNKWsn6wQLGsUNIy96LrLw==
X-CSE-MsgGUID: qXhuYGAgQpuv2qvJmsJ05w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62028535"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62028535"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 10:01:33 -0700
X-CSE-ConnectionGUID: Hc9mVcq5Rl2YKDhJpd1k8A==
X-CSE-MsgGUID: a9ZBoSJuQxidN6WXT/Z9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169569617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 10:01:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 10:01:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 10:01:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 10:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b++k1HANKjrpZpxiSgRFAV4uemlEzxWO7oikTS/hFZXBgrLxDzREJcXQIZ6IVKWMmr/5efMIPtbUny/QuUr85QrsU+i5kBUIQtb39KoaeOpQky/yf0g1ZN4oWNEmTZv+wXNeHZ+GdugKt8mntpEVNsNcisnRiUviU3HZkGpywDuZWuttt980No2atRggB3nLfIAO2oy4z+jYaMEV/PBRVDH8BmlNefTVWXT4Z1HKCeKfTJr11bAoTaMcMowu7dSIDOwvV+cBNWLRd9FmMJZvIryGP5qeMTSngXm+k0hP2Fm9r7UYHgd9T6mO0iEvFRgsUxzV/5sQ02ED9piB/yhKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRqOvyuFtzV6uEItic02mVs6R7r+kOfEZl1NueftEXM=;
 b=tHVohBIHYgCegYob7+htMabnQfF0iW+Ezf/ACs0Hk3jah3kQG7eFt1+g5+7o5jlqxb5uR2tiplQeclusIx1/x5T40QYhh76PdkVMVcglFUxuCr/B5fSZC4rQMmuB41yrTInucioPh3usAOkujrv+97GBLtdvK84moSjplb2aFZE5EeOV6AqR7C8ScwT7yhSfEYk3qiLwY/G7mEqyGsAS8HFxAl8t/YTfLDe3gmort5Qpl5GHkFXgnlP1mEQtxTPFwIlUgcR+cN95U0o9xJ4rOMIOpu6BSuW52Ukc2JaqW3fTpTDp3gFIjmqEbqklAw6fOIRG7Pw8Ht0sgMUH3VZufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 17:01:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 17:01:27 +0000
Date: Fri, 22 Aug 2025 10:01:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 1/8] [ANDROID]: Add a new xe_user structure
Message-ID: <aKiiZfwi9ykHvk5/@lstrano-desk.jf.intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-2-aakash.deep.sarkar@intel.com>
 <aKiRZkk2CV3bJjOO@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKiRZkk2CV3bJjOO@intel.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 592933d4-8517-419e-b867-08dde19d8893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IslJ68ucHifGcQhxnE+h4Hg+J0XbPQczHz8ho6gt0S6eF+B+R+XuJx3UCp?=
 =?iso-8859-1?Q?mrRCIDXqa6u3QCSABeCvkcff2C9EdmEP8nyj1Q6YPRsnmFvfYtugMSzsiW?=
 =?iso-8859-1?Q?5o3J9gJcEvL1jkuEz1I6OMGqg/bnhKdFwA0fI6TA0lYw3WReDk4CQJEG4U?=
 =?iso-8859-1?Q?tgU1ptLM72mTLzyE+cyHfhKyS0/iArYfhlOM7/+ab8zlUxoc7uvtF1ITc3?=
 =?iso-8859-1?Q?nbnZEHVRx7+cmU+2TfrIZz/9iLmqqcvmJOwWkGq0nQc3wLByxXwS4h5Q5L?=
 =?iso-8859-1?Q?2hi////eDat1DJ+lhDCDQLPw5nm9OYuSm1UkVIIQV9AAGHEukDsubVHwmT?=
 =?iso-8859-1?Q?PXBz7Vh2jEiRVgAK+DFEHCbeSFgBHATm0Ni8ZEp3g8Iye7UlC/gs8W2ZB2?=
 =?iso-8859-1?Q?f2U9bFhWJ6HIkerMYkQYpiSi2IZfwl8eOkXVI1FjDuTGM1UM04gILi2Xm8?=
 =?iso-8859-1?Q?M4CX9dte1ng5fn0+KSKoJg+Hcaf4Kmp+qQmj6ISDp9xbDome8gUKqNgWer?=
 =?iso-8859-1?Q?d6tYYoE4zdVw0+CniO2blkPh4XhpkKUlEJdNLL37fxbbDlwCRx+Me4oJ+J?=
 =?iso-8859-1?Q?D0+fHySwAe55RHpldSrGc//80yrEL76Z/6+k05Gfb9ZVGxy+NUCqkid+p2?=
 =?iso-8859-1?Q?MWIAhnBp+VasQHMpJkYbD4MG/H2rEHDQlC2AEabO/5QMySKcbf2OJGwyG0?=
 =?iso-8859-1?Q?8SGhTyGthoEd/VpJNu8GHvNwmHtSZah3yw/Z8h1Ua/Z5Q+94lbEVlMgUoa?=
 =?iso-8859-1?Q?hlx1azcaywl1IeLyLJdI+ffOXAOQTGkglCoZo+Sfmnru2cm4tBnECOjXbZ?=
 =?iso-8859-1?Q?e5EoXuKZFTjBiMfrPXok9EVzNYuZ8t/U3SYxrT+wgCeH9LuXAxOezZ/t8g?=
 =?iso-8859-1?Q?1h6QhA/xgFi0LkUa35cBUs6tq/mUQ/5L5/+DrchaqmTm7NI2PztxhwfRSZ?=
 =?iso-8859-1?Q?VrGWtCX43IGKBl6QxGB5XcEoyHADoTskefVLIGr48py99cHEwg6QjKCxa7?=
 =?iso-8859-1?Q?eYqjEPnkAHmqaGQmiX+r9h3qj8H/iB43ybTINin148FVpUxsfOwxZyRoHa?=
 =?iso-8859-1?Q?G0lj4s2sTAWlCc4jCVcSe9DTLUDxHLm8GqDj2Ah0ys1ELgpw3mDgVvSK+5?=
 =?iso-8859-1?Q?tsC57SBQBfX8jntsHedfhZ62jMrEpmrTfelcQfQfaWkRa98CsoDkrzBk4k?=
 =?iso-8859-1?Q?AEnTcvK1pICFWXs0l7hbZu+beq0TnNplQwGMRWu5OZPEOw4bHKYQLDC0FC?=
 =?iso-8859-1?Q?veKzEsICwCqG23Q9xX99LtsHNqRkCr2e8H2iCmQIMmwjrukkR6bNhul4nd?=
 =?iso-8859-1?Q?LQ4LIJosIBXpXJYY86ngsW2XhLJlgmADsP6vew43uSd7NCGv8ksvSln95I?=
 =?iso-8859-1?Q?NZmfiFYFAsHB6+QpL8DZjn9m4cIzVqwaOmkcdpE4Q8Tt6nesmSxIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N8dIS9tHpvheIMkBtujZbjS0OAYEuhOb2dPdYCDJgm5YYLk8p4BiUgrCq6?=
 =?iso-8859-1?Q?jejzZWpqyyWygIftWjSFOOwzJiY+5y4aIDv+pKBT6h79G028zsFdXO41Ue?=
 =?iso-8859-1?Q?DhEkosBauhwubqo8WR2K4der2OJipY8P/GuDTCjj/I9aOHKhRAjD3el2Z7?=
 =?iso-8859-1?Q?I4VgqphQs5zkdL7iQr5exJMo1sOke7s0u4II1leqyjCgIZt7WHuAJsktBr?=
 =?iso-8859-1?Q?Etx3EOoSTkkdMFaJG2bxoLJOZvG4YLSBdpyC6hIprruzxiXRpWz0UC0uXw?=
 =?iso-8859-1?Q?yjdxnA7d1+4p6M2cZpzb4kcRj/YXTzFK2hxRNc+z1lwLZg/hS6H++n2L0p?=
 =?iso-8859-1?Q?cflenQ8PVW16K3qXXEzl+Mo1brt4IElEAXiq9UWdeFv3olJcWIsGw/EJHA?=
 =?iso-8859-1?Q?6eBsMPvqtVdu33ykOKgwRQBoqj3oBBL0n8vnti4wLhPkmuUjpY6WIAd2Y9?=
 =?iso-8859-1?Q?K5e3kbi68kx+Y4qeo/8EdxBS4Xc9wbt3OO+8Kjp6s9oXvcZFHrq83NHrVw?=
 =?iso-8859-1?Q?n0sLitFd7s2s77/ZFrWypenpT0l/0wFFXs+xVBkSjLXHz5GbPSGeGSKFct?=
 =?iso-8859-1?Q?HuQrCNV/2xmpXMthUoF6LvxB/Rdjk3GhonsZS3pKnOkPICdbKkxFi7Daua?=
 =?iso-8859-1?Q?fPJAUgEbGgU11gNS5eZA4UUEBmvqpRo2uWUMhVbUwUwPOlur+aexyPgdRQ?=
 =?iso-8859-1?Q?aYNKxVA0x3XxhJwZ9V4Mt7cjKYYdiciq6nb/EOgXuF9EWxJRF9Wp+y8G0O?=
 =?iso-8859-1?Q?NmResbXteCrYbsawuVstk53xq8DdCl8/luvh0c5mMOSMsSHeG/nWaph0ge?=
 =?iso-8859-1?Q?TYO1HH1VtTEWAEeWyL3LLV5iNTgbumSF5WYUgH+8LL7Nt7RYZMEcdvrUkm?=
 =?iso-8859-1?Q?htsY88NLl40Gs68TZ90tiEbXXsJPX5BT9EgpqHaBejCrO17Rrg0Id2HF0O?=
 =?iso-8859-1?Q?IYJTeqaH5HkDBO03LgmYI2dEWAN5+sWys5h5rHDfedPPUpiBSyYSBN5lYA?=
 =?iso-8859-1?Q?o1xrDYeMEM0Lsw4M5t+MuQEFaPPLxrI1vsjCtFBn8sL/JJfcW+9TNgC1c7?=
 =?iso-8859-1?Q?MDbBF7ZoYyfs6Y8Vjeq3gLMag4hcLRSwCmsyWPFZ//mlpZk3l0TkkfdVdf?=
 =?iso-8859-1?Q?IXBufx/nsRD8/qPptw6uEXg5vNTYkivjWcDYSFrzLeM98FjeZ0ykcL9K1U?=
 =?iso-8859-1?Q?84Ur2vThwDZBuWpR3G6JH0rmnAKzkXDY6WmwuFZY9aNLPO7BomIj1GXC8U?=
 =?iso-8859-1?Q?qthhGFm1JDYhQDtOpZmhRLFLUcXzdYOzjuZaCMvdjCU+xkBHk4M1g+ElD0?=
 =?iso-8859-1?Q?4UB2dKxDh6BgKG9ZDD8ZBoIfMkCsvD79twD6FCar2kLdUS3/uFHs9fMXSQ?=
 =?iso-8859-1?Q?ylIhfVMavRszoDOWw+3nTnTm5laP6066KBj1JDKKIN3w3rBxkr/YHCaVw+?=
 =?iso-8859-1?Q?wM/YdNa6ho8JYqdaTzRx/rFUrMiG5z4hl/Qzti328NbDGsVFOXoyGOVApb?=
 =?iso-8859-1?Q?N+fbrWOpnnFpbue7oKxbA8Z5SocfO/nYBDM0uWN22x8O1kCs3+akPsDcSz?=
 =?iso-8859-1?Q?xcVeZNo6b/YGTCrlfRUaHaxqOLIugWIf51lQCimw/HpFP2lz0WQHPxMChZ?=
 =?iso-8859-1?Q?d17kkbgol5/iSwEr8PvstskHLcCO8Aa4LrTB9wxv3ecCVcrcWDdv0wMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592933d4-8517-419e-b867-08dde19d8893
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 17:01:27.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8PpYx8ZBiVvaGUrev1EKdPmDN6WmYuWtVZbMa1Ek/HcUIZxOqMIfC7oZqiJ+v56Xb7IYVewBjOJTG1AUSfKEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

On Fri, Aug 22, 2025 at 11:48:54AM -0400, Rodrigo Vivi wrote:
> On Fri, Aug 22, 2025 at 08:59:23AM +0000, Aakash Deep Sarkar wrote:
> > For Android GPU work period event we need to track the runtime
> > on the GPU for each user id. This means we can have multiple
> > xe files opened by different processes/threads belonging to
> > the same user id. All these xe files need to be grouped together
> > so that one can easily identify these while calculating the
> > run time for the given user id.
> > 
> > Currently, the xe driver doesn't record the user id of the
> > calling process. Also, all the xe files created using open
> > call are clubbed together inside the xe device structure
> > with no way to distinguish between them based on the user id
> > of the calling process.
> 
> I thought I had already given this feedback, but I'm not sure if
> I forgot or if I was just ignored. I'm sorry either way.
> 
> Android is not a justification. Please keep 'Android' mentions
> and ralated 'Android' justifications in the cover letter ONLY!
> 
> The patch needs to make sense by itself. The patch needs to make
> sense in the currently linux upstream.
> 

So what are the rules here? There is another series [1] floating around
with a justification that Android needs this. Does that mean we can't
accept any Andriod only code upstream?

Matt

[1] https://patchwork.freedesktop.org/series/152701/

> This also means no --subject-prefix=ANDROID.
> 
> Please!
> 
> > 
> > To remedy these limitations we are adding another layer of
> > indirection between xe device and xe file. xe device will
> > now have a list of xe users each with a given user id; and each
> > xe user will have a list of xe files each of which is created
> > by a process that is associated with this user id.
> > 
> > The lifetime of the xe user structure should be between when
> > a process with a new user id has opened the xe device; and when
> > the last xe file belonging to this user id is closed.
> > 
> > Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile  |  2 +
> >  drivers/gpu/drm/xe/xe_user.c | 59 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_user.h | 81 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 142 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_user.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_user.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..89212fc7ef44 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -325,6 +325,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
> >  
> >  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
> >  
> > +	xe-y += xe_user.o
> > +
> >  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> >  		i915-display/intel_display_debugfs.o \
> >  		i915-display/intel_display_debugfs_params.o \
> > diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> > new file mode 100644
> > index 000000000000..8c285a68115a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_user.c
> > @@ -0,0 +1,59 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include <linux/slab.h>
> > +
> > +#include "xe_user.h"
> > +
> > +/**
> > + * worker thread to emit gpu work period event for this xe user
> > + * @work: work instance for this xe user
> > + *
> > + * Return: void
> > + */
> > +static inline void work_period_worker(struct work_struct *work)
> > +{
> > +	//TODO: Implement this worker
> > +}
> > +
> > +/**
> > + * xe_user_alloc() - Allocate xe user
> > + * @void: No arg
> > + *
> > + * Allocate xe user struct to track activity on the gpu
> > + * by the application. Call this API whenever a new app
> > + * has opened xe device.
> > + *
> > + * Return: pointer to user struct or NULL if can't allocate
> > + */
> > +struct xe_user *xe_user_alloc(void)
> > +{
> > +	struct xe_user *user;
> > +
> > +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> > +	if (!user)
> > +		return NULL;
> > +
> > +	kref_init(&user->refcount);
> > +	mutex_init(&user->filelist_lock);
> > +	INIT_LIST_HEAD(&user->filelist);
> > +	//TODO: Add a hook into xe device
> > +	INIT_WORK(&user->work, work_period_worker);
> > +	return user;
> > +}
> > +
> > +/**
> > + * __xe_user_free() - Free user struct
> > + * @kref: The reference
> > + *
> > + * Return: void
> > + */
> > +void __xe_user_free(struct kref *kref)
> > +{
> > +	struct xe_user *user =
> > +		container_of(kref, struct xe_user, refcount);
> > +
> > +	kfree(user);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> > new file mode 100644
> > index 000000000000..e52f66d3f3b0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_user.h
> > @@ -0,0 +1,81 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_USER_H_
> > +#define _XE_USER_H_
> > +
> > +#include <linux/kref.h>
> > +#include <linux/list.h>
> > +#include <linux/workqueue.h>
> > +
> > +/**
> > + * This is a per process/user id structure for a xe device
> > + * client. It is allocated when a new process/app opens the
> > + * xe device and destroyed when the last xe file belonging
> > + * to this user id is destroyed.
> > + */
> > +struct xe_user {
> > +	/**
> > +	 * @refcount: reference count
> > +	 */
> > +	struct kref refcount;
> > +
> > +	/**
> > +	 * @xe: pointer to the xe_device
> > +	 */
> > +	struct xe_device *xe;
> > +
> > +	/**
> > +	 * @filelist_lock: lock protecting the filelist
> > +	 */
> > +	struct mutex filelist_lock;
> > +
> > +	/**
> > +	 * @filelist: list of xe files belonging to this xe user
> > +	 */
> > +	struct list_head filelist;
> > +
> > +	/**
> > +	 * @work: work to emit the gpu work period event for this
> > +	 * xe user
> > +	 */
> > +	struct work_struct work;
> > +
> > +	/**
> > +	 * @uid: user id for this xe_user
> > +	 */
> > +	u32 uid;
> > +
> > +	/**
> > +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> > +	 * for all xe files belonging to this xe user
> > +	 */
> > +	u64 active_duration_ns;
> > +
> > +	/**
> > +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> > +	 * for this xe user
> > +	 */
> > +	u64 last_timestamp_ns;
> > +};
> > +
> > +struct xe_user *xe_user_alloc(void);
> > +
> > +static inline struct xe_user *
> > +xe_user_get(struct xe_user *user)
> > +{
> > +	kref_get(&user->refcount);
> > +	return user;
> > +}
> > +
> > +void __xe_user_free(struct kref *kref);
> > +
> > +static inline void xe_user_put(struct xe_user *user)
> > +{
> > +	kref_put(&user->refcount, __xe_user_free);
> > +}
> > +
> > +#endif // _XE_USER_H_
> > +
> > -- 
> > 2.49.0
> > 
