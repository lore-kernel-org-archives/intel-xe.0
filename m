Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505760A2612
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XlPAyI6s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1E10F607;
	Tue, 27 Oct 2026 14:51:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D32F10F607
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793112711; x=1824648711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kRfJZzkyI+mJfwnwEOQViEQR6aHZ8D+czOSJpxp57/M=;
 b=XlPAyI6srZGWms8kjx7oL4zf+jlabXgvuHfWIQ+TwwNT8h4sxj/Vt0TT
 iPLlisVAYyIeYFshMEv5oZln0uKF0sGWKTUXpqaLC0SnHNuLx5cVOGepG
 Gsv82Ji8ZoYwYx0MKkrr4ayjxM6raGexsqLWyNizRxIdMY9sJJji1iDiE
 2pO+p1Jr8jIH+WK7uWVlsihn2/KUnxnZh4BueBg+b8LjY6OtS1JQR0G0z
 B4PjGFMfB0TGSof/BXgF2uvA7q118aDGzlkF9gCW0SJp48B6KS/67Xu9v
 M1bi+sISBOeKW0nvNwVQ+bhjC1PZ5K8lbJuU3s2MiTzZr81Zd159di/9z Q==;
X-CSE-ConnectionGUID: r7iZOLrnRlinHYl0n8xUVA==
X-CSE-MsgGUID: E+eRlhuPTQWNeE+27G+ilQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1903358"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1903358"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:51:51 -0700
X-CSE-ConnectionGUID: bxIFwVTZS0OnI+BoBFMK7Q==
X-CSE-MsgGUID: 1vJitvZpTwivPOnefHaCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4899318"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:51:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:51:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 07:51:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZjrWmVMSt91dymaePsws/8O6jbP+KETvyMEGD6tvf2eherpyHaD7gMgYV/RTbUChjjHZtj7m4OI3fEQT2yZOe8fhSOi9ykaDWOYZVPzjB2QYAcCPPn53CFji8aQWzBnqOq9fZs4nqHN7Vl90i1FSJ1m+AVmVFu3kfI6OZ6McLaDzIPdXsUzdKt5ZB/luWtI4bvaUgPUTlnhC6ug4Obd3G6Ioe71D+FnKLdWxfWzHum5wa9E7j9RXXoDgPOlfY/j49G1acCCERFd+HtJFMiR9yaGAgLzPCm9/GQTLfp4XztViaq/GCqlei1xTLwwmETXfOgp1hz6PhEptV9rAgEhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FUxkG6dmtAqVZsdgeIlncG/05wPKXzL05AHq6sEXA0=;
 b=ATnQaQdOfp2oQi3iH8OOLDg5WMl1xgAxm2zFOe7QcZoWuFUA7vBL40LDSx6ggDtn1b3Tc1Pwa0DyARc2KEea/mABwSMSseBAri185A3bfva73w1uomHg+CPJaIUXe1FeK7RAQm2+XoXeJ5cAgLOYLHky/q6aoEvhnYib4hSqDybqS8dK92HAh8h3gmbGtRHxwtWdq/DScifopAuvLmT35IPpGsZLnUmlRhcqY0eSsh0iEmHbPkQcdELPrXVIUF1uSf+IMGmPZz6m+2bsrzTmuPZYUhwQRvmcey0myNHxvBFczSH4hvXHLQPF1Zjq8XpOSwqUYomJYMmL5amdMwNzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA3PR11MB569431.namprd11.prod.outlook.com (2603:10b6:806:53f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:51:46 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:51:46 +0000
Message-ID: <276d15ca-bf1c-4510-8202-4f2f8ae46f65@intel.com>
Date: Tue, 27 Oct 2026 20:21:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hw_error: Initialize hw_error_work per tile
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-13-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA3PR11MB569431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1804a9dd-89b3-49a1-72ec-08df3439d2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022075727099003|10067099003|56012099006|6133799003|22082099003|18002099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: CzD6TR2yy6XHFbWKG/6W4mcWggrq5ZmzSg2lOV8n+ACH18jPUe/FZYq1+a7TNKhf5jj9YChyaRYlndPIdWWZqGUAu3kWB1ufDZvoN9gM5jGANInlTGrNck7+3CSPJCWXHQZ6iKx5qtx6hiVdBa6asB7lTMfBN1OhYZeCxORKZodH0x9XAAvE0ZcvO1I8B1+pOCBRL6L0vvZuOHCX6rI+nhZKjzpOLKlM73xnFw8COF5hrHVfd1pgP72jUDJMkJ5JLiWwRcSawpdNKylsRknEqRpeOO1MCAheXHq1QvwDMA7On+BSUOSD7hHQ5sI81tLqbJDuFh51S4aklefEh+hEGzWKBU0Q6aaHztr7u5b2YgYrrHFOcnpif09wWDYmh0xuDKchtQHeCqs2+MYYp0/IV0BDw6taUqxZ5LjqZyWuPU0iV3ZuDme6bmtFxZaultNPYrkMBLllMmtWMvXCaS0+3G5RWOF4FhUu9pmyjq4kzWysIcpoFoBTySwmQAlqD6BftUU1HdPEXRj3DJBBGgCQ8VJtPixhpubi4zjSem5hfMwE2+Ij+n0Gg3uar95LwSEU4lH6ibQd9xRPRBXeGEjMTIFk3rnqLZYKjVUXiAT0mW8O4uvM6Qr+rrWFPGtlNq9HQdXXUtBEnrcdSK/G9vnYzUtXYMhhTIBmag0lMlK5+9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtzOGFGN2RJLzNVK0RpWHBkcWNkYy83QzY4N24xejNubnlscHhPeTVyYWl5?=
 =?utf-8?B?Q1FoaDlVWkY4eks2Y0VjMDFGL01ubzh6ODNqMEtBcFl2eXRwdEp6ejN5Nm53?=
 =?utf-8?B?c0JzTFJJVEZkK05VY0xNRU5VaXRxMDFDUCttL0RYRmt6WHVyekpTVFRYWE4x?=
 =?utf-8?B?N1g0NW9RWDJiQnU0Ry9pRjBSek1SYjVSS20wQ3lIejJIazVrVy96eHNtUTJv?=
 =?utf-8?B?b0tyc3RScGU1QURPajNZSGlNeVc3dmdXVGxZeDBvQTlxTko3TmNDSkZPUnBl?=
 =?utf-8?B?R1ZPeDdydzZiSzNSNTdtVHJpR0hFeGpsaFpCN08xSzFjb2RDc2NaWWV4YXdl?=
 =?utf-8?B?bU1BZXc3am5QelZ1VWRXTDMyRW5MTWNQdTJOYlJ5d2hZK2pxMFhxVXBJYm5a?=
 =?utf-8?B?emtqYkJ3eGVCRkRwU2gzQXlqQXpidElnc3dPOHc3UGVRdjdpYklWWEdzdXdJ?=
 =?utf-8?B?VzRCbkhWalFxaytrTlprRXNLQXNlaGxadkF2WXNobWN1U2Jyc2NxcDUxNEky?=
 =?utf-8?B?d0dWeDRzT2pJWFVJQkFsVjRIcFI2dTJTMi9IQ24yTWJDN3lGZ0ZpTXIyZFZt?=
 =?utf-8?B?SkRZVlRFRmVJdXcxZHF4UTUxRm1tN0hPMkVhalp3UWNlSVgvMStob0FaWE1z?=
 =?utf-8?B?QTlQOUF6YmxZci84Rys2QVhVQVkvSXZ0NXhVbnNQYSt2Z3R2clNudnYwOGRt?=
 =?utf-8?B?WWJyaG82eko4eFcyZ3BnaUptSkphTnIrRS9pWVR3bGtwV3pWQlpCWXZ1bUg0?=
 =?utf-8?B?eEpwQ1pLaGE0dFNFMUppbHVzYlBDL0JZK1FEai9qUktUNWhmUDBzN015c04v?=
 =?utf-8?B?Ym5jZ1ZMWDg0Ty9Cc3FoVzFZWWlUVitrM2U4alBOZXAwb2N4U2ZXUkN5UzA1?=
 =?utf-8?B?UXlzNDRvSHljUEpMM3VTZEtqajh3NlUvVFNhMFRXSGowL3pkMW9ONU9Nc2Rh?=
 =?utf-8?B?NG5RTWthTHp6dFQyOW1QdS83R3VTbkVCeE0xbFRMMFpzK1BGU09sZG1wSDJF?=
 =?utf-8?B?YXRPRHN0MjRka1FZRXYrek90YnpteGtCa2l5RzZGYnBweGRoWmlDWTdvT1hR?=
 =?utf-8?B?eTUvM3VlT1FJa2VzSDB6VklRamhDRnd0MFNyZ0JyaVpOOThkb2s0VEE3UktN?=
 =?utf-8?B?aEJ4eVcwbGhXM1Azd2VVbERSaGk3ZXhSLzNBUEd1RlJGaFdDZEpkY1pOM2hK?=
 =?utf-8?B?aW9ZcGttZXMveTh6NG9FTGU1WlI3UU9WaHppSTdpMDNId0hVUUdwNkVaTlBz?=
 =?utf-8?B?USs4dFR2VTFmVUpTRVptc1A3ekZzR2g2cWVrRmwyS2RMdUtuSHZuRUhHMThY?=
 =?utf-8?B?OUFwOUp1UFBEYkFMUkhOZElESVNzSklmdXk5R0VGUlNlZytIZ0hMM2lIcUZC?=
 =?utf-8?B?bXorcXJReFdHOU9VS3k0MUFrUWVnUjRacitiM3RuZFV0UXlWTmp0RmVTUHpX?=
 =?utf-8?B?U0xhL3hDWVZuTXlMU0c4WWNscXF6Nm96ZEU5Z09BdnpYZWViRVpuUWNsOWVV?=
 =?utf-8?B?eU9teWJUYXMvaHZaczBFeWVFWDNuQjlraVhoUFhmNHZzM3F5a2RhNWZKaVIz?=
 =?utf-8?B?c2tuUmM2WTRoYkxLT3dQbUxIT0ZpdWNaaGc2ZmM2ZlpwYVVWcHEyM3ZMd3hM?=
 =?utf-8?B?WEdSQzgwNHFCUXNKMTlEQTVjY2dwcUVlczlsakNPUnorME9VZEl5eTVoNHI1?=
 =?utf-8?B?RjJMMERBWUEwYjBSU1pJNmdyTUl4UllNRUwzNnFhU3VkblE0MEFXcUcyaitM?=
 =?utf-8?B?eHZ1djREbzEzNVVyYi9vdGFiVGdVbnY2L3R2d2prbFd2WFQzalYyRldFVzNO?=
 =?utf-8?B?VG8ybVRjdFNQd1BEMk1VOXhUMXlkcStQM0xZSjVLa1FmMlpCUmxIQldERGpC?=
 =?utf-8?B?a0Q3ODB4RVlIVWMyeTA3dXlobHpEQVc2WjBFSVQ5ZWNlTFo4VnlNa1J0R2pO?=
 =?utf-8?B?cU54Tzh1Zk9LeFFNQUhvQlFIZmI4QjBCS0FFZWFqSms5ajBDd1c0OUx4RGk2?=
 =?utf-8?B?MlJieE0vZzVtYkZOOXlLdng1MUh2ZitRa0djVFNuTGhKd1NYMkNaY081LzVv?=
 =?utf-8?B?OVJOaUp3ZnlpTG1tRThsNG51M1JKN0dEbmtEOWEzNktzcDhCaEZaV1RoSHEy?=
 =?utf-8?B?Z3o2dzFTREtZWW41RWNOYWlLUHZ4YVdaZ1J0NG8rQTNRRkhYbnEvTXY1dDMy?=
 =?utf-8?B?TjRaRElPQmZNRVVZc0JERkF0YzdKRzAwa0p0UWVGeVRlcFR0UW1KUFlNRVRM?=
 =?utf-8?B?N1llZXMrd2xRNDRxOHBXaXlFc05heE9VQTRxcGthVHdud0Q1VS94SWV0M1o3?=
 =?utf-8?B?TUlpZzdlRnFNYUxIandSYU1pVDZ0OVBNK1l4OTlHYTVmNzh0Y1EzMWM2MlJX?=
 =?utf-8?Q?fDSBlPfDT/fJy350=3D?=
X-Exchange-RoutingPolicyChecked: xpnURWvi7/rsPpJN7uKD7KxyTcibBib54fXi0No1KGMAqkh5Eyj73kUW+DLmeH2yiigqJvAS2Crz0TvQHISraB7OhojT3Nw/gGmiwigo/21KrNgEHdLC34izAQiJbOlTTH3BQZfib+1qGtbWxXmENIrRn4oqM9h2y+XqYXjP4kco+IamzbG26XCxImFIrfGzO5zr8+TPjBiPJOct92XyB/M6sjHKGvdJ91tvoAjYl6rX4YYzmbH2zNnFgL4UVkiXwOat+FS8wmmhR2vQ4zeCUgZW+tlR2wqVU28R/XtOAdCj5wcn6lc4MChZqfxCjWV+I5912MRGnBVrtmN6BhRHpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1804a9dd-89b3-49a1-72ec-08df3439d2cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:51:46.5404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0faCbBMauYaPk0VizpqAViSfOBBeopriKNSdiWee6/eqGelnq287SuE3KenwMDdcqpbsEujc7vKNci6AwIWgMhczDEh3N3C+MmLi3b1aZZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB569431
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> From: Raag Jadav <raag.jadav@intel.com>
>
> Since hw_error_work is now being reused generically, initialize it per tile
> so that we don't hit uninitialized work for non-root tile. While at it,
> disable hw_error_work on fini to prevent UAF during unwind.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>   2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 41ddd997478b..f7799c3c08aa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,23 @@ static void process_hw_errors(struct xe_device *xe)
>   	}
>   }
>   
> +/**
> + * xe_hw_error_work_disable - Disable hw error work
> + * @arg: xe device instance
> + *
> + * This function disables the delayed work for hardware error handling
> + * for all tiles.
> + */
> +void xe_hw_error_work_disable(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_delayed_work_sync(&tile->hw_error_work);
> +}
> +

hmm, we are disabling hw_error_work.

IMO, if we see non-fatal error fires on the IRQ path (since it's 
asynchronous), since the work is still disabled,

it would not be processed further.


Thanks,

-/Mallesh

>   /**
>    * xe_hw_error_init - Initialize hw errors
>    * @xe: xe device instance
> @@ -546,12 +563,15 @@ static void process_hw_errors(struct xe_device *xe)
>    */
>   void xe_hw_error_init(struct xe_device *xe)
>   {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 5e3a11424108..c2c0bfa6d9f9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -12,4 +12,5 @@ struct xe_device;
>   
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>   void xe_hw_error_init(struct xe_device *xe);
> +void xe_hw_error_work_disable(void *arg);
>   #endif
