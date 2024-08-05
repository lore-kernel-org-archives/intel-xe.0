Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B1C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 18:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8982C10E27E;
	Mon,  5 Aug 2024 18:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0BVyXQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E4F10E27E
 for <Intel-Xe@lists.freedesktop.org>; Mon,  5 Aug 2024 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722883275; x=1754419275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JjZhjPLXSDshPCLU65KPakM0kFUImOi6PIFyNDK7IlM=;
 b=Q0BVyXQEB+JGM2nrb8S0wjYIWlK9rN5B4o9pQjHSopEM9ksULEAztgR6
 Rqp/D8hd9X2uXnr7c/jpdRsWekLhNA3sQ74dyw1/fqnsE5HQ5Llrm70LD
 RUvVULsd/9Dw+cFacEdGWWtTklO9GfHgjeQwWvpQ3FO2D/vF1XfGgTiT1
 FKp1zCXrcqDtIMdI9m2jpoD96QBe4CNSIaqhTMGrhhF2lh1ZW/G3GtwDt
 QzBLg2mdXk4U5OsZXLPr9ASZ3CSW0+8mUIKigOtLFPB6M1nDkpJeWyLAJ
 Scg0hFbtLT6YhNUvdUUwUhVLNCXcjObrXn76AUB+hv+SIjgMbWcoTBlZl A==;
X-CSE-ConnectionGUID: 6sBRaXdSRFq9qlWZfH73Jg==
X-CSE-MsgGUID: h45E0s05QIy3jwJXDL1B+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24732704"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="24732704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:41:15 -0700
X-CSE-ConnectionGUID: wOHObaIES4mj/iuxFR3FTA==
X-CSE-MsgGUID: vJOm6OgqRmuEJIMDvENjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="55934191"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 11:41:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 11:41:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 11:41:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 11:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUVYrJxcJnWVl92/pDBL9Vvxn2ZDEeN87s+vBK+6DQYjxVnkflMQ9LN3Ij/dLKGmPayEKSVbztBmypfulNESGYQ1e95S+wcsFg331D+sgssN39UpzR4B7afWdIJhgFRCevg03qJ/3LqVbOAyxraQMpMSUQRJh+LCHvt2cTrkRCJOL2uwJW/abRpFaXJHWH6JwAZWT6fNcnYqmNTfaUjwSZRIMgByKkfCFd6WyEr+ncfvdOCRrkVUBFrgdF5AUDCmb6ebRcAD0F2ye792rlmcIjnFOdeD4waFHQ5DKWHqKu7SFyG7auLbdbZ7c9hpneRjimA6V8rxMyBZSW9Y6YRXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIqoeegG51BoS/KDfib3W5a8NFXh6fC+xRtmtWQt07Y=;
 b=MwJjWUUt19AI5rMORrPScJ2dyz4qTLhWT4XgQfNTOAWOKYTw/9boQ5TzuP4zaZ1FHh3pH9Hg2qVMrsBTB4rJh4AW4C1mkQqQ+pkIir1PL99vlrpnXJ+LEFaN5OlQHxSks8tFPzXnxow3s6yJqCv7JtqvzbPGy1kk0iZ6bLayKlEKpTePntOlfQMOTefPWnVBz+7nHFQBJmsa4ZWq6oAWZJwjDAHPN7GQFbkM0wkDO12sjRN7f/MRaXR/+XBlpsz3RxIV8bP2STcTfkQXPcAR5D5LKVufCEvQS6KdgWllmPFM3dAq6o5RLFNbU1rCSBhKkw3JruuhXBnA10bbGcTkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 18:41:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 18:41:08 +0000
Message-ID: <4d692553-36bb-4eed-b884-e7c176e6def3@intel.com>
Date: Mon, 5 Aug 2024 11:41:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/xe/guc: Add GuC log to devcoredump captures
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-9-John.C.Harrison@Intel.com>
 <ZrACbsc9phJWZI72@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZrACbsc9phJWZI72@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f205f2-90f7-45b1-a2b8-08dcb57e2be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0xVV2x6bEhHYTdRUEhMazlzVHFJOEhSRXJRWHc1aStpcy96S2U1N0t0ZDJ2?=
 =?utf-8?B?VndIRmV1WnBUMk5lR2IvdmZta1YzTU5PaitiUmFha3d3djVaZTRLbEtIa0gx?=
 =?utf-8?B?RWd0cVkwMUhEL2RtUXQybVVadGxWK1FhQ0Q2aDhtZmlrNkdSdzY2d0ptNVRt?=
 =?utf-8?B?bFppRnloMW5CdHdVMTdDNU5LNm1lVXVHVzM5T1ZrUmZ1Tlg3Z01Td3hNL25q?=
 =?utf-8?B?QU9XbmFlS3JsZDlxSCtxMlVRZTN1YTF1RlFqZWxFTEhhSmZwNGpweERJL25m?=
 =?utf-8?B?VEY5L1RDMmp5andpOGRtZGNOcDNiK1FRMXlFeUpGQmZWRkFWNy9ZMnFid3pJ?=
 =?utf-8?B?SkhQSW9aaUFnZ25uSmhMRnB4Y2hBSDJaQWhiUEdBZU5jdW5vOWVyaWlpcHUv?=
 =?utf-8?B?cWU2ZXFhMHVmWWRpQzlua0ltZVpNZXhhSVloUkMwVW5UdUxmNWNCOFg0WUR5?=
 =?utf-8?B?NjFJRmllR0E4UElLdmxqZUVMK0V3a1JsWDgzSEh4N2J1Ujh2NE9xZHp6QWtL?=
 =?utf-8?B?MWQ0N0tBeHp5RjNUNStIbTlBNEtJaTBpSkdnVHEvOWx2Z2VNdlFOUGN0VHhs?=
 =?utf-8?B?SU9zNlM5VUdvbDgxZldKYmtqUEYrNEZ1bFZ1NmcvL2ZtRTRrUDJUcndRczZi?=
 =?utf-8?B?OU8rUy9hRTJRR05XTE5SZjRPSFdVYmRqaVlQdG9aV2lwRWk5cWltL1RHeEVX?=
 =?utf-8?B?QjgvdjRuWXJqQnlLWmVqWlV4dXFwcWJEMGZCMVZuWi93OW5JWlZqVGZ4cUt0?=
 =?utf-8?B?RWFsZEdyL292WVJublhxNVNLaUoyM3oyRmRhSXZ6SStYRkpyRU82L0FnbE52?=
 =?utf-8?B?RllwbmlTUGdQZEIzRzZFWDIzTG5DY0IwbUNkS214c3JKY2RPOVd1ME9DRGVj?=
 =?utf-8?B?RHNYV0ttTFYvUEphQ29LZnlyZjlZUmQ0RFJuOXZnVlJvdHVwZHR5M2RHMHh3?=
 =?utf-8?B?RWpJYXZ4SjdsMmhyd3ZPbnZla3AwUDZGNlZRV1NVdVI0N00zd0pMVy9ySU51?=
 =?utf-8?B?MGw1WUNRdXgvYkJJcHpRTm1XOFdGOXVCQzlSTkhnMVNIS0N3RG9lQWhUdk5n?=
 =?utf-8?B?Z0o5UzZrdmpNbmViZVBuaXY5QXI2S1krbHR4Mmc5V2VzdWVIN0FzZEFNRzZw?=
 =?utf-8?B?QjRGa2ZYenprUmVZbEY0U29UUnV0cU9JZWUydUVzb2RncUNScWJXcXR4R1FD?=
 =?utf-8?B?a1JWc1IwU0pTN3VHQ0FGQ2ZGbjBRRXNxNmR2bjJmeFM2YXIyV0c3MmV5LzR2?=
 =?utf-8?B?TzhXWXNyT2VuODNCZTdzZGRyS2o2elhZZE42MTFzOFk5b09XUlJlMHU0em5y?=
 =?utf-8?B?QkJpcVJGNVUxSjBFeHp3NDVJWUp5aXRJbHp5YkpUclRNWjFnc2pmdUNzYzRO?=
 =?utf-8?B?L3lEaWt2bUM5blF0dC9ZSzV0Q1dmc3dSL0U0dVhpRkZGQTlvZ1ZvYnIwSXhK?=
 =?utf-8?B?MUxxSENnT2poTWhMTXllN2txaVJaSExGQ3UyYXAxYXRhMjlqUGpYb2kxYmkv?=
 =?utf-8?B?dVJTb0xWNlJlZFFPUld4cTZ1cEp3NWVmMDlCTUVyMTVwZTdCRU5MQUdEV3Jl?=
 =?utf-8?B?RUxvZmZWL0ROeUE0RXNCdlk4OE9xTjZWS0x0TGpSWTBDeGUyWHY5S1p1TU5i?=
 =?utf-8?B?K20vUzVHQ28yVklRcmdvLzJpV2RKcm0xTDdCTHIwUWg2RDV1TlBBcDZpaDIv?=
 =?utf-8?B?NFhUc3Z1OXJadUV4SGMvNldrZldnc2JVYktlSmFvbW9mUlV5bjlpemNtTnE2?=
 =?utf-8?Q?WR/czLhT7e9BGVybfA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JhNXBLUjc3VU5mb05MZUJOR2tXVS9VNWt2NTZjc1pkRTVzZTZhcnNabVVH?=
 =?utf-8?B?Yy9EZis1Ym04UU9kdmUyT1pPYkVybFNIQ081ZVdHL3htemY3SnIwOXFBYWRu?=
 =?utf-8?B?YUV3U0h4VjNyaDdBRENMdXhpVWwxWXA1VTB3Z3g5U3hMTTRnMVVoUHNRclBz?=
 =?utf-8?B?Y0RVOXJYcnRPWXViSEEvOXZ4OHVjaUFXWFZxT0lXV0lwUEVIMGlNd2MxbDZJ?=
 =?utf-8?B?dkRsMzZOVy9IWWFPT0JzZHh0YkRVUzBMdXlTUmtUeE5XTzlONzRhaXFJWElZ?=
 =?utf-8?B?c0hCeXVJRTNZbCs2RmFNSC9rdzRsQVZ2SU5zQTJKb2d1TUtlc3Blb3JYOTVT?=
 =?utf-8?B?RkZESzJ2RzRXR2Z3WFVSTTFLdHFoMDZrQTNDajV0R3VxdzZrUWVueE9kTktT?=
 =?utf-8?B?N1B4VXpqeVJ3VWN0Z2dKM0Z6UFRaTDF2cnU3Y3g3Ylh5TmtKdzlLRFBPbTZW?=
 =?utf-8?B?TVl0cUpnbUdJTG1pM0pHWUdGc2cya0RPZ3JGWkk0bkJKSEZnS2R6ZkdudGRG?=
 =?utf-8?B?eHBmcGJpaTZxWFdkc091SnhXNXZJWTM5OFlVMjZ2KzFhTjUyaU1KZjFlN1pJ?=
 =?utf-8?B?cERMZytrTlRkSDI4K1VJNUEyd01OMVoySjlmd0g1YTJkODlaalRyaHdFWjdv?=
 =?utf-8?B?UmNJcy9JQjNvOGtNeDMvd0xkTzduN2NDKytEYlNXM01HT1IrZFBWeElyallS?=
 =?utf-8?B?b1JYa3dGdUVwR0UrUzlLWnJuWC96R1VhUXRlOHlIenBqNUxtYzd2U00yVlph?=
 =?utf-8?B?UlFFUENvNjNpdTYvdFFlcmltelJVRWdMWFdXemZUc3NFVitoc2xsamtEbFRL?=
 =?utf-8?B?MkMzQk9MNTdNeGRFTkd3Q0ZzaWgwY01oWmJQbk9oL2JNWVVwY0NMbmZqT05s?=
 =?utf-8?B?OSsvZVdtUkhlUzQ3TjZsdU55VFdYUjhmYXZFSnoxMjVQTHN1ZW1nem9EanBO?=
 =?utf-8?B?NUtuNFdpTkQ5YjFDNG5PdXpnb3EwZ0U0bDBuYVkxNkh5VUQycWJ5NW1XQlNs?=
 =?utf-8?B?NTNiVDBDcXA3YXhLTDAyc0VkV2lSQ2hsRlF1amlJVHJBeTkyaDhITysxSStr?=
 =?utf-8?B?MStDZ3dPUmpsN3RheXpVaVByVnVFRzVhOHhlMjdGSVFqQkVoVGIrQWVUWEti?=
 =?utf-8?B?QjJIWU50UDVUSEN2ZVMrOVdpMzY5QnZhRW9NVm01ZjV0RDVKTWZCZlN4YW9Q?=
 =?utf-8?B?VnRhcUpoYVhMMCt2NjA2ajIwRWQwODRrYjhiNWtaeDdMVElWRkVVTWczRjBC?=
 =?utf-8?B?ZTNDYURtOWJrYzBqMWVGOXMxbUswa2p2L0pwVVFTMk1wa2VWRktaMmI3dzAw?=
 =?utf-8?B?ZVpNcG9nZVJLMHcrWHdNVXNvMHFBcm5YV243NEVRMWt2T3hXK0ZDYzNGZ2lq?=
 =?utf-8?B?b0NORkRMdkUxTmNzVVZyR0lXRGYvdU1FQXFVQ0hGbDlza3JVellFd2YzK3Js?=
 =?utf-8?B?c1JYMTVac0xyYnp0WGdHYzFYdi9PaDIyMHdubUV5VGhkYTd5ZVUrYWVITjdq?=
 =?utf-8?B?RUhGTTR3UEhYSDV0dEZ3a0tac0MveVpWWUE2cFN3MTU5S2FFUE9wVVl1RExR?=
 =?utf-8?B?ZnZzWUJIZ0t4MllnL1RXZ3U1ZGVFbDlqNStlSEtrTk1ENE5aWWlpM0hsbzhH?=
 =?utf-8?B?ZlVKMFd3MDVVSXB0RjYzeGE0ei9nQSs2eHZxR2JjRDJhQm1PaGlmRVlkS001?=
 =?utf-8?B?M3NTWXlscGszdGh0VEFMMk1HZ0txZFZLNUNqUEFCL0RwSXRBUVNobU5HRFFP?=
 =?utf-8?B?akdZUVNFZmhMYUtaUjRYcFZYV081Sm5UdjFDbHdQSjBqRFJVNUtuaTE4aUJr?=
 =?utf-8?B?QWtqUUpOZVFuK2VkSCtEcmtTeklnNlh5ajE0cTlLTm9kQVR2SGl2ZmdVaUJM?=
 =?utf-8?B?LzNxekhscml2SzBkUGxKd1NXaFNmYXJEcktnRUYvMFN6elRpa1cxaHZZb3FZ?=
 =?utf-8?B?NlRLTDN5YjJqNFFubHBaZEhvTTNHbC9ZY2ZQTmQ4SkV2cFFyS3YrQ0V3MlJQ?=
 =?utf-8?B?RXMvOUNUUzVnd3M0OEpQT0FXOEJPU2ZmcUFVaEFUUHY0ZHdIS0U5cFBVOGU2?=
 =?utf-8?B?WjlBQlNsVU5BWW5LUHR4UjlFa3BSS0hReEZubVF5ejZERTBXMWg0VUlvakhs?=
 =?utf-8?B?SEtyWUdmTmUvcjFycUQ5SnRkYmZEVThhVGRMbGtEMjBpZkxSM2U0dVdwcktH?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f205f2-90f7-45b1-a2b8-08dcb57e2be6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 18:41:08.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQMikmb44h9alF8kuHzMpvF1erGncGaNdXueZpjpqk3rVi6+ZUbMB7N5lDFiTp+x7svFnlPvnMiLqty/sMEFIyS/ws+Yv/fgjxAYIdHN+S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On 8/4/2024 15:36, Matthew Brost wrote:
> On Mon, Jul 29, 2024 at 04:17:52PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Add an ption to include the GuC log in devcoredump captures. Note that
>> this is currently optional and disabled by default. The reason being
>> that useful GuC logs are large, very large when converted to an ASCII
>> hex dump! And as they are not always necessary/useful for debugging a
>> hang, it is not desirable to force all core dump captures to be huge.
>>
>> NB: The intent is to add support for buffer compression to the core
>> dumps. Then the log can be included as standard without being too
>> onerous. At that point the module parameter override can be removed.
>>
> Briefly looked at this series and questions / few suggestions.
>
> 1. Remove mod param to include GuC log from devcoredump and always
> include it. We had a bug in devcoredump which has been fixed in [1]
> where large devcoredumps took forever. This has been fixed, now
> capturing a devcoredump around 256M takes .3 seconds so adding another
> 8M or so seems fine.
Yeah, that was the main reason for not wanting to always include it just 
yet!

>
> 2. Instead of printing GuC log as hex, can we just dumped it as binary?
> This is what we do VM mappings with dump flag set and LRC. grep
> 'ascii85_encode' for an example of this. It would be nice to keep binary
> dumping uniform. Then surely we can update our scripts / tools to parse
> this output.
Note, that's not binary. That's ASCII85 encoding. There are some drivers 
which genuinely include binary blobs e.g. ath10k 
(https://starkeblog.com/firmware/wifi/linux/kernel/2021/08/11/dev-coredump-and-firmware-images.html). 
But yes, it is way more compact than a full hexdump.

Do you know what userland tool is currently used to decode the ASCII85 
objects? The intel_error_decode tool in IGT does not appear to have been 
updated to support devcoredump files.


>
> 3. Can we move GuC log in devcoredump to
> xe_devcoredump_deferred_snap_work and just use kvmalloc? I suppose this
> makes debugfs capture a little tricker?
No idea. I haven't had chance to look at your changes in detail yet. So 
not sure what is involved. For certain, I would much rather capture the 
GuC log, CTBs, etc at the point of the error rather than in a worker 
thread some random amount of time later. The longer the delay between 
error and capture, the more chance there is for things to move on, wrap, 
overwrite, etc. And if you are using kvmalloc, that must be in some kind 
of asynchronous worker thread?

John.

>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/136770/
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 22 +++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 ++++++++----
>>   drivers/gpu/drm/xe/xe_module.c            |  3 +++
>>   drivers/gpu/drm/xe/xe_module.h            |  1 +
>>   4 files changed, 27 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 08a0bb3ee7c0..b7c241bd95d5 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -17,8 +17,10 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_log.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_module.h"
>>   #include "xe_sched_job.h"
>>   #include "xe_vm.h"
>>   
>> @@ -74,7 +76,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>>   	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>>   		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>>   	xe_vm_snapshot_capture_delayed(ss->vm);
>> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->guc.ge);
>>   	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>>   }
>>   
>> @@ -116,9 +118,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   	drm_printf(&p, "Process: %s\n", ss->process_name);
>>   	xe_device_snapshot_print(xe, &p);
>>   
>> +	if (xe_modparam.enable_guc_log_in_coredump) {
>> +		drm_printf(&p, "\n**** GuC Log ****\n");
>> +		xe_guc_log_snapshot_print(xe, coredump->snapshot.guc.log, &p, false);
>> +	}
>>   	drm_printf(&p, "\n**** GuC CT ****\n");
>> -	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
>> -	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
>> +	xe_guc_ct_snapshot_print(xe, coredump->snapshot.guc.ct, &p, false);
>> +	xe_guc_exec_queue_snapshot_print(coredump->snapshot.guc.ge, &p);
>>   
>>   	drm_printf(&p, "\n**** Job ****\n");
>>   	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
>> @@ -145,8 +151,9 @@ static void xe_devcoredump_free(void *data)
>>   
>>   	cancel_work_sync(&coredump->snapshot.work);
>>   
>> -	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>> -	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
>> +	xe_guc_log_snapshot_free(coredump->snapshot.guc.log);
>> +	xe_guc_ct_snapshot_free(coredump->snapshot.guc.ct);
>> +	xe_guc_exec_queue_snapshot_free(coredump->snapshot.guc.ge);
>>   	xe_sched_job_snapshot_free(coredump->snapshot.job);
>>   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>>   		if (coredump->snapshot.hwe[i])
>> @@ -199,8 +206,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>   	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
>>   		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>>   
>> -	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>> -	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
>> +	coredump->snapshot.guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>> +	coredump->snapshot.guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>> +	coredump->snapshot.guc.ge = xe_guc_exec_queue_snapshot_capture(q);
>>   	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
>>   	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index 923cdf72a816..6ac8da1631f9 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -35,10 +35,14 @@ struct xe_devcoredump_snapshot {
>>   	struct work_struct work;
>>   
>>   	/* GuC snapshots */
>> -	/** @ct: GuC CT snapshot */
>> -	struct xe_guc_ct_snapshot *ct;
>> -	/** @ge: Guc Engine snapshot */
>> -	struct xe_guc_submit_exec_queue_snapshot *ge;
>> +	struct {
>> +		/** @ct: GuC CT snapshot */
>> +		struct xe_guc_ct_snapshot *ct;
>> +		/** @log: GuC log snapshot */
>> +		struct xe_guc_log_snapshot *log;
>> +		/** @ge: Guc Engine snapshot */
>> +		struct xe_guc_submit_exec_queue_snapshot *ge;
>> +	} guc;
>>   
>>   	/** @hwe: HW Engine snapshot array */
>>   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 7bb99e451fcc..dd837125f397 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -37,6 +37,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>   
>> +module_param_named_unsafe(enable_guc_log_in_coredump, xe_modparam.enable_guc_log_in_coredump, bool, 0600);
>> +MODULE_PARM_DESC(enable_guc_log_in_coredump, "Include a capture of the GuC log in devcoredumps");
>> +
>>   module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>>   MODULE_PARM_DESC(guc_firmware_path,
>>   		 "GuC firmware path to use instead of the default one");
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 61a0d28a28c8..81be7fb05bd1 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -12,6 +12,7 @@
>>   struct xe_modparam {
>>   	bool force_execlist;
>>   	bool enable_display;
>> +	bool enable_guc_log_in_coredump;
>>   	u32 force_vram_bar_size;
>>   	int guc_log_level;
>>   	char *guc_firmware_path;
>> -- 
>> 2.43.2
>>

