Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E1AC87FD2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E129A10E7E5;
	Thu, 31 Jul 2025 20:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgHtOdAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47310E7E5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 20:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753994201; x=1785530201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZOtHwR6Kh14rOxhyyqEvij1kRtwdKCnGXtc+XbCFDi8=;
 b=PgHtOdAJofTXyRxH9ktDpgrMgRXX17M2ZC89SsOOvaPvqA3nQkEwAmAo
 p+CHGMRuaSpH1OUYRZhBKF8boXkPHRXs5Tt0+Zys4xXlSI5O1/6VCOs5k
 IkFoQ+clrdUU8WZiUF3Z5JSS7P2z8g1G051rsTLcucCjfhS96yzy/6Kcl
 KwNQnJtLWNsHXlwNjK2RTVm/ZuDD+MxcnD71S6LNFAKxk4aMX8ELSa9fq
 AWs8Gm4OFtpSHuzJplOyjxEpwE77TLPZke6qftke1ND9oeKXmcFAa6rob
 IjVCtJXC0c4tQdclSJiTiQRssW0aAiz8JiNvp6wiAtjm1Py+r9I8zKthi A==;
X-CSE-ConnectionGUID: FjH2s+zkTT2qNfmdr3jetg==
X-CSE-MsgGUID: qxA/0+CrR5q21yVL9aZB3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67409535"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67409535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:36:12 -0700
X-CSE-ConnectionGUID: HxmWo+tQQRK5R4w5T8G+pA==
X-CSE-MsgGUID: jikAEVQ1Rx6is+Pe97fwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163068238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:36:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:36:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:36:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiLzh4SgjxWWdw/ex9A93mpx9Gv0rBJpUwdHm0fVZIWwPRixo/ZkRV+Vvk3u8iICDAG1h+usdxbTzlPZkD+aSC5m6b+qwkKawQwkOrU+qIKhydJV8WtxzYjCJZxlUt1vppaTU5QI4oPC+7J7piqWdJqrpz1cJsQfc3bE1wgmkZm+bqs6TyZ8dxap0KGF5EK7/+NZO/Gm5/okI73N8Iij4D4/HpARhx53pr9FFEVjUdrtiTOnSnrOMZtt+ny6zQg08IbZRMCNpEJMkTPzusfPXCgV2hYzrych0ArnqP1/OR2201KO2NwYOtGQkZQLMw6Ri5JJu9uRrWACM71/cpQdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G657lrK7mF3yMZFBjQ2V5+MewZO0h+E+dFsKaqJi3bQ=;
 b=gyTZBmNYosoXM3WDudITc38LnHI7vccNpg+WreoNXbIdN+FuSck1L5jq4mZAJZGD4T7wT+rF1MCfaU5FyyJJBjWM6AFsMVq2ISPjt7/boD8JXiUFHg0mN6KfXqLG0p/voK7QnAJMpIhEkWANHBjO3uFZLIrIVhXzxfaYL8hcM4+zajPNaFpxaYxx0ne+UF2N2ZRXmZtIZd/B5ctyfANeMgu7hSJvnXSpi4WyU2fpYn0uCJUfKNKMn98E5HmVWus1TW75eTzEqaGh8ESz9X6gEduuygznETg6LvKhGV5MC0gpbOoGK/1Xgde4ykva4jRqmdAYyUeG8CZf7BUMDzG0Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7128.namprd11.prod.outlook.com (2603:10b6:303:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 20:35:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 20:35:56 +0000
Date: Thu, 31 Jul 2025 16:35:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v6 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Message-ID: <aIvTqdzmbrtKED6N@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250731193339.179829-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9b1bc5-c01b-489e-d157-08ddd071d9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3+PFH+AvNXUQ6RXyk3QTp88E8etugLK69WO/z46mz8m3OUJOAtTrBNIwvRza?=
 =?us-ascii?Q?hWaJWXWfsA5rA3r1U3GEaIgUJDv+xQcMbqQOs7eJlRJ4gS8qFYuevv7A2Iyz?=
 =?us-ascii?Q?KY55bKouNOM1ELgfHIAajbGZa7G2yk4icID1zbUk8UsqHnCD6bsEKuRxd44p?=
 =?us-ascii?Q?u9fZHebZXbKH+8kjxk6J1zkOXKG3Sl6pQz/z7vWbQUH8DMAoK+Xd4rRKQ/6N?=
 =?us-ascii?Q?Cc9malvRg4ZsZu1xlox4O3BKyLvVKsLUzKEQfNR23yvHzBWRPEjlcGO1yOWc?=
 =?us-ascii?Q?/VLbfYbU9tc3bgoYRSXWTukcHy8aHmj+6/mwrYBRYj6uWlwGG2f7F9uC/FnX?=
 =?us-ascii?Q?57EZwj6BOA7BWFL7IiKphBVFpboXv3/0YfD18ExU496Fy+EFUkLCgjfgjUd1?=
 =?us-ascii?Q?QtRLDmhanQvoQTJDZaZ9VQQn8Orqw5cK2jqEdYZLV/e1EW6pr3TNIq/0g3nM?=
 =?us-ascii?Q?lUxB7YVgSEwQalQK2QLlGcxLZ4Y4vT3jbQ4lfIofyXDtxhiBgzoCnfNGzoqa?=
 =?us-ascii?Q?xqPk4d63d9LQI8W4Hjn12ccf650rDpZMCkQIor7FqQE60PVhqQTavbAD6JSb?=
 =?us-ascii?Q?FMlAuX1UZU4ULzWF9xnN6uWpc3G1Gn6Kn0RIH8OZuHZ/E5wByh9eHoNilGhT?=
 =?us-ascii?Q?J/Byl3q0obPJ2yNCQ2EeHdZ9Kb4aegGxpBiU5bEBFDDdewQuetdjD78pi3qU?=
 =?us-ascii?Q?DN8hpKg3883KA5ywxOaNgZPyn+ehAxYzWdDucMwadnaCIfZM3hrFqoXtkD3+?=
 =?us-ascii?Q?9evfTruMFAmQvs8g2LU6OJLmiBTGKu1OIOemLUzswLmMZv8RxVbTr2X2EjiU?=
 =?us-ascii?Q?EpbeOgyeloJwKAQnwR+AaH/Q263wEQv3emtMUQIwMthxj1j/Ox+uhuol7qsS?=
 =?us-ascii?Q?at46lUcx4Sm90413fK5NtDeM5US3ZMWEAcLYhGkGMVA57iHSGccXXFl3W3Vo?=
 =?us-ascii?Q?NC7mT9UYjB4f7F5b2wBOT1lGMHysCODPoCE1Nx35XxftpBxpDipv2ZLqV67z?=
 =?us-ascii?Q?T72ZOVyBfgNvlwlWn9st9kWuViwDZmjlqcGKd+LKyL2JRAfTzCvWKPbSPFa4?=
 =?us-ascii?Q?b89+youhXR2blMfxZbOrvHqtDLaPdnJKxKipzyX62qMbRe5NwI4rcPKAfCVE?=
 =?us-ascii?Q?Xv85LVkQpLd6dQA72pZE80ApU+JJukJuNQW43AhJJjfZJ1RexnHvGtMsWUWQ?=
 =?us-ascii?Q?TI5I3QZMLjVr3vDd7NFmuTYyYSY8UDzG2CdebOi6etnO8yn4QPZO4Bpa1tyf?=
 =?us-ascii?Q?OtdGVvx+NQ05OGGkztKdrgFRhZVpUqGS8JllpqHSO2bieUWsEBZaDodrosqz?=
 =?us-ascii?Q?1p66deGXivRXVrhDwEmFoHWqdkdnrP33xMS/CX2r2aShu5Scbmct9UIEX+CH?=
 =?us-ascii?Q?8+MdD0YVpEmhfxLonNJziE3AcntknnGQaueogp4yAPV7xCZ7nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LapyyFlDfFtHXznP6go0sw3Vtt2TZsHO+YiWrNutYKSHOxpyeBaBSH7QF/Ax?=
 =?us-ascii?Q?0ITXUyaZMyLsNWD52uqnqpYCnH9L55cAHHNT9U8HXRgMwQu5ADSWjvq5d9JS?=
 =?us-ascii?Q?DG3fRxXqhIGdW1f8XjuiQv23BSSHoisnOosHVh4X2YoRc7SV2xDvQuNwNETH?=
 =?us-ascii?Q?IeJTtHZL76hN7U+ffrPbfwbk+vlc/Bl05CGYAlUyF6TG/O7/qlfCglqMscIu?=
 =?us-ascii?Q?lXG3arQG036jQ/HN7tQ7cvKUoaLUWoqIZPGen1dtmhf0+exlu4GgrdfQ+xkM?=
 =?us-ascii?Q?1nIP+6IX6jNNHrUSNby2hoBrydXpH952Got0fErpnu1A9ZTkV6YvcbKeTGk6?=
 =?us-ascii?Q?5aAW3k29hbLMr3gMRjoP0RVsRPdnxHTxiUBsdyVnpKUDU0RYeDSJ3VF60WTi?=
 =?us-ascii?Q?ZN4kH9zRyCSCaI80vSghud2D2W27XT8k3ozzQDCQAJu22Dom8EitF4uJcro2?=
 =?us-ascii?Q?ShC+n/dEIkkicrBH/4zHgiAjtO6+X+lQVsPG/QT865dV/Jk0dGabCW0IZ6w5?=
 =?us-ascii?Q?mm+mNGmGxl1tkYxaN8MT4pxGyUZanYFFTnQV9BrJMOHLKmK1UaAjBcKYbcwF?=
 =?us-ascii?Q?eSdBcRcajU7M8M7n6tr2Om+wpSWmpm8mekNxS8opFt5aa03YKU8QR0QxFLv8?=
 =?us-ascii?Q?EXLMMbdp1wnhuvwXNzDbTR5MBCI5L6KlGGs5UJLcM1iPY7g7hr9o53Rh+4/1?=
 =?us-ascii?Q?nFxQY6MzS96cKm+0ms2bV6AUVEAnRK33WPaCNGqSQVmh1G84KJ00uyv4CyU+?=
 =?us-ascii?Q?EwjpmkZW85lniJqWEXxilCTb7fWYtYkPkM2e1ehOAmE7XimEG1meYjIqywPt?=
 =?us-ascii?Q?YJALpK8Alb3FeUiKcxC8DErHa3swvrFPI4ALl7EOsk/thoDpMLfmQ6ftErR+?=
 =?us-ascii?Q?N4DkTTyrvBEEnDRq6atdf6LjuPRjwc+T71lEk7J3Tssc0MOb9VWotFn+/kno?=
 =?us-ascii?Q?n9Ho9lPezhzsqY8x0PD3SxJvCGR9q4OrRvnBPP4UksKtoqMcUBNLmydZIMaZ?=
 =?us-ascii?Q?vBnsKOGT7cHSiyArrjW9eM0rZNdijqhbT+TBOPmIUPaebOoye09Y5qJbzCkd?=
 =?us-ascii?Q?1sgvCTvvODghQt+UcgQawoVeUSxFqDCw/c36CQXFuhlsZxXYHiNwp5GVgJd4?=
 =?us-ascii?Q?Uv0lXbw9vsdY1cBlUUOrVtDRRnVCywNx4XjdYRYMbXkbPdbc4Xbo43eeGDjC?=
 =?us-ascii?Q?Gsm0Nnck+Qi0zs/aiGEwjMLqO0gu0gDtB0LkYjOxQxcB3CGEYlbzTgWjsJWh?=
 =?us-ascii?Q?hxNteD1HSMSG3bLu4Lqc9hgzsSMSlP++25eu7EMat9ky3hzJ0ecxoVpuG0Ka?=
 =?us-ascii?Q?RcA7uZM2Ekx93bJDYyrwvnXBwsF9CdJyBsoGA2hK7fWm4cP4SX5CtC3ulS0f?=
 =?us-ascii?Q?J72R0Ray8IVIhxcG4QzDNdXX7k8mgQx4AP0mrCXCWM7H12mObhyAsO0qkAw4?=
 =?us-ascii?Q?uomjeYyq/MXQ2EKTCuokDQzV9MADHTsV7RrOLg10fUVl41AfJ7CRY9KTuDPz?=
 =?us-ascii?Q?nwaK9JO3TjC4VGE77PsRW/Jkb7iFOe4xUh5rCUHt+Q/oHrh7jxlKDgm0t1DY?=
 =?us-ascii?Q?8INnNcjlxYqZXWeTGjE7V6VbUps+QZcSWHHibn5n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9b1bc5-c01b-489e-d157-08ddd071d9f4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:35:56.5368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X9ACw3WKQzVK8NVNOkz/4JvblorrtUic6hNmlFiik2qm7QoRSEjkvRx9oWJZNUHaxsmp0IXC+/3Bao4aG0CcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
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

On Thu, Jul 31, 2025 at 09:33:38PM +0200, Michal Wajdeczko wrote:
> Since we already lookup for the real PCI device before we allow
> to create its directory config, we might also check if the found
> device matches our driver PCI ID list. This will prevent creation
> of the directory configs for the unsupported devices.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v2: rebased
> v3: don't use -ECANCELED, print message instead (Rodrigo, John)
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 5f145ccdf535..0e2da7907afc 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>  	.ct_owner	= THIS_MODULE,
>  };
>  
> +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> +{
> +	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> +	struct pci_driver *drv = to_pci_driver(driver);
> +	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> +	const struct pci_device_id *found = pci_match_id(ids, pdev);
> +
> +	return found ? (const void *)found->driver_data : NULL;
> +}
> +
>  static struct config_group *xe_config_make_device_group(struct config_group *group,
>  							const char *name)
>  {
>  	unsigned int domain, bus, slot, function;
>  	struct xe_config_group_device *dev;
> +	const struct xe_device_desc *match;
>  	struct pci_dev *pdev;
>  	char canonical[16];
>  	int ret;
> @@ -297,8 +308,16 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> +
> +	match = xe_match_desc(pdev);
> +	if (!match)
> +		pci_info(pdev, "xe driver does not support configuration of this device\n");
> +
>  	pci_dev_put(pdev);
>  
> +	if (!match)
> +		return ERR_PTR(-ENOENT);
> +
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.47.1
> 
