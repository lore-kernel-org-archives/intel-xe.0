Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA0C0032E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 17:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D913410E5DA;
	Fri, 20 Oct 2023 17:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1116910E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697821274; x=1729357274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A8tatcUsONh1WTgCZlVr2fjZcx4NMCtGdfABC1ta/So=;
 b=kMhmp5n0o3rwiiqHZmSfGuXRR+CmhD0hc9cO0+fdVWNW/SiwNHgAX2m5
 lTTgd0Veg/c04KQuSWGt/eDx7tPPpEJUUe7PD7eeeqrkSKSdHoNEikmdC
 FhFyM9ULGj6jm0FNjUK+H/+XHcV1cwL7M3UJ2wslAUviaS9snzu6gyJdo
 Ve93pcqZ72je8Yl0mLHQRlh8GY9x3O9jzGohJcCsnLqb1E2i6Svuv8kHA
 5sMKUog1r5LbwjP1Ld4HEvdSWAx3kVuDdNCgjrJewPxdUwq8/M25Lntd0
 VHub706TrYdAomaWJbXbsi8sXaqjI14rA7zShSi7ir6g3DtLZCS/vu0UO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366763198"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="366763198"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="792466102"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="792466102"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 10:01:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 10:01:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 10:01:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 10:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqgknLsGuJ+CFMclSap37zF8QXf0D0Da5TawA6v3MKOHANfyg4xn2V8zS2m9kARBGWFBG6m7I/7lxUm+ZrJ+zmxWQJsXWi3BsqhaXJIMdwqgNxWkPBboeQT2zCtEp1gq6lRtTbCfpIirZPnjpRi7qAlf0LkLW6RSHasjtvd6hCrjn8Y1RszCaHj/Zejvgg1T3+d8e9vHrio7vGMWkO8JWaetWqZn/iclM9TNIyMNc9PlZnlXNBkbBsVMOhFFXOyaBGM5xGW1/G/ebsef8ztBcgIhn0KbI66xxl1PYMAxL9Lx6Wm6UwwKfK8aqZb4WA1HySsfQliKkTqA6Ec4Giq7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlydfuVmLU6vpu9Hu2XCqEmTJKgAeAhu7QaJk5pBaAM=;
 b=YQxvkjiFok46j9ddxTmMv+RuMjh0xotfDXyrT/MOXPA3Y4xagyQe1S8JtfLkJQklSMStExjhNzOuVMOuTyl20+nSdUdhylZ/KCy4xTogo9YJHb+b5NXWOkw3dc6wADYBouCWxmU7rvMwfKrqrISDNzC1oBPLIYRvZhse1WDQmgTrwrzUNiUxVTcqC4dEGAMg9KGWYl/WC97aizFep6SMSxiCdBhdhnNi7aqsId5+LuKyaFh/Z32LP2LmsjrH9aAiyxlh10lR4kRLZSFQ5dGqTChV1tFnSfQ0Pt96pE0MoJVs5vgD/r96AzBzeqcu9mFsSxV3+yc25GcSsV1neJQFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Fri, 20 Oct 2023 17:00:36 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::9593:5db1:eb2:14ba]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::9593:5db1:eb2:14ba%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 17:00:36 +0000
Date: Fri, 20 Oct 2023 10:00:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ZTKyKoiWL8d6QJUF@unerlige-ril>
References: <20230919161049.2307855-18-ashutosh.dixit@intel.com>
 <d44874a2-6424-484d-b430-bea440ae85c2@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <d44874a2-6424-484d-b430-bea440ae85c2@intel.com>
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: fe147512-342b-482b-13b5-08dbd18e143b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXmdubPzQashdLYW+WSUSCGXnAp2uBcrYxc8aGPUDTqwZWVyS6StXVOB+oUflI5AH+XKm5K49nQwzuP5O46VeRE3e6paJUZQSzGDgji6oXI60i8Gjf7XxuZU/ENbhe5SYJE05af8I876zl8ho1jyQ+bJASq+MpaB9Jp6+Nf7o1CdVkO810B9egGkanu8zwj+HCuPEmKzrXviMucJEJQH7D7aMWwOJaA0crRmUyoB0pJKS/dXite/mI70RPCckujIgrPlMcqhBk0f6Gma4WUM5NmZNBuUKIrCJopV9K2id29WPqxNrqsb7YY4imSIA5QWDHQqD44L/lcdPXUFTBCu0azX/md2IKUNbIw6RRY+vf/0QViAWWgJnXAFnGloiMjwGUc6zMuxINHgjFlbkmT2DiW/We6kDte+pbEjf2H9ff3KNVqbcGiFfCInxIjiXkRrWrNzSpfUDh9b/zongNiTcTytTJs9PXJuoIMWz4DbhgUU7u56KgYZtzFWyy/+djViOdNx2wRjFuNSt/lRpwQxSX0IwvTFrIfy8nuBkZ5wKdEPVWZir8vKa7M1XQ2bkrCj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66946007)(66556008)(66476007)(316002)(6636002)(6486002)(478600001)(82960400001)(86362001)(5660300002)(8676002)(8936002)(4326008)(41300700001)(83380400001)(6666004)(6862004)(38100700002)(53546011)(2906002)(9686003)(6512007)(6506007)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjVMZXhreWFYV2N6ajI1UW50K1dqZ1FISEcwYTdNK2FGcWdBRTdTTk54TmRQ?=
 =?utf-8?B?NzI0Y1JzQldPN0RGYWV3aDZMTGNHT0NVZXJ2L2Q5M00xNDdEcUthczVRRWRw?=
 =?utf-8?B?N0pJVFU2QlNqZENFaFdpRkNEK0FuUVdvRGRjVmNxVlJERHZWSjdLaS9zaGwz?=
 =?utf-8?B?Q1dzZmxzVzJJWU0xNGVvOGpZcjNpTWVJdHNMbnFLVDNwb1N0WHZ2VEZrZ1Vh?=
 =?utf-8?B?QTFzdGJhODFNcG9hRzEvV2hpa0JnWXppNHNZRGIxRHdCSlpvWHNob0RCTWhn?=
 =?utf-8?B?aDBobTI5QkIrVnFYMEU0Mm8xL0Q4VER2SzJzWXRxNElSYkJtYTM4UEFTR3JE?=
 =?utf-8?B?eE5MUVdYelR3RVpObmhsbFhCYVBvUDNYODlDOGMvRkthQWpUanIxVm96L0ti?=
 =?utf-8?B?WkZPZnRNS2lwdWd4RXFHeng1YllnNDFQWUFXSkpvYzBoNlVQSzVLTHl2L2cz?=
 =?utf-8?B?UnNJeDFvaGtmOFBKM3FLVW5NaGhiUjIrcEhyOUlpaG1uTklLSGdDU0h0ZGxp?=
 =?utf-8?B?SE5iUVIzZ3lkMjA0SHBSb0xkMWlYZm5LSUhmcEl5OEZHcjVqbkpNcFM2cmc0?=
 =?utf-8?B?eVl1OW83aHhLZDhBeVpjd3o1ZmlheEZqUVJrYzg0MC9ybCtVbEJOUG9mbmZh?=
 =?utf-8?B?bStLaXdOTFlyN0taMk1XTEFPRDNTbnByYXRGc3RJZVI0bk1ZQ0lydzRsOGNw?=
 =?utf-8?B?RTFFbGVWT2hNMm1OOVQrZUdzSlNpNnFnTGNHeUZuWWpvanYzaWlZZlJicmo2?=
 =?utf-8?B?SjRLbWJ4TEZpbFloTkpkcTFnZGVtelU2TXRZb1UvK3U0NjdkYy81TjBVSW9T?=
 =?utf-8?B?ZzdtaHJHV2J5MUVGNGI3ZGV5RVVwRSs0b1NQOGZJTVJHNXhaN1ZsOUNnbVVY?=
 =?utf-8?B?UDZteVpkbTdVLzZXT1dIeWl3K3ZCZXhkY3U4WC9nN21ETWo0OWowTWY0NVJk?=
 =?utf-8?B?TUpZb0VaY3NIZFZjSUVqMXVIUmxJN3dlTEJVZlpVNC9SSjB3aVRreW9vSDNU?=
 =?utf-8?B?ajFva1h1RVpHZHo2VC9MRE9JMHlTK0dSTU1RbVFJbVZ4Vnpwc0NEY3FtNDRo?=
 =?utf-8?B?TEZRYmQ0RzA5WUVJWjNhOGdad2JMVDNXSkNueU54VWNSYlZYZUpqTXA2Njcy?=
 =?utf-8?B?S3hMc040SjMwMENOc3V4YmlSaHYwK3RkRmtVZjNEOURDMi9ZYXhCclBXR2Q5?=
 =?utf-8?B?c0NiK0xjR1llRmg0OUtaaVp3WXRUMjJDbUV1aW1XRkdpZFI3ZWd0U1M3cjFt?=
 =?utf-8?B?Q2dMOVh5ZXgxV2Zoc2dsNHE3RDZ4SUY2czNzcFZ0WkcrRndWN2RjMlJuUWYv?=
 =?utf-8?B?ZUxpOE1JSUg2Vlo2R2FwS2FXakViVUVJdktFV1djTzJUc1NZN0tNbjcxRjV6?=
 =?utf-8?B?RGViUEpoQVlZZGpZQVZjVmJvOVlsb0cvTXpNZytlakFuZjN2QldUNXFmTlgz?=
 =?utf-8?B?Nm9MQVYzZTc3S0RZL0s4N09kR0xRM1lRWTJNS0s5RzJkRklIbE9QSS9JNDE5?=
 =?utf-8?B?aDR2bVdpd05zNkMwU0ZxbGNhdDlmeVJRVVVmMHBMYkJPUDFKbkYvN0o5Y3lp?=
 =?utf-8?B?azVnVEhhZDNGdUkwazRYcVVnL0Vxc2ZHdUljbGdmZmtCYnJVL0hTbThrYWxI?=
 =?utf-8?B?Q0QyQnpNMmZtYWo2ak9BSTA4M1UrQ0FGck1XMGI2RytrUEdPTEVOcWVkclV3?=
 =?utf-8?B?U3JrcWN1Tkxjdkdnb0UxbjV2NlZ5L1FtdEJJM0s0Wld2MzdnaU9TQ2RQMVBk?=
 =?utf-8?B?T2Fpc1VaQy9sUjNTWVdFUmVaL3BoYy9vR2dhZnIvNVd1aEhHK3l4MCtHdWRQ?=
 =?utf-8?B?ckl3KzZDK2tsMHdMUE5xbFZyQ1RCSzhHdXVsZ2hveks3UDNOcjNyTHBzZ3VV?=
 =?utf-8?B?N3hRaGtyL0xJVWg4UGw0UDA1MXhrck5qWmZPU1hlblgwOWRIWXdLNGlISnc2?=
 =?utf-8?B?RU5KTHZGYk1Ra21ndXVZRHNOcEszOWh5dUx6alJDRzIxYkQyeFMwSmQrenZX?=
 =?utf-8?B?UHJuMTVTNVVjWStiYWswTnhnenc4bCtyTjRhK1JYWnU1dmlYc0FFeWxjZDBC?=
 =?utf-8?B?dnloMTF4aTF3WlpwS3I2RGk1L0pOUTFvbGt6bGc2dGFKQkg1L2MwZWhzVDNU?=
 =?utf-8?B?T3hhMUExUHpCME05eE90QTRFRit0RHZkb2lkQU9JTzZBaU45K2RMTGR3Z0Ex?=
 =?utf-8?Q?zndaW9jV1YISx/MOwx91P+s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe147512-342b-482b-13b5-08dbd18e143b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 17:00:35.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD5kOT6z6AihtlSSeRKBbmjJ5YBNx6kZmdWG9ITEl3kqaS0UgNcTLJLuWjja64njc+F5lK8wX0h90h7I6LWVTJKFciwRUSgqL1qF9H9igf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [17/21] drm/xe/oa: Remove filtering reports on
 context id
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

On Fri, Oct 20, 2023 at 10:30:15AM +0300, Lionel Landwerlin wrote:
>   On 19/09/2023 19:10, Ashutosh Dixit wrote:
>
> At present XE OA code does not obtain context id's from GuC. Even if these
> context id's were available it is not clear if included reports for
> userspace should be filtered on context id's. Till these issues are
> resolved remove filtering reports based on context id's.
>
>   If you're removing this, then the opening of the perf stream should always
>   be a privileged operation.

Maybe I didn't understand the filtering use case in i915 correctly.  

The OA buffer access is/was always privileged. Filtering was only 
squashing out the irrelevant contexts in the OA buffer. However those 
squashed contexts are also copied over to the user buffer. My thought 
was to just return everything unsquashed since this is a privileged 
operation.

>
>   I guess this also makes DRM_XE_OA_PROP_EXEC_QUEUE_ID useless?
>
>   It should probably be removed from the uapi.

DRM_XE_OA_PROP_EXEC_QUEUE_ID was still used to enable OAR on a specific 
context. If we drop this, we could enable it on all RCS instances. The 
problem comes when OAC is used. If there are multiple CCS instances on a 
tile, OAC can only be enabled on one instance. 

Thanks,
Umesh
>
>   -Lionel
>
>
> Suggested-by: Umesh Nerlige Ramappa [1]<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit [2]<ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 33 +++-----------------------------
>  drivers/gpu/drm/xe/xe_oa_types.h |  9 ---------
>  2 files changed, 3 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8648652e05aa5..077698a0c5628 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -184,13 +184,6 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>                 report[1] = 0;
>  }
>
> -static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
> -{
> -       u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
> -
> -       return ctx_id & stream->specific_ctx_id_mask;
> -}
> -
>  static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
>  {
>         if (oa_report_header_64bit(stream))
> @@ -368,7 +361,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
>         for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
>                 u8 *report = oa_buf_base + head;
> -               u32 ctx_id, *report32 = (void *)report;
> +               u32 *report32 = (void *)report;
>                 u64 reason;
>
>                 /*
> @@ -379,7 +372,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>                  * this field and it is valid to have a reason field of zero.
>                  */
>                 reason = oa_report_reason(stream, report);
> -               ctx_id = oa_context_id(stream, report32);
>
>                 /*
>                  * Squash whatever is in the CTX_ID field if it's marked as invalid to be
> @@ -388,10 +380,8 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>                  * Note: we don't clear the valid_ctx_bit so userspace can understand that
>                  * the ID has been squashed by the kernel.
>                  */
> -               if (oa_report_ctx_invalid(stream, report)) {
> -                       ctx_id = INVALID_CTX_ID;
> +               if (oa_report_ctx_invalid(stream, report))
>                         oa_context_id_squash(stream, report32);
> -               }
>
>                 /*
>                  * NB: The OA unit does not support clock gating off for a specific
> @@ -419,21 +409,10 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>                  * since it's not-uncommon for periodic samples to identify a switch
>                  * before any 'context switch' report.
>                  */
> -               if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
> -                   stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
> -                   reason & OAREPORT_REASON_CTX_SWITCH) {
> -                       /*
> -                        * While filtering for a single context we avoid
> -                        * leaking the IDs of other contexts.
> -                        */
> -                       if (stream->exec_q && stream->specific_ctx_id != ctx_id)
> -                               oa_context_id_squash(stream, report32);
> -
> +               if (!stream->exec_q || reason & OAREPORT_REASON_CTX_SWITCH) {
>                         ret = xe_oa_append_sample(stream, buf, count, offset, report);
>                         if (ret)
>                                 break;
> -
> -                       stream->oa_buffer.last_ctx_id = ctx_id;
>                 }
>
>                 if (is_power_of_2(report_size)) {
> @@ -497,12 +476,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>         /* Mark that we need updated tail pointers to read from... */
>         stream->oa_buffer.tail = 0;
>
> -       /*
> -        * Reset state used to recognise context switches, affecting which reports we will
> -        * forward to userspace while filtering for a single context.
> -        */
> -       stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
> -
>         spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>         /* Zero out the OA buffer since we rely on zero report id and timestamp fields */
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 3cc1d88fe4a51..7566fef55b0ab 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -222,12 +222,6 @@ struct xe_oa_stream {
>          */
>         struct llist_head oa_config_bos;
>
> -       /** @specific_ctx_id: id of the context used for filtering reports */
> -       u32 specific_ctx_id;
> -
> -       /** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
> -       u32 specific_ctx_id_mask;
> -
>         /**
>          * @poll_check_timer: High resolution timer that will periodically
>          * check for data in the circular OA buffer for notifying userspace
> @@ -261,9 +255,6 @@ struct xe_oa_stream {
>                 /** @vaddr: mapped vaddr of the OA buffer */
>                 u8 *vaddr;
>
> -               /** @last_ctx_id: last context id for OA data added */
> -               u32 last_ctx_id;
> -
>                 /**
>                  * @ptr_lock: Locks reads and writes to all head/tail state
>                  *
>
>References
>
>   Visible links
>   1. mailto:umesh.nerlige.ramappa@intel.com
>   2. mailto:ashutosh.dixit@intel.com
