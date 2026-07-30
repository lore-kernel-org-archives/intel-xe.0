Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91BCC55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 17:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DAA10EFF4;
	Thu, 30 Jul 2026 17:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9U4mIKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE7110EFF4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785431004; x=1816967004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W0tfTWnGx2hAjqOCA5h2VlxuBSA2fhuraEs+00Mb/XQ=;
 b=i9U4mIKspBmW+TqTV3yEmKIDjNzw+eugN7GnZQcKlIcKjGq+Xp/r+KG+
 7XvhfXgUitMNbRU+7wMufVIxa2kRLubwJrvNbhuwAFDuCKP7dCSwBFKG7
 cm18HEQI3BCxcvgYuzX8k3yeIJ9Ec7xEU1rRf/MweyPjnb29AXKqzV0Ik
 RnsX/l1W5JDhsS+aeTD/ERZkNYINDl9WuQStlsWTNTK32QBFpvzObtWOa
 AcuXSu36dgApZ1pnBC2z+SmR9gHBqbiUIQuD/MbKI4R6rkOJWNjT6/pvE
 5P4R2nhE6ZdKf95Ozfj9j9n00YCxGI1BQjMFB8YHKFfG4oHlo0Qev1GOJ w==;
X-CSE-ConnectionGUID: KAauvNeRTQ+U2O3qhYohBw==
X-CSE-MsgGUID: a5//qHXuQIqxgr4HL+iGiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103464204"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103464204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 10:03:23 -0700
X-CSE-ConnectionGUID: HnGDxerCSP6lUTu3u3hXZA==
X-CSE-MsgGUID: rihUWzF8T+WCDaHT08dZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="283692870"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 10:03:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 10:03:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 10:03:22 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 10:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JB5Ejakqr2HfbBC4dOACNDmeJh2HVJutvMt5pWnRJ/DE2VHEuNrIR/xSqr6iDFaE7qNevgQd/aRhwO8LRKZFP0wJjXmXSy/9eJWtdufEYN7E/8sApBZAmdz+c8b3noK9ayH44ZKzjg/mUEBUOphRDvoo3B1k3pwYpkwcPBLmaDCZ9fQuQSVDVbrlBFBV7RjUN23g3/zAUKU89qm5uTgb8tyTyee0kz30/yl5k3VllshIUGVOXNHFqgnwi0Z2A6T+Zl9zRTA7P/coT0FTQnEdVfFX4UusoQ+XQ+rdMZYZhq264GQLAlsSwMsMo/NphhIqr5w4M5zT3Eh30LSurfbRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUHyni3v5ccHZ9XkKK6LjbftvbON44XL+u0byHoa/6o=;
 b=DkhhTWXmvAvd5Tcg4tG14e3IcFwBsloqLQ0k5CyJoIzJxTRKggZiFG3MxGKJGqtZ2YOOFdjpD7M2YdskeViNcGZFOHFi8bUtj5twluWf6NCKSPvvJTZbuYDg9lPVhwhBK++sxUMjSYg1dkGJ6Mv+qmsQZdSCb5GjYhEtOzO9Ui/4Wmn3PA/ews8mfs+OlOEOEnwpAA1sJterhpot9PkqQaj36yV7NaKImbzxgAenA4mstelEmKSxOu4ipaNztPIl03Jz4dkUh9oQARefRKznJ4Hi1jQHN/L3QAeMyKDiSSgHoDcb2EHnW0zt4qDtc7Ecxbo1F3jxJNZx0Ht6p/gvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB7448.namprd11.prod.outlook.com (2603:10b6:510:26c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 17:03:18 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 17:03:18 +0000
Date: Thu, 30 Jul 2026 13:03:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v1] drm/xe/ras: Fix boot-time ras error processing
Message-ID: <amuD0iTh2Jv1qeYi@intel.com>
References: <20260730110635.925537-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260730110635.925537-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a85f59-9604-4cbe-f5aa-08deee5c73b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: brMZ13vyNLIWb/Apmug7n34Sj2YE0lfteK8uj81/A+jjO6SNLlEcSCoGgsuaQ6/dYpzPUJU2q1HH2zVLlEr8LC0RTBt603Zndk7QWvNOX1enKUrijkRXcHYIK5hqvVXDsA1y5TTVXyHWgsBkBeSgyMUpcbG2h4V9GPXAzbKBxjbJdL9VVNPgAsE9F8iMz01frnZmu3BY+hXVqYGzNrVC4FbZtm2dCugwnzQTEAw0n0rEuYBch2TjPrl0S6dGzqTjEWRwkx+UTdKOrZdAiIBv6SrSiKXh2Yk+9LLZd496bYHnTSbTIhTVPxQr3tZjaWVRku1KBNYMXcHJ/n2uavW2IVCilpXR2ZAyqPhAoVXszzS+m/3PS2n4HKjb36wCSQ2GaNRYwa5pbYeA89nZWeLThkNxPB3hSmguC/J2kpSoHkFhWZrgI77zj3Aj06tDd59JYluKFwy1TNHi4ov+A9/Yu+6JxrUNrcfOtnMjTkOu8VukVUzQXiQbhK3joUa7xuGfYye82qWwMLFk9QO27RV6zrXASvahM1N523YZ6SNSKADaRU9ATKkQotTzp9Jq4Y5AvI8TXTu2G+kVMq05aKLI5X6UpDcXddTCU+giFhdSAxEYUa/CEnzm1gwsGFn1Ku1nPn6z5R+iNK6G4PLD/+E5LNfucxcuE59J754gjepzvTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSbl3QYXjPEVCiwDj0f6P7b7hb/Q57xZo32tRb+7ZXkKxYMX37ijh59pzhEi?=
 =?us-ascii?Q?Wns0PWFUM96G+E1e0+c51wOmjetAdi8B1Jps0vLZJ6L9PIhjHOZaPcargeO4?=
 =?us-ascii?Q?aVLzp8G2iIPo/Co3TLCuopT+pqFKDhUa962JqkccD3vfzwnnKbTot+KBNhLn?=
 =?us-ascii?Q?XWwkc4grzom6iUDto7qEayl838J7t3vZuyu/HjoV2NjL1EklCe7QD91YpCtr?=
 =?us-ascii?Q?9u33/kpL64RtpWXoZ6kbn6Jltn2TnEaL6zUAsnvZBxSnLYNQP8lDj3X9pV74?=
 =?us-ascii?Q?deNYnYDK+5PS4jr6kQSRQeed0sYYtTec2hSypgHwEH91YEwN18Yxxx93KC7V?=
 =?us-ascii?Q?24ZKWXCF1euBbgWBXlITqy26L9iymsuuQ4kO7SnT8gt4xpfFbhYghojgg13D?=
 =?us-ascii?Q?rfY+BwHLBw7CQbYrSkHWNQY+DOhprchj2c2Q5u1jlafImpz2Puv0IVaxygso?=
 =?us-ascii?Q?4hkgSu9SNSl4K7cLojph6wv+9KULXkanvPn4+LwSzLwN52VKmZbs48wdHQ9x?=
 =?us-ascii?Q?Zi/tq7he6nWJrSwarEmW4nIos7/1B2IHZSEJhgrZJlyRxcGHKCfAm8vf1t69?=
 =?us-ascii?Q?43OEeSCN2UDxDffzVADzXIPZbWF/cKIM6pos9hP5BYrBoRKa0Bu+tZmvtjaD?=
 =?us-ascii?Q?Gmpe70SbSZOZvfsk6j1YN/yiaa0hvXxUVVQSrGkMCzpbPdl0tpOubbrsATic?=
 =?us-ascii?Q?W8zLlZ/qrrh2RNBUbfEgzBj7j2/Nie9oagn+APkaGNUlzuxvIoKnH6ye2jmX?=
 =?us-ascii?Q?o6JjFcw1cciVvsGipJfYcjCS+8w+pk2xqmI6piKE2Ugz8EERWzJLAqQJKRq3?=
 =?us-ascii?Q?/gNvZralFXIH6R3d5IUqfySR7rokWmC8zQHHKEo+ZjD//suoSlQoVKSjsXcw?=
 =?us-ascii?Q?odjvgnJNZJxL5XbY+tByb4kTceVazGxCL01I3wxQZLo8PiLJhsin2VF8SAd5?=
 =?us-ascii?Q?IlqyS+yjTRhisqKU6IyskaozcJiGssL2Hi8QbWfOc9RgiiehF0beW5d2L6oP?=
 =?us-ascii?Q?LkF/56dg7sPeT/ZNOHf9qv0ONjldQC68j8MoJm5N6r+tvVcmMMqUxDwBZ4DU?=
 =?us-ascii?Q?keTGBQCFogCL+9UyW3iSWSYzjaosiyZPKdDgbbXS5+W1G/c5Ot0woiBMqZdK?=
 =?us-ascii?Q?qUyYZz8HHiJPrcH2G5zkv2ThkHPlH1wy2+5rRoA/9PU6qnWauOOS4Gq93CQg?=
 =?us-ascii?Q?k9wPgXlUPmwiROjpNbKgxneHk4M+TkXHWh3kIa2ZKCUOrfEj6eQcDMeCYaR7?=
 =?us-ascii?Q?2/2JZ9QKOWwP2wRLTx/pDYq4pD7CCAKJHsQqKEj87RwSRK1dWBbq9pvRfaw7?=
 =?us-ascii?Q?uYHyGCj8INiEJitdAjVfufmONc39V+zD0UHNbKiWGfvxcf1fMnsLmomFOwyJ?=
 =?us-ascii?Q?n+adff1iEwQNKXDR9j7CL6klUyKeXYLH6ghCsiwji1XocNFq5uWsiaKk0Yy1?=
 =?us-ascii?Q?cDDwrYoqEhTj6F3ZAa3G8o+F2eQF5i6wsN8YlYzCsjxnRWrInb7prw7omZXR?=
 =?us-ascii?Q?yMGZU77mAlCfrWa7RDhDI/0jwH+NtT4BJzhq2GsB8wuwt4QVksMIzqgS4quh?=
 =?us-ascii?Q?EGShlFnmcO0gl8Pbf9QZjRsMhZEpTCosY9XIRfA/2ZA6xSbo6uPH7nqCNV2y?=
 =?us-ascii?Q?OqWzIhxpEC3/HXD8k8CtQ17PkCeBTAQsBwcDrQYbGpqzjn4GE18dYGs+nLs3?=
 =?us-ascii?Q?cm7fq43Kpbdh/wUUPgtMdosxK7hHk9R1jc4PSe9adPFfdERd08CqwvtAE/zF?=
 =?us-ascii?Q?RoN2BqEXUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MZt3843F8qbIkYkbTpaagZd8p7iAFqfKEB7oQOVrlM9BClv52NDyBTHSYzQpILqNgcKZAXJBppVvlWcaehWhu3qZM362WrACeDDfSGsVgfG0oNlGop4J0Ib+a36fmrsZMF1HkPgkmHAxc6tl1llY0vc/We7v5lvVFuBPa27gE1zHMHnoQCwiGHL1Ol1Q7iDAW9SLw2Ezbw6/QZFBp6XrqoRtjbBOlTLb/PKcZkj2wkHKsQWye/M1Ot1Q8PNB9GV5Utu9kZyjZ3ZluU/Uu8wMBOWPuCP6ZZkzXowr4kr2mqmhQ5AnYxTH2xQ3qQgNV3Uj9O4Mj6ceUN2NDgWpUCsLbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a85f59-9604-4cbe-f5aa-08deee5c73b9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 17:03:18.5108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlgzgulg80trVPgFH0VrjGVyqZebPO58CQ7cnMn8KE02/cRoml1ylnOB2P8AYZ/njik7uHjm2wTUuqPOd5nn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7448
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

On Thu, Jul 30, 2026 at 04:36:34PM +0530, Raag Jadav wrote:
> Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot
> time errors. But this can potentially result in declaring the device as
> wedged quite early in the driver load sequence, which is problematic due to
> the lack of registered drm device or required wedged cleanup hooks at this
> point.
> 
> Call xe_ras_process_errors() only after the prerequisites are available.
> 
> Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Might be good to check Sashiko's find on pre-existing issue.
But this patch looks correct:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 ++++++
>  drivers/gpu/drm/xe/xe_ras.c    | 6 ------
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 03e6177a1d4c..47e1638d2ab3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	/*
> +	 * Process and log any errors detected by hardware. Possible results can
> +	 * include declaring the device as wedged, which must be done only after
> +	 * xe_device_wedged_fini() is registered.
> +	 */
> +	xe_ras_process_errors(xe);
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 28123f08e513..db8bd19ad28b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>  
> -	/*
> -	 * During probe, process and log any errors detected by firmware while the driver was not
> -	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
> -	 * causing the driver to enter survivability mode.
> -	 */
> -	xe_ras_process_errors(xe);
>  	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> -- 
> 2.43.0
> 
