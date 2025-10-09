Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF1CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 17:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7393910EAC9;
	Thu,  9 Oct 2025 17:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBElPS5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C387110EAC9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760032460; x=1791568460;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O4s7/9gLLoTpRAF1FLCAjypR0WyCShvQLHSs+/LBDsE=;
 b=FBElPS5v9/WRNPVGQwA46SUvTbRYarBI9IBC8msVCtBqspJNbVcBBcIj
 1CeiBnX0e4WaYlEDca6NOjCHKjphZlDIGo/450u4HbORJehqvzP23MFX3
 A+Ek3ocU3mHchiRswCmxVhYpo4SvjdZ6yHRMH3z2iwI3OuzU+k8a6h2HT
 08iLswBekU54XyvYL563/N08++P3408hP6pcU6NuOyqnpXqDPGnp0HGwe
 HlDWDpSRr3M68Nrqysfn+pI1kqLelZlW+veP6oknfpRvntXIylZDDBTUa
 C2jOp2hnB1UoKmfNrALCIv8hMOL/LJ9VTTTX5gkbThcs9nXinXLG69MZB g==;
X-CSE-ConnectionGUID: /cCX7mfIQrmrmtVRL4jIzw==
X-CSE-MsgGUID: I4xLMknQRmeU/LzbEgbjjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64873117"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="64873117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:54:20 -0700
X-CSE-ConnectionGUID: Bi8xpEjQQwi+nBBi+5vP+g==
X-CSE-MsgGUID: qdbcqsbXTcqTusFY7q5+5w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:54:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 10:54:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 10:54:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 10:54:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S47TZovolkjeFTZlZrVAXea7ZrlGMspYSxOpHTpLQA9hqbJuCv8Yu/jcWiZDn/qmQ3D8hbPjw21QydOEgBpjLYAYg9pugZkoGvOp0s3t2d05mAY06mOeRYXfwZaUCwewJkfmQeU0xdY63v/Soi9r+E9r2/KNYyqy1SVuFHgC/bQy1nrvuMnf8s4iAzy4QEzWBAwh/iEYdApNQT7q8phTtanD4eqF/U8c1JHf7nN8MWs/PY6b9p8xN2XzbHQoRP1aQTYLa/UcD0xwNVRHg8muCxqesE5qXSnPmSZbVtRmu8JeOSFu/UYzk5SJ6UQJVZ5Yym14qWHSfbSLTTvAK6YtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uESuZVBNNEiXaL49HLgSQNVRzoGGRcmAK0nnlIbIkvU=;
 b=jwhwu9pYwC7nNIC/QrHxsz+fwWZeqnPVmjkcdEz/Sjzmxc3GyU8Qi6LQtckU/04dJJk7Go14An/o/e0P+yxPPvHhVMgk/6fmSYDNWJzSg3zgicEEv2RtbPKLCTPWn/mcnZkRhyKQ/H2grpMUbJ6TfKemGSCigJeNY2RpcZJGvTizcXjsGut0GWjWz7y4X4l9K70AH/9IStrScaQFHodfSrQxOi7SxHBbSv49dM396FpjmNLg0su8QIVEtVN/x2XpcXDZ3aRJo/zn//W4ad66V8Hp/COUHLv80KkR23wiYYlAPnwEDF6ZBTCOh/KawsOHusI9/TmPJ0aa8SAw76KoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 17:54:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 17:54:15 +0000
Message-ID: <b7c468c3-5366-4eb7-a962-daaae3e1d81d@intel.com>
Date: Thu, 9 Oct 2025 13:54:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
 <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
 <b8f3e9b3-5665-418b-ad21-eac33886ebce@intel.com>
 <ybfj4vmezjeg4wyyacyluri4gznmahrpzgk5nn4db3ma32qmai@wvkya2ufpvfu>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ybfj4vmezjeg4wyyacyluri4gznmahrpzgk5nn4db3ma32qmai@wvkya2ufpvfu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0297.namprd04.prod.outlook.com
 (2603:10b6:303:89::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: b16259c9-516e-4159-b739-08de075cdc99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bllIdFkzZE95a0lwMXFCbDhMdW1OalQ3Uk1zdXhtUmVpeHVBOFpIWEhQRmNx?=
 =?utf-8?B?TTcxMlprVDl6SEFpRTllTjcyNTdQR2sxRmttWWMyMmlyaGk4YUpic1ZYRkp3?=
 =?utf-8?B?V01MQytBaHlGNkpIM3RIUjlId29ES0VwSjE4SllSMnpJQk9DZ203Wmt4NzRh?=
 =?utf-8?B?eER4UjE3dzlWd0R0ZmpVemUza3lqUVR1MTV4NzVRNzByeXdqNFBNMkozWnhn?=
 =?utf-8?B?cXVrRklNem1SUjA4L3NuMy8ySU9LOW1sWDcycGdwNWFUUTcybm9ibllkUXpr?=
 =?utf-8?B?MWE3bDBZVGVtNUIreXFhUUoybmlpRHRHcmhOVDNjb0h6ZGpmcE16Mmc1RDhH?=
 =?utf-8?B?dW0rMEFjR1czMlNQQTJLT2NQa3lsNWhTUSswakJBRFFvNDIvTXZSWkx0OEFP?=
 =?utf-8?B?VHl0MGhQZ2s5RGxPbFJDZTRwREJYdHU0MFFMU0gwVFZnYXZvVmpGeG1tbG9I?=
 =?utf-8?B?bFE2NFNWK2J3Z21BSm40MmlxeldpWmZZU3JpbmhtbFVhWXdrMjRZQWR3cC9E?=
 =?utf-8?B?TTRRbHBUMWNIV1REVlJxRUQxOFBnK1Qvd1Z6MXF1WFBDTzdxR2hoa1NYSzht?=
 =?utf-8?B?aVNiYnlyVEt3WWQ5ekEzekRRcEtTTGw0MGgrSWFNSzladTlndUhWOG9CVyt4?=
 =?utf-8?B?dGJQcTZSODBlc3N4TmJaZjhiTzRNaFM4S2xlMHVZbWxhTDBTZHkrc1hHMVhh?=
 =?utf-8?B?cGMxNFo1bjZJd24zWWF0SVo1UXpJcUJSWXpYOGNxTWVibXhqcjlLcUVFMVNQ?=
 =?utf-8?B?VDhoV3lYQUx1RFRBemhEekxQNkpwNmRoYUtoVlZoREt0SmthVTZhZU1JSlp2?=
 =?utf-8?B?WFVUUG1Jbmx1NDRGK3kvYkdtZTBHT1F3b0xsOWhnMThiZXhPSndSZWdYSHlt?=
 =?utf-8?B?MFdGdTd2OUc1YldmbnJ1WEg3aDdUTVNMRm40RnpDL2RvbHZXcnFHQjVGZDJU?=
 =?utf-8?B?TGxvcmk0ZWtMTDRaaGZWVFRpTmFIRStoYVZxamtTQ2MxWmRYZHQ0UTh6OHd1?=
 =?utf-8?B?V1hldnlndUxoN1JldW8xT1V1TzdRUEVKbS9KekJML2RscTh3Mkt3TTZ0dUlB?=
 =?utf-8?B?TkU0bWVvRkJJemdtVGVDUFh5NDJjNWxoUDVUNHQrT2FHQkptUEcrK1pTV3g1?=
 =?utf-8?B?dStRekt3QkZ4L2tPRHcvNHV6UzdVR3FZSGlHNi9hdjV5R0xyejU3ZzZ3NVUx?=
 =?utf-8?B?SmVyVkkwSlBxbkF3ajBVV3BSUGtDOXk0RjVHWjNUSi9wU1YrV3JHSkRkY1lS?=
 =?utf-8?B?Tk9udWFLS0t3QVQ0VkxFTnBPT0ZDcUx1bkcvaHYyNGFBVHVPaFQ4WkNkOVdk?=
 =?utf-8?B?emxteTFxcFkzWGxVNU8zYytqYkNUcnFIallqK0xkSmNkclBWUUhFMGQwVnF2?=
 =?utf-8?B?MFdCdXZ1Z24vWTVIdWJPUTc1c0Z5OE9HUFBnMHoyeklNRHR0cm44NDVZcUQ1?=
 =?utf-8?B?TkZFazRaOEtteUpYaldKOVpFVmdSN0tLK3VUb3JENm40ZHd2UlEvcld5ekVs?=
 =?utf-8?B?Z2lObmFvdkNpZERBRysrOVE3SVJjRXR1Y1JkVVFUWGdQbVhJOHNxRGxoV200?=
 =?utf-8?B?dGZhUVcwQWYzTVNzQ2YrTlpEYkRvSW5JOGU4cnZtUndhVkJLZVBiV1hZSTJq?=
 =?utf-8?B?OFJDeDF5bHV2bnpZMUpodm5BWnRieVErVWJwSHRmM0VPNWNrMXBlcm1KZFVF?=
 =?utf-8?B?Vm53UVB3a1JLL05OYmdobGVoaVdteUJJaG9yM0xXQ3BQeXFNN3VlREFDeFlR?=
 =?utf-8?B?QjFSN3U0N1RRbTV0RjZQVkNVamd5SEhnVFV6SzNIOUxTMWZIdDl2dkp3Tmls?=
 =?utf-8?B?VHpYV1BhcGtyRndNaHdSc0ZCYXZRYTJqa3cvbk4zVnAyVjJxSHFUUWxyZElJ?=
 =?utf-8?B?bVNKRlNwaGZMbEdHWHR5eEY2V3MxTXdXQ1k1VUVDbEhMK2c3djUwT0lwNjZT?=
 =?utf-8?Q?Z0AvfKqDl+hDlt2ttGPNagHqQ5w3hovK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0tNSXBTOTJPeTVJWkZnMWxDK2x2RlhOR21QdWVRMGZBSXFtYWNLcUdUbFBE?=
 =?utf-8?B?Y3dLOFZwWjJ3cUNweENoYnNYUnFaMXNFbE85NHlNVzRaR2I2bWl4VER4cmVn?=
 =?utf-8?B?VHZjN0hTSWhzd2h5OFJqZmZTdFlOU1JYWTYybkdaTmNhYXZ4L0JUa1FQTGFK?=
 =?utf-8?B?VXk2STRDMGpwaTZPb0QxV0hSM1pibGl2dFRlY1R4NHAxN1VkM29QWUR2UUxZ?=
 =?utf-8?B?RGU3TnUwR2M3blE3TEVSQWVVMFNaWC9Sdmk4dkhvMVhMalpLelpibEV0emJu?=
 =?utf-8?B?VzZLbzRsOWxMVDBocDJqSUdHZkh0dEVHN0Q5RHJOVzVDZXh2a3E4cHRlcEsw?=
 =?utf-8?B?L3JsWjRpY3ZpL2JaNG9WMWZtaU1SM3FvNzhGYjZHWXpPK0FZaGNEaFl0NDB5?=
 =?utf-8?B?aTZxT2czYjlPbmkzK3cxNTd5dUYySXVSZ3dQK0t5djZRR3F6bk95Q3hJVU11?=
 =?utf-8?B?VXRqVkN4WVV4SVB1ZStYQnUxaFdHelJoVFRmQzFHNGVTdEdBNEliRStWKzdp?=
 =?utf-8?B?dVRGdlQzZ216MVNISFVBV1lLaGVTOVNtcUUzYzl0a2hwb0ljb09qSENGVG9T?=
 =?utf-8?B?TnF2NmNwLy9ZQkNmK3lsaGNFcndSZlhZV2J5WE1oSWdVLzdUVURyUFk0UTE1?=
 =?utf-8?B?K2VPellOQ3hnZHpTOHVBY0hXSGJuUjRKOERnbUxZRlNKVkx5andGeW9kK21Z?=
 =?utf-8?B?NnFXb0F5TnoveXM2a2ZsYzhzYXdxREdvOEVZWGtGR1FadWM2dzd2UHgvRXJz?=
 =?utf-8?B?STViZmVmb0xXZTYvZXhuMmE3MWVzeU5tcWNTRzFlRUJMTW9mT1djWURaTmxu?=
 =?utf-8?B?eWhUTXFIYVNtYUJYWEVTVWxsZENDelU1eDRMamp0ZzdaVTV0bHFLSXhwUlE3?=
 =?utf-8?B?MTlybUViZ08vWlF4Y3M5d09VcTQyOHVwYWR5eGdUWnVKSFVrVExhR3NIeE5y?=
 =?utf-8?B?WFFlZlVnU3puV3FSbXBCY0VxNW9NbXdkMkF2WFloRW1FMk5kalA4VkpROXFM?=
 =?utf-8?B?Mlp6Z2NWTTdKU250WFVMTDliZUt4Wkl4ZnZoOXVYUXFOUkcxUGpvTy9pZFdB?=
 =?utf-8?B?UEErQmZNMEQxdXEzRGowM2EvbDdCMUN4cTJ0eEc2SDlsK3h5aUo0OVlLOERQ?=
 =?utf-8?B?azRiN3gxQzRLTStMTG5OM0d5eTdhMlc2ZGVjVUc0VDc0M3hZRFRab3BacFVs?=
 =?utf-8?B?RVRUeFNERXl1Zi9XNDdVamM3bVB1WmowWExELzl4c1B4Z3JUUllTOUk2NDl2?=
 =?utf-8?B?dGhiMlZOb3I5RE9EMm5Mck9nc0NpYm5YMmxLNXI1Ny8zeDlGa2FHRmdjYnZE?=
 =?utf-8?B?VkdZeXF3bmdGMzJXWEhydnYvRkpqOHNqZ1h2cnk5dUlLaDVjSGZXaGZuYXNo?=
 =?utf-8?B?S1QyUWNwZnRBaXExa0RYNk5wY0dZcXBxS1lnOEJmMkNsdnIxRVVFWU1NcWNi?=
 =?utf-8?B?ME5oYmh5QmRTRlFTSWk2N1RGeGRwVVo1TjcwK1dZTU9seFBlT2NyMnR4QTdK?=
 =?utf-8?B?eE9xN1hFM3ppYW93SFQ2MWdOb2UwZGU4OTBPNklnM1k5cmRteFkydk0zWFlS?=
 =?utf-8?B?RXV4SjFMTjFxRlRLVXEyR0M3VVBhbC95RG5iaWR6ZndHYkFGNk5wWGhoMTgy?=
 =?utf-8?B?VTM2Tm5WN3QycE9DVUg0NUVsZjYzbE55ejIxeWM0b0xMSGNrL0RFOU4rMkhY?=
 =?utf-8?B?dU5PanJmZUtUSCtPM1JHblRwVjAyMUdoSkViWDZYYzRUQ2IyZ2lWTEJldWRS?=
 =?utf-8?B?OXQyUktYa2orVU1ScVZYcnpyK3BNdUQ4UUo0THduY2k0bnJicVI0N3piaDZZ?=
 =?utf-8?B?WnNka3ZqdDF2RDJjQ25BbE9BRVdpRWdhdklQdXVYSUxEQi9ZMFM5UWRuWGZG?=
 =?utf-8?B?MDNWWnJNNElTVDhBL3ZYbWxuNmZRR1o2d0JRb3B2U0dnSmdXSy9jSzZFRzFV?=
 =?utf-8?B?dUJuSWFsSUU0RTNBVmljKzg1bTFqVng1YXY0YmszN1RwSFplNjlRTmExMk4v?=
 =?utf-8?B?NXB1ZnVBZ2NadFZVNCtmSGVSeHNob3k4ZUFKbm1ONlQxNUlRT2psQTIxY1dn?=
 =?utf-8?B?TnY5cCtjbG5vUlljcGp2Q2RkR2xhME45clpMWGVvaTRmNmY5UVoyamRVNDZq?=
 =?utf-8?B?Qm1GQ2JZZmlDdHZIbWxTY0x3aUJxa3J5QWdra0ZSSnExOEx1OUVqOGd4VUxi?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16259c9-516e-4159-b739-08de075cdc99
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 17:54:15.4877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpA5mImAClezck/8bWIwWNBpHQuudxm1j0RiS2VQvj8Lhgmy4vnO6ifwqIGCr8bZD61K/ERHAWWmS9r8nLsvKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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



On 2025-10-07 1:08 p.m., Lucas De Marchi wrote:
> On Tue, Oct 07, 2025 at 12:44:59PM -0400, Dong, Zhanjun wrote:
>>
>>
>> On 2025-10-02 12:00 p.m., Lucas De Marchi wrote:
>>> On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>>>> Add prefix to GuC log buffer macros to follow Xe naming styles.
>>>> Remove helper functions, replaced with macros.
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
>>>> drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
>>>> drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
>>>> drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
>>>> 4 files changed, 36 insertions(+), 77 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index d5adbbb013ec..b0ea9a13847a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc 
>>>> *guc)
>>>>     u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>>>     u32 flags;
>>>>
>>>> -    #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>> +    #if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>
>>> can you also add a patch to remove the excess use of parenthesis and
>>> indentation? Should ahave been:
>>>
>>> #if XE_GUC_LOG_CRASH_BUFFER_SIZE % SZ_1M == 0
>>>
>>
>> In case of CRASH_BUFFER_SIZE defined with expression like:
>>
>> SZ_2M - SZ_1M
> 
> but it's not defined like that. If you need to define it like that then
> the right define would be:
> 
> #define XE_GUC_LOG_CRASH_BUFFER_SIZE (SZ_2M - SZ_1M)
> 
> so the callers may use normal precedence rules without worrying how it's
> implemented.

Yes, it's not defined like that.

My concern is who response for ensure the operator precedence, I think 
it should be the macro, who contains the operator, response to ensure that,
so that would be:

#define plus(a, b)   (a) + (b)

The plus response for that, not a and b. So if a or b changed at later 
time, the plus still works.

Regards,
Zhanjun Dong

> 
> Lucas De Marchi
> 
>>
>> expanded macro would be
>>  #if  SZ_2M - SZ_1M % SZ_1M == 0
>>
>> due to '%' op is higher than '-'
>> SZ_1M % SZ_1M is 0
>> SZ_2M - 0 is SZ_2M
>> SZ_2M != 0
>> Result: false
>>
>> That gives us unwantted result, expected should be:
>> (SZ_2M - SZ_1M)  % SZ_1M == 0
>> Result: true
>>
>> We might still need parenthesis to prevent operator precedence issues
>>
>>>
>>>
>>>>     #define LOG_UNIT SZ_1M
>>>>     #define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>>>     #else
>>>> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct 
>>>> xe_guc *guc)
>>>>     #define LOG_FLAG 0
>>>>     #endif
>>>>
>>>> -    #if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>> +    #if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>
>>> ditto
>>>
>>>>     #define CAPTURE_UNIT SZ_1M
>>>>     #define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>>>     #else
>>>> @@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct 
>>>> xe_guc *guc)
>>>>     #define CAPTURE_FLAG 0
>>>>     #endif
>>>>
>>>> -    BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>>>> -    BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>>>> -    BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>>>> -    BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>>>> -    BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>>>> -    BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, 
>>>> LOG_UNIT));
>>>> +    BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
>>>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, 
>>>> CAPTURE_UNIT));
>>>>
>>>>     flags = GUC_LOG_VALID |
>>>>         GUC_LOG_NOTIFY_ON_HALF_FULL |
>>>>         CAPTURE_FLAG |
>>>>         LOG_FLAG |
>>>> -        FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>>>> -        FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>> -        FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / 
>>>> CAPTURE_UNIT - 1) |
>>>> +        FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / 
>>>> LOG_UNIT - 1) |
>>>> +        FIELD_PREP(GUC_LOG_DEBUG, 
>>>> XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>> +        FIELD_PREP(GUC_LOG_CAPTURE, 
>>>> XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>>>>         FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>>>
>>>>     #undef LOG_UNIT
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/ 
>>>> xe/ xe_guc_capture.c
>>>> index 243dad3e2418..acb95a93b530 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>>> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc 
>>>> *guc)
>>>> {
>>>>     int capture_size = guc_capture_output_size_est(guc);
>>>>     int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>>> -    u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>>>> +    u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>>
>>>>     /*
>>>>      * NOTE: capture_size is much smaller than the capture region
>>>> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct 
>>>> __guc_capture_parsed_output *no
>>>>  *                  ADS module also calls separately for PF vs VF.
>>>>  *
>>>>  *     --> alloc B: GuC output capture buf (registered via 
>>>> guc_init_params(log_param))
>>>> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on 
>>>> too-small)
>>>> + *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE 
>>>> (warns if on too-small)
>>>>  *                  Note2: 'x 3' to hold multiple capture groups
>>>>  *
>>>>  * GUC Runtime notify capture:
>>>> @@ -1368,7 +1368,7 @@ static void 
>>>> __guc_capture_process_output(struct xe_guc *guc)
>>>>     xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc-
>>>>> log.bo->vmap,
>>>>                log_buf_state_offset, sizeof(struct 
>>>> guc_log_buffer_state));
>>>>
>>>> -    buffer_size = xe_guc_get_log_buffer_size(&guc->log, 
>>>> GUC_LOG_BUFFER_CAPTURE);
>>>> +    buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>>     read_offset = log_buf_state_local.read_ptr;
>>>>     write_offset = log_buf_state_local.sampled_write_ptr;
>>>>     full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, 
>>>> log_buf_state_local.flags);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>>>> xe_guc_log.c
>>>> index c01ccb35dc75..fa1d490dca0d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> @@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>>>>      *  |     Capture state header      |
>>>>      *  +-------------------------------+ 96B
>>>>      *  |                               |
>>>> -     *  +===============================+ PAGE_SIZE (4KB)
>>>> +     *  +===============================+ 4KB
>>>> +     *  |          Event logs           |
>>>> +     *  +===============================+ + 
>>>> XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
>>>>      *  |        Crash Dump logs        |
>>>> -     *  +===============================+ + CRASH_SIZE
>>>> -     *  |          Debug logs           |
>>>> -     *  +===============================+ + DEBUG_SIZE
>>>
>>> what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
>>> referred as DEBUG_BUFFER_SIZE
>>>
>>> Lucas De Marchi
>>>
>>>> +     *  +===============================+ + 
>>>> XE_GUC_LOG_CRASH_BUFFER_SIZE
>>>>      *  |         Capture logs          |
>>>> -     *  +===============================+ + CAPTURE_SIZE
>>>> +     *  +===============================+ + 
>>>> XE_GUC_LOG_CAPTURE_BUFFER_SIZE
>>>>      */
>>>> -    return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>>> -        CAPTURE_BUFFER_SIZE;
>>>> +    return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + 
>>>> XE_GUC_LOG_CRASH_BUFFER_SIZE +
>>>> +        XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>
>> The comment in layout is DEBUG_SIZE, while code is DEBUG_BUFFER_SIZE,
>> will cleanup in next rev
>>
>> Regards,
>> Zhanjun Dong
>>
>>>> }
>>>>
>>>> #define GUC_LOG_CHUNK_SIZE    SZ_2M
>>>> @@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>>>
>>>> ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>>>
>>>> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>>>> -{
>>>> -    return CRASH_BUFFER_SIZE;
>>>> -}
>>>> -
>>>> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>>>> -{
>>>> -    return DEBUG_BUFFER_SIZE;
>>>> -}
>>>> -
>>>> -/**
>>>> - * xe_guc_log_section_size_capture - Get capture buffer size within 
>>>> log sections.
>>>> - * @log: The log object.
>>>> - *
>>>> - * This function will return the capture buffer size within log 
>>>> sections.
>>>> - *
>>>> - * Return: capture buffer size.
>>>> - */
>>>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>>>> -{
>>>> -    return CAPTURE_BUFFER_SIZE;
>>>> -}
>>>> -
>>>> -/**
>>>> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>>>> - * @log: The log object.
>>>> - * @type: The log buffer type
>>>> - *
>>>> - * Return: buffer size.
>>>> - */
>>>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>>>> guc_log_buffer_type type)
>>>> -{
>>>> -    switch (type) {
>>>> -    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>> -        return xe_guc_log_section_size_crash(log);
>>>> -    case GUC_LOG_BUFFER_DEBUG:
>>>> -        return xe_guc_log_section_size_debug(log);
>>>> -    case GUC_LOG_BUFFER_CAPTURE:
>>>> -        return xe_guc_log_section_size_capture(log);
>>>> -    }
>>>> -    return 0;
>>>> -}
>>>> -
>>>> /**
>>>>  * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>>>  * @log: The log object.
>>>> @@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct 
>>>> xe_guc_log *log, enum guc_log_buffer_type
>>>>  */
>>>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>>>> guc_log_buffer_type type)
>>>> {
>>>> -    enum guc_log_buffer_type i;
>>>>     u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>>
>>>> -    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < 
>>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>> -        if (i == type)
>>>> -            break;
>>>> -        offset += xe_guc_get_log_buffer_size(log, i);
>>>> +    switch (type) {
>>>> +    case GUC_LOG_BUFFER_CAPTURE:
>>>> +        offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>>>> +        fallthrough;
>>>> +    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>> +        offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>>>> +        fallthrough;
>>>> +    case GUC_LOG_BUFFER_DEBUG:
>>>> +        break;
>>>>     }
>>>>
>>>>     return offset;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ 
>>>> xe_guc_log.h
>>>> index 98a47ac42b08..0cc059cedb9c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>>> @@ -13,13 +13,13 @@ struct drm_printer;
>>>> struct xe_device;
>>>>
>>>> #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>> -#define CRASH_BUFFER_SIZE       SZ_1M
>>>> -#define DEBUG_BUFFER_SIZE       SZ_8M
>>>> -#define CAPTURE_BUFFER_SIZE     SZ_2M
>>>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_8M
>>>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_1M
>>>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_2M
>>>> #else
>>>> -#define CRASH_BUFFER_SIZE    SZ_16K
>>>> -#define DEBUG_BUFFER_SIZE    SZ_64K
>>>> -#define CAPTURE_BUFFER_SIZE    SZ_1M
>>>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_64K
>>>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_16K
>>>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_1M
>>>> #endif
>>>> /*
>>>>  * While we're using plain log level in i915, GuC controls are much 
>>>> more...
>>>> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>>>     return log->level;
>>>> }
>>>>
>>>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>>>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>>>> guc_log_buffer_type type);
>>>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>>>> guc_log_buffer_type type);
>>>> bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>>>                    enum guc_log_buffer_type type,
>>>> -- 
>>>> 2.34.1
>>>>
>>

