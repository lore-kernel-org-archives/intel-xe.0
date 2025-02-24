Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7B5C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314DE10E069;
	Mon, 24 Feb 2025 22:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAXhJKBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8CE10E069
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 22:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740436759; x=1771972759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JX5Rj59lw+tOpBvlnFZ60fxRPlD3DjmDUDPbilDnxHw=;
 b=kAXhJKBqQXyQ656DOuS5VgDQXpko8ox0tDVYtk5OqMIXdAxgznYKX5O9
 i0bcYJ3UaVhVKNfFv/CRoxY+drO07PULcIWBiZFgVEy+tQKRu/cOCSBsn
 hqOx4SqNj0jcUNvImdWdE6P6vYneJnCBALFkU4bzB6yEXYP3Dt1cau4SO
 +sxtJzWwZ5/28rcSoxO3Pwcnc6/qdVsSgpssFidnUlI8t0vO9PAl1e87v
 IplxWMlvD6t2TcpEXCgHAqqt8r0aUh6J/fZ3xIU3AOccbM7DylDLW7ksq
 2/DDkWT+5G7O5kVtSx8nqo2ZALqBMZWFrhi2cHypaQKWZno3P+yzkV7IH g==;
X-CSE-ConnectionGUID: L0ZNXS3PTyGo+fQ+OeDW/g==
X-CSE-MsgGUID: JTlQTiT+TRKiQEBfbUfpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40921472"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="40921472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:39:15 -0800
X-CSE-ConnectionGUID: wniwwh+4TyuIH5Squ0xwkQ==
X-CSE-MsgGUID: fl92bMCAS5qJXJvTbwDvAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121446515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:39:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 14:39:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 14:39:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:39:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pL9FGuZpZpioZjDQrkha/Ch9K/5mTuHTBexgxxlYXiKirN3i109v6iGfWGA7AU5HM1N6tQCoEETtlZcrFzawEkIlr1G2tIfP2lHX868m6ClxNOvAyi2cGaqdEIA3z8zlDJwK1H6mhq91KWalja4WRYdr1YF1Ap1nwlHlmQI4HZXKRqXY5AraAxmlvUSMrMxqrL6tq/cNRZ+YZms/IX2T/EUfbdKDVGknaJ7tpJzDGWGeFFyIQZ89uQXQxmwx3gINyLKEKMPlcQ9YsdCReLXNd9eP3g0nJLiYDNVhXZceTjCrll8TI2PfCUf/yP2d7geW6AYpQKW95TsnLuX2KkQZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsGv8LhBpIb7lFbdyBwc33H+FBC4rsWZbu2yt8TJ2iw=;
 b=TcCle/stHZ/AiutIBQwc0HOP695iyQnWVb/iRL2LocWQQ+KKVx5YnNeZ0g1v8Zmm/W7O6Gsu6cvEu8EAb/mcfRrtSSenfz2LtbyvCpg6EVEIbuxSZh+TthRnmZObEaYHn6jmftYzMshwV7XGuyi+yd/A+DDGDKTY3C4TDHswzSAeQ8oU/iDRPtbc3sJmn/tPjgA6pd0TKJSkltPARVZy29gKIqgc0E00QZAky9BGn/449CG7qniL1jE6v1wuhyNJU/mt4TxUyI4ApaTPdDVaa9NKuPKpzBBp1sU3D8cyignYPCO7+gJi8ugcycZemvWz7FIU13zLBsu2/lbbSkEFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 22:39:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:39:09 +0000
Date: Mon, 24 Feb 2025 14:39:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe/sriov: Prepare IS_SRIOV_PF to accept const
 pointer
Message-ID: <20250224223906.GB4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224150700.1778-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5d180d-6211-4eb3-3eeb-08dd55240d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LQ2OtvaV8G9J7HkJxQIB4iW9R2MGlke4nOfW2PMp+u4kH6qp96f98hQO8cMH?=
 =?us-ascii?Q?n9koU6nBikxukfz7NLO6eF0FO50UO25d551CtMBNyTowtY3qJU+L5YsDCzPw?=
 =?us-ascii?Q?WL0Y2kEZSoPHGKLku2ZJfh/46oReWE/+t2BEmZo/eWuUn6tk5tP+O3bXSeyy?=
 =?us-ascii?Q?I83SmJbuEy46mJgZs4suziLS/237Icb+NdeD8EJql7I8zRc9E5vqcGcIT5sa?=
 =?us-ascii?Q?j1CPltyPvzkkK3s+NV8gmDkfNw8pp0bMR3r8E9dQ3arXCzWN+Ig1krgbZObf?=
 =?us-ascii?Q?CwKkyz+X9VS38oFxgpY7gmwZs785WoWcEwbI+jMfaGuq6NuX+Y9v61Wr7Sjz?=
 =?us-ascii?Q?BCJ/63oLMyKxUlCyOMeMyMkZX2Z4cPzE3XeatI/KpABPMsgSPjyEDl1AxRGb?=
 =?us-ascii?Q?LskXZsz1OeMJfWb5wVAgVfjyKjkIT9Hgs8BWTR6AORMnHmt230+1baR8VPCP?=
 =?us-ascii?Q?5vg4FBmwbFIMOK3/33Ndv7e0Q5LM4gWm3PxCtEAG2dIykIX05/PYq+bdveT+?=
 =?us-ascii?Q?xA7jtkRIGBCQ6EkEmTrZgB7xMH9/3HuRXPbxK3wivedzL9V74jvQJhs50o16?=
 =?us-ascii?Q?kbqzDJmLYb30EGCQO4+9phYlX26CkWhn5FZPddPBjL7lR6VopEg9e7g0op2w?=
 =?us-ascii?Q?eCa188KPM3Sd0NUxkFl+UDqNOfw8wrubJ6E17AzbcPhPPZytheO+bdpRXgFy?=
 =?us-ascii?Q?H2aIkJe8e6TU5GrvLF//vpoCcwZNj6FUtz7+SP1CQKDG5JOa/RilSrK/qFlh?=
 =?us-ascii?Q?pavxwoaejn2g1mde9vuiB7ukRGlmX5TBVWSeaZy7Jvqqnox7cjF8KjfA02jt?=
 =?us-ascii?Q?Erw9uX70vc4bCSM58/oUaw7Lr9UaQ/+lClgbnqa4VR6t6S6bvNDDxencUva9?=
 =?us-ascii?Q?dsaPRe9824FJKTbnpd6iOSVr1ekbS0Pb1Wv+mw5R5vSjruJddzu2bIJeaijF?=
 =?us-ascii?Q?UOqlrrA+/qQRtPKFDSMDbzySogVHSzlcRIykj0YIftKtuASVgFqEqLwEGAhR?=
 =?us-ascii?Q?zy9P76GMQlzRYMhN8DJqE0Iwd1Z5BosWlFKVixY0kaawVKCmZWMkWQwULcjA?=
 =?us-ascii?Q?IdLmoDPzjomLzScDlrHqMZOoMO0S8/5Iown3vp4/C0QdIL+xTR/nsKsODWZk?=
 =?us-ascii?Q?xL2gaYQ2Urkn3vsl0aSlI52Uws1Zmm34EO5gfwWUEQtwWAvkntjT1odf4kNr?=
 =?us-ascii?Q?MXwI/urBhR7CDcR6EA/nr4IiaoJsEKFB+pI+PI2MI7mAy8r/LLPqlYC8rNTG?=
 =?us-ascii?Q?f6mN2kbpjLqCsDETe8uDkoZp/KO+r+nlSM1OGZgtcz8+DibAW7IMElEDKyKn?=
 =?us-ascii?Q?crkf99OmgM1HuBdHFBhia0g7P6mS4Ru3xSEYmrbm4ihtpWQtoUQhU0FddYTx?=
 =?us-ascii?Q?Vw98yYQT2fXDlZPVMsZAKEh5i2hr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6PvzCs66jHSMKyCcBtxmd08yCNVHFAyfbyZ6mN85JBCTAnqGLc41DmamjKmK?=
 =?us-ascii?Q?V30fiYYeSHvKgXfwJTGhr6/lwDIFza4Ovggpj3kEf+OoQ54sUyIeRJM/QqA+?=
 =?us-ascii?Q?A+MmqM+xR00s/Wy8LhpeGb6oHM+8IM4LVxNjh0r6pYnf+OgkIuonQSlBvsdc?=
 =?us-ascii?Q?ayd5irIMjb92VZ7WG0XiBbFfTVnKTmBgYVrmievlhw3E1hSKo3hnpAbLKTEr?=
 =?us-ascii?Q?T7Rst7uUUqN/jRWIQCeZc2ugaVpy20Ydbuz5gmOqP6zXJDa0ucmBBDl/1jyr?=
 =?us-ascii?Q?nlnZ2eYWZWi9cBkEnncOFs5KPJ07rAeHOsvnM3XT6mHX0nZtKXgv8f46OjgY?=
 =?us-ascii?Q?LKkGIY1Jcx1LsvXT9TrGiZRg4mseSIM1Qb7CmRQ7++sL7aJ006KvmSfctFAX?=
 =?us-ascii?Q?ZnMDu0IUQ7NtRbxHARWgh6phNZrByA7nsAlCz0EqE7mVRuCE1m2oVm5ob/Br?=
 =?us-ascii?Q?Kw9sAiLLTz7g3hgbWIVm81e6oCeVNRBaQfTqoDyfj49vW88E6cJXPEP0Mk+q?=
 =?us-ascii?Q?/AH7mP+a8C1i8HB5UsaXvFDTMxCIJVY+W/1rZoVS1RDpdCKwrzn+3U1N1X4m?=
 =?us-ascii?Q?zaJepkm8qJJbrPAv6BGIs3477OPQdh6sMwt/m4mxxvMQWCrwREVeJDbVYbHK?=
 =?us-ascii?Q?S+t4UOTJ9UMoE30njV2DlalcvQyNwtbQ/+GgJBEC0OkQc4uRF6dtVpFCdNQF?=
 =?us-ascii?Q?JM3L1oHp42zBydym0zpLzcS20Py6Gv77ERPp1nDss++KcxfZ6crOLAnzruO5?=
 =?us-ascii?Q?03KsMyGPeDNCbiriuduDAt1HPGkqmeYLr2DxoO2WTrhg5GI4/0XsNaa8RYiO?=
 =?us-ascii?Q?SFHxLKF3i3VUedeMQynBiIz/tB7OmZmxICwsIS7ZhWbAmsaAogb/Xqp0CgGQ?=
 =?us-ascii?Q?omif/fLTsLO9X1ocCkZycl7ieu1yFOlHOehwkMxZGLzREFwN9lPWfpRfbpqm?=
 =?us-ascii?Q?JzJNng2fHRDggNed0KK1NUbSSrZtQFYrJeKB2ztRi7GsNnp2fDs+Xujoqsto?=
 =?us-ascii?Q?TUOthUFjHRaMpEigkU0EsODH/4YvRihLGvhlDDHM3WR4aYVsvYhQEVYQOWCo?=
 =?us-ascii?Q?la5haM5NGt4z/B/fXu2soQsrSQTTrMzYDa/ZUo9QFEngYbEL4iHkawdSOQ3v?=
 =?us-ascii?Q?2O/J9H/ywAh31IZ9juUIuMImc2s6Lq+OdVJPFamXOKqWI9phhnhnRs8PdVMq?=
 =?us-ascii?Q?xOmxFrL0Rtfbh9pb7GOJcsyp8pf9t57JCS/HpItgKw2v6ixzmZs9E1IUV1YI?=
 =?us-ascii?Q?wWVV8QyfeAMH8aErSdvDEz5Klt2EJu6GlarFb69X9tR51Oq2ZgK2CgFjelPB?=
 =?us-ascii?Q?b1RoxVRwLcy0jKjMUnjRknBrEulS9YgfXLsRbNqPPJU+sB74VZ/2zHSnbDdO?=
 =?us-ascii?Q?zWSb3BlwEN+hQL6kXoK0O7zFUoU6ZkZcpyImzUjMTEyOKtJtcPly+DXeeqJe?=
 =?us-ascii?Q?cFcvi6q3BwGqKzF8ph9ff4NoJuROVG9YZroKU+SRrlwpHqAem+zZuQTsHdnL?=
 =?us-ascii?Q?b7kU9KJe2/v9R0wVqT/IMrNj2cL0BnCWqdLnv8FqsCAoBnTHju4Hwx8DRKVx?=
 =?us-ascii?Q?4pXXbDMznQiV3BHvfJDBxnDKkD5oCnNzGjnK0Km7ja+DeiwH7H2xm+pLUhJV?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5d180d-6211-4eb3-3eeb-08dd55240d55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:39:08.9941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVnxqSnL4zaqdDuQBHNhhn70lo9r1YwTV5UVQng2PRN79ATB/L/ziNcni9wC8J0BzwzCYaxNpszW8xZdwDWighhIxs6ztq3yJC3z8iKhl38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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

On Mon, Feb 24, 2025 at 04:06:57PM +0100, Michal Wajdeczko wrote:
> For builds without CONFIG_PCI_IOV we have an optimized variant
> of the IS_SRIOV_PF(xe) macro that always evaluates to false,
> but we still try to validate corectness of the xe argument.
> Unfortunately typecheck() alone doesn't work well for cases
> where xe could be a const pointer. Try use _Generic() instead.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

I wonder if it would be any more intuitive to just make a static inline
function to get the type-checking?  E.g.,

  static inline bool IS_SRIOV_PF(struct xe_device *xe) { return false; }

But if _Generic works, that's fine too.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..cba6a608bf27 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -38,7 +38,7 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  #ifdef CONFIG_PCI_IOV
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>  #else
> -#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
> +#define IS_SRIOV_PF(xe) _Generic((xe), const struct xe_device * : false, struct xe_device * : false)
>  #endif
>  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
