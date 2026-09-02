Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81044C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC710E4F7;
	Wed,  2 Sep 2026 18:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgPu9x/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77C10E4F7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788374195; x=1819910195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0o8/KOav4uRwCWdB5tJGl2Ta3PfQjLmDpcnFgI7ovTs=;
 b=RgPu9x/NKuM1m8XGy2cR0Njjczefk9wXzUTMCWdb7NdPPF1ZGEz4+SfO
 hJjdLk3KmQxIyvhi/iLPsV8BdPCr2uLf1516A9Zbqq2p32otxf7OL5Prt
 3zvjNw83v2ectmThANWHFMkkYMVKYXiaYHufSg2O1n+2oFU4GsNVgTRQa
 xxLnQWIJ+jgPCuxMoQuncy+5B8k6w6EaXj/saWnj+LawIWjDfDOm/4Qt3
 V2tsmCi1+Vnfgd0nPvsigGl4JK5OcW9lzsnto9GxjUv+QWMGfnqkqx8XL
 JV4mxH+XJqDeLp5zic2PEfbPxP/MFcnQN9ENuj41h9xwFQxf1XZhxAcO/ w==;
X-CSE-ConnectionGUID: Ne2W3Wx4ScSFTG94e1cx5g==
X-CSE-MsgGUID: FbPE+r1TRxep3gYjqL162g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88718734"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88718734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:36:35 -0700
X-CSE-ConnectionGUID: QePkTBCHSPGKZdgP4hSELQ==
X-CSE-MsgGUID: P6qPX97qTSisXe/GCFhv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273645276"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:36:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:36:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:36:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uzknlkuw6l/7WS9v6FdLrd+F5Gd+MEzuMgfcKywG5uP3rSn8UoPXsNGAep8NnocJH3lBvJhqs59329iXET/6QTcM+jkHTBI6jmIKyjAlZCk2WuK+wXCCPisbJwV+CaetF1WHd+a6XEqA/oJ/6toZaY6as0QP8DZs84t7n9+t4a/2ZGS5kyRO0YEWWFvw40199etpoIY7ea7sCAQ0o6C7Orw2SYiiOsBCAuKumwYt3zuLe1w8BPUU9QCD44Nv4LBHIeeSHAbF1rUw6AT1zQR7vBcR7zPfVgWNqPZdrB9SwDl6uG77h/s8SNii/XvRAXfZ/lb+YOcfY86yden3US9p/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yic4CVRIGe1bTHKqIBFx/JhKiM1OFC29DR3J7bl/ueY=;
 b=G814PZDLdR1yCEPydki3m5lcUTpFwBaVok7s6NCMTkwLmTDoyDPsJaHl0HualigK6eEzw4JQ4UHC6XpM72/U6stePcdipFCG5VIYGCL2yVphoak9Zfj7cBc6fwTUdr6mgeLvVwRmFTOkReGj6W8UV8arhAkZPSvdbmMlnWaEPYEE6VWJtkMRfXDDxlmZ8xaic7HqjrDpwT6E6OOlJLlqZVVqxJU5g4zlUo3VjVsG2Uj/mlHMIMMp3sikim3z5lCU+N20AdVwJlpKLPj0HNgql23xm2SZb7SqWkBSz9DbCvBKb6i76xZVXggzfVz6131VbLPs/Veue5V4chPK8azOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:36:24 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:36:24 +0000
Message-ID: <d20842c0-55fb-4542-b52f-4408ee86ea52@intel.com>
Date: Wed, 2 Sep 2026 20:36:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-30-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260902145343.465686-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0050.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::11) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f97c852-1a61-40e4-221c-08df0921174d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: GTWON0xen2N6xvtG0tTSIQb/Xk7fspMFOAYABYFdpWhRnR3GGo7RwAaZlzYrMFUluEPC9eyhM0JMdb7bZNsPjOeboGXELVt89Tu9T+qvXK66GYqDtL4pIaIWygavISwp9aNj8PTuSfeCrkXFlNRi5dhJsrcwB6J/FqLBwppV7oBRCaW4Mvn35AYWb7aTyjNzKf/ZZE1BFmnwIiWVzfS1CfiZnS/03D1kjY7y7EYJhaaE9+PgnzbXoCHcw8XbGqiFIPqx7m37zRT/1jAYUlCCtiWem/eonVcoSPvNEq9LIkdZeDsxvtdz7gSLSiBtxtyPSDAtQWVi7Hz4ct0MsIjuyhwaoW8lEj+E9QVIm5Vael7Fmgg/SmBd6wVeWLg3gM4pOijRqkLbFgPnoDw9SJXki7SmWChmECxT93kL04l7LbBFpD+ZTxde96zJ9+4k4sjy6ARRDeZe52KLUSK1ettJWzJ8Vqc2wWG/t00l8CZa0i5DGA6qi/w3TM2ICz9wqIFA1bmGw/OxPHk/olFhochGuca9ZgaE7c6j9nUAadeJwzpEBb0qk17XufxHafcKx+1cTyEhmnYW04OcZjW3LlERn7U+zYIekUIaLWNu1aKMLqgrbOUo9bCIJM0vljTPADOlgmXbfuNEvdg5Ohb1rhBGkOYOoy+DYe3oPD+3uEYKVXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkpZamxad055d3hmdThuR3lGUWM4S2ZmYkVsa0JmaWVBV3R1YTlBQXBxRVI2?=
 =?utf-8?B?OUpEdVBoRGtDa2ZjajNsTHl1eDgrbUIwd3JEbnU1TDZFR1ZyT1J1dFBmaGF0?=
 =?utf-8?B?R3Y0OEFxdXA2REZnTlVoQkc5UVpQVUU3K3NKQ3ZBWERjT1IrNDlQMGhWcGZX?=
 =?utf-8?B?aHRZem1namJQUUQ0aWErRkZDNllZZit1ZVRDbVI3MXBaK29RZ3grT1R5TXFY?=
 =?utf-8?B?aUQ3T2dFR2x1ZmEwb1lxVGFDVWlzNFpLN1M1K2pJTFNsbGRBZittZDJKaGV2?=
 =?utf-8?B?M3poTmVwak4vZ2wzOWpiWGFGWGp3UXFqM1kySmJDbTN3RXVBT2NadHoxQ1dm?=
 =?utf-8?B?UzFNTm5RdVd1T3ZidXJzdVc3TjkwV2FkdUtjcGdCUW1QaUQ1d2JTczZuc3Fz?=
 =?utf-8?B?NU9YSkVKeUdrWnFEOUYvZFJmcklSMlgyQkJLNExhdTROYjNxYlVJLzdyTWVt?=
 =?utf-8?B?WEp0WXJIbktPSXA3UjRkTnNPMXZkbUJmd3lsNEJQQk1CbmV4cVo2dlRJeUFE?=
 =?utf-8?B?NXhpbVd0bWExdzFBUkRiMnJJRFFvcUZFWFhwQlNsenZuWDdVZTBsTkZhaExZ?=
 =?utf-8?B?RkM2bWpvaURSbEcxTVp0VjlkY0Z3Tm9BS2wzbDZjSDFwYXYwWlJiZXpleTBt?=
 =?utf-8?B?WjdSZC9pdjlHbTB3MStidmxwUVRzbTNQVmtCY3Z1aUxTS0pDZ2lESDVHT29K?=
 =?utf-8?B?OVp2U2ZGUk5NY2lKN2Z6ckN1TGp6OW1oOG91emxQTnZFY1RuWkQyY24yMDl3?=
 =?utf-8?B?TzZVSGZJcjFXdm5ES25xTWxiQmZkU3VxTUlmYmg5TzFkUUh0MmtrU3IxQkhQ?=
 =?utf-8?B?WmNBR1poVjR0UzFVRTFmbnVpaGZ3TlBUYnBRRGJaSTRIYkIyYlNmeng2YlR6?=
 =?utf-8?B?ckxHT0lLQUdRVTRqaGduYnAvRlBnMU9HcXZmbFd1V0VaSjFPa1hWL0Vrd3NT?=
 =?utf-8?B?SmdrOHBPdlh6enQvbUlsS0dzMTZUMFk2cytBNENtNk5zUWhjRWkwZjZJQ0Jj?=
 =?utf-8?B?L2I1YktFRlRxd0VidWpkOVhPOERwVm5TYjNEYlhCTkJFVllBaW9sTnUzUk50?=
 =?utf-8?B?UFZXTlZBU3RZdVRuS1dVdHUrekR0aGl3YXh1NTd5VHozY3FrQUhpMmh6L01B?=
 =?utf-8?B?dWpSYzczK0RmcTBDQ1B2T2pPMnBzUldVWDU4emVZVHdFRTBuUXBwcXhuQkZN?=
 =?utf-8?B?UFJ1VEtlT09JcWgrL1BqRWZJRGlNVWtRcTdwbE5UTmdHV2twVTJPVW5DM3Vo?=
 =?utf-8?B?UUNFR0cvWWhoTHRJci9DaE1hcERUY2hZdGgyZ2xFT0xpcnpCLzgxN0EwaGx1?=
 =?utf-8?B?UjR4YS9wSHMrY2tzUHRpR05mczVsdEc1dWt1RkR6U3hYUDQ3SmlpM1A3dVBo?=
 =?utf-8?B?VzNxUnliK1VEVkY5Q0VaYVRoWHVxdVZ1VGQwZ2dnUmhOVk90TjhWYTc4OTVU?=
 =?utf-8?B?QU5ud3VOdUZxZzhpVDNQdXpUSG1oYk5iTEh2bVpkaGUwVHd6dTFyVDVCMXpB?=
 =?utf-8?B?Vy9WaW1seXN3UnF0RnB2NXR0TkgreXkzTUZ0U3psZUxFNXVhSmtDSEZKakFQ?=
 =?utf-8?B?eEdORzN4ZXRZS0FQS09kMXBBdXBMWUNNQlBKaHpaWmJIS09UNnc0Wk5GV1E2?=
 =?utf-8?B?REd3NW9HSytQSk5IeWhGSjY5UXNFSHdibmlGQjdDbDFMK29yWkM3L0FSa0hl?=
 =?utf-8?B?Ly93MlJIWnhQL1cxUlduNkVVSHdBUGZlZnk3ZW5wMXlXdVhha2dLMXNDVGhO?=
 =?utf-8?B?bkRMeUNSS3JPQXJuc3d1VEJLVElvb1ZJeURrandYbUlsRTRCOHRnOFZrUWcz?=
 =?utf-8?B?M1BEeHJKdmVhUnlXR1N0cjdpZkpxcXpxK1Njek41S2pXcFU1Q1JET3NweTNz?=
 =?utf-8?B?Zjlac25JckJ5QUpEZm1saFE4Y1o5cDV4ZkNWU2JmUERacU9qZXlHTTE1Q2Nx?=
 =?utf-8?B?UGJ2TXJmYlhUQkx5aE5jYkltRUlRQlN5ZzY2U3YrNFFndGd4TVUydFVxOUU1?=
 =?utf-8?B?T2ZuZFJiT2pTckg5TG5sT0Y5OXdVYVJjcmEvd0F4VXk5bW1LRkdLNHVZcURx?=
 =?utf-8?B?TW9mTXlVcTRiUFBodEdGSThhRzgwUXZnVmFJWlcxMjFOSmdkUFliUDI0d040?=
 =?utf-8?B?ak9uVFFaUnE1cG5XbnJwOVBrUjg4c2ZwY1lvZVl3UDBLM2loUFpqZ0Y4Njg0?=
 =?utf-8?B?RkNPaitIWDdnaW5WNUNyUHg5VTVzakg0VGpoK1A4RzVhMWpickpTR3pVejJo?=
 =?utf-8?B?ZVFNMkRwS2ZQc0xpQWN6d3ZaemIza2Yzc2Jtdlh2dXRwMFM2LzVzdS9FRkha?=
 =?utf-8?B?Vzg5MjkvOW12cWZSbTl4UGh2UFZrMi9TQUphRVJON0tJelhSRjMrdUVTQXZD?=
 =?utf-8?Q?ngXDyy/eYhplf9vQ=3D?=
X-Exchange-RoutingPolicyChecked: bcdOkbW6zKa27LKpZsrhx+RcrKsljrQjraD5Bph+lmENTzUvlEjhWsG5G6zdk68VY0+kIYlNJJMbQ9efL01a2AiPiQfof486A95j7iYfK4kPFdALTsGs4cKOe4oHMb9y4t2vIdHySf/sV1sO2VoZyeZM925REcXIYIyyiaKitl8A8Ioylhkfa064x6MomobRHGcj2wSydhMAjAXprhKx2Syz5U8eyUuKIJLoZqqCy1CtdrkK4KK17XOLhyh5kRjwclplikhn+G1qH/VWqls8OlWV/6cBr9TMdVe+whk76tJEN7PJr7v99Wqm/ptKl/mVAuXOIyH/T9OxZwwGZkpaCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f97c852-1a61-40e4-221c-08df0921174d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:36:24.1933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS9MG0q1Akl8Mm0lV2N9x41nh9bVCbEmxMs+hbrw6Jf8mdOkGZzhe0EQB5IL+RoIb/9hmliVVtDWx5MZgim9tdrVSeA9Q8WftD7Hub1vQMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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



On 9/2/2026 4:53 PM, Tejas Upadhyay wrote:
> Add a debugfs file "vram_bad_pages" that shows offlined and queued
> VRAM pages across all tiles. Each entry displays the page frame number,
> GPU page size, and status flag (R=reserved, P=pending, F=failed).
> 
> example,
> cat /sys/kernel/debug/dri/0/vram_bad_pages
> 
> max_pages: 10000
> 0x0000000000000000 : 0x0000000000001000 : R
> 0x0000000000001234 : 0x0000000000001000 : P
> 0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr
> 
> v2(Sashikoi/Michal/Himal):
> -Remove block iteration, use offline and queue list only
> -Move platform check inside api
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c            |  3 ++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 59 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>  4 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..cb24e001b142 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -32,6 +32,7 @@
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_tile_debugfs.h"
> +#include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
>  
> @@ -773,6 +774,8 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	xe_ttm_vram_debugfs_init(xe, root);
> +
>  	for_each_tile(tile, xe, tile_id)
>  		xe_tile_debugfs_register(tile);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 00569c5279a8..d9da2454d968 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/cgroup_dmem.h>
> +#include <linux/debugfs.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_drv.h>
> @@ -917,3 +918,61 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_device *xe = m->private;
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		/* TODO Hook with RAS to show max_pages fetched from FW */
> +		seq_printf(m, "max_pages: %d\n",
> +			   to_xe_ttm_vram_mgr(man)->max_pages);
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr = tile->mem.vram;
> +
> +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> +		if (!man || !vr)
> +			continue;
> +		mgr = to_xe_ttm_vram_mgr(man);
> +
> +		rcu_read_lock();
> +
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			u64 pfn;
> +
> +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn;
> +
> +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
> +				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
> +		}
> +
> +		rcu_read_unlock();
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);
> +

missing kernel-doc

> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
> +{
> +	/*
> +	 * TODO: Replace platform check with xe->info
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return;
> +	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..f354c26c4257 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -9,6 +9,7 @@
>  #include "xe_ttm_vram_mgr_types.h"
>  
>  enum dma_data_direction;
> +struct dentry;
>  struct xe_device;
>  struct xe_tile;
>  struct xe_vram_region;
> @@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
>  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);

nit: I would put this declaration closer to other init() functions

>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e51..efcf3e1d4e80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>  };
>  
>  /**

