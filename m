Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C56DC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 11:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43ED10E7D3;
	Mon, 10 Aug 2026 11:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDAeLy6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0910E7D1;
 Mon, 10 Aug 2026 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786362225; x=1817898225;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n3qyveAlYsRZJnwwkLCj2qPc4noef6Nl5sogm39cdQw=;
 b=hDAeLy6bjZlwru7J8fBuIKwrq0DxsCfAXV660X4YZQvOArzwALxFCC9v
 uUswZTFOD/8CbKVqDVxqzKVFyazcuaFvi/5Bdqo1+jFNwdzGmLulDQXNo
 hTasRwCh2RcZ3mJovyJsJm4nlZ0s9hYCg/P6kLLmXUHNg9/4D+QvkXT71
 PnubhC8A/yUYVg9KXCIoW+3b82YBzTb7RgPkOL0KuKWC04gAZgUFPPuI9
 4RIJI5J6WMPJAJZPZku6ean4JywZVla9do1PlsTRuyBIAjAv1mNTiz+9T
 Oy+GRaDMIeTquXHXV0eGQTp8Fmd3TMMLnM0BN5ysgGbsAejRz2JENvj6q g==;
X-CSE-ConnectionGUID: uhHWR7HnS0em9O6DVB/pkQ==
X-CSE-MsgGUID: nz86wVFSTimy6BLeal6NPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="87089851"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="87089851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:43:45 -0700
X-CSE-ConnectionGUID: iMgjf1VhTTqn06/i3xkgUQ==
X-CSE-MsgGUID: FnQFZaK4THeyvTOwxgNh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="263629461"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:43:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:43:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 04:43:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAmO2nUKGa/FIWvP8pPzBj8nQvVG+ie1/Alq7TN/wkrH4kDXbf0WyO2q7j4sEt/yyn+QwYgzGZ0Nic4tRH1bMNyJ2cQZVRxwFivowZ4uyxYGcLYE/SN4XfMb5dfGOylRhTDEU0Vd4bdcuIoUexquEo/T7FS564jScZNzlpJ6n9QgBceT3CY5/f0wJNgtB9IL/HGPl0P0XBuWWLMT8QliP8VlOBhYtrD67VeNBtJaB4Nbtv5iKzC2jk3sdT/AXrVvvU0TXx2ZgdTSHz41R+vOdjrj0SWivZSoNGmSYT1P13YlTpyMp4T1caWhf4jAIULGCZGDxCIIJ9JeAjIUtwPL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GAkZAkdVMFKHZGlio5EA1SN0mDkr8Vvj3UtkYQhYUY=;
 b=WKXznaFBB7vPjaI4egtV8IXZJpBkv45fiJdjImATX9d2kIQUewjqJhYLFX6Vr5i4LhZSLqPElr8+VEBUYroVEO7pn7dpJeOU1PmBvN3hxV6JVsOvtxIGdngdypbJalW4E5/hbreQ9Mq5i5VGiY2fd0CaMjvoRsxU0c91IaMRBfxKwqFuJzqhP9C7Z2L57RB6F8WFfvOz93VXrOmg8HozIYHYW5zuGxQ67bXL3YVNLbAJVotdDHbXQw6Z1pKVLagup2fnD1pQBjG5+5G6SAL7EK2XdE5s9GX9FZxCbKOSP6RdOVekjgxgYgyGo8mWEaXah7SOHHNa0idLWRCBz1xbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 11:43:36 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:43:36 +0000
Message-ID: <91c02d0a-28bc-4742-a80b-03183934135a@intel.com>
Date: Mon, 10 Aug 2026 17:13:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/i915/debugfs: Reject invalid force_joined_pipes
 harder
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <cover.1786105831.git.jani.nikula@intel.com>
 <df39b8f30d27a441465b4d9bd42d4db982e5db2b.1786105831.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <df39b8f30d27a441465b4d9bd42d4db982e5db2b.1786105831.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::11) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb07f4e-e827-403c-7ca2-08def6d49d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0MocQSzcTMw+DLBYBt+EKrRxX/7ndOuJ1I5/U06KacLzriaZgX/PIDyAiN6r67gsEDA8TnT0nR0MQN8tMr7zCg3CD5BEzyVjguGn5pq8Z5qBuzyUfJtgHNvQr3bc9QVXFxqQQebDQtNFIl7La90iFFMUZcPTmfYcyWKGd9E1jn/H7W+3xdcQDOj4WLm+JYR3GpvozMVEn0w85gyt88ybQImEo3qY5AN6jOwG5XeCuLm57uFqXKpQKCb5MBZ5+pbk78oIGOlwNA/3Jcp2N8hZ/xC5RyMHAg1FVtaMfvWq3jSl98NVp1K7WCsmopgl+m6TmIT45R8NrRhbqLUzjDWtqRMmhk3huryY3TtLOYqeFSkaeuPzqcXAevWB2epjYz/jG7WKa4sx5vbbdL7e7mtZBaSHY7vlyVzpBHgH/eyUd0xXpXRuGvv/gj8g6CODCZSp1Z4LfTHY/og8K7mwTCyuzM1hOPgCzI5dVkkDDe+keA3ZneQcbWvxzbDSqB9YI/sUfZqGBmuZp5+vsiEk4wlOEuxfzUJCw0jrvnMDLJS8Mt8SP155yHaYiVaUXTTyKbVSZ3B8iU5mHiLTfkuPUpSzwbMXD+XTd+q0yTwb2PONyEn11zxynXKzvGQvovqCcmP15vcZ6vXXmHIZVxXAfnoAaSqjAfJIRsy8TEONPoIMbvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3ZRODQ3WXUrdCtkRDFvaWJGajgrd0g1UmlFMmt1SmUrN1JsTFc3YXpIWjRL?=
 =?utf-8?B?ckhTSmFSR1lWSHpTS29IcWNFbjNQNmNsWjRmVXRnazIydkg5djhWQmpIbXdH?=
 =?utf-8?B?K0czQndCUmZqL2loTjN4UXlrZkc1Mm4vWlNUNE5Ld3F6T2RIcXpia1FxeEJi?=
 =?utf-8?B?a3VraThLRVNhTjJPMGt0OTVFNWNKT1FqQkc5cktvL2tTWXYySi9MWGV3aTBV?=
 =?utf-8?B?cUhYZ1pFZWhKUTFUOGlyRjlQZjhsaUdPR2JXMDBVdk0vOUJmSmk0UWtWOEQv?=
 =?utf-8?B?NllJczR0WXFFaURKOXBNK2RoUVNtUHRmZGJoV3hqU283MEtyL3NicWNwd2hi?=
 =?utf-8?B?cS9uRGFiS1h4MG5BZ1BYWTBtdnRUZkRqelprYTE4MEVocEVoL3N4TlloMkpq?=
 =?utf-8?B?TzBpemZRMUsyL3FXcy9mZ3hZbDYwYkFJckkvQnlhOE1QMjQvdVhaRjl5SXpa?=
 =?utf-8?B?THNmVG85NDRQTlp0cVVWSUdSTHJrZDJaSjM4dzJRbVRPaktOMFdRck10UWZJ?=
 =?utf-8?B?eUNFV1NNQTBTb2taUnpyTjF0a2NCNVp6TDg4SUhLRmd1cVk2N2sxZE5qZVAz?=
 =?utf-8?B?dFV2azNUZ0ovNlVzZ21QY3Y3VlB6bmFqUGxuZWpETEU3dEpRbkJjU1A4Rk9S?=
 =?utf-8?B?bHAxdnhtNnZnWVBmWThkcUFDZVFURlFNSDFWQlljM0E4WGh3dTlFaVl0d0kx?=
 =?utf-8?B?Rm1FZlBlZnRQbERGN3pLYjFmY0RsbHRMMlYwOVhjd3cwVWdXWXBta2EzSWlp?=
 =?utf-8?B?Z1B6MG5JdzB1ZmJ2cDdBRlVHWDRyTFQzMExLMWRPWEhWM3VLbDlUY1JRbm9j?=
 =?utf-8?B?WGhxOEFOdmMvejlNOE10ZElXaXM0VTRFdDRLZ2NrdzRyQWcreWZncUhpL1Er?=
 =?utf-8?B?U29aMERZYzZHamUra1REbnhoNjJOVWFYWUUxcnAzOGM3M21Mc01xdXFDZ1pw?=
 =?utf-8?B?YlJHSDgrYjZwdi9oTDl6NGRSSVJ2dFR2QnQ0YTU1M1FuTGF5SkFyTUd6L0F6?=
 =?utf-8?B?Zy9Ta2FxMERDeFYyenBRUlFXa1pSZWs4dVpvcEsvaGxaaUl2WE5WWG1JV01B?=
 =?utf-8?B?aitFejVPUXUrc2I4QUtKb1dkdHgrN2oyc1ZHTEgzQ2tsVWRQNUlHcTBJbm41?=
 =?utf-8?B?Ty9VY010VHM4YitjS21mQWZmUitLbXM4azB4NFY4RU5GbDlqdHI0SVQ2K1dV?=
 =?utf-8?B?eXpqMkFxbVo5VzlkRzg5b0dGbDZRZzVJUXE2ai9OcXEvRDZwKzZCSFhTRGRj?=
 =?utf-8?B?a1VYV0swQjNmSHZzQTJzMmw0bnBDN1JYRjRKWXFsQzQ1QlUzMnBJdmxtcU1t?=
 =?utf-8?B?T1A0WDNpSEN5SmxOczVJL3c5ay9hdHdXbkNISXpFcm84NmpGNUIrZlg5Y1Z6?=
 =?utf-8?B?ek9GdW1EOUpVT3Iwd0xjbUVWY1hPeWVvQXJOZW5RQUcrUXlVbXhSQ0V4dTVm?=
 =?utf-8?B?R2lmbWVic0lneUdLWkJPb1BSVVZXUFlFaDJNM0YrMFdMQWhIU3FrbGZjbFBS?=
 =?utf-8?B?ZlJXNEFjWmlROHdyVUxYUFE2eWJuMTVBYUdBNHpHTmYvbkcrK2w3bWFFY1Fy?=
 =?utf-8?B?dHlMV0NXZTd1MmhWVGFDdU5wcUdFTFc5WUFNTTUrVVkxcVphenhRQU1NUHYv?=
 =?utf-8?B?VXNBYlU0ZmZVczA0V2QzL3MwZERtM0NPVXBNUWVGQWRXTmhRK0FkU1B4cXg5?=
 =?utf-8?B?V2t5SW53cFRYSlZXRE96Z24zSEprRG5xVmFmOFJvU0JSM3hYcGNPbDBaeUNr?=
 =?utf-8?B?ZzdoN1VtNU9ERTRFMElQVUh6L09ReldGVnp5ckFHZlFVbkJaaWNXOVlHTjBo?=
 =?utf-8?B?SzdsUFhCay9YL0pKdjlrMkJlb1kyTmRnMHNjUnA5MGhiZEYvSWwzOWd6VVRp?=
 =?utf-8?B?ZFNDSGw3bTE2d25iNThmWVVLK0xnTnl4WFUyVGFvbmEyUVo4a1BZSlhRdXFQ?=
 =?utf-8?B?Vzh5QndZVmJLNVRwUVRFTWFCTVNHeEpibmxQeE1XZjliTVNTbFQxaXFCbTNr?=
 =?utf-8?B?SUY4d0NhVDhkbFNZTFJXSStQcXk4Ymd6TXpxeDIwOWZpYmN2SDV6U0hCRis0?=
 =?utf-8?B?TUNCZERzeTdEbVlEUUxYcmtmWHp4SWVZcWU2Y3hvdEx5L1ZpUzBQSnZ3bGt1?=
 =?utf-8?B?ek5vNFhkbjJYMXFTZTRub2t5MnR0d0JxRC93UDN3dTkvMFBsK1gySFRlZHpl?=
 =?utf-8?B?ajFJTGhmTUJKRko1ejh1TmVuclhlSENIMmROTVZFVjI5aGVKNjE0MmN6S3F4?=
 =?utf-8?B?QTF0bGxjMVdpemhEa2ZFVVBrWHJFVitWRjJYUEUvNGJRWmtrT25EOTBBSG15?=
 =?utf-8?B?QTVpcDBBay9FUm84RDhnbmYvM0RZZkJEa01pRHNxMjBqVStLaDl4bUtYVWg3?=
 =?utf-8?Q?B/y7r1Wm+SJl8I3U=3D?=
X-Exchange-RoutingPolicyChecked: BtVxq9iZI/c0vmp8UA76qbvIuZbZA2aMR2CG4yW6LggaoD5LAUGM5Pq5yvN3MxCcTecFM54bYIS03TBtGH89BYQUp743X9UU06hxeOUJqocmg7r93BAP5//QahHH/lvqqCSRJSIrLNSg9pXU62F2lQBN3Eha88d6vQnd6myDC0il57LqlyaCGsIGkWKVLgszG0UV9/x1Fk5FtkCHQgolf6JRR07FNG1RUnf8sT0nHiOy7+i/Dx/XZU7QqhcB2Uq8s7TG4j/Fc/TagHAXvhxT4K548fLo0eVIQseMtrNnrAOTCGH00/kJVcsBWTciNwNOfFvT0VJS1Xsh0Rn8ZtIPBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb07f4e-e827-403c-7ca2-08def6d49d29
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:43:36.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ7C7ApGkLf6XYPA/XLnMFBo2GnY2pkeOB5Q+DxKKXXpKjKIBhRYQX07yHW9aZOF87hSZEr8R7vxDvWq7SeP7XYq5GfrLDuhjzKeRE43NUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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


On 8/7/2026 6:04 PM, Jani Nikula wrote:
> Reject invalid joiner forcing more thoroughly, taking into account
> whether bigjoiner or uncompressed joiner is available, and whether the
> requested number of pipes can actually be joined.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   .../drm/i915/display/intel_display_debugfs.c  | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 2bbf4760dc30..3e302f23f247 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1285,22 +1285,11 @@ static ssize_t i915_joiner_write(struct file *file,
>   	if (ret < 0)
>   		return ret;
>   
> -	switch (force_joined_pipes) {
> -	case 0:
> -	case 1:
> -	case 2:
> -		connector->force_joined_pipes = force_joined_pipes;
> -		break;
> -	case 4:
> -		if (HAS_ULTRAJOINER(display)) {
> -			connector->force_joined_pipes = force_joined_pipes;
> -			break;
> -		}
> -
> -		fallthrough;
> -	default:
> +	if (force_joined_pipes &&
> +	    !intel_joiner_valid_primary_pipe_mask(display, force_joined_pipes))
>   		return -EINVAL;
> -	}
> +
> +	connector->force_joined_pipes = force_joined_pipes;
>   
>   	*offp += len;
>   
