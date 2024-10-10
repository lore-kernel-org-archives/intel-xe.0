Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF763CF11F4
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 13:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB2410E8F8;
	Thu, 10 Oct 2024 13:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZPe4UD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B99510E8F7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728567088; x=1760103088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61p+TPgr2c6BfmfOlJWO/tQQLM07qSe+idd4fxoaGVE=;
 b=mZPe4UD2BJW8LF6UVi4iHu8WRnDeUz4z/i9zd/iq/A0qN5i5Irtcmc1T
 8642sb+/66GIgwdL8teRE5lCnLQ/kiRLIFX+K+/dzaI6K6qJXqZ1ULTGO
 CxGoIxy2W4OMHddX6qvqrhBUxt/oul4f0Mz3LmTWU2HmbruGyxUMznkJC
 fZEDVLcT0q7O7TLce01cqG6r/VUPD8GtqU60V8U105C12Kiqt9GaJO/7Z
 zn5G+dTy0oweQaWcYMVNdF2r4DuRJk/ToV52qhIGg3KSIGpQZlwEXYvl6
 LpMyxqgJL3ChcfqlIufiDMGTpXtnldbM7qKNmUqWciOZzyyovil9xGS36 Q==;
X-CSE-ConnectionGUID: XztS023yQiWPv2uL5JAJ4w==
X-CSE-MsgGUID: BmzF+5PlSEu/K/NBQ/hOCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28055297"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="28055297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 06:31:28 -0700
X-CSE-ConnectionGUID: pQ0hq6fkQCep4jZw2yr7nw==
X-CSE-MsgGUID: 8r1gSC+bStq9oTAdjMfpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="77416064"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 06:31:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:31:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:31:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:31:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 06:31:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 06:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oL4tJCG0nl68JvZqWK7vaGaeG78bYvXbvfKg92H1dv5VM0NB+yu/0M5TVZgO0BBdSF+/AasoFD+x3YFNQzuTmQAfA8Jy5kQdg2QJyJtcw++eCuZGNoD3kkUFkb5KCE3x/pkR0T6O4Al3w3Rf7Ze3+ukSTJFkqWr289pn8gmjU1BVBnikeIXHfWjgvpzkzCM1bsy+N/zonozNaL7j5e1whARitjNvuzzqy796LTGTlp6PmewyxBDqkvCZo+vigKk55xDSfC0L6t1V1K+sVo13+0s3RSymC5Tzj58/P8XeOwfy8L8AwVHNrfB3TLOKu+hKweFAHYECz3ubTUtmtbBUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//QbfuQcoaI4rFt7hUjHXhKb/2WdTZRfSByvS+o2Q88=;
 b=xY6Kht940T0IKW3dCbEg368aM3j0+atNW2YAefAkSu73rViFy/RIMjqbnDsf++uAAibhwrQWCN6QXPshLtjvbNYfd+7OM4fNBinECeOoKPLRXbXJ6vCUeYBNpgtCnUZnaQTjWBISgGUCl+szesBJdHEWf4Eou/BsMV6u0KKfWh4B7TWhBMCcmsSW08viv5RA3Ayo1VWvwKp0U0A7qMnd4XetRbLQgw9T0P54vEAHfluzgBiC2trjgVdoW0D2mlPkvnWvLuQx1G89Aw1we+OKQYg08kXQIYbbP8l5uy/phCIEEka4f15opz2x5LJH9yB/O0KNYzCEh1tfVyrzClcxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 13:31:23 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 13:31:23 +0000
Message-ID: <9b7c865f-e1c0-49d7-9d65-b61c9e7391ea@intel.com>
Date: Thu, 10 Oct 2024 19:01:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Szymon Morek
 <szymon.morek@intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <20241010034847.389734-2-lucas.demarchi@intel.com>
 <88778cd7-c165-41bd-b892-e9f8e3dde8b5@intel.com>
 <zaxzdcbqiv5exdurw2spwllsps7b3rs643ponf5prqux4xdbb3@xf3quz2pb3sv>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <zaxzdcbqiv5exdurw2spwllsps7b3rs643ponf5prqux4xdbb3@xf3quz2pb3sv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 645aeb33-a109-4282-c870-08dce92fd55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0JlTTkwdVBtZ2MyRi9ncGdNMFA4L05ZY0NvSFB5OHh6STRvRisvSGkrMlZS?=
 =?utf-8?B?aXZGbWg4dGpqWUQrYmdCQUpXc3lwQWpkbW9wT29LWUhFWHNIUFFZeUdkOWNx?=
 =?utf-8?B?cGRILzdSZ2lYZERSMjhGV2dLTkZvZy92UlBpS2MvbXQ2YUJTaXgrMnNBaURa?=
 =?utf-8?B?L3M4VW0waUV6cDRndVErR1kwNlBXdnZyalVuRndMWHovRlJnRTVDak1IY2NX?=
 =?utf-8?B?dFlmaEI1Vk9WR1RRcldSOVVqV3NhT1IxVEpNcE5Yb1lzb1UzVFd5MDc4OXg4?=
 =?utf-8?B?MWJaNkJ4NVBZUStPSTlaTTBzUjBqQk1mT2tuU0kxZjREbjZnemlEMmVCdXEr?=
 =?utf-8?B?dURIc28vekFjbmNjSjdpUVRRUFJacDFpZGZZWHFVTDB5bzd0REtNVlE4dFdn?=
 =?utf-8?B?OFVNWTFZSUsycFIvNm9OaDBNL2hmbTFNSGI5WlpzWjM1L3RpQ3FHMVRXRitI?=
 =?utf-8?B?WXZSSTljSzJhQmt1ZytTT3R0K3FUaHRzeUFOcWlJZjBpZ09HR2FnSWMvK3BO?=
 =?utf-8?B?SE81U1RmTVkzbUhKL0tqaSs4b3BRbVpQK0ZQdGpubG1Ud1FuWDJoWlBYZEM1?=
 =?utf-8?B?UmlZOHkrU2NoYTRhSHBPVUNkNUREcTF1ZmxmUHp5WGQzTUdnLzc0dWNJb2ZG?=
 =?utf-8?B?MjUrQkpmVFFubkNCUnkreFpicGNFbUxlYVoyanZMRFpnUlRMbzNKbnlGVTBs?=
 =?utf-8?B?cHQzaENOTGkzQ1lvUVdSSXpxRElYODlwNHRtWkVsNGJYVkNyNFEzNzlJb25l?=
 =?utf-8?B?V1dpZGdONXdGSDFER29jbzhzcUJNTzZJQkN4YWdJZTBRMDFBMmFvTEF0dk41?=
 =?utf-8?B?azNYTWFWbWJMcWlpdjVTV05OeWs0a2hBR1hCSXFOK2tKNXNXazY5bnBzUG1x?=
 =?utf-8?B?d1AxUGhXZXRhSFF6aFdVdC93Q2hIcnNZSEpKT1RmdU5EOWRWODd0V3JrU1Zp?=
 =?utf-8?B?MW90emQyeEtDa2RGZkRqNlRvQlRteS9MbnJ1c2FSdFY0U3J5K3BteGQ3RVRD?=
 =?utf-8?B?RmVTQXFmcHg0US8zeWdkQTNnMFZXa1p2UFE5OVNZZUpkc2lBQzJRaS9FZGN0?=
 =?utf-8?B?dVFnQlRTK3hDcS9EcldXcUZ4WGwvUnc0SzlrdGxwdW5hc2xjbGc2Z3dEUktR?=
 =?utf-8?B?Mi9uT0tiNFdNc2tjaEFRRmUyT01NUE00V0FyMFdaUzFhRkk3UGVtL1VZWEEz?=
 =?utf-8?B?VXBtcStzWmx6UXdsUjZXZ1BoT0hyaGJCemhiYlo0V1BoNitaZVNESXo5MW5a?=
 =?utf-8?B?YldhdUhZWUltYTRORVB6d1d0MGQ1RUJycWJaMlRscTRsLzFYNnI3TWZpcXJ1?=
 =?utf-8?B?M2RqNFg2emZ5S20zN0RhSGtEV1hhczVsK2E0TEptNVp3aGd2R3ZacTJYZnRY?=
 =?utf-8?B?dVRYRWt4MnQxbmNjNXVHVktseVduTmphR0FhUzNTWFZxeU1sdmRIRjh2c0dZ?=
 =?utf-8?B?UkNZeXFVS1RBbjlNRFNLMlUvYlNYMkhnMU13Y2dmY0hvUDFtODkrUDh3L0tL?=
 =?utf-8?B?ZUl5dk1wNGNhWTNXSHdaanpmS2ZNd0NLV2YyMHc5dXRBWmN3bWU5Qy91Q09o?=
 =?utf-8?B?MERTTEhEdU85bzkxQmxsSUhNeFh0amJNelZkVDdDSTdtLzNZOWEwVVZvYlVD?=
 =?utf-8?B?NkJ5aG1rRlQrR3l2ZmxuTzRpV1VQVnlhSlVMcktnYWszQ21haXM0TGRXRkJp?=
 =?utf-8?B?N25sYVpYaHhEcHVtRklCanRYcDlEb1dXUnNOU014RnNOTkFReUNEaGZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRVTW9nOFQzd0dpM2N1SkhWSWZqZ2dTUGpTZE9QdW4zblhJSjZlblRSTUR5?=
 =?utf-8?B?T1VBRmVpazFKandrZE9PR1BobDhMNXVsOGJVT01LeXIxL1gvRXZlUU1RQ2ll?=
 =?utf-8?B?RFNtRXh5NEZhWXpxcjlGaTJmbnNGb29tdm9pV1hrMWhEMVc4NGEyMEdCeFJs?=
 =?utf-8?B?OTY1bm5WbGgyTHFWU2UwMUNaLzRZS1o4Snc1V1krTDZUNDBEZ0JYSFlFdnMy?=
 =?utf-8?B?MHlBRy96V3cyaStZRWpmcHVaRWpzVjNHMWIzc0F5WTkwK2x6QnJ0cWVTcEFp?=
 =?utf-8?B?dGRUaTEwK3ZWRVd5TGwyNFExZkQzYXFxMmxIdkJtNURKV1g5b3ZadmxrU2xx?=
 =?utf-8?B?b2Q1ZGhoT2Z5YnRjclNzeWpDMjVaZXlCTGlWNWROQ1RTYlBiZlFHY3NGczFW?=
 =?utf-8?B?eTFiT2hMYjQxZ3hqZm9LeDE1N3BoSFBRTXkwdmVTNmxqbVRxNHRYSlNmQkll?=
 =?utf-8?B?M3QzZUMwV2xKd2x6UW5IdVpuL2FnMldRN2Zjbk5zbndYa21JN2dVZEZEVkcz?=
 =?utf-8?B?TFhQOWo1Smx0NEJ3YjRCWEgvVmNPYjFrTHh3em1pdVBWTW1MUW42WldqMkJN?=
 =?utf-8?B?Q2J6elptVy9kY01TSWtxdVlpRXZPaFZLOGNUYUxiQ1dIdkdWSzYvOUxURnVY?=
 =?utf-8?B?anFXNXY0d3FJRnhrMGJkbXZGb3pVWVFoWTIvdnJTZEtXSTVRYnlOVDJ0aFoz?=
 =?utf-8?B?K2xzMTE4MU5FRUt3dFlWdGZBa0Q3emNyZXkyY1N5WWVUWjFMVFVpd1BTQ3FW?=
 =?utf-8?B?NU5QUmZpR2FveGhlSzhha3YxbytGTy9yc3Y4czlGckhFVDdJbnFWdEpRUHls?=
 =?utf-8?B?OGRYcCtaQ1ROT2tPMkhVb3NaNG80dlEwbktFNzlkK1lBcFdRaVpVT1BQblpM?=
 =?utf-8?B?a3ZIK09rOVdseG0xQS8vdkNpcjhVdlo0TzhNa0NVaG5Ua05tSUdxbW02OG1H?=
 =?utf-8?B?RUI3WmZxYmY0eXVwdXVRUjBndXFwMmlJQ2wvUkxOTDZ5aEl5dm1JZFhlbUZ0?=
 =?utf-8?B?R1Q3SHRlWHI5WE5jNE1IQ25mYk03VzZCOFFkVlJtOVplQW9Pb1lzS1c3Q29S?=
 =?utf-8?B?UE9jTlBFT1RrcWpUM2tnK1JDdFdjT0FqUTFRVFRySlZNSVR5NTlObmlUZWM1?=
 =?utf-8?B?MGJGSlZIb0doTjBpWWhrYzJoVlR1UUJkZ01TSWxMWk1OaU1qQ0trUGdQc1lT?=
 =?utf-8?B?V3ZPbmpPK0J6L3lUZVcvdnNDOTJZeng5OEhKV2RrTUNoOVgrandTbytTandn?=
 =?utf-8?B?SjlwYTludWRMN3k3bFZ4ODdFU0FhQytFRkZhMGh5TzZtNEFDYVFtV1k2QjRh?=
 =?utf-8?B?V1JVN2RvZGFhdFkwaHd1SEhDcWJGdVFmcTJndnVydTRNd25pbHgzc1BPZnlL?=
 =?utf-8?B?ejVNeWxkK2dJQmdhUUE5b0dWenFMTmI5TWh2OFJWZ1Q0L0xrQlJuUVF5UEY0?=
 =?utf-8?B?ZGN3ZFIyS3BuYlJwc042NEFsaWdHMk9OMnhOanJjMlcrc0ViQlVTR0s2ZHNQ?=
 =?utf-8?B?MFZhbGFZWTlBMFZqVlhFaCs0Y2NoQlJSaUpZY1cvWHIwSllkTk5tYk9pRDhk?=
 =?utf-8?B?ZVVOSTB3RkZFMURKZmQ5Q0RUS1llVlFlVmU3bkd1cGtyNWJtSTlLMzVYeWp5?=
 =?utf-8?B?M2sxdWZsMFdxZVgramZhbUFaY3BtMUd1YmVySG1sTDlQUC8ydHFEVlZ2MkZZ?=
 =?utf-8?B?WjZiU3Zsc0FqN2w2aFJ6MSt6ZVE5TnYyYTVRdDMzNTBWZTFWVktGejFNYlBi?=
 =?utf-8?B?dGVDTE9XVkk3Q2c3MFFER3FaSGozdlV1bTdKdXJSeVZ5bjU3YXBVdVl3VytO?=
 =?utf-8?B?WFV0Zkd1T1dveUVzb2lnRUJIL2hScCtDUktKTUJSTm5CdW54K0gwTnBsNVRz?=
 =?utf-8?B?KytNWXIzT01uSVc3TmRzdXREdzVFVkJBWlFDUzZlc0R4S3YxK056aUFxNEdj?=
 =?utf-8?B?dm9VMUNpZklTYmlwOUhwaTZvWmxuL3dXcGpTTW5nUnh0aXRZb0hiZ3NYTW9l?=
 =?utf-8?B?THFKeWV1ZTBVNCtuUEltZGVpU1pXUi9IVytkUTZ3c3M5VEZlOUdHbENTaDBT?=
 =?utf-8?B?T2RkV1NOcGZTejM1cUJQWDdsS2JJU0lPdk1nM3ZXbGI0TncrY3ROZjhBYWpn?=
 =?utf-8?B?T0NpMHZKczkyYjFWQ1ZYckpndnl5eVE1N3o2WGNXOXpEYWpFckswdUgyUEF6?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 645aeb33-a109-4282-c870-08dce92fd55b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 13:31:23.5301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6VSK5TmYjDzRwRrfMl+LWDuPZj2MDEjmOjVBmU8vVSpvxzYU6ZkdCio+R21aWB8dBAlF2i1CKYmtuBbXmSGowaRoyba1AWufUTP9AYQ22o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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


On 10-10-2024 18:54, Lucas De Marchi wrote:
> On Thu, Oct 10, 2024 at 03:33:30PM +0530, Pottumuttu, Sai Teja wrote:
>>
>> On 10-10-2024 09:18, Lucas De Marchi wrote:
>>> __read_timestamps() is actually reading the timestamp from a certain
>>> hwe. Use it as parameter, move register declarations to be inside that
>>> function and rename it.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
>>>  1 file changed, 7 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>>> b/drivers/gpu/drm/xe/xe_query.c
>>> index a1f4cc25bea68..d86959076b078 100644
>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>> @@ -85,16 +85,13 @@ static __ktime_func_t 
>>> __clock_id_to_func(clockid_t clk_id)
>>>  }
>>>  static void
>>> -__read_timestamps(struct xe_gt *gt,
>>> -          struct xe_reg lower_reg,
>>> -          struct xe_reg upper_reg,
>>> -          u64 *engine_ts,
>>> -          u64 *cpu_ts,
>>> -          u64 *cpu_delta,
>>> -          __ktime_func_t cpu_clock)
>>> +hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 
>>> *cpu_ts,
>>
>> Nit: Probably the function name should be hwe_read_timestamps (s at 
>> last), just like the previous name and also as its reads multiple 
>> timestamps I believe.
>
> I went back and forth on the name... this function is actually reading
> the engine timestamp and the additional args for CPU timestamp/delta are
> only reporting "how long did it take to read the engine timestamp"
>
> so.... the change was intentional.

Got it, from this pov the name makes sense. Thanks for the clarification.

- Sai Teja

>
>>
>> With that LGTM,
>>
>> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>
> thanks
> Lucas De Marchi
>
>>
>>> +           u64 *cpu_delta, __ktime_func_t cpu_clock)
>>>  {
>>> -    struct xe_mmio *mmio = &gt->mmio;
>>> +    struct xe_mmio *mmio = &hwe->gt->mmio;
>>>      u32 upper, lower, old_upper, loop = 0;
>>> +    struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
>>> +              lower_reg = RING_TIMESTAMP(hwe->mmio_base);
>>>      upper = xe_mmio_read32(mmio, upper_reg);
>>>      do {
>>> @@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
>>>      if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>>>          return -EIO;
>>> -    __read_timestamps(gt,
>>> -              RING_TIMESTAMP(hwe->mmio_base),
>>> -              RING_TIMESTAMP_UDW(hwe->mmio_base),
>>> -              &resp.engine_cycles,
>>> -              &resp.cpu_timestamp,
>>> -              &resp.cpu_delta,
>>> -              cpu_clock);
>>> +    hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>>> +               &resp.cpu_delta, cpu_clock);
>>>      xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
