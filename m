Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8085C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEC010E141;
	Fri, 14 Aug 2026 18:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXTtFTNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFB010E141
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733277; x=1818269277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2L77VWhOlfi02Mz86q/Ah16y9UlNxtuSpiz43maUlW4=;
 b=iXTtFTNvmjKv0KG7dVR0vvqwYpuqeKQGLM+jSJ27RtI3vnEOjCFEgbFa
 xfpAY6E0VqWVEZs/lOlyDlbLR2cf7So3+jnd1O7C343lc0L6CovSJRxet
 J53Rs78qbanJG1v5AZAxPdTLpwtcCVjYaRIO+qeirTWbtSyanPIltFPi8
 OE2bX/98fitu0lKmf6D5tJDi2JlR1Z8dMW5HTLZtfINvBseeKjn9HCUnG
 BJDpL+Ca9NzN7ThUHIECLFJTOiecslLuTtrhPjC9C0NZYL7rMw6e/XnSu
 YNWihK5rASWtTo7z2EmOVSIjDia5GnU6UjBTAojrqFDwq7FeYyID7Mwff A==;
X-CSE-ConnectionGUID: sFprHKvhQdqGM2U/YpQrRw==
X-CSE-MsgGUID: bXAHUZipSXK6rOQuxGKkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87445843"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87445843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:47:55 -0700
X-CSE-ConnectionGUID: zToe3bRAR1qrIMToFSr8ZA==
X-CSE-MsgGUID: GH0TqlPrQcaXAADpTXBEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261654183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:47:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:47:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:47:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtHPBtfWosUKhqLWu65lESdSOrWnZN+CzzbIxommklsVT1sX1KidhRok+isfn2t7imo/Ri+rN6XHm2fuOUI5oZnw6ezgW/b3BKeiqhS+SLj6uvbejt2e61KrS013rI7W2tBfqJbiK3GjtELYxQyXamqqQJvvBgsCiRd2xAzGPPiOVOCP9rrsFXQT0lJV9HUMPdYEJzAibiRBQ+wqiLxyM2rFovcy1Dv6HC+IvYuLGez3fnFaW7Rvidz92O8LeUMcGe1SjOFAU2gMf6XdMICf8TNDQEO8XdnoirYPVzKK0c8h2Gp+/BdKhDVUtncziNlwAYW0ZUsogQCWqEzfXoz+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJksR7anWy/3YkfiFchpB5Fi01vVQgGgyq6uoqI2aS4=;
 b=CUiRVDPp0cPnJn/60zx4qt9q0ngyBGul01lqE3QpUud8XLOrwxXU691sUx2cWY1dpTZRsxidTOUkgFxW7P7SKfFpa3FMntBNy1TW0WNKhvkQWs2SReykRaXY2LvNxQ/yL2hFnwhkBlnWnmeAEcGw/6MuWTb3g75k66php+wnc/zghaBTTFE5ZRYC0v9CZCix5t3ToojRpIOTKZCx5Qb0fFnWL7lEshZ8QEnZsLLiOUq3KRB4T21BzKvNzfUZaShlg1KnscBrxlT1ZqcRdKEgTgvnEL7LDtLjL0oTd13kRGoDF3P2q+EuZVZf6Xge6RWpNpoBFkGIIRwy9hQ0GEAHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 18:47:51 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:47:51 +0000
Date: Fri, 14 Aug 2026 14:47:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 23/33] drm/xe/survivability: Report 'Boot Mode
 enabled' status using SIGID
Message-ID: <an9i1GzR8XorZTik@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-24-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-24-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a91270f-8ae5-4616-0fc9-08defa348b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|4143699003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: BoXuNKO8Ng0LI9zQ7zdOJLJ3P5dSI21bh6TnNUTW3QZVGHoz1oe0EB+HVOF529m1YkS95Rz6zMp4CcNHaBdz/Zaf8YUzaqx2p8yFjS9cZqpS04sBEMuLW1p3fDr6LYUGGR+ezL1KwTh3nsLGom1WTN/fkXoanKZhYep71k7ylOXT3Q2UPh0FRioNy9EGeTLo1iGh1KO3EPmFEw6j9DjgUP3XNJ3OOVfNAPfgoMUUYAkk8UH9oweB8qTzs/RRVAfDft7zvxlEU6g1FaMETTxUIUwHGBR/PGS8+yxKx6RbUTHvlqegfKPcUXE8keOEL2Wj+BOzPXA+aME2NBIQUrl6c2zN4/JmKomTMKQap/08HRosQcdn/kTnpSvXMfK3arqVkcH9B/8IArO3nIVMDZr7W7x/CsGPdJ6YY7clCyhjnxZdlX5GJVdCzq3PKD5lx7VZkX2W+Y5ziCHeT4QicR0K2plvnNZDKBdIRJuOMUyWt3M0dygMSnrg2xMKaVqfbB+itVsBbS2G88dFHWD8ypZz6B9cWsQAwJASW9xtMW4vWv6miA7jJ01iFEMpjq7ys2M29U2caily96zZ9Y07GjKplT4flQEx1OiGlLGtv1fGd4rAPQxjqLhyjJF4J1WuBcWAAARuP8GGhH2Uzmn5kmlixlK2S2Yxk6U2XGu8ByLqelM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z2S7NkngglWqoWBdKwzsmRoZVsJY4oXy6RER2okbn+1CYLz/k50lZXO2wo/0?=
 =?us-ascii?Q?dF8/+LNz5hvT1NOY6pB+2BPWniyNyfoyV6BNBkMV3r+tnnDAUWokNHDmfEak?=
 =?us-ascii?Q?mG1LZssc9E6UVR6bWn3hsNzmRHgXpQF0RaVgDwYiATJUuUqe3Dw5wCdEc4p3?=
 =?us-ascii?Q?+aOzDe814VlkQwJXhL/LfzFq9SC1vWv/Jm5CYpjcmRuQpxdR5dhIqRc1F0PG?=
 =?us-ascii?Q?Ta8nh/Gu2UsPIdUpwVZF+/nPHrlPmpN/qI1F/uTUSK7veXuOhQN0qVlRaKCs?=
 =?us-ascii?Q?pVD9PdvxlGc3Da+hFH7G6sniDTslMTQ70hF7QQw+In2aoM6NAhXK9a+ZT6Zl?=
 =?us-ascii?Q?nSLRPpg8wlJ1PAS30S/WxfSY76XYBqcetYhSOieJW7wA9Ah4zFZJolKLdY+g?=
 =?us-ascii?Q?VbZrrFLp1BgyFOwoomRjfSVd5t/GlR3fxkHdZSfsJscXNdqKhrB4BV0FedNJ?=
 =?us-ascii?Q?URS9C7MRhY1v4uOuyAHXavOjaHA23agA3s+r68jOemPVePGiuTIGpKxeAQ9J?=
 =?us-ascii?Q?D04hp1N3DtvYFH+q3veK/mK4ZlocfVGVg2KLKQPkfD1WZavkkoLsd7A1lq5c?=
 =?us-ascii?Q?JUdj2dw1a5S+mmKcVzaRBT7efgmH6U6TL48KvCwb68Kl60GhM9CtkMuTaZEb?=
 =?us-ascii?Q?ttH3ZPDFv1DuD50phjZhPgGvMPMAeNdZZVPILaKUUxH/N+pU2ZzslPI9FLvm?=
 =?us-ascii?Q?rLPGiyStrzIfS10Xf30gNcRdnIfGNr+kJG7MiqEIpgpc7P/6DFbPwwJgyovK?=
 =?us-ascii?Q?0QEnQTxoff3w/t018jGH0Bqe5YYX2/Gde9aFTj6nPQ87TpFhfYjJNK0eD/CL?=
 =?us-ascii?Q?SvA8BSdd3VWiXr5E0L526woNgfpp5KFtkfVGVn+dSo9G1QB5P8kqQ1d3bd0C?=
 =?us-ascii?Q?FqhtkppV3BE6cqdXnGeD5MzHRabl6NW+mRz7npWjMSi76KnKhd6vXMKBCnEE?=
 =?us-ascii?Q?1Z5NwCh69ZKLr60z4fudllmzhVJWyQdWw9uEcGq7JFNFATTFlPVZ+koGDqxi?=
 =?us-ascii?Q?DnrQspQYU+gUB/NrMCSUuxBfHfLoysJMcRdAUporc0/U9wIIOD4SfrIrTVWN?=
 =?us-ascii?Q?5gy6eHVyBssR0fSUayecyGveEZN2F0Gs4tkfPMMnB/D5t3AeBYjRbRXjMfIg?=
 =?us-ascii?Q?JNm1j+rYegRTayPn42cFrRUHaVOyIUtHWqqHBVUmJd8LTNGARGsxlCRpTo8u?=
 =?us-ascii?Q?WDmrYR8XIY1+0q1xzprAlWAYv2xyuZw5T31EXNohUUC5t5ocD5YM6YgudtH6?=
 =?us-ascii?Q?NO50h2t6KHvqtsxytVPnU3pwQLnBpMN48ca+TDjfxaerNKaiwjqIis3S2ZGc?=
 =?us-ascii?Q?1D0CTVx4nIICTwgnoEo4OuB6KnGIL73kcVGo86zVufemuDc/+STryN4J8gtj?=
 =?us-ascii?Q?nEASqaQdOjuL0lZjY9s62mRPZ7OdNpvCQ604wey3Y/M+WUmzwLwhozDvIuuH?=
 =?us-ascii?Q?uoNVP1ocKLlD1zb5PuL8S+W2adyh1TOPJWuTdT3Aj79N45hll+ZFVRt2BpRa?=
 =?us-ascii?Q?DGNEtWQitVyAc5a8vTEtSYz7pf+EEcTQThizalTkS85HRiTtVq5fl4XRs92a?=
 =?us-ascii?Q?M5hpLUKq4fpYahi8Sgv5BDu5Xagi8LSJ441hW02lEaYATavvtbvIm8o2ONPG?=
 =?us-ascii?Q?uRRU3IaBpNYPUZZdBosmCoClurG7JerDrhm4KsfosfjROWjGsCdYwZ3ApyLN?=
 =?us-ascii?Q?rspfMZHv7vrduGSu7IbPNCPAIi8DolX/ztBxjzZGY3dDLkLu9rw5SHpe7xYo?=
 =?us-ascii?Q?5TUitw0fhQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Gh7+Fw32+yndfDU3pYvP84IawrWD8VK+cTpr6Gus7bv0z/cF04bBudETThXs2rs1O1zXAgSohfnREQaJ0Pg1LPNTo8IYvmUiw7tvkl1NLELRwUksXqznkh42Ay7CiYYLzCf11Q0G+kdqj+ZQSlGxfX2BACVMqBhv1RjHZpsW261T4HwFgUatWCLa+alLeTF/PeX3VMjbJZLS1M3DaRjCZVfUQtpuEchBxAylIb7cKrSqUqc7wiyefSYoR29WVRjW3/G4QnW2kYe0XBfZFBs1uz3xZjp3fn8YkspsRvynFsfG0Yf+bKQTMJ4qGZdbeX7IBBGm5H4BJNDteRz/PW3Awg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a91270f-8ae5-4616-0fc9-08defa348b48
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:47:51.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWQQupA/toAX4YDfJ9Svv5qnpAPpZzYB8rTODXXu1EtUgvqXRpbkMoOyql7M8dbh3c74eTQ3txKSn3KUtkcjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

On Fri, Aug 14, 2026 at 07:17:49PM +0200, Michal Wajdeczko wrote:
> Report 'Boot Mode' status or failure using various xe_log() helpers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: don't dump boot_status (Riana)
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index e14553295171..77923bdfb19b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -338,14 +338,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  
>  static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct device *dev = &pdev->dev;
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	int ret = 0;
> +	int ret;
>  
>  	ret = create_survivability_sysfs(pdev);
>  	if (ret)
> -		return ret;
> +		goto failed;
>  
>  	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>  	survivability->mode = true;
> @@ -357,19 +356,22 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	if (survivability->fdo_mode) {
>  		ret = xe_nvm_init(xe);
>  		if (ret)
> -			goto err;
> +			goto failed;
>  	}
>  
>  	ret = xe_i2c_probe(xe);
>  	if (ret)
> -		goto err;
> +		goto failed;
>  
> -	dev_err(dev, "In Survivability Mode\n");
> +	if (check_boot_failure(xe))
> +		xe_log_err_fatal(pdev, SURVIVABILITY, 0, "Boot Mode enabled!\n");
> +	else
> +		xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>  
>  	return 0;
>  
> -err:
> -	dev_err(dev, "Failed to enable Survivability Mode\n");
> +failed:
> +	xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>  	survivability->mode = false;
>  	return ret;

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
> -- 
> 2.47.1
> 
