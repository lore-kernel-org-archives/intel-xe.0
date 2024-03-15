Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D95C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 00:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DE310F6D9;
	Fri, 15 Mar 2024 00:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoczxOSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31210FF1C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710462470; x=1741998470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UAwP9ehGc/4Rwq0hSQb4CE/amzHYJm5rUc7WOGuK8BY=;
 b=QoczxOSKcBesj25WSEh2NnyKHYViPJr8QhIbAn9z8v51zwH9mEw70b7I
 c2U6MHuiVI1wCP77MJIIzSD6C6hYO4THha2mIlSHiJlXuMJXuKupkYDu9
 SozspSo73lUBp1S7wY8DrjuVOP/aC2WxJBuYRh7NRuOYeV+b5/r1g489u
 RWifikyMfTM/4iX7/C+UjVjs6sh/4YGBsq55Ccr085eDFbUSPUB+YqjKs
 BjMUx0Inn5o5w2AxpIOMEfzKLFEVgxiW2wm34EkB8kw7yQRbB3RWhLIpI
 Hp7CQ3cicTNpDwYQBqWELMHbMrucCkRF9fJ5h7hVslLKE3OlqHT5ja0jy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5520133"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5520133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 17:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="13095432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 17:27:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 17:27:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 17:27:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 17:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6JuToXztnrLaLqoFss9KxaMekC2q3SDQUXg51gnJLsnornI/unaZRhyIDOJuTG2DqXoK5qoyT7XToSClYnPPjfSOxIz9t8PCpgbNmGv2LgZshS8QN6xW10cCfFw93FWsyVdopQYf0EKkOTXCA5HKWhpPwbVzeXXofMmOh3tf1vRXu8JcPRwLFSFsuQ+luZcLFjE2EoSytdYC1owKzfTdYlDYyfe4pGyFU55fhax7WdCVZIooYG0guLbhyUbXPADn7gAsKuWzq84NgiOutLSu7UgG9hjq3btInvsfZXqcNwUJ4EUWDRYjXqonvt+SzIigQJmwB3qAX02G+Fr8s8TKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X74Muv7TGDX3C13T+negiTjvk3ZOci9/jDefpeJTMIc=;
 b=Twt0wBrhfuPASW/7swxwWY9lVslmAFpKD+idnTlxfXD3jFTZ9y9HaiYUuajBljAldNqh8ZPGiSNtSOQJNNMT9WST4bp2/KFI0rWaTnKPa5vvgLGzM24BmjFvJI2jEjmOULLOO3JUhmJVCFFtl5+c33X0P32pJ1/Z+wGTWwtQ57HXmbmHArcrH9k+/zWEJYPf2KEcx/d2APL1m8diXSuVU30cg5agvTH6yKXw70YySxw4lV/KPG8M89YYvjC+XEQGRfGzqSkqLOtGvbdpUJAz6kY8hxtpHtA3OmLWsMJssMC1jbKdr3rzgae24+WPgIcpFRPdc1trxSGk1CG+QjjI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.19; Fri, 15 Mar
 2024 00:27:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Fri, 15 Mar 2024
 00:27:41 +0000
Date: Thu, 14 Mar 2024 17:27:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 17/17] drm/xe/oa: Enable Xe2+ overrun mode
Message-ID: <ZfOV+99QEh8NPds7@unerlige-ril>
References: <20240314032532.2813165-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314032532.2813165-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: fcacc77b-662c-495d-cdd8-08dc4486b9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1W718YfGeq7XTL1YP3ABqnlmTJng6UnLM7q6hGK4//2T2NoqIE+/BkJnYmuckD6PHc5Z0kiPXkmEY817L3lO9+pX4utgdw4pQfYN1nePndtCuQJ/HijGc7LJ1y7h1VUt4g6iUNv4e+jGPbcpt6Yb1bsQULM2EPOoa1+JUWdc5fXCYLPJkhxd84h16kGAj/pSIFH7fPT3B1HXVMbiH2kEfc9W5RTCzyp87UoYTA1wxS25FwCiUWsVjgV0Ryp1d4KcBlln3VcF8Rfd4tluzbFhFqC8lefkMXWXVlgA1+5sEPncp2Ff7q9jSJVVo79lLtgFY/hV3l96vkl2TQ0Off89BHUelOsyVHS5BNnBZnfsxU+opElkz7VD5YIgSYYr3PZNVWijCixCh1ijhP6y0US8vXHUBP5vWPKQatUcb8eF7RxsHEf1pxOChVWTCcTeTmOqh7NEq4c7n8lcryLOe7wxeqsNRPm3HVY+SzaHiHx3HMH7XGvYWPqgZPec5GBv7+/UFg0K4ASEoPbYrlAmDd9+PZffb0kAnLocsFWpuXNiIm1cQmIXcjcVWWd1j3UgjVoJOnida4ou0h9Yz3aBaidTc8JUeDr6zNM/W2wbd3+xFAGJWw9yfSOkB8JEXTo6gGT/SDDtQqlZH8Qdj4mXlXUgaWLhQp6VOG+ugzxoeWS7Cwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VCZW9RUkQ4cElMNzZqc0xhVlBqbUlOeHFVRHRuSHNXd2VoWnNvbzJBWlZI?=
 =?utf-8?B?V0d5NkgvVEkzL1RnUEtieGxEY29QaVloZHZFbTJHd1VKS05VcVVCVzkvaGtB?=
 =?utf-8?B?bTlobFEzNkRnVEt5SlU5QWhibUdWdkVNUkYwalBwSnVkTDNvUkpuM3VqWW5n?=
 =?utf-8?B?SnAwMmdPdXY2WUxvdU1ybXhrdlJCdC9HZDVBM053clBBVVFrSEhGeHJTZ3d5?=
 =?utf-8?B?STJqR2N1OUZRcTJhZURucC9UTitJUWU1L0U5Rk41Q0JUVWpOaW9SenNKMTVU?=
 =?utf-8?B?WEFPZWpnNXBkZVY1RExyeFAxZDk5ZTVpVEVkTDRVVGRsZldxZGV4T0YrQTEv?=
 =?utf-8?B?bWFvNzFTZXpDSENHLzVQYTZVcldtUGROaFQzRTdUS0h5VWM4ZjVwT2g1L1da?=
 =?utf-8?B?ME02VGVma3V5dStPWEVuQ0dQczhhL1M1aXRlaHZMTFo1c1hOUFM3SnFMWFkr?=
 =?utf-8?B?aXhIQ3ZhZEFkWlNnNUVtemxZc1FOQm53TTlUdTZNeDhqLzhkU3R4QVg3akpq?=
 =?utf-8?B?N1pmanF1T0NuK09JUm9CaHV2cXQ5S254S29EKzRNeXV2VU1WbUxjRWgxWXFk?=
 =?utf-8?B?Q09VcDBuVS8vSmdPaXluZWYyMG9QYnpreDc2UG9uQkYvM3NxeVk4WEczc2hK?=
 =?utf-8?B?VXd0TFFmQ2JJeUFhSTRCZUQ0S0V5V2U4MzF2YWVQNzNOeWx3d0dXMTN6aDhC?=
 =?utf-8?B?bHFnSTMydDdPbVZobXgwS3ZEZExtSVdpVnZSK3Z5djhiWDk4bVVOdy9CM2VT?=
 =?utf-8?B?UHRoa3BrK29qYURLdjRJNGVhcGN4K1ZucTlKa2RTam1PWUpIV0J1cForcW8x?=
 =?utf-8?B?ZERMRUZLeHI0UzBlZVlyVXNHTHIzWVlDeEkvbmtZd0RMTHR2VXV3MWswRkJF?=
 =?utf-8?B?aUxkbmlieUROQTZRc1pvMW96WE9aVXlVNFRrdGhEN2FpeE5zUGY1bGt5Y2JT?=
 =?utf-8?B?dW0xSzJBSGg0TXVqMldwSHA4bkI1WnA2QXdtWnFRaFRzVG5tcmpOeWV4Y084?=
 =?utf-8?B?dHplZXJzLzJYT0R1TWpKMis2bmg4dUNhR0pxekZvOVhHeWZzZXpCeFAxSXhy?=
 =?utf-8?B?VlBwQU5iNDZFSjlPUTk4M3JGbXlkTzFZaG41VlNZdmdwWWpYalgzUXZUT1hB?=
 =?utf-8?B?MWlyaVRvdEkxMUxjZ0FZSGZPZHVFdXZ1d05Na1ViKzNBZFVoWDdrN0tURS81?=
 =?utf-8?B?WXRsZjYyOHd2MG0vTG80NHhKcFNEemhmb2xwZFBadnEzMFBTZVFJTHdzWHl1?=
 =?utf-8?B?K25vSWVsMDhlUzZCSStoYkpjUzdBK2VVY2h3TjNNNkZlRXZBK3RQWjRZQ0hl?=
 =?utf-8?B?UytiMC9raFFnbFpuNWp3S2hadHJ4ODJ0Y1MrdTRRZmxQTVB0ajBRT1RrNERx?=
 =?utf-8?B?RFBJOE5QZkxDVFdBSWkzd1dtT0tXV2JveG9idmxubTQ1TEJuQk5INlpiMkRz?=
 =?utf-8?B?MUxGaWVVa1hzN0VZUUx1U0R4cktYYmtwMjBqakJzZ1JtY1lUWW5laXNXRWxZ?=
 =?utf-8?B?dWd3QUthSTlrK1ZkNTZ2akxtNUZKUmt5Y1hvWklIQUZET2VYN3lLWk42cUhs?=
 =?utf-8?B?ajVrNXhIQnBrUGh3T3JnT2p2aHRtNHZ5YUN6WDMyTFZKdS9uVG1HaHFkWE81?=
 =?utf-8?B?bE5iaURxR1VBS2Zqc2wvNm85SXFGSW9mUlZNU3Q0UmVPdGxOTGJOTnpmVmFt?=
 =?utf-8?B?cXlRUTNGSTlkdkEzSDJoelp3NkEvS2pROVFyOEtVMlQvNmlpMFZzeXg2a2xJ?=
 =?utf-8?B?RExJaVRPT3Y0TlpGTGhxQllrdVBza1NTVm94bTE4ZEVVU0RudlJWY1NQT3I3?=
 =?utf-8?B?MHE5QWw1L2ZtM1Qyd3dRTW5uV096WGkvc1NoN2Z3SmZLNk1XNFA5SFB3TmJK?=
 =?utf-8?B?TVF6ZkRWM3FDTnhoYkVGNnY3Y0pJTWFzZnJoZWFwcUgwaHFJYmYyQkIyeEdD?=
 =?utf-8?B?R29QREM1ak1hYmtENnlZVEJ0U21ZVFgwOTN1cnBPZk5NeW85R3c1dVZ4eVZ4?=
 =?utf-8?B?N2J1Rjc0Q1F3YUpDQTV2SSt6aEc3bktTcnEvM1VVTVNPRis5bktybVFpQ1lD?=
 =?utf-8?B?ZnZEUTZlRFBheTlWbzRpZHVYendCL1kybWRLVTZTWFFIVHhjTmpWOTAyL3Zp?=
 =?utf-8?B?MkxHTFBqelo5T1J5ZjhEemtpTnFGclJqbm5IakZDVFRseTJlWXJPRmJ4ZTZJ?=
 =?utf-8?Q?h61UDLsZ5je5A0XMWnnYdbk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcacc77b-662c-495d-cdd8-08dc4486b9d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 00:27:41.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkS6QnY+WxkF+EmPwUHMIcJPxAYXioSeplyX0qTdRg2DDYMXcz0SMMn6OTDhtm9YHeveJqaW5w/USbcOKv2QB0jJtg9i0PKFzVlfiE7ypZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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

On Wed, Mar 13, 2024 at 08:25:32PM -0700, Ashutosh Dixit wrote:
>Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
>no partial reports at the end of buffer, making the OA buffer effectively a
>non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
>the report size.
>
>v2: Fix implementation of xe_oa_circ_diff/xe_oa_circ_incr (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
> drivers/gpu/drm/xe/xe_oa.c       | 35 ++++++++++++++++++++++++--------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
> 2 files changed, 30 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6f5bbb0787d9..1ad17cc14532 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -106,7 +106,14 @@ static const struct xe_oa_format oa_formats[] = {
>
> static u32 xe_oa_circ_diff(struct xe_oa_stream *stream, u32 tail, u32 head)
> {
>-	return (tail - head) & (XE_OA_BUFFER_SIZE - 1);
>+	return tail >= head ? tail - head :
>+		tail + stream->oa_buffer.circ_size - head;
>+}
>+
>+static u32 xe_oa_circ_incr(struct xe_oa_stream *stream, u32 ptr, u32 n)
>+{
>+	return ptr + n >= stream->oa_buffer.circ_size ?
>+		ptr + n - stream->oa_buffer.circ_size : ptr + n;
> }
>
> static void xe_oa_config_release(struct kref *ref)
>@@ -280,7 +287,7 @@ static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>+	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
> 	report_size_partial = oa_buf_end - report;
>
> 	if (report_size_partial < report_size) {
>@@ -306,7 +313,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 	int report_size = stream->oa_buffer.format->size;
> 	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>-	u32 mask = (XE_OA_BUFFER_SIZE - 1);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
> 	u32 head, tail;
>@@ -317,21 +323,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 	tail = stream->oa_buffer.tail;
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>-	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
>+	xe_assert(stream->oa->xe,
>+		  head < stream->oa_buffer.circ_size && tail < stream->oa_buffer.circ_size);
>
>-	for (; xe_oa_circ_diff(stream, tail, head); head = (head + report_size) & mask) {
>+	for (; xe_oa_circ_diff(stream, tail, head);
>+	     head = xe_oa_circ_incr(stream, head, report_size)) {
> 		u8 *report = oa_buf_base + head;
>
> 		ret = xe_oa_append_report(stream, buf, count, offset, report);
> 		if (ret)
> 			break;
>
>-		if (is_power_of_2(report_size)) {
>+		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
> 			oa_report_id_clear(stream, (void *)report);
> 			oa_timestamp_clear(stream, (void *)report);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>+			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
> 			u32 part = oa_buf_end - report;
>
> 			/* Zero out the entire report */
>@@ -369,7 +377,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
> 			gtt_offset & OAG_OAHEADPTR_MASK);
> 	stream->oa_buffer.head = 0;
>-
> 	/*
> 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
> 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>@@ -1256,6 +1263,18 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
>
>+	/*
>+	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>+	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
>+	 * buffer whose size, circ_size, is a multiple of the report size
>+	 */
>+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
>+		stream->oa_buffer.circ_size =
>+			XE_OA_BUFFER_SIZE - XE_OA_BUFFER_SIZE % stream->oa_buffer.format->size;
>+	else
>+		stream->oa_buffer.circ_size = XE_OA_BUFFER_SIZE;
>+
> 	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
> 		/* If we don't find the context offset, just return error */
> 		ret = xe_oa_set_ctx_ctrl_offset(stream);
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 6984e7d04be5..d8d5c9d8c22e 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -163,6 +163,9 @@ struct xe_oa_buffer {
>
> 	/** @tail: The last verified cached tail where HW has completed writing */
> 	u32 tail;
>+
>+	/** @circ_size: The effective circular buffer size, for Xe2+ */
>+	u32 circ_size;
> };
>
> /**
>-- 
>2.41.0
>
