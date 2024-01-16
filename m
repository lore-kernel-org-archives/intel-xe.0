Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62976C4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 08:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48DF10E448;
	Tue, 16 Jan 2024 08:46:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89C510E448
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705394783; x=1736930783;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MSJXyiqYnAVhby1E4Sl5bosxcHi/bcZcvkuVITrha+g=;
 b=k4TlceJRwhR4vs/ZPi5Sg6mQe63Q1+rUHpSyqhIn1b+T8/3j6my7VIE3
 ido4I+UOCXTvcgOC0D6K7HMkwEv0z4Q8v7QRHWEqnvQL136dN8GlNvmA0
 W9YDzKqCRYM4kyI7s4OXNAg92Sz2OE3Sg8l04K2HFJP13vvwQLpBfpOiM
 UOfTc5onrCBdFQT/aCh3r+GeOSk7bCesdoJ5y1noOg/9PfhfNYBkaJ/oY
 SWPkt0mv7zLD84dsTqAgijIe+jIoGtRqhQK6Nq4fkf5yQwRxzRlxCFUkP
 vMI/nkwydtcUZ6j3F/medu0PZDSklRRDp5BGHPHhTodF4Yq/7tNBtICQB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="430960083"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="430960083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 00:46:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="818091073"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="818091073"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 00:46:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 00:46:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 00:46:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 00:46:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 00:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEChQ/x+dsCLTTO1JGXm5kSoiKk1snTf9UsMYVVOJdvCGdungbK5hqsxlEbtjCjsFsj4MnWMeZE9ol4I2FMfm8wT9ccNx57N043H2nCZxih6UUYzkVU2x3d9dzjfKQYERWi0UakzZFHocUOiQZqtoXeX/u9e0NJRged/D2iZgSgRapBu3Ttis9Ukw0WdKXKptVqgGuvgALFPriKIIQWX4pdMay6lMqNYZrKkHp7PYISvThcKzlXzCn2nuULdD+mYQkAzL8bos+6fLAtBKvv8qTJnuIFv2RM16ZyVvajIsxpHHdItBRip7NEOQqJg7XMkRjjKP0Q5PzQs1XXBDx0Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CX+pwm+2K1qAMmiZHRUAb1fkXVeqp08BdubLLRPz3s=;
 b=dCwVX59WaTRU03/74vHkxfXxOZu1f0VdZ6liNkTDfl2ja/G+omh6Z85nVFYj0BPPoMxt157Bv4ZoMRTuu9xxRW3/bLaVEPjexUVRVg/sNoTAwQS3md7Y6KiDredCK2QSvyr0IFnlpSL0gGbEAmDkkljGiRZEXOoEH0BKXVUIhJlCvexXnE2d8s0scpNFTDO4qJlksIulL1MiH7uZ6Tiowy2nQSUwVHzICKOPgn+3Oh5ki9bPF0Qa6sOcunGSiNs/rta9fCHQ4oRYKRMoy7nS1li0ubG4tqcbLohzqlq9s/mQKFBnUPgCZeTPXQuoNcvsVSAz1l8wg+yNMiR7A+GOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 08:46:15 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 08:46:15 +0000
Date: Tue, 16 Jan 2024 09:46:07 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove obsolete async_ops from struct xe_vm
Message-ID: <ZaZCT9oq11_jIgWz@fdugast-desk.home>
References: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240115160113.2286972-1-mika.kuoppala@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0303.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee8d36a-7d1a-49f7-6cca-08dc166f997f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFRJMKFacSJd+4eeawn+XhZVVZtO2lGEVRhVHPV5nSSI7bpQxHp2MBUmWjPxDJpk+isw4wfOdyiWnjwd8s1nymN57skff03m3k+x9Zc8Ya4em7eGGaMBCEoJBOmBa3+qlr1A7W1vSDfYyYkJXWHXA1n2cH0CDmD6YnfC6sWHOlilpMzhu21NUruuPABCcUJ3100yaHDsDFmNo0XjlN/wN6V8NF+uu1W4w5OcSfKuGyTTlIjEtVgFnuhZuNSHBZ0aQ9ZDN6nM/+pG3c/Z9cswYG5paLl6yoevpF0364W6j8XqTfCPnxrdAyxKg9vlYVmw2JKe4Y3MU3kQ2r8su/S6FvsofZmjq4TalZHlNr5S0rTYqvO48O02uqkZC0u8wJ3TCCgWVGXR2oyr2EegIDIudmxue64DAuJo+TSl3u/24irYBPmZhIvNe0CW6HfhrSF9U2PZy1AD+sbrJL6C2UTXD02bP/xqyaOwu7hTUd4Ey9GVY3JaxdWmnvBsUyw/owKcCqpr5s9vOeWXPrrb6Bt/JHiF748kQHF/6xiFnYek8+pvsOrVXyF1SJQAFC/I/1e+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(6666004)(6506007)(6512007)(9686003)(36916002)(83380400001)(5660300002)(2906002)(44832011)(41300700001)(6486002)(66556008)(8676002)(4326008)(8936002)(66476007)(66946007)(478600001)(6916009)(316002)(82960400001)(86362001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8lDlA/pzJbUnVy6EUqtLW62kuo3AheWRxW/mqEI34ZDJE9GkBILIf2nm/vTg?=
 =?us-ascii?Q?7P2W2MNTJqq7NDhfCk/MDVwMYgfZhLARfbyltkaBIjtnok3z0mxSts5Ef/0P?=
 =?us-ascii?Q?KH79TIIlw8kp5hevkjttpbSO/ojl83M+Wf+KiDzJA3+nW5ZyZo3fZe6kpG9Q?=
 =?us-ascii?Q?QSUEsMuzrFm2DePxkX7+uJ1Lbje1F/KkGGCYm3uMrV6pJy64YE1JFHjGmBnU?=
 =?us-ascii?Q?DsLJ6ONJaQEjYmw6/NicRkDQAOXSUHXUwORmuK7R1vWhWUZTBjFXiT6KtpR1?=
 =?us-ascii?Q?pMqAFLvW2ExfykO9tp3W+wCAEu8nJsjV+NMECTFmxo1qimAtncro/DQ+0P0t?=
 =?us-ascii?Q?zxTAZQBOdg7lYhgMqIGEgUxYEc/jvE7legf7uC/v93bQyRXr4lwYSC/6icSy?=
 =?us-ascii?Q?azoB7/Btt3huIHbFw//TESPrHRRl8VPJUJPMDWdhG8CkAL3k3BFOQekyFP+7?=
 =?us-ascii?Q?gUPAtMfTSHvP7yyU5ta9v6xaRYGZqH14Mwlc+MuwyygsDbUJsFa+uIdyTLeB?=
 =?us-ascii?Q?5XtBFxpcKssbUxoNMPOSbDTFFc5PTI3VHiTyxrGdAEZZmLxLcN1t/N47w4nm?=
 =?us-ascii?Q?IY0EP726+nQDBvYJJy/eC8SJEGvSE9zVd7FJ+jAGrzzONlymNxWqRA/0pR6l?=
 =?us-ascii?Q?dcMls8YE57IzSL1i4mAaO3Bq1wagDVg6p76hzimrvskjsd+/cQYzPlBn/oce?=
 =?us-ascii?Q?jpAAxQcsqm75A23vt7sYLVQoXZDAi2bQzWc+DjchlcEdodHgk1rB3c33emEa?=
 =?us-ascii?Q?ZxYPWm03jDPhgh+5qEaPJcg31qQHm0CmwXGhleC1MFCAh4OhtJMN6Xwf0nCc?=
 =?us-ascii?Q?m9xAmqFuU6ilUuqqs5NeYXPqCuXtFp97c99PYbmSuifZP78o5a9Rrll7+61c?=
 =?us-ascii?Q?EyoKoJN5Up1fp6OpdzLlTp+EPjVjomK3Lljqpo5iIS0Vy8sgOI+9CEKKeOep?=
 =?us-ascii?Q?2Ra+i+4myTErhTApOBUirIFhnuSgiVz4uhTnuGmfdJCofb/A0WIIWcwMk5Lc?=
 =?us-ascii?Q?ofptDI9/vOOoKOT9X4VBRpxfBsq0wtptc0zYckjKSEI5iN25b9BbXYicUUB7?=
 =?us-ascii?Q?5E3Cfw8L5ALWFopWLG9hrHByTQrmqaiArXf0RqZ58EdUoo6weA+t9s9wWOub?=
 =?us-ascii?Q?sZ0rQctbxuvQLJZqCDKl+OMUpGgdH1wfHla76UFj26ZtAkWo6inr8qY4iLgK?=
 =?us-ascii?Q?1MTw05v0USt/jlHeZ1iviMORbap2G89XAjSjCcrofop69hGQ3VIbwDVT3TK3?=
 =?us-ascii?Q?CDL5x/PuevmzpbjNaA7lkGlrt3FzH7PZznBSzRxCpcmpgk7V+RSZNG5W7MHA?=
 =?us-ascii?Q?XXHrj07SBA8UkwRqJRTlEMK2IO0abXYZzT4iP5SGDHQVHKGwcVUzi4hhv9LX?=
 =?us-ascii?Q?u0XLTl1SlCsi5hQAp8ylrRq4WPHssCxFJBHktkWwICkrqdTIyFLw9AUJ6PMi?=
 =?us-ascii?Q?bgJUGetB15mdMk0Q5ONeMMc1zWLNjKgNnJaN2C7UlkZabypmTHBtsyoKIvtr?=
 =?us-ascii?Q?+yCEr1akNbrvLHPh7OZRfJ1w1odtePrTgwj2ceRayybuvYLbzBJrAAn1fYW4?=
 =?us-ascii?Q?XogrgaP7Yfxg+RWhcTxGx8xOa8gk2HwH1PKJ4E6PczUtnjwLmWfZLLMv+nT+?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee8d36a-7d1a-49f7-6cca-08dc166f997f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 08:46:15.2914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrFUqPhzrDZlYsLkoGmugtHflRdT4mID7nJdhTRQt7/EUQoHj+0kpL2As32nHAczEk2siACzNBXXjJPmrM+SHTcb9ENyJcO7yztfDfe4zbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Mika,

On Mon, Jan 15, 2024 at 06:01:13PM +0200, Mika Kuoppala wrote:
> Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> made async_ops in struct xe_vm obsolete but forgot to remove it.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

It seems a reference to this commit should be added in your commit
message as "Fixes: ". With this:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 63e8a50b88e9..b0357fa282b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -180,30 +180,6 @@ struct xe_vm {
>  	 */
>  	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
>  
> -	/** @async_ops: async VM operations (bind / unbinds) */
> -	struct {
> -		/** @list: list of pending async VM ops */
> -		struct list_head pending;
> -		/** @work: worker to execute async VM ops */
> -		struct work_struct work;
> -		/** @lock: protects list of pending async VM ops and fences */
> -		spinlock_t lock;
> -		/** @fence: fence state */
> -		struct {
> -			/** @context: context of async fence */
> -			u64 context;
> -			/** @seqno: seqno of async fence */
> -			u32 seqno;
> -		} fence;
> -		/** @error: error state for async VM ops */
> -		int error;
> -		/**
> -		 * @munmap_rebind_inflight: an munmap style VM bind is in the
> -		 * middle of a set of ops which requires a rebind at the end.
> -		 */
> -		bool munmap_rebind_inflight;
> -	} async_ops;
> -
>  	const struct xe_pt_ops *pt_ops;
>  
>  	/** @userptr: user pointer state */
> -- 
> 2.34.1
> 
