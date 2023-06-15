Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA11EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 11:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02110E4CE;
	Thu, 15 Jun 2023 11:48:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692510E4CE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686829682; x=1718365682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rrUJS1v/xQj1Zk9ilfG8kks5AN9FCjeByy0GaL/fyE8=;
 b=TmCBgqekNHyJ4cGT/LsTKXIaLhJFP/3qZKqUltW5XsnVFs6C1itswt5I
 lEZ9HmgS8tbdi+gMGkanjgz7B9oWO9gyW7CXK+oDaQQEm+iT078JJaWHo
 2LyBsIbuP1rVFooodU22tMi3kxYWpdRCmgthGMqbSryiQAmLj2DKCJcdn
 f18Pn3YjahNhbuw204PBNKsWPTrVo5XymcGG6waKUWUpOe9RUyk7NVLow
 5yfKED+LG8GZWpHMNwoNlmgS2MPm2PxRTyS7d3hquUWLOgCUhkISorBYW
 5Gp3hETfe3z3e8qHU53sB2JFFB9DZ8pnSv49RxWc0tM+xkJoeQsNQmjVS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="357767792"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="357767792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 04:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712427081"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="712427081"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 04:48:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 04:48:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 04:48:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 04:48:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 04:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICSHILHyMX7dnZEkOHpSemFzMwZPN1UBpQS7EDmu7pUfKN7vnQhwQpqNkzRtlvwZco5DkgMrFaKNIsr07lMbA3R0uzhUaj2nymsJb/vhkuBsx95Eh6jQF+mSn9gPFP3eFouuRAmfXo6iP9BLlk4pA9WvuXQKHp6dpELW77boTQcyd3ghT78grwAEBruo2aEELKXeMbllYxSr1ijacjrVhAHMFUN07tiKTIWdKA/BS2CA7Wp4aTlzwOmPR3ZA/dRmWsXxHBjtAGlzYzmtkTlpfUMKH7UduZ/q0bCWzavcpMHhexjvAMQcCmfL2i9EaLnYmFf35c2FcZQ9nCXl7JWAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wR5qWxmfL0Qss/dUG1JeC0esPe4z0rH6561S7GqbJKw=;
 b=YP8yiE4ll4v0JxPe5Va98PFPzr32+oqe7+xbiabjhIitm+mOocSkgQTUAw6hSyZLVKMLIJtCppoUX1rs80nSB7yB/wPbkp77udR3LGzreHtRIcJyedDORbe7vx/UHh2Me6LRfD1909ts+1YGs2PSzVO7Rtp3Wkb478DYohPfChsGM/2MGSHg96mAL/NbTvrMEkli9W6KY1IhRW/M+S99l/8Z80fRvBe7pZneoqed1MIXcjxxgdv2ehQoM7/m+nbpT1SHgY3e3WmS8cBnVdBP5Mo+qTJH3dcqE/FJrXKECaOI+0aUab+E43tnoGpemQuRNDHEu/cU8EUhQeIC5jr9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 11:47:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6500.026; Thu, 15 Jun 2023
 11:47:57 +0000
Message-ID: <99fac071-4926-10d5-ef97-3a4164071671@intel.com>
Date: Thu, 15 Jun 2023 17:17:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
 <20230607110328.3739706-6-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230607110328.3739706-6-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: f89078e6-6478-4f4f-63c5-08db6d965ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpmQqKMZQyHY4ozQzis9GrwRZrTL8tG6NwOXQQSDLjybvg0oe5N4c0sQU35RRPmXPfoY0PlGG12MQBuWusT+xkm1ei8PmJlfap4+wQsWElcsTXJHdWQ9o5EvR8jCSreaRN53Ej7/f/2VqkpsLKh9ePp//SMNHYvgNCtLJV137yeKNpTOW7O/FGdOpqWbaTPHv760/Qak7WrGT69RDRnOEgL5+blX4SupRNTQwwFM3qggZuCCxHfNkhoOCQ+rUmy7gC36Ge9KdGUwoFGkBFybUcBtMEXbG5JzatqaKJAF4rBT5oTeAlUtR8tVEqRtvS6o9JClU7C9RPrZeKjrTYZZPIyol6x2UeSvhJKb39Vb9bkZa13KOoOigvB9oezu5nBrzWyhomhjSn3ZAKAn/WxfCxHtleU7VPhbRFpCO3Ge7ezLSfbvLg854+/f9+Xni6HwGOCYJkwvOHbnTjFDjaior0Q8SKbRAejpqGeP2thqWV+eyEiF4MEUQluzFldHD/8yhqdgx/5qNtUECCjlEHzuribpcUsDX+BD3uba0u91JwR7XvAjW+AZ7F2cqutBUzoFn5U8JmXMd5cwMGZYpw+FlsuBPGI+y6zY7PD0gq68PwDC5tod7SgJ8WACK7jTsorxeEjV8JKV1k1R9nVG3J7wPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(5660300002)(82960400001)(38100700002)(2616005)(53546011)(6506007)(83380400001)(186003)(2906002)(6512007)(26005)(107886003)(478600001)(6666004)(66556008)(66946007)(66476007)(316002)(8936002)(6486002)(8676002)(41300700001)(86362001)(31696002)(36756003)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZuanJQMklZekRERmEwbGZVVloxcnZGZmhrdG5qdFh3K3J3c2NkKysyRG1O?=
 =?utf-8?B?R0Z4VDVsYWxWbGlUMjdXd1BiWFl0U2RQZEdFSndPMWkxVmR2RFRkVklwc2V5?=
 =?utf-8?B?WlVBdUxVUW5EQ1pMYXRyak5TNXVEcWZxZng1c0N6WGFldjk2N3duMUlxYWlu?=
 =?utf-8?B?TWZpVFRRUnl3YytVbGgwdXlkRCtseXhRekQ1RnIwNVJHNURianhZelJWMmJM?=
 =?utf-8?B?ajFoMlNzY2s5OGwwbHUyUHh1WDY3RWlqaDU3OEJ2V25Wb1BTN05rV3VzcWl0?=
 =?utf-8?B?MmFUcHZqOTdDcnB1d0ZQU2xlbnZQTzdteEkzWlFDSGlsWE5pMWhIK3RQeUdU?=
 =?utf-8?B?bXlaZDk0MFRoZTZTVGhkaGF1K2NMa1BtcGZaZG5qc0VWWXk3TFBkcFVReGRy?=
 =?utf-8?B?ZG4yNVJCa2E0Q0lvMXVGTHJUcVhtVEhPMEtEbm0xdjRvUUI2RjZaQUtlek12?=
 =?utf-8?B?VFRYdERlNnBBdnZsOG8xd01iVXdSOVZwZzdJQ1cyWnZ2RkxQRTdDemxTRTBh?=
 =?utf-8?B?TmlzeUtWZGdNaWZZb2hpdXU3VEcrTW5vejQzczltTEhudSs3Tnk1NC9aYkVq?=
 =?utf-8?B?WExaZzVoRUM2a000ZHRwZitqMzlkQlhXOW5udFRvRkcyQnliSWIrRWs0alN6?=
 =?utf-8?B?R2p6UlJTSXZNZFVST3FBMTJsTEdtbDh4V2ZmUWp4MkEwbXNBZUJBT2ZIVXdt?=
 =?utf-8?B?UHlDK1FRQ0g1NWxXS25CK0JYSEFTS29hRnVZeDkrTytDR215WjRhQ1Y4WHR6?=
 =?utf-8?B?OGRjK0lWcWJJU0FabjFqcXhKR2NCUlhMQmdQeGlXcHBUZ3J4bDJYZzFWMzhl?=
 =?utf-8?B?TVRHWHptdndHWGlWVTFiWmJZM0QraHloRkxkWFV0bGpOWUtxUW1tN1JZc2Jl?=
 =?utf-8?B?amZ3OFZQWk8rRkY5RXRhc0Jrb01SVm9uVWpaSkx5OU5lVU94Ti9XRXhqYVVj?=
 =?utf-8?B?dkl1M2Ztek5Sek9BZ2ZDM3B0S3JZWG9xK0xBU2lTeTU2M0Y0M2xHMkR5OGE2?=
 =?utf-8?B?VW4rMDIwUklNeG5qaFAvSUozQUg5R0tEY1FKMmxwSFJ6cHl1dDdrVlUyMDlE?=
 =?utf-8?B?WlNGMW9QUkQ0SjNBZHdzVnZaaW43bitJOVE2Y1RYMytScVlUUjcrM1I2R04v?=
 =?utf-8?B?V2F2VlpDYVdvYnJTeTRRblZCb281Tk9VeWRrODVWeGF3Zmp3ZWNjbSsxT3hw?=
 =?utf-8?B?VExWNlFGaEYxdU1LRWxHYzk3dFNEUy9meVNJV0NOYTVoY0JnUDZEVVpPM1c0?=
 =?utf-8?B?UC9nN0Jzc2JTMXQydWpNdDJuZXFGNHMrT3ZRUTFPTS9MMEZGM3doa3YwdGJX?=
 =?utf-8?B?Tkt4RW1Qemt0di84TldwekxCVFIzME45akhxa2JHR1hOdHdSeFZSNC9yakdB?=
 =?utf-8?B?ODVCd2p3bTJrbHJqVXZLTlJHdXpnekxaMnUxRDNrYVVCN2pSTmFhdUJNaFd5?=
 =?utf-8?B?dUNxQW9lcFdibituY0t3LzVTMUVMUUhLOWttM093OE9rQ0R3TFAyWmNqa0V0?=
 =?utf-8?B?Vnp4am9NWGNpZERyTWw0dG53Nm5vTWN2dVY0c3phUnFuNTRrMFVHM3J6OVE1?=
 =?utf-8?B?YUxmWGJSZEJGWlV6bE01RHI2TmVlTFNWNm1QN1g1a3c1dHBUbWJja0dNRkha?=
 =?utf-8?B?LzhSUFM0T3JMWGFHeEQ5ZnBoL3VraG50TkJuMkQ2WlJGUW51YkhmVEs3enV0?=
 =?utf-8?B?ZDFIL0gwVFliR0t4RDd4c0tkK3RtdWtTQW9wbUd1N3lQMEYyZlJLdmhSNDZT?=
 =?utf-8?B?L3diOE56YTBUbVBYRXhqVi9HSDh0Qmw3RS9pc3M5NzdzQlduWHYrWXNNRE5R?=
 =?utf-8?B?bFFUMUp2QXdaMFVseUdOZDUxWkhTTzJGQVA3dG16NDlBN0thc0Jjbm1rK3pF?=
 =?utf-8?B?a2pqUjJnMk8xUUNLUEJuRDMvQmwydm1CVjJBQWd0bTV5TDBqVFZSOEF6Qk8v?=
 =?utf-8?B?Mjh5Tnc0YmowVk82cGJvTEZQOE95dEh6RDB6WGdSWEtoRlNDWEExZ3FqdFhk?=
 =?utf-8?B?NkVjOWg0OWlMdndXTDdCYlF6MFBuY003SlFMSU9tVTJMMFJSQTZUMUJiV3lw?=
 =?utf-8?B?RnVzOG9RcktZMm0rTVhJZDRWK3hORmVVdmhOcVhuY0k4aVczRXlwNlVuclhK?=
 =?utf-8?B?NXVua1d5RnB1SnZublh3cExYK0tQc2cwYm1Rb2lFZzlhT3JQOU15S3pmRHRu?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f89078e6-6478-4f4f-63c5-08db6d965ce9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 11:47:57.5224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UF8m1KssPhU/5VHWSYHKjiI/RbE1CXdXYE76gEEFPmRVYPXCkSfzhd0t8VxhR2ExTCHLmsG2+otEqGyqGi2wiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/5] drm/xe/pm: Init pcode and restore
 vram on power lost
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-06-2023 16:33, Anshuman Gupta wrote:
> Don't init pcode and restore VRAM objects in vain.
> We can rely on primary GT GUC_STATUS to detect whether
> card has really lost power even when d3cold is allowed by xe.
> Adding d3cold.lost_power flag to avoid pcode init and vram
> restoration.
> Also cleaning up the TODO code comment.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_guc.c          | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h          |  1 +
>   drivers/gpu/drm/xe/xe_pci.c          |  2 --
>   drivers/gpu/drm/xe/xe_pm.c           | 15 ++++++++++++---
>   5 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bdd093d30788..34bf2ea3b3f9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -382,6 +382,9 @@ struct xe_device {
>   		/** @allowed: Indicates if d3cold is a valid device state */
>   		bool allowed;
>   
> +		/** @power_lost Indicates if card has really lost power. */
> +		bool power_lost;
> +
>   		/**
>   		 * @vram_threshold is the permissible threshold(in megabytes)
>   		 * for vram save/restore. d3cold will be disallowed,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e51d8fb4a354..706b3bc0452e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -848,3 +848,20 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   	xe_guc_ct_print(&guc->ct, p, false);
>   	xe_guc_submit_print(guc, p);
>   }
> +
> +/* Srtictly to called from RPM resume handler */
> +bool xe_guc_has_lost_power(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 status;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return false;
> +
> +	status = xe_mmio_read32(gt, GUC_STATUS);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
Should error check be added here as well?
Regards,
Badal
> +
> +	return  status & GS_MIA_IN_RESET;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..3e628bbbe69e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   int xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> +bool xe_guc_has_lost_power(struct xe_guc *guc);
>   
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6cf66ce25039..b5cd3b69c98e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -829,8 +829,6 @@ static int xe_pci_runtime_idle(struct device *dev)
>   		 * but maybe include some other conditions. So, before
>   		 * we can re-enable the D3cold, we need to:
>   		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. at resume, detect if we really lost power and avoid memory
> -		 *    restoration if we were only up to d3cold
>   		 */
>   		xe->d3cold.allowed = false;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9872a800b0b3..e37ec8aca609 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -16,6 +16,7 @@
>   #include "xe_display.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> +#include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
>   
> @@ -192,11 +193,19 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   int xe_pm_runtime_resume(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt, *gt0;
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold.allowed) {
> +	/*
> +	 * It can be possible that xe has allowed d3cold but other pcie devices
> +	 * in gfx card soc would have blocked d3cold, therefore card has not
> +	 * really lost power. Detecting primary Gt power is sufficient.
> +	 */
> +	gt0 = xe_device_get_gt(xe, 0);
> +	xe->d3cold.power_lost = xe_guc_has_lost_power(&gt0->uc.guc);
> +
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>   		for_each_gt(gt, xe, id) {
>   			err = xe_pcode_init(gt);
>   			if (err)
> @@ -217,7 +226,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
>   			return err;
