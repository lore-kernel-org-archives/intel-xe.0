Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549BC3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 07:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D2010E232;
	Fri,  9 May 2025 07:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2xAMsrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C881C10E232
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746775097; x=1778311097;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RlsQ02Qir0sHikzcWVMJJs0/639q7oMfbrwsilkjr9Q=;
 b=h2xAMsrENf97RiP8nu3qFpgICw3pMdEHRmVi5UKBdr+2yRsGr8yqHEAD
 4AdlXWd9/SUUIuVBJJPnNl7JmXfbLCrOWSd9j8iHXjLrnXeGo5NdZgzVG
 +p/JOn1+PwmN/y4EKO80IrTUKSCE7H+ec99aWvLad7MTa09JFbkPwRJ4Y
 22fptJxBwdeUt5rtIhN0nPAC7fzY6giD68E+AH8w+l4Mo4907D07MFia/
 jW+56pGUbct5nYVoA7BsnevjZ0yMbjVZxSWy0m1+d9kQGWC+eMOW8T4kP
 9lVo7/+P5OWMS+9W2lU+08Uscw+cTYvky8oSp/mZcfFNpiIXuPVjt1VWv w==;
X-CSE-ConnectionGUID: pNHT2MTyRNi9LdwxSvUEPg==
X-CSE-MsgGUID: lw27yaVETraHdi69JLKXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58808025"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="58808025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:18:13 -0700
X-CSE-ConnectionGUID: vFVWkHgpSZuc6Z5owJiwUQ==
X-CSE-MsgGUID: NEd/61scQX6jWa0dt5TaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167470352"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:18:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 00:18:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 00:18:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 00:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c22AxlfPfcSguSldag7ETUQd1zTmQyh+iveg2Ivd8gNmp50hrRg5Xpw3nrh7M6m2N/vq/BmRLlT6o3MHIaCqoeFe0frwZdtQKcanFRH/GG06G/fpj9WVflB4KUho22N1XiTnc+G8+/K4wEYGGLzy74hxGTaD//6Xwz/RDZyi97X/ZaNbARXsf/lTGSdjPC/hlHuo/WB6yXa0ae+yb8JbdbLqEOXJJ6JFlgL2DzLK2N/XvVcAF0NscKl9p8RXk1Gx+Q6mzTw2se3VpLJVH6AJOP0Al1gCzP4fUso67FFFjWyj3IfMD9ojoAhEThsBVXEuAzf3wHL8/TNNfFls8W52TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYQFfM4xtIt2gOl22Fe69RkKinwaSdad+yjDdMNgs5I=;
 b=m4ulFeGDPMEBqO90nVvk8sET09QiioViXdZDgRvUPyiouIyRpFJn0dOsm6yjHfL6J3ibUD+21g2W5hInn9Ec4i79m97tqd+GuUdXvL4GIKeTD/zZ3whxPmeqk00dCBE4ZUMaX9rqNfsFLHqXMO9NmtEU+R9qPkv4E5+RL7TEDzpfiEBRtNDZzoLqE18ShDpZ6ECdqky1qj/9SeGMFVgYdBdCHIf3cWX9VIbFhN0sKCbVsNikeLI5mxiTryb0O+2D29yFnrD5M0EllORs7c4MivRZHsgKFPsxRQ6ldWhDnOnRb6R+XtRAzdl5DyAs9dUS9ChH9F5OmMrbqwankATKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 9 May
 2025 07:17:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 07:17:48 +0000
Date: Fri, 9 May 2025 09:17:35 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix the gem shrinker name
Message-ID: <aB2sDw8y8Dp9V5uB@fdugast-desk>
References: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DBBPR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a576b1a-406c-4998-a95f-08dd8ec99a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MQw7s427tQjqnwoqFZfYiGB0F3S/fwYNCt54clcNIhYHbIxnmk94Qs6c0J?=
 =?iso-8859-1?Q?y0rs5xDs9ePgtzRxFZlZ1Cz6LDQMw+OUSxDR0LHHJdTcB8aPb+SbUCOa+y?=
 =?iso-8859-1?Q?R+SArcEyo4Kdv4IaXVgcAvoV1dzRdSiFEgIyt4h/FGwtyEKmghD2fpEegg?=
 =?iso-8859-1?Q?rX33SjHcR1BdmaTFb32v9gsr8fq/IZrZ0PmhgheY/Bph42IsYEr/i0i8bh?=
 =?iso-8859-1?Q?4IS3kkPqVhAK+4uW98BAVDjN/xmdk8S45OxKw4llS3nUTmR5DjiuxayZJ2?=
 =?iso-8859-1?Q?wUoC1p1+ucuJoBKoyhvXbz9m0HgsL+IPZoO4MVrbfqWb9pGvMAEJLuEJ47?=
 =?iso-8859-1?Q?fgGu6V0PuW37ZaaJkWzXrXpKhBMBurLDn37Ogd9Hv+yz4uAg1k9u1/L/vR?=
 =?iso-8859-1?Q?K2lPmsr8nDZCl468N84+xsHFGQAFTmQAZiI8mvWo1W4DvyxP1GSmwXhN0V?=
 =?iso-8859-1?Q?G6KwElvm+hGkBkmoXbHkO48lc5iBo1eEAyue680IwiV/y7UDob0WKZhFud?=
 =?iso-8859-1?Q?GyzKI9HYbZwfzA2zdspep1erwxGZK+7iWaOhzwiizVTlcFmZ6evXrBfw3P?=
 =?iso-8859-1?Q?fz/uMy5myu6ET9v9HJueR1cJl/BJcjUtVl7zQLYnM+0/jE8iB0JTzccz7w?=
 =?iso-8859-1?Q?fJLOjTaME9IG35G1PwVDFqQXoHQxNGsnYBXxQyvO18WPqLqO51ju46ENtq?=
 =?iso-8859-1?Q?3uv1zhwSGVT0IfnneVtnbzkYiwm9I8DgF3OP2ck5hRxkkvyB68ArLhmIBT?=
 =?iso-8859-1?Q?uM3Gf3bZcqmEkeFgCLFif4E4hDYL4/nwQtFpkOimf8zHjBAfbYVmi7DzGk?=
 =?iso-8859-1?Q?pMtOA1jHlivxNgiNZUxfMMxq/wljx4RRJw1BlIjhht5c+e8mdwJG7hjaX2?=
 =?iso-8859-1?Q?PXVqf2cxQpk1YgIHj8v/e/i6k/U+1pvvNZHnAqFdNQSGEi6YzfRkaWFI5M?=
 =?iso-8859-1?Q?cMvj5nDLg/ONQ8AwpDWeAEaBqZzTJMjFX1x259fP19DtmLJvC3hYV+59df?=
 =?iso-8859-1?Q?LJM/JlNqi0oc1I+uJIzmstKMrg6aA2YuKr4g5LFD4e7iGBb3z9rSZC/0BN?=
 =?iso-8859-1?Q?quI5JoZBihMzv8MM/Hux6T4ef4cCpa+07evvqgjWV13uTVMyTNU5xfunrD?=
 =?iso-8859-1?Q?4usig3sWqM9TwbdAqn7rll4SHA+5Dkb7Lm7YEaio9HVj8tCRy4SEUFIl/B?=
 =?iso-8859-1?Q?SzS5T7upnPZtEAuTF4An5Be7wIpmFcE+BkGZXZ+3dKImZ8r0CplMNwATbH?=
 =?iso-8859-1?Q?bcPD1gPkqLAOnL8DOPTHAfyuJtlGKquUNGnX6JzFtK3wb4JQJD8o4Cdlmq?=
 =?iso-8859-1?Q?lb2CiNJ3uWZ7UcpvTdl679qo8ThX1j3rA09EzeUoZlZhD77PC4rxWtZm/R?=
 =?iso-8859-1?Q?uyiDDVSSeHxBL8I/H/1px30f7rXbA1umd985R5fY4635srNbBZaiW6qGmX?=
 =?iso-8859-1?Q?bYjOkoaTIlaKPiTH6QHlc5fFhMvBK3bMwT1F/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bBNh8fa9/ZdKURjn8gPVmJ78u6kB2QmWkrJIQyakrQm9xenEXMRkvb8FOe?=
 =?iso-8859-1?Q?1+OvuI8fy41ApTwvOAjbIMQYy/gctxuRUIxZML0UdHelYb+RcNlXyyiEeW?=
 =?iso-8859-1?Q?xA3InplBUJGPXpUXjbOhpSN8+vyO/mwBeGNxSaXqTgxyjWfZCg+1zGtk9D?=
 =?iso-8859-1?Q?PXA6enbqgrI2Xh0/UAJrHd1Fy+0b7eppebvuResA0IIMFJG2GokeeuOBMX?=
 =?iso-8859-1?Q?knQmueVzQ3FOaOm0KnLby4SdtXIyfvOCMZT6hYR+WfthUe8fANyl6JSvIU?=
 =?iso-8859-1?Q?9IeL3SsCMjBfmo4JuU188GdyYi/0tY9Zl2/QEj7OYLM+XLEzvE+e+XgHkR?=
 =?iso-8859-1?Q?LP/3wG44pZ8teA00QAyCIhvYnidDx7Lnl3hMXGzonV70rSLMZMJSwqR3Kc?=
 =?iso-8859-1?Q?7sJHPUbRyQXVZYnqge5ZoYXtqYrHdTfRrs606QCie5bVw180NT/wCgWGQC?=
 =?iso-8859-1?Q?Tf6kaz/4kazQ4o3AWnp6g8bfLHWtf6kHCHb9V2jb/xkewNgf2Vxzr3lAYw?=
 =?iso-8859-1?Q?g30evMemhTRnzMpDCdl1Wnu6k+g06XWOPMKPF3wXe6yh/8GOgMAg1syxRC?=
 =?iso-8859-1?Q?dy4WSgZm+Jgz/AUopwHRmDshkdfH3A4OQkqBNwu19gutaNukT3YhkqFdKX?=
 =?iso-8859-1?Q?bQurysHuD9W/l8QsnaTfA/NChymdTOZqBo2KneHP1SY30+0RNKaCuap3I+?=
 =?iso-8859-1?Q?M3Lf6dBxyHykbAsgzZzWrsVLZtaYV1iML/l2GBjJ8LKhnzq0+yu6nSv4Lo?=
 =?iso-8859-1?Q?65YG3rJW27udzJvFrJU/oteT7r/3fsFIzgzJm+nw1mPdgMWPhRMHDWgSOC?=
 =?iso-8859-1?Q?Sx5hFpRwTyH9op7Bx+eN67vzN6+iZSxbcBaW7efAWGYJ4v60LEga9FlQOH?=
 =?iso-8859-1?Q?HtReuB7hy+ir2sGssRiuVmb8ll7OYv0897CwS8vXOHslzd7W/dByRxZcx7?=
 =?iso-8859-1?Q?2VOZyBRJArrE44cn1qtwYkir4qVraX2Qo87s8ZO0N40NRY5+ySyrr34vyn?=
 =?iso-8859-1?Q?vQQl6mM/fV4aDpOay5ykwgja1OSIV7fRv2b89wpog9LGUl3WxmpdswV2iT?=
 =?iso-8859-1?Q?EvLAZUrqAD9G721n8H7g0ynSdhNUqSWXa8amxTopUV76ID+a1frmpe6J9e?=
 =?iso-8859-1?Q?Mg4PtW9VrlqB3Gg0CrJd21MW7KLR8Gtb83WVFx+bsMyF0e1IK+XLxzhdSX?=
 =?iso-8859-1?Q?7jSlYfDo4ZbmANUYtdIgbuyX6/u84CcEhs80hQrfhtM4fHCcIaWodOiq1e?=
 =?iso-8859-1?Q?ly2z0AZQT9DssVO2gMJeK8U4NVSKuWT7VEET35l/W0SN3lP9tBqHSGq6kQ?=
 =?iso-8859-1?Q?8WyeqOsPYA2x0W5dVykoQJcvDNJgnPZt/DnQu2t683Uygdy/5M8R2PiQxV?=
 =?iso-8859-1?Q?OOsYNec3ORGlxdqsyhauSbpHkCuHNJdVz+o4qYygD4UtUwNxJtztNwsH7N?=
 =?iso-8859-1?Q?uk7xeYg5RkvoJekLWr2GA0A50eaOjYGg4RCywbd26JHexSoYRU27C2J//4?=
 =?iso-8859-1?Q?9QO668YXgqOXwmDRLGQDnRSNDVOLHZIZWR8+sBSGITxg1XD3KZeoUPkkg6?=
 =?iso-8859-1?Q?74N7HvsFB+w/czoNF3MJ7e0y5BCIn4dLr9fzDKrmDcXP0Xu+ThvQO1Bi7C?=
 =?iso-8859-1?Q?AhqlH1OSAPxoTHpY3SS2IzEB03Ycnlw8lRfqx4e4unW15PZrwMtTvxbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a576b1a-406c-4998-a95f-08dd8ec99a04
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:17:48.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3utkMB2KOxUGS+HkWwz6dJJpIndj/7xAX92XBsRH5j0c1mNDQyQfNalZUflS0JUPBUJWFii+ecyFhwWJ6sNLArRIp02fpFrzLgRAEZA4kSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
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

On Thu, May 08, 2025 at 01:29:31PM +0200, Thomas Hellström wrote:
> The xe buffer object shrinker name is visible in the
> <debugfs>/shrinker directory and most if not all other shinkers
> follow a naming convention that looks like
> <subsystem>-<driver>_<objects>:<unique>
> Follow the same convention for xe, changing the name to
> drm-xe_gem:<unique>.
> 
> Other shrinkers typically use the device node for <unique> but
> since drm drivers typically don't have a single unique device-
> node, instead use the unique name in the drm device.
> 
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_shrinker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 8184390f9c7b..86d47aaf0358 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -227,7 +227,7 @@ struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
>  	if (!shrinker)
>  		return ERR_PTR(-ENOMEM);
>  
> -	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
> +	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
>  	if (!shrinker->shrink) {
>  		kfree(shrinker);
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.49.0
> 
