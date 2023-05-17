Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC645C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 17:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC310E043;
	Wed, 17 May 2023 17:13:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0830E10E043
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684343630; x=1715879630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D45XsfRB8DJuhGzzu7b+dnVYr8bBiNU+weA/yGIJpDA=;
 b=NwKnaXIruMqPtjrN6RfSBzPutBWQ8rUpX/miJDhgs+dxXywG+zRjD3ZB
 Xukn96m8OfP0AwQ3l56Ng/GL6XeSUVXrUuUDuXWgWtfAR3WS78rO8E5Lw
 RU67E7buHetzx8deYH4U4wack0Io6xXYscYiMLNnM4rJwOK2zXWvtGNVS
 mTr8ldgLTYmIr64W1QwiB7AT/NpIu6R0KzeJPu1csLIzf+1XKZRteRDmu
 wsuMiKeLK7HtezBjAbZGaMbnQe41p/3K7O0qiBGykyXUvBw/ByRPrTQCT
 j6Y2zgPwrrORSlcOVPaFB4xhkFmYskqSNgO8V/rG4zAEQJxwMW/hQ9g1r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="380018695"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="380018695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846166339"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="846166339"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2023 10:13:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:13:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:13:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 10:13:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 10:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZVBQEvd5u4cIHUApVZLifS7WkiTcJ1R4kVEzr1YPFUynSvMN0N0aEPkud+VdBpZQer9PRO/Eb0cKM34h+PM7PnXMjR6M6k5vbfEe2nKoTW67yMcpCjRFK3h1HQBXxTTXR9EgvRGiO1F2KbDmjoCtqTO5gUzB2g9Di0SKlvZFl1aj47zyR/bXpo28OF/ZBvba8qQ+Rnl68qGSkglf/J5Lvy+Hh2YoojdUksHl5K7x+XLtAvOd45mfHEjSMAq9ohYUeUPQJ/gdfUnKhQI/4xn59uO0pBpZxjd5E7oCFQH7U68PdOmefcW6oLFWKWSg3JgdZBP7O/fFLdvNPGtk92icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1NSVZ5wRApSCLMbfniIk/WVS/7EfZztU4WF3Xlr9BM=;
 b=Gp3aK67Vq0J95AHmHhTMbym4sE6PmIkRb/iOuwzepbq+pd93FxcU9CQcm69bH2A/PzbNbL8XJhb4N9qGIowYE+RYWs2nsdRnjRD0VjpNap567P3mJiXJMw6bQNtEE9uf0pLsjBoehcIf3wBbixwWHhpQ0XPa75k0TJQrC/NJfIfK7BadGXzYouCWgxxrnLdgaYAeJ5hRhjeLGpeF86QhyygrOzFMizH8U7t+8s5deEZHmJZbVptk4erVI/ny2reHlhQybmMl6lvOPYpxPSxoH2zvz45R2VWSwCwh93Xy5MGNj3TeV95MKhOpWa7WcF7KBoxRT821Qx6WLOUaITlx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Wed, 17 May 2023 17:13:26 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 17:13:26 +0000
Date: Wed, 17 May 2023 10:13:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517171322.GP10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e643be-b858-47ba-e822-08db56fa0692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Enl0FvNhSVF5kLJqZvni/smnsnI1jbKlkMkA3igT+2uUZKPaAtUKLPTCoi1X23cFipbtVZ2jC2zZu/uh32VXnzgxa2BxsmrEvT0U0pP20SxDd8vdw3Az2wQznp1kpksP0evopLyazqqm/DsxaWWmEbi+V6p4MzMw2vxHGMDf+HTrMFjz+9bPivo1sPfZyaS3i+o3bHlCEGLXxd1TqGP7jQJ/nxh83UDxIPCdSE/QvFXOYneCUTpDV0vytbjZ1aLdB9/EUx+ILqOnGweN6grUo7ABvq9qU4F+id09xRdvHnHtm0ONib64vknYAsAN5VkdqPtCgMQUfW6JjBG+PLRLaz5Z4KqnHt131IJG2VH3Vkl8BB5e0OCvMtz3Uvks9dtuOvh4vyl1YVHd6FeozgAoAYCxzNCWQ4xBjS9JSJacbbOfP06aykpvehO2EK7VSupFyHQsZ2dgqLkSM5f7X7f/e9HbgGMGShtqy3ceuep2etHePBD4c2yrzbISu9juq1NJDbW8YOZZ2xHxOaJGmIqR9XNhOqVCMyjsW/7u4XvLpGmLUuUtJiUwJLF/nSt0i0wl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(4326008)(2906002)(30864003)(6636002)(6862004)(8676002)(5660300002)(8936002)(86362001)(41300700001)(66556008)(66476007)(66946007)(478600001)(33656002)(6486002)(316002)(6666004)(83380400001)(6506007)(1076003)(82960400001)(107886003)(6512007)(186003)(26005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+5QrRo9raWguXvgLd8GVEa2I2H3CRKSokrvh32SZ/6KbT6k+KAovoZ4VF5G?=
 =?us-ascii?Q?YQb9AtIlJiHl+IQ27LAy1heGRuumBpTeKSRbDyBB8CPtcpREc+IE6amMrNe7?=
 =?us-ascii?Q?ZK4aC/DLXqWOLAK5TVNFlaQWKDnaDCHsNYMhEA1ktL6Pd8+rQjPDu0DGuIlS?=
 =?us-ascii?Q?o8FfLXAZ126BrgShR/oEGitWa+vSQ4tWYgIgQs8CM8NCQqJMbn2dUgQ/SYso?=
 =?us-ascii?Q?XuDWlALV07tf76bEKocRZMtcYEiXWlJmfooTBmK2/Nr8ig6IzBv1FeGJnwh4?=
 =?us-ascii?Q?2Q44afZNbHOC7PMA+frKDfRal3WG5K/sFXAnjq+jP5wIe8SQtJD4HMffaZRr?=
 =?us-ascii?Q?01GirPSAE2FJJ+c9S5JyFQleCgkcRUAGCppIKhKD0rMCyDyTB4hm1fpeykO2?=
 =?us-ascii?Q?EP3L9yX8aNOP5syppJHf11nLcQ6SX8MURiFjl/dgCTsjWZH7LPoEe6FvieXl?=
 =?us-ascii?Q?za/5kvr6OcpG7GQZSuh8Awp0wRZyYxZ7yz4bAArHbvZ8cVJZD4xPpHlWbsTp?=
 =?us-ascii?Q?fB1O0UyQCv57Eye913zbF67qHVVsQjvqPj+GZH8bAFHxswWhdx43/+XB6LZb?=
 =?us-ascii?Q?YfejkLDLRA3kdb2o36rqyRsdWTSlaO8fK8kloAblmUEKtfKTHPpIx+gYcJhq?=
 =?us-ascii?Q?3+GL9/FNIEErU+iO3Rdq7ci4gDJumrrmDLYHXcjRorO87lzUWV95K5XwdoKr?=
 =?us-ascii?Q?ApwKeIq4CHUtC8ycAfUa/zSZpjlVrjhulL3YvAHJmHoBTT9dfdcDw5CUCxj5?=
 =?us-ascii?Q?UKMjPN7rFNZUHT/xD2jlBmZWLh54qA5XRJqRNipzbBEcMP2yy7PeIdQ4Qn0I?=
 =?us-ascii?Q?5kYDT52nJ4D83XcBM82FXEcCj1lkB4LIExUl+p7ZScL6wWym6Xr7+7jkgElL?=
 =?us-ascii?Q?rU+QbrXRDxG0G06Ss4DgfM12ifIT2l9LaDO/2qcHC+r/eFuoyUXL7RpZpBkt?=
 =?us-ascii?Q?jEzMpE/AuajeBhIdyZerNJme7bUuDLdXE6wRltcnK7bPyZQYqmRF1cKZkk6S?=
 =?us-ascii?Q?OUn5fbPT7cH7wjFVFL7YpGby2p3fAj/BSn32dIozL8OIRGEfDI1byGFDCK7w?=
 =?us-ascii?Q?mpoqqCxZIUyaRneBLztnESy29QNE5EUWJ6dYuoTpa3trSe1aQRsUMVO80Uz3?=
 =?us-ascii?Q?66iqUkfMY02T/TZe++/5SpNOkNFIhX6FHcRpwoHPKjMa73QT6lQWV9wEX4hf?=
 =?us-ascii?Q?w9pu+y7pPeTOC5ESKUqvKUptbgl+R/vMBrBs7k2SuqtFfKBVsGFCr/7DrLHN?=
 =?us-ascii?Q?dUv3uzSPRbAa62CqVM33ANGYNn8OyBcztC3f96C8hCYyo1AGCTSz/LAj30bi?=
 =?us-ascii?Q?wWYw4xFercq6sbqJvsgBjfk/b2HQMvYw1i3bk6W3nMf+y2xZx4J41ucLKwsw?=
 =?us-ascii?Q?NCCffRPH0XgNRpp5v/pGMYMY3FTx0Jx7xsDz9d8oWftSi27OXwG6tx2DtL+e?=
 =?us-ascii?Q?H616aDFBYSmtvmhw6CMrtqR8qRZnoy0EWjKFEA72uK+TUl0ZbKwZCufs2tu0?=
 =?us-ascii?Q?uBtjnG3VxOpBXM71MLAkDODFTKfkv33XHxSUZjIo9sOBaJ62dBVamc9WJ+CB?=
 =?us-ascii?Q?Me8xuRLGp2t59FLAgS3zFdJxOjWutGsvU3oCJXpVl6+eRZ7p3Tnlwqbd4GZu?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e643be-b858-47ba-e822-08db56fa0692
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:13:25.9623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKvh8Vfi0XNxsZqRPxk150uKmf+JGYuGGE3aQPRH7IjTjf4ElsbrnrwG9nzaF9hZT4T64RahYR+FN62Ig8VbbxulJg5IAAdmvZ5FHu7nl3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/9] drm/xe/rtp: Add "_sr" to
 entry/function names
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:44PM -0700, Lucas De Marchi wrote:
> The xe_rtp_process() function and xe_rtp_entry depend on the
> save-restore struct. In future it will be desired to process rtp rules,
> regardless of adding them to a save-restore. Rename the struct and
> function so the intent is clear and the name is freed for future uses.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 22 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  8 ++++----
>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp.c            | 26 ++++++++++++++------------
>  drivers/gpu/drm/xe/xe_rtp.h            | 20 ++++++++++----------
>  drivers/gpu/drm/xe/xe_rtp_types.h      |  4 ++--
>  drivers/gpu/drm/xe/xe_tuning.c         |  8 ++++----
>  drivers/gpu/drm/xe/xe_wa.c             | 12 ++++++------
>  8 files changed, 53 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index f96ef1987719..ab6f7a47db50 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -36,7 +36,7 @@ struct rtp_test_case {
>  	u32 expected_clr_bits;
>  	unsigned long expected_count;
>  	unsigned int expected_sr_errors;
> -	const struct xe_rtp_entry *entries;
> +	const struct xe_rtp_entry_sr *entries;
>  };
>  
>  static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
> @@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
>  		.expected_count = 1,
>  		/* Different bits on the same register: create a single entry */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -76,7 +76,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
>  		/* Don't coalesce second entry since rules don't match */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -95,7 +95,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
>  		/* Don't coalesce second entry due to one of the rules */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -114,7 +114,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 2,
>  		/* Same bits on different registers are not coalesced */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -133,7 +133,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
>  		.expected_count = 1,
>  		/* Check clr vs set actions on different bits */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -154,7 +154,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = TEMP_MASK,
>  		.expected_count = 1,
>  		/* Check FIELD_SET works */
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
> @@ -172,7 +172,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
>  		.expected_sr_errors = 1,
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -192,7 +192,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
>  		.expected_sr_errors = 1,
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -212,7 +212,7 @@ static const struct rtp_test_case cases[] = {
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
>  		.expected_sr_errors = 2,
> -		.entries = (const struct xe_rtp_entry[]) {
> +		.entries = (const struct xe_rtp_entry_sr[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> @@ -242,7 +242,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	unsigned long idx, count = 0;
>  
>  	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
> -	xe_rtp_process(&ctx, param->entries, reg_sr);
> +	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>  
>  	xa_for_each(&reg_sr->xa, idx, sre) {
>  		if (idx == param->expected_reg.addr)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1bf28b1ad319..b072682a6988 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -282,7 +282,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
>  			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> -	const struct xe_rtp_entry lrc_was[] = {
> +	const struct xe_rtp_entry_sr lrc_was[] = {
>  		/*
>  		 * Some blitter commands do not have a field for MOCS, those
>  		 * commands will use MOCS index pointed by BLIT_CCTL.
> @@ -300,7 +300,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  		{}
>  	};
>  
> -	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
> +	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>  }
>  
>  static void
> @@ -313,7 +313,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>  			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> -	const struct xe_rtp_entry engine_entries[] = {
> +	const struct xe_rtp_entry_sr engine_entries[] = {
>  		/*
>  		 * RING_CMD_CCTL specifies the default MOCS entry that will be
>  		 * used by the command streamer when executing commands that
> @@ -334,7 +334,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		{}
>  	};
>  
> -	xe_rtp_process(&ctx, engine_entries, &hwe->reg_sr);
> +	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 98f678d74445..70892f134718 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -20,7 +20,7 @@ static bool match_not_render(const struct xe_gt *gt,
>  	return hwe->class != XE_ENGINE_CLASS_RENDER;
>  }
>  
> -static const struct xe_rtp_entry register_whitelist[] = {
> +static const struct xe_rtp_entry_sr register_whitelist[] = {
>  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
> @@ -65,7 +65,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> -	xe_rtp_process(&ctx, register_whitelist, &hwe->reg_whitelist);
> +	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 648a38bf8f0c..1485e53c1496 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -26,7 +26,7 @@
>  static bool rule_matches(const struct xe_device *xe,
>  			 struct xe_gt *gt,
>  			 struct xe_hw_engine *hwe,
> -			 const struct xe_rtp_entry *entry)
> +			 const struct xe_rtp_entry_sr *entry)
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i;
> @@ -113,9 +113,9 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
> -static void rtp_process_one(const struct xe_rtp_entry *entry,
> -			    struct xe_device *xe, struct xe_gt *gt,
> -			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
> +static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> +			       struct xe_device *xe, struct xe_gt *gt,
> +			       struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
>  {
>  	const struct xe_rtp_action *action;
>  	u32 mmio_base;
> @@ -160,10 +160,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
>  }
>  
>  /**
> - * xe_rtp_process - Process all rtp @entries, adding the matching ones to @sr
> + * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
> + *                        the save-restore argument.
>   * @ctx: The context for processing the table, with one of device, gt or hwe
>   * @entries: Table with RTP definitions
> - * @sr: Where to add an entry to with the values for matching. This can be
> + * @sr: Save-restore struct where matching rules execute the action. This can be
>   *      viewed as the "coalesced view" of multiple the tables. The bits for each
>   *      register set are expected not to collide with previously added entries
>   *
> @@ -171,10 +172,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
>   * entries with matching rules to @sr. If @hwe is not NULL, its mmio_base is
>   * used to calculate the right register offset
>   */
> -void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> -		    const struct xe_rtp_entry *entries, struct xe_reg_sr *sr)
> +void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
> +			  const struct xe_rtp_entry_sr *entries,
> +			  struct xe_reg_sr *sr)
>  {
> -	const struct xe_rtp_entry *entry;
> +	const struct xe_rtp_entry_sr *entry;
>  	struct xe_hw_engine *hwe;
>  	struct xe_gt *gt;
>  	struct xe_device *xe;
> @@ -187,13 +189,13 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>  			enum xe_hw_engine_id id;
>  
>  			for_each_hw_engine(each_hwe, gt, id)
> -				rtp_process_one(entry, xe, gt, each_hwe, sr);
> +				rtp_process_one_sr(entry, xe, gt, each_hwe, sr);
>  		} else {
> -			rtp_process_one(entry, xe, gt, hwe, sr);
> +			rtp_process_one_sr(entry, xe, gt, hwe, sr);
>  		}
>  	}
>  }
> -EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
> +EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>  
>  bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  				const struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index e7f254fb1b31..f2b31be294d6 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -261,7 +261,7 @@ struct xe_reg_sr;
>  #define XE_RTP_NAME(s_)	.name = (s_)
>  
>  /**
> - * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
> + * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry_sr
>   * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
>   * @...: Additional flags, defined like @f1_
>   *
> @@ -270,7 +270,7 @@ struct xe_reg_sr;
>   *
>   * .. code-block:: c
>   *
> - *	const struct xe_rtp_entry wa_entries[] = {
> + *	const struct xe_rtp_entry_sr wa_entries[] = {
>   *		...
>   *		{ XE_RTP_NAME("test-entry"),
>   *		  ...
> @@ -293,7 +293,7 @@ struct xe_reg_sr;
>   *
>   * .. code-block:: c
>   *
> - *	const struct xe_rtp_entry wa_entries[] = {
> + *	const struct xe_rtp_entry_sr wa_entries[] = {
>   *		...
>   *		{ XE_RTP_NAME("test-entry"),
>   *		  ...
> @@ -307,7 +307,7 @@ struct xe_reg_sr;
>  	.flags = (XE_RTP_PASTE_FOREACH(ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>  
>  /**
> - * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
> + * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
>   * @r1: Last part of XE_RTP_MATCH_*
>   * @...: Additional rules, defined like @r1
>   *
> @@ -317,7 +317,7 @@ struct xe_reg_sr;
>   *
>   * .. code-block:: c
>   *
> - *	const struct xe_rtp_entry wa_entries[] = {
> + *	const struct xe_rtp_entry_sr wa_entries[] = {
>   *		...
>   *		{ XE_RTP_NAME("test-entry"),
>   *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> @@ -333,7 +333,7 @@ struct xe_reg_sr;
>  	}
>  
>  /**
> - * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
> + * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
>   * @...: Actions to be taken
>   *
>   * At least one rule is needed and up to 4 are supported. Multiple rules are
> @@ -342,7 +342,7 @@ struct xe_reg_sr;
>   *
>   * .. code-block:: c
>   *
> - *	const struct xe_rtp_entry wa_entries[] = {
> + *	const struct xe_rtp_entry_sr wa_entries[] = {
>   *		...
>   *		{ XE_RTP_NAME("test-entry"),
>   *		  XE_RTP_RULES(...),
> @@ -363,9 +363,9 @@ struct xe_reg_sr;
>  	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
>  	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
>  
> -void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> -		    const struct xe_rtp_entry *entries,
> -		    struct xe_reg_sr *sr);
> +void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
> +			  const struct xe_rtp_entry_sr *entries,
> +			  struct xe_reg_sr *sr);
>  
>  /* Match functions to be used with XE_RTP_MATCH_FUNC */
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 6d9ab9eb91ba..a9e0153ff87d 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -84,8 +84,8 @@ struct xe_rtp_rule {
>  	};
>  };
>  
> -/** struct xe_rtp_entry - Entry in an rtp table */
> -struct xe_rtp_entry {
> +/** struct xe_rtp_entry_sr - Entry in an rtp table */
> +struct xe_rtp_entry_sr {
>  	const char *name;
>  	const struct xe_rtp_action *actions;
>  	const struct xe_rtp_rule *rules;
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index c2810ede3a65..412e59de9842 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -15,7 +15,7 @@
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
> -static const struct xe_rtp_entry gt_tunings[] = {
> +static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
> @@ -27,7 +27,7 @@ static const struct xe_rtp_entry gt_tunings[] = {
>  	{}
>  };
>  
> -static const struct xe_rtp_entry lrc_tunings[] = {
> +static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  /* read verification is ignored due to 1608008084. */
> @@ -61,7 +61,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>  
> -	xe_rtp_process(&ctx, gt_tunings, &gt->reg_sr);
> +	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>  
> @@ -77,5 +77,5 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> -	xe_rtp_process(&ctx, lrc_tunings, &hwe->reg_lrc);
> +	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 4b236b6f4c8e..557e90d79f0b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -93,7 +93,7 @@
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
> -static const struct xe_rtp_entry gt_was[] = {
> +static const struct xe_rtp_entry_sr gt_was[] = {
>  	{ XE_RTP_NAME("14011060649"),
>  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
>  		       ENGINE_CLASS(VIDEO_DECODE),
> @@ -235,7 +235,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	{}
>  };
>  
> -static const struct xe_rtp_entry engine_was[] = {
> +static const struct xe_rtp_entry_sr engine_was[] = {
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE,
> @@ -490,7 +490,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{}
>  };
>  
> -static const struct xe_rtp_entry lrc_was[] = {
> +static const struct xe_rtp_entry_sr lrc_was[] = {
>  	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
> @@ -581,7 +581,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>  
> -	xe_rtp_process(&ctx, gt_was, &gt->reg_sr);
> +	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>  
> @@ -597,7 +597,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> -	xe_rtp_process(&ctx, engine_was, &hwe->reg_sr);
> +	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>  }
>  
>  /**
> @@ -612,5 +612,5 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> -	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
> +	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>  }
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
