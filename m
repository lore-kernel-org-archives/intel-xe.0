Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3537C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 18:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ED610E4B6;
	Tue, 14 Nov 2023 18:49:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A4910E4B7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699987764; x=1731523764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zimRGc0VXX5aC1KfKJI62z2wlcfaH9tiKm7+w4caDTo=;
 b=b0axO2kUoO0k125gw3IUIYHV5PLb2OvmSLSAfV2w7G0aKf/beV+C0Se6
 AztlbSL+rOMomoavVgRBaWusB+EafKClzgoIQzqakvVKHl1fKu4LbEf9I
 D8qzScBKzOg9HVVS8h710XZqg5IpRNtsnKR3YRvmO5mb2Uc81GZPcs/v9
 xiZHyd436VbgJKJxCZYaVD7llTIEafvuIgXw6UTU6DwPKoyD5ADDTUKhk
 nCVbmRNlKKwukJImWAnoZsF6sFR+J8avVSw8lxiBL+ntRbt2R0IbLTrtJ
 I1NHGT+THYUC2yP7M+mSUXKAOSk+bcouKV4CzTtJDb6k2h1I1WK/ii2BO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="387889250"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="387889250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 10:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768336776"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="768336776"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 10:49:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 10:49:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 10:49:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 10:49:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 10:49:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WivJVK90QCaQLkRvW46qcJyISEi8TTCdujF13rOLKEQ12my1w8vfDJx77SogthsrolpkktzDGBl8B5Hf83yYRZjXJmFjjxC7+/8OoH843NKw3QnvhAjwel+ImuxgW/lQ0G0wpXF9lzP8b6vwX+1tQzmy2Y2/JhQZMw37EgacuyqmQQvdcdgLtzlw2X7+xsOGBYEz9gmV6jByAbRgUwQnNShcPrgOv+wFLyUPL3ws6hpviX9MSjCqNmhSb3MpyVrO9hyuO0lTYvZ7l6iE6Uh5KhRqZytlGwb0hWOYL4LWcXz8+i0YVX4i/Itn9hRwpeLG6dYj4k9B3FZqD5eMFEpdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx2lvmCse1DVBYFjnyZO4wM2YFY+suq2FDBypXzZcbA=;
 b=cLcmUePY9/1IkVAV/sh1/XQX5UJsN9yGT3x1KH496qGW28KlpvE5+Ih2n65zC3aojaodD8GVmmcbiBE28TuDd/tPn+Yblg2M0Xfb3V7T7c39BYy0iPQLlk2d4m5Fp+eAB9xM5CyehRbcruXW3oY+fq7lWxwRRemMpBwJECc2LWEvjbsFv6d299kbW1pNs3NR2A381mBx8MtgpRSnATOSHBb1mfZT8aPhyzD0Z3CDJoryzg6kVJ6TZfR3tzI30vokn6DhrPtdKlHpNkdDHqa9WDrC8g9C2AsyCBk3t4tUJ+hLhzsB4I860Ht33H3RdihyhF4AuCGAIHoTNVT04O+8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 18:49:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 18:49:20 +0000
Date: Tue, 14 Nov 2023 13:49:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZVPBLTzyLXot37F7@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
 <20231114130443.2503708-10-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130443.2503708-10-jouni.hogander@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 814bdf79-9bdd-401c-8a36-08dbe5426963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbudFqMLrwCnDnnP907mRh94EXlO9E5lAc55zxyg8Muwmdi//v7zgav22OSFOMRfYDiDTT0XXeB5GHcIZnqUbLYmpgGF1IUYA9zZLncP49NE97b1aaYLHEZg3GR0wsmcXD1KQvsoDZ/rBjTZEB3rx1dUYi+DwuI9d8ilGOqSCIQZXjN/uX7BkmauLdUm7eFKry/9SDVcP8FolDbqQmiyxGchZ7QMOqM+ByCq8LNprT6MsvoHk4khIfe/PWiCP799SI8oI862rRkKCPNfQyUpN0bxL15UPHcJlrOaCVQZ1Lb2R3RAr/f8V6h70iVpPqa3xUlHWFfpDR+QpS1NLOlbNO7QIwnZ2hrk+o6ToQsdC7B6OO4JKtm0SMwspkd3O75hZ/fFYZdhbEc2eFENgdFImp6PE0tQ6LTL75A13SIjAb18eYx01DhGF7XEdQ20Oz2GOs9qleCxEEzyFngoLQ6gdbfyeluwJTsrMn3asuDJl7tK+drCBU0UadlpMrbzy4T1d15IwKzp3xRYG3dvGNC1ZUGoWfvnK7SKlTivXRGqUqjMhP+MfNYoMT20sJX96iOe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(86362001)(82960400001)(83380400001)(38100700002)(6512007)(26005)(478600001)(2616005)(6666004)(6486002)(6506007)(8676002)(6636002)(37006003)(6862004)(4326008)(8936002)(66946007)(316002)(66556008)(66476007)(5660300002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RVK50+Uq7nx+hivQ8AsHuJ3pX+yk0pXLs45RhEWoVpuGANQhfzLxExEsM5?=
 =?iso-8859-1?Q?ACxPUyNqFrVnv0dlXgCqiIeESL3IINqDJfMeT9669x3pEyymtYlO1qpy4P?=
 =?iso-8859-1?Q?6YyhNn3erFGcPOba8dEIAQWDZMMXR17ILT+xfBFeJlENFszqJOJxTAeOzb?=
 =?iso-8859-1?Q?JjVvzqEBmR4KvqNru6bJGC/LGWA3r7O0M0mhsb/yNNbygAvrOXI+ykrWVI?=
 =?iso-8859-1?Q?M+tRBR7Qt9JkRK5k+S0HZoPK1IuW68NZkMd/f7bEOafGmHHteJQzKDulQX?=
 =?iso-8859-1?Q?ZbNjIjD15sPkXtCdT3RBfXPvztjUzk6OsIEVBdrrlPrcuz7J0COBClmHuV?=
 =?iso-8859-1?Q?blB7Bdk/soZ9Z5nMJthfIdm0fftM/yYbvrXNBSUrV0JlyEj2pzpJ1d0URH?=
 =?iso-8859-1?Q?fd0Y8Py8Yfqg6BoslcXkzadUWy+HWMlm7HiyaJQazFl0BUq6yNxqAPcnYo?=
 =?iso-8859-1?Q?4GPTDU3ZtYLIKVHfAGseQyDcldzAtCFNG3WBW7B70ByAwdh4SzMy5W7hqw?=
 =?iso-8859-1?Q?dr/IMoFcRmrot9q+SBBJochRF6TPb7IpMAWKlvkWDCy2hWRR0VilAa0wkm?=
 =?iso-8859-1?Q?UNskl/hA7TXhBgOPev/w38dunGz2N0z7sJ20wCttjF9yEj3fY9lHrz6xdX?=
 =?iso-8859-1?Q?RH4C/tYUX4iQBJWdF6HXdS9kyTIooFv7j5LGoAPB7ihIe6/leYqUl1sBP2?=
 =?iso-8859-1?Q?MyoH2cDh/Uxan89VIpjuzSqmBmzlxhOJQ+8GgwCWfCY4A2CA9WFGMnNuGm?=
 =?iso-8859-1?Q?vDSQ60nC821lIqNQosdoWidZCARSDHfIZEFc8TpdAGbb0dg5jUdZeQwmaA?=
 =?iso-8859-1?Q?qYSxgahe0gBBSgyiN2aMmQl4hlMRciJeS/15axOZX2wsmHpsriW/s/JJIR?=
 =?iso-8859-1?Q?cxilwGF7bBp/V2DOEvVC3ADhrATD9z2mPsbYQ7RjLQSyr8chtOwEpKNwfz?=
 =?iso-8859-1?Q?VrqrFwcezKzvlCuXPE7O/Yo15nSTbz6o2iUc1XUZKWaK8Ps6cY6zaohqKC?=
 =?iso-8859-1?Q?JzREA0zcB9ojXSFhwbrGpvxHWzmDBu3BSutG4DKd1YaabdguiahA1LvcNX?=
 =?iso-8859-1?Q?/VA4+y2V3VtJYqfL+jx60D6FrhUffZBziuFMcXDjjfnSqwwzkSKcgwHwl+?=
 =?iso-8859-1?Q?/xXJj0nZGsQNit/KbkHf3ORmzCJubsSTxvHIB3RnFQ5lzbAqeSQUaSlr3x?=
 =?iso-8859-1?Q?iBwXRkUUciZ0pqY6DW+NxKPr5B/OzL600Myzlxjeu/tJijgvH4VBj0O1sJ?=
 =?iso-8859-1?Q?b3CDl8uCqn9aiush+OqgRYmYs9wC0rnzI0G8LI8iEijnefARyobQmHnpRb?=
 =?iso-8859-1?Q?0VY78HtkBexBxiYAjpizvdPuuseHQJkiL00xgS7wxCSBAWdotXAJPWmm6U?=
 =?iso-8859-1?Q?dzYOx0wQx0LkPCH9bi3RUoWk0olQ18Im8n0L0xPC1Y1EzwT9M8B9i934kv?=
 =?iso-8859-1?Q?C65UsB3jj3f28C0VomjOtzqZTB4iTMSZrIbFCyquSvHaNs3xXR47wThzVA?=
 =?iso-8859-1?Q?+Slf0EA7DWzyHtxAZg4Z3EKl76WlKGac0lkJ+Bb4lNhf0hlVuAEUCvK/+m?=
 =?iso-8859-1?Q?06JyfHP4eGrKbOYOzSPYGxaUqvGHLtucKsN1Corhn/MiYbfXEwrAJVBCe5?=
 =?iso-8859-1?Q?4aqu6JzTRLX/I6Wedj/6O8tVXbzM6Ot64c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 814bdf79-9bdd-401c-8a36-08dbe5426963
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 18:49:20.3786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuN+ywC1v0EUOMXNFblbjI/cpdu12LO+dpyJAVmZUtjeUzup/k2p4UOkq0Bfnkw1XjUayf1tWIhOBu6mlscz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 9/9] drm/i915/display: use
 intel_bo_to_drm_bo in intel_fbdev
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

On Tue, Nov 14, 2023 at 03:04:43PM +0200, Jouni Högander wrote:
> We are preparing for Xe driver. I915 and Xe object implementation are
> differing. Do not use  i915_gem_object->base directly. Instead use
> intel_bo_to_drm_bo.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

also here, let's go directly to drm-intel-next (of course, resending
both patches (i915-only) to intel-gfx mailing list)
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 252f254345a2..05f614f992d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -332,12 +332,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
>  			continue;
>  		}
>  
> -		if (obj->base.size > max_size) {
> +		if (intel_bo_to_drm_bo(obj)->size > max_size) {
>  			drm_dbg_kms(&i915->drm,
>  				    "found possible fb from [PLANE:%d:%s]\n",
>  				    plane->base.base.id, plane->base.name);
>  			fb = to_intel_framebuffer(plane_state->uapi.fb);
> -			max_size = obj->base.size;
> +			max_size = intel_bo_to_drm_bo(obj)->size;
>  		}
>  	}
>  
> -- 
> 2.34.1
> 
