Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A59CA0EDC
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 03:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B22C10E335;
	Mon, 18 Aug 2025 03:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNwNHpSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C410E335
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 03:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755486270; x=1787022270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EQzVE8d0SsqQcRjd1k9Jl9FgIYOpKfpN7SIiKAT3Uo0=;
 b=dNwNHpSC0HCVWJtQH8Bc1/bN3xq2b3ae8TA5633G8IS8wMNGAsGQtJBU
 VECgz+Xicpf/eFVZb2QBnaB5xn0oJgY2A6t3C6wXMIe5zkzZUaIZt2XJP
 okrGQUMz3U9ehT9PFmV1S9t+eJh/n2RcGHmdOO5/PqXmK97scSL5MuT23
 qTnv+SAD3GoMrDlsFat5EzKUbYuCLdLT3MkZPhdNH9Wz6nrMdh8Zir8+0
 DlnLOPR+bnj6KeyESskmqBe83+6aCfaueWiH/9QJi+Et18IwLXHPSdjLn
 MoQiIUflb0KvVqY8/zKgQBEg2yx1S4DYu9yMkvzJ78sMUy4AvNBLk/PIK w==;
X-CSE-ConnectionGUID: gKVB59i3QSCcA5mpJpPFgw==
X-CSE-MsgGUID: Ihz4MFm0RuyWz26dGYQ9Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75270189"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75270189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 20:04:21 -0700
X-CSE-ConnectionGUID: 2ZyAwNAzTwm+BITKKAa8Zg==
X-CSE-MsgGUID: A1zzB38TQ9+wYF2O+Rp2TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167437688"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 20:04:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 20:04:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 20:04:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 20:04:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO441VgDBBS2WSHwOwl5Pjv2yo6Jf670Ymh+OI3NZ302o39PzVoe8iVcZdgqGanrgSML0XPVWZZtbdzBC1TGE0iIEvhQVBEvZIf5jeIpymeVrGq/cn+3pbiR0QGw5QKjYH93dkXsCtMFFqZtWH6PHg7NnVi1TtK6ggRlLcZnOTB7RBAUNaK2OKy4UYy5yYO5gglhP2+gkbYhxHiwON0PfpfhnZI3+zCsejRvQ5btWJ+aLBRWLbEjpyKrtBQB5KNtnK6xTVv9qS9kriLkZmLRv6VhnvOm3hGNsoGpPOYm4krHWmv58qq+QU8aYt4Eb8OK+P7nkd6AwHe+2i9TZ96RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpfQl3UN/f1Hr9MesNt+jLWV+KxTmXsns9etq6zn2Q0=;
 b=XYzkIDo9QZ0IkQ15FIEcgVl4vGDzpy96bHvwnUqChSOWtmKW4f8FI4Dvp7ladIjBnB/9oRMUIFDGkkz4RMbiNyxv7AEN1uM5UslV/wG3NIhxbzG/Ms0lBThyyh0lmthJRDShYTf0mn3b9i+KDaAyfELcaVg6QhLxJMK8DwbzkVdnY9d7PSH4ZN2f/xSNA0wEJ8I0h/O44hnEB6pmCPZRgYwrVxchF30MlMW/7BId3QMV/t5BIDZVGbWQo9BlDyDlxSQ14StdGjrO8DpONgEYFyXb+9tpL6JXHIMaBY0yl1Ab7ZF7S9NHW94q52KP1s8K+vbcSvuwnboTDt7MUF3Cmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8822.namprd11.prod.outlook.com (2603:10b6:208:5aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.22; Mon, 18 Aug
 2025 03:04:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 03:04:14 +0000
Date: Sun, 17 Aug 2025 20:04:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] Make page size consistent in migration
Message-ID: <aKKYLMmuX8eSmRQU@lstrano-desk.jf.intel.com>
References: <20250816142457.7950-1-Simon.Richter@hogyros.de>
 <20250816142457.7950-2-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250816142457.7950-2-Simon.Richter@hogyros.de>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6eab34-1289-4e42-162f-08ddde03e993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tXjxX6ydTfrgtESXEDQ8PxcBw1IZbr8tL1lBR8gqPrWEQHdKo9VaLb8oA7+K?=
 =?us-ascii?Q?03sVlgnpYdcT6eWE7sCTVwzadiIC++9zRpcKqtyukpSKMlL2K6h3jnwBpO3I?=
 =?us-ascii?Q?oXL+GnzNC671StufAeo/yZCb6J09rKsa4MJC8zT54Un5C/gL6zTn1EiZVfY/?=
 =?us-ascii?Q?he7ENw/W2PyiZ/4QMq8Cc8Mhw5w4I95Qv4DlMrr85M5TcBPhaKARcuQSlBRM?=
 =?us-ascii?Q?1RARULOtIhm8+m5p7E9pBylKXtPhb/OBex/i4vpJN/gpP1yyd2jCs0jWttUZ?=
 =?us-ascii?Q?O8GXdV0uWqhk9NkBge62JiL8JDTwmNwXhIdGEUTiwqfK45SdaOIvTin01b6G?=
 =?us-ascii?Q?aAjSmM89clicqdJL5C0kYypBoLAkLacM6g6bR4a0JvCXOPNm5e4nExtjfy8z?=
 =?us-ascii?Q?mEqkKFFkbcMTISedT80s00NGBumNsGqIzRE6lAS7YZt4a2aMy1T7nxzAqIvX?=
 =?us-ascii?Q?JXHI/jn+LUjkDH90+rXBtBZRyN+bC058V+BBrdW01LJWz04N63mReIUdZ7Kx?=
 =?us-ascii?Q?yMIZFMNcpPa+8k8Gr0bxeoG0BBCrVbj8GP92zWD7QRd6CMKtVFsUg4mfg3bg?=
 =?us-ascii?Q?PuwxZPgMR2RVkRn5ZkJTVtYwPDEtN/OuIq5CX4fSWpi2anO29XXDI3i2dTeg?=
 =?us-ascii?Q?2DmvRjEj9C72XQPxHfZBJ80QoVfUR9elv9rCDtmOYRRNO/g5DKNdA3H76p5E?=
 =?us-ascii?Q?9Ktgmnq1IYeQcoXUbWZ2/VXhMV4PovOrDB7V0zQjKcklLcEe51NfUJbbIiS5?=
 =?us-ascii?Q?UYRivNKyw8bvIzud0u8lCSdkhdO0t6Ay3QM7BInudGc8FjkQW0WAwAwGgHcn?=
 =?us-ascii?Q?XOjUU1WsVYCIPt0uFOTPbzDkx0uRHbMs3XTu0u2AQbPq6calafmc3oX10IhR?=
 =?us-ascii?Q?dRASX17bfOdfqtsTRIWB9AxFbpCCzAVBJAdaT3NF3cy5TjwklZKYUJpeSNfg?=
 =?us-ascii?Q?v0j+wJd7d3UKqoxlCfUBZ+fOXAo796Alq3YGVLq3xfH5HehhQeAGFLzLSTL5?=
 =?us-ascii?Q?rbchtuD51ZopP3v7/7HMb1zLZsDwvuSR15yQZoh32P8wvY9rH+QGC+3s9CPT?=
 =?us-ascii?Q?VZHbw/1LXrJdIpX9LRqPSLkgnmit80cT/FkoQhlz3IasJuAa3bwvNNLhIEdf?=
 =?us-ascii?Q?taSGVzu9/Bn+oSHmwopwIYrFsLEdTltg9Se+FYBieXCp/4OP1+6QRtB9KaHT?=
 =?us-ascii?Q?sg8kZHZjV7tiGH15rZQLEuV9HreD9HV8haBeDrXjB1TWgpGhuTWhIPeS4Pij?=
 =?us-ascii?Q?mQ/y2TJlYSVRpEL4RUZD/F9ME9HBvPrFPBTZR2VgOO0l8ZCrxauKHQM4xeok?=
 =?us-ascii?Q?AWb0EKCdxTai/AYAuSDMUo1dGUBGGejLoF0/iDYyuqaPsoca57hten6GgcHp?=
 =?us-ascii?Q?IOYr93TlK9RL6Bxv+sYtpHf0CQCoL+Mhd9wSInlXJYYqlIT7eOKAhi2P0JCf?=
 =?us-ascii?Q?SozYST+MwVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D+7Bo3zqzfM9fPu8CK1wbImYT4S9dIJOyg9MgD03ObT/x3WGWI9R0YiOSzNJ?=
 =?us-ascii?Q?f90Xzj0GjbMxIpwD56WYZu611Y6aU2tFEzafPfUZ9rdUTCHSxEUIBaZrXtkN?=
 =?us-ascii?Q?xQIv0truYrzJgX3GOtwZrINxZAiiiNhgvePBRMHXgbRJqhocBZuGRb20/SHN?=
 =?us-ascii?Q?IJNjNoo8ttFTgVpsy3O6EC+CNXhV99CoGHbn6BTL8FgRqFAxAx2c3cZoOKcZ?=
 =?us-ascii?Q?d1Xo3WYnSBmE4TKRTYsgjAKpToGJ8f8T61U5AoCsHkeQyM8p48qoG3V7ie1j?=
 =?us-ascii?Q?GbfEuvYuYoDYKQ9akeMrvY7s8DfVXBf5ZY/1JbPwdiPaU1rl54fD5u48GjIW?=
 =?us-ascii?Q?1QDMWcdd7bOQKmrx1HlW2daxF8665DIOplbr6w/a2YQp76K6xOQIc7qTeIwI?=
 =?us-ascii?Q?aJ83sSiN8n97oNxUcDWve6wEdZnoDGVleZPKPM4s4FXJ16phv2N8WqH2bXmG?=
 =?us-ascii?Q?5BZOnsxfJrtk15NAlBv8EuioEUA0SVkcvPydomo3vgLoXYnlCeVn7naIWOMS?=
 =?us-ascii?Q?OY9lUQji6eDAZEVtRA29/D7QaAsW3TJtOk3IF9DcnOAGrOtwTODC6FHcozxB?=
 =?us-ascii?Q?so8FEb7605ODFv/Nxb0c07s5G7WQzqudFO6v2k5E3hNOXjyzhNrcKXxVp5lT?=
 =?us-ascii?Q?CiiA0l8dVOHBYfmeacre+X6H8HPhwOactetwzUhYnZ35zU4c77OJ9aycZ3+d?=
 =?us-ascii?Q?AIGGWxgLNEie9h/raQXDmthyvqy8j6f+kZbE6iFCQM+af3EMbVtoDVq/qCb8?=
 =?us-ascii?Q?5jdI8PGidBG+sGyxVBGzYkCk9kEJO2DCWvNXz8JDBsVX+jj2CnPrZ0Ax+N06?=
 =?us-ascii?Q?vWK4J6Jq+MHxibwOEUbiNdEijoKbxMHr3MuQ071QypTEbDjgwzwJWPZTWW7T?=
 =?us-ascii?Q?rutb7wi+lEncan5X/fDUekj4Nas39m9UfxBVLr7Gxl+AR3bScYJ8JGv6jBmV?=
 =?us-ascii?Q?ha8Tts8cH5x/6zbxP9JYfdAUT5n28DiWVpsipScC4rNX5ZN8lO9ONq4+QhpV?=
 =?us-ascii?Q?fqUoSDbZfC5oh/G3360NBJIY+u4CSmg/g6YICgRF2k3csvj72KQoEazytzmU?=
 =?us-ascii?Q?X9BBe/O16Gw+D9G+FkWrijjLd1VkUJDiS+1Qwh60/t/KFfZ86fhKV7TZcFCX?=
 =?us-ascii?Q?gQTYcW1puvfaqX1qVm+sIgdsdYerYuieMeOGxJ41K4Zaal47n0hJ9GeaNrl+?=
 =?us-ascii?Q?Yq3VEHIvH2Zx171EQhfXwBg+/xQfjVx1vIRu5bxB1BQRXM6bFzEoqyDz7Rxm?=
 =?us-ascii?Q?nxScwPqrUB6BVD915yf6dKWNGRap3uPwFW2vHCqQ/K8fzBS4ZGaXvsLYc0Xn?=
 =?us-ascii?Q?jWy/MEZQsEWB9oj7N9jMaL4DIs53Edx6wKnzUMUt3i9ksUkLanhpC923mwDp?=
 =?us-ascii?Q?eh9zzRxAULM+tbVZPb1toVv2S9xlX7vMU6/84sLJaebs1M1T8MLKbtpi5ZAm?=
 =?us-ascii?Q?lLj4LZOGvG2vfB55ATbsMZDRUK4bNrPqA927eEsKA42VHtppT4CcDP1hV93R?=
 =?us-ascii?Q?/05thoTYY/apmcIL0gQ6cnGwmZDPR5LrOcGNtnOAUMak/CRcV1HymXjH3R0n?=
 =?us-ascii?Q?IGkT84/S3hYqBVwWXTgI8g25XMBvDbq9L9NPZVdgW381MZdPklsBGw4HXe4/?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6eab34-1289-4e42-162f-08ddde03e993
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 03:04:14.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oJXce+2IeVEU7ycFCb42UU1w5gSPBcTP5yLttnOWA9rF39JWRLgKOkuluioOHHy75c7TuD+NJqZxEh/meBZqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8822
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

On Sat, Aug 16, 2025 at 11:24:46PM +0900, Simon Richter wrote:

You are going to need a commit message. Patch is correct though.

With a proper commit messgae:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 836333c77a88..0c0864c8fd57 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -281,7 +281,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	}
>  
>  	/* Write PDE's that point to our BO. */
> -	for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
> +	for (i = 0; i < map_ofs / XE_PAGE_SIZE; i++) {
>  		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
> -- 
> 2.47.2
> 
