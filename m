Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1936CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 09:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8294910E750;
	Wed, 29 Oct 2025 09:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKTTOTzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFD10E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761728417; x=1793264417;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SquFOY7EgOfkCZahgPMVm3uXXH0o/7wdK7u9DdPMV/8=;
 b=bKTTOTzxWGv4eoe4UGcU/YDJWTUG3Nueqj6fDEIq16U05EsxaOFpKTAh
 xz6mMVC802yJ+dhceixng8vcvdOcSw4doAaCZc+tj/n2pQcUPdEW34Qxk
 Ph8ndGeq5Q0494Wx3Ikt3sHeRA1RMlSImVNt5e2zblRkUPtx/N/xVee9K
 HM3z5Tz0+BcZ/2PCz8imuIyg2Hl7YcfEHwFWr3pxE8shZiicNmkqKlWqM
 wvH/+BgBw/0ODF6zlbrJ/gLgbvezMTtughgi8+xCwHOe9S3Uvhw+Odgcc
 snu4X0/bKGj6l3Im7k9iFLiarJSQy2/utRZNDWSND/gcBTZ/V0PUSq2L7 g==;
X-CSE-ConnectionGUID: IrdwuXRNSt+Qxdzxb3ezjA==
X-CSE-MsgGUID: g/H1BHtORUqPmu2NItLwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63938726"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63938726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:00:17 -0700
X-CSE-ConnectionGUID: +Ne1sqx3TU2zgonCI/Kxnw==
X-CSE-MsgGUID: pGTWjAmVQxSKCzYBDyf6Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185517880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:00:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 02:00:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 02:00:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.33)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 02:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEUtjAdTLKynUe9OPT/sfH58u9lyJ3EJJIFMp6PBsEoRTllN5QaZVzHJSe8DwgGg+XADvNhbJYbagr9ClAvwIo/LiBjZV4m/v0J4l1Yo2pB9B/GPy5CBm56Sd5nWuOgzfPIKUPRJf76f9GpP689KGDK19yrpJ6L+3BhpWoHvorjsRkze0yBg0Gsmn1cfXIVsHB2AG92BJPwVU7fF8CjpV7MDTdi/4y3u9hmbOBa9n/VBnGnbem3z62YDNXaNtYrhm134kU9gosY85RVE3r9Scm1PyrEyOdcviuLzEdqLFygKXpVrBm9ONWCagOuJ7iYpfdZ+Adn8u0U7Dn1MXD7lyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dyjqnk5ep9DvOCflWLOJP8AuZjeanOVHivDXJdScma0=;
 b=l4F704vQT5lJx7mahCho1uC9Wm98lM2jnDOWwu5u90+3YahpdoVPPhE7qGgZvdualfQsaGy1RsMu4aTYy4NoBPRFNddqwxt1LSePKCBsg4/vLYfC3AF6/nPrhjeFyVJmaJSxk9nchMy/DQ4CzI2PiMOi/Dh4OL0P/nUtim3j8PMK+Vp46ff8TLwDIYIf1UULKC/sUKTTqkFyD160/tM4kRFmewXqZceeWiTUGeE8rONDfc86I/gVDd16ug19IjmoQYpLh4f5y9y6enkxVFHzfrUDhap75WYQYw5Z7mWlHbIFH+FSwZkgyfWIYJnggzSR+BQQpRzaMRgMHlY8Cjb1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 09:00:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 09:00:13 +0000
Date: Wed, 29 Oct 2025 10:00:11 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 03/17] drm/xe/pf: Add _locked variants of the VF EQ
 config functions
Message-ID: <20251029090011.uu3xvfjhjvsrtqmq@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-4-michal.wajdeczko@intel.com>
 <20251029084707.htvoaxto2ul7axjk@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029084707.htvoaxto2ul7axjk@intel.com>
X-ClientProxiedBy: DU2PR04CA0279.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 026c8301-4f0f-4693-190d-08de16c9929b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWNRdWFlUEVyNWxrWHZzdHo2MGQ2RnlYaU1qWndycXZYUVpoR2liTUtsYzFE?=
 =?utf-8?B?UjdFb2dzWVVRT05wNWhNVlZGYWt3SnZFMTIvei9QdktVTmxiQWFTYUZjWisz?=
 =?utf-8?B?dWxkbHFPWndySWE2TmtQQk0vZTE4QU1DUHFBRTd4SzNIa3RVUTFuakdKakpH?=
 =?utf-8?B?d1dlVm1vdFR2bjJjVzcyOXNOSHV2T2FjOGRjOFBFL3UrelowWlFwci9hZTlR?=
 =?utf-8?B?ZE1kRGdwSmpaWk5lRG5lbG1KVngxQk1DN1BBZDJUSEVGVUVsWlMyZ000L2ZO?=
 =?utf-8?B?M216aEhFYzFZbUQwYmhVaE9yMjg3V2EzSGZsRSt4WUFESU1mNHBGYjdaZDFy?=
 =?utf-8?B?bUtydU5kaHFES3ZDMS9QZ2l0US9PdlROSzdvV2J6Y2pXQ3l0K3hkZkduU21M?=
 =?utf-8?B?Q2d2YXdUY0JVd1FjemxXUFNGVE52akgyVFFHek1NMXRIMlg4MDNkZlVGaUVl?=
 =?utf-8?B?c3gwVExUR0FFWTBlQ0tISWZoNXJZYjRMU2lWVGNNTUdZT1laUVlUcjJIWmVU?=
 =?utf-8?B?Vy8wWER3dTMzT3A5djNaYm00aGNIaWVYN3lkdXlabm1oTEh4cWozTzVPdDlG?=
 =?utf-8?B?VGZtc0MvUkpoSjFDSXkzYmJyRjU0UjJyTHJKTmNHdDJ0bk5NMGU0RjhOdWht?=
 =?utf-8?B?KzB1NGpTT0V5SmRuWEpzS3d6ZXgyZ1lCN0JMbTNHVnYzN0l4WjRZL3M3b095?=
 =?utf-8?B?SGRmVDZrQk5SaWJVRTZYUlpGSkpSSTlOVXNpdExmNXlpTFlSZm5GYThhZ3Uv?=
 =?utf-8?B?dWZYam43ZWxwei9wYm1PNmJlMy9TOENmYVNyOFAyWXMxMlg3Mk44ZmZOWjB0?=
 =?utf-8?B?MWFEQmhQdDJKK0kvRVJUOTA2dUczdHQ4WCsrSjRVTzUxbWNKMld1NDJ6blpq?=
 =?utf-8?B?K08wRGx0ZXBmS3E5RVJPZzZGcDZ1cVdydEt3a1lYSlZ0MGdnNHVZMjlIWHFV?=
 =?utf-8?B?b2FKYXVtWG16bVNWMjVJQmY1ZWRsTzNMNld6d2xTbEJmcWVRK0lqd240d1VV?=
 =?utf-8?B?NjhCaTNLcnh2ZE1OY1VBSWlZV3F4azVocGlScys1NWVUc2ppRm9GeXlra2ZP?=
 =?utf-8?B?QlZZZ2I4TXBoMDc5bEFhYyt5N2ZRVUdiR3pTZ2ozOTNmTE83ZEVnWS9CNVgw?=
 =?utf-8?B?WHhwd211Mmcwc0JjdlZhM1FXcGc0WnUzemJJVzBEQUMxMjhpZ0o1YWFlZisy?=
 =?utf-8?B?OGFPZDZPWXBWRENBUWVTQUFoMTVtUm9kenhnRVArenRGT3h0b0xMd1BuUkZw?=
 =?utf-8?B?YUlxd0YvV2VQbnAvVmMzVlZhZ21xTzJOTWRHWVRnVHViSEVrVXRTSjR5UFl4?=
 =?utf-8?B?SERZZGJ5TnQxekJQeXlZTUs0YUtESEE3VEdGbUJuTFdHZ2YvYktTY1RST2t4?=
 =?utf-8?B?YmJqNFN5NVN3c0pjQ2w3cjNKcWQxZlB4ekNOazAwQm5UeTMyMytRSzZjMDBK?=
 =?utf-8?B?NGd1N1VvQzFldDk2cnpLUnVpRWpab213LzRkVDdvUGhIMHNVaTB1bjl4NFZN?=
 =?utf-8?B?cG9ObW1BdUxNc2lCQ3R1YUg2RXdTc3lva2p3YmdCa24xK1ZhN1hkUGNvckp3?=
 =?utf-8?B?RjNvTXVmOEVUVDRMV1ovSWVIMGN1QzFVVXF6LytIYVg1eTdEYlZoYUZURWY4?=
 =?utf-8?B?amU4WnVnK055dzRzcHd5WFJzd3FBazVCRXc3Y09MRWVNK2c0SnZ0aHRBOHF0?=
 =?utf-8?B?ckUzMnluQTYxT0tBUG1td05lQkZZaG1HLzRQczJEbWtER3lITXR6cjF5ampD?=
 =?utf-8?B?dTNtM0p5VENTcGI2V0ZZcUxXRzBkNnRNK1ZNcFhhaG53UEdtWEQ1SWZqRFJn?=
 =?utf-8?B?ZkI3amV4T1dUWnhOL0Y3azhTWEZFcGIyaDZ1R2ZjRFlDWDlXNHJTeGkxNDVF?=
 =?utf-8?B?YW1xVWtRc0lFTDFRVEJRRHliamdlUVZFQjJkZlRqckQxVmpNUURQWnc2ZkVa?=
 =?utf-8?Q?3dohXE3LV7fpMAk7vSi71FWsdenm1B4d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFk5Z3kvVkN1TGd5a202cGdGOWR3TTBGTlBPNmNiRVhjdGxGdmRIRS9KeFJS?=
 =?utf-8?B?Y1ZyWGE4ZENQTS8yZysrcjJVdkU1dTYvK1JaNnRycHh4SmZOSXV5N01wT0J4?=
 =?utf-8?B?NUZUeWlIa2JHMkhyRTlkZzIvaGVKb0xWK1d0SVdIMnk3R0xMd01nL2JPV0VW?=
 =?utf-8?B?MWlsSnU2UVJNMXFNaHJtc1dFU0s1S0dwdDRDTzhwV0EybXRLUVF6aGY5aStm?=
 =?utf-8?B?U2U4elZnVXNNTC9jT2czeVpYdTBzY21qaUpobmJ0Zlo1UjJsb2o5Z3FBdHkw?=
 =?utf-8?B?K1BhUTBOM2VnTjNnR2wzTWg4MW5MbVBHU3AvYUx4VElxQWllMjYzS0tlTWpS?=
 =?utf-8?B?aGNab3dqSWVFeGE3bm5FS3ZmaERFbytybFhqUDFXbkVreW1YVVN4Q0taa1k3?=
 =?utf-8?B?MkFyb3pRcXV5SHJlUEcrYkpmMVAyaFo2UEhJQnptTDFFczBqZkN5NkkzYVlo?=
 =?utf-8?B?K3RLYXZ4MUI5eFQvbk05WEpqWGdQNnduVkNTVHhWeExDdUpKdDJ0RHpiSVB2?=
 =?utf-8?B?THFOTmJmZG5TWnF0bmllbHNqbytDTU1qYkpYNXpudnVwMVVxaHdJK01wRjZ0?=
 =?utf-8?B?MlNHTGhPSVpxVHFzbTZWQjVZL0JtNXpyY1NjVkdLL0Zvd09URnh1TGFSQlVn?=
 =?utf-8?B?RlBUd1lyS2RadkJGQ2UyeU1WMjlOVjdmaHkxdVN6Nmw0TGROQmpJMjgzeWxY?=
 =?utf-8?B?dHNGSDlmbVdlcjJOeUZDdFFMWHkzd0s3bkNlNTRNZWJ0c2EwMjVERjFIMDYz?=
 =?utf-8?B?Rk53Y2pBNWMyVHRXcEVXY1pkc1VzSFR4RDYwT3B1aXVBalpoZEd1YVZEaTlD?=
 =?utf-8?B?SEhDZE50b1lhdE9SbmdFREtXUXU2bU9WQ0VZUHZpNmhkT2FQamU0WVpmbEpQ?=
 =?utf-8?B?Y1RFeXo0QUNsQ0tueDZ6ei9mL0NOcCsxa2dILzNQWkVoQmdINTgzL2NJTStm?=
 =?utf-8?B?RGVRUWZKVTlsUzBHeXRWVjBXQWpvK3R5OUxDQzBzejcxSXVxUktCZTFTaGNX?=
 =?utf-8?B?aWs5V3pmejB0dU13UGhuY3Yvc2F6TXoveTVOUldJb1AyUTAxZFBwVzFJWGFk?=
 =?utf-8?B?YWd0SkRrellyZlpQZ3lIV01SMW8rVTl1ZWdtRzhUU2JMcG9jb016SnRkZm1v?=
 =?utf-8?B?OVJPajErNnl4dDRmQUFZeFF1djJmTGFQcXVLRXFWS1JnYVBUQ2N1Njlqc3hW?=
 =?utf-8?B?VitUMk5sRUFHK2U3bWMvVjRoTEprTDM4WHcxSEYxUDVPUU9YckVNajlpZWNt?=
 =?utf-8?B?WFVrZ1pxTnBPQkhJOEVhN2pZUnlkYkhUaUZMV0pzTlYzcHNlTlZKNWU4dDZ1?=
 =?utf-8?B?dlI1c3gxVEJMRHhtM3kvNFc5TmJHU0xOc2NLL0M1U21IaXZLYzJPMVhCSERD?=
 =?utf-8?B?b0FxUkhDVGhNTDJ5RU5SR0ZMMFdWM2ExbTdlQkVVenVTL0hWbHAvaGdJeWw0?=
 =?utf-8?B?aW1EWjlRNzVXblBrS0E1dUM4MExIaWhyZ1FTVHlONmhZQStacitPNkNNM2RU?=
 =?utf-8?B?cnRVb0tDZVE4VWtRbXNIZW1jTjhIbGZMWkxVRzhzYVV2emJ3NjNKWWp3all1?=
 =?utf-8?B?dW5NR2hUQ0JXRmhINnNRUHY1blJZcjFWTERRdUxIT2FXMzhtSnk1KzIySnl1?=
 =?utf-8?B?azBHbW1VMks1cDBibkoxK3FsSFBiQWhjOVIxc1FsQWtZdUhBRGkzaEMyMnhj?=
 =?utf-8?B?ZGd4NEM4NnoyQmpMZmRCRDErTTdRWHU1VHE4dmV6TmlQWkJTNUxqY0xhT0hs?=
 =?utf-8?B?N1NhMEdBbVZ2b01pV2xTcTRra0oxN2ZpZ2V2MURyNDFRcjlpdjJhTGZzQ2Fr?=
 =?utf-8?B?UEdMNG85VE1laXRyVmppeWJGU1FsUy9OeDljY0R6dm04cVFvbStHdklLU1Ni?=
 =?utf-8?B?WnRzNVBReFg5bXp4czErQ1lqcklaK0Z6Lzk0bjh1SU5pbFo4eWtqSzBENjE4?=
 =?utf-8?B?UmU3a08reVFkMnBUVU9SQ21hRUltZXFHQW9YdDB3WDJzK2ViQ2xjWkxiVkxO?=
 =?utf-8?B?c0ZWb2R5Mm50VXREbU1NV1dIcGNMOWg4L0dFSFFKUzVqVHBpRm82TnpQSFVi?=
 =?utf-8?B?VnR2QWpkYmhpb1AzaTFmMUZnczQvQ3lBV2lGUXVVNnJHNkZIWHFWOUdEOFQ0?=
 =?utf-8?B?M01rR01HTmdmcXZhRlF1dGdaOXB4QWozSzVITitGMStBbzI4U25BdHpRMFRl?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 026c8301-4f0f-4693-190d-08de16c9929b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:00:13.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0fITWkRHi1rYwjrUcLG8mVJTc1UmCFLEK8Br4lct2maiHxfIFjAGsQNjSPdRXlHqp+G7xFfjpcRvgIvb2XekSyMOaV8HfWzImxBqjb5VVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on śro [2025-paź-29 09:47:07 +0100]:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:17 +0100]:
> > In upcoming patches we will want to configure VF's execution
> > quantum (EQ) on all GTs under single lock to avoid potential
> > races in parallel GT configuration attempts.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 58 +++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
> >  2 files changed, 49 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index c0c0215c0703..717f81e76b8c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1732,29 +1732,65 @@ static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> >  }
> >  
> >  /**
> > - * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
> > + * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure execution quantum of the VF.
> >   * @gt: the &xe_gt
> >   * @vfid: the VF identifier
> >   * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> >   *
> > - * This function can only be called on PF.
> > + * This function can only be called on PF with the master mutex hold.
> > + * It will log the provisioned value or an error in case of the failure.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> > -					   u32 exec_quantum)
> > +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
> > +						  u32 exec_quantum)
> >  {
> >  	int err;
> >  
> > -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> > +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> > +
> >  	err = pf_provision_exec_quantum(gt, vfid, exec_quantum);
> > -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> >  
> >  	return pf_config_set_u32_done(gt, vfid, exec_quantum,
> > -				      xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid),
> > +				      pf_get_exec_quantum(gt, vfid),
> >  				      "execution quantum", exec_quantum_unit, err);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> > + *
> > + * This function can only be called on PF.
> > + * It will log the provisioned value or na error in case of the failure.
> 
> typo: na -> an
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> > +					   u32 exec_quantum)
> > +{
> > +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> > +
> > +	return xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, exec_quantum);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get VF's execution quantum.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function can only be called on PF with the master mutex hold.
> > + *
> > + * Return: VF's (or PF's) execution quantum in milliseconds.
> > + */
> > +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> > +
> > +	return pf_get_exec_quantum(gt, vfid);
> 
> NIT: Perhaps it would have been better to be consistent and call it the locked version here.
> 
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
> >   * @gt: the &xe_gt
> > @@ -1766,13 +1802,9 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> >   */
> >  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	u32 exec_quantum;
> > +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> >  
> > -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> > -	exec_quantum = pf_get_exec_quantum(gt, vfid);
> > -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> > -
> > -	return exec_quantum;
> > +	return pf_get_exec_quantum(gt, vfid);
> >  }
> >  
> >  static const char *preempt_timeout_unit(u32 preempt_timeout)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > index 513e6512a575..b4beb5a97031 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > @@ -40,6 +40,10 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, uns
> >  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
> >  
> > +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
> > +						  u32 exec_quantum);
> > +
> >  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> >  					      u32 preempt_timeout);
> 
> but anyway it looks good:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

one more comment about kernel-doc:
You are inconsistent when writing function names in kernel-doc. Sometimes you use
parentheses and sometimes you don't:

+ * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
vs
+ * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get VF's execution quantum.

Based on https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
I assume that the version with parentheses is correct.

Thanks,
Piotr

> 
> > -- 
> > 2.47.1
> > 
> 
> -- 

-- 
