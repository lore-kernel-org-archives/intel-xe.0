Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE7C369D1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 02:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC1D10E2F1;
	Mon, 28 Apr 2025 02:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJyQzacc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B2B10E2F1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 02:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745806058; x=1777342058;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=qssqvpmXC0l/su4P4ovCMPDlMxku36IY4c2cpNPx+4w=;
 b=SJyQzaccImW4SC1yYR0IBBPACC61ICP4AB2MPzCsLX4yUsV7FhOI3qsv
 n8rW0wEpJHwXhm+6qHbp6UHvfsdeaVcd2Dh2Ofc9OEcq2i1Vb5B0M8soj
 rIcl3kGXYLV6KL5N6N5gvpwHRt/GgFTFzSZJy/DLxoJ2urIdM0/BTLceR
 CK6o0yN2EyXKRwlLRCwDwHcw7Wt6gMOvIMGCBFx8B11QBENlo2I/9rc4N
 dQbXlt+DtpssTnydoD8gEzj8a9ZjLP6ve6a+Tw1bVjLs7idXQr2aSBc++
 KuAAmphe93x+LQA/aA6rtFhEbrcSW6ROolpxS5g7VeqO61bqqi/znQiPG g==;
X-CSE-ConnectionGUID: sSyk75CpSfqK2eScFRWe6g==
X-CSE-MsgGUID: mHSnY7bUScGO/uc5P+n/gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47295905"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47295905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:07:37 -0700
X-CSE-ConnectionGUID: y4vJycrjRw6bEkW2jwu0Dw==
X-CSE-MsgGUID: wntvSUqLQIurbURx3eVcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133909648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:07:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 19:07:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 19:07:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 19:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip2qtBniNl1IUuy37M0QuwbHq5J3tOXZCuMP+rS0emm9GG79Ilbh7hmfx4eym8qzCL9J64udRmtUWiBf4bXhjgY2DqpSuvwXJeVXXrjNxlDlaOWvjf42cPEf/UdlGplMTX8wGENDvcSnDoPgWwLOoniOywMiwoTA7Le0ecki6Nt5sNquFdE3OlqrjT20cx6ONLdYM1gO8x3rX0K6HvaJHAVUhoZGSteMNAzYR5oUnu5ZQZm8ryqdPVDcH4ZV+Q7xj8bCyMtiOwLo8uv9FoEVqFre8IWOqHkUnsuMgmUil1kZMyX3BeivqKMdvMTXkCUJPq4z4lStBHBKpGUp0kR4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qssqvpmXC0l/su4P4ovCMPDlMxku36IY4c2cpNPx+4w=;
 b=dEmDc6KrrWXRUwQmKLqWpif5jIoPRsAnSopwe1VrcYefeI9gjaVTEg6ByMMj9aMIJ7ssEonEmNnXpvfVAUwX4mT3hNdp959wZrB9yAkkhopUFTsIEOFIN66W5wa62mIJ8NrqkZ6d7KNBjuXm7+WhzVzilqX/AhUclR9uc0uB4AzBlH5K+S/eCecMyitn31k0bPhCnIVXCM3xi6MrTzVpxYCaJcqYDX3Mx3CsJ00w1usaDH3+wpzGI88ijMDq7OwrNV0tRbJkuyXc3KgNMC8dLi3OzFFUCQjhKm1tNaLEDxsq+pFH6d/B94gTY0GICBb964r/naMdMQZ38l3K+p7MrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 02:07:31 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:07:31 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Drop force_alloc from xe_bo_evict in selftests
Thread-Topic: [PATCH] drm/xe: Drop force_alloc from xe_bo_evict in selftests
Thread-Index: AQHbt91ygCFN8DHrZUSSERcYBGOojbO4VP+A
Date: Mon, 28 Apr 2025 02:07:31 +0000
Message-ID: <fd2c53af210e5280a3a0df3fd4b324f10e7819c3.camel@intel.com>
References: <20250428013343.877053-1-matthew.brost@intel.com>
In-Reply-To: <20250428013343.877053-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|CY8PR11MB7876:EE_
x-ms-office365-filtering-correlation-id: 98870e86-b12a-4394-19fa-08dd85f96f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a2lzdTZ0Y05YZENtSEhLUHRzV1NoRUZsWjBhNDJtU01maGpVY0l5TnJLYmwy?=
 =?utf-8?B?cmc5ZCtTeU1VL1J4YStJanNCYWkxWFB5cU5GdXpNRk9kMVFlVTZiTmFZa0hZ?=
 =?utf-8?B?alNtQzA3WGg2b0dpUjN6Snl4ME11N2NscGxBMDNSWjJWbS8vWHAybUtjU2Fo?=
 =?utf-8?B?WmxQUS8vc1NobG5oQmlxcFY0cEVRVktaYkhBdG9xSlRhckVVTDdIUys2VXR4?=
 =?utf-8?B?VWZaRlJGVkx0OGRPY3RIa25kMUg4S1l2ai9PNDVTRk9idzEwS2p0V0p3dHNa?=
 =?utf-8?B?VThpNkY4UXJaS1pUZjlNTUxuOHdzNVJ6UzBRVFRFZzR1akd1a1FlWjUzU2Z5?=
 =?utf-8?B?cFo1SE5xSzhmMWk2bStpYkJOZk9HbUF5NTE3aFBSSDBHYTRYQ1R6OG00cGR3?=
 =?utf-8?B?SEwwVi84RmpKUnNoZHJoT09jT0FqYk5iNTRvU09YSGFmOTMwVzk4ZHZzNHRV?=
 =?utf-8?B?djZWZWE3MnpZYzlHMzBnVGh5SW9rREFWS0RKLzdsNklHYjVJKytINjd6L3VF?=
 =?utf-8?B?M2IrdzkwQjh5VG9xS2EvanRiaFo3SnBXcElWZW1naXZ1UXYzeDZCUFVjVWt0?=
 =?utf-8?B?cU9tNGpGRUk1MVQvNzUwSGh3RzBBM2FZNDFPK1lPQzUvd3IvYkV4Yng4RVNq?=
 =?utf-8?B?Mk83Tzg1Y3pFNG51Z3BHTUNBMHJlZEEwbkpFT3JBUTRSUDAwdkljamJPNmlX?=
 =?utf-8?B?TUxWRUxsN2RaRzhja3RMdHZPdWJUY2QwZW0yTEpTcmNWZVRsaDNGbmdPL21H?=
 =?utf-8?B?WkppMTNib2hWdWt2dC9YZEJraU02ZDkyYUJ1Wk0wQWZ0dEY2d1dPMVBSSktC?=
 =?utf-8?B?U1RqR1MyNXQyV1gwcThvZGpWY1VUN1RiM0k5NjhUL2Zac3hBRlVUZmxjUFZs?=
 =?utf-8?B?WVR3bXRNeXBzcFo3RGNBSmVScytLZ2hKbjB1bFlXN1d2MVdSWG1pVXB6OENo?=
 =?utf-8?B?V2JQSWV3UkNEMVFCajY1Y00wVjdOOWNCUDhXU21IMFNhWTN2d3JuQUdwbDFk?=
 =?utf-8?B?NzdTa2x0bG1WS1BpSXUwYkhpSjFia1VzT3RMcW5LUnVQK25kVTY2RDQ3UFpa?=
 =?utf-8?B?RDJKOGZiR2NHVW5mMjFEZnl2MHAxOVg1b3VFTUw5azJNaHRjQkJ6NEJSS25v?=
 =?utf-8?B?aEp6QXErbStXNjBTcGV6MjdraDZIZTM1dWlvOTVVbXQ2VmtqRXdtbG1LYWd4?=
 =?utf-8?B?MlB5WlF2ZUE0dUVObXNpamNMM1BEaktlUXE4aUZQT3lBUGhEaHBXamdZbmdK?=
 =?utf-8?B?MC93dERCVzNQVFRNcHdPc1B1L2JUTFp2UVNpWE5OQ0JyaHdqTW1ScTlNRzhK?=
 =?utf-8?B?UmE5TFE2ZWlGKzgwZHBkeWdnYUlUSmxKdFZyNTZZVjliT1ArdG5mOXdZa0FQ?=
 =?utf-8?B?M0tKOWJVL0FWaklkbERoL25uQ3I3NTIySWRiUmFPNWdKYzlVLzYxY2pJbEdC?=
 =?utf-8?B?MzFqMXpQZ2VxbWo1b21wUUZWVkZFeFpGU3E4YUVwcFhsclF6Snc2alR4MkY2?=
 =?utf-8?B?SzczTXFqMWV6YVJOR2NZZC9XR0k4ZFc4UnNhQytHSWxHRjVWSitxUlFpaHpL?=
 =?utf-8?B?Y2FnWWlIVUEvV08rVVFXQTg5UUwwVUp6bVB0dmdHOVRnbHJ2djhPOE52WHdC?=
 =?utf-8?B?OS9iZEZoUjI4RU1aM0lqZVFXVTQ3Q3A1dXMySndncjI1Y3pZajZwcjFMZGFa?=
 =?utf-8?B?VFk4dzkxVnBWUmVTME1LcGFTSk1vOXFqc2p0R0tUV28zSTYxODJqTDZQSm16?=
 =?utf-8?B?NXRMcERDUm5qVWJiZklQb0NmZmk1dUNqMHNUeWZuMUFBcnN4YTluTDg2SFhl?=
 =?utf-8?B?eFMwbVBIVzVEU0QreEFIWFhBUDR6bzNpRDRnZEZTdG5lL05pekNaWHE4Mnhi?=
 =?utf-8?B?ZTZCYkQ0YnJTZ0pGdXllNGdpUHI2eDZkRHY5bHNHeml0bDBnUE9MdjNUZjBj?=
 =?utf-8?B?OFJTN0g1cWNhZ1kra01ubHAyK2FHQlV2T0lJOUtwU3FMM1BWT21ndkFRTUNH?=
 =?utf-8?Q?sRZo/SXQ6VBPziIVA5HKnUTbX81v6k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0Q4dlJhOG0zTGhiY0tKaUxpZTJlU1pmY2VaWFFTdnpKT25mdE16WG00bjVj?=
 =?utf-8?B?YSs1VTA3K0lkVEFCeERHNVU4TkQxNE1PaDMwUUtBWVIyR2FGNXVndzgzZGMw?=
 =?utf-8?B?VUsrRFBoRGs1WVhFRjYyQklaZGhqYWZMeXRnb1A3MWxxRGJucGxtbXFUV3d6?=
 =?utf-8?B?bFVxMWljZ1pTdjNBY2tlSUtFd3ZEcUlaa2h0dTJMejYzTFpuYnJHclZnOW8r?=
 =?utf-8?B?RWpmNVFMeGRPK1dXZU9INjRJbWZHRnpKRDd0UElIMi84MGwwZ0ZWOUtkWjUr?=
 =?utf-8?B?NUdMV3hYYWpVV3FlMDQ1Nk9heWx5L3RwTStFWWFjZDhsU3VXOGJidGZDcWVy?=
 =?utf-8?B?elF0bVptWDUvMHVCeVdNTStodnB5c0QrTVo4a0dKWHlPUjJRWTdYREpRcGd5?=
 =?utf-8?B?cDFUbFg2bnFjanUwb2l4UnYxRlRXRkpEczQ3V292Skk3RDhqTjFqTEF3Wm44?=
 =?utf-8?B?aTdQK2xaaEtvTGtKQUJNUFJsRTE4UWJNVVFZRU1EcGVFMHRNdGY3SGhSQThX?=
 =?utf-8?B?UE02bkIxZDFPZi9mZGdkcngwcUc3V2c1bWV2bEx3cW5GbWN2cmp2NklmTkdt?=
 =?utf-8?B?L3MrMTRqZllJdVNVbzVlMVRyb0xQZDlFN2tTU1U2QTRLZTFBcHBVM3U2NVd1?=
 =?utf-8?B?NU04b3hKVVhHd2ovWkRWV3IzSm1CcmMxN1JxelN3Sk9aN3Z1ZDl3Z1ZDUzFQ?=
 =?utf-8?B?K3cvQ3V3RDhsMGZaOUI2MFUzN0tOSk5Ed1V3aWpNRWpsY3A2Qkk3UEFCVjNs?=
 =?utf-8?B?MG1qbW9LSGdVNzFKNVVhWVd0azVSZnFydEIySFZtS2hRL1BhdWxkMDVMeUZ6?=
 =?utf-8?B?Ukw3cmRFdHFRcGRFVjZwdzZpWHMreXJuZjkyQkJMK2xGRExad1pZb3huRURr?=
 =?utf-8?B?MWIyWWQzcXJ0Tk81YjNHN29tSFpJRnk5Tm5sSXc4RkhuKytkakpweFZETytj?=
 =?utf-8?B?OXZOK2FWdlBnUXJRaFZvRWFyajFrdFQxQndRZU54ZlpHNnptaldMdW1FeW1o?=
 =?utf-8?B?NFZxT1VxanB5WDVZdTk4Q1VBS3VjeWl0d2I5alpIMkVDQ3gyenFmNnZpSVpZ?=
 =?utf-8?B?OXkxTVkzR0FGc2ZSRStXZ29HbHRVWFp0NmZaand2VUhrNjlkNFdlbXBnWFpI?=
 =?utf-8?B?aktQTS9xYlJTYW1zUTNjWEdsd3QvYnhXZEVKeHhmdXJlM3Z3ZnFjeS9MTkhn?=
 =?utf-8?B?WTUwZ294dHcyL1lxcm5neit6dmxzaXFzUHdiaUFCNXlaNVNVek15M1p0RU8w?=
 =?utf-8?B?VFkxeEpWd3l4V29JVSt6cHI5L2RINkk3SE9CNDdOZHUxUlVrVG1ocXlhdjRq?=
 =?utf-8?B?WVEzNzhSa0ZWTllPcXJ2TnBDMm9ualNONnkraG5UMXFLdlhXM0dsYnBqK2VB?=
 =?utf-8?B?d3VRMVIyekZ3aWs3UWMrTzN2VjhMZkRRMmRPY1VyQ1k0RDh5NC96NWVVSk43?=
 =?utf-8?B?c2V6OGtoY3BmUCtaRWJqN01xQ1Y3NUdMd3NkdXBlOHZSMTlEcElyM1g4R3V5?=
 =?utf-8?B?VXZJUHEwNkswSlFLR3hod002clZhVGg1M0REamZqZ3MzcExpWHBBWDNEWFVN?=
 =?utf-8?B?eXh1RXJadThyemV2MFlMdFROcWZQS1hFaVhyaVNOSVJwZ0I1UG5hQVVRM1py?=
 =?utf-8?B?RGh0cnJnTDAzTTREeVVLWnBMT0h3STBhSzhNOEFCZ05vbG5Xb1oyTnVWZ01v?=
 =?utf-8?B?VEhQdUJNaXNwR1pUUktYVDRLSm9rWGN4bmZYMWVFTlU1ajNVM0hMWitoK0s2?=
 =?utf-8?B?aVp1ZjRpTExjWktWVllPYnNEVFMxcSsyK25PRkxBQ09DUU40OGpZSGM5OHBp?=
 =?utf-8?B?bUxqMXpoZmhOQ3JRMzhrMW9JeS9kNHZONkdHRUxaSFhwVnNCL1J3TnI2SG5m?=
 =?utf-8?B?SjAxdUwzSWZiNnlRNGIxQnZGYU5PSlhPdkcwUkFmQVpEZ1FOL1BSd3h0aVQw?=
 =?utf-8?B?b2lpQ3JtMkRBc2U3YzFEUU85dDJPVVJCZWdzYjV5aDVBbzI4SmVyQzk3cXBw?=
 =?utf-8?B?T3FVeGtEdjdyVWdERjNoWnN2QWdZaDU1OE5EdnovSXRCWmRUejJoNmdER1VX?=
 =?utf-8?B?OHNBUTBXL1U1bnEwcVpGUlhTUzRzem96RDhQcnVidWZwaERHRWJ2WWZqZzgr?=
 =?utf-8?B?YmZ3dUNxU3RKZ01wVW1wVmJWdzdZbVZYU1RuQWhEZEZhdzk3QkdKeFJjbUFF?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE7BD9AE840CCB43B2CA10C38150D056@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98870e86-b12a-4394-19fa-08dd85f96f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 02:07:31.7674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4q7IqvLNBj2DpC/TohjNiHNrjcR3A4qvihKbOOYl3d9gezi74LS/11RQVhpkqtTBBECdtanoUbsG8bKNRFhrCLU/VdruQglK9JhZibhuPZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

bG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5B
LlRheWxvckBpbnRlbC5jb20+DQoNCi1DbGludA0KDQpPbiBTdW4sIDIwMjUtMDQtMjcgYXQgMTg6
MzMgLTA3MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+IFRoZSBmb3JjZV9hbGxvYyBmbGFnIHdh
cyByZW1vdmVkIGZyb20gVFRNIC8gWGUgYnV0IHVwZGF0aW5nIHRoZQ0KPiBzZWxmdGVzdHMgdG8g
bmV3IGZ1bmN0aW9uIGludGVyZmFjZXMgd2FzIG1pc3NlZC4gUmVtb3ZlIGFyZ3VtZW50IGZyb20N
Cj4geGVfYm9fZXZpY3QgaW4gc2VsZnRlc3RzLg0KPiANCj4gRml4ZXM6IDU1ZGY3YzBjNjJjMSAo
ImRybS90dG0veGU6IGRyb3AgdW51c2VkIGZvcmNlX2FsbG9jIGZsYWciKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2JvLmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2JvLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvdGVz
dHMveGVfYm8uYw0KPiBpbmRleCAyMzBlYjgyNDU1MGYuLjM3OGRjZDBmYjQxNCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3Rlc3RzL3hlX2JvLmMNCj4gQEAgLTYwLDcgKzYwLDcgQEAgc3RhdGljIGludCBj
Y3NfdGVzdF9taWdyYXRlKHN0cnVjdCB4ZV90aWxlICp0aWxlLA0KPiBzdHJ1Y3QgeGVfYm8gKmJv
LA0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgLyogRXZpY3Qg
dG8gc3lzdGVtLiBDQ1MgZGF0YSBzaG91bGQgYmUgY29waWVkLiAqLw0KPiAtwqDCoMKgwqDCoMKg
wqByZXQgPSB4ZV9ib19ldmljdChibywgdHJ1ZSk7DQo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHhl
X2JvX2V2aWN0KGJvKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBLVU5JVF9GQUlMKHRlc3QsICJGYWlsZWQgdG8gZXZpY3Qg
Ym8uXG4iKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0K
DQo=
