Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F015C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 23:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7810E03E;
	Wed,  3 Jul 2024 23:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPKMKbi9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ACD10E03E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720049002; x=1751585002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Ig1kekhBwxWwoEazKegLMnTmSwTLgfV2P9OrlX89ZI=;
 b=MPKMKbi9MjiSdOISjhsKAmNSsftf3mxMVXoI6ItTtwQAYuXlRsh/UfKf
 ASUfiOTwpjnX4wNG4r3tVWT0hZmMnwMXMtULIHi2qr7oJc1MHX1o7DkeI
 ZNZ7cyU3QsrNqDb2915UJXZM9V62W61hyyPVbaQFx5S62WmWw8TCkBSRn
 xGtdS1PEYhfO+deZE7bFmxk5Hqsngx6D1opF9is5K5DZMHnmGAqNr7GpQ
 P6FO6Zg0Ucy91yw/a73cEVm+/nIYEaynDm4PFEf5FMAhWVUmNaJWqfi1E
 NTmuDvNdXL5+7CxGzOm1YgNr9rJROqgPyS6M1uNkxsoE84Cis1+lqyliL w==;
X-CSE-ConnectionGUID: 87i2iHEzSemm4p8iqAelXw==
X-CSE-MsgGUID: MJScAR2aRhmaCP3cXuZRfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27909292"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="27909292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 16:23:22 -0700
X-CSE-ConnectionGUID: dn+VaNaeRCutFHuNYi8peA==
X-CSE-MsgGUID: YUcKys99S2iNeoG788D+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46833971"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 16:23:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 16:23:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 16:23:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 16:23:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 16:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky66a3YQE6LwFfB+pbrNB8FVJvw+nj5xsyPdacU8bA8RKssHZy4hXK+4AkbBV5hhnmqXKrMXlxT00TmbpVAOW/FW6X29gHngH+MGV09yOrzPT7/c2zsSUCQwYOOLp4lyPZ3qOHhehAdaHvZBFTOLjreWfzsA+3jECMh7NSPIl4sSkXiUTfQjvqjPEq+IO9yZiDcKlrGYX8Yr4wdZypx7MWd9T+UgmIGVg0DRuGXYMNVkDOkCfLkzoz0iKXpzZ72nQvozMXsqRAjbfzDS+IZKIEyEObMr+2KeGm7wDfeEWI2wBFWhpTRxUa3stpyzdbCsV5V1core62uGq1tmZMAsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTLw07m1+q8x3LIRtuQqYJXR5IzjyZdFB3ZCxD2njfk=;
 b=DYu1nbAmYC98LHMtpDuux/p16RVzfJffeTAxuSfu7n66eN0bC9Ez/sIp0+72LLn0HNOAl2fxj/zdSCdl0UP0jyVPWlO1AVMvDHvzP1BL5FoAL+MJUenm7xgD2RD5TT/mdOU/UdD30Ipz0DRkHg2wdHQRNJJPGAbiSYLvjjkU/YTpWs6zF8ST/C3x/GihjR8xE86HEHHFeSWOta/E1TJp5rugd6yvWv+LdZi32Sh082PL+MsMhgNVH3byB3ELMwN4IOsR4z7oJXiyszBT0bncKsqt5/4CyOWPjSEzBhxDrTC+e2Ed58sK32rI2bkcwSlQKVoYN7SQD+ukVephL2uw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 23:23:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 23:23:18 +0000
Date: Wed, 3 Jul 2024 16:23:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm/xe/xe2: Add Wa_15015404425
Message-ID: <20240703232315.GB2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240703064626.2581326-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240703064626.2581326-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d429a80-d14e-4a23-6690-08dc9bb71f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZB8a20NSjYE1/bPmocAJhnBpyaaxtde/hSIYYcgeZ8i0fmi/T3T4CK0MtxO?=
 =?us-ascii?Q?hzY/Ojy4KZOeDKpyQZfkrFu23mj83xNAFTBKHEurKewgxgrjDBxHLrpbCl2X?=
 =?us-ascii?Q?0tJXsZqoSvB4pUDbBNWhaCFOX91JJTQPW3ZlUWfRaeRf1dxuqXwplpg/azOq?=
 =?us-ascii?Q?6BekUf8f4eLeSW6UI61nbi56vQP07Dw9dFeUxR8keEt+Q/o9XNzgfPAdcEBM?=
 =?us-ascii?Q?M1pDNy4oWScBKKDoO+dTmC2tQZhYYbCVgzAmYi95ff2zciLzkeCZ+pZbuHzI?=
 =?us-ascii?Q?aKy6au0r4Z6UHb++5Isr61lyS/PHvh0SZOAPLUL5/JWQFYybvHAX9TCJL+sF?=
 =?us-ascii?Q?uKiv708i6dHS+4120eW0sKx5nxQk50yP1D9UHoHdPSe/nb48/pmRKN/HIHbM?=
 =?us-ascii?Q?I6/jOwLkokZzqgy9GmjRyNEWf+XO9ViJ4BVohO6iVNwOboKpW2205fAaRWkS?=
 =?us-ascii?Q?OPK4DAHkv0kC8rbvh0JFZxmCqteZd5gvL8/mS6cdUPQ9RY2MN3S7NXyMbtNz?=
 =?us-ascii?Q?yN9T0zq+HpGkWtFNvkr/1xZ3jxlaiyGepG6nqLITPLeBhKlzLRJ2EqaxIFBC?=
 =?us-ascii?Q?Y30Mw0oQq8HQSSbSYzhvUEu7FQ6XIITSmdiXVsapk3hX+M+Qh5qnBXeoBi2x?=
 =?us-ascii?Q?zKo3WdhoOnyOIOUy/E6aQvJTP+hTxpyzrMfSoBW6lmB2b79djgwK5dOTwRS4?=
 =?us-ascii?Q?+gOneRjQwPAkhdlUqzVfonIkHXVPyTbEIt4HxR/eDsexpGf1MS4y2wGZLJy6?=
 =?us-ascii?Q?sAWca1Nu84mv7XCq3OQyaKvJcLVh+jq8sSvtKDxlY8WUFcEK40i6vy62Rale?=
 =?us-ascii?Q?CM4s0uT0XAc2AMiPnV/UY75IYRM9DL/5sa0tuI+yiaujVrempSmZ9nwZ/PGy?=
 =?us-ascii?Q?jRApo9lFVMHWiwjtaVdO/mGGIhAr+Tqy5pdkRvuyUaD1KHNRYOxALagoZBX/?=
 =?us-ascii?Q?i7wXwlBMSjF/EHSihh5SANW4RDduUKco0189oyyliBBC3swXFdAvnGG9gy+x?=
 =?us-ascii?Q?RRvvqea+POA9T3Dfy759nrXRm9/p/bKgaoOG2RRbN1yVTXoM8mlf1hkadsij?=
 =?us-ascii?Q?IupoSEHsR+MdAl31hm4kHBku5dqHmR/eXfS2j5J9ezyFKZq6qDYzNd3uTLcr?=
 =?us-ascii?Q?ABAgyrlLMYJVOSbvgQGRY9EbamVKeryBSvYpn+XikXAtZP9WMz6YIow9VnK0?=
 =?us-ascii?Q?tqC9umLIeRPxf+GE5kGaZVkpDeXDiWlnojiMgrkNjvGma/qED6zB4ktU9bGo?=
 =?us-ascii?Q?J5zrBE3Z+eQbl7ci5jSOJ9Bk+oUH+gOqBYPnBSXDfBcJenEf/z/3R52uBOZI?=
 =?us-ascii?Q?ffvhAGUy9rybQ7ldGxoCwt2Ciz/PXtFlwDHBUphZz4Mo+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WMOG4bJuqpdDLfztUMlZ1BUQKDPiDJY9rZaNI6GgL7dWj9CuliS/N9LyztYn?=
 =?us-ascii?Q?sjNIqH3TTG00GPRYCpncCcdW9MWhUXalSldLY3Y19BVaJEuTKOY0x7hy/UZi?=
 =?us-ascii?Q?PuK+q6x7MF9d1tJB7RpzdfvfdJpvdNmcnEQKBMiahk4LMWl+nz442AYhD44B?=
 =?us-ascii?Q?UtmolVLRHwt9Yb2GZ+wsaNdEqrrKJ5Cukv/TZqAZt1NF69En++W29IK1ylYX?=
 =?us-ascii?Q?0NZGPbFUP8mdfY3T6c7WBWNJUFfE/3lYQaXIrZJgDIpVtBpKHew+91+Z4PMS?=
 =?us-ascii?Q?ZTVceIb2fTuT7tMG78MvRvJRdZHGSsRyxT3ujt6jEK8xavuSJydvEZJLhdXw?=
 =?us-ascii?Q?zRQmXDTSyLNkppF8Nmi8BFxF3EzVcfrKQolMNTbdbwIpBBaEufietpRgw8ur?=
 =?us-ascii?Q?uUZW4Z5E7BIDFzQWQmd728X9SuJf92vvNXHxIV1SC1VqblgNi/QpJdf+BF+P?=
 =?us-ascii?Q?spysxSxe/N5GHp64xWY/vQfD1cXoj0ptrXVW3cybwMedPdsZkfD1KwOByanp?=
 =?us-ascii?Q?ntEoA3gsgcS8mHc0FAj/B3XpzMT1Xy+VXt6C7tR6+Z1Uew2e0mHAIdCoBjY2?=
 =?us-ascii?Q?C83tbyBb1pZov8GIBfZrFZHpNrPg0zGC9qHtzMUSQE+Y3RLyAz/K3XIAsJh2?=
 =?us-ascii?Q?msB/C79qLDYOpzxSs7XWactyZftoStgmb4JCkUHuqzyrxltoh2aBTUxZsgFQ?=
 =?us-ascii?Q?ij3tr4LinZK0VcTkh56Obmu4vYkLB5QKmFT/3fpMmbPiG+APhGfTqrUiOzpF?=
 =?us-ascii?Q?dhLEgKR7hPe6grAWJgMi6XxQe5gFLDmfTkyCfhOW2RVfj1YtqvYoD9rDf8g1?=
 =?us-ascii?Q?ygTZ4wKHdXYQgxZxnQaXMqOfF7mpr34Xoc5WHv0CxH/TRejHCwGkjctiG5CH?=
 =?us-ascii?Q?W5EIe2cTNqID8gkFJcxd0X3ae4zSqOPfF4PpXB9jLzjXMF0AoSzLDhP6AnBq?=
 =?us-ascii?Q?xiArKNDbZH2IKVt8t6IDVhYSiFJRCvWuuqrCxMVF5hU3O20WZivXIoxZ4lcc?=
 =?us-ascii?Q?2nGfpZi722JfiPg4wjw2h0UedoFAAbN/PkSAzm0LAWo4ZLhkxQNBLRIR4maN?=
 =?us-ascii?Q?wMleaBoYu+rVnPDniQSzQN21/npVc1k6/Uyqva0aT/q86tzCgOn/iBqUygS3?=
 =?us-ascii?Q?82vxvZRV6HtiZBs70wy6jGRXcpgeNcPBabjLkh+zIgLCO2Q27Y3a8dNgbFP8?=
 =?us-ascii?Q?bfsOfOIBC1DEPe7KEtzinLMHtKG63QG4gEOdiL6br/wD2G5Wly7H6Bjty5wJ?=
 =?us-ascii?Q?EJ+e3IhgcvL8Knbd8Hr3Lzl1VXX8i3VCqbwIdmo9j8LzUAHeacyQejWvT1PB?=
 =?us-ascii?Q?wqFRr5zhlrSotqlo5ylcNyLvYR+ydGQnWOzyfXcgI22RgsXVwdI4riClhgv8?=
 =?us-ascii?Q?DkgPXq0W8jMVbmrDlY0lQke3hACpot2c9C8mVJWkxnyLxYGHdv6zgk6H2jbu?=
 =?us-ascii?Q?CtvzdAjtsntp/xUIWsftAcncszaC0WnFoDdazxYzK22aMk/AEW0AIHZ6xEG+?=
 =?us-ascii?Q?jj9oyUk19l9+sSgUMHzMkEklD8mclV79Wo94uDnsLn8CELQpDJTnqnegGAlA?=
 =?us-ascii?Q?GbOszoaYdCK0d9BtOmEsCEixuHHzC/siIsdjqtrsQB/N24pFPh09Sf1gPy2K?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d429a80-d14e-4a23-6690-08dc9bb71f26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 23:23:18.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+geo3moFjwmKfb7v/1+vdocsyFGVIkHKVV/fKjKvAJxmULsW8Y4M4macGZjtSnrwxR4x0vHxv2BsY+BRIA8iGzrXBlgDvHXnxH0dWvv+TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

On Wed, Jul 03, 2024 at 12:16:26PM +0530, Tejas Upadhyay wrote:
> Wa_15015404425 applies to xe2 LNL all steppings

Since this isn't a typical "write XX to register YY" workaround, we
should have a brief explanation of what the workaround is asking us to
do here for context.  E.g., something along the lines of

        "Wa_15015404425 asks us to perform four "dummy" writes to a
        non-existent register offset before every real register read.
        Although the specific offset of the writes doesn't directly
        matter, the workaround suggests offset 0x130030 as a good target
        so that these writes will be easy to recognize and filter out in
        debugging traces."

> 
> V2:
>   - Add WA to 8/16/32bit reads also - MattR
>   - Corrected dummy reg address - MattR
>   - Use for loop to avoid mental pause - JaniN
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c      | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 23e33ec84902..56a1ba59cbd3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -45,6 +45,7 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>  
> +#define MEDIA_DUMMY_REG				XE_REG(0x130030)

Since this workaround wound up not actually being media-related at all,
does the "MEDIA_" prefix here make sense?  This register isn't actually
in the media IP (according to bspec 60110 it's just in the general
sgunit register range).  Honestly, since there's no real register at
this offset in the hardware, this might be a case where we don't even
want/need a definition in xe_regs.h (see below).

>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  
>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f92faad4b96d..51022a560086 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -121,12 +121,28 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i;
> +
> +	if (!(xe->info.platform == XE_LUNARLAKE))
> +		return;

This works for now, although it may cause issues down the road if we
wind up with refresh/derivative platforms that don't need this
workaround.  I think at some point soon we're going to need to separate
out SoC logic into its own dedicated sub-driver (similar to what's
happening with display), and bake a dedicated workaround framework into
that SoC sub-driver to handle cases like this.  Although we'll also need
to work with our internal hardware people to improve how workarounds
like this get documented so that it's more obvious up front which ones
are tied to the graphics/media/display IP, and which ones are tied to
the SoC revisions that the IP is integrated into.

> +
> +	/* 4 dummy writes */
> +	for (i = 0; i < 4; i++)
> +		xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);

This might be a spot where it would actually make sense to do some
direct writel()'s rather than using xe_mmio_write32.  That would bypass
the trace_xe_reg_rw(); I'm making the assumption that most people doing
MMIO tracing wouldn't be interested in having these constant dummy
writes cluttering up the trace output (even though the known offset does
make them somewhat easier to filter out).  If we do that, we could move
the offset #define down to this file rather than defining a true XE_REG()
in the register header.


Matt

> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u8 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -139,6 +155,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u16 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -160,6 +179,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u32 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>  		val = xe_gt_sriov_vf_read32(gt, reg);
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
