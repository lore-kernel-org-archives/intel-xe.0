Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144DCD33990
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 15:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E2A10E4F6;
	Mon, 28 Oct 2024 15:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOTULkHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD5310E4F6
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730129669; x=1761665669;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5miyJtmNaFDkmo0fUqWfZKmeGzsecNoMX2RH0JMmQPs=;
 b=fOTULkHiqVFe0kr+Yj1iNMEOQ5CjLj4MqNLXPDbjLi7aZ+y6vHLDK7I8
 0tVCb5Lax7hgmUy45w3cxK74TEa98nhJuc1FuGe1IHOzVFdFqbOkK/PUy
 aWaJi7cMc2FyDeVe+kl8LpVQH0nMFozfcog+QBIcj1Hs7YJG7vodd+65S
 CsKkIO1oWBu2MMwh5Kh2OzuXJhMApPtl2KDbQUktm2pGEOvMNYuYG1cR9
 08kC8AtAMN4521juv06jmO9CHRVgFwWgZdKHJ+Dzm/eUZcfTtJTjvV3mQ
 oxWfS0XIL5rVjCbiE3ksT1SkPHk0UvfxtN7GrwjATn9Zc23QTm6rb75d8 g==;
X-CSE-ConnectionGUID: s0FKvsH2QSqHGcvWlhl8KA==
X-CSE-MsgGUID: 9lMllfK1SO+TV1fZ3dIu1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29503700"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29503700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:34:28 -0700
X-CSE-ConnectionGUID: qzXCRtVgTJ+3JW+x1DSANQ==
X-CSE-MsgGUID: 5bM/MFWZSvinu45Mf8DEgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81811344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 08:34:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 08:34:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 08:34:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 08:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHSLJPGAM9x+Wtknvsf0XrKtEVsWMI+41YS6UBCftW6l0LdeJnBuxURVxbikA/Xz/vPRC63FKCY9DT41N/XrV+jIVS4ht1+/mgCyK8S9Uk5A0uzfDWnHzLvvgfeaNPNvsLdNWFbfYhpiP6/WpbfdGIq0rUeo2GdLXoP8Zd4BbKYoet5ZrKzkdAab5ggNnDilyiEzsgDdK9X2/V2NjJkW6L4rWRcNZLEAToJQJNQEMfJno5t2lJMmVsXjxzsjMfwZ8k/T4PiKadv+Exin9IJQ3I3bnjt7JUytOh0s+BmOmeQZPlLNX3wUae1shaDo05GVlR5Uggiv055uuxin9DMRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMRi0xJwUylLMYJHNFIxC3IsRka1akIs7WmtXwOHr24=;
 b=xb1C1ZScZoBGoby8XXTbL/OZYAjUqDKG5iOGYlyEaFLBhy5QvTw6BnCGhY85G3TYCeBWjSn4z7dcF++mFOi5MlwqFTuxdGewuQyOuaLYeCRk1E0k1aOdWz7Z5jke5DSN9R/hNcNS3nkd9Jwpz5R764bygNYYwbyuLgTMDOTMlf/v/oCr84UNazwYwaMboz5S1Q6wCw1Zg+iZiJIWV/ujzb1sqSKKcAx7DU3heKhJlE2GT4iKDmFov62UvIMlc8ZkJOkXEKVNq5l3Kwo+PW3AF/fOc0DSDjK4VHaRWHKPOzAS/ikboslNDI/oeERGdszNHIfHuC9exqZ+4dhhGEoZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 15:34:23 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 15:34:21 +0000
Message-ID: <ed410381-ebc8-48b7-afda-431a46ccfab9@intel.com>
Date: Mon, 28 Oct 2024 16:34:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV
 definition
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
 <20241023231152.1815-2-michal.wajdeczko@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241023231152.1815-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8378eea6-5c91-4320-d72a-08dcf765fe8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU5KRXFmSUNTUlRPVW1WV3c2bC9qWGphUlMyNkY2aDhNVG84UjlXNFJOTHcz?=
 =?utf-8?B?aEtHTWFERU5Ud1ZXQVZFbkUyNzFqeXlZWW0wN0tOR3lpMmh2a1BTbDA4UHN1?=
 =?utf-8?B?c1d2YlpHVytQZnVNZFZsQWRPMlp1YVpSNm1rR05PTm5aUm5XVlF6TVF3bVF1?=
 =?utf-8?B?ajY4QWFLei9RVWxzbjQyZEF6cU0vRGRjVFlURzByNVBjTlBMV0dUbnMvRzgz?=
 =?utf-8?B?T3lHYkZweWxqdlhkOGZZamFVWTRreU9vRndhcGJ2WlRzbFErSE9HRy9JK0k2?=
 =?utf-8?B?T1JuSkczTXFRV1VOcmM5Tk9MOVRpditBazA5Y1pQYlpQOGxGbjgvN0hkaURu?=
 =?utf-8?B?bnhYam91d29EdVpjQ2FPVmU1Y0hJUVZCQy9VclhEWmdsQVRJMU9wNE0zb0lF?=
 =?utf-8?B?VThwSVZTUk0rWGVkSERLYytuMEtuRThPVXZUcXFvSWNBL1NqZEc4YlptZENR?=
 =?utf-8?B?UmxpRkNDa0VyMjBJOUUwZGdONDEzcTU3UDQ5czJxT3JPQXNxaVJ5NXBKcEY3?=
 =?utf-8?B?Q3ZuR25YMUQwQklGWjRJTW9tZ0pxVUJpOHlkOWRkTE1oSCt2Q0VjODU2MXlV?=
 =?utf-8?B?Q2UwcS8zODd0eTdSVWRLT2VpR1pIVUNCMWlYWXplNlk4aU1LZ2s3M2U5Q0dz?=
 =?utf-8?B?RVp5bkVzOUpPaExybFJ1V21NWmV6LzNGRVE1VXA4MC85cEJtV1RtU3R6MmY5?=
 =?utf-8?B?Sm8wS2ZGQnhaSUJXb2p0NlJmbFhxNFdibUkvRDl6dlIzSEgxd2NmaXJEQ3ZI?=
 =?utf-8?B?amlROFdJbkxKTmU1bnc2c1A5VnloN3FtR1F1QmNzTU9hc3VhR2JocXptSUFC?=
 =?utf-8?B?THBDd2k0VGZXcU1UR21BM0h0UzYvM29YdW5YTU1sakg2VENjSC8vcW5nUkxB?=
 =?utf-8?B?T2s2U1BOcU83VXB3WkxYdktuU3pBYWwrQzRZQWZ0bE9FZ1g2ZEhNcHpINXJ5?=
 =?utf-8?B?N1BMQmdMRmwyNmJUNzJaV0svV1grQ0Z6SnFGQytLUFd6QlpueWNOSW1yc3Z2?=
 =?utf-8?B?blJhQnJDN0dsNUJKN2dFbWw4MzZuNHZLOGlyd2ZiVXhoaHNqMk0xK3lXdFhF?=
 =?utf-8?B?OU1QdWgrL2dyMUxyei9JTHFvTDhIUlU5Zlpzdko5SGR1VGo0YjVMdHlVam43?=
 =?utf-8?B?dy9DSEFDVXlXTmJlOG1ZMnRsR0NFenpSTWc1cnJ0MDJJeExzTGNITGJ3SXRq?=
 =?utf-8?B?Z2dKZjdSYlhnaEgyUXpNZFU0WDdBZ3VVTW9nQWk2QkQxTFArNnYzanErbXpW?=
 =?utf-8?B?Kzl5VjNybkxHRVVpTEZGVUVoY1l4UUlRdXVqTUpzOHZ4OVZSNS91NW1ld0RJ?=
 =?utf-8?B?SHQ2cWVEUFNYVGUzK205NzdqY0lSTk1Sc1BqdjBFU2RuME5Qbmp2OHNrQTFQ?=
 =?utf-8?B?bUI2OTFrTmVDUkdKa3NDYWpCN05SQktuaUdTVVQ5SEJFOWovWDlHZVZGS0Ez?=
 =?utf-8?B?UXJDUlkvZXFWbDdQbDZraktkNExTd1lUamJwRm5aemZEaE92QVIyWUJodjBn?=
 =?utf-8?B?N3dLQzlzelpDOEN5c2FvT1VQQ25lSnU1NjZEa1QzdWM1L0dLeHQ5T0tHWXcx?=
 =?utf-8?B?NTZoSFRNK3dObEp5VDZZZHgzS3o0dUZMcERZRUFSdmFVL1Z6WHd3YjBxc1Vp?=
 =?utf-8?B?YlNEUkpieEhzY3d4Sjd4S05pVzAzRC9nUWh6dnFRLzBFdmQzZmhpOXY3eW1F?=
 =?utf-8?B?VHZoSHJiZlRtN1hXU3AvcGFaeXJ2MWttR1FhSFhhbUZlZGNTY3RDZFhKa1Iw?=
 =?utf-8?Q?E5cy6DY0ivwMeIbxuw+aXtgBtjcclPm5jM9Xp02?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VLWnhsdnliZHo3cXc4bVJxR1FXcGJpSERhM2hEUUtoZ0Z2eEREUUd2U3hL?=
 =?utf-8?B?WVkralduS2xHdzNLVjJRV3VMd2FQYXZkTGxncWprWFU5NXVFMktrZlp3MWkr?=
 =?utf-8?B?OUNpWXIzckgxL2Y1b2VmZVVUOFJGQnFmdDJGT053ZVhwamg1VGZkZ0ppQVpV?=
 =?utf-8?B?SEE4a3FzZll5S1VXTSs1YkxFYTU0eXpkZGhwaUpYNmRPZ2dCczRoRlVScGh0?=
 =?utf-8?B?L2JkdjRMOGdrai9aRzBkaGxWZEVsQzRRdFJxdGFXYlZDeFJSYzdreDUvS0dp?=
 =?utf-8?B?ayt5dW15QUZGZmtmWDlrNWFPa28vKzJrTERsVWZ6WFA0Q3F4bDlVQU50RHJI?=
 =?utf-8?B?MTE0OGo4UE8xYTRlcmk4YldJc3RVdi9vUnVidkY4QjRXdnRwU2djdzY0azdh?=
 =?utf-8?B?WWlJRWxJVGxiM2crU2U2cVFrOWpTdGVBdGV5OTlnRkllcDRZUGViUWdOS3J6?=
 =?utf-8?B?ZFFENkY3bjA4aXkwRFJ6WTNBemFES0pqcUg4ZjlSaU9kZWwvdGxOYjdVYWx3?=
 =?utf-8?B?UEpEMk1sbUlFZU54aHRjQU9vMEVQdjBGcmhSZDVGditOZlNvTVMrSkFMcVcx?=
 =?utf-8?B?VnBUSkttMW5JV0huZ1IvbUIrVVo1bmtXT2VzMW54RjN6U0lLRHNsMEVUdlNh?=
 =?utf-8?B?YmNkbEd2QkIxOWhHVmtKSE9yTmduS2pOOS9FVjhBbkF1Y1FLR0QvWHY2Uzlz?=
 =?utf-8?B?bG5PUGdQcjI3WVBFOVdJbnNpZmgwVG9hYUF0b25HaGI5ckZ0VENGR3kyWjVN?=
 =?utf-8?B?T2U1VnlqaENTME94WjdQWlJCSGJBd2x1QU1uM3lNRjRXV1ZZRk9iTjcrUWRI?=
 =?utf-8?B?S3d2WjZKZXBnNkpKUDgrakxvbDFoSml1Y29udk9CWkt6TFdEN05jNFRWTlNJ?=
 =?utf-8?B?dUVOMDJ2UjVTc1pBaFRDSFNZdnpOSGJaKzlWcDJrY3FVVGRkYkx3enJxS1dz?=
 =?utf-8?B?YzJZN25LcjdZMXpmTTRzTW0reGFKTFE5OGtTd2E3TnBKUTNrV0N2eFdmOGN3?=
 =?utf-8?B?b0tXM21CY1RJMGMwMU9jREtSU3NqYTYxWUNla295MEM5bkR2VkFTQkE5NXdG?=
 =?utf-8?B?YTR4UjNKMzV2NlprY1NHbmJqVFNsZXpERkk0RWdDZXloMTJ0bzhoR3Rmc3pU?=
 =?utf-8?B?ME1GVUM1Q2toM3k5bGJYRk1OeWVGQ1ZqU0tFRDVBeURKN3JmNm9SRlYyandK?=
 =?utf-8?B?OUpzdnVpTHFvLy8weVZTSWRyT3prdlJPOWtmY3JFS0QrNXdxcFMyVlloaG40?=
 =?utf-8?B?clFBOG5TMEs4VzRNNU5jVjFqZFVCQVpCbDlUUFZiMTFpOE81K2xTc2RqLzYv?=
 =?utf-8?B?VFZpT3MrZ2V3dEQwYlJwVTRFTk1NVWVIWkpxdEwwZUNWMHhPL3RGNDNOMkZD?=
 =?utf-8?B?Qi8zZkhnaGRFL0o2MStVbGg0RzExcjFFVHo4dENwWUJYaEpURWF1a3VSWXhX?=
 =?utf-8?B?dnFhdEErWHR5MkplcW1lQ21NN3FadXpRQzF4bWw1OHZiY1UvNWZra0pWamRT?=
 =?utf-8?B?SC9pN0JNWXNWSXN2RDZXRDRlMG1nSnFUbzZLWlhUUDVaUDk3clFGWHZpeDZU?=
 =?utf-8?B?aE8rT3l4TXZaaDRlRXFIV1dWa0VRSzk3NkkxUzFhOEhqdktiRHVzanQrWW9P?=
 =?utf-8?B?c3RFSGcvNU1aRnpMemlnNDlhL0xPdjduUmVuQXhCNk1sbHJVZ25wbDJaN08y?=
 =?utf-8?B?aWVPWkdac0VobFU1MzRLS0VvV3dKcGJ1ZWF4QlY5YTVkeEl5Q2NiV3dISlhk?=
 =?utf-8?B?SHVFejJDYWF6ZTUweTNYV3JJZTR2SldPci9kWnRYa3Fnd3VkZU9VMnZBU29i?=
 =?utf-8?B?T0w5TS9mSWYyMXorQyt3U1B6Mkg4NUVKTGh0R2RvNkh0MXgvVVZEdnovZWdU?=
 =?utf-8?B?K21pRGZmTE1xN2RxaVBkem1OV1BXVHlpWm9Yc1ljK2paRGJPTGs2TVhWbmlG?=
 =?utf-8?B?R21DOFdmY1RjWmNySmJranJnN20rK0x1enI0V2ZFUGN6NWNwUnJZaGlpdlJu?=
 =?utf-8?B?emxFS2xEVm1xeXhkM1lwS0JtaG5QMTBsU3hQbEJlcWZRaU1NSnM3VGtIaTA5?=
 =?utf-8?B?Q05lNmxQQW8zV0VEVXNUeXNJWTVYUG84cGhvN0M5SlRRek82SElnVDJVWkN6?=
 =?utf-8?B?dndlK3dTVzVWeWt6Q1VmajNRZm9GU3hYYWRLOCtQZ25zUG9iNjBYckZNWndy?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8378eea6-5c91-4320-d72a-08dcf765fe8b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 15:34:21.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsEiG9nK/7cg/35LZc+fpgdb6WRox9650CKZLpj0jeoMgIvSQqMxm0fCCW4bmCYKwDaWUpDK/ZaD3oVr9JCwNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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

On 10/24/2024 01:11, Michal Wajdeczko wrote:
> This KLV allows to set the scheduling priority for each VF, also
> for the PF.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 37606cf8cc5e..674f1afe38c8 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -291,6 +291,13 @@ enum  {
>    *
>    *      :0: (default)
>    *      :1-65535: number of contexts (Gen12)
> + *
> + * _`GUC_KLV_VF_CFG_SCHED_PRIORITY` : 0x8A0C
> + *      This config controls VF’s scheduling priority.
> + *
> + *      :0: LOW = schedule VF only if it has active work (default)
> + *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
> + *      :2: HIGH = schedule VF in the next time-slice after current active time-slice completes

Maybe worth to add that VF is scheduled only if it has work?

>    */
>   
>   #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -343,6 +350,12 @@ enum  {
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>   
> +#define GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY	0x8a0c
> +#define GUC_KLV_VF_CFG_SCHED_PRIORITY_LEN	1u
> +#define   GUC_SCHED_PRIORITY_LOW		0u
> +#define   GUC_SCHED_PRIORITY_NORMAL		1u
> +#define   GUC_SCHED_PRIORITY_HIGH		2u
> +
>   /*
>    * Workaround keys:
>    */
