Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B01FE68954
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 05:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CAD10E2CD;
	Thu, 31 Oct 2024 05:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyUiLA8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08E10E27A
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730351412; x=1761887412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RRW6zs4OAjXy5qFY/KzubS6oHJyw2m5HJ6HrNRipw8U=;
 b=QyUiLA8qyxWwRVa5yX7JVT1QhnOOXJeP/GUjLtSCj2xVIH2H9NYle58F
 r19AOlAPrI36uTm8uZ87DkI/mNnFi/4Pw3/KtQTqsCk8Idoj2SIZ7DjEL
 G+C+kVeEHrzSc2nWN2g8p+EzmUAXi1eW8gKlwtk8kFIw4EdmNCabrTbLs
 jHs3b9fs9MaQo/LVWnGB+18CMWbxlY9QmQpaD6XXi3jSI7udIm2ccdabj
 VcvBKwuBprbR3Qhld3LhgEQddnUAvLOmCxCsnT4lPComvqrbQ9L53lHEt
 oNJ7PyeA0jzU1Wrr+++oEQF4lPdwR8t9HCIbPWZY/f0TvtIbV+CU2/5g9 Q==;
X-CSE-ConnectionGUID: K3tPdsnuSJ2d8PvgjrYZAQ==
X-CSE-MsgGUID: IdpQcO5ERQyUVXIQamX0Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33768770"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33768770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 22:10:12 -0700
X-CSE-ConnectionGUID: oAfyxouVS+WxZHwvpllhFg==
X-CSE-MsgGUID: tcUDG4MCThShKkZhnxPkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="105842306"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 22:10:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 22:10:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 22:10:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 22:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8REDrBeKLFMm9EW43sgOec7pc8wMKP+9TddDy6T1QBKD+qCVqkM3TZRor4dGHxGEZrvWTmSRzfQug9SegXjv8d5F1QS/VcpQI+uZYgmvJdXjqI6prb0LjxX77aSWOZGLlXtihROlwvXx53IhrtID5W2TVpGJ3P0qnN13BE8jt45bD8tS/3XGDyLmctThmbodqIOxq4lC3veKWEQJ0ITKWI74QNATzetAiCiyzaFFP5AB8hJTmfSSBqnvbbpWfBv2HjfYzQmCxw22RDL3u6/l9mwpicq9m0rp8MTRhbCxnb5yvEXQUET/2jJz5438+qEtSVi88fLaWBoOLluW1JDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYH1mmP/oSha5yUJV/yEad6IRmT7TAVlv3Nblhz/yjQ=;
 b=S3W4XXu+bZB+FUfxYGuIBYOtvoaNz43y34D08jC2AmKurQAydEXUKdIdOc8NtafFT+cYDR/bE1mWT71cfRYutjM24mBPScbZr+v0pFDegAiVAeZ0DxjPn03YR3gnAFv+k+W0NWj9WWFwNUgW0JnR+TSG01X3iu4lKG8Mf2aV3+jo6DovUnKD8mxVemDeXEQ5xMupkd2vnG05fo4yUW7S27F26tKcHSQ1lZKXVXCDT5ueF27NFMJcyxy+fF1IzEZKsO8zJvDsgMggwvlR/Ieipa61HXpDAf/BOFD0LJ/jUCNesvsY0AZ+0CKXb9IpIDG6xAsxfaaykjyKhynH5ktaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 05:10:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 05:10:04 +0000
Date: Wed, 30 Oct 2024 22:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
Message-ID: <ZyMRSQZi15zckEbG@lstrano-desk.jf.intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-2-matthew.brost@intel.com>
 <ZyDjiuhhGqSPLEl_@intel.com>
 <ZyD3T8pU8Q8H4k8k@DUT025-TGLU.fm.intel.com>
 <7dcm67332fipskakin6uhqd3yjt6eykpnlz34c322omhdatk5n@2cflr6hqujod>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7dcm67332fipskakin6uhqd3yjt6eykpnlz34c322omhdatk5n@2cflr6hqujod>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: f74050c7-669e-41bf-60af-08dcf96a4749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wNxhivYZXfWGmFbE/7FGR1fFss2xyCJREu/Er/oossah1BXFJS64FGgXve3g?=
 =?us-ascii?Q?1c/mEQ37s2l7cCyXsYT0RoJV1Yq70cbZTHi3ozmucOxi3moQ9gm7Mvew3wU6?=
 =?us-ascii?Q?+nsocYa98Y11y4k6ZXa46KMFSJFX4H1FRYhg0PaL4NY7dG96RSxoicIg5a8W?=
 =?us-ascii?Q?vAKPE3ME4kSFO4CujoTx7/dJG2wTx2amNWczHrZNs12HhNMIgXk/hPbrZGOT?=
 =?us-ascii?Q?WCmQZDgF2pZKMhfmxnotqsVra9bigJmUYxcCFp0DkG7+bSWXrxn6pCl9BIbi?=
 =?us-ascii?Q?W8jKKCb22cC33l5G9H+aq/gYptDKqU7qBadktxVSxkxkzL3MUQ/IWqSD41FH?=
 =?us-ascii?Q?OZFsazbLZ/OWsOFt2ZCtmxBIm6VIxLGSn5K9NmPa8iE6EAFhryiI0Zj3ZlMK?=
 =?us-ascii?Q?6Q2+1auyBx+L+DOrbXexnapvan2Pg0uKluPS1gHoQBaRRugCUpHfJp+CUFMw?=
 =?us-ascii?Q?LqlmuicWHoaRvGJddzlT0lQnkc8IG68qv4159hYGN6sA4XT0rGdGtRRc1pk1?=
 =?us-ascii?Q?VJRXHts3mPgGULGO5CWeB2Eoug/a9IFc65LGuAGZj1kNGaez6ALJ57L9Ru1I?=
 =?us-ascii?Q?M6SjlQCUQQpfft8HAqFKyQdjIqxfpoO2o4bZ12e1G/hLaJ6+qGmWxMKOe5rn?=
 =?us-ascii?Q?/sfehcM5/HL57ZUJqYhhQL8ngHjfgyT5F6tfWh6rTibpXTM1hm98O9aS77sh?=
 =?us-ascii?Q?n0/4al4rlHnxZDJUGFNKbxy1CETuJLi6XFqhJCDNdodL+TCrlkQj6aoQO6+N?=
 =?us-ascii?Q?8guYQJBYBEvroECLzpU5Dwgwp7brFfrJC+yemM6HN9pJ2XwFfRNCMKJwx4ql?=
 =?us-ascii?Q?i/+6iBhfUumQbVkCtD6sPi+jcpoLZnmaNCbkIZPiIuu+0iLdEE6kPF3gC675?=
 =?us-ascii?Q?Xq8v9khwUsfKjYQXjX7/UHfBg/UTsUpvnSKWslQ/oD3/yPfDwd+PgJ+a8A8O?=
 =?us-ascii?Q?ZF88To4Ipj6DHpRoyPy/fv0fjFIGMGPMZq4djE8qU60D4b3mxbDli0ZNKKds?=
 =?us-ascii?Q?Eymhp3fS2VsABuzKiAlSIiM8vAs1MN2qyuocc6sQYDZiRDf5P3Qw9J0M8J6n?=
 =?us-ascii?Q?g4MXQBfiwR8h6PLV4FqUigbCLrwxAoTXDc4PV34ctZFfFVJQpF3de0TNHVgt?=
 =?us-ascii?Q?Pw/rqz1eK3afYh56fljd9Kcu/ix0/xjQ7cBkq372p0XE20SngRvyyVd3sy1T?=
 =?us-ascii?Q?LsjcldPlyWHk6k9p5YkOnw5U9VS66/55u2q3AGoFAinS69T6f9pUEvbIsmnM?=
 =?us-ascii?Q?yRmNq2FxY+7wsd1HVr1F6RJ7aZMED1rKRDIHW9A5Xp1kcpB0Jsdpb9qhhyrp?=
 =?us-ascii?Q?bbpk6KRs+U2jTCOt0nkoO2BN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WzYiDM9nw3BYxA0qZ8Ii0qhJxKnJqUnwc59dJb8DjKkbcy6x9whbexDKoKPh?=
 =?us-ascii?Q?jPzdwtPDBJLmZl+7it3VaPb4FpxaTNeE23HyAagntCGVRh2HuF/16ZIrCft5?=
 =?us-ascii?Q?mv59wqvuLVWFDtZDOp0rx7hafxHy5xhmpQ90jwGB/0qeCQFLI814HGcPCma7?=
 =?us-ascii?Q?GpyKWw8i8EreVASFuRsNeL4GxIJlcOYunfViqigNZI3Pl2vt3AH/L5n7XObv?=
 =?us-ascii?Q?DjTslRY/51ThmEbtpN9gFCHZLSxtvUivlA71COEI7KPB2msHDxRaXdQpKjpf?=
 =?us-ascii?Q?BBcuPMBjDgpndbXp9zSlqLp+yQiyHde+ZiXFxF3DJf7DjKj8V0IHJTsFdFPW?=
 =?us-ascii?Q?Y0d8vTG9WHYrP6hqWHfCxaOw0Y+TAo2sgi0K2IjLtk+6ngs7D4yFdUbz6bOM?=
 =?us-ascii?Q?FdbDra/Zrs9v+mCtynRXYGoij3qbcoaXZ/YSK2qKh+c7/0K5ElmoJyCL7s5I?=
 =?us-ascii?Q?i7rUMoX4gfEzjxKK2M/A1rklxe/bkpM7M0vI/8kR39d8LOiFwT4nIxbFlPkQ?=
 =?us-ascii?Q?wh8aeHZeHsGnH/5LqZ2TPTazaHuJYW1an3YxECvPRlnNv8ncHen+KohsbuFM?=
 =?us-ascii?Q?5DQQZDQbf0EK2YmRqzzMSa5dffpPvndS3XPnh0hLUUJxM5ZTkufTXS3WvQve?=
 =?us-ascii?Q?SE1H4tWsN8JGGlLPDz3DO6Aok3tYghqvAU1Z1podlb4B6ICB1uRFTUcif+xe?=
 =?us-ascii?Q?jzrEvdZMGE1npoUglxC+wThmwBlOs5C/U++C5+ufazHM29Hl91/hFdGlLWLT?=
 =?us-ascii?Q?rkhInLqR4EcKBwAh14ynp5zO/I39ipodknkiRqawN9OPDxFUKIkF+/Wub1Xl?=
 =?us-ascii?Q?+cUey0irB8tSI3wFipljIocG/M782wqRikEc1zfaZ1sJwXPG5unToyHFZ8al?=
 =?us-ascii?Q?z+dLg/xEjWHhWYACZc9HLEGU1V8sgnsHF8Ll4xVVF4a485SFuTWO5bcgROZL?=
 =?us-ascii?Q?NIayTdhR4KYUG0OtspKowldKmcKNN6B3oLZspxFmaGQjyL2WRw8bE+++jIkb?=
 =?us-ascii?Q?uppaJtKt/JMh4YmGjdilLrvqq9f/PhwcUUdDflHt/2Yzwfpm1ZAeAM4uOb9U?=
 =?us-ascii?Q?ROUteBPasG+XnutPIxMkH0uvGQBUAP3b3MWoDLwAzBP1b+bTtU81AhBp3bJs?=
 =?us-ascii?Q?E+pKRdIZD4XrNYypqOnFPQ5yufH6nEX5wQK7wDptbvxuYIt7Z1E/+7YeKXg9?=
 =?us-ascii?Q?6J7n9FI/UHwh8kj0PQZMRVdYgCprv8QHPnjCxliabawsuol+nYF7wS+sY+rc?=
 =?us-ascii?Q?5FWWW3kfF5H4wcvZkXxhiFZa+HHB2fBYxVo0wHhrLFnOeA6qUjUUxXlP+4FW?=
 =?us-ascii?Q?6VjNscq/JNn5vwFBgrpRTU4sQuMpW6r4URJTnxU8n58ErpNUrYz73dAmPjFW?=
 =?us-ascii?Q?76Ic7HfhVZmJRBRFlmX10A/LJm9Xf9h1vxGEuDBskADEgbrII05Lhe5islYs?=
 =?us-ascii?Q?Mg5zIeNbxgmawsKrvdaI3kC2GLt01gFhfnlGKtkNzlbQgJNWiVKm9yoJxQOj?=
 =?us-ascii?Q?yxXQeukNXEaHJAN6h5yoi9aJ3+YvmvIAhqZqdpEA7DxiM8hYFvQcbEQhyQcj?=
 =?us-ascii?Q?T359WjIkRXkwKU+dfVB753dA7cL/BT+mMMoMWlM4BeYAMSPueJZCDzhYiaOD?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f74050c7-669e-41bf-60af-08dcf96a4749
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:10:03.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77q0kwDJplG1KvXKKbfH5vDHF7Xtvkq1TCyZTr2W7DV18d5HQB8EbjdHtzrLjDG9EHRx10E4E0yX6tnvUcGPow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
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

On Wed, Oct 30, 2024 at 11:23:40PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 29, 2024 at 02:55:11PM +0000, Matthew Brost wrote:
> > On Tue, Oct 29, 2024 at 09:30:50AM -0400, Rodrigo Vivi wrote:
> > > On Mon, Oct 28, 2024 at 05:32:22PM -0700, Matthew Brost wrote:
> > > > Not all BOs need to restored on resume / d3cold exit, add
> > > > XE_BO_FLAG_PINNED_WONTNEED which skips restoring of BOs rather just
> > > > allocates VRAM for the BO. This should slighly speedup resume / d3cold
> > > > exit flows.
> > > >
> > > > Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as WONTNEED.
> > > 
> > > What about s/WONTNEED/NORESTORE ?
> 
> since you are renaming, can you quantify "This should slighly speedup
> resume"?
> 
> I think you can just trace xe_bo_evict_pinned and xe_bo_restore_pinned
> and see how much it improves...
> 

Sure. Probably will drop patch 1, 3 for now though as 2 fixes an issue
in our downstream driver. I've distracted myself with other work but
when I revive 1, 3 agree it would be to quantify the actual improvement
here.

Matt

> Lucas De Marchi
