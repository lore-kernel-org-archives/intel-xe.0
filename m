Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DCFC4828D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 00:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBC910EB34;
	Fri,  2 Feb 2024 00:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zztc8zc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40CB10EB34
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706834293; x=1738370293;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1Lrkcoy31EgmOsAZ/AQ2i9Xx+NtuJOQtEWWSh0bz2Ck=;
 b=Zztc8zc4weB7SvXy+yYPLMmiQrDrXeNwNoy43/dg9eW0AE7E7zNqme8+
 nG6q/3Rm8xEYQh32Aj9BeLPzHPitwi1vPSmYzSN5rUIxdp+RSO2a6rQ2O
 +IcvMqMFkP9Wop2y59C5OwHljLSGKKBUvrzQWeayLERCMyFHQNFRUu1/4
 M5oX86qyxn2bP9jL53RHrq9Tmwz7Qw34+Vc2Z7YnUuW8ZxRZ6t+AzJGa/
 eEeB9cu3a5GvqcpWM1zTZZnpj+XB0YGCZFzgDBlpLMZjKFady/z9fsbKb
 lf/sEodPy7V3l2Rcxgyubc/d6eC/0OdYI6gOwQ4VPs6wL0J7aQYyfMUGD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10703523"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="10703523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="132376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 16:38:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 16:38:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 16:38:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 16:38:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzGJH04qml1Gv9BreNp4KWHiRDcBRVvg96h8zgavVEN+lauA/cYr5Z2vHFbuZY5ze4kP9G5gRqP0zeUYHagtirw4b21mDyEGohJkl+Qvr91RfcPPne6QqvJqs81uIzP/MPdjXnB0P019k2uYVIOVsusxjFdlHnwTThr2EpvZPv3AyCv9GQH3HWoZO3sMBqU5gDv81s5HYj6f8k87G2C7FoRdWYbcVHeysF2Z9SFA2hZH/fXCw6ODe4vnAO8mCY5YccLuhxT945lpWmYl/kI/fU4e3Jp/Md+QQ2gwGGCbS4kKIUqlA6EnlP4ZuoC133sF+gifbUs1lkbGHc3qr309oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crzd7aw0ysE2d/ZKRUGXi33go6VBKpO94tfDZ728naY=;
 b=h/yZFIGbHf7Rhp3QxKaL1krOfVQeWbiyvytQZ0MZu3DErKt1HcjACDcesF370f7Cb3npi5hyqd22rRIqCbBHr4EYqRdoJmPy5EnvBHZl65u3zhaFn6nHdWvgw9dezjpXabmJg1XNgp99raumd8UuyXuD5R6rd19MACOUsg1Q9S4XIEDyRNhJdxBiN5w+BWQh030zxm3rIs/waTPQAU/5rRQwrz3WyMLhgIvebqgflxCGTBaOs+2anhpt3fHl8Bwy9y6hkk+MdUrHB+46dYfu0DWq3AVrJeo8nBPKb07ijKn3smiM+o0WjCjTUtCfQoDhL3+Dj6OkrEpFXnBUGLftog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 00:38:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Fri, 2 Feb 2024
 00:38:02 +0000
Date: Fri, 2 Feb 2024 00:37:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Brian Welty <brian.welty@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: Re: [PATCH 1/4] drm/xe/guc: Allocate GuC data structures in
 system memory for initial load
Message-ID: <Zbw5OM0eaDMRW2XI@DUT025-TGLU.fm.intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-2-michal.winiarski@intel.com>
 <ZbvWlEXjQz+7/iWQ@DUT025-TGLU.fm.intel.com>
 <vbsgkhdcgtpndbhbqpxv6wurmeuxzvgvrnjdhoarlztajbydke@bw5uym2eomjo>
 <ZbwTxSYFyERYDp0g@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbwTxSYFyERYDp0g@intel.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: a839ee5e-36ff-40fb-1618-08dc238736bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKhF4+iPFD1yTVcTkvchDKgTYCl5c2pASm4iR3ljz4w1RCBgIvWRDIVzQeNfAcIChlAdFtlUHB6MqNdBFYLm0L0TMliGRMFQF2TVteW4QH379afcLT0KFiCe13eM89K7goGXyObzRA37NfJvQx7wz3NbXRc6kapsV8SPtXEM6rH7137NxSC/s+sYzapZBlJtxKwjnzthBHONY5/TBw3BPf2GcF2jk//8kOKQT6kqjR7/UxL75fikL0O3RFrPFchb44BUZrLKV4pM546AlwDb7bZSzqb7h7IHMAur/fvLE0pKuvoWRhpl37W9CVjAf1RjAKpxSX4Z7jrZEGF9StnDTAdS6as5nOswHAk57AABv3k6Tnz5WVMh3t7cbP2ZRUPbHCXN5cJQXYRlfNIVg5veneQlAHA3eHcuakCK5v5H2eEgn50rTQTxbMrkGL+xj/ee0DWS0UOwRg9hzILteCT8IN87/Ngl70hLXp9eKl80UXDkCe1mK74B7FBjSqhcisQXj1bvi2dgSrLL36x2PXQ7ykv1nqZys0oS3HyRp4HXkIvqE8ZMd2ckB5H/uXytjbmLf90MQ7qtOFs6Cr5cry4+ft0u/DylZsJ2UwCFERtGhhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6486002)(6512007)(478600001)(86362001)(82960400001)(41300700001)(26005)(83380400001)(2906002)(66556008)(5660300002)(6636002)(66476007)(54906003)(316002)(6666004)(44832011)(6506007)(8936002)(4326008)(38100700002)(6862004)(66946007)(8676002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clljZVdQM2RWcGliY1ZCNFh1VnUyUTJoYlByVzh2QjEvemZoOWtpL2NLNzhL?=
 =?utf-8?B?L0FtV3JZL0NJaGlKV0JuSFAwMXpOaUxjQ1lncHB4Y013SVZRU2N3Y2VhL1M5?=
 =?utf-8?B?S2djSWUvTkJLc2M0MFU5aTdCclJKN3V0MnJ6dm5UcXZPaGliTHhNd2cwcHRH?=
 =?utf-8?B?RlZjaXlPVEhSMHFFdmFER3B5aDhFa211clNYRjQ4dkF6MU42VlZQdURwcm1z?=
 =?utf-8?B?TnpnRTJSSGZSRWpreXJWanNwOTc0R0lFZHhCOHFwczV1UWdVblRhT1haZ21E?=
 =?utf-8?B?aENBdCs0MjR3cEk1YVllOFo0NEt5NGM3R3puT2p4R0NoR3g3a1oyYTBxQzJs?=
 =?utf-8?B?Z09vMUc1QjdJczg1VFlKRVZNOWlRNjhZeXNsd1VtclQrd3UrU01RMUJxeGh5?=
 =?utf-8?B?L0FETjY3MXlXa1ZFN0ZSc1ltKzhSRWFlVUkxVGlqTUk0SU4xRmV6Mmd5Nnlj?=
 =?utf-8?B?M29YRmpXS3htWUxBazNwWWJ1SndvWVJ5LzZEOHQxWEhLd2c0TnljK3BsWlRz?=
 =?utf-8?B?YldtV201SkE4RGFFQXVSeGwwKzRHYmROblE0eUU5YzRIbEtOOUhxcTdUWHdW?=
 =?utf-8?B?cTNLbFVCd0h5MXVxY2lYLzRicHRORUdYc01LVU16NGpjMzFtam8rVS9NZ1hV?=
 =?utf-8?B?aTNBYjFudGZzcGk3aC9nUkxpQ2JXK0FnRXJxV1lZUTNZNm5Cc29UL01ZaHdl?=
 =?utf-8?B?K0JXdFV4aXh3TEtnSWVHRlV3TGwwaXEvMit5YWxxZ0JRd1h0VFFWeWhuS0Jr?=
 =?utf-8?B?Q0F2RS9oUmUwU3VCdE5Kek4zR3FiVVdJdjUzcDlBcVYwUDY3SmhQK3AvUXVv?=
 =?utf-8?B?dEZiVlpEZmRGV2VyK2ZJODhEUklMQXRXNkhORGQ5S1p3MmxzdHROZURWaEJU?=
 =?utf-8?B?MlU5WnkyNEF2MmhDYVhXaXVKYm1UaEx2UXNuNVBQcWlTOEJLYW94MVVjZ1M4?=
 =?utf-8?B?RTQrOUQwTFAyNTNiM3hxTEJWNWgwTnhMc2luNDF6QWhLNit1UVR2eUxEYit5?=
 =?utf-8?B?V09COTZKQldkR0Y2VGZHVyt6VXlLOGJlOVVmd0RJbG1VZzB2K0dUdEszOEE4?=
 =?utf-8?B?SnRkTUZrZktFOVIzZUVUaWplNC9jQjA0eW9rd09VUkVWRWFQT0Y3blFoeTVn?=
 =?utf-8?B?R0k3TGl2cHh6UjNCUGw2dDM1WXVZUGg1VG54akhpWVdpZ1F3OGVodzFCQ1JY?=
 =?utf-8?B?ZXUwYmlwSUVIMnNhVkdBalpEK0sxbkFYVzdhZStOakRuSTRsU0pBcWd4Mzk3?=
 =?utf-8?B?Umg4SVhtdWJnVEp2NStOQ3A5VENzV0s5bm1CSllzYTVkOC9vSG9JZ0N4VHhK?=
 =?utf-8?B?U3Y0THZwakRzQk8yaXF1ckFqSFlMdFpIaGxzb05Vd2FRVEU2Tkg5OTRtSFgv?=
 =?utf-8?B?QUFzaW02M3hrdDNCa3lGL244R29IVnlONmUvQ3BnS3BNY0tTREw2UnhaZHFF?=
 =?utf-8?B?ZVFvMW11NnZWcTU3QmI3Sm44V3hRams4VkNrQmUwc0xGWGFrZDIvOVQ2Mmp2?=
 =?utf-8?B?aXpIRmM4VHp1OC9kWWtFNVNWWDVnU2h2VDA3eWlCeUppMjU4ZkFZaDNST2oz?=
 =?utf-8?B?VnE5U2l3bzRSY3lad01hRE0zK1dUci91cDJHRDNxQ3lTZVNETzVVOEcyaVk2?=
 =?utf-8?B?WnBwNWJBNGhrK3RoYUd0bkRiTGtteUVqRTEwdFlyeE9uanNGMlMvQnFZNUU0?=
 =?utf-8?B?UklOczJjZVJwa0xmelNQV3dJQ3hETEhrRjRRUWZMdDBpc1RSZjVEZlZvNUxv?=
 =?utf-8?B?eDZMNlVLaFFKa1lOdkxuOHZIZnpJK2RmVmRhOE9hWDN1RitINDVBUExMR3VQ?=
 =?utf-8?B?TmloV2l5MVBCbXgxUTc1MXliTW11OVJ2czExZHpDVDNvc0g5dTNLSHBxRVA4?=
 =?utf-8?B?cTdYVnJXSnNDRHBITmNRN1pXWWk3elNSU3pjS1hUQmsvb1lKQXNXWnZiOFJn?=
 =?utf-8?B?cGxuYkdCVXdBMUdWUm83U1ZUd0htV0FYWGJscSt4eUdBVzhnQlVkR2x6K3Y3?=
 =?utf-8?B?WHpETTFpL1IybnJ2K0VNOEtrNmxDdGdJU2RCSjB3THhJMFhiWEMxYWlQRml6?=
 =?utf-8?B?TUZTakR3dXVBVlJpdFo2Z2xYNXZPYitkdnJVaGEwREYzMzZNc1hVTml5WXov?=
 =?utf-8?B?UE9xeWhBaDdxTkR4eC9yT2I5eUJNZ3U0RTNpOFIvZHpPbVdjR0VJSnBYR1BI?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a839ee5e-36ff-40fb-1618-08dc238736bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 00:38:02.6999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewbC2lR4I7/cfYzLtprmfopGFXNNlq9AbNeos1iepZGOUExLF8XROq/yCKz8eMXK0VjNexy2eQf5ET5lYogepQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Thu, Feb 01, 2024 at 04:57:25PM -0500, Rodrigo Vivi wrote:
> On Thu, Feb 01, 2024 at 09:25:38PM +0100, Michał Winiarski wrote:
> > On Thu, Feb 01, 2024 at 05:36:20PM +0000, Matthew Brost wrote:
> > > On Mon, Jan 29, 2024 at 02:03:05PM +0100, Michał Winiarski wrote:
> > > > GuC load will need to happen at an earlier point in probe, where local
> > > > memory is not yet available. Use system memory for GuC data structures
> > > > used for initial "hwconfig" load, and realloc at a later,
> > > > "post-hwconfig" load if needed, when local memory is available.
> > > > 
> > > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_bo.h           |  1 +
> > > >  drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
> > > >  7 files changed, 71 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index d6a193060cc0b..7df87fbad0938 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
> > > >  	return bo;
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_managed_bo_reinit_in_vram
> > > > + * @xe: xe device
> > > > + * @tile: Tile where the new buffer will be created
> > > > + * @src: Managed buffer object allocated in system memory
> > > > + *
> > > > + * Replace a managed src buffer object allocated in system memory with a new
> > > > + * one allocated in vram, copying the data between them.
> > > > + * Buffer object in VRAM is not going to have the same GGTT address, the caller
> > > > + * is responsible for making sure that any old references to it are updated.
> > > > + *
> > > > + * Returns 0 for success, negative error code otherwise.
> > > > + */
> > > > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
> > > > +{
> > > > +	struct xe_bo *bo;
> > > > +
> > > > +	xe_assert(xe, IS_DGFX(xe));
> > > > +	xe_assert(xe, !(*src)->vmap.is_iomem);
> > > > +
> > > > +	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
> > > > +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > > +					    XE_BO_CREATE_GGTT_BIT);
> > > > +	if (IS_ERR(bo))
> > > > +		return PTR_ERR(bo);
> > > > +
> > > > +	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
> > > 
> > > Should we not destroy / release the *src BO here?
> > > 
> > > Matt
> > 
> > That's what the __xe_bo_unpin_map_no_vm is doing. When the BO is
> > allocated using xe_managed_bo_create_from_data, __xe_bo_unpin_map_no_vm
> > action is added as DRM managed resource to automatically destroy the BO.
> > With drmm_release_action, we're calling it immediately (and remove the
> > action from the managed resources list - so that it won't be called when
> > the underlying DRM device gets released).
> 
> This indeed looks correct to me:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

Ah, yes not sure how I missed this that. Agree this is correct.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> > 
> > Thanks,
> > -Michał
> > 
> > > 
> > > > +	*src = bo;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  /*
> > > >   * XXX: This is in the VM bind data path, likely should calculate this once and
> > > >   * store, with a recalculation if the BO is moved.
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > > index db4b2db6b0730..ff919a836d163 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> > > >  					   size_t size, u32 flags);
> > > >  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> > > >  					     const void *data, size_t size, u32 flags);
> > > > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
> > > >  
> > > >  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > > >  			      u32 bo_flags);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index fcb8a9efac704..9b9a1252f3090 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
> > > >  		guc->notify_reg = GUC_HOST_INTERRUPT;
> > > >  }
> > > >  
> > > > +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > +	int ret;
> > > > +
> > > > +	if (!IS_DGFX(guc_to_xe(guc)))
> > > > +		return 0;
> > > > +
> > > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  int xe_guc_init(struct xe_guc *guc)
> > > >  {
> > > >  	struct xe_device *xe = guc_to_xe(guc);
> > > > @@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
> > > >   */
> > > >  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > > >  {
> > > > +	int ret;
> > > > +
> > > > +	ret = xe_guc_realloc_post_hwconfig(guc);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > >  	guc_init_params_post_hwconfig(guc);
> > > >  
> > > >  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > index 390e6f1bf4e1c..6ad4c1a90a787 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > @@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > > >  	ads->regset_size = calculate_regset_size(gt);
> > > >  
> > > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> > > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > > >  					  XE_BO_CREATE_GGTT_BIT);
> > > >  	if (IS_ERR(bo))
> > > >  		return PTR_ERR(bo);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index f3d356383cedf..355edd4d758af 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > >  	primelockdep(ct);
> > > >  
> > > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > > >  					  XE_BO_CREATE_GGTT_BIT);
> > > >  	if (IS_ERR(bo))
> > > >  		return PTR_ERR(bo);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > index 2a13a00917f8c..ea49f3885c108 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > @@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
> > > >  		return -EINVAL;
> > > >  
> > > >  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> > > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > > >  					  XE_BO_CREATE_GGTT_BIT);
> > > >  	if (IS_ERR(bo))
> > > >  		return PTR_ERR(bo);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > > index bcd2f4d34081d..45135c3520e54 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > > @@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > > >  	struct xe_bo *bo;
> > > >  
> > > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > > >  					  XE_BO_CREATE_GGTT_BIT);
> > > >  	if (IS_ERR(bo))
> > > >  		return PTR_ERR(bo);
> > > > -- 
> > > > 2.43.0
> > > > 
