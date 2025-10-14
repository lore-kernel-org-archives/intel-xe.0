Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B91DCCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090BC10E686;
	Tue, 14 Oct 2025 18:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1CadZ97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893CC10E679
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465695; x=1792001695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjbwUpG/ev65gocg12V0iH93BIl8Fth9RppuUeSyVJU=;
 b=j1CadZ9782Hapslm8TC2IDKx7eCa4va3mjjSVslun4N9CvsAlji8A4Xd
 7Vl8APU9I/D1Oi0kpk604yGWamAUb29nGHkdr5ZVvu3XpnvPzdm1i/7S/
 URNoSgfjO9rWr+7NU2vf0YV4O2hr9EwWybxheKYRnuvcjcqxp5+6YJ9gd
 UBG6nZNU+vrJ+Pig5rU5VVB65hqCJlYrTr9hnnkMKqVsm2Frmw8/yUs60
 3FRqCSG4U2pG5HcdK5wXzZFW1JQglvs0psQ+G/yJ5Lz0FlaGngiKbiy6S
 T8hbgY8N4djtHbUAAwk3E05/ZoEGVFTznV68LEI3WWcHgJLEEZJovEQNC w==;
X-CSE-ConnectionGUID: QRyIUEz9SXK6+UBmd9Vccg==
X-CSE-MsgGUID: ktQwoezDSGqen6tBCocg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72904756"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="72904756"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:14:55 -0700
X-CSE-ConnectionGUID: cfx8uVxzRp6Fb1/hJunEgg==
X-CSE-MsgGUID: SUbnyvjFSbiV0KyQjiB9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181956687"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:14:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:14:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:14:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3E52ohYmjJzUBjvUxZth6b+iA5X/WWirmwJafkVx6wfFtKKitFE0tJKkqu+6MfgbkKC3OmvOKJO/brsOqVz6BQ69Lct8rFZ/jpLS+VqQND6S1QLhuDEuna4v4NrXs8mILsNQWDmoU/OzsYREp9bLON9uJLA2SRUOm6N1VKZ2/VCbOkSKNegOmdHEmLvQKKhoVAWKzL/3iYBqIVCbkkANB89AUUfLiUQVaNJiIn230X6T8wsrF8Ys0svOUGY7hDV3DDy/DkhBWHDxxybTmKYtyVDaUvw+YY4lGwYvhO/Wo+srAfOcLW0f5ymPNWPHxHUgA2eBVCDUO3p3PhSewPKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uk24EC/+B3Dl8x9qAj7NTJaYiz29qz6GSq8OPhFHNc=;
 b=ddyGM8BFdAk0FU4pulEl0I9EBCdh+Qw4CqvnYXMq0U06HVUZGHEK0Vr2+BisDPLwopxyFOyVVyf6YIjcbBstI/8g80EUGR8oSVEPPSf+whQI1Xa2V6Q7zEiaiGXXS7Scsa0bfuat/76acTubB7yoIHlyxeoH6cq53fr4tZxdXMhOU91fR+ehONF5+KwAAtgv3SKCKoutNqG3TCV9UvkJXfILNFTQ8L+rK9WGSU2YxO9wfgJXrZS66wpYaoag51i9YXwa+5ha+sZbA6oL2iGv0esQXS6fnuuBMOG0W/Rl2P511lmbRwCOvtFi+29EbtkL7KUwQ0YLlCVN4myhlSYznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9443.namprd11.prod.outlook.com (2603:10b6:208:55e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Tue, 14 Oct
 2025 18:14:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 18:14:39 +0000
Date: Tue, 14 Oct 2025 11:14:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
Message-ID: <20251014181436.GZ5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
 <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: dbab67a6-8c16-47f4-24fa-08de0b4d89fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hLo9/CgKxnkYc8v2zqlc36c4OeU/Rie2NcFclxXUvZTNZvDBHQ+RU7r9GBue?=
 =?us-ascii?Q?VwoBusQksFFjxepVjwtvvFSNk94kBnYwOtJIDnYCXBdVYx2jkysCTzDXgYRE?=
 =?us-ascii?Q?wqwab8hF9PkALN+ahBvqpVdek86OJKKjd9jvbL7b2KWHlMUPOccZLyDNWt8r?=
 =?us-ascii?Q?iJSqfSbs+fBL5RgcJTdNRYpBe9XgsdbAyEaJvwYVWEWX0QweFASKOYnjMFP5?=
 =?us-ascii?Q?FrKascL2VjHCRsXALRckMevWW4NQojlcD7JAU0pFFum86FVQ9duTxs5fRutX?=
 =?us-ascii?Q?ARGlwlfLCR0G/qXtRJg3tiaIyZM4OYsjwbb85CcQEw7bg/KJu6GgQicAvJHC?=
 =?us-ascii?Q?ukVvD6zNqRPFQCTwUEMxSbqh2OoIWeZQv98gdcRMkbkL/j8vgvCWJMx3TFVF?=
 =?us-ascii?Q?f0KNDsWuX0P3HamFXic68ysM0lGZ+0gXzSOg0sIYTAoAnp90vzNVzHyv9Wv7?=
 =?us-ascii?Q?Jy7wAxH5tpsgh4WCxprdF4J/YaYcE+sF24ulDINhsZPLPeE/SufO47kjVqei?=
 =?us-ascii?Q?7/TPSNoMxNPsLK0ISvdbh4ZjkiYkYVU+wH15h4EEzgMUW/31OVgtSkdwG1u1?=
 =?us-ascii?Q?dVi9HVlMM8wk+3gfB23Rf2nEJ4IqkV6FUgzwM+pzf3LT+mEgEqH6Gb1mUV2u?=
 =?us-ascii?Q?njEyBv83u/8Vb9dBzPBwwm/M1/oRFRAjT4c4rsKu7NrbCzflgQPBKMrUZUH8?=
 =?us-ascii?Q?51y3jhWWqcXcrrNthavhs4TSGFE5QKkXE2jMy+F0fQ/uEICRcMrKHbxImqbH?=
 =?us-ascii?Q?lckPyvsrhGGuFnJBVvsAZBOSCRKOWri+4YVCh7x/QEaaZV/RLlK9/aPDTRAd?=
 =?us-ascii?Q?q/k6omkDjQK7NtZooXUTdI4h1cj4YLzagYdGb5pOWvSzKb/XSeprL2tgsUpp?=
 =?us-ascii?Q?ZEtXHQY2kOQiFWk8Rxv3ykIryb0U27L6yUXna8eSitvays0vLD6SVL17piLQ?=
 =?us-ascii?Q?bKQ1M3rNrCKOTFULNM+j312GifgnMJ81pIgB60KbNT1SC1565JZuV07dTT47?=
 =?us-ascii?Q?bMBcZq7S57WXRzv4AzmeasWEum3RHhQefv0k6Lma4VkUTqGEKX26q6oMZFai?=
 =?us-ascii?Q?/zWVnWnzg7N2SJ50m62U1nNCannzw7cM5yantUenWq2API64isDun8YXGPyn?=
 =?us-ascii?Q?AvImIFcAzmAHehK2i9tKtPl5CM3ClT7xsnYd+DP96/Mgk+/AVeaZFEsqHHWS?=
 =?us-ascii?Q?Xa2z13rczRwjWVcdZWtRop8IzeSvQDjrukadIaDIPFZ6WIP/QA/GUhH/Eyb2?=
 =?us-ascii?Q?maBg2cyB1ih448Zp/9klr4XLwnm7Hjy15LdFjgWv9zeSQDqr0q0yrcYr30/U?=
 =?us-ascii?Q?r21ussgv/B+WdT0Wi0oaMXja8OLNwNEsrCT4q7nfCCxhYj1iiKVX2bQ08VAP?=
 =?us-ascii?Q?AM0jNRFJalQzp3C0HsbY8Zv5ksLDQ9+NTpvxP8qGygsbD9tT0nGJfpXAEJ3b?=
 =?us-ascii?Q?mw8qzzTj8qGb7zAcXei66GhdPfRJGlU0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTHV7WhCMh7ax2XctX2cKxTuKKijaUW63bsrQJ4Jy8gxxdyDQWS2JOyHfmhO?=
 =?us-ascii?Q?nIfMOPr7heNVQH/3KVD57FQIyVRSKIunjU2ocwPPl2L9+iwCyBSV1RsGqKRo?=
 =?us-ascii?Q?HiUHrRZSqr2r7Y2Hb3chw/NXR5McvW3s0lFFCUQa1qZanQPiVBjUjEerjkQb?=
 =?us-ascii?Q?AzR784HuUmbMbAZPfIDcC0zJR2QN5atMA8AvrdznQ5wfJFVxWLJ9NR5v+H1F?=
 =?us-ascii?Q?4fyZc3qNy04PXFeYHV0UlYPYeJ7ZYS49qKLC+p9UwBYm9C0lVkWooKW4TEqH?=
 =?us-ascii?Q?gY1tRXLEnqmpi2R23zmrmon6DT2ftfIyk786YnKJGVcMD+1Ez4pPUiTr8L6A?=
 =?us-ascii?Q?cb9jdzAagvJKPvEkOt1GsRsg2hxt+6t4mcQkDW7k6KH3TwPndlK0Zzz/fBKp?=
 =?us-ascii?Q?Wv2b0HJD/vWcP9A8jDxhshkAjCy8DGPkg/bBK+YKQ948Uy+UA0Y2rYFuVM8A?=
 =?us-ascii?Q?rCiV5bcjvufp99r3/AiA/0Zy4/z9L2wyxwN5KRXxQduLkJo6ARaxIKA4S9sn?=
 =?us-ascii?Q?NF0hs7LbNu+XdDwCuVydOaRtyyAx3fH+kOmXv4l3IAglvCYpCbxKmF8yzQ2f?=
 =?us-ascii?Q?4ZjSzoo11y6Uyk9wbj/+EFuyZS63/7BfSyzTjBBiSoWgt++sViDNTmKhNHGT?=
 =?us-ascii?Q?h+uTkuzmIsGn2Vi+PwSBDIgQluh9bDbLVcFo5n8mzuH+BxQ8tePAY7vX6gN/?=
 =?us-ascii?Q?2YroSQpqOPfTMotpWobEeqrrBP5JyoWZRIT/rGy2s2wdsdAfOTbQZ8pl6Q/V?=
 =?us-ascii?Q?dAhpkFz4zhpBiDRBwmlIyH5MmvLcvg9M6r9YSLhfAijd4HUJKxaP1A1HZvX7?=
 =?us-ascii?Q?gPZYAWnHqf9i5IQfLEmhFzoOxGuC71RrM6TCCqINXuNLXv+CIv7W/L7hb37N?=
 =?us-ascii?Q?S8NaFvj2BJT/XTMrQ580BugtaBPyc7eaFXj7G1aQhzwMjue4nm1Jgr5BHr07?=
 =?us-ascii?Q?yG8MrkQuG6VffZ+U6xjtuy3FRjdVZoHLjsWAtvMrdjr2PqltE9JtJLUyfNG+?=
 =?us-ascii?Q?loe8SM6JKEVy0K/X0dKrrRPUqmgU1Ztc2sO0SAZt8Qe4rRHI9dzLT2O+dp+l?=
 =?us-ascii?Q?TJeYsLbGxeAu5qcS8XI/0ArwupkE/XYiy8uB/sokVsFwUEfaHnkSFtOVJf2P?=
 =?us-ascii?Q?gTiwbjjqvkAdGo6Bv/PdXvLl06jRlGaTlKkLi4tm3ptRO1lBoIKXCIXIquZT?=
 =?us-ascii?Q?60wNEUJT9K7m6A5zoPss34otxq9CLOEtokEL9BVcwOYmDMKeMvHnpEotIiWj?=
 =?us-ascii?Q?4T0WEDxh2WFoqj9ISxVNHRFgGDVLTB1diNBo8eEc5LKuHE+JPCS6BRp2137E?=
 =?us-ascii?Q?CkCgHH0yoi6UKp8edqh7X8xbfcnWT8VY0bNIEaEHgcvnkQ9nzPRAT8YOZdzH?=
 =?us-ascii?Q?x/dBHEqpmoGkQRH6Z8FlCaQV0tIljjWY8+xkBtPtI37aNcgMKo3ZOgOJrYaB?=
 =?us-ascii?Q?dEP4L/lYUDkEVC4gFtFgNUph0kSpxBqwAIe9+1vvGXmIixbAV+PKQoxvecoh?=
 =?us-ascii?Q?9GOVjBN1zGvF/zJOZJ5quisJ1gp9f5bVp/s477jVJz6rGPuWnG+smMA8shB1?=
 =?us-ascii?Q?y+21YR3KVnkuCXkXZ/QFRbaRIZNea+DddJ8cPy+HO1kIHY5WYkVY1OBuBmp3?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbab67a6-8c16-47f4-24fa-08de0b4d89fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:14:39.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OpM+6bMEt5J38Qp840er5mga9qZudC4VuO6FT1zJdb30UwYUhCww/Z5pkiPF6l7aclQ93CPIABQZYFdaVhJPhRs9svTEBlPkLryRkKEsGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9443
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

On Tue, Oct 14, 2025 at 01:39:39PM +0530, Shekhar Chauhan wrote:
> 
> On 10/14/2025 8:54, Lucas De Marchi wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > The compression overfetch tuning settings only apply to platforms that
> > support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
> > compression) some of the registers being adjusted by this tuning will
> > not exist or may have been repurposed for something else, so we should
> > take care not to try to program them.
> > 
> > Note that our xe_rtp_match_has_flatccs() function will also return false
> > on platforms that do have FlatCCS in the hardware design, but have
> > compression manually disabled in the BIOS.  On such platforms the
> > registers still exist (and it would be fine to continue programming
> > them), but they would have no effect, so skipping that tuning is also
> > safe.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> The patch in itself looks fine to me, but, the patch doesn't specifically
> play only around Xe3p_XPC. Maybe we can move this patch out of the current
> series, or if we wish to keep it here, can we instead drop the xe3p_xpc from
> the prefix? Thoughts?

Aside from PVC (which is Xe1 and not relevant to these tuning settings),
Xe3p_XPC is the only IP we have without FlatCCS in the design, so at the
moment this patch is specific to Xe3p_XPC.  As a general architecture
though, if we eventually wind up with other IPs down the road that also
lack FlatCCS, then these tuning settings will also not apply to them for
the same reasons.


Matt

> > ---
> >   drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
> >   drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
> >   3 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index b5f430d59f805..22a879270c1ec 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -376,3 +376,9 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> >   {
> >   	return xe_gt_has_discontiguous_dss_groups(gt);
> >   }
> > +
> > +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
> > +			      const struct xe_hw_engine *hwe)
> > +{
> > +	return gt_to_xe(gt)->info.has_flat_ccs;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > index ac12ddf6cde6d..92f0d16110dd5 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> >   bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> >   						  const struct xe_hw_engine *hwe);
> > +/**
> > + * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
> > + * @gt: GT structure
> > + * @hwe: Engine instance
> > + *
> > + * Returns: true if platform has FlatCCS compression, false otherwise
> > + */
> > +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
> > +			       const struct xe_hw_engine *hwe);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index fd58ea5e78bf6..7c140d8cb1e07 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> >   	},
> >   	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> > +		       FUNC(xe_rtp_match_has_flat_ccs)),
> >   	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
> >   			 SET(CCCHKNREG1, L3CMPCTRL))
> >   	},
> > @@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
> >   	},
> >   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> > +		       FUNC(xe_rtp_match_has_flat_ccs)),
> >   	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> >   			     COMPMEMRD256BOVRFETCHEN))
> >   	},
> >   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> > -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> > +		       FUNC(xe_rtp_match_has_flat_ccs)),
> >   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
> >   			     COMPMEMRD256BOVRFETCHEN))
> >   	},
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
