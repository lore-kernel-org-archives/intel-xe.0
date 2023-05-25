Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812CFC77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B8510E784;
	Thu, 25 May 2023 22:31:33 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20B10E784
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685053891; x=1716589891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xiglYDSeKK87NtIGyGVwiqImzPz6RrY4vbo9HyIZdYc=;
 b=Qh9s3QqwfgQVwEBt3t3auzoCBL0OeQSM6D8gT4bgPjO3XzSPOFjHdwX9
 yZNNZ4o4YNnx6TR1e4RxBOpdo0W4ClizDAVrZ16P1oqgFYqZOPUfohL5H
 x6hJsLy8cxtfDQXk+F4jxGBPdKEFHCEJS9lelC7DJPwlimWS79kPxYSqz
 tN38WYhVK695oWkzlwxqvAHOe54TPgXEaFaGOMngGJ1Cv67FxxFKb7bbL
 ZNS1/L/xHxu99EvmpPl5BlqDSfpZq8LxpJzFmjSaZco0wFw0N+lqdgWEV
 ORFOJViEazj8DFUu4uIKZ4thAaUcum0un00j0cRz2c92aI+nos3/3eBk7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333674180"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333674180"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="829275784"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="829275784"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 25 May 2023 15:31:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:31:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:31:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fH3MrhSNCjguK4Yn3kbF1g7SitHCfnHW8vt94yW9luQYgxdaiQkO2CAYrEY1K4f4bWUjzBvQtHKvDZCm7n6GVBGG0zR/NERawpEW4Dfmcq+Q+GpJ7RP0vJ/M+4i6DtSAp1ufWp3cGP2syCJudqqK4CDeorK/fyDZ8/UwvTyVMP4/tkvIVTL/RRtNPGUsJLjws+1canF8IgPWJ+HHqFnLW1gmTzINugXcNeR92QiqpXkOGcA+2IMIHUuCIMcMIJVW9o/R0oy5dgYicdqMmGmq/D7Tx6h4GcjUK8XR16OY31NbO5flcQKB1SOvJS2ErBCpGnrBN2qekimeKqhFB6o5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NQ7CVN/5+2r6RCf1CihBTCi+eCTZp1LKhmHscktfJg=;
 b=c2MfzSQNO9UWu4oPFA19/r7lEBniAW2nVxhBtcL7FFOk/eZT4jiFBMm6UbAjrwdakNoPb8+9Q2t7hNr/Pfm26/NMHqL6VDZvKf0SLWjzW5Nq1sm6KFS5QCXWxyY+91zIHIxSnI161sz9bO1lmC6iYDmTUzHAv3k+ZXVB6BiwUQwrvdcD25CfQGxRD5AN0KRd5LSAVM5SEDZqLYujKNYnQOS9Mp5O4m2qka5i1IDPeHH0jTiVTT/QV4xF6kwwEpe6VFFyAc1vEyVC2bieoNpIGxE6nAlrm7R0g/4GjZTWJcxwP9LhbJexPjT8rMMk4ZpMb+sSXgCoGLEGT7U/UpLGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 22:31:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:31:27 +0000
Date: Thu, 25 May 2023 15:31:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525223124.GW10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 8045c245-dbcc-4682-9261-08db5d6fc76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LheCG6a8faRjJ48Cw0BI57PMA8edkWgJ8lRwhJf/Xhoo7qJCTpenTmNJbOOx5MVY8e/EXY0Eh6YiL9I+QfvZIJLqIZieLrcWbqvASgBGWx/JUPodhdx28QuSlqj9XSG2Ms6hZBsAHPlmK3h/kMGXk5s30M4NbLJxAN0hiWuMT9ISkvh8o28Mh5Z6dgcQSUD9ug/RPMNFdSZR2Yjgehy2G5eKvz238OUyEAfZriSFrK9n877v/kF0D2FFcnlJGdjxD2oUBBPTc+lmi8tOvsE5o2TZ5GctXasjxUTuoljZuHkhPw2HhGA3FzUbWKiOmZ03gEFq8swT17IhEpNk/H9UeYid4U1TD59JDNXwAoxFszii+mRtZqKWREdqM/Fc100HufO/JA4yscSVdsVphBdQY9tTgpT7Ml2NMCp8Dc5tfMJ6S71pUCJqNw4N7diRL64QQ/LwE8mxY0knG2TGNYuLA5B6r1FAJ7z2OEr9cx8jSfWV4eyBEoq+q1M9SKn1DwiRIf6k62hJXnytvzS1g+zT0nsQhRGsOpR1mJnRQ4jEzkifxdH4fQc8GPClrFVCiOT4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(33656002)(86362001)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6666004)(6486002)(6862004)(8936002)(41300700001)(5660300002)(8676002)(2906002)(30864003)(38100700002)(82960400001)(6512007)(186003)(6506007)(66574015)(1076003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LfGb25g5lKFxhytxF6C9BY6U3vysic5AWvI2xtL6decIkKONzRsnGUMWXqaQ?=
 =?us-ascii?Q?dCx5dn6OEdSkFR2NJXTqaunsrKI3pN32R9ehHor4zqm1MAWwJ+8bcL1FN0JO?=
 =?us-ascii?Q?OY0FSY4sVWII0rRF4gU1agA/h8VeUjWKfMTTjKbU+sm3nZ0Dv+SCslIvbLpf?=
 =?us-ascii?Q?EfPh7lNt8aJrNO2SfQjMquek9G+n24BOzBsNGdG5XGexenNSJLDVIn5YJGKd?=
 =?us-ascii?Q?ASbJOLiTNOkgiyU8qE55se0N2fXi2PmDVHrj6DT44RFu+xkrtPcWWW2QdeiP?=
 =?us-ascii?Q?s4fED7ZHCKib/BnC61Zep1BnNIqD1EfYfhfDFikTcF2onDxcN948InTnPz7Z?=
 =?us-ascii?Q?g4HIJ/loywoCCo3jRqYhaXCXfrLgHncjby5R15rlO1Ey6LBysCfp8ICKfXxh?=
 =?us-ascii?Q?Iw84QMzIVMWjxs7TYGgUKGRkzHqVr5a/HMW04rJqura/h7e+xQ05HyxBa1Pg?=
 =?us-ascii?Q?c0dgV7NHubOuoP+mxBekf+kWX2Jwz7xOS9oajFnG71tzXJ+r+Y3aSi4P7WxH?=
 =?us-ascii?Q?iCeNFuRicCKQen+K5G3M98Y2KkArcaDsqKvgrEwYVzDKFHFETLf2fwPsuAsQ?=
 =?us-ascii?Q?h2aSOMR188FAnhUg3ycfEtZnJ95AUbCfxsYcKxL3Q2p82S9bIWuszKST4JsV?=
 =?us-ascii?Q?mPqKCFRjpiegBRcFsf4BrwHUNQKZbVMVHcgWh1t1uZ5R3VwYQUdM/FNLBlGL?=
 =?us-ascii?Q?Nzf+a4oX23wAqLdiHnPHbvDI0Ac/mI4fHOXHzz81w15Ch+VTqWKFdL2s5rsY?=
 =?us-ascii?Q?Vh/Ga9BeLFqowofyzQhxLtOsoOzneB9FXcaV87jKzEJ3I1P8opYjhwiosbTq?=
 =?us-ascii?Q?cgVBKcrHyWyOapMLR5iJF6aH/a7ElYwikaui9+gn/ZqgpNvifI53ovxTPiqh?=
 =?us-ascii?Q?xZhimM8SekMqbj5XI2Qpx3Mi2Q/CbUQwtV5QrnWErOCVbBp08i7PzRTidrQb?=
 =?us-ascii?Q?7ZsYv8hRmPlNR13HN8q2dXVE5AwLiR9KsufixMiZk+UZc4o8kJOgbukKnVfD?=
 =?us-ascii?Q?ecsBPtXoVVQvrEnfvlG4tyATd/jxXxm8ZR9lhiylkPoC7Tl1ucjbLrONIRFG?=
 =?us-ascii?Q?b4kv62Esftzr0IbstSXiMNpb+uclgd/h7m6s83Yn27kO7CZn1MspjvPzP4o/?=
 =?us-ascii?Q?+dZX27V9kcoLj+eIF2GayIvrbhCbUf9c+OgUMJwJ7k4H/7yDp5kydD96UmMM?=
 =?us-ascii?Q?9d5v0oySz51klFJxa7+uMXE4pUessbdBILw+zD+z35qE8rGkiwNcUhuQidFg?=
 =?us-ascii?Q?Uv1RFU0RD0I1CX67HmO7k8AcaaopNJy5Tv0ohzISeX9mujHciMfP8FrtRkLn?=
 =?us-ascii?Q?sE9bR6nTA8kh+0COL1RQgbeWtkN9qwXX4u3j+Qu3g7HlL2jbfOmI6K/Rk7tK?=
 =?us-ascii?Q?Or3RHIjQF0+OLFTUG+0wcc3n88N11BNnwj+F4JlcOzX9S9+M/+/z0WGDSkAj?=
 =?us-ascii?Q?elyKEYRr2mxfZPFBuyxyqyAAObc12wstNWxRIAbOInxSxUM9K+r3192MFDij?=
 =?us-ascii?Q?xD/szA7qz5fTZWeoO3eUWpls6IHH83L9pfwMmhp1OyChswHvbwLfaqvjrDzg?=
 =?us-ascii?Q?Jgycc3Ph5qdaziSwz40/4/I4WGelwvWDyOUihC9aDV4+Yvdp3SN4ld39Tv97?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8045c245-dbcc-4682-9261-08db5d6fc76d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:31:27.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW7cBZ0mzq21/9iDWQ/O8N0gTnEZrDcsXXroJ1u4RZKyfmWQUGz4Df9WJ784OSRKb2jQWK5VDAdJ7IcJgWxvrgeQ2NceoJ3MxVmQT/zABKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 08/21] drm/xe/rtp: Rename STEP to
 GRAPHICS_STEP
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

On Thu, May 25, 2023 at 02:33:54PM -0700, Lucas De Marchi wrote:
> Rename the RTP match in order to prepare the code base to check for the
> media version. Up until MTL, the graphics vs media distinction wrt to
> stepping was not ver relevant as they were the same GT. However, with
> MTL this is no longer true.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c       |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.h       | 16 ++++----
>  drivers/gpu/drm/xe/xe_rtp_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c        | 64 ++++++++++++++++++-------------
>  4 files changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 29cf92f9b7b3..2ac7b47942fe 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -57,7 +57,7 @@ static bool rule_matches(const struct xe_device *xe,
>  			match = xe->info.media_verx100 >= r->ver_start &&
>  				xe->info.media_verx100 <= r->ver_end;
>  			break;
> -		case XE_RTP_MATCH_STEP:
> +		case XE_RTP_MATCH_GRAPHICS_STEP:
>  			/* TODO: match media/display */
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index e69f514ee6c4..7ba9d2ecab92 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -35,8 +35,8 @@ struct xe_reg_sr;
>  	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
>  	  .platform = plat__, .subplatform = sub__ }
>  
> -#define _XE_RTP_RULE_STEP(start__, end__)					\
> -	{ .match_type = XE_RTP_MATCH_STEP,					\
> +#define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
> +	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
>  	  .step_start = start__, .step_end = end__ }
>  
>  #define _XE_RTP_RULE_ENGINE_CLASS(cls__)					\
> @@ -63,17 +63,17 @@ struct xe_reg_sr;
>  	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
>  
>  /**
> - * XE_RTP_RULE_STEP - Create rule matching platform stepping
> + * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
>   * @start_: First stepping matching the rule
>   * @end_: First stepping that does not match the rule
>   *
> - * Note that the range matching this rule [ @start_, @end_ ), i.e. inclusive on
> - * the left, exclusive on the right.
> + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
> + * on the left, exclusive on the right.
>   *
>   * Refer to XE_RTP_RULES() for expected usage.
>   */
> -#define XE_RTP_RULE_STEP(start_, end_)						\
> -	_XE_RTP_RULE_STEP(STEP_##start_, STEP_##end_)
> +#define XE_RTP_RULE_GRAPHICS_STEP(start_, end_)					\
> +	_XE_RTP_RULE_GRAPHICS_STEP(STEP_##start_, STEP_##end_)
>  
>  /**
>   * XE_RTP_RULE_ENGINE_CLASS - Create rule matching an engine class
> @@ -317,7 +317,7 @@ struct xe_reg_sr;
>   *	const struct xe_rtp_entry_sr wa_entries[] = {
>   *		...
>   *		{ XE_RTP_NAME("test-entry"),
> - *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> + *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>   *		  ...
>   *		},
>   *		...
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 03d97b666c64..52adbf7de752 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -39,11 +39,11 @@ enum {
>  	XE_RTP_MATCH_SUBPLATFORM,
>  	XE_RTP_MATCH_GRAPHICS_VERSION,
>  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
> +	XE_RTP_MATCH_GRAPHICS_STEP,
>  	XE_RTP_MATCH_MEDIA_VERSION,
>  	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
>  	XE_RTP_MATCH_INTEGRATED,
>  	XE_RTP_MATCH_DISCRETE,
> -	XE_RTP_MATCH_STEP,
>  	XE_RTP_MATCH_ENGINE_CLASS,
>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
>  	XE_RTP_MATCH_FUNC,
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index f578544c7646..b717e0025bd9 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -122,7 +122,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	{ XE_RTP_NAME("16010515920"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
> -		       STEP(A0, B0),
> +		       GRAPHICS_STEP(A0, B0),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F18(0), ALNUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> @@ -136,27 +136,27 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14012362059"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>  	},
>  	{ XE_RTP_NAME("14012362059"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>  	},
>  	{ XE_RTP_NAME("14010948348"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14011037102"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9444, LTCDD_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14011371254"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14011431319"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9440,
>  			     GAMTLBOACS_CLKGATE_DIS |
>  			     GAMTLBVDBOX7_CLKGATE_DIS | GAMTLBVDBOX6_CLKGATE_DIS |
> @@ -176,15 +176,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  			     GAMTLBVEBOX1_CLKGATE_DIS | GAMTLBVEBOX0_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14010569222"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, GAMEDIA_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14011028019"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14010680813"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
>  			     CONTROL_BLOCK_CLKGATE_DIS |
>  			     EGRESS_BLOCK_CLKGATE_DIS |
> @@ -316,7 +316,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     POLYGON_TRIFAN_LINELOOP_DISABLE))
>  	},
>  	{ XE_RTP_NAME("22012826095, 22013059131"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
>  				   MAXREQS_PER_BANK,
> @@ -330,7 +330,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
>  	},
>  	{ XE_RTP_NAME("22013059131"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
>  	},
> @@ -368,7 +368,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
>  	},
>  	{ XE_RTP_NAME("22012654132"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
>  			     /*
> @@ -396,21 +396,25 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
>  	},
>  	{ XE_RTP_NAME("14013392000"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>  			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>  			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>  	},
>  	{ XE_RTP_NAME("1308578152"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
> +		       ENGINE_CLASS(RENDER),
>  		       FUNC(xe_rtp_match_first_gslice_fused_off)),
>  	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
>  			     REPLAY_MODE_GRANULARITY))
> @@ -426,30 +430,35 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
>  	},
>  	{ XE_RTP_NAME("22010430635"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>  			     DISABLE_GRF_CLEAR))
>  	},
>  	{ XE_RTP_NAME("14013202645"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>  	},
>  	{ XE_RTP_NAME("14013202645"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>  	},
>  	{ XE_RTP_NAME("22012532006"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>  			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>  	},
>  	{ XE_RTP_NAME("22012532006"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>  			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>  	},
>  	{ XE_RTP_NAME("22014600077"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>  			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> @@ -485,7 +494,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14014999345"),
> -	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
> +		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
>  	{}
> @@ -528,17 +538,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	/* DG2 */
>  
>  	{ XE_RTP_NAME("16011186671"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
>  			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
>  	},
>  	{ XE_RTP_NAME("14010469329"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>  			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
> -	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>  			     DISABLE_CPS_AWARE_COLOR_PIPE))
>  	},
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
