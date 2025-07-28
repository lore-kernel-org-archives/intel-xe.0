Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F9AC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D29810E190;
	Mon, 28 Jul 2025 19:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC95l8UF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E16E10E190
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732322; x=1785268322;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TUUDkii1c7JZmOwqZrn2eAzCs6M0eIud5TajKOpotSo=;
 b=IC95l8UFc4JuMDeia7uB/rYYwLCw9J6HkiMtkgakBVnyHI/V00aBiQxW
 7WLqAHE965xlXNAgJYmBH17EQYPu1bGdfURfkKxi2Nz1+X3erpJ+uQ/5C
 U9HB/2tw0v0iwidD3dcj7QlHVJiBn0tTxDifZNCPHTDIhL4qw9NANPSUc
 BBtedBMWjpCD65BzgTfC9OTevEYqIvH7+1mKA+jWgM7H089SHR8/lNKFI
 2qwcY9r2Sqwo1g46O3OAnXZs9Epcs9fMKAGR5ALoYFAv1laZ6fp/RKs9s
 xKddNAiNYrcB6iEPAu8m2EY/g6wd9R3QSdYd+zcckGSfTQX4BLkvCPr5H w==;
X-CSE-ConnectionGUID: pR2B3jA1QTCWhntd92XJLg==
X-CSE-MsgGUID: f66R+KdFRFC7i5ZaWJmV0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67073933"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67073933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:52:01 -0700
X-CSE-ConnectionGUID: +rZUC6utQWKQCBunVAodxg==
X-CSE-MsgGUID: ufRzJa1MRrC2eb6G0gq0hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166754171"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:52:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:52:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:52:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mac+6YAYZ5tjz+QYC/aVz2x9gcXPKYXbwHCZy/ypTiosbnWaoLZkytOyLoJq5GxycI6H6a/Tfge9zzANAOHzgBIrE9XYx+Pl+BGXuKVzCgakqC1FgmAurNtjBkP8n+M4j4vEdjHSKoBM0sefOdO1BNw0mYOK3WOiK/5flV/qk0EgsESEAfH38JQAmgcdxvk3R9xIIqYWAIo76faDSafIZ4TNuSAFgrPRW2c2hl+ZrkoNfMuALnRG6LCs4v+SEDuQ2yfIDW9t3tPiOCfXbucf8IUO2hoBOO+98Bpr/iPwuuifyBmeI1mS7MwQ3PAwUJ9DESpPXeaYp3lfTyIXqkTcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfF5/WsZ4+UMgepaFE9Ps1bofhz/xXl6mNzZbdlsxJA=;
 b=Jeht+NacdyaLKrcrWOC3Be9o833jOVufE32l1Bhp/9Ctk6E197FyxFeU8Dj08pnWbVQjvcq855k5gyPmRYQcp7DOMZMDzRITABqM7eW0J58YROn7dtrV98LcszPEiYbmr45Dxr+A+8f2V8Oko9aBhMjWgdA8gZbLcGG3rAuS+o0UENtXY1CVnqh/EBbwwOTVh/qLUQ3XBof5UguBGGhoj6Q34G5Qk6kRCNIYyj0vhOyxekMf2eNl2p48k6DPaDcWoaPy5tHNj64MKpjMnTS5qwPoBWaewuaJ5oheN6IcXLJS5i4xVj+USA4UoP7/hPK36Yi23++QfvB6B/9ka24lVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:51:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:51:16 +0000
Message-ID: <36f1f722-87d1-4ef4-8761-192019b41fd5@intel.com>
Date: Mon, 28 Jul 2025 21:51:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] drm/xe: Print module init abort code
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-3-michal.wajdeczko@intel.com>
 <aIfR7noIcrRAMnJf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aIfR7noIcrRAMnJf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c98b158-b084-4597-5e90-08ddce101d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3hDVWcwSVZsZmIwOEJWS3BHRi8vcVdkTzZwUkl4bkJPOEg0ZlVieERkZGN0?=
 =?utf-8?B?VThtNC84eWJuOTFoSWpXVm1GUVlOQXgwdU1MZk9Td0JLUmlwR3RNM1FwNVhp?=
 =?utf-8?B?YUQvdGl2RXJJQ3J0cUUzcjFpckVTenhzT0JhWktKTGxNSjltV2s4VnM0MUkz?=
 =?utf-8?B?bFdFZW9aaFRORW1oMVZHZ3ZkakR3VXNyaVVWdlVaQTZvRGY0Z2hKNnRkYjNO?=
 =?utf-8?B?eGE5TUgxVjlBaDB3enQ1Y3B0OUFyeUJzcXBkS0lNN21wZFBGQkY0R3FqbkpH?=
 =?utf-8?B?MHdBUm5lOVorNGoxV3hXQ3BsT0VXN056U3FFMlFmZFM2bWxsN0JZWnY5bU1H?=
 =?utf-8?B?MThLNmlWSzU5WUZwS1R6Y1J6NkNBMHd1bXp3Q0lDZEF0ZjhkVlYyZTg4UmFz?=
 =?utf-8?B?Mms4aEJQbUFvN3hWSFNycUMwd01tK0FvalpIOGxCekFsQ09pNFlhRWErbU5X?=
 =?utf-8?B?dXNmNnhkUW96dnBsZlE0a1FpRXRtemdXOXFHMnNobmgxeFBhaUdUK1AyQmdI?=
 =?utf-8?B?SE1VZEhTd3Z2NXZHd2xOMFBndWRhbGRqeWNHMHZ0ME4zOXJaYXdLUVhKdURl?=
 =?utf-8?B?dXI4bzZMc3BHSUFqbGU3aGd0a3pFbzZzZ2U4MmZ0RllabVZhMTBuZlpWNitk?=
 =?utf-8?B?SUliQlNzVDB2bHBFNXdyQWtZd3NpRjJIZHdTbUpnbjhmYlpmUVVpcUhCdHQw?=
 =?utf-8?B?UUtpTmJJMGhvV2JkcUtQdGFrYUc5OURtVkZ6a1Y1RkFiSllwdUFRS2VxOWtR?=
 =?utf-8?B?blNoQmFKRmkrQ3BlSGpnamkxWGFQNDQ4U3dhRElRZXJBR0Z4NlUzekFaNmhG?=
 =?utf-8?B?MWpLQ2dOUjlYdFI0cjBYTUVEMzBtQ2Zpb0dFekFoWmhONUVvYjI4cnB1bXZB?=
 =?utf-8?B?R0lMSGVmZWk1Wmx0eVludVh6cGh5UHNQWEhCTmh5T3llTmZMUWxUbEkxL1dj?=
 =?utf-8?B?aWtHWUQ5TC9iUjlxdjR0dzFsQk1IVGV4eXJYLzNZd2E1anNESlIyUXVpbHJZ?=
 =?utf-8?B?SXU4TGxEU0ZXcXF2TkZkVFc5eHhFSEkyOEZPcCtMT2gxK1pydDlENGoyUEtH?=
 =?utf-8?B?bHBua0ZIdDM2Mk9aRFZuMkQwYmcyN3JHck5VYlBQbDVrVUJ6Z082RGRIbzI0?=
 =?utf-8?B?MnJRdmZkVGN1Sll5emN3aXdWOG42UkdVN3ZXNkVRcHlDZ1RZN0JKQ3BrTFFX?=
 =?utf-8?B?VG01M1VVNTZLbXNyRHpJV0RVbDhJRGlRVGxWZkZkaFZnaTlkR2JCamlOYktP?=
 =?utf-8?B?VVRIZkhSS29CLzdpTWo3Q3lGN1laUDhOemZTVklMWmdGdlB1aEhaMU1yaHhm?=
 =?utf-8?B?ZmgveVFqMVJvQXo3cUlTZlJTVHBnejVZaDBhUFM0Zk5rUmRtbTNxekdZMVdi?=
 =?utf-8?B?T2VRQ2NzdG5BbktsT1NVTi8vVyt0SG9vUFFIWDZvVWFIa2hWZFhEbTR0RU5z?=
 =?utf-8?B?T2xibWh2U2dkOXJ6SEs4UmkwUk1kdDZjNkVlbjRod1ZsV2RNOTVUWExYdncw?=
 =?utf-8?B?QndldXJRWkdzQnNwMTVxQWJNM3hZUCtJSWVIMHNEWWh3dzA4ankxMmoxeWFm?=
 =?utf-8?B?V2hkNE45Yno1aGZaSDRZTnRaNHBPbXBYcE41V1dRRUpWUnJldnFNYlA3M0tH?=
 =?utf-8?B?aFZocVpFUTZLbW1kN1l0Zm9RQkZSUU9iczFaSXo4Qlk5dWpTdTYzVm9BUmI4?=
 =?utf-8?B?YkFJWlA4aWVnUk1kbUxUcWdySWQxckhwblNDdklGcTBFNFVEYjVhL01YWjNh?=
 =?utf-8?B?VTlsR2Ruc2Z6cko5WitPYXBzK2o0STVtbnplb0dqU2ZGbVVHNXZCcDhKL3lH?=
 =?utf-8?B?cFNwTEk3ZVhUMi9iTmtZbi9XZm1Yc0VBSklyeWQybWthZU9MaU1BajF1VHBJ?=
 =?utf-8?B?V3VMTWJWbFpVL3BuQVgwem83aXBsSTNPUEVta29DS1VGU3VKV2gxSVlZQnc0?=
 =?utf-8?Q?sNpQbBTzKqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdScTh6UFkyUjdPMGkxYUlDcE14TEEwT3M2L1ZFcGhlWitRMjhPSzhFOHNH?=
 =?utf-8?B?NytSTXZYOEFQUThVVXJ0eks3UkkxTXpveEZpVkdvVk9KZGxram9YZ2dCNHNL?=
 =?utf-8?B?R3pCQlE0UUlOeEhTdHZwRVJkaGNRRmZSbTNLU0YrQlNoWXhXK29LK0dEMUJ2?=
 =?utf-8?B?Vm0wMDl6Z3dQR1NPeTdZWVFzT2Y4MG5FYjhqRVdtRFlhVDZzVHVuRTRBNk9r?=
 =?utf-8?B?TUFQZWIwbk56cU5wYTFFMjc0RWpsdHc0SkhlSzFhbm9rZWFrVk5GQzVRNFFy?=
 =?utf-8?B?M2VhWUM5d1U5dGFicklQM2hBdVY4ckdTQU5MSW1DUWdOOWtIMWgxQXprRDdn?=
 =?utf-8?B?NnkwR1FqZFdyUWx2K0lwRXE0OVpzRG1CWGZzS3h6cWdlK1VWbGtBVUoxMW45?=
 =?utf-8?B?NkY0WDFlMWwrWFVUTENVbDFXNW84ckFGOC9jL29ScXBaV2FFMGdEQWZSdkMr?=
 =?utf-8?B?Q1N1K0h1cWZxaVViT1I0T3lTZit4N0d6Y0pvdmZNazhPamt3MU91aUUwb3NS?=
 =?utf-8?B?ZmI2WnNmdE9TbVRXdkxqVXdmbGJhOUdtR1hqb1ZFUnVSeURwZ1VUR05PdHNW?=
 =?utf-8?B?QXdGd2k5MGxPNmJkLzdPOEcvcXdHOHFqUmZWUWdBekJFQVJUbXg4VlI4Yi96?=
 =?utf-8?B?aG51OUZ3RXBETDhTYmNFL1FBdS9GUkdKeStHREVTSDBQMllwT251WkFBT1oy?=
 =?utf-8?B?UnU2L25VWjhrcmtIVVdua3gzNlFKdmR2U241RnRLQ1hKYXQxTHl5dWdVRzg3?=
 =?utf-8?B?NitMNEVCLzdpakZFMEJaODFCYnVuZ0l6Znl5WGJYeFZUU2diL1ljQU95ZS9M?=
 =?utf-8?B?a3RqVi95RHdNempyUjVKS0YzQlhvZHhBVW9pY0VJcVR6dzd3cXJvZlJROXds?=
 =?utf-8?B?YjZLSkh6OGUvVmF0M0xPbDJyWVhTUU1QeUJPNXV6UzdidGp4THdnL3JseGJj?=
 =?utf-8?B?QjVSSGkvb28xRU1kNFBOVUNxTUVzbGdGQ0U3R1FZQ245WFE1SEJ0YWtiWVFB?=
 =?utf-8?B?Y24yUzFVNE90VHFQSkJkVEMzdDcxK0ZzTGs1NHVqVHAwNEZ1K2ZYMzV6S2pn?=
 =?utf-8?B?MUliYitsRVNmdGxTQndmbWdGOFJ3VmtXMG1hMGRKNkhUa01VMnBlRHRiL0pI?=
 =?utf-8?B?STVoVnJUdGtuK2M1a1FBT1R1eW1DS2tCWFJDeHNyOUZjZFp0emV5SzVmVWlw?=
 =?utf-8?B?MWVscGxmeDdUTXRYUXlvYzBvc0VZY2NGdFNEODl3RVkzUTZPNC9CcHA4SlJX?=
 =?utf-8?B?OTdUZzZpRitLZHdtQ0JvRjcwbHlVOThCUWIrODBPRjBQcllyQ292dWVld0pl?=
 =?utf-8?B?WVRDSVZ3TVEyZ1RCYzZhZXdjaVgyMlFYcGpFM3VYN1pqSHlWREY2Q2VTbzZY?=
 =?utf-8?B?dGZhdmRWcUZQaUF6U1VvMkhaeU9oNld6T1JoZUhuYVBYWWNpNlR6NkFjM2Y1?=
 =?utf-8?B?bnV1aDlpeUxld29QeWhnYUJHVlpQZ1drbWU3LzhCODVCam1aVW9WZXVyc2pq?=
 =?utf-8?B?cENJNjBQdmp0dVBiRm5Pc1NpcTgyaWVoOHFaTXpVRHdKQUtEaU1kVkhrZFlV?=
 =?utf-8?B?QWVLT3RjblU4eTVKQzMvNkc1dU9NZDI5QlZ3c1MwTG4wcTRtOHZSdWhRbzB2?=
 =?utf-8?B?cURUQ1pZZnZLb2NObzdjeXdJWm1qa0hJbXlkSWNjdWZzL0w2aVpYMGJIOHJv?=
 =?utf-8?B?YXFPVG5GR0RaR3l5Z3lHWHVMVlVJSzJGdzF4SUQxVmhlSHZHNlFZYlp5YXJP?=
 =?utf-8?B?NW9jMVU1b0Vpc0tuUEZiUElZV0d0c1ZYVUt5SXhKd01IeXI2N2FsYTUvRUNj?=
 =?utf-8?B?SFR3RlU2VGZOckJPU2YrOGV0cHozb3FzdWRRR2lheXIwMmhjODd1eWdVenF4?=
 =?utf-8?B?NWVzbHJhNmdwZjVnM0lWejViakV0SkRJdHZ4ZUtzbXFERmYrY3dzZldPa0ds?=
 =?utf-8?B?c1k4ZXBMNDFMR21YaUp4UzZlL0pRU0E1dnV4b2xBM1hjTG56V2NTaThlM1Rr?=
 =?utf-8?B?SlBtdUpLUjltQ1dDOVhVRHRGSjFrcmdaVm1QUnJwZzFjaE4vRTRmWDFNLzdy?=
 =?utf-8?B?TjIyT1cvaGVwWFZrSFFvYVZkcEo0dEpPdjJ4NEhCZlJRV1F5NGtFVDh3Vzhs?=
 =?utf-8?B?NGkwRTZJQmczWTJ5SE5qcmJZWGpVODBBaFVwQ3pRcDFMK0I5NnMySXZuMVJE?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c98b158-b084-4597-5e90-08ddce101d60
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:51:16.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAdsHDpsAeAbCzuMOgF9WCJ+yXnPRG6UXDKJEZ3oLbLFJlO9IsqgWqaN8SifneKtZee8QbSXSgyqaJAoB4+rIAbq6z1Jv8Zq/3D0CCu/JFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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



On 7/28/2025 9:39 PM, Rodrigo Vivi wrote:
> On Sun, Jul 27, 2025 at 07:19:59PM +0200, Michal Wajdeczko wrote:
>> We should provide a hint to the user why the module refused to
>> load. This will also allow us to drop individual error messages
>> from init steps.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_module.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 593bc9e5851a..23be7c4cfde1 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -155,6 +155,8 @@ static int __init xe_init(void)
>>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>  		err = xe_call_init_func(&init_funcs[i]);
>>  		if (err) {
>> +			pr_info("%s: module_init aborted at %ps %pe\n",
>> +				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
> 
> pr_err ?!

that was also my first choice, but then noticed

	.init = xe_check_nomodeset,

which is used to skip driver load on purpose, but not due
to a real error, so I decided to switch back to pr_info

but if you insist ...

> 
>>  			while (i--)
>>  				xe_call_exit_func(&init_funcs[i]);
>>  			return err;
>> -- 
>> 2.47.1
>>

