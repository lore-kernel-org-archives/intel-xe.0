Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAB4CCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 06:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F57010EA9E;
	Thu, 26 Sep 2024 06:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+XpnZgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260A910EA9E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 06:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727333341; x=1758869341;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dXOG+U2y1rP4IKJZtSKgXEkkauS3xUXyh6VIbTylEkI=;
 b=H+XpnZgB6GLHQPcP1AFeWCTZt+nmeLl997TNf2NgU4iZ6iFtmsIipwqA
 4kwtkzc4cPFJYgvDB4dzR0kjkZbz1tc4+MAVABVgZS1q6LPHgn81nkOLE
 W636AYettvd6zMg+WlCjLDC55DB5oO83uhkdVE0pGykwliw2SmS8VAiBN
 l/+RSUHO1e7PYEjVr0PnetKpPOaoMgbKN5NBMvYYnPN+Do0KJYFjOLXOD
 zF580ijGfRs37NmOvNQrwCzo2708BipHj2qkeqj8WmEvvfTiF6CJ5I5vK
 +UH4H23yuokvAbO4pt0RypNOw8yOc5IDyy5Ek9RqNF83+GA0z23WQs9pM Q==;
X-CSE-ConnectionGUID: ESNTh9LRQPGyjDlgUETJyQ==
X-CSE-MsgGUID: C+wkWTy2RCeKtoXufkq/Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36993720"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="36993720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 23:49:01 -0700
X-CSE-ConnectionGUID: UVMQxLXeTZiyaf40VYo1sQ==
X-CSE-MsgGUID: xBa3VBY6R/aQBew1tqKEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="72323374"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 23:49:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 23:49:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 23:48:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 23:48:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 23:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enQUAPfrbYMvBOtcvhWeipEXBMyBw1aUJt7wgxAMnQ5G4yQCTWZMIoUEqwBU6BQFBjvtAUiEfsL6ZtyzTvc1NKZrg+d0fPK6GYSWDQJf1G1w/6a//rVbB0q8IIJPQ1+YjW+waWdDN4bfXvAscAXkBx6xOoH0G+4gp1XzzF+iMIpigefZ7pf3GxF2iMyc1WBHlj20d2kYYSGKYm+UcNOng483erbWMvJEWU+TWaeo4sLaeVkiU+uZRXhsYjAxHFbOeQebTx7D4feptUuRqkY2pQEhRu2X3mEuDE+AxwW7X/NB5fR2B6bgXfHq1rG5VMKd6lf5IQ4wqdIWC/UKpXvXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnCboor7OblL9NEPY6rz+yuRRIq2erMG5VhSkCMCnEg=;
 b=OVbeU0PRI+ES7wwPu6prQH7/pHh0PNmAOA9VLY7Z91oZMH6ETQHWmH1TkzSUd0xxn+BUYMHu3jKa9KonsAW+MsE+wu8ged2l8d2R/iGkLvs+0LdaYCgdpzMuhTh/r7FeLQBSQnmAAGyRjOTrPS+SE0kyO7/VdFtK7mrEIPUSMr4HaXiO1dFNCikIdJpfgvqhp2qtZbJQJVYZFTSZBzj/81bNrJTt+vnMdZQgRUsm9/GMMP/TI68wgTZv6vmRLYmC5X9/W4j64clSUQZIBS6SBGM/j10RDPxy6K7s5HzVL/CvUeKfZAaVe5d1WJCAzQqCPvXPHh5JGyDNBT8Q1WMUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 06:48:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 06:48:57 +0000
Message-ID: <d19de6b6-2c74-48cb-898b-425b6d95226c@intel.com>
Date: Thu, 26 Sep 2024 12:18:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
To: Jani Nikula <jani.nikula@linux.intel.com>, <apoorva.singh@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240923110633.19545-1-apoorva.singh@intel.com>
 <87ikum60rs.fsf@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <87ikum60rs.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 848a4a65-0213-4d53-63d0-08dcddf74b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhjcmtOSWtRSFNIcFpLbUFFR3dwTVdjTVdBMUZyTGIzV0JKWXNtTkpDU2xT?=
 =?utf-8?B?YnZFZC94c0M5anNqVnZ5LzVzcEt6ZFZGWUVlY0FndGhuS2g0NGxtc3h2dzNF?=
 =?utf-8?B?cHN1UksyVUFuUUYyUVhUVXR2MERrdU5EeUpraTdKQmRacmsxSXJWSjIzNVZY?=
 =?utf-8?B?dlBEKzkvbXlvUHZIMGFlM2VKNXhtR1dkZDZhRFRoWjBBaWxFVURLVE5ub2lM?=
 =?utf-8?B?R1h6eHBCdjdzaWMxa0c3ZEM1MWE1aGVhbGxCU051eTIzYmJsWDJMRG9MTjhl?=
 =?utf-8?B?U3RUL3dqRXVpamp4ZDNyVDBhOVM0dHdrVzV4cSs0aGhlU29rdnkwV2ZBTFpk?=
 =?utf-8?B?Y1NGZ0dSeDB5c2NTb3VmUEhXdENvRFI4cWdHSTF0WVJSN1dxbHVLSTZoSGtX?=
 =?utf-8?B?VXRJV1hBMzFKOWVJMk82U09wYm9hR3JGeFRRcHI4ZmxVQTVaL29PMndBSHVP?=
 =?utf-8?B?QXB6Tk1BeEF4Q1Q1MTQ3Rm50N3FwZ09qN3RGSkVRUHJuV2tONVRDK1dhSW1i?=
 =?utf-8?B?ZXBxYmtqZnBxR3N1aHRqTnVvYUg5dy8yZ3BOVjFNYmRmYjM0aDhLdm5BS1Ay?=
 =?utf-8?B?TTVGdDJoMFNrYVoyQmlqQTdwdVFwQUV4a2srUlRsUFFxNkxlMFhUb1duWmhQ?=
 =?utf-8?B?ajdGVldtVzVQK210bmNHYWF0Y3MrL2lOUnk2OWZzMHBpb0o5V3MyeVRucFVY?=
 =?utf-8?B?RCtmcGIrajduNTBJY3k5WWhKbW1WS21kRzRQMEU3VW1NWWxhZnNXcGpYcWJZ?=
 =?utf-8?B?eG50ZGR0MzhJeHU0R25iYlRBRENzdXlzS0RHNlV0NDEzYnp6ZzBCTERaOHc2?=
 =?utf-8?B?eEJaQmMvejVteG9zZE9CV3hZc3FORE02TGNFUEZncDVIcDE4OEhlYmFiNG5B?=
 =?utf-8?B?V0EvckxjQ1JFaXI2S0RZRXo5ZVVIUHB3SWJ3dnA3Z05oQkE1VWNFR0c0SHlS?=
 =?utf-8?B?ZEJ1dFRBaklmOU1LcVRvSThNZ2lUVnhLNjRZUzhuQnluUERZMy9FUEhudUZG?=
 =?utf-8?B?TjhkOHlHUWlUKzhLZGdIOW1PYXNodWJCdUtzaE00V0t4WXpxOHBkL0dpdDJw?=
 =?utf-8?B?RitnUkpSVExBcnRHTXJGcUFNb1MzWEJwSzIzTTJTRkcyakFFWmVYSFNDMmRV?=
 =?utf-8?B?K0ExUmhLN1pNbzY1UUJIMlJwdGpLQkMyMHdwcDNKYzNaNnlSb0NnOS9YS3NN?=
 =?utf-8?B?dWFaSENvYTl6V25LSWtOVVo3R25UT3hKQWVvd05HazArNTgvbVE2SnVFQ2g5?=
 =?utf-8?B?eFBPMzh2dGNLRXMzMHlCV3MySjd5S2NzcDI4UWhOczVkV0FEQkFLYWtCOGph?=
 =?utf-8?B?SWlqeVBoWnFzZUZLY3AvR3hLZGFQYTVJM3NKaWw5dys3SFQ0ZitpdG80cUE2?=
 =?utf-8?B?eWk0WE5NdFR1eGZxK1R1YldwOHlHN2dCdUFoQlRlK3RLQkFjNUxreEhnQWJJ?=
 =?utf-8?B?cjZPd3dMaWJSWmlubUFEbXhFRUl5Tkc5Wit6eStYM1FzNmdyeFdzK2VDcmhM?=
 =?utf-8?B?Y2VmTFVuT2lBcmluWCtrVkZiNSsvQkxSRk5HMWhaUVFTNmxLWEhTZGxybEtP?=
 =?utf-8?B?c0JGR3QrUmJDbmtKc0pER0l0Y2x4RjVoaE02YlAxQ2gwL2RpVXFqRVBtR0Nw?=
 =?utf-8?B?RFc1NjRxajJwNGd5RnZVbHh4TXZPeUhHcy9LUEcxRGJpRmM1R09lNXNSRGRu?=
 =?utf-8?B?WDF6NDZpcm5kTnRjSERPVVI2UEpFdDdmYW5GaFRFRk5CZEtXZEZ1ZGVSd1Ru?=
 =?utf-8?B?dXpoV2tNWkpXOVQ5eTVhWW9JQThjZStQclQxUnhIVVM1citrYVNNM2Vjc0Fr?=
 =?utf-8?Q?0h4CF0SPPqaJmPvi9ZHssIShBKr/4svWQf+3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGZNYjFjcEFVSFQ0SCtyTThSRkdpTU52OXIzeExTNjExckpyOVEyaCtFcG51?=
 =?utf-8?B?L1BWVEd3TDVRdDF5VXhpUlJCYml5bVkwNUZjaWlKb1d6S0NyTnBubG9vb1dl?=
 =?utf-8?B?NndxeitPbWFneVFRRUJmSXk2RUxwakp3ekM5NFYwVXoyNmphMjJkUkg1UVBN?=
 =?utf-8?B?L3doQ2QvTEJVUFQ0dUdDb2w2eUlKeDFDSUFDbWxGaW9sZDlsZkF4TFQ3bW5r?=
 =?utf-8?B?NU0rMVlWU1RSaWxDMnNqL1NIUDlJT0xCTVFmZnNnMktQbmRad2V1NG9icUlC?=
 =?utf-8?B?UkFPYk9GL1pIdEVuamtNaVJaTEtqZEUxVTQxWXFvMDFsVW9Ia0ZVSUUvaVVE?=
 =?utf-8?B?YThBWnh3ZVo3NFlnNDVEMDBLNDVRbzJOaFpZVFhuTFdrQ0NhbU5mT3REM2E1?=
 =?utf-8?B?ak5ScHZpV3FWUnY5aXYxZ0pKWWxic0ZsOFlRTW5uYUlUaitycFNaMWhVVTVs?=
 =?utf-8?B?RjBDQkJPWFpiampaeXprZE5SYmowNzVXd3JwaEZNcWtQSzNmWXBvNEg3YTVZ?=
 =?utf-8?B?UkVtUjdYVE53OTU0bTE3OFhMdDVRS3hQMzF5Y3paTHpjNGRVL29MNnozLzlJ?=
 =?utf-8?B?RFVNWGIwNGlxbW1IS2kzQ245MEpuN1N3MWVjSHVZVWZTTEdxdTlnVHlPZ2lY?=
 =?utf-8?B?TXNlM3dOUFBGSUd6d0NVWXAzaTM4NnNIS0E3OFhWeDhBYWcxMXdGYkJGcjN6?=
 =?utf-8?B?U0FMaS9HM2NIU2w5TCtON3AvYmVrZGtHSURNM3FRZDI5cWN5U09kQ1lKdUFC?=
 =?utf-8?B?akg1ZW5tWHk1MmJ2YjdPcDhKVWpEMzNidm9MRS9FVUxKRVBTQ2NPVDVETmJr?=
 =?utf-8?B?Yk8rNGI1dmFnTmZ3ZGZRWUk5bEtvdjU1YWI5ZFFLNVJGY05HWkREQ0JQWU5z?=
 =?utf-8?B?RVVZK3JEMXArYnFiWERDQ2ZLQ3VIL2FCZUdoZVVrN2M0ZnhBWDErOWNrTm1K?=
 =?utf-8?B?UEI2QXU2d0dyQko1blN4U2pkQlkrTWZTUkl1UGFNOFlTRlVGOElkU0VBU3FJ?=
 =?utf-8?B?T252NHB2b2REc1RXeU0rK1BzazFDS3FFZ0c4SzVkem8zeU5adXhyczE1UWxF?=
 =?utf-8?B?WTRsanZQZ1JSZHNYbTBVajgvcDBabDRnVmxzalNlZHBGWW1iNG1YODNzY0lq?=
 =?utf-8?B?WVNwREhFQmc3UmI2Y2pvNHdyK0pOcjZjaEhZdUhhTVA0SlRyWitENjJIeFBn?=
 =?utf-8?B?ZjhXaWZFUUcxZ2dBdTlkd0pCeDFPb3RtVUVQTGJOeEwrc2lmRXdSeTZKV3BS?=
 =?utf-8?B?TndTOVVPSEZ6SG9lNUhKZ3dGbmlPQWJ2Z1hPc29vTnlrZEV3enh5VFlyQ1p5?=
 =?utf-8?B?WWtGTVhwVmp1bEVFQTN3MXUvSEFDZ3ZQUThNemhtMUM5ZFZTZ2FwVnBDUEdF?=
 =?utf-8?B?WlBNbmc4MTh6Tm5lKy9LanNGSkxaN3JsUmtNSStrcGU4VC9ERHdHcThmZjE5?=
 =?utf-8?B?T0xIb1VjVW80MklILy94S0ROaFNORGEzb2tCZFUxL1J6bmRFQ1BGMEZPVHJw?=
 =?utf-8?B?NTVlUGUyc0FkQWZzVCtVVGJvWGxGUUg3dndjbE1pQ3hxZGdGTlljZEluYWFq?=
 =?utf-8?B?eWxpWlFVWncrUkozN2JtamIvOFl2dSsxK0NpL3gvWkJjRFJrMFBOUjRMRFdo?=
 =?utf-8?B?QjhhR2hTS015LzdWMFd4L25Cb0M0QVoyM2VHQmJldGV4NG14dzRNdDN6VUJl?=
 =?utf-8?B?UDlmMXdiZDRPN3FYekEyZDh4bTZpU0NzclZYLzdsaXQ3TnhYeGFva29XeXJa?=
 =?utf-8?B?YW4rWFFUaW1FK3RRWkVWVGplR25XMnFrVWlyVklpYi9xSVdsR0pHRlZhUElV?=
 =?utf-8?B?U0IzRndHN2gwRENqYm10SkRTbFIxbmZuQ1g3czlzV3FjYzVhNUZMTm4rbzUw?=
 =?utf-8?B?UDQra2Q1T3lHemNtRjBhQ0VkZkdJRldwNHJIRFo1Rk1iNi96cHhyS3ZDWHdp?=
 =?utf-8?B?VTRQMFM3eGZJRHpaaVNlV0RiRDBCWVBrejhZaWxvR05McTY4UFZjWTBITnZv?=
 =?utf-8?B?TFR4dU5zeUNIbFVqQ1JKWW9FMUNxUThTR1p1OW0wdnJHd1B1Z0FOcWxxMnlx?=
 =?utf-8?B?LzBPejBmSFJSTjdwa2NwSmt3ZHlUQ0FXaWhvVkpYc0RKaFZTcm1YeGkwYVdC?=
 =?utf-8?B?a244U0JmMnozUy9GY0l1VFZTL1RXeDlDclpJdnFEaWdTR3p5ZVRrOGRXeGYx?=
 =?utf-8?Q?Wgh+3qZbIiKwoBrtGGKLDtg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 848a4a65-0213-4d53-63d0-08dcddf74b64
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:48:57.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80nuG6PfcMqRL231INwFph0od7GkmC+jsHEDXwXsS5EbOpzkCDddEKO4FHTUSccfZwSKsj3aknXnho4/n6iR0JmR3LMLcuMvjSwY9n37P9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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



On 23-09-2024 17:27, Jani Nikula wrote:
> On Mon, 23 Sep 2024, apoorva.singh@intel.com wrote:
>> From: Apoorva Singh <apoorva.singh@intel.com>
>>
>> Check the return values of the functions xe_force_wake_get()
>> and xe_force_wake_put() to prevent mistakenly treating them as
>> void returns.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 274737417b0f..eaeaae1df198 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -890,9 +890,9 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   void xe_gt_shutdown(struct xe_gt *gt)
>>   {
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   	do_gt_reset(gt);
>> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 
> Up to the xe maintainers, but personally I very much dislike "hiding"
> functional stuff inside *WARN_ON(). It's harder to read. IMO it should
> be only for checks, and functions without side effects.

usage of XE_WARN_ON for force_wake_get/force_wake_put will be removed in 
all the places. Below series covers it
https://lore.kernel.org/intel-xe/20240924121641.1045763-1-himal.prasad.ghimiray@intel.com/T/#t

@Apoorva,
If these cleanup is not of urgency lets hold on till above series gets 
concluded and merged.

If this is required to be addressed urgently and current version is not 
acceptable something like below will help

int err;
err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
do_gt_reset(gt);
err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");

BR
Himal

> 
> And while we're at it, unrelated to this patch, what's the point of
> XE_WARN_ON?
> 
> It's defined to be just WARN_ON. But for multi-GPU systems you'd benefit
> from using drm_WARN_ON() with device info. But for that you'd need to
> pass drm device, and a simple redefinition doesn't even work.
> 
> There are a little over 100 uses, but more seem to crop up all the time,
> and people love to cargo cult this kind of stuff. It's not too late to
> change course now, but it's a royal PITA to change this when you have 1k
> of them.


> 
> 
> BR,
> Jani.
> 
> 
>>   }
>>   
>>   /**
> 

