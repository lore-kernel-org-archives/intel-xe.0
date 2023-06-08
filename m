Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3146BC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 09:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BA210E0A8;
	Thu,  8 Jun 2023 09:10:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716310E0A8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686215447; x=1717751447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E3f/oGOAPyi1MZTgJKSoINvbUjbcGfwMF4oqn4uJtrk=;
 b=ZzZIFzNhorhNaA7VGUbgGhjrnS5X8CzumRUNa8CG5OzHjv0jxTmWqFum
 xrSCWoXLQSLkvPsnB7GbG2Lfsun0S6sIK2KyQVtvYtUFmAsPf8W8i1n6Y
 z/Pp4KpZbpk3BODC5bxlJbDPQQtUIvgXJy4/MeiI0oojLcRcj3ioa0Qpi
 wbZ6cQCKOzXW+Vxo5sHBYWDQwCTfo+rquMMedmBGMiIonBgfAjTDHa3Rr
 k29wsOHu18Wz4lNwaQh6ZR+bTFuhe+/BlNCTnQdyDnCTEB/Tp51+VpRGi
 UedRthSP9maFB7UgUtCKjG6ym7jGwhW7iWZZ09KsnSYVwj2t4/m6hbkn1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420821586"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="420821586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709914683"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="709914683"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 02:09:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 02:09:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 02:09:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 02:09:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 02:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1+CWCZdNk+MhGvkpEo8Y4DY/XpyZBFMcRxP23+oGl4pOW3ENArSIvwc8C3jBb/ZMOJrpoO5kwM77LIc9oCFDnmoEM/W10VGeWuorhV9pSaehYCyp75XtmSPnGEGCyXbeB1xbeOH1Irj4YOvtFKpcWq68OOu7T9C/2xuW1ts0kQ/yDvfJhNAxoVuoJ8Wg22jZGPDYOOZLI9hHcxwo4cNmN6v8+HL6eR3aqkuHlcHm4kEa0774dAJgJMkOwZW/CTB08EGmUF/IpuD2nyJcUPfftQLkcl8S3iJUDJqNB6UTRNpfuNp5p5r4QMaIepx2xHDQySd8gZQFDjsI/kaRovZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQjpB93oJzXvqr8HIUmbqDAtTuTaDOXRSLCJy2Fu1WI=;
 b=htNPY9WzfC+y70rpjgwkiljfDRIquSzkZcMwmtmv7Mcw8rLdLDvTd8iih/Re97vnTszrgdpbcB9beO6d9DQMUf3j5wSCwQnwaebcWKUvGeDu0P8J9ZyUO5qtJHacXWZzCFv2NuNEtppu0GQzo35uyotmbNH/jZi0TyGcMlQ+ft3ja6pgB0eKoLJRzGrn/qoconiFurGBKE4woiFRlU7JSvF/TrTNSuo4LsmQM74ujFu/F6Hponl0ilrc0/QDiQo1ZXVf2IuxqQHECjFT0uORPj0PD0Hw+KU1ZjZUNjP8wxuEqHexqAk77jMdvwgTs7ElA963lHGwphuMtKt2JXmE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 09:09:20 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 09:09:19 +0000
Message-ID: <f239c7c9-0e93-c7ec-d6c2-c23f782fe62b@intel.com>
Date: Thu, 8 Jun 2023 14:39:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: <janga.rahul.kumar@intel.com>, <intel-xe@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
References: <20230608085504.1002259-1-janga.rahul.kumar@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230608085504.1002259-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::14) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ee1329-3f9b-4175-cf0b-08db68000a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGV3KKpTzD516e53y4WDw6dQj5MdXH9QZ00lhGp6tcBtnFWq0I7KytFrEyGf9rdThivg5rYg3YaXmHq1YuWMC3qpCMrj5w7CkC+eBJP8uuNtAzzY1DfMBI45nE7LoWAaxcwk1GsM02axHaUtRVqWJYM0FAL6udOMUHLD9jQXULbqMrm9+aJE/+V9AJspx1fq8qGTDZnvFkoaCZyRZqhTVkZow26iNeGKxrEVrOIZEh7NLfuUNONRlLLjQZS7tn3cXkJ9GHykrQBu3k3Jj4qy8uSFC53fHOYPmWpsE6KESKpP5WHLbR+M7Dn+qhV+iGwxX+KUeXNKTIhfskBDMvWizO9iP+BdbTvd6wqQuGJ8+Th3ZLTOFayExnapiKBC33qo+vWEsBbQWfmljC5vSit8mpC/dQJW6iDqU4loK4HlTgLblWxnw1GOAXiu1RqTh+xo/jKRXCtmTV4mYjHviMqs8p/2MUpV71TZWmdnO4gi+9BTkCgKsDw0kT+BLwUONZ8dUgt4PzgyPfwtPdOa7DwSWAMl7S8xUr0909oVgd5AcbmCKFfeQ+E1rcbY4tSLn27s59pQDN/QZHwF4O9o89+qhQyyC9on1VXMld4AM9FS8tpD+6PPFSNVMADDTIilO4NqT0wdMcspHmI8PSPeF+aXoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199021)(41300700001)(31686004)(6666004)(36756003)(8936002)(8676002)(5660300002)(6636002)(66946007)(4326008)(66476007)(66556008)(316002)(478600001)(2906002)(38100700002)(6486002)(107886003)(31696002)(6506007)(26005)(186003)(6512007)(83380400001)(2616005)(86362001)(53546011)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpwYTRQOXlFRkxqVEZpcnk0YWQrWHlQakNwQVdPbFRLcitFZEJURnNoS0ZG?=
 =?utf-8?B?bzZYWUR1YVFjTmwwby9wSUw2SXp5M1kxajJzT09TRFFXOGhYU3pIQ2pHRHdI?=
 =?utf-8?B?U0JGMGRWSjY4T3ZSS0JaR0JLSEhZMGx6M0p3SnZ4KzJURncvUnpubHZtT1hk?=
 =?utf-8?B?M2JNWDZKV0p5MFdSRkhHdWVBUGpTYm04M0gxb21QenFXRU1aMUpTL29MS3VF?=
 =?utf-8?B?ZWZsdWdvRmhPbjdRNnM0TjhuaTVwSU0vVjRtbmpBUm5uOFZBdlZjL1pFV0Nu?=
 =?utf-8?B?LzVPWHo5T0VQTVJDL3RDNlEzbGpkT0xkeUZEb3R5a1RVMDUrK0d3Z0RVRmo4?=
 =?utf-8?B?L0JCMCt0SElFMTJHRWFhUXBSbXhZZjlQNHN5NUo5QXVSd3FvNlc1QlM2STFs?=
 =?utf-8?B?UHltSkczWG9UTEk3UzZ2bmtLRk5UK041eHAwSEN2a3g3b01hWnpvL3FhMkcy?=
 =?utf-8?B?NFNrVXh0emNEOEh2SUdieENia1JWR1g2YWFQUjNiVWczTGxzM3RZc2JlWmQw?=
 =?utf-8?B?N2xTdDgyeUU4UDcvSFY3OGFyR016MldWblBYbG9FS3piWUg4QUV4MHQyRGpC?=
 =?utf-8?B?dzV3YjlKOHh0SThydFVQSTZ4SmJNRUYxanpZZTJrQ0F3eXgzSWhQRnc5Smkv?=
 =?utf-8?B?dkpuVEVsSUl1V1B0SW1mN1kwYk8xTGpiYkV1MTloQ3JoT3lKTjdkYndRd0NZ?=
 =?utf-8?B?T2FaTkMvNnZBeUdZbksra1pCcERsVDFWUFpsWFZWZ25vVEhaYUFtcFh3M0xC?=
 =?utf-8?B?MVU1Z0ZnZC8yOVZtZ09JYXlGUVE1U3prUU1oYlBYbG9XT0lyNUdPSlhsSHdX?=
 =?utf-8?B?RE1XbXcrVW9ndmJUeE9HZjJHMHRTbWNzRGdyRjNJY296L3pKajBDVGJtQ0dC?=
 =?utf-8?B?WVBZYU5HREpkLzZ1Y2pGcHBaMG1qZG5obFNwemhUUHdqY1hYb2NmV25NZnZE?=
 =?utf-8?B?VlkzbE9PaUI4cWNVUkY1Z3BMZnJhTlBQT24vc1h3SXJoMDA2WFgyWDNiOXlR?=
 =?utf-8?B?WnZhT0h2bE9rWE9RbWdxVVZOeTlyRUpMa2pVc2R0WWJ1Qi8yd3M1c1NLdGkw?=
 =?utf-8?B?ejF6T0lUN1hncGlIVWpITlAwd1JhTWlHa2NvaXcwNEtCeW9aMWcwTFVKUm1K?=
 =?utf-8?B?TGhiUFpEU3B3SWwxL0dVYXdhcHBQTkRwUCs3UHhvYnR0MU9CSUFmMzFRVjRa?=
 =?utf-8?B?RXlYdUJ3eTJ2MktqQlR0THVNVnB4V0pmaXlmTDB4bThhdDJ5TnM0Q2MvNFFs?=
 =?utf-8?B?ZW82eU4yaGlWZ1VnbXoyTzd4RzhWSnBVTHlRdnU3dWJqSGd3OC9qN0x6WkVa?=
 =?utf-8?B?Y1JrODY2K0puV05kdGVXRWp3d1ZDS0pVTk1ONUJ1dUQzUC90WTgzazFtNkVs?=
 =?utf-8?B?UHRkRWZrb2F6Q3QxNVR6R0I4aTN4T3JaU3o5Z1hnN2JiSEx6NXpDY0pIYktx?=
 =?utf-8?B?RGloZFkxOVgwT0pXUncwL1hrbDRpd1doTFJVb210Mi9xblN0NElzN0JrRkMw?=
 =?utf-8?B?cXRqVEVPR1o0UTZXWldiNEdaZ0t0akxtTXBkc05GMk5KS083OWo1anpvOVFv?=
 =?utf-8?B?QkFWMG96dnhlV2pIQlJZNFhRZVVSc0hrWDZkUm56eFlGUG5KY3BkK28rVmNV?=
 =?utf-8?B?cUt0UFdQR0NWR3hNaktrclVZMmxFMWwwQ09jZXE1VStNRHJ2RUtwbExVQVo3?=
 =?utf-8?B?SW5VSFZ3Slc5dUlnSU1CRmlpeUJYcUxIOG1ObmEySnMwMGdodm9aUFFHOU1z?=
 =?utf-8?B?NVJaa2RzL0YrSW1GR3NZZ2p1cHVaOUM5c2g0eEVIMjVic0ZnR3l5YUdzcTR1?=
 =?utf-8?B?dU5lZGpHN3pCZXptNTk1OEd5aXkrMllLM0N3OXpvRko2enVUbDRIa3g3QXRP?=
 =?utf-8?B?UXVlUStFejlnK204dVZwaU93OTNiUUNNNFQwSnJQZlJXM2VVd3VYQ2RPWEV3?=
 =?utf-8?B?RzNjK2w0NFl3QnR3aUpvcStJOFFMb1RmMlBMRjlvd004d01sNFNzbVZYeEcy?=
 =?utf-8?B?YjNKaXNsWWQxbkVEWlhscVROUkNENy9DbjFXZnV5SDI2ZHZFcWpKV0VReXRk?=
 =?utf-8?B?RytCTVVCNTRVTFV5bGFPaHFDZDFkQXBST2dkRU9IWG9pOGVCQUU5MmRZSno1?=
 =?utf-8?B?VGpvWEpsNGJHZXRTeURIL3lLLzJHZXJaSVBwb00yYTd4anJ0NWliV2dzUjl0?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ee1329-3f9b-4175-cf0b-08db68000a6d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 09:09:19.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLwqv1ht6MkOO89z3OlrVUqr8+QPBToDf2nyyVWH+aSDk4TJ0S5d7kUuhekO543NPQ+/vueOFxoTgpdzTjUhD/pwZyfYtPURjbx9XdkKglo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/Xe: Use ENOTSUP instead of ENOTSUPP
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



On 08-06-2023 14:25, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> ENOTSUPP is not a standard Unix error use ENOTSUP instead.
> 
> v2: Update commit description (Aravind)
>     Use ENOTSUP instead of EOPNOTSUPP as EOPNOTSUPP
>     is recommended for socket. (Himal)
> 
> Sample checkpatch warning:
> WARNING: ENOTSUPP is not a SUSV4 error code
> +                return -ENOTSUPP;

did the kernel compile fine as there is no ENOTSUP defined in kernel,
you should use EOPNOTSUPP, please check.

Thanks,
Aravind.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c          | 2 +-
>  drivers/gpu/drm/xe/xe_mmio.c            | 4 ++--
>  drivers/gpu/drm/xe/xe_sync.c            | 6 +++---
>  drivers/gpu/drm/xe/xe_vm.c              | 8 ++++----
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 094ec17d3004..6c3e2840d1c1 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -609,7 +609,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  
>  	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
>  			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
> -		err = -ENOTSUPP;
> +		err = -ENOTSUP;
>  		goto put_engine;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c7fbb1cc1f64..54400147e7df 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -461,7 +461,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  			fallthrough;
>  		case DRM_XE_MMIO_8BIT: /* TODO */
>  		case DRM_XE_MMIO_16BIT: /* TODO */
> -			ret = -ENOTSUPP;
> +			ret = -ENOTSUP;
>  			goto exit;
>  		}
>  	}
> @@ -479,7 +479,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  			fallthrough;
>  		case DRM_XE_MMIO_8BIT: /* TODO */
>  		case DRM_XE_MMIO_16BIT: /* TODO */
> -			ret = -ENOTSUPP;
> +			ret = -ENOTSUP;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..7969e6057d23 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -116,7 +116,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>  	case DRM_XE_SYNC_SYNCOBJ:
>  		if (XE_IOCTL_ERR(xe, no_dma_fences))
> -			return -ENOTSUPP;
> +			return -ENOTSUP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
>  			return -EINVAL;
> @@ -134,7 +134,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
>  		if (XE_IOCTL_ERR(xe, no_dma_fences))
> -			return -ENOTSUPP;
> +			return -ENOTSUP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
>  			return -EINVAL;
> @@ -169,7 +169,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  	case DRM_XE_SYNC_USER_FENCE:
>  		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> -			return -ENOTSUPP;
> +			return -ENOTSUP;
>  
>  		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
>  			return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0a4becdf4675..b1e3d8d26e46 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1764,10 +1764,10 @@ static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> -		return -ENOTSUPP;
> +		return -ENOTSUP;
>  
>  	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
> -		return -ENOTSUPP;
> +		return -ENOTSUP;
>  
>  	vm->async_ops.error_capture.mm = current->mm;
>  	vm->async_ops.error_capture.addr = value;
> @@ -3033,7 +3033,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
>  		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> -			err = -ENOTSUPP;
> +			err = -ENOTSUP;
>  		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
>  			err = EINVAL;
>  		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
> @@ -3058,7 +3058,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
>  			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
> -		err = -ENOTSUPP;
> +		err = -ENOTSUP;
>  		goto put_engine;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 15c2e5aa08d2..752b094848d5 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -142,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  
>  		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
>  			xe_vm_put(vm);
> -			return -ENOTSUPP;
> +			return -ENOTSUP;
>  		}
>  
>  		addr = vm->async_ops.error_capture.addr;
