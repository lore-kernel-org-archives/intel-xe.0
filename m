Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D0C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 20:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2489A10E339;
	Wed, 21 Feb 2024 20:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wjy/ii8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E96E10E140
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708546838; x=1740082838;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JMAlPSA89FR47JKHn/lwiEYfXsOZFA0iVcfTi0jWGtk=;
 b=Wjy/ii8rj4T2kB+5dYYX1xyT5cjJd/DccRrOWJwSV1pL/VtXj5wNpfZx
 QMgLMhSmFQzUu83Gax7OZyVzrwEnVu7ZPXqWF1wzrFNDEY2Wkl4LJbDae
 2/AkaWcF7UKTOTlBSRdg2UvP2WSAvtqpwS144nLMzs+nEBr0xOuAiF7XT
 uyJMZl/viaeHMDAnJBL8pq+l2IY81fIQg9pLEK3vedKzsX5+xkTOuLtOa
 dRBkmrNYcQ5SSHckNRoldBtwP/+G5WXEj+wcBRd4TKLXMQivY5AMUyahc
 YxnXmOTDEJLURmFN5orQZsi3t5m6LkCt16EkeXRkZTjGbbPx0e5XFJfuC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20277674"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="20277674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 12:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913365699"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="913365699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 12:20:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 12:20:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 12:20:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 12:20:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 12:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evJD42w6LlSYtusfIMD5eSIGahvlAyRuNYUyVW/RvafG6kU0Fo4Bwhs9llMJ9XDXF2YUkwM5nQUns3AhDEWz1vKzsqjoSk7iXioRzwGDVevC3TD5jHk0mUYelpB+/ThE+GJl41cUVnwsiP+ynDm3WQaU1RG8PcGmlsxJLvUgV6TeJaMWyVU+qskWXAnFE35ju1qIEOyXm7iP/oujkv3966POudqotv7vjQTEy/kduEtw59amqrncwLqyfChJBJufqmQSHwt+idvHP/yByZxoZJLPNanBsJX9OpvZE5/XXNGe1hY1Yl4Db7M9S5iss31Itjz54CZM9Y7HNDKVOeeyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEVbW9AmFhWJ7U02cuXGQcf3Z2XvCUOfLvrJnIQN61c=;
 b=RMWTIFRkUVTWpOATHFbQmHw+61IVst/JkRLpHo1zZTSmoB3gQ01QRrh4Ed91RNjn1I1MD0Jix9GnvY51mo5qXhNekU5J+wUvfUPChESCH0meilLr8H6++zxnhkR0orYd1mHnJl5fwIZoYSnwU1ggOGw49V7NXa+TO7poMm2guX0Z9DBFdcLwz3rTVsau5wogMjnWOdieY4YLcDkIxd1bPaveksXxHPypFy1R+zZSC7gThNX7Ck86nv+BWRVMw+3ei0qSMfE+kbmpZK0EwgC2KtI7hamls7mL0DnkljRI2r41MBgrJRAIv6e58yArdqBV0KnOMezD3Rz7/hzQZA/RYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 20:20:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 20:20:34 +0000
Date: Wed, 21 Feb 2024 14:20:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: Re: [PATCH] drm/xe: Fix cast on trace variable again
Message-ID: <pwdw3ngyrvvdxyxuhnlamplwotnlsnty3pgr6cnr6fqnikqmek@lfbvd3auyjac>
References: <20240220205607.1873084-1-lucas.demarchi@intel.com>
 <ZdY50NpgbAy0Gya_@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdY50NpgbAy0Gya_@intel.com>
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a4b91f-af4e-4ab1-6e27-08dc331a8f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hTrQwpUVrSm4G0xi4GIVBZs/H0o55082Q/XeKZ8wAJwbhYNVWrqQUkKDKliJqe1v8Ke5hGU2jkoiPD3a+pKGLgm6fXTSRc4FpCLNvNIMlRpa0AHwsGEibYxxF2aydCJsdkRBKKuGOB9Ul4jlBC+sldLLlsmRy2mI96O+P0Qqhz/YaJkEy3Wk82r9Ro+GPhmvKPhu6MD8lBwoNGkM8ax/VEhfxen4bbgG/MqlhHJs6yFccj8U8LVPErgsUBoQSLRCSmSD7nCCU9PxhZ/0FPHdsmMc/19PsMtogQJpDvpJifdNrEpuNabnUGNi+vfj+ludJVeSgTVwtsYjibTMzVK9e2EyEKz2e1qYsucLvWUpMkvF3mJUE7s7N1wBWicyjzRy/Wuf19lwbcsx7kH32jq9HurEF5a9hqD353LdzaSvXXZexnMAYEfYYvS/NpfAVw5WPXNJSEVRTGH766zLOzT7JCy7ezRWZIX24//ZTVBvJ+zx5vOsaI95IyKuuNhamSj2ve+6xwPcJERJ+9FK7xFLTdfLqEQmJq4qrY30FkdBYaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XMHYHktgkIiN25B1c/+ABGjNZvARe/SdO+5CV3i8EroOpGKQfSckWHHEmP?=
 =?iso-8859-1?Q?hlC7UeR6xcKzoBHSJc0Cg/pqk06BQEQqrmhIHqCeHi4/dGF3KVvqbsHx/F?=
 =?iso-8859-1?Q?uhdW/nNMXB1rImzbKg5UKkv7A1AVmMaouhcgCmhqOMonY41ubMmc7oVZwy?=
 =?iso-8859-1?Q?sDlV3EjDe5JejTe/DHaHMwZXLC9lUdI7Lax5LtWIPbyE3e4o9QMZrhnR6q?=
 =?iso-8859-1?Q?YTO0AeoLwnHpYaOLYRu1Pi+6kitAQ0XNigzTabmk2eED8JAoaeQYaF8IVd?=
 =?iso-8859-1?Q?j1NFxBjmfquxdbANPA219LCTrmkulPFSkV8ZnIxEdyXKVTaVt4Owt8iW7B?=
 =?iso-8859-1?Q?H+gWBGpRJ6469nM1S+uqJx+ekaev8/eZu4e2rjlhA7wpzDugOyVEkk5ofS?=
 =?iso-8859-1?Q?suMzIW+Uz7vULbJgVNCGM3esBtvaliPIZD1NHxEb1iJvrI+H56z1HWBcnw?=
 =?iso-8859-1?Q?AhhZIe1N0vLh9yGMKvDIs2YetG0OYIvkYmlmf7ITvgURDFSpe7vgbgJh62?=
 =?iso-8859-1?Q?zY0Vnz8F+p/5LMp8ceQp/QriyRe+DHqlFuEGyZ424KP/GIn9cPxJ+spTzu?=
 =?iso-8859-1?Q?Yh844XkUqewaW6j+iRu4PjuhGF1Um23geU5u6iVRFYwmWGBUTQOyFeQq2N?=
 =?iso-8859-1?Q?M8OYjGMqHVMjDgMgaEn8GkOia04VPdUcJFrxor19SY4aMxRF91bKfLv72K?=
 =?iso-8859-1?Q?aNVRA3f4sVo4SdGHqGkQrJcLRbosRL5QrmpcaSnZtRzcfEqChIgQGyJqYC?=
 =?iso-8859-1?Q?6YcNDdy1P7qE7cAS4JogbEIQgufAYA4m7+tzQzLzw72f4TYYICs3YO9dSk?=
 =?iso-8859-1?Q?4ldIhvh+vs6YzWpsGPoQNFsyQutaP2duy/qATFx5p9yTf7IRF+2P6VqSQK?=
 =?iso-8859-1?Q?gFH/tNH6m/7I/3+eX0mPJ9ANWczdKepmTHjgeOW7URSxVJ5840D5/Stxje?=
 =?iso-8859-1?Q?SiRino7OC5G4rws7vCqULVxoqMKGVPCW3jYBJUEaw4WR7Gzb/H8BQGOo6B?=
 =?iso-8859-1?Q?cUfkPmRg+BcytZzogx+5Zh8TuoTpRgIR0D9VnQDLIq4ZPwyf72OGcd59lE?=
 =?iso-8859-1?Q?2NZuWBdsBt2VMXqGw1HvtKg19fNSM5icTFwEV3BgYjzeaKYhJdLldmdSJf?=
 =?iso-8859-1?Q?xxIzFpbOswgH29wevk+ZT0Bf5AAfxCN0ffjtF9KtpTuMBiGQ6yDG665wxi?=
 =?iso-8859-1?Q?KB7iDaRAkA1sq5IMbbkPurPpgELRdPfG8ZOyrNf0f7BaIkrk90vxtLFIoU?=
 =?iso-8859-1?Q?rJFCw8TRUVOM+E0nNIN7U7CWG7d8KfwJjw2Jbu7k7YK2rdodPTRDN8e9ma?=
 =?iso-8859-1?Q?SB9KN5olCEdxQIXE0Jnf2mNVB/Vf5BM9Thh1RPJA3DvYPv2FE7Sth9xM4B?=
 =?iso-8859-1?Q?M7UB1ixBZeTcBq+VkiderltqZhib1cl9YC5mkYLq6usVF4Ph/RAfUQsnCv?=
 =?iso-8859-1?Q?vyBFbbtHYxzKqiE7OVoBo4t+XxRac5eUAXa0vFQ86JMbdaF5F9+q4D+e1C?=
 =?iso-8859-1?Q?JPt/VNkhBKahl3uBL4WMf9ASrDgT9OAB4ufioe6u05uMCUNxKnmULMBZjk?=
 =?iso-8859-1?Q?lEPDp2uyYe0xMo5Y56d8LB7Ho5Hqo/klDlJ+acM9QY99hFFYQ9nNXu+70y?=
 =?iso-8859-1?Q?PhNtnPFQZlKwNGKUogGpkDh6ZrWpIHbPoLzduAIcHNDYqf6Tx8cKd2fw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a4b91f-af4e-4ab1-6e27-08dc331a8f24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 20:20:34.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSXCclImM6gFrPYzC1OnAMCDrlODzCtGVauZOicbcR26dK4YJ0nMKNk/3e2VMW7c1aV1qGUfdAjP4IIoBVHMi0GUyJk3EGP149jtmxKqSsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Wed, Feb 21, 2024 at 07:58:40PM +0200, Ville Syrjälä wrote:
>On Tue, Feb 20, 2024 at 12:56:07PM -0800, Lucas De Marchi wrote:
>> Same fix as commit 8d038f49c1f3 ("drm/xe: Fix cast on trace variable")
>> that has been inadvertently reverted by a later commit.
>>
>> Fixes: a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> index 0cce98a6b14b..e43c3bde3202 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -32,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>>  			     ),
>>
>>  		    TP_fast_assign(
>> -			   __entry->fence = (u64)fence;
>> +			   __entry->fence = (unsigned long)fence;
>
>What's the point of these weird gymnastics?
>Ie. why isn't __entry->fence just a pointer?

Indeed... apparently for no good reason. The following patch should work
as well, while converting all the trace events to use pointers. I didn't
bother with a 0x prefix since it's already used as %p in other places
and I don't think we want to leak the kernel address too, so not using
%px.  Does that look good to you?

-------------8<-----------------
Subject: [PATCH] drm/xe: Use pointers in trace events

Commit a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
inadvertently reverted commit 8d038f49c1f3 ("drm/xe: Fix cast on trace
variable"), breaking the build on 32bits.

As noted by Ville, there's no point in converting the pointers to u64
and add casts everywhere. In fact, it's better to just use %p and let
the address be hashed. Convert all the cases in xe_trace.h to use
pointers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, 
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>, 
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 0cce98a6b14b..3b97633d81d8 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -27,16 +27,16 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
  		    TP_ARGS(fence),
  
  		    TP_STRUCT__entry(
-			     __field(u64, fence)
+			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
  			     __field(int, seqno)
  			     ),
  
  		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = fence;
  			   __entry->seqno = fence->seqno;
  			   ),
  
-		    TP_printk("fence=0x%016llx, seqno=%d",
+		    TP_printk("fence=%p, seqno=%d",
  			      __entry->fence, __entry->seqno)
  );
  
@@ -83,16 +83,16 @@ DECLARE_EVENT_CLASS(xe_bo,
  		    TP_STRUCT__entry(
  			     __field(size_t, size)
  			     __field(u32, flags)
-			     __field(u64, vm)
+			     __field(struct xe_vm *, vm)
  			     ),
  
  		    TP_fast_assign(
  			   __entry->size = bo->size;
  			   __entry->flags = bo->flags;
-			   __entry->vm = (unsigned long)bo->vm;
+			   __entry->vm = bo->vm;
  			   ),
  
-		    TP_printk("size=%zu, flags=0x%02x, vm=0x%016llx",
+		    TP_printk("size=%zu, flags=0x%02x, vm=%p",
  			      __entry->size, __entry->flags, __entry->vm)
  );
  
@@ -346,16 +346,16 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
  		    TP_STRUCT__entry(
  			     __field(u64, ctx)
  			     __field(u32, seqno)
-			     __field(u64, fence)
+			     __field(struct xe_hw_fence *, fence)
  			     ),
  
  		    TP_fast_assign(
  			   __entry->ctx = fence->dma.context;
  			   __entry->seqno = fence->dma.seqno;
-			   __entry->fence = (unsigned long)fence;
+			   __entry->fence = fence;
  			   ),
  
-		    TP_printk("ctx=0x%016llx, fence=0x%016llx, seqno=%u",
+		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
  			      __entry->ctx, __entry->fence, __entry->seqno)
  );
  
@@ -384,7 +384,7 @@ DECLARE_EVENT_CLASS(xe_vma,
  		    TP_ARGS(vma),
  
  		    TP_STRUCT__entry(
-			     __field(u64, vma)
+			     __field(struct xe_vma *, vma)
  			     __field(u32, asid)
  			     __field(u64, start)
  			     __field(u64, end)
@@ -392,14 +392,14 @@ DECLARE_EVENT_CLASS(xe_vma,
  			     ),
  
  		    TP_fast_assign(
-			   __entry->vma = (unsigned long)vma;
+			   __entry->vma = vma;
  			   __entry->asid = xe_vma_vm(vma)->usm.asid;
  			   __entry->start = xe_vma_start(vma);
  			   __entry->end = xe_vma_end(vma) - 1;
  			   __entry->ptr = xe_vma_userptr(vma);
  			   ),
  
-		    TP_printk("vma=0x%016llx, asid=0x%05x, start=0x%012llx, end=0x%012llx, ptr=0x%012llx,",
+		    TP_printk("vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
  			      __entry->vma, __entry->asid, __entry->start,
  			      __entry->end, __entry->ptr)
  )
@@ -484,16 +484,16 @@ DECLARE_EVENT_CLASS(xe_vm,
  		    TP_ARGS(vm),
  
  		    TP_STRUCT__entry(
-			     __field(u64, vm)
+			     __field(struct xe_vm *, vm)
  			     __field(u32, asid)
  			     ),
  
  		    TP_fast_assign(
-			   __entry->vm = (unsigned long)vm;
+			   __entry->vm = vm;
  			   __entry->asid = vm->usm.asid;
  			   ),
  
-		    TP_printk("vm=0x%016llx, asid=0x%05x",  __entry->vm,
+		    TP_printk("vm=%p, asid=0x%05x",  __entry->vm,
  			      __entry->asid)
  );
  
-------------8<-----------------


thanks
Lucas De Marchi
