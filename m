Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064BECDB47E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Oct 2023 01:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71810E034;
	Sat, 14 Oct 2023 01:01:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E6010E034
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Oct 2023 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245289; x=1728781289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GdRNXiucUdfF4addT4dYRb4Prcau2aI0xg+RHIBxEBA=;
 b=eVakX8O7HAqC0V3Zwwc0DPtWAPXvDQ1WcXA2Zn3OlgWKsxVC1jYPKvXD
 Ut2cHAiXollkEplR2ilvK6NpoGpnOZlozG2/F6Nj2+YKQiqdjtsZtSl1I
 qPbB1Pq8i5+KrPa3yQvspF818X5FrqPfdUhNvGb2KdnnioHH5wAOmr3aE
 QXSddPnnxigbKALMmlMVSwV7jAyK9GObibvL84uth1tyAglsXLkmZezja
 IpGp4RTeit6ZHmmweJBQ/3h4R02+zep8Td2bQJCHHYB4KspdU+ZM5O2VZ
 /Ai1ji0+a6ol6etCncSErImEVyC7tLDDIjaY85QOsUkzBnkVcoQCc4sx7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364656764"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364656764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 18:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748554692"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="748554692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 18:01:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 18:01:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 18:01:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 18:01:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 18:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUwjX+MDbF1qOWIEUqzQA+ZhD6TaLx3szVPI+N0MJ6c9nf6Wo4t6cVs36bvTyyQjcVsL3uW9Op/EIllXZS7BXBYVZzOz7fzNK74xxez2e0RgAuxtRRg0DFPV7JylYQvcHJ3DXAKrQgEzrdY3aeQEuArihUTe8XbF8auVqS8uVyW6yol6RlorgffqoU9PcR6aNOww3RCzvR5dueaCVP5A1LL53CjgbzExAGq1DCcmGERJLxOY0mg31uGy9MCUjbgpd+vQD1bSGGK4S/dgFY9AOzu44VeP40xx7tC574CGLpBjmK/J+dkhzvg1bBKEOM42yALv6s1IaA6TsbEId29E3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWbNInJmkLVpYzf7mJq4HnM8EQhEwuTXzumDaa6WBHc=;
 b=O8CpQjphQU67G/vWWf7NuAzskAa/f6XV29lhMqXJt1OHSJiHTh+NVOZ8Agy5ERJRQp5l/3qCIyhSwZclSkplfqm3vgxj8FvpTbtdKkAqqyR9ke50UkJPDNPN0niTOS1ZcawSshSDYL0fFjA2gYz2fJa+f8kBYgV01AVbGfk4UppbakYeBXtuel2tOefRNyPQ2MeIbwrh2oCHmQEAEhwB39Y8fOpcbOGY+KWxI8+Uury1/V81IEbX8mvk227lLNuOz2ZStFt69TAdODifeHBpS6PDUBQBx16dxeScyZrydgZw/64KHenY9CkQfDzBRZVBHLodVJInItNGUqJ6nIAvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.42; Sat, 14 Oct 2023 01:01:25 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Sat, 14 Oct 2023
 01:01:25 +0000
Date: Fri, 13 Oct 2023 18:01:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSnoY+Rm3vJtHcac@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-18-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-18-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: 775696f8-e6a3-4d3a-d36a-08dbcc51171d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxmPesTQmhiH7+/HfLIBEx4oXFoxp9OUlplrg6b8bK70YBPIItNV5YdevwILxX+Wa0TID5BVRRTofauTkHM642zcXTvg/6oIcmYgccSx5ohL0dGn1D9HctIfIg2pXlBWqfaNntMV1JlRhPhRLepav1a8L3WAcpnwgc7oY+yB7C/uRv/WaVdI+HYwRujaRAnVdbM1/qCh5KCAJ7L1TEbK3hPZCeLbqgPXoHxFSwxwKVfry/rbpVHO3P9/9aknKQ0l9IGoAkTo9Sza1g0yQtUNyZ1XpEu9JU6q6oPo967CbOXW2ass0rTUM54P2DTpQFts7uwhDOAxRHBGGiW/HR12r+aKJO+VTg2ka2+1puWlUEp4zK9WqEjvAP4uPzNtOMdyhJi3vqDE+KCrEe16PVfP9ill51pqoFXkeTvvQUUvtX/eG1K2XjyXtiQYlFK4/qYGI9chNEN6B7queTR2Vcj/sGAKjoPw0ZLS/7UUxgnLNC0rGgHfE6X/3thvkuq19WoiZGCCYV38smfS0fquC0gfWcARy/BO+Ry++aOkW15pUBwZd62neXp4ujZjeyxAXlhAj9KvnwuWmccVhK1qGRstRTMYGzeQzk+UleEeX1TatzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(6506007)(8676002)(316002)(5660300002)(83380400001)(4326008)(6862004)(8936002)(2906002)(38100700002)(86362001)(6636002)(33716001)(66946007)(66556008)(66476007)(41300700001)(82960400001)(6512007)(9686003)(26005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBSdFl5VldjSXRTRVVXcEdBZFJQc0lHYkFaTitvMmVJWnhDZnFibmVxUmdv?=
 =?utf-8?B?SzVxVFUxR0JRbnVoN2tQbU8ySlgyTzRRU0ExVC9hT05xNU1wR291Um9zZDl1?=
 =?utf-8?B?Y2RDVDl0NEI2THo3a2VxdDFwTzFYYTY0clFMYk1aY0YwV0xWRkxQdC9mQU1J?=
 =?utf-8?B?MEdvTkd6TUE5YnN3aWVlWXp5RGdyNUN2aEhXejdvMmF2T3VvaUpzSWpYcVJr?=
 =?utf-8?B?NmRKenFoTjBCQ1k4ZXkvbXlVVXJVRFJqdWVUZjlXeVVhMjMyOGd2SDdHTERv?=
 =?utf-8?B?S2xUZ09FdU1WMFBkUmgyU3BJNVJPTVpVWnJFM3ZDc3N5Y2pjYWFaclpQSjZU?=
 =?utf-8?B?ZFdHZ3diL0hqS3Nkd2VUQmZzUzBaTU9EUkxQZjNmVlZqTlIvUnlCOHFZQXVq?=
 =?utf-8?B?S3pSOVpUTEgzazhKbjZ4eTdjL24wRHJqZkRMMGFRS1Jyb2Y3Tm11aXlpNkVu?=
 =?utf-8?B?S2Zxa0J0OVQ1eDZvcG9qMHE5aGJDNVlMbS9kcjNvZGdDbkhESnFTZHViR0hL?=
 =?utf-8?B?dGxjSnhhU0J1VHlHNmV3L09LY0RTVlREWHhHdlV6TjZZZFI4Z2c3c1VzVVds?=
 =?utf-8?B?RmtwdGUwSHM0RHNUcWlFZnVXbER0ZVdCSllZRVBrUnpyanNpeTZmVzRydG9H?=
 =?utf-8?B?NzdXU01tM00yVk81UFlrL2Y3V2V2ZGNaQnFVU0RJbkdsY2ZpMjF5VTRQNWhY?=
 =?utf-8?B?YlZUMDdqanB4UC9VRG41RjEzV1B6OE85Rkx4TklhNlk2ejBJcXFMMVN3ZTNl?=
 =?utf-8?B?VWo4RXlqclRQai9QRjZacGZjQ3JjdjQzY1U3aEFQK3JEa1FtYUFYYzd4WkQx?=
 =?utf-8?B?U1NOaG5nd1RINWlkNVdub3hhZlFKelZvRHNGbHk3V2RVVFN4M2E2cjhDc1hz?=
 =?utf-8?B?eS9tS1BQTVU3ZFhCTjA5UmZHMFU5WitxUVlJNk9HYVc2Qk5Uc01yVVBiK0tW?=
 =?utf-8?B?a3ZKcDNYM1hiZTliM3IyUTVwN21hUTlKT0ZoYWpOYVpPNFB6RHFNcFZHTHpv?=
 =?utf-8?B?RklIWG1ZU3F6ZmlCTElxMHdsUUxBd3FTNUo2NlZueHJYSlJmR1FQUzlLUCtl?=
 =?utf-8?B?TzFxOUYwcUZxQTVzVzJWb1hlTWVwNG9pNWltU0ZLamk5VklIdlBteVFQVVFx?=
 =?utf-8?B?VnZQeThDM1VEaHRJbHVpZ0VVT1E5ek9vMmkvYXVuR1pCWWcxUktmSU92WVcz?=
 =?utf-8?B?RFhHWEZzY09JazF4UzI2QjlHaERwbmg2b2lGSGVkUEtRWWxpWGJFYXFWVlEr?=
 =?utf-8?B?bVBRaHlkY0tXWTdCYVhyNUJlczRuYm1PNUhaRE9pV1A1MmRrK3EwcDF3U1FF?=
 =?utf-8?B?cjJqTTRsbEovRnlqbDJiT0RtVzYvRlplbHo4RFFqOTlNMjZOaUdadEpLQ3Iz?=
 =?utf-8?B?clc2RE9xcFA1SnFJYTV2QWJmMytKRWc3VzRZb2RuZVZveW1TRE1tU1U4L1pP?=
 =?utf-8?B?Umg5UTZkWHpZSHN4NWxNWWNraG5BcFp3QXRCcXNublgvcHZZQ2pncjRMQ0Rq?=
 =?utf-8?B?QVQ3YjBlMjRFWGVFMVB0dkRlY29vQnJ4K1NKVlFBRkREMTM1WC8xb2NGckZH?=
 =?utf-8?B?bVlpOHlvTFpMTit6clJ4bGtMcjlDT1hRcTJONGthZGRndGJ6QTVKemgydVlu?=
 =?utf-8?B?VUwvb3VxSnlsTm1tY3ZJeXg4UWdVTlRmVXhyRkdyYndPbkxRWGVybGQ4VVN5?=
 =?utf-8?B?WlpqYzRMRXlPcWFQU3NkUW5qeTNiZy9GYW43V1lxc081emgrY0lwVEVWVmMz?=
 =?utf-8?B?VHJJbWZ3OSsrNDd0MXJQelhVNlNpc2hnWDQ0c29YbE9odE5TdGRSMU5uRmQ4?=
 =?utf-8?B?VVdBTW9LRHZvREoxdTFOSWVUVlRuV01jOWt0K3RsSCtIZ3YzWTJ4TUEwN0JD?=
 =?utf-8?B?TzVxQ1BUMnF1bkx5SWlaMnhpeXVOWDVGaGduczN4T1NIeXp4clV6Y1JOcDFZ?=
 =?utf-8?B?VUFERGRpT2Y4ZUJnMS9qY3VTcFFmR05WWEkyOTYydUdLa25HY0M5SnF5dnBC?=
 =?utf-8?B?cm4raE9jWndXMzJ4cnErWjNiRXhFMFRRdFhpdTZGUG1rNXZOWGRaVmdwM3pn?=
 =?utf-8?B?ZzA4NkJSQkIrOXY1K2duS2pYUFl3WW14OCtlZ2VGRXo5UklhMERSRWRqSVY0?=
 =?utf-8?B?NnJYWXZpMUV0VXlvWS8rYVNRbVJTVmI3Rm1ST1UvTHRJRjlOYnk4VUVVb3lO?=
 =?utf-8?Q?ic9d8Bm8/MXEXkSl/7pZPPk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 775696f8-e6a3-4d3a-d36a-08dbcc51171d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:01:25.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwB5ozwEjLC/0w1+ABeZ6jVkOBkTlcR0VjwVVE/TUBA4gy5aPd2OQjLY+ydejRAqt2vfO6oH5CsrHPDeIXryK0LPFmUICf6vvWaDHt+iJwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/21] drm/xe/oa: Remove filtering reports on
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

On Tue, Sep 19, 2023 at 09:10:45AM -0700, Ashutosh Dixit wrote:
>At present XE OA code does not obtain context id's from GuC. Even if these
>context id's were available it is not clear if included reports for
>userspace should be filtered on context id's. Till these issues are
>resolved remove filtering reports based on context id's.
>
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

For review, it would be easier to just drop whatever is not used rather 
than adding it in earlier patches and removing it later. I guess you 
want to highlight what has changed between i915 and Xe, but I guess we 
can review everything as new code and refer to i915 offline.

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c       | 33 +++-----------------------------
> drivers/gpu/drm/xe/xe_oa_types.h |  9 ---------
> 2 files changed, 3 insertions(+), 39 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 8648652e05aa5..077698a0c5628 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -184,13 +184,6 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
> 		report[1] = 0;
> }
>
>-static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
>-{
>-	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
>-
>-	return ctx_id & stream->specific_ctx_id_mask;
>-}
>-
> static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
> {
> 	if (oa_report_header_64bit(stream))
>@@ -368,7 +361,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
> 		u8 *report = oa_buf_base + head;
>-		u32 ctx_id, *report32 = (void *)report;
>+		u32 *report32 = (void *)report;
> 		u64 reason;
>
> 		/*
>@@ -379,7 +372,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 		 * this field and it is valid to have a reason field of zero.
> 		 */
> 		reason = oa_report_reason(stream, report);
>-		ctx_id = oa_context_id(stream, report32);
>
> 		/*
> 		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
>@@ -388,10 +380,8 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
> 		 * the ID has been squashed by the kernel.
> 		 */
>-		if (oa_report_ctx_invalid(stream, report)) {
>-			ctx_id = INVALID_CTX_ID;
>+		if (oa_report_ctx_invalid(stream, report))
> 			oa_context_id_squash(stream, report32);
>-		}
>
> 		/*
> 		 * NB: The OA unit does not support clock gating off for a specific
>@@ -419,21 +409,10 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 		 * since it's not-uncommon for periodic samples to identify a switch
> 		 * before any 'context switch' report.
> 		 */
>-		if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
>-		    stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
>-		    reason & OAREPORT_REASON_CTX_SWITCH) {
>-			/*
>-			 * While filtering for a single context we avoid
>-			 * leaking the IDs of other contexts.
>-			 */
>-			if (stream->exec_q && stream->specific_ctx_id != ctx_id)
>-				oa_context_id_squash(stream, report32);
>-
>+		if (!stream->exec_q || reason & OAREPORT_REASON_CTX_SWITCH) {
> 			ret = xe_oa_append_sample(stream, buf, count, offset, report);
> 			if (ret)
> 				break;
>-
>-			stream->oa_buffer.last_ctx_id = ctx_id;
> 		}
>
> 		if (is_power_of_2(report_size)) {
>@@ -497,12 +476,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	/* Mark that we need updated tail pointers to read from... */
> 	stream->oa_buffer.tail = 0;
>
>-	/*
>-	 * Reset state used to recognise context switches, affecting which reports we will
>-	 * forward to userspace while filtering for a single context.
>-	 */
>-	stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
>-
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
> 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 3cc1d88fe4a51..7566fef55b0ab 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -222,12 +222,6 @@ struct xe_oa_stream {
> 	 */
> 	struct llist_head oa_config_bos;
>
>-	/** @specific_ctx_id: id of the context used for filtering reports */
>-	u32 specific_ctx_id;
>-
>-	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
>-	u32 specific_ctx_id_mask;
>-
> 	/**
> 	 * @poll_check_timer: High resolution timer that will periodically
> 	 * check for data in the circular OA buffer for notifying userspace
>@@ -261,9 +255,6 @@ struct xe_oa_stream {
> 		/** @vaddr: mapped vaddr of the OA buffer */
> 		u8 *vaddr;
>
>-		/** @last_ctx_id: last context id for OA data added */
>-		u32 last_ctx_id;
>-
> 		/**
> 		 * @ptr_lock: Locks reads and writes to all head/tail state
> 		 *
>-- 
>2.41.0
>
