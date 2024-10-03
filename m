Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BACF34A1
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 12:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AECE10E052;
	Thu,  3 Oct 2024 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNHyQlhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E1910E052
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727958249; x=1759494249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MU0vwku6OH23c6xnyUYvsaxE5sLuhBa0gqOOCFCBQLk=;
 b=GNHyQlhG4rvRqORN6gnMqcnnAIbct7uo1D1sGyfXb0spwtG59toB40kf
 4a/hjLEjFXnVuGFxK0pYRVdiN9RxACVA30WmirtDsdiilWTWPVmN3JxSg
 AlJjSypRpW+QKbVbdlI2nuE1P2UDPQL1IAK+YBV+yqSFR1JLVtbm85NG7
 bmgGYUoXbb95brI87XddVTfuy6GU9Dj/vNhwFtSj2uebj7mKh1z4I+HOj
 Chs9nIaiW7os/TXS706fA1hLDf8XNUnJYg12OCOfghIveBeH/2b1NKWql
 9HQe+zAt47/xorWcRnuy9jX+/xOtrt3c9bwwfXNAJSD3d5fRiVz3yMLRv g==;
X-CSE-ConnectionGUID: gNlIaxQyRKmWaZnr2m27dA==
X-CSE-MsgGUID: QzAHBAo1SLSD7fCMwQiIdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38507186"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38507186"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:24:08 -0700
X-CSE-ConnectionGUID: OxVHpx8hR/29lSJjTCm1Ew==
X-CSE-MsgGUID: 73BPqPvZR7CLe1uphSA8vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="79297781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 05:24:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 05:24:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 05:24:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 05:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxpcB2mqylXPOfmMMSRNa2U2B1ZZGiYFflSF56P7ofh/+XHFaPBvd75qGSQreKuIGRAeR45hE4dVgj6+OuZtzzJghiN/biATQCAblxp0Nt8MIeUfGfOEEi9iGTuy2pTjXSatOQBY6miwMF7G5OLg7xkb+JDp13TTsIzhF1nTG6iXyrb5NlxihcDkZdnO1ZZxP/1rp6zibzTQXHqEiVcl1kgPGaYeRPGZJHXaOQC12wRmwj8OGQEPGh8a7fmzB49HxfN6BjH5s3IjG5VVhDJZrh6i1GmzUcWlpUOeaazkW7+eIiWPXFoa0F40vmW3BhLtiNdDBaUmi/DmctxrJi8+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47fPgQ+oyrV1pYAWkvZ9seuUo/owz5pU1lLK8Ha14Gk=;
 b=hucnsUn+mwbcMKZu0DZM63fi1WHi4iUfvYSyp5Ui/tRze0gMDJX2KBMtH6PZVZhXoyMxXBPPm9tpgUQ9CXZT4awYap0/WdsV+e2dmNy0yJTsfkA+ZyZYONGXK/8p4FSZx4q0BB9Nj3pI8wrpZyDMS7bSyWBm9Ht93GgewobirpiQDtvlIG0I38CubBIH8PSjCfg3MqomjeMR8HqHxo5lbgEGsY7dUHNW5VEYp7FI7R0ZL+zdrA1367BeK1ueAJRbk6EkW+avkx6IoF2gckXNNilJyc7teMtQr7sRY500pmErq5UtSbATgZnecHxsvLngNbNEsXNuXSd4EmOwcTbeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Thu, 3 Oct
 2024 12:24:00 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 12:24:00 +0000
Message-ID: <232163cc-1978-45b7-a920-2890a014cb95@intel.com>
Date: Thu, 3 Oct 2024 17:53:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/25] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a620a59-684e-47d6-1614-08dce3a6428e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3czUzl4M2hEWnpRMnRiOUZ6K0cvL0dHNXJaRkQxUU12c1dXem41SHM0U0RW?=
 =?utf-8?B?bnUvYmR1TkhTeXA4WlpUcHpHTDBUVUpRak9CS0Z1S2dGTkx2UzBaZWMvb1Jw?=
 =?utf-8?B?dlVDUUdlVWdSN2xLRkJ6aHlSbnkySEFPK1QybElwcktXakpOUXhWVzFtcmlD?=
 =?utf-8?B?ZGRmWVR2d3I5bWdEN3lvQXAyNnZ2b0Q0MCt2akFYVVhEWlhVSXhJblBrQ2tu?=
 =?utf-8?B?QWhkUXhkTHlFL3lzK2ZmTDR2dGpFK2wrZUVXaDg5M2RPcFd1VlJsRGhvUFhj?=
 =?utf-8?B?Q0J1ZUE3YnhEL2R1aGFpSmt4cTB5U3NwQTBxa0paQWxFR1JnYTk1NGxicGkw?=
 =?utf-8?B?cGtCSGdOcnUwa0UwVHBxOU9Hd3MyRWszcjFpbFJUVC9kZG1QWjA2bmVhMGJS?=
 =?utf-8?B?UFZ3Ny8vUDdTUUdJZDJ0TEdvbHBoaEg4NkRtRG51cjZZM3gzQmZKMUI4RGNs?=
 =?utf-8?B?b1hoL2xOd2Z1S1pwQjAvcVcwa2twTGdLa1JWYzVOcmdrbE8yOTdXV1htY0I2?=
 =?utf-8?B?QjFuMXNva0RFWTNNdUtwNDdxTHo0VVkwNGdjS2FwLzJBZERxRU4xMUtoaWpy?=
 =?utf-8?B?SGkyeXp5YlJJQ1JoMkM0LzV1MUdxdGxiMU44c0hRT3c1MVUzM2FNVEhhaWli?=
 =?utf-8?B?MXhWR29KMzBkazNQRWdVVEg5OGRhd1J3a2F5cjV5WEZLc2NhMTVZS0tMOU9P?=
 =?utf-8?B?SGt6NHJEOGQ2b21mTkdGNDkwSFpEZVNZRjlxRmdJOVVQU2FUUFg4OUs5MUJQ?=
 =?utf-8?B?ZDVlWlM4OE95RDRMdXdqOGIrYzZ6ZW9FcnZxS09WcUdHZGZyUTdHdjlpekpZ?=
 =?utf-8?B?NWh1RzFaUXZPeFE3V0JPRmVDaVdKcmlJWWVZOTVuYjUwVUdLUFo1RVI5NHI1?=
 =?utf-8?B?U0ZxcDNnMk0vRW03TzQraGp4MktFNlhTWFZWNmQ5T01ldUZjMDg5dHpGT2Vk?=
 =?utf-8?B?R0kzWi9TVEdhWklvSCtmbXJ4bTMwU1gwbUJDTGk5TnhoTW5TbXZhWXRWSG1M?=
 =?utf-8?B?VUM0cVdWejRKc1NoYXF1cTdSVTEvU0ZlbmY4NzhtQTFhMExER0pXdWxaMHlO?=
 =?utf-8?B?R3czZEVHQWo1c1VlSXk3clIyNDJNVEV3MXZPOWZmNGN3U3JvbGQ1clAxaWxI?=
 =?utf-8?B?QmRCVjI3bWVDQk4vMFpISENvajRKL3VLdm9zK2F4eFlGVDdIY2pjNjd5YVhs?=
 =?utf-8?B?V01iWi8wRnVwV0wxMGtEeUM0RUp5MTIyRkY2cnY5R0doV3dBQmFJMXpsSjUw?=
 =?utf-8?B?NFlnZzFMMXdqYkpaSjN3YUY1NmZkMHA1NVhKL0s0bG4xVzZURnZ6TWZ2OUsx?=
 =?utf-8?B?NlF5em1VNERSRG5LeVluS0k3ZmhEa3dFRmdESDRrVlBvOCt6Q1p1ODRydklv?=
 =?utf-8?B?SWpIYW50TGxFNFlUYlY4NUVQMVRZQ29oNTBIRmc2Q2RIbVMzWUJtVG1HUHR3?=
 =?utf-8?B?WWVPWjVuOVlFVUNDS1Y5dlFjemFCM1dPMTcwbVBENkdTMXVhc1BETGxCam8x?=
 =?utf-8?B?eVdGWHZWQmRneGNRU1VUaUw5WlM4aWJOYnlOeDR4NmNGZmEvY3lkRkNTdFZT?=
 =?utf-8?B?Ym9Pa0JsS3RwWWQ1ZVVrb00vaXRNQjQvVXdjZXREcnB2N0k2M01zY1VYeGc3?=
 =?utf-8?B?MytNREpSczdPeU1ISGN1Q1ZMbmFIYmhzbGpQMDY3QS9PZlpaNWs2alJSenpl?=
 =?utf-8?B?VGdFM0J2enVVaUVESnlzL29WWm5sV1k5WmJRY3pEczRGMHBKTXhrMnF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFsQkNuZ1Jsalprb1lJcEtRMDg1QXlpMU1iRTBwbUlHaUIrcWpiaTk4b2dI?=
 =?utf-8?B?MU16a2lrd0NJOURPaWUvSEdUZlVtUWNUeDJMY2JLTE85M1FtcXRVR0o0djI2?=
 =?utf-8?B?WU1kQ2t5c2JTTUpUTjAzb1RSZ2ZCUUppU3RhL1VTNGx3aURzNHlOWFYxSE5N?=
 =?utf-8?B?SGdORkpXdzRGNThMZC9LVDZvZXNQcS82bzM2NkwybnNaSElaWkFGdzF6N3pw?=
 =?utf-8?B?d092VjlOZHExUVNFaGxkRW1HbkdJU2FLNlB4aWFqNHl4TWd1LzhzU2dkTTRm?=
 =?utf-8?B?eFg0Vmw0eERMQVFEUzUwWnFhSkU1NE9lM2tKRzRUVUgzVk55RjZ0VG9VM0x6?=
 =?utf-8?B?b01Ya0ZwbmUrVEllRngxdUVPREM0RVhucG9VODNEdXpZd2VabmoxY2RYK1Zz?=
 =?utf-8?B?RFpxdDFNUlBLOGV5cnoyU2RJcDRYMWpibEhZWmtjaVlmK3FxUUtIOTE3Njgr?=
 =?utf-8?B?RWdkK1VuUk5zTk9tUmdzYlljb1BPbXBIcjlGSzRabXJSU25SN0RreXo0Y1Bk?=
 =?utf-8?B?MkdnbVFXY1N6eUg4TnRVQ0VZQUc3SldxWmdpamRvVDZHR0dWalhobTRHUTRP?=
 =?utf-8?B?Tzlrb1Q5VjRub2pFRDhQMmVTN05sVWRRV3p1UVFlS1lNdExPQm1tZ0pyeHVp?=
 =?utf-8?B?RVhjd25PSWhLTXkvNXN6R1JkVkgxb0p2dEJIbjlwVkNaZ3JRS2RUeXFCWWV5?=
 =?utf-8?B?T0luN0RzQXVKaUdjR2dadjJlMEJ6dGxybjNKN2lRRzZmZktLZWdsaE9UWk9q?=
 =?utf-8?B?QytBeStFVjQ4MldMTnp5c3cyOFpBblhISncvTVh6YTNDbXVnVSt4dTRYWC9C?=
 =?utf-8?B?ZzI2K3ZSUFRxMFRnNDB3YlhVQ3NhOU5PbGF3MjlIZm5KWW82WVFUR2VIeElO?=
 =?utf-8?B?TU9RekpvUmNGTFFEOFp6dnNZL3VKNkoxNDNETGN1cEhiZVBET0JXemJoZXMv?=
 =?utf-8?B?d0k0MkhqaDBaYnRUcHM2bDh5RWR4VUh2NmJwbkNMK0EyK09DVWNEUFVzdEVL?=
 =?utf-8?B?cFh2KzFxSnMwLzBkM2xza1FpVDZkWXp1bGFyODNaeWx6SGQ0bExDWmxvdFVm?=
 =?utf-8?B?bTk2T1NSRTA4bm90bmJsTms2VGlNbmdTMnVTY3hxVnJWL0MzWm1obW81MmFY?=
 =?utf-8?B?T1Y4ekhjUU40WW9kVUQ0Snp6Q1pNTllKdkhUSzNHdmszUlhMVFJ2UWFXNk5S?=
 =?utf-8?B?Z2JhZm1kY0RKcCs3VE9aKzFES0l2M2JiSEd3a2YrOGo0d0thU2dKUTlQREE4?=
 =?utf-8?B?THVDcTdUbEVCUnM0UHRLUjB2R0hNOWRwSTk0Uk1sY3ZheXVHK2FIRUxZaEl3?=
 =?utf-8?B?WmJoaE1sN3JIQndoWnYrVlF5c2xZUzNOY0kzQ2JNcjMrMzVyeHUvNlo4Q2tn?=
 =?utf-8?B?cUxmYnJ0QmtwcFVxaW5PRURiVzNZTGVudy8wUWthbUMwcTVuM2JBTU5aaitN?=
 =?utf-8?B?UlhXd0RCRXVBZnhLZDY1dTAxV2ZrR1ArMzV2cTNvWTVqREFMVnBiamV3RUxY?=
 =?utf-8?B?Wk1jbFJyeWNNYUozR0o5YUpmNlc5SkxZNnNkQno5Um9ZNHpqeElsaDNNK0VZ?=
 =?utf-8?B?ZFhCMi9qZzBUd2FSTXoySVdXK1IvWU50VUpudlZoU29tNnAvZng1N3ZMNVBE?=
 =?utf-8?B?bzlNdllWcFlUbTMzN3p4ZWlibUQyOTAyZjd2SXBGOHZPWGdIdGV6bHZLMmFx?=
 =?utf-8?B?NTJhK2tLd212OUU1Nk5qTFdiRVNnZWM3MVFoZlBUVnVTbHJVa1lSemd0ZEZ0?=
 =?utf-8?B?MnhFTGVrYXJhYVJhWlgrNTRmSkNjZjJDaGMzSXJNbXhDVnlSNko2YW5JVGFL?=
 =?utf-8?B?U0pZYzRpY1drdjU0dXZCWWs1dEVrbzl1cmFnbDBDQUp2OFI5RlZSVmN4RDRK?=
 =?utf-8?B?dUhnOFFDa05KZWh1SXU4a1FRMnI4OW15RERjb3htZEVybElYcldXVG9RbGp5?=
 =?utf-8?B?LzcxY3o0cWMyeWErOVBoZk9NdlZiVWQzcVg1SHFUUlNpUysxL2Q4eGZOVDJG?=
 =?utf-8?B?dmJaWU5Nc2hOK1g4QmZ3aWpURUdzVVVCQUdsVEZyREllWlJSVUtaZ2Y5TTY0?=
 =?utf-8?B?SE91bDVOWnNYeTN0NFhXSUNsaWk0dXRabU5OZmQ4eFNwU1FMZ09KMTM5SGlT?=
 =?utf-8?B?RGRtQWs1ZngyMndxT2k2ODE3eHJOazdRN0h3VGVWenBIM3dzeTN5am1UMnNi?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a620a59-684e-47d6-1614-08dce3a6428e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:24:00.3333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3VP62A8sTbFOoGwEhV7VuBZPiaLdK2vcljyvl+ZOW2Wq5yOrZ56vHAJwcIxyP6uK1kwBXqGQyaCAqXJOTIvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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



On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a forcewake domain awake
> request, do not increment the reference count for the domain. This
> ensures that subsequent _get calls do not incorrectly assume the domain
> is awake. The return value is a mask of domains that got refcounted,
> and these domains need to be provided for subsequent xe_force_wake_put
> call.
> 
> While at it, add simple kernel-doc for xe_force_wake_get()
> 
> v3
> - Use explicit type for mask (Michal/Badal)
> - Improve kernel-doc (Michal)
> - Use unsigned int instead of abusing enum (Michal)
> 
> v5
> - Use unsigned int for return (MattB/Badal/Rodrigo)
> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
> 
> v6
> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
> actually refcounted domains in return. (Michal)
> - Modify commit message and warn message (Badal)
> - Remove unnecessary information in kernel-doc (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c       | 45 ++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>   3 files changed, 38 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 5ce9e912818a..7f358e42c5d4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -160,29 +160,54 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   					 (ffs(tmp__) - 1))) && \
>   					 domain__->reg_ctl.addr)
>   
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +/**
> + * xe_force_wake_get() : Increase the domain refcount
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * This function takes references for the input @domains and wakes them if
> + * they are asleep.If requested domain is ALL then only
> + * applicable/initialized domains will be considered for refcount and it is
> + * a caller responsibilty to check returned ref if it includes any specific
> + * domain by using xe_force_wake_ref_has_domain() function. caller must call
> + * xe_force_wake_put() function to decrease incremented refcounts.
> + *
> + * Return: opaque reference to woken domains or zero if none of requested
> + * domains were awake.
> + */
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
> +	unsigned int tmp, ref_rqst;
>   	unsigned long flags;
> -	int ret = 0;
>   

As we have fw->initialized_domains lets add check if valid domain is 
being passed and assert otherwise.

Regards,
Badal

> +	ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw->initialized_domains : domains;
>   	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>   		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>   			domain_wake(gt, domain);
>   		}
> +		ref_incr |= BIT(domain->id);
>   	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);
> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0) {
> +			fw->awake_domains |= BIT(domain->id);
> +		} else {
> +			awake_failed |= BIT(domain->id);
> +			--domain->ref;
> +		}
>   	}
> -	fw->awake_domains |= woken;
> +	ref_incr &= ~awake_failed;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret;
> +	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
> +		   str_plural(hweight_long(awake_failed)), awake_failed);
> +
> +	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;
>   }
>   
>   int xe_force_wake_put(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index de720881a300..eb638128952d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>   			   struct xe_force_wake *fw);
>   void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains);
>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains);
>   
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index fde17dc3d01e..899fbbcb3ea9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>   	XE_FW_MEDIA_VEBOX2	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>   	XE_FW_MEDIA_VEBOX3	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>   	XE_FW_GSC		= BIT(XE_FW_DOMAIN_ID_GSC),
> -	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT) - 1
> +	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>   };
>   
>   /**

