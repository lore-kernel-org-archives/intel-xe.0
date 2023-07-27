Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC1C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05210E58E;
	Thu, 27 Jul 2023 14:03:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C33110E58E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690466632; x=1722002632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mZT7gOr+xn0XRxJjLxG57pyHJ9OYW2Fbt992Ig65ntM=;
 b=MEcC8zl+jAKJBvN1hTXvFjkbw+4H9l47GQzQpjlC996Qxzcp7oKPQwk0
 +zNaHk8gC6eXnRY6xWfmzShyMVouMKMjhrGH+6XnpXAjLq7NvmKpa1y70
 JQ2YznBLzCgZXgLVkJerdr2oqVRuazS3j1QmFy8eqJOFfgWLsj5NwNbJ8
 Y+bwmKh+GsoO+CBQ8BLL6fNFRn4/DqDLs4JWfPAa2fQjGJd/f4pmvzysF
 DL190xtLeh2bH7C+P4+Ij1NRmSlcIcaHYiot6IazOH3cxWEhOs1pSjRCD
 9EOS1ERLlZuV6xXAOBQoXpW5pkRCxsqMYYGKGiEuQTnjMbfRiULvIqtn6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368333918"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="368333918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704175034"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="704175034"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 07:03:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:03:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:03:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:03:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMqhWnxBGvWy3GeuFeGKburzHAOraFanOgwlM9LCQRUtjgAdeSyyfejm2+sKcMPT3jTFcYfe8gMZziAjOKe4DCdds15ysWffIj+/yLdAZhkclHW4DGVyjaEcvdGui6cdcYhu1NKP8cO5UHqsW5Zc5cAW8t5EKYOp2z6R/PcSDm6dIDAlgsKClVeYCDWtxHtAn+Jzo+s4gKbILo1ABnZ/Xh/z++jpfOuIeLa1wk6sZ0VI4cc3Osq2wFdB7BzhoQlpZ/M0KHDiVlKrfMsYT3/+h1idifVHuzLhMUYS+zKlqHz8KV5D0EsPlpCNbKgw8ANGJOsHxJyImRujRIyPZcG+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nvU+Yawt1aDPmqhYlgcxz19lMaFKofEYAiNZw4z+KA=;
 b=eDQXsV2r9oGABx1LnvpkIJQhSd9epswtq3mYzqBjuHZYWB2+FRIHJ3J95sJivBPn/5VJ5VmaRqMp8aa4AMk+LgEF4JW80ASY2U5/nipbBZuB3+ATe7iBn18WpvR10Vv6eZhpE7VxbZgvWGBkpGczp9QlVjETLX4uGdci41EHUsoNEBGT1sbTUKHimFkC8N/dbW+jyxq9WcDA4ZgL6CBFCj0kzBWIA4UUH9PEfMJSdiSYtxqUj15YfOnNRaxevhzmpsl+tIPukcVX4W3xsSWzWf0kw6+5ORSjHyKmnSE6XWtsLOhCItJvtYFFwpHaJV2QK7e0fB/HELZYDkzBCxtJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:03:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 14:03:47 +0000
Date: Thu, 27 Jul 2023 10:03:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZMJ5P0Bn8O8T39of@intel.com>
References: <20230727132630.7-1-francois.dugast@intel.com>
 <20230727132630.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727132630.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b10728-d285-4873-b4b3-08db8eaa4bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqTjf6zY9J0t6+QNgQnOIewf92WDkbAqOR/bGAoxYU7sBEKfKwXTgYn5RPaKgru0ZSjGnWkuF1dCJ0J0ZZtjkmOxYuXAOOj1Xepuu4Z5H2Hr23vaGHh00FFa0DZyGZG1lTLKYsUHrAVKIfUiWEsNb9Fw75mSbT+KDsunMo7E1wT1ynWpv9cw0Fbsh0INGVTomix1W1ssi3zsgkemtLaSlFjTJmWCc/3D2yfmaWSFqp08FgxQjUxs26kmDcglipAnXALCRIzrtibt8Af81vpVSq+TIubfsN5Ga8cd4xTy86L5ypHP10IrsyNXvB/EV+xBVHuZCCcKNVMjTIRrwx0SBejMgvMuOe1pLFCRCp+SbcQiCUKqyK7NYMQUv6m/aZpNOCSvENuW1QSh2+mL89k5J3dYTiK2c1SRXB4p+xCEI/DBlsRFLw2k/5G9VIeAkjx6z/HXNhsbDxw7uj2wkD15ylgQoyWUpZ/cPS0Gfo7k1JaSbziyLQ4DOvJfpB5I9sJ1xfkZnpLq0UytB27WsGm+49X1ivh/NTPu8s7Ck1HRKgXg6ki+XKgENjDTJq9Hyx5O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(37006003)(6666004)(6486002)(478600001)(6512007)(83380400001)(36756003)(86362001)(66476007)(2906002)(15650500001)(6862004)(2616005)(66556008)(6506007)(186003)(26005)(66946007)(82960400001)(38100700002)(6636002)(4326008)(316002)(44832011)(41300700001)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJ254eJa3fHkrihEl0s6d18gU6QAneWxNf/V8cmEakjKPAMYaevlzbFAItnP?=
 =?us-ascii?Q?DgFTIht9k4shcoT14AXee2B72/cqmgj3WykBUclgOU3l+iBDdUPTK9j0mrsh?=
 =?us-ascii?Q?adeWTlNAxw245gz7zk+xxA6vd9WiZkBmf3q3yBv10eZoDRrV+77Hn040QzIt?=
 =?us-ascii?Q?YZGMIieltS8rMgRpdJKwMn9dpF1f/fL17Wg3s5kzWj9OWZcmpXIXz8l7cMLC?=
 =?us-ascii?Q?01jmarcSH1vbhcEdwrWisqkwhuM0EPwAusLVoxyFrsZ3mgmn9FO//0sXBc2q?=
 =?us-ascii?Q?RCFsiqXBMhG4ndEIcPKRjN4qWihGY6Ky++vpcYeSl+X/ivJyIxuZ1/lqccwe?=
 =?us-ascii?Q?YKuCtzONhc5LiGPCQRcv1rINgY7hcfD+cwM7BNRD6rBGFVsTnTIGAUYnf6Ic?=
 =?us-ascii?Q?4TYIxo2qyVnNKgrcKspXEcQnLKN5EdJENiIUjrd+9ZRUAeOnOncxlPk7luda?=
 =?us-ascii?Q?F3sG8o9D10eFprUJ+OlXMOBk3yH0UV4Dc50rFpaWUM5W7X+1OPFPy5IgWWAS?=
 =?us-ascii?Q?thByvMSktRRSo8Unxogi1T03kYkJ+qs9Oo8a0xrnVaCXRa3MAos+2vePy7z4?=
 =?us-ascii?Q?x9xwVKqskMQBQ+98l4pcSbTIfvAxdd25UHG2sqFJ4bdar+qT5LCXyle0fjUu?=
 =?us-ascii?Q?pKVeHEriLz5N5WhyaO4ExLUj1AXugQQ+xoj/jBzQ0GHPhOwA5HBNrhsXZpn5?=
 =?us-ascii?Q?/ZMXTfm99DUJj2KZJF56hapnf430uvbm14GWlyt+RafiZoqWvN/P5zCIbptr?=
 =?us-ascii?Q?5oOK/4OaAERW15FJbqLHsAG8PbVRZ7dUWNMuZWA6tq5LUdupBbSxLQyE6oec?=
 =?us-ascii?Q?Rsu8zif88x/HEEGVb2o4QQu24MBo6+MAcO5DvYM8YPu4BDFqWJNP8BYMrd1m?=
 =?us-ascii?Q?aoMw0RQTGI4aNqxrD4P7fzkx37ExEZT6MRscdKLQB5xqIEz9cpStUgWNlYT2?=
 =?us-ascii?Q?7tgcTZsR50nMnznnIlXaiTt68cyDcT3lbT9UGQs3hyk5PY/1SUD6AQm4CmKL?=
 =?us-ascii?Q?65zIBJLwa+7Bdg2PgWp+dcuFQFb7jqIQ49cEZkcm6C/EWM3VBDA2D9UzKNy7?=
 =?us-ascii?Q?tbo5Rg4m8aTSZFoeNW4bBKZn395siyhrsrcGwi9eVERG82lTjvsJphhbPfTI?=
 =?us-ascii?Q?Rzq7yqmEYuPpFSn9oTM8NkLxaTEbe4HCBcIP3S0NqhQ4D9Ad2PbqZDY9dHyL?=
 =?us-ascii?Q?mo/RGBKoUbjSyQtA/ZG1y7n/KX84W8ukjBlvWhWsvr3p3FROk3WBx/XXbNOM?=
 =?us-ascii?Q?D/iD4o+9Xcfwzvf1S++3G//kofrnIiJuep/cse8Pux4A4wvUPMLa1PFw42/H?=
 =?us-ascii?Q?tVSEKjI2LGO/UoutY9JsX0AWGkMRp0UA2Kppbp8C7solub2y0bYngjmOYNt8?=
 =?us-ascii?Q?zuMrgMJ0/Iv6J5A+4wuCQDeUo74iqA04bHoFAAFfShQsq8jM5X9JfUmDLmo6?=
 =?us-ascii?Q?vMujkv0NBtBJBGwCYoj0j8mXw0CT5l0SlgJmQFjDd7D7c45zGZYH3tNyxx6i?=
 =?us-ascii?Q?9g2TEJku5yi2u3uxNyC8w3fDuqlumqIdZ2zl2aq2iTenN6n9lew6KJxrJUWI?=
 =?us-ascii?Q?mFKCW20EJXXYfP6Peen66lFNgAvgStGEeX0fL01YqoAj9mOHS3F69/p2eYRk?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b10728-d285-4873-b4b3-08db8eaa4bf6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:03:47.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJAGg3SLrPdllDqtIItPjvKRzP2tpoYZ+1ByCU8rE+RL6ncNaIq78YuFm6cln+uOwfEm8C1Os7kcXEvX5muiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/macro: Display XE_WARN_ON
 messages only in debug mode
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

On Thu, Jul 27, 2023 at 01:26:30PM +0000, Francois Dugast wrote:
> Make printing of XE_WARN_ON messages depend on Xe debug flag
> CONFIG_DRM_XE_DEBUG, so that those messages are not printed in production
> environments.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_macros.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..6ce86cf9605c 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -8,7 +8,14 @@
>  
>  #include <linux/bug.h>
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define XE_WARN_ON WARN_ON
> +#else
> +#define XE_WARN_ON(condition) ({					\
> +	int __ret_warn_on = !!(condition);				\
> +	unlikely(__ret_warn_on);					\
> +})
> +#endif

What about getting rid of XE_WARN_ON all together and replacing with
regular WARN_ON or drm_warn when we need the stack info or drm_{err,dbg,info}
on other cases?

I'm afraid that if we add this condition here now we will pave or way to
have a driver full of xe-isms instead of aligning with other regular drivers.


>  
>  #define XE_IOCTL_DBG(xe, cond) \
>  	((cond) && (drm_dbg(&(xe)->drm, \
> -- 
> 2.34.1
> 
