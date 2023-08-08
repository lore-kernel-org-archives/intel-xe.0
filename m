Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1E3C04A6A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 20:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB18D10E0F8;
	Tue,  8 Aug 2023 20:51:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A410E0F9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691527865; x=1723063865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GUO8YxdHFKHB/hpyBS2+5EoaovmZPV1auWLLPGOnNkU=;
 b=EkzipopQltnpJO121eIKgmgJ7RicrKk5oRFB1YlB7U72s3jv29LFhxt7
 J9XaEMwa90AZ2zQR2IiAxRHLSHVpiqFCERQfrn09pmtGzQC+m0oU9Tx+T
 jsjet+OvxQyWheZwzPsyWKlLoSsPRk8iTw075YA0D4utvC7tN6jlfBpj/
 g6iw3psevyPSAr1FhsyVJKy7P+Go0YfygeEy40QRstey3MQtHgL7JyJBU
 NKqpW03eZ45YrxxNXXd2OqDPoS6c+7WQ35uoMQ/51/oat6oy11Iiy+ffz
 cFbV9E8IyZuNXOyEuBg+VAns2I9TPbK/vOLP03569drwOT2oC+/3Hm2sM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361069974"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="361069974"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 13:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845650670"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="845650670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 13:51:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 13:51:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 13:51:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 13:51:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 13:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRrajygX6CuTbv1HC0szP2aXkCh9D67ow7b7OKHn+d5I468PIETCDYYl88Q98PbzEAaS/+hKxBr6IwXcsDesQunkK+9I0DSQRs2uXnb/f5dnzCjd7GmddJI6STkYvBechx9yNZpGe9odHai91W1JKSS09XigYsnwWIFmQnaf4HGSrWWstgItD8r/FbsT+wfUVU4bno4fVksVopecbBQl/1dmhzPVF9aGX9SnUA8N7RnJ59d1gvRzDyY3DOCyplutUXhBstSKxsEs0i2ehjFjF3RYXBZAgx43uztuy78lp+SuRiUWwCp1NPVSYlXu5rcoOCDUbgFpwEIXGN8csMOvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJFvl0O58ZanYnMmvWUgk+wUYXUEAHCLQlrIQ3KX8DQ=;
 b=B2iQb38fDNKSkrBBS2CA0+H9FHO9aJRxOM1FhfvwrSnmNfd8eiNaidmmR0HBhTro2TSjdHTinfruu90ME6XnsNcflue3P53jaxsb/kTUMopF2VOxcHaSnXdMripYRd6Y/ONcs23lLHsmAdRAcu0QSDUblo01ok+t/imq6rWV5LqyzOz49jWrdwKFPJ+Env0gzfG28xgjr67TTxv1qGYOSOFcIsXF5kj3sRzfJQ+XbEiuHqiLddwu5bjgbjpqHPzEczjKg8N9F7YkRXG0ch2cJzyC/R5muZve/KV1gQAwRg2edUC/gsBWJIZ/iOfy3//oJywqY1865bFyPmr6sB5URA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5503.namprd11.prod.outlook.com (2603:10b6:5:39f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 20:51:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 20:51:01 +0000
Date: Tue, 8 Aug 2023 16:50:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZNKqsWeph2qPpnjw@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
 <20230808114535.1600595-9-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808114535.1600595-9-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d95046-230c-4460-2ff4-08db98512cb9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+LUMeU6yJjjer/D/pRo01vrmsgGdVPzPX9/gffi8qizQXzswUNs5TxbOmi0kdYphKAQCnxNQ4Ba+3agaLQbSEKWXF5OtB2rW1EzSbP1YHI9qFfjdIFexilh5XrQtjwat5PriSnsPdXJ7n5N58Z8yTMcWFo6yk2HAGIbljDNMPv/UuCpAfmvcFVie57Lik4s4JSm8T0Cc0GhLPjUR2VEvvzDq59Xt1RYMlHtjwEfq5rKTR3ypeQL+WTcO3A+LNM6HiO1qPeWjrVp/pErpk4GBMZxiaLV9Bz6b+BSoMJoKOt+PibawqOL08EJz72Y+6zXJEmTJr2wwLj9CHAvJbqHxmc7QpJTx0SEBF/wnHG8XUPdMlXvxHIwxKiHNcmPJNTyVycx06p0deTnXOAysAlbdH5upiZHIOmYpIvKXc7AsIZ0uh/SmhQtrhR9wAfJUmeSOZju6SiKfzWdbzM6uk03J3AfOxsLWSfRY95mp6K1Ih1JARfeYFb930Zo2kWec8JTp2O8qkVynDCfo2WigNFqxFud+XdHvgbvhNpKdjrKxtXofUeloz75ZksIr/0bOrKu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(1800799003)(186006)(86362001)(26005)(83380400001)(6506007)(2616005)(38100700002)(2906002)(4744005)(82960400001)(478600001)(6512007)(6486002)(6666004)(36756003)(37006003)(6636002)(5660300002)(66476007)(44832011)(66556008)(66946007)(8676002)(8936002)(6862004)(41300700001)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qaY/NYYhOrg3FskMW6AyPcgyNKVbgDAXouKjdd3Kq5+7G0zGW2OeDUvSSzK9?=
 =?us-ascii?Q?UmV5idoWG207KDjvdsY7LqicxmkW1Bwx8ytzW3tUTErbKFhtCYBiCsH4It1I?=
 =?us-ascii?Q?QY0NPT6dmlYOnSDgAXfTjXCzRGS3jMYAVf+PMguh6tbbYfHz9a1WPa8u8Jd3?=
 =?us-ascii?Q?0DJqu2RV+Qzmh3LvL9kh8l2TdwntIesXp3klW+qoDTIC/2as6fkLbrvT0Ca6?=
 =?us-ascii?Q?w9JOLVCCTSTRP5k+0A7WOPHcWUchmoj5vj3wEu86inmm4/mOSixW6J4useBV?=
 =?us-ascii?Q?wmyH/oU5adoh/tygeO+Qsa4VwZcsGShwOOzIFHseQp415dh0NP2+0CWUU2pT?=
 =?us-ascii?Q?psD+H+m+VtCfx5DPyYkyVQNi6RzTbfBFhFgEI/abT6U/fD14l0oFSGDZjkBA?=
 =?us-ascii?Q?f0s7PN4aK4o/HHoGv4lUJ8dwDXD5bpFW9S8xRdlA8kIjw++Yghe4grBG6/OK?=
 =?us-ascii?Q?ISvXtUktVmq9feKhCNyMJ9/tjaXSEcIKVExCNrS5yF89mPivebUfgH9tSP5F?=
 =?us-ascii?Q?iUEhRk/D/g41ffyio8ziZKo9QX7Mxko8M05OreMXdTWmztJUaF1IciqpbYMT?=
 =?us-ascii?Q?b4tXJJbGvQdNX1Jocsbvmnac7OeUJ1G0Im5X81ySXELzr3xWXVvafcKZDkuc?=
 =?us-ascii?Q?GfnAlSF1bktdoqe4EzTyOZwtbhByQZ/tqCNcuP/O1m0C2ItZs8ukcciX2mpj?=
 =?us-ascii?Q?107zeRrZ8p/rH3WigjcStrEgiUtKRmF9xI0hRPg99jByG0X1KuLbg6nwBxZ+?=
 =?us-ascii?Q?m7HJkUeZno2Pvdt8WIRGa0XQRbBtT+AE8dJEB4/AOvRlPtSit918ydbfhggN?=
 =?us-ascii?Q?ESIncU6ACmrGltdyBL2+8KUjSiV4CgsYVAJN+zPHbmAGrzVOixfalnNq+ERG?=
 =?us-ascii?Q?cLf4IpnbnKzNGGqnffrV2mTof53HhjFUPM7wSo7iJZgRWry3DDKITnxH/TVI?=
 =?us-ascii?Q?P8SBEWlvL1z7wJPSu3q1xS56FOU8Xmr0cKc/IqlmduQwPZ/dx2Am+4y3R0hA?=
 =?us-ascii?Q?RWQM8o5k0rGblhq7C8VrXQUmRdMfnVjL7xT6aiUMd7l7WoTYG289qmMqC0CX?=
 =?us-ascii?Q?WG1UABW5MLcUuhAm9k3gmTwvkoawkBXHilpz8mwZIRu3tKvV24BiP+VigLx6?=
 =?us-ascii?Q?vzv9YFK48ylGGjJ+GCpdHGzYLMJkaxKl97I/YiQqcFW+29XJjuWyF0tAh2hn?=
 =?us-ascii?Q?RqDa/NOSa1EJ9aXYGaj7h7YqLVTJHrm+fyBoLsfU2cUJyjj4vmRAEftHKRL8?=
 =?us-ascii?Q?kCm5lPqkSiH1IJM39eP9SbedO/LQBgcNWK2Hct3xCwNuLHFz6ccguwFFRfqe?=
 =?us-ascii?Q?eMM1RHVCZAAFG5SSrLskaureTdBvbH3E/9biz5A4KqKJ3XC7c4Cjf1nlgpaJ?=
 =?us-ascii?Q?chOXLL1AX5XOAmtVrzl46ojryHsvBs4GkubJ85QjTHsFh+Q/Ir/hSKF2a1kh?=
 =?us-ascii?Q?eg+niLTiTTsuf49pb+MJtQOULfZCz/DCy2QL6kPn82QVrPqvD6GZGjo/VBws?=
 =?us-ascii?Q?CiVfSSEWm0hNOSxdoUykwiP2n/TTrGGixTJgAkmswCgnNJyOJrVuD0vaIygb?=
 =?us-ascii?Q?PheIDEkZ7mkYr3rLCQ/PH13Y9gnqmB95++EQc1Vby3+Pjz64i4MAR4B8rLn+?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d95046-230c-4460-2ff4-08db98512cb9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 20:51:01.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2urXzhCJ3gOg8ARtKrtj2qwXzSg/Wuivnh3zcUGUn773mpxdz1VnEuqwvRUpQP4PYkwwLf3ax+YXY1WUUD+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5503
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 9/9] fixup! drm/i915/display: Remaining
 changes to make xe compile
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

On Tue, Aug 08, 2023 at 02:45:35PM +0300, Jani Nikula wrote:
> Unnecessary change, drop it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> index 001de8fe4e64..a9f44abfc9fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -30,7 +30,7 @@
>   *
>   * Please do NOT include anywhere else.
>   */
> -#if !defined(_INTEL_BIOS_PRIVATE) && !defined(HDRTEST)
> +#ifndef _INTEL_BIOS_PRIVATE

I believe this is the only one that I cannot verify, but if
the compiler is not complaining I'm happy with it.

For the entire series:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  #error "intel_vbt_defs.h is private to intel_bios.c"
>  #endif
>  
> -- 
> 2.39.2
> 
