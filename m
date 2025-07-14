Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7E6C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 23:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077FC10E0C2;
	Mon, 14 Jul 2025 23:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7FuFhzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1B010E0C2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752536212; x=1784072212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1sp/TAm8y7oLwpLsm7a63sG4M/z2ZHU0O5Wp19tTU7s=;
 b=O7FuFhzEyketgCj5A1u8VOsUDRcjBfzDjhnGGycDiZrW6HdEWSgRvddj
 gs2bWKp3MM2731Fr8+1oqp5oHaxaDDpc4kqQUI98zL/fCrNMQcKVe0VYN
 ab1626ih7ozVSgm3Cu6CVIu3+yUsu/YImFMWEIZ0UNUN/Cg4txT6bT8LD
 W0z5TXIgTRDBompRGx07uyf/11ZVgt1EkD88Z8MpVdk5vw9D+Cv2JA4xM
 enxZIrYblQzD1Znc6/5j0yY/5/D4/VxexT6TeS2887YS0IYv9567wLr/P
 DXBjV1lh8OvXH4w1P0UctEL0bKVsEbtAeZg7l2DA/uf04QJUrxcAtt/xh w==;
X-CSE-ConnectionGUID: anqSd+B4SpKOpg/zFXw+uA==
X-CSE-MsgGUID: TjqKxun9TLm4ALERMCm3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58508015"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="58508015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:36:51 -0700
X-CSE-ConnectionGUID: +qrbVuTySsO8gpFYoezepw==
X-CSE-MsgGUID: 0QBIPaosTNKJCDTWja2Ldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="180762654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:36:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 16:36:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 16:36:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWCbeEw8T+kbMYpkJ1G9Tw+3pOxaAhwUb8abndd7vHCL7CYYffPy/KMN8O3sTl8XOBPvEO/NdjZETeQiPM88TB0W5FQWPSK1E2odzGXDGXvjCACjofGqo0qNacxrlMBdE73FHD65IbnKT2/JG86azEnT4UCu97GLFB8nXqDa71YPLrYVFcpYyxuqzu3nbIZVEDdEd/V5Fh4y/QrrbwGmV13zoNzFBDwx5S15sLTIX1gJCeNUdea1bOfoutMMKAYOeIzTE8b8se4gec6ac7Huzex0+aeAr7qiJilIb4OnE29g5JXLung3aXN6Gd8h9fCLJkGx3kn0CuVANWyeigkanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJJLe5a5NucyLpqM7UpkHD1WvuS/CLo9GX9Xi/qtUEY=;
 b=qS3UUIMIHnL5PTu5rcsI/1zKMogJzciMwjsuMGUh0hKSO1OfOO5HvBxOk6MDgPz9pTZ1O6sU2SKS6Wzf7+1DB8Pa1EtY7JYRRTcrU/0zRy1+YfopuEsbcokcXNpXYtObGkiXs8oAz2ZRmDkEGA7XbgvMOq+1BdV7QimqbqhEPgsc4HnJGXLXBV4zQizNJA50yBWiCZwioBLLXaQmg0BUoYGQSSN/T2M6+ByRi5/5aQ51aYWL0tfmRQETNu1myYAH3QU1o+yGBQJyv/cGNyaU3Y8TZorJiGm8j/tZ1hAt0cHcM80iZ5W0O19j9gUQCNNYdOAyq+ILFUgTVRSQmB0yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 23:36:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Mon, 14 Jul 2025
 23:36:01 +0000
Date: Mon, 14 Jul 2025 16:37:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe: Add xe_bo_tt_has_data helper
Message-ID: <aHWUyYtN7XidCVF2@lstrano-desk.jf.intel.com>
References: <20250623151929.2422584-1-matthew.brost@intel.com>
 <20250623151929.2422584-4-matthew.brost@intel.com>
 <767ffe9f-58b0-40b0-872f-6d3adb54c3af@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <767ffe9f-58b0-40b0-872f-6d3adb54c3af@intel.com>
X-ClientProxiedBy: BYAPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: ac94a6d9-ebdd-4604-8689-08ddc32f30c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lrnE9OYmexroKPyZwTrn0vgpwB62My8wBYAse4PWYw8gbVQVMNexGazGIuv4?=
 =?us-ascii?Q?VYGOffLJExw3GJZkPpspSUJeb9Kr5XczUJ+gPIo1zjAqFde3twLsSiJgQmhF?=
 =?us-ascii?Q?Hr0rA70nErBvwQEoYneP4zZcEccVnGYzuvwc940daVGMYpXsd62TqhqkK34y?=
 =?us-ascii?Q?LrNOJ9r+kuF2Avv1ZUTGupmOC4rESOsys2jwWj3w0vpKNk0LeZ5wWH0yXsPb?=
 =?us-ascii?Q?ZEfCThRf3YJZIy7sVc4JPzSGe+3o05ew83zqzz5KOcAvNmMaRAM1YsnhuyvL?=
 =?us-ascii?Q?mmV7cfteZEnPVV5/CdP3Rnlq50TAepKp8tlMKzyfyH4ezZQA29+N1fNDoRrz?=
 =?us-ascii?Q?T1XriNkF4fUAah4dzZBr+2lmpAd+jP/DPvPYKOraI2Qh3jGr95QCqUGz+Sir?=
 =?us-ascii?Q?j/e028RUlygLpCc9ToBg0Q/fWDDyTi7gI5aeLArsPaacAWKpfcbZvVSya66y?=
 =?us-ascii?Q?KMj531L5FZVOBqXbGp/EiIUFiIP8Pznve1NhBd+FyjPmxiHPhoWrW7aLPbUB?=
 =?us-ascii?Q?tuR1SvhkJ7ltXv/0dSFraO86NEMVAmaTG72UerFn/lggrgbNXgeS0He5uK/h?=
 =?us-ascii?Q?RsygQEASbXS5yA2RhqKziwcMZh4AOKyRtrM5i7pJjYQ1qLbtPNXbg/yZA5CH?=
 =?us-ascii?Q?GwQZS5AdG0PnpNHkE4OieOFJ1U1xW7pxtJ7+BBINpyKCAbzZuM+Eiy1SKBZR?=
 =?us-ascii?Q?jX75d383JrTY+GWCx6g5ZrJOkycLpgRfZ/IWhul0pkMIP/EwRTTmpK8G4Iok?=
 =?us-ascii?Q?MMk5C7Vej690vHjarb3h6KdGz59LEe6v9Gx0OsnhBkqfGwJ5U+3psrqqKsZ8?=
 =?us-ascii?Q?82nrLF8RPA62fXwApyvf10p+gFM9bw7iOGfJvSm9ane+efD3NHoMZhvIROTh?=
 =?us-ascii?Q?Kb1xor/POXcATM761Elw6EUgmzSPfFwouOZuEkoJ3BVNvAL5a3efppfOVq4c?=
 =?us-ascii?Q?jTPzcHIcUOMt4gVaRdsqOCUctlf2/Y9/06TNSHbGq54SmsJ7pHUUquyUyao3?=
 =?us-ascii?Q?N1URyiLqeW1Te0uOMRQ7wckmtMs+6rjwTuH3RNDKMJU9DzTL0I1zgKdw6JCC?=
 =?us-ascii?Q?8HUUdYW2BgVklWXQog82oJoRhNYYECUxkmX9J+nvAv/Y8nqN5ZPwvHhhfjxV?=
 =?us-ascii?Q?vzOUjsCXwJmztluiuqqkE1ltUJj6uWfLUMqwfUmsDiOCtpE+VRZjt4+wINrc?=
 =?us-ascii?Q?ALPEWNRW9pyAUdn2O9iAXqsi7BCHN8jF8yjte7h5d40d04v/NZCukh5a+jLv?=
 =?us-ascii?Q?xId+7bhyPyKnzSHz7G1lsbVKGEI0eBe63Siac7Nh5IitQ/1cHS2SLeuZCrwc?=
 =?us-ascii?Q?QCVOGZIh4BZiTRkoeBW3pcm5lS+SaUNIeIt9HcKv0ASvdO2jBEQYRUlcSXIO?=
 =?us-ascii?Q?z6fNi21MGiFNJjF5Bz+4XKTM7RkK/0KHJAoG+wgif7/DhULhP4J0Euur8HHb?=
 =?us-ascii?Q?N8vorl+Tu54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sgFo15XISppqXf9LG6Fatr6x5KTasSHU1KEaeet7j464lChsACv70SvQPC7N?=
 =?us-ascii?Q?T3RddeFSwvFcc4meL81lfVRi6Usje/TpGVJbaD0yYycPC0XSiDWnf1IK2Zaz?=
 =?us-ascii?Q?Jd+lEJUTtpnvfehMRw0e8DjbCKtLZE/jnKqR6vfCMMZEuzH3I8pxqQ5HK/Q2?=
 =?us-ascii?Q?KLGfmrKsbuQhNAOHTfwDzsgcrF65U+7yDE90qCeg95tK5CB49+HR33ZmWvBz?=
 =?us-ascii?Q?Dzuv457esiPKWvM8QrPG9rsSe4m0NVsW64Q6reJv886Z6lV+ehyHO85WtzTM?=
 =?us-ascii?Q?DZpOPuX8wKJEHOx0euKFBV71obJ6XyjLe2Q71xD/HFWlyf+mltJUTD2e1bnl?=
 =?us-ascii?Q?yN1x/HdHUnkyq1Sr5T9YGzjnVIhvKLJvMqbSrNivWbGKiEFqviSQ1UigICnK?=
 =?us-ascii?Q?Wlp8I76I2E+fiEhEQU1/CWGDUYFWBwKT1xGoD3+a4Si5lvmczkemqP7hUO7t?=
 =?us-ascii?Q?DWytOt9LhVtPc9I6UnPHMPDi/+bLOQ/+BpwRMx5cR4BcLI+wHMXFvfFknqf7?=
 =?us-ascii?Q?wU3cmwpIlC2V6PDV6xGImoSX+dEaSz0hEPUHiB/VQDiMEIpIT6CSFeNByCWk?=
 =?us-ascii?Q?T6qBywuScxJy2kvv9lXbnQt/gV9FchLZlp74PN+XXwBbS4dZ5B9sbi6NgIaq?=
 =?us-ascii?Q?rd8iez4JUUq89IGb/uQzr8yVQpGigzN5ws/gnlaoeP2tiIs2+tvCMnrOQ2TT?=
 =?us-ascii?Q?9DT73McI+M5nZCWAMrUbLni7IuvzfKLW3ReLy6qbcbTLyedjBaUxrZC+pKSQ?=
 =?us-ascii?Q?vk/dMO1aBv0lVYRi9zgzZ9WKbb7Ymf1MDxjHmfq0Z8OnYc9AE3C9gh2OKfF7?=
 =?us-ascii?Q?S4TLu319L0BiPWP5NoaHZj6H0K+2vp6qRjwKv/85QlbaVPBsH16KcosLRd7Z?=
 =?us-ascii?Q?YE3GlMEOU08ENcfpXYs/QEz63bT5f2AxPnK07Vg6Wlv1nTZ9a/z07llzWQ7p?=
 =?us-ascii?Q?S7KxCxSGfifBBSoEiDPI5nnwNOi0bgbejcvARjFOztcTCfTp6Dz0Uql8HcuG?=
 =?us-ascii?Q?EpqAxxiipp0Dteg6cWzSEdtJiFfkAInZVp9MEPATP11UaKZNYaWs1R1Bqq3D?=
 =?us-ascii?Q?HsaEN/xMJA948iBMqmswaOQVrjbGPLhcKYtl+G4pYWvmvdzmVV2sRHOyvOic?=
 =?us-ascii?Q?sEtv+OfcKNl3LRV0lDNl1Dnzq6qBYF2/FYk5AHh+1YOkX4TSrf4GXn2fQTlQ?=
 =?us-ascii?Q?GMEh4fnr8LPZFKngIfrReKgw1qTdAAene0Sx3i+XO2wMEoFkjmiWOAxOajy3?=
 =?us-ascii?Q?OoB5hoq8tTpKGQzpw2YOgTyYUsmB2gHUwf/vumRPP1zurU3xTqwNF7X7WEv1?=
 =?us-ascii?Q?AYY9pIWTywHHpFortNhG0UNrxxtr4fIRIpVI/I4lG1BGFPxjP2zln/Wk8yxx?=
 =?us-ascii?Q?KZHMkaWvg41MSHCnX9+EKFAwSNaShLO5trdyBut/Cej2RYd8voFSKdwlKe23?=
 =?us-ascii?Q?GSMQUR9pzPxnsHcdlda+EdT1BOQoyjoW5S8rA1tSERN5cf2l4WHp0cG1AjR4?=
 =?us-ascii?Q?IitZIXKDg6bWR2TvO3KXywtfFnOJtizJsm/kTuI7UX9DitRZoscnQq8nASJ3?=
 =?us-ascii?Q?xnjPsc6kvvf0LfmStKI/u+tqBZVCkV25/N5Tk1BP1cvzrxv4Q5O+zPWGNmPD?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac94a6d9-ebdd-4604-8689-08ddc32f30c8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 23:36:00.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STKBTbX/+M22dF5+NYZx+lkgtAEAlGwVIg47pQeKbPZVrE4bL2SI1S9SB952UB8fXNn/CVd91zUvngzGsShXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

On Fri, Jul 04, 2025 at 09:58:28AM +0100, Matthew Auld wrote:
> On 23/06/2025 16:19, Matthew Brost wrote:
> > Add xe_bo_tt_has_data helper which determines if a BO has TT data (i.e.,
> > a BO has SRAM or swap backing store).
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 21 ++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_bo.h |  2 ++
> >   2 files changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index c93381fa4858..7a412121477e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -766,6 +766,23 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> >   	return 0;
> >   }
> > +/**
> > + * xe_bo_tt_has_data() - Xe BO has TT data (i.e., Xe BO has SRAM or swap backing
> > + * store)
> > + *
> > + * Helper to determine if a BO has TT data. Useful to determine if copies or
> > + * clears are needed on BO when it is moving.
> > + *
> > + * Return: True if a BO has TT data, False otherwise
> > + */
> > +bool xe_bo_tt_has_data(struct xe_bo *bo)
> > +{
> 
> Maybe add an assert-locked for the bo? I'm pretty sure caller needs the lock
> to check such state?
> 

Yep, should have the BO's dma-resv locks here. Will add.

Matt

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> 
> > +	struct ttm_tt *ttm = bo->ttm.ttm;
> > +
> > +	return ttm && (ttm_tt_is_populated(ttm) ||
> > +		       (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > +}
> > +
> >   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   		      struct ttm_operation_ctx *ctx,
> >   		      struct ttm_resource *new_mem,
> > @@ -801,9 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   		return ret;
> >   	}
> > -	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> > -			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > -
> > +	tt_has_data = xe_bo_tt_has_data(bo);
> >   	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
> >   					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 02ada1fb8a23..150e98ce6fac 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -374,6 +374,8 @@ void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
> >   struct sg_table *xe_bo_sg(struct xe_bo *bo);
> > +bool xe_bo_tt_has_data(struct xe_bo *bo);
> > +
> >   /*
> >    * xe_sg_segment_size() - Provides upper limit for sg segment size.
> >    * @dev: device pointer
> 
