Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A82C41535
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 03:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F9910E30D;
	Wed, 20 Dec 2023 03:06:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7264F10E30D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 03:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703041562; x=1734577562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x/KnwRlkkSvOBmHMVILgnnmayROnnFS4mAO5HQUt1Hs=;
 b=OvKjuFusmOrWVFgpIrbnV4SKeuny3eFcR6qNBMTT8qVqDWM3QwwIAQYa
 qqfmMaaGR2N2l19iYTrMCQ3AjA4YtcZwVFVR9BSLJE3NliXBxKIWIIlfZ
 zKIAHj0kFGPr2lsmomlk73DZRqt9ngN7/FZgV4M+zLjLrKsSVqqluofsO
 Yoi5+RhvTMAOpZj8lAz6DOkIbQI2um0lvl63a2XcMlUCPhZi2CvvYx1zg
 lhCcwrLvuDHiaecIb8ilGmc6KEtjeafMX1hqJK84UAuFLxVU3km8u6l8P
 8RQs6YqJKda3i4mne1y9S+QEZCwJA93HWMZMApJGjBDVP7raBJUE4mVNd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="462205003"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="462205003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 19:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="18124192"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 19:06:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 19:06:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 19:06:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 19:06:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6YheKAIZ7RYkkSGbGAuvOOlobywDXZx//XrVaLEKTpnGQT5tEo7VYU4khD+EolRJGjqS5Bvf0qe3DRaN91rJ9DnNJqucks5UcCaqbNXCSxqqxf7WNTBnTw8NcdcDOFWOBQosLIqHl2KfQHw9z62ph4XpD6Gp8laGLhCb3/N3EJ8s114HYjCiRh4NdMuoMXEntgQyDnXV4QqtLpe6xAGkOQKAiVnSwZz9XtUYXHLAdMs5YhEBTgbi4cw7JZvHrXqqtPBwwKqBBraLuPXvO6nK4h/9y4xmjyy4lpFqC8R57clZeU2d4Wk0s149LljZGGYTuEaIH9uxqDDkYg6azjnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRI+kkubvqJUwwG19ymIdf7ec8hhR8BHV9dz/D5geyg=;
 b=Zb4hQdpqvBZFWfcvtDeZHjKkhGdkGjtEgkPru10TEY3zVZqCtcw4Nilgm8vIlVu3Ba/m6iOncCWUVEqvof5rGAAEClg+zeGPHfm0gLae74xvo8BcClpmrAsU5pmUYNSygZqSyKbeR08SgYfiNAuaMuFzq2g0Duh1eKULdsVBYi03dkzHO6PF5XJpfisYzbYYn+7MSNoG5fscaGfjl0z2wj709NyYYL62iAUW/QP3SoXxPcshisrJxlZx8rh8jj5zxBfCxJtndE0auc+ClqLu2C7zM8rkLXLkCPlmCVjAviWqiwQYBREx6VtgMY5gFsZHWN+JGASGqZSg3JuRuzj9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Wed, 20 Dec 2023 03:05:58 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 03:05:58 +0000
Date: Tue, 19 Dec 2023 19:05:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 11/17] drm/xe/oa: Disable overrun mode for Xe2+ OAG
Message-ID: <ZYJaFBlMAjHcS7Z9@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-12-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-12-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3fc754-d383-4aa2-99d4-08dc010896d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnBG9nRHU4cZQsHLgsYXqotgkqVErp7xnt0l+jlY37SJ7DtN0tVNmLlgH0AN6HLLluveyxptBuyOu5uNquz67IuEvHfSLXRgzUnwbfULlwCrChRDSmoHDpv3Z2iB7rx8Ni+efwFfS7ulALVub90HbbR3l/XtUej5kG9s8hC/0XLb6FF6voJGDrXDqNvLhAcnG6kvr9nI7JexS0hHijUEmYrfcWzAh9tjnrIOCbGbM+bARNvqg/rX6wuhPgj52JcSG+Koy4jm5S4iU/eMZuK40qiLjBEmM0dipkEAukHQEAXW3hGjlDAuU7OU3mIgkcooYiS9j4lbCXvvrgIFokQaz4qFNmCNu9yc0/vD64J0D0STt0egb9iziBxI7aXkKb7JjSNpq6emJNBfqSo0IVguzSS8riF5dLBkhVaNUmdnNf+mGx0EW2JpCnOP90Nx8elryH9bIOSnXWKCu+o/G4xH3gsP9uZLg91aDPPFrj+iXaqv3HG0gS7GEAdWI+Ea3slYTXxsO/OfhMU7Zk3i704QG5C7M6SWTpbIvY7Ngo+A/Q2J/GpWuYbJVD8Bv5zAgODr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(2906002)(82960400001)(8676002)(8936002)(5660300002)(6862004)(4326008)(6506007)(41300700001)(478600001)(6486002)(26005)(6512007)(9686003)(86362001)(316002)(66946007)(6636002)(33716001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFWM3VTZ3haN0tGL21mMkVaaE9pWUxYZWpRM2hNemJjZWxET3pyVjl4VHo5?=
 =?utf-8?B?cEVJN0U4N3RYeVdkTFFBT2N3aDg3Q0d2bFZaRVdVVzBqT0xyS1Fna2w5cDgw?=
 =?utf-8?B?MkNxdFRxWklMNGoydjdsUUREcWFPK2tIRjhCWjF3SStteHpMVDBDak02cDh5?=
 =?utf-8?B?Z2cxempZWTFCSno1d1AwakVmU2ozZ2pjYmdPRWdUUlAvUmZzMjNTWjFTQkpq?=
 =?utf-8?B?STExYnNSQ3RXcTNDYlAzYXQ4TlFHdkF4cGlvRkk1Vm10L3V5M3ZwRUFxNVBO?=
 =?utf-8?B?c1NtNk5xNXpvT1FJYWN2Sm9sZnFyQVpNUEQ1WXhva2VnMnhtS28xbmJPcnlM?=
 =?utf-8?B?UG5vTDFTdVdDL1pFNnhrMGN0QlNYQmlKeTZGaWo0YVJkWFFXMTFpYVJkeTF6?=
 =?utf-8?B?M09uT3ZjaXZsWTh2UnZnOWNDZ0dhajN2WlFZVlUvVUEyVGRvRGVsZEVQRzlz?=
 =?utf-8?B?MFZSWFMxMm9KVVJ2b2dRc3NyZmRDSGU5SWpQWER5MFdmRmlwcktSdVpvbjFB?=
 =?utf-8?B?RXg5RDQvNFlON21CUU1QajdCdXdwMC9lbmVacUpTYmVCWFJCZ0VTallZVjha?=
 =?utf-8?B?RTRBNFdyMjNFQ3ZFNHh4M2M4aUEyNDhEWXVPdGxWaEZ4VzlSREg3U09oeDBE?=
 =?utf-8?B?ejZLd3VyVEhXT3o3SWdnblArWE1ueGZYdzQ4UWxmc3NDSUdqTjUyT3N4MVhE?=
 =?utf-8?B?aitWeDF5eDlVS096dU42b0xTOGlUczlYUnJZRnh1VDJSMG9BTEdhdmhpU1VQ?=
 =?utf-8?B?TW5HY1ZZNmU4bzRZQk9CL3NGNnRHdkdybUFraVkxeXNCTnhmYzcwOTZYZDVi?=
 =?utf-8?B?TXNHRDlnOU1kdVd0QUZIZHlxUVl6V3FMd3NLQ3lSYXNuSXlxbGxoc1VsaCtj?=
 =?utf-8?B?eDkyMUpRbkZ2ZVl1RG9sc1VnUy9pZVNVWERoNHJEQTNLd3k2UUFybTh5RThi?=
 =?utf-8?B?SHBvdGVwZGRCZitweU00MS9QUEtmaUplVHZlVENxbHpsSVREdmVBNmdRSWUr?=
 =?utf-8?B?REprZzllcDg4NWxoV2ozYzh0WlFheFozaXNrMjNaMFVlTTFPNytLYldydGFN?=
 =?utf-8?B?bVVmMUhSVkxSaTJSQUVIU3M0ak1kb0RUVTBVM1NYaGs5M1p4SHJxOGNNSkhs?=
 =?utf-8?B?RTE1bWMrRGlZc05zdUtvMmhqMVYzM3poMjRyTmxjdXA2aG9YVlZvbW1NMW9E?=
 =?utf-8?B?aWtaLzQzOUFEaVZlOG9RYVNUems3RUtRaG1VVXBLemxhcUt0TDFacno4dGlO?=
 =?utf-8?B?a3RiOWI2YnlBSWphNk81TTRjU2xqTWhFQzhlVExSa2J6MkdKeXhLTWZORk9C?=
 =?utf-8?B?bE45dGYxdGZCV2ZuMnU4emxsSFowQkxzY3hGb2J3b295L1RMejlrTWtCTUtP?=
 =?utf-8?B?dHBHeE9CR1JEbFlKTFJXaUp5WEkxM2dWQmhPSFp6UU5RcFJnallxTzRjemFo?=
 =?utf-8?B?UnB2U3U2NTlyNEcxWTJrZUtVUEZ0UkZRamlDaWFhaVVVNVV2MDZGVld6OStj?=
 =?utf-8?B?RFpkbVpRVEFSb3NFYkFiaGo2eGREQm0rYTQxb2ttd2xYSFNuUWV2aVFCdHRn?=
 =?utf-8?B?bzZCREVOMHR0alh3d1ZlMW1aUlV3MTI5ZHJ6MWtpNERxL3VQNW01MWY3U2JJ?=
 =?utf-8?B?bGVwVGF5MitWazNWZHJ6bGRJUnJnYUwwNEdBVWRud1p6VExLYXdtTHg1cG1S?=
 =?utf-8?B?dC9kVlozc0xTM3NHczdzRDVrM21Qa2hzdmp5SXRZMUM5NVF0d0NNMDl2RnVr?=
 =?utf-8?B?VHRUN1FMY0VqVkNuMUVnd09qUnNGQkM2d1A5TndGS2drMm5JQmdBamlSSHh4?=
 =?utf-8?B?M0FIUDlVSzRBNUVybm84UEs0TlI4SFkzYktQcS9CWjV5R0Q3TmI0WHRMR3hU?=
 =?utf-8?B?am02bjI1bklQYm9VY3B0dXlGVkEyZEtjdTZkcFg4WEtBZFl6ZDUxelcxd2U1?=
 =?utf-8?B?NkxhUzFMTDJ6a1lCc1VMSHJmZHkvcTNsQnNiU3BVZmxaVHQzTEkwUm5iTHZu?=
 =?utf-8?B?bDk4Zll1QkpFNEZvam42OVR0ekJaSWRUMXYza0tZYnZDcnhDaVNEZFY0cVhI?=
 =?utf-8?B?Y3dDODg3VHVTMzRoT2h4aTY5Q0ErMVJDM2VrTy94RXdoMElQS2FjUnJEL1ph?=
 =?utf-8?B?eTVKbk0yOHFWSFUzcU5NRXRORXhnOWxzcjZoU21tZHRobkNURkhnSFl4bWYv?=
 =?utf-8?Q?LLpERJ3B+NJjcmyEm85Eg9c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3fc754-d383-4aa2-99d4-08dc010896d8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 03:05:58.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NZ0LQXpdVNAD0UNEos3YpG2LbUSApmgst0BcmK0zD0cLfr6ncs9L+dDYEOvzY7FOqDBnD7+ds/CvUVDdbEYRI2nvTDMzMlPrlSuwXVX6Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:23PM -0800, Ashutosh Dixit wrote:
>Xe2+ OAG requires special handling because non-power-of-2 report sizes are
>not a sub-multiple of the OA buffer size and there are no partial reports
>at the end of the buffer. This issue is present only when overrun mode is
>enabled. Avoid adding this special handling by disabling overrun mode for
>Xe2+ OAG.

Like you mentioned earlier, maybe disable overrun for all platforms OR 
have the user control the setting.

Otherwise, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
> drivers/gpu/drm/xe/xe_oa.c           | 8 ++++++++
> 2 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index 4455a5a42b01b..7e2e875ccf80a 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -52,6 +52,7 @@
> #define  OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
> #define  OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
> #define  OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
>+#define  OAG_OABUFFER_DISABLE_OVERRUN_MODE	REG_BIT(1)
> #define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>
> #define OAG_OACONTROL				XE_REG(0xdaf4)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 5744436188dcd..073476721377d 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -408,6 +408,14 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 			gtt_offset & OAG_OAHEADPTR_MASK);
> 	stream->oa_buffer.head = 0;
>
>+	/*
>+	 * For Xe2+, OAG buffer is not a multiple of report size and there are no partial
>+	 * reports at the end of the buffer when overrun mode is enabled. Disable overrun
>+	 * mode to avoid this issue.
>+	 */
>+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>+		oa_buf |= OAG_OABUFFER_DISABLE_OVERRUN_MODE;
> 	/*
> 	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
> 	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>-- 
>2.41.0
>
