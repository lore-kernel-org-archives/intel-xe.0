Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E72D2FFF8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 12:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C02A10E8FB;
	Fri, 18 Oct 2024 12:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEq3newz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763AA10E8FB;
 Fri, 18 Oct 2024 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729253314; x=1760789314;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LWp4o27wIKYuH0M2FCJ7/BbpuDOQ9/7ZyaR0CE/VbSw=;
 b=aEq3newzvRQvf1gK1QrLe86ZTb+OUXx7+KSupSr6dhbWhhA03G49TnoM
 XeI223TYnreMbIjdnhTHa6EDaHanyy6Jvq/LFbq17zYUL2I4BWdJBOaG3
 bdCTVaLpng+6lL0siSA/KrIkAokntQ7S6m8auX1YmUTrJdcMm0IDCWPaR
 fYRqQ9HIsUQ9iK8QzhBD24lHdyXAkqaimzg8M4lnluO1wjM5OPXdIiV0n
 YRp/gtXI2ZgUytBk+bOPkmhxppnv2gIDbVogslOdgKXrnmlNADFzSoT0X
 +rCXUZpTz+8yH2e5Z+ei5M+9VIMf179ZYiLKZc6i4ZhiKS031oTsa4Gdp Q==;
X-CSE-ConnectionGUID: nbz5POfzTRq52CkzgYdGBg==
X-CSE-MsgGUID: 28WWoGD8SkaMGm/OwuZwaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51326825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51326825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 05:08:34 -0700
X-CSE-ConnectionGUID: nUdsHbtwT7+t9EVxNgs2Hg==
X-CSE-MsgGUID: 2gWj6cC6TF+SocU+M3/Y6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="109676402"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 05:08:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 05:08:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 05:08:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 05:08:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 05:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSWO/7WFdn3vvr5pMWeecIaOclrAfB3mt+pK4MSj95gNLQvwBeEVajs2cWonyRkdi5xmXeCqrrwaeVAKCtctEMZj5AAjoHS/Jhba/Q5v2H55+jha/3s3zO9bZnVRf9B5AGMhkkZbSnrazOUAIySlVA9QY8letXzP+Nm7AtebKdWELY+cJbdUys/i4lWFa3lFbk89Dqx9S13IodGlgnxZiTv0B2Udmf11jGe5WR3DXx2fgktf5cu+zKyOG5M6481gMJKL/bd27gmEiTtaEYl3F2uQ2yJxPUVief9AgxuIAIRg0n7yAfJTSAm0Opop+JT+Ha8LbUjVsT+G1cmL+FyAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW7qZFQN48pjQpvNjvnw82PeCbJTOhES4XMnxYCTRRI=;
 b=XMnZoJiDHn0kWYn/z++j7L01lDVUWHv3ExZx3pOj/eyq1CHhqh0dbrSqgBPOL0AyggeGPIz7B9QbHc6rK5saJqP5eVst8nskxreeWsDeYw3PVR/jjQQFEV9/6WIpuQyrTEnkj/ThogVP3TSjuXu/p7Yc663bGoJb7ip2iE6N8TpcrMHHI1Ot26WA9+oTCGwISEaEAub71NGtOeqNxcBpohv7e2r9J3tTqEcYa/DZIB9iAaGxV7v9tA6I7dFBCCoXmtWQMuJVxPB15s5ezrlKJt7Y1RIk70ffgNHPfz5nviBqOyOBmFM6oKdEEwjsi7qeOKY86OJV9xa3GrCfMONmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 12:08:29 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8069.018; Fri, 18 Oct 2024
 12:08:29 +0000
Message-ID: <cb7ce6ea-826b-47b3-ab3d-a12d938956f8@intel.com>
Date: Fri, 18 Oct 2024 14:08:25 +0200
User-Agent: Mozilla Thunderbird
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: =?UTF-8?Q?Re=3A_=C3=A2_CI=2EFULL=3A_failure_for_drm/xe=3A_add_syste?=
 =?UTF-8?Q?m_memory_page_iterator_support_to_xe=5Fres=5Fcursor_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
 <172863688596.1239783.15277639754896881103@2413ebb6fbb6>
X-Mozilla-News-Host: news://nntp.lore.kernel.org
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172863688596.1239783.15277639754896881103@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd1a47d-5dd6-451a-23c5-08dcef6d93bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MytVbVNhMkdoZ2ZpbVFLL2x3ZnU1aStaU0NCT01jeWpkV0xERExBRjBRRExz?=
 =?utf-8?B?OWg2ZTE4c01Rd0lpYWFJSklTeXFCRHVqUXlNQ0dvNVV5QUhCaUN2N0ZOUTlK?=
 =?utf-8?B?ZGg4RVQ5Wkp5eW43NHRYYjVQMTZZOTRiZVYzVERTYUl6a0pHZyt3U0dFT1U3?=
 =?utf-8?B?QTd5MzFubDI1QXBzWURQa2V2QlFDWTJtV0FMRy94eEErcUkwUlZseFZacFl2?=
 =?utf-8?B?UGtYaG5QUDJIc0ZVcUI4eHlHK1lWTnJtSk5CWEtaRy9sSUNlM3A5aGQ4VXZa?=
 =?utf-8?B?bkU3UTBkUm9vNnZhOUlaTWZvRy91bTlLZXdObEtXZE9hbWJpVGxmSEcvb0tu?=
 =?utf-8?B?ZEg3TThvWVZhMDZKMHFiUzBFeHVwaVhMN0EwdjBqc2pCTElhaWxYU0xhSTRm?=
 =?utf-8?B?aFVjV2t1dHZoVW16MStudlZYa1VDTm5qSS9nMVg1cm13TkxqTHRHQjdKQVVW?=
 =?utf-8?B?SXZVaWVWQ0UrajQvckJYMlB2UFJNc1hyV3VPRjRTV3I2N09vZUFVSnZBWXl5?=
 =?utf-8?B?dXhXbng3TmFEWmhYMnhINC9MZmxxUEtjc0I3TjJJelRmb1J1bStHWVpTYllM?=
 =?utf-8?B?WUlOMGZ0azUzNGRFQVlmQ2F6OUtHSDdzUG9kbE1qdnU5aDUyWmZUamRvUUdK?=
 =?utf-8?B?ZjR4Y254a0MwMmdsUXpEazZkU3RGeHZBekt4SlBFVGRhSDlGZDZnRWR3Q1pQ?=
 =?utf-8?B?QzErbS9VZGxSQTVKcHRTZHJRM20wdGV0YjhzNWozTDdPSVJnVUFYVERsNVRs?=
 =?utf-8?B?WEZ4MkdsTkdIbnlWcE5kU2dndFVOcmlOQmdpYlpyMUJFL0xjWXZBMFpKZldE?=
 =?utf-8?B?SzdsZ2dtNGpuSlIrMlFqcG1iRlNPSzh6dG9iOHE4NW8yTm9jcGZzVWdyOUdE?=
 =?utf-8?B?cGZpY0F1R3pMM2tEM2hxUk1PUERDY2ZIZnhWd0lIb25POUJQMzQyZjNSSG9j?=
 =?utf-8?B?MzltY2xUZEU5OTlUSzdOWll0Q01PQUlLTEZsYUtzOU1BdVVIdFdnekV0MVQv?=
 =?utf-8?B?MnMzSWxhOWsvTXhTL3VtQU92Q2pWd3NqY0hZTjZFd2I1R2lGRkZOZHA0emRr?=
 =?utf-8?B?ZnhWUTdpMHN4d2ltK1NJZTg5VXhoMWxsTWRHOGJldzZCM1B5SVBLL2orUlF0?=
 =?utf-8?B?SjJhUnZncytkdmhhMFB5bDU5VkFFMnR6VEdOck1ZMVN6Z3h2MzZvYW9kM245?=
 =?utf-8?B?dTZVOURJaDkwd21KeTlHZjBhNFN3VytmTlNZNTNoV0hZOG1mMFVIS2pNaTlI?=
 =?utf-8?B?YU5vZjFkMk9jQy9XWDNZUlFpRUdORkg4c0tkMEJOOTlrM1VOb2ZpMWQydXNM?=
 =?utf-8?B?SlhNdG5zUzV6d0JKU1p1NUVBSTdrRERwdlhnS084YjRpY3F3Tis5K3pnWEZ6?=
 =?utf-8?B?NSt6SUk2em9wNDJYVUpPSlpBbXVwSW5zU3QxSmpVTTZBOUhjQkdLKytjYytF?=
 =?utf-8?B?S29ENGdOMk9DVDZVNFR5WVNLUGcyUEpxU21RbmVxODdNcUdNL2tWUU9KY0M4?=
 =?utf-8?B?MDdXemdzRWVnb2pNTlByTXZ2KzdYK1h0ODhGdjJwRitscjF4bTdISEpZZ1Fn?=
 =?utf-8?B?d0NrWGpXWHpHTzFzalB6VDJaNDlqMS9rTXJFcEpYTHg3MnY0cGZZVEdDVHpt?=
 =?utf-8?B?TEt4VWpiL3dIRkY5MWRScWVJZXBoZXM1K2xVSjh5WTdLdllUQzh6Tk5BTkxJ?=
 =?utf-8?B?U3ZFeDZabUJYKzFjSmxzYXNvMFN0dC9VVHUrTzNlUWd1eWY5NEkyYktnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhqRlBXR0dVdEJjbHhkaFZqR0o1eWlvNTFwYURUYUcrUUNEdkYyV25aWDBD?=
 =?utf-8?B?VzdkNHl5OHhnYks2bFQ5YTFFY2Q4eGlCNHJNZTRHRXppRnprTXJNb21jNllj?=
 =?utf-8?B?NGZ3ZEtJYjh6ZTN5L3RXRDdUbDB1R0VRQXM2WGtNL0RQWUY0Ti9tRDN1RzRG?=
 =?utf-8?B?b0h6UXNzY01yNVhBd3NIOFF2M0VxUDc3MElhRkxwQnBIdDVrRkhBUlgwdk9P?=
 =?utf-8?B?Ymp6L000SS81Zlk1NitVekg0cEMwT2NFcTJ4elV0MktCeXZ0YnlCcW9EaGty?=
 =?utf-8?B?Z1FZS3QxbVI3ZUhpdVJNdi9TdFo2anlwajk0WVI5dFJwTUV1RSszUGFYcDN3?=
 =?utf-8?B?bERZQzNNOUdnTEdkSThtQ1JEQmN4RWRPQ3pBd0U5L2doMXJPS3AveUNhN1FO?=
 =?utf-8?B?dVFIMTVTalRTNFQwTlVXKzNiVDVFTjRBbmtTMWMwVWkyY1RMZjNGbysxcGJ6?=
 =?utf-8?B?cmRlVGN5WGczYXJtNWx4WnhXb0VYb084QXBKRWZiY0tvVXhZbmlBLzVId0M0?=
 =?utf-8?B?V2dMV0RZbHV1eGFGR3UwRTlxRktRb1JqWHE1OWYyWWJNamJ5ZmczeFZZdWhB?=
 =?utf-8?B?K0JzMkFGUGFzZURKUWhLV1dVQ1BIQUlJcWtCektkQnZIOUdFSm9JaHdwUENV?=
 =?utf-8?B?YVhXSys4eE1YLzIxVjdoaXVSeGVBUDBhRi9HeGh6WkpSeGpSako0em4xdXQ4?=
 =?utf-8?B?QUF1Qy9vQXRTZTVwaFVEUDdQeWtSWU1ydDRTYWNYS2tScGtNOG9FK242andW?=
 =?utf-8?B?RTZKQVR1N1BzRU9sckZiUkMwTmpPQ0pja0J4eTBqQk5veENYRlFyTm5sZksz?=
 =?utf-8?B?Y09XR2lFdDlsUlhUczFwRy9NeE9LWVpwVVJzMjB0U3BiZEg1VXl3ZG9aZGI0?=
 =?utf-8?B?K2xiNnNqQmpzTUZXL0tCRGtzcmNUaXhjNGs1bGYxUldKWS82UXRxeWMxVC9o?=
 =?utf-8?B?Rk5DQlI0YVVUR3NLNHQ2cmgxYTdONnhNczlyeDVucC81REVTSTRMMDFZWmtK?=
 =?utf-8?B?L0dXU3NqQWpkRHl1T3FURGIySWxuTkovMFk4OVoxTkh6OXZ1dUY4cThoUGdX?=
 =?utf-8?B?YnNiZGF6dmNXR2xaYVNMdUJtazdyY2hMS0I4cWc1RG5XWEVrNWN5eXFFaWhV?=
 =?utf-8?B?N2JaTHJnVk1WdE9qenV6OWx3a1hIV2JFYzQ4TWpNZHNZN2E5WWphN0F3bU8x?=
 =?utf-8?B?eDgvcGlQRHFXVFBMdmVZRklXci9kTUlFOEVLRis4aGJTbitGNmxlNVRPOE8v?=
 =?utf-8?B?YS9pVFFqbFErVVRNaWk5N0hwdnljZ1ptb0ZwWVk0VHRWdkszRTFVdFk4SkVm?=
 =?utf-8?B?MnRtUlM1M2tHUi9sZVpiZEV2bS9FWHVqbFNMalBsMng3NUR5MmlUT0NpSHAx?=
 =?utf-8?B?TDhJMUtTWHE5UDdBeWRmY2FsbGtGNFJGREI4U0FkSkVIM084OUoyRTJMQXRp?=
 =?utf-8?B?Z25jM0xUb1RWSTJ4bkVGVHZpNEp4OTVRK1lhckM5Tlg5SGF0QkdjSEJXNGpK?=
 =?utf-8?B?bVFNQnowdERPK3Z1UHh2Z2hRblllY0JzaG9UOWtoSDQvcDA0M1VKcmNJeTFx?=
 =?utf-8?B?ZnRJWDZtaUw2d29PcmR2bmlhemIyL0VDU3dPM2J5eXhHZzZwNjJNTHhvRTJK?=
 =?utf-8?B?bWlzZHRlSWY4bldZZm9WcDZhdWw1WkhiQlhvd0NMRzNQT1lqdXQ4UUNDeWsy?=
 =?utf-8?B?akN0UXp1cDFQekhYWXlKYUVDcGY1NjZYZDhsL3p4NkFDR0VaN2xHU3ZrQU1P?=
 =?utf-8?B?UVJtVDRwTUwwVTRUSlJaZEIvZVBVRm90T29UemlNL3dCT0VPOG5yZXNVdC94?=
 =?utf-8?B?SDVNNDZTTVdzZlg0R2p1dFdSRHVrdElqSHZOVGJweExjOEdSRzVDeG1SL0tl?=
 =?utf-8?B?ME9DOFo0Vlp6NzgxUkhQcUsxeWRYcUpGMGM3MnJFVXByVldCb3JPcW5UZzVs?=
 =?utf-8?B?bU5hbjlNUFJ6U3k4Yk90Q25FOFFSYlQwZG0rZ1llZ3JNZml5NjUyenVhVWdt?=
 =?utf-8?B?MFR4SnZVbHVpZkF6TEVmY2FFdTRtcGZVc0dvcWVQYU5rMDZsNVEzWVViRXF6?=
 =?utf-8?B?cngyZWorWnA2bVc5SFJqQVNDME5oRVk0TVd6d2lPUlU0Y0R3MzRoL2lKQ2Ns?=
 =?utf-8?B?REY5bG54OXRnVnd6UTl4d3k5Ni9BZ3l2YjRrblRWR29zdVNnWTBlOG5XT2Jp?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd1a47d-5dd6-451a-23c5-08dcef6d93bb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 12:08:29.1493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSmwnrlamwk/f87Yqcza0IS2/MIMG6Dg3mvp2gXf5m0uh7ebfNUTh+4E/U2sXQbo1sVwpukJSe5JZjbbXO5XuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

W dniu 11.10.2024 o 10:54, Patchwork pisze:
> *Patch Details*
> *Series:*	drm/xe: add system memory page iterator support to 
> xe_res_cursor (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/139780/ <https:// 
> patchwork.freedesktop.org/series/139780/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-2046-
>   f3354eab2a45420cf38a67f6d7735d5dff53eb6f_full -> xe-pw-139780v3_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-139780v3_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139780v3_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-139780v3_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-
>         a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139780v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-adlp-4/
>         igt@kms_flip@plain-flip-ts-check.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/shard-adlp-1/
>         igt@kms_flip@plain-flip-ts-check.html> +2 other tests fail
>   *
> 
>     igt@kms_hdmi_inject@inject-4k:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-adlp-3/
>         igt@kms_hdmi_inject@inject-4k.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/shard-adlp-6/
>         igt@kms_hdmi_inject@inject-4k.html> +1 other test dmesg-warn
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-lnl-8/
>         igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html> -
>          > INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139780v3/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-
>         full-load-isolation.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-bmg-4/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html>
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139780v3/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-
>         resume@pipe-d-dp-2.html>
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>       o {shard-bmg}: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139780v3/shard-bmg-6/
>         igt@kms_big_fb@linear-32bpp-rotate-0.html>
>   *
> 
>     igt@xe_gt_freq@throttle_basic_api:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/shard-bmg-2/
>         igt@xe_gt_freq@throttle_basic_api.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/shard-bmg-4/
>         igt@xe_gt_freq@throttle_basic_api.html>
> 


Nothing related to the patch, please update the filters.

Anyway, the patch is not accepted atm for merge.

Regards
Andrzej

