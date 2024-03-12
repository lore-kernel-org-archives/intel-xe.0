Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC3C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 20:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7870D10E37C;
	Tue, 12 Mar 2024 20:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lV97A4LZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E4B10E8F9
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710274658; x=1741810658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=prQc9DsDobPC2um756llFpHe9p5kpktFZaXUz0HnOTg=;
 b=lV97A4LZ89fyhnT+TXF5n2LVRU/ZyPcCHsQVfMgQw2LcVp0DGhE9N0hc
 MWnlfRTEyBnBWbUl4VPsOU0ZDXSc4mm05zyp5mzYRmRr+wrRNtOZMYk10
 wcRTI21AjrhnzwVxBgyd9qd05MQb8oT9Zz9VeFPcUlLHSJST+BtcwuQgy
 uPzCdojacvr92c2Z7el0lOjdG79wSiYokw7AYRzMlVms2cWtevCQ+uCny
 aT+gKpFoVgvfcuYe9X0tcl8bTlwFeAikW7SqCna7tzWf3dK+BnikAJ9+I
 X7L/Zr25EeOo9VxJNuPAZw7J+64Urktl678BoYNic2oqrgErxkrLzduCA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16410053"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16410053"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12123134"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 13:17:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 13:17:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 13:17:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 13:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqiDyOk9FfQ//jjGBlIq2fMgFY4MCb6o2U2OU4kM/kXZeWXjH866XZ4nI3Sq56OBThKaYl4piLhV4OBpSmDewb7Blmo5Gd1tkMbPhdjWjsTd2ac77KuZ5bfmAoYFJnk3FhksiZnS+D/ExZA/Dqyyic/mcKxdKvGxSZIkuYFXxvlXVrUWmY32ioVEI4EvU9L2EMzj+oVhMHY8AQnNdNQJ48hgq763eed9lS3JBymj11G1Jd/QNPUfH0SJqo0QySZX9/Puh+wJRRC7WxUzrsB2mNOoMuxPehkbibQDZjRm1tL9NhkhkNAuKEGKhOOx/wjb3+48yk9kBugcmkEfaRix3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99HEx94ARAbZXthje6/7jzVDULCcyN8xhNGpnUhYWyk=;
 b=FWqE5jVXEb+CF8E9kPTWovZ1WVq1HftSUtcLI4gDZc3oexB0n/IqMLzzrrFxEf3e63AVz/BM6xpggFipvMCDJQzU8HA608hcDJ4MVcq1//SiU9F/1bY3vZKbiY4xhbLfo28SinATyOg8gJ6MCiSHSp/IVtpfnAWxeJB+hGnmIqkPah3C+aTrpP/BBbzjUzHgQ6CG3Xi0h5V27xm02gJluNhHAgALeCV74J2qHAbpiaESH7m6tL6UFJ2RHp4BX/JfyhvMP/NkBouVpZa08rT4LBS+kcIfP6HTynBTn+L2xkErN3yUmqFmIsgv/u+66yAgqHt7eNeDdSjAS5vph3ULxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 20:17:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 20:17:25 +0000
Date: Tue, 12 Mar 2024 13:17:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 17/17] drm/xe/oa: Enable Xe2+ overrun mode
Message-ID: <ZfC4U2RBxS8dOza/@unerlige-ril>
References: <20240312034003.2747815-1-ashutosh.dixit@intel.com>
 <20240312034003.2747815-2-ashutosh.dixit@intel.com>
 <ZfC3lpWKNqlEGajV@unerlige-ril>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZfC3lpWKNqlEGajV@unerlige-ril>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: c2420038-323c-4ee2-1226-08dc42d16ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqV6gkwZSg5eyBUWEN9NKk6hNlmaU8z6yjzlcmiBq02JwEMyYj9qskyljBqlmG8qIV5wtzPAvWI/rEbYx4xCWy6v6nMTTLn/fdZhm1N9uvuVJ9Gf9OPpRkF1lQ/KHvEqZ53Oc5qGbQj9/NbDKRA2Juq2auKc9m0RgXGDIL5HnOmqJvgc7MyGyZ3M7mq/Q3Z8v0//Ys91A1i95wzkgskgu3nk0cSFM09r8s8Y+8uhW9BGIwaixFzOpUOTLGmW6z4ZYuOrrP6fE5VChRmOerqj8pVAl0EO0WoHheurn6PNHfuyq44q8OLauYxrk0nznKrFTP9xE3w/vGpIHYLOMFjc0YojQ2ush5O27yqQ8xLY/Gt4OOnak1GGUA5jU/V9rSEEJwpHbi9XSqh+lDCDz1fsJTsxHqCLugPlb6IsZYOdJ9aLDB1XgTA0RuaK2xfc2vYilo+xzfykQcX536nfcwVUiFqACDi8dMPwVKbMaAZQUA79qPx7KQygqEc4gm6soz5fhNVf0Hs0Gmxerm11eMXNub8POXapFBiY8cTICNoqZUK1UDeIoF+uTBzRtdp6dJYhpPtcpNu6vMlMx13rdGfwQrwAmD7wZXoEdVqnVfQOyt0V7Ycbsc2WXkvgL7LMHBKghjVwaKI/zVkvD4bmzzEFZSAkImoJ8ErhZzQedNZGHOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME44SnBSTG9FZjNKc1ZVeTM3eXB2MkZCZmdNaVNJTkFCODlBTXJYQWpRWThQ?=
 =?utf-8?B?Zjc1aWRiZVQxZTZZRkJZRjdmTkRkV3RtSC82U1F0alRXZTZ3aHBmUmJkdkdD?=
 =?utf-8?B?RTViWUJ1SmdFQjV0QXJGZ05SWkpOaXoxcjZjTDdoTmpSODUyVmNaMzRaWmpZ?=
 =?utf-8?B?VjUrQkdBeWFxRDFkTnlhaDJIWXlwMTROZmd1U2cxZ3dCUUpULzJyZG9NdVEy?=
 =?utf-8?B?bGI4REdKQ2NhUlNTRjI2emVBT3B0bDl6ZGQ0ZmFEeFJQcUJIZUx2ZzdhWkEr?=
 =?utf-8?B?bmtJZDhhSTN3UUR2eU9zRjRJMXpLM2U0YkFLSTJkWStHUTdrMkkzYlJWUHUr?=
 =?utf-8?B?aEZ3WkdIRWV5ZGF1eWFpaUZTZFI5TllSWUtnY1hJdVZuRy84U1lPbXpKRU41?=
 =?utf-8?B?VGl4N2RzcWJZVmFubUlYcStiQ3gybDBhZE0rT3N2WTQrdG96OWRLSS9lY0tV?=
 =?utf-8?B?QlpzNHBaZzRUaWRmcUtMZ3o3U2QzWjltazVsQnlqcE9GVElCSFFCUFJ4ZTJs?=
 =?utf-8?B?dTZOMnhIMnVodGdtUlR0YncwQUhyTFVUdFVETDlTaDhwa2R3OXVrZnZ0K3Jj?=
 =?utf-8?B?WFJXZDNqS2FRTjEwVE5kZ0g4OXFRVHlmUVkxazhJVjJzY1F4eFVnbnNYOE9S?=
 =?utf-8?B?VXdQNTFveVUxcTBmcDI4VnZydG9FVzB2R2JzbmlPVHpqaVZ4NDNUbWx6bE1B?=
 =?utf-8?B?L3o5M3ZoY3M0cks3OWlMTGQ2eE1OYllSTndTeUh1R25qT1QzVjBYNkwvU2Uv?=
 =?utf-8?B?V25NTHo2QVZpUmJ4Z1RuYmdYZzk1UXZwVWtjSEpqRk9EUE1PSDFPUHljYXMx?=
 =?utf-8?B?L285cTZtbEQxMy9pRzVSM3F1NXNQRi9wVk5zYWlQTjE2eFRmc0MydTgrM3kz?=
 =?utf-8?B?bGlvWEduWWc2N1dPRGVwL2ZKTmJFK0VLMmVyem8yL2RhVklhQ2gwenVya1ZS?=
 =?utf-8?B?YUZ3TXlHVUl6VmhNcmdDSGpoWFhNQVBmb3o0MHI0UlVnTDZJTUJwWVBMUHJ0?=
 =?utf-8?B?cXl0eUpwUWk3c0VaUER5R2pMRE4waDhEWnh3UGdpUS82UkdxWFRQZlhZdk14?=
 =?utf-8?B?ckhraTIxVVZiR091TnFHc3RKMldELzFVMzBqbC80cjRXY0lkMkJPVjNJTkhW?=
 =?utf-8?B?dnNSLzV1SHdjUkJFd1BwSjJ4OGZqckhMZ0c2Ri93eW9xc0FRYkpFQXhDd1VC?=
 =?utf-8?B?T2tDeExMTWhWcXFnZFJMSC9iWVBBM3hwY0xRSmkrSXJnZzJzemw4aEVmVDZy?=
 =?utf-8?B?WTNKaW1ZdUFEZE83NFJESHhyRU04dUZidmNOUGNHbjNrTUxSaGlnUWppOXFF?=
 =?utf-8?B?MWRsRFJRZVpJWExBcVovNVpUZUVoNy82SGt1TThiMFFiNk9qNUV0c2xYWm9u?=
 =?utf-8?B?UVJNRkdYSk9oWXU5R3IyaW53WG5UUS9ubkpTaURJQzhJMWNOSHRRVlJNSkF3?=
 =?utf-8?B?djhQR25ZMUVUaWlFR1ZiYmlDVmdrWjdOalI3ZG5zTVVQajloTzFjby84Vkpx?=
 =?utf-8?B?YlFiKzNTWXRKSFJZWlFyN0xYRFRDWHdybE80V0N5Q3RPYmpxeFNJS283aDRC?=
 =?utf-8?B?TzF1ck9OSStYS0ZkZytRR0U5VTBzaHoyODJrZ25zWE9TV0NIc2RQSkwyNWtj?=
 =?utf-8?B?QXJVbllMZ3hBNnI4SHdkcU1MT05aM3c2S1VGc1kwOFJyRkRuNWNENDE4UTB0?=
 =?utf-8?B?QjN2cm9KUkVETVhyWFJiY2NsTDZQa2QvQVQ5UEl2STBpT3FtUkRvYStlRWZD?=
 =?utf-8?B?MnBjK3VlYWVUYUZ0ejVWSG1OUmVBRnN4WGVNSXN4akFnOU0xR1FLY3BqNGZZ?=
 =?utf-8?B?TU5jZklwTXNxNXIvLzZkdjQxSGRMVjhRTU1LU3JPQ1pSbGh5M3luMGtnQzc2?=
 =?utf-8?B?NWN4aXR5cy9DRVY1WjlGbkxkZDYyRURydHA5Sjk5NGVzSW00STJoWkl4b1Q2?=
 =?utf-8?B?Y0V5bUVpdUZONTJoamxtdklQSTh2NlFXcVBkQUdzWDJ3RTBSWTA5d1ZJQitr?=
 =?utf-8?B?M3VwNVJRRC9uRkc2ZUFuRngwWmdCUUVCK1ZQWTUxTXQ3aUd0d1lJNjZPbjdX?=
 =?utf-8?B?L2pRRnY3REJHZjhkUE9hUFVseDBua0hXeG56dE8wT2N2M2NOSnAyb2g2RVNG?=
 =?utf-8?B?Uyt2OW5xUTI2bHZpV2pYS1dHTFFtWTg3OHYraytucWF4NTRVYXdUYmROMVpp?=
 =?utf-8?Q?tT3VUHeGNma8GJgGNwE4wbs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2420038-323c-4ee2-1226-08dc42d16ea2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 20:17:25.3770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvxdCK7hPHuxAFDddezjLKJwzHfKUllT+2Cd/dIiOAhBSSlTBR7r2RfyOsrkGSck7vh2Mv3M2zOCthuCpvKMARDSrlud8NCcUW5r6/LKqIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Tue, Mar 12, 2024 at 01:14:14PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Mar 11, 2024 at 08:40:03PM -0700, Ashutosh Dixit wrote:
>>Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
>>no partial reports at the end of buffer, making the OA buffer effectively a
>>non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
>>the report size.
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_oa.c       | 36 +++++++++++++++++++++++++-------
>>drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
>>2 files changed, 31 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>index 6f5bbb0787d9..6a0d2e229254 100644
>>--- a/drivers/gpu/drm/xe/xe_oa.c
>>+++ b/drivers/gpu/drm/xe/xe_oa.c
>>@@ -106,7 +106,15 @@ static const struct xe_oa_format oa_formats[] = {
>>
>>static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
>>{
>>-	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>>+	if (stream->oa_buffer.circ_size == XE_OA_BUFFER_SIZE)
>>+		return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>>+	else
>>+		return (tail - head) % stream->oa_buffer.circ_size;
>>+}
>
>For ex: consider a 16 MB buffer with a report size of 384 bytes. At 
>the end of the buffer, you would have an empty space of 256 bytes (16 
>MB % 384)
>
>(For ref: 16 MB = 0x1000000, 384 = 0x180)
>In this case circ_size = 0xFFFF00
>
>Let's say your head is pointing to 0xFFFD80 and tail is pointing to 
>0x180 (essentially there is one unread report at the end of the buffer 
>and one unread report at the beginning of the buffer).
>
>In this case, (tail - head) % stream->oa_buffer.circ_size, is not 
>calculating the correct size. Should be 0x300, but I am not getting 
>that. Can you please check/verify?
>
>I am thinking we need something like this (roughly). We don't need the 
>mod operation.
>
>static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 > head)
>{
>	u32 available = (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>
>	/* head is always aligned to report size, but tail may not be */
>	available = available % format_size;

should be

available -= available % format_size;

>
>	return tail >= head ? available : available - empty_space;
>}
>
>>+
>>+static u32 xe_oa_circ_incr(struct xe_oa_stream *stream, u32 ptr, u32 n)
>>+{
>>+	return xe_oa_circ_diff(stream, ptr, -n);
>>}
>>
>>static void xe_oa_config_release(struct kref *ref)
>>@@ -280,7 +288,7 @@ static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>>
>>	buf += *offset;
>>
>>-	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>>+	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>>	report_size_partial = oa_buf_end - report;
>>
>>	if (report_size_partial < report_size) {
>>@@ -306,7 +314,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>>	int report_size = stream->oa_buffer.format->size;
>>	u8 *oa_buf_base = stream->oa_buffer.vaddr;
>>	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>>-	u32 mask = (XE_OA_BUFFER_SIZE - 1);
>>	size_t start_offset = *offset;
>>	unsigned long flags;
>>	u32 head, tail;
>>@@ -317,21 +324,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>>	tail = stream->oa_buffer.tail;
>>	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>>
>>-	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
>>+	xe_assert(stream->oa->xe,
>>+		  head < stream->oa_buffer.circ_size && tail < stream->oa_buffer.circ_size);
>>
>>-	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
>>+	for (; xe_oa_circ_diff(stream, tail, head);
>>+	     head = xe_oa_circ_incr(stream, head, report_size)) {
>>		u8 *report = oa_buf_base + head;
>>
>>		ret = xe_oa_append_report(stream, buf, count, offset, report);
>>		if (ret)
>>			break;
>>
>>-		if (is_power_of_2(report_size)) {
>>+		if (!(stream->oa_buffer.circ_size % report_size)) {
>>			/* Clear out report id and timestamp to detect unlanded reports */
>>			oa_report_id_clear(stream, (void *)report);
>>			oa_timestamp_clear(stream, (void *)report);
>>		} else {
>>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>>+			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>>			u32 part = oa_buf_end - report;
>>
>>			/* Zero out the entire report */
>>@@ -369,7 +378,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>>	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
>>			gtt_offset & OAG_OAHEADPTR_MASK);
>>	stream->oa_buffer.head = 0;
>>-
>>	/*
>>	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
>>	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>>@@ -1256,6 +1264,18 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>	stream->periodic = param->period_exponent > 0;
>>	stream->period_exponent = param->period_exponent;
>>
>>+	/*
>>+	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>>+	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
>>+	 * buffer whose size, circ_size, is a multiple of the report size
>>+	 */
>>+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>>+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
>>+		stream->oa_buffer.circ_size =
>>+			XE_OA_BUFFER_SIZE - XE_OA_BUFFER_SIZE % stream->oa_buffer.format->size;
>>+	else
>>+		stream->oa_buffer.circ_size = XE_OA_BUFFER_SIZE;
>>+
>>	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
>>		/* If we don't find the context offset, just return error */
>>		ret = xe_oa_set_ctx_ctrl_offset(stream);
>>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>>index 6984e7d04be5..d8d5c9d8c22e 100644
>>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>>@@ -163,6 +163,9 @@ struct xe_oa_buffer {
>>
>>	/** @tail: The last verified cached tail where HW has completed writing */
>>	u32 tail;
>>+
>>+	/** @circ_size: The effective circular buffer size, for Xe2+ */
>>+	u32 circ_size;
>
>You could store the difference here instead.
>
>	/** @empty_space: empty space at tend of buffer */
>	u32 empty_space;
>
>Regards,
>Umesh
>
>>};
>>
>>/**
>>-- 
>>2.41.0
>>
