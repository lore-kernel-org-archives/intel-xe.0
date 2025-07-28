Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BF7C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916B10E190;
	Mon, 28 Jul 2025 19:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isRi5art";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FF210E190
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732232; x=1785268232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=343Y9qwaSB+QLX3RqP0lEkhxWMbB1PXcOLwj3VchcSU=;
 b=isRi5arttyHLyt+zoJgrIllX1c9aw/ennAnQ9EWhtM3C93I1zPSKG7q7
 mzZKiQRaCZMzmghKblEjq0QQm/xRT7jGlBQKPRppF0uG9ooXnKEb4UTxc
 RMf7dRew7dmm+YLOQxtZKkXDuL+speGVP8liML10aszH5UJFP55BadnaV
 7foZUBjmkdnnWTD7/17PLkojC2QGsYps44lddfRdo/em8HKrRlPg525mO
 i+21V4c5j+Xx/XbHH+90DxAEkqZRTcXniyjK4S4xlI0NrLgEECexjAKMd
 PmfMBmaksrpKIz30bftdEr8Y7zIIpjjyO3McMoeMSfWa1DSU+NsK13wKa Q==;
X-CSE-ConnectionGUID: HcxgS5aZTn23lbEw8rrn0A==
X-CSE-MsgGUID: VAN4uVJsRVuiWaWirntPBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55928890"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55928890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:50:32 -0700
X-CSE-ConnectionGUID: Eycv6FZGThiSmYvQm3xAzA==
X-CSE-MsgGUID: WKWoWSeqSjqGujmy5d7q4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162956445"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:50:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:50:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:50:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU4YPufjlEfdh9zzovSk/hT8cr389D22r9Nw+WPncMmyVkS98Uw1rEe67vZDnFqsG/Q2ooIivXNf1wxsEV/hdABfCSs12x33A+8klJY4RasH9vekSTc7bNjJHicXG1Kna1pWsTtcVBlQxcTb7sDAj5vRnxT/8yTwEhCARsLbO4S9v1xr6WKEiO6KEPUbK9N1wHN/dDqn3/B57EHPyd8uCOouUVReS+2+VtmVOWk0eoMeaYovqNMF4zQXm93T43i/cbQ1yvZp9QuHfPPdjLFqZS83S6eaC7NUNdrCY+eDIKkLHvTqbvGO20pF0lrAqRVf3G/TySPDwz1L2n3v3RBYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI4PnNylV0OUQ5wuhlXSLv89qdQoiMzeRLfoq/jiRBU=;
 b=RYwdsuP08LjMZ3GHqnQYSUBe0ZmYasnS1HiZPjygacdOo205UKH+Hu7P9Kz6Xmf9BfhwmI3USfQ0WGjtguzinSWntVNnQ75x85nlm9uIJNT7hglXmNJCD9BmRGSrDv2yAwApXdFAkac0FFFNeabQxOkkMtwMGPoSMv5dJJ5fRXImbyXPTWkJ/D94xDlpSzhut9oi5LWnJDV3zQtRHHbVp1mgFmDUeyqLbUbUv4TzmKqOgSWZpW5e/nTaV7k4BrMF6uio9qcTnmK67ezHEX+5xWVKLgwvReeskU9q8cOBUgeDOM++399AWsFC9rS+tfWzzC48SgNjZcZ5A5b1fF3ZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:50:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:50:13 +0000
Date: Mon, 28 Jul 2025 15:50:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 04/11] drm/xe/configfs: Use mutex from xe_configfs
 subsystem
Message-ID: <aIfUbQWlHiOymYGF@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 31012538-09d8-42af-bf1e-08ddce0ff7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?voN0ApgOyGAnsz6x9mkqAESo7HTeCZe3ZvruP8dqr/EGQ1kTthtRYOsXmpX0?=
 =?us-ascii?Q?rdZutjS+zmq7Ss775wG5pNu3EvActBjkprYuSUg4r2W3sV2VHi9PhSOTcvdr?=
 =?us-ascii?Q?94p6IfdK03FSK5XRUQdXVCK4/bdTMstgfKdqHB4Ttr8trNEKVpW0tYv9j49k?=
 =?us-ascii?Q?PonVuTPYOblNRg6ScC8UDKNWmBkdTe+03SL4dRhxstAIt6M82OGG2JKV6Kt3?=
 =?us-ascii?Q?evvZOqVleEjNItzdmoMmv9Grfj3+/7UqiLeXn8dYLJY8I60euzVI8oe8jWW/?=
 =?us-ascii?Q?E0vRonTv5k1cp9+GtwkV6tkJ9eK9gqbkNaVWD7LzNjEmZvUfHN7d8NCQAN2T?=
 =?us-ascii?Q?OPyqj2tOq58kRdrOZuLTRfDv0itG7JsjFdkykgpeVcy1A25kAPCJ5m2esXrf?=
 =?us-ascii?Q?SXa5R57NoIFtWDh/0BRq0F5e7Lk6hFu3z1STJnEyRNpFZv91L5Qj1VRpLapd?=
 =?us-ascii?Q?MLPTRv2DL1lmfHSKV5S+4uUbpUikgAlA5Yjo1niPUEwOM2O8wd4W4uZYCEO7?=
 =?us-ascii?Q?tjpY5eACUXc5IYoEUnFWW8F7oH1Wan1LK8Nj+0DPE6c5PCLsfwA2lS+nkAtA?=
 =?us-ascii?Q?OfX4xzSKOMMiSzLYxFPbqZvMrTpNkXUe4ZJOqhj2LhTHawMaCs0+drwMwnLH?=
 =?us-ascii?Q?bFllocUGuBHOGwhLvbKQ+SBgULMlsE1RhQAjf+E+pKIpdrkaCfrGgPTEfmo+?=
 =?us-ascii?Q?ki2qjfeiVbsopTjv/QD4GzkCPwnyc2qCo6O+bbCRS2fcemFwgfIXGpEjTpiO?=
 =?us-ascii?Q?xSjq2IcAHzdU+KW/6brUc8mYrTyLEKftak6yUFlbVhWyMZpdGQLlC8US0wXn?=
 =?us-ascii?Q?J60EAqGONH7PRP3sh7Pt3jQ8PaC4M+IdKL9waOqkGSzv560SfqcPsy4jk97l?=
 =?us-ascii?Q?w9doG/XEUygU0kYLo8Jarv2LCUpMPO6JeuXb69YxTke3QurTto/tiLqF/lwJ?=
 =?us-ascii?Q?khOqShWlVFp/NNjkJq5IHBGHlELcOGGrv4uaByS/JHepT/Du6/OlN2aZ9WFx?=
 =?us-ascii?Q?xtLsLjBkJCeEEsvHnNOiGWxtPbJ5khzPlCirOEvLH5IHATMoLG10HQ/2jF1c?=
 =?us-ascii?Q?x+7XoEeTkJCXLQYmo9a1ssEiMJqGmCjqKsN2FC5Tgk0M5oewh6pdjeWAzJvv?=
 =?us-ascii?Q?MnYmRERvpDfKTFzNW67AK/PwTYhSrVtrikcvaum8OBFCnSDcvHON1gfv+Qh3?=
 =?us-ascii?Q?0v9W4CP86ahlKoaUhCzfqjr3Xli8ZqHgGizbXD/ZUaweC+epoohoRrBrCkdz?=
 =?us-ascii?Q?iHX5GuDzIBn/mVC9s5j47b2zHMHV99aOwtCcbpB0TXm7YhKCDkttfyBl5QdD?=
 =?us-ascii?Q?0FWZeUEkU3Dsj7T2RzDp7CkNKdMjyCPzplNOnK3SWy2HAKGe4MVH0XaBW4Tj?=
 =?us-ascii?Q?97a+rrS6JCdMSR9PyWyGZgDEH0RdV4Spl1jSWrZzqBnLMMtdwYA2sa7zkphk?=
 =?us-ascii?Q?w0M1JYU+vNg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//mb5ya+7n16ihfflIscNbYC6YlQQQRY7NwgDd5LQ4qGmSEt5gvhBK6Yn31D?=
 =?us-ascii?Q?3A4HMyl2yMgJToBhYjlfjQ5cgsDv+MlReEqa4KmWadNxVl+1PcN0sNkI2dEt?=
 =?us-ascii?Q?E4qhqzpnSrlSg988yke8BuPxKe8XwWCushJ0OmBBZEhEZHGTToZkH+gldZUZ?=
 =?us-ascii?Q?abR0gTeajqtuHE0zpxX0BQkOYFfvv3IVWu9cQ4cKRuibiviW1FXWnh5d9IYL?=
 =?us-ascii?Q?BkwkvQeKrff62ijytcnOuXs0I/4QrPdFdI5srMQ7I2woZb094HnpA3/tGokp?=
 =?us-ascii?Q?fw1NwYyOWSyxqQcXIQFbFW9vJcpiiGfmUrSiFTtbzzYWmMcwhXsZMSIKi2iY?=
 =?us-ascii?Q?LGyNLCvRz6saMsPWHx0lq2g55nDHx9pgyYiisY6FQZvGgJLaer2bBKkTRgz6?=
 =?us-ascii?Q?MDr/3YZnXZQkLNdIZN/b5ePoGyaE0WhtRXz9J9u50WK4JncJQwXD0B/LBF3N?=
 =?us-ascii?Q?sDZ1tEtohWQCCzYaNilWHVibwLKrY5+GlgKpo+yH3Udc7cBSP+gKg65KokZp?=
 =?us-ascii?Q?VBVa+/2hVAW1MzyPWVbEyid349XZ+Em/oFjK9hxibAA/dHdo61YRI31ry7DV?=
 =?us-ascii?Q?Wvy2vpSi6duA4+iThVrI9/A+TCBkvg/XOLXpWKZF/bZZeyPrHq7dQj95vF7x?=
 =?us-ascii?Q?2/dKL0MpHZZEM/bZvXqzQHhVOULrdEJUYp43886Cvc+IiWKfP1u+fW0UoP3o?=
 =?us-ascii?Q?lgpGVSco6OBop7rVWeJUMyhYmtmamOFwPOopnTxSPJcq6dNPFdZRaSVjB75Z?=
 =?us-ascii?Q?PpStuWPExhi6f47QfWhlyyIZHhG5v5RAOmo24PwrEYZWCrKaEnsxojLdCn2g?=
 =?us-ascii?Q?DmqTQAqmnVQrxCXjJbSKFpqhgJLsHZoiq7JIxxtU2t9PSoJGXdnstUn60hMM?=
 =?us-ascii?Q?9+ll/6GlS1reg5YkOgFgu4tRHlEOCYE7OkAbnM5XLtPjcoO+i2IzZHSUt1l0?=
 =?us-ascii?Q?H6Mc2TaxhCOyWnNunmEgVXe4oGGPs50E/L/ifpkk8lEp9x1cGvJXKP8N442m?=
 =?us-ascii?Q?evlPfYXTpzL0kDlxl+5Nz68imEtDYD+ihdWFekLYtP0HvrKIOyG/VxFu8B5u?=
 =?us-ascii?Q?Xi8BU59FTF3cySWdQwdMSxK8S0sDedj5AppfwkW6qoayPyEwRCUvuKoMBRGm?=
 =?us-ascii?Q?bSYizc++ckAKCxoezkV9VmOvtpK2j3+0vX7W7gWYGWsnhVHxgW948rK5r/OV?=
 =?us-ascii?Q?KhVk5aL0kwnH+dpA4isv0M0qmqIagP3ovsGj1G1Gdk91lFtXZ0gNZyg1duyf?=
 =?us-ascii?Q?yL/ip6tAR+a1VMpyMxEypH4Rfp4w4yNLOHLY1mqO8UXxkhKy2j7u091i5zbN?=
 =?us-ascii?Q?1qZi90V0LBMfCZpBx3p2jdXHzzxc7zK4aGPNVhovMU8ROlDZeittIFTtYuk/?=
 =?us-ascii?Q?T/CXIJH3pOHAF8a9tZ34I//QazwIoe3P0d2Bk9HUAESextRzLUV9bMYJrdhe?=
 =?us-ascii?Q?5qkN7r9myr31YCzK2U8Nxo6cG0bC7a7iuwqgZyovwGJ+pAIR34hncFc636KV?=
 =?us-ascii?Q?1gLEzOxfiFgpBDp7T2RRp2a4ms0Sww7bAKJwhnyEhxMK6uAUEQHi0wxL62jE?=
 =?us-ascii?Q?GpCcxxBQxZ6P6byFnhh2moBykNPZOzKwp8B9sXyOvGoCzscQtYfwN2b49/3s?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31012538-09d8-42af-bf1e-08ddce0ff7d6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:50:13.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itMI3ZqkamWcl3Zv5lI1yVugKIAAf/vL7ZRKaKFDTuUXhhVrs6OgNIDDaoAmqRRCi2fI3sUM+TWyM99DP7EoOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

On Sun, Jul 27, 2025 at 07:20:01PM +0200, Michal Wajdeczko wrote:
> It should be sufficient to protect all configuration parameters
> using single mutex already defined inside xe_configfs subsystem.
> 
> While around, also convert code to use guard/scoped_guard classes.

agree on the guard/scope change, but I believe we should keep
the local lock for the local variables only instead of re-using
a global one...

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 6aa0531bcf76..e32517afae58 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -85,14 +85,15 @@
>   *	rmdir /sys/kernel/config/xe/0000:03:00.0/
>   */
>  
> +/*
> + * Use xe_configfs.su_mutex (also accessible from group.cg_subsys->su_mutex)
> + * to protect configuration data.
> + */
>  struct xe_config_device {
>  	struct config_group group;
>  
>  	bool survivability_mode;
>  	u64 engines_allowed;
> -
> -	/* protects attributes */
> -	struct mutex lock;
>  };
>  
>  struct engine_info {
> @@ -135,9 +136,8 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&dev->lock);
> -	dev->survivability_mode = survivability_mode;
> -	mutex_unlock(&dev->lock);
> +	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
> +		dev->survivability_mode = survivability_mode;
>  
>  	return len;
>  }
> @@ -219,9 +219,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>  		val |= mask;
>  	}
>  
> -	mutex_lock(&dev->lock);
> -	dev->engines_allowed = val;
> -	mutex_unlock(&dev->lock);
> +	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
> +		dev->engines_allowed = val;
>  
>  	return len;
>  }
> @@ -239,7 +238,6 @@ static void xe_config_device_release(struct config_item *item)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
>  
> -	mutex_destroy(&dev->lock);
>  	kfree(dev);
>  }
>  
> @@ -286,8 +284,6 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>  
> -	mutex_init(&dev->lock);
> -
>  	return &dev->group;
>  }
>  
> @@ -311,12 +307,10 @@ static struct configfs_subsystem xe_configfs = {
>  
>  static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>  {
> +	guard(mutex)(&xe_configfs.su_mutex);
>  	struct config_item *item;
>  
> -	mutex_lock(&xe_configfs.su_mutex);
>  	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
> -	mutex_unlock(&xe_configfs.su_mutex);
> -
>  	if (!item)
>  		return NULL;
>  
> @@ -360,9 +354,8 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  	if (!dev)
>  		return;
>  
> -	mutex_lock(&dev->lock);
> -	dev->survivability_mode = 0;
> -	mutex_unlock(&dev->lock);
> +	scoped_guard(mutex, &xe_configfs.su_mutex)
> +		dev->survivability_mode = 0;
>  
>  	config_item_put(&dev->group.cg_item);
>  }
> -- 
> 2.47.1
> 
