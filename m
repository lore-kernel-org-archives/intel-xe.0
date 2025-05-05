Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2105C3ABB6
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 10:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ED710E076;
	Mon,  5 May 2025 10:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTjN+ZXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C4310E076
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746441726; x=1777977726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XNJd9RuE9k/O5Wl5xFDikzhbcmGaVKkD0fhmrE7Q0G8=;
 b=YTjN+ZXLvm24t+wdIblj3eeWZG/xOzJmpu9O/T8cS6lzJ8UUIB7Ey10D
 IifgqogGgX9T2rBMTY9NgXfupS5YpXRryGVsi0jo8tEzKlKAIDf0Mwx8g
 bPPsT0k0TgoLqj62wJC4j0AA8uVb8kF4xoiM2UfKBc4e8hmlz9TWXSbHB
 znW2/TUfIe5ozBiF3dC+MIDi6xKyVXSOONIw2r/KA90+hvXmNq3bgOUGE
 yp4WdoIGX62TG63VrvUKYPrM/8VvRAA/JqoOu6pUwZqzL4xxfPHHd2DVm
 jaApxQRt5/azn9LK/QqpLFuyHinZdsuXkHQH9TiDgMqZXkxxlMLR+9CZ5 Q==;
X-CSE-ConnectionGUID: 6sVTmSL5Qeq3+vSFA0lG9w==
X-CSE-MsgGUID: BM/9QCQsRW2fO5rZzwSiTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48054844"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="48054844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:42:05 -0700
X-CSE-ConnectionGUID: qY/8TNY7TW2+aRv8uQjG2g==
X-CSE-MsgGUID: fk8kyq1wRby3Mn3TNQ9FSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135731099"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:42:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 03:42:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 03:42:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 03:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK385wdRy64Vifqihg4uubHtcruEcGw7X3vylsoxoX9GEIkxakG5Vkmgf143DiRZAcef+Mr8BykdnOKayPp60bJjYf+EylhgrDjsfj4uXy5ZXKXfMezW3AEpy55Af23Y54Rq8zq6iF2lvaKmXlWeZ7df8m+w3GfsSqNm80zZeQZ3Vg+HvxUd1BsMZ091ePzEwI/yy8c0U10ZjRgR4R3U5zSj/1EoTTIwN/6QDbIsi9t8FhcddqY38wGSs1jSLjAq8brbbUZpopfp/B00KOKmA8bg902LDsBUYQ1eErFGhBWAhuBJZIwMvtvm9VTHPuqAviNB8E8ADfhnSaZZCpCvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lY45bijD6eJcDx86n1d+3YyajJE/ggTwHACROZFl2E=;
 b=W6hivSBp3T/iZQaSQYa1JFCtXHayRx1Jy5Apt7Nrx0tVGaNcc5Sl36pbQvfmdK2Fz/DlkObP0NFvRyyGK/NZHMpcYs42UUYUBY7MH4wBDs91DlTBOEXYDcNrTRViqWv04V0zi4pOOoEG/ciKcB77XVAaHDNno51GF8Ydqhsoisg2suwu54t29LoLyHpKPa6MRMrWtnH//9hAsog+Hj34UtzBJeLxinGzExm/h14Vcm7bIkU3So+ieGdrgK5m2xUq7YtZkclE7veEN6w1dnbPNEicgZSmJpzBxfPkNcdgfXtzAUh1IsXnvNgbLHFhpjK5q2grVCsDKY6NmO4P1X03Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPFE9E88246B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 10:41:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 10:41:45 +0000
Message-ID: <78301d83-5655-403d-ab33-4d6ff34ea4ce@intel.com>
Date: Mon, 5 May 2025 16:11:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/hwmon: Add support to manage PL2 though
 mailbox
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
 <20250430203607.926585-4-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250430203607.926585-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPFE9E88246B:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8ee2c8-28da-4ef3-2f67-08dd8bc16e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTNoc01XeFlUSlB0WEd0eUlWU29YWDZKc2NWOFk4ck94bUVyYWVWTDNFVXVU?=
 =?utf-8?B?TUVCL0dtMW92OFdXNFJRQ1NaVDJaeTllcmhzVURjbm5XZTcyd3QzcXp0OVY4?=
 =?utf-8?B?VGNFZGdWeE9hU0xxSFBMbjFJcXhjY1V4V0xUK2dJaFRvakp2YVIzaXBnbmVn?=
 =?utf-8?B?WjRkT3Baa3J3QmIwMElxOXB3MXhxNy9xNld4dURzaGtpUDJ0MGtMenU3Tm9j?=
 =?utf-8?B?bWlwNldBNHRTaHU2YnBIRWdQVDlkbWNLaXc5WGJEQWpOaUlEOVhaZTcwZDV1?=
 =?utf-8?B?aEpXTTl2dG9HeHBCalFKd1dNd3NYTWp6VG9vWis0R05qYklqd09oYTRhR3U0?=
 =?utf-8?B?S0p0MExEcTdMbXhMY294NjdSVmo2T3lPd3VLTEtUaGFhTU9SdGNUUFVjazdt?=
 =?utf-8?B?OHV2NWluN0lnM3ZsU2p1NkFEK3JSNVE0Tjk5amxkWUI1U3dzMTZLM09XbWox?=
 =?utf-8?B?TVltb0F2ei93U1N1VFplU2FHODVBc1g5M21ycUxGdU8zdE0xbW00aGJEUGg5?=
 =?utf-8?B?aWZLRFM3bjNiUVo2SlBNVFkzM0R6ZnVMS2wzT3pkWmFCc1d4cUcrRnl6VHNr?=
 =?utf-8?B?SU9EdEtjVmdkaDFVZXhRZlBKdkxaZHlDL3dVKzVrWXkyblYvQXBKNzBiSmFv?=
 =?utf-8?B?YkZldXZ4TGNSby9wNi8wanUrMW1qUXI5WVJDaUI3OXk0b0hJcVQwUGg0cnRs?=
 =?utf-8?B?RTZYYUhWQ05hSWFPREpLdDk2clM3S3ZWVlN4bDZjc0ZrOHJiaS8wcG9zZkxx?=
 =?utf-8?B?SW9UYmNhaHpUTEdqK2NFZUtubzErNjhIV1QrN2Q1djQrU3lIS1RZajBqOXVh?=
 =?utf-8?B?NnY1U2NmdTBQZVdpT1RrZVc0aCtEd2JqUENGZjh5UlJ3Ri94ZG44S0JxcFYr?=
 =?utf-8?B?RHd2SU83dzhHQ2puSGhkVThGTE1BaS9qajlPWkhUbmw5NlZ2TU5sL3hnby9k?=
 =?utf-8?B?cEQ1VXVHT0pYV2hiR0xLaURCc3JuaGx4R1RWWEFodGh6TElZTW83aVIreVVW?=
 =?utf-8?B?ZlIzTmw0aXpMZE1haFJlbnBkSHIzSEdDbVhDSWdnTU05b05oMzF4TFpOQThN?=
 =?utf-8?B?VVd0RG9GUTlyYjZTOFZrM1ZmTHZ0bVBnNkxqSDRZajBERlhqNU5ldkJ0c2g5?=
 =?utf-8?B?YTBGQUxJYjBPYmlObFNzL1d0eHo3TW5tMTVzT1V3M0x2cFBocmJtQ045Ryty?=
 =?utf-8?B?Skk2TEJRNWpVTFZubXdJSjUzY2N2N0t1SU5RZGgvVU1wVEVqQS9nR01UTlF0?=
 =?utf-8?B?eW5QSVo5ZmhoWDJWcDVvc0ExZllkMnZSR04rQ2VJL040S0hRK2w2cWlra3Zm?=
 =?utf-8?B?aVRiclFNMTdxTGEwMVMxM2VYa0xPbk1EN1lyckg0QU5tYkFWUmhSWWZDOTVl?=
 =?utf-8?B?NjdsdnpMckFwci8zekZSemlzVlJUNjNpbCtTUmJUOEtCa21NTXk1Smd1SklL?=
 =?utf-8?B?eVBsOFFzS1ZKcnoyeVYzYUlkeVFxditUNG9ob1lRZHBtY3F0L0l3ejh2cU5W?=
 =?utf-8?B?cGxXNGI3V2pJdlJLSDIrQ0RZbnNxcUFKRG1mT3E3Q3JtSWxqRkJ0NGhwaDl5?=
 =?utf-8?B?RitHRlFOcmZON0g5SVZpamJKaUV5TXArdEpyd0x6QlRTbHl5RlNTYVp6dTNV?=
 =?utf-8?B?T1V5Q1ovYlNQYkMyaXkrOC9zMkI3ZFNwUG1KMkRmTWVlb3MzQWpJK0NENmNN?=
 =?utf-8?B?V28yOTRENlE4NDFwMkhUbHQvTWpvcitzdk9BaEhXOXQyUGIwbHU3TGt2MWNH?=
 =?utf-8?B?aFlpajNMK2FzOXM0Z3JnVGc5R2FOWDlGejZvcWxnM0pNaEt1YXZmNUVCRlo2?=
 =?utf-8?B?RmlSSEJCUUp6RzR1UnFpcE8wNFhxc1czOVpCQW5WZVpiTkFZMUw2Nlo4YTVw?=
 =?utf-8?B?NERQRkYrQXQwYWFxV3NCbUN0bUdpc000TG5IaWFpeUVtNkFSQzQ2NnRvSjhT?=
 =?utf-8?Q?Bgs3sGViKYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGNuanE0ME1KTy9IWG85aFUrc2ovdnZFOVRzYS9oQUwzNDAvUjJiYXlHYXVL?=
 =?utf-8?B?WkVTcmVlcjlnSzMrb1R3R1N0QmRHL0Z2S1Bad3dQSityWGVKOUZwR0hDQTZT?=
 =?utf-8?B?TjJFZHNBU2FJUEEzVDJVVWhKRzUvUVdhdFdsKzZqR1BWTzJnK0VIeEEvVThQ?=
 =?utf-8?B?Q0RqeXhOMTVHRDE5bVRLdGRNRmxwUGxkSEcraTIwdTdYNllmQjZLRHVHb2Zi?=
 =?utf-8?B?RUJlOEczZHpHdFNnbzM5QzNxMHAzQkdMb3Vra2phWEZNaDZLWjhQNk5ZY2ZR?=
 =?utf-8?B?dzQ1djBzRmxRKzUyakxRTHdFaXQvcDluNHBEQUliSEpZdDdQZWRoY0hXdG14?=
 =?utf-8?B?V3NjV05XbHp0WEFvbnFwa0V4aC9DS0s5dXExemtjUW0zODczSXBHSFNkZFpQ?=
 =?utf-8?B?aEdXK0pqcmFsNTNwdkNqcnB1eWZGQzlobERjZm9lcERpUitLV0x1Nzd1WnI3?=
 =?utf-8?B?aGNHcFBmSHF6eVFCTVdUcC8wSU53anBpUlNiRFhINjhTUks4ditTczFLZ0M3?=
 =?utf-8?B?Tkx3dkF1aTFrbmRwOWc3MjFJVWFRbGN1L1F1K3BTbk9QSzdzN0pxbksxK1FP?=
 =?utf-8?B?REdycUIvdWRQWks1UEpKQ3pJeTg2TVFySFZId0V2RWtrU2dwcHpxakZBYkRU?=
 =?utf-8?B?NnhNa1ZnWEJvQ0d4aE50Y085b01Fa2RFNFRabkk4WHlNQXI0dUo4M2FNczM5?=
 =?utf-8?B?VlU1NGQ0MFNkSldnUVFScTZPbWJLM3BvQXNxV1ZuM0QrdFlHbmVONnROWGlG?=
 =?utf-8?B?T2dqMGdoYW9hdWZ5NzcrVUZrRFZsMlRObytTU2VTallqNitBQ1U2R1RvTmFY?=
 =?utf-8?B?SDg5SVVNM045QzgrWDdON3FrY1dJYTZUS1hGR0ZQcTlGZXJFVW5PNm12TG9n?=
 =?utf-8?B?elZ6dENTbklLTDEvandncU1BQlI5SGFuMy9jZ0ZZb1V2Z3BJa1FtcjhEbU8z?=
 =?utf-8?B?dTZqNlJWMHpra0RsMHpXVHordWQ0REppQTRkaTRlV0RreUZFV1RwR1ZvVU5Y?=
 =?utf-8?B?b1o3cUJ4aGt6bmRudDN4OG8vTTFZQVhsNDNUeWV1aG02eUlBYjgxaitack9N?=
 =?utf-8?B?cSszYXh4TWhFZDZQZzZtbGFqQm1yVFI0b1k2d2k4MUdkOGlLbjlDVGx5VFJ3?=
 =?utf-8?B?VHdicUxJZm5yeEkxYzA5ZmI4cHhDUE8rdS8rcmx5S0M4cU05QTVFTkVJRUFt?=
 =?utf-8?B?M3F1N2I2MnhKRHNRVjNtMjNHTFN1dTUvelVJN0xTMERyY1d4eEZDblFQbldp?=
 =?utf-8?B?QVpUMU1vNXVpN2tVLzhlZ0REWDdMWHV4T3A2VW91cCtaaXBwUEtNanl5RUlj?=
 =?utf-8?B?TENQdVZIek0vZ1JXNkxCamkvTlRMVXVJUWx5U1NZZEZlUmRVM25iMnNVRDdF?=
 =?utf-8?B?Z2IzT2ZyTFBwSk1rRXdrWVgvYlMyQVlQbkhlTXdRL2ozQy94NU5Kejc1N3p2?=
 =?utf-8?B?cVUyR2dIRFpla0pWRVhhNW82OGVzZlpTQzdFVWlNUDVyYVlhNXd1NUVVMitw?=
 =?utf-8?B?bEg5YlYxQjd0cGZSM0l4eVlhcjVpd0ZQR1BqTFc0MXJyVkFDYjhVSndCbUty?=
 =?utf-8?B?Z3F1MklYSXNiQTZuNndlL1lPdy80R1lGRTl3UTkrVnNBVDJZcWRMM04vc3pV?=
 =?utf-8?B?OUhsd2pUampNVTd5ZGhSS01VZzJxVy9FM1E2K1VWYkd0YjljRS84cEFNK05q?=
 =?utf-8?B?eEJ2OHFrd2JvRjlXUUllQ1R5d1FYVVZIWVE5b045ZFFjV0pBNUEzSG9EQ0I3?=
 =?utf-8?B?T1VYdUZIRW80LzVUK2tYNkJldzUxMzdHUWFBVk1qbVdNMHA0Y1p1aHV5elUw?=
 =?utf-8?B?TUd0aStlM1VOSCtrbUg3ejVXSFFvV0lZczlOeURqUzFJempERERwRXFyYkpB?=
 =?utf-8?B?L3RxSzBNL0l2cEhPSXR0cXNTU3QvbTUyZ0NnVEhxS3dGMjVzMUh0QlUzMmg0?=
 =?utf-8?B?OExRbHdRejIxcVVHZ3FMbUxpMWxMUTRlY0NaZlBWZXZOb3ZBL0oyT1duQ1Vr?=
 =?utf-8?B?QWxsaUgxSWdQc0I5azRlT2lhSVRDNnhvWmhadVRrU0NqdUV0YmFFbzVHVWxD?=
 =?utf-8?B?bHBiSStWZ1ErbUl5eko4MDhrM2xvdmZjL25rYWh6bVB6dEtJVnRXUVRMNWJS?=
 =?utf-8?B?VHBjRnBlWlV6N3RFRlA0N3NMVTVhTTErQzhHdTZYNmxQWXFNeXVnbGZrUVo1?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8ee2c8-28da-4ef3-2f67-08dd8bc16e43
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 10:41:45.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTzcHK6wqTen6qVWfVfJVkZ+xsnYM7z8qQcjAxMsvrk8gNfxJ+QW3WR6gPeOGC1duyvt3kvP9WpBbQH8WtO1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9E88246B
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


On 01-05-2025 02:06, Karthik Poosa wrote:
> Add support to manage power limit PL2 (burst limit) through
> pcode mailbox commands.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 28 ++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 67 ++++++++++++++-----
>   2 files changed, 77 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 8c9131c05041..9dc2ee348aa6 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -148,3 +148,31 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Fan 3 speed in RPM.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.
PL2 is typically higher than PL1. Please correct this statement.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.

Fix the documentation here as well.

Regards,
Badal

> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 15e47e31ad26..115758c88175 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -51,6 +51,14 @@ enum xe_fan_channel {
>   	FAN_MAX,
>   };
>   
> +/* Attribute index for powerX_xxx_interval sysfs entries */
> +enum sensor_attr_power {
> +	SENSOR_INDEX_PSYS_PL1,
> +	SENSOR_INDEX_PKG_PL1,
> +	SENSOR_INDEX_PSYS_PL2,
> +	SENSOR_INDEX_PKG_PL2,
> +};
> +
>   /*
>    * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
>    * not supported and below are SKU units to be used.
> @@ -72,8 +80,9 @@ enum xe_fan_channel {
>    * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
>    */
>   #define PL1_HWMON_ATTR	hwmon_power_max
> +#define PL2_HWMON_ATTR	hwmon_power_cap
>   
> -#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>   
>   /*
>    * Timeout for power limit write mailbox command.
> @@ -124,6 +133,9 @@ struct xe_hwmon {
>   	bool boot_power_limit_read;
>   	/** pl1_on_boot: power limit PL1 on boot */
>   	u32 pl1_on_boot[CHANNEL_MAX];
> +	/** pl2_on_boot: power limit PL2 on boot */
> +	u32 pl2_on_boot[CHANNEL_MAX];
> +
>   };
>   
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -151,6 +163,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   	/* return the value only if limit is enabled */
>   	if (attr == PL1_HWMON_ATTR)
>   		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
> +	else if (attr == PL2_HWMON_ATTR)
> +		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>   	else if (attr == hwmon_power_label)
>   		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
>   	else
> @@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>   
>   	if (attr == PL1_HWMON_ATTR)
>   		val0 = uval;
> +	else if (attr == PL2_HWMON_ATTR)
> +		val1 = uval;
>   	else
>   		return -EIO;
>   
> @@ -321,9 +337,10 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		/* No MIN_PWR defined, using boot PL1 as max */
> -		min = 0;
> -		max = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
> +		/* No MIN_PWR defined, using boot PL1 */
> +		min = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
> +		/* MAX_PWR is PL2 on boot */
> +		max = hwmon->pl2_on_boot[channel] & PWR_LIM_VAL;
>   	} else {
>   		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
>   		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
> @@ -455,8 +472,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	u32 x, y, x_w = 2; /* 2 bits */
>   	u64 r, tau4, out;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
> +
>   	int ret = 0;
>   
>   	xe_pm_runtime_get(hwmon->xe);
> @@ -509,9 +527,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	u32 x, y, rxy, x_w = 2; /* 2 bits */
>   	u64 tau4, r, max_win;
>   	unsigned long val;
> -	int ret;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
> +	int ret;
>   
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
> @@ -589,11 +607,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   /* PSYS PL1 */
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
> -
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
> +/* PKG PL1 */
>   static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> @@ -607,7 +625,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	int ret = 0;
> -	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
> +	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
>   	u32 uval;
>   
> @@ -639,8 +657,9 @@ static const struct attribute_group *hwmon_groups[] = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>   			   HWMON_T_INPUT | HWMON_T_LABEL),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX |  HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> +					   HWMON_P_CAP,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -765,9 +784,10 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> +	case hwmon_power_cap:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> -			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
> +			return (uval) ? 0664 : 0;
>   		} else {
>   			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>   				       channel)) ? 0664 : 0;
> @@ -797,6 +817,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> +	case hwmon_power_cap:
>   		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>   		return 0;
>   	case hwmon_power_rated_max:
> @@ -813,6 +834,7 @@ static int
>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
> +	case hwmon_power_cap:
>   	case hwmon_power_max:
>   		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>   	case hwmon_power_crit:
> @@ -1139,16 +1161,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (!xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>   						     &hwmon->pl1_on_boot[CHANNEL_CARD])) {
>   			/* Read all default power limits */
> -			if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> -							    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
> -				drm_warn(&hwmon->xe->drm, "Failed to read pkg power limit\n");
> +			if (xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
> +							    &hwmon->pl2_on_boot[CHANNEL_CARD]) ||
> +				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +								&hwmon->pl1_on_boot[CHANNEL_PKG]) ||
> +				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +								&hwmon->pl2_on_boot[CHANNEL_PKG])) {
> +				drm_warn(&hwmon->xe->drm, "Failed to read all power limits\n");
>   			} else {
>   				/* Write default limits to read from pcode from now on */
>   				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>   								 CHANNEL_CARD,
>   								 hwmon->pl1_on_boot[CHANNEL_CARD]);
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +								 CHANNEL_CARD,
> +								 hwmon->pl2_on_boot[CHANNEL_CARD]);
>   				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
>   								 hwmon->pl1_on_boot[CHANNEL_PKG]);
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
> +								 hwmon->pl2_on_boot[CHANNEL_PKG]);
>   
>   				hwmon->scl_shift_power = PWR_UNIT;
>   				hwmon->scl_shift_energy = ENERGY_UNIT;
> @@ -1157,7 +1188,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   				hwmon->boot_power_limit_read = true;
>   			}
>   		} else {
> -			drm_warn(&hwmon->xe->drm, "Failed to read power limits, check firmware !\n");
> +			drm_warn(&hwmon->xe->drm, "Failed to read card power limit, check firmware !\n");
>   		}
>   	} else {
>   		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
