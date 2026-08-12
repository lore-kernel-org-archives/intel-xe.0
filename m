Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8462CC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 11:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2BE10E2B6;
	Wed, 12 Aug 2026 11:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSti2I6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1E10E2B6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786535032; x=1818071032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=MxgbCng8cvP2bISrZyUljKdGKQsQ3he25ZNlIY+4yHI=;
 b=LSti2I6Yvr6kPba7eSfxNiCKucnjmuT8hrrjwHgnKrpnwjpWPITHFOus
 9XfvcnNjDxK9JEpN+5gEtRH8g7HeTUJ6YYCBhFyLmoQTTrID5+0Xz2vVr
 17P1Hea+yTvUEjTF4P9nsAcex69vumfK1NRVNXl9+kTuQnhmL8hZ4zaWg
 MJJJ2U6cKw5PEBH1zFAxh+nD4wL8sK0jGgK7hCKYnkLYgfWmONdGVIOlG
 nsxUt00mTXecQq3B/PCWWW4ZHG3JCq5/t4ItWixjuEy/ZLjWXZwLRjw4x
 a3WLoFcfvMpWtiWo2SQdEDeJxSG7Ws1ORxbyOv9vfNYHTYrmx2LcE4Jsv g==;
X-CSE-ConnectionGUID: ecMAoaDyQgyHecO5R0RmTw==
X-CSE-MsgGUID: o58c/jHbR5WYb4zzt6AUaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86848415"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208,217";a="86848415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:43:52 -0700
X-CSE-ConnectionGUID: IxGubFzsT46vLll6ZdqOzg==
X-CSE-MsgGUID: d90b3BH7QDORrkUFw1gp4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
 d="scan'208,217";a="263151478"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:43:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:43:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 04:43:51 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:43:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smnhjJyRnmMUrODz0SjLSD2vpLuHAsEpqq3a+leP2CSQbk3PmdetVj8Sx08zq2PEi7niaue76eDjXJw8iR2lEhJAmDwDmWuhu8Vl+kb5HZ3CngMk3r70xPSzsm4XTRfTIi2TvCLii8XrhZZTSc6s2urW4aGO6CpxdIAQuvKZGcDpzSyRWiz5Zx7jWoHu3cFwkQHLRYRSkVrUxB8Xzt+A5IMRUp6KTkIKjTv2UrHqfEm9Pgb8Fy4veX3dNKah37XHyZI6LYz5xFAznPvtCnDgMe8vvPI2OxIbHhKXvFuPGeN9Uc1n5oRrH9F7f7njIXQmoe2GzKSZHZwhkKTt9LUcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKjfoqWYCSBIuSj/ZZ21yXOlnvXxrC1w+LQU+jQVrok=;
 b=vb1uoe3Clj0KS5V4G/da1EXolqXtEL7H+XyzZXFvo+BElYAEh+fuLg2wx+O9D16j5sWUrCSj2Dq6izfQR2XujXqGChZiAzaE0Jc1EgvlbHg0PbCGAyuGwJgmddJlOE/PfAx/XPtoby0/aor4/3gf6vchlcBMps20S20B21N0XFmY1qgvygJ0MVhpeYOhB8sWCtciKpM0BB/rDu5/5hAVpevLKdbbcGFSek8IRokLW7n/ldXCXf9Kaocxvf63O7GpLQtm8m0eCO0LO51GZnPrHxCx2LXtqEr+YvKFCnPUBw+rKM8x/KEUndF8/BCXEbJyOjsMWBDrf7YmNS5tFOFP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB9796.namprd11.prod.outlook.com (2603:10b6:8:363::14)
 by SJ5PPFEF71E136E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 11:43:46 +0000
Received: from DS3PR11MB9796.namprd11.prod.outlook.com
 ([fe80::cd8:425c:ab55:7316]) by DS3PR11MB9796.namprd11.prod.outlook.com
 ([fe80::cd8:425c:ab55:7316%4]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 11:43:46 +0000
Content-Type: multipart/alternative;
 boundary="------------1eHLTjO0L0uRflFPzHOfaqxN"
Message-ID: <741c14be-9fbb-4ade-9959-8f50f9bfec5b@intel.com>
Date: Wed, 12 Aug 2026 17:13:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260730152121.576-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To DS3PR11MB9796.namprd11.prod.outlook.com
 (2603:10b6:8:363::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB9796:EE_|SJ5PPFEF71E136E:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b0bbfc-ac8a-45ae-027c-08def866f809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|5023799004|22082099003|18002099003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: dPdmPssDMYJKPOPIXsKvNf5ZEpYcU7dUBfQ4sjNbgyqfeIezDTcbOIZvGiaPAXbCOPnMEJZltbw6eRq3kN1sgBiMHYeMB7DiFY/PS3FUP3Pul82IoFaaV4eX9OKfwbGveTrMMeEQrnriZqXzmb1aBvVHU95OrX0Etkq+GZwDrGh5x+VxkLC2Wg3S8qP0Hp0QCY9a5maJss8Wsqdbt1+JbhnIVpdMnZnX0hqOscYy10H92VvrUm0DZTDjo9ISQ484Jj1H/R6ti2KmKyA1/Udx8M8EuGgFNW+BXxN9BrjGFNa2UC54E9c3Tpx9vxDMx1rprOkEDPF4SANNa9Y4uQW3qNL+dbPvDpSYdTw9UmMLdrtYGpKrrzUO9RB82tU4big7fBDDdj8XPdi3iWPf6hHpSmBFW7hs9HAVZWWAsCRawmmVw1z9xJOKwMz2j5/UKJj4dYalBPEUuBqneYIeHklOWEbHugMFkK4oPbt9j5+VEUqBKKUwcl6J18/qCU+9q4c1qSgwwks+dVA0fRH8Lkitvv3RpDVg7SfhDpmvd6gs2fATUSmxe3BSt65pGr+nJRCB80kBZE/RtJ/2hUtSYwrAL7OxMkE4aC1wlQMLkAo07mtjQOS+bxh7rWQz16ErZOaWhO1d+yTuRHvAPecGtz9t3JzHkVBA5I9tubzWJE3EvwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB9796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHBEbzJPT0NOa0N5a040NjZwSnpZbEVHMXJoK1dMeWMwZDFRWjgzeXRDa3R1?=
 =?utf-8?B?cDdrQk1oTUtHTExWTTNxMklpRzZUZVlDRzgxVjlaLzU1MEgwU2QyY2RsOWw1?=
 =?utf-8?B?Z3phWEYzN1RYQU50S2ZoZEZVNFhWcTFKaVgrOUsvWGJSZFNONnA0ejhLNjNT?=
 =?utf-8?B?UEd5L29tdG5PaENtMGVkR3RGTnRxRHBhZDJNMFNLUUVsS2dSWlN3dERXVlFX?=
 =?utf-8?B?akFvamFIRTVOZzBiUVg5TmNWNks2Qm5mMlBXbmRiMXBLMzNjR1U0YXcwVUNu?=
 =?utf-8?B?VkIxdTVUc2FYRVdlVkhsUEdIUTJxd0R0bnpxcTdFeEd2NEVzNEZZN00vZDVo?=
 =?utf-8?B?cHY1KysxR2RQWGNWVENqQW52M0trWXdCa0JnZGttVXY3SDlpd3JZTE5ZQmhT?=
 =?utf-8?B?ZUVKZ04vSE92VE5YOEJPTXhuU25XbStpSHU4MVN1Uy9zTjdsdkpYaVBUTmlR?=
 =?utf-8?B?NE1iNWtkQ2pMQ0JVcXlvaUFRU2N2UllNZENUdnROMlUxZ0FrMDhRdEdYeHpT?=
 =?utf-8?B?TDk1N0hvV3NYNHh5QytoSWhQaThKUUliYXFMblB0VmVnL2hzVTNybjNpWERD?=
 =?utf-8?B?NE8rSUw4MEttUUdRZHRIUXFsekpMOHlhRFhDaitRUENQRHo2OWhpbThjV3cz?=
 =?utf-8?B?S0liOXorNEk4ZTZKc1dpVFd2dko1TmFmVlVMeW5Gd2M0ajhVSEZCWlNXcmYv?=
 =?utf-8?B?ekRQYWFLekR4S01lSnlDVHMzQVZZdTJsdW02WElsWjdBNVAvbVI4SDRUVkpD?=
 =?utf-8?B?d1l5RWFDSmtUQm1VeHBKTnEzT3loTENTb20zSWtHMWhDVnlINjVZSm8yV25h?=
 =?utf-8?B?ZGczM2E4V2ZzZWI2RVdhTko2aWZSUS9pYXZFZUx3dHBZMkt5V293dTIyRlYw?=
 =?utf-8?B?cWRzdFVnVGdiTnZCZFZMT25GT1lLZzlhdnFFSTF0UFprNUcxV2RWOTA4aXFU?=
 =?utf-8?B?dmpYMVBHZnIwcjBsVHlGYlA2KzhKWVltaGhGWnEvOUF1Y2tuclVOTnlzb2Jx?=
 =?utf-8?B?UnZwQXdIWjVueVlmbEJmeXZ4b0RpVVVjbGF3anMra1pIWVRYSmUxWU1DWUhG?=
 =?utf-8?B?NGVmbWV0VzZzMjF5bnZBbFJuUWRmOXpQNnVEbjBrWXJZZWk0U2syRHh3UUF4?=
 =?utf-8?B?QnA0MmczbXJsRS9jQXFYWDE2UWRhbjllbDdMd1diaTcwa2FzRVFyODUzR3VX?=
 =?utf-8?B?amRDSHhtbWVzdWJ3M1NzV3NkVVNZSCtKclQ5V0MxbFloZG1yS0JsQ3c2eGxz?=
 =?utf-8?B?dFlhbjFYZTFqSlljOTArUk0vd1l3QTBIUjh2QlI5U0hmek5mNXMzVjVGd0R2?=
 =?utf-8?B?OVR1TFVqMDJEYUlGUUY3dVNrdWRwbEdVb21yUkVQTjFNKzlMRmQwaEw4c0t1?=
 =?utf-8?B?d1doSURkclVFOUkrRkVqUW1hczFkNWNaalVZOUFkMnhQRXQvR0IrVEdOUWNm?=
 =?utf-8?B?aDdCSnFtWnZSdWRnb0MwdEw1eU5QcE9oVWJydWZPZWNSdHI0ck0xa2JQcncx?=
 =?utf-8?B?aC9IOWprSWxNMkFBVk9OdkVCZWhMYlI4RHI5bndBNFYrekNPV0NJdGpZVjN6?=
 =?utf-8?B?V1Naaml5aWpEYkRHQjRGcDEvRUlYSFhZbnFpbE9UMlNObndlcmg2QzdWcUhY?=
 =?utf-8?B?UWs1dEFESms4V2ZpY1Vjd1FKenQrYTlpc2VhR1ljMElMUVZvaGNScEdhYWJt?=
 =?utf-8?B?ZVJVQjBDMGw3THBPeURDRTlySzV3R2NTT240QkRqVU00Z0lpdlk3Y0s3TmJ1?=
 =?utf-8?B?OHA2ZWtFSkFJU3psSnFkSVFtZXNVUnpKZzV0bmtuZHc4THFoNHVyREhnMWNa?=
 =?utf-8?B?QTdIN2Y4Zjc0U2hCZFd1dnBtQkk0MWFZR3dCeHlMQ1JxYzVuU2pZemE2MVNx?=
 =?utf-8?B?V2Y4VWdFY0RPcHA3VlYrRmZNb0pjYmZORzdZbGVVMko1WU1jRHZibng5VGRT?=
 =?utf-8?B?UlZ2dERXdTc0Q3h4Z3IySXdBZzRLRlcrQ2NaVnZVOHM0aVgvbVJELy90Zkgx?=
 =?utf-8?B?bjR4bytMVlRkU3FadkJSNHM3LzJNY3RHVW9hdXcvblFlcElVRWhtTWNzalhv?=
 =?utf-8?B?WUg2ZnlnQWpkblFUOFJQMXAwZCtJcmtSd3ArMnlmM0VwK3pMT0RuanltYmlu?=
 =?utf-8?B?M2plamxDUEw5NGhISmZMN0l6SCt0aytDMFZQUEJQcTVabUVBc1lSdDJoUEUw?=
 =?utf-8?B?YzN3SHFwTVYrQzcvZnBqVmNUMExhTENOYngzdkdySWcza0JjcHg1NlVuWTVs?=
 =?utf-8?B?M29EZFVEVStXZlFtQWVsd1JiclNwenM3a25LK3pEUXhBUzljZDBBeUJyeW9Y?=
 =?utf-8?B?YVFxRVR0YzNBRWZMOEpOYnhNZVo2eUVjekV6THJPTWJ0N25TUXpLdz09?=
X-Exchange-RoutingPolicyChecked: ZjrzWdsBOoHlgj/p27/M2Ggj6Wxj/44CY5b8ALvJLNz4Lfj+nQXK6r/6DgaY0lytavFEkImAfmgUaqc8bdTDNrFQ8MGEDQP0dxD6jDrC5sGnOA+xM4IYs/Y0IAe1tVOdEIWMy2wl6Iq7v3HBGwsI6sLugbaEiL3K/v61cP14fZSYIJ/+9v4I/opOrkzorxjn90jbgfk95Jua8p3ht8WT/7C24g974xfpnVGEM3wW1YPzxGL5J2W2HHtBjW4bwpjKkASa12kXxc8BLgybc93kgwJP7f7+Hg25oMhda/MYGX39zJVs11k2R481N4xlMrssub3mdFCbdz/CKbLntI/gug==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b0bbfc-ac8a-45ae-027c-08def866f809
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB9796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:43:46.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZINJwFLfdB2pMMILKJajG6aphl0YfyAeRor8Adddae0Hd8ePQmge5TFaHlH2JsLBFLlysUovo9KPuDVVSdTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF71E136E
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

--------------1eHLTjO0L0uRflFPzHOfaqxN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-07-2026 20:50, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
> Cc: Yoni Levitt<yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Raag Jadav<raag.jadav@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 +++
>   6 files changed, 354 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67ada1d6c2fb..7ac3954737f9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..99717fdf74a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> + * primary handle used for triage: a SIGID maps to a human description and a
> + * recommended first action. A coarse first-order action is documented in-tree
> + * per SIGID (see "First-order action" below) so the id is actionable on its
> + * own; published end-user documentation refines it with finer, cross-product
> + * detail. The driver's only job is to emit the right SIGID next to the usual
> + * human-readable text.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
How SIGID is going to handle above scenario?
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is (and is not)
> + * ----------------------------
> + *
> + * A SIGID names *which situation* is being reported. It deliberately does not
> + * encode the detailed reason or the outcome. Those are carried alongside it::
> + *
> + *   SIGID    -> which recognised situation is being reported
> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> + *   errno    -> the failing operation's error, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same situation can be reported at
> + * different severities depending on the instance and the recovery taken, so a
> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> + * the matching xe_log_*() helper (see xe_log.h).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised situation *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
I don't think XE_SIGID_WEDGED fits this rule. Unlike the examples above, 
a wedged GT is not specific to a single report site and can be reported 
from different paths.
So wedging is situation reported from different sites.
> + *
> + * If a site does not match any defined situation, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new situation is genuinely worth triaging, add it to the list below.
The information regarding logging SIGID should be embedded here.
> + *
> + * Scope: software-emitted signatures only
> + * ---------------------------------------
> + *
> + * This header enumerates only the situations that the *driver itself* detects
> + * and reports from software: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately *not* enumerated here --
> + * minting a driver-side id for a firmware/hardware-reported error would only
> + * duplicate an identifier the reporting layer already owns. The two
> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the situations were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused.
> + *
> + * A retired situation is deprecated in place, never re-purposed.
> + *
> + * First-order action (resolution buckets)
> + * ---------------------------------------
> + *
> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> + * bucket, which forces the question "what should someone do about this?" to be
> + * answered up front. The buckets are::
> + *
> + *   COLLECT  -- capture logs and open a bug report
> + *   RETRY    -- transient or already recovered; watch for recurrence
> + *   UPDATE   -- a firmware update / flash is required
> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> + *
> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault situations only --
> + * important, operator-relevant faults and events. They are not a replacement
> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> + * using them for ordinary logging would dilute the fault stream. Not every
> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> + * a published situation.
> + *
> + * dmesg vs. the machine record
> + * ----------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> + * text may change freely, and lines may be dropped. The durable record for
> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> + * follow-up).
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_GPU_START			100
> +#define INTEL_SIGID_GPU_END			999
> +
> +#define INTEL_SIGID_GPU_XE_START		100
> +#define INTEL_SIGID_GPU_XE_END			299
> +
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
Going forward there could be multiple actions associated with 
survivability mode.
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]

Are we certain all runtime firmware failures lie in retry category?

> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> + *
> + * The situations the driver detects and reports in software. Values are
> + * numbered sequentially, are only ever appended, and are never renumbered or
> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> + * Error Signatures (SIGID)`_ section).
> + *
> + * Firmware- and hardware-originated signatures are not listed here; they are
> + * logged as reported by those layers.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,

Is it allowed to maintain each firmware as separate site?
e.g. XE_SIGID_RUNTIME_GUC_FW,
         XE_SIGID_RUNTIME_HUC_FW,
         XE_SIGID_RUNTIME_GSC_FW

Thanks,
Badal

> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..70a41bdf1a01
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	default:
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
--------------1eHLTjO0L0uRflFPzHOfaqxN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 30-07-2026 20:50, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Mallesh Koujalagi <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:mallesh.koujalagi@intel.com">&l=
t;mallesh.koujalagi@intel.com&gt;</a>

Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
strings that have no stable shape. That is readable for a human, but it
gives fleet tooling nothing durable to match on: the wording changes
between releases, lines can be rate-limited or dropped under an error
storm, and there is no consistent way to ask &quot;which recognised fault
just happened?&quot;.

Introduce a signature identifier (SIGID): a small, stable integer that
names one recognised Xe fault situation and serves as the primary handle
for triage. A SIGID maps, through published end-user documentation, to a
description and a recommended action; the driver only has to emit the
right SIGID next to the usual human-readable text.

Signed-off-by: Mallesh Koujalagi <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a=
>
Assisted-by: Copilot:Opus-4.8
Signed-off-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Co-developed-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</=
a>
Signed-off-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
Cc: Yoni Levitt <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yoni.levi=
tt@intel.com">&lt;yoni.levitt@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ar=
avind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Raag Jadav <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raag.jadav=
@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Cc: Riana Tauro <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:riana.tau=
ro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: CORRECTED is still an error (Michal)
    prepare to decorate dmesg with comp/loc (Michal)
---
 Documentation/gpu/xe/index.rst        |   1 +
 Documentation/gpu/xe/xe_sigid.rst     |  14 ++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h           |  20 +++
 6 files changed, 354 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rs=
t
index 665c0e93601c..0247a255f7e6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is pro=
vided by
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_sigid
diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_si=
gid.rst
new file mode 100644
index 000000000000..45d84a62f185
--- /dev/null
+++ b/Documentation/gpu/xe/xe_sigid.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=3D=3D=3D=3D=3D=3D=3D=3D
+Xe SIGID
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :doc: Xe Error Signatures (SIGID)
+
+Signature Identifiers
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+   :internal:
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67ada1d6c2fb..7ac3954737f9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,6 +87,7 @@ xe-y +=3D xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_late_bind_fw.o \
+	xe_log.o \
 	xe_lrc.o \
 	xe_mem_pool.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi=
/xe_sigid_abi.h
new file mode 100644
index 000000000000..99717fdf74a6
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#ifndef _ABI_XE_SIGID_ABI_H_
+#define _ABI_XE_SIGID_ABI_H_
+
+/**
+ * DOC: Xe Error Signatures (SIGID)
+ *
+ * What SIGID stands for
+ * ---------------------
+ *
+ * SIGID is short for *Signature Identifier*. A SIGID is a small, stable i=
nteger
+ * that names one *recognised Xe fault situation* -- nothing more. It is t=
he
+ * primary handle used for triage: a SIGID maps to a human description and=
 a
+ * recommended first action. A coarse first-order action is documented in-=
tree
+ * per SIGID (see &quot;First-order action&quot; below) so the id is actio=
nable on its
+ * own; published end-user documentation refines it with finer, cross-prod=
uct
+ * detail. The driver's only job is to emit the right SIGID next to the us=
ual
+ * human-readable text.
+ *
+ * Why this exists
+ * ---------------
+ *
+ * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err=
()``
+ * strings that have no stable shape. That is fine for a human reading dme=
sg,
+ * but it gives fleet tooling nothing durable to match on: the wording cha=
nges
+ * between releases, lines can be rate-limited or dropped under an error s=
torm,</pre>
    </blockquote>
    <font face=3D"monospace">How SIGID is going to handle above scenario?</=
font>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+ * and there is no consistent way to ask &quot;which recognised fault just=
 happened?&quot;
+ * A SIGID answers exactly that one question, identically across driver an=
d
+ * firmware versions, and (eventually) across other Intel devices in a nod=
e.
+ *
+ * What a SIGID is (and is not)
+ * ----------------------------
+ *
+ * A SIGID names *which situation* is being reported. It deliberately does=
 not
+ * encode the detailed reason or the outcome. Those are carried alongside =
it::
+ *
+ *   SIGID    -&gt; which recognised situation is being reported
+ *   severity -&gt; how serious this instance is (see below -- not fixed p=
er SIGID)
+ *   errno    -&gt; the failing operation's error, shown with %pe
+ *   message  -&gt; free-form human-readable context
+ *
+ * Severity is independent of the SIGID. The same situation can be reporte=
d at
+ * different severities depending on the instance and the recovery taken, =
so a
+ * SIGID is never tied to one severity; the reporting site chooses it by c=
alling
+ * the matching xe_log_*() helper (see xe_log.h).
+ *
+ * How to pick a SIGID (the uniqueness rule)
+ * -----------------------------------------
+ *
+ * Pick per *report site*, not per incident. Each site emits the single mo=
st
+ * specific recognised situation *for that site* -- so the question is nev=
er
+ * &quot;classify this whole failure&quot;, it is &quot;what does this sit=
e detect?&quot;, which has
+ * one answer. A single underlying failure therefore legitimately produces=
 a
+ * *chain* of reports from different layers, each with its own SIGID -- e.=
g. a
+ * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the fi=
rmware
+ * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
+ * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets tria=
ge
+ * follow a fault from origin to final effect; it is not a duplicate.</pre=
>
    </blockquote>
    <font face=3D"monospace">I don't think XE_SIGID_WEDGED fits this rule.
      Unlike the examples above, a wedged GT is not specific to a single
      report site and can be reported from different paths.<br>
      So wedging is situation reported from different sites.&nbsp;</font>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+ *
+ * If a site does not match any defined situation, keep using the ordinary
+ * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a w=
rong
+ * or over-broad classification is harder to retire than a missing one. Wh=
en a
+ * new situation is genuinely worth triaging, add it to the list below.</p=
re>
    </blockquote>
    <font face=3D"monospace">The information regarding logging SIGID
      should be embedded here.&nbsp;</font>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+ *
+ * Scope: software-emitted signatures only
+ * ---------------------------------------
+ *
+ * This header enumerates only the situations that the *driver itself* det=
ects
+ * and reports from software: probe abort, wedged, survivability, driver-
+ * detected firmware failures, engine TDR, memory faults and IO/bus faults=
.
+ * These are the only values the driver assigns.
+ *
+ * Signatures that *originate* in firmware or hardware are a different thi=
ng:
+ * they are produced and identified by the firmware or the hardware itself
+ * (e.g. via their own records or error counters), and the driver merely l=
ogs
+ * them as they are given to us. They are deliberately *not* enumerated he=
re --
+ * minting a driver-side id for a firmware/hardware-reported error would o=
nly
+ * duplicate an identifier the reporting layer already owns. The two
+ * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
+ * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the drive=
r*
+ * observed a firmware problem, not a signature reported by the firmware.
+ *
+ * Numbering
+ * ---------
+ *
+ * SIGIDs are a single flat list numbered sequentially within the assigned=
 range,
+ * in the order the situations were introduced. Values are stable: once as=
signed
+ * they are only ever appended, never renumbered or reused.
+ *
+ * A retired situation is deprecated in place, never re-purposed.
+ *
+ * First-order action (resolution buckets)
+ * ---------------------------------------
+ *
+ * So that a SIGID is actionable on its own, each one is tagged with a coa=
rse
+ * *resolution bucket*: the first thing an operator should do on seeing it=
. The
+ * bucket is a stable, driver-owned hint; external documentation may refin=
e it,
+ * but the in-tree value always stands on its own. Every new SIGID must pi=
ck a
+ * bucket, which forces the question &quot;what should someone do about th=
is?&quot; to be
+ * answered up front. The buckets are::
+ *
+ *   COLLECT  -- capture logs and open a bug report
+ *   RETRY    -- transient or already recovered; watch for recurrence
+ *   UPDATE   -- a firmware update / flash is required
+ *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
+ *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
+ *
+ * The bucket is documentation only -- it is recorded per SIGID in the enu=
m
+ * kernel-doc below and is not printed on the (deliberately lean) dmesg li=
ne.
+ *
+ * When to use SIGID logging
+ * -------------------------
+ *
+ * The xe_log_*() helpers are for these recognised fault situations only -=
-
+ * important, operator-relevant faults and events. They are not a replacem=
ent
+ * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics=
;
+ * using them for ordinary logging would dilute the fault stream. Not ever=
y
+ * ``xe_err()`` needs to become a SIGID report -- only those that correspo=
nd to
+ * a published situation.
+ *
+ * dmesg vs. the machine record
+ * ----------------------------
+ *
+ * The dmesg line stays close to a normal xe error message so it remains
+ * readable for admins; the only stable, machine-matchable token on it is
+ * ``SIGID=3D&lt;n&gt;`` (``dmesg | grep SIGID=3D``). dmesg is not an ABI:=
 the surrounding
+ * text may change freely, and lines may be dropped. The durable record fo=
r
+ * tooling is the CPER record carrying the same SIGID (generation is a pla=
nned
+ * follow-up).
+ */
+
+/*
+ * Top level Intel Error Signature Identifiers.
+ */
+#define INTEL_SIGID_INVALID			0
+#define INTEL_SIGID_GPU_START			100
+#define INTEL_SIGID_GPU_END			999
+
+#define INTEL_SIGID_GPU_XE_START		100
+#define INTEL_SIGID_GPU_XE_END			299
+
+#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
+#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
+#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
+#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
+
+/**
+ * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
+ * @XE_SIGID_SW: Software component failure. [COLLECT]
+ * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
+ * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [=
RECOVER]
+ * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]</p=
re>
    </blockquote>
    <font face=3D"monospace">Going forward there could be multiple actions
      associated with survivability mode.&nbsp;</font>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+ * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC=
/GSC. [RETRY]</pre>
    </blockquote>
    <span data-teams=3D"true"><span id=3D"message-body-1786528056733" class=
=3D"fui-ChatMessage__body rxl6n3s ___qx8e4n0 f10pi13n ftqa4ok f2hkw1w f8hki=
3x f1d2448m f1bjia2o ffh67wi f1j6vpng f1pniga2 f987i1v f1ffjurs f15bsgw9 f1=
4e48fq f18yb2kv fd6o370 ffwy5si f3znvyf f57olzd f4stah7 f480a47 fs1por5 fk6=
fouc figsok6 fkhj508 f19n0e5 f9ijwd5 fx91ewl f1deotkl f1o0qvyv f9ggezi f1xp=
5gbu f150uoa4 ffyari3 f16xq7d1 fo7qwa0 fa482kb f1jr86fo f19jalt7 fi0x08t f9=
qyqwh f15pwueu f2q1wh0 fu6ncsl f1wtgxlg fxowb0n f11ghf3q f13aoclr flypziy f=
10kwr27 fquw1qa fftr39l f13lathq f15hsm81 f2ss68y ffb60jq f8nuap2 f13nk4fk =
f7jacry fq08z5q fd9af6s fr74w9q fcl9uv6 f13sm7pj f1u6qqly f16wpxbl faim3u9 =
f6cs3qo fa2w2z3 fd39nx6 f10gn8j9 frcqmxy f1w9ws4k f1ddxkqj fd10euv fvuz61 f=
1nbc6gw f1ja1rz f1ymf5kz f1xki53d f8ntl2k f8nx4az f1y6etj3 f1b2y2l2 f1qb14j=
r f1h272qk f1ywigw8 fzvs3e4 f1rvyk3c f5fplu3 f1l4y2qi f4yr49c fxgblah faww4=
f1 f1oqrsiv f1nn8nf5 f1wss724 f2ub9nf fpr7uzl f86vlxv f7ay0zw f1j33hpw fp3o=
mr5 fpqnlqw f1y5pldk f1js6ppi f1q53z8i f1gpkjrl fy6lk3x f84y745 f1dfpw40 f1=
sapace f1eq4dpx f1uf550z fxtgol9 f6yqf12 f6trq0g f99bedm fim7mkj fdc55jo fr=
che94 f1pn7o2n fg127dc fanjz1e f6h47bw ffd45wr f1j14d18"><span dir=3D"auto"=
 id=3D"content-1786528056733" aria-label=3D"Are we certain all fw failures =
lie in retry category?" class=3D"fui-Primitive ___11tzqds f1oy3dpc f89hs3r =
fqtknz5 fyvcxda">
          <p>Are we certain all runtime firmware failures lie in retry
            category?</p>
        </span></span></span>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">+ * @XE_SIGID_DEVICE_FW: Drive=
r-detected device firmware failure, PCODE/sysctrl. [RETRY]
+ * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).=
 [RETRY]
+ * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
+ * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
+ *
+ * The situations the driver detects and reports in software. Values are
+ * numbered sequentially, are only ever appended, and are never renumbered=
 or
+ * reused. The tag in brackets is the default resolution bucket (see the `=
Xe
+ * Error Signatures (SIGID)`_ section).
+ *
+ * Firmware- and hardware-originated signatures are not listed here; they =
are
+ * logged as reported by those layers.
+ */
+enum xe_sigid {
+	XE_SIGID_SW			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START,
+	XE_SIGID_PROBE			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
+	XE_SIGID_WEDGED			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
+	XE_SIGID_SURVIVABILITY		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
+	XE_SIGID_RUNTIME_FW		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,</pre>
    </blockquote>
    <p><font face=3D"monospace">Is it allowed to maintain each firmware as
        separate site?<br>
        e.g. XE_SIGID_RUNTIME_GUC_FW,&nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp; XE_SIGID_RUNTIME_HUC_FW,&nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp; XE_SIGID_RUNTIME_GSC_FW</font></p>
    <p><font face=3D"monospace">Thanks,<br>
        Badal</font></p>
    <blockquote type=3D"cite" cite=3D"mid:20260730152121.576-3-michal.wajde=
czko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	XE_SIGID_DEVICE_FW		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
+	XE_SIGID_GT_TDR			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
+	XE_SIGID_MEM_FAULT		=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
+	XE_SIGID_IO_BUS			=3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
new file mode 100644
index 000000000000..70a41bdf1a01
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#include &quot;xe_log.h&quot;
+#include &quot;xe_printk.h&quot;
+
+static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigi=
d sigid,
+			  u32 component, u32 location, const void *data, size_t len,
+			  struct va_format *vaf)
+{
+	/* TODO */
+}
+
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return (int)sigid &gt;=3D INTEL_SIGID_GPU_XE_HARDWARE_START;
+}
+
+static bool is_sev_error(int cper_sev)
+{
+	return cper_sev !=3D CPER_SEV_INFORMATIONAL;
+}
+
+static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
+{
+	return is_sev_error(cper_sev) &amp;&amp; is_hw_sigid(sigid) ? HW_ERR : &q=
uot;&quot;;
+}
+
+static const char *log_sev_prefix(int cper_sev)
+{
+	switch (cper_sev) {
+	case CPER_SEV_FATAL:
+		return &quot;FATAL &quot;;
+	case CPER_SEV_RECOVERABLE:
+		return &quot;&quot;;
+	case CPER_SEV_CORRECTED:
+		return &quot;CORRECTED &quot;;
+	default:
+		return &quot;&quot;;
+	}
+}
+
+#define __LOG_DRM_PRINTK_FMT(fmt, args...)	&quot;[drm] &quot; fmt, ##args
+#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT(&quot;=
*ERROR* &quot; fmt, args)
+
+static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct v=
a_format *vaf)
+{
+	if (cper_sev =3D=3D CPER_SEV_INFORMATIONAL)
+		pci_info(pdev, __LOG_DRM_PRINTK_FMT(&quot;%pV&quot;, vaf));
+	else
+		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT(&quot;%pV&quot;, vaf));
+}
+
+static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const cha=
r *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt =3D fmt;
+	vaf.va =3D &amp;args;
+
+	log_dmesg_vprintk(pdev, cper_sev, &amp;vaf);
+
+	va_end(args);
+}
+
+static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sig=
id sigid,
+			   u32 component, u32 location, const void *data, size_t len,
+			   struct va_format *vaf)
+{
+	const char *hwe_prefix =3D log_hwe_prefix(cper_sev, sigid);
+	const char *sev_prefix =3D log_sev_prefix(cper_sev);
+
+	/* TODO: add component/location details */
+
+	if (IS_ERR(data))
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s(%pe) %s%pV&quot;,
+				 sigid, sev_prefix, data, hwe_prefix, vaf);
+	else if (data &amp;&amp; len)
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s(%*phN) %s%pV&quot;,
+				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
+	else
+		log_dmesg_printf(pdev, cper_sev, &quot;SIGID=3D%u %s%s%pV&quot;,
+				 sigid, sev_prefix, hwe_prefix, vaf);
+}
+
+/**
+ * xe_log_emit() - Emit a structured SIGID log entry
+ * @pdev: the &amp;pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &amp;enum xe_sigid
+ * @component: component identifer
+ * @location: location details of the @component
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not ap=
plicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Emits a dmesg line that includes a single stable, machine-matchable tok=
en
+ * ``SIGID=3D&lt;n&gt;`` followed by the optional severity token (like ``F=
ATAL``) and,
+ * when @data pointer is set, either the error printed with %pe or a packe=
d hex
+ * dump of the @data binary blob. The dmesg line will also include printf-=
style
+ * text message.
+ *
+ * Note that the full dmesg line, with the free text message, is only a de=
bugging
+ * aid, not an interface! Only the ``SIGID=3D&lt;n&gt;`` token is stable t=
here.
+ * The durable machine record is the CPER carrying the same SIGID.
+ *
+ * Note: generation of the CPER record is a planned follow-up.
+ *
+ * Examples::
+ *
+ *   &lt;3&gt; xe 0000:03:00.0: [drm] *ERROR* SIGID=3D104 FATAL (-EPROTO) =
Invalid GuC reply
+ *   &lt;3&gt; xe 0000:03:00.0: [drm] *ERROR* SIGID=3D106 (-ETIMEDOUT) Eng=
ine 'rcs0' hung
+ *   &lt;6&gt; xe 0000:03:00.0: [drm] *ERROR* SIGID=3D103 In survivability=
 mode
+ */
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt =3D fmt;
+	vaf.va =3D &amp;args;
+
+	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &am=
p;vaf);
+	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &amp=
;vaf);
+
+	va_end(args);
+}
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
new file mode 100644
index 000000000000..d475e816ee0b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+#ifndef _XE_LOG_H_
+#define _XE_LOG_H_
+
+#include &lt;linux/cper.h&gt;
+
+#include &quot;abi/xe_sigid_abi.h&quot;
+
+struct pci_dev;
+
+__printf(8, 9)
+void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		 u32 component, u32 location, const void *data, size_t len,
+		 const char *fmt, ...);
+
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------1eHLTjO0L0uRflFPzHOfaqxN--
