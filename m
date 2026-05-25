Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D09ECD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 20:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A9E10E3D1;
	Mon, 25 May 2026 20:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfnivM+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769D210E3D5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779739320; x=1811275320;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WfC0g44gzxlGSY357VjsFHozo6/MK3b4iBwZfz94jMs=;
 b=HfnivM+UPjRFFfxIupMVg72zHF0zp4iZp6lLQFDBfe+azg2Y8wr65dXz
 lJGWOT/RfGc3E+KMJvZrmT6QfO9C70mGVDOSY9tMK/vf+4/zAgzAPBgEH
 xdhRI2fTbXqotueNz75dP6PWdCCZnWjZLiPETPVryCQYrUxukXGEDrgf9
 wHwU8hQ32pieNAcgfUBxG9myTNNwGDlgarp1OTj2zO+GYSnnCtgf/22UE
 r4Ys/dWtKAapMcHRdjT+Tb2iYt3fruLZlPzPTwX0vwlCCXoCGi9d4TzjX
 aurDE5i2ChCLkDzXp3sW6AuVwqadYNupH5IAnWohwRMiwh6MNK+wa4lU+ w==;
X-CSE-ConnectionGUID: ANrw7J90S/aySLP4XQmp8w==
X-CSE-MsgGUID: zsvYW+v9Q2yl5WnhXHSrMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80284993"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80284993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 13:02:00 -0700
X-CSE-ConnectionGUID: m0JoSC8PQZOvm+HOqHDQTg==
X-CSE-MsgGUID: f22jVOpPQ5OSulh80D2/TA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 13:01:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 13:01:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 13:01:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 13:01:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4icCNJYzQV3NVxzr/cGDeZroE/J+q15aHycq0bbVFFvCdSGKeQnNQ/OkQzgjworejCjqOm2qYedvTcIp2+V5FoHguIjv9Hw0+QhzFZmlgr1ukTBqpo3/5wy3OzmEh4u7nli/sRl2H1MmBd+b9aVXBZpix/lAxSbH9C5LaUgYVipFIATwVD3VjlTHv/dq3WxnxasJQ9kgToEn3p5F2ozhKgBKfTD83RL7OE9CWUGrUSSIedGaUDVSg5FxooOKfcV+dWfrzjXrdq+DZh0vqxZMYOOvpF11A8EcWIMv2C1xZUEumbgyXAL/D4FxjioBdh5lBFlfAFROIwKggETdFSLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pql1B0duKF+8NEU4QU58FVP9WkrPGTn88ZccLtU3l5M=;
 b=gQWXl9t+CAYEImC40WLobihcwrUyE7TTSkwx6fGAoeqBqoWsZ1xevMURbj69XyqQ519WqcCL4l77Wq7MnaDHRZLsTMb7fuZMpGrCOWjUG0A/X09ChZ/cA67ba16yejfFu5Ij9UxnxCfyv5ubhgLSjxhmdJS45Y1yq6IfilD0WQhWze1zZpK5HKxLHYjwhF//nKkOhqotLEBDySIE8IR4D5qJUbk+CHZs5nD9Y1ifd9P+SzIHmd52SG+LUoMmiC62GedygkTRvDvcHYqmm6gqQ7r04Mo7jTV6AUXNoX8dszdgqHxydMIc8zsEsQ08quYs4hmzYQ3Jrafj5bkJa3aB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 20:01:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 20:01:57 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 3/6] drm/xe: Move xe->info.devid|revid initialization
In-Reply-To: <20260525194109.16076-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-4-michal.wajdeczko@intel.com>
 <20260525194109.16076-1-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 17:01:53 -0300
Message-ID: <87mrxngswe.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: cd75ddf6-4e53-4b22-44a2-08deba98797c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|5023799004|11063799006|4143699003|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bhiepABEogiyDfesvot8wHPRzmt8bXdLcvTc0FMoeNjx33DEIs41opL7s04xPi4MHTi4UpzvV1o1Ts0zZUB4NYyevDrkIU/uXLSACKbXJD36gynkLj99luD9gv6y7v43/xcME27ygctLUW6sUS+MdMwGdIFAlCXKsj32wFlr8iyk1UhyCSRF8Q6ZrbS56H6JxIlIlvjhWlI1clqeAwamIHEswUEClNcaVA20GgDR8ZbqVfVSHJmA9bFuQLKeLPL+cJ0YidLE2n7PCGft71iO+qAmBxzjjaQBnYZ1v+L8WUK730NxYLK5vn4wcvWKKVH1mPcMwxtV2kIdmtz3y+pfr3YUX+kpRjsPF+FH5wmNih0jjVD+gW9+mv02iZnYgi616r3AKBpz2cFPTpVWAFU+314Y5mEUvB05E0TWNgTVgRHX9/PeS443JMammfQccn5lXcIxPVhbfykhPVcuQR3nedJsu9e337LK5Ry5RSe3g4E6+XKhzG3e/ksO+Yy0SMuqaYf9Wa94QQLzMBJfc8fW/YMKg2pH95gi0uO2+dR6nuE5m9pcYarxSviHCxqv/LB/m2qxDjSmLEeoFh5c30UmfxzQIk7AMEpXylGzTFC9pQcl/g/9vzGGjJll31z/JDl93jTk4y8jKF7G0qnRbY0kXL3R8DamFEx5era4WbNuSb2nLqftRYQyhrfpc5/tYXHB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(5023799004)(11063799006)(4143699003)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PT8xpupMF9gppzsFnimJt/OJbKW7ZZ70uy7/QRviX1ZqTVEMbcIfTzS9Jquu?=
 =?us-ascii?Q?pS6XrK+icgSyQW+Ukd+N7i4+4d1JxJKC7a6b8RsRwtBniQ/1uworHLRoytTX?=
 =?us-ascii?Q?dyz42RyvcFIYWTdF1atuFSyOTpj1Tl7LoeqT7puyLPLIQa0hq1oApD2ayKQU?=
 =?us-ascii?Q?IFPcpPdm2ddCDmeb2948zx2XTDOj8BEWnbDRZwmpivqAaqt7j8QtFOaY3AB/?=
 =?us-ascii?Q?QB0gyKLujKEnsYYW2YNFT4VJ+IfWkb3yf+nfmL0eQEcuskzRdwjNCrPOzjbA?=
 =?us-ascii?Q?MaDipSdciHBNfE4XRI0yDgm+aBDOFr34D0xW6eVgF6QIu8hSjSkCUxETatHA?=
 =?us-ascii?Q?41QOw7BoXLZT7dSbWK5vFx66nFUm+/RZiP8pBhBO36+FlDUC2EFNHeQCyhV/?=
 =?us-ascii?Q?rrzc1fVi1yHiykXsw+Ogfzc4WW1BSuxxD6q8sqRnFnUWxeZukME3nDiPXLgh?=
 =?us-ascii?Q?i+tHy+IuWAgq1M+0gAK+HO3LxyQUprhFKqCicqoFT5+5CiJ8b491ChPh0Qz1?=
 =?us-ascii?Q?OKY9YclGacogoWN0oTGcmdjJG1THT1HjcW5sIE9lxfty+2lyIQ52pcMklPXs?=
 =?us-ascii?Q?Gi8GgbZRzjpy+5d+QQHWUadcSiCpkzHVjj6F3YZnuMZS0PTPRUlhShc9FjNM?=
 =?us-ascii?Q?NDOWVsFq6woozh7cV+lPKjtTtoj0M8+Z0gkXMX3D6zcAyEmhh9E8ZV6BZ4DE?=
 =?us-ascii?Q?rCVUvZSNcwNQV3mwJ5p0VaVoV6NC+6WHjUBrtl9zHC+xxMwZeq5Kuhgx5dHr?=
 =?us-ascii?Q?Nxm+HwuBaZtGFiepEj/88masktPmwo0d+he7bVqvjSQXoW9SIgFVjyXWlU6r?=
 =?us-ascii?Q?n1peydrGmhNYXli4GsSXI2BOXTiKUhVb4f+a7++u8g3YIJh2Az4SvYbeQSmu?=
 =?us-ascii?Q?4gz9I8qxQImGyRCqf0/ayzyDKgWATThs050E907FGtnRrHwKD9RbFyVyg0W3?=
 =?us-ascii?Q?VFmXaILTefXX04NEq4VyiOAJOynLP8PHgmva0S4QA3gzS9pFLw7kAL9VqCOV?=
 =?us-ascii?Q?HVPaNdqs534e4fhdr2+I+jzPEOJ3ncmJoA4OJ1PUT18pXxh8cZwMvjpf0HX1?=
 =?us-ascii?Q?S/wW5smIEgdLuXRHeCfimHbxInD5WRog9m6UE2/UhgV5MllH7y0H+ECF5C6f?=
 =?us-ascii?Q?p2S8OAFC6LtfYjkx8tc2c5TodsqPZXYedBrci/FCOoPRnOjympcKew2RUNXa?=
 =?us-ascii?Q?rI/J9VgDDaBXHRUVs2qy1TQ+pNNglzBR0yMKXHGXfasQouijVDBJF28YvAcD?=
 =?us-ascii?Q?UbYIK1QVFcx6K2E5CbyIptCzYXjG50U/9Fa0b21HdA3ENeDCVjiAROxL+2Ia?=
 =?us-ascii?Q?JQABWgx+FKplZkCNJjqCEosOCf4CtCvQi9PJUL5c7DYJguM0rgV7BPHCcqUI?=
 =?us-ascii?Q?y5rr8WL69YfAb7tnmLn0i6ujIZpAobQJVgnlEXdkNhyMrGuqvzm48wT2L9/g?=
 =?us-ascii?Q?bBq9QoFuNLgLYYCOCZ5/XZpHhX7cXUSUt5VNfnyXf2aAGd0dhNlbfCEqD+qS?=
 =?us-ascii?Q?P+cAVJqNDgAzF4gNtzxJDkTdLD36YDQKii/auQ15yWufX+xkMFGNwCjuacAB?=
 =?us-ascii?Q?xcspnLbMWK1ZHRJDgPhLmMiszuQxQyszZZEYIQAAfUcF+DTutKIyIRzK+uGd?=
 =?us-ascii?Q?iyESfd+yhPnAszTtiaYng/cDfyWlzu8YzflBByvyxM6+7DegeJUVBpXlWldK?=
 =?us-ascii?Q?N9Q0yJcPmyGp1Jjw3QkUwvvUuDMwvPwBGFiBgYCo7GMw0QNgQrxxvtYaVMOC?=
 =?us-ascii?Q?OEvg8UpQTQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Xosms85+z6rT6QfU8rUgGSqANPYL1nKAPQ6S8nqRWW0oXbnCj5Ek0OxOztz9wyU6aPWNwuukwqLXsnFqaFz4xAz15sbUnTg4xOWKl3NH7Sueh55oKiEXWeUntAPBmPvI/e1xe1vbLKoqmYDvu0+hnhUrOcCZMPcuQ3WNqQuVNdcxTgfMeXIIMYyL9yFfW1G6eR4hpiQbKHkGi2kbVUa21qcwfVRy/Qq7guchhb9TUn+Gw05kopaVqWesqscG3lzgsC8WTabHxBqQDagWdJoF9e7usRFhFiUh5okZhfGvCSii1uXvf9zWjD6NwUiy+KKjHR8btWCMwZ2ZisJZp4OqPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd75ddf6-4e53-4b22-44a2-08deba98797c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 20:01:57.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7gw4aB9dzBqJva5PDgbvfZ51SAHtJTagCws4UhdOaNgbhsQ1vLConjRFlBrDN9Nowrp/WI/cMcxYVjBXjTfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> The xe_info_init_early() is a place where we initialize those of
> the xe->info fields that do not require any additional hardware
> probes. Move the initialization of the devid/revid also there, but
> to avoid breaking the kunit helper, which also calls this function,
> keep their initialization separate in sub-function so we can easily
> stub it when running the kunit test.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> v2: don't add devid/revid to xe_pci_fake_data (Gustavo)
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_device.c    |  2 --
>  drivers/gpu/drm/xe/xe_pci.c       | 12 ++++++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 860409c579f8..9240aff779da 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,6 +311,11 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> +static void fake_init_devid(struct xe_device *xe)
> +{
> +	/* Nothing to do, just keep zero. */
> +}
> +
>  static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>  			   u32 *ver, u32 *revid)
>  {
> @@ -369,6 +374,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> +	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cdc7e0935c13..b498147dcf61 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -521,8 +521,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	xe->info.devid = pdev->device;
> -	xe->info.revid = pdev->revision;
>  	xe->atomic_svm_timeslice_ms = 5;
>  	xe->min_run_period_lr_ms = 5;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b1f5f0098f26..6b1a4cb7ccb0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -727,6 +727,16 @@ static int handle_gmdid(struct xe_device *xe,
>  	return 0;
>  }
>  
> +static void init_devid(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
> +
> +	xe->info.devid = pdev->device;
> +	xe->info.revid = pdev->revision;
> +}
> +
>  /*
>   * Initialize device info content that only depends on static driver_data
>   * passed to the driver at probe time from PCI ID table.
> @@ -742,6 +752,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
> +	init_devid(xe);
> +
>  	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.va_bits = desc->va_bits;
>  	xe->info.vm_max_level = desc->vm_max_level;
> -- 
> 2.47.1
