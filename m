Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0144FC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 06:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCBA10EA23;
	Fri, 21 Feb 2025 06:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbFGfp2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA46D10EA23
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740119223; x=1771655223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iIFi3N8UF4sUCsI/VTrmW5gx9QrOKy6Jkeml2pIJ954=;
 b=lbFGfp2WQze0H5MMavkMCwOXJ/zxdmRtlwGo85I9el9VQ/ND205I6M/R
 kGEBVAJWYLtygRqukbyt5tTKcLzzEmM8KJwbwRqcBeOSpfS5puGSYyu4f
 vvOk+WA08aQWSt+EjZGJAFTMJpPOGCJE84WuMMMACqzoe5sPNG/F+pHcQ
 kzWgvNViaLInVOn6CVMa2QD7GZI8NOZu82R0MOHQncKE6jM5/CWmjr/UG
 zG2LhmWTwhzBcaYiB4GAFneZYp8r4vmZw7mfdqeKteBg9OieGA5kTG5FZ
 1fwuYI1BpJWXeuiXWaLUPwyRjHQf4iEhrxrBCNY1OE/4PmaqtEjBO6Jma w==;
X-CSE-ConnectionGUID: X8GwLeaLQGqvCccX1jTKuw==
X-CSE-MsgGUID: fgO/iKkiR/SXfl27ySaKzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40794486"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="40794486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:27:03 -0800
X-CSE-ConnectionGUID: 7vrmj34SSXyqNHIMKyLQMQ==
X-CSE-MsgGUID: PKv4+gjNQACmy2wAJuWF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115275692"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:27:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 22:27:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 22:27:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 22:27:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFeSvY4AVMwQGmTIvNuxAT97uHILb84cQfr0+Bksf5tXdxckspLH/pg6SOs7aV7v3EO4wXBJ2gx1VXJ0qCPnRK6VvQPGD9J5686o74jIcMTjLafWcq593pQH9H6qCkV+SBgGYLilQJvXFXBP2X5FBTGG0LlE5chMP/sAcFZrLZuOhGkfNlvEYjX5C+KKniqGVGdJYzjyoFkav5US2RDozrmkwqscMNNzR76rcDSbClukh4ggCA4EMUc3AksqMFMWMc1odZMDYihoZsUmHcdAizSx/yqLSFISd8iMSQ/f/k694YUH+lEgZwmr2bV6u7LSmgs4InYffqwMcz/8h3MYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py7JLyzqoU2lWS5YlL91KnGGpxJocZzfxuF4cM8FxeY=;
 b=rt7PmIn0SA1vlhJtwsyRqyOLHRL25Mr/uIczYp/mdewMPDpbmGG5vQuNQ48yKP9CV5aVknBE4f458pOXCb0hhFzbjBtUkyoVZ2hqAR/odVEpTcT6XUQbDoZcPkO1uJw8qRGgCoK+Oh8ofOufsRKwjwsQ4LdbMPUgyYPkH6Mv11fw+OFILrcFajtCeIh3TMoSkdhOXJkbNTuVWhPohN/RPWKObCKFmW8wgK+1j78lwhXrbwYrxoY2Tmx9vk60+NP4on7S+ArWayl+fWe7kzxIgySAZ3PFGsjdXwxcoxAxZcGut39nyIyVvtb9YCbm0ANBvuBNYcMVoDNlAN/tR++kRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 06:26:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 06:26:46 +0000
Message-ID: <f9276c79-222b-461e-9374-4128fd70c1cd@intel.com>
Date: Fri, 21 Feb 2025 11:56:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Lucas De Marchi <lucas.demarchi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
 <Z7fTX2X1qrdcv0fb@orsosgc001>
 <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::26) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: c2673b38-6c8d-4ce1-adfa-08dd5240b76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdDYjNPUy8yK1V2VUJhakZvVCtHcWJLV2xoMDFxdVpVUmVnVlZZajRZVnFI?=
 =?utf-8?B?UG9QWkNLaU1TQlUwUk8zTS9NQmM3QWUrM1g1T00ycXd4aHpNaUxuTjUyZmNZ?=
 =?utf-8?B?aUpZcll0L0ROUHlDM0RKWWtxTnAxRzhuRlI5WlpMNTF0czlzd3YvRGt1cnRj?=
 =?utf-8?B?akszQ1M4ZU45cWdHTldxbUhzVjZ2Qmp2elFwbEtvREhSb1NuVWhuQ3ZTRVB5?=
 =?utf-8?B?TXFHUGtaT2VyVFRQV1Q2VW44UGo2V3dyQk5TVEJKeGNGS1lQSkpHMkNSaFhB?=
 =?utf-8?B?T2ZaNkRPREVES3FEVm92OUl4aFRvck9Sb2E2UTJINXQ3aS9GdnB1V1UyZFhP?=
 =?utf-8?B?RkhJRHhBVUxaUU15WU9nMi83RWtrV1M0YTQyV1g5ZTY3YytyUkRNdlJQQzhS?=
 =?utf-8?B?KytmQ21NaE1RelA2UHp5SVhZUTdLV21YczlNQURrR0tPT2t2cXFlL29NU3g5?=
 =?utf-8?B?Kys1NXJXZnplQitrZy93blVSR1FqSzlMMS9JVXVzZTVpOGJxV2laeEVPM1pn?=
 =?utf-8?B?ZEw4VjFhUmJkYUhDNFVpQjM4d2p3akNJTG1SSHdWMndja3ZtcFBqVlRGSTdr?=
 =?utf-8?B?eGpBelRDNzBRWkxIa2dlUGJpZWVKWkNseDFXM0g5dVhGb0tnellRbCs1SVYy?=
 =?utf-8?B?dmN4aXY2eEJMNFhVMEtqcUdvNmRiNllISjhxeWhadHZFQ0pmNC9TcENZWTVs?=
 =?utf-8?B?Y0ZyUTJ6dXhlQVhVNnJUTzI5Z2FtbjFCS2VUNEN0SlVoRGo3MHRtTmJ0Vnhs?=
 =?utf-8?B?WWJPcmd4bmtscmR1VXhWNDMycDhpODZ4V3d4VUlXYzNXeXM5Uy94eW5adE9x?=
 =?utf-8?B?dUlobEZEVVNlSlBUaHZ5bzNhQ1czamNUaUU4d0E0UmVEU1Y2a2pqOWNvQ3FW?=
 =?utf-8?B?Y2ZRRXloQmJYN1ZDQlQ0RU02Zld1bFlibmFHUUg2elo4Zlc3RFo3SUJ1Qkx4?=
 =?utf-8?B?S1d5K2JyTkJHSk4rdzIzWkZSZDRocjZTWjkySWIwbjZtRnUxN3hqZHFBdE44?=
 =?utf-8?B?MWswLzFqNU42ZmQzUThwTkJpV1Q2S1dyZmdyVEVxTWJSZG5zTzRKcTc3ZmVB?=
 =?utf-8?B?bWc3RjFkSm5ZeEJxZ2dodUJtZURjWGFxbG9KSytobzlVbnoxS0FjWGhkN2tI?=
 =?utf-8?B?bCtHK21xZ1N5OUNKR0VJSmczTXJ1OVZsWHhsbnRpdVhtMXljR1NZdXJmL1pY?=
 =?utf-8?B?S2hjTGVxYnNsUVFVYndNZ0FBN3FNckpLZ1NnYVM5Q3A3Slc5L1pkVnpmdng1?=
 =?utf-8?B?NjhwRFRlVVAreWFvREtpMnpwOUdZQWZzUEhGZXRhQklGRUUwcE94K0lzaTVB?=
 =?utf-8?B?S2tYNitjaFB3NHhUeWNMenlzY09pdGNtOVFTU2lUVjZsK0dxcmdQYkhjUlVh?=
 =?utf-8?B?c1ZMamMvbmRvNkVmYi8yWXNzeGxJbE8wQ1h2dGpaalgwSGFVenZKQkUrSjVS?=
 =?utf-8?B?c21pVUo5d3g0d1BNMklBa3NUekRRay8zU1dmVE1xVEJnTkx2OVhLc3U5Smk2?=
 =?utf-8?B?YlBMS2RwSm9IQmhDMDVERDhmWWtDUjczOUVicTFXNzNFQngyNEFnZzdvYVFG?=
 =?utf-8?B?TlpVb1dERzJlYi8wV3ZEVTNyK0NiK3RqUGx4dFJjdDhkcEVnZitiOFM5TlpV?=
 =?utf-8?B?ZmR0SW5GcC95MmJkbDZJOGZ5OUZ4TlZQeEhJYlhEYW5raUo2VmVzYXIwbzNI?=
 =?utf-8?B?NnB0WVBucm5RNEIyMEk1aHpCckhkNlpwR1BSZUR6bndHV0NiN2RXWkFFVWpJ?=
 =?utf-8?B?eW9mMEtBMUZuaUNweDN3SXRVcFYwY1RXbHBRZWZ5LzROUVdLTnRiL0FheE56?=
 =?utf-8?B?OXp0eXM3MGdpVUl6SEY3azR6bk9xSXdRWVZNdmdNQW11RnJMb1lZSkpUbDVX?=
 =?utf-8?Q?jEcrJvrBYyr8F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkV0MmVicHJqRjRJNUxrMWtBcDVJVDNGSi9FRlpjOVJKRENQYUhDTWJYL05J?=
 =?utf-8?B?K1FGeldWVUFJdjI4eG1UaThoMGFXOFE4UlR6Z1E1TWZmenRzbmtaaHR5bDJB?=
 =?utf-8?B?RHdhUW5YOElTaEdKc3dGaC9WODBXWDlQTnMzQzc2TWhrSGZ3VnE3a1lGRldo?=
 =?utf-8?B?aXZIRjQyOS9YS1RhWDJDRW93UDAzMzhpdytENVpaeFVuTEtZMUFwOUVnTHFs?=
 =?utf-8?B?SWJ4OTIxWDRxVTBDaGsvRjZuMjdoNzI0U01KWXRkNHd3VW1mSTh0VGkwWnNv?=
 =?utf-8?B?VnROTk1maW02aEp4aUJjMmM3YmtqRnhMeWFCQloyNGxPNXdTWDV3VlNBOG9O?=
 =?utf-8?B?UGtjOUhZNERNQWVDWDlvUkxodVo5WmdSMWZlVWN5bkExZzc1VTEzT0RnOUZT?=
 =?utf-8?B?bEsvYTQzQ3R5eklBRy95VFFraGdVaStEcjZxNmNXNUs5RmFERXpDZVBvNTAv?=
 =?utf-8?B?M3BjVzdPV1gwMTgyMURYMnV4MVpmL3JSc1YrNHZ0M0RleVBZR1hGUFFCVzlz?=
 =?utf-8?B?VjZEak9meGg0VU03SVJaZXJteVd0VHVpS3hmUFE2Ynh5VHR3SFdhTk11UUdz?=
 =?utf-8?B?YTlyRFJHQzBDcmx4MVFidjdMcmQ5QnNaSTVJcW1Oam5yc25pcDNsVWcyVis4?=
 =?utf-8?B?UUN5OXpvcUtwalN4WEhLczlsKzdVeWpUNmFVWlFteERYQnlTeXlJU0VkUjlU?=
 =?utf-8?B?TmZoaXVMYWJ6VFdOSnFOV2NxcXFrS3puc1BMOGVTbzZCNE9OZ2xuVGxGRWRO?=
 =?utf-8?B?QndSNWJ5VGRjaElTYjZmQnM4WE1OQVFkL2k1S1Vzb3FpWS9NcGo0VEYwenpw?=
 =?utf-8?B?N3lIeFI0UG5jRWx4bWUzOTQ1b0JCeUpzeWE0V2dRWXV6Y3hCT1p2WEh5cmhY?=
 =?utf-8?B?b3Bra3g5VnZLeDVvYkkrT0tFTkdKcko1bmZmNk9VY2Rpd0JISWtXU1FwVkNE?=
 =?utf-8?B?dGNEUFppS1dSWUJqMFN3UkwzN0NBRVcvWXR1bFJMUEJBVTRTWlNLckpldDRD?=
 =?utf-8?B?VXpnNzF2dnIvMWgwTDJ4OThPM0Q2cXVKVDhSc3hqT1dDQklRUmxWM1JPSzRC?=
 =?utf-8?B?Zm1MZFZ6enYyZVpYSFdYUWZuQldhaElUVFVOWFVmNVBWck0vcm05QzNUQnVZ?=
 =?utf-8?B?OWJjQndSRTBMZEFodGhIWTUwUjN4b01hUXNPUU1ycEhFQm40aWhDb1J6cnAv?=
 =?utf-8?B?dy9vZGczQUFrdzdhUStYK0dRVi83QmUzMzB2UkpoRkpmK3VhTk9CeGVkZjIy?=
 =?utf-8?B?R014OEtqNUJxR2ZTYU5NbmYwUXIzZ1ZNM0JWN00ydDlrN3hmbGxHK2g2Vmwv?=
 =?utf-8?B?bVpDaStwZHJscjhvK1oyamRoSEJJOWh2OXcrMk5ZWW8zZnFzVTRHZkdQWXV6?=
 =?utf-8?B?eVVNaE1Zd0hZNjA1YUw0Q2RuZzBCOUQ4RHMycEF2NTd1RTVROFVyUzZXUERR?=
 =?utf-8?B?NUUycVk5MTcrWjZUdk5mNjRwbFNGMk83K0p0Y0hHRjd2anZIYlJzaDBTbmVD?=
 =?utf-8?B?ZVNJYTJsVWl3QUVma1IrZEIrbWd2Y0ZONzdVcjF4SW82OGYyOFU3VUhlMzNk?=
 =?utf-8?B?QnQwRW03RTVsc3BEVWE0UXZ2czdwcDVYdFBneFp4clREWmxCa3F6WnVHUW9s?=
 =?utf-8?B?eVNtNzFEVk54NmJPa05ja2pGU1VJN3U2dzVPd1ZrVC9Pc2RwOThUOXRtajNH?=
 =?utf-8?B?T0ppVUo3akVFWE84cnhhcVh4bTRyVXRsVVdTaE1mdnRKYXJ0ZmhBYW9nVk10?=
 =?utf-8?B?bHF5SnNjS1F0ajgvNHVzeDFUWTltaXpVTHgyL1RKVVByNGdYSGFpRGRtSTlP?=
 =?utf-8?B?aDFCRk5reGR4clIzR0NzK0xkVjI5SUxjMnR4aEhoZlRHV0taREt6cVBNOUpr?=
 =?utf-8?B?MVUzdUVlMThWdy81QjVQbzF3SDAvbFpZb1VGZWlHMWRtYTZBL1ZRamN5SmxM?=
 =?utf-8?B?ajIwck5uNHdUMWxmVHV2TjdFSVovUkIvQm5xa0pTWXRmb0Nwa3NyUlY5aHNY?=
 =?utf-8?B?djNpK1pTK3c3U0N3LzJUaFhZV1IvZ3NZVDQzeDFIQ29VaTVHRURHR2trNGx2?=
 =?utf-8?B?YzROVWkxcWd2aHIrUjNvMzk4N2FVUlRCMVF2K0EvOUg1bXZhb21vbVhrL2tB?=
 =?utf-8?Q?d4OkwdqTxvRaMWXkSbFcAg6dc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2673b38-6c8d-4ce1-adfa-08dd5240b76f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 06:26:46.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saPIYcaPdNGHlNaUlMW+aKJkvZVM8ud6RxrD4stK5a3fd8PETTo5U1g4FQ3xA/cA2S6LOV7WNucexFALbuHVyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

Hi Lucas

On 2/21/2025 10:15 AM, Lucas De Marchi wrote:
> On Thu, Feb 20, 2025 at 05:14:07PM -0800, Umesh Nerlige Ramappa wrote:
>> On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>>> On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>>> When the engine events are created, acquire GT forcewake to read gpm
>>>> timestamp required for the events and release on event destroy. This
>>>> cannot be done during read due to the raw spinlock held my pmu.
>>>>
>>>> v2: remove forcewake counting (Umesh)
>>>> v3: remove extra space (Umesh)
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>>> drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>>> 2 files changed, 54 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>> index dc89fa6d0ec5..67693d642f5a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>> @@ -7,6 +7,7 @@
>>>> #include <linux/device.h>
>>>>
>>>> #include "xe_device.h"
>>>> +#include "xe_force_wake.h"
>>>> #include "xe_gt_idle.h"
>>>> #include "xe_guc_engine_activity.h"
>>>> #include "xe_hw_engine.h"
>>>> @@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct 
>>>> perf_event *event)
>>>>     return hwe;
>>>> }
>>>>
>>>> +static bool is_engine_event(u64 config)
>>>> +{
>>>> +    unsigned int event_id = config_to_event_id(config);
>>>> +
>>>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>> +}
>>>> +
>>>> +static bool event_gt_forcewake(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    u64 config = event->attr.config;
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    struct xe_gt *gt;
>>>> +    unsigned int fw_ref;
>>>> +
>>>> +    if (!is_engine_event(config))
>>>> +        return true;
>>>> +
>>>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>> +
>>>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +    if (!fw_ref)
>>>> +        return false;
>>>> +
>>>> +    if (!pmu->fw_ref)
>>>> +        pmu->fw_ref = fw_ref;
>>>
>>> how this shared fw_ref is supposed to work for multiple
>>> perf_event_open()?
>>
>> Agree, not ideal, but I don't see an issue. This forcewake is only 
>> being taken for engine-* events and the domain is always XE_FW_GT. 
>> Looking at xe_force_wake_get(), I see that it returns a mask of 
>> domains enabled. In this case, it would be the XE_FW_GT. The return 
>> value is just stored so that the corresponding event destroy can put 
>> the forcewake.
>>
>>>
>>> fd1 = perf_event_open( ... gt=0 ...);
>>>
>>>     event_get_forcewake()
>>>         pmu->fw_ref = xe_force_wake_get()
>>>
>>> fd2 = perf_event_open( ... gt=1 ...);
>>>
>>>     event_get_forcewake()
>>>         // get the forcewake, but don't save the ref
>>>
>>> forcewake for gt1 is never put.
>>
>> pmu->fw_ref should be identical for all events taking this forcewake.
>>
>>>
>>>
>>> Or even multiple perf_event_open() for the same gt: we will not handle
>>> the count correctly.
>>
>> The count is actually handled in domain->ref in the forcewake 
>> implementation and note that forcewake is always taken for every 
>> engine event that is being initialized and hence always being put for 
>> every event that is destroyed. This code is not refcounting that.
> 
> so... we never set pmu->fw_ref back to 0 and any event destroy will try to
> put the force wake? That seems a different bug that avoids the bug I
> was thinking about.

For grouping of engine event and non engine event, non-engine as group 
leader would yeah cause the fw_ref to be put first and then an assert error.

Thanks for catching this.

But that can be solved in destroy. Will resend with this?

if (is_engine_event(config) && pmu->fw_ref)
> 
>>
>>>
>>> In summary I think this fw ref needs to be per event... an easy way 
>>> to do
>>> that is to use the event->pmu_private field, to be populated on init...
>>
>> I am not opposed to that since that makes it future proof so that we 
>> can indeed have events taking different forcewake domains, but let me 
>> know if I missed something here since I think this alone should still 
>> work.
>>
>>>
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>                 unsigned int id)
>>>> {
>>>> @@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event 
>>>> *event)
>>>> static void xe_pmu_event_destroy(struct perf_event *event)
>>>> {
>>>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>> pmu.base);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    struct xe_gt *gt;
>>>> +
>>>> +    if (pmu->fw_ref) {
>>>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event- 
>>>> >attr.config));
>>>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>> +    }
>>>>
>>>>     drm_WARN_ON(&xe->drm, event->parent);
>>>>     xe_pm_runtime_put(xe);
>>>> @@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event 
>>>> *event)
>>>>     if (!event->parent) {
>>>>         drm_dev_get(&xe->drm);
>>>>         xe_pm_runtime_get(xe);
>>>> +        if (!event_gt_forcewake(event)) {
>>>
>>> if you group an engine vs non-engine counter, this won't work I think.
>>> Can we test it?
>>
>> When you group events, init is called for each event. From the Xe PMU 
>> implementation perspective, grouping shouldn't be any different.
> 
> the event->parent is a shortcut to do this only once per group, but then 
> you
I thought so too, but it enters event->parent condition even in case of 
multiple events in group. Had verified this before sending the patch

sudo ./perf stat -e
xe_0000_03_00.0/engine-active-ticks,gt=0,engine_class=4,engine_instance=0/,
xe_0000_03_00.0/engine-total-ticks,gt=0,engine_class=4,engine_instance=0/,
xe_0000_03_00.0/engine-active-ticks,gt=0,engine_class=3,engine_instance=0/,
xe_0000_03_00.0/engine-total-ticks,gt=0,engine_class=3,engine_instance=0/ 
-I 1000

sudo dmesg | grep force_wake
[  697.540291] xe_force_wake_get event 0x400002
[  697.540333] xe_force_wake_get event 0x400003
[  697.540352] xe_force_wake_get event 0x300002
[  697.540364] xe_force_wake_get event 0x300003

[  702.509036] xe_force_wake_put event 0x400002
[  702.509099] xe_force_wake_put event 0x400003
[  702.509137] xe_force_wake_put event 0x300002
[  702.509171] xe_force_wake_put event 0x300003

Thanks
Riana



> can't look inside the event to decide if you need to take the forcewake or
> not because it may be true for one event and false for another. Try
> creating the events with the group leader being a non-engine event.
> AFAICS the forcewake will not be taken.... something like (typed here
> without testing):
> 
> perf stat  -I1000 -e '{xe_0000_00_02.0/gt-c6-residency/,xe_0000_00_02.0/ 
> engine-active-ticks/}'
> 
> Lucas De Marchi
> 
>>
>> Regards,
>> Umesh
>>
>>>
>>> Lucas De Marchi
>>>
>>>> +            xe_pm_runtime_put(xe);
>>>> +            drm_dev_put(&xe->drm);
>>>> +            return -EINVAL;
>>>> +        }
>>>>         event->destroy = xe_pmu_event_destroy;
>>>>     }
>>>>
>>>>     return 0;
>>>> }
>>>>
>>>> -static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>>>> *event)
>>>> +static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>>>> *event, u64 prev)
>>>> {
>>>>     struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>     struct xe_hw_engine *hwe;
>>>>     u64 val = 0;
>>>>
>>>> +    if (!pmu->fw_ref)
>>>> +        return prev;
>>>> +
>>>>     hwe = event_to_hwe(event);
>>>>     if (!hwe)
>>>>         drm_warn(&xe->drm, "unknown engine\n");
>>>> @@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event 
>>>> *event, u64 prev)
>>>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>> -        return read_engine_events(gt, event);
>>>> +        return read_engine_events(gt, event, prev);
>>>>     }
>>>>
>>>>     return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/ 
>>>> xe_pmu_types.h
>>>> index f5ba4d56622c..07c4e592106e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> @@ -30,6 +30,10 @@ struct xe_pmu {
>>>>      * @name: Name as registered with perf core.
>>>>      */
>>>>     const char *name;
>>>> +    /**
>>>> +     * @fw_ref: force_wake ref
>>>> +     */
>>>> +    unsigned int fw_ref;
>>>>     /**
>>>>      * @supported_events: Bitmap of supported events, indexed by 
>>>> event id
>>>>      */
>>>> -- 
>>>> 2.47.1
>>>>

