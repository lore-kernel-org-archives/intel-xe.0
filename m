Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7568E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424B10ECA4;
	Thu, 12 Dec 2024 03:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7etNPl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0510ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733974218; x=1765510218;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=he4aXVFcne5WrWck3nld3LK9dGTV/GYDBwxg1uaVpzw=;
 b=f7etNPl0j8SxUQcaDIWgdNEMBSIvVREWs8/nyFJ5VuZVpgWKoapm99jg
 vGvhiLoYIBQEfiLjsm2qsBb/VCo8owl9EKoXtf0O1yLGxtpgNKKdH3udI
 IkKXGejg8r/YnmyQoqpqxlOW3rAVpJ6CXcDSNjdg5igepLE2LsTwyxMZ/
 MycO9ZXXaHNIRuqDs16WbHSMxq23oWK2WUHf2ENlJu8JNsTvUGjqVcc19
 +lCjNubvKRIKBa2pIVo8Hha1+NQo4MSuneUDmoAt2ITB1ziXksJOBCIqn
 F4fNmjLZsWHeBDI6TGiid+37kNoYx05J28UdTkjU+3W5/CCTG7JsxYiyT g==;
X-CSE-ConnectionGUID: q3Y5KjaOQgCH76KBPiPWMw==
X-CSE-MsgGUID: 9eqLlEOzSZO39i2rZ+kJgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34619919"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34619919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:30:18 -0800
X-CSE-ConnectionGUID: JYRl0TkwSF2CT0K7a+7qYQ==
X-CSE-MsgGUID: 4iWV2xBSRGeOnw47RKr+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="95958265"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:30:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:30:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:30:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:30:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO67Zu+XV8oioBhNugFgKVT77rlFYspo/R/e4PWHHLmjqM1ORyKhPpldWM0bb9lINfsEIaDPai5SliRE2+TwQPpsdSJe5OSkeWmTLrrcBizY6ZkbsZ/EgoCMtPi0X81IxW3HBFJkf6YZsXkPRXdimenNhqYKD9qSADGsjhQPAHLcTM1lI8UqffLPXuCl/ERH2ed2C7sHWJEISTbuZfmenwQKlPU4zftMkFvuUSfYzQtpQ/eHKh4J2r19vh9kw66cU/K+V1N2D+TIcIgOYNDbJFVAevaoNwMdKjWTBQ4gLKMK24ODUoNiLIVL5mjNXNsjqc1q0lj5sEDGXlDDLpkdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed8pQuFSP9wHfqCTxxqy4e70akPsC3OsDd9cNPiXboc=;
 b=SARK5sU9VjZkOJ+Fr4AMppWzV89RSznYRCKiahT7on83qgsy2kwQHzIVdNuHTDAvFJIHfPBB/vUha/Kd27KgiBxDTJBdT/0UI9GlLth/2BfAnzRjlFqSDqzb+DDzKLyaWhv8tKWKVYcIOTZ1wRvKMIQtcAY5tQ5+PpwkIxUpi2PYW2unIExqhq3SGy/NENYaTvpLSTrGdfyW/Au/1SLrE6A1pDKkv/ypWvCJrG2VULdxIcXnAObNu0gyLvTc2loxmJIJCcotqzX0krly9dpL2/4fNSnkL4hG1WycUmCOzxfUuOI9JM4LEDPkpEVB7ixkllTrN/pHu/WCqZGsgeMKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 03:30:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:30:15 +0000
Date: Wed, 11 Dec 2024 19:30:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212010141.389-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 1635aa49-af7f-4b6d-6805-08dd1a5d4b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BWCf4B5IkidOS0TsrkoHyjvKFIYQK9NfpZDwenZf7tb7Fx1EgMQ4BZpbX5?=
 =?iso-8859-1?Q?IL/s22MlBrCOazV9S6Aly8EglsNqIBJgCwnDsZcD/+AoBEhPkk4ukIdG3J?=
 =?iso-8859-1?Q?mCyX2qNSBDotgk07YHyxZ22/Xft0aPDUn+vn+WcZ1U2spxoWGBjSFdUcUU?=
 =?iso-8859-1?Q?19ObLGsyTz2IDJcbKZGyUQGqCPp8AH9twvLZZsJF49F9GRkznVu5bXb2qg?=
 =?iso-8859-1?Q?fV7APMP9qS7orYHcfBnMaj2qJdXOtPaKaZDxeNsP3Gv2PjAhlQthKaxAl6?=
 =?iso-8859-1?Q?6uBoMe9tDM8QA7LWOQAf22CAyEkyxDVl6tW+HvGnznIhifvkGQpVPj9BXM?=
 =?iso-8859-1?Q?VvlxPdPApYSZu1plnL/oYBfyyt2KIqlGQ1w645d3FN/9AQM1oBdzsb4Gz6?=
 =?iso-8859-1?Q?PrDjCJV7+D8sFh+KO/ri3L7EO4VJjddBVidXQGc1vgOUUHpRAjdO26qSji?=
 =?iso-8859-1?Q?RKfj3lw8N/gfS6PCGbFh+O6yJ3tgFAAgC1FNqYFA3Vl111/fMEjiRatKev?=
 =?iso-8859-1?Q?SULFqTMX24deKBlM6bKPMfC67ykMI7KeqbfrNNV/yf+8t8g0pxADQSpGYl?=
 =?iso-8859-1?Q?ua48j+ffdZx1/hpLMHYBbBnj9UagRmdAveZgZFQavKtBomewOL6aqR4ATu?=
 =?iso-8859-1?Q?63R2+BP969OizVPKYLIojgH/TC69YQTvD7tDYGrFEO26TmT+X41DQ7WQYJ?=
 =?iso-8859-1?Q?P7jn9LOrM3A3r5VrEA2hDKhsGczLjitCV5TDWURwScF7r1sTfE/Z1Da1Ns?=
 =?iso-8859-1?Q?JVqg3l6Ijzpjq42G5KbW+6OGE5MLy01NSD+H2nikCTewN5VIus/RVR6/We?=
 =?iso-8859-1?Q?Ud6LetMyxZBlNmCH3OWn7zgCjLOWchSLSHnOmfCHf6FfD3aSq/IgheAwrf?=
 =?iso-8859-1?Q?JgZUaaloE5rRVkmscZD4nYYY/4oyX6O2zd+eTriBFvxAMyJI9zLteNPovQ?=
 =?iso-8859-1?Q?BZQb9MMtOtZX68LUdq8ySpW3Ue156xmkIBibUD17cBh1g0iguCHmfJcZkY?=
 =?iso-8859-1?Q?FUGdzzjpk+mZne49tvuTovZa8eLMQsH7su8k6zyOKnF3L+mURcV807uj0d?=
 =?iso-8859-1?Q?1tl5uj1e/88vUY6pc6a4A7OdoUG9it/FRVQmBMtHpARtTXUbMc5iJerqa3?=
 =?iso-8859-1?Q?0Ieoz4GLGBLo+g9sCwkfIJTI/0tRXntlITfWgtTqxWAHB7jg/JxmkIoYgP?=
 =?iso-8859-1?Q?C2bzw6bj+b1CeKuZg69LK0M7ipbd7Gu2mIGHGOUb4JISRjv/kiKnV7Asbr?=
 =?iso-8859-1?Q?kRksuGKh2GulsumKPtdHp/K2TA4xKzG+7XECYzDVF1xB4Tw4o9TCmpRosa?=
 =?iso-8859-1?Q?tm0Bu1ATVI1z2euOyWwIuRAe2dq2LFqBWn/0GJQtuQfzEzr0hyLvzLuTvn?=
 =?iso-8859-1?Q?R0WXbO1GQ2vwc9lky7Bez55rgzp+zaLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CbdQ7NDviV62n2Sz0bzt//q99BlWqpYOHl1myC8Zm03+MZHjRtINXjXN5A?=
 =?iso-8859-1?Q?F0vhH0F++zGoGWhJD8DIHIGtJe5py2Sjjxx/iSkCAq+2d/lTkxwZ5gBfCk?=
 =?iso-8859-1?Q?D9CYhMvjEBRm/xyXkaTIuC6RzxjX99hg2gPvE2v0V+ezWOXik3qasbeDJg?=
 =?iso-8859-1?Q?1uIzR1pY8LsrB0LXpoOG+bUB8VacBE+RlYGeLLapYaWtmc8uObhdnLGvGQ?=
 =?iso-8859-1?Q?ALtLVgRFU+ujCotFB21mxlrKDLAk1AT5ph/LVCYJCyh1OvGao32OjXWmqw?=
 =?iso-8859-1?Q?LUmlvIShOnmkSTqgKk5sd5YeEL9nb4EBN23X0iFBJgfAM/rzXX2n6/ZnYK?=
 =?iso-8859-1?Q?KBcZDQfWl7+rIxhNXGdaUyELtXvB/yb3qTwUmuagZBeTS9ppclzcuvw1Ah?=
 =?iso-8859-1?Q?GWIifKnfUMY3XvMIV/7XXmcKqh0t/vjTZ6mfvfD2gWG/tjfQwoopiE88nc?=
 =?iso-8859-1?Q?qlMf9I746mB8FNcfFRSdahaxrOeWnHy9nJ4eiyDiZSG2fekgPhHTTIA6m4?=
 =?iso-8859-1?Q?BdEyUe5nwQUEInX+FpF7PIMiOjs+Rw4FDJdq4veQYJEgWlwjL7ObQMH8WD?=
 =?iso-8859-1?Q?ydOfWSb6hrcsV3VMkUBLV5GWHESiQeq5ChK2ZZfajJSuSThHM4ikHyRwFW?=
 =?iso-8859-1?Q?veL8vYVdnKNjh/9V4zhxaL3DF250i5VLjhRasmaQlu2diHzl8RxqdOu3Eh?=
 =?iso-8859-1?Q?wKx/0vw8YmbujfYiVb4GH2iJRHxFBzNvkjFdRB59h1AV6XlhD2obJQy7G3?=
 =?iso-8859-1?Q?8SU5vx3+tFqlBk1dSwWRXTxrETLqnn8ugVu8wyqvZP7ipcyuWwUa5WcTu8?=
 =?iso-8859-1?Q?VVKaGkc+cJv8cog2AptJBsgHbTw+ETehSs0shfFsBR10nSfYILQ0ld9zIn?=
 =?iso-8859-1?Q?jhFeGQPZzdj5sgNS85MzsUq1LeYIFp76ZYxIR7/5KaycAlfnKSIrAvPcIi?=
 =?iso-8859-1?Q?qpPLghvDdh7ARpgLQgl+kwK1eqMU77ldEsKs5/il0KmEYvcovA6h1pq9nn?=
 =?iso-8859-1?Q?C5KK9HW0f2g34i0aelq9BKAKgKU8krbA003ZhxUQAE9Ij/8JlHePnc0yL0?=
 =?iso-8859-1?Q?6q5rxr7N3BbHw8UluyAnB6JYpAlUNiq0BNLACpoyH0OjrbuEWUhQBmC8Y+?=
 =?iso-8859-1?Q?3cUUsLUS9pTngAGE5hhFfrcrQet/Q1ZiIu2Dmq3VX8TZQhglUuBPf8D1/O?=
 =?iso-8859-1?Q?ea001+oi+/eCtmNwOf8J+mNlrZhI7nbjL8+uZzRU/BUs/pYjkGQWAq4l88?=
 =?iso-8859-1?Q?6WZB8NYR4HTqpVOpfaJJA63wtNQLn/Y+I5LoJrbzTuAmrRFTwMs/SJN/v0?=
 =?iso-8859-1?Q?DLteWJgRvecbtAvopfOBragIOyBGu8TKdDML4SEW8SJ6Z02BSXOZWfPqFQ?=
 =?iso-8859-1?Q?sJ+t2Ykcq5kDIOD+NGUevUZguvnjqkKvEA+TlW/fZXi0jlkoe6UOaFQRLO?=
 =?iso-8859-1?Q?1/5nR7ZbkVEOfbOeFzWTkHSOkPdbX3Dpt/3V9ECHAukOITk4XiDCMdmMBs?=
 =?iso-8859-1?Q?uUBL81EW00bWohEIb3pQxrxtxboaHsaixkR0szOucw0QZpG/zaM31hhafd?=
 =?iso-8859-1?Q?h0/Ima6uxNF5l8rsaWmUeDn/+EaRQZ4TubCyqAlyjgpnajHJSuKHYmBcYV?=
 =?iso-8859-1?Q?gQhYHQvyK+NLuV4mQlfif+RmurSoTLdkaUvxX3fTdEQ7o9+kLXJlKNdQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1635aa49-af7f-4b6d-6805-08dd1a5d4b1e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:30:15.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axKfRfXhNYqmd1GLmt3MqEdxKsgjM54nXMXSUWEQcyJGNPOlmbSiVkgrYOlGRBQkkGtQJJp9LsKsjVQaXOcXZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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

On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:
> The purpose of the GuC Buffer Cache is to maintain a set ofreusable
> buffers that could be used while sending some of the CTB H2G actions
> that require separate buffer with indirect data. Currently only few
> PF actions need this so initialize it only when running as a PF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: base it on xe_sa_manager instead (Matt, Rodrigo)
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_guc.c           |   5 +
>  drivers/gpu/drm/xe/xe_guc_buf.c       | 172 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h       |  47 +++++++
>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  28 +++++
>  drivers/gpu/drm/xe/xe_guc_types.h     |   3 +
>  6 files changed, 256 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7730e0596299..2e50a697f549 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> +	xe_guc_buf.o \
>  	xe_guc_capture.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4e2868efb620..af62586f3528 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_guc_ads.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
> @@ -654,6 +655,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> +	ret = xe_guc_buf_cache_init(&guc->buf);
> +	if (ret)
> +		goto out;
> +
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>  
>  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> new file mode 100644
> index 000000000000..261c7c74417f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_bo.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_buf.h"
> +#include "xe_sa.h"
> +
> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> +{
> +	return container_of(cache, struct xe_guc, buf);
> +}
> +
> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> +{
> +	return guc_to_gt(cache_to_guc(cache));
> +}
> +
> +/**
> + * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
> + * @cache: the &xe_guc_buf_cache to initialize
> + *
> + * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
> + * indirect H2G data to GuC without a need to create a ad-hoc allocation.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
> +{
> +	struct xe_gt *gt = cache_to_gt(cache);
> +	struct xe_sa_manager *sam;
> +
> +	/* XXX: currently it's useful only for the PF actions */
> +	if (!IS_SRIOV_PF(gt_to_xe(gt)))
> +		return 0;
> +
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));

Same comment on patch #8, let's reach an agreement on guard usage before RBing this.

> +	if (IS_ERR(sam))
> +		return PTR_ERR(sam);
> +	cache->sam = sam;
> +
> +	xe_gt_dbg(gt, "reusable buffer with %u dwords at %#x for %ps\n",
> +		  xe_guc_buf_cache_dwords(cache), xe_bo_ggtt_addr(sam->bo),
> +		  __builtin_return_address(0));
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
> + * @cache: the &xe_guc_buf_cache to query
> + *
> + * Return: a size of the largest reusable buffer (in dwords)
> + */
> +u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache)
> +{
> +	return cache->sam ? cache->sam->base.size / sizeof(u32) : 0;
> +}
> +
> +/**
> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @dwords: the requested size of the buffer in dwords
> + *
> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> + * Must use xe_guc_buf_release() to release a sub-allocation.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
> +{
> +	struct drm_suballoc *sa;
> +
> +	if (cache->sam)
> +		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(32), GFP_ATOMIC);
> +	else
> +		sa = ERR_PTR(-EOPNOTSUPP);
> +
> +	return (struct xe_guc_buf){ .sa = sa };
> +}
> +
> +/**
> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @data: the data to flush the sub-allocation
> + * @size: the size of the data
> + *
> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC);
> +	if (!IS_ERR(sa))
> +		memcpy(xe_sa_bo_cpu_addr(sa), data, size);
> +
> +	return (struct xe_guc_buf){ .sa = sa };
> +}
> +
> +/**
> + * xe_guc_buf_release() - Release a sub-allocation.
> + * @buf: the &xe_guc_buf to release
> + *
> + * Releases a sub-allocation reserved by the xe_guc_buf_reserve().
> + */
> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> +{
> +	if (xe_guc_buf_is_valid(buf))
> +		xe_sa_bo_free(buf.sa, NULL);
> +}
> +
> +/**
> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> + * @buf: the &xe_guc_buf to flush
> + *
> + * Return: a GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> +{
> +	xe_sa_bo_flush_write(buf.sa);
> +	return xe_sa_bo_gpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: a CPU pointer of the sub-allocation.
> + */
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> +{
> +	return xe_sa_bo_cpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: a GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> +{
> +	return xe_sa_bo_gpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> + * @cache: the &xe_guc_buf_cache with sub-allocations
> + * @ptr: the CPU pointer of the sub-allocation
> + * @size: the size of the data
> + *
> + * Return: a GPU address on success or 0 if the pointer was unrelated.
> + */
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> +{
> +	ptrdiff_t offset = ptr - cache->sam->cpu_ptr;
> +
> +	if (offset < 0 || offset + size > cache->sam->base.size)
> +		return 0;
> +
> +	return cache->sam->gpu_addr + offset;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> new file mode 100644
> index 000000000000..0d67604d96bd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_H_
> +#define _XE_GUC_BUF_H_
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +
> +#include "xe_guc_buf_types.h"
> +
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
> +u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size);
> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> +
> +/**
> + * xe_guc_buf_is_valid() - Check if a buffer reference is valid.
> + * @buf: the &xe_guc_buf reference to check
> + *
> + * Return: true if @ref represents a valid sub-allication.
> + */
> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> +{
> +	return !IS_ERR_OR_NULL(buf.sa);
> +}
> +
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> +
> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_reserve(cache, num),
> +	     struct xe_guc_buf_cache *cache, u32 num);
> +
> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_from_data(cache, data, size),
> +	     struct xe_guc_buf_cache *cache, const void *data, size_t size);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> new file mode 100644
> index 000000000000..9e123d71c064
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_TYPES_H_
> +#define _XE_GUC_BUF_TYPES_H_
> +
> +struct drm_suballoc;
> +struct xe_sa_manager;
> +
> +/**
> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> + */
> +struct xe_guc_buf_cache {
> +	/* private: internal sub-allocation manager */

I think this generate kerenl doc complaints.

i.e. Should be:

/* @sam: private - internal sub-allocation manager */

> +	struct xe_sa_manager *sam;
> +};
> +
> +/**
> + * struct xe_guc_buf - GuC Data Buffer Reference.
> + */
> +struct xe_guc_buf {
> +	/* private: internal sub-allocation reference */

Same here.

Matt

> +	struct drm_suballoc *sa;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 83a41ebcdc91..573aa6308380 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -11,6 +11,7 @@
>  
>  #include "regs/xe_reg_defs.h"
>  #include "xe_guc_ads_types.h"
> +#include "xe_guc_buf_types.h"
>  #include "xe_guc_ct_types.h"
>  #include "xe_guc_fwif.h"
>  #include "xe_guc_log_types.h"
> @@ -58,6 +59,8 @@ struct xe_guc {
>  	struct xe_guc_ads ads;
>  	/** @ct: GuC ct */
>  	struct xe_guc_ct ct;
> +	/** @buf: GuC Buffer Cache manager */
> +	struct xe_guc_buf_cache buf;
>  	/** @capture: the error-state-capture module's data and objects */
>  	struct xe_guc_state_capture *capture;
>  	/** @pc: GuC Power Conservation */
> -- 
> 2.47.1
> 
