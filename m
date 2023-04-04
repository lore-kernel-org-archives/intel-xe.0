Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72297C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 19:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4004A10E051;
	Tue,  4 Apr 2023 19:45:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75EE10E33A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680637519; x=1712173519;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E33oODH587uxVNhmq5pRmmFVs/Jch1Mg7c+yZx8op3M=;
 b=GO3b+eVzhy/SHcLK4YYa9tcD29/ffZRANZhcer/wH6lcY6U3QfKuVBvF
 Z8iwOWVKmQuFd88cMQ0gljvjkg0fO0AYcD0kTLO1+I+Wnq15Po4aqRDLV
 Z/SEe31vFz1NiQQoQuCZU+liIeto99T+0HoZ2nYnuIvxaLX9/1l49Vewa
 9PaltanENHfTsgbzc6KQRbpu3sAeRYEpvZEF3lajXMj3/Yx6o4FZbeV3f
 xzKNB26ro1QOyi2KBcG3RwYt2S+o4SkbhvF386VJTpVOhncEZ4eKoaKgS
 5xdgjPLRSXeyS7PotwE21TNt2eLrdg4dMpvnuTDw2WzpfsRf2i4HS/juN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342308091"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="342308091"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 12:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932563951"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932563951"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 12:45:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:45:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:45:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 12:45:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 12:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEy0QgrOFGG22OxGTHUmDBCbS195kEwmuO6FVeJFoMMMxcyBXvqAa1XujiAdqJkwb3lcKbkrqDvVr6MbMtiZdSuf6nE7iNxFIcYnU75GEKsYaNCpPBBegzRyGFF4wOZ6MgYzs4msXdFNZIxeUpAi8oSAbRWzogqXYKz/syYXkvWMcHloFUQGSjwUcBzqlD264RD+XjdJatehvniRPhucpFbPpb65xCzdym08cCaayJ1bJ1t++crdWcA3X8GVkwyPLZ2GX6bCqtfyyJgKc1TpdQgqkjyAo3pVaJ+s1zEoPe8ZcIbgZFXhSOcYE9mCb7F07p/tXzhu4gbYbGpDNi0XiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeHBKPIodGN/2Xp4SkZqawC0DgjsXhKylOCIOJlxKuU=;
 b=kZInKKuJd+5uQaO9nUIIB2S7loWskY2kIa/Lyo55oGSyzFAd0z+dFYGzRIZzZUKx1JngC7qSI4Q7Uo+HCLPKF7D6eDkflbafop39kDHu5bhdnsDO5k69JlfwpdQolyQntLEN049fkfA4GC+20nrUBwCRSCPTRQUH9lkD5R1p41lGFHkBCGR35pJ25dZh1rhflKets+yv4v19hWsw/Vhru6n8YyC+0563ONAshupt7q25E6BOsZ966u2thICcmwip/mhGuPSZnn7u8ztZkIP2FeZphJKHPwTHeScH20foUQTaRNLLBeufOpmFUbfT+yYeB+1eTLzvmiwRZ3cfgRiOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 19:45:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 19:45:10 +0000
Date: Tue, 4 Apr 2023 15:45:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZCx+Qfwr7KSaKGiw@intel.com>
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
 <20230404184839.qlbwgv7lvvbi76i4@ldmartin-desk2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404184839.qlbwgv7lvvbi76i4@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0d1694-ea1e-4fc3-f82f-08db35451953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSRjcUQIi1bqtGd8bsTqy+s+f8Z1e0ekRuVsNT0VqdUEiVGOsrlQ4gymKdbytQVXWFxpJSrE7PmjT6p7Nuh8I6aoHGZ9OixySqEE/syylHnfyMQqqang6+bQIYUJBnD0cZwLXVGHF/WEVffbeABgmfH7OZdSXmoQYwXL9BVLp6zWQYaNk2ufOBLa77Aud8csil59Ui2EbsVkV5Gp/dJTgpawjuPJ96RLb4A3dJP/IymcOB21/xGWpybosgGiNH1ECXRouo7XeZLsQf25C60Jdn39q+Mn7mAsGbda+jzWj8pQIvP5FuQNEYCHEerXmN4z5LoKbG8uKSJoaOOfTH4Rz08KD3Bzjsk1XMMM/LqTArG/q/DRPipEFG8I5rpK8/ahZOcQpdCB1oFp8ISrb+Htmdeo5CIQuYwR6tuCLSFPcq6j6Cwd4AT7R+K9behIJqae0unXuu/c6e0uSWZ9b5azFinoa19bD6GRq6kf14jLYSQqwUE7vmBYm6856XY+7SDLyjEcoZj8gEIy76wRFD/AxNF4SiO0LWnQOfadtcA1pS8Keih7QnEvIzz5EP4x+gR7iILtUoMbrnTC/sSjvIDdErJY7KIjbfk1TtuUbH0gq8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(2616005)(83380400001)(26005)(37006003)(6486002)(186003)(6666004)(316002)(478600001)(6636002)(54906003)(6512007)(6506007)(2906002)(5660300002)(44832011)(36756003)(38100700002)(66946007)(8936002)(66556008)(82960400001)(66476007)(6862004)(86362001)(4326008)(41300700001)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djF0UVNqem9EWC9sWlovMjdGa3Qwc0xsNmxJb2s1bnVHTWowYzBmMEswTmZs?=
 =?utf-8?B?bEFrcDRPSHlCZ3NxVVBpdzF5Y25Hb0w5aEVWTjcwOHZzZ0kvZjRmcncvMFZJ?=
 =?utf-8?B?QVFGYXRhWTErbkNLK1JoTHdHM3Z4Q1NWcUVDRWxrNVdvcHVPckNxbitkVkNM?=
 =?utf-8?B?eFc3SjRSenV4QUlWaHZHYUUrSHQzaW1SaFJUMHdDQmNjOHZiL1phdzhaZ3FH?=
 =?utf-8?B?MGt1UDA2WmdpNlNuMUtGcGdja0FUM0FDSU4xLzVDVi9Nd2EvVzZRd1dmM3V5?=
 =?utf-8?B?RE05WmhYRGFMN1ZJd1pSYjNVdDh4aFpubWVTbHdzUkYySFhGSFN1ZTcwM3d6?=
 =?utf-8?B?SlI1Nlk0SHJUM0FsNnQ5N0VzNXJxNTlmT0xnMWwvc1hENHF1THlLQXVUWVoz?=
 =?utf-8?B?UHl3R3pZR0dDcXdFQnZNRjZBS2hUOXVFamc2TlR5eWZUVFpqdllibzBibURV?=
 =?utf-8?B?SlpQR1FCVUZ4MEk2Y0VTQU5FSEZDS0JSM2h6cXRQa3h3RTRNTGIvSXNaRlp0?=
 =?utf-8?B?eGpZNWtmbkVSLzl2dTZwdFNFbHpDYnRvWkRzcXQ2QnhORllDTk5udDlVeURJ?=
 =?utf-8?B?em1wSXE3Y1NZUDBwLytlVnUwWUJWbjlscmxHTWMvNE1hQStWVHIwM3lXNWFE?=
 =?utf-8?B?Ukxqbi9aS3psTXJuM1V1di93b05iQ1JDcTVsMXBlME84SUlpbTQvR1Q5SEJt?=
 =?utf-8?B?WnRyTWVLZUVQK2k2ZjdQV3FGd3VIdU42WERNVTdrQmY1K3k5Tld0a25lbG12?=
 =?utf-8?B?ZVlMdmt3MDZXSklOZ3NZalpYV0dCZUVMV0NGNS83RzZyYzdvVDFZTkxIdUJJ?=
 =?utf-8?B?N3dhTjNWemp0RlVTNE1MYjZ5cFg0bUYwRFhJbWVicUpBRzhpMUNjYkxvMStz?=
 =?utf-8?B?cWx2b1NraUhGMEVzQk9EaGhodGZFQ3JVVnJqdHBZVnJRaEtIQ2lJY1ZqMFdE?=
 =?utf-8?B?MWpHVTZSTyt5cU00M1Y1Yys2dU9PSjNaSHoxZGp5RzVuZmIwV3hraURnNVZp?=
 =?utf-8?B?VFhiMzV6Ujg4NjRqejdjV01VcVkrbk9kaTVCQTdBQ2w1TVh3bTc4VXhVTUZ0?=
 =?utf-8?B?VU9sSnBtRmFXQXlMcVZZYXJOZzRMMWhVamhGdXc3K2FoU1lQTzdDR3QzRWhN?=
 =?utf-8?B?USt4cUhlTTZMTmZ1elRWL0JPK3JkZEtoYlVlbDBnWXNFR0tPQ25WZUh6Mllt?=
 =?utf-8?B?S3Z5U2dxMDJQRDZRVittbVp4M2MxNUY3ZDUrUzJWR1BwSDdQRXRDUGRUYUpt?=
 =?utf-8?B?Qnk1UWtMazl2L09iT0FNVnVCS2l6WVR4NGVaK0htdFJUTS9vRDM4Z2VzQXFI?=
 =?utf-8?B?Z2pYK2xkS1BaMkR5ZHRycC9aQUF1bkQ0YTdsTE51QkJvdUdzb3dQVGhTVkN4?=
 =?utf-8?B?SzhZT2xpV0MyYlVXZjNDb3U5bEZQUnE0TlF2d0tjdFpuNHRCejJmcXZoUlNi?=
 =?utf-8?B?VDJXaEdWYlBVVWJ6UGx2bS9HQjJJSDRBS3dBN0MvdGczZTBPNjBSd25BakNx?=
 =?utf-8?B?aGF6Vy95a21vazQ5UlhBZGt5VUEzdStaVWZabXFVaW1oRGs5WU1qNS9EK0Fn?=
 =?utf-8?B?T3I5Y05rQzA5aTNvS014Z2xJNW1KUU15NnNicFlWNTZEVFRScHdtY3JXakND?=
 =?utf-8?B?M093dTBrMkdrTWMrcGtpSWlHZkNLZnNLSTFoOXFoNzNRd3ZLU2xqRmFMdTZU?=
 =?utf-8?B?UUNrWnZHTzEyMUFsQjI3c2xBMHcydXB0NFdFdW5xM0hWZ0h6TGo2aEgzQUJ4?=
 =?utf-8?B?Z1ZYZHVSRDB2amR0bUxTWERpcWFqS29KcGQ5UUJkQWFZeWVBV0pkODc4dG1r?=
 =?utf-8?B?UG1rb1ZERi9rQUk1ZXpUbXlZY0JIbXBLVUtDZVdtWUxxS2wvWFpYZUxxeVFT?=
 =?utf-8?B?dHl2dlBmNDNUQU9GaXBJRGhFcGVRU29qN3FnbnNXa2N4cDZGdlJzS2xjTXNa?=
 =?utf-8?B?WGFidkFIYy9hbUhNRFNuWis4MmxUaVZUdEtwbGQxNHV2S0p3d1V1YzNiQnFW?=
 =?utf-8?B?eGVLK0lNN2tSYW93Yit4TVd0RjJrazhNdWRBZlBvdDVIcmFxZ0xHMUJZNkNt?=
 =?utf-8?B?Q3duUU5ob08zaGE0VXFtcHZ3eWZ2RldLbW4yWTZDb2lKbmZuTVBSN1VJdWVU?=
 =?utf-8?Q?CFJz6hrW1gL/lk84j4lQgaM18?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0d1694-ea1e-4fc3-f82f-08db35451953
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 19:45:09.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+cvM+M2ETiTE95NabgENrNyX8BSJWm9DQxtU2GkDxwNTpMTMJujIJKTv8CMt9p7jhq3fxGaeNhw9HMC1Nuwig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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
Cc: Stuart Summers <stuart.summers@intel.com>, Vivi@freedesktop.org, "Chang,
 Bruce" <yu.bruce.chang@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 11:48:39AM -0700, Lucas De Marchi wrote:
> On Mon, Apr 03, 2023 at 10:20:31PM +0000, Chang, Bruce wrote:
> > Currently, unload pvc driver will generate a null dereference
> > and the call stack is as below.
> > 
> > [ 4850.618000] Call Trace:
> > [ 4850.620740]  <TASK>
> > [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
> > [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
> > [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
> > [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
> > [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
> > [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
> > [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
> > [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
> > [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
> > [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
> > [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
> > 
> > There are a couple issues, but the main one is due to TTM has only
> > one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
> > 1 TTM_PL_TT each tile. The second will overwrite the first one.
> > 
> > During unload time, the first tile will reset the TTM_PL_TT manger
> > and when the second tile is trying to free Bo and it will generate
> > the null reference since the TTM manage is already got reset to 0.
> > 
> > The fix is to use one global TTM_PL_TT manager.
> > 
> > v2: make gtt mgr global and change the name to sys_mgr
> > 
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile                   |  2 +-
> > drivers/gpu/drm/xe/xe_device.c                |  2 +
> > drivers/gpu/drm/xe/xe_device.h                |  1 +
> > drivers/gpu/drm/xe/xe_device_types.h          |  2 +
> > drivers/gpu/drm/xe/xe_gt.c                    | 18 -----
> > drivers/gpu/drm/xe/xe_gt_types.h              |  2 -
> > drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h           | 16 -----
> > drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h     | 18 -----
> > .../xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} | 67 +++++++------------
> > 9 files changed, 31 insertions(+), 97 deletions(-)
> > delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> > delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> > rename drivers/gpu/drm/xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} (52%)
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 669c7b6f552c..7e19a15af3dc 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -83,7 +83,7 @@ xe-y += xe_bb.o \
> > 	xe_step.o \
> > 	xe_sync.o \
> > 	xe_trace.o \
> > -	xe_ttm_gtt_mgr.o \
> > +	xe_ttm_sys_mgr.o \
> > 	xe_ttm_stolen_mgr.o \
> > 	xe_ttm_vram_mgr.o \
> > 	xe_tuning.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index a79f934e3d2d..4fb9aff27686 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -279,6 +279,8 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		goto err_irq_shutdown;
> > 
> > +	xe_ttm_sys_mgr_init(xe);
> > +
> > 	for_each_gt(gt, xe, id) {
> > 		err = xe_gt_init_noalloc(gt);
> > 		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index d277f8985f7b..d9d1b09a8e38 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
> > }
> > 
> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> > +int xe_ttm_sys_mgr_init(struct xe_device *xe);
> 
>   CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
> ../drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:99:5: error: no previous prototype for ‘xe_ttm_sys_mgr_init’ [-Werror=missing-prototypes]
>    99 | int xe_ttm_sys_mgr_init(struct xe_device *xe)
>       |     ^~~~~~~~~~~~~~~~~~~
> 

that's awkward... I didn't get issue here, not CI got it...

> 
> couple of issues:
> 
> 1) you moved the implementation to a new file and didn't include
> xe_device.h, creating the build issue above

I was wondering about gcc version, but this wouldn't be magic in older gcc...

> 2) The decl shouldn't be here though. You need a xe_ttm_sys_mgr.h, just
> like we have xe_ttm_stolen_mgr.h, xe_ttm_vram_mgr.h, xe_ttm_vram_mgr_types.h

yeap, that sounds the way to go...

> 
> Lucas De Marchi
