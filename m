Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C19CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E7710E0B0;
	Fri, 22 Aug 2025 20:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9FSN7Gf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0FC10E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755895140; x=1787431140;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dzfHop3mw6qYZduPYa8TRIQ2FGcIeSdihbCTuggCEAo=;
 b=F9FSN7Gf5l7yn4YrJhAX/z55YKbZvn/+Mvhx5sCWei98guqkrO7ZMLRs
 I9kZFs8te6mHdRVbiR6S/Di8kXQw8oFTF1KPY3SWjppHBpnhnGrEUHOTy
 lM7YCHffeI4FaBNFAxjR4xGBfa84jc2XVJSQmF7Pq3PD09pzHID0Kyjee
 5ZpP5pRJuYhR+CQIuhl1Grez/0xGuvDbtSJIT1Re1XRlvrZqgXU0LhTSG
 UEVnwl/9yZ2Xw5Y+12ClraIFGENEfUIu8z7wGfg4sMvtZjIiznQ3Orzdp
 JtOj7D5h8OO6GeTsPwE6h9oO/lZoSMQ7PbEr02GdkM2h5aaDCeIjZxdcd A==;
X-CSE-ConnectionGUID: xeAuqHPPSlKeg1CbiI3J0w==
X-CSE-MsgGUID: 0W8XGLJTTf6z+kHeeAQuOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58355696"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58355696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:38:59 -0700
X-CSE-ConnectionGUID: ldZ35DfXRyyHI/zWReghBg==
X-CSE-MsgGUID: e7YURjzRRRmPSlr5U7rOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168397061"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:39:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:38:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:38:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxlJMijXS7U1XmSFAwrl4lK7+GoOyKT8YQZ3mm1iqE4Ts7lomGvMcQM2F2rPmGRmvi+5Zl0Z8B/UlbBP+QJnOLKcx1r9ODSmZkoiqkLu5rIoUX7pl0jlEIrkrHDGdn3TBM5VNN6fFflmI7kTmJTjt8aYXoYwmHHWqJbSqnLNkIWXGtqfYIKlA9C3R9xGLE/xlWRYAAZEPst/6bgXWzjxhCsaIumydpgn3t2NAiewTIpbBqViKd1sKe11rCL/WsqSVpm4U5b1GthbovQoWb0UZnSvwO+msm4DrUUFcWJW0IbH/rLRQHPkhK7fHBWxlJMV2UNKoAf3DGk4Npa5jQx/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FfUqZnKka3V2PpfJHkuM1NdKmKSFypeVq/cwtbrcQk=;
 b=gaFhZAzvRCSrUbpmER8b8tkUMoGyaV7lp1UYyoVrzDoHqymq2zsy09HanE7IBeTVWuug22Wt8MIWhupzLO6wfA43gjh07v+8KubS6vGw6bfRAqFGuPpt41vCwH9U7QhL5licpN1GwOeSqff1OrPk0h813OQ3Q2fOSvri98yJH37LHf3DBsgpoLNzCQ+9s/MMvoRs5wXBLIAGf6LtKG8bgWgBhZ7medUsruro/a20Dcdnxc16hzAxG42BtMAEgTf9OlleS5vCYfTWn0rSWC1ytQFIP2in4euOjJfBezaGRH7u3zp5s11PZ9JyEptQkobANLGEOG4BPEgr2IZIsgO1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 20:38:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 20:38:52 +0000
Message-ID: <9a920dbb-17f9-4c5a-8cf7-a83b9913247d@intel.com>
Date: Fri, 22 Aug 2025 22:38:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe: Only have a single drmm release action.
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250819101119.511705-8-dev@lankhorst.se>
 <20250819101119.511705-9-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250819101119.511705-9-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::34) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d765a5-58f3-4841-8b7e-08dde1bbe7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW56WHVMeTJBVFhFc3F4VU9STmFJa1ZWV1BSWGxPVGI3d2NaaUwzMVZCZ05r?=
 =?utf-8?B?MHlGNDl2ZXJDT2ZpZFlPbGZYZFVKNUFSRWtZbEVlYTg4MXBIUDhSbEFoVWRF?=
 =?utf-8?B?TUI4cEtQb1RKTXlRZ2RXY1pLdWwrRTVCdUlZOFM2MUhrMXpubGcrTzJiRm5U?=
 =?utf-8?B?KzBCMGUycG9VSy9TWWhBajN5QTYrVWFHOWlsWksrdGZQdWI0ekNIWC8vRzRX?=
 =?utf-8?B?VnNPRktrdmdDNFlyMDZlblhjUkxIV2xxYlh5aFJybk8vcDRjaWRkVDdXY1FR?=
 =?utf-8?B?NjRpdnd1KzNHNUVGb0FoUjQyZHVhV09JWDN0eEVESFNFN1VGNzJ3cm40K2dM?=
 =?utf-8?B?cWxhdzF5Ym90TEswUk01eGRRUk5qZ244NVNINFFmeEtiN2thSkJNY1A0bjF4?=
 =?utf-8?B?T1R3YTg2MG11QW83bjhBWGZGTWFwcHMwYVFzVklJWjQvd2t0Q0JXU2p4MXpF?=
 =?utf-8?B?T0ptVjVWU3VEY1JycFhjMHFrQzJDRzd2UHorc3dtUi9WcDJhdFNacEt3N21E?=
 =?utf-8?B?dDhlZGpPOXY3aFNCaWlzaTdHU1V4cXVNNDRORjNzTWhQS1V6bEdkSGFkL3hR?=
 =?utf-8?B?N0ljNXJ3UGlobjBWM01PS3JkaGh3eWZWVGwzdHlSbnU2MWo2R21BaDBUdGJE?=
 =?utf-8?B?STZZRzg1ckZhSnBjZ2FFOFQvYkpHUUdEbWtrSm1JTnF3cUVYMkhkNnRrLzl4?=
 =?utf-8?B?ampFVlNVL1dDZHAvWHRnRUlPdm96ZGErTElheEszVVVGcjdadjVpcGJZS01W?=
 =?utf-8?B?U3lLL3BsaExPcjVIUktucUM2cUx5V09MbGx5ODVzRHkvdGF2YnBHT1ZrNmRD?=
 =?utf-8?B?cm1DVkhxMDJvbG1xUDIwekVTcHduVEMyS1FmMldOcHNmZW01Zzl3eGFqVU1o?=
 =?utf-8?B?UTJNMHFVQ011T2E1YUlSMWJTejdhMnhvNzJYeWdVbGk1eE4zcVo2bmJLRUZo?=
 =?utf-8?B?K1pyUHNVQlJqSm5hdFpvMnZTM1NHZVBsb0FzM01KK3hnelFETlhNa1F1akhq?=
 =?utf-8?B?MWhtTXM2Y0tYZ0Q5dndRV01Dd1kwZDNBYjhiSGhLdWthSHFOZmN1bXhCOTFQ?=
 =?utf-8?B?N3B3RS9zT2E1L1RJaWwrWUlFQVZqaXVybUVqb0tRaE9MOElYN3BPSWtGc01m?=
 =?utf-8?B?azJISGpsWHR2YnRNbldCNTUwTC9OcUFCWlhoSG1LdVpxeERVaFo3bnl5NTVq?=
 =?utf-8?B?cGRvbzl2QXdwUEM1NTJuZG1oVGJJU0RUTldvWWtuNjlwVFlXOFFuUlhSVG8y?=
 =?utf-8?B?UXJhaktMZUZLbVVJMW0wWnJMdkFWVjB6K1dLMVpzdmlUWmsyVzNvUUJHOUdS?=
 =?utf-8?B?S0diVlBJSURmcktTd0p3b3BXWGY2dTNSYmRtQTFVQWpCMUo4TVQyYkRNdmo4?=
 =?utf-8?B?QkNWUjMzN2FrcUErZHpGc0NFcnZyZVJaTGdPaU52Y0pGV3FYdkJFTjhBRFZ2?=
 =?utf-8?B?MzFGVUlPNWRLYXBUMkdTKzQvcDFVK3lSQTlXRXJZZUJJT2ZNeVhld1E5RGgw?=
 =?utf-8?B?VFdYbCtOdWlybzM0WXBEWFg1OCtYTzlRRkw5ZEsxWU5JQXVrdXJhMkkvT1VB?=
 =?utf-8?B?bDJVV2V3RGdEbWpJS1hHL1FDOWp1a3JJa3JSeE9seE9vUTZHVTNRQkd4dXhp?=
 =?utf-8?B?bk94VW9TVlhPOFlrNGxiK2hnSHNQN1dJNXMzZXgrajcxVjNOU1p0T3ZObFdk?=
 =?utf-8?B?T3g2dFY0UU81MnA3aENHQytrSVVsaEFVN080c3ZPZmdNU0hQaXUxcGNGOXAv?=
 =?utf-8?B?VHU0d3lzcGpwZWxGNG5VS29oQTVuTHZ4KytXTmFsbk5iVEZCeXVNZXA4ejFY?=
 =?utf-8?B?K0FWRkVyTFF6MGFlRXp5OHpOMUp5UVYrVFVoV1hsUE42YVovNE5EZ2Q2a21t?=
 =?utf-8?B?ZlRkTFlOZHJMRmZYMmZMbG4rK29QaGw1UG10c25US0xYNkhWZFYwYUEwMzk1?=
 =?utf-8?Q?hFsVjWyLgVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cndSbEN6bDMrNHRPdGRDUmFEdW5qK08zVGRRYjlwaVVMRlNEdVRnYkRGbnJP?=
 =?utf-8?B?NXZSc3VLcXA4aVRwcVp1MXorQTFYcnlmNDluM2MvQjhQL2E3MjFpcnZCNGNG?=
 =?utf-8?B?TmdCWUdXK21zMkI4MERGM2h1dTVXRFh5Y0dBd05Hc0ZsQnk5WVAzRDNNWjMr?=
 =?utf-8?B?ZWNlRnk1eVEyVjB4TXRrM0w3RkEzTDYrMHp0dXRvS3hLSEcrTU95OXA4ZWtt?=
 =?utf-8?B?c0kxenpVTGE5VDJQSExtcTlHbVJRVWRQOGVwdXFDWnJ1RWI4NU1WbGRiTGZa?=
 =?utf-8?B?M0pxbzRSeU5yaFNOSlFFaktQemN6MFFTWGloT0x3OTIwZ2ZSZVhEWUMramRp?=
 =?utf-8?B?cUlpZGxIaXlrWkFYVXlUdTFXNjdWbFpORVR4cVhqZW1CTjNjanYwZHQxekZQ?=
 =?utf-8?B?YUFLN2RNWjNHb3BvZHdjWWVYT3BuRUF2cHdLWm1UUzkrZkErb1JVMFJuRHRY?=
 =?utf-8?B?NGdiY3llcDExWUZFeURCTVJ0ZGFMWjVDMGxVOXNqZytvczYxdlFrUm4zMVFq?=
 =?utf-8?B?UFN0d2Fxb2ZmQ1ZPOURkb1lhdTVKemdlQ2g0dC9ncThEYndPcW1mY3lidS8v?=
 =?utf-8?B?OVNLc2dmcnI2bHp1ZG9iS2JFelNpZ1BCaU56cHg2Y3poMnV2OG5nTTJhQjdF?=
 =?utf-8?B?bHJJTndtVm5sQVQ1OHVkUElGd1pFdHh0YVVDajRCUzRGRlp1dlZvQUhFUzlF?=
 =?utf-8?B?b3lUeSs5UHZKajhDVTRFOEZ2ODJVVHF5WVF4b0pDZmpOcU5yczVVWnRXdWgw?=
 =?utf-8?B?c2swMVlUU3Y3ODU4Y3dRVWJFdFFIYkNpaFNrWHJTOWlYL2poVExHLzFRaGNw?=
 =?utf-8?B?NnJVRXk4NE1laHdGTTd5c3J1YWpvSjNSbE8vTURnMFNTVWt4SHR5bHVaUmk3?=
 =?utf-8?B?K1VQeDNlUVZFWFFyUkltSGYvakNKNGFLOVVBdDFRVUU5VDJaRFVIYlZBKzNW?=
 =?utf-8?B?KzhzVVhEallLemt3alZWa21oTjNaTWRYcnhydytxRWZHbFZkSEdMVWwrKzlu?=
 =?utf-8?B?bXJ5TS9qVk83UnlVLzRTTEJxNDVuWTg1YTF6Y296OWd0aklJa0Q2VUpXQ053?=
 =?utf-8?B?L3UvZisxekVVaGFsR2ZTYUc5NGdtRHBBMUlCUkpFNGJ5ajZHeGlZR29wdFJi?=
 =?utf-8?B?cmh4V2swNTEzSlRPcVJWUVhsT2Nzd2Vlb3dON1cyS3FPWFJZcG1SOFlJMmNL?=
 =?utf-8?B?QlNxRjExdnN5Mk1CUFpkQnhWSjNneXkrR1RXK290cGxzeUtqQmtkRzJmUHdj?=
 =?utf-8?B?YTM4cm1DbXZDNFl4MXVkYmdqL2k3eDgvMkZEZWRBc1dPZFR5TFZSeU82UnlR?=
 =?utf-8?B?REtTMENLeHluZVFrVU5xRWErQjh3enoxSkYySHErdlRQd0FHeUJ0YUtpdmEy?=
 =?utf-8?B?TDVrSEpBbmJVYkQwOVAxL2pPdVRlVm5UK2VDMEJjd2V1VGVSMlBYNm9ubDhF?=
 =?utf-8?B?S0JySkFIb1FNZ21HeCtBWC92SlF1a1ZzWUVpcjAyZ2k2MFd4UGdGQzA2MGds?=
 =?utf-8?B?d0Z1Z0kvOUZUN3p5Y2VpRGJLZ3RBTUdnYmJObE03Tkt2TXFSOVZKYWdOdU1u?=
 =?utf-8?B?QWlIYks0M0tzU1JhcnBjcGxrOGdBSG9wQzNQZTFlT0hxMnphem9EY0xxL2Zh?=
 =?utf-8?B?VHVDRCtONWRCMUg2bklRQnhpSnJUZzJwYWJ0SVlWSVhFd1lScWhtdEVVMnVn?=
 =?utf-8?B?V0lNRmtraHBjT3FQZXhHdyt0anJDMVpScFZBRTJ1THVoTFVoOUZUYU1URUhK?=
 =?utf-8?B?WllUbk5tWStCRjVqemxrMGtIU2ZvNUZPVm55aFEwQ0FGY3JJTE93bXZRd0hD?=
 =?utf-8?B?MTRaWjJrY2VUWUJ5UVBNeGVKbmhhbzY4eGlIdmNBVnRMUGxwTmRoVEtIZmJJ?=
 =?utf-8?B?Ylc3eTltMUNXYnF0bHYxRjhVVkxTcjE5eVZ1dDkvbzVORWsvRnliTkFrTnJK?=
 =?utf-8?B?WlJWWGRVMUdhTDhTVnN6VzBuRFFxVXExaG45WDJVc2s3T1BEbmZSWk5hekRl?=
 =?utf-8?B?eis2RFZzNi9WYW1xQUxWNXFNVUhTbGhFcHdWZ0hVNFlUVHV5Q0t3aEkwSytv?=
 =?utf-8?B?SDNCUWNINXJPMUpOaGhXRmpOTDYxZXBMbGRDcXc3OHNLQUFhbDA4T3l6c0k1?=
 =?utf-8?B?djlRcU1JOWFUOVRHYVRHTTV0T2tKVU5rangramtsU2s1RUtTeXhwKytoWTV6?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d765a5-58f3-4841-8b7e-08dde1bbe7e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:38:52.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhBgTh65um+7qPsF3R3aTjumSn6caACOcz7Q0PqkLo68lU7FBwBD2Om7O8u/mgCIbbZg9AmiHkF/NOz88Ritc/pv1BU+G4iodYfaVTRC86s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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



On 8/19/2025 12:11 PM, Maarten Lankhorst wrote:
> The broken action happened after ggtt_early_fini, so
> it's safe to put the drain_workqueue in there instead of
> creating a new place.

can you share a log with that broken action?

the whole point of having separate devm action here was to
make sure that we will not have any pending work behind
left for the drmm unwind phase, as devm actions, where we
unmap GGTT, will be run before drmm unwind phase

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Fixes: 89d2835c3680 ("drm/xe: Process deferred GGTT node removals on device unwind")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e03222f5ac5a1..0c6aa3126b43a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -178,6 +178,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> +	drain_workqueue(ggtt->wq);

btw, that's redundant since drain_workqueue() is called
implicitly by the below destroy_workqueue()

>  	destroy_workqueue(ggtt->wq);
>  	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
> @@ -238,13 +239,6 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
>  
> -static void dev_fini_ggtt(void *arg)
> -{
> -	struct xe_ggtt *ggtt = arg;
> -
> -	drain_workqueue(ggtt->wq);
> -}
> -
>  /**
>   * xe_ggtt_init_early - Early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -297,10 +291,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
>  	if (IS_SRIOV_VF(xe)) {
>  		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
>  		if (err)

