Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D887CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 23:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFEA10F0C2;
	Wed, 13 May 2026 23:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBPoVYEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B181510F0C2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778713470; x=1810249470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UoaM5XL7RTD2VEt2ygGBFJToBd5juwIN5u8wyT0z5Go=;
 b=gBPoVYEq4jtJZkvwuNjKtHup2UURVUnvG4cRniUxLkRKSLzz+i4ai/LK
 mdcQH+gQ0Q9mmk6fo5ZGUshROMbUNKZ0LYesOWmPU4KtmeOfvFzjJCs4S
 gQLJRh6e0RIaXyJIaSPjvm46CtbLNiqwTQpkDv/v5yBaVuMGBXalyDAAl
 8zlknTW/FUGFWYFPvbT7BqZYwDiSYBjmVHJn9i8jGtJlmFdSpUnlJxKaa
 qXv6tUTB669AqkNW4bP5ZXMR7VsJz96BO8eSVCW2FPQUSPOCyM8DpqFEV
 MQ9muCRpI9uvenBeurBdkTAsCh7mVuh79Q6j/a3Bntlb9AZMK7EVI9ni0 Q==;
X-CSE-ConnectionGUID: DvbPAv6FSquYFyheEVD9mQ==
X-CSE-MsgGUID: TlndPIVfSrab+YEz3nzn1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79365995"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79365995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:04:30 -0700
X-CSE-ConnectionGUID: 4HpWbS77QM+9JdWGYFy+9Q==
X-CSE-MsgGUID: DxcHgr43Qs2/HOfsILVnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276312417"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:04:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:04:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 16:04:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUgURvwLJBaNjsXEppU8IrDGA4YRu3tkBTHjlGCC9eaBBCAANhKFDOEf9MnxMgTuUA14oPx9uoV3O9HnoAbyZaT/QY552NA9fZSn1MHX6DVVLYjaWmu2cG8LkxKrdO71L67JroIwvI2qDeeVsrbeA94xw+xXh8NpoG9q7nPmLe5kU93V0+UhtR5w90le0vFFT6G9KEo4lL0VURUL6QRFwC53vCuY6CUzZZskP7Y7H3H11wQij1uSEnDg67S/qBz2k4PYPfX+mtE0rymuDS4On3bAs2TiOAFcYfa11IpEDPjoLAwrNYAvQ02ZngoKMl26Dx7stWCsyFW5bO0TjsCRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysHXRqqIOVb9eJrow7oL2gdQ3qdNwL7aIti0RroHAR8=;
 b=QCwKVlHNu1rTKJaUNcS5orsu5CkzpX1eZIcVIwoOLVac+b+Y2CSotiCcBzncXroSfqGp6jzwpOGAPcvrB2izDgBeUhMCMcLUFlxAiJSv08hRcCjT6uDYQCvGyjhQuoktAJX2ZYLfznkzWy9RZFEHrr/s9YDKk98jas0enwPXUH3VooM2Y556GTM/XegOoT0XpI0dju1QHuiksMH/VL7nnVX4lgvaoAP4xWTrQ2QDIDMxgAunca/tAaGjw71E7+CzFRK4hfIOEv7VBpGe1JhAZVXWmH76Ia6ndtWUvY0+6GSqnnikRCFuwgSvQSL8fKt6tJ7GftDk6QqTGSJSxeHxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 23:04:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:04:25 +0000
Date: Wed, 13 May 2026 16:04:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] drm/xe/rtp: Don't short-circuit to false in
 or-yes case
Message-ID: <20260513230423.GF2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-3-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-3-157e98b4ab51@intel.com>
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dd5b72-5fd6-4b4a-c10b-08deb143fa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|56012099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9dJRk77RMdmPV9zoXf1gIb33+eVuPDXVuo5yxFJaS620PAvJ6cGXYGtFNRzahlMey7NnfFPp2yf9IJmJddhoH9N3hTHzBRcZy+sISqtHkN9OoHaHJTZjGajgcd4FD9ZRoeSVx+BComwths1mV+kZVifXaItaIs480Bfws1ev0Gtw6/CQlMkTACYc/7m79+07zFd+dSAPVPjI3Qy76tkqY49G+JlmHW834ctAT6rC8YmRV1nbTM+0kf4ylOmvK0m9QN6GTWC57gWF7EUIYh53h8HQ40Mpttk60wPyBoPGnrFhYqHdYvt+QpJ7Xtf9FyCUQawycUCQA4vys5UQDk1Lw8ghKcNYlDb9p4lqg3rEH6ozryupf2ta5Egb6QgCe1FWAIe/MCnZRJnujkyL55GIaMIkzZmYh9eC4oDirdFaaT4VcO/bMX6WrPbS3zvaDK0+H/3tO1tx7CJ0tuCkUknEVwLNQSfrhUBtweuPmFIlQ158w8PKrNkUvo8U7zbqFl97eUR7nUr+vVHNNXjuyU9FZxGVCwpnb200ZalXXR5PiGG1eh3lk2n1CbGeVSTt/8h2BKfU8JJO9HGOFhtK16srGIhXLoDe0eCaWuZFzqhw3kqjJo9x1pmK0IWWQ8XfC6G218AynCvf/IGWpZqUVTH+La4ClTdDvbbRKjGZMWxhQgnXcwzokpH0N6vJtBoijbLh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bq7DeLBJt/q3hKHe9S4ifG0RujulGIOwm5zBhjmJR+FLRRWKpRiJYDbuKZ34?=
 =?us-ascii?Q?HsKpFjEN53CUtRYUEIHWzNBRu4+Bk+suZPaBlEKMeEOKYqKm2yfp2F8Vyc25?=
 =?us-ascii?Q?0bEfVnG+3ZsX28fn3Ow9Heszh+sQf7i+yMnQcZ7AkOgX0bPYwlDU6mJb/i5p?=
 =?us-ascii?Q?FnW7YeGWFLk2EyPas0qjZb0681+XkqBLuuAS4err11ejvxEzsmL+f8hyw4st?=
 =?us-ascii?Q?95jZUBeYM9O1uDz3wYBp8RBn7QWiqU3lFaGtH8I4Hg5nEXo0yiZnsz/vuVB/?=
 =?us-ascii?Q?Eit06W7ER5hxsgNWKmIwv+W+vJHQLGktMFBWiirOR1ABEBqCwNzfwLdpeI0V?=
 =?us-ascii?Q?pxqA96fjGC3ouT8/rneo6okzo4MvUV1N3Hin/nToMoZCA6OudtrwnW9SfpeD?=
 =?us-ascii?Q?AenXn31ammFBFsE1Mj7wYDCy63SklMNGwf0Wk02K6qyEVyXAvcZqi87Hh6Hw?=
 =?us-ascii?Q?tcRcA5YnhzH4c4ThVZUK0RkUMLhJRRb2UpIN2wpD0rlK6pz5PQvBUbXCTICR?=
 =?us-ascii?Q?jX1BHulbr7lFqmjZtV8FMiN+3r1c+knSfCxWpjCiFlAiQiAPR5yIhzuUSTbX?=
 =?us-ascii?Q?64VT1bekrQ7Y9gCh8se9QYr+5N8oLgbnlEzfZldNly91XCk4RhOPylixZZ3j?=
 =?us-ascii?Q?tJ13jDwnDEVTq1xXC26uZpG2rxza49AZ8yhDVOSMFjme+aeC1z8lKveFv67O?=
 =?us-ascii?Q?tAbrMAZP4RFUj0fXU8fIA0xuidL61JDbcF7NwfFff7dHnQRo6v3S25nA9OJW?=
 =?us-ascii?Q?UL6bBgy0cyS3f7Nti3p9lpsl7f7HrkM7dWOgwMlObroC8/749KgEAvi8w/WF?=
 =?us-ascii?Q?Z9MAwbB2ID5xd8YXSsan223/lzsZzM/fZNyoiRtXWQ/IrpgZnjn2OD1h56OY?=
 =?us-ascii?Q?9hm5jOFp26UcKAOtHTl0P20ExvYcAn72VrZEnlS463f57O3f4e5ukSvyUCqU?=
 =?us-ascii?Q?jZ2IDcKYV7shbCnRiks2un58zgsYDddkoUzJq8YHBh0Ql85aunQeCsO2kxYL?=
 =?us-ascii?Q?ja9pnF+c1918dBBjeq3udauR0XVnQ2CQwNPPwDb7TnpsaJRZTQ3ppgHHrcO4?=
 =?us-ascii?Q?2MNJf4Y9r2Pt37f/K6Lbf5KgzJHbG3/jKbiiCLGQKsldI1K1/EUp2RitvD+l?=
 =?us-ascii?Q?4L5QLa8JkgPZUrZJ26j2bZGIk7KTJKJj6Gxar/JY622jJTbkCf+3o8Fapaoc?=
 =?us-ascii?Q?31GmTvPMNDo8GSUXMgdU/flCicjopDQeTBBYEo2UtjnCyoDmrXAeTv6WLuh9?=
 =?us-ascii?Q?2vXRhmL6o6laQwq+iFHFE94eanoK03Apw0+hP2FU45f4UMSgxjFifeiuz5vR?=
 =?us-ascii?Q?bEK4TpT4hJbYIfK1ZQJAdDBHImOXpe3XmL+vPMyANU34+iz8Y7ncob2sv94b?=
 =?us-ascii?Q?Ca1EGXqejVcwp2bL0p8dVOtnBYwb1QspfybGK3eKWjod8Cm2ilMQkz6jFXjs?=
 =?us-ascii?Q?4a6AiiJgh7oaeElFfXtNnNueetDEi6xuqqVaC9ErY7k1opQiNtEl+bB37uv/?=
 =?us-ascii?Q?FCMEOfubRiEEQGJkd3FzyS36CFL9/lzRDclagh8MWNed5fDWVXZIM0lBC9qw?=
 =?us-ascii?Q?Ns3IbK1MpoVKhYTRNy+LIsAOejaIssQaLChF9H4iUttwzGoXx7rW551ucWy7?=
 =?us-ascii?Q?RJtx+ln7Rtd3zLY1lcCOTfgnNvObwWoJLgbzCiE6SzPTEfd3LjXIC0ety+2S?=
 =?us-ascii?Q?ykHbTU0XHjKyD43+Pjw5szuBf1NTaiGwDaom/Z47B82QZdFSSuVfbyBU0H7P?=
 =?us-ascii?Q?80s9wI3ht3xrcqv6jQLkZtPowNI4OvE=3D?=
X-Exchange-RoutingPolicyChecked: T0ABy/iacc9sObsEls0fwBz/Fm99k73g5WZp+zq5RR6xk8UC+bPE2v1xnHbsZ/gil4xVdJVMXULJvf71dU2P7qc1FVuEa6RCTaaH/DCLJCj1C5kL4HsZ1tKNifTI7jY4w4F0ohiAXCE2sR/ndN3ySHUg+iJsyGAn669AQmoWOoGtqRx6tEOwIVh0QDsq0aie8nJ4EHxlEOnSbgcfJ3nV3Dx15+FTcJ2PapEDrHHxToPSM7vhVdhdi8IpQAIdshBkuoXtLCQoMejuphAj60UlbwcZ8vpMRtekdqgou+2JPoiUaCyH1vVWlmzI55CQlcWleM/iSuc/WNG0dltb/iPa/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dd5b72-5fd6-4b4a-c10b-08deb143fa40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:04:25.4037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+MgcWoAs4EI13XaN3LUTLYNMQ6cIRPi2LjY+4Vz9SW+lOmpYr2rq18+LXrBXBYLAX6xRpe2XNFEhZMgolMye+j8CMt1TNvs8w3DUu70qq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

On Thu, Apr 30, 2026 at 05:20:04PM -0300, Gustavo Sousa wrote:
> While RTP processing evaluates true on the "yes-or" case (i.e. a
> conjunction of rules that evaluate to true followed by an "OR" without
> the right hand operand), it does not on the "or-yes" one.
> 
> Both cases are considered malformed and could be a result of someone
> dropping checks deemed not necessary anymore and forgetting to drop the
> superfluous "OR".  Nevertheless, we should aim for consistency, and
> having the "or-yes" case also evaluating to true while also causing a
> warning seems reasonable.  So let's do that.
> 
> The "or-yes" pattern being evaluated to false comes from the fact that
> that we unconditionally short-circuit upon finding XE_RTP_MATCH_OR on
> the outer loop.  We should only do that if the preceding conjunction of
> rules evaluated to true (meaning that rcount must be non-zero) and
> continue the evaluation otherwise.
> 
> Do that and also add extra test cases to validate the short-circuiting
> behavior.
> 
> Notice that some of the new test cases have a "FIXME" comment, which
> comes from the fact that we are unable to detect syntax errors after the
> short-circuit point.  That is going to be fixed in a follow-up change.
> 
> Link: https://lore.kernel.org/intel-xe/871pfw4lo9.fsf@intel.com/
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 42 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_rtp.c            | 15 ++++++++----
>  2 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 7dce699991a1..5e0afde9eab4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -172,11 +172,49 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  		XE_RTP_RULES(OR),
>  	},
>  	{
> -		.name = "or-anything",
> -		.expected_match = false,
> +		.name = "or-yes",
> +		.expected_match = true,
>  		.expected_err = -EINVAL,
>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>  	},
> +	{
> +		.name = "or-no",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "yes-or",
> +		.expected_match = true,
> +		/* FIXME: The parser should raise an error here. */
> +		.expected_err = 0,
> +		XE_RTP_RULES(FUNC(match_yes), OR),
> +	},
> +	{
> +		.name = "no-or",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR),
> +	},
> +	{
> +		.name = "no-or-or-yes",
> +		.expected_match = true,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-or-or-no",
> +		.expected_match = true,
> +		/* FIXME: The parser should raise an error here. */
> +		.expected_err = 0,
> +		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "no-or-or-no",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_no)),
> +	},
>  };
>  
>  static void xe_rtp_rules_tests(struct kunit *test)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0e1adf07e4e7..299fa4209a26 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -47,12 +47,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>  		switch (r->match_type) {
>  		case XE_RTP_MATCH_OR:
> +			if (drm_WARN_ON(&xe->drm, !rcount)) {
> +				if (err)
> +					*err = -EINVAL;
> +				continue;
> +			}
> +
>  			/*
> -			 * This is only reached if a complete set of
> -			 * rules passed or none were evaluated. For both cases,
> -			 * shortcut the other rules and return the proper value.
> +			 * This is only reached if a complete conjunction of
> +			 * rules passed, in which case we shortcut the other
> +			 * rules and return true.
>  			 */
> -			goto done;
> +			return true;
>  		case XE_RTP_MATCH_PLATFORM:
>  			match = xe->info.platform == r->platform;
>  			break;
> @@ -169,7 +175,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  		}
>  	}
>  
> -done:
>  	if (drm_WARN_ON(&xe->drm, !rcount))
>  		goto error;
>  
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
