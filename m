Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3F9C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 19:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389F10FF0B;
	Tue, 12 Mar 2024 19:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcmBjbgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438EE10F692
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710270559; x=1741806559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tOUrmBGgzS7u6QfmU1Cjfsy39Duh8S90XQVywr1Txok=;
 b=dcmBjbgiodaca7QAgMgoYgGKfR81vfTyF2YyE8S6NS6v5/uRRiynhagM
 vhGaonOOdqJQVciPsy21x/xKxXsgvDg2m0YW1DBcmA9URXx3//PsM+0re
 kbCJlSdnN6Fd58Po4WXvLFuiq64kB22K+DDuq2IlKaARcrzRHyhviZYOY
 L7xZwnGdXcx/VLAc9XxKua1ZD0fkt3jOPe59skOhL4z46HXSM6RfkwA65
 jx3eExJKnOfRgo9OmLbJe8eALt0ahfKfVsFNVmXMalSZjhjzWsCkfAVOM
 Y7ZwdqfXwIaoObjZ9Fj5EjW4F28C/VnphjPpN1DD+yb8iYCLtLy3fBNku A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4931297"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4931297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 12:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16293542"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 12:09:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 12:09:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 12:09:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 12:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+aFDCcEuSMXKynvsp7vhhVt4nFA9SAQiDH6if9x6dp8jcj9bMTmzV8Rpnwc8/4L50+BRIpQFKRQNEJYuEL/OrpCHucCFvJylcGyFIhJD1//+sygZPrCPFBf1MG1L5Vv17055zhWlapuQbBodifekWsS0dc+dh0xXMzwJDpb0b0ZVeQGqviQxHhN56gMN2RJ4qPXxb2i2xHDuRIwkcAXJkWWfZ0On2XrJsrfXFdIxSxLsQ8RhUutbqQV19dVozCXiTi1N6+fl4TU0FWxowKsQnDClIWT70C/QGnzAEaMJ5nMEudWpfeDUffuPJv/66pGxE+6fHEDgAi+VDadoO46PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSBIbDVJ1O2+ExFkw9xTivbp5277arrd5QWYrIK9zU8=;
 b=d0Y1YIcDCds9hcr3imXI6kFjKdZdXnmiiG1PEqvBfvl9tIJA3WFG5MnArt+ilcXdpaCxZOtkAFb8/+TPK82wVFWb4YYdmLMmPeSfW3AGs2OnHkJcRrENIDTRzArSgCkd7SwvH//rZr/sMLA+655oI6PorBO8uoD2cAMr4jlRxen0D6L1jCnfAARnK/8OixhKUifAz9C4l1V67qmH32z+TGoJ21Ckp0E5/6YwCG8Rp2jglu8Mn3KbE/qdabH8f5vJUAQtg87X6UjYO5CayLOzXa56oyr4GtIlTw/obZYxM7fwDKG3/TZ9wHrCIjrPotBkXZ7q4SbC7q5rqP+xwyWoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 19:09:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 19:09:05 +0000
Date: Tue, 12 Mar 2024 12:08:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 16/17] drm/xe/oa: Changes to OA_TAKEN
Message-ID: <ZfCoQFMgXG2MD8rA@unerlige-ril>
References: <20240312034003.2747815-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312034003.2747815-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 5265bf9a-009a-41b3-59cd-08dc42c7e2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8366k27MGIGVxHhNDR1Hm8g8+5l87seuDqa50ScY8wQT4kj1yyTIcIALQtV1houhO4077WRbUPA3Qp9h1xurxcbKUOFUcwEXxq20gsJWTynNNIivX1dqs1gIRmuFm08WokpwVd5JtSbx5X5OT7nQnq/mGw0rm0nEzcA0iObcI1BLfv3FSvdo9Kna3bI2rg2hAulhchNcrgRZM6wdprsDdkwYUStmYRsqnRUrroJerwbKnXV1NWZI85H3VA9P0CSOpkNgc2ybL1vuM6o9fn+O+XDEeSBi+3AL4U+gflytP0GthzLvcvpY4ez35fH0ck7bdUgpTpzDr5J5bK5rvcj8VrTMjQ6lgVqvXb/eVIk6xrIzDAScxy8AU/V5gSRWWWgCufB4G5TJMMi/Ow9TWomn/7GTF3uJp56+JuWfY935r/QchtaIvTkcCvg4tkCIxbHI5BWGGrtUoLNXWaNFPZeB6yB+9lx5NNvBudbUx6EnPQA+j1TS0VFnRTtM/ocJ9dGsjdtl57ycMPovB67+iOizwB9rqmfLb/tFosaiQGmAS1zvz1WZ74RKG2EE7K13a8uwdem/+dGjSRLElT9woMphrpwgKd6t51JY5n5AXLDbzRnDia/YO3WB+/xgWFxdFtbOkym5xU5advYE8rFHmhi5jLYOgowvGiIXrFVfQ880UM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBCVkZqcUhVazViZUJ4SGVpZk9TVFFLb2E4a0hIVVpIQkM1SWczaEh1WTli?=
 =?utf-8?B?TkRTUitMdTN2YzJJdU9pQWhteTVnL3FHRXZvdjN2UTJKNlhhZW9RVEcxLzcv?=
 =?utf-8?B?QS9DODE5YW5JVWZHRUtmallKcnpMWFFhWnh1ZVlqaGVLc3lBeUpDcjZkS0tj?=
 =?utf-8?B?M3Q1N0U1dWFINnRvNWR6QUR6MmxvdUszcEJtaDBWM25yWE95bm56TXYzcEdM?=
 =?utf-8?B?NGY1ZTVmTnZuRGZLQmFxZDl1d25tMVM3SHJkUUxaYllyaUdGTkhaeHg3RWN5?=
 =?utf-8?B?K0hNcHAvaEJqcURqMzl3ZVdiczV4bFVYbjVOMjV2VjVKeTJ3SjFVbFBSTWFY?=
 =?utf-8?B?UkhKdklxNDhMKzcySjRIM0VyNWZES1UyeEswRXo5OHMvQmF2WXVta1J6MC9x?=
 =?utf-8?B?MldkVHhXWFZQSjJlVzZLYVdMM3h6TytwVW9DM3ovcjRtVTNxMkQwSWp2REYv?=
 =?utf-8?B?TGxZbytzQjQrZWJJejhTbkpvUUR3V0EvWVQ1NHg1Z1hXczlDbVVCem5Rak5h?=
 =?utf-8?B?MFpoanZQZUdKQnBjUnJBRndISTg1QW1pU1d4WGJ4ZU9PRkdOaW9oYkw0ZWlE?=
 =?utf-8?B?QmpTekdhR1A1R3lGZ1JpQnhkMUs5QmFweFQ2TUIvZWRLZmNEdXQwaGdqbVlD?=
 =?utf-8?B?OGhVQzFFOWR5OVZwV3A1K25NZkZXeHZTZ0d3TFZTMEpYNGdKTm5hdmFrVXNK?=
 =?utf-8?B?bEtuWnQxeGVYUC9VUnBlempFa0x0ZnRYWHU4cmprc3FUR3JvRlVONjF0MFI3?=
 =?utf-8?B?c2pFcC9qKzJLUityaGNQUFNraithSUxmQ3BQV2IxVHFyMlp0N0UwZXlKbUVo?=
 =?utf-8?B?U2Y2dS9xaW56MElhSkVmK2VwK1piN1hRVGlTM29raEluK2luKzlVaTIzVCtp?=
 =?utf-8?B?bkNxM1FQNkczS1pIRG5iTkRtclcybHROSnpuN0pqOEVLZk5DTG9KMjNVRjRj?=
 =?utf-8?B?bWFWUlFkUzY0TGdTeDR6bURXUnBma3Q0OFZWbEpKa2JBNTVzd2hEZ2NBWDVQ?=
 =?utf-8?B?QTJBNzEvczRJelMyY2tjQldCcnc0c0dwQVNvNFdrZEQ5cUJzKys2RzJ4TjZ5?=
 =?utf-8?B?cFR4VTB1WVh1OVRINWkza2M5R0t4QzhIMkZsN0daYzNWRThtK1FycVR4ek1N?=
 =?utf-8?B?Y1VrY0lmRjlqeHdzV0R2Vzl0aksyQUVpbU05ejBYbkVIcS9BRnpyaWltZ2NS?=
 =?utf-8?B?aGZaemRLV0FaRmkvN2F3TEY5WWpaVU8yN0svdEdmUFlRTjBGSndrSTNoak55?=
 =?utf-8?B?cUZJampJMHBId0JhYjV3M2FoQkZIeWs3ZDdyTDdldThReXdiQ0l0bmtNb3Bm?=
 =?utf-8?B?cHlMRWQ5RXBSQTM5S2o3S3VtMEEyc2I2ZTNVVVZnS3dTejZ2aWFQY0d4aUxR?=
 =?utf-8?B?NnpRaEgwRkI4S0tsTm56TytPMVFEakxSZ0xnT1pxU2NkOUJLdEoveExTRE1R?=
 =?utf-8?B?ZTQzUmJLYnRVUnRkYU1wZE9EbUZzODI1dHczSDZRQmJKbDVNL3owbWs1bGJW?=
 =?utf-8?B?TTNPWmh2bzRQeWY0VG5Ib0JXN0Q2MVhMbm04MXdCVSs3SGxVMG1mYk8vNHQ2?=
 =?utf-8?B?cERDYjgrY3VqN3JoRnZRRThMeVhTa1RUZnA1VHZrN216WkJGNzlyWmlaMDBV?=
 =?utf-8?B?aW5KbTBlRjdEQUJDVW14SGowU1BGcHYvVHV1QUtaeVg5bHRIRTAvcHp6SHJl?=
 =?utf-8?B?L284LzNQOHl4RVV0dndVZUQ5Vld0SHdST0cvZm1jRDFPRFRyaDI5QjcvWDRE?=
 =?utf-8?B?bWlENldEKzJtOWl0YnFTaEVxQXlidStCaC94Rkg1emtYS0ZyNmMyQVJNaXA1?=
 =?utf-8?B?NDk0VS9mNXp0TzRvcUFuWlpNZmlaMFZmTU5BVVZiY2VjdmxmMk5MOWZnWjJ2?=
 =?utf-8?B?VzVXbTgwYUdZNFB0QUoyd3BtaVJjeEFuYmsza0I2dkY4WDlsd2NvbHVYbEt1?=
 =?utf-8?B?T1pUZGRqZitUOW1WaEJJV3ZBQ1k2TjNsNzhIMXE0Zi9XaHlDKzg1eHgzbHp6?=
 =?utf-8?B?RVRSRmo4d0JVNW1PYkE5a2pYaWgzZHZLQ1RpTjlKZGRDSGxqWW9Wa0ZrbURJ?=
 =?utf-8?B?cUx4bVl5c3JJMExFNzg3WjBteVRGY1c1anArSGpPZHdGUUxUTm1zQ09BeUFX?=
 =?utf-8?B?OFBqZmpLNmtaYkk4cGdGRmxEUmhWR29ZL3FObnZlaFBZQVdTcFlFTS9QRTMy?=
 =?utf-8?Q?Nv/ef5L+iXwa/IpfpGBG0Vg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5265bf9a-009a-41b3-59cd-08dc42c7e2b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 19:09:05.1222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI4Nf+i7gYIlkMrB/pLRw0pjqkv98xHj4pl5HLU8Nl/BuY/vgjJ+oXWMR00HZUqS7bEoNrgQaQ8qwuzGV7G94z5O5UX728F3/ov1SPXNa4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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

On Mon, Mar 11, 2024 at 08:40:02PM -0700, Ashutosh Dixit wrote:
>Rename OA_TAKEN to xe_oa_circ_diff, since xe_oa_circ_diff better describes
>what the macro actually does. Also convert to function and add xe_oa_stream
>arg. These will be used in the following patch.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 22 +++++++++++++---------
> 1 file changed, 13 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index b33976db1da5..6f5bbb0787d9 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -28,7 +28,6 @@
> #include "xe_sched_job.h"
> #include "xe_perf.h"
>
>-#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
> #define DEFAULT_POLL_FREQUENCY_HZ 200
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> #define XE_OA_UNIT_INVALID U32_MAX
>@@ -105,6 +104,11 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> };
>
>+static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
>+{
>+	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>+}
>+
> static void xe_oa_config_release(struct kref *ref)
> {
> 	struct xe_oa_config *oa_config =
>@@ -209,11 +213,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * increments. Also report size may not be a power of 2. Compute potential
> 	 * partially landed report in OA buffer.
> 	 */
>-	partial_report_size = OA_TAKEN(hw_tail, stream->oa_buffer.tail);
>+	partial_report_size = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
> 	partial_report_size %= report_size;
>
> 	/* Subtract partial amount off the tail */
>-	hw_tail = OA_TAKEN(hw_tail, partial_report_size);
>+	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
>
> 	tail = hw_tail;
>
>@@ -225,24 +229,24 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * This is assuming that the writes of the OA unit land in memory in the order
> 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
> 	 */
>-	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
>+	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
> 		void *report = stream->oa_buffer.vaddr + tail;
>
> 		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
> 			break;
>
>-		tail = OA_TAKEN(tail, report_size);
>+		tail = xe_oa_circ_diff(stream, tail, report_size);
> 	}
>
>-	if (OA_TAKEN(hw_tail, tail) > report_size)
>+	if (xe_oa_circ_diff(stream, hw_tail, tail) > report_size)
> 		drm_dbg(&stream->oa->xe->drm,
> 			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
> 			stream->oa_buffer.head, tail, hw_tail);
>
> 	stream->oa_buffer.tail = tail;
>
>-	pollin = OA_TAKEN(stream->oa_buffer.tail,
>-			  stream->oa_buffer.head) >= report_size;
>+	pollin = xe_oa_circ_diff(stream, stream->oa_buffer.tail,
>+				 stream->oa_buffer.head) >= report_size;
>
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>@@ -315,7 +319,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
>
>-	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
>+	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
> 		u8 *report = oa_buf_base + head;
>
> 		ret = xe_oa_append_report(stream, buf, count, offset, report);
>-- 
>2.41.0
>
