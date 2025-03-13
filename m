Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91906C28B2E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 14:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5667710E8BA;
	Thu, 13 Mar 2025 14:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYuf+r3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF910E8BC
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876053; x=1773412053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=daFNHIxz54gG6ei1EnJ3rrGSpZI4zxtU++OfFpYLDJk=;
 b=NYuf+r3CtpNgWlzngyWjAL9EOzvXX1SG0Tx3PFjy9YCskD3zTenpCk2c
 IxRC7xilGFeM1eB0iKdZmrA46PoHfjyDBgJ5g5oh4sZRJDRGeGThl7D/p
 NvP83AtuXdCmjhutAIQGxX8cImYq54BhGfaa0rMAzciizDJshrfeyTEAG
 3EgDVSq+TnbiTbv5D2erAyRBNtubEIi4rvBqXBImCk06EtX+RFXh5374g
 DCpi4nxJUPyWctm/akwKfzXrpKGSoZQ/gJ/0b+vcO3PpjeQAignHHKP4h
 tF9kCVCW000h2wezG/YTxUmrcBJlwPoitADRW9hZQQJKz+e5e2rrm/3ew g==;
X-CSE-ConnectionGUID: BceqWUpeQLGq3/5AzChVMw==
X-CSE-MsgGUID: pfRBA4AWSIWV3psSkio1RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42876622"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="42876622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:27:31 -0700
X-CSE-ConnectionGUID: p2MkdchMTjCF8hGv0O8tgw==
X-CSE-MsgGUID: OrhBG0riRY25pDNOPv0Ruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120926498"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 07:27:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 07:27:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 07:27:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 07:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQNwsmsDG/Ywai4C/BKl60XiuukkJ0IBue/ffhnReXZJJSLkDHOaNxCc3iGQ/O2e1h66AS663glLviAZw75yh9WkwBKRWs/gfcKQOLk3xmDaFhk12cxC5GJ0TCWofa6u25BvqXIQl7tAUVhQZbAJsf3UtGuKpc5lh3iTwZbZAhf+/02HkNZkjx9DpkiZQTmokAJzJ6NQtk+nLJACZGi+YjiSeH4R4NwSHbgzPOlm/9jHKGpqroDI/NXFYy/dSPRJmcw8/MiVxTvjfgqAfRkY0ka56XI2ZXL7+mnkqcD4Dy5Cs6HGcvo55osh1D+tm3MsolMfHlhhH9LGOYDp8kP9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slc8rLR7gtWoBM1WHWpKaAfBVNC+UQjEfGAAFtQDfkY=;
 b=i2OVyzOINSex+rfSfbMy4+IILn9+K0s9JVK5E5S414GH+KwL34SBNScMz8brFIYBmA0y0rtdzgjKCk+d7KN1ouWYY/m2Bo6VkM28eiHGFX0SWIOtcR+v1D7100mdvD2ZMrBjWDFUdMzCIvzawsbfg/3z5Incv1PP06j1S63YIk3Ta/Bn4H1chHCoZpdid4AB29Rn/kU8jTV4gMDbqAgKU0paFDm44l/eQZqp9G82+735mleWWeNm8LylR8BOqMpBIBB1tl8Fb0bKm10gkyTutaDG9YxHV0q5Fe34gyqfriWz8XZjcWwk2wcCHBnZElm8RiU/mg2Yvjhfbl8UrK++ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 14:27:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 14:27:12 +0000
Message-ID: <ec7a0352-2b93-4c1c-ae7c-82fe6e33817d@intel.com>
Date: Thu, 13 Mar 2025 19:57:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::36) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8a1a91-b8ea-49b8-209c-08dd623b24bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M055ekhRM0FzQnErS2VSYmxBSHBjbGN2dmVvdTU0SzdIdmdiZXVrcHJ2UXNS?=
 =?utf-8?B?VDRvdHV3Rkt1NkpHOGhzeGVLenFDWEVvWWFMQWhwYk5XU1N4M0VscnNOM0xI?=
 =?utf-8?B?VHd3RTJidzZQK3gwM0Rnbmt5NTZWejVNcVUyS1FDZDdNZjdjOUI3Zmd5K3Nw?=
 =?utf-8?B?T2NycEVVL3VFcVZJMXczWGtGQmpkZElnWGprdXpxY1NlN25pSitXS3Nrbkly?=
 =?utf-8?B?YkN6QTY5elBHY3k2VGxVUW8zT0M1cHhCa2FRQ0t0MUFYTHFQQmNlK0UyVTlT?=
 =?utf-8?B?ZkYwMUFVRmZ1a1NISVU3NXJvMW5tU25jY0tRc1ZNM3NPVWZZRWxBdkdVRURL?=
 =?utf-8?B?RGJKejFZMmovM3pYUkVhZ3gxdFl3QUtKZXdiLzNYaUlhdmFtQjJKMjlPVzJi?=
 =?utf-8?B?QytLWTlVYXlOZWthOUFGRnZOT0Z2Q09xbS9GV2EwNkU2R3A4cnczaUd5L2R6?=
 =?utf-8?B?QzBpcENWQm1sS1NCVWVQYnU2VUs0TkdZdVhVVkFPeGNtQ0tmOG9CdWtibFo2?=
 =?utf-8?B?VC90R1dRNHJDbzZqYUd0THlaSzZVMnlnUWJqUG0zZmIxNnl4dFhYYUpHU3RQ?=
 =?utf-8?B?NklrZFlielBFdVdVcmJXQVB6ejZSd3Q0V0p3cTBDaUtNVEtuQXBWMEhMRVlT?=
 =?utf-8?B?cHpJMUZTWUJlRHhDRmNtNTk0UnZGZ2xpSjR5eEdwa0g1a1JTN251cG9MQnFP?=
 =?utf-8?B?RzlmUlIvOUFtYk1sUis0OHNnSVZsbExHOXFLMFhNOFVYcjlqLzV2RGR3ZURG?=
 =?utf-8?B?cEYvbWpFYUZicjY0ZDBwVlBkbXI1MHg1Y0plczhjb1Y1SnhnK3B1b1pyQ1JL?=
 =?utf-8?B?cng1YlNrQ0Q2dE8rRnBCcnY0QWQyRUNCSEZnU3FoY1V0UEtjSlN2TmtVTkJG?=
 =?utf-8?B?Nk53eHNpUmVXRDROSWdSaU16czk3NGlDcm5HU0w2cjFIRVFPd3FsOFUrU1hN?=
 =?utf-8?B?M3Q1Q3Y1WHFNM1g2ZVI4RjNRWjJidTZwcXl3cE5LV2ZlZjY4M3JBRElDSCt5?=
 =?utf-8?B?NHpKNnkwVk1LWGgvNGtEd3ZsM2xHU3BSM09IUFg0ZFcyNzRGeTVKemR6RTNw?=
 =?utf-8?B?RHRtVHJxM1JIamxBSk0wTlh3YUFMejN6ckxRZDN1aTA2Z09wYkplY0U2SnRu?=
 =?utf-8?B?VjBJVEtMMDJhSHhtV09OV3Zmc0FPK2h2ZUFZMTZDdzRwOWZQNDVZQjlQNDEz?=
 =?utf-8?B?enNaNUlLcFhnR0JxeDJ2TStkQzB6TUhpR3oxd0VyMGllTWhRblBjbEV6ektE?=
 =?utf-8?B?eklMRXp4VlBOaXFEUGxFYS84NHVvM3Ivd2hYeHZSOTdoUG9qdEtaMGNZUWhQ?=
 =?utf-8?B?WVI2ai9BUUhoWmRrYmo5TW8yY3Nkc3pEa1dWS2Z5UU5rTkZBS1p2UU85U1lR?=
 =?utf-8?B?MmxlQjF6WkQxekZoSEJiT0pGTkYvT0ZaN3BVZndXTElTeXUvTGs3YlJKV3l3?=
 =?utf-8?B?K3I2WXlvTUxKUkZEdXE1ZUFDVmJJNTE0RTZVWmtxc1QwbStPSWlEUFUxd1Zh?=
 =?utf-8?B?L3prOXJGZFBFSnR4am1rQ01TRURBS1NkWG9ZbDkvUzg3VHhuTHI0S1ZjeXYw?=
 =?utf-8?B?TlA2WnN6M25OOXh4ZmVvekdLNGRyTkdBeld2R1EybzRXK05yR0E4ZlVkRWJo?=
 =?utf-8?B?b3ZLWHVDL3pTR3J2TXA5NzQ0WUd0eVE1aElscEFLUldjTmE0djBQckJEVDk4?=
 =?utf-8?B?RFp5c3lQbUdvaTI2ME9rZ1U0QjNad0hmOW85cFpZeUZiUUszcXNJeTAvMXpx?=
 =?utf-8?B?WXhKNzE2QzdNUGwrSEF2OTlWZGo2eUlrb1BqOHNwMjBQWGdSZzRIY25pWkxv?=
 =?utf-8?B?RVgxaWhNZEVINjlERC9FZTJLcTF6USt2ZkY5VUFnb20vZTlMUWRDSThiejdV?=
 =?utf-8?Q?IlGZj/ynILlCS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjgyd0RITWZzZlhiVGQ3RDQ2QWZTc0pRam1FK2Vma2NNQklFZlhwcC9WTUNP?=
 =?utf-8?B?YVZudndoVFdWVTBNTElraW54bUxtNVEvYm1vS0llWDdqaG1CL25NTFBueEVJ?=
 =?utf-8?B?Ump0UDVSQVo5R0tGY3NzV05TVFJWdVNaRlErVDdpUmJjUEVwNFJTRTJMb09q?=
 =?utf-8?B?MXMyTXo2eEowUlVPZ0lQWDQybkI0NTBodnp1Y1NWbDk1VFNwc1dnMFU2Ynp5?=
 =?utf-8?B?alVaNXNodzA0MEZIdVRNWXZJeVBVWjdZd2pEK29XanVrS3NBZHBRNm5kUHhj?=
 =?utf-8?B?WEMxa3pJb3FCTC9YUnlsc3R3Y2JpSkpqY2VVb0hKQWJMemFXU2I3dVRwVHdm?=
 =?utf-8?B?YmpieHpQaXNZcWdWb3F3eHNmRnJ6VkdsNGRBaEVQTExVL1h5ZXBRWDBVNG42?=
 =?utf-8?B?WWJvNERodWpjUzhUaGV1cWI3WHJGR1NrY1hCNUJ3cnRnT2tUKy9MN2RKOFll?=
 =?utf-8?B?b29lTmo4TE9QeGpQWFFzRDB6aUhQL0R4OGI2ODRtL0JGSGtwZmlqNXR2SGlQ?=
 =?utf-8?B?Z0NWeFc2Tlc3eE5CSmtFT2ZWL0N0Y0JKbXl3OEpaT1gzT1N2cGFCMTJibzM0?=
 =?utf-8?B?VWtiOWRsNGtkbXRVcnRENlB6RkMxRTIyMmFCK3hhR0kxSTlTSFhGMkg2d1FB?=
 =?utf-8?B?Tjd0RFlaSXN1dEsxbVJMWW8wQlI3Q0NnNXJCTHF0ZldrazJ4TURSSlZYV05Q?=
 =?utf-8?B?S05Ya0Z4UmdSUVl2NVh1VnVtMTJyV2s2c0VVRGNDMHRaVEFxQk00cEEyK0ox?=
 =?utf-8?B?UVFKaHoyQWhYYW5WQjdDb2tzK1EzcEV2YSs2MHhud2lRcm52ZnlidGFHQmQz?=
 =?utf-8?B?aGFxYkNwazJ3SnNmY1gySUM3SG81T1Bnd3hMYnNjTDNtSTFNTVhSZVRZcjNQ?=
 =?utf-8?B?aC94azVzNGJnN3NwUU5PRUxIZnUxSE16QjBTWGFHZU5VOHhjMFErc3VZUllX?=
 =?utf-8?B?eUp1MjN5MUpJKzFDZWZrQldSMjRPVUd4QXI0TzhQU1kwZSs4aWRSWkVDY29i?=
 =?utf-8?B?dS9SeWJhU3EwNCswYnVxWkdWK3J6WnVmdlZsdDFlbFB5N25qeUlyN25acWdK?=
 =?utf-8?B?aFl5MUZydnRMTUxGQnRnYmtMQTg0T2pld3VxS1FKZG9Ea2phNG52eEVBdjMx?=
 =?utf-8?B?OW9OY2tESTV5WVlWKzlGcHMxTFN2K1J1Zm9vOUE2bWZqaU5iWEJUN21JM3o0?=
 =?utf-8?B?TndEWGVSQmJTU211YTFsSTVjRTQ3V2l4bk9ueDMwaXpIMDh1OUNQaW5idkY5?=
 =?utf-8?B?SlZaaGRmOUZSaEJ0MXJXVGp4bnJ5R3dQVE85SDV2NkZ3cERUa1d3Y25CaUlB?=
 =?utf-8?B?VnlBY21KSzRnVDFoVDF0K2QrYXlWdXFYbTM2ckVPVEIzcm9YelFYWkp0RXM0?=
 =?utf-8?B?NkhzN2prMGdhUlFBaW9ETnNkVHVIWUpHMmRJc2NwN3JsclhDakhPMWdqTE0x?=
 =?utf-8?B?c2I1b1g3S21jaFl4cy94T2w5SzUwcW05VER6YTlLYjhPR21jU3dMVjNudmx2?=
 =?utf-8?B?aTV5YTJyZHZxRGZ0TC9sZUZNSVpEbE1zOUtIY20rZThkUVVJNTZTc1NpSFdX?=
 =?utf-8?B?QVRCQW9YR21sblNFM1JOK3FCcEx6VUlpSVF4NzdJd3dSVDkwSUlBYXA0M2hW?=
 =?utf-8?B?M1JCbVNSRlJjZWVsU0ZqOE82V1FONmwxdlgyTnlvaUZQdHJCdkcrcEVWV2hz?=
 =?utf-8?B?azVvc0YwUDNndXNvUVIzWCtVdFZna3RRY0dwdTZ5V0YyMGxISVNYSHFObEEv?=
 =?utf-8?B?Rmd2VlNvNk5oT1pjOEJKaWpmL1M1WklhWkVZdlgzVktnOEx6bzBzeUswTi9v?=
 =?utf-8?B?QjMzYS9FUWl0VHVJN2U4ejYzSURIcGswS3Z6QytQQ0dDZHFPS1NCTHhxMXhv?=
 =?utf-8?B?aFpaRVl3MW03K2ZaTmErNkFhaWhWQllqUFA1a1pMQkFlaGRUMVA1WmZKUFlX?=
 =?utf-8?B?cUkrRm0rTldVbUZIMkNFbGZ3V1R4MjZQMlg4TnJmYjNjaWpwN2swZFoxNkk3?=
 =?utf-8?B?TWxaYmdwTjRHdVZENlVhTFFOeWdvbU5zb0R1cUFGMVJCSVMycUV0aGFYa0Yr?=
 =?utf-8?B?Z2s1OXpNVWRES0pxa0ZkZWxjUy9pS0VHdEtzU3JHeUFyVU1jVlRZQ2lpd0dh?=
 =?utf-8?Q?lxQWzDfPfzSIKEZG641dKngto?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8a1a91-b8ea-49b8-209c-08dd623b24bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:27:11.9575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4zTlvEAv8I4epzOBPxAeQHKiyLYhJjl3I7ZZLHaW6IR+Ut2WElUBaYfKgTcQvQl0RRn5IhQWGPY4ltRsemYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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

Hi Vinay

On 3/12/2025 5:44 AM, Vinay Belgaumkar wrote:
> Define PMU events for GT frequency (actual and requested). This is
> a port from the i915 driver implementation, where an internal timer
> is used to aggregate GT frequencies over certain fixed interval.
> Following PMU events are being added-
> 
>    xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>    xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
> 
> Standard perf commands can be used to monitor GT frequency-
>    $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
> 
>       1.001175175                700 M    xe/gt-requested-frequency,gt=0/
>       2.005891881                703 M    xe/gt-requested-frequency,gt=0/
>       3.007318169                700 M    xe/gt-requested-frequency,gt=0/
> 
> Actual frequencies will be reported as 0 when GT is in C6.
> 
> v2: Use locks while storing/reading samples, keep track of multiple
> clients (Lucas) and other general cleanup.
> v3: Review comments (Lucas) and use event counts instead of mask for
> active events.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pmu.c       | 178 ++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pmu_types.h |  29 +++++
>   2 files changed, 197 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 4f62a6e515d6..d4c639369709 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -10,7 +10,9 @@
>   #include "xe_force_wake.h"
>   #include "xe_gt_idle.h"
>   #include "xe_guc_engine_activity.h"
> +#include "xe_guc_pc.h"
>   #include "xe_hw_engine.h"
> +#include "xe_macros.h"
>   #include "xe_pm.h"
>   #include "xe_pmu.h"
>   
> @@ -52,6 +54,7 @@
>   #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>   #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>   #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
> +#define XE_HRTIMER_INTERVAL_NS		5000000
>   
>   static unsigned int config_to_event_id(u64 config)
>   {
> @@ -76,10 +79,12 @@ static unsigned int config_to_gt_id(u64 config)
>   #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
>   #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
>   #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
>   
>   static struct xe_gt *event_to_gt(struct perf_event *event)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	u64 gt = config_to_gt_id(event->attr.config);
>   
>   	return xe_device_get_gt(xe, gt);
> @@ -179,7 +184,7 @@ static bool event_param_valid(struct perf_event *event)
>   
event_param_valid also needs to be modified

         switch (config_to_event_id(config)) {
         case XE_PMU_EVENT_GT_C6_RESIDENCY:
	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY
                 if (engine_class || engine_instance)
                         return false;
                 break;

>   static void xe_pmu_event_destroy(struct perf_event *event)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_gt *gt;
>   	unsigned int *fw_ref = event->pmu_private;
>   
> @@ -197,7 +202,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>   
>   static int xe_pmu_event_init(struct perf_event *event)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_pmu *pmu = &xe->pmu;
>   	unsigned int id, gt;
>   
> @@ -219,6 +224,9 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	if (!event_supported(pmu, gt, id))
>   		return -ENOENT;
>   
> +	if (XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES))
> +		return -EINVAL;
> +
>   	if (has_branch_stack(event))
>   		return -EOPNOTSUPP;
>   
> @@ -239,6 +247,30 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	return 0;
>   }
>   
> +static u64
> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
> +{
> +	unsigned long flags;
> +	u64 val;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +	val = pmu->event_sample[gt_id][id];
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
> +static void
> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
> +		    uint32_t val, uint32_t period)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +	pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
Shouldn't event sample be reset on disable?

Thanks
Riana
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
>   static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>   {
>   	struct xe_hw_engine *hwe;
> @@ -256,16 +288,23 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>   static u64 __xe_pmu_event_read(struct perf_event *event)
>   {
>   	struct xe_gt *gt = event_to_gt(event);
> +	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
> +	unsigned long id;
>   
>   	if (!gt)
>   		return 0;
>   
> -	switch (config_to_event_id(event->attr.config)) {
> +	id = config_to_event_id(event->attr.config);
> +
> +	switch (id) {
>   	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>   		return xe_gt_idle_residency_msec(&gt->gtidle);
>   	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>   	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>   		return read_engine_events(gt, event);
> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
> +		return div_u64(xe_get_pmu_sample(pmu, gt->info.id, id), NSEC_PER_SEC);
>   	}
>   
>   	return 0;
> @@ -286,7 +325,7 @@ static void xe_pmu_event_update(struct perf_event *event)
>   
>   static void xe_pmu_event_read(struct perf_event *event)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_pmu *pmu = &xe->pmu;
>   
>   	if (!pmu->registered) {
> @@ -297,8 +336,89 @@ static void xe_pmu_event_read(struct perf_event *event)
>   	xe_pmu_event_update(event);
>   }
>   
> +static void xe_pmu_start_timer(struct xe_pmu *pmu)
> +{
> +	/* Timer is per device */
> +	if (!pmu->timer_enabled) {
> +		pmu->timer_enabled = true;
> +		pmu->timer_last = ktime_get();
> +		hrtimer_start_range_ns(&pmu->timer,
> +				       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
> +				       HRTIMER_MODE_REL_PINNED);
> +	}
> +}
> +
> +static void
> +xe_sample_gt_frequency(struct xe_pmu *pmu, uint32_t period_ns)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	uint32_t act_freq, cur_freq;
> +	int ret;
> +	int i;
> +
> +	/* Sample each event type once */
> +	for_each_gt(gt, xe, i) {
> +		if (pmu->active_count[i][XE_PMU_EVENT_GT_ACTUAL_FREQUENCY]) {
> +			/* Actual freq will be 0 when GT is in C6 */
> +			act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
> +			xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
> +					    act_freq, period_ns);
> +		}
> +
> +		if (pmu->active_count[i][XE_PMU_EVENT_GT_REQUESTED_FREQUENCY]) {
> +			ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
> +			if (!ret)
> +				xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
> +						    cur_freq, period_ns);
> +		}
> +	}
> +}
> +
> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
> +{
> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	u64 time_diff_ns;
> +	ktime_t now;
> +
> +	if (!READ_ONCE(pmu->timer_enabled))
> +		return HRTIMER_NORESTART;
> +
> +	now = ktime_get();
> +	time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
> +	pmu->timer_last = now;
> +
> +	xe_sample_gt_frequency(pmu, time_diff_ns);
> +
> +	hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static bool is_gt_frequency_event(uint32_t id)
> +{
> +	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
> +	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
> +}
> +
>   static void xe_pmu_enable(struct perf_event *event)
>   {
> +	struct xe_gt *gt = event_to_gt(event);
> +	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
> +	uint32_t id = config_to_event_id(event->attr.config);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (is_gt_frequency_event(id)) {
> +		pmu->active_count[gt->info.id][id]++;
> +		/* Start a timer, if needed, to collect samples */
> +		if (pmu->n_active++ == 0)
> +			xe_pmu_start_timer(pmu);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>   	/*
>   	 * Store the current counter value so we can report the correct delta
>   	 * for all listeners. Even when the event was already enabled and has
> @@ -309,7 +429,7 @@ static void xe_pmu_enable(struct perf_event *event)
>   
>   static void xe_pmu_event_start(struct perf_event *event, int flags)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_pmu *pmu = &xe->pmu;
>   
>   	if (!pmu->registered)
> @@ -319,21 +439,43 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
>   	event->hw.state = 0;
>   }
>   
> +static void xe_pmu_disable(struct perf_event *event)
> +{
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
> +	struct xe_gt *gt = event_to_gt(event);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	uint32_t id = config_to_event_id(event->attr.config);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (is_gt_frequency_event(id)) {
> +		pmu->active_count[gt->info.id][id]--;
> +		if (--pmu->n_active == 0)
> +			pmu->timer_enabled = false;
> +	}
> +
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
>   static void xe_pmu_event_stop(struct perf_event *event, int flags)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_pmu *pmu = &xe->pmu;
>   
> -	if (pmu->registered)
> +	if (pmu->registered) {
>   		if (flags & PERF_EF_UPDATE)
>   			xe_pmu_event_update(event);
>   
> +		xe_pmu_disable(event);
> +	}
> +
>   	event->hw.state = PERF_HES_STOPPED;
>   }
>   
>   static int xe_pmu_event_add(struct perf_event *event, int flags)
>   {
> -	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>   	struct xe_pmu *pmu = &xe->pmu;
>   
>   	if (!pmu->registered)
> @@ -419,6 +561,10 @@ static ssize_t event_attr_show(struct device *dev,
>   XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>   XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>   XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
> +		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
> +		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>   
>   static struct attribute *pmu_empty_event_attrs[] = {
>   	/* Empty - all events are added as groups with .attr_update() */
> @@ -434,6 +580,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
>   	&pmu_group_gt_c6_residency,
>   	&pmu_group_engine_active_ticks,
>   	&pmu_group_engine_total_ticks,
> +	&pmu_group_gt_actual_frequency,
> +	&pmu_group_gt_requested_frequency,
>   	NULL,
>   };
>   
> @@ -442,8 +590,11 @@ static void set_supported_events(struct xe_pmu *pmu)
>   	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>   	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>   
> -	if (!xe->info.skip_guc_pc)
> +	if (!xe->info.skip_guc_pc) {
>   		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
> +	}
>   
>   	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>   		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> @@ -463,6 +614,8 @@ static void xe_pmu_unregister(void *arg)
>   	if (!pmu->registered)
>   		return;
>   
> +	hrtimer_cancel(&pmu->timer);
> +
>   	pmu->registered = false;
>   
>   	perf_pmu_unregister(&pmu->base);
> @@ -491,6 +644,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>   	if (IS_SRIOV_VF(xe))
>   		return 0;
>   
> +	raw_spin_lock_init(&pmu->lock);
> +
> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	pmu->timer.function = xe_sample;
> +
>   	name = kasprintf(GFP_KERNEL, "xe_%s",
>   			 dev_name(xe->drm.dev));
>   	if (!name)
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index f5ba4d56622c..59ed9d8b4ed8 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -10,6 +10,7 @@
>   #include <linux/spinlock_types.h>
>   
>   #define XE_PMU_MAX_GT 2
> +#define XE_PMU_MAX_EVENT_TYPES 64
>   
>   /**
>    * struct xe_pmu - PMU related data per Xe device
> @@ -34,6 +35,34 @@ struct xe_pmu {
>   	 * @supported_events: Bitmap of supported events, indexed by event id
>   	 */
>   	u64 supported_events;
> +	/**
> +	 * @lock: Lock protecting enable counts and sampling.
> +	 */
> +	raw_spinlock_t lock;
> +	/**
> +	 * @n_active: Total number of active events that need timer.
> +	 */
> +	unsigned int n_active;
> +	/**
> +	 * @active_count: Counts per GT/type of event that need timer.
> +	 */
> +	unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
> +	/**
> +	 * @timer: Timer for sampling GT frequency.
> +	 */
> +	struct hrtimer timer;
> +	/**
> +	 * @timer_last: Timestmap of the previous timer invocation.
> +	 */
> +	ktime_t timer_last;
> +	/**
> +	 * @timer_enabled: Should the internal sampling timer be running.
> +	 */
> +	bool timer_enabled;
> +	/**
> +	 * @event_sample: Store freq related counters.
> +	 */
> +	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>   };
>   
>   #endif

