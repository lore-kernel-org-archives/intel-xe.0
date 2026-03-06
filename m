Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DF2F513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 00:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455B10EC95;
	Fri,  6 Mar 2026 00:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESk4Zq0b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323E710EC95
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 00:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772758444; x=1804294444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l+/oTJ8PjbzDxUqTEmL7MPGjrAHD3uKlf1Gqi+KS1hE=;
 b=ESk4Zq0bBRaNqMidbPnA/966sV7Qk/r358bAS4PsN68y/WkMq61HQEBA
 gAvDAUmh0jOCUkUQovItyxEU3gqFldadUNubv6WKBCWkS0ks7s7Pbxfdl
 eouQSNHZxpwvUAFdOkno99vDqjGglXIsQ1RRmjvZZ4xBQiGcoc4TiWhEF
 Co1hhBVvmCBDo16MGxIMofJdr6KvFDoK6vqsDK/pY6zijhFfF1pD3YVxr
 vKRj8oRmDMLW+6N8yuH6kFUsn157Y117NGxCNIwV832mSMYEu/4bwfSAc
 V7ii9Xec9zLFsWDg3K5/UmoDLAz/s27NV0wloLAj+brgAhEJp3Dm3RzXu g==;
X-CSE-ConnectionGUID: n+IkomfqRyi/zLwnNx66xA==
X-CSE-MsgGUID: qpIQPTMlTlaxsQWY/yYceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74050781"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="74050781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:54:04 -0800
X-CSE-ConnectionGUID: gUOSTdF5SKOqdmwQfykX2A==
X-CSE-MsgGUID: Op+y0nctQ0uK35KjMP2WMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="215588902"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:54:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:54:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 16:54:03 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:54:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTNFWIHoLkfXe+5aqMatzGpfLlLacfTEkKQdfvdeK47BUBDigQZLmTx507em6uae7cRJGWWwDX/9Ksc9fxfc2AwOaHF7VwtLCy3qCSvnIMIa5UnRRG+Id70sNQiyAq098hlznKq5UOnJAaJNVANbzpXevF7Gh6Bjef41Axdd1sVvXRnziqmfGDs2lJNn4y6wRgcMdZ6tiqd02chbIbAdyxU1/UCMIBY3sdQa64fJReIlKAyN8nOp9OxW/ODou3hL32q8pn6adexmMsFGges4xrkSn3zQeuzsBp0pNqtLSHEnFNL8J2GYw0g6qt2hq4SkqlrlrLaZB22IdKJA7TjgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2GOqMnd5Tprtlscr36ipIVRwffjXVq1seUvSVwyVJk=;
 b=Og6l76giMFXn/T85jOdchVnayZTtjejCefq3u0tUtGGvoYFgL7L1mTog399P99DlDrOzX8E+nCZw5Kb6SQ/vKUQfsffGAPEiW+2Ki6tkrHKxI2ahyfxTZAU/P5BQD8X+4KNh3BhN/5AAx7HNmFTryZQeYrMLqRln/zAjNXiHdM+eBIMiov+dE5qZGhMrWrtwB/kLUvj7gXE+5XLUs8EfArmmVON374oK/0pe/sj9WkzIU8KWwJ7kPQTvtIbT2KX3Z54GR0MBcQUXTxqYszSXjSur5y8O7ZtutLWsEPWQ0ij9qyoG8HrRChNNWEp46bjJ4WmRFMlhRsBpW/aAIgpIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 00:54:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:54:00 +0000
Date: Thu, 5 Mar 2026 16:53:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/rtp: Add support for matching platform-level
 stepping
Message-ID: <20260306005358.GW52346@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
 <20260305222256.GS4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305222256.GS4694@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: bacd0093-eaa3-4ff5-fc1e-08de7b1adafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: gI41wZcaxY9gf2jkXgjX5acjFK6ucUJXCe3apZuusjn8yATRMOZ7wygi1b6puE+r9GSb+TPhnkl1iyJWDg8yKLIypzq6KZpjU4rP4mO/In2aLLn6vsUHLAU34MjP5DYZJcki9uqVI8RJ2v4REFqpJQo8uDz04t83swp0yWjBDJXCTWq0KhC3TvZPqawbP/+ZkKQuX1M+4CxT5wl9RlxE6mU8Cti0+abvBWKb7Oi8cfnGU5EwX0oX0G0Tk6WP4v+6SGq8fVh+mvOT9cPsL8sxhlAULSQf35ID535NizpbuxjCXT51ndw07FqrNm5fjh2W1xdPBTGXfiHKc9UiEcCN0o0l2j/VqsqUZTBOCp9Gwu4ZPVCdSS0UuphHY5Y4e8rV1Xdpsl/wcZXK6lJe/rqhqNidUKnwabOw1sVK5LhjhPFLCBAjqFkjl3lIA3w53VrM+BqJ28nsFzg/WrZ+W4c9xZXp+NmJDGmGF0/cyFJGC2mVQbn9PWuyuZEVhd4VnT5K6BU+uMp9tgCWAnUBtkfgib9pjWGeqivad/h+Oewl9Ba0dmm5md1CCF0WT3JT1tjSrdXyHUuD8QCcDFrR0ZtyEqqF9Ju0T0hmLUHqGvgu+D7MSwvxvH9osLLHp/KSPdRx8lufwFLcXOZEcoNL+f8jnPT9xaec4gUeOPoc6dYgeH6tUlBn1MkjWdl2Kz3fHx4vO1jQ8a1c9x75An0e8hBVtqLFJrtgnIOI9Q4Bbx9WAzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ui6taGMZt41U3FYbprxJWzK2XighbnxthL/5FLgWMen94BkiLB/5G/MmpjdG?=
 =?us-ascii?Q?5MqwFUqRrR5hOcQnr3sfdmwVjpmERLWzzKRAnUsFADA2kihrWDnhMbBGawpp?=
 =?us-ascii?Q?Nd2bM+isbADTfJlZnnLuoAzgI5yXC3oVZfK7UVsk845dxU96EhqsneiyN/XX?=
 =?us-ascii?Q?7BAWdV/hLNvtKXH4Z2JXZ7CJcG8e4J1xgRYrIUDdzJylyInnTVPcgoqHrzw9?=
 =?us-ascii?Q?mcGh7n9AduJLpaICebtwe0X6oltj39yeYme0VUNIBw3F4LGSyfrXEAcNdBic?=
 =?us-ascii?Q?CmFmdWu+V2VRWQlmduAJ/WAhs+KDjmFKAJsJ4PbWSOMRwk7lq/Y2L3tRiwbd?=
 =?us-ascii?Q?R/i4X0HbLWe2zeDmoDO3RViw0pNh02zlvGD0vXhM9wBVdBEIkyWMaJtdFi3/?=
 =?us-ascii?Q?5knQXSpK+Rw+225QX28RmI5dIHIPbB+wGpt/l9wBQGilrR7CTo1yPP26tkH9?=
 =?us-ascii?Q?YuK3a5fv5omPTOY8z9up0dcnNFpH1Hk6JTGg6C5hcxl6KoTS638NCwGYtslo?=
 =?us-ascii?Q?PoX/5NaNyhRbSSz1KtUE9koMCIUSKM31+EqyM0DJkcz0Mi/e2+Axlzx6TmAR?=
 =?us-ascii?Q?jSW5Tm1Qy4UBdxw2CY1Lsan/ZM4ZpOR+Wy0xXz5/e3U2fPp0wA/azPSkbU3H?=
 =?us-ascii?Q?CMLk1rwHsBhgldVQz7HqBJAl902/Hqy3D42Gw2CiuiYrMHsSa032ac8wTmaG?=
 =?us-ascii?Q?pHxfBSuruE1LG4mfishDWMxtEQCHqgvJP8Vc6m0+X3GZxCeyS3b6ebTFCS/L?=
 =?us-ascii?Q?lge1fLnspW2aMiD5CawLGTFfnzA1S7oERORh5RJp23mVU7StZ8Uvx4rc4GHb?=
 =?us-ascii?Q?TZnOwNLhegoL1Z3AtmLjJJNjI04kFIUwXhy8VeLDthz6mNmE6D2ngXbUZ+Ac?=
 =?us-ascii?Q?bTD884JCI8o6SuvsJUGe5ni1a6qrjV/K4OUP/6n3T7OxxAkPirS8e/qAvUf3?=
 =?us-ascii?Q?GzLf6nCGwzG3k1TsWMaMLmLKE0+Dnfh8RP9cKrC+ChulP65IN0pZ4EqtKbOs?=
 =?us-ascii?Q?4wawo/3/GAEkou9FDkyLbLVQL1gkIvsFCfLIgJAwT+S+cH5NUSfT/vbqOpts?=
 =?us-ascii?Q?WVpys+eJuTS8ObDIEPEB/zhuV8y5b9+Lzn0AGSqhJJDFLoMRKbgdCRSGcHLi?=
 =?us-ascii?Q?j+BSEzoMzNOd3la3OpW5jOAYdmEaePx+k+CB3RWDVKuEdPU4YutDCE9WGmrk?=
 =?us-ascii?Q?u2dZg6ZMct6Pq3Vf2YfyPsYpSgh/wWWJaiuu1LttKXEb4eO/cT9c5yPgGrvI?=
 =?us-ascii?Q?ei9V2Gzpj2IAuSAk1XnpmjJjvXmsdhE0q3gFd2Qz7jd4fCGhnv0mF+W11Erl?=
 =?us-ascii?Q?N6NRE+9dAshuSj4nx1kC35j2fUn09VOoHgkC0+o07iEc03wa27xeODqsvLET?=
 =?us-ascii?Q?cuDtB5/ggc8Kpah8XRrj0wutekEq2dl28kCFuRmkvVqDRDyeCRlmyBzIdBgc?=
 =?us-ascii?Q?iuQqsoELcITxHj5XIUBKxvCAFelK9rk3KZw9DT9sTc3QTwMIu+NjGEDo3FD3?=
 =?us-ascii?Q?RGQLSqcKiwZgOEGKlcJAeGbhynSITHW4YvTojMl83qMCIkhb5euIyXY0LMBo?=
 =?us-ascii?Q?4w7utVbWOtOX5oONSl8+Rdlx6ZoPBPTPYSEBNrWA1R0yQ90Sd8wqaG01e3sd?=
 =?us-ascii?Q?VQkDB4SQNFX0x2mmItuFXxbB8CLx+iql+E1BirCUypkW/f/4dTgFVCAdzFdM?=
 =?us-ascii?Q?Swyteyqc5D+s2sGKhaOsBFxjmYm5BloePnYPltS6jSfcvRiJLhUgBMR5oeNt?=
 =?us-ascii?Q?blG6DNqp/d3Wd0CNqKzWbEv7BbmrtyI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bacd0093-eaa3-4ff5-fc1e-08de7b1adafa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:54:00.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRfiHJx1KBDViGL/oiDJJaM/mNmqcw4J4ZwT/xU/UnI02IsAhqBu/12+J6eaHWXqxioulDCaQCikiCNHrPrCZBWbLSC8XV1o43A4CgT+/l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

On Thu, Mar 05, 2026 at 02:22:56PM -0800, Matt Roper wrote:
> On Thu, Mar 05, 2026 at 09:02:31AM -0300, Gustavo Sousa wrote:
> > Add support for matching platform-level stepping, which will be used for
> > an upcoming NVL-P workaround.
> > 
> > As support for reading platform-level stepping information is added only
> > as needed in the driver, add a warning when the rule finds a STEP_NONE
> > value, which is an indication that the driver is missing such a support.
> > 
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
> >  drivers/gpu/drm/xe/xe_rtp.h       | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
> >  3 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index 7bfdc6795ce6..991f218f1cc3 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -55,6 +55,13 @@ static bool rule_matches(const struct xe_device *xe,
> >  			match = xe->info.platform == r->platform &&
> >  				xe->info.subplatform == r->subplatform;
> >  			break;
> > +		case XE_RTP_MATCH_PLATFORM_STEP:
> > +			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
> > +				return false;
> > +
> > +			match = xe->info.step.platform >= r->step_start &&
> > +				xe->info.step.platform < r->step_end;
> > +			break;
> >  		case XE_RTP_MATCH_GRAPHICS_VERSION:
> >  			if (drm_WARN_ON(&xe->drm, !gt))
> >  				return false;
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > index be4195264286..7d6daa7eb1e4 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -35,6 +35,10 @@ struct xe_reg_sr;
> >  	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
> >  	  .platform = plat__, .subplatform = sub__ }
> >  
> > +#define _XE_RTP_RULE_PLATFORM_STEP(start__, end__)				\
> > +	{ .match_type = XE_RTP_MATCH_PLATFORM_STEP,				\
> > +	  .step_start = start__, .step_end = end__ }
> > +
> >  #define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
> >  	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
> >  	  .step_start = start__, .step_end = end__ }
> > @@ -66,6 +70,22 @@ struct xe_reg_sr;
> >  #define XE_RTP_RULE_SUBPLATFORM(plat_, sub_)					\
> >  	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
> >  
> > +/**
> > + * XE_RTP_RULE_PLATFORM_STEP - Create rule matching platform-level stepping
> > + * @start_: First stepping matching the rule
> > + * @end_: First stepping that does not match the rule
> > + *
> > + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
> > + * on the left, exclusive on the right.
> > + *
> > + * You need to make sure that proper support for reading platform-level stepping
> > + * information is present for the target platform before using this rule.
> > + *
> > + * Refer to XE_RTP_RULES() for expected usage.
> > + */
> > +#define XE_RTP_RULE_PLATFORM_STEP(start_, end_)					\
> > +	_XE_RTP_RULE_PLATFORM_STEP(STEP_##start_, STEP_##end_)
> 
> To use this effectively someone will need to pair this with another rule
> like
> 
>         PLATFORM(NOVALAKE_P), PLATFORM_STEP(A2, C1)
> 
> and using PLATFORM_STEP() by itself without a corresponding PLATFORM()
> or SUBPLATFORM() would be a bug.  Maybe we should just make
> PLATFORM_STEP a rule that takes the platform as well as the stepping
> range so that it's impossible for anyone to ever use PLATFORM_STEP
> without tying it to a specific platform?  And also make a corresponding
> SUBPLATFORM_STEP() rule for cases where that's relevant.  E.g.,
> 
>         PLATFORM_STEP(NOVALAKE_P, A2, C1)
> 
> or
> 
>         SUBPLATFORM_STEP(BATTLEMAGE, BATTLEMAGE_G21, A0, B0)
> 
> We'd need to update the union in struct xe_rtp_rule, but the size of the
> union shouldn't increase.
> 
> What do you think?

Anyway, consider this feedback optional.  I think it's fine to land
as-is if you want.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> 
> Matt
> 
> > +
> >  /**
> >   * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
> >   * @start_: First stepping matching the rule
> > diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> > index 6ba7f226c227..166251615be1 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> > @@ -41,6 +41,7 @@ struct xe_rtp_action {
> >  enum {
> >  	XE_RTP_MATCH_PLATFORM,
> >  	XE_RTP_MATCH_SUBPLATFORM,
> > +	XE_RTP_MATCH_PLATFORM_STEP,
> >  	XE_RTP_MATCH_GRAPHICS_VERSION,
> >  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
> >  	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
> > 
> > -- 
> > 2.52.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
