Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE4CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E9310E162;
	Mon, 25 May 2026 17:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFpnD6fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C207010E162
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779731280; x=1811267280;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zieEopXZV6Y2rbMK8aXcdyJWv0COQ4hVXy1eWRyT0aY=;
 b=IFpnD6faDyKnhnav0YkXGZhahGI8zVHQqX4woM4Jn7TgGqGB78wXaTkJ
 94IUIx8utcKAw7HMU1iXCi9+MhadzdTFKuTLZkeur4Bgtc17/vyPdXsFK
 2IX5mWEGe+whwjWz83BSaVyvKM4/Tqj9Dmhn7w18FG0lGVCGgJIKmj+DD
 djJp6pEKBbb/IgF6PsGIJOGlyxt/eY9b37n/HI2iDEWHMG8JPyvWY06lj
 vWWvzxNnuF+5nZYBnAc8A2952VVphkLc5FcuDJTJokSLaCN3zlDqfacvk
 wUVXYCb7ZlIsDXffLvDFL214xURwxK9ISZwWnZvSpYzE0nz/bsklqtCzj w==;
X-CSE-ConnectionGUID: v5kvwUsPRvuoq1dW1JQhGQ==
X-CSE-MsgGUID: BKhcyxxOTui/VhgMK+8RkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80609192"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80609192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:48:00 -0700
X-CSE-ConnectionGUID: SVYnAugeRH66cqeA/Ah6Zw==
X-CSE-MsgGUID: F5kTZjV0QZyc/RSU81uCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="237236309"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:47:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:47:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 10:47:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXuXcFM3/byouHG/EDcTQOxZhv++m53tXsMtNVaRpRIE9jJXXSB1DetRDBPW1NxiRWWC/38zV+2pUDlv0siteRUxMxgfGnZ8mBhySjc+1Y/6WgKi7tQC1fcax1nz7EjYeuKeYyYbMuNViPcLdWnL6pzkw/f5wJDnDB6KL0lxaCujGsZwRdntrIDUm3c3zvF5aaQykqQmC41LGOkK2LRIW+fIHL3fbds9Srvr9x0FI0Zzw/4j50sNf7pPCRoC+KqjZe2iaw1B15Hj+bwgX+fe+nj8rnFXLI7dWBuht/oDhItS60Ohn4kDejFWPIsL5ZurKgWCnMR5fhcTNjHqp66Lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSUWo9VBm4WHTRNE7/kOfb/Ka74WNpkJgpARFlN1NSQ=;
 b=AYEml0qDX57VNBXhwi8GAEP9wx37gZMmrlSmwBG2uxmbd1k2jifHjlkbbr5y0QYA7yLbRui77zrG8Uh1d0Fm82wO62vm22h4+3qrthkUqOz909YBDpBjOdf31+xV2MfAGBD+DAGT9xAVfQtI3joMwQ2MUNNIsHzWmPQFacSgTvm9dU3BhqD2pboVw/W88dRKj1UfOUnuA1EJW7wfzm/wEEtmCox55FXMB9OKQukxDiNpFA6SjNMeeMYQsMy4ImtKJd2n2fZ89mm0LQvh4mbQF+lXqddLWrsQmE4RKOZYXaPtPPitejGUnCLb2RwsSu0j7klPvdYhpH7wG5eK6uciVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 17:47:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 17:47:55 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/6] drm/xe: Move xe->info.devid|revid initialization
In-Reply-To: <20260525160529.15890-4-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-4-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 14:47:51 -0300
Message-ID: <87ecizido8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dd8afb-d39f-4d25-d801-08deba85c001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|5023799004|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 6Ilf6nwIzfEbf7/bSMDNdVCVWzzAIdzEPDH+PaAQVuYv1AIYy0tuxRJfMV5ZWkBB8ZHQgW2uMSlkf3AQVpP9G++bPLB0SZPBHe37+hKQ9mNRelB0mRMTcmy+2NM7EihDiUZG5txDNXgEeEymKk3yeisLMbNQim1XZV2w3ss0lPJjx2F8gc0Ba4H0A0WNrmj++IOSuDs+1vx3pTBv3VgsPF3FAH9LzWeAeGLeRDWPvrA4flsJAchpJocXVdbvlRHZjZWjDkLvQDy0CwcpknEQr9FGaa6MKbioM+ukJnGipxDH+fFoSnKkVJf5+9VlOZFKvfda56OBniniqKYjXqmS03b1pXNxuxmiSRUzhhsCucOxTSva2wYgNfw36O0on+ZHrEz/0X1d2Fcv4tL6M2yInaIAGbFcG9CnStejzHFLPoCFMJxjhnJ/baiwxWKkisObo3sH/Zn+7UKHiXR9QQ5xnlRpW9aUveJcjWibHfqm3zsX05jDBFZ/N2ZzbtIIarqFNxSJ5sPmVzDoz2J3z36I7coqlqQFJzGH2b+STC9D/x/IGTLzOcG98vIb4Oj6z2vi0D+g8DQTCChdjjtnIdecBG8eIDVbh1QsGY2n5bHpG2WTjs1pJ+TKKKjU5MB56aNYtYjSgdTsULpcsWLr7unqT5hY70NLdxvMV8tlHiway9ZSvXHrG01dYnAaE9Cwv3iv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(5023799004)(6133799003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3QjXYyUdCJbhJezhnmj7ZB8mB4Si7X5rZFX3Qf9RIWr13vM4MdMjp8fRnGCB?=
 =?us-ascii?Q?7vdCqtYZbACbHhHwQLPXnsfVZ9IVQs8M92uPtRerdQQ9BpCC7kXvcoQ3wino?=
 =?us-ascii?Q?+F/SAfICmVvVXVf1l4zm1lHMEmqrXzVHClsuW6Nlo/slJbYTGMNv2fxoUTnV?=
 =?us-ascii?Q?zSbBGIk/5xuqP0BC+cj2JCEmbWriHWMHD8w4U/qsqOjdMJe6qyUj1303l8Mi?=
 =?us-ascii?Q?2OylFZ029Q9X8hOfGZ0yGgm6KKq8J53XimyBocaVKDsnFuQ16XikvfwDZA1j?=
 =?us-ascii?Q?EZAPGRNE1hYGDhbauOAoc+cxmGDtCh04wwQfC78XWAoJvR2iFyxDI7nInCHS?=
 =?us-ascii?Q?cCQDxB4dGTKomgyOeb1GuOhFZ6kbZK1Pkq/z3nfzf/5mbYFzXoSO1VRHoasI?=
 =?us-ascii?Q?oYAyeIT/BxGPXurZ5xW5pw5enxPfpYzvcU1Wa6lkwhKI2ex9sKQi8QH5YE2y?=
 =?us-ascii?Q?CKnvfdNyEGQy1Sm+qD8S6LM0wBqKITu2UsNIjWZ356tZ+BTFAQhPmzbps1ee?=
 =?us-ascii?Q?u/4YDv1Yzx4jq0Qz4UukWmo4GRL002lbfocmDSVpizCaRKmdKaz+nsF/28yy?=
 =?us-ascii?Q?DoPjr6kdI3QpZCIIGtlIObqwxT24FA59yHv4Tu+y9HLxa8BMVLPUYjRnujNT?=
 =?us-ascii?Q?uiZv9Z5kKiCVpPP6Kxo5nk2PK/cq1Z2IMQSIfvvCr/hVGP6tB+Y2N2Ub/iF2?=
 =?us-ascii?Q?QQxeH8dkSXxqROICCKAzodDI6RuK4hRfodBRyDNyoDGh+x1FIJg4HhrP6tpf?=
 =?us-ascii?Q?a6qtoDDTVNw4ci6PDztIj1v2NnZ3Y6xsc6q7Y5R/7fopXX/o1QTwtzBWIU3+?=
 =?us-ascii?Q?8KXOaqBuy1DxFs4NVurq3TF3HStgOX1sca7Dw1zeU3S2i8gaA2dGWXIb2yhc?=
 =?us-ascii?Q?nugEF0UBf3UlvDDMzgSZ7GLY8ajwB3luKfrFcaB3m8umSFBX+hJSlytiI0di?=
 =?us-ascii?Q?rrE5GEhUCZ7XNHq7+loGCHmBpvutzvP2p6hKFYtlSBjE6uVXhSJEzj32ldIp?=
 =?us-ascii?Q?XsIk7HJ9VCXs0rKo+WmGzaAoxzNpvdsyBrJR/LV4chJN5zyU7ya2oABwUvKc?=
 =?us-ascii?Q?fI62SSSB8oN0jfLwpCpQmsshQd0RHuPaa14XJzFGGuRuOCGJ6sYemoV/m00B?=
 =?us-ascii?Q?qFsRdG34wg3hxfTzbPxQH9wOLT6W2tfN422y+gUFMQD91JKs/unVh5ah1hZL?=
 =?us-ascii?Q?zGw9aNCL7AdV90Ak2oGsXVH208FJ5iMLIPHvFg6pWiQRqcGWWZjeua1icqhT?=
 =?us-ascii?Q?OCPets7DmGoeYSW+Eec3N6HB1TLtjosWfTfV3AkVMQK4oORGKP1IOimOaHyH?=
 =?us-ascii?Q?ZpdsHKZTzOYK8eoujKB9TSz6X3/4cr8WlTpdxw5Z/8eCdolrLp3tx08HCt9f?=
 =?us-ascii?Q?mmJ5BC+mQrH9/Xymlwx/qkKg4ZMpxtGMC3nTSwXx3SC89Na/mC25WjHZTe53?=
 =?us-ascii?Q?QwWIYog8l0Q31EUks9G3GGQg4cxXt5yRLg5YwnmpIQtSS3j5heIgF4z//Jko?=
 =?us-ascii?Q?T/MVPehwfZnx6kaQ5nc4l5L/IiY7YgYRpUe4ezQMSWrNEXW9ruQfCCTUrpnw?=
 =?us-ascii?Q?J5VksFxNLHFRkG4g5G7Z0BtHM5UbX5dfWBK1+1tXoxiSxYk/Jk1C+ZkQPNaE?=
 =?us-ascii?Q?LM5ya2wWVaQ9AZDu4Di5YNAI7MGdV8iZsbS/CnHbN8uOAZJFKuj4qj1fqLWV?=
 =?us-ascii?Q?7aCxwZv3RK6nJc3tTguPej5hylZiDWJg3bTtYNqOeO4WWwEOuc+dChHoPsOj?=
 =?us-ascii?Q?OdbOLDFzkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: saXC2H5nK+J1D09zw7M+v8dUp1NPQa6epk/ig3IHkN+cr0tI4ta48taCJp09jGpH+kC6p3Xhoc7r90e2CrWqgkelZ6Ctt1F6VkGDqxWehDKwt4IkUjMgz2Whr1/PaTXkJ/58sKG/N5LXT1LmgptHamrwH5msD9wXBKgmNk88U8iJW/oi9zVXBAF4V3FkEunAgRJj7EMC5LAsQ+J144XP4iPVlqZsBWZiHxyfSFyz7rZA8a1jbQK60dBvpuUa3HYRKDZNnZWGnktuhH3y5slEG4xdmsMMzthSKiyQcypjJobWIcxI+iq5ndS81wIAEDyXa1iUndcpO0HZRoCIWDPO1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dd8afb-d39f-4d25-d801-08deba85c001
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 17:47:55.0374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K12eUNgs+o568C3S9Fb2SOdTECAawTs3GK2GuvoKLDkexv9Gw707T+2GEyAMYcy019SfaBBjOm10HIPlAJJdMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  2 ++
>  drivers/gpu/drm/xe/xe_device.c         |  2 --
>  drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
>  4 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 860409c579f8..7c3428ab4c89 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,6 +311,17 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> +static void fake_init_devid(struct xe_device *xe)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_pci_fake_data *data = test->priv;
> +
> +	if (data) {
> +		xe->info.devid = data->devid;
> +		xe->info.revid = data->revid;
> +	}
> +}
> +
>  static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>  			   u32 *ver, u32 *revid)
>  {
> @@ -369,6 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> +	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index 30505d1cbefc..46f961f75ecd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -22,6 +22,8 @@ struct xe_pci_fake_data {
>  	struct xe_step_info step;
>  	u32 graphics_verx100;
>  	u32 media_verx100;
> +	u16 devid;
> +	u8 revid;

Do we need to add those fields?

Looking through the rest of the series, I don't see us using them.  I
think we could just have fake_init_devid() do nothing for now.  We could
come back and add support for having devid and revid values when/if we
need them.

--
Gustavo Sousa

>  };
>  
>  int xe_pci_fake_device_init(struct xe_device *xe);
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
