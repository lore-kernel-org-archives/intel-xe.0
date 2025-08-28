Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3378DCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C010E07B;
	Thu, 28 Aug 2025 21:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQa+Jydj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE610E07B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756417426; x=1787953426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EWveLPF9XzE5NltSKYqp/oWHodEnGwAb5AXc5IvCQA0=;
 b=GQa+JydjRwNDYZp/Q9+suV5kYnMpvSCguuS/bGk/I3RM9oa/mbei3CxU
 sYYtV2HpkOUOAAq1qyyIUndZ0QK0L7OjVn7fmvhH5a5+oufYP2U/kpSeC
 0d+mc2CrxaBtS90mF3KRiJd+x5IGbBzanyztgd5QuZ4zMdh85/q7PolJx
 waC5gy/cy7Ni9ilDU0s2ZFjXQdldPNiJdRfdjoTfHCGg6nkk+3KR1zqMx
 fbYIm/DHELOi4Jrz+tWbeg8zGqWx1acD4+cUvs/KkkwDgzZiWzqKCQE2q
 id8yPYfRbYLR7eb2Jno9JV23KJG6XBgcWHvpJgKuOYz284hw3g2RZC7mg g==;
X-CSE-ConnectionGUID: 6vS1HfR3SIaINQyoYiMqCg==
X-CSE-MsgGUID: cU+afwMZSsG6B2UuM1gkmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58847125"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58847125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:43:46 -0700
X-CSE-ConnectionGUID: QtY8UQktQry0qQui7W1P8g==
X-CSE-MsgGUID: xgXGLePFQmWnTS67ysM8rQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:43:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:43:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:43:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeFMYefhboxvS3oBPiEoemvkRTBavAPXc3QFlDWEgDY86DYi7D8srZmzGyJ9PHDLZ6LEHTLkjV1hREO4rtbXg31U4J4LLvJZ8SBz2nI25YhTFiltXcxnENM1t+fScpMi6pYVbc1xVEVrUM8brZ+FkLt73Eh0iTsvNvnaU2hjL5Hquv7VO8qUhLqzgrx8xxCH3TRuOyjXDehbX++HVfL4wTvWuqmvqNlSPGDf8DkUXHcV6LQE3k04TXSFHEpdVF3AKMUyaFbtDkraq408pWva1Qifg5FmX/QKFHbXm95vtBGQyTCpJvPe9Bih0DM1TmCRvJkqT3LLCbptUFnSPbPRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pef0tVjTByqsUT4v+IUrTsS+Gbofp9zOW7FIkoubZ1U=;
 b=M/bkiLx3WPzyQwiB9ggxeS5lTaNlU1w5jLrPOo+D367sCPw2Zac/9LpEhKcBfjlmsWWUnJQfZDmxMItQiufMQX1BwrbMOPldrm9T5M/wJ7sVVHlYSMTCC0IoLFjD3Nh+tj72qEkO8a1Nc08H7/4YzpWPt0h9YLC8YBBFY9C6c6Z0HtWVulpt6VjeP2oXz0lVUfDdKRyayehIZeCylH2cJ/qzN3uegALhZEpr0uAzG4SzAQLdaW+HU47M756W5lcQoq7b2M6ZDc0SQvRHvoBqx/FOUTgaWargOViZTFe6U+ApyKlkI3MkFoyZ2DTxjfmNJlyD9v/dCCiZgDekWnb4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 21:43:37 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 21:43:37 +0000
Date: Thu, 28 Aug 2025 14:43:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Add devm release action to safely tear
 down CT
Message-ID: <aLDNhqSV3zfgSn3g@lstrano-desk.jf.intel.com>
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
 <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
 <aLC0oPvt1ZqgEVat@lstrano-desk.jf.intel.com>
 <a19ec502-266d-48cf-af9e-c89070799a20@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a19ec502-266d-48cf-af9e-c89070799a20@intel.com>
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8751ba22-9254-4dd8-a325-08dde67bf1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ymbTnbN8RjuiH+PjSTD+bxjZIbwd0VinApU9ezXAGdwaxhey98c+2ZCUKT1V?=
 =?us-ascii?Q?nJYxXRLvnpbJbL0oneekws0J/3w2Rn6WLpq/Z5VIsjRb9ie8Eg5EgvEvFD5L?=
 =?us-ascii?Q?hNWq/Bxn1RetO04vuES4yApMAhL2pOvvTbQAY9dzUb8eJWMq4lq8o2pa95Uc?=
 =?us-ascii?Q?7Lo/UErJOIIInC0STxDmdVimIpAHnKoJWOF/rpiTve5HNHzhH+hKfeu6gfqN?=
 =?us-ascii?Q?41fZ1IZj/KLVhADQk9WTw+1sGbOX49Rswip7/ai4lqrP7mraRuIErsm9m31w?=
 =?us-ascii?Q?JRKwEDdM3eupzItitQ7ZuuejKgPY5HL6drwJH2B1JRs1BIciFVlXaKSBBfVJ?=
 =?us-ascii?Q?rlt0dr0sqZ7qHeYkfLHVFTT6rOdKY/QuCTDizWdiJlX+RgzgqVisJG3gcwFo?=
 =?us-ascii?Q?Cys7et0caqYUDiJPU94c0tAu/lK0QZvBlnZmh/rK7ancbsQeI1QfCT9C1AHB?=
 =?us-ascii?Q?Jgf6AYnF6cgABB6eDhQ3/oEuqNjfpvQJ1fAXZgpH3+3zaFxVQ/3d8FK7mC1b?=
 =?us-ascii?Q?z+BE5JJ48/fXbnXKbTbAywM6VWEY+Dp/t6nTRCytuTwbXPvl7i4IeHP7Id9w?=
 =?us-ascii?Q?VbmAsHvHQrqreC1EfmSAbt/GRauLmsD4ZPmwRojMgLkhnaonbFVRoYTCbE4z?=
 =?us-ascii?Q?zKpQT6fJgbLYaCxWcWj+xTfVL6EXBE6dnL3me+SLF8YibXmq9k3Ics7HGf9Y?=
 =?us-ascii?Q?tzXzkjyoAuA33ZyOfeVF2K7h8jffuY9m+eh5PesaeG+exHFs5seSN28nrZ9g?=
 =?us-ascii?Q?BX5IH+Bqdr9+UjgFKSGYysiTIoq6P5VmsuwXJSWLimSinHf+qA05EEOVmhxz?=
 =?us-ascii?Q?A38n2Ef7TeUiSFEzES/MpTN6sMIJ41M+wshaJWbXbhzqGII11VUaaDJZbN/a?=
 =?us-ascii?Q?NEQpaagMO8jV8ntG/oQ6CjcDByxtMuJqEd5QYOy6FxLRAzE2OH93gmB/y99o?=
 =?us-ascii?Q?/1c1uQe+v2Cqz3WbdpvmgTgr4xxBxXCRxozJihm1WdKSgYtzmkwiitfNSZNA?=
 =?us-ascii?Q?LPYt03WRvj2BdlyH9BT38kpLxIP9eLoMT/jQWqjqVZfweQt/tQ/LnTNM+OSQ?=
 =?us-ascii?Q?QsEZY8x5Je07Ox71CqGKuIxRkr5qNlKSk57n/WlUtjTc13svUwrsnFjOkksM?=
 =?us-ascii?Q?OHIGFqUjM0zV5U40eJ6rOyyhG8Fwxph6/z6zuGZKrzDSXelqXx+5EhI1ME2B?=
 =?us-ascii?Q?GopjzkVd/zJEGstas/kEBvvjXsiscNTw7rxHyuXVRaBX9kXKBnOUZqx0amki?=
 =?us-ascii?Q?U5ahEN+EcqxidbHt4yNTovcxikyUoFc7FkbygmBfhs57Y2Fc65aE9gfW6eu9?=
 =?us-ascii?Q?UXuM5LMseVzG002+BZS4WsObXi1hR81tiy6CMgZ7lewOSB4xNyAaYeOLI+UN?=
 =?us-ascii?Q?ARUOjDDqmUYqNxkFmRiy8XQcO1QX++vdnTL2u6nT7RGi7ljzOeZAroMbKtVP?=
 =?us-ascii?Q?QpPaOWLqT+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NbNN9ry1tF0ueaGWlWy2/YtaZzrib9TcziYjZGCaxQ7Q4bCEOYOoDQ0sl6yY?=
 =?us-ascii?Q?BDe9v+8Xt2o63iIYhIHlCIQBWl1h+7JFGNAe03Uyy2+ZxFVssjWWixFZUA5E?=
 =?us-ascii?Q?tuSYW7jD6LJRe+NjL1CNFQdf2LeBzbm0rddQjSOciyD/sWootAQtCeZr97Gr?=
 =?us-ascii?Q?pVlmHwMuCkJVfCVgODMSpFyU2us+XJmthPvsSJKxUZ51ZWnQUoqNH/kvmcWD?=
 =?us-ascii?Q?KKz0WDYcKW2vxWzHdhjN4YdH4sNjGGF97EUnTc+X2QnZlJ9OpkNU/Hwuq13W?=
 =?us-ascii?Q?m8tMwn8mynqgnKFbu0d2NPKEUokHFBWCYCjkIbH9kxTR64WhXeuvBt2M76cl?=
 =?us-ascii?Q?5zm6vMJOq9SguPvc0y/ZLA16Daws9TTjIZdjAtFHpRl86cvRd5+qaDPKsuk1?=
 =?us-ascii?Q?DkjCxCglnYX9K64B1crxXfuFdP6HjTY0dpwZpNA8/3UW6+2ZMwwlKmwZsjdm?=
 =?us-ascii?Q?I3rZbhzJmHTdony9WBYoJXt5pBXfBbywAanrYH0IQQzAU99I064stAZlOgJt?=
 =?us-ascii?Q?zQAICMSoIO25oA8kZWJnMufcTfblCD4WW2EI0GBNqfiH5YZegUjpoTT+57QS?=
 =?us-ascii?Q?kJFO2Q4RrC05mLfyItnCPAMzspISKXHQ1Wbn09fHAocWSBBhCwGdKUJBcvPJ?=
 =?us-ascii?Q?I0UAGresX5pG/n4cy2Xu29Me0JDYTLQeN2lTl/uF4aAv7LLybBkun/qNVVs6?=
 =?us-ascii?Q?diMET+VO4ICQ2udUhGrm/tUp3qCY88llaMCLTR/UvxckqSLWKqx3NDgHGelX?=
 =?us-ascii?Q?GyH3zOO9S7BFvoykKiLTrcEw3fJ9FJYmhn1nOsVPBu4IsY9V9EZthwhNe1oa?=
 =?us-ascii?Q?tkfwvGWM+NfFFlcuNFBAzs5Y3CUZN1oEfz0ZiJrYXhyULAL9SNJkl3qyXUQW?=
 =?us-ascii?Q?7jWKbqnI+woqvW35QSMlsYGIAZ7KGa7Eqo1jzZm2Zwfh0oq/SE+cpmlbWYQY?=
 =?us-ascii?Q?J7piSSn3eLUTsthptbrR9VXHawQGmFsIzeOpNQ9hDShC0M9ek564sZH+9PpS?=
 =?us-ascii?Q?IXFiJhjtlCGEPjnU4ajfTLWnW9jbAGcsLfVrfR8NBh+BnfN3hDqri+2HlZZR?=
 =?us-ascii?Q?9wa6UNVrWC6yOXEyQDWSTqVodE8cvPp9iE0EWObNPEAVeV9jgYL8w5HkAGeX?=
 =?us-ascii?Q?1j0tN3sVqSNBEeVmbpXq8fVWOEJPl6U+HIbg2VrAQlPRzmE7wIghM3Qb0edb?=
 =?us-ascii?Q?jhkoCQ0Blfjq/QzM+JTxcKcvmiG8bV46WCLxRD1h44A780doPqhaa3Ox9GnR?=
 =?us-ascii?Q?zvGFgeZSBDwOaQaAnLDyL20sbN1JaERWTslwOAEm53E15kD24zFuKzShAgka?=
 =?us-ascii?Q?VOjo4qnTs6w/sdqsYuEerXUf64WryFXSJDG8kz+k/JoxSp82NsdeyqV9YQvv?=
 =?us-ascii?Q?rmA4K5DZp3Hwa3DOemLffpUW1a0r38wkHOfljGmPswcp9gnmp0czyV+L2Aj+?=
 =?us-ascii?Q?IN6f1ENbpZLOYjTF2PE+fBKJwO53z+UIoa/7KehbBmb5vATn2Ely/1MjE+dN?=
 =?us-ascii?Q?h8PnL7umujeP6AVvSMta1Dof70uOWhaA5Esww0mMmJETtsyeevqhVkUui2hA?=
 =?us-ascii?Q?sdo4SJyQu+T3P+d7mwoe77uHvt1J31iXybRu1HgfegL5DVZKmAMwiw+DdwbF?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8751ba22-9254-4dd8-a325-08dde67bf1e6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:43:37.2715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zLfLqALZKFo+SSuovfEzF4f3NUfKQptaewd3Cc22o+/h2+0b8ZPaUe+LFtNu+VduDE/Ud7jPLbWD1sVBEVWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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

On Thu, Aug 28, 2025 at 11:19:13PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/28/2025 9:57 PM, Matthew Brost wrote:
> > On Thu, Aug 28, 2025 at 07:21:02PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 8/28/2025 12:44 PM, Satyanarayana K V P wrote:
> >>> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> >>> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> >>> while releasing the BO. However a premature release of the CTB BO can lead
> >>> to system crashes, as observed in:
> >>>
> >>> Oops: Oops: 0000 [#1] SMP NOPTI
> >>> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> >>> Call Trace:
> >>>  guc_ct_send_locked+0x8b/0x670 [xe]
> >>>  xe_guc_ct_send_locked+0x19/0x60 [xe]
> >>>  send_tlb_invalidation+0xb4/0x460 [xe]
> >>>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
> >>>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
> >>>  ggtt_node_remove+0x110/0x140 [xe]
> >>>  xe_ggtt_node_remove+0x40/0xa0 [xe]
> >>>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> >>>
> >>> Introduce a devm-managed release action during xe_guc_ct_init() and
> >>> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
> >>> resource deallocation, preventing the use-after-free scenario.
> >>>
> >>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>> Cc: Matthew Auld <matthew.auld@intel.com>
> >>> Cc: Summers Stuart <stuart.summers@intel.com>
> >>>
> >>> ---
> >>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)
> >>>
> >>> V2 -> V3:
> >>> - Fixed review comments (Michal).
> >>>
> >>> V1 -> V2:
> >>> - Fixed review comments (Michal & Matt B).
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
> >>>  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
> >>>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
> >>>  3 files changed, 46 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >>> index 37d06c51180c..ed0da4ebd928 100644
> >>> --- a/drivers/gpu/drm/xe/xe_guc.c
> >>> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >>> @@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> >>>  		return ret;
> >>>  
> >>>  	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> >>
> >> btw, IMO this should be moved (in separate patch) to existing function:
> >>
> >> 	xe_guc_ads_init_post_hwconfig()
> >>
> >>> -	if (ret)
> >>> -		return ret;
> >>> -
> >>> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> >>> -	if (ret)
> >>> -		return ret;
> >>>  
> >>> -	return 0;
> >>> +	return ret;
> >>
> >> maybe just drop the chunk with reinit(ct.bo) without reformatting rest of the code
> >>
> >>
> >>>  }
> >>>  
> >>>  static int vf_guc_init_noalloc(struct xe_guc *guc)
> >>> @@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >>>  	if (ret)
> >>>  		return ret;
> >>>  
> >>> +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>>  	guc_init_params_post_hwconfig(guc);
> >>>  
> >>>  	ret = xe_guc_submit_init(guc, ~0);
> >>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >>> index 848065a25c44..0b88cfb05e7b 100644
> >>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >>> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
> >>>  static void g2h_worker_func(struct work_struct *w);
> >>>  static void safe_mode_worker_func(struct work_struct *w);
> >>>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> >>> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> >>> +				enum xe_guc_ct_state state);
> >>>  
> >>>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >>>  enum {
> >>> @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >>>  }
> >>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
> >>>  
> >>> +static void guc_action_disable_ct(void *arg)
> >>> +{
> >>> +	struct xe_guc_ct *ct = arg;
> >>> +
> >>> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> >>> +}
> >>> +
> >>>  int xe_guc_ct_init(struct xe_guc_ct *ct)
> >>>  {
> >>>  	struct xe_device *xe = ct_to_xe(ct);
> >>> @@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >>>  		return PTR_ERR(bo);
> >>>  
> >>>  	ct->bo = bo;
> >>> -	return 0;
> >>> +
> >>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> >>>  }
> >>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
> >>>  
> >>> +/**
> >>> + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
> >>> + * @ct: the &xe_guc_ct.
> >>
> >> remove trailing dot
> >>
> >>> + *
> >>> + * Allocate a new BO in VRAM and free the previous BO that was allocated
> >>> + * in system memory (SMEM).
> >>
> >> make a note that this BO reinit is only for DGFX
> >>
> >>> + *
> >>> + * Return: 0 on success, or a negative errno on failure.
> >>> + */
> >>> +
> >>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> >>> +{
> >>> +	struct xe_device *xe = ct_to_xe(ct);
> >>> +	struct xe_gt *gt = ct_to_gt(ct);
> >>> +	struct xe_tile *tile = gt_to_tile(gt);
> >>> +	int ret;
> >>> +
> >>> +	if (!IS_DGFX(xe))
> >>> +		return 0;
> >>
> >> hmm, I'm wondering if this is good that we will have two different
> >> unwind points where we will disable CT (one for DGFX other for !DGFX)
> >>
> >> maybe we should just reinit(bo) for DGFX but replace disable_action
> >> unconditionally ?
> >>
> > 
> > You will guc_action_disable_ct regardless if this DGFX or not.
> 
> yes, there will be action registered
> 
> but will be called completely at different time and this may
> (or may not) actually has side effect on other unwind actions
> that we registered between ct_init() and ct_init_posthwc()
> 
> as a reviewer I feel responsible to ask questions if something
> looks suspicious - if author (or someone else) is confident that
> there are no issues, we just move on without next rev
> 
> so here, if you are ok to accept that dualism - let it be
> 

I think the point is you want a both a early and a late action to take
CT (and thus TLB invalidations) at different points. The early one is
protect against the BO disappearing on you, the late one is to take down
the CT immediatley on driver unload. The latter actually probably should
be DRMM now that I'm thinking about this.

> > 
> > Can we really not nit pick this too much, rev1 worked, albiet the
> 
> I know as I suggested that change - we just workout the implementation
> 
> > layering being slightly incorrect. This is a clear issue and I hit from
> > time, customers can potentially hit, it would be nice to agree
> > upon something soon.
> 
> this should be the last round ;)

Hopefully.

Matt

> 
> > 
> > Matt
> > 
> >>> +
> >>> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> >>
> >> hmm, maybe we should assert that CT is still/already disabled when
> >> we do this re-initialization? near the start of the function
> >>
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> >>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> >>> +}
> >>> +
> >>>  #define desc_read(xe_, guc_ctb__, field_)			\
> >>>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
> >>>  			struct guc_ct_buffer_desc, field_)
> >>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> >>> index 18d4225e6502..16d82c0e6cde 100644
> >>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> >>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> >>> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >>>  
> >>>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
> >>>  
> >>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >>
> >> put it closer to the existing ct_init() declaration
> >>
> >>> +
> >>>  #endif
> >>
> 
