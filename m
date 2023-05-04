Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ECAC7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 04:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDA10E042;
	Thu,  4 May 2023 04:29:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B76810E042
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 04:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683174546; x=1714710546;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DhX6Byu05M12ndUHGqZT4XS0wgMuucrB/SvQZYCCRCA=;
 b=MQc+w0HJpZQz9R7c4PAia4tV2WjXLTICLsUF4qObLL4FmuxHP+18vHg0
 TAOVXrAk5j81AWwWqXq9buSiPUji/CuNxBJQHFntcfNurUr/CmMLywMpq
 EGcuHkinzZxWpz/kJRGCV7OBj/Ax2JzMS52M48bkQZp7/JjqLMOv9QHSj
 NVpPQyyzYucgzAuqkuQdvmtR4LxdfHCD8+AINiz3wMgNatR5x7KwRdFB4
 K+kCmMEiuyrv6YRWP/WP3/JM1thR/Js7waukd6a6dgyp0CYTrEbFmVDSp
 jbn+L6hjUIJR3eughZG3yffX6G7ccCHs6nNV2WiurSmvmI6oGIBcRQhC3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="346301992"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="346301992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840966756"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="840966756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 21:29:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 21:29:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 21:29:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 21:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJi4349YVV1SoEa/vTtUFdtIOJe6mbuItu9JATViSIUASAWUERa76zFJNHP0hybtQ2hjS3EWQduOvbIqNfobaszBm7YUROcP6mc+um1u3OiFwGsH6TLrvov5PtrqH3QP+mPj3XB4OOMm4e0KyT9PK93mM/eIOGO9KK9jx7Ko1hvJIMM805M2ZwFtBYZ+gbUv7FWvlxDqu/4uIWe6JJmFfDNsTvUW3mnfowtKC26ZOTxFTLmpsOv8iRR1WbEH9WxdQE49SsOo9aBJA9E6SEpAZPsvzur1HVGTAWvnR3CxF3b942AWfP4HXr+AncI+RSvpBaXsaD9dHYrPFiiDMWUrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TwT0B6PNsUoMDNwFUywFfF3wsMxmNVW52bpJOgx3eo=;
 b=lZAjh2mROzxOl6J1AY7KW5VogpCddGofbGmf2hhqeWev3jPm8AN5/5WN4g4yRC1Ws3WK7EGleFwPhhhAwvKfOpy5Ymgc0LATxrCGhMDNppr6NLTMmnqg2NKmYA/8tz8t0l/hpncNpN4k7N9aJ1kRSqPJiq+ht0JX8ollxsgDVr7wMVegggAgLbVxkxW1LZvd/YEZAuq+mafPNXQTMzEdnfBytrIcFwZZzOIhO80iSSibBc9Kv/3Wa92/jglGVTgAo6WlBf7VhvTNFKhFELgYdVyr2I7++9UgEslXg2oqH6ZaTRtMTzeym6X5jKzaDfND3mP/uP5dtlEgbe4nERmQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.28; Thu, 4 May
 2023 04:29:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 04:29:02 +0000
Date: Thu, 4 May 2023 04:28:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ZFM0ebZQ8SstMhaR@DUT025-TGLU.fm.intel.com>
References: <20230503174922.252111-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230503174922.252111-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 347f877b-0fb6-4a5c-067f-08db4c58164a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMO6JJp4C0UxFZyu4DMu00JhuO6/7RkF3l3CRIYRuq/zeDJmOcJBN159PNIXW1ZUk5lUXySZ+JAOzcx8DipiL6iQ+VlLgf7XHjjmkdvgDsFdZiI/RnWEcaTR3G13xg01CcMGTGGu5ILt7ysBV77LV9/zIFpVJhvcZo395pMUVznShzHkTrYdRgFSyWkOA1gybOPT1YpQn3+C0hjYEsUFgXtYdJNFvNHW0w7+Kcd0mjc+9xXF70dl55ASrzYSATu6f3ZoSBY7Bz0ede8A9JjOOAfJt++BXxIwElNNcvsi2c7UiWWcl1sgoQhr0pYCtNtzSTa0pNp3aQnkVGx2XAMT2cEYlFmoDOAXMels36pPcrvTW8rCSdBhtBpQEfEQcw9TiUGNld49JBfOJUvpbcA5AKvJ2FCtohDR3Jqux0e5hfB84f+pZs/TZwYPxwSXaDmNZJbb89vcyDxeOdKuFGpR/8OIrBH9FEfiGj93qMxY5EPRruplytW2lDpMcMx3LfuZDW15VEqw9ojxoi8uNRxc5DwE9codEfQGoNj21a7eBMBQZCZcJ6t4BX+3tN3zgZ9D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(44832011)(66476007)(41300700001)(66946007)(66556008)(316002)(6636002)(83380400001)(4326008)(478600001)(6486002)(38100700002)(6862004)(8936002)(8676002)(82960400001)(6666004)(4744005)(5660300002)(2906002)(6512007)(6506007)(26005)(186003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JosWHBK6qb5Gkg2aes7Ua7j/KtHkasHb0LQmTPbqjK3WOyzoFSpZ/qexDk?=
 =?iso-8859-1?Q?otiBXudfAgoO2HoUj1Xjzm7o852bH5JbXG2EmTptmZgW957XhQnMQKk9pI?=
 =?iso-8859-1?Q?Sexeoe6nVDG5VTiDmOp0wswiQHK1SQ6sU0QA9Nj/Mm8PtQxW0AYFXnKVzR?=
 =?iso-8859-1?Q?xfLF8uHLPuzu02Q++eUnI5/nVSBDE/T4XV7Ju8VPgkanqC50g+7EdOOk9/?=
 =?iso-8859-1?Q?Pc0sE+DkTitHSGW1mrdnRKEi3178i1yQAG45c8EQ+PNFUfu2Te4LntNXez?=
 =?iso-8859-1?Q?Nn+bQDycQe49l8F20vIIBPQZVBESZ9jB5V46NcnHFKHbvirVlrfTbN1rn3?=
 =?iso-8859-1?Q?88Z+YzbFDpj35ICJhpbF1muw97WpW1PLwq04Is+pasa2CupgKc9ydoq7Jx?=
 =?iso-8859-1?Q?SnWM7ZJGekbwQtfr7EQp3n5BcBbG7+HuCkNjFLi+1K/sEeJMMxSxPf0l++?=
 =?iso-8859-1?Q?tkINTj0fQgkaVOFq/ecckvR62Dt1FeXHV87RilSIIWLUtlu9OizJiDBRel?=
 =?iso-8859-1?Q?UvQPj6c4JqKSrnJnI6RuQmnxOx0BIih7H8HU185VgsMhJmzdioCDELZ8EY?=
 =?iso-8859-1?Q?Wp2wKoTbreklvfsa3WnyZS6rJRNHCKWeYRXXCVZF/PidMKHEfnsgz1TIen?=
 =?iso-8859-1?Q?UB2ui3YqUn3+U5pfJq8jwgg/pc5I2/2mrL3WXWoe/z6fNCJyliUzlWYwTv?=
 =?iso-8859-1?Q?9ap4nUhDNr2BdFTnAmHTmuVZQvzFhNXTfADxcxCyB/0ir0SsX3FVs9yV93?=
 =?iso-8859-1?Q?Xa7UlLo8rjfKdYxLH6AV5FAEs8O+GWnOesrPMxfCN5OQtmIlgShu3fvMIF?=
 =?iso-8859-1?Q?InAjGIckuO+TWl5j2zxWrtrYIFpjKmvn4y7PmBg4F7dyDfNfqMTlHqBX0N?=
 =?iso-8859-1?Q?6j+rfyP0tVVQwDhgVJdqWF7J5wS6nov597gBGbzm92ry8R0tCJ5dviY27L?=
 =?iso-8859-1?Q?BRVlGrL5Cx0NGgAnjfmzYyvZj5obYqaBTYMKWtVqonJumnGHMN/5eD4VRs?=
 =?iso-8859-1?Q?xs5TyHkyM9gCj6abR/EiRLsitNt4ipriNkEAkVdZsCZjoi8kNr+AhPVshh?=
 =?iso-8859-1?Q?PfyJdqscf3aXy0gL+fMozprbXd03q1dvOM4jUuhYw9+FYC4mGON9kGKwo4?=
 =?iso-8859-1?Q?6A9NIqwuZvMJAZ8MlmsjP1pXvozpDQfJS+zVhL7bTjzlk19RMTLCeAhUeG?=
 =?iso-8859-1?Q?5w4HjAY1RuqFbGqHxiD9lCRN1NK3Gj4DwpgLkVUBo7zdXpj2c+v4FB7kIt?=
 =?iso-8859-1?Q?QrIGSXoW/uFpQuI5z6qIzAbjoa915RxxpOz8k3+ZF1OEdeO1Q4rCpNDqzC?=
 =?iso-8859-1?Q?bWoQSZPoKsb6dQFlpyVQhC/Z40tjwdI7r7/NXALWniRhTc6W8r/MOhoNq0?=
 =?iso-8859-1?Q?n0aFaPS9LzrSWHMlPkJxh0v67B8kJQ5VL3+5OnD+kEu8uvG2ZXrvKOoikw?=
 =?iso-8859-1?Q?brW/u0qhw6UrKuWFxS9MCu02pMtyO7C2lTyc9CWzNV7LiPKKuY9jz22IuB?=
 =?iso-8859-1?Q?tdBArIIHCNg3tGmyrX7hefxJnBq8ysXNXDK1piv79ZdC6w3ZdsX6BtE5se?=
 =?iso-8859-1?Q?Q23TDrsHKbwVFBWJSaHD1nxaE8R+KzSQ0Sw39QOcjSn83BbEkR2dB963iM?=
 =?iso-8859-1?Q?crBiOWH0DC6wYDpEXyIqVjeEdP4x0gUleWffTHGVPc3nqCeKfa3MS5fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 347f877b-0fb6-4a5c-067f-08db4c58164a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:29:02.0114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik8SkqILI5eZOBv0NcW9QTpyAC+ky8iIOJgcdDFco3ge0zZsTnPAePsu2nsbps1HBR69mZMctHSMw64l8ZQ7MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Include only relevant header in
 xe_module.h
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

On Wed, May 03, 2023 at 02:49:22PM -0300, Gustavo Sousa wrote:
> Things defined in <linux/init.h> are not really used by that header.
> Replace that with <linux/types.h>, to have bool and u32 available.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_module.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 86916c176382..7169907c3365 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -3,7 +3,7 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#include <linux/init.h>
> +#include <linux/types.h>
>  
>  /* Module modprobe variables */
>  extern bool enable_guc;
> -- 
> 2.40.0
> 
