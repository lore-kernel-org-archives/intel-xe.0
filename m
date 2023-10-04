Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34210E7B61B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F363E10E119;
	Wed,  4 Oct 2023 14:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B910E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428367; x=1727964367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/DMVAo/pfMnvgFAqh2fh6DmrwcvWrpoZlQY18hGkTCI=;
 b=YkrY5x+GUWGZoesNpx7h4lX4RUGigyrNm/7K1YawigzIyZbBy6WApAFc
 uGyItAiRTFx2vXqMySaQBwMK/ZKoJFrVZBdOzzAyu9aHn5cc7u4dvXoC4
 7vX1gr5SLhRijGCetMOLzFb1M5pyAQyGUFrtpUGp35bIBTEYSmJOnCKQv
 LTkw8xqc7nUsiyX/Tsy/WQ4sk6nBZ6Prijs8tDj2xWTJPc2X9VK6w5HRK
 0/DhMH84/9tMVKvFgXHLhny6QCR15efMwdIJ5N2Wa5TQII6okv/Cxx/P/
 41vnwW/rNQaeMYOr7ltsV92jgIGA/q34VLd6HFwu8cjpjcYkGy3irrZca g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363447419"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363447419"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="894967157"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="894967157"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:04:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:06:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:06:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNbr7Ouir02x0isQ+miJOyI0XAYZ+2Z2LTTco2i59OXCnK+Vkw9U7nraWazTgcSPiyaClpaoR/r3HJ4yZdSnplH0vFN1QfPbW6FY7Je/ZLw+K9D18Kz9644zUtimurNSsMCZDFhImjRAzXLM2/z4qPKzovkIIUBN4Rd/9HvY5j927qoq5MWYH9xyYhCfaQtQZP7LiwQRCur3yxQmTUXp3hN2ZLAvWYwZjyqCrmi46J1Dj0jRPgJ+kQWWXGTbbKZW+TQT7y8msZwdL6yzECWdfISeIfpB+75KCd3sMlyDPJ0mfnp2ixKmsoFgraPxETpQU2zbfI6ttvyW9pdZRcicVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYNsz/DFzyopluRwd1SfLNzVJw6MopH0Db7EzplygMw=;
 b=jBTeZiKHngf9FufKRZMRqIDOwZNTrccsMBTReIc7G/DLOqeVh9Jg20aXJB4hIfstlHLxcR+c+0/cptZNE2xfBqjIGP11DNaiiYZvFZbLDlLjB1GAFQ0Bp7j6y3l7JmSIUTekyJpYwcaus9rJ5FtuayLC/RqHd5FAgHg6n8lt65XL3DATs701igF73HNaJQ8FFofg5flsSpaAhJPzQDaI63YXqD+Bdj6Ssu2d1V+CD5DLb4v+WNo3p2e5MgsfAFpjwWL8Cl9Fz/FgKc2A6uiGiR4CFHD6nX8E8kt8+x90YcfgMPLOGgyn4HFBi8ASZgc8XMOXNuoEpKwQZr6zfAtplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 14:06:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:06:04 +0000
Date: Wed, 4 Oct 2023 10:05:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1xR+NhF3qOC96q@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: badbf6f5-a39e-42d8-4605-08dbc4e30bb6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2Jdd1BLz261I/GQ6Rl0+VJUxWKhMOJUYcZrUsNjuXmpQ29tQlUhBOj6t/k8WjkJ6bXaEE7gHmbKh+humOm/Usx4Phmg1hlXmZpe75yKzAIUeyQapkbE+f9XiE4WMPWueSpk7WdWVN1LdpvL+N06vztd/dsa+RAEuineDtG8q9cUYkakJEFLDbAJH5uXZ5gQ2gxRppE/Uw37doDnXnKjB6n5oznrWenq/fTD4J90sUz4HcxgJCOQwN5NZK6JIri666EUHpRc0VmLBDRddnD8YD728PW5hTIQbACKBITNudMG7rwiNLBPEkP7QjGZAZrskMqFBujotlLaFOCvFNAXeKGV8Bir+Sx6TYune4LRGXKWKG4q1vR83rosXB83d1nii897HsK3DfbDlvVjjXCxPilEMFYgij4tRX05niGsIwo2VYhgWNywEft6G5fyRZPmWjA8a5JCQsPu4p//yRRQ479SZtRa+YTpotkQhiQDDa9Ii7ObJ77FmvITKpnErSEVJaHNtjz6vX7x2dTqOmgCkx/mwfdPGV44nUsHfNrPThlrafX4V8SKyKC5aB37VqyC+hTcXdaXRoBd87ymzQDbi4wRarJl/s0t7f8k8FwyCf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2616005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(316002)(83380400001)(36756003)(66476007)(37006003)(8676002)(66946007)(66556008)(6862004)(4326008)(5660300002)(41300700001)(2906002)(478600001)(4744005)(44832011)(6666004)(6636002)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8wl4tmRxhaRVivrg3LpHEky+cW3W0TN3EZaBfzb/+lNy7f+GVZsfC3NGEvSM?=
 =?us-ascii?Q?KrOgdnGv9BdEM0BZ0l+7Z0TdP9BSW7D1IVhGRv8E8vQeCfdnKaclYbMkQh2P?=
 =?us-ascii?Q?3kCu8GUP6D1KTiJnCJrKzFxERrKEzFaCkPncDiHODbLfrM/X8vvknOCz2bv6?=
 =?us-ascii?Q?SqpaOREmWtqymfSz6K2fpme9gAWz7fXLzYHVI9LtKopiMlC33ET16PySmUBQ?=
 =?us-ascii?Q?IbBDqf8YLo9YHyh6fxxDmhD6hbp1AV26lA3/79fzuEkAjAm9Ke9uqVfBsOko?=
 =?us-ascii?Q?dvs14eTJF4uZAMnmIY7WynnekobYmQAUCvbWbBX9R5SLl97GRHn2L6Cf+xEH?=
 =?us-ascii?Q?WgZLHjiramJGNjBMdCGFPj541y4cgDIy1tSijQdDWif7fjiAxxpPOTfonGPQ?=
 =?us-ascii?Q?pJct4g4+XVz9qAqo/nlx/3kyZrl+lMV8ErRaWzi+LLbCaZt4u0bJ6EzOn9wb?=
 =?us-ascii?Q?RYHXIdVrjZGUHHI4hcbKeIj4uiCRNwZMfQ6N/WKZ5nvlIZyEbNpd4h+JmQoz?=
 =?us-ascii?Q?vY3tb8zyPFGxYB7NlIBSqkt049xGFH1qkQUyRiDt/NjFgq8N4Oq4Mzu7Q+ua?=
 =?us-ascii?Q?svJRXQpYHGeJ/5g1ZjvWqLo6m0XVxStL4oMnoslMZaN8MU1JrSctS698zxyk?=
 =?us-ascii?Q?8BvZPp9ZzxK4/aYslPrOkNdXN0J8UNlV+hrQphyiiP+8+kvB2577xaL7aYYb?=
 =?us-ascii?Q?WULoQk4kj4cG3qjrA1DoPm9i/n/YlIpli2NohTVNkoV64uWZHGmYCikkjm+7?=
 =?us-ascii?Q?0I9Xr6KpagRf1a7HtMhwurkf0bLf7oTJAqKpM+kRcx+skxLkWJtAjNvNBT0Z?=
 =?us-ascii?Q?IjsCY3N4vARGwheUOB0/sVHlMDIcDhAw8hgFaFqjJft3w0MRhOuHiQpgtJD+?=
 =?us-ascii?Q?xKpv8bX5mSocNLGtmXusyyCHWv98W1X1sUkkUS+Zhbc+hisoWuU9tEFFjX9k?=
 =?us-ascii?Q?eqCKOSVfmH6dSEqTLBtYCJFTnE+7kEzrNKjXMh6jpZTiaIZSN9nto3j2C/tG?=
 =?us-ascii?Q?m73aeoxpIXQIeQakPM6ypxgBZGUlR5zxtnPmDV4W6eAHjj65PGp62eVoP7t+?=
 =?us-ascii?Q?KZrgJy/4636yyt/iLW5tVG9eostUP29BvthyUGnoeuZFzl5lciiRURYnAW7m?=
 =?us-ascii?Q?GsKPVot0IkFvix5w8n8INUAQNcBUuU51Kh3w96TzZS2MpW1oSLGKe5f/i0cP?=
 =?us-ascii?Q?Q/VmffwYgaQvU6r1/emUXqT6SrqcY1a/5mrFLGsVQNcFEFt55JpCqYeAh02Z?=
 =?us-ascii?Q?VHWbe4RoWV7AdLBK6di7bXB63cIwHV1oKnV+9a8LQHqwUMT6Pd/K2qeYY9Eh?=
 =?us-ascii?Q?5Z1z/4Wl8bk7wX849YTglZNOHmOfC/+CWnyAjq+efPnJcT+RBnR0UxkIy2cy?=
 =?us-ascii?Q?4CnzPy6w2+skPY9LIJowkv7cKDlTTqBnYZYPTsssMo3tWGceGP2+j2fYW0J0?=
 =?us-ascii?Q?BUfOdqJcSDRQS88OJDfKzZKCm5UNGH3+4IJVSiFQF4un9UDvngrAutXji++9?=
 =?us-ascii?Q?2QVVNQuZWgt5jejuZpMcl4BetGTOrR/kKqE2bPIkkMzderuNO+TLS/gqQeAZ?=
 =?us-ascii?Q?0MiUSsS6ncQOxV8PaEyqUiUFJWtK6ILCdyEO2bsPK+3RTtrtHeqOCpjElGJl?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: badbf6f5-a39e-42d8-4605-08dbc4e30bb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:06:04.9187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3MUEtSHcMbYgbfTvgzyXTBlTppa1TD9LCg11qx5axROI/slw+a3du7xwWmVIM1K8neAcM7Qplo27O7x3fbhiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:53PM +0300, Jani Nikula wrote:
> The diag push/pop stuff is unnecessary leftovers.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_display.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 82d2c42629ce..391f08c1caca 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -417,10 +417,6 @@ void xe_display_pm_resume(struct xe_device *xe)
>  	intel_power_domains_enable(xe);
>  }
>  
> -/* Display info initialization */
> -__diag_push();
> -__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> -
>  void xe_display_probe(struct xe_device *xe)
>  {
>  	if (!xe->info.enable_display)
> @@ -435,4 +431,3 @@ void xe_display_probe(struct xe_device *xe)
>  	xe->info.enable_display = false;
>  	unset_display_features(xe);
>  }
> -__diag_pop();
> -- 
> 2.39.2
> 
