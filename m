Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31964C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 20:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9EE10E5B7;
	Tue, 20 Feb 2024 20:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUDEF9jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A039E10E5A5
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708461961; x=1739997961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nJwGeSvUi55mKVdgi8asiCIt0gzgExa0mYn7FXPOHwk=;
 b=OUDEF9jWWpFAdHONY2J/wdM2Fit2azweiT5p2sddM0/3VBrz1z+nI8Gh
 /OwUxU1/EJuJ7yJvWxCDym8/P73aGk8gLRwH5uTAKnR+d2YrII4/drkS+
 5vWIAa/e7GWTa+MXRo+7e3qKme4cBWiKiOldhYtcQZKdaQYCUgv/O1DdZ
 GEnr8ys4SoJLYd49K7o423exvYmRuviZXPE5re0tWyTqGlby4+IPSDQG1
 LJeoM0pk/qKBYXsR2lKz3H2VlRjb6+/PIL8YaOvggYIBnU3jMY4dgNrDE
 YuvK1PYMv1lpYjco7Ybm+HL84ZDpQYYpNlSOaIm5g5cBOOfDJzNOTOuV+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2726116"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2726116"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 12:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5240490"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 12:46:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 12:46:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 12:46:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 12:45:59 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 12:45:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqcTgfPcfTSVt/rIcekPximGn0WN4TrN2ysSER2BzkBEyDdssJ+u8Dp6HnqLoGCYuj3WFN/D7kk3Ty4yKJcL4Intlc/Kcv6G9K+gFo6kZmooqp+cJOHZuV0DLuVBAUMg0MGh+KVVspjrdJZBTpYVq2l0arFmR/QpoXZznDQ1QHYS6uQc1r2fW6S/uwIAB0Z1kW/shKb/hS3zUAdn/9hwQvRdQ7Wbbms7ns3gXNTuZBV3uqiqnl7gvz0EYawEpSMfWnrA6843cMhxcYmZTbEcEMJZFvJGAaDS7RNbREOFHAiaIwl1zlmh7Tzw4SdDn8KyX8xghB3/kffIOtp7y3UYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYVPnzxXtqsm8ZY/tb/TVx+nag1LX/s//7EcmVA0vtE=;
 b=Ze3d6ElTATirlMumqILI1MDINcI59WmFPyRIjS7c9xKlCKl5KlODUjOt+38HwkTS8VHHqPMdur1w7ZOq7s4Srz1vdpMQ6dni7mb4aKIYqTaP8rAyoW6xAbj6FdX6cLGmudB1d4JjtaJHnXFQworxO/dqeZ9HijG9PGDIbjLv1kGewzVND9mhQJsl2H1k7EMYVXIY+ZyhYp+OXVFr8UHnzNaEIaYobWFZnKDfHPAcvWi/FHeVzzvopd0sBQ8WVku2JJta0rd6YdbAhZWx5Tf/bWlluDmJA+Eclv3cwyR05opUqMmPb3/0GmLTgGat+b2WxG+zMBXDfxc3yIHgHZ2XcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 20:45:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 20:45:57 +0000
Date: Tue, 20 Feb 2024 18:35:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is
 disabled
Message-ID: <ZdTw4K4WdLFUmAlJ@DUT025-TGLU.fm.intel.com>
References: <20240220021356.3514454-1-shuicheng.lin@intel.com>
 <ZdS/t2KKI79Kyy7C@DUT025-TGLU.fm.intel.com>
 <996d9944-e355-407c-bcbc-ae3deabca6b4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996d9944-e355-407c-bcbc-ae3deabca6b4@intel.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: c01ad743-eada-4093-ff19-08dc3254f06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag5AvQ1zmaDTfSOKJ9DI2yTCFzl7fxjfQs6pyalYQ1P87PdGR19APA7BIin4p3p8babEHaYHGYloZHrWqSDRSKAKKNrjUlkOic4ifkhGDl1LsTWSrEN6Fh0bVBhzDiEXkV6GidqteI15/O1yK9gpYNXILVR57pUUjPFaxzmpE6FO27g/rte0atkh7tpkAoJ9AUoW8oLZpWkyj24W8rll1HeqmZ3lTCrqPTu849UPlQcMtyq1lPyhFB7GuxEz9jufapOpzJAhywazkmS2IeicYbh8VCxcAq7Er3yo+wiX9kTRPVPK12CVW7aZqJp9Xotml6LJ16duZRyEFvfSyfKYvz5EA2HfBiY1j/Hg2KySZBUQiOrgQiapG9MAaqrXU02JRz/IkOZ1aEnxOiWK13jLxu07aHJfwVlfje86w0F86dKPxippjNFoDBQQPT2LGpIzOIfxxWNYzilXojvosN6PfBHYkEw89P1Jr1hnFzi+ldKBhfm1Q9ujnsI1k+C/9ZDem/0nxXL6Bkiq2OEvz8d7Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGYzSnp3Nk04T2pjRlBFV254MHRsdVpSRGZBWitVaWY0a0NVQ2RRWHFPVCtG?=
 =?utf-8?B?VVI5MGpnQktlL1FSNEYyYSt4WllWRk80QTcrOGNJbWRRRDk2dnliVmI1MWNG?=
 =?utf-8?B?VGd2QXVWakRjc2xySVozelNnMHVhejNXeGx5UHlzS2VZZDFpZFlQUU54aEVx?=
 =?utf-8?B?ZkNRRElMWkV6OFZrb2FVVTFEV0tlVUYxQWJCMy9GRGZxcmwzaXRlbE1LemtY?=
 =?utf-8?B?VTV1QmZaVzBPcXB4T01IWkNhMG9IeUhpdTBEWllqMGFCazlJa1pwdytjam4x?=
 =?utf-8?B?dHlKU3IwMnRnci9wQnQwbWNhSUdGc3BaK1dJLy9kT0tBcGI0bEdwV2IwcUpY?=
 =?utf-8?B?SVZueEhLMGg3a0dJeW1xV2pYOUNEVzhuc1FVU0p5bzgvRC9ENmNMSTFISVZr?=
 =?utf-8?B?RmE5RkFVRGp4TitIQWN5a0pIcGZMc1RmK2kzdXRodm42R1RGeWNPUWN6UWlO?=
 =?utf-8?B?N1FYQVhVNStoZlJadjFjV3lwaU42SkVXTFdXTlhRZVJkS25La3N3WjVXNUIv?=
 =?utf-8?B?Y2ZzRXhnMnJObjZsUmRYN2hWNkJmZTNhK21jT0wwUHowanV1dWx0M05LTEtC?=
 =?utf-8?B?RW1ROHl6aHdBcFJTYWUyQWR1N3o2TVZaQzhDazY3UlFrQmdtQWJ1bmVSZ1JD?=
 =?utf-8?B?ZUp6Szd6Tnh0aWtKT1UyY0Z0LzRmWlVHaS9GNnRGUGVHTkxsK0JQZnpmL2hB?=
 =?utf-8?B?UHRWK202Z2NIZklrSlo0aVlTblVoazRKZFdKUy96RG5yVHZqUEhzcUE5bG83?=
 =?utf-8?B?blFCOVA4UEZwRDNybGFTYmlQc0ZBM1lPYzdzUnF1T1RiQXRCUjBkQjdJTlVP?=
 =?utf-8?B?MVM1WElLR2tMdEJyaklPVloxQjVHTzVveDJoQUVQajltemFJRGJVNFlsRDEr?=
 =?utf-8?B?MklqdjA4OEhGV3NZRlhtMkxQc0ZFRVludnBwK0FsL2tWMTdVSVZHbU1lMytV?=
 =?utf-8?B?S3RldHprelRVOFZwOVgzYzdqUHhrTXFtNlI4U3FDRXVlTjZkZzViOStOUjRO?=
 =?utf-8?B?d0tQWlVlMkpDTnR0VWoyYnVzZkdCYlF3ZVVIaHhpR0xvV2tRWHpCSVROV01D?=
 =?utf-8?B?dXhRVUlaU251NGJTK1Q4MGNiOGJHYm5TOVpTcFNLd0xSVVp2OGhSU0U2cVBC?=
 =?utf-8?B?THhVdXVIMC85c2wySkdNNzVqSUppT3NxaURiaXFteThOVTIzNElpZkxFbklH?=
 =?utf-8?B?SFRsOVZZWFdmNyt2SHdwL0NUSlZSN3A3UEQwc1RwalVMUlB4RkZJNVUzT1ZM?=
 =?utf-8?B?cUNvdWVpZkpESlVGS2VtV3g3cXBRZlJYN2F1emc5OHkvKzBUcGlJaTF2SWxK?=
 =?utf-8?B?ekF3bGlxN0VzK0VQcnpWRTZUUVd1UHhVUklma295NHRaaVhFcHZQRzY3b2Ro?=
 =?utf-8?B?S3pmeFBmeXFiNit6RWpaKzByQWc3TW9RY1c5ZU1ZQVVyRmsxTWNSbkZkZWtP?=
 =?utf-8?B?R3o3Q1RPYldKb01jN2FGOFNhaG5XVzN3cWZOR1dPLzlFMzZTYytlSmhKaDQ1?=
 =?utf-8?B?R09uWGk1RWFyd1dNbnVxOHE0OER4b0R4aWZ6a1BycWhnQW1QSUpXL3dwRk82?=
 =?utf-8?B?cm5wbFE2WU5pTFJmbGcrdlF1U1E1N2NYaUZESnJiYmVvV1B3MFJQZVpkZ05y?=
 =?utf-8?B?eS83dEpETWxqTGRiODYyRlU4L2tZd0g4NjMyRk1LRCsvaVJqbG9WN2lPL0tL?=
 =?utf-8?B?cEpkaTVVNjVrWjVrZUhpakV6UytkUlBhOUFYdVNrN0FjTXJjeTdFMXVlTTZL?=
 =?utf-8?B?VW1Nd2pHTitYUVhSM0hKTWphNXA2d05aMjRoOFZxbFZnMkhWWUdZd3YwcUhQ?=
 =?utf-8?B?V1FjcjlCWFV2cHpEaXpZaGN1ZXpkd0g5SmhXSVRQZ1R5N0gzblNHa2pHTTM2?=
 =?utf-8?B?SXJGQ0FSR1kyc3QzNnlwWEwyVlhVb3RUVXRobnhiNTdnS0ljdFFEUU92NGYr?=
 =?utf-8?B?bFgwOU5ieXIvR0tDU0VYOVNIditXQW5aeFpTNUt4VXhhMjVNL2QrRmNoelpL?=
 =?utf-8?B?ZGI3NUNPWWhlVW80T0t5NnUrVnJ2d1puTmk3L1ZBd3B3VkZyaHhEQ2w3eTJR?=
 =?utf-8?B?RkhzeDZVaWZlYTlsVllXWEY1K3V2TThBTytyZkoyOXlhNlJxWENlLzJuMkpT?=
 =?utf-8?B?Z09KSzBHOVFaMDFWMzlra1UycEswTXpQVmtMNVZ1TGZaQjdiUnZYaFBNYloz?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c01ad743-eada-4093-ff19-08dc3254f06f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 20:45:57.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AdFLVQDfUj2Hr0O6y6sGP9u+y0g8gSSrkaR9uFHe6C93fLxmQ1QLCE+L4beqFxpsi2yT2IW3EwXmAYvLI6rSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
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

On Tue, Feb 20, 2024 at 06:07:00PM +0000, Matthew Auld wrote:
> On 20/02/2024 15:05, Matthew Brost wrote:
> > On Tue, Feb 20, 2024 at 02:13:56AM +0000, Shuicheng Lin wrote:
> > > Suspend may cause the TLB invalidation time out as below log.
> > > Skip the log print if ct is disabled to make log clean.
> > > "
> > > [  228.812266] xe_gt_tlb_invalidation_wait enter
> > > [  228.812311] xe_gt_suspend enter
> > > [  228.812782] xe 0000:03:00.0: [drm] GT0: suspended
> > > [  228.812786] xe_gt_suspend enter
> > > [  228.813508] xe 0000:03:00.0: [drm] GT1: suspended
> > > …
> > > [  229.067007] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB invalidation time'd out, seqno=321, recv=319
> > > [  229.067099] xe 0000:03:00.0: [drm] *ERROR* GT0: CT disabled
> > > "
> > > 
> > 
> > This doesn't look right for a few reasons.
> > - The timeout still can race suspend and then a resume
> > - The xe_guc_ct_enabled check also supresses the -ETIME return
> > - I think this message it actually valid
> > 
> > What should probably be done is signal all pending TLB invalidations on
> > suspend. I think we are doing a bit of rework in [1] in this area too.
> > I'd say let's get [1] to land and if this is still an issue fixup the
> > suspend path to signal all TLB invalidation waiters. Signaling all
> > waiters on suspend shoud avoid having this message be printed.
> 
> I think [1] will only help with rpm, also currently all callers of
> xe_gt_tlb_invalidation_wait() will always have an rpm ref anyway, AFAICT.
> There is the forced suspend path which is quite a different beast though, so
> likely it is there where we need to be more solid?
> 

Yes it likely not the rpm path here but still think it worth getting [1]
in and perhaps a version [2] in first though.

Matt

[1] https://patchwork.freedesktop.org/series/129217/
[2] https://patchwork.freedesktop.org/series/122772/

> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/129217/
> > 
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++++-----
> > >   1 file changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index 7b3a54748b49..8aac12efea84 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -330,11 +330,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> > >   	if (!ret) {
> > >   		struct drm_printer p = xe_gt_err_printer(gt);
> > > -		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> > > -					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> > > -					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> > > -		xe_guc_ct_print(&guc->ct, &p, true);
> > > -		return -ETIME;
> > > +		/*
> > > +		 * guc ct may be disabled during the waiting period and lead to the timeout.
> > > +		 * Such as power suspend just after this tlb invalidation wait.
> > > +		 * Skip the error log print if ct is disabled.
> > > +		 */
> > > +		if (xe_guc_ct_enabled(&guc->ct)) {
> > > +			xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> > > +						    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> > > +						    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> > > +			xe_guc_ct_print(&guc->ct, &p, true);
> > > +			return -ETIME;
> > > +		}
> > >   	}
> > >   	return 0;
> > > -- 
> > > 2.25.1
> > > 
