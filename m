Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B754DC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB4289208;
	Thu, 14 Dec 2023 22:07:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A489208
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591641; x=1734127641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KEieEtyx53RvSIUKmlCkQBTLVOZErkvONrOHHpraQZI=;
 b=KTdDe9J7UlgmzNv1wVlvzukf+FZhULihpeL0QVhaujANjfDiVIGZV9T9
 AhURLOM1qoZSBAQ4Uc6tnwiv2v6PCX840PkZcxIg+L4Z6mB9KKuHRhMMl
 dCLoo5pnhiRqihPrXAKsCa4Dy9YSAyAwDPrJrqw1f8L6uqFJ1bEV8vvC7
 2pK0H9vGUbVzMEBCZa4ykDB8HB0mHhc12rYS6/4VIgItEKlTLzMcrEgfg
 +ARN3wRsGOajmsxLwJEhBR5CvF8hFE6K0xIwh+7Lu4zv8SBhu/o5jhXSB
 2RgPzDBxVpxRJ+W5nOyw7U3aPhI0ybDxSx9IzftK1cYwyQQ0XkZl/Mw4s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461657119"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="461657119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778046283"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="778046283"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:07:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:07:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:07:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:07:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU67fYasNt+1rkOO6YluNadFNTrwdDKb0rhDEyhUa/e1Uu2heGNLMTd+JVddER1ZwOGppV/l9MFnSjBbo/s1ECXwnMkQ+ChmMtgQCEYNAhuSzQnqSxtK/vvCpW5ltuyf8ykw4CHAAafV4CELUS0SjPs3aBtrFhU3/xaBk5YMVxsBpY65MwHtDbdhgq0vfNea5R3GDCXDSFwXgGaSDNxTltW8Z/YFIge+zHEPYH9h23+RIKtooYspAGdKHNTrjWvWYFyI7KZLOzYhDDdBdxoj9Q4BHVJ5nRkejxjpmcZPcnSMK/0nylNwT1n87wZf92A51YbgTwq/9qOHcobcJlarRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nd/ca27/UJJP9jlvPrkFag8F0P5dK4+PRQW0LDlBe0=;
 b=XhEKcJtMfM0a4aq4v0gN/87DQ1fAS8ni+iUZISS1Tvf8Id2nS/00hhcLmKvLPBsmQ0FC2s4vVwWR4IhfZe45WE97vbP28nPgLrir11ZFLy+/IUJtcE1Ie/4h8bbrs39lq2U/tGlOybqL7iumcVM5FXZs5fyli1nJAKnMsYsiRQgUzjRon7qhDrerMcAi9lFNpxE7kSXYIf5OGwzZnmoiOkEBomDQSSyjMhvgTF83Sfdb8uiRoVTPbqHYcxSB9DjqQhtt1USWYMEyXN5Jvb7yEMqV+eY3mzUT9zgtLun5IEvByTs3SfCjQr+PavlUoUwjgx93cLrx7JG148WZWBq5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:07:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:07:11 +0000
Date: Thu, 14 Dec 2023 23:07:04 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [Intel-xe] [PATCH v1 06/12] drm/xe: Rename
 XE_RESET_FAILED_UEVENT to XE_RESET_REQUIRED_UEVENT.
Message-ID: <ZXt8iDrqOsNxYzTD@fdugast-desk.home>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
 <20231020045533.1425375-7-himal.prasad.ghimiray@intel.com>
 <5361d832-4cd4-46aa-a7db-d79fefb484cd@intel.com>
 <MW4PR11MB7056305C687566443052B8E2B3DAA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB7056305C687566443052B8E2B3DAA@MW4PR11MB7056.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e6c795-c116-40d0-1ccd-08dbfcf10535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItVhy7owfVtlk8ex8AE6YpWA17ZYCLnGJHOtTZiFLDbqc97SbtKMC6awSG7Ehkci7j30bQEBAzx/gp6LZygYhOwDpWe3S6aqradjW+gyG2Zjmi7RNpbnwdOy2OQfAnCh9B3Wyu4bAmrQjCZt0nLH0NH3g4PABfMqvq57YwDQ9TRtQV6+bUhY3ObxlDxkPTE5BL6YtARjv94xJ4nEP958zAcLeqRXiAAKAn6HYtoNHcSEcM0FREaNc6Ad9+4Wmx91jInpOi2JQF+gsmdCNMX+WO8hmjPYbbZl06+5jP/E4PYQVeYYmgJxWImkcnL+vO6sqZVREisthqXiiszlbDww8J0UHKQUAG2sF87pq1Nb6VHoDRzxUxg136jfJW7JdFyyjsGF8hdbKTIsUfSSfpoQOAaV6wzXLNaXNia1e84pjIgRt+E7GYhmlNX7comvG3VVyOKlkzF9IGL8Ts39TaJ17GWLAhAm50jPTUQ2spqAyiBMcsHB4frAVzJK7BKCoVCPvQMvhtnyjsFUX8nZRGMGHR0ttJja5pcpEI7kR5mdKmbXdgkj7H7ev6BAQqODlf/f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(4326008)(2906002)(6862004)(8676002)(8936002)(44832011)(5660300002)(41300700001)(36756003)(53546011)(6506007)(6666004)(36916002)(9686003)(26005)(6512007)(478600001)(83380400001)(6486002)(38100700002)(107886003)(66946007)(316002)(6636002)(54906003)(66476007)(66556008)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJJUUpsMmdKZk1yWnpkZGdBaGNVN1dwWWlFZExrbGdBZzN5TW15c1p6T1ZO?=
 =?utf-8?B?Y3lublFRSlIyR3VGOTA1aG1zd0oxaGpJMXhvTERPVllCUFBQZWU2Rm93NW1o?=
 =?utf-8?B?U2xFZXRPeVNOeGlFWllzaWxDK2xxRHNWZVp5OFREemJhc1R5MmNtbnQrVnhm?=
 =?utf-8?B?Nm9pY0NqVTViNHB3MllEeVpOVGtJVG9aL2Z5bzVRSTFUQmtjeXV4OElOS2d4?=
 =?utf-8?B?dnZKbVNrVDB5N284c0ZYMVFPYXRGa1FEWkdOOUMxckRkQy9OaGkrYTRZY0V0?=
 =?utf-8?B?dkIwNlFKaHFVcndOU2I0UEk0bXI5SnVYc2dwdis5Y3pPb1hlTTFQMVFna1g1?=
 =?utf-8?B?d1RWNElvNjhpZDVqdGNZRkgxUjBuQkRXNjM3YW1UUTc4K2hwWlpLNHk2b2N6?=
 =?utf-8?B?ZFczSGJMaXJRaXFnbE9hdmVyR1RWMXRqWUJiM1R6c0drU2ZVU0JPMWxJNGo2?=
 =?utf-8?B?YVJyT05DU2RyOTlBZTM5bjhGc1UvdGx5ZUE0ek1ZRnJrcXdQU0Q0UGtGSGdB?=
 =?utf-8?B?SUZVM2lTc3krNEdkSUV4OEIvS21YYmdaQWxzcVRyb0pwbG9oWXF6a295U3Vl?=
 =?utf-8?B?R3Q3OHp5Y2lWeFhjL3kyN0lTNHF3TzN1L0YwUzdnbGgvQjV1dkZFeWdEMUNx?=
 =?utf-8?B?V2JYRUx1SHNmamhTSVkwTFFON04rM25ua2NDb0xNRW1YaVk5Qy80bW1TSjRq?=
 =?utf-8?B?WEpUcnFDazYvWkorTEZybnBYbzhYUW5jMWlEU0RIY1lCMmd4bEZyQmZhZGRK?=
 =?utf-8?B?dWpBU0F6Wjdia21iU3pocjZyb2ptajlSZ0ZESURWZWhHL0F3eG9TTER0VHVU?=
 =?utf-8?B?bE1ZN0xXWlZ6djl5d3BmR29ZSVEvYnd6T1UyenA0YkFQdUlaNlg5WFRBK2pl?=
 =?utf-8?B?ckVRSFZpOUFxYnVLelIwQjFwQnhOeXRCbWkrQjdCQjh5NkpiclE3WG9KV2F0?=
 =?utf-8?B?dXJhY29RdFFleExlK3hGU1hTK2xhQ245SEwraXdvaURrRXdNdndwOVBHZE9U?=
 =?utf-8?B?QjJTcDc1bUdGZFpzODhldzNNUG9LLzlPajZHNmlTd0VDRUNjNWdhNG1KK0tt?=
 =?utf-8?B?OVIrOENOVjZQSktEZy8wa1ZjbFpxeDFaU2hGeHc2dFZIWnc2VFpYL0IwbVdw?=
 =?utf-8?B?SzdBaFlRRmN2NDNnTG5LOHpwVDBPTEhzb2NzbHdwN0FsWEpqWVRvc1dyMGxr?=
 =?utf-8?B?MDBBcCtCdjR3NXZONmxnbkI0eHBGditnQnFPbTg2MGQ5V1Z6UzFVYjRjZW0x?=
 =?utf-8?B?bjIwdHYyYzJmTmZnZEY3WGsrMjRUVWJDME5UbWN5eHNwK2VxTWlZVmg3ck5B?=
 =?utf-8?B?ZFROLzUvN25Oc2pQdnJSVERBY1RVbC9CUDdsN3lTOVFlNlA5Sy9NeWEvQUxN?=
 =?utf-8?B?dWRnT2JzZWo5aklaRytNL2FFeDU1N3lPRUorZWRxc0syT3ZHRUY5UE5wR3ZW?=
 =?utf-8?B?UTZBOC93cjY4WWhzMGdoYmdaU0dxRkRIV3hoVUh0bW9IU3RSWU93YlYxTCtY?=
 =?utf-8?B?N0Z1RFF0MlA0Zm9hMlY5c1pMeXoyejBqcmNIT1BINlB2clFiSDVsYldQcGhv?=
 =?utf-8?B?T0wxVDUzWHRCVlBScmh2OHExV3liWDRGVlpsZ3A1WHlrMUxaUHdGVk82V0N1?=
 =?utf-8?B?a25WVTFFdUgzN056QW1kRmYrSVR3RlVIMlpEVUlhNWhMR2E1YWJLZVVSUHp5?=
 =?utf-8?B?RlZPRDJKYVV5am1ZdEdER1B3Sy9nWnZvaW5SR0M2U29WUmI0Q09IU0VpRG8x?=
 =?utf-8?B?K3oxMGc4aWNRWGlKYkNyRVZ6NG9yZlM2ejdVYThKTXhoYzVJalA3QklWVDcr?=
 =?utf-8?B?NzgvQmpGeGY0WHFxM1dMRkhLc1RVeVJEcSs1c0RJZURpbHpPRXErWkIwck5o?=
 =?utf-8?B?TWNmUGprOWx0VStYQXRYN0JjcTd3WXRRSThMYlpyeFY1L3JNbDJlZnFIOEtU?=
 =?utf-8?B?MXUxeHRFWUdEVWpsSUtDOU1saUlDaE11Wmp2T285MmUrRHRiMGNrKzlIUnJB?=
 =?utf-8?B?UWtrT0FpTzllTEtIQUNtbTJ3K214RVd1VXVna0h3WTJFRU9oMXp6dEVlb0U1?=
 =?utf-8?B?Vmp3WXlMSGFtNm9IR1psT1M3cUIwR2dmUVNvdTFyeEQ5SW5vQlhFWS9zYXVk?=
 =?utf-8?B?ZHg3Q0lEVFZubDlDU1lNdnNyd0dRYUtpZzVJK0R0UEVvVW84TEpWV3I3SXdH?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e6c795-c116-40d0-1ccd-08dbfcf10535
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:07:11.2541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2PIwmZ7/FDZCzw1sil9dvYvWnBIm1EO5W95ydCfBND4Y0yeR+33G8TBSCmmYpqdjnauActird7CTkER5KHHVEYv1WYWFleNNkcxekFpbFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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
Cc: lucas.demarchi@intel.com,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Oct 21, 2023 at 11:22:31AM +0000, Ghimiray, Himal Prasad wrote:
> 
> 
> ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> From: Welty, Brian <brian.welty@intel.com>
> Sent: Saturday, October 21, 2023 12:17:01 am
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Subject: Re: [PATCH v1 06/12] drm/xe: Rename XE_RESET_FAILED_UEVENT to
> XE_RESET_REQUIRED_UEVENT.
> 
> 
> 
> On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:
> > DEVICE_STATUS=NEEDS_RESET will be used for other reasons apart from
> > gt reset failure. Hence use more generic uevent name and provide reason
> > for reset along with the uevent.
> 
> Looks good to me.
> Reviewed-by: Brian Welty <brian.welty@intel.com>
> 
> But as I mention in other email, this looks unsafe if 2 GT resets are
> happening (and fail) concurrently.  uevent will be overwritten/corrupted.
> But can fix separate from this patch.
> 
> Hi Brian,
> 
> Thanks for the review and input. 
> Will work on the input in separate patch.
> 
> BR
> Himal Ghimiray 

Hi,

This patch modifies the uAPI, which we are trying to cleanup and finalize. What is the plan
for this series? Would it be possible to extract a minimal patch with the uAPI change only?

Thanks,
Francois

> 
> >
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c | 13 +++++++------
> >   include/uapi/drm/xe_drm.h  | 17 ++++++++++++-----
> >   2 files changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 74e1f47bd401..91e0a9a7f1cd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -545,16 +545,17 @@ static int do_gt_restart(struct xe_gt *gt)
> >  
> >   static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8
> gt_id)
> >   {
> > -     char *reset_event[4];
> > +     char *reset_event[5];
> >  
> > -     reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
> > -     reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
> > -     reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
> > -     reset_event[3] = NULL;
> > +     reset_event[0] = XE_RESET_REQUIRED_UEVENT;
> > +     reset_event[1] = XE_RESET_REQUIRED_UEVENT_REASON_GT;
> > +     reset_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
> > +     reset_event[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
> > +     reset_event[4] = NULL;
> >        kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
> >  
> > -     kfree(reset_event[1]);
> >        kfree(reset_event[2]);
> > +     kfree(reset_event[3]);
> >   }
> >  
> >   static int gt_reset(struct xe_gt *gt)
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 24bf8f0f52e8..ae1b1c7528d5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -19,12 +19,19 @@ extern "C" {
> >   /**
> >    * DOC: uevent generated by xe on it's pci node.
> >    *
> > - * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
> > - * fails. The value supplied with the event is always "NEEDS_RESET".
> > - * Additional information supplied is tile id and gt id of the gt unit for
> > - * which reset has failed.
> > + * XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
> > + * The REASON is provided along with the event for which reset is required.
> > + * On the basis of REASONS, additional information might be supplied.
> >    */
> > -#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> > +#define XE_RESET_REQUIRED_UEVENT        "DEVICE_STATUS=NEEDS_RESET"
> > +
> > +/**
> > + * XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to
> XE_RESET_REQUIRED_UEVENT
> > + * incase of gt reset failure. The additional information supplied is tile
> id and
> > + * gt id of the gt unit for which reset has failed.
> > + */
> > +#define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=GT_RESET_FAILED"
> > +
> >  
> >   /**
> >    * struct xe_user_extension - Base class for defining a chain of extensions
> 
