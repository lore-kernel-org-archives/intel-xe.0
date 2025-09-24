Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94ACCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15910E7E3;
	Wed, 24 Sep 2025 20:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMPBT361";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1DE10E7CE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744620; x=1790280620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/JWJFOCsLQf8bZf36mgqbMpGKDQ+WLMq9xeCjxt0NMg=;
 b=MMPBT361wHby5SnAF1jYd+JUkUZKqq+Ro2z3s1/RlYqjhdGSibNjCnFr
 i6a7eMMvHXwmwien8Krn5vksU1ugIEW6lBAXQeubJEa0MH9jYzdTnGVgE
 Dm5u9e5BCD/u8fbcTzLODxt4EGYZQ4Ch9twvRTEgE/r6X+hxemo1POCi8
 0sZF16JeXAYSf3yUh6mBr5BmeeCWl+SRbyNI5F3osDcpfa2ks4ZBtDQha
 eZ98UImJ6NZ0o8pUO8D30PLu/rFzmseT14cCmapWpTdJH9ImOmXwBgdNu
 i/mYqAkenTnwE1saH0WGcSGvaRAxXsNrOXX349SsmG9RvFzxXqDhooDCN Q==;
X-CSE-ConnectionGUID: RYYEzvAQRmuuyrK40Y0A7g==
X-CSE-MsgGUID: Kbow98uISvK9k3O2h96dEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71673219"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="71673219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:10:20 -0700
X-CSE-ConnectionGUID: FGd8gx9TRc6Ca3khhS+2/A==
X-CSE-MsgGUID: Bmtv9WuWRmaQiV68GNl7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176728445"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:10:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:10:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:10:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKlKUWUw9ch1ufg0+jHlwW+fTvQT/2/K2iYcZrOWALlTk+h/FNHmqb+Z4rnnhH/lz22XUGKjYmWfPfMRGzn6cDQoz2JtlujWc34bYswMOcJNDU/ifODQM+GCEY5lFL5V8yJabVvp4CxzGVfCkUyMtxPj+rpF/XEF0FCgnTxrAyyqDkbMryKXaS7d90eF6V/ymVocm7OCCYqI+0koKEhAB57GOs7B9SBf6vcCArYrPx7J6+xXerhw372BpZeezhoEe1mhZTRYKuQvrPiHUAvzz0A+HIICEsm+PbBOtl6UX1kWoiWG0iuzI0e5OeX4MqIJwLFJvw2GQtjdX/xngb4DQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8b1rO8AiYYwwRW3zs1A7rKtPDZRHAiPFDcjizmJ1EvE=;
 b=yudNhCeo+xRPL9yNW1UN5J7clhcwtRqV1w6NSQWDCjsi01lsnl7ez1B1wvToetik+bDGhxcNjd4n5/u20wJlxNi+IsTB/LlSbnrKBB5uhzqZAaznYnB58FdoFFfhjQi291uR1GC6N2SpA3qs1XHLfeCL2s4wDlPIoqTL63Gn7HSOjsUqWJRSwvOMLeXr2t/HCr+3YG1SpJHXKBtU8vo0kNbfD0WIRgfVQFTiN/I2VXg/XNw1d2irWiFmcWTbWXzyyp7RHZm+4Ia/xj6k2qreawPRMeyBB0daCYZT71JZX6TZZ689iLfMdp4gODe9D9Qdsv2fJhF0KEhgbS+gZl7avQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Wed, 24 Sep
 2025 20:10:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:10:08 +0000
Date: Wed, 24 Sep 2025 13:10:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
Message-ID: <aNRQHoP5mCzn44mV@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-25-matthew.brost@intel.com>
 <768e2497-cad8-4b90-9c95-969071f35236@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <768e2497-cad8-4b90-9c95-969071f35236@intel.com>
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: bbabb032-849b-401d-46b7-08ddfba65c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qhwly3KxzSQUJQNru0P+lbX1kssn3CqRGlyxrmJfzPVhLdSY1xocGnMvtsvL?=
 =?us-ascii?Q?2m0ZFhvIkvj5USg9rkxEvqF6HeFnt2uX+xP4n/J3SPbZWNXpgCHdDQoLzi2W?=
 =?us-ascii?Q?CRH61iHQb4+BGUROIJPCA+boqM2XiyAkxHEdGp2yIzxo3LO10g9bGrJYH0O6?=
 =?us-ascii?Q?EdmVl3EO4Iy3BCxcMMyhoJwhMVxSSsgObdkmCRIVyKMz3rWWPvC6oRPheF/+?=
 =?us-ascii?Q?IvL7CjF/lEZBCHK+nlW1N4xtp6kntU9lC1lL+2cabRuZdVog/lWoS/asKBaj?=
 =?us-ascii?Q?EA0QlqB7W6RVUZHeyjQM/U61/UuAe0z8hVB9aYHMlSXAY6Y+Ri9sc0DR4rpH?=
 =?us-ascii?Q?lRpKhWMK1HJigPTZs65LG2heM3vt3LHnsnHFeA0c1jGLLtL4nS2zqeCCPbw+?=
 =?us-ascii?Q?DA/e7vWjG+VZHZ2l1EHxp5rD0dYQ0Vj65rcqbJVqrXRGbm6bB4o/L4QSV95v?=
 =?us-ascii?Q?mD3LgGeb9kDWj+BB6cZgpnObU4bbSHWqrKZv8sCVqxeDejqxBRhq9nD6mA6q?=
 =?us-ascii?Q?ZOUnkhaAE9R0oPOMIDianrL8BR1ioJ7btoAO8CXoZ4ICCmOFFjQksOArNMCt?=
 =?us-ascii?Q?gHZMFLLUTBb94gthE5VO0+3a4Fv/Thd/D53FsT0eZviZGq047sBsbabgGgyM?=
 =?us-ascii?Q?PrSFhdHqC1MR5rCfTBrfMiw9LWGG/sPg29HIheBLvU+izY5jFmRmgv7QjUzc?=
 =?us-ascii?Q?+8UHsmrdYIq207Nd3sSQai/6OdoykuOCMqDB4pxQ1t7fn5Z/+H8UnEBTWukg?=
 =?us-ascii?Q?OIzww6M+fDA0l9qmoBv6VgJ9GN6if8R9yFbslm/4jxAcXWCo/tMHDVPy5mxo?=
 =?us-ascii?Q?yEnsdlFu5Zz9YKqWKt+refncJzycUXawjDDm/OdZxZRWI9iVyBRhrgZ6Tqy7?=
 =?us-ascii?Q?nLNQQE82tqMgMXL0Px17dVS4m2wFeQqhiaBV0iZY3nHKp0d/UHYyLcIjOsQs?=
 =?us-ascii?Q?pD01bX/oUou3sSYgJTLCTEr4ej+Ux8J7ItfVv7W1sHM0Fz+/4UCK/EzHat0r?=
 =?us-ascii?Q?iJlAdYN3fcEQOnr8KTuyMg9kZSj50OpiDI6doNxT63NbU8iLU0F++jFua1Qj?=
 =?us-ascii?Q?Y1oBHcpKXFxmBWenxZg8i2HzuuS9agQyXQjsFxp1pnqAe0LpUDuZKnHzpXYq?=
 =?us-ascii?Q?76V0lk7kpK4GVaHGMnletWiCnOMOVFHxKRQY5ImLRpi6jXj0Z4LH9VDWX4zl?=
 =?us-ascii?Q?KapJELXmULLOwxRT2reSqTuf1Dy6aQpAYCUbsq5WlS99Umsu20wQ8C4pHcce?=
 =?us-ascii?Q?yqT2eFcNedoIQ8PftlLhsJ/ZIwtwkNFOaQW238/pe/RqLUVvNcEwkergGY1M?=
 =?us-ascii?Q?QawCZuapk+IRQEqc6gCF6ycPVuldOcgGT2xnZ9Nj/mAM0r/okoECCztO2Lsx?=
 =?us-ascii?Q?7WYNJF1pm43pBEXIwtr+HfLGlRsUExEMz8rQwo6efbuknM/tGzytsN8aimvB?=
 =?us-ascii?Q?FyhEtqNus+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R/T0/Fj/r6Ag1ISqISSJIDozEr59b9HYkecVG/XlDXTnQLgOuqRUxuVDuWbH?=
 =?us-ascii?Q?RciO/Xl8epe0UhD34wOEf7u0gNV4G7D+i+BBu2ng7iMxL5FZb4oQTlO84IeI?=
 =?us-ascii?Q?7JfhgfaD8K/bCLhTheKLJ4nlFm7Nb7gvHIZratOMUfHKikViWdzZV4c6JPsZ?=
 =?us-ascii?Q?+JNWg0jMn36EouYKf9QfTs0atL2WBAMm4eIlshiOS2aspJVbf9p4AT0tf1/U?=
 =?us-ascii?Q?knNd3OEABrOS+RsssxBJxYxIhk7YEM6mQCBA0WF8ZdJE3G6QB4I6YNWvFdHZ?=
 =?us-ascii?Q?wtcjAVrprvCCf11qlqMEN2rFMUumaLC05Qogfo0JZgE5qvWekk+/YUXo+2xF?=
 =?us-ascii?Q?MpNTpEYCd8jrl0eNnIIoiogzQYD3GuC7v+iZdAEMsP/vIjGAa36HJWWjjJcT?=
 =?us-ascii?Q?vK36M9TvCLJJnsK7X+QoIQzeoJKQCo5/KgPAfAhRKez3EX4vu+2pkVNE8V7U?=
 =?us-ascii?Q?qJRDugVuK9qK3hkT8qNS20xm6Pxn6Egy79BPfJ7OIYS0ykw9Nq8RbCj/EL3r?=
 =?us-ascii?Q?vw2VqSNrAdaiL1UMZMFO6mPtai5yaGdw3WrqrNYrpVGwEuDNQn8AQJO9Tmal?=
 =?us-ascii?Q?wnAeJtrUIPdlJU3LCs8CeEXqq4JBNykq0Rr2bGErBJoUxj9WmUsd63+M1bjp?=
 =?us-ascii?Q?n7dR+V8alAT/BnF7wtJIDj4KQO9hNHn2aWhnRC24bk4sDHbLFqZUXLFBN/oP?=
 =?us-ascii?Q?zrN6/yVe5fJA/oS8PO73D3yDB6zx7e0zj9K4Xig1DWJfOsORP+L0Yg7a1wma?=
 =?us-ascii?Q?9RTp+OzR1jn2t0q6RHtPOxVySPC8ZMjFivSQy9QABkDUmHcibRHNEAcrEZIU?=
 =?us-ascii?Q?Qw0JK+QxpE+P26pwtm6gefCNAJ0XwkrpUAydjbeMSpwvUtURoyLdIU51fSM8?=
 =?us-ascii?Q?b/voZi8GTAFtS9qk2EIUaKe0cA6C0bQpjtzbs3KZO+gJ1kyjv3niVLOGtsAq?=
 =?us-ascii?Q?obem1GxR1Z7lXb8aGaQ3p8BeeyW7NsMGkkTVmbqyh1k0ITf4WIitKq2e7R1K?=
 =?us-ascii?Q?nFatXnYBicoBLm8qF5F9Zdb3trfviL/0Ld4AcBgAxIRRqN2eJqIz0/H4sWGY?=
 =?us-ascii?Q?A8usZB7iXV9wRBRAaIbpIp0nQaUnYuG5Ls7tpUznM6OSPjoiHs3NoHMy2pXJ?=
 =?us-ascii?Q?M9Rm7fPVAixnEXUP6Dd4YVIUDt5aSSfv472aZIASad9PoD/dHQ4ExYazqCXq?=
 =?us-ascii?Q?iUK8T8f2yRckCrySlBV8pDjzVCYHtkjvZXAE9H3t9q7uPyb+aq7oV3+06wlB?=
 =?us-ascii?Q?vL1SZ8MWUTbKggwLZP/lPR4tt8/0YTZfW6cjTBoiS+GQr2RW2cn7X92SNikY?=
 =?us-ascii?Q?iVCgTQsOb5rIEaOMD2VGk5yPC33gUYhXeX/qDu9kL4tvA+sr8cBA0WnjWHsn?=
 =?us-ascii?Q?ThLrKSKFvc7PjRqRmjmts5RhcAXv15E7plpJ4BH6QsHpqhQRpTFFY+0ZyG+W?=
 =?us-ascii?Q?cjse7VbOvKEc9EJTNmY4HlEJcxibw28NvUDK3J5on4FlJrsEJBdb7wCtJEms?=
 =?us-ascii?Q?36yqMm/Rm/21Ld9wHCWnqB5B+YGW5EVtzYunWhROFt+5KD8WNINxiNPJ66EO?=
 =?us-ascii?Q?DcsTl0BwguekOCLuLUYi60g8sQz9flap3TR0/1KXicIixtOAxpVo4lNBaqP8?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbabb032-849b-401d-46b7-08ddfba65c36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:10:08.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CY9qhBwrivItBc3igIcbejTU3HVFBZKoS++24YQ/6tV1xa9/XrFrXbGrc4vywczUfkDeQq/l33PJheq2pmf+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

On Wed, Sep 24, 2025 at 01:50:06PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> > they may contain stale or invalid data.
> > 
> > Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> > resubmitted by the GuC submission state machine.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++++
> >  drivers/gpu/drm/xe/xe_guc_ct.c      | 48 +++++++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
> >  3 files changed, 46 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 2a077a98e92e..34e57f44fbf4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1214,6 +1214,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >  	return 0;
> >  }
> >  
> > +static void vf_post_migration_rearm(struct xe_gt *gt)
> > +{
> > +	xe_guc_ct_restart(&gt->uc.guc.ct);
> > +}
> > +
> >  static void vf_post_migration_kickstart(struct xe_gt *gt)
> >  {
> >  	xe_guc_submit_unpause(&gt->uc.guc);
> > @@ -1263,6 +1268,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  	if (err)
> >  		goto fail;
> >  
> > +	vf_post_migration_rearm(gt);
> > +
> >  	err = vf_post_migration_notify_resfix_done(gt);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index d4a132b81b86..fa55e9c9de3a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -501,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> >  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> >  }
> >  
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -513,17 +513,19 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> >  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> 
> I'm not sure that this is aligned with the spec that after CTB

Not to rant to much about specs, but those are frequently wrong.

> being registered (here needs_register==false) we will modify the
> shared CTB descriptor, where GuC owns its head/tail data.
>
> maybe on the restart() case we should just erase what was left
> unprocessed by the GuC from our tail to GuC's head in H2G CTB?

This definietly works but it in perhaps is safer to just squash
everything into NOPs rather than mess with the head / tail. The GuC
didn't like messing with LRC head / tail so maybe it follows we
shouldn't mess with the CT head / tail too. Let me change this as it
pretty straight forward to do this.

> 
> as extra bonus we can then look what will be exactly "lost"

I did consider this but that is some extra complexity which really is
not required as GuC submission state machine already tracks everything.
Also once the CT is stopped or we detect a resfix we just throw H2G away
without programming them into the buffer so this really doesn't buy us
anything.

Matt

> 
> >  
> > -	err = guc_ct_ctb_h2g_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +	if (needs_register) {
> > +		err = guc_ct_ctb_h2g_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_ctb_g2h_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_ctb_g2h_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_control_toggle(ct, true);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_control_toggle(ct, true);
> > +		if (err)
> > +			goto err_out;
> > +	}
> >  
> >  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> >  
> > @@ -555,6 +557,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_restart() - Restart GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, false);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_enable() - Enable GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, true);
> > +}
> > +
> >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >  {
> >  	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 1e32a59817cc..506616ec1db0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_flush(struct xe_guc_ct *ct);
> 
