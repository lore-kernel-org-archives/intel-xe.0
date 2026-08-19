Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D613C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 10:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A030D10EDA6;
	Wed, 19 Aug 2026 10:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brscvTsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1820B10EDA6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787135435; x=1818671435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mJDqpycmVV9wx/u/Q8cYHd0i91bVXsO3dYRGmcOI1Bo=;
 b=brscvTsTevShGOZEO4yAIZqEYAxOU5N8UQxfm7EVtp+6sCdDsyB07qpk
 jp8f7Ch0dHX5dglX26SK1VkzBm53s4cziLYVPxhIquyZyatvoFU67AR5f
 o4+EQGS2J5ljJKpCL78Jx5A2uekShMRjtYa4bFQ7A0AhwM4q0zaCqfHZG
 bcVYmwBc3s9dSgjxprBewB5UiD+fe2OAXO++1xiUdiwQ1vMCqxgmmd/Pt
 Y8f5RSpSbX+heZv9UzkrzfrqBUie3lyy8SYR+gIFVzhEQoiphP0ovMIXM
 8aKYlPagUb+vPLt8yQcT7UTDz27q5lsqKcJ/opOXubuPfj0I5BTPj9hdD w==;
X-CSE-ConnectionGUID: CWNUIzD3Rm+l8mVVWtlJZA==
X-CSE-MsgGUID: ZjhHLESjTc6AnoT8GT2/2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110429909"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="110429909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 03:30:34 -0700
X-CSE-ConnectionGUID: eObUtR/vQUiU6z460aVuyA==
X-CSE-MsgGUID: u3fQRDvQTMm1jT3N42OcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="289015573"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 03:30:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 03:30:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 03:30:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 03:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR+6I3YuXQaTdmjypOvfH8gsP8ycFOq4q6AX7TIbYIPHHAdyKYhxOeOT6RmG6AWGniaFfVfAavw81niVGSOwJTGP3Qf9TlYBQ5P91mS63iP80Zk7I5p7pFjRQXO65rkhclH/ZENdwx5duCfgFbAB4IviCzykv51WLVbSMQKtHsSBn9SQydD41m4bN2slt/PELpFqmN/nc426kUdlD+7X+g2I+gs9lEXaqC/2+H6PGiCgznIQdBx9aU6DLVUshB6B2FWWsbbhqcd0VDvNKva/sCP+QG7vzDdH4amTU9esHLCcJXFCFS+JqMnnlx7/bfQwdJ/pvlJcyJ4j7iHPtvKnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clOFY+wj+mIVyACbGEXhoZpVQAgj+6D1EpI2hAruKKA=;
 b=tmS/rBmYdVvJA9NDhd68EMEqlXFk6XKlTRK6Ym4Y9st6YbHiJnPUbtXUtDxvmWNo1GOrztC2mJDyLlvdZ358rrhc0E2O2mawuq83u/IyQfAEssH+cBwaiTB0/5Zvko/zRV5+3mGoAqnd1T2mZMlzAPv56vN8YK0oYT8pljHbpiEmdP4V3YEGUIZhIWVhOTpvCQCjGSoz92+FvI+Zv1uOJFk/Um7mD7jsare3vdMs+8lmjpzIufmzURNgBdrfgdsS5DiBJc1Gk9W5CYqiMku4ymdWKfm3zHKWp6ilfhbpec4OkHKybWqJNI8MSLM3d2+kgdLYNuZFr++YFM1J7dta9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:30:31 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:30:31 +0000
Message-ID: <0edbf68a-3d07-4eb3-9a60-6698de6bb805@intel.com>
Date: Wed, 19 Aug 2026 16:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pci_error: Allow debugging PCI errors
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260814143121.390791-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260814143121.390791-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f4d487-968c-4a04-17ef-08defddce4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: KoaEC0GsANsTBaFxNiQM2nOjig78zLf7XQXk7B5ZmKGdomg+zOOLLtEhdvdHytHJjzx7/XxbNFmAm0RIZ3y8kxWmp1QWSz7O7DfnafmMZOQZL4WsTpVJYQkUR7OkgLIqVREjOUiL/keLJ3PNGBSfd8wl9ya6NbPuSYYagOL8M4ImGgqTY6S0sFnGc/eq/1Xpo35aVaUqVEF3zVus9OGtOQr1IlKWx77O/nailTmO2L5Ve16q5v0Z2otYrp/iHtsPfzU36s3acinrW7ctsOXIc272ZTAnhrTeB/qtqdoEk5AnDFu+E1vu3i9A13hVediiqpBjOcY7EfLHMquu2Mz5U0V4yrXwpxFVJCUVZAILUVW3AxsouYegHTOa5VzuWLTl8omYqORnPwJRAQjsA94AJDeUDpIOncx7WrGK4qL0wW3d75DELKiL8hwDklslWOczjUn/qlhuI7ef5b3L+t6AyIAhJfHYFwEGYe5956Ox1x6UiKinl2GgQxxVpEZJfeFsJE9PxvrnfCLsfbJKEPHK2LkwcCa7/AbWbu/P6pxgU46e87PaHfcsKXvF4PSl1d9Z/0IEiH1pvovE30VLX5nut1q1RZAQlxEM82OGMPAJ50I/lfDVC3VZif5Lze2CLU2bbtfPlFYhd+tKHy2pjdZgHQXZsL8NWI/6cI1itbnXEzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ums3ZDA0Zk96VDVDSzUwV1lTeGVxN2E3K1FVVFQ5RC93SFpDdjg4ZFBxUW5n?=
 =?utf-8?B?Y25sN0VEMm5tbUEzVTU5ZUt3ellLdEM3MGs5MjRocWQrU0M4OXdSb0h3KzFQ?=
 =?utf-8?B?aUwxQVBYZ09XSnUrUHdPUDkwQ2lVUHNRNVlNeUQxSjBaenZBSEVXWFdPMXBL?=
 =?utf-8?B?c0ppMTZIT0UveHBFQVIvOVJOa0hJWXlnTW9CNmJYSkNuSE91SWk1REc4WmFI?=
 =?utf-8?B?ekhYc01XVDgxSGNVelo4WkhIWElRWk1ybXFTSkRxUjJpTDVqeWJTYWpuczhX?=
 =?utf-8?B?c1J4NXhLSXJpaDYyVE9hZmNhUWNWaDNhWHBjTmtGbVJ6MFV3UVNuZzRyeWV1?=
 =?utf-8?B?ZzB1M0pBYlEwaU1JQVRUQW1VUFYzWVhXNjcrSk00Ri9TMmhKcUhYWUJRczVs?=
 =?utf-8?B?alRBNHp1TE1tSW9SZ3ZWRTg3QVJudUFoYTErVGpQNmtKNjVPRGZ6ZmJBVFBO?=
 =?utf-8?B?UmtFaGE2NmM5RnNCS0tKZFRhUXBiRXRQL1ZnTTdCT3Z0MklJbmdTZ0NIdjBT?=
 =?utf-8?B?Y3Erc0QyT0lDWUNJdFp1MTFNdGowNHhYMXdPd3NSRjI0cFE4Z1c0L25tRE43?=
 =?utf-8?B?RkpseFE5ejFzaHRYVC9JVndxSFVuRy9ESVBqMTNMMlVyNW9lMUJwTnNXYW10?=
 =?utf-8?B?QTFyc3A5bm9VcDZ0M3hSbUU3SUsvVjBUN0JtQU1sK0pFNEo3bEFXUXFUZFZx?=
 =?utf-8?B?YUpFazRyRkxoZFJ4cE5mNURqTXBsakN0N1E4T0RYcFhodXdTb2NVUEh6UStr?=
 =?utf-8?B?NjNEdU15d2tDUkNMWldPTzRZZnJCbE1vZVNOSjl5WmEvQzFpaU0wLzFKZ2ZK?=
 =?utf-8?B?dmtRU3haREx0alhNZno4MUNXeUJwUklPQnRsN25ZelR5SnpQTFVja2hnbGhM?=
 =?utf-8?B?eWRkNEhvVEdTV1VpVVpJVVo2ZTZGd1ZyVjk0ZldBaVFSZzYvMHd0YkhpMENZ?=
 =?utf-8?B?Ni9FNlRhNWkxQitqZDZkUXo1aEtyUXBkVDNCQU1XSjgvT2J4dnAyeDRiVDNI?=
 =?utf-8?B?czU0UFdTbXF3Q0Rrc1M2M3NMVFdBcVNBTXdJRmt4Z0ZKeVpyQlZGRkk4bGta?=
 =?utf-8?B?U3JKMEowcENmOVM0a3JhbXVWOGpnNHJDdkVzUE9Gb05xTTNFSGNkSjdVak8z?=
 =?utf-8?B?VnJoRzBjRC9pQUk2bFVDbktRS2puT1BYR2JFR0V0VUFwZDBqWGl0OTQzUHBJ?=
 =?utf-8?B?MUx4aXYrMEVxSHBzZmhXYXMyenpHWWRUcFJZSTVqWUhwbXc3WWFMNi9udWJG?=
 =?utf-8?B?ZjVCSjN5TnZpOXBVaVczZkhpWHdtbldaOHJncGVRNXBLZU1LOEFRV3JsU29i?=
 =?utf-8?B?MEQ0ejh5UUFVcjhGTUE5bENsS1phbGlrdFJBenh4MjhYSFA1U0JNdDNiYTZX?=
 =?utf-8?B?NXhnZU13bUhGbC9laHJ6NkdISGpwdEJwTGh2UE14SWN5M05wZlB0elY5N3ZN?=
 =?utf-8?B?WXhKQ2h3T2FRbmFpRzhaVzhlUkwvV1lPVnQ4eWRRb1Z2MjdVOTltZWJnSTdu?=
 =?utf-8?B?Uyt5MC8yenduU2k3eDBWOUJpT1BZRHovRnhNZ0NYQW83MHNscExNVGpkN2Y0?=
 =?utf-8?B?WkppRTdyeUV3eXkvQmFGcEMxMk8vUHY4bnFKeTdnRzNsNmtvUkhBV0ZOZlA0?=
 =?utf-8?B?Vyt3WWhCR3ozYnU5Q0lwVnFuUnZSdjRBTTlLYWNKR3IwdU1MZ0FHeW1VOEFk?=
 =?utf-8?B?d20xQlEwSHNUUGxBUVlBV2praHRUWVcvaEdFWEgwRXMzTlA3eStKK1dmTzh6?=
 =?utf-8?B?WXFBSHJLS01RNGhwUjNlWkprbmk5RjgyYlZFdTBOTUJFZmJpRTc4NHFqbU85?=
 =?utf-8?B?WC9DSDRPN2U4Mkdjck45aGZwcDhSUDBKcitMcUxTMm9nK2J4Uit0RTUzd2gw?=
 =?utf-8?B?UXJ2dzVndUVMa09aeUpBUU5SRE9tbThJU3AwWVM2VWhxN2JNcFZKMWlKWm5F?=
 =?utf-8?B?blEyUkhwdkVDL0dYMHlTeDlNQ0R1UEd1TTNVd1VaV2gxRGduZGphK0VEVHF4?=
 =?utf-8?B?c2dPZi83MjF2QklJRU80MTN3VkE5UGg1OU42Ulo3dW8xY1BZRk1QTGNmb29R?=
 =?utf-8?B?a3Z5YkROTlR2WmI0S2V2VHNRWGhKYXZNSmtzVHZRUW5tSkMzRVFFSVVweU1J?=
 =?utf-8?B?NmxMVkVKWFdNN2pGa1JNQmo1STRRM3B1RUNEM2hiSUpFY0NVMnBseXN5NTJL?=
 =?utf-8?B?dG1YdEN1VnBXMFFzUFV6bUdBYjFaWEIzWkxXZGdUYlpwRm45K2NjSWJ5LzNY?=
 =?utf-8?B?bDF3alRVUWRXNXk2bGhFdVN3T0xDZ0ZoUWNQMk1kaTlNc2ZuckZKeWZXK0tI?=
 =?utf-8?B?UmdCRm0vNkJCUUluNFQ3WHJLeVArRkF2cXlPSElpSVNONk1WTlhNZz09?=
X-Exchange-RoutingPolicyChecked: Du4WmxdalNzfTuvmeoDvymj9W8Ew5wacM4Z49xB3zJuLfqXuFTkhRCUP4LigBJrgcGvI3cIJJkBfUdehRPuYTE6B/xk/4iw+Tf4KanJZfg9HzD0+ATnJGSjtm1M3lB/Dcqtj86cJ6JKF99/i4utq9a/dqL1LzSLnbO3zSaqXnZyMtc+wsbBtN9KFA3QSKwjOSVPqjAQVeHeEW0jZKsy4sPM5LSuGIQpet4ucIeulHn/K9mir2Jb3Uo2yM/sUi4j9wJm5tncSK65j58/4QIrnMOp0tTBxbS/dAbsRrVCbSE+8PiVqvk3xyaSJ04BUZ6GEuNIZH18XBbwndK4jigLQpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f4d487-968c-4a04-17ef-08defddce4ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:30:31.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ql4gNWi4oG5k5S2KwfonsIT/rAohDprS10//JaAnaJyCXISrTASdaLhSuW6KKT/+sTNLVVje/ZnxUMtwozzs4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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


On 14-08-2026 20:01, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs.
> Disconnect the device on AER and prevent bus reset, so that it is available
> to the user for debugging.

Please rephrase this according to sashiko suggestion.

With that fixed

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index e41af2ac7f23..4858ce2f9c19 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -63,6 +63,12 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
>   	switch (state) {
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
