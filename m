Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61102CCD185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 02:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7DF10E04A;
	Tue, 14 Oct 2025 02:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgK2zlVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7E10E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 02:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760407756; x=1791943756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G5ao55SkTY6RFqkFz0ao12U7ESueou64HqiJohXsuVU=;
 b=PgK2zlVDDXU9md+dj9oob21meULEmOEI6zmUjYMKBVgO8QAb5yd9SGub
 /aveOdW5RUYDwdJpzV66DegYGsgCNMKjxPFTDNxmx8nGvSP9TWxMKDCfJ
 14AvZMCrvsAMHlTmHKAdTYhpZtzAFB7CI88XbSmg7Ve5hcPYIA8e1WvWz
 489H6q45oj2574m7oNHXpxpuNhji84RL3U9UR5uJspKpEdA1ULp/YZygc
 aE/4osFs4DXz0JeZ1ezxtqmgtmGnFzwmeYAmlj7QaqaR2/dLe+PybAlr/
 YqI/KGDnfp78WnSfRzJyC8daq8yN2XcH4vlLyebwJx1S5TWogSyVxbGTc Q==;
X-CSE-ConnectionGUID: oY8CHFHaTlGrzXGNDbLkSg==
X-CSE-MsgGUID: LXlWiC2vRRSLuiqaxOfA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62471035"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62471035"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 19:09:15 -0700
X-CSE-ConnectionGUID: zy+CoToaTEmFm+IJoWC0PQ==
X-CSE-MsgGUID: 6lzBPMo6SpWANUZ4XwAItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="186161253"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 19:09:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 19:09:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 19:09:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 19:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6y4T5s4Bw5ERS5MXLTbjELQSoB0k1tA8VUMKbir6GD7ftHxqzNimKFu/6TqI51+/mHfR7lO8Qj5lnTmZeiEctuQnI2jPLMjIQLFwdw0CvqVG2+77agXqTgWHIpBvSg2o26YR2Zq7KBgDNBIb+W6sIoqRmObCu9zQMC33YMxaD1zbveYflr8RGdv3BFaCT0moykNAgnGknUenuZ2v4ZDSoCkqbw5k0TX5O+Yvjum/IlfLBxzX5FPm50+G8C6N7GpEWiOk4be65FAuTbjPL3+1BcOGsMcnC+oHpfAIw4BQ8trLiYn0PwUoS9cFHMYaySBnPUaFs2lv6m5CRlX3jepDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrAxF3zoOeGEbVpETWg4fxFr/cbavl4LhDuV8sc+OPA=;
 b=xFb58ofMttepgnzD7bbPDQa+jrZMs6MVgL6S8WpK9WO50lJVBX2CKYWlMXWVHCtsjxgeMmUOB+VfhC3GLH+YVeQ7FS1kU9X3gy67NHj8S4zSolzh3fmbjZgxKClUQ/sBQAujSCwxotQZJbpTmPO24Q1yWZKLEzkkaK4D3UoyYQ796VvJmKdZm45Kub325u0tlcp26AuvYOtk74oa9ySqdfUnp3r7xOX1IpXBvQzzt/jtZpNpL0FB+YitmyyHxA3ZNnM6fHZPWWjV3ccoynv3kX2CbT/Cz+k0PEoZ3xld0qYouG8M3/CrMU3EkVerdnt6CkrSeOQkBiUa05ePwKkU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.21; Tue, 14 Oct
 2025 02:09:07 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 02:09:06 +0000
Date: Mon, 13 Oct 2025 19:09:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Message-ID: <aO2wvw/FIZecvvXB@lstrano-desk.jf.intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
 <20251013223135.189357-8-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013223135.189357-8-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b67952-d52a-4d13-ed23-08de0ac6a784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?whgM7n/EsNk9AXXJW3gBlqZ89FPDGlBdi5ZK3jjiKPbqz8HqNQ2yENafFo/1?=
 =?us-ascii?Q?TqSjFuNVaDJBEajHt2KqZeRxVnGHmJMWg2gAmEd6/PbAX+Skho7Vo60mPA3P?=
 =?us-ascii?Q?2EqLhmAZPIkDXKldDTAUXaKIhQ3438dhN05oy+upfXPz5W2qw1T7woPgk1ki?=
 =?us-ascii?Q?jEGVqqb1Mg2Y6wLS3YazTBiyOHTVAqNnZLJlG8CP1DuuKsRO9Dzsea8zfqPt?=
 =?us-ascii?Q?DUU2ouXTMMWZfqbUOcUPJO7c4xTPLQl4SMLIB3IF+hf1Tt+KAe8NFR7cAnB+?=
 =?us-ascii?Q?31SxfOj90nxAh46qHH1QvPEYqckZ1Xl+fvxoeYu75Qenr95DnbCnSfXa0x5T?=
 =?us-ascii?Q?CpAvY2JJH6u4KLoWcyFBJTMsPGe09LWHINEju5XIthSqyihch4jKDVmDm8Jp?=
 =?us-ascii?Q?n/a1bu54Vs18zmUizvQc8t6ETY0WaLXv9Ut7327bOpIvbRTkI2geJTbrFB7N?=
 =?us-ascii?Q?BObqyM7T+dI3ki9tclF/LMtdqFbncMalwF97G4BUOuSV2ovLVtb1gtJkUstE?=
 =?us-ascii?Q?IOH4h2O4R8T/85FVhcrcFm9HICt7P6FjBUbpYIHW0I2r9/kXG7Zn3HEB8iCY?=
 =?us-ascii?Q?l4Lm7NyLGdJrIgcBn71iV8rB/MOaSYAg3+DnOtSmVZoQhFCx1qxgpBfbbsH4?=
 =?us-ascii?Q?UoqAfU4hIDLAO5q0RHZIREEakmF6x3+UfzrKm/YvVdegAXkVJ35A5BkIkG/Z?=
 =?us-ascii?Q?BcfwZSdngp4LiHEsKXrIofX8z497Y8lRvc2q7B41xACPqs6dE5uUADYvigli?=
 =?us-ascii?Q?DuO7f27ZAUHkB+dW3o8uvB5h1oNl4HyhWHEJBpEB77aXnkXVJPcqLks6m0P2?=
 =?us-ascii?Q?rnsbRixii064oDMQCcJbNjLxn8LHkoVTiAfLqMRu0O0eYRea3JhiR8t91Jkp?=
 =?us-ascii?Q?57CUDgAWFUZFqWIZ9h1RezfL+jfLHaoJXwkTVuVcFxWdXfYqeiQBx3Pmxgrq?=
 =?us-ascii?Q?pq9T04bIyvdWae5JNbrhyndMB+BKTz4AU/co5Fy4iW6qfN/ClqEsrK7WWHzw?=
 =?us-ascii?Q?btBwtxPiHEDIQqmonWxPZFLkxno20amzmwbvqDvu7wgJEm0pWzxJJlY5WFYJ?=
 =?us-ascii?Q?zfjmKLfuv+8MmJ7WNgQwkssPNwZ2OdpNFYdKzYJ0CntCFH7WoRTLGQisz+vC?=
 =?us-ascii?Q?gyQ095E/EhNBdXkzfAsdDoI3f8F6q4XaDzaXcK32cvkBDv4qo694cTQaJMSs?=
 =?us-ascii?Q?TuTqwqWKCCE3c3tsugeQP7H92Ts5tWzX2YllOSxhl2UjYSs6ed+T6WAS9sP1?=
 =?us-ascii?Q?SuWjvOj3A5qcHt5d8aSFXZarxKQsibpef/2gGLcySuI5exJHbV7TnWCHd01k?=
 =?us-ascii?Q?M9oKpWoaeiYmym/qNElgaOYbSrj6/5ABfNDSu9cDqfehMmjRyhV3ZahFtS5k?=
 =?us-ascii?Q?hAUYdrAgdR3tOY6rO6LnMoZIhqYsRLoyw1t/sRzHokO822N8rqoeHQ7gTvEf?=
 =?us-ascii?Q?kqF8V4kBb/vn7lt/Zp2uq/bTLg93IUvW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oP7hX9E0uzB3TFRjFQQo/36GVHTdUwtNZhQXAVaJGKCCyw467oBDhyIxJuK2?=
 =?us-ascii?Q?lalXL9sKx0/hwnb4U0rl6BVjikvX+lQWMI/7B1Zb583Q1ouGv1T1UgX+I3QS?=
 =?us-ascii?Q?YV7jxIz6J9qRA/zqPBFuAIJPFLRmSSmr3f5prScigq3RQy6yLOD9pBOab5DE?=
 =?us-ascii?Q?81OmmPM+B8TPi+lcjUDAaU9Y+WGtUT8PCWrp2Zog3NDDT5MBPr+SyqKpTKPa?=
 =?us-ascii?Q?V7ABOv8n+hhJl5Z+AwK/jR80z40XVk2/HLyna1CK1niXX03QvKEb1z0YHPdT?=
 =?us-ascii?Q?/RZpBgxZV7upwp2ZSHszOY0iHEsDIFbClLuSMr3EKnrkMoTKWZ1GtFJdqiHF?=
 =?us-ascii?Q?7M1hi+0p/U4kUc5fOHDceukAkm5mJvROxHt365XEqyCLmlRDRgig83RC/qUx?=
 =?us-ascii?Q?k/PE1vXUUGx8cS+oR6cV195gZWDYcPaRAaOO7ePhbpKdS1lGhn1k7hYDHzQR?=
 =?us-ascii?Q?FWwc8ZbuJZ06RgUIBtXmeTFFAWwIgtKDw+sVZo2rb5LbXVNAydYbrOf4v7ys?=
 =?us-ascii?Q?figkZ2mncJSXbeq6tym19FqRQ5rnELisektQMycQTD1CidrlmejFiLD2LHGm?=
 =?us-ascii?Q?6FzxnOyfUCvicXVjGFTwMRQgV1exc+rkVSCwtFI1Sr7Bh7B7ywIod4UBbR93?=
 =?us-ascii?Q?vyiojvCRfZNLqRSAAFy/jPfDprANwBN4P4QDTw/Lmc8M+ps5w1E0RPddbWSU?=
 =?us-ascii?Q?ejBepdZeDYZJdstkG87okxS8t2uSaH3K1ZojwLILyA8DtWXNnrwRDopsyQjy?=
 =?us-ascii?Q?cTBwxL0paxFM7DH4aWJQ9275/u+lWrqGClaD4GKHlAFaO90XIJyytgT5H0Ed?=
 =?us-ascii?Q?zE55bZKwq/EQwaOKJ5kzozMvEJ7Pp/U+THvu1WGImqyTzDLoklFTBsJnER3R?=
 =?us-ascii?Q?Y7XB7JXkC1Y+mxhNCYNaim97kjO1YQa7P23dVxatKXPxgXaVKuRummnyKbSJ?=
 =?us-ascii?Q?c+hu80e/tPp5WjrbolskQn5ZQPUAfxuguh0aOAaNtok3zNC2IV9bcvpS+LwV?=
 =?us-ascii?Q?EN9QzzP7TlV3bim9sYUGWozGrTmxvcCUMamyQsUNUr/ifGqG12gutHAvP4ld?=
 =?us-ascii?Q?jIdVnBdbJkLPCUs1buZy92t5XbXPjnKVqmDYoWFSFQUR+h+Xu+PCZk0MCQEk?=
 =?us-ascii?Q?3/4kvL8yCle3kTJKHgERHuXB8nmckLt/wIwBbibcF/XxBukYsw7WRpBC78QW?=
 =?us-ascii?Q?zZLdGDGoiu/ORA2620WBUg+8D7qiKmF/ZcxidyEP4xAnJ/1F2DR7MXhW5PKR?=
 =?us-ascii?Q?YGUhr/qUqtwkPJRcoitkzCAlwvCiFBkug3aAjcMj/Bfsqoy2Z0pAWfnuPqhW?=
 =?us-ascii?Q?QbMEP3bZzQPt0W2iqgO6kiJYmOKOjEWBoQsWjUTEarQm45c0nZU7vby9TKr/?=
 =?us-ascii?Q?6SIFcPt2mgJvucAWqDty3g3IK67tZMAPAdVdcXogqd09XeUCoiZfumlStflN?=
 =?us-ascii?Q?0aG6qHKrKfb9gj9Ll/UES6ln7vOhi4XdDAQOPV1F7d4MdERNAuu6I1rA8v7N?=
 =?us-ascii?Q?581lzUNIdRGX3YwUSGLJWw42nle81ANeAtsJV3poU4Cb2A2acaEC8xx34q80?=
 =?us-ascii?Q?mrn0U2ZjmfGc4Keh96TcDIA2u7whe1UMcMFj4wCFvZROWIN5k6YLrYToA9XO?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b67952-d52a-4d13-ed23-08de0ac6a784
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 02:09:06.5577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7w/G/ZQmvH1ynN87DoxLta0JQZkGX7wfke+UfgIMOmaD3Q3LTBnFMm2R0ONW7B82tEjvWQke9iHrVI09qOowDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

On Mon, Oct 13, 2025 at 10:31:35PM +0000, Stuart Summers wrote:
> Currently if the GuC becomes unresponsive during a schedule
> disable event, after we send the CT request, the driver
> doesn't have a good way to recover. In most other cases,
> we explicitly wait for GuC to respond by checking either
> pending_enable, pending_disable, or some other state change
> that we expect to be set after the response from GuC is
> received for that particular request. Add a similar check
> on the schedule disable side and make sure the queue state
> for the queue being disabled is reset properly in that case.
> 
> v2: Only call the deregistration sequence since in this
>     case the scheduling handler should be reset during
>     the GT reset.
>     By doing that, we don't need a way to track the scheduling
>     disable request handler for that queue, making this sequence
>     simpler. As a result, don't mark the queue as banned.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c923f13a13ef..ca37c7a8c5ed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -924,6 +924,8 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  		GUC_CONTEXT_##enable_disable,				\
>  	}
>  
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  static void disable_scheduling_deregister(struct xe_guc *guc,
>  					  struct xe_exec_queue *q)
>  {
> @@ -961,6 +963,17 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>  		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>  		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_disable(q) ||
> +				 xe_guc_read_stopped(guc),
> +				 HZ * 5);
> +	if (!ret || xe_guc_read_stopped(guc)) {
> +		xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +		handle_deregister_done(guc, q);
> +		xe_gt_reset_async(q->gt);
> +	}
> +

I thought I already stated this in eariler reviews - this path is
designed to be fully async (i.e., no blocking here). If H2G get lost for
whatever reason the driver should be smart enough to cleanup the memory
references assicoiated for the lost H2G.

Matt

>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> -- 
> 2.34.1
> 
